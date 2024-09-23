@implementation VCPFlowFeatureExtractor

- (id)initModule:(int)a3 config:(id)a4 cancel:(id)a5
{
  id v8;
  id v9;
  void *v10;
  VCPFlowFeatureExtractor *v11;
  VCPFlowFeatureExtractor *v12;
  NSString *inputBlobName;
  NSArray *featureBlobNames;
  NSArray *featureChannels;
  VCPFlowFeatureExtractor *v16;
  objc_super v18;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9 && ((*((uint64_t (**)(id))v9 + 2))(v9) & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)VCPFlowFeatureExtractor;
    v12 = -[VCPEspressoModel initModelWithName:andConfig:](&v18, sel_initModelWithName_andConfig_, CFSTR("feature_extraction"), v8);
    v11 = v12;
    if (v12)
    {
      v12->_numLevels = a3;
      inputBlobName = v12->_inputBlobName;
      v12->_inputBlobName = (NSString *)CFSTR("t_0");

      featureBlobNames = v11->_featureBlobNames;
      v11->_featureBlobNames = (NSArray *)&unk_1E6B764D0;

      featureChannels = v11->_featureChannels;
      v11->_featureChannels = (NSArray *)&unk_1E6B764E8;

      self = v11;
    }
    else
    {
      self = 0;
    }
  }
  v16 = v11;

  return v16;
}

- (int)bindWithBuffers:(__CVBuffer *)a3 imgFeature:(id *)a4
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[NSString UTF8String](self->_inputBlobName, "UTF8String");
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Feature extractor: fail to bind input", (uint8_t *)v11, 2u);
    }
    v5 = 0;
LABEL_6:
    v6 = -108;
    goto LABEL_14;
  }
  if (self->_numLevels >= 2u)
  {
    v7 = 0;
    v5 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_featureBlobNames, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = objc_retainAutorelease(v8);
      objc_msgSend(v5, "UTF8String");
      if (espresso_network_bind_direct_cvpixelbuffer())
        break;
      v9 = v7 + 2;
      ++v7;
      if (v9 >= self->_numLevels)
        goto LABEL_13;
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = v7 + 1;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Feature extractor: fail to bind output at level %d", (uint8_t *)v11, 8u);
    }
    goto LABEL_6;
  }
  v5 = 0;
LABEL_13:
  v6 = 0;
LABEL_14:

  return v6;
}

- (int)extractFeatureFromImage:(__CVBuffer *)a3 toFeature:(id *)a4 callback:(id)a5
{
  void (**v8)(_QWORD);
  int v9;
  void (**v11)(_QWORD);
  uint8_t buf[16];

  v8 = (void (**)(_QWORD))a5;
  v9 = -[VCPFlowFeatureExtractor bindWithBuffers:imgFeature:](self, "bindWithBuffers:imgFeature:", a3, a4);
  if (v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Feature extractor: fail to bind buffers", buf, 2u);
    }
    v8[2](v8);
  }
  else
  {
    v11 = v8;
    if (espresso_plan_submit())
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Feature extractor: fail to execute", buf, 2u);
      }
      v9 = -18;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

uint64_t __70__VCPFlowFeatureExtractor_extractFeatureFromImage_toFeature_callback___block_invoke(uint64_t a1)
{
  uint8_t v3[16];

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Feature extractor: executing callback", v3, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)setFeatureShape:(id *)a3 height:(int)a4 width:(int)a5 level:(int)a6
{
  char v6;
  void *v10;
  int v11;

  v6 = a6;
  -[NSArray objectAtIndexedSubscript:](self->_featureChannels, "objectAtIndexedSubscript:", a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  a3->var0 = objc_msgSend(v10, "intValue");

  v11 = 1 << (v6 - 1);
  a3->var1 = (v11 + a4) >> v6;
  a3->var2 = (v11 + a5) >> v6;
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureChannels, 0);
  objc_storeStrong((id *)&self->_featureBlobNames, 0);
  objc_storeStrong((id *)&self->_inputBlobName, 0);
}

@end
