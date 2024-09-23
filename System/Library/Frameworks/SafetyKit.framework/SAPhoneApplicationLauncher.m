@implementation SAPhoneApplicationLauncher

- (SAPhoneApplicationLauncher)init
{
  SAPhoneApplicationLauncher *v2;
  uint64_t v3;
  NSMutableDictionary *assertionMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SAPhoneApplicationLauncher;
  v2 = -[SAPhoneApplicationLauncher init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    assertionMap = v2->_assertionMap;
    v2->_assertionMap = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)openApplicationInBackgroundWithBundleId:(id)a3 withReason:(int64_t)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  int64_t v20;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  id v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  v20 = a4;
  +[SABundleManager reasonToAttributeName:](SABundleManager, "reasonToAttributeName:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  objc_msgSend(MEMORY[0x24BE80C98], "identityForEmbeddedApplicationIdentifier:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE80BE8], "contextWithIdentity:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.SafetyKit"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributes:", v13);

  objc_msgSend(v11, "setExplanation:", v9);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE80BF8]), "initWithContext:", v11);
  v24 = 0;
  v25 = 0;
  v23 = 0;
  LOBYTE(v7) = objc_msgSend(v14, "execute:assertion:error:", &v25, &v24, &v23);
  v15 = v25;
  v16 = v24;
  v17 = v23;
  sa_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((v7 & 1) != 0)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "-[SAPhoneApplicationLauncher openApplicationInBackgroundWithBundleId:withReason:completion:]";
      v28 = 2112;
      v29 = v10;
      v30 = 2048;
      v31 = v20;
      v32 = 2112;
      v33 = v15;
      _os_log_impl(&dword_23457A000, v19, OS_LOG_TYPE_DEFAULT, "%s - Successfully launched bundle, bundleId: %@, reason: %lu, process: %@", buf, 0x2Au);
    }

    -[SAPhoneApplicationLauncher addAssertion:forProcessId:](self, "addAssertion:forProcessId:", v16, objc_msgSend(v15, "pid"));
    if (v8)
      v8[2](v8, 1, 0);
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "-[SAPhoneApplicationLauncher openApplicationInBackgroundWithBundleId:withReason:completion:]";
      v28 = 2112;
      v29 = v10;
      v30 = 2048;
      v31 = v20;
      v32 = 2112;
      v33 = v17;
      _os_log_error_impl(&dword_23457A000, v19, OS_LOG_TYPE_ERROR, "%s - Unable to launch bundle, bundleId: %@, reason: %lu, error: %@", buf, 0x2Au);
    }

    if (v8)
      ((void (**)(id, uint64_t, id))v8)[2](v8, 0, v17);
  }

}

- (void)cleanupInvalidAssertions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *assertionMap;
  id obj;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[NSMutableDictionary allKeys](self->_assertionMap, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v3)
  {
    v4 = v3;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionMap, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_opt_new();
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v9 = v7;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v20 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              if (objc_msgSend(v14, "isValid"))
                objc_msgSend(v8, "addObject:", v14);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v11);
        }

        v15 = objc_msgSend(v8, "count");
        assertionMap = self->_assertionMap;
        if (v15)
          -[NSMutableDictionary setObject:forKeyedSubscript:](assertionMap, "setObject:forKeyedSubscript:", v8, v6);
        else
          -[NSMutableDictionary removeObjectForKey:](assertionMap, "removeObjectForKey:", v6);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v4);
  }

}

- (void)addAssertion:(id)a3 forProcessId:(int)a4
{
  uint64_t v4;
  void *v6;
  NSMutableDictionary *assertionMap;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v4 = *(_QWORD *)&a4;
  v12 = a3;
  -[SAPhoneApplicationLauncher cleanupInvalidAssertions](self, "cleanupInvalidAssertions");
  v6 = v12;
  if (v12)
  {
    assertionMap = self->_assertionMap;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](assertionMap, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v9 = (void *)objc_opt_new();
      v10 = self->_assertionMap;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, v11);

    }
    objc_msgSend(v9, "addObject:", v12);

    v6 = v12;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionMap, 0);
}

@end
