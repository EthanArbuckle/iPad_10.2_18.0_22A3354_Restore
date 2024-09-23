@implementation VCPFlowDecoder

- (id)initModule:(int)a3 config:(id)a4 cancel:(id)a5
{
  uint64_t v6;
  id v8;
  uint64_t (**v9)(_QWORD);
  void *v10;
  VCPFlowDecoder *v11;
  VCPFlowDecoder *v12;
  NSArray *inputBlobNames;
  NSString *outpuBlobName;
  VCPFlowDecoder *v15;
  objc_super v17;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = (uint64_t (**)(_QWORD))a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("flow_estimation_%d"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (v9[2](v9) & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)VCPFlowDecoder;
    v12 = -[VCPEspressoModel initModelWithName:andConfig:](&v17, sel_initModelWithName_andConfig_, v10, v8);
    v11 = v12;
    if (v12)
    {
      inputBlobNames = v12->_inputBlobNames;
      v12->_inputBlobNames = (NSArray *)&unk_1E6B763F8;

      outpuBlobName = v11->_outpuBlobName;
      v11->_outpuBlobName = (NSString *)CFSTR("t_38");

      self = v11;
    }
    else
    {
      self = 0;
    }
  }
  v15 = v11;

  return v15;
}

- (int)bindWithBuffers:(__CVBuffer *)a3 correlation:(__CVBuffer *)a4 flow:(__CVBuffer *)a5 outputFlow:(__CVBuffer *)a6
{
  id v7;
  int v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  id v12;
  int v13;
  id v14;
  int v15;
  int result;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;

  -[NSArray objectAtIndexedSubscript:](self->_inputBlobNames, "objectAtIndexedSubscript:", 0);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "UTF8String");
  v8 = espresso_network_bind_direct_cvpixelbuffer();

  if (v8)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return -108;
    v20 = 0;
    v9 = MEMORY[0x1E0C81028];
    v10 = "Flow decoder: fail to bind inputFeature";
    v11 = (uint8_t *)&v20;
    goto LABEL_17;
  }
  -[NSArray objectAtIndexedSubscript:](self->_inputBlobNames, "objectAtIndexedSubscript:", 1);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "UTF8String");
  v13 = espresso_network_bind_direct_cvpixelbuffer();

  if (v13)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return -108;
    v19 = 0;
    v9 = MEMORY[0x1E0C81028];
    v10 = "Flow decoder: fail to bind correlation";
    v11 = (uint8_t *)&v19;
    goto LABEL_17;
  }
  -[NSArray objectAtIndexedSubscript:](self->_inputBlobNames, "objectAtIndexedSubscript:", 2);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = espresso_network_bind_direct_cvpixelbuffer();

  if (v15)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return -108;
    v18 = 0;
    v9 = MEMORY[0x1E0C81028];
    v10 = "Flow decoder: fail to bind upscaled flow";
    v11 = (uint8_t *)&v18;
    goto LABEL_17;
  }
  -[NSString UTF8String](self->_outpuBlobName, "UTF8String");
  result = espresso_network_bind_direct_cvpixelbuffer();
  if (!result)
    return result;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = 0;
    v9 = MEMORY[0x1E0C81028];
    v10 = "Flow decoder: fail to bind output flow";
    v11 = (uint8_t *)&v17;
LABEL_17:
    _os_log_impl(&dword_1B6C4A000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
  }
  return -108;
}

- (int)estimateFlow:(__CVBuffer *)a3 correlation:(__CVBuffer *)a4 flow:(__CVBuffer *)a5 outputFlow:(__CVBuffer *)a6 callback:(id)a7
{
  void (**v12)(_QWORD);
  int v13;
  void (**v15)(_QWORD);
  uint8_t buf[16];

  v12 = (void (**)(_QWORD))a7;
  v13 = -[VCPFlowDecoder bindWithBuffers:correlation:flow:outputFlow:](self, "bindWithBuffers:correlation:flow:outputFlow:", a3, a4, a5, a6);
  if (v13)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Flow decoder: fail to bind buffers", buf, 2u);
    }
    v12[2](v12);
  }
  else
  {
    v15 = v12;
    if (espresso_plan_submit())
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Flow decoder: fail to execute", buf, 2u);
      }
      v13 = -18;
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

uint64_t __68__VCPFlowDecoder_estimateFlow_correlation_flow_outputFlow_callback___block_invoke(uint64_t a1)
{
  uint8_t v3[16];

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Flow decoder: executing callback", v3, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outpuBlobName, 0);
  objc_storeStrong((id *)&self->_inputBlobNames, 0);
}

@end
