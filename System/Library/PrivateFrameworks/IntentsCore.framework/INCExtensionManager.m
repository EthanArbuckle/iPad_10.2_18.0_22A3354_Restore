@implementation INCExtensionManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__INCExtensionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_sharedManager;
}

- (void)fetchExtensionForIntent:(id)a3 extensionInputItems:(id)a4 requiresTCC:(BOOL)a5 completion:(id)a6
{
  -[INCExtensionManager fetchExtensionForIntent:extensionInputItems:requiresTCC:requiresTrustCheck:completion:](self, "fetchExtensionForIntent:extensionInputItems:requiresTCC:requiresTrustCheck:completion:", a3, a4, a5, 1, a6);
}

- (INCExtensionManager)init
{
  INCExtensionManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INCExtensionManager;
  v2 = -[INCExtensionManager init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("INCExtensionManagerQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)fetchExtensionForIntent:(id)a3 extensionInputItems:(id)a4 requiresTCC:(BOOL)a5 requiresTrustCheck:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  os_log_t *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  OS_dispatch_queue *queue;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  OS_dispatch_queue *v26;
  _QWORD *v27;
  OS_dispatch_queue *v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  void *v30;
  id v31;
  void *v32;
  void *v33;
  os_log_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  INCExtensionManager *v41;
  id v42;
  id v43;
  uint8_t v44[4];
  const char *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  _BYTE buf[24];
  const __CFString *v51;
  OS_dispatch_queue *v52;
  id v53;
  uint64_t v54;

  v8 = a6;
  v9 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = (os_log_t *)MEMORY[0x1E0CBD670];
  v16 = (void *)*MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    objc_msgSend(v12, "identifier");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = CFSTR("NO");
    *(_QWORD *)&buf[4] = "-[INCExtensionManager fetchExtensionForIntent:extensionInputItems:requiresTCC:requiresTrustCheck:completion:]";
    *(_DWORD *)buf = 136315650;
    if (v9)
      v20 = CFSTR("YES");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2112;
    v51 = v20;
    _os_log_impl(&dword_1B727D000, v17, OS_LOG_TYPE_INFO, "%s Fetching extension for intent with indentifier: %@, requiresTCC: %@", buf, 0x20u);

  }
  queue = self->_queue;
  v22 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __109__INCExtensionManager_fetchExtensionForIntent_extensionInputItems_requiresTCC_requiresTrustCheck_completion___block_invoke;
  v38[3] = &unk_1E6BC4008;
  v23 = v14;
  v42 = v23;
  v24 = v13;
  v39 = v24;
  v25 = v12;
  v40 = v25;
  v41 = self;
  v26 = queue;
  v27 = v38;
  *(_QWORD *)buf = v22;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___INCExtensionManagerFetchMatchingSiriExtensionForIntent_block_invoke;
  v51 = (const __CFString *)&unk_1E6BC4030;
  v28 = v26;
  v52 = v28;
  v53 = v27;
  v29 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCA5FB8](buf);
  objc_msgSend(v25, "_intents_launchIdForCurrentPlatform");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  INExtractAppInfoFromSiriLaunchId();
  v31 = v43;

  objc_msgSend(v25, "extensionBundleId");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32
    || (objc_msgSend(v31, "isEqualToString:", *MEMORY[0x1E0CBDDC8]) & 1) != 0
    || objc_msgSend(v31, "isEqualToString:", *MEMORY[0x1E0CBDDC0]))
  {

    goto LABEL_9;
  }
  INLocalAppBundleIdentifierForIntentBundleIdentifier();
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
LABEL_9:
    if (v9)
      objc_msgSend(MEMORY[0x1E0CB35D8], "_intents_matchSiriExtensionsForIntent:completion:", v25, v29);
    else
      objc_msgSend(MEMORY[0x1E0CB35D8], "_intents_matchExtensionsForIntent:requireTrustCheck:completion:", v25, v8, v29);
    goto LABEL_12;
  }
  v34 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
  {
    v36 = v34;
    objc_msgSend(v25, "launchId");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v44 = 136315650;
    v45 = "_INCExtensionManagerFetchMatchingSiriExtensionForIntent";
    v46 = 2114;
    v47 = v37;
    v48 = 2114;
    v49 = v31;
    _os_log_error_impl(&dword_1B727D000, v36, OS_LOG_TYPE_ERROR, "%s No local app to handle intent with launchID=%{public}@, bundleID=%{public}@", v44, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CBD458], 2005, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v29)[2](v29, 0, v35);

LABEL_12:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __109__INCExtensionManager_fetchExtensionForIntent_extensionInputItems_requiresTCC_requiresTrustCheck_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    v7 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[INCExtensionManager fetchExtensionForIntent:extensionInputItems:requiresTCC:requiresTrustCheck:completion:]_block_invoke";
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1B727D000, v7, OS_LOG_TYPE_INFO, "%s Found extension: %@. Starting extension connection...", buf, 0x16u);
    }
    v8 = a1[4];
    v9 = a1[5];
    v10 = (void *)a1[7];
    v11 = *(_QWORD *)(a1[6] + 8);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __109__INCExtensionManager_fetchExtensionForIntent_extensionInputItems_requiresTCC_requiresTrustCheck_completion___block_invoke_9;
    v12[3] = &unk_1E6BC3FE0;
    v14 = v10;
    v13 = v5;
    objc_msgSend(v13, "_intents_startExtensionConnectionWithExtensionInputItems:intent:queue:completion:", v8, v9, v11, v12);

  }
}

uint64_t __109__INCExtensionManager_fetchExtensionForIntent_extensionInputItems_requiresTCC_requiresTrustCheck_completion___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40);
  if (a3)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v4 + 16))(v4, 0, 0, a3);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v4 + 16))(v4, *(_QWORD *)(a1 + 32), a2);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    INLogInitIfNeeded();
}

void __36__INCExtensionManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

@end
