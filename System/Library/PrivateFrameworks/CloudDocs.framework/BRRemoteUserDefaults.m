@implementation BRRemoteUserDefaults

+ (id)sharedDefaults
{
  if (sharedDefaults_onceToken != -1)
    dispatch_once(&sharedDefaults_onceToken, &__block_literal_global_29);
  return (id)g_remoteDefaults;
}

void __38__BRRemoteUserDefaults_sharedDefaults__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BRRemoteUserDefaults _init]([BRRemoteUserDefaults alloc], "_init");
  v1 = (void *)g_remoteDefaults;
  g_remoteDefaults = (uint64_t)v0;

}

- (id)_init
{
  BRRemoteUserDefaults *v2;
  uint64_t v3;
  NSMutableDictionary *userDictionaryCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRRemoteUserDefaults;
  v2 = -[BRRemoteUserDefaults init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    userDictionaryCache = v2->_userDictionaryCache;
    v2->_userDictionaryCache = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (BRRemoteUserDefaults)init
{
  void *v3;
  NSObject *v4;

  brc_bread_crumbs((uint64_t)"-[BRRemoteUserDefaults init]", 39);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[BRRemoteUserDefaults init].cold.1((uint64_t)v3, v4);

  return 0;
}

- (NSSet)excludedFilenamesWorthWarningAtLogout
{
  void *v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_userDictionaryCache, "objectForKeyedSubscript:", CFSTR("excluded-filenames-worth-warning-at-logout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_2;
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newSyncProxy");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__BRRemoteUserDefaults_excludedFilenamesWorthWarningAtLogout__block_invoke;
  v11[3] = &unk_1E3DA47A8;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v7, "lookupExcludedFilenamesForLogoutWithReply:", v11);
  objc_msgSend(v7, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_userDictionaryCache, "setObject:forKeyedSubscript:", v8, CFSTR("excluded-filenames-worth-warning-at-logout"));

  objc_msgSend(v7, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {

LABEL_2:
    -[NSMutableDictionary objectForKeyedSubscript:](self->_userDictionaryCache, "objectForKeyedSubscript:", CFSTR("excluded-filenames-worth-warning-at-logout"));
    return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
  }
  +[BRRemoteUserDefaults defaultExcludedFilenamesWorthWarningAtLogout](BRRemoteUserDefaults, "defaultExcludedFilenamesWorthWarningAtLogout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v10;
}

uint64_t __61__BRRemoteUserDefaults_excludedFilenamesWorthWarningAtLogout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a3);
}

- (NSSet)excludedExtensionsWorthPreserving
{
  void *v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_userDictionaryCache, "objectForKeyedSubscript:", CFSTR("excluded-extensions-worth-preserving"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_2;
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newSyncProxy");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__BRRemoteUserDefaults_excludedExtensionsWorthPreserving__block_invoke;
  v11[3] = &unk_1E3DA47A8;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v7, "lookupExcludedExtensionsForLogoutWithReply:", v11);
  objc_msgSend(v7, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_userDictionaryCache, "setObject:forKeyedSubscript:", v8, CFSTR("excluded-extensions-worth-preserving"));

  objc_msgSend(v7, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {

LABEL_2:
    -[NSMutableDictionary objectForKeyedSubscript:](self->_userDictionaryCache, "objectForKeyedSubscript:", CFSTR("excluded-extensions-worth-preserving"));
    return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
  }
  +[BRRemoteUserDefaults defaultExcludedExtensionsWorthPreserving](BRRemoteUserDefaults, "defaultExcludedExtensionsWorthPreserving");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v10;
}

uint64_t __57__BRRemoteUserDefaults_excludedExtensionsWorthPreserving__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a3);
}

- (int64_t)minFileSizeForThumbnailTransfer
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_userDictionaryCache, "objectForKeyedSubscript:", CFSTR("min-file-size-for-thumb-transfer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_2;
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newSyncProxy");

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__BRRemoteUserDefaults_minFileSizeForThumbnailTransfer__block_invoke;
  v12[3] = &unk_1E3DA64B0;
  v13 = v7;
  v8 = v7;
  objc_msgSend(v8, "lookupMinFileSizeForThumbnailTransferWithReply:", v12);
  objc_msgSend(v8, "result");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_userDictionaryCache, "setObject:forKeyedSubscript:", v9, CFSTR("min-file-size-for-thumb-transfer"));

  objc_msgSend(v8, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    return 0x100000;
LABEL_2:
  -[NSMutableDictionary objectForKeyedSubscript:](self->_userDictionaryCache, "objectForKeyedSubscript:", CFSTR("min-file-size-for-thumb-transfer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longLongValue");

  return v5;
}

uint64_t __55__BRRemoteUserDefaults_minFileSizeForThumbnailTransfer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a3);
}

+ (id)defaultExcludedFilenamesWorthWarningAtLogout
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", CFSTR("Dropbox"));
  objc_msgSend(v2, "addObject:", CFSTR("OneDrive"));
  objc_msgSend(v2, "addObject:", CFSTR("IDrive-Sync"));
  return v2;
}

+ (id)defaultExcludedFilenamesWorthPreserving
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultExcludedFilenamesWorthWarningAtLogout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("Microsoft User Data"));
  objc_msgSend(v3, "addObject:", CFSTR("iPhoto Library"));
  return v3;
}

+ (id)defaultExcludedExtensionsWorthPreserving
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", CFSTR("photoslibrary"));
  objc_msgSend(v2, "addObject:", CFSTR("photolibrary"));
  objc_msgSend(v2, "addObject:", CFSTR("aplibrary"));
  objc_msgSend(v2, "addObject:", CFSTR("migratedaplibrary"));
  objc_msgSend(v2, "addObject:", CFSTR("migratedphotolibrary"));
  objc_msgSend(v2, "addObject:", CFSTR("migratedaperturelibrary"));
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDictionaryCache, 0);
}

- (void)init
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19CBF0000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: use sharedDefaults%@", (uint8_t *)&v2, 0xCu);
}

@end
