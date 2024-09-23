@implementation ATXInformationHeuristicRefreshContextChangeTrigger

- (ATXInformationHeuristicRefreshContextChangeTrigger)initWithCDContextualKeyPath:(id)a3 equalToValue:(id)a4 withMinimumDurationInPreviousState:(double)a5
{
  id v9;
  id v10;
  ATXInformationHeuristicRefreshContextChangeTrigger *v11;
  ATXInformationHeuristicRefreshContextChangeTrigger *v12;
  uint64_t v13;
  _CDContextualPredicate *predicate;
  uint64_t v15;
  NSString *registrationIdentifier;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ATXInformationHeuristicRefreshContextChangeTrigger;
  v11 = -[ATXInformationHeuristicRefreshTrigger init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contextKeyPath, a3);
    objc_msgSend(MEMORY[0x1E0D15C90], "predicateForKeyPath:equalToValue:withMinimumDurationInPreviousState:", v12->_contextKeyPath, v10, a5);
    v13 = objc_claimAutoreleasedReturnValue();
    predicate = v12->_predicate;
    v12->_predicate = (_CDContextualPredicate *)v13;

    objc_msgSend(v9, "key");
    v15 = objc_claimAutoreleasedReturnValue();
    registrationIdentifier = v12->_registrationIdentifier;
    v12->_registrationIdentifier = (NSString *)v15;

  }
  return v12;
}

- (ATXInformationHeuristicRefreshContextChangeTrigger)initWithCDContextualKeyPath:(id)a3
{
  id v5;
  ATXInformationHeuristicRefreshContextChangeTrigger *v6;
  ATXInformationHeuristicRefreshContextChangeTrigger *v7;
  uint64_t v8;
  _CDContextualPredicate *predicate;
  uint64_t v10;
  NSString *registrationIdentifier;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXInformationHeuristicRefreshContextChangeTrigger;
  v6 = -[ATXInformationHeuristicRefreshTrigger init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contextKeyPath, a3);
    objc_msgSend(MEMORY[0x1E0D15C90], "predicateForChangeAtKeyPath:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    predicate = v7->_predicate;
    v7->_predicate = (_CDContextualPredicate *)v8;

    objc_msgSend(v5, "key");
    v10 = objc_claimAutoreleasedReturnValue();
    registrationIdentifier = v7->_registrationIdentifier;
    v7->_registrationIdentifier = (NSString *)v10;

  }
  return v7;
}

- (ATXInformationHeuristicRefreshContextChangeTrigger)initWithCDContextualKeyPath:(id)a3 predicate:(id)a4 registrationIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXInformationHeuristicRefreshContextChangeTrigger *v12;
  ATXInformationHeuristicRefreshContextChangeTrigger *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXInformationHeuristicRefreshContextChangeTrigger;
  v12 = -[ATXInformationHeuristicRefreshTrigger init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contextKeyPath, a3);
    objc_storeStrong((id *)&v13->_predicate, a4);
    objc_storeStrong((id *)&v13->_registrationIdentifier, a5);
  }

  return v13;
}

- (void)_start
{
  void *v3;
  void *v4;
  void *v5;
  _CDContextualChangeRegistration *v6;
  _CDContextualChangeRegistration *registration;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (!self->_registration)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__ATXInformationHeuristicRefreshContextChangeTrigger__start__block_invoke;
    v9[3] = &unk_1E82C4978;
    objc_copyWeak(&v10, &location);
    v3 = (void *)MEMORY[0x1CAA46E3C](v9);
    v4 = (void *)MEMORY[0x1E0D15C70];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.duetexpertd.information.contextchange.%@"), self->_registrationIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", v5, self->_predicate, CFSTR("com.apple.duetexpertd.cdidentifier"), v3);
    v6 = (_CDContextualChangeRegistration *)objc_claimAutoreleasedReturnValue();
    registration = self->_registration;
    self->_registration = v6;

    objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerCallback:", self->_registration);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __60__ATXInformationHeuristicRefreshContextChangeTrigger__start__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v3 = objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[3], "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v3, "setObject:forKey:", v4, v5);

    __atxlog_handle_gi();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = WeakRetained[3];
      v17 = 134218242;
      v18 = WeakRetained;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1C99DF000, v6, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshContextChangeTrigger (%p): Context changed at keypath %@. Triggering heuristics refresh.", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "registeredHeuristics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "informationHeuristicRefreshTrigger:didTriggerRefreshForHeuristics:", WeakRetained, v9);

  }
  else
  {
    __atxlog_handle_gi();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __60__ATXInformationHeuristicRefreshContextChangeTrigger__start__block_invoke_cold_1(v3, v10, v11, v12, v13, v14, v15, v16);
  }

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

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[_CDContextualKeyPath hash](self->_contextKeyPath, "hash");
  return -[_CDContextualPredicate hash](self->_predicate, "hash") - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXInformationHeuristicRefreshContextChangeTrigger *v4;
  ATXInformationHeuristicRefreshContextChangeTrigger *v5;
  _CDContextualKeyPath *contextKeyPath;
  _CDContextualPredicate *predicate;
  char v8;

  v4 = (ATXInformationHeuristicRefreshContextChangeTrigger *)a3;
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
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("InfoHeuristicRefreshContextChangeTrigger for %@"), v4);

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
  v5.super_class = (Class)ATXInformationHeuristicRefreshContextChangeTrigger;
  v4 = a3;
  -[ATXInformationHeuristicRefreshTrigger encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contextKeyPath, CFSTR("contextKeyPath"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_predicate, CFSTR("predicate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_registrationIdentifier, CFSTR("registrationIdKey"));

}

- (ATXInformationHeuristicRefreshContextChangeTrigger)initWithCoder:(id)a3
{
  id v4;
  ATXInformationHeuristicRefreshContextChangeTrigger *v5;
  void *v6;
  ATXInformationHeuristicRefreshContextChangeTrigger *v7;
  uint64_t v9;
  _CDContextualKeyPath *contextKeyPath;
  void *v11;
  uint64_t v12;
  _CDContextualPredicate *predicate;
  void *v14;
  uint64_t v15;
  NSString *registrationIdentifier;
  void *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXInformationHeuristicRefreshContextChangeTrigger;
  v5 = -[ATXInformationHeuristicRefreshTrigger initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_3;
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_3;
  -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:](v5, "_safeDecodeObjectOfClass:forKey:withCoder:nonNull:", objc_opt_class(), CFSTR("contextKeyPath"), v4, 1);
  v9 = objc_claimAutoreleasedReturnValue();
  contextKeyPath = v5->_contextKeyPath;
  v5->_contextKeyPath = (_CDContextualKeyPath *)v9;

  if (!v5->_contextKeyPath)
    goto LABEL_3;
  objc_msgSend(v4, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_3;
  -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:](v5, "_safeDecodeObjectOfClass:forKey:withCoder:nonNull:", objc_opt_class(), CFSTR("predicate"), v4, 1);
  v12 = objc_claimAutoreleasedReturnValue();
  predicate = v5->_predicate;
  v5->_predicate = (_CDContextualPredicate *)v12;

  if (!v5->_predicate)
    goto LABEL_3;
  objc_msgSend(v4, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    goto LABEL_3;
  -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:](v5, "_safeDecodeObjectOfClass:forKey:withCoder:nonNull:", objc_opt_class(), CFSTR("registrationIdKey"), v4, 1);
  v15 = objc_claimAutoreleasedReturnValue();
  registrationIdentifier = v5->_registrationIdentifier;
  v5->_registrationIdentifier = (NSString *)v15;

  if (!v5->_registrationIdentifier
    || (objc_msgSend(v4, "error"), v17 = (void *)objc_claimAutoreleasedReturnValue(), v17, v17))
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationIdentifier, 0);
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_contextKeyPath, 0);
}

void __60__ATXInformationHeuristicRefreshContextChangeTrigger__start__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, a1, a3, "ATXInformationHeuristicRefreshContextChangeTrigger: unable to handle CDContextChange because strongSelf is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

@end
