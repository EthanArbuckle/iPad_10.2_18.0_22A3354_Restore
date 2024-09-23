@implementation CNContactsEnvironment

- (CNContactsLoggerProvider)loggerProvider
{
  return self->_loggerProvider;
}

- (CNiOSAddressBook)addressBook
{
  cn_objectResultWithObjectLock();
  return (CNiOSAddressBook *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)currentEnvironment
{
  if (s_currentEnvironmentOnceToken != -1)
    dispatch_once(&s_currentEnvironmentOnceToken, &__block_literal_global_42);
  return (id)s_currentEnvironment;
}

id __36__CNContactsEnvironment_addressBook__block_invoke(uint64_t a1)
{
  void *v2;
  CNiOSAddressBook *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2)
  {
    v3 = -[CNiOSAddressBook initWithContactsEnvironment:]([CNiOSAddressBook alloc], "initWithContactsEnvironment:", *(_QWORD *)(a1 + 32));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  return v2;
}

- (BOOL)useInMemoryStores
{
  void *v2;
  void *v3;
  char v4;

  -[CNContactsEnvironment baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "inMemoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

+ (id)inMemoryURL
{
  if (inMemoryURL_cn_once_token_0 != -1)
    dispatch_once(&inMemoryURL_cn_once_token_0, &__block_literal_global_1_2);
  return (id)inMemoryURL_cn_once_object_0;
}

- (NSArray)delegateInfos
{
  return self->_delegateInfos;
}

- (SGSuggestionsServiceContactsProtocol)suggestionsService
{
  return self->_suggestionsService;
}

- (CNSiriIntelligenceSettingsProtocol)siriIntelligenceSettings
{
  return self->_siriIntelligenceSettings;
}

void __36__CNContactsEnvironment_inMemoryURL__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("in-memory://"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)inMemoryURL_cn_once_object_0;
  inMemoryURL_cn_once_object_0 = v0;

}

void __43__CNContactsEnvironment_currentEnvironment__block_invoke()
{
  CNContactsEnvironment *v0;
  void *v1;

  v0 = objc_alloc_init(CNContactsEnvironment);
  v1 = (void *)s_currentEnvironment;
  s_currentEnvironment = (uint64_t)v0;

}

- (CNContactsEnvironment)init
{
  void *v3;
  void *v4;
  CNContactsEnvironment *v5;

  objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactsLoggerProvider defaultProvider](CNContactsLoggerProvider, "defaultProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactsEnvironment initWithSchedulerProvider:loggerProvider:](self, "initWithSchedulerProvider:loggerProvider:", v3, v4);

  return v5;
}

- (CNContactsEnvironment)initWithSchedulerProvider:(id)a3 loggerProvider:(id)a4
{
  id v7;
  id v8;
  CNContactsEnvironment *v9;
  CNContactsEnvironment *v10;
  CNiOSABPredicateRunner *v11;
  CNiOSABPredicateRunner *abPredicateRunner;
  CNContactsEnvironment *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNContactsEnvironment;
  v9 = -[CNContactsEnvironment init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_schedulerProvider, a3);
    objc_storeStrong((id *)&v10->_loggerProvider, a4);
    v11 = objc_alloc_init(CNiOSABPredicateRunner);
    abPredicateRunner = v10->_abPredicateRunner;
    v10->_abPredicateRunner = v11;

    v13 = v10;
  }

  return v10;
}

- (void)makeCurrentEnvironment
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CNContactsEnvironment_makeCurrentEnvironment__block_invoke;
  block[3] = &unk_1E29F8508;
  block[4] = self;
  if (s_currentEnvironmentOnceToken != -1)
    dispatch_once(&s_currentEnvironmentOnceToken, block);
}

void __47__CNContactsEnvironment_makeCurrentEnvironment__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)&s_currentEnvironment, *(id *)(a1 + 32));
}

+ (id)unitTestingEnvironment
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNMockLoggerProvider loggerProvider](CNMockLoggerProvider, "loggerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "unitTestingEnvironmentWithSchedulerProvider:loggerProvider:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)unitTestingEnvironmentWithSchedulerProvider:(id)a3 loggerProvider:(id)a4
{
  id v6;
  id v7;
  CNContactsEnvironment *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[CNContactsEnvironment initWithSchedulerProvider:loggerProvider:]([CNContactsEnvironment alloc], "initWithSchedulerProvider:loggerProvider:", v7, v6);

  objc_msgSend(a1, "inMemoryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactsEnvironment setBaseURL:](v8, "setBaseURL:", v9);

  return v8;
}

+ (id)unitTestingEnvironmentWithDataLocationName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0D13B70];
  v5 = a3;
  objc_msgSend(v4, "defaultProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNMockLoggerProvider loggerProvider](CNMockLoggerProvider, "loggerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "unitTestingEnvironmentWithDataLocationName:schedulerProvider:loggerProvider:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)unitTestingEnvironmentWithDataLocationName:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[CNMockLoggerProvider loggerProvider](CNMockLoggerProvider, "loggerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "unitTestingEnvironmentWithDataLocationName:schedulerProvider:loggerProvider:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)unitTestingEnvironmentWithDataLocationName:(id)a3 schedulerProvider:(id)a4 loggerProvider:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  objc_msgSend(a1, "unitTestingEnvironmentWithSchedulerProvider:loggerProvider:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "baseURLWithDataLocationName:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setBaseURL:", v10);
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactsEnvironment)initWithCoder:(id)a3
{
  CNContactsEnvironment *v3;
  CNContactsEnvironment *v4;
  CNContactsEnvironment *v5;

  v3 = -[CNContactsEnvironment init](self, "init", a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CNContactsEnvironment *v4;
  void *v5;

  v4 = -[CNContactsEnvironment initWithSchedulerProvider:loggerProvider:]([CNContactsEnvironment alloc], "initWithSchedulerProvider:loggerProvider:", self->_schedulerProvider, self->_loggerProvider);
  -[CNContactsEnvironment baseURL](self, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactsEnvironment setBaseURL:](v4, "setBaseURL:", v5);

  objc_storeStrong((id *)&v4->_addressBook, self->_addressBook);
  objc_storeStrong((id *)&v4->_abPredicateRunner, self->_abPredicateRunner);
  return v4;
}

+ (id)baseURLWithDataLocationName:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(v5, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 2, 0, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("ContactsTests"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)copyWithDelegateInfos:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[CNContactsEnvironment copy](self, "copy");
  objc_msgSend(v5, "setDelegateInfos:", v4);

  objc_msgSend(v5, "setAddressBook:", 0);
  return v5;
}

- (void)setAddressBook:(id)a3
{
  objc_storeStrong((id *)&self->_addressBook, a3);
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setSuggestionsService:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsService, a3);
}

- (void)setSiriIntelligenceSettings:(id)a3
{
  objc_storeStrong((id *)&self->_siriIntelligenceSettings, a3);
}

- (void)setDelegateInfos:(id)a3
{
  objc_storeStrong((id *)&self->_delegateInfos, a3);
}

- (CNiOSABPredicateRunner)abPredicateRunner
{
  return self->_abPredicateRunner;
}

- (void)setAbPredicateRunner:(id)a3
{
  objc_storeStrong((id *)&self->_abPredicateRunner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggerProvider, 0);
  objc_storeStrong((id *)&self->_abPredicateRunner, 0);
  objc_storeStrong((id *)&self->_delegateInfos, 0);
  objc_storeStrong((id *)&self->_siriIntelligenceSettings, 0);
  objc_storeStrong((id *)&self->_suggestionsService, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_addressBook, 0);
}

@end
