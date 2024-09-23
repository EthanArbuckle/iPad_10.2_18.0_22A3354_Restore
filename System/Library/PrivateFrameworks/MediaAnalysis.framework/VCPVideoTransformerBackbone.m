@implementation VCPVideoTransformerBackbone

+ (int64_t)revision
{
  return 4;
}

+ (unint64_t)embeddingVersionForRevision:(int64_t)a3
{
  unint64_t v3;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 2) >= 4)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Backbone revision %d is not supported", (uint8_t *)v5, 8u);
    }
    return 0;
  }
  return v3;
}

+ (unint64_t)embeddingVersion
{
  void *v2;

  v2 = (void *)objc_opt_class();
  return objc_msgSend(v2, "embeddingVersionForRevision:", objc_msgSend((id)objc_opt_class(), "revision"));
}

+ (id)getNSDataFromOuput:(id)a3 isFP16:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  if (objc_msgSend(v5, "tensorType") == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend(v5, "getData:", 2), 4 * objc_msgSend(v5, "tensorSize"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[VCPTextEncoder convertFloat32ToFloat16:](VCPTextEncoder, "convertFloat32ToFloat16:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = (void *)v7;

      v6 = v8;
    }
  }
  else
  {
    if (objc_msgSend(v5, "tensorType") != 1)
    {
      v6 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend(v5, "getData:", 1), 2 * objc_msgSend(v5, "tensorSize"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[VCPTextEncoder convertFloat16ToFloat32:](VCPTextEncoder, "convertFloat16ToFloat32:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
LABEL_9:

  return v6;
}

+ (id)sharedModel:(id)a3 identifier:(id)a4 outputNames:(id)a5 inputNames:(id)a6 functionName:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __90__VCPVideoTransformerBackbone_sharedModel_identifier_outputNames_inputNames_functionName___block_invoke;
  v23[3] = &unk_1E6B16800;
  v17 = v11;
  v24 = v17;
  v18 = v13;
  v25 = v18;
  v19 = v14;
  v26 = v19;
  v20 = v15;
  v27 = v20;
  objc_msgSend(v16, "sharedInstanceWithIdentifier:andCreationBlock:", v12, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

VCPCNNModelEspressoV2 *__90__VCPVideoTransformerBackbone_sharedModel_identifier_outputNames_inputNames_functionName___block_invoke(_QWORD *a1)
{
  return -[VCPCNNModelEspressoV2 initWithParameters:outputNames:inputNames:functionName:]([VCPCNNModelEspressoV2 alloc], "initWithParameters:outputNames:inputNames:functionName:", a1[4], a1[5], a1[6], a1[7]);
}

- (VCPVideoTransformerBackbone)initWithConfig:(id)a3
{
  void *v4;
  void *v5;
  VCPVideoTransformerBackbone *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  VCPCNNModelEspressoV2 *modelEspressoV2;
  BOOL v16;
  VCPVideoTransformerBackbone *v17;
  VCPVideoTransformerBackbone *v18;
  objc_super v20;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  self->_isFP16 = 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v20.receiver = self;
  v20.super_class = (Class)VCPVideoTransformerBackbone;
  v6 = -[VCPVideoTransformerBackbone init](&v20, sel_init);
  if (!v6)
    goto LABEL_9;
  v7 = +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 5
     ? CFSTR("mubb_md5")
     : CFSTR("mubb_md4");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("video_backbone"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v13 = +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision");
    *(_DWORD *)buf = 67109120;
    v22 = v13;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPVideoTransformerBackbone use revision %d", buf, 8u);
  }
  objc_msgSend((id)objc_opt_class(), "sharedModel:identifier:outputNames:inputNames:functionName:", v8, v12, &unk_1E6B76A10, &unk_1E6B76A28, CFSTR("main_video"));
  v14 = objc_claimAutoreleasedReturnValue();
  modelEspressoV2 = v6->_modelEspressoV2;
  v6->_modelEspressoV2 = (VCPCNNModelEspressoV2 *)v14;

  v16 = v6->_modelEspressoV2 == 0;
  if (v16)
    v17 = 0;
  else
LABEL_9:
    v17 = v6;
  v18 = v17;

  return v18;
}

- (unint64_t)inputTensorType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[VCPCNNModelEspressoV2 inputsType](self->_modelEspressoV2, "inputsType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (unint64_t)inputTensorSize
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[VCPCNNModelEspressoV2 inputsSize](self->_modelEspressoV2, "inputsSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (int)inference:(id)a3
{
  id v4;
  int v5;
  void *v6;
  VCPCNNModelEspressoV2 *modelEspressoV2;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSData *v11;
  NSData *embedding;
  VCPCNNModelEspressoV2 *v13;
  unint64_t v14;
  void *v15;
  NSData *v16;
  NSData *spatialEmbedding;
  void *v18;
  NSData *v19;
  NSData *hiddenEmbedding;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void **v25;

  v4 = a3;
  v5 = -[VCPCNNModelEspressoV2 espressoForward:](self->_modelEspressoV2, "espressoForward:", objc_msgSend(v4, "getData:", -[VCPVideoTransformerBackbone inputTensorType](self, "inputTensorType")));
  if (!v5)
  {
    -[VCPCNNModelEspressoV2 outputsSize](self->_modelEspressoV2, "outputsSize");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      modelEspressoV2 = self->_modelEspressoV2;
      if (modelEspressoV2)
      {
        -[VCPCNNModelEspressoV2 outputs](modelEspressoV2, "outputs");
        v9 = v22;
        v8 = v23;
        v25 = (void **)&v22;
        std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v25);
        if (v8 != v9)
        {
          -[VCPCNNModelEspressoV2 outputs](self->_modelEspressoV2, "outputs");
          v10 = *(id *)v22;
          v25 = (void **)&v22;
          std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v25);
          objc_msgSend((id)objc_opt_class(), "getNSDataFromOuput:isFP16:", v10, 0);
          v11 = (NSData *)objc_claimAutoreleasedReturnValue();
          embedding = self->_embedding;
          self->_embedding = v11;

          if (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") != 4
            && +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") != 5)
          {
            goto LABEL_11;
          }
          if ((unint64_t)objc_msgSend(v6, "count") >= 3)
          {
            v13 = self->_modelEspressoV2;
            if (v13)
            {
              -[VCPCNNModelEspressoV2 outputs](v13, "outputs");
              v14 = v23 - v22;
              v25 = (void **)&v22;
              std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v25);
              if (v14 >= 0x18)
              {
                v15 = (void *)objc_opt_class();
                -[VCPCNNModelEspressoV2 outputs](self->_modelEspressoV2, "outputs");
                objc_msgSend(v15, "getNSDataFromOuput:isFP16:", *(_QWORD *)(v22 + 8), 0);
                v16 = (NSData *)objc_claimAutoreleasedReturnValue();
                spatialEmbedding = self->_spatialEmbedding;
                self->_spatialEmbedding = v16;

                v25 = (void **)&v22;
                std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v25);
                v18 = (void *)objc_opt_class();
                -[VCPCNNModelEspressoV2 outputs](self->_modelEspressoV2, "outputs");
                objc_msgSend(v18, "getNSDataFromOuput:isFP16:", *(_QWORD *)(v22 + 16), 0);
                v19 = (NSData *)objc_claimAutoreleasedReturnValue();
                hiddenEmbedding = self->_hiddenEmbedding;
                self->_hiddenEmbedding = v19;

                v25 = (void **)&v22;
                std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v25);
LABEL_11:
                v5 = 0;
LABEL_16:

                goto LABEL_17;
              }
            }
            else
            {
              v22 = 0;
              v23 = 0;
              v24 = 0;
              v25 = (void **)&v22;
              std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v25);
            }
          }
          v5 = 1;
          goto LABEL_16;
        }
      }
      else
      {
        v22 = 0;
        v23 = 0;
        v24 = 0;
        v25 = (void **)&v22;
        std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v25);
      }
    }
    v5 = 1;
LABEL_17:

  }
  return v5;
}

- (int)embeddingHeight
{
  return self->_embeddingHeight;
}

- (int)embeddingWidth
{
  return self->_embeddingWidth;
}

- (int)embeddingChannels
{
  return self->_embeddingChannels;
}

- (int)embeddingSequenceLength
{
  return self->_embeddingSequenceLength;
}

- (BOOL)isFP16
{
  return self->_isFP16;
}

- (NSData)embedding
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)spatialEmbedding
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)hiddenEmbedding
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenEmbedding, 0);
  objc_storeStrong((id *)&self->_spatialEmbedding, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
  objc_storeStrong((id *)&self->_modelEspressoV2, 0);
}

@end
