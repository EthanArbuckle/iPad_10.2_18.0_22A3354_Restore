@implementation CNRegulatoryLogger

id __45__CNRegulatoryLogger_privacyAccountingLogger__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    -[objc_class sharedInstance](getPAAccessLoggerClass(), "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  return v2;
}

id __47__CNRegulatoryLogger_privacyAccountingAccessor__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[7];
  if (!v3)
  {
    objc_msgSend(v2, "privacyAccountingAccessorImpl");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  }
  return v3;
}

- (void)readingContactsData
{
  -[CNRegulatoryLogger logGreenTeaEvent:](self, "logGreenTeaEvent:", CFSTR("Reading some contacts data"));
}

- (CNRegulatoryLogger)initWithAuditToken:(id)a3 assumedIdentity:(id)a4
{
  return -[CNRegulatoryLogger initWithAuditToken:assumedIdentity:logCategory:](self, "initWithAuditToken:assumedIdentity:logCategory:", a3, a4, 0);
}

- (void)logGreenTeaEvent:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CNRegulatoryLogger greenTeaLogger](self, "greenTeaLogger"))
  {
    -[CNRegulatoryLogger greenTeaLogger](self, "greenTeaLogger");
    getCTGreenTeaOsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_18F80C000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

  }
  if (-[CNRegulatoryLogger isGreenTeaDiagnosticsEnabled](self, "isGreenTeaDiagnosticsEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Triggered GreenTea logging event: %@"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CNRegulatoryLogger greenTeaDiagnosticEventCounter](self, "greenTeaDiagnosticEventCounter") + 1;
    -[CNRegulatoryLogger setGreenTeaDiagnosticEventCounter:](self, "setGreenTeaDiagnosticEventCounter:", v8);
    v9 = -[CNRegulatoryLogger greenTeaDiagnosticLogFaultForEventCount](self, "greenTeaDiagnosticLogFaultForEventCount");
    -[CNRegulatoryLogger os_log](self, "os_log");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8 == v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[CNRegulatoryLogger logGreenTeaEvent:].cold.1((uint64_t)v7, v11);
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_18F80C000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

  }
}

- (BOOL)isGreenTeaDiagnosticsEnabled
{
  return self->_isGreenTeaDiagnosticsEnabled;
}

- (ct_green_tea_logger_s)greenTeaLogger
{
  return self->_greenTeaLogger;
}

+ (id)sharedInstanceForAddressBook
{
  return -[CNRegulatoryLogger initWithAuditToken:assumedIdentity:logCategory:]([CNRegulatoryLogger alloc], "initWithAuditToken:assumedIdentity:logCategory:", 0, 0, "CNRegulatoryLoggerForAB");
}

- (CNRegulatoryLogger)initWithAuditToken:(id)a3 assumedIdentity:(id)a4 logCategory:(const char *)a5
{
  id v9;
  id v10;
  CNRegulatoryLogger *v11;
  const char *v12;
  os_log_t v13;
  OS_os_log *os_log;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CNRegulatoryLogger *v21;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CNRegulatoryLogger;
  v11 = -[CNRegulatoryLogger init](&v23, sel_init);
  if (v11)
  {
    if (a5)
      v12 = a5;
    else
      v12 = "CNRegulatoryLogger";
    v13 = os_log_create("com.apple.contacts", v12);
    os_log = v11->_os_log;
    v11->_os_log = (OS_os_log *)v13;

    if (!v9)
    {
      if (ct_green_tea_logging_enabled())
        v11->_greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
      +[CNUserDefaults standardPreferences](CNUserDefaults, "standardPreferences");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringForKey:", CFSTR("CNGreenTeaDiagnosticsForProcessName"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "processName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_isGreenTeaDiagnosticsEnabled = objc_msgSend(v16, "isEqualToString:", v18);

      +[CNUserDefaults standardPreferences](CNUserDefaults, "standardPreferences");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_greenTeaDiagnosticLogFaultForEventCount = objc_msgSend(v19, "integerForKey:", CFSTR("CNGreenTeaDiagnosticsLogFaultForEventCount"));

      v11->_greenTeaDiagnosticEventCounter = 0;
    }
    objc_storeStrong((id *)&v11->_cnAuditToken, a3);
    objc_storeStrong((id *)&v11->_assumedIdentity, a4);
    +[CNUserDefaults standardPreferences](CNUserDefaults, "standardPreferences");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_isPrivacyAccountingDiagnosticsEnabled = objc_msgSend(v20, "userHasOptedInToPreference:", CFSTR("CNPrivacyAccountingDiagnosticsEnabled"));

    v21 = v11;
  }

  return v11;
}

- (id)privacyAccountingAccessorImpl
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  Class PAApplicationClass;
  id v14;
  uint64_t v15;
  void *v16;
  _OWORD v17[2];

  -[CNRegulatoryLogger cnAuditToken](self, "cnAuditToken");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[CNRegulatoryLogger assumedIdentity](self, "assumedIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CNRegulatoryLogger accessorForAuditTokenValidatingAssumedIdentity](self, "accessorForAuditTokenValidatingAssumedIdentity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
  }
  -[CNRegulatoryLogger cnAuditToken](self, "cnAuditToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(getPAApplicationClass());
    -[CNRegulatoryLogger cnAuditToken](self, "cnAuditToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "audit_token");
    else
      memset(v17, 0, sizeof(v17));
    v15 = objc_msgSend(v9, "initWithAuditToken:", v17);
  }
  else
  {
    -[CNRegulatoryLogger assumedIdentity](self, "assumedIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    PAApplicationClass = getPAApplicationClass();
    if (!v12)
    {
      -[objc_class applicationForCurrentProcess](PAApplicationClass, "applicationForCurrentProcess");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    v14 = [PAApplicationClass alloc];
    -[CNRegulatoryLogger assumedIdentity](self, "assumedIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "initWithInProcessAssumedIdentity:", v11);
  }
  v16 = (void *)v15;

  return v16;
}

- (CNAuditToken)cnAuditToken
{
  return self->_cnAuditToken;
}

- (OS_tcc_identity)assumedIdentity
{
  return self->_assumedIdentity;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_greenTeaLogger)
    ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)CNRegulatoryLogger;
  -[CNRegulatoryLogger dealloc](&v3, sel_dealloc);
}

- (void)logContactsDataAccessEventWithAssetIdentifiers:(id)a3
{
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "count"))
  {
    -[CNRegulatoryLogger privacyAccountingLogger](self, "privacyAccountingLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "loggingEnabled");

    if ((v5 & 1) != 0)
    {
      -[CNRegulatoryLogger willLogContactsDataAccessEventWithAssetIdentifiers:](self, "willLogContactsDataAccessEventWithAssetIdentifiers:", v9);
      v6 = objc_alloc(getPATCCAccessClass());
      -[CNRegulatoryLogger privacyAccountingAccessor](self, "privacyAccountingAccessor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithAccessor:forService:assetIdentifiers:", v7, *MEMORY[0x1E0DB10D0], v9);

      -[CNRegulatoryLogger logPrivacyAccountingAccessEvent:](self, "logPrivacyAccountingAccessEvent:", v8);
    }
    else
    {
      -[CNRegulatoryLogger willNotLogContactsDataAccessEventAsLoggingDisabled](self, "willNotLogContactsDataAccessEventAsLoggingDisabled");
    }
  }

}

- (void)logPrivacyAccountingAccessEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNRegulatoryLogger privacyAccountingLogger](self, "privacyAccountingLogger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "log:", v4);

}

- (void)logContactsDataAccessEvent
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  id v7;

  -[CNRegulatoryLogger privacyAccountingLogger](self, "privacyAccountingLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "loggingEnabled");

  if ((v4 & 1) != 0)
  {
    -[CNRegulatoryLogger willLogContactsDataAccessEvent](self, "willLogContactsDataAccessEvent");
    v5 = objc_alloc(getPATCCAccessClass());
    -[CNRegulatoryLogger privacyAccountingAccessor](self, "privacyAccountingAccessor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "initWithAccessor:forService:", v6, *MEMORY[0x1E0DB10D0]);

    -[CNRegulatoryLogger logPrivacyAccountingAccessEvent:](self, "logPrivacyAccountingAccessEvent:", v7);
  }
  else
  {
    -[CNRegulatoryLogger willNotLogContactsDataAccessEventAsLoggingDisabled](self, "willNotLogContactsDataAccessEventAsLoggingDisabled");
  }
}

- (PAAccessLogger)privacyAccountingLogger
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__CNRegulatoryLogger_privacyAccountingLogger__block_invoke;
  v3[3] = &unk_1E29B8C60;
  v3[4] = self;
  cn_objectResultWithObjectLock(self, v3);
  return (PAAccessLogger *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)willLogContactsDataAccessEvent
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  const char *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[CNRegulatoryLogger isPrivacyAccountingDiagnosticsEnabled](self, "isPrivacyAccountingDiagnosticsEnabled"))
  {
    -[CNRegulatoryLogger cnAuditToken](self, "cnAuditToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNRegulatoryLogger os_log](self, "os_log");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v5)
      {
        -[CNRegulatoryLogger processDescription](self, "processDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v6;
        v7 = "Logging out-of-process contacts data access event for %@";
LABEL_7:
        _os_log_impl(&dword_18F80C000, v4, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v8, 0xCu);

      }
    }
    else if (v5)
    {
      -[CNRegulatoryLogger processDescription](self, "processDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      v7 = "Logging in-process contacts data access event for %@";
      goto LABEL_7;
    }

  }
}

- (void)willNotLogContactsDataAccessEventAsLoggingDisabled
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  const char *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[CNRegulatoryLogger isPrivacyAccountingDiagnosticsEnabled](self, "isPrivacyAccountingDiagnosticsEnabled"))
  {
    -[CNRegulatoryLogger cnAuditToken](self, "cnAuditToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNRegulatoryLogger os_log](self, "os_log");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v5)
      {
        -[CNRegulatoryLogger processDescription](self, "processDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v6;
        v7 = "Logging disabled with out-of-process contacts data access event for %@";
LABEL_7:
        _os_log_impl(&dword_18F80C000, v4, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v8, 0xCu);

      }
    }
    else if (v5)
    {
      -[CNRegulatoryLogger processDescription](self, "processDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      v7 = "Logging disabled with in-process contacts data access event for %@";
      goto LABEL_7;
    }

  }
}

- (BOOL)isPrivacyAccountingDiagnosticsEnabled
{
  return self->_isPrivacyAccountingDiagnosticsEnabled;
}

- (PAApplication)privacyAccountingAccessor
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__CNRegulatoryLogger_privacyAccountingAccessor__block_invoke;
  v3[3] = &unk_1E29B8C60;
  v3[4] = self;
  cn_objectResultWithObjectLock(self, v3);
  return (PAApplication *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processDescription, 0);
  objc_storeStrong((id *)&self->_assumedIdentity, 0);
  objc_storeStrong((id *)&self->_cnAuditToken, 0);
  objc_storeStrong((id *)&self->_privacyAccountingAccessor, 0);
  objc_storeStrong((id *)&self->_privacyAccountingLogger, 0);
  objc_storeStrong((id *)&self->_os_log, 0);
}

- (void)modifyingContactsData
{
  -[CNRegulatoryLogger logGreenTeaEvent:](self, "logGreenTeaEvent:", CFSTR("Modifying some contacts data"));
}

- (void)deletingContactsData
{
  -[CNRegulatoryLogger logGreenTeaEvent:](self, "logGreenTeaEvent:", CFSTR("Deleting some contacts data"));
}

- (void)displayingOOPContactPicker
{
  -[CNRegulatoryLogger logGreenTeaEvent:](self, "logGreenTeaEvent:", CFSTR("Requesting presentation of the out-of-process Contact picker"));
}

- (void)receivingContactsDataFromOOPContactPicker
{
  -[CNRegulatoryLogger logGreenTeaEvent:](self, "logGreenTeaEvent:", CFSTR("Receiving some contacts data from the out-of-process Contact picker"));
}

- (void)logContactPickerAccessEvent
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[CNRegulatoryLogger privacyAccountingLogger](self, "privacyAccountingLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "loggingEnabled");

  if ((v4 & 1) != 0)
  {
    -[CNRegulatoryLogger cnAuditToken](self, "cnAuditToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CNRegulatoryLogger willLogContactPickerAccessEvent](self, "willLogContactPickerAccessEvent");
      v6 = objc_alloc(getPAOutOfProcessPickerAccessClass());
      -[CNRegulatoryLogger privacyAccountingAccessor](self, "privacyAccountingAccessor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v6, "initWithAccessor:forType:", v7, 2);

      -[CNRegulatoryLogger logPrivacyAccountingAccessEvent:](self, "logPrivacyAccountingAccessEvent:", v8);
    }
    else
    {
      -[CNRegulatoryLogger willNotLogContactPickerAccessEventAsLoggingInProcess](self, "willNotLogContactPickerAccessEventAsLoggingInProcess");
    }
  }
  else
  {
    -[CNRegulatoryLogger willNotLogContactPickerAccessEventAsLoggingDisabled](self, "willNotLogContactPickerAccessEventAsLoggingDisabled");
  }
}

- (id)accessorForAuditTokenValidatingAssumedIdentity
{
  uint64_t (*v3)();
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  __int128 v12;
  __int128 v13;

  v3 = softLinkPAAuthenticatedClientIdentity;
  -[CNRegulatoryLogger cnAuditToken](self, "cnAuditToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "audit_token");
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
  }
  -[CNRegulatoryLogger assumedIdentity](self, "assumedIdentity", v12, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (*)(_OWORD *, void *))v3)(&v12, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(getPAApplicationClass()), "initWithTCCIdentity:", v7);
  }
  else
  {
    -[CNRegulatoryLogger os_log](self, "os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CNRegulatoryLogger accessorForAuditTokenValidatingAssumedIdentity].cold.1(self);

    -[objc_class applicationForCurrentProcess](getPAApplicationClass(), "applicationForCurrentProcess");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;

  return v10;
}

- (void)willLogContactsDataAccessEventWithAssetIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  const char *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CNRegulatoryLogger isPrivacyAccountingDiagnosticsEnabled](self, "isPrivacyAccountingDiagnosticsEnabled"))
  {
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_cn_map:", &__block_literal_global_6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNRegulatoryLogger cnAuditToken](self, "cnAuditToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNRegulatoryLogger os_log](self, "os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v9)
      {
        -[CNRegulatoryLogger processDescription](self, "processDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = v10;
        v14 = 2112;
        v15 = v6;
        v11 = "Logging out-of-process contacts data access event for %@, %@";
LABEL_7:
        _os_log_impl(&dword_18F80C000, v8, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v12, 0x16u);

      }
    }
    else if (v9)
    {
      -[CNRegulatoryLogger processDescription](self, "processDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      v11 = "Logging in-process contacts data access event for %@, %@";
      goto LABEL_7;
    }

  }
}

id __73__CNRegulatoryLogger_willLogContactsDataAccessEventWithAssetIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithData:encoding:", v3, 4);

  return v4;
}

- (void)willNotLogContactPickerAccessEventAsLoggingDisabled
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  const char *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[CNRegulatoryLogger isPrivacyAccountingDiagnosticsEnabled](self, "isPrivacyAccountingDiagnosticsEnabled"))
  {
    -[CNRegulatoryLogger cnAuditToken](self, "cnAuditToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNRegulatoryLogger os_log](self, "os_log");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v5)
      {
        -[CNRegulatoryLogger processDescription](self, "processDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v6;
        v7 = "Logging disabled with out-of-process contact picker access event for %@.";
LABEL_7:
        _os_log_impl(&dword_18F80C000, v4, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v8, 0xCu);

      }
    }
    else if (v5)
    {
      -[CNRegulatoryLogger processDescription](self, "processDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      v7 = "Logging disabled when asked to log an in-process contact picker access event for %@";
      goto LABEL_7;
    }

  }
}

- (void)willNotLogContactPickerAccessEventAsLoggingInProcess
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "processDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_18F80C000, v2, v3, "Unexpected request to log an in-process contact picker access event for %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)willLogContactPickerAccessEvent
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[CNRegulatoryLogger isPrivacyAccountingDiagnosticsEnabled](self, "isPrivacyAccountingDiagnosticsEnabled"))
  {
    -[CNRegulatoryLogger os_log](self, "os_log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[CNRegulatoryLogger processDescription](self, "processDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_18F80C000, v3, OS_LOG_TYPE_INFO, "Logging out-of-process contact picker access event for %@", (uint8_t *)&v5, 0xCu);

    }
  }
}

- (NSString)processDescription
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__CNRegulatoryLogger_processDescription__block_invoke;
  v3[3] = &unk_1E29B8C60;
  v3[4] = self;
  cn_objectResultWithObjectLock(self, v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __40__CNRegulatoryLogger_processDescription__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[10];
  if (!v3)
  {
    objc_msgSend(v2, "processDescriptionImpl");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  }
  return v3;
}

- (id)processDescriptionImpl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[CNRegulatoryLogger cnAuditToken](self, "cnAuditToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNRegulatoryLogger cnAuditToken](self, "cnAuditToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNAuditTokenUtilities processNameForAuditToken:](CNAuditTokenUtilities, "processNameForAuditToken:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_8;
    -[CNRegulatoryLogger cnAuditToken](self, "cnAuditToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNAuditTokenUtilities bundleIdentifierForAuditToken:](CNAuditTokenUtilities, "bundleIdentifierForAuditToken:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_8;
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[CNRegulatoryLogger cnAuditToken](self, "cnAuditToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[CNAuditTokenUtilities processIdentifierForAuditToken:](CNAuditTokenUtilities, "processIdentifierForAuditToken:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_8;
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "processIdentifier");
  }
  objc_msgSend(v7, "stringWithFormat:", CFSTR("PID = %d"), v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  -[CNRegulatoryLogger assumedIdentity](self, "assumedIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[CNRegulatoryLogger assumedIdentity](self, "assumedIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ [%s]"), v5, tcc_identity_get_identifier());
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v5;
  }

  return v14;
}

- (OS_os_log)os_log
{
  return self->_os_log;
}

- (unint64_t)greenTeaDiagnosticLogFaultForEventCount
{
  return self->_greenTeaDiagnosticLogFaultForEventCount;
}

- (void)setGreenTeaDiagnosticLogFaultForEventCount:(unint64_t)a3
{
  self->_greenTeaDiagnosticLogFaultForEventCount = a3;
}

- (unint64_t)greenTeaDiagnosticEventCounter
{
  return self->_greenTeaDiagnosticEventCounter;
}

- (void)setGreenTeaDiagnosticEventCounter:(unint64_t)a3
{
  self->_greenTeaDiagnosticEventCounter = a3;
}

- (void)setPrivacyAccountingLogger:(id)a3
{
  objc_storeStrong((id *)&self->_privacyAccountingLogger, a3);
}

- (void)setPrivacyAccountingAccessor:(id)a3
{
  objc_storeStrong((id *)&self->_privacyAccountingAccessor, a3);
}

- (void)setProcessDescription:(id)a3
{
  objc_storeStrong((id *)&self->_processDescription, a3);
}

- (void)logGreenTeaEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_18F80C000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

- (void)accessorForAuditTokenValidatingAssumedIdentity
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "processDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_18F80C000, v2, v3, "Failed to validate assumed identity for %@, will log as contactsd.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
