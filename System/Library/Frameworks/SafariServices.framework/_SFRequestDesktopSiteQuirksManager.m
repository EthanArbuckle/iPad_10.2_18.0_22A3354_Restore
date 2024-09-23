@implementation _SFRequestDesktopSiteQuirksManager

+ (_SFRequestDesktopSiteQuirksManager)sharedManager
{
  if (sharedManager_onceToken_3 != -1)
    dispatch_once(&sharedManager_onceToken_3, &__block_literal_global_65);
  return (_SFRequestDesktopSiteQuirksManager *)(id)sharedManager_sharedQuirksManager;
}

- (_SFRequestDesktopSiteQuirksManager)init
{
  _SFRequestDesktopSiteQuirksManager *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  _SFRequestDesktopSiteQuirksManager *v14;
  _SFRequestDesktopSiteQuirksManager *v15;
  _QWORD v17[4];
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_SFRequestDesktopSiteQuirksManager;
  v2 = -[_SFRequestDesktopSiteQuirksManager init](&v19, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3388]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "sf_mobileSafariFrameworkBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithName:bundle:", CFSTR("RequestDesktopSiteQuirks"), v4);

    objc_msgSend(v5, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_supportsDesktopClassBrowsing = objc_msgSend(v6, "length") != 0;

    if (v2->_supportsDesktopClassBrowsing)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safari_settingsDirectoryURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_alloc(MEMORY[0x1E0D8ABB8]);
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __42___SFRequestDesktopSiteQuirksManager_init__block_invoke;
      v17[3] = &unk_1E4AC76D8;
      v18 = v5;
      v12 = objc_msgSend(v9, "initWithDataFormat:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:snapshotClass:snapshotTransformerClass:builtInDataProvider:", 0, v8, CFSTR("RequestDesktopSiteQuirks"), CFSTR("1"), CFSTR("SFRequestDesktopSiteQuirksUpdateKey"), v10, 86400.0, v11, v17);
      remotelyUpdatableDataController = v2->_remotelyUpdatableDataController;
      v2->_remotelyUpdatableDataController = (WBSRemotelyUpdatableDataController *)v12;

      -[WBSRemotelyUpdatableDataController setShouldAttemptToUpdateConfiguration:](v2->_remotelyUpdatableDataController, "setShouldAttemptToUpdateConfiguration:", 1);
      v14 = v2;

    }
    else
    {
      v15 = v2;
    }

  }
  return v2;
}

- (void)getAllQuirkValuesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (self->_supportsDesktopClassBrowsing)
  {
    remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77___SFRequestDesktopSiteQuirksManager_getAllQuirkValuesWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E4AC7748;
    v8 = v4;
    -[WBSRemotelyUpdatableDataController accessSnapshotLoadingItIfNeeded:](remotelyUpdatableDataController, "accessSnapshotLoadingItIfNeeded:", v7);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, MEMORY[0x1E0C9AA70]);
  }

}

- (void)quirksValueForDomain:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_supportsDesktopClassBrowsing)
  {
    remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77___SFRequestDesktopSiteQuirksManager_quirksValueForDomain_completionHandler___block_invoke;
    v10[3] = &unk_1E4AC7720;
    v12 = v7;
    v11 = v6;
    -[WBSRemotelyUpdatableDataController accessSnapshotLoadingItIfNeeded:](remotelyUpdatableDataController, "accessSnapshotLoadingItIfNeeded:", v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotelyUpdatableDataController, 0);
}

@end
