@implementation CNNMLScalerEspresso

- (void)dealloc
{
  objc_super v3;

  if (self->_plan)
    espresso_plan_destroy();
  if (self->_ctx)
    espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)CNNMLScalerEspresso;
  -[CNNMLScalerEspresso dealloc](&v3, sel_dealloc);
}

- (CNNMLScalerEspresso)initWithConfig:(id)a3 modelIndex:(int64_t)a4 scalingFactor:(int)a5
{
  id v8;
  CNNMLScalerEspresso *v9;
  void *v10;
  void *v11;
  void *v12;
  _MADObjCModelCatalogModel *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t plan;
  id v17;
  int v18;
  CNNMLScalerEspresso *v19;
  int v20;
  CNNMLScalerEspresso *v21;
  uint8_t v23[16];
  objc_super v24;

  v8 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CNNMLScalerEspresso;
  v9 = -[CNNMLScalerEspresso init](&v24, sel_init);
  if (!v9)
    goto LABEL_26;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resourceURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 != 1)
  {
    if (!a4)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_emoji_mlscaler.espresso.net"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
LABEL_10:
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "CNNMLScalerEspresso model not supported!", v23, 2u);
    }
    v12 = 0;
    goto LABEL_23;
  }
  if (a5 != 4 && a5 != 2)
    goto LABEL_10;
  v13 = objc_alloc_init(_MADObjCModelCatalogModel);
  -[_MADObjCModelCatalogModel getModelURL:](v13, "getModelURL:", 0);
  v14 = objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot find MLScaler model from ModelCatalog", v23, 2u);
    }

    v12 = 0;
    v11 = 0;
    goto LABEL_23;
  }
  if (a5 == 2)
    v15 = CFSTR("cnn_gp_mlscaler.espresso.net");
  else
    v15 = CFSTR("cnn_gp_mlscaler4x.espresso.net");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v15, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)v14;
LABEL_20:
  v9->_plan = 0;
  v9->_ctx = 0;
  v9->_ctx = (void *)espresso_create_context();
  plan = espresso_create_plan();
  v9->_plan = (void *)plan;
  if (plan)
  {
    objc_msgSend(v12, "path");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v17, "UTF8String");
    v18 = espresso_plan_add_network();

    if (!v18)
    {
      objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      if (!espresso_network_select_configuration())
      {
        v20 = espresso_plan_build();

        if (v20)
          goto LABEL_24;
LABEL_26:
        v19 = v9;
        goto LABEL_27;
      }
    }
  }
LABEL_23:

LABEL_24:
  v19 = 0;
LABEL_27:
  v21 = v19;

  return v21;
}

- (int)inferenceWithPixelBuffer:(__CVBuffer *)a3 toDestinationPixelBuffer:(__CVBuffer *)a4
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  int result;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "VCPMADMLScalingInference", ", buf, 2u);
  }

  result = espresso_network_bind_direct_cvpixelbuffer();
  if (!result)
  {
    result = espresso_network_bind_direct_cvpixelbuffer();
    if (!result)
    {
      result = espresso_plan_execute_sync();
      if (!result)
      {
        VCPSignPostLog();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
        {
          *(_WORD *)v11 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v10, OS_SIGNPOST_INTERVAL_END, v5, "VCPMADMLScalingInference", ", v11, 2u);
        }

        return 0;
      }
    }
  }
  return result;
}

- (int)outputHeight
{
  return self->_outputHeight;
}

- (int)outputWidth
{
  return self->_outputWidth;
}

@end
