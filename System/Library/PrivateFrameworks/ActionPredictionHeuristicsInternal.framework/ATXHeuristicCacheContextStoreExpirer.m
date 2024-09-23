@implementation ATXHeuristicCacheContextStoreExpirer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_contextKeyPath, 0);
}

- (void)_stop
{
  void *v3;
  _CDContextualChangeRegistration *registration;

  if (self->_registration)
  {
    objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deregisterCallback:", self->_registration);

    registration = self->_registration;
    self->_registration = 0;

  }
}

- (ATXHeuristicCacheContextStoreExpirer)initWithCDContextualKeyPath:(id)a3
{
  id v5;
  ATXHeuristicCacheContextStoreExpirer *v6;
  ATXHeuristicCacheContextStoreExpirer *v7;
  uint64_t v8;
  _CDContextualPredicate *predicate;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXHeuristicCacheContextStoreExpirer;
  v6 = -[ATXHeuristicCacheExpirer init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contextKeyPath, a3);
    objc_msgSend(MEMORY[0x1E0D15C90], "predicateForChangeAtKeyPath:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    predicate = v7->_predicate;
    v7->_predicate = (_CDContextualPredicate *)v8;

  }
  return v7;
}

- (void)_start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _CDContextualChangeRegistration *v7;
  _CDContextualChangeRegistration *registration;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  if (!self->_registration)
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__ATXHeuristicCacheContextStoreExpirer__start__block_invoke;
    v10[3] = &unk_1E82C4978;
    objc_copyWeak(&v11, &location);
    v3 = (void *)MEMORY[0x1CAA46E3C](v10);
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[_CDContextualKeyPath key](self->_contextKeyPath, "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("com.apple.duetexpertd.heuristics.contextchange-%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D15C70], "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", v6, self->_predicate, CFSTR("com.apple.duetexpertd.cdidentifier"), v3);
    v7 = (_CDContextualChangeRegistration *)objc_claimAutoreleasedReturnValue();
    registration = self->_registration;
    self->_registration = v7;

    objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerCallback:", self->_registration);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __46__ATXHeuristicCacheContextStoreExpirer__start__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v3 = objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[10], "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v3, "setObject:forKey:", v4, v5);

    __atxlog_handle_heuristic();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = WeakRetained[10];
      v8 = 134218242;
      v9 = WeakRetained;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1C99DF000, v6, OS_LOG_TYPE_DEFAULT, "ATXHeuristicCacheContextStoreExpirer (%p): Context changed at keypath %@. Triggering heuristics refresh.", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(WeakRetained, "expire");
  }
  else
  {
    __atxlog_handle_heuristic();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __46__ATXHeuristicCacheContextStoreExpirer__start__block_invoke_cold_1();
  }

}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[_CDContextualKeyPath hash](self->_contextKeyPath, "hash");
  return -[_CDContextualPredicate hash](self->_predicate, "hash") - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXHeuristicCacheContextStoreExpirer *v4;
  ATXHeuristicCacheContextStoreExpirer *v5;
  _CDContextualKeyPath *contextKeyPath;
  _CDContextualPredicate *predicate;
  char v8;

  v4 = (ATXHeuristicCacheContextStoreExpirer *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      contextKeyPath = self->_contextKeyPath;
      if (contextKeyPath == v5->_contextKeyPath
        || -[_CDContextualKeyPath isEqual:](contextKeyPath, "isEqual:"))
      {
        predicate = self->_predicate;
        if (predicate == v5->_predicate)
          v8 = 1;
        else
          v8 = -[_CDContextualPredicate isEqual:](predicate, "isEqual:");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_CDContextualKeyPath key](self->_contextKeyPath, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("ATXHeuristicCacheContextStoreExpirer for %@"), v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXHeuristicCacheContextStoreExpirer;
  v4 = a3;
  -[ATXHeuristicCacheExpirer encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contextKeyPath, CFSTR("contextKeyPath"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_predicate, CFSTR("predicate"));

}

- (ATXHeuristicCacheContextStoreExpirer)initWithCoder:(id)a3
{
  id v4;
  ATXHeuristicCacheContextStoreExpirer *v5;
  void *v6;
  ATXHeuristicCacheContextStoreExpirer *v7;
  uint64_t v9;
  _CDContextualKeyPath *contextKeyPath;
  void *v11;
  uint64_t v12;
  _CDContextualPredicate *predicate;
  void *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXHeuristicCacheContextStoreExpirer;
  v5 = -[ATXHeuristicCacheExpirer initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_3;
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextKeyPath"));
  v9 = objc_claimAutoreleasedReturnValue();
  contextKeyPath = v5->_contextKeyPath;
  v5->_contextKeyPath = (_CDContextualKeyPath *)v9;

  if (!v5->_contextKeyPath)
    goto LABEL_3;
  objc_msgSend(v4, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
  v12 = objc_claimAutoreleasedReturnValue();
  predicate = v5->_predicate;
  v5->_predicate = (_CDContextualPredicate *)v12;

  if (!v5->_predicate
    || (objc_msgSend(v4, "error"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, v14))
  {
LABEL_3:
    v7 = 0;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

void __46__ATXHeuristicCacheContextStoreExpirer__start__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_3();
  _os_log_error_impl(&dword_1C99DF000, v0, OS_LOG_TYPE_ERROR, "ATXHeuristicCacheContextStoreExpirer: unable to handle CDContextChange because strongSelf is nil", v1, 2u);
  OUTLINED_FUNCTION_3_0();
}

@end
