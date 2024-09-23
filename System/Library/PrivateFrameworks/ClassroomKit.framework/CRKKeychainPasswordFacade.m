@implementation CRKKeychainPasswordFacade

- (CRKKeychainPasswordFacade)initWithBaseQueryAttributes:(id)a3
{
  id v4;
  CRKKeychainPasswordFacade *v5;
  uint64_t v6;
  NSDictionary *baseQueryAttributes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKKeychainPasswordFacade;
  v5 = -[CRKKeychainPasswordFacade init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    baseQueryAttributes = v5->_baseQueryAttributes;
    v5->_baseQueryAttributes = (NSDictionary *)v6;

  }
  return v5;
}

- (void)setPassword:(id)a3 forService:(id)a4 accessGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v13 = 0;
  LOBYTE(self) = -[CRKKeychainPasswordFacade setPassword:forService:accessGroup:error:](self, "setPassword:forService:accessGroup:error:", a3, v8, v9, &v13);
  v10 = v13;
  if ((self & 1) == 0)
  {
    _CRKLogGeneral_11();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "verboseDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2114;
      v19 = v12;
      _os_log_error_impl(&dword_218C99000, v11, OS_LOG_TYPE_ERROR, "Could not set password for service %@, access group %@. Error (ignored): %{public}@.", buf, 0x20u);

    }
  }

}

- (id)passwordForService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0;
  -[CRKKeychainPasswordFacade passwordForService:error:](self, "passwordForService:error:", v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  v7 = v6;
  if (!v5 && v6)
  {
    _CRKLogGeneral_11();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "verboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v4;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_218C99000, v8, OS_LOG_TYPE_INFO, "Could not retrieve password for service %@. Error (ignored): %{public}@", buf, 0x16u);

    }
  }

  return v5;
}

- (BOOL)setPassword:(id)a3 forService:(id)a4 accessGroup:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    if (v10)
    {
      v13 = *MEMORY[0x24BDE9230];
      v14 = *MEMORY[0x24BDE9128];
      v22[0] = *MEMORY[0x24BDE9220];
      v22[1] = v14;
      v23[0] = v13;
      v23[1] = v11;
      v22[2] = *MEMORY[0x24BDE9550];
      v23[2] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKKeychainPasswordFacade makeQueryWithAttributes:](self, "makeQueryWithAttributes:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDE8F50]);
      -[CRKKeychainPasswordFacade addAccessibilityAttributeToQuery:](self, "addAccessibilityAttributeToQuery:", v16);
      v17 = SecItemAdd((CFDictionaryRef)v16, 0);
      if ((_DWORD)v17 == -25299)
      {
        if (!-[CRKKeychainPasswordFacade removePasswordForService:error:](self, "removePasswordForService:error:", v11, a6))
        {
          v20 = 0;
LABEL_15:

          goto LABEL_16;
        }
        v17 = SecItemAdd((CFDictionaryRef)v16, 0);
      }
      -[CRKKeychainPasswordFacade errorForPasswordStatus:](self, "errorForPasswordStatus:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = v18 == 0;
      if (a6 && v18)
        *a6 = objc_retainAutorelease(v18);

      goto LABEL_15;
    }
    v20 = -[CRKKeychainPasswordFacade removePasswordForService:error:](self, "removePasswordForService:error:", v11, a6);
  }
  else if (a6)
  {
    CRKErrorWithCodeAndUserInfo(2, &unk_24DA07CD8);
    v20 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
LABEL_16:

  return v20;
}

- (BOOL)removePasswordForService:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFDictionary *v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = *MEMORY[0x24BDE9230];
    v9 = *MEMORY[0x24BDE9128];
    v16[0] = *MEMORY[0x24BDE9220];
    v16[1] = v9;
    v17[0] = v8;
    v17[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKKeychainPasswordFacade makeQueryWithAttributes:](self, "makeQueryWithAttributes:", v10);
    v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    -[CRKKeychainPasswordFacade errorForPasswordStatus:](self, "errorForPasswordStatus:", SecItemDelete(v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v12 == 0;
    if (a4 && v12)
      *a4 = objc_retainAutorelease(v12);

  }
  else if (a4)
  {
    CRKErrorWithCodeAndUserInfo(2, &unk_24DA07D00);
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)passwordForService:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  const __CFDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  CFTypeRef v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v6 = *MEMORY[0x24BDE9230];
  v7 = *MEMORY[0x24BDE94C8];
  v17[0] = *MEMORY[0x24BDE9220];
  v17[1] = v7;
  v18[0] = v6;
  v18[1] = MEMORY[0x24BDBD1C8];
  v17[2] = *MEMORY[0x24BDE9128];
  v18[2] = a3;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKKeychainPasswordFacade makeQueryWithAttributes:](self, "makeQueryWithAttributes:", v10);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  -[CRKKeychainPasswordFacade errorForPasswordStatus:](self, "errorForPasswordStatus:", SecItemCopyMatching(v11, &v16));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }
  else
  {
    v14 = (void *)v16;
  }

  return v14;
}

- (id)errorForPasswordStatus:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3 == -25300)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crk_errorForSecurityOSStatus:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)addAccessibilityAttributeToQuery:(id)a3
{
  objc_msgSend(a3, "setObject:forKeyedSubscript:", *MEMORY[0x24BDE8F78], *MEMORY[0x24BDE8F60]);
}

- (id)makeQueryWithAttributes:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BDBCED8];
  v5 = a3;
  v6 = [v4 alloc];
  -[CRKKeychainPasswordFacade baseQueryAttributes](self, "baseQueryAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithDictionary:", v7);

  objc_msgSend(v8, "addEntriesFromDictionary:", v5);
  return v8;
}

- (NSDictionary)baseQueryAttributes
{
  return self->_baseQueryAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseQueryAttributes, 0);
}

@end
