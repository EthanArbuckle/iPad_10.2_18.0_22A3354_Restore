@implementation SGBinaryClassificationModel

+ (id)modelForPath:(id)a3 modelClass:(Class)a4
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PMLReadChunkFile();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sgLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_INFO, "Model loaded.", (uint8_t *)&v9, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315138;
    v10 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _os_log_error_impl(&dword_1C3607000, v7, OS_LOG_TYPE_ERROR, "Failed to load model chunk file resource %s", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

+ (id)modelFromMobileAssetForEntity:(id)a3 type:(id)a4 language:(id)a5 class:(Class)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  objc_class *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_%@%@Model.chunk"), CFSTR("PREDICTION"), v12, v10, v11);
  objc_msgSend(MEMORY[0x1E0D19EC8], "asset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filesystemPathForAssetDataRelativePath:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  sgLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v23 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      v22 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      v24 = a6;
      v18 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      objc_msgSend(MEMORY[0x1E0D19EC8], "asset");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v26 = v23;
      v27 = 2080;
      v28 = v22;
      v29 = 2080;
      v30 = v18;
      a6 = v24;
      v31 = 2048;
      v32 = objc_msgSend(v19, "assetVersion");
      v33 = 2080;
      v34 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      _os_log_impl(&dword_1C3607000, v17, OS_LOG_TYPE_INFO, "Loading model {entity: %s, type: %s, language: %s, version: %tu, path: %s}", buf, 0x34u);

    }
    objc_msgSend(a1, "modelForPath:modelClass:", v15, a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      _os_log_error_impl(&dword_1C3607000, v17, OS_LOG_TYPE_ERROR, "Failed to locate assets resource %s", buf, 0xCu);
    }

    v20 = 0;
  }

  return v20;
}

+ (id)modelFromMobileAssetForName:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSString *v14;
  Class v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  NSObject *v19;
  NSObject *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("args:")))
  {
    v8 = (void *)MEMORY[0x1C3BD4F6C]();
    v9 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v6, "substringFromIndex:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(","));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v9);
    if (objc_msgSend(v11, "count") == 3)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      v15 = NSClassFromString(v14);
      if (v15)
      {
        objc_msgSend(a1, "modelFromMobileAssetForEntity:type:language:class:", v12, v13, v7, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        sgLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v22 = 136315138;
          v23 = -[NSString UTF8String](objc_retainAutorelease(v14), "UTF8String");
          _os_log_error_impl(&dword_1C3607000, v19, OS_LOG_TYPE_ERROR, "Unknown model class: %s", (uint8_t *)&v22, 0xCu);
        }

        v16 = 0;
      }

    }
    else
    {
      sgLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v22 = 136315138;
        v23 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
        _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "Invalid model string: %s", (uint8_t *)&v22, 0xCu);
      }
      v16 = 0;
    }

    objc_autoreleasePoolPop(v8);
    goto LABEL_22;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("dataDetectionSignificantPhrasePhoneLogistic")))
  {
    v17 = objc_opt_class();
    v18 = CFSTR("significantPhoneNumber");
LABEL_21:
    objc_msgSend(a1, "modelFromMobileAssetForEntity:type:language:class:", v18, CFSTR("Logistic"), v7, v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("dataDetectionSignificantPhraseEmailLogistic"))
    || objc_msgSend(v6, "isEqualToString:", CFSTR("dataDetectionSignificantPhraseEmailForIMessageLogistic")))
  {
    v17 = objc_opt_class();
    v18 = CFSTR("significantEmailAddress");
    goto LABEL_21;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("dataDetectionSignificantPhraseAddressLogistic"))
    || objc_msgSend(v6, "isEqualToString:", CFSTR("dataDetectionSignificantPhraseAddressForIMessageLogistic")))
  {
    v17 = objc_opt_class();
    v18 = CFSTR("significantAddress");
    goto LABEL_21;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("selfIdentificationPhraseLogistic")))
  {
    v17 = objc_opt_class();
    v18 = CFSTR("selfId");
    goto LABEL_21;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("birthdayTextMessageCongrats")))
  {
    v17 = objc_opt_class();
    v18 = CFSTR("birthdayExtraction");
    goto LABEL_21;
  }
  sgLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = 136315138;
    v23 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _os_log_error_impl(&dword_1C3607000, v21, OS_LOG_TYPE_ERROR, "Unknown model name: %s", (uint8_t *)&v22, 0xCu);
  }

  v16 = 0;
LABEL_22:

  return v16;
}

- (id)predictLabelForInput:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  -[SGModel predictForInput:](self, "predictForInput:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  v8 = (void *)MEMORY[0x1E0D81638];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[SGBinaryClassificationModel threshold](self, "threshold");
  objc_msgSend(v9, "numberWithBool:", v7 > v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tupleWithFirst:second:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (SGBinaryClassificationModel)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  SGBinaryClassificationModel *v27;
  void *v28;
  double v29;
  SGBinaryClassificationModel *v30;
  void *v32;
  void *v33;
  void *v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[SGBinaryClassificationModel initWithPlist:chunks:context:]", "SGBinaryClassificationModel.m", 81, "[dict isKindOfClass:[NSDictionary class]]");
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MODEL_TYPE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MODEL_LOCALE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MODEL_DATA"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("LOGISTIC")))
  {
    v16 = (objc_class *)objc_opt_class();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGBinaryClassificationModel.m"), 91, CFSTR("Unknown model type: %@"), v13);

    v16 = 0;
  }
  v18 = (void *)objc_msgSend([v16 alloc], "initWithPlist:chunks:context:", v15, v10, v11);
  if (v18)
  {
    v33 = v15;
    v34 = v14;
    v19 = objc_alloc(MEMORY[0x1E0D81058]);
    v20 = (void *)objc_msgSend(v19, "initWithClassNameKey:", *MEMORY[0x1E0D810A0]);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MODEL_FEATURIZER"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v20;
    objc_msgSend(v20, "readObjectWithPlist:chunks:context:", v21, v10, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_alloc(MEMORY[0x1E0D81060]);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MODEL_SOURCE_SESSION_DESCRIPTOR"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithPlist:chunks:context:", v24, v10, v11);

    if (v25)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19ED8]), "initWithSessionDescriptor:modelClass:", v25, objc_opt_class());
      v14 = v34;
      v27 = -[SGModel initWithModel:locale:featurizer:modelSource:](self, "initWithModel:locale:featurizer:modelSource:", v18, v34, v22, v26);
      if (v27)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MODEL_DECISION_THRESHOLD"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "doubleValue");
        v27->_threshold = v29;

        v14 = v34;
      }
      self = v27;

      v30 = self;
    }
    else
    {
      v30 = 0;
      v14 = v34;
    }

    v15 = v33;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)toPlistWithChunks:(id)a3
{
  id v5;
  void *v6;
  char isKindOfClass;
  const __CFString *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[6];
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SGModel model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = CFSTR("LOGISTIC");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGModel model](self, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGBinaryClassificationModel.m"), 128, CFSTR("Unknown type of model class: %@"), v12);

    v8 = 0;
  }
  v13 = objc_alloc(MEMORY[0x1E0D81058]);
  v14 = (void *)objc_msgSend(v13, "initWithClassNameKey:", *MEMORY[0x1E0D810A0]);
  -[SGModel featurizer](self, "featurizer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "writeToPlistWithObject:andChunks:", v15, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = CFSTR("MODEL_DATA");
  -[SGModel model](self, "model");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "toPlistWithChunks:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v18;
  v27[1] = CFSTR("MODEL_LOCALE");
  -[SGModel locale](self, "locale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v19;
  v28[2] = v8;
  v27[2] = CFSTR("MODEL_TYPE");
  v27[3] = CFSTR("MODEL_FEATURIZER");
  v28[3] = v16;
  v27[4] = CFSTR("MODEL_SOURCE_SESSION_DESCRIPTOR");
  -[SGModel modelSource](self, "modelSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sessionDescriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "toPlistWithChunks:", v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v28[4] = v22;
  v27[5] = CFSTR("MODEL_DECISION_THRESHOLD");
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[SGBinaryClassificationModel threshold](self, "threshold");
  objc_msgSend(v23, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (double)threshold
{
  return self->_threshold;
}

@end
