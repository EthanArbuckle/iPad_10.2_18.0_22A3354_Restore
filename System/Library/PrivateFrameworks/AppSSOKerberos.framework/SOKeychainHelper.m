@implementation SOKeychainHelper

- (__SecIdentity)identityForPersistientRef:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  SO_LOG_SOKeychainHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[SOKeychainHelper identityForPersistientRef:].cold.1((uint64_t)v3, v4);

  return 0;
}

- (__SecIdentity)identityForUUIDString:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  OSStatus v9;
  int v10;
  NSObject *v11;
  __SecIdentity *v12;
  __SecIdentity *v14;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BDE9238];
  v5 = *MEMORY[0x24BDE90A0];
  v15[0] = *MEMORY[0x24BDE9220];
  v15[1] = v5;
  v16[0] = v4;
  v16[1] = v3;
  v6 = *MEMORY[0x24BDE93B0];
  v15[2] = *MEMORY[0x24BDE94D8];
  v15[3] = v6;
  v7 = *MEMORY[0x24BDE93C0];
  v16[2] = *MEMORY[0x24BDBD270];
  v16[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v9 = SecItemCopyMatching(v8, (CFTypeRef *)&v14);
  if (v9)
  {
    v10 = v9;
    SO_LOG_SOKeychainHelper();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SOKeychainHelper identityForUUIDString:].cold.1((uint64_t)v3, v10, v11);

    v12 = 0;
  }
  else
  {
    v12 = v14;
  }

  return v12;
}

- (int)addCredentialsToKeychainWithService:(id)a3 withUsername:(id)a4 withPassword:(id)a5 requireUserPresence:(BOOL)a6
{
  _BOOL4 v6;
  SOKeychainHelper *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  SecAccessControlCreateFlags v17;
  SecAccessControlRef v18;
  SecAccessControlRef v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  OSStatus v28;
  NSObject *v29;
  OSStatus v30;
  NSObject *v31;
  _QWORD v33[6];
  _QWORD v34[6];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  SOKeychainHelper *v38;
  __int16 v39;
  SOKeychainHelper *v40;
  uint64_t v41;

  v6 = a6;
  v41 = *MEMORY[0x24BDAC8D0];
  v10 = (SOKeychainHelper *)a3;
  v11 = a4;
  v12 = a5;
  SO_LOG_SOKeychainHelper();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v36 = "-[SOKeychainHelper addCredentialsToKeychainWithService:withUsername:withPassword:requireUserPresence:]";
    v37 = 2112;
    v38 = v10;
    v39 = 2112;
    v40 = self;
    _os_log_impl(&dword_215A1B000, v13, OS_LOG_TYPE_DEFAULT, "%s service %@ on %@", buf, 0x20u);
  }

  objc_msgSend(v12, "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  SO_LOG_SOKeychainHelper();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v16)
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[SOKeychainHelper addCredentialsToKeychainWithService:withUsername:withPassword:requireUserPresence:]";
      v37 = 2112;
      v38 = self;
      _os_log_impl(&dword_215A1B000, v15, OS_LOG_TYPE_DEFAULT, "%s requireUserPresence is enabled on %@", buf, 0x16u);
    }
    v17 = 1;
  }
  else
  {
    if (v16)
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[SOKeychainHelper addCredentialsToKeychainWithService:withUsername:withPassword:requireUserPresence:]";
      v37 = 2112;
      v38 = self;
      _os_log_impl(&dword_215A1B000, v15, OS_LOG_TYPE_DEFAULT, "%s requireUserPresence is disabled on %@", buf, 0x16u);
    }
    v17 = 0;
  }

  v18 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x24BDE8F70], v17, 0);
  if (!v18)
  {
    SO_LOG_SOKeychainHelper();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[SOKeychainHelper addCredentialsToKeychainWithService:withUsername:withPassword:requireUserPresence:].cold.1(v27);
    v30 = -67702;
    goto LABEL_20;
  }
  v19 = v18;
  if (v10 && v11 && v14)
  {
    v20 = *MEMORY[0x24BDE9550];
    v34[0] = v14;
    objc_msgSend(v11, "lowercaseString", v20, *MEMORY[0x24BDE8FA8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x24BDE9128];
    v34[1] = v21;
    v34[2] = v10;
    v23 = *MEMORY[0x24BDE9220];
    v33[2] = v22;
    v33[3] = v23;
    v24 = *MEMORY[0x24BDE9528];
    v25 = *MEMORY[0x24BDBD270];
    v34[3] = *MEMORY[0x24BDE9230];
    v34[4] = v25;
    v26 = *MEMORY[0x24BDE8F48];
    v33[4] = v24;
    v33[5] = v26;
    v34[5] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 6);
    v27 = objc_claimAutoreleasedReturnValue();

    v28 = SecItemDelete((CFDictionaryRef)v27);
    SO_LOG_SOKeychainHelper();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v28;
      _os_log_impl(&dword_215A1B000, v29, OS_LOG_TYPE_DEFAULT, "Removing keychain entry returned %d", buf, 8u);
    }

    v30 = SecItemAdd((CFDictionaryRef)v27, 0);
    CFRelease(v19);
LABEL_20:

    goto LABEL_24;
  }
  SO_LOG_SOKeychainHelper();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[SOKeychainHelper addCredentialsToKeychainWithService:withUsername:withPassword:requireUserPresence:]";
    v37 = 2112;
    v38 = self;
    _os_log_impl(&dword_215A1B000, v31, OS_LOG_TYPE_DEFAULT, "%s Could not add credentials to keychain. Invalid parameters on %@", buf, 0x16u);
  }

  CFRelease(v19);
  v30 = -67693;
LABEL_24:

  return v30;
}

- (int)retrieveCredentialsFromKeychainWithContext:(id)a3 service:(id)a4 returnedUsername:(id *)a5 returnedPassword:(id *)a6
{
  id v10;
  char *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  OSStatus v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  CFTypeRef result;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  SOKeychainHelper *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (char *)a4;
  result = 0;
  SO_LOG_SOKeychainHelper();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v11;
    _os_log_impl(&dword_215A1B000, v12, OS_LOG_TYPE_DEFAULT, "Finding keychain entry for service %@", buf, 0xCu);
  }

  if (v11)
  {
    v13 = *MEMORY[0x24BDBD270];
    v14 = *MEMORY[0x24BDE94C8];
    v27[0] = *MEMORY[0x24BDE94C0];
    v27[1] = v14;
    v15 = *MEMORY[0x24BDE9220];
    v27[2] = *MEMORY[0x24BDE9128];
    v27[3] = v15;
    v16 = *MEMORY[0x24BDE9230];
    v28[2] = v11;
    v28[3] = v16;
    v28[0] = v13;
    v28[1] = v13;
    v27[4] = *MEMORY[0x24BDE9528];
    v28[4] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "mutableCopy");

    if (v10)
      -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDE9500]);
    v19 = SecItemCopyMatching((CFDictionaryRef)v18, &result);
    if (v19)
    {
      SO_LOG_SOKeychainHelper();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v19;
        _os_log_impl(&dword_215A1B000, v20, OS_LOG_TYPE_DEFAULT, "Finding keychain entry failed with %d", buf, 8u);
      }
    }
    else
    {
      v20 = (id)result;
      -[NSObject objectForKey:](v20, "objectForKey:", *MEMORY[0x24BDE8FA8]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v20, "objectForKey:", *MEMORY[0x24BDE9550]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v22, 4));
      *a6 = v23;
      v24 = objc_retainAutorelease(v21);
      *a5 = v24;
      if (result)
      {
        CFRelease(result);
        result = 0;
      }

    }
  }
  else
  {
    v19 = -67693;
    SO_LOG_SOKeychainHelper();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[SOKeychainHelper retrieveCredentialsFromKeychainWithContext:service:returnedUsername:returnedPassword:]";
      v31 = 2112;
      v32 = self;
      _os_log_impl(&dword_215A1B000, v18, OS_LOG_TYPE_DEFAULT, "%s Could not find credentials in keychain. Invalid parameters on %@", buf, 0x16u);
    }
  }

  return v19;
}

- (BOOL)hasCredentialsInKeychainWithService:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  OSStatus v14;
  BOOL v15;
  OSStatus v16;
  NSObject *v17;
  CFTypeRef result;
  _QWORD v20[6];
  _QWORD v21[6];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  SOKeychainHelper *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  result = 0;
  SO_LOG_SOKeychainHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    _os_log_impl(&dword_215A1B000, v5, OS_LOG_TYPE_DEFAULT, "Checking if keychain entry existis for service %@", buf, 0xCu);
  }

  if (v4)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDDA938]);
    -[NSObject setInteractionNotAllowed:](v6, "setInteractionNotAllowed:", 1);
    v7 = *MEMORY[0x24BDBD270];
    v8 = *MEMORY[0x24BDE94C8];
    v20[0] = *MEMORY[0x24BDE94C0];
    v20[1] = v8;
    v9 = *MEMORY[0x24BDBD268];
    v21[0] = v7;
    v21[1] = v9;
    v10 = *MEMORY[0x24BDE9220];
    v20[2] = *MEMORY[0x24BDE9128];
    v20[3] = v10;
    v11 = *MEMORY[0x24BDE9230];
    v21[2] = v4;
    v21[3] = v11;
    v12 = *MEMORY[0x24BDE9500];
    v20[4] = *MEMORY[0x24BDE9528];
    v20[5] = v12;
    v21[4] = v7;
    v21[5] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
    v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v14 = SecItemCopyMatching(v13, &result);
    v15 = v14 == -25308 || v14 == 0;
    if (v14 != -25308 && (v16 = v14) != 0)
    {
      SO_LOG_SOKeychainHelper();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v16;
        _os_log_impl(&dword_215A1B000, v17, OS_LOG_TYPE_DEFAULT, "Finding keychain entry failed with %d", buf, 8u);
      }

    }
    else if (result)
    {
      CFRelease(result);
      result = 0;
    }

  }
  else
  {
    SO_LOG_SOKeychainHelper();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[SOKeychainHelper hasCredentialsInKeychainWithService:]";
      v24 = 2112;
      v25 = self;
      _os_log_impl(&dword_215A1B000, v6, OS_LOG_TYPE_DEFAULT, "%s Could not find credentials in keychain. Invalid parameters on %@", buf, 0x16u);
    }
    v15 = 0;
  }

  return v15;
}

- (int)removeCredentialsFromKeychainWithService:(id)a3
{
  char *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  OSStatus v11;
  NSObject *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  SOKeychainHelper *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  SO_LOG_SOKeychainHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl(&dword_215A1B000, v5, OS_LOG_TYPE_DEFAULT, "Deleting keychain entry for service %@", buf, 0xCu);
  }

  if (v4)
  {
    v6 = *MEMORY[0x24BDBD270];
    v7 = *MEMORY[0x24BDE94C8];
    v14[0] = *MEMORY[0x24BDE94C0];
    v14[1] = v7;
    v8 = *MEMORY[0x24BDE9220];
    v14[2] = *MEMORY[0x24BDE9128];
    v14[3] = v8;
    v9 = *MEMORY[0x24BDE9230];
    v15[2] = v4;
    v15[3] = v9;
    v15[0] = v6;
    v15[1] = v6;
    v14[4] = *MEMORY[0x24BDE9528];
    v15[4] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v11 = SecItemDelete(v10);
    if (v11)
    {
      SO_LOG_SOKeychainHelper();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v17) = v11;
        _os_log_impl(&dword_215A1B000, v12, OS_LOG_TYPE_DEFAULT, "Deleting keychain entry failed with %d", buf, 8u);
      }

    }
  }
  else
  {
    v11 = -67693;
    SO_LOG_SOKeychainHelper();
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[SOKeychainHelper removeCredentialsFromKeychainWithService:]";
      v18 = 2112;
      v19 = self;
      _os_log_impl(&dword_215A1B000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "%s Could not delete credentials from keychain. Invalid parameters on %@", buf, 0x16u);
    }
  }

  return v11;
}

- (void)identityForPersistientRef:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215A1B000, a2, OS_LOG_TYPE_ERROR, "Unable to resolve persistient reference %@", (uint8_t *)&v2, 0xCu);
}

- (void)identityForUUIDString:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_215A1B000, log, OS_LOG_TYPE_ERROR, "SecItemCopyMatching returned: %d for uuid: %@", (uint8_t *)v3, 0x12u);
}

- (void)addCredentialsToKeychainWithService:(os_log_t)log withUsername:withPassword:requireUserPresence:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215A1B000, log, OS_LOG_TYPE_ERROR, "Could not create ACL for adding credentials to keychain.", v1, 2u);
}

@end
