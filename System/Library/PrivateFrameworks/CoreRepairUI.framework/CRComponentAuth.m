@implementation CRComponentAuth

- (CRComponentAuth)init
{
  CRComponentAuth *v2;
  CRComponentAuth *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRComponentAuth;
  v2 = -[CRComponentAuth init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CRComponentAuth setComponentName:](v2, "setComponentName:", 0);
  return v3;
}

- (CRComponentAuth)initWithComponentName:(id)a3
{
  id v4;
  CRComponentAuth *v5;
  CRComponentAuth *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRComponentAuth;
  v5 = -[CRComponentAuth init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[CRComponentAuth setComponentName:](v5, "setComponentName:", v4);

  return v6;
}

- (int64_t)copyComponentStatus
{
  return 0;
}

- (int64_t)getAuthCPComponentStatus:(id)a3
{
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  CRComponentAuth *v21;
  id v22;
  __CFArray *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __CFArray *v28;
  uint8_t v29[128];
  uint8_t buf[4];
  __CFArray *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  v21 = self;
  objc_sync_enter(v21);
  v28 = 0;
  v4 = sub_22AC8509C(&v28);
  if (v4)
  {
    sub_22AC82A9C(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_22AC85E30(v4, v5);
  }
  else
  {
    sub_22AC82A9C(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v28;
      _os_log_impl(&dword_22AC64000, v6, OS_LOG_TYPE_DEFAULT, "Components: %@", buf, 0xCu);
    }

    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v28;
    v7 = 0;
    v8 = 0;
    v5 = 0;
    v9 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v25;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
          if (v12 && objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "count"))
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "isTrustedForUI");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", v13);
            v14 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ComponentName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AuthPassed");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14 && v16 && objc_msgSend(v16, "isEqualToString:", v22))
            {
              v19 = -[CRComponentAuth convertIORegDataToStatus:authPass:](v21, "convertIORegDataToStatus:authPass:", v14, v18);

              v5 = v14;
              goto LABEL_22;
            }
            v7 = v16;
            v8 = v18;
            v5 = v14;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  v19 = 0;
LABEL_22:

  objc_sync_exit(v21);
  return v19;
}

- (int64_t)convertIORegDataToStatus:(id)a3 authPass:(id)a4
{
  if (!a3)
    return 0;
  if (objc_msgSend(a3, "intValue"))
    return 1;
  return -1;
}

- (int64_t)synchronouslycopyAuthStatus
{
  NSObject *v3;
  int64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = dispatch_queue_create("com.apple.corerepair.authsyncqueue", MEMORY[0x24BDAC9C0]);
  v4 = -[CRComponentAuth copyComponentStatus](self, "copyComponentStatus");
  v10[3] = v4;
  if (!v4)
  {
    sub_22AC82A9C(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_22AC85ECC();

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = sub_22AC7E2CC;
    v8[3] = &unk_24F4D4D88;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v3, v8);
    if (!v10[3])
    {
      sub_22AC82A9C(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_22AC85EA0();

    }
    v4 = v10[3];
  }

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (BOOL)isFirstAuthComplete
{
  return -[CRComponentAuth copyComponentStatus](self, "copyComponentStatus") != 0;
}

- (BOOL)_checkForComponentFailureInDefaults:(id)a3
{
  id v3;
  uid_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = getuid();
  sub_22AC82A9C(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AC64000, v5, OS_LOG_TYPE_DEFAULT, "Reading system health from file", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/var/mobile/Library/Preferences/%@.plist"), CFSTR("com.apple.mobilerepaird.systemhealth"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    if (!v10
      || (objc_msgSend(v10, "objectForKey:", v3),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "BOOLValue"),
          v11,
          !v12))
    {

      LOBYTE(v8) = 0;
      goto LABEL_16;
    }
    sub_22AC82A9C(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl(&dword_22AC64000, v13, OS_LOG_TYPE_DEFAULT, "Found failed component: %@", buf, 0xCu);
    }

LABEL_14:
    LOBYTE(v8) = 1;
LABEL_16:

    goto LABEL_17;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22AC64000, v5, OS_LOG_TYPE_DEFAULT, "Reading system health from defaults", buf, 2u);
  }

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
  LODWORD(v8) = objc_msgSend(v7, "BOOLForKey:", v3);

  if ((_DWORD)v8)
  {
    sub_22AC82A9C(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl(&dword_22AC64000, v9, OS_LOG_TYPE_DEFAULT, "Found failed component: %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_17:

  return (char)v8;
}

- (id)_getObjectForKeyFromDefaults:(id)a3
{
  id v3;
  uid_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[16];
  uint8_t v13[16];

  v3 = a3;
  v4 = getuid();
  sub_22AC82A9C(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AC64000, v5, OS_LOG_TYPE_DEFAULT, "Reading system health from defaults", buf, 2u);
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
    objc_msgSend(v7, "objectForKey:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_22AC64000, v5, OS_LOG_TYPE_DEFAULT, "Reading system health from file", v13, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/var/mobile/Library/Preferences/%@.plist"), CFSTR("com.apple.mobilerepaird.systemhealth"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "objectForKey:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)findUnsealedData
{
  if (qword_255B49920 != -1)
    dispatch_once(&qword_255B49920, &unk_24F4D4DA8);
  return (id)qword_255B49918;
}

- (BOOL)isComponentFailed
{
  return 0;
}

- (NSString)componentName
{
  return self->componentName;
}

- (void)setComponentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->componentName, 0);
}

@end
