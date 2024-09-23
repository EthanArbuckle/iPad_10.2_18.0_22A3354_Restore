@implementation SiriNLUInternalEmbeddingConverter

+ (id)convertFromEmbeddingResponseCommand:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BE9E1E0]);
    objc_msgSend(v4, "setEmbeddingDim:", objc_msgSend(v3, "embeddingDim"));
    objc_msgSend(v4, "setNumLayer:", objc_msgSend(v3, "numLayers"));
    objc_msgSend(v4, "setNumToken:", objc_msgSend(v3, "numTokens"));
    objc_msgSend(v3, "tokenChain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMTokenChain convertCDMTokenChainToProtoTokenChain:](CDMTokenChain, "convertCDMTokenChainToProtoTokenChain:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTokenChain:", v6);

    objc_msgSend(v3, "embeddingTensor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc_init(MEMORY[0x24BE9E250]);
      objc_msgSend(v8, "setEmbeddingDim:", objc_msgSend(v3, "embeddingDim"));
      objc_msgSend(v8, "setNumLayer:", objc_msgSend(v3, "numLayers"));
      objc_msgSend(v8, "setNumToken:", objc_msgSend(v3, "numTokens"));
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v3, "embeddingTensor", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "values");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "floatValue");
            objc_msgSend(v8, "addValues:");
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        }
        while (v12);
      }

      CDMOSLoggerForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "+[SiriNLUInternalEmbeddingConverter convertFromEmbeddingResponseCommand:]";
      }

      objc_msgSend(v8, "setEmbedderId:", CFSTR("rdar://72698550"));
      objc_msgSend(v4, "setEmbeddingTensor:", v8);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromProtoEmbeddingResponseCommand:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  CDMEmbeddingResponseCommand *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v3, "embeddingTensorOutputs", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        if ((objc_msgSend(v10, "isStableEmbeddingsVersion") & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v10, "embeddingTensor");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "embeddingDim");

      if (!v11)
        goto LABEL_13;
      objc_msgSend((id)objc_opt_class(), "convertFromProtoTensor:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "tokenChain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[CDMTokenizerProtoService tokenChainFromProto:](CDMTokenizerProtoService, "tokenChainFromProto:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = -[CDMEmbeddingResponseCommand initWithTokenChain:embeddingTensor:numTokens:numLayers:embeddingDim:]([CDMEmbeddingResponseCommand alloc], "initWithTokenChain:embeddingTensor:numTokens:numLayers:embeddingDim:", v15, v13, objc_msgSend(v4, "numToken"), objc_msgSend(v4, "numLayer"), v12);
    }
    else
    {
LABEL_10:

LABEL_13:
      CDMOSLoggerForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "+[SiriNLUInternalEmbeddingConverter convertFromProtoEmbeddingResponseCommand:]";
        _os_log_error_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_ERROR, "%s [ERR]: No stable model version found in embedding response! Returning nil", buf, 0xCu);
      }
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)convertFromProtoTensor:(id)a3
{
  id v3;
  NLv4EmbeddingTensor *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(NLv4EmbeddingTensor);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "valuesCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "valuesCount"))
    {
      v6 = 0;
      do
      {
        v7 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v3, "valuesAtIndex:", v6);
        objc_msgSend(v7, "numberWithFloat:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

        ++v6;
      }
      while (v6 < objc_msgSend(v3, "valuesCount"));
    }
    -[NLv4EmbeddingTensor setValues:](v4, "setValues:", v5);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
