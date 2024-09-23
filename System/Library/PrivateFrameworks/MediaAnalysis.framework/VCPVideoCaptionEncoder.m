@implementation VCPVideoCaptionEncoder

- (VCPVideoCaptionEncoder)initWithModelPath:(id)a3
{
  id v4;
  VCPVideoCaptionEncoder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VCPVideoCaptionEncoder *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v19;
  VCPVideoCaptionEncoder *v20;
  NSObject *v22;
  id v23;
  VCPCNNModelEspresso *v24;
  int v25;
  VCPCNNModelEspresso *v26;
  VCPCNNModelEspresso *v27;
  int v28;
  VCPCNNModelEspresso *v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  objc_super v36;
  uint8_t buf[16];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint8_t v48[4];
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  _QWORD v56[2];
  _QWORD v57[5];

  v57[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)VCPVideoCaptionEncoder;
  v5 = -[VCPVideoCaptionEncoder init](&v36, sel_init);
  if (v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VideoCaption] VCPVideoCaptionEncoder: start loading model at: %@", buf, 0xCu);
    }
    if (v4)
    {
      v5->_forceNNGraph = !DeviceGeqD5x();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("model_info.json"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v5->_forceNNGraph)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("net_file"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("d4x"));
      }
      else
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("net_file"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("d5x"));
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v12, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v13;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VideoCaption] VCPVideoCaptionEncoder: model to load %@", buf, 0xCu);
      }
      v56[0] = CFSTR("forceNNGraph");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5->_forceNNGraph);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v14;
      v56[1] = CFSTR("sharedContext");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !v5->_forceNNGraph);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v57[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "sharedModel:properties:", v13, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      modelEspresso = v5->_modelEspresso;
      v5->_modelEspresso = (VCPCNNModelEspresso *)v17;

      v19 = v5->_modelEspresso;
      if (!v19 || -[VCPCNNModelEspresso prepareModelWithConfig:](v19, "prepareModelWithConfig:", &stru_1E6B1C190))
      {
        v11 = 0;
LABEL_16:

        goto LABEL_17;
      }
      if ((int)MediaAnalysisLogLevel() < 5)
      {
LABEL_31:
        v11 = v5;
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v11 = v5;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VideoCaption] VCPVideoCaptionEncoder: successfully loaded model", buf, 2u);
            v11 = v5;
          }
        }
        goto LABEL_16;
      }
      v22 = MEMORY[0x1E0C81028];
      v23 = MEMORY[0x1E0C81028];
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:

        goto LABEL_31;
      }
      v24 = v5->_modelEspresso;
      if (v24)
      {
        -[VCPCNNModelEspresso inputBlob](v24, "inputBlob");
        v25 = v44;
        v26 = v5->_modelEspresso;
        if (v26)
        {
          -[VCPCNNModelEspresso inputBlob](v26, "inputBlob");
          v31 = v35;
          v32 = v25;
          v27 = v5->_modelEspresso;
          if (v27)
          {
            -[VCPCNNModelEspresso inputBlob](v27, "inputBlob");
            v28 = v34;
            v29 = v5->_modelEspresso;
            if (v29)
            {
              -[VCPCNNModelEspresso inputBlob](v29, "inputBlob");
              v30 = v33;
LABEL_29:
              *(_DWORD *)v48 = 67109888;
              v49 = v32;
              v50 = 1024;
              v51 = v31;
              v52 = 1024;
              v53 = v28;
              v54 = 1024;
              v55 = v30;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VideoCaption] VCPVideoCaptionEncoder: inputBlob.nframes = %d, inputBlob.height = %d, inputBlob.width = %d, inputBlob.channels = %d", v48, 0x1Au);
              goto LABEL_30;
            }
LABEL_28:
            v30 = 0;
            goto LABEL_29;
          }
LABEL_27:
          v28 = 0;
          goto LABEL_28;
        }
      }
      else
      {
        v25 = 0;
        v47 = 0;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        *(_OWORD *)buf = 0u;
        v38 = 0u;
      }
      v31 = 0;
      v32 = v25;
      goto LABEL_27;
    }
  }
  v11 = 0;
LABEL_17:
  v20 = v11;

  return v20;
}

+ (id)sharedModel:(id)a3 properties:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("VCPVideoCaptionEncoder"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__VCPVideoCaptionEncoder_sharedModel_properties___block_invoke;
  v15[3] = &unk_1E6B167C0;
  v11 = v5;
  v16 = v11;
  v12 = v6;
  v17 = v12;
  objc_msgSend(v7, "sharedInstanceWithIdentifier:andCreationBlock:", v10, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

VCPCNNModelEspresso *__49__VCPVideoCaptionEncoder_sharedModel_properties___block_invoke(uint64_t a1)
{
  return -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", *(_QWORD *)(a1 + 32), 0, 0, *(_QWORD *)(a1 + 40));
}

- (int)inference:(float *)a3
{
  int v4;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v6;
  VCPCNNModelEspresso *v7;
  VCPCNNModelEspresso *v8;
  VCPCNNModelEspresso *v9;
  float *v10;
  float *v12;
  int v13;
  int v14;
  int v15;
  int v16;

  v4 = -[VCPCNNModelEspresso espressoForward:](self->_modelEspresso, "espressoForward:", a3);
  if (!v4)
  {
    modelEspresso = self->_modelEspresso;
    if (modelEspresso)
    {
      -[VCPCNNModelEspresso outputBlob](modelEspresso, "outputBlob");
      v6 = self->_modelEspresso;
      self->_embeddingHeight = v14;
      if (v6)
      {
        -[VCPCNNModelEspresso outputBlob](v6, "outputBlob");
        v7 = self->_modelEspresso;
        self->_embeddingWidth = v13;
        if (v7)
        {
          -[VCPCNNModelEspresso outputBlob](v7, "outputBlob");
          v8 = self->_modelEspresso;
          self->_embeddingChannels = v15;
          if (v8)
          {
            -[VCPCNNModelEspresso outputBlob](v8, "outputBlob");
            v9 = self->_modelEspresso;
            self->_embeddingSequenceLength = v16;
            if (v9)
            {
              -[VCPCNNModelEspresso outputBlob](v9, "outputBlob");
              v10 = v12;
            }
            else
            {
              v10 = 0;
            }
            goto LABEL_12;
          }
LABEL_11:
          v10 = 0;
          self->_embeddingSequenceLength = 0;
LABEL_12:
          self->_videoEmbedding = v10;
          return v4;
        }
LABEL_10:
        self->_embeddingChannels = 0;
        goto LABEL_11;
      }
    }
    else
    {
      self->_embeddingHeight = 0;
    }
    self->_embeddingWidth = 0;
    goto LABEL_10;
  }
  return v4;
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

- (float)videoEmbedding
{
  return self->_videoEmbedding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

@end
