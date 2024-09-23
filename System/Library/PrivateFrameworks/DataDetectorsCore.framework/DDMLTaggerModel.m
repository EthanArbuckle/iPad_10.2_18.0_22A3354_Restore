@implementation DDMLTaggerModel

- (DDMLTaggerModel)initWithEmbeddingLocale:(id)a3 modelDictionary:(id)a4 baseURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  DDMLTaggerModel *v12;
  DDMLTaggerModel *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSDictionary *tokenLabelMap;
  void *v18;
  void *v19;
  double v20;
  double Helper_x8__kMRLNeuralNetworkOptionModelURLKey;
  uint64_t v22;
  void *v23;
  double v24;
  id v26;
  objc_super v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)DDMLTaggerModel;
  v12 = -[DDMLTaggerModel init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_embeddingLocale, a3);
    v26 = 0;
    objc_msgSend((id)objc_opt_class(), "_buildTokenToLabelMap:supportedTypes:", v10, &v26);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v26;
    v16 = v26;
    tokenLabelMap = v13->_tokenLabelMap;
    v13->_tokenLabelMap = (NSDictionary *)v14;

    objc_storeStrong((id *)&v13->_supportedTypes, v15);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("modelFile"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      Helper_x8__kMRLNeuralNetworkOptionModelURLKey = gotLoadHelper_x8__kMRLNeuralNetworkOptionModelURLKey(v20);
      v28 = **(_QWORD **)(v22 + 1448);
      v29[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1, Helper_x8__kMRLNeuralNetworkOptionModelURLKey);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v13->_taggerModel = (MontrealNeuralNetwork *)MRLNeuralNetworkCreate_delayInitStub(v24);

    }
  }

  return v13;
}

- (void)dealloc
{
  MontrealNeuralNetwork *taggerModel;
  objc_super v4;

  taggerModel = self->_taggerModel;
  if (taggerModel)
    CFRelease(taggerModel);
  v4.receiver = self;
  v4.super_class = (Class)DDMLTaggerModel;
  -[DDMLTaggerModel dealloc](&v4, sel_dealloc);
}

- (id)tokenTypeForValue:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  DDMLTokenType *v8;

  -[DDMLTaggerModel tokenLabelMap](self, "tokenLabelMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DDMLTaggerModel tokenLabelMap](self, "tokenLabelMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (DDMLTokenType *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = -[DDMLTokenType initWithClassification:beginning:]([DDMLTokenType alloc], "initWithClassification:beginning:", 10, 0);
  }
  return v8;
}

- (MontrealNeuralNetwork)taggerModel
{
  return self->_taggerModel;
}

- (NSLocale)embeddingLocale
{
  return (NSLocale *)objc_getProperty(self, a2, 16, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)tokenLabelMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)supportedTypes
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTypes, 0);
  objc_storeStrong((id *)&self->_tokenLabelMap, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_embeddingLocale, 0);
}

+ (id)currentTaggerModel
{
  return (id)_currentTaggerModel;
}

+ (void)setCurrentTaggerModel:(id)a3
{
  objc_storeStrong((id *)&_currentTaggerModel, a3);
}

+ (id)_buildTokenToLabelMap:(id)a3 supportedTypes:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  id v19;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  if (a4)
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  else
    v7 = 0;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("outputMap"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __56__DDMLTaggerModel__buildTokenToLabelMap_supportedTypes___block_invoke;
  v17 = &unk_1E3C953B0;
  v9 = v6;
  v18 = v9;
  v10 = v7;
  v19 = v10;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v14);
  if (a4)
  {
    objc_msgSend(v10, "allObjects", v14, v15, v16, v17, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v19;
  v12 = v9;

  return v12;
}

void __56__DDMLTaggerModel__buildTokenToLabelMap_supportedTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  DDMLTokenType *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("b-address")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("B-ADDR")) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("i-address")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("I-ADDR")) & 1) != 0)
    {
      v8 = 0;
      v7 = 0;
      goto LABEL_5;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("b-airline_name")) & 1) != 0)
    {
      v7 = 2;
    }
    else
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("i-airline_name")) & 1) != 0)
      {
        v8 = 0;
        v7 = 2;
        goto LABEL_5;
      }
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("b-currency_amount")) & 1) != 0)
      {
        v7 = 4;
      }
      else
      {
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("i-currency_amount")) & 1) != 0)
        {
          v8 = 0;
          v7 = 4;
          goto LABEL_5;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("b-event")) & 1) != 0)
        {
          v7 = 5;
        }
        else
        {
          if ((objc_msgSend(v6, "isEqualToString:", CFSTR("i-event")) & 1) != 0)
          {
            v8 = 0;
            v7 = 5;
            goto LABEL_5;
          }
          if ((objc_msgSend(v6, "isEqualToString:", CFSTR("b-physical_unit")) & 1) != 0)
          {
            v7 = 6;
          }
          else
          {
            if ((objc_msgSend(v6, "isEqualToString:", CFSTR("i-physical_unit")) & 1) != 0)
            {
              v8 = 0;
              v7 = 6;
              goto LABEL_5;
            }
            if ((objc_msgSend(v6, "isEqualToString:", CFSTR("b-recurring_event")) & 1) == 0)
            {
              if ((objc_msgSend(v6, "isEqualToString:", CFSTR("i-recurring_event")) & 1) != 0)
              {
                v8 = 0;
                v7 = 7;
                goto LABEL_5;
              }
              if ((objc_msgSend(v6, "isEqualToString:", CFSTR("O")) & 1) == 0
                && (objc_msgSend(v6, "isEqualToString:", CFSTR("NONE")) & 1) == 0)
              {
                if ((objc_msgSend(v6, "isEqualToString:", CFSTR("b-flight_number")) & 1) != 0)
                {
                  v7 = 3;
                  goto LABEL_4;
                }
                if ((objc_msgSend(v6, "isEqualToString:", CFSTR("i-flight_number")) & 1) != 0)
                {
                  v8 = 0;
                  v7 = 3;
                  goto LABEL_5;
                }
                if ((objc_msgSend(v6, "isEqualToString:", CFSTR("b-phone_number")) & 1) != 0)
                {
                  v7 = 8;
                  goto LABEL_4;
                }
                if ((objc_msgSend(v6, "isEqualToString:", CFSTR("i-phone_number")) & 1) != 0)
                {
                  v8 = 0;
                  v7 = 8;
                  goto LABEL_5;
                }
                if (DDLogHandle_onceToken != -1)
                  dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                v16 = (id)DDLogHandle_error_log_handle;
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  v17 = 138412290;
                  v18 = v6;
                  _os_log_error_impl(&dword_19BC07000, v16, OS_LOG_TYPE_ERROR, "unexpected ML tag type %@", (uint8_t *)&v17, 0xCu);
                }

              }
              v8 = 0;
              v9 = 0;
              v7 = 10;
              goto LABEL_6;
            }
            v7 = 7;
          }
        }
      }
    }
  }
LABEL_4:
  v8 = 1;
LABEL_5:
  v9 = 1;
LABEL_6:
  v10 = (int)objc_msgSend(v5, "intValue");
  v11 = -[DDMLTokenType initWithClassification:beginning:]([DDMLTokenType alloc], "initWithClassification:beginning:", v7, v8);
  v12 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  if (v9)
  {
    v14 = *(void **)(a1 + 40);
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v15);

    }
  }

}

@end
