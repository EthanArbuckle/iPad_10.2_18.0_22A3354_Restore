@implementation CNUIContactsEnvironment

uint64_t __49__CNUIContactsEnvironment_contactChangesNotifier__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyContactChangesNotifier");
}

uint64_t __51__CNUIContactsEnvironment_defaultSchedulerProvider__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyDefaultSchedulerProvider");
}

uint64_t __45__CNUIContactsEnvironment_inProcessFavorites__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyInProcessFavorites");
}

+ (id)currentEnvironment
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CNUIContactsEnvironment_currentEnvironment__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentEnvironment_cn_once_token_7 != -1)
    dispatch_once(&currentEnvironment_cn_once_token_7, block);
  return (id)currentEnvironment_cn_once_object_7;
}

- (CNContactChangesNotifier)contactChangesNotifier
{
  cn_objectResultWithObjectLock();
  return (CNContactChangesNotifier *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)runningInContactsAppOniPad
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1 && CNUIIsContacts();

  return v3;
}

- (CNUIApplicationLaunchCheckin)launchCheckinRegistrar
{
  return self->_launchCheckinRegistrar;
}

uint64_t __50__CNUIContactsEnvironment_cachingLikenessRenderer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyCachingLikenessRenderer");
}

- (CNCollation)collation
{
  cn_objectResultWithObjectLock();
  return (CNCollation *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __36__CNUIContactsEnvironment_collation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyCollation");
}

- (CNFavorites)inProcessFavorites
{
  cn_objectResultWithObjectLock();
  return (CNFavorites *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __39__CNUIContactsEnvironment_contactStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyContactStore");
}

uint64_t __55__CNUIContactsEnvironment_actionDiscoveringEnvironment__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyActionDiscoveringEnvironment");
}

uint64_t __51__CNUIContactsEnvironment_inProcessActivityManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyInProcessActivityManager");
}

uint64_t __50__CNUIContactsEnvironment_idsAvailabilityProvider__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyIDSAvailabilityProvider");
}

uint64_t __50__CNUIContactsEnvironment_cachingLikenessResolver__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyCachingLikenessResolver");
}

uint64_t __48__CNUIContactsEnvironment_inProcessContactStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyInProcessContactStore");
}

void __45__CNUIContactsEnvironment_currentEnvironment__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "makeCurrentEnvironment");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)currentEnvironment_cn_once_object_7;
  currentEnvironment_cn_once_object_7 = v1;

}

+ (id)makeCurrentEnvironment
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C972B0], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContactsEnvironment:", v3);

  return v4;
}

- (CNUIContactsEnvironment)initWithContactsEnvironment:(id)a3
{
  id v5;
  CNUIContactsEnvironment *v6;
  CNUIContactsEnvironment *v7;
  CNUIContactsEnvironment *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIContactsEnvironment;
  v6 = -[CNUIContactsEnvironment init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cnEnvironment, a3);
    v8 = v7;
  }

  return v7;
}

- (CNUILikenessRendering)cachingLikenessRenderer
{
  cn_objectResultWithObjectLock();
  return (CNUILikenessRendering *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)nts_lazyRecentsManager
{
  CNUICoreRecentsManager *recentsManager;
  CNUICoreRecentsManager *v4;
  CNUICoreRecentsManager *v5;

  recentsManager = self->_recentsManager;
  if (!recentsManager)
  {
    -[CNUIContactsEnvironment nts_makeRecentsManager](self, "nts_makeRecentsManager");
    v4 = (CNUICoreRecentsManager *)objc_claimAutoreleasedReturnValue();
    v5 = self->_recentsManager;
    self->_recentsManager = v4;

    recentsManager = self->_recentsManager;
  }
  return recentsManager;
}

- (id)nts_makeRecentsManager
{
  void *v2;
  void *v3;

  -[CNUIContactsEnvironment nts_lazyDefaultSchedulerProvider](self, "nts_lazyDefaultSchedulerProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIContactsEnvironmentServicesProvider recentsManagerWithSchedulerProvider:](CNUIContactsEnvironmentServicesProvider, "recentsManagerWithSchedulerProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nts_lazyActionDiscoveringEnvironment
{
  CNUIUserActionDiscoveringEnvironment *actionDiscoveringEnvironment;
  CNUIUserActionDiscoveringEnvironment *v4;
  CNUIUserActionDiscoveringEnvironment *v5;

  actionDiscoveringEnvironment = self->_actionDiscoveringEnvironment;
  if (!actionDiscoveringEnvironment)
  {
    -[CNUIContactsEnvironment nts_makeActionDiscoveringEnvironment](self, "nts_makeActionDiscoveringEnvironment");
    v4 = (CNUIUserActionDiscoveringEnvironment *)objc_claimAutoreleasedReturnValue();
    v5 = self->_actionDiscoveringEnvironment;
    self->_actionDiscoveringEnvironment = v4;

    actionDiscoveringEnvironment = self->_actionDiscoveringEnvironment;
  }
  return actionDiscoveringEnvironment;
}

- (id)nts_makeActionDiscoveringEnvironment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CNUIContactsEnvironment nts_lazyIDSAvailabilityProvider](self, "nts_lazyIDSAvailabilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIContactsEnvironment nts_lazyDefaultSchedulerProvider](self, "nts_lazyDefaultSchedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIContactsEnvironment nts_lazyCapabilities](self, "nts_lazyCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIContactsEnvironment nts_lazyDefaultUserActionFetcher](self, "nts_lazyDefaultUserActionFetcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13D78]), "initWithIDSAvailabilityProvider:schedulerProvider:capabilities:defaultUserActionFetcher:", v3, v4, v5, v6);

  return v7;
}

- (id)nts_lazyIDSAvailabilityProvider
{
  CNUIIDSAvailabilityProvider *idsAvailabilityProvider;
  id v4;
  void *v5;
  CNUIIDSAvailabilityProvider *v6;
  CNUIIDSAvailabilityProvider *v7;

  idsAvailabilityProvider = self->_idsAvailabilityProvider;
  if (!idsAvailabilityProvider)
  {
    v4 = objc_alloc(MEMORY[0x1E0D13D00]);
    +[CNUIContactsEnvironmentServicesProvider idsIDQueryControllerWrapper](CNUIContactsEnvironmentServicesProvider, "idsIDQueryControllerWrapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (CNUIIDSAvailabilityProvider *)objc_msgSend(v4, "initWithQueryControllerWrapper:", v5);
    v7 = self->_idsAvailabilityProvider;
    self->_idsAvailabilityProvider = v6;

    idsAvailabilityProvider = self->_idsAvailabilityProvider;
  }
  return idsAvailabilityProvider;
}

- (id)nts_lazyDefaultUserActionFetcher
{
  CNUIDefaultUserActionFetcher *defaultUserActionFetcher;
  CNUIDefaultUserActionFetcher *v4;
  CNUIDefaultUserActionFetcher *v5;

  defaultUserActionFetcher = self->_defaultUserActionFetcher;
  if (!defaultUserActionFetcher)
  {
    +[CNUIContactsEnvironmentServicesProvider defaultUserActionFetcher](CNUIContactsEnvironmentServicesProvider, "defaultUserActionFetcher");
    v4 = (CNUIDefaultUserActionFetcher *)objc_claimAutoreleasedReturnValue();
    v5 = self->_defaultUserActionFetcher;
    self->_defaultUserActionFetcher = v4;

    defaultUserActionFetcher = self->_defaultUserActionFetcher;
  }
  return defaultUserActionFetcher;
}

- (id)nts_lazyCapabilities
{
  CNCapabilities *capabilities;
  CNCapabilities *v4;
  CNCapabilities *v5;

  capabilities = self->_capabilities;
  if (!capabilities)
  {
    +[CNUIContactsEnvironmentServicesProvider capabilities](CNUIContactsEnvironmentServicesProvider, "capabilities");
    v4 = (CNCapabilities *)objc_claimAutoreleasedReturnValue();
    v5 = self->_capabilities;
    self->_capabilities = v4;

    capabilities = self->_capabilities;
  }
  return capabilities;
}

- (id)nts_lazyInProcessActivityManager
{
  CNUIUserActivityManager *inProcessActivityManager;
  void *v4;
  void *v5;
  CNUIUserActivityManager *v6;
  CNUIUserActivityManager *v7;

  inProcessActivityManager = self->_inProcessActivityManager;
  if (!inProcessActivityManager)
  {
    -[CNUIContactsEnvironment nts_lazyInProcessContactStore](self, "nts_lazyInProcessContactStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIContactsEnvironment nts_lazyApplicationWorkspace](self, "nts_lazyApplicationWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (CNUIUserActivityManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13DA0]), "initWithContactStore:applicationWorkspace:", v4, v5);
    v7 = self->_inProcessActivityManager;
    self->_inProcessActivityManager = v6;

    inProcessActivityManager = self->_inProcessActivityManager;
  }
  return inProcessActivityManager;
}

- (id)nts_lazyApplicationWorkspace
{
  CNLSApplicationWorkspace *applicationWorkspace;
  CNLSApplicationWorkspace *v4;
  CNLSApplicationWorkspace *v5;

  applicationWorkspace = self->_applicationWorkspace;
  if (!applicationWorkspace)
  {
    +[CNUIContactsEnvironmentServicesProvider applicationWorkspace](CNUIContactsEnvironmentServicesProvider, "applicationWorkspace");
    v4 = (CNLSApplicationWorkspace *)objc_claimAutoreleasedReturnValue();
    v5 = self->_applicationWorkspace;
    self->_applicationWorkspace = v4;

    applicationWorkspace = self->_applicationWorkspace;
  }
  return applicationWorkspace;
}

- (id)nts_lazyContactChangesNotifier
{
  CNContactChangesNotifier *contactChangesNotifier;
  CNContactChangesNotifier *v4;
  CNContactChangesNotifier *v5;

  contactChangesNotifier = self->_contactChangesNotifier;
  if (!contactChangesNotifier)
  {
    -[CNUIContactsEnvironment nts_makeContactChangesNotifier](self, "nts_makeContactChangesNotifier");
    v4 = (CNContactChangesNotifier *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contactChangesNotifier;
    self->_contactChangesNotifier = v4;

    contactChangesNotifier = self->_contactChangesNotifier;
  }
  return contactChangesNotifier;
}

- (id)nts_lazyCachingLikenessRenderer
{
  CNUILikenessRendering *cachingLikenessRenderer;
  void *v4;
  void *v5;
  void *v6;
  CNUILikenessRendering *v7;
  CNUILikenessRendering *v8;

  cachingLikenessRenderer = self->_cachingLikenessRenderer;
  if (!cachingLikenessRenderer)
  {
    v4 = (void *)MEMORY[0x1E0D13D28];
    -[CNUIContactsEnvironment nts_lazyCachingLikenessResolver](self, "nts_lazyCachingLikenessResolver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIContactsEnvironment nts_lazyDefaultSchedulerProvider](self, "nts_lazyDefaultSchedulerProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cachingRendererWithLikenessResolver:schedulerProvider:", v5, v6);
    v7 = (CNUILikenessRendering *)objc_claimAutoreleasedReturnValue();
    v8 = self->_cachingLikenessRenderer;
    self->_cachingLikenessRenderer = v7;

    cachingLikenessRenderer = self->_cachingLikenessRenderer;
  }
  return cachingLikenessRenderer;
}

- (id)nts_lazyCachingLikenessResolver
{
  CNUIPRLikenessResolver *cachingLikenessResolver;
  CNUIPRLikenessResolver *v4;
  CNUIPRLikenessResolver *v5;

  cachingLikenessResolver = self->_cachingLikenessResolver;
  if (!cachingLikenessResolver)
  {
    -[CNUIContactsEnvironment nts_makeCachingLikenessResolver](self, "nts_makeCachingLikenessResolver");
    v4 = (CNUIPRLikenessResolver *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachingLikenessResolver;
    self->_cachingLikenessResolver = v4;

    cachingLikenessResolver = self->_cachingLikenessResolver;
  }
  return cachingLikenessResolver;
}

- (id)nts_makeCachingLikenessResolver
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNUIContactsEnvironment nts_lazyInProcessContactStore](self, "nts_lazyInProcessContactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIContactsEnvironment nts_lazyDefaultSchedulerProvider](self, "nts_lazyDefaultSchedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13D48]), "initWithContactStore:schedulerProvider:", v3, v4);
  objc_msgSend(v5, "setProhibitedSources:", 8);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13D50]), "initWithLikenessResolver:", v5);

  return v6;
}

- (id)nts_makeContactChangesNotifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNUIContactsEnvironment nts_lazyInProcessContactStore](self, "nts_lazyInProcessContactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIContactsEnvironment nts_lazyDefaultSchedulerProvider](self, "nts_lazyDefaultSchedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97208]), "initWithContactStore:downstreamScheduler:schedulerProvider:", v3, v5, v4);

  return v6;
}

- (id)nts_lazyDefaultSchedulerProvider
{
  CNUISchedulerProvider *defaultSchedulerProvider;
  CNUISchedulerProvider *v4;
  CNUISchedulerProvider *v5;

  defaultSchedulerProvider = self->_defaultSchedulerProvider;
  if (!defaultSchedulerProvider)
  {
    v4 = objc_alloc_init(CNUISchedulerProvider);
    v5 = self->_defaultSchedulerProvider;
    self->_defaultSchedulerProvider = v4;

    -[CNUISchedulerProvider resumeBackgroundScheduler](self->_defaultSchedulerProvider, "resumeBackgroundScheduler");
    defaultSchedulerProvider = self->_defaultSchedulerProvider;
  }
  return defaultSchedulerProvider;
}

- (id)nts_lazyInProcessContactStore
{
  CNContactStore *inProcessContactStore;
  id v4;
  void *v5;
  CNContactStore *v6;
  CNContactStore *v7;

  inProcessContactStore = self->_inProcessContactStore;
  if (!inProcessContactStore)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C972A0]);
    -[CNUIContactsEnvironment cnEnvironment](self, "cnEnvironment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnvironment:", v5);

    objc_msgSend(v4, "setIncludeLocalContacts:", 1);
    objc_msgSend(v4, "setUseInProcessMapperExclusively:", 1);
    v6 = (CNContactStore *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v4);
    v7 = self->_inProcessContactStore;
    self->_inProcessContactStore = v6;

    inProcessContactStore = self->_inProcessContactStore;
  }
  return inProcessContactStore;
}

- (id)nts_lazyContactStore
{
  CNContactStore *contactStore;
  id v4;
  void *v5;
  CNContactStore *v6;
  CNContactStore *v7;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C972A0]);
    -[CNUIContactsEnvironment cnEnvironment](self, "cnEnvironment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnvironment:", v5);

    v6 = (CNContactStore *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v4);
    v7 = self->_contactStore;
    self->_contactStore = v6;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (CNContactsEnvironment)cnEnvironment
{
  return self->_cnEnvironment;
}

- (id)nts_lazyInProcessFavorites
{
  CNFavorites *inProcessFavorites;
  void *v4;
  CNFavorites *v5;
  CNFavorites *v6;

  inProcessFavorites = self->_inProcessFavorites;
  if (!inProcessFavorites)
  {
    -[CNUIContactsEnvironment nts_lazyInProcessContactStore](self, "nts_lazyInProcessContactStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (CNFavorites *)objc_msgSend(objc_alloc(MEMORY[0x1E0C972F8]), "initWithContactStore:", v4);
    v6 = self->_inProcessFavorites;
    self->_inProcessFavorites = v5;

    inProcessFavorites = self->_inProcessFavorites;
  }
  return inProcessFavorites;
}

- (CNUIUserActivityManager)inProcessActivityManager
{
  cn_objectResultWithObjectLock();
  return (CNUIUserActivityManager *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __45__CNUIContactsEnvironment_healthStoreManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyHealthStoreManager");
}

uint64_t __41__CNUIContactsEnvironment_recentsManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyRecentsManager");
}

uint64_t __40__CNUIContactsEnvironment_geminiManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyGeminiManager");
}

- (CNHealthStoreManager)healthStoreManager
{
  cn_objectResultWithObjectLock();
  return (CNHealthStoreManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLaunchCheckinRegistrar:(id)a3
{
  objc_storeStrong((id *)&self->_launchCheckinRegistrar, a3);
}

- (id)nts_lazyCollation
{
  CNCollation *collation;
  UCollator *v4;
  CNCollation *v5;
  CNCollation *v6;

  collation = self->_collation;
  if (!collation)
  {
    v4 = -[CNUIContactsEnvironment nts_lazySortCollator](self, "nts_lazySortCollator");
    v5 = (CNCollation *)objc_msgSend(objc_alloc(MEMORY[0x1E0D139D0]), "initWithCollator:", v4);
    v6 = self->_collation;
    self->_collation = v5;

    collation = self->_collation;
  }
  return collation;
}

- (UCollator)nts_lazySortCollator
{
  UCollator *result;
  void *v4;

  result = self->_sortCollator;
  if (!result)
  {
    objc_msgSend(MEMORY[0x1E0D139D0], "defaultSortCollatorIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_sortCollator = (UCollator *)CNCreateCollatorWithPreferredLocale();

    return self->_sortCollator;
  }
  return result;
}

- (CNGeminiManager)geminiManager
{
  cn_objectResultWithObjectLock();
  return (CNGeminiManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (CNContactStore)contactStore
{
  cn_objectResultWithObjectLock();
  return (CNContactStore *)(id)objc_claimAutoreleasedReturnValue();
}

- (CNUISchedulerProvider)defaultSchedulerProvider
{
  cn_objectResultWithObjectLock();
  return (CNUISchedulerProvider *)(id)objc_claimAutoreleasedReturnValue();
}

- (CNUIPRLikenessResolver)cachingLikenessResolver
{
  cn_objectResultWithObjectLock();
  return (CNUIPRLikenessResolver *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)nts_lazyHealthStoreManager
{
  CNHealthStoreManager *healthStoreManager;
  CNHealthStoreManager *v4;
  CNHealthStoreManager *v5;

  healthStoreManager = self->_healthStoreManager;
  if (!healthStoreManager)
  {
    v4 = -[CNHealthStoreManager initWithEnvironment:]([CNHealthStoreManager alloc], "initWithEnvironment:", self);
    v5 = self->_healthStoreManager;
    self->_healthStoreManager = v4;

    -[CNHealthStoreManager startListeningForChanges](self->_healthStoreManager, "startListeningForChanges");
    healthStoreManager = self->_healthStoreManager;
  }
  return healthStoreManager;
}

- (CNUIUserActionDiscoveringEnvironment)actionDiscoveringEnvironment
{
  cn_objectResultWithObjectLock();
  return (CNUIUserActionDiscoveringEnvironment *)(id)objc_claimAutoreleasedReturnValue();
}

- (CNUIIDSAvailabilityProvider)idsAvailabilityProvider
{
  cn_objectResultWithObjectLock();
  return (CNUIIDSAvailabilityProvider *)(id)objc_claimAutoreleasedReturnValue();
}

- (CNContactStore)inProcessContactStore
{
  cn_objectResultWithObjectLock();
  return (CNContactStore *)(id)objc_claimAutoreleasedReturnValue();
}

- (CNUICoreRecentsManager)recentsManager
{
  cn_objectResultWithObjectLock();
  return (CNUICoreRecentsManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)nts_lazyGeminiManager
{
  CNGeminiManager *geminiManager;
  CNGeminiManager *v4;
  CNGeminiManager *v5;

  geminiManager = self->_geminiManager;
  if (!geminiManager)
  {
    v4 = (CNGeminiManager *)objc_alloc_init(MEMORY[0x1E0C97310]);
    v5 = self->_geminiManager;
    self->_geminiManager = v4;

    geminiManager = self->_geminiManager;
  }
  return geminiManager;
}

- (CNUIContactsEnvironment)init
{
  void *v3;
  CNUIContactsEnvironment *v4;

  objc_msgSend(MEMORY[0x1E0C972B0], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNUIContactsEnvironment initWithContactsEnvironment:](self, "initWithContactsEnvironment:", v3);

  return v4;
}

- (CNUIPlaceholderProviderFactory)placeholderProviderFactory
{
  cn_objectResultWithObjectLock();
  return (CNUIPlaceholderProviderFactory *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)nts_lazyPlaceholderProviderFactory
{
  CNUIPlaceholderProviderFactory *placeholderProviderFactory;
  CNUIPlaceholderProviderFactory *v4;
  CNUIPlaceholderProviderFactory *v5;

  placeholderProviderFactory = self->_placeholderProviderFactory;
  if (!placeholderProviderFactory)
  {
    v4 = (CNUIPlaceholderProviderFactory *)objc_alloc_init(MEMORY[0x1E0D13D58]);
    v5 = self->_placeholderProviderFactory;
    self->_placeholderProviderFactory = v4;

    placeholderProviderFactory = self->_placeholderProviderFactory;
  }
  return placeholderProviderFactory;
}

- (CNUILikenessRendering)cachingMonogramRenderer
{
  cn_objectResultWithObjectLock();
  return (CNUILikenessRendering *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)nts_lazyCachingMonogramRenderer
{
  CNUILikenessRendering *cachingMonogramRenderer;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNUILikenessRendering *v10;
  CNUILikenessRendering *v11;

  cachingMonogramRenderer = self->_cachingMonogramRenderer;
  if (!cachingMonogramRenderer)
  {
    -[CNUIContactsEnvironment nts_lazyInProcessContactStore](self, "nts_lazyInProcessContactStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIContactsEnvironment nts_lazyDefaultSchedulerProvider](self, "nts_lazyDefaultSchedulerProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13D48]), "initWithContactStore:schedulerProvider:", v4, v5);
    objc_msgSend(v6, "setProhibitedSources:", 9);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13D50]), "initWithLikenessResolver:", v6);
    v8 = (void *)MEMORY[0x1E0D13D28];
    -[CNUIContactsEnvironment nts_lazyDefaultSchedulerProvider](self, "nts_lazyDefaultSchedulerProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachingRendererWithLikenessResolver:schedulerProvider:", v7, v9);
    v10 = (CNUILikenessRendering *)objc_claimAutoreleasedReturnValue();
    v11 = self->_cachingMonogramRenderer;
    self->_cachingMonogramRenderer = v10;

    cachingMonogramRenderer = self->_cachingMonogramRenderer;
  }
  return cachingMonogramRenderer;
}

- (CNUIMeContactMonitor)meMonitor
{
  return 0;
}

- (CNLSApplicationWorkspace)applicationWorkspace
{
  cn_objectResultWithObjectLock();
  return (CNLSApplicationWorkspace *)(id)objc_claimAutoreleasedReturnValue();
}

- (CNCapabilities)capabilities
{
  cn_objectResultWithObjectLock();
  return (CNCapabilities *)(id)objc_claimAutoreleasedReturnValue();
}

- (CNUIDefaultUserActionFetcher)defaultUserActionFetcher
{
  cn_objectResultWithObjectLock();
  return (CNUIDefaultUserActionFetcher *)(id)objc_claimAutoreleasedReturnValue();
}

- (CNUIExternalComponentsFactory)componentsFactory
{
  cn_objectResultWithObjectLock();
  return (CNUIExternalComponentsFactory *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)nts_lazyComponentsFactory
{
  CNUIExternalComponentsFactory *componentsFactory;
  CNUIExternalComponentsFactory *v4;
  CNUIExternalComponentsFactory *v5;

  componentsFactory = self->_componentsFactory;
  if (!componentsFactory)
  {
    v4 = objc_alloc_init(CNUIExternalComponentsFactory);
    v5 = self->_componentsFactory;
    self->_componentsFactory = v4;

    componentsFactory = self->_componentsFactory;
  }
  return componentsFactory;
}

- (UCollator)sortCollator
{
  UCollator *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  cn_runWithObjectLock();
  v2 = (UCollator *)v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CNReleaseCollator();
  v3.receiver = self;
  v3.super_class = (Class)CNUIContactsEnvironment;
  -[CNUIContactsEnvironment dealloc](&v3, sel_dealloc);
}

- (CNAvatarPosterCarouselFingerprintCache)likenessCarouselFingerprintCache
{
  cn_objectResultWithObjectLock();
  return (CNAvatarPosterCarouselFingerprintCache *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)nts_lazyLikenessCarouselFingerprintCache
{
  CNAvatarPosterCarouselFingerprintCache *likenessCarouselFingerprintCache;
  void *v4;
  CNAvatarPosterCarouselFingerprintCache *v5;
  CNAvatarPosterCarouselFingerprintCache *v6;

  likenessCarouselFingerprintCache = self->_likenessCarouselFingerprintCache;
  if (!likenessCarouselFingerprintCache)
  {
    -[CNUIContactsEnvironment nts_lazyInProcessContactStore](self, "nts_lazyInProcessContactStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNAvatarPosterCarouselFingerprintCache cacheWithCapacity:contactStore:](CNAvatarPosterCarouselFingerprintCache, "cacheWithCapacity:contactStore:", 100, v4);
    v5 = (CNAvatarPosterCarouselFingerprintCache *)objc_claimAutoreleasedReturnValue();
    v6 = self->_likenessCarouselFingerprintCache;
    self->_likenessCarouselFingerprintCache = v5;

    likenessCarouselFingerprintCache = self->_likenessCarouselFingerprintCache;
  }
  return likenessCarouselFingerprintCache;
}

- (void)setDefaultSchedulerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSchedulerProvider, a3);
}

- (void)setPlaceholderProviderFactory:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderProviderFactory, a3);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setInProcessContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_inProcessContactStore, a3);
}

- (void)setInProcessFavorites:(id)a3
{
  objc_storeStrong((id *)&self->_inProcessFavorites, a3);
}

- (void)setInProcessActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_inProcessActivityManager, a3);
}

- (void)setMeMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_meMonitor, a3);
}

- (void)setCachingLikenessResolver:(id)a3
{
  objc_storeStrong((id *)&self->_cachingLikenessResolver, a3);
}

- (void)setCachingLikenessRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_cachingLikenessRenderer, a3);
}

- (void)setCachingMonogramRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_cachingMonogramRenderer, a3);
}

- (void)setActionDiscoveringEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_actionDiscoveringEnvironment, a3);
}

- (void)setIdsAvailabilityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_idsAvailabilityProvider, a3);
}

- (void)setApplicationWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_applicationWorkspace, a3);
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (void)setDefaultUserActionFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_defaultUserActionFetcher, a3);
}

- (void)setContactChangesNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_contactChangesNotifier, a3);
}

- (void)setRecentsManager:(id)a3
{
  objc_storeStrong((id *)&self->_recentsManager, a3);
}

- (void)setComponentsFactory:(id)a3
{
  objc_storeStrong((id *)&self->_componentsFactory, a3);
}

- (void)setSortCollator:(UCollator *)a3
{
  self->_sortCollator = a3;
}

- (void)setCollation:(id)a3
{
  objc_storeStrong((id *)&self->_collation, a3);
}

- (void)setHealthStoreManager:(id)a3
{
  objc_storeStrong((id *)&self->_healthStoreManager, a3);
}

- (void)setLikenessCarouselFingerprintCache:(id)a3
{
  objc_storeStrong((id *)&self->_likenessCarouselFingerprintCache, a3);
}

- (CNAuthorizationContext)authorizationContext
{
  return self->_authorizationContext;
}

- (void)setAuthorizationContext:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationContext, a3);
}

- (void)setGeminiManager:(id)a3
{
  objc_storeStrong((id *)&self->_geminiManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnEnvironment, 0);
  objc_storeStrong((id *)&self->_geminiManager, 0);
  objc_storeStrong((id *)&self->_authorizationContext, 0);
  objc_storeStrong((id *)&self->_likenessCarouselFingerprintCache, 0);
  objc_storeStrong((id *)&self->_launchCheckinRegistrar, 0);
  objc_storeStrong((id *)&self->_healthStoreManager, 0);
  objc_storeStrong((id *)&self->_collation, 0);
  objc_storeStrong((id *)&self->_componentsFactory, 0);
  objc_storeStrong((id *)&self->_recentsManager, 0);
  objc_storeStrong((id *)&self->_contactChangesNotifier, 0);
  objc_storeStrong((id *)&self->_defaultUserActionFetcher, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_idsAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_actionDiscoveringEnvironment, 0);
  objc_storeStrong((id *)&self->_cachingMonogramRenderer, 0);
  objc_storeStrong((id *)&self->_cachingLikenessRenderer, 0);
  objc_storeStrong((id *)&self->_cachingLikenessResolver, 0);
  objc_storeStrong((id *)&self->_meMonitor, 0);
  objc_storeStrong((id *)&self->_inProcessActivityManager, 0);
  objc_storeStrong((id *)&self->_inProcessFavorites, 0);
  objc_storeStrong((id *)&self->_inProcessContactStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_placeholderProviderFactory, 0);
  objc_storeStrong((id *)&self->_defaultSchedulerProvider, 0);
}

uint64_t __59__CNUIContactsEnvironment_likenessCarouselFingerprintCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyLikenessCarouselFingerprintCache");
}

uint64_t __39__CNUIContactsEnvironment_sortCollator__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "nts_lazySortCollator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __44__CNUIContactsEnvironment_componentsFactory__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyComponentsFactory");
}

uint64_t __51__CNUIContactsEnvironment_defaultUserActionFetcher__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyDefaultUserActionFetcher");
}

uint64_t __39__CNUIContactsEnvironment_capabilities__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyCapabilities");
}

uint64_t __47__CNUIContactsEnvironment_applicationWorkspace__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyApplicationWorkspace");
}

uint64_t __50__CNUIContactsEnvironment_cachingMonogramRenderer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyCachingMonogramRenderer");
}

uint64_t __53__CNUIContactsEnvironment_placeholderProviderFactory__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyPlaceholderProviderFactory");
}

@end
