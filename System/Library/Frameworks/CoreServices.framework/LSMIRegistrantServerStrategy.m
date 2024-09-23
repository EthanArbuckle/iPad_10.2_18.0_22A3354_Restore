@implementation LSMIRegistrantServerStrategy

- (id)preUnregistrationContextForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_prepareApplicationProxiesForNotification:identifiers:withPlugins:", 0, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)runSyncBlockInWriteContext:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[LSDBExecutionContext sharedServerInstance]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__LSMIRegistrantServerStrategy_runSyncBlockInWriteContext___block_invoke;
  v6[3] = &unk_1E1041740;
  v5 = v3;
  v7 = v5;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v4, v6);

}

void __59__LSMIRegistrantServerStrategy_runSyncBlockInWriteContext___block_invoke(uint64_t a1)
{
  LSMIResultRegistrantServerDatabaseContextProviding *v2;

  v2 = objc_alloc_init(LSMIResultRegistrantServerDatabaseContextProviding);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)notificationJournallerForBundleIdentifier:(id)a3 registeringPlaceholder:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  _LSRegistrationNotificationJournaller *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[_LSRegistrationNotificationJournaller initWithPrimaryBundleID:placeholder:]([_LSRegistrationNotificationJournaller alloc], "initWithPrimaryBundleID:placeholder:", v5, v4);

  return v6;
}

@end
