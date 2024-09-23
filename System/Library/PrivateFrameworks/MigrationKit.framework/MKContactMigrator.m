@implementation MKContactMigrator

- (MKContactMigrator)init
{
  MKContactMigrator *v2;
  CNContactStore *v3;
  CNContactStore *contactStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKContactMigrator;
  v2 = -[MKMigrator init](&v6, sel_init);
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x24BDBACF8]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v3;

    -[MKMigrator setType:](v2, "setType:", 5);
  }
  return v2;
}

- (void)importVCard:(id)a3
{
  MKContactMigrator *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x2207B99F4](v5);
  -[MKContactMigrator import:](v4, "import:", v7);
  objc_autoreleasePoolPop(v6);
  objc_sync_exit(v4);

}

- (void)import:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  CNContactStore *contactStore;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  uint8_t v51[128];
  uint8_t buf[4];
  MKContactMigrator *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKLog log](MKLog, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v53 = self;
    _os_log_impl(&dword_21EC08000, v6, OS_LOG_TYPE_INFO, "%@ will import a vcard.", buf, 0xCu);
  }

  v50 = 0;
  objc_msgSend(MEMORY[0x24BDBAD08], "contactsWithData:error:", v4, &v50);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v50;
  if (v8)
  {
    +[MKLog log](MKLog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MKContactMigrator import:].cold.2((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
LABEL_20:

    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
    if (objc_msgSend(v16, "length"))
    {
      v30 = objc_msgSend(v16, "mk_occurrenceCountOfString:", CFSTR("BEGIN:VCARD"));
      if (v30 <= 1)
        v31 = 1;
      else
        v31 = v30;
      -[MKMigrator migratorDidFailWithImportError:count:](self, "migratorDidFailWithImportError:count:", v8, v31);
    }
    else
    {
      -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:", v8);
    }
    goto LABEL_30;
  }
  if (!objc_msgSend(v7, "count"))
  {
    +[MKLog log](MKLog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MKContactMigrator import:].cold.1(v9);
    goto LABEL_20;
  }
  v9 = objc_alloc_init(MEMORY[0x24BDBADA8]);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v47 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "mutableCopy");
        -[NSObject addContact:toContainerWithIdentifier:](v9, "addContact:toContainerWithIdentifier:", v20, 0);

      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v17);
  }

  contactStore = self->_contactStore;
  v45 = 0;
  -[CNContactStore executeSaveRequest:error:](contactStore, "executeSaveRequest:error:", v9, &v45);
  v22 = v45;
  if (v22)
  {
    v8 = v22;
    +[MKLog log](MKLog, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[MKContactMigrator import:].cold.2((uint64_t)v8, v23, v24, v25, v26, v27, v28, v29);

    goto LABEL_20;
  }
  v32 = objc_msgSend(v16, "count");
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
  if (objc_msgSend(v33, "length"))
  {
    v34 = objc_msgSend(v33, "mk_occurrenceCountOfString:", CFSTR("BEGIN:VCARD"));
    if (v34 > 0)
      v32 = v34;
  }
  -[MKMigrator migratorDidImportWithCount:](self, "migratorDidImportWithCount:", v32);
  -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", objc_msgSend(v4, "length"));

  v8 = 0;
LABEL_30:

  +[MKLog log](MKLog, "log");
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v53 = self;
    _os_log_impl(&dword_21EC08000, v35, OS_LOG_TYPE_INFO, "%@ did import a vcard.", buf, 0xCu);
  }

  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v36);
  objc_msgSend(v36, "payload");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "contacts");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "timeIntervalSinceDate:", v5);
  v41 = v40;

  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v41);
  objc_msgSend(v38, "importElapsedTime");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "decimalNumberByAdding:", v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setImportElapsedTime:", v44);

  objc_sync_exit(v36);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)import:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21EC08000, log, OS_LOG_TYPE_ERROR, "no contact data found.", v1, 2u);
}

- (void)import:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a2, a3, "error=%@", a5, a6, a7, a8, 2u);
}

@end
