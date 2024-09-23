@implementation CKContextResponse

- (void)setAvailableLayoutSize:(CGSize)a3
{
  self->_availableLayoutSize = a3;
}

- (NSArray)level2Topics
{
  return self->_level2Topics;
}

- (NSArray)level1Topics
{
  return self->_level1Topics;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 resultsNeedFiltering;
  CGFloat width;
  CGFloat height;
  id v7;

  resultsNeedFiltering = self->_resultsNeedFiltering;
  v7 = a3;
  objc_msgSend(v7, "encodeBool:forKey:", resultsNeedFiltering, CFSTR("resultsNeedFiltering"));
  -[NSCoder encodeUInteger:forKey:](v7, (const char *)self->_requestType, (uint64_t)CFSTR("requestType"));
  -[NSCoder encodeUInteger:forKey:](v7, (const char *)self->_mustPrefixMatchLength, (uint64_t)CFSTR("mustPrefixMatchLength"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_error, CFSTR("error"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_languageTag, CFSTR("languageTag"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_debug, CFSTR("debug"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_results, CFSTR("results"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_requestFingerprint, CFSTR("requestFingerprint"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_level1Topics, CFSTR("level1Topics"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_level2Topics, CFSTR("level2Topics"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_donorBundleIdentifiers, CFSTR("donorBundleIdentifiers"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_partsOfSpeechToTexts, CFSTR("partsOfSpeechToTexts"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_debugRequest, CFSTR("debugRequest"));
  width = self->_availableLayoutSize.width;
  *(float *)&width = width;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("availableLayoutSize.width"), width);
  height = self->_availableLayoutSize.height;
  *(float *)&height = height;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("availableLayoutSize.height"), height);

}

- (void)dealloc
{
  objc_super v3;

  -[CKContextResponse discard](self, "discard");
  v3.receiver = self;
  v3.super_class = (Class)CKContextResponse;
  -[CKContextResponse dealloc](&v3, sel_dealloc);
}

- (void)discard
{
  CKContextResponse *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_discarded)
    obj->_discarded = 1;
  objc_sync_exit(obj);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugRequest, 0);
  objc_storeStrong((id *)&self->_responseDate, 0);
  objc_storeStrong((id *)&self->_hideCompletionsAfterDate, 0);
  objc_storeStrong((id *)&self->_requestFingerprint, 0);
  objc_storeStrong((id *)&self->_partsOfSpeechToTexts, 0);
  objc_storeStrong((id *)&self->_debug, 0);
  objc_storeStrong((id *)&self->_languageTag, 0);
  objc_storeStrong((id *)&self->_donorBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_level2Topics, 0);
  objc_storeStrong((id *)&self->_level1Topics, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_loggingCouldHaveShown, 0);
}

- (CKContextResponse)initWithCoder:(id)a3
{
  id v4;
  CKContextResponse *v5;
  id v6;
  uint64_t v7;
  NSString *uuid;
  id v9;
  uint64_t v10;
  NSError *error;
  id v12;
  uint64_t v13;
  NSString *languageTag;
  id v15;
  uint64_t v16;
  NSString *debug;
  id v18;
  uint64_t v19;
  NSArray *results;
  id v21;
  uint64_t v22;
  CKContextFingerprintMinHash *requestFingerprint;
  id v24;
  uint64_t v25;
  NSArray *level1Topics;
  id v27;
  uint64_t v28;
  NSArray *level2Topics;
  id v30;
  uint64_t v31;
  NSArray *donorBundleIdentifiers;
  id v33;
  uint64_t v34;
  NSDictionary *partsOfSpeechToTexts;
  id v36;
  uint64_t v37;
  CKContextRequest *debugRequest;
  uint64_t v39;
  NSDate *responseDate;
  float v41;
  CGFloat v42;
  float v43;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CKContextResponse;
  v5 = -[CKContextResponse init](&v45, sel_init);
  if (v5)
  {
    v5->_resultsNeedFiltering = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("resultsNeedFiltering"));
    v5->_requestType = (unint64_t)-[NSCoder decodeUIntegerForKey:](v4, CFSTR("requestType"));
    v5->_mustPrefixMatchLength = (unint64_t)-[NSCoder decodeUIntegerForKey:](v4, CFSTR("mustPrefixMatchLength"));
    if (initWithCoder__onceToken_0 != -1)
      dispatch_once(&initWithCoder__onceToken_0, &__block_literal_global_2);
    v6 = (id)initWithCoder__x_0;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("uuid"));
    v7 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v7;

    if (initWithCoder__onceToken_14 != -1)
      dispatch_once(&initWithCoder__onceToken_14, &__block_literal_global_15);
    v9 = (id)initWithCoder__x_13;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("error"));
    v10 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v10;

    if (initWithCoder__onceToken_19 != -1)
      dispatch_once(&initWithCoder__onceToken_19, &__block_literal_global_20);
    v12 = (id)initWithCoder__x_18;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("languageTag"));
    v13 = objc_claimAutoreleasedReturnValue();
    languageTag = v5->_languageTag;
    v5->_languageTag = (NSString *)v13;

    if (initWithCoder__onceToken_24 != -1)
      dispatch_once(&initWithCoder__onceToken_24, &__block_literal_global_25);
    v15 = (id)initWithCoder__x_23;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("debug"));
    v16 = objc_claimAutoreleasedReturnValue();
    debug = v5->_debug;
    v5->_debug = (NSString *)v16;

    if (initWithCoder__onceToken_29 != -1)
      dispatch_once(&initWithCoder__onceToken_29, &__block_literal_global_30);
    v18 = (id)initWithCoder__x_28;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("results"));
    v19 = objc_claimAutoreleasedReturnValue();
    results = v5->_results;
    v5->_results = (NSArray *)v19;

    if (initWithCoder__onceToken_35 != -1)
      dispatch_once(&initWithCoder__onceToken_35, &__block_literal_global_36);
    v21 = (id)initWithCoder__x_34;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("requestFingerprint"));
    v22 = objc_claimAutoreleasedReturnValue();
    requestFingerprint = v5->_requestFingerprint;
    v5->_requestFingerprint = (CKContextFingerprintMinHash *)v22;

    if (initWithCoder__onceToken_41 != -1)
      dispatch_once(&initWithCoder__onceToken_41, &__block_literal_global_42);
    v24 = (id)initWithCoder__x_40;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("level1Topics"));
    v25 = objc_claimAutoreleasedReturnValue();
    level1Topics = v5->_level1Topics;
    v5->_level1Topics = (NSArray *)v25;

    if (initWithCoder__onceToken_46 != -1)
      dispatch_once(&initWithCoder__onceToken_46, &__block_literal_global_47_0);
    v27 = (id)initWithCoder__x_45;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("level2Topics"));
    v28 = objc_claimAutoreleasedReturnValue();
    level2Topics = v5->_level2Topics;
    v5->_level2Topics = (NSArray *)v28;

    if (initWithCoder__onceToken_51 != -1)
      dispatch_once(&initWithCoder__onceToken_51, &__block_literal_global_52);
    v30 = (id)initWithCoder__x_50;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("donorBundleIdentifiers"));
    v31 = objc_claimAutoreleasedReturnValue();
    donorBundleIdentifiers = v5->_donorBundleIdentifiers;
    v5->_donorBundleIdentifiers = (NSArray *)v31;

    if (initWithCoder__onceToken_56 != -1)
      dispatch_once(&initWithCoder__onceToken_56, &__block_literal_global_57);
    v33 = (id)initWithCoder__x_55;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("partsOfSpeechToTexts"));
    v34 = objc_claimAutoreleasedReturnValue();
    partsOfSpeechToTexts = v5->_partsOfSpeechToTexts;
    v5->_partsOfSpeechToTexts = (NSDictionary *)v34;

    if (initWithCoder__onceToken_62 != -1)
      dispatch_once(&initWithCoder__onceToken_62, &__block_literal_global_63);
    v36 = (id)initWithCoder__x_61;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("debugRequest"));
    v37 = objc_claimAutoreleasedReturnValue();
    debugRequest = v5->_debugRequest;
    v5->_debugRequest = (CKContextRequest *)v37;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v39 = objc_claimAutoreleasedReturnValue();
    responseDate = v5->_responseDate;
    v5->_responseDate = (NSDate *)v39;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("hideCompletionsTimeLimit"));
    -[CKContextResponse setHideCompletionsTimeLimit:](v5, "setHideCompletionsTimeLimit:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("availableLayoutSize.width"));
    v42 = v41;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("availableLayoutSize.height"));
    v5->_availableLayoutSize.width = v42;
    v5->_availableLayoutSize.height = v43;
  }

  return v5;
}

- (void)setLevel2Topics:(id)a3
{
  objc_storeStrong((id *)&self->_level2Topics, a3);
}

- (void)setLevel1Topics:(id)a3
{
  objc_storeStrong((id *)&self->_level1Topics, a3);
}

- (void)setHideCompletionsTimeLimit:(double)a3
{
  NSDate *v5;
  NSDate *v6;
  NSDate *hideCompletionsAfterDate;
  NSDate *v8;

  self->_hideCompletionsTimeLimit = a3;
  if (a3 <= 0.0)
  {
    hideCompletionsAfterDate = self->_hideCompletionsAfterDate;
    self->_hideCompletionsAfterDate = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    -[NSDate dateByAddingTimeInterval:](v8, "dateByAddingTimeInterval:", a3);
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_hideCompletionsAfterDate;
    self->_hideCompletionsAfterDate = v5;

    hideCompletionsAfterDate = v8;
  }

}

- (NSError)error
{
  return self->_error;
}

- (CKContextResponse)initWithResults:(id)a3 requestType:(unint64_t)a4
{
  id v7;
  CKContextResponse *v8;
  void *v9;
  void *v10;
  NSError *error;
  uint64_t v12;
  NSDate *responseDate;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKContextResponse;
  v8 = -[CKContextResponse init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKContextResponse setUuid:](v8, "setUuid:", v10);

    v8->_requestType = a4;
    objc_storeStrong((id *)&v8->_results, a3);
    error = v8->_error;
    v8->_error = 0;

    v8->_availableLayoutSize.width = 0.0;
    v8->_availableLayoutSize.height = 0.0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = objc_claimAutoreleasedReturnValue();
    responseDate = v8->_responseDate;
    v8->_responseDate = (NSDate *)v12;

    -[CKContextResponse setHideCompletionsTimeLimit:](v8, "setHideCompletionsTimeLimit:", 900.0);
  }

  return v8;
}

- (CKContextResponse)initWithError:(id)a3 requestType:(unint64_t)a4
{
  id v6;
  CKContextResponse *v7;
  void *v8;
  void *v9;
  NSArray *results;
  uint64_t v11;
  NSDate *responseDate;
  uint64_t v13;
  NSError *error;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKContextResponse;
  v7 = -[CKContextResponse init](&v16, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKContextResponse setUuid:](v7, "setUuid:", v9);

    results = v7->_results;
    v7->_results = 0;

    v7->_availableLayoutSize.width = 0.0;
    v7->_availableLayoutSize.height = 0.0;
    v7->_requestType = a4;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    responseDate = v7->_responseDate;
    v7->_responseDate = (NSDate *)v11;

    if (v6)
    {
      v13 = objc_msgSend(v6, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.context"), 8, 0);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    error = v7->_error;
    v7->_error = (NSError *)v13;

    -[CKContextResponse setHideCompletionsTimeLimit:](v7, "setHideCompletionsTimeLimit:", 900.0);
  }

  return v7;
}

- (id)initPlaceholderWithUUID:(id)a3 requestType:(unint64_t)a4
{
  id v6;
  CKContextResponse *v7;
  CKContextResponse *v8;
  NSArray *results;
  NSError *error;
  uint64_t v11;
  NSDate *responseDate;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKContextResponse;
  v7 = -[CKContextResponse init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CKContextResponse setUuid:](v7, "setUuid:", v6);
    results = v8->_results;
    v8->_results = 0;

    error = v8->_error;
    v8->_error = 0;

    v8->_availableLayoutSize.width = 0.0;
    v8->_availableLayoutSize.height = 0.0;
    v8->_requestType = a4;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    responseDate = v8->_responseDate;
    v8->_responseDate = (NSDate *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __35__CKContextResponse_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_0;
  initWithCoder__x_0 = v2;

}

void __35__CKContextResponse_initWithCoder___block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_13;
  initWithCoder__x_13 = v2;

}

void __35__CKContextResponse_initWithCoder___block_invoke_3()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_18;
  initWithCoder__x_18 = v2;

}

void __35__CKContextResponse_initWithCoder___block_invoke_4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_23;
  initWithCoder__x_23 = v2;

}

void __35__CKContextResponse_initWithCoder___block_invoke_5()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_28;
  initWithCoder__x_28 = v2;

}

void __35__CKContextResponse_initWithCoder___block_invoke_6()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_34;
  initWithCoder__x_34 = v2;

}

void __35__CKContextResponse_initWithCoder___block_invoke_7()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_40;
  initWithCoder__x_40 = v2;

}

void __35__CKContextResponse_initWithCoder___block_invoke_8()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_45;
  initWithCoder__x_45 = v2;

}

void __35__CKContextResponse_initWithCoder___block_invoke_9()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_50;
  initWithCoder__x_50 = v2;

}

void __35__CKContextResponse_initWithCoder___block_invoke_10()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_55;
  initWithCoder__x_55 = v2;

}

void __35__CKContextResponse_initWithCoder___block_invoke_11()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_61;
  initWithCoder__x_61 = v2;

}

+ (NSError)serviceDisabledError
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Feature is disabled or unavailable"), *MEMORY[0x1E0CB2D68]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.context"), 7, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v4;
}

+ (NSError)serviceBusyError
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Too many concurrent requests at this time"), *MEMORY[0x1E0CB2D68]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.context"), 6, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v4;
}

+ (NSError)missingEntitlementError
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Missing entitlement for request type"), *MEMORY[0x1E0CB2D68]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.context"), 3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v4;
}

+ (NSError)invalidProcessError
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("This process is not allowed request via internal API"), *MEMORY[0x1E0CB2D68]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.context"), 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v4;
}

+ (NSError)malformedRequestError
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Malformed request"), *MEMORY[0x1E0CB2D68]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.context"), 10, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v4;
}

+ (NSError)timeoutError
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Request timeout"), *MEMORY[0x1E0CB2D68]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.context"), 5, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v4;
}

- (BOOL)isPlaceholder
{
  return self->_uuid && !self->_results && self->_error == 0;
}

- (void)appendToDebug:(id)a3
{
  NSString *debug;
  NSString *v5;
  NSString *v6;

  debug = self->_debug;
  if (debug)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), debug, a3);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (NSString *)objc_msgSend(a3, "copy");
  }
  v6 = self->_debug;
  self->_debug = v5;

}

- (void)addDebug:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  NSString *v7;
  NSString *debug;
  uint64_t v9;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v9);

  if (self->_debug)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), self->_debug, v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (NSString *)objc_msgSend(v6, "copy");
  }
  debug = self->_debug;
  self->_debug = v7;

}

- (id)completer
{
  CKContextCompleter *v3;

  v3 = -[NSArray count](self->_results, "count");
  if (v3)
    v3 = -[CKContextCompleter initWithResponse:]([CKContextCompleter alloc], "initWithResponse:", self);
  return v3;
}

- (id)resultByQuery:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_results;
    v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "query", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CKContextResponse *v4;
  uint64_t v5;
  char v6;
  CKContextResponse *v7;
  unint64_t v8;
  NSString *uuid;
  uint64_t v10;
  void *v11;
  NSError *error;
  uint64_t v13;
  void *v14;
  NSArray *results;
  uint64_t v16;
  void *v17;
  NSString *languageTag;
  uint64_t v19;
  void *v20;
  NSString *debug;
  uint64_t v22;
  void *v23;

  v4 = (CKContextResponse *)a3;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_32;
  }
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    v8 = -[CKContextResponse hash](self, "hash");
    if (v8 != -[CKContextResponse hash](v7, "hash"))
    {
      v6 = 0;
LABEL_31:

      goto LABEL_32;
    }
    uuid = self->_uuid;
    -[CKContextResponse uuid](v7, "uuid");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (uuid)
    {
      if ((-[NSString isEqual:](uuid, "isEqual:", v10) & 1) != 0)
        goto LABEL_8;
    }
    else if (!v10)
    {
LABEL_8:
      error = self->_error;
      -[CKContextResponse error](v7, "error");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (error)
      {
        if ((-[NSError isEqual:](error, "isEqual:", v13) & 1) != 0)
          goto LABEL_10;
      }
      else if (!v13)
      {
LABEL_10:
        results = self->_results;
        -[CKContextResponse results](v7, "results");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (results)
        {
          if ((-[NSArray isEqual:](results, "isEqual:", v16) & 1) != 0)
            goto LABEL_12;
        }
        else if (!v16)
        {
LABEL_12:
          languageTag = self->_languageTag;
          -[CKContextResponse languageTag](v7, "languageTag");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          if (languageTag)
          {
            if ((-[NSString isEqual:](languageTag, "isEqual:", v19) & 1) != 0)
            {
LABEL_14:
              debug = self->_debug;
              -[CKContextResponse debug](v7, "debug");
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = (void *)v22;
              if (debug)
                v6 = -[NSString isEqual:](debug, "isEqual:", v22);
              else
                v6 = v22 == 0;

              goto LABEL_27;
            }
          }
          else if (!v19)
          {
            goto LABEL_14;
          }
          v6 = 0;
LABEL_27:

          goto LABEL_28;
        }
        v6 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v6 = 0;
LABEL_29:

      goto LABEL_30;
    }
    v6 = 0;
LABEL_30:

    goto LABEL_31;
  }
  v6 = 0;
LABEL_32:

  return v6;
}

- (unint64_t)hash
{
  return 31 * -[NSString hash](self->_uuid, "hash");
}

- (void)markResultsShown:(unint64_t)a3 serverOverride:(BOOL)a4 forInputLength:(unint64_t)a5 results:(id)a6
{
  NSArray **p_loggingCouldHaveShown;
  NSArray *v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int v15;
  NSArray *v16;
  unint64_t v17;
  BOOL *p_loggingServerOverride;
  int v19;
  unsigned __int8 v20;
  unint64_t v21;
  id v22;

  v22 = a6;
  atomic_store(1u, (unsigned __int8 *)&self->_shown);
  p_loggingCouldHaveShown = &self->_loggingCouldHaveShown;
  v12 = self->_loggingCouldHaveShown;
  objc_sync_enter(v12);
  if (v22)
  {
    objc_storeStrong((id *)&self->_loggingCouldHaveShown, a6);
    v13 = atomic_load(&self->_loggingShownMax);
    v14 = objc_msgSend(v22, "count");
    if (v14 <= v13)
      v15 = v13;
    else
      v15 = v14;
    atomic_store(v15, &self->_loggingCouldHaveShownMax);
  }
  else
  {
    v16 = *p_loggingCouldHaveShown;
    *p_loggingCouldHaveShown = 0;

  }
  objc_sync_exit(v12);

  v17 = atomic_load(&self->_loggingShownMax);
  if (v17 < a3)
    LODWORD(v17) = a3;
  atomic_store(v17, &self->_loggingShownMax);
  p_loggingServerOverride = &self->_loggingServerOverride;
  LOBYTE(v17) = atomic_load((unsigned __int8 *)&self->_loggingServerOverride);
LABEL_10:
  v19 = v17 & 1;
  v20 = v17 & 1 | a4;
  do
  {
    LODWORD(v17) = __ldaxr((unsigned __int8 *)p_loggingServerOverride);
    if ((_DWORD)v17 != v19)
    {
      __clrex();
      goto LABEL_10;
    }
  }
  while (__stlxr(v20, (unsigned __int8 *)p_loggingServerOverride));
  v21 = atomic_load(&self->_loggingInputLengthMax);
  if (v21 < a5)
    LODWORD(v21) = a5;
  atomic_store(v21, &self->_loggingInputLengthMax);

}

- (void)logEngagement:(id)a3 forInputLength:(unint64_t)a4 completion:(id)a5 likelyUnsolicited:(BOOL)a6
{
  id v10;
  id v11;
  unsigned __int8 v12;
  uint64_t v13;
  unsigned __int8 v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString *uuid;
  uint64_t v22;
  unint64_t requestType;
  BOOL v24;
  unint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = atomic_load((unsigned __int8 *)&self->_engaged);
  v13 = 1;
  if ((v12 & 1) == 0)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_engaged);
    v14 = atomic_load((unsigned __int8 *)&self->_engagementLogged);
    if ((v14 & 1) == 0)
    {
      v13 = 0;
      atomic_store(1u, (unsigned __int8 *)&self->_engagementLogged);
    }
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = self->_results;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v24 = a6;
    v25 = a4;
    v17 = 0;
    v18 = *(_QWORD *)v27;
    while (2)
    {
      v19 = 0;
      v20 = v17 + v16;
      do
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        if ((objc_msgSend(v10, "isEqual:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v19)) & 1) != 0)
        {
          v16 = v17 + v19 + 1;
          goto LABEL_14;
        }
        ++v19;
      }
      while (v16 != v19);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v17 = v20;
      if (v16)
        continue;
      break;
    }
LABEL_14:
    a4 = v25;
    a6 = v24;
  }

  uuid = self->_uuid;
  v22 = objc_msgSend(v11, "length");
  if (self->_requestType == 1 && a6)
    requestType = 15;
  else
    requestType = self->_requestType;
  +[CKContextRequest logEngagementForResponseId:result:rank:inputLength:completionLength:requestType:logType:](CKContextRequest, "logEngagementForResponseId:result:rank:inputLength:completionLength:requestType:logType:", uuid, v10, v16, a4, v22, requestType, v13);

}

- (void)logTransactionSuccessfulForInputLength:(unint64_t)a3 completion:(id)a4 likelyUnsolicited:(BOOL)a5
{
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 v10;
  NSString *uuid;
  uint64_t v12;
  unint64_t requestType;

  v8 = atomic_load((unsigned __int8 *)&self->_transactionSuccessful);
  v9 = 1;
  if ((v8 & 1) == 0)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_transactionSuccessful);
    v10 = atomic_load((unsigned __int8 *)&self->_transactionLogged);
    if ((v10 & 1) == 0)
    {
      v9 = 0;
      atomic_store(1u, (unsigned __int8 *)&self->_transactionLogged);
    }
  }
  uuid = self->_uuid;
  v12 = objc_msgSend(a4, "length");
  if (self->_requestType == 1 && a5)
    requestType = 15;
  else
    requestType = self->_requestType;
  +[CKContextRequest logTransactionSuccessfulForResponseId:inputLength:completionLength:requestType:logType:](CKContextRequest, "logTransactionSuccessfulForResponseId:inputLength:completionLength:requestType:logType:", uuid, a3, v12, requestType, v9);
}

- (void)discardAndLogCompleter:(id)a3 likelyUnsolicited:(BOOL)a4
{
  id v6;
  unsigned __int8 v7;
  NSArray *v8;
  NSArray *loggingCouldHaveShown;
  void *v10;
  void *v11;
  void *v12;
  BOOL *p_shownLogged;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t requestType;
  id v21;

  v6 = a3;
  v7 = atomic_load((unsigned __int8 *)&self->_shown);
  if ((v7 & 1) != 0)
  {
    v21 = v6;
    v8 = self->_loggingCouldHaveShown;
    objc_sync_enter(v8);
    loggingCouldHaveShown = self->_loggingCouldHaveShown;
    if (loggingCouldHaveShown)
    {
      -[NSArray valueForKey:](loggingCouldHaveShown, "valueForKey:", CFSTR("topicId"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF != nil"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "filteredArrayUsingPredicate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    objc_sync_exit(v8);

    p_shownLogged = &self->_shownLogged;
    do
      v14 = __ldaxr((unsigned __int8 *)p_shownLogged);
    while (__stlxr(1u, (unsigned __int8 *)p_shownLogged));
    v15 = atomic_load(&self->_loggingShownMax);
    v16 = atomic_load(&self->_loggingCouldHaveShownMax);
    v17 = atomic_load((unsigned __int8 *)&self->_loggingServerOverride);
    v18 = v17 & 1;
    v19 = atomic_load(&self->_loggingInputLengthMax);
    requestType = self->_requestType;
    if (requestType == 1 && a4)
      requestType = 15;
    +[CKContextRequest logResultsShownForResponseId:shown:couldHaveShown:topicIds:serverOverride:inputLength:requestType:logType:](CKContextRequest, "logResultsShownForResponseId:shown:couldHaveShown:topicIds:serverOverride:inputLength:requestType:logType:", self->_uuid, v15, v16, v12, v18, v19, requestType, v14 & 1);

    v6 = v21;
  }

}

- (id)responseSummary:(BOOL)a3 showHigherLevelTopics:(BOOL)a4 maxPrefix:(int64_t)a5
{
  id v7;
  void *v8;
  double height;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  NSArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t k;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t m;
  uint64_t v84;
  _BOOL4 v86;
  CKContextResponse *v87;
  uint64_t v88;
  int64_t v89;
  id v90;
  NSArray *v91;
  NSArray *obj;
  id obja;
  uint64_t v94;
  uint64_t v95;
  _BOOL4 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v86 = a4;
  v96 = a3;
  v122 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "appendFormat:", CFSTR("Number of results: %lu\n"), -[NSArray count](self->_results, "count"));
  if (-[NSArray count](self->_donorBundleIdentifiers, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_donorBundleIdentifiers, "componentsJoinedByString:", CFSTR(", "));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("Donor bundle identifiers: %@"), v8);

  }
  objc_msgSend(v7, "appendString:", CFSTR("\n"));
  height = self->_availableLayoutSize.height;
  if (self->_availableLayoutSize.width != 0.0 || height != 0.0)
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("Available layout size: (%.f, %.f)"), *(_QWORD *)&self->_availableLayoutSize.width, *(_QWORD *)&height);
    objc_msgSend(v7, "appendString:", CFSTR("\n"));
  }
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v87 = self;
  obj = self->_results;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v113, v121, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v114;
    v88 = *(_QWORD *)v114;
    v89 = a5;
    do
    {
      v13 = 0;
      v90 = (id)v11;
      do
      {
        if (*(_QWORD *)v114 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v13);
        if (objc_msgSend(v14, "minPrefix") <= a5)
        {
          v94 = v13;
          objc_msgSend(v14, "title");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", CFSTR("* %@\n"), v15);

          if (v96)
          {
            objc_msgSend(v14, "topicId");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("  %@\n"), v16);

          }
          objc_msgSend(v14, "url");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v14, "url");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("  %@\n"), v18);

          }
          objc_msgSend(v14, "category");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v14, "category");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("  %@\n"), v20);

          }
          objc_msgSend(v14, "debug");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v14, "debug");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("  %@\n"), v22);

          }
          objc_msgSend(v14, "tags");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v14, "tags");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("  tags: %@\n"), v24);

          }
          objc_msgSend(v14, "relatedItems");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v14, "relatedItems");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("  relatedItems: %@\n"), v26);

          }
          objc_msgSend(v14, "associatedResults");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("  associatedResults: {\n"));
            v111 = 0u;
            v112 = 0u;
            v109 = 0u;
            v110 = 0u;
            objc_msgSend(v14, "associatedResults");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v109, v120, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v110;
              do
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v110 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
                  v34 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v33, "frameInWindow");
                  v36 = v35;
                  objc_msgSend(v33, "frameInWindow");
                  v38 = v37;
                  objc_msgSend(v33, "absoluteOriginOnScreen");
                  v40 = v39;
                  objc_msgSend(v33, "absoluteOriginOnScreen");
                  v42 = v41;
                  objc_msgSend(v33, "frameInWindow");
                  v44 = v43;
                  objc_msgSend(v33, "frameInWindow");
                  v46 = v45;
                  v47 = objc_msgSend(v33, "isOnScreen");
                  v48 = CFSTR("NO");
                  if (v47)
                    v48 = CFSTR("YES");
                  objc_msgSend(v34, "stringWithFormat:", CFSTR("Origin:(%.f, %.f), AbsoluteOrigin:(%.f,%.f), Size:(%.f, %.f), On Screen:%@"), v36, v38, v40, v42, v44, v46, v48);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "title");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "appendFormat:", CFSTR("\t %@\t|| %@\n"), v50, v49);

                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v109, v120, 16);
              }
              while (v30);
            }

            objc_msgSend(v7, "appendFormat:", CFSTR("}\n"));
            a5 = v89;
            v11 = (uint64_t)v90;
            v12 = v88;
          }
          objc_msgSend(v7, "appendString:", CFSTR("\n"));
          v13 = v94;
        }
        ++v13;
      }
      while (v13 != v11);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v113, v121, 16);
    }
    while (v11);
  }

  if (v86)
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("Number of level-1 topics: %lu\n\n"), -[NSArray count](v87->_level1Topics, "count"));
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v51 = v87->_level1Topics;
    v52 = -[NSArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v106;
      do
      {
        for (j = 0; j != v53; ++j)
        {
          if (*(_QWORD *)v106 != v54)
            objc_enumerationMutation(v51);
          v56 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * j);
          objc_msgSend(v56, "title");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", CFSTR("= %@\n"), v57);

          if (v96)
          {
            objc_msgSend(v56, "topicId");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("  %@\n"), v58);

          }
          objc_msgSend(v56, "url");
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          if (v59)
          {
            objc_msgSend(v56, "url");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("  %@\n"), v60);

          }
          objc_msgSend(v56, "category");
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          if (v61)
          {
            objc_msgSend(v56, "category");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("  %@\n"), v62);

          }
          objc_msgSend(v56, "debug");
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          if (v63)
          {
            objc_msgSend(v56, "debug");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("  %@\n"), v64);

          }
          objc_msgSend(v56, "relatedItems");
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          if (v65)
          {
            objc_msgSend(v56, "relatedItems");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("  relatedItems: %@\n"), v66);

          }
          objc_msgSend(v7, "appendString:", CFSTR("\n"));
        }
        v53 = -[NSArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
      }
      while (v53);
    }

    objc_msgSend(v7, "appendFormat:", CFSTR("Number of level-2 topics: %lu\n\n"), -[NSArray count](v87->_level2Topics, "count"));
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v91 = v87->_level2Topics;
    v95 = -[NSArray countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v101, v118, 16);
    if (v95)
    {
      obja = *(id *)v102;
      do
      {
        for (k = 0; k != v95; ++k)
        {
          if (*(id *)v102 != obja)
            objc_enumerationMutation(v91);
          v68 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * k);
          objc_msgSend(v68, "title");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", CFSTR("= %@\n"), v69);

          if (v96)
          {
            objc_msgSend(v68, "topicId");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("  %@\n"), v70);

          }
          objc_msgSend(v68, "url");
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          if (v71)
          {
            objc_msgSend(v68, "url");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("  %@\n"), v72);

          }
          objc_msgSend(v68, "category");
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          if (v73)
          {
            objc_msgSend(v68, "category");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("  %@\n"), v74);

          }
          objc_msgSend(v68, "debug");
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          if (v75)
          {
            objc_msgSend(v68, "debug");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("  %@\n"), v76);

          }
          objc_msgSend(v68, "relatedItems");
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          if (v77)
          {
            objc_msgSend(v7, "appendString:", CFSTR("  relatedItems: ["));
            v99 = 0u;
            v100 = 0u;
            v97 = 0u;
            v98 = 0u;
            objc_msgSend(v68, "relatedItems");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v97, v117, 16);
            if (v79)
            {
              v80 = v79;
              v81 = *(_QWORD *)v98;
              v82 = 1;
              do
              {
                for (m = 0; m != v80; ++m)
                {
                  if (*(_QWORD *)v98 != v81)
                    objc_enumerationMutation(v78);
                  v84 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * m);
                  if ((v82 & 1) == 0)
                    objc_msgSend(v7, "appendString:", CFSTR(", "));
                  objc_msgSend(v7, "appendFormat:", CFSTR("%@"), v84);
                  v82 = 0;
                }
                v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v97, v117, 16);
                v82 = 0;
              }
              while (v80);
            }

            objc_msgSend(v7, "appendString:", CFSTR("]\n"));
          }
          objc_msgSend(v7, "appendString:", CFSTR("\n"));
        }
        v95 = -[NSArray countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v101, v118, 16);
      }
      while (v95);
    }

  }
  return v7;
}

- (id)toJSONSerializableDictionary
{
  id v3;
  NSError *error;
  void *v5;
  NSError *v6;
  void *v7;
  NSArray *results;
  void *v9;
  NSArray *level1Topics;
  void *v11;
  NSArray *level2Topics;
  void *v13;
  NSArray *donorBundleIdentifiers;
  NSString *languageTag;
  NSString *debug;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_uuid, CFSTR("uuid"));
  error = self->_error;
  if (error)
  {
    -[NSError description](error, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("error"));

    v6 = self->_error;
    if (v6)
    {
      -[NSError description](v6, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("error"));

    }
  }
  results = self->_results;
  if (results)
  {
    -[NSArray valueForKey:](results, "valueForKey:", CFSTR("toJSONSerializableDictionary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("results"));

  }
  level1Topics = self->_level1Topics;
  if (level1Topics)
  {
    -[NSArray valueForKey:](level1Topics, "valueForKey:", CFSTR("toJSONSerializableDictionary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("level1Topics"));

  }
  level2Topics = self->_level2Topics;
  if (level2Topics)
  {
    -[NSArray valueForKey:](level2Topics, "valueForKey:", CFSTR("toJSONSerializableDictionary"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("level2Topics"));

  }
  donorBundleIdentifiers = self->_donorBundleIdentifiers;
  if (donorBundleIdentifiers)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", donorBundleIdentifiers, CFSTR("donorBundleIdentifiers"));
  languageTag = self->_languageTag;
  if (languageTag)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", languageTag, CFSTR("languageTag"));
  debug = self->_debug;
  if (debug)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", debug, CFSTR("debug"));
  return v3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSArray)donorBundleIdentifiers
{
  return self->_donorBundleIdentifiers;
}

- (void)setDonorBundleIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_donorBundleIdentifiers, a3);
}

- (NSString)languageTag
{
  return self->_languageTag;
}

- (void)setLanguageTag:(id)a3
{
  objc_storeStrong((id *)&self->_languageTag, a3);
}

- (NSString)debug
{
  return self->_debug;
}

- (void)setDebug:(id)a3
{
  objc_storeStrong((id *)&self->_debug, a3);
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (CGSize)availableLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_availableLayoutSize.width;
  height = self->_availableLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSDictionary)partsOfSpeechToTexts
{
  return self->_partsOfSpeechToTexts;
}

- (void)setPartsOfSpeechToTexts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (CKContextFingerprintMinHash)requestFingerprint
{
  return self->_requestFingerprint;
}

- (void)setRequestFingerprint:(id)a3
{
  objc_storeStrong((id *)&self->_requestFingerprint, a3);
}

- (BOOL)resultsNeedFiltering
{
  return self->_resultsNeedFiltering;
}

- (void)setResultsNeedFiltering:(BOOL)a3
{
  self->_resultsNeedFiltering = a3;
}

- (unint64_t)mustPrefixMatchLength
{
  return self->_mustPrefixMatchLength;
}

- (void)setMustPrefixMatchLength:(unint64_t)a3
{
  self->_mustPrefixMatchLength = a3;
}

- (NSDate)hideCompletionsAfterDate
{
  return self->_hideCompletionsAfterDate;
}

- (void)setHideCompletionsAfterDate:(id)a3
{
  objc_storeStrong((id *)&self->_hideCompletionsAfterDate, a3);
}

- (NSDate)responseDate
{
  return self->_responseDate;
}

- (void)setResponseDate:(id)a3
{
  objc_storeStrong((id *)&self->_responseDate, a3);
}

- (CKContextRequest)debugRequest
{
  return self->_debugRequest;
}

- (void)setDebugRequest:(id)a3
{
  objc_storeStrong((id *)&self->_debugRequest, a3);
}

@end
