@implementation ATXStackSystemSuggestTrackingContext

- (ATXStackSystemSuggestTrackingContext)init
{
  void *v3;
  void *v4;
  ATXStackSystemSuggestTrackingContext *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[ATXStackSystemSuggestTrackingContext initWithRotationSessionManager:systemSuggestBlendingCaches:](self, "initWithRotationSessionManager:systemSuggestBlendingCaches:", v3, v4);

  return v5;
}

- (ATXStackSystemSuggestTrackingContext)initWithRotationSessionManager:(id)a3 systemSuggestBlendingCaches:(id)a4
{
  id v7;
  id v8;
  ATXStackSystemSuggestTrackingContext *v9;
  ATXStackSystemSuggestTrackingContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXStackSystemSuggestTrackingContext;
  v9 = -[ATXStackSystemSuggestTrackingContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionManager, a3);
    objc_storeStrong((id *)&v10->_systemSuggestBlendingCaches, a4);
  }

  return v10;
}

- (void)updateWithUIEvent:(id)a3
{
  -[ATXStackRotationSessionManager updateWithUIEvent:](self->_sessionManager, "updateWithUIEvent:", a3);
}

- (id)removeAllAndReturnCompletedSystemSuggestSessions
{
  return -[ATXStackRotationSessionManager removeAllAndReturnCompletedSystemSuggestSessions](self->_sessionManager, "removeAllAndReturnCompletedSystemSuggestSessions");
}

- (id)blendingCacheWithUUID:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *systemSuggestBlendingCaches;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    systemSuggestBlendingCaches = self->_systemSuggestBlendingCaches;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__ATXStackSystemSuggestTrackingContext_blendingCacheWithUUID___block_invoke;
    v10[3] = &unk_1E82E9BF0;
    v11 = v4;
    -[NSMutableArray _pas_filteredArrayWithTest:](systemSuggestBlendingCaches, "_pas_filteredArrayWithTest:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __62__ATXStackSystemSuggestTrackingContext_blendingCacheWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)updateWithBlendingUICacheUpdate:(id)a3
{
  -[ATXStackRotationSessionManager updateWithBlendingUICacheUpdate:](self->_sessionManager, "updateWithBlendingUICacheUpdate:", a3);
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[ATXStackRotationSessionManager hash](self->_sessionManager, "hash");
  return -[NSMutableArray hash](self->_systemSuggestBlendingCaches, "hash") - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXStackSystemSuggestTrackingContext *v4;
  ATXStackSystemSuggestTrackingContext *v5;
  BOOL v6;

  v4 = (ATXStackSystemSuggestTrackingContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXStackSystemSuggestTrackingContext isEqualToATXStackSystemSuggestTrackingContext:](self, "isEqualToATXStackSystemSuggestTrackingContext:", v5);

  return v6;
}

- (BOOL)isEqualToATXStackSystemSuggestTrackingContext:(id)a3
{
  id *v4;
  ATXStackRotationSessionManager *sessionManager;
  ATXStackRotationSessionManager *v6;
  ATXStackRotationSessionManager *v7;
  ATXStackRotationSessionManager *v8;
  BOOL v9;
  char v10;
  NSMutableArray *v11;
  NSMutableArray *v12;

  v4 = (id *)a3;
  sessionManager = self->_sessionManager;
  v6 = (ATXStackRotationSessionManager *)v4[1];
  if (sessionManager == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = sessionManager;
    v9 = -[ATXStackRotationSessionManager isEqual:](v8, "isEqual:", v7);

    if (!v9)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_systemSuggestBlendingCaches;
  v12 = v11;
  if (v11 == v4[2])
    v10 = 1;
  else
    v10 = -[NSMutableArray isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ATXStackRotationSessionManager *sessionManager;
  id v5;

  sessionManager = self->_sessionManager;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionManager, CFSTR("sessionManager"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemSuggestBlendingCaches, CFSTR("blendingCaches"));

}

- (ATXStackSystemSuggestTrackingContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXStackSystemSuggestTrackingContext *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_metrics();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("sessionManager"), v4, 1, CFSTR("com.apple.proactive.StackRotationStatus"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1CAA48B6C]();
    v12 = objc_alloc(MEMORY[0x1E0C99E60]);
    v13 = objc_opt_class();
    v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v11);
    v15 = (void *)MEMORY[0x1E0D81610];
    __atxlog_handle_metrics();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("blendingCaches"), v4, 1, CFSTR("com.apple.proactive.StackRotationStatus"), -1, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v10 = 0;
    }
    else
    {
      self = -[ATXStackSystemSuggestTrackingContext initWithRotationSessionManager:systemSuggestBlendingCaches:](self, "initWithRotationSessionManager:systemSuggestBlendingCaches:", v8, v17);
      v10 = self;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (ATXStackRotationSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (NSMutableArray)systemSuggestBlendingCaches
{
  return self->_systemSuggestBlendingCaches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemSuggestBlendingCaches, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
}

@end
