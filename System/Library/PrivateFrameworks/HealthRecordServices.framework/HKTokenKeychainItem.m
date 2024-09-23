@implementation HKTokenKeychainItem

- (HKTokenKeychainItem)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKTokenKeychainItem)initWithName:(id)a3
{
  id v5;
  HKTokenKeychainItem *v6;
  uint64_t v7;
  NSString *name;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKTokenKeychainItem.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name.length > 0"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HKTokenKeychainItem;
  v6 = -[HKTokenKeychainItem init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    name = v6->_name;
    v6->_name = (NSString *)v7;

  }
  return v6;
}

- (BOOL)isPresentWithError:(id *)a3
{
  return objc_msgSend((id)objc_opt_class(), "_isTokenPresentIdentifiedByName:error:", self->_name, a3);
}

- (BOOL)makeTokenSynchronizableIfNeededWithError:(id *)a3
{
  return objc_msgSend((id)objc_opt_class(), "_makeTokenSynchronizableIfNeededIdentifiedByName:error:", self->_name, a3);
}

- (id)fetchWithError:(id *)a3
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_fetchTokenIdentifiedByName:error:", self->_name, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
  else
    v4 = 0;

  return v4;
}

- (BOOL)storeLocalToken:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend((id)objc_opt_class(), "_storeTokenIdentifiedByName:data:synchronizable:error:", self->_name, v6, 0, a4);

  return (char)a4;
}

- (BOOL)storeSynchronizableToken:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend((id)objc_opt_class(), "_storeTokenIdentifiedByName:data:synchronizable:error:", self->_name, v6, 1, a4);

  return (char)a4;
}

- (BOOL)deleteWithError:(id *)a3
{
  return objc_msgSend((id)objc_opt_class(), "_deleteTokenIdentifiedByName:error:", self->_name, a3);
}

+ (id)tokenKeychainItemSecurityClass
{
  return (id)*MEMORY[0x24BDE9240];
}

+ (id)_identifyingAttributesForKeyIdentifiedByName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKTokenKeychainItem.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v14[0] = *MEMORY[0x24BDE9220];
  objc_msgSend(a1, "tokenKeychainItemSecurityClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v14[1] = *MEMORY[0x24BDE8FA8];
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDE8F60];
  v9 = *MEMORY[0x24BDE8F98];
  v15[1] = v7;
  v15[2] = v9;
  v10 = *MEMORY[0x24BDE9140];
  v14[2] = v8;
  v14[3] = v10;
  v15[3] = *MEMORY[0x24BDE9148];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_keyQueryAttributesForKeyIdentifiedByName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_identifyingAttributesForKeyIdentifiedByName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v7 = *MEMORY[0x24BDE94C8];
  v8[0] = *MEMORY[0x24BDBD270];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

  return v4;
}

+ (id)_storableAttributesForKeyIdentifiedByName:(id)a3 data:(id)a4 modificationDate:(id)a5 synchronizable:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[6];

  v6 = a6;
  v30[5] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKTokenKeychainItem.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKTokenKeychainItem.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

LABEL_3:
  objc_msgSend(a1, "_identifyingAttributesForKeyIdentifiedByName:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  v17 = *MEMORY[0x24BDE9008];
  v18 = *MEMORY[0x24BDBD270];
  v30[0] = *MEMORY[0x24BDBD270];
  v19 = *MEMORY[0x24BDE90A8];
  v29[0] = v17;
  v29[1] = v19;
  v20 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = *MEMORY[0x24BDE90C0];
  v22 = *MEMORY[0x24BDE90C8];
  v30[1] = v20;
  v30[2] = v22;
  v23 = *MEMORY[0x24BDE9140];
  v29[2] = v21;
  v29[3] = v23;
  v24 = *MEMORY[0x24BDBD268];
  if (v6)
    v24 = v18;
  v29[4] = *MEMORY[0x24BDE9550];
  v30[3] = v24;
  v30[4] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addEntriesFromDictionary:", v25);

  if (!v14)
  return v16;
}

+ (BOOL)_isTokenPresentIdentifiedByName:(id)a3 error:(id *)a4
{
  id v6;
  const __CFDictionary *v7;
  uint64_t v8;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a3;
  objc_msgSend(a1, "_identifyingAttributesForKeyIdentifiedByName:", v6);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = SecItemCopyMatching(v7, 0);
  if ((_DWORD)v8 == -25308 || (_DWORD)v8 == 0)
  {
    v10 = 1;
  }
  else
  {
    v11 = v8;
    if ((_DWORD)v8 != -25300)
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      HKSensitiveLogItem();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hk_assignError:code:format:", a4, 3, CFSTR("Failed to check for presence of token with name %@, OSStatus: %d"), v13, v11);

    }
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_makeTokenSynchronizableIfNeededIdentifiedByName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v21;
  CFTypeRef result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a1, "_identifyingAttributesForKeyIdentifiedByName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v25 = *MEMORY[0x24BDE94C0];
  v9 = *MEMORY[0x24BDBD270];
  v26[0] = *MEMORY[0x24BDBD270];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValuesForKeysWithDictionary:", v10);

  result = 0;
  v11 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
  if (!(_DWORD)v11)
  {
    v12 = *MEMORY[0x24BDE9140];
    objc_msgSend((id)result, "objectForKeyedSubscript:", *MEMORY[0x24BDE9140]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if ((v14 & 1) != 0)
      goto LABEL_8;
    v23 = v12;
    v24 = v9;
    v11 = SecItemUpdate((CFDictionaryRef)v7, (CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
  }
  if ((_DWORD)v11 == -25308)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    HKSensitiveLogItem();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hk_assignError:code:format:", a4, 6, CFSTR("Token is not accessible (device locked?), name: %@"), v16, v21);
LABEL_11:

    v17 = 0;
    goto LABEL_12;
  }
  if ((_DWORD)v11)
  {
    if ((_DWORD)v11 == -25300)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      HKSensitiveLogItem();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hk_assignError:code:format:", a4, 118, CFSTR("No token found for name %@"), v16, v21);
    }
    else
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      HKSensitiveLogItem();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "hk_assignError:code:format:", a4, 3, CFSTR("Failed to fetch token for name %@, OSStatus: %d"), v16, v11);
    }
    goto LABEL_11;
  }
LABEL_8:
  v17 = 1;
LABEL_12:

  return v17;
}

+ (id)_fetchTokenIdentifiedByName:(id)a3 error:(id *)a4
{
  id v6;
  const __CFDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CFTypeRef result;

  v6 = a3;
  objc_msgSend(a1, "_keyQueryAttributesForKeyIdentifiedByName:", v6);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  result = 0;
  v8 = SecItemCopyMatching(v7, &result);
  if ((_DWORD)v8 == -25308)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    HKSensitiveLogItem();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_assignError:code:format:", a4, 6, CFSTR("Token is not accessible (device locked?), name: %@"), v12);
LABEL_7:

LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v9 = v8;
  if ((_DWORD)v8 == -25300)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    HKSensitiveLogItem();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_assignError:code:format:", a4, 118, CFSTR("No token found for name %@"), v12);
    goto LABEL_7;
  }
  if ((_DWORD)v8)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    HKSensitiveLogItem();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_assignError:code:format:", a4, 3, CFSTR("Failed to fetch token for name %@, OSStatus: %d"), v15, v9);

    goto LABEL_9;
  }
  v10 = (void *)result;
LABEL_10:

  return v10;
}

+ (BOOL)_storeTokenIdentifiedByName:(id)a3 data:(id)a4 synchronizable:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  char v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v11, "length"))
  {
    v12 = objc_msgSend(a1, "_updateTokenIdentifiedByName:data:synchronizable:error:", v10, v11, v7, a6);
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_assignError:code:format:", a6, 3, CFSTR("Cannot store %@ with an empty token for name %@"), v15, v16);

    v12 = 0;
  }

  return v12;
}

+ (BOOL)_updateTokenIdentifiedByName:(id)a3 data:(id)a4 synchronizable:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  const __CFDictionary *v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v7 = a5;
  v27[3] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  objc_msgSend(a1, "_identifyingAttributesForKeyIdentifiedByName:", v10);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v26[0] = *MEMORY[0x24BDE90A8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = (uint64_t *)MEMORY[0x24BDBD270];
  if (!v7)
    v15 = (uint64_t *)MEMORY[0x24BDBD268];
  v16 = *MEMORY[0x24BDE9140];
  v17 = *v15;
  v27[0] = v13;
  v27[1] = v17;
  v18 = *MEMORY[0x24BDE9550];
  v26[1] = v16;
  v26[2] = v18;
  v27[2] = v11;
  v19 = SecItemUpdate(v12, (CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 3));

  if ((_DWORD)v19 == -25308)
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    HKSensitiveLogItem();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hk_assignError:code:format:", a6, 6, CFSTR("Token is not accessible (device locked?), name: %@"), v22, v25);
LABEL_10:

    v20 = 0;
    goto LABEL_11;
  }
  if (!(_DWORD)v19)
  {
    v20 = 1;
    goto LABEL_11;
  }
  if ((_DWORD)v19 != -25300)
  {
    v23 = (void *)MEMORY[0x24BDD1540];
    HKSensitiveLogItem();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hk_assignError:code:format:", a6, 3, CFSTR("Failed to update token for name %@, OSStatus: %d"), v22, v19);
    goto LABEL_10;
  }
  v20 = objc_msgSend(a1, "_addTokenIdentifiedByName:data:synchronizable:error:", v10, v11, v7, a6);
LABEL_11:

  return v20;
}

+ (BOOL)_addTokenIdentifiedByName:(id)a3 data:(id)a4 synchronizable:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  id v12;
  void *v13;
  const __CFDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  uint64_t v22;

  v7 = a5;
  v10 = a3;
  v11 = (void *)MEMORY[0x24BDBCE60];
  v12 = a4;
  objc_msgSend(v11, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_storableAttributesForKeyIdentifiedByName:data:modificationDate:synchronizable:", v10, v12, v13, v7);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v15 = SecItemAdd(v14, 0);
  if ((_DWORD)v15)
  {
    v16 = v15;
    if ((_DWORD)v15 == -25308)
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      HKSensitiveLogItem();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hk_assignError:code:format:", a6, 6, CFSTR("Token is not accessible (device locked?), name: %@"), v18, v22);
    }
    else
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      HKSensitiveLogItem();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hk_assignError:code:format:", a6, 3, CFSTR("Failed to add token for name %@, OSStatus: %d"), v18, v16);
    }

    v19 = 0;
  }
  else
  {
    v19 = 1;
  }

  return v19;
}

+ (BOOL)_deleteTokenIdentifiedByName:(id)a3 error:(id *)a4
{
  id v6;
  const __CFDictionary *v7;
  uint64_t v8;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;

  v6 = a3;
  objc_msgSend(a1, "_keyQueryAttributesForKeyIdentifiedByName:", v6);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = SecItemDelete(v7);
  if ((_DWORD)v8 == -25300 || (_DWORD)v8 == 0)
  {
    v13 = 1;
  }
  else
  {
    v10 = v8;
    v11 = (void *)MEMORY[0x24BDD1540];
    HKSensitiveLogItem();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_assignError:code:format:", a4, 3, CFSTR("Failed to delete token for name %@, OSStatus: %d"), v12, v10);

    v13 = 0;
  }

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
