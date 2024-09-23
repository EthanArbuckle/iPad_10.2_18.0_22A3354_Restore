@implementation DSKeychainPersistence

- (DSKeychainPersistence)initWithQueue:(id)a3
{
  id v5;
  DSKeychainPersistence *v6;
  DSKeychainPersistence *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DSKeychainPersistence;
  v6 = -[DSKeychainPersistence init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clientQueue, a3);

  return v7;
}

- (BOOL)saveListenerState:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  const char *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  id v28;
  void *v29;
  NSObject *v30;
  id v31;
  char v32;
  id v33;
  void *v34;
  NSObject *v35;
  BOOL v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id v43;
  id v44;
  uint8_t buf[4];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc_init(MEMORY[0x24BE297B0]);
      objc_msgSend(v8, "setInvisible:", 1);
      objc_msgSend(v8, "setSyncType:", 1);
      objc_msgSend(v8, "setAccessibleType:", 6);
      objc_msgSend(v8, "setAccessGroup:", CFSTR("com.apple.distributedsensing"));
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v6, "inOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "dataSubType");
      v12 = "?";
      if (v11 == 1)
        v12 = "motionState";
      if (v11)
        v13 = v12;
      else
        v13 = "Unknown";
      objc_msgSend(v9, "stringWithUTF8String:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setType:", v14);

      objc_msgSend(v8, "setIdentifier:", CFSTR("com.apple.distributedsensing.listenerState"));
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dsLogger");
      v16 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217E3C000, v16, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] creating a new metadata dictionary\n", buf, 2u);
      }

      v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v6, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("dsDeviceIDKey"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v6, "version"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("dsVersionKey"));

      v20 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v6, "inOptions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "numberWithUnsignedInt:", objc_msgSend(v21, "dataSubType"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, CFSTR("dsOptionDataSubTypeKey"));

      v23 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v6, "inOptions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "numberWithUnsignedInt:", objc_msgSend(v24, "deviceType"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, CFSTR("dsOptionDeviceTypeKey"));

      objc_msgSend(v8, "setMetadata:", v17);
      v26 = objc_alloc_init(MEMORY[0x24BE297B8]);
      v44 = 0;
      v27 = objc_msgSend(v26, "addItem:error:", v8, &v44);
      v28 = v44;
      if (objc_msgSend(v28, "code") == -25299)
      {
        +[DSLogging sharedInstance](DSLogging, "sharedInstance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "dsLogger");
        v30 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_217E3C000, v30, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] Keychain item already exists, updating item \n", buf, 2u);
        }

        v31 = objc_alloc_init(MEMORY[0x24BE297B0]);
        objc_msgSend(v31, "setInvisible:", 1);
        objc_msgSend(v31, "setSyncType:", 1);
        objc_msgSend(v31, "setAccessibleType:", 6);
        objc_msgSend(v31, "setAccessGroup:", CFSTR("com.apple.distributedsensing"));
        objc_msgSend(v31, "setIdentifier:", CFSTR("com.apple.distributedsensing.listenerState"));
        v43 = v28;
        v32 = objc_msgSend(v26, "updateItem:matchingItem:error:", v8, v31, &v43);
        v33 = v43;

        v28 = v33;
        if ((v32 & 1) == 0)
          goto LABEL_14;
      }
      else if ((v27 & 1) == 0)
      {
LABEL_14:
        +[DSLogging sharedInstance](DSLogging, "sharedInstance");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "dsLogger");
        v35 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v28;
          _os_log_impl(&dword_217E3C000, v35, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] Failed to add keychain item with error %@", buf, 0xCu);
        }

        if (a4)
        {
          v28 = objc_retainAutorelease(v28);
          v36 = 0;
          *a4 = v28;
        }
        else
        {
          v36 = 0;
        }
LABEL_28:

        goto LABEL_29;
      }
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "dsLogger");
      v40 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v46 = v41;
        _os_log_impl(&dword_217E3C000, v40, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] saved keychain item for device %@\n", buf, 0xCu);

      }
      v36 = 1;
      goto LABEL_28;
    }
  }
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "dsLogger");
  v38 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v38, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] trying to store invalid listener ID to keychain\n", buf, 2u);
  }

  v36 = 0;
  if (a4)
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 2, 0);
LABEL_29:

  return v36;
}

- (BOOL)removeListenerState:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dsLogger");
      v9 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v10;
        _os_log_impl(&dword_217E3C000, v9, OS_LOG_TYPE_DEFAULT, "Removing keychain item for device %@\n", buf, 0xCu);

      }
      v11 = objc_alloc_init(MEMORY[0x24BE297B0]);
      objc_msgSend(v11, "setInvisible:", 1);
      objc_msgSend(v11, "setSyncType:", 1);
      objc_msgSend(v11, "setAccessibleType:", 6);
      objc_msgSend(v11, "setAccessGroup:", CFSTR("com.apple.distributedsensing"));
      objc_msgSend(v11, "setIdentifier:", CFSTR("com.apple.distributedsensing.listenerState"));
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "motionState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setType:", v12);

      v13 = objc_alloc_init(MEMORY[0x24BE297B8]);
      v27 = 0;
      v14 = objc_msgSend(v13, "removeItemMatchingItem:error:", v11, &v27);
      v15 = v27;
      v16 = v15;
      if (v15 && objc_msgSend(v15, "code") == -25300)
      {
        +[DSLogging sharedInstance](DSLogging, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dsLogger");
        v18 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v16;
          _os_log_impl(&dword_217E3C000, v18, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] Keychain item not found with error %@\n", buf, 0xCu);
        }

      }
      else
      {
        +[DSLogging sharedInstance](DSLogging, "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dsLogger");
        v23 = objc_claimAutoreleasedReturnValue();

        v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if ((v14 & 1) == 0)
        {
          if (v24)
          {
            *(_DWORD *)buf = 138412290;
            v29 = v16;
            _os_log_impl(&dword_217E3C000, v23, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] Failed to remove keychain item with error %@\n", buf, 0xCu);
          }

          v21 = 0;
          if (a4)
            *a4 = objc_retainAutorelease(v16);
          goto LABEL_24;
        }
        if (v24)
        {
          objc_msgSend(v6, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v29 = v25;
          _os_log_impl(&dword_217E3C000, v23, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] Removed keychain item for device %@\n", buf, 0xCu);

        }
      }
      v21 = 1;
LABEL_24:

      goto LABEL_25;
    }
  }
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dsLogger");
  v20 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v20, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] trying to remove invalid listener device from keychain\n", buf, 2u);
  }

  v21 = 0;
  if (a4)
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 2, 0);
LABEL_25:

  return v21;
}

- (BOOL)loadListenerState:(id *)a3 withError:(id *)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  char v15;
  double v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  DSClientMotionDataOptions *v23;
  id v24;
  DSListenerDevice *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t Int64Ranged;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = objc_alloc_init(MEMORY[0x24BE297B0]);
  objc_msgSend(v7, "setAccessGroup:", CFSTR("com.apple.distributedsensing"));
  objc_msgSend(v7, "setSyncType:", 1);
  objc_msgSend(v7, "setIdentifier:", CFSTR("com.apple.distributedsensing.listenerState"));
  v8 = objc_alloc_init(MEMORY[0x24BE297B8]);
  v36 = 0;
  v9 = (void *)objc_msgSend(v8, "copyItemMatchingItem:flags:error:", v7, 1, &v36);
  v10 = v36;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateModified");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v9, "dateModified");
    else
      objc_msgSend(v9, "dateCreated");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v35);
    if ((unint64_t)v16 < 0x1C21)
    {
      v34 = v10;
      objc_msgSend(v9, "metadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v33 = v11;
        Int64Ranged = CFDictionaryGetInt64Ranged();
        v21 = CFDictionaryGetInt64Ranged();
        v22 = CFDictionaryGetInt64Ranged();
        v23 = objc_alloc_init(DSClientMotionDataOptions);
        -[DSClientMotionDataOptions setDataSubType:](v23, "setDataSubType:", v21);
        -[DSClientMotionDataOptions setDeviceType:](v23, "setDeviceType:", v22);
        v24 = objc_alloc_init(MEMORY[0x24BE7CBF8]);
        objc_msgSend(v24, "setIdentifier:", v20);
        v25 = -[DSListenerDevice initWithRapportDevice:queue:]([DSListenerDevice alloc], "initWithRapportDevice:queue:", v24, self->_clientQueue);
        -[DSListenerDevice setVersion:](v25, "setVersion:", Int64Ranged);
        -[DSListenerDevice setInOptions:](v25, "setInOptions:", v23);
        if (a3)
          *a3 = objc_retainAutorelease(v25);
        +[DSLogging sharedInstance](DSLogging, "sharedInstance", Int64Ranged);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "dsLogger");
        v27 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          -[DSRapportDevice identifier](v25, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v38 = v28;
          _os_log_impl(&dword_217E3C000, v27, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] keychain item loaded for device %@\n", buf, 0xCu);

        }
        v15 = objc_msgSend(v8, "removeItemMatchingItem:error:", v9, 0);

        v11 = v33;
      }
      else
      {
        +[DSLogging sharedInstance](DSLogging, "sharedInstance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "dsLogger");
        v30 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_217E3C000, v30, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] invalid device ID\n", buf, 2u);
        }

        v15 = 0;
        if (a4)
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 1, 0);
      }

      v10 = v34;
    }
    else
    {
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dsLogger");
      v18 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217E3C000, v18, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] found keychain item too old\n", buf, 2u);
      }

      objc_msgSend(v8, "removeItemMatchingItem:error:", v9, 0);
      v15 = 0;
      if (a4)
        *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 1, 0);
    }

  }
  else
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dsLogger");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v10;
      _os_log_impl(&dword_217E3C000, v14, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] Unable to find keychain item with error: %@", buf, 0xCu);
    }

    v15 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end
