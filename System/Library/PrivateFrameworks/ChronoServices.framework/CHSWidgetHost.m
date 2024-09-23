@implementation CHSWidgetHost

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CHSWidgetHost.m"), 35, CFSTR("use initWithIdentifier:"));

  return 0;
}

- (CHSWidgetHost)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSWidgetHost.m"), 40, CFSTR("use initWithIdentifier:"));

  return 0;
}

- (CHSWidgetHost)initWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  CHSWidgetHost *v6;

  v4 = a3;
  +[CHSChronoServicesConnection sharedInstance](CHSChronoServicesConnection, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CHSWidgetHost initWithIdentifier:configuration:activationState:connection:](self, "initWithIdentifier:configuration:activationState:connection:", v4, 0, 1, v5);

  return v6;
}

- (CHSWidgetHost)initWithIdentifier:(id)a3 configuration:(id)a4 active:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  CHSWidgetHost *v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  +[CHSChronoServicesConnection sharedInstance](CHSChronoServicesConnection, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CHSWidgetHost initWithIdentifier:configuration:activationState:connection:](self, "initWithIdentifier:configuration:activationState:connection:", v8, v9, v5, v10);

  return v11;
}

- (CHSWidgetHost)initWithIdentifier:(id)a3 configuration:(id)a4 activationState:(unint64_t)a5 connection:(id)a6
{
  id v10;
  id v11;
  id v12;
  CHSWidgetHost *v13;
  CHSWidgetHost *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *loggingIdentifier;
  uint64_t v19;
  CHSWidgetConfiguration *configuration;
  NSObject *v21;
  NSString *v22;
  CHSWidgetConfiguration *v23;
  CHSWidgetMetricsSpecification *v24;
  uint64_t v25;
  CHSWidgetConfiguration *v26;
  objc_super v28;
  uint8_t buf[4];
  NSString *v30;
  __int16 v31;
  CHSWidgetHost *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CHSWidgetHost;
  v13 = -[CHSWidgetHost init](&v28, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_activationState = a5;
    objc_storeStrong((id *)&v13->_connection, a6);
    v15 = objc_msgSend(v10, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), v10, v14);
    v17 = objc_claimAutoreleasedReturnValue();
    loggingIdentifier = v14->_loggingIdentifier;
    v14->_loggingIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v11, "copy");
    configuration = v14->_configuration;
    v14->_configuration = (CHSWidgetConfiguration *)v19;

    CHSLogWidgetHosts();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v14->_loggingIdentifier;
      *(_DWORD *)buf = 138543618;
      v30 = v22;
      v31 = 2114;
      v32 = v14;
      _os_log_impl(&dword_18FB18000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Created: %{public}@", buf, 0x16u);
    }

    if (v11)
    {
      -[CHSWidgetHost _connectionCreateOrUpdateConfigurations](v14, "_connectionCreateOrUpdateConfigurations");
    }
    else
    {
      v23 = [CHSWidgetConfiguration alloc];
      v24 = objc_alloc_init(CHSWidgetMetricsSpecification);
      v25 = -[CHSWidgetConfiguration initWithContainerDescriptors:metricsSpecification:](v23, "initWithContainerDescriptors:metricsSpecification:", MEMORY[0x1E0C9AA60], v24);
      v26 = v14->_configuration;
      v14->_configuration = (CHSWidgetConfiguration *)v25;

    }
  }

  return v14;
}

- (id)_initWithHost:(id)a3
{
  id *v4;
  CHSWidgetHost *v5;
  CHSWidgetHost *v6;
  objc_super v8;

  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CHSWidgetHost;
  v5 = -[CHSWidgetHost init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_identifier, v4[1]);
    objc_storeStrong((id *)&v6->_loggingIdentifier, v4[2]);
    objc_storeStrong((id *)&v6->_connection, v4[3]);
    v6->_invalid = *((_BYTE *)v4 + 40);
    v6->_activationState = (unint64_t)v4[4];
    objc_storeStrong((id *)&v6->_configuration, v4[6]);
  }

  return v6;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSWidgetHost.m"), 98, CFSTR("CHSWidgetHost must be invalidated before it is deallocated"));

  }
  v5.receiver = self;
  v5.super_class = (Class)CHSWidgetHost;
  -[CHSWidgetHost dealloc](&v5, sel_dealloc);
}

- (void)setConfiguration:(id)a3
{
  id v5;
  CHSWidgetConfiguration *v6;
  CHSWidgetConfiguration *configuration;
  NSObject *v8;
  NSString *loggingIdentifier;
  void *v10;
  int v11;
  NSString *v12;
  __int16 v13;
  CHSWidgetHost *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_invalid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSWidgetHost.m"), 105, CFSTR("CHSWidgetHost is invalid"));

  }
  if (!-[CHSWidgetConfiguration isEqual:](self->_configuration, "isEqual:", v5))
  {
    v6 = (CHSWidgetConfiguration *)objc_msgSend(v5, "copy");
    configuration = self->_configuration;
    self->_configuration = v6;

    CHSLogWidgetHosts();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      loggingIdentifier = self->_loggingIdentifier;
      v11 = 138543618;
      v12 = loggingIdentifier;
      v13 = 2114;
      v14 = self;
      _os_log_impl(&dword_18FB18000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Configuration changed: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    -[CHSWidgetHost _connectionCreateOrUpdateConfigurations](self, "_connectionCreateOrUpdateConfigurations");
  }

}

- (BOOL)isActive
{
  return self->_activationState == 1;
}

- (void)activate
{
  NSObject *v3;
  NSString *loggingIdentifier;
  int v5;
  NSString *v6;
  __int16 v7;
  CHSWidgetHost *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_invalid)
  {
    CHSLogWidgetHosts();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      loggingIdentifier = self->_loggingIdentifier;
      v5 = 138543618;
      v6 = loggingIdentifier;
      v7 = 2114;
      v8 = self;
      _os_log_impl(&dword_18FB18000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Activated: %{public}@", (uint8_t *)&v5, 0x16u);
    }

    self->_activationState = 1;
    -[CHSWidgetHost _connectionUpdateActivationState](self, "_connectionUpdateActivationState");
  }
}

- (void)deactivate
{
  NSObject *v3;
  NSString *loggingIdentifier;
  int v5;
  NSString *v6;
  __int16 v7;
  CHSWidgetHost *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_invalid)
  {
    CHSLogWidgetHosts();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      loggingIdentifier = self->_loggingIdentifier;
      v5 = 138543618;
      v6 = loggingIdentifier;
      v7 = 2114;
      v8 = self;
      _os_log_impl(&dword_18FB18000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Deactivated: %{public}@", (uint8_t *)&v5, 0x16u);
    }

    self->_activationState = 0;
    -[CHSWidgetHost _connectionUpdateActivationState](self, "_connectionUpdateActivationState");
  }
}

- (void)invalidate
{
  NSObject *v3;
  NSString *loggingIdentifier;
  int v5;
  NSString *v6;
  __int16 v7;
  CHSWidgetHost *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_invalid)
  {
    self->_invalid = 1;
    CHSLogWidgetHosts();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      loggingIdentifier = self->_loggingIdentifier;
      v5 = 138543618;
      v6 = loggingIdentifier;
      v7 = 2114;
      v8 = self;
      _os_log_impl(&dword_18FB18000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Invalidated: %{public}@", (uint8_t *)&v5, 0x16u);
    }

    self->_activationState = 0;
    -[CHSWidgetHost _connectionRemoveHost](self, "_connectionRemoveHost");
  }
}

- (id)_connectionCopy
{
  return -[_CHSWidgetHostForConnection initWithIdentifier:configuration:activationState:]([_CHSWidgetHostForConnection alloc], "initWithIdentifier:configuration:activationState:", self->_identifier, self->_configuration, self->_activationState);
}

- (unint64_t)_activationState
{
  return self->_activationState;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CHSWidgetHost *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__CHSWidgetHost_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E2A5A290;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

void __46__CHSWidgetHost_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2;
  const __CFString *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("identifier"));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32))
    v3 = CFSTR("activated");
  else
    v3 = CFSTR("deactivated");
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v3, CFSTR("activationState"));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "succinctDescription");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendObject:withName:");

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)_connectionRemoveHost
{
  CHSChronoServicesConnection *connection;
  id v3;

  connection = self->_connection;
  -[CHSWidgetHost _connectionCopy](self, "_connectionCopy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CHSChronoServicesConnection removeWidgetHost:](connection, "removeWidgetHost:");

}

- (void)_connectionCreateOrUpdateConfigurations
{
  CHSChronoServicesConnection *connection;
  id v3;

  connection = self->_connection;
  -[CHSWidgetHost _connectionCopy](self, "_connectionCopy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CHSChronoServicesConnection updateWidgetHostConfigurations:](connection, "updateWidgetHostConfigurations:");

}

- (void)_connectionUpdateActivationState
{
  CHSChronoServicesConnection *connection;
  id v3;

  connection = self->_connection;
  -[CHSWidgetHost _connectionCopy](self, "_connectionCopy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CHSChronoServicesConnection updateWidgetHostActivationState:](connection, "updateWidgetHostActivationState:");

}

- (NSString)identifier
{
  return self->_identifier;
}

- (CHSWidgetConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
