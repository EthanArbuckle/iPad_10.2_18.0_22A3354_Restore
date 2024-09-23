@implementation CNUIUserActionDiscoveringEnvironment

- (CNUIRTTUtilities)ttyUtilities
{
  return self->_ttyUtilities;
}

- (CNUIIDSContactPropertyResolver)idsContactPropertyResolver
{
  return self->_idsContactPropertyResolver;
}

- (CNSchedulerProvider)highLatencySchedulerProvider
{
  return self->_highLatencySchedulerProvider;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (id)copyWithContactStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNUIUserActionDiscoveringEnvironment *v13;
  void *v15;
  CNUIUserActionDiscoveringEnvironment *v16;

  v4 = a3;
  v16 = [CNUIUserActionDiscoveringEnvironment alloc];
  -[CNUIUserActionDiscoveringEnvironment applicationWorkspace](self, "applicationWorkspace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDiscoveringEnvironment callProviderManager](self, "callProviderManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDiscoveringEnvironment idsContactPropertyResolver](self, "idsContactPropertyResolver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDiscoveringEnvironment profileConnection](self, "profileConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDiscoveringEnvironment schedulerProvider](self, "schedulerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDiscoveringEnvironment highLatencySchedulerProvider](self, "highLatencySchedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDiscoveringEnvironment capabilities](self, "capabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDiscoveringEnvironment defaultUserActionFetcher](self, "defaultUserActionFetcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDiscoveringEnvironment ttyUtilities](self, "ttyUtilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CNUIUserActionDiscoveringEnvironment initWithApplicationWorkspace:callProviderManager:idsContactPropertyResolver:profileConnection:contactStore:schedulerProvider:highLatencySchedulerProvider:capabilities:defaultUserActionFetcher:ttyUtilities:](v16, "initWithApplicationWorkspace:callProviderManager:idsContactPropertyResolver:profileConnection:contactStore:schedulerProvider:highLatencySchedulerProvider:capabilities:defaultUserActionFetcher:ttyUtilities:", v15, v5, v6, v7, v4, v8, v9, v10, v11, v12);

  return v13;
}

- (CNCapabilities)capabilities
{
  return self->_capabilities;
}

- (CNUIDefaultUserActionFetcher)defaultUserActionFetcher
{
  return self->_defaultUserActionFetcher;
}

- (CNUIUserActionTargetDiscovering)targetDiscoveringHelper
{
  return self->_targetDiscoveringHelper;
}

- (CNMCProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (CNUIUserActionDiscoveringEnvironment)initWithIDSAvailabilityProvider:(id)a3 schedulerProvider:(id)a4 capabilities:(id)a5 defaultUserActionFetcher:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  CNLSApplicationWorkspace *v17;
  CNTUCallProviderManager *v18;
  CNUIIDSContactPropertyResolver *v19;
  CNMCProfileConnection *v20;
  void *v21;
  CNUIUserActionDiscoveringEnvironment *v22;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v9 = a4;
  v26 = a6;
  v25 = a5;
  v10 = a3;
  v24 = (void *)objc_msgSend(v9, "newSerialSchedulerWithName:", CFSTR("com.apple.contacts.ContactsUICore.CNUIUserActionDiscoveringHighLatencyScheduler"));
  v11 = objc_alloc(MEMORY[0x1E0D13B70]);
  objc_msgSend(v9, "mainThreadScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "immediateScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __128__CNUIUserActionDiscoveringEnvironment_initWithIDSAvailabilityProvider_schedulerProvider_capabilities_defaultUserActionFetcher___block_invoke;
  v32[3] = &unk_1EA603D00;
  v33 = v9;
  v30[0] = v14;
  v30[1] = 3221225472;
  v30[2] = __128__CNUIUserActionDiscoveringEnvironment_initWithIDSAvailabilityProvider_schedulerProvider_capabilities_defaultUserActionFetcher___block_invoke_2;
  v30[3] = &unk_1EA603D00;
  v31 = v33;
  v28[0] = v14;
  v28[1] = 3221225472;
  v28[2] = __128__CNUIUserActionDiscoveringEnvironment_initWithIDSAvailabilityProvider_schedulerProvider_capabilities_defaultUserActionFetcher___block_invoke_3;
  v28[3] = &unk_1EA6046E0;
  v29 = v31;
  v15 = v31;
  v16 = (void *)objc_msgSend(v11, "initWithBackgroundScheduler:mainThreadScheduler:immediateScheduler:serialSchedulerProvider:synchronousSerialSchedulerProvider:readerWriterSchedulerProvider:", v24, v12, v13, v32, v30, v28);

  v17 = objc_alloc_init(CNLSApplicationWorkspace);
  v18 = objc_alloc_init(CNTUCallProviderManager);
  v19 = -[CNUIIDSContactPropertyResolver initWithIDSAvailabilityProvider:]([CNUIIDSContactPropertyResolver alloc], "initWithIDSAvailabilityProvider:", v10);

  v20 = objc_alloc_init(CNMCProfileConnection);
  +[CNUIRTTUtilities defaultUtilities](CNUIRTTUtilities, "defaultUtilities");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[CNUIUserActionDiscoveringEnvironment initWithApplicationWorkspace:callProviderManager:idsContactPropertyResolver:profileConnection:contactStore:schedulerProvider:highLatencySchedulerProvider:capabilities:defaultUserActionFetcher:ttyUtilities:](self, "initWithApplicationWorkspace:callProviderManager:idsContactPropertyResolver:profileConnection:contactStore:schedulerProvider:highLatencySchedulerProvider:capabilities:defaultUserActionFetcher:ttyUtilities:", v17, v18, v19, v20, 0, v15, v16, v25, v26, v21);

  return v22;
}

id __128__CNUIUserActionDiscoveringEnvironment_initWithIDSAvailabilityProvider_schedulerProvider_capabilities_defaultUserActionFetcher___block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newSerialSchedulerWithName:", a2);
}

id __128__CNUIUserActionDiscoveringEnvironment_initWithIDSAvailabilityProvider_schedulerProvider_capabilities_defaultUserActionFetcher___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newSynchronousSerialSchedulerWithName:", a2);
}

- (CNUIUserActionDiscoveringEnvironment)initWithApplicationWorkspace:(id)a3 callProviderManager:(id)a4 idsContactPropertyResolver:(id)a5 profileConnection:(id)a6 contactStore:(id)a7 schedulerProvider:(id)a8 highLatencySchedulerProvider:(id)a9 capabilities:(id)a10 defaultUserActionFetcher:(id)a11 ttyUtilities:(id)a12
{
  id v18;
  id v19;
  id v20;
  CNUIUserActionDiscoveringEnvironment *v21;
  CNUIUserActionDiscoveringEnvironment *v22;
  CNUIUserActionTargetDiscovering *v23;
  CNUIUserActionTargetDiscovering *targetDiscoveringHelper;
  CNUIUserActionDiscoveringEnvironment *v25;
  id obj;
  id v28;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v36 = a3;
  obj = a4;
  v35 = a4;
  v31 = a5;
  v34 = a6;
  v30 = a7;
  v28 = a8;
  v33 = a8;
  v32 = a9;
  v18 = a10;
  v19 = a11;
  v20 = a12;
  v37.receiver = self;
  v37.super_class = (Class)CNUIUserActionDiscoveringEnvironment;
  v21 = -[CNUIUserActionDiscoveringEnvironment init](&v37, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_applicationWorkspace, a3);
    objc_storeStrong((id *)&v22->_callProviderManager, obj);
    objc_storeStrong((id *)&v22->_idsContactPropertyResolver, a5);
    objc_storeStrong((id *)&v22->_profileConnection, a6);
    objc_storeStrong((id *)&v22->_contactStore, a7);
    objc_storeStrong((id *)&v22->_capabilities, a10);
    objc_storeStrong((id *)&v22->_schedulerProvider, v28);
    objc_storeStrong((id *)&v22->_highLatencySchedulerProvider, a9);
    objc_storeStrong((id *)&v22->_defaultUserActionFetcher, a11);
    objc_storeStrong((id *)&v22->_ttyUtilities, a12);
    v23 = -[CNUIUserActionTargetDiscovering initWithApplicationWorkspace:callProviderManager:profileConnection:schedulerProvider:highLatencySchedulerProvider:capabilities:]([CNUIUserActionTargetDiscovering alloc], "initWithApplicationWorkspace:callProviderManager:profileConnection:schedulerProvider:highLatencySchedulerProvider:capabilities:", v36, v35, v34, v33, v32, v18);
    targetDiscoveringHelper = v22->_targetDiscoveringHelper;
    v22->_targetDiscoveringHelper = v23;

    v25 = v22;
  }

  return v22;
}

- (CNTUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (CNLSApplicationWorkspace)applicationWorkspace
{
  return self->_applicationWorkspace;
}

- (CNUIUserActionDiscoveringEnvironment)init
{
  CNUIIDSAvailabilityProvider *v3;
  void *v4;
  CNCapabilities *v5;
  CNUIDefaultUserActionFetcher *v6;
  CNUIUserActionDiscoveringEnvironment *v7;

  v3 = objc_alloc_init(CNUIIDSAvailabilityProvider);
  objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(CNCapabilities);
  v6 = objc_alloc_init(CNUIDefaultUserActionFetcher);
  v7 = -[CNUIUserActionDiscoveringEnvironment initWithIDSAvailabilityProvider:schedulerProvider:capabilities:defaultUserActionFetcher:](self, "initWithIDSAvailabilityProvider:schedulerProvider:capabilities:defaultUserActionFetcher:", v3, v4, v5, v6);

  return v7;
}

id __128__CNUIUserActionDiscoveringEnvironment_initWithIDSAvailabilityProvider_schedulerProvider_capabilities_defaultUserActionFetcher___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newReaderWriterSchedulerWithName:", a2);
}

- (CNContactStore)contactStore
{
  cn_objectResultWithObjectLock();
  return (CNContactStore *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __52__CNUIUserActionDiscoveringEnvironment_contactStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyContactStore");
}

- (id)nts_lazyContactStore
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDiscoveringHelper, 0);
  objc_storeStrong((id *)&self->_ttyUtilities, 0);
  objc_storeStrong((id *)&self->_defaultUserActionFetcher, 0);
  objc_storeStrong((id *)&self->_highLatencySchedulerProvider, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong((id *)&self->_idsContactPropertyResolver, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
