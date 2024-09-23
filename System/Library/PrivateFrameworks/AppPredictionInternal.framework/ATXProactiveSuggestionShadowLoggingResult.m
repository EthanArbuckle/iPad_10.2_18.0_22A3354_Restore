@implementation ATXProactiveSuggestionShadowLoggingResult

- (ATXProactiveSuggestionShadowLoggingResult)initWithShadowEvent:(id)a3 shadowEventDate:(id)a4 clientModelCacheUpdate:(id)a5 context:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXProactiveSuggestionShadowLoggingResult *v15;
  ATXProactiveSuggestionShadowLoggingResult *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXProactiveSuggestionShadowLoggingResult;
  v15 = -[ATXProactiveSuggestionShadowLoggingResult init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_shadowEvent, a3);
    objc_storeStrong((id *)&v16->_shadowEventDate, a4);
    objc_storeStrong((id *)&v16->_clientModelCacheUpdate, a5);
    objc_storeStrong((id *)&v16->_context, a6);
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  ATXProactiveSuggestionShadowLoggingResult *v4;
  ATXProactiveSuggestionShadowLoggingResult *v5;
  BOOL v6;

  v4 = (ATXProactiveSuggestionShadowLoggingResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXProactiveSuggestionShadowLoggingResult isEqualToATXProactiveSuggestionShadowLoggingResult:](self, "isEqualToATXProactiveSuggestionShadowLoggingResult:", v5);

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionShadowLoggingResult:(id)a3
{
  id *v4;
  BMStoreData *shadowEvent;
  BMStoreData *v6;
  BMStoreData *v7;
  BMStoreData *v8;
  char v9;
  NSDate *shadowEventDate;
  NSDate *v11;
  NSDate *v12;
  NSDate *v13;
  char v14;
  ATXClientModelCacheUpdate *clientModelCacheUpdate;
  ATXClientModelCacheUpdate *v16;
  ATXClientModelCacheUpdate *v17;
  ATXClientModelCacheUpdate *v18;
  char v19;
  char v20;
  ATXPredictionContext *v21;
  ATXPredictionContext *v22;

  v4 = (id *)a3;
  shadowEvent = self->_shadowEvent;
  v6 = (BMStoreData *)v4[1];
  if (shadowEvent == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = shadowEvent;
    v9 = -[BMStoreData isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_11;
  }
  shadowEventDate = self->_shadowEventDate;
  v11 = (NSDate *)v4[2];
  if (shadowEventDate == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = shadowEventDate;
    v14 = -[NSDate isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_11;
  }
  clientModelCacheUpdate = self->_clientModelCacheUpdate;
  v16 = (ATXClientModelCacheUpdate *)v4[3];
  if (clientModelCacheUpdate == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = clientModelCacheUpdate;
    v19 = -[ATXClientModelCacheUpdate isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
    {
LABEL_11:
      v20 = 0;
      goto LABEL_17;
    }
  }
  v21 = self->_context;
  v22 = v21;
  if (v21 == v4[4])
    v20 = 1;
  else
    v20 = -[ATXPredictionContext isEqual:](v21, "isEqual:");

LABEL_17:
  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[BMStoreData hash](self->_shadowEvent, "hash");
  v4 = -[NSDate hash](self->_shadowEventDate, "hash") - v3 + 32 * v3;
  v5 = -[ATXClientModelCacheUpdate hash](self->_clientModelCacheUpdate, "hash") - v4 + 32 * v4;
  return -[ATXPredictionContext hash](self->_context, "hash") - v5 + 32 * v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BMStoreData *shadowEvent;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  shadowEvent = self->_shadowEvent;
  v9 = a3;
  -[BMStoreData serialize](shadowEvent, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("shadowEvent"));

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("shadowEventClassName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMStoreData dataVersion](self->_shadowEvent, "dataVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("shadowEventDataVersion"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_shadowEventDate, CFSTR("shadowEventDate"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_clientModelCacheUpdate, CFSTR("clientCache"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_context, CFSTR("context"));

}

- (ATXProactiveSuggestionShadowLoggingResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  Class v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  ATXProactiveSuggestionShadowLoggingResult *v31;
  void *v33;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_blending_ecosystem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("shadowEvent"), v4, 1, CFSTR("com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingResult"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D81610];
    v10 = objc_opt_class();
    __atxlog_handle_blending_ecosystem();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("shadowEventClassName"), v4, 1, CFSTR("com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingResult"), -1, v11);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0D81610];
      v14 = objc_opt_class();
      __atxlog_handle_blending_ecosystem();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("shadowEventDataVersion"), v4, 1, CFSTR("com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingResult"), -1, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 && (v17 = NSClassFromString(v12)) != 0)
      {
        -[objc_class eventWithData:dataVersion:](v17, "eventWithData:dataVersion:", v8, objc_msgSend(v16, "unsignedIntValue"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)MEMORY[0x1E0D81610];
          v20 = objc_opt_class();
          __atxlog_handle_blending_ecosystem();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v20, CFSTR("shadowEventDate"), v4, 1, CFSTR("com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingResult"), -1, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            v33 = v22;
            v23 = (void *)MEMORY[0x1E0D81610];
            v24 = objc_opt_class();
            __atxlog_handle_blending_ecosystem();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v24, CFSTR("clientCache"), v4, 1, CFSTR("com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingResult"), -1, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              v27 = (void *)MEMORY[0x1E0D81610];
              v28 = objc_opt_class();
              __atxlog_handle_blending_ecosystem();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v28, CFSTR("context"), v4, 1, CFSTR("com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingResult"), -1, v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (v30)
              {
                v22 = v33;
                self = -[ATXProactiveSuggestionShadowLoggingResult initWithShadowEvent:shadowEventDate:clientModelCacheUpdate:context:](self, "initWithShadowEvent:shadowEventDate:clientModelCacheUpdate:context:", v18, v33, v26, v30);
                v31 = self;
              }
              else
              {
                v31 = 0;
                v22 = v33;
              }

            }
            else
            {
              v31 = 0;
              v22 = v33;
            }

          }
          else
          {
            v31 = 0;
          }

        }
        else
        {
          v31 = 0;
        }

      }
      else
      {
        v31 = 0;
      }

    }
    else
    {
      v31 = 0;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (BMStoreData)shadowEvent
{
  return self->_shadowEvent;
}

- (NSDate)shadowEventDate
{
  return self->_shadowEventDate;
}

- (ATXClientModelCacheUpdate)clientModelCacheUpdate
{
  return self->_clientModelCacheUpdate;
}

- (ATXPredictionContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_clientModelCacheUpdate, 0);
  objc_storeStrong((id *)&self->_shadowEventDate, 0);
  objc_storeStrong((id *)&self->_shadowEvent, 0);
}

@end
