@implementation SGModelHyperparameters

- (SGModelHyperparameters)initWithDictionary:(id)a3 modelTypeName:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSString *v10;
  NSString *featuresModelId;
  NSString *v12;
  NSString *featuresVersion;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSUInteger v18;
  void *v19;
  void *v20;
  NSUInteger v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  NSUInteger v26;
  void *v27;
  void *v28;
  NSUInteger v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  SGModelHyperparameters *v43;
  objc_super v45;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (!v8)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_53;
    *(_WORD *)buf = 0;
    v22 = MEMORY[0x24BDACB70];
    v23 = "dictionary";
    goto LABEL_52;
  }

  v45.receiver = self;
  v45.super_class = (Class)SGModelHyperparameters;
  self = -[SGModelHyperparameters init](&v45, sel_init);
  if (self)
  {
    objc_msgSend(v9, "stringAssertedForKey:", CFSTR("FEATURES_MODEL_ID"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      featuresModelId = self->_featuresModelId;
      self->_featuresModelId = v10;

      objc_msgSend(v9, "stringAssertedForKey:", CFSTR("FEATURES_VERSION"));
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        featuresVersion = self->_featuresVersion;
        self->_featuresVersion = v12;

        objc_msgSend(v9, "numberAssertedForKey:", CFSTR("VECTOR_LENGTH"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = v14;
          self->_vectorLength = objc_msgSend(v14, "unsignedIntegerValue");

          objc_msgSend(v9, "numberAssertedForKey:", CFSTR("CHARACTER_N_GRAM_MINIMUM_N"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = v16;
            v18 = objc_msgSend(v16, "unsignedIntegerValue");
            objc_msgSend(v9, "numberAssertedForKey:", CFSTR("CHARACTER_N_GRAM_RANGE_N_LENGTH"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v20 = v19;
              v21 = objc_msgSend(v19, "unsignedIntegerValue");
              self->_characterNGramRange.location = v18;
              self->_characterNGramRange.length = v21;

            }
            else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "[dictionary numberAssertedForKey:CHARACTER_N_GRAM_RANGE_N_LENGTH]", buf, 2u);
            }

            objc_msgSend(v9, "numberAssertedForKey:", CFSTR("TOKEN_N_GRAM_MINIMUM_N"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              v25 = v24;
              v26 = objc_msgSend(v24, "unsignedIntegerValue");
              objc_msgSend(v9, "numberAssertedForKey:", CFSTR("TOKEN_N_GRAM_RANGE_N_LENGTH"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (v27)
              {
                v28 = v27;
                v29 = objc_msgSend(v27, "unsignedIntegerValue");
                self->_tokenNGramRange.location = v26;
                self->_tokenNGramRange.length = v29;

              }
              else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "[dictionary numberAssertedForKey:TOKEN_N_GRAM_RANGE_N_LENGTH]", buf, 2u);
              }

              objc_msgSend(v9, "stringAssertedForKey:", CFSTR("VECTORIZER_STRATEGY"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              self->_vectorizerStrategy = +[SGModelHyperparameters strategyForString:modelTypeName:](SGModelHyperparameters, "strategyForString:modelTypeName:", v30, v7);

              objc_msgSend(v9, "numberAssertedForKey:", CFSTR("ID_VECTOR_LENGTH"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "unsignedIntegerValue");
              v33 = 200;
              if (v32)
                v33 = v32;
              self->_idVectorLength = v33;

              objc_msgSend(v9, "numberAssertedForKey:", CFSTR("ID_VECTOR_SHOULD_PAD_TO_LENGTH"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              self->_extraIdOptions |= objc_msgSend(v34, "BOOLValue");

              objc_msgSend(v9, "numberAssertedForKey:", CFSTR("ID_VECTOR_SHOULD_APPEND_SENTEND"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "BOOLValue");
              v37 = 2;
              if (!v36)
                v37 = 0;
              self->_extraIdOptions |= v37;

              objc_msgSend(v9, "numberAssertedForKey:", CFSTR("ID_VECTOR_SHOULD_APPEND_SENTSTART"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "BOOLValue");
              v40 = 4;
              if (!v39)
                v40 = 0;
              self->_extraIdOptions |= v40;

              objc_msgSend(v9, "numberAssertedForKey:", CFSTR("VECTOR_NORMALIZATION"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v41;
              if (!v41)
                v41 = &unk_24DDCF720;
              self->_vectorNormalization = objc_msgSend(v41, "unsignedIntegerValue");

              if (-[NSString length](self->_featuresModelId, "length"))
              {
                if (-[NSString length](self->_featuresVersion, "length"))
                {
                  if (self->_characterNGramRange.length + self->_characterNGramRange.location >= 0x65)
                  {
                    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                      goto LABEL_53;
                    *(_WORD *)buf = 0;
                    v22 = MEMORY[0x24BDACB70];
                    v23 = "NSMaxRange(_characterNGramRange) <= MAXIMUM_NGRAM_LENGTH";
                  }
                  else
                  {
                    if (self->_tokenNGramRange.length + self->_tokenNGramRange.location < 0x65)
                    {
                      if (self->_vectorizerStrategy < 7)
                        goto LABEL_41;
                      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)buf = 0;
                        v22 = MEMORY[0x24BDACB70];
                        v23 = "_vectorizerStrategy < PMLHashingVectorizerStrategyLimit";
                        goto LABEL_52;
                      }
LABEL_53:
                      v43 = 0;
                      goto LABEL_54;
                    }
                    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                      goto LABEL_53;
                    *(_WORD *)buf = 0;
                    v22 = MEMORY[0x24BDACB70];
                    v23 = "NSMaxRange(_tokenNGramRange) <= MAXIMUM_NGRAM_LENGTH";
                  }
                }
                else
                {
                  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                    goto LABEL_53;
                  *(_WORD *)buf = 0;
                  v22 = MEMORY[0x24BDACB70];
                  v23 = "_featuresVersion.length > 0";
                }
              }
              else
              {
                if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                  goto LABEL_53;
                *(_WORD *)buf = 0;
                v22 = MEMORY[0x24BDACB70];
                v23 = "_featuresModelId.length > 0";
              }
            }
            else
            {
              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                goto LABEL_53;
              *(_WORD *)buf = 0;
              v22 = MEMORY[0x24BDACB70];
              v23 = "[dictionary numberAssertedForKey:TOKEN_N_GRAM_MINIMUM_N]";
            }
          }
          else
          {
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
              goto LABEL_53;
            *(_WORD *)buf = 0;
            v22 = MEMORY[0x24BDACB70];
            v23 = "[dictionary numberAssertedForKey:CHARACTER_N_GRAM_MINIMUM_N]";
          }
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
            goto LABEL_53;
          *(_WORD *)buf = 0;
          v22 = MEMORY[0x24BDACB70];
          v23 = "[dictionary numberAssertedForKey:VECTOR_LENGTH]";
        }
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          goto LABEL_53;
        *(_WORD *)buf = 0;
        v22 = MEMORY[0x24BDACB70];
        v23 = "[dictionary stringAssertedForKey:FEATURES_VERSION]";
      }
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        goto LABEL_53;
      *(_WORD *)buf = 0;
      v22 = MEMORY[0x24BDACB70];
      v23 = "[dictionary stringAssertedForKey:FEATURES_MODEL_ID]";
    }
LABEL_52:
    _os_log_fault_impl(&dword_21ABF4000, v22, OS_LOG_TYPE_FAULT, v23, buf, 2u);
    goto LABEL_53;
  }
LABEL_41:
  self = self;
  v43 = self;
LABEL_54:

  return v43;
}

- (id)sessionDescriptorForLanguage:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:", CFSTR("VL=%lu&CL=%lu&CH=%lu&TL=%lu&TH=%lu&SN=%lu&IDL=%lu&IDS=%lu&VN=%ld&FV=%@"), self->_vectorLength, self->_characterNGramRange.location, self->_characterNGramRange.length + self->_characterNGramRange.location, self->_tokenNGramRange.location, self->_tokenNGramRange.length + self->_tokenNGramRange.location, self->_vectorizerStrategy, self->_idVectorLength, self->_extraIdOptions, self->_vectorNormalization, self->_featuresVersion);
  objc_msgSend(MEMORY[0x24BE79AE8], "descriptorForName:version:locale:", self->_featuresModelId, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)featuresModelId
{
  return self->_featuresModelId;
}

- (NSString)featuresVersion
{
  return self->_featuresVersion;
}

- (_NSRange)characterNGramRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_characterNGramRange.length;
  location = self->_characterNGramRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)tokenNGramRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_tokenNGramRange.length;
  location = self->_tokenNGramRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)vectorLength
{
  return self->_vectorLength;
}

- (unint64_t)idVectorLength
{
  return self->_idVectorLength;
}

- (unint64_t)extraIdOptions
{
  return self->_extraIdOptions;
}

- (unint64_t)vectorizerStrategy
{
  return self->_vectorizerStrategy;
}

- (int64_t)vectorNormalization
{
  return self->_vectorNormalization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresVersion, 0);
  objc_storeStrong((id *)&self->_featuresModelId, 0);
}

+ (unint64_t)strategyForString:(id)a3 modelTypeName:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  const char *v9;
  unint64_t v10;
  NSObject *v11;
  const char *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "UTF8String");
  if (v8)
  {
    v9 = (const char *)v8;
    v10 = 0;
    while (strcmp(v9, off_24DDC3CC8[v10]))
    {
      if (++v10 == 7)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          goto LABEL_13;
        v14 = 138412290;
        v15 = v7;
        v11 = MEMORY[0x24BDACB70];
        v12 = "Unknown strategy string %@ when initializing SGQuickResponsesConfig from plist.";
        goto LABEL_12;
      }
    }
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("quickResponsesBinaryLogisticMultiLabel")) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("quickResponsesEspressoClassifierMultiLabel")) & 1) == 0
      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      v14 = 138412290;
      v15 = v6;
      v11 = MEMORY[0x24BDACB70];
      v12 = "Unknown model type name %@ when initializing SGQuickResponsesConfig from plist.";
LABEL_12:
      _os_log_fault_impl(&dword_21ABF4000, v11, OS_LOG_TYPE_FAULT, v12, (uint8_t *)&v14, 0xCu);
    }
LABEL_13:
    v10 = 4;
  }

  return v10;
}

@end
