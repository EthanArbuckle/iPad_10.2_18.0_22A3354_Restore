@implementation ATXBlendingBiomeStreamLoggerContext

- (ATXBlendingBiomeStreamLoggerContext)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXBlendingBiomeStreamLoggerContext *v7;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = -[ATXBlendingBiomeStreamLoggerContext initWithSessionTrackingContext:cacheUpdateContext:stackSuggestTrackingContext:screenLogUnlockSessionContext:](self, "initWithSessionTrackingContext:cacheUpdateContext:stackSuggestTrackingContext:screenLogUnlockSessionContext:", v3, v4, v5, v6);

  return v7;
}

- (ATXBlendingBiomeStreamLoggerContext)initWithSessionTrackingContext:(id)a3 cacheUpdateContext:(id)a4 stackSuggestTrackingContext:(id)a5 screenLogUnlockSessionContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXBlendingBiomeStreamLoggerContext *v15;
  ATXBlendingBiomeStreamLoggerContext *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXBlendingBiomeStreamLoggerContext;
  v15 = -[ATXBlendingBiomeStreamLoggerContext init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionTrackingContext, a3);
    objc_storeStrong((id *)&v16->_cacheUpdateContext, a4);
    objc_storeStrong((id *)&v16->_stackSuggestTrackingContext, a5);
    objc_storeStrong((id *)&v16->_screenLogUnlockSessionContext, a6);
  }

  return v16;
}

- (void)updateWithClientModelCacheUpdate:(id)a3
{
  ATXSingleSuggestionSessionTrackingContext *sessionTrackingContext;
  id v5;

  sessionTrackingContext = self->_sessionTrackingContext;
  v5 = a3;
  -[ATXSingleSuggestionSessionTrackingContext updateWithClientModelCacheUpdate:](sessionTrackingContext, "updateWithClientModelCacheUpdate:", v5);
  -[ATXBiomeStreamCacheUpdateContext updateWithClientModelCacheUpdate:](self->_cacheUpdateContext, "updateWithClientModelCacheUpdate:", v5);
  -[ATXStackSystemSuggestTrackingContext updateWithClientModelCacheUpdate:](self->_stackSuggestTrackingContext, "updateWithClientModelCacheUpdate:", v5);
  -[ATXScreenLogUnlockSessionContext updateWithClientModelCacheUpdate:](self->_screenLogUnlockSessionContext, "updateWithClientModelCacheUpdate:", v5);

}

- (void)updateWithBlendingUICacheUpdate:(id)a3
{
  ATXSingleSuggestionSessionTrackingContext *sessionTrackingContext;
  id v5;

  sessionTrackingContext = self->_sessionTrackingContext;
  v5 = a3;
  -[ATXSingleSuggestionSessionTrackingContext updateWithBlendingUICacheUpdate:](sessionTrackingContext, "updateWithBlendingUICacheUpdate:", v5);
  -[ATXBiomeStreamCacheUpdateContext updateWithBlendingUICacheUpdate:](self->_cacheUpdateContext, "updateWithBlendingUICacheUpdate:", v5);
  -[ATXStackSystemSuggestTrackingContext updateWithBlendingUICacheUpdate:](self->_stackSuggestTrackingContext, "updateWithBlendingUICacheUpdate:", v5);
  -[ATXScreenLogUnlockSessionContext updateWithBlendingUICacheUpdate:](self->_screenLogUnlockSessionContext, "updateWithBlendingUICacheUpdate:", v5);

}

- (void)updateWithUIEvent:(id)a3
{
  ATXSingleSuggestionSessionTrackingContext *sessionTrackingContext;
  id v5;

  sessionTrackingContext = self->_sessionTrackingContext;
  v5 = a3;
  -[ATXSingleSuggestionSessionTrackingContext updateWithUIEvent:](sessionTrackingContext, "updateWithUIEvent:", v5);
  -[ATXBiomeStreamCacheUpdateContext updateWithUIEvent:](self->_cacheUpdateContext, "updateWithUIEvent:", v5);
  -[ATXStackSystemSuggestTrackingContext updateWithUIEvent:](self->_stackSuggestTrackingContext, "updateWithUIEvent:", v5);
  -[ATXScreenLogUnlockSessionContext updateWithUIEvent:](self->_screenLogUnlockSessionContext, "updateWithUIEvent:", v5);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  ATXSingleSuggestionSessionTrackingContext *sessionTrackingContext;
  id v5;

  sessionTrackingContext = self->_sessionTrackingContext;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionTrackingContext, CFSTR("sessionTrackingContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cacheUpdateContext, CFSTR("cacheUpdateContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stackSuggestTrackingContext, CFSTR("systemSuggestContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_screenLogUnlockSessionContext, CFSTR("screenLogUnlockContext"));

}

- (ATXBlendingBiomeStreamLoggerContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXBlendingBiomeStreamLoggerContext *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionTrackingContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXBlendingBiomeStreamLoggerContext checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v5, CFSTR("sessionTrackingContext"), v4, CFSTR("com.apple.duetexpertd.ATXBlendingBiomeStreamLoggerContext"), -1))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cacheUpdateContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ATXBlendingBiomeStreamLoggerContext checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v7, CFSTR("cacheUpdateContext"), v4, CFSTR("com.apple.duetexpertd.ATXBlendingBiomeStreamLoggerContext"), -1))
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemSuggestContext"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ATXBlendingBiomeStreamLoggerContext checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v8, CFSTR("systemSuggestContext"), v4, CFSTR("com.apple.duetexpertd.ATXBlendingBiomeStreamLoggerContext"), -1))
      {
        v6 = 0;
      }
      else
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("screenLogUnlockContext"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[ATXBlendingBiomeStreamLoggerContext checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v9, CFSTR("screenLogUnlockContext"), v4, CFSTR("com.apple.duetexpertd.ATXBlendingBiomeStreamLoggerContext"), -1))
        {
          v6 = 0;
        }
        else
        {
          self = -[ATXBlendingBiomeStreamLoggerContext initWithSessionTrackingContext:cacheUpdateContext:stackSuggestTrackingContext:screenLogUnlockSessionContext:](self, "initWithSessionTrackingContext:cacheUpdateContext:stackSuggestTrackingContext:screenLogUnlockSessionContext:", v5, v7, v8, v9);
          v6 = self;
        }

      }
    }

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ATXBlendingBiomeStreamLoggerContext *v4;
  ATXBlendingBiomeStreamLoggerContext *v5;
  BOOL v6;

  v4 = (ATXBlendingBiomeStreamLoggerContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXBlendingBiomeStreamLoggerContext isEqualToATXBlendingBiomeStreamLoggerContext:](self, "isEqualToATXBlendingBiomeStreamLoggerContext:", v5);

  return v6;
}

- (BOOL)isEqualToATXBlendingBiomeStreamLoggerContext:(id)a3
{
  id *v4;
  ATXSingleSuggestionSessionTrackingContext *sessionTrackingContext;
  ATXSingleSuggestionSessionTrackingContext *v6;
  ATXSingleSuggestionSessionTrackingContext *v7;
  ATXSingleSuggestionSessionTrackingContext *v8;
  BOOL v9;
  ATXBiomeStreamCacheUpdateContext *cacheUpdateContext;
  ATXBiomeStreamCacheUpdateContext *v11;
  ATXBiomeStreamCacheUpdateContext *v12;
  ATXBiomeStreamCacheUpdateContext *v13;
  BOOL v14;
  ATXStackSystemSuggestTrackingContext *stackSuggestTrackingContext;
  ATXStackSystemSuggestTrackingContext *v16;
  ATXStackSystemSuggestTrackingContext *v17;
  ATXStackSystemSuggestTrackingContext *v18;
  BOOL v19;
  char v20;
  ATXScreenLogUnlockSessionContext *v21;
  ATXScreenLogUnlockSessionContext *v22;

  v4 = (id *)a3;
  sessionTrackingContext = self->_sessionTrackingContext;
  v6 = (ATXSingleSuggestionSessionTrackingContext *)v4[1];
  if (sessionTrackingContext == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = sessionTrackingContext;
    v9 = -[ATXSingleSuggestionSessionTrackingContext isEqual:](v8, "isEqual:", v7);

    if (!v9)
      goto LABEL_11;
  }
  cacheUpdateContext = self->_cacheUpdateContext;
  v11 = (ATXBiomeStreamCacheUpdateContext *)v4[2];
  if (cacheUpdateContext == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = cacheUpdateContext;
    v14 = -[ATXBiomeStreamCacheUpdateContext isEqual:](v13, "isEqual:", v12);

    if (!v14)
      goto LABEL_11;
  }
  stackSuggestTrackingContext = self->_stackSuggestTrackingContext;
  v16 = (ATXStackSystemSuggestTrackingContext *)v4[3];
  if (stackSuggestTrackingContext == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = stackSuggestTrackingContext;
    v19 = -[ATXStackSystemSuggestTrackingContext isEqual:](v18, "isEqual:", v17);

    if (!v19)
    {
LABEL_11:
      v20 = 0;
      goto LABEL_17;
    }
  }
  v21 = self->_screenLogUnlockSessionContext;
  v22 = v21;
  if (v21 == v4[4])
    v20 = 1;
  else
    v20 = -[ATXScreenLogUnlockSessionContext isEqual:](v21, "isEqual:");

LABEL_17:
  return v20;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[ATXSingleSuggestionSessionTrackingContext hash](self->_sessionTrackingContext, "hash");
  v4 = -[ATXBiomeStreamCacheUpdateContext hash](self->_cacheUpdateContext, "hash") - v3 + 32 * v3;
  v5 = -[ATXStackSystemSuggestTrackingContext hash](self->_stackSuggestTrackingContext, "hash") - v4 + 32 * v4;
  return -[ATXScreenLogUnlockSessionContext hash](self->_screenLogUnlockSessionContext, "hash") - v5 + 32 * v5;
}

- (ATXSingleSuggestionSessionTrackingContext)sessionTrackingContext
{
  return self->_sessionTrackingContext;
}

- (void)setSessionTrackingContext:(id)a3
{
  objc_storeStrong((id *)&self->_sessionTrackingContext, a3);
}

- (ATXBiomeStreamCacheUpdateContext)cacheUpdateContext
{
  return self->_cacheUpdateContext;
}

- (void)setCacheUpdateContext:(id)a3
{
  objc_storeStrong((id *)&self->_cacheUpdateContext, a3);
}

- (ATXStackSystemSuggestTrackingContext)stackSuggestTrackingContext
{
  return self->_stackSuggestTrackingContext;
}

- (void)setStackSuggestTrackingContext:(id)a3
{
  objc_storeStrong((id *)&self->_stackSuggestTrackingContext, a3);
}

- (ATXScreenLogUnlockSessionContext)screenLogUnlockSessionContext
{
  return self->_screenLogUnlockSessionContext;
}

- (void)setScreenLogUnlockSessionContext:(id)a3
{
  objc_storeStrong((id *)&self->_screenLogUnlockSessionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenLogUnlockSessionContext, 0);
  objc_storeStrong((id *)&self->_stackSuggestTrackingContext, 0);
  objc_storeStrong((id *)&self->_cacheUpdateContext, 0);
  objc_storeStrong((id *)&self->_sessionTrackingContext, 0);
}

@end
