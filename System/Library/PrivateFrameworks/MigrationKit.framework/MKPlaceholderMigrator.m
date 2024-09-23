@implementation MKPlaceholderMigrator

- (MKPlaceholderMigrator)init
{
  MKPlaceholderMigrator *v2;
  MKPlaceholderMigrator *v3;
  NSMutableArray *v4;
  NSMutableArray *identifiers;
  MKAppSearchRequest *v6;
  MKAppSearchRequest *request;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MKPlaceholderMigrator;
  v2 = -[MKMigrator init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MKMigrator setType:](v2, "setType:", 15);
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    identifiers = v3->_identifiers;
    v3->_identifiers = v4;

    v6 = objc_alloc_init(MKAppSearchRequest);
    request = v3->_request;
    v3->_request = v6;

  }
  return v3;
}

- (void)importDataEncodedInJSON:(id)a3
{
  MKPlaceholderMigrator *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x2207B99F4](v5);
  -[MKPlaceholderMigrator import:](v4, "import:", v7);
  objc_autoreleasePoolPop(v6);
  objc_sync_exit(v4);

}

- (void)import:(id)a3
{
  id v4;
  NSObject *v5;
  MKPlaceholder *v6;
  MKPlaceholder *v7;
  NSObject *v8;
  MKPlaceholderMigrator *v9;
  NSObject *v10;
  _BOOL4 v11;
  MKAppSearchRequest *request;
  void *v13;
  _QWORD v14[4];
  MKPlaceholder *v15;
  id v16;
  NSObject *v17;
  uint8_t buf[4];
  MKPlaceholderMigrator *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[MKLog log](MKLog, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl(&dword_21EC08000, v5, OS_LOG_TYPE_INFO, "%@ will import placeholders.", buf, 0xCu);
  }

  v6 = -[MKPlaceholder initWithJSONData:]([MKPlaceholder alloc], "initWithJSONData:", v4);
  v7 = v6;
  if (v6)
  {
    if (-[MKPlaceholder enabled](v6, "enabled"))
    {
      +[MKLog log](MKLog, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        -[MKPlaceholder bundleIdentifier](v7, "bundleIdentifier");
        v9 = (MKPlaceholderMigrator *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v9;
        _os_log_impl(&dword_21EC08000, v8, OS_LOG_TYPE_INFO, "the placeholder was already installed. placeholder=%@", buf, 0xCu);

      }
    }
    else
    {
      -[MKPlaceholder bundleIdentifier](v7, "bundleIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      +[MKLog log](MKLog, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
      if (v8)
      {
        if (v11)
        {
          *(_DWORD *)buf = 138412290;
          v19 = (MKPlaceholderMigrator *)v8;
          _os_log_impl(&dword_21EC08000, v10, OS_LOG_TYPE_INFO, "will search an application. id=%@", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        request = self->_request;
        v17 = v8;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __32__MKPlaceholderMigrator_import___block_invoke;
        v14[3] = &unk_24E359128;
        objc_copyWeak(&v16, (id *)buf);
        v15 = v7;
        -[MKAppSearchRequest search:androidIDs:completion:](request, "search:androidIDs:completion:", v13, 0, v14);

        objc_destroyWeak(&v16);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (v11)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21EC08000, v10, OS_LOG_TYPE_INFO, "will skip a placeholder because did receive an invalid bundle identifier. id=nil", buf, 2u);
        }

      }
    }
  }
  else
  {
    +[MKLog log](MKLog, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EC08000, v8, OS_LOG_TYPE_INFO, "will skip a placeholder because did receive an invalid placeholder. placeholder=nil", buf, 2u);
    }
  }

}

void __32__MKPlaceholderMigrator_import___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "didSearchForPlaceholder:apps:error:", *(_QWORD *)(a1 + 32), v7, v6);

}

- (void)didSearchForPlaceholder:(id)a3 apps:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  MKPlaceholderMigrator *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  v11 = objc_sync_enter(v10);
  v12 = (void *)MEMORY[0x2207B99F4](v11);
  -[MKPlaceholderMigrator install:apps:error:](v10, "install:apps:error:", v13, v8, v9);
  objc_autoreleasePoolPop(v12);
  objc_sync_exit(v10);

}

- (void)install:(id)a3 apps:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  NSObject *v17;
  NSObject *v18;
  NSMutableArray *identifiers;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  MKPlaceholder *v27;
  void *v28;
  void *v29;
  void *v30;
  MKPlaceholder *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint8_t buf[4];
  NSObject *v38;
  __int16 v39;
  NSObject *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    +[MKLog log](MKLog, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "bundleIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "description");
      v13 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v12;
      v39 = 2112;
      v40 = v13;
      _os_log_impl(&dword_21EC08000, v11, OS_LOG_TYPE_INFO, "did receive an error but will install a placeholder using existing metadata. id=%@, error=%@", buf, 0x16u);
LABEL_4:

LABEL_13:
    }
LABEL_14:

    +[MKLog log](MKLog, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "bundleIdentifier");
      v18 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v18;
      _os_log_impl(&dword_21EC08000, v17, OS_LOG_TYPE_INFO, "did not receive an icon due to an network error but will install a placeholder using existing metadata. id=%@", buf, 0xCu);

    }
    objc_msgSend(v8, "install");
    goto LABEL_17;
  }
  if (!objc_msgSend(v9, "count"))
  {
    +[MKLog log](MKLog, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    objc_msgSend(v8, "bundleIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v12;
    v14 = "did not receive any matching app but will install a placeholder using existing metadata. id=%@";
LABEL_11:
    v15 = v11;
    v16 = 12;
LABEL_12:
    _os_log_impl(&dword_21EC08000, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
    goto LABEL_13;
  }
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    +[MKLog log](MKLog, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    objc_msgSend(v8, "bundleIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v12;
    v14 = "did receive too many matching apps but will install a placeholder using existing metadata. id=%@";
    goto LABEL_11;
  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v11 = objc_claimAutoreleasedReturnValue();
  -[NSObject iconURL](v11, "iconURL");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    +[MKLog log](MKLog, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v14 = "did not receive an icon url from the app store api or a new icon type might be added to ios.";
    v15 = v12;
    v16 = 2;
    goto LABEL_12;
  }
  v12 = v21;
  v22 = (void *)MEMORY[0x24BDBCE50];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dataWithContentsOfURL:", v23);
  v24 = objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    objc_msgSend(v8, "icon");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      +[MKLog log](MKLog, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "bundleIdentifier");
        v33 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v33;
        _os_log_impl(&dword_21EC08000, v13, OS_LOG_TYPE_INFO, "did not receive an icon data due to an network error but will install a placeholder using existing metadata. id=%@", buf, 0xCu);

      }
      goto LABEL_4;
    }
  }
  v35 = (void *)v24;
  v36 = v12;
  +[MKLog log](MKLog, "log");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "bundleIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v26;
    _os_log_impl(&dword_21EC08000, v25, OS_LOG_TYPE_INFO, "will install a placeholder using the latest metadata from the app store. id=%@", buf, 0xCu);

  }
  v27 = [MKPlaceholder alloc];
  -[NSObject bundleIdentifier](v11, "bundleIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject appStoreIdentifier](v11, "appStoreIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject name](v11, "name");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject developer](v11, "developer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[MKPlaceholder initWithBundleIdentifier:appStoreIdentifier:bundleName:developer:icon:](v27, "initWithBundleIdentifier:appStoreIdentifier:bundleName:developer:icon:", v34, v28, v29, v30, v35);

  -[MKPlaceholder install](v31, "install");
LABEL_17:
  identifiers = self->_identifiers;
  objc_msgSend(v8, "bundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](identifiers, "addObject:", v20);

}

- (void)remove
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MKPlaceholder *v8;
  MKPlaceholder *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_identifiers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = [MKPlaceholder alloc];
        v9 = -[MKPlaceholder initWithBundleIdentifier:](v8, "initWithBundleIdentifier:", v7, (_QWORD)v10);
        -[MKPlaceholder uninstall](v9, "uninstall");

        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
