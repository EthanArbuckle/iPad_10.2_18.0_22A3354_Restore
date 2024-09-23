@implementation PassbookAccountChangeObserver

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v8 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412802;
    v17 = v9;
    v18 = 2112;
    v19 = v11;
    v20 = 1024;
    v21 = v8;
    _os_log_impl(&dword_230F4E000, v12, OS_LOG_TYPE_DEFAULT, "PassbookAccountChangeObserver willChangeWithType called with account %@, oldAccount %@, changeType %u", (uint8_t *)&v16, 0x1Cu);
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E958]), "initWithChangeType:event:newAccount:oldAccount:", v8, 1, v9, v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = v13;
    _os_log_impl(&dword_230F4E000, v12, OS_LOG_TYPE_DEFAULT, "PassbookAccountChangeObserver detected %{public}@.", (uint8_t *)&v16, 0xCu);
  }

  if ((_DWORD)v8 == 3)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_230F4E000, v12, OS_LOG_TYPE_DEFAULT, "PassbookAccountChangeObserver notifying pass library.", (uint8_t *)&v16, 2u);
    }

    objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "noteACAccountChanged:", v13);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_230F4E000, v12, OS_LOG_TYPE_DEFAULT, "PassbookAccountChangeObserver did notify pass library.", (uint8_t *)&v16, 2u);
    }

  }
  return 0;
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v8 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412802;
    v17 = v9;
    v18 = 2112;
    v19 = v11;
    v20 = 1024;
    v21 = v8;
    _os_log_impl(&dword_230F4E000, v12, OS_LOG_TYPE_DEFAULT, "PassbookAccountChangeObserver didChangeWithType called with account %@, oldAccount %@, changeType %u", (uint8_t *)&v16, 0x1Cu);
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E958]), "initWithChangeType:event:newAccount:oldAccount:", v8, 2, v9, v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = v13;
    _os_log_impl(&dword_230F4E000, v12, OS_LOG_TYPE_DEFAULT, "PassbookAccountChangeObserver detected %{public}@.", (uint8_t *)&v16, 0xCu);
  }

  v14 = objc_msgSend(v13, "type");
  if (v14 == 1)
  {
    if ((v8 & 0xFFFFFFFE) != 2)
      goto LABEL_20;
  }
  else if (v14
         || (_DWORD)v8 != 1
         && (_DWORD)v8 != 3
         && ((_DWORD)v8 != 2
          || (objc_msgSend(v13, "enablementOfRelevantDataclassesChanged") & 1) == 0
          && (objc_msgSend(v13, "accountManagedStateChanged") & 1) == 0
          && !objc_msgSend(v13, "accountOrderChanged")))
  {
    goto LABEL_20;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_230F4E000, v12, OS_LOG_TYPE_DEFAULT, "PassbookAccountChangeObserver notifying pass library.", (uint8_t *)&v16, 2u);
  }

  objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "noteACAccountChanged:", v13);

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_230F4E000, v12, OS_LOG_TYPE_DEFAULT, "PassbookAccountChangeObserver did notify pass library.", (uint8_t *)&v16, 2u);
  }

LABEL_20:
}

@end
