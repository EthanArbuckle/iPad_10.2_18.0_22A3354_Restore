@implementation CNNMLEnhancerEspresso

- (CNNMLEnhancerEspresso)initWithModelFile:(id)a3
{
  id v4;
  CNNMLEnhancerEspresso *v5;
  char v6;
  id v7;
  uint64_t plan;
  id v9;
  BOOL v10;
  BOOL v11;
  CNNMLEnhancerEspresso *v12;
  CNNMLEnhancerEspresso *v13;
  id v15;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNNMLEnhancerEspresso;
  v5 = -[CNNMLEnhancerEspresso init](&v16, sel_init);
  if (!v5)
    goto LABEL_6;
  v15 = 0;
  v6 = objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", &v15);
  v7 = v15;
  if ((v6 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Model URL %@ not reachable", buf, 0xCu);
    }
    goto LABEL_10;
  }
  v5->_ctx = (void *)espresso_create_context();
  plan = espresso_create_plan();
  v5->_plan = (void *)plan;
  if (!plan
    || (objc_msgSend(v4, "path"),
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
        objc_msgSend(v9, "UTF8String"),
        v10 = espresso_plan_add_network() == 0,
        v9,
        !v10))
  {
LABEL_10:

    goto LABEL_11;
  }
  v11 = espresso_plan_build() == 0;

  if (!v11)
  {
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
LABEL_6:
  v12 = v5;
LABEL_12:
  v13 = v12;

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_plan)
    espresso_plan_destroy();
  if (self->_ctx)
    espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)CNNMLEnhancerEspresso;
  -[CNNMLEnhancerEspresso dealloc](&v3, sel_dealloc);
}

- (int)inferenceWithPixelBuffer:(__CVBuffer *)a3 toDestinationPixelBuffer:(__CVBuffer *)a4
{
  int v6;
  int v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  int v11;
  __int16 v13;
  __int16 v14;
  __int16 v15;

  v6 = espresso_network_bind_direct_cvpixelbuffer();
  if (v6)
  {
    v7 = v6;
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = 0;
      v8 = MEMORY[0x1E0C81028];
      v9 = "bind rgb_input error";
      v10 = (uint8_t *)&v15;
LABEL_13:
      _os_log_impl(&dword_1B6C4A000, v8, OS_LOG_TYPE_ERROR, v9, v10, 2u);
    }
  }
  else
  {
    v11 = espresso_network_bind_direct_cvpixelbuffer();
    if (v11)
    {
      v7 = v11;
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v14 = 0;
        v8 = MEMORY[0x1E0C81028];
        v9 = "bind rgb_output_final error";
        v10 = (uint8_t *)&v14;
        goto LABEL_13;
      }
    }
    else
    {
      v7 = espresso_plan_execute_sync();
      if (!v7)
      {
        CVBufferPropagateAttachments(a3, a4);
        return v7;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = 0;
        v8 = MEMORY[0x1E0C81028];
        v9 = "execute_sync error";
        v10 = (uint8_t *)&v13;
        goto LABEL_13;
      }
    }
  }
  return v7;
}

@end
