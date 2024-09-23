@implementation SOSmartcard

+ (__SecIdentity)getLocalAuthIdentityForCert:(id)a3 withLAContext:(id)a4
{
  NSObject *v6;
  id v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const __CFDictionary *v23;
  const char *v24;
  void *v25;
  OSStatus v26;
  OSStatus v27;
  NSObject *v28;
  NSObject *v29;
  __SecIdentity *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  CFTypeRef result;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  _BYTE v42[18];
  _QWORD v43[3];
  _QWORD v44[3];
  void *v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x24BDAC8D0];
  v36 = a3;
  v35 = a4;
  result = 0;
  SO_LOG_SOSmartcard();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
    v41 = 2112;
    *(_QWORD *)v42 = a1;
    _os_log_impl(&dword_215A1B000, v6, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v7 = 0;
  v8 = 0;
  v9 = *MEMORY[0x24BDE8F48];
  v32 = *MEMORY[0x24BDE9558];
  v34 = *MEMORY[0x24BDE9500];
  v33 = *MEMORY[0x24BDE94D8];
  while (1)
  {
    v10 = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v11;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppSSOKerberos"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_LOWERCASE_TEXT"), &stru_24D3EC758, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "objectForKeyedSubscript:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v10;
    v16 = (id)objc_msgSend(v35, "evaluateAccessControl:operation:options:error:", v15, 3, v14, &v37);
    v7 = v37;

    SO_LOG_SOSmartcard();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (!v7)
    {
      v19 = a1;
      if (v18)
      {
        *(_DWORD *)buf = 136315394;
        v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
        v41 = 2112;
        *(_QWORD *)v42 = a1;
        _os_log_impl(&dword_215A1B000, v17, OS_LOG_TYPE_DEFAULT, "%s evaluateAccessControl was successful on %@", buf, 0x16u);
      }

      v43[0] = v32;
      objc_msgSend(v36, "objectForKeyedSubscript:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v25;
      v44[1] = v35;
      v43[1] = v34;
      v43[2] = v33;
      v44[2] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
      v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      v26 = SecItemCopyMatching(v23, &result);
      if (v26)
      {
        v27 = v26;
        SO_LOG_SOSmartcard();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
          v41 = 1024;
          *(_DWORD *)v42 = v27;
          *(_WORD *)&v42[4] = 2112;
          *(_QWORD *)&v42[6] = a1;
          _os_log_impl(&dword_215A1B000, v28, OS_LOG_TYPE_DEFAULT, "%s retrieving identity failed with error %d on %@", buf, 0x1Cu);
        }

      }
      goto LABEL_28;
    }
    v19 = a1;
    if (v18)
    {
      v20 = objc_msgSend(v7, "code");
      *(_DWORD *)buf = 136315650;
      v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
      v41 = 2048;
      *(_QWORD *)v42 = v20;
      *(_WORD *)&v42[8] = 2112;
      *(_QWORD *)&v42[10] = a1;
      _os_log_impl(&dword_215A1B000, v17, OS_LOG_TYPE_DEFAULT, "%s evaluateAccessControl failed with error %ld on %@", buf, 0x20u);
    }

    v21 = objc_msgSend(v7, "code");
    if (v21 != -1004)
      break;
    SO_LOG_SOSmartcard();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
      v41 = 1026;
      *(_DWORD *)v42 = v8 + 1;
      *(_WORD *)&v42[4] = 2112;
      *(_QWORD *)&v42[6] = a1;
      _os_log_impl(&dword_215A1B000, v22, OS_LOG_TYPE_DEFAULT, "%s Screen may be locked, retry %{public}d on %@", buf, 0x1Cu);
    }

    if (v8 >= 4)
      goto LABEL_29;
    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 2.0);

    ++v8;
  }
  if (v21 == -7 || v21 == -3)
  {
    SO_LOG_SOSmartcard();
    v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315394;
    v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
    v41 = 2112;
    *(_QWORD *)v42 = a1;
    v24 = "%s Problem reading the SmartCard on %@";
  }
  else if (v21 == -4)
  {
    SO_LOG_SOSmartcard();
    v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315394;
    v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
    v41 = 2112;
    *(_QWORD *)v42 = a1;
    v24 = "%s User cancelled PIN prompt on %@";
  }
  else
  {
    SO_LOG_SOSmartcard();
    v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315394;
    v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
    v41 = 2112;
    *(_QWORD *)v42 = a1;
    v24 = "%s Some other problem occurred on %@";
  }
  _os_log_impl(&dword_215A1B000, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);
LABEL_28:

LABEL_29:
  SO_LOG_SOSmartcard();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "+[SOSmartcard getLocalAuthIdentityForCert:withLAContext:]";
    v41 = 2112;
    *(_QWORD *)v42 = v19;
    _os_log_impl(&dword_215A1B000, v29, OS_LOG_TYPE_DEFAULT, "%s finished on %@", buf, 0x16u);
  }

  v30 = (__SecIdentity *)result;
  return v30;
}

+ (int)getIdentityForPersistentRef:(__CFData *)a3 identityToReturn:(__SecIdentity *)a4
{
  uint64_t v5;
  const __CFDictionary *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDE9558];
  v8[0] = *MEMORY[0x24BDE9220];
  v8[1] = v5;
  v9[0] = *MEMORY[0x24BDE9238];
  v9[1] = a3;
  v8[2] = *MEMORY[0x24BDE94D8];
  v9[2] = *MEMORY[0x24BDBD270];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = SecItemCopyMatching(v6, (CFTypeRef *)a4);

  return (int)a4;
}

+ (BOOL)pollSmartcardForIdentityWithPersistentRef:(id)a3 tokenID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOSmartcard();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "+[SOSmartcard pollSmartcardForIdentityWithPersistentRef:tokenID:]";
    v16 = 2112;
    v17 = a1;
    _os_log_impl(&dword_215A1B000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v14, 0x16u);
  }

  if (v6)
  {
    objc_msgSend(a1, "searchForCachedIdentityPersistentRef:tokenID:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("labl"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length") != 0;

  }
  else
  {
    v11 = 0;
  }
  SO_LOG_SOSmartcard();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "+[SOSmartcard pollSmartcardForIdentityWithPersistentRef:tokenID:]";
    v16 = 2112;
    v17 = a1;
    _os_log_impl(&dword_215A1B000, v12, OS_LOG_TYPE_DEFAULT, "%s finished on %@", (uint8_t *)&v14, 0x16u);
  }

  return v11;
}

+ (id)searchForCachedIdentityWithSerial:(__CFData *)a3 withIssuer:(__CFData *)a4 withTokenID:(id)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFDictionary *v21;
  CFTypeRef v22;
  NSObject *v23;
  void *v24;
  CFTypeRef result;
  _QWORD v27[6];
  _QWORD v28[6];
  _QWORD v29[6];
  _QWORD v30[6];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  SO_LOG_SOSmartcard();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "+[SOSmartcard searchForCachedIdentityWithSerial:withIssuer:withTokenID:]";
    v33 = 2112;
    v34 = a1;
    _os_log_impl(&dword_215A1B000, v9, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  result = 0;
  v10 = objc_msgSend(v8, "length");

  v11 = *MEMORY[0x24BDE9238];
  v12 = *MEMORY[0x24BDE8F50];
  if (v10)
  {
    v27[0] = *MEMORY[0x24BDE9220];
    v27[1] = v12;
    v13 = *MEMORY[0x24BDE8F58];
    v28[0] = v11;
    v28[1] = v13;
    v14 = *MEMORY[0x24BDE9020];
    v27[2] = *MEMORY[0x24BDE9118];
    v27[3] = v14;
    v28[2] = a3;
    v28[3] = a4;
    v15 = *MEMORY[0x24BDE94D0];
    v27[4] = *MEMORY[0x24BDE94C0];
    v27[5] = v15;
    v28[4] = MEMORY[0x24BDBD1C8];
    v28[5] = MEMORY[0x24BDBD1C8];
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = v28;
    v18 = v27;
  }
  else
  {
    v29[0] = *MEMORY[0x24BDE9220];
    v29[1] = v12;
    v30[0] = v11;
    v30[1] = &stru_24D3EC758;
    v19 = *MEMORY[0x24BDE9020];
    v29[2] = *MEMORY[0x24BDE9118];
    v29[3] = v19;
    v30[2] = a3;
    v30[3] = a4;
    v20 = *MEMORY[0x24BDE94D0];
    v29[4] = *MEMORY[0x24BDE94C0];
    v29[5] = v20;
    v30[4] = MEMORY[0x24BDBD1C8];
    v30[5] = MEMORY[0x24BDBD1C8];
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = v30;
    v18 = v29;
  }
  objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 6);
  v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (SecItemCopyMatching(v21, &result))
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v22 = (CFTypeRef)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SO_LOG_SOSmartcard();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "+[SOSmartcard searchForCachedIdentityWithSerial:withIssuer:withTokenID:]";
      v33 = 2112;
      v34 = a1;
      _os_log_impl(&dword_215A1B000, v23, OS_LOG_TYPE_DEFAULT, "%s finished on %@", buf, 0x16u);
    }

    v22 = (id)result;
  }
  v24 = (void *)v22;

  return v24;
}

+ (id)searchForCachedIdentityPersistentRef:(id)a3 tokenID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFDictionary *v20;
  CFTypeRef v21;
  NSObject *v22;
  void *v23;
  CFTypeRef result;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[4];
  _QWORD v29[4];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOSmartcard();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "+[SOSmartcard searchForCachedIdentityPersistentRef:tokenID:]";
    v32 = 2112;
    v33 = a1;
    _os_log_impl(&dword_215A1B000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  result = 0;
  v9 = objc_msgSend(v7, "length");
  v10 = *MEMORY[0x24BDE9238];
  if (v9)
  {
    v11 = *MEMORY[0x24BDE8F50];
    v26[0] = *MEMORY[0x24BDE9220];
    v26[1] = v11;
    v12 = *MEMORY[0x24BDE8F58];
    v27[0] = v10;
    v27[1] = v12;
    v13 = *MEMORY[0x24BDE94C0];
    v26[2] = *MEMORY[0x24BDE9158];
    v26[3] = v13;
    v27[2] = v7;
    v27[3] = MEMORY[0x24BDBD1C8];
    v26[4] = *MEMORY[0x24BDE94D0];
    v27[4] = MEMORY[0x24BDBD1C8];
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = v27;
    v16 = v26;
    v17 = 5;
  }
  else
  {
    v18 = *MEMORY[0x24BDE9558];
    v28[0] = *MEMORY[0x24BDE9220];
    v28[1] = v18;
    v29[0] = v10;
    v29[1] = v6;
    v19 = *MEMORY[0x24BDE94D0];
    v28[2] = *MEMORY[0x24BDE94C0];
    v28[3] = v19;
    v29[2] = MEMORY[0x24BDBD1C8];
    v29[3] = MEMORY[0x24BDBD1C8];
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = v29;
    v16 = v28;
    v17 = 4;
  }
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
  v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (SecItemCopyMatching(v20, &result))
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v21 = (CFTypeRef)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SO_LOG_SOSmartcard();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "+[SOSmartcard searchForCachedIdentityPersistentRef:tokenID:]";
      v32 = 2112;
      v33 = a1;
      _os_log_impl(&dword_215A1B000, v22, OS_LOG_TYPE_DEFAULT, "%s finished on %@", buf, 0x16u);
    }

    v21 = (id)result;
  }
  v23 = (void *)v21;

  return v23;
}

+ (id)availableSmartCards
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  OSStatus v12;
  OSStatus v13;
  NSObject *v14;
  CFTypeID v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  OSStatus v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t v48;
  _BYTE v49[15];
  SecIdentityRef identityRef;
  CFTypeRef result;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  int v57;
  SecCertificateRef certificateRef[2];
  _QWORD v59[6];
  _QWORD v60[6];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v35 = (id)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v33 = objc_alloc_init(MEMORY[0x24BDC6CB0]);
  objc_msgSend(v33, "tokenIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v53;
    v6 = *MEMORY[0x24BDE9220];
    v7 = *MEMORY[0x24BDE9238];
    v8 = *MEMORY[0x24BDE8F50];
    v46 = *MEMORY[0x24BDE8F58];
    v44 = *MEMORY[0x24BDE94C0];
    v45 = *MEMORY[0x24BDE94D0];
    v42 = *MEMORY[0x24BDBD430];
    v43 = *MEMORY[0x24BDE93C8];
    v47 = *MEMORY[0x24BDE9158];
    v40 = *MEMORY[0x24BDE9558];
    v34 = *MEMORY[0x24BDE90A0];
    v39 = v2;
    v41 = *MEMORY[0x24BDE8F50];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v53 != v5)
          objc_enumerationMutation(v2);
        v10 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v9);
        result = 0;
        v59[0] = v6;
        v59[1] = v8;
        v60[0] = v7;
        v60[1] = v46;
        v59[2] = v45;
        v59[3] = v44;
        v60[2] = MEMORY[0x24BDBD1C8];
        v60[3] = MEMORY[0x24BDBD1C8];
        v59[4] = v43;
        v59[5] = v47;
        v60[4] = v42;
        v60[5] = v10;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 6);
        v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        v12 = SecItemCopyMatching(v11, &result);
        if (v12)
        {
          v13 = v12;
          SO_LOG_SOSmartcard();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            LODWORD(certificateRef[0]) = 67109120;
            HIDWORD(certificateRef[0]) = v13;
            _os_log_error_impl(&dword_215A1B000, v14, OS_LOG_TYPE_ERROR, "Error querying SmartCards %d", (uint8_t *)certificateRef, 8u);
          }

        }
        else
        {
          certificateRef[0] = 0;
          identityRef = 0;
          v15 = CFGetTypeID(result);
          if (v15 == CFDictionaryGetTypeID())
          {
            v16 = result;
            objc_msgSend((id)result, "objectForKeyedSubscript:", v40);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = +[SOSmartcard getIdentityForPersistentRef:identityToReturn:](SOSmartcard, "getIdentityForPersistentRef:identityToReturn:", v17, &identityRef);

            if (v18)
            {
              SO_LOG_SOSmartcard();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                v57 = v18;
                _os_log_error_impl(&dword_215A1B000, v19, OS_LOG_TYPE_ERROR, "Error getting persistientref %d", buf, 8u);
              }

              v2 = v39;
            }
            else
            {
              v20 = SecIdentityCopyCertificate(identityRef, certificateRef);
              SO_LOG_SOSmartcard();
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = v21;
              if (v20)
              {
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109120;
                  v57 = v20;
                  _os_log_error_impl(&dword_215A1B000, v22, OS_LOG_TYPE_ERROR, "Error retrieving certificate %d", buf, 8u);
                }

                v2 = v39;
                if (identityRef)
                {
                  CFRelease(identityRef);
                  identityRef = 0;
                }
              }
              else
              {
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_215A1B000, v22, OS_LOG_TYPE_INFO, "Retrieving Kerberos names from certificate", buf, 2u);
                }

                v23 = (void *)SecCertificateCopyNTPrincipalNames();
                objc_msgSend(v23, "objectAtIndex:", 0);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = SecCertificateCopyIssuerSummary();
                if (objc_msgSend(v24, "length"))
                {
                  v37 = v25;
                  v26 = (void *)objc_opt_new();
                  objc_msgSend(v26, "setUpn:", v24);
                  -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v34);
                  v36 = v23;
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "setCertName:", v27);

                  objc_msgSend(v26, "setIdentity:", identityRef);
                  objc_msgSend(v26, "setAttributes:", v16);
                  -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v40);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "setPersistientRef:", v28);

                  -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v47);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "setTokenID:", v29);

                  v23 = v36;
                  objc_msgSend(v26, "setIssuer:", v37);
                  objc_msgSend(v35, "addObject:", v26);

                  v25 = v37;
                }
                v38 = v24;
                v30 = (void *)v25;
                if (certificateRef[0])
                {
                  CFRelease(certificateRef[0]);
                  certificateRef[0] = 0;
                }
                v2 = v39;
                if (identityRef)
                {
                  CFRelease(identityRef);
                  identityRef = 0;
                }

              }
            }
          }
          else
          {
            SO_LOG_SOSmartcard();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              +[SOSmartcard availableSmartCards].cold.1(&v48, v49, v16);
          }

          v8 = v41;
        }

        ++v9;
      }
      while (v4 != v9);
      v31 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      v4 = v31;
    }
    while (v31);
  }

  return v35;
}

+ (void)availableSmartCards
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_215A1B000, log, OS_LOG_TYPE_ERROR, "unexpected type for SmartCard query", buf, 2u);
}

@end
