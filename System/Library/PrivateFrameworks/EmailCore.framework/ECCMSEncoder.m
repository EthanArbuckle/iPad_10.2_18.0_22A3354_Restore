@implementation ECCMSEncoder

void ___ef_log_ECCMSEncoder_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "ECCMSEncoder");
  v1 = (void *)_ef_log_ECCMSEncoder_log;
  _ef_log_ECCMSEncoder_log = (uint64_t)v0;

}

+ (id)signatureDataFromNetworkContentData:(id)a3 forSender:(id)a4 identity:(__SecIdentity *)a5 encryptionCertificate:(__SecCertificate *)a6 capabilities:(id)a7 outError:(id *)a8
{
  +[ECCMSEncoder _signedDataFromNetworkContentData:detached:forSender:identity:encryptionCertificate:capabilities:outError:]((uint64_t)a1, a3, 1u, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_signedDataFromNetworkContentData:(unsigned int)a3 detached:(uint64_t)a4 forSender:(uint64_t)a5 identity:(uint64_t)a6 encryptionCertificate:(void *)a7 capabilities:(_QWORD *)a8 outError:
{
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v30;
  id v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v31 = a2;
  v32 = a7;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0D4D7B8], "OIDWithString:error:", *MEMORY[0x1E0D4D738], a8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (a8 && *a8)
  {
    v13 = 0;
  }
  else
  {
    v30 = a3;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D7A0]), "initWithIdentity:signatureAlgorithm:error:", a5, v33, a8);
    if (a8 && *a8)
    {
      v13 = 0;
    }
    else
    {
      if (objc_msgSend(v32, "count"))
      {
        v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v16 = v32;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v35;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v35 != v18)
                objc_enumerationMutation(v16);
              v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D7B8]), "initWithString:error:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v19), a8);
              if (v20)
                objc_msgSend(v15, "addObject:", v20);

              ++v19;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v17);
        }

        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D790]), "initWithCapabilities:", v15);
        objc_msgSend(v14, "addSMIMECapabilitiesAttribute:", v21);

      }
      v22 = objc_alloc(MEMORY[0x1E0D4D7A8]);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithSigningTime:", v23);

      objc_msgSend(v14, "protectedAttributes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v24);

      if (a6)
      {
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D778]), "initWithCertificate:", a6);
        objc_msgSend(v14, "addSMIMEEncryptionKeyPreferenceAttribute:", v26);

      }
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D798]), "initWithDataContent:isDetached:signer:error:", v31, v30, v14, a8);
      if (!v27 || a8 && *a8)
      {
        v13 = 0;
      }
      else
      {
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D770]), "initWithEmbeddedContent:", v27);
        objc_msgSend(v28, "encodeMessageSecurityObject:", a8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return v13;
}

+ (id)signedDataFromNetworkContentData:(id)a3 forSender:(id)a4 identity:(__SecIdentity *)a5 encryptionCertificate:(__SecCertificate *)a6 capabilities:(id)a7 outError:(id *)a8
{
  +[ECCMSEncoder _signedDataFromNetworkContentData:detached:forSender:identity:encryptionCertificate:capabilities:outError:]((uint64_t)a1, a3, 0, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)encryptedDataFromContentData:(id)a3 senderCertificate:(__SecCertificate *)a4 senderCapabilities:(id)a5 recipients:(id)a6 outIsAuthenticated:(BOOL *)a7 outError:(id *)a8
{
  NSObject *v14;
  void *v15;
  int v16;
  int v17;
  Class *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  BOOL v48;
  BOOL *v49;
  id *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  id v63;
  _BYTE v64[128];
  _BYTE v65[16];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v53 = a5;
  v54 = a6;
  +[ECCMSEncoder _recipientInfoForCertificate:andCapabilities:]((uint64_t)a1, (uint64_t)a4, v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0;
  +[ECCMSEncoder _recipientInfosForRecipients:outError:]((uint64_t)a1, v54, &v63);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v63;
  if (v56)
  {
    _ef_log_ECCMSEncoder();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v56, "ef_publicDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[ECCMSEncoder encryptedDataFromContentData:senderCertificate:senderCapabilities:recipients:outIsAuthenticated:outError:].cold.3(v15, (uint64_t)v65, v14);
    }

  }
  v16 = +[ECCMSEncoder _capabilitiesContainCapabilityRequiringAuthEnvelopedData:]((uint64_t)a1, v53);
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __121__ECCMSEncoder_encryptedDataFromContentData_senderCertificate_senderCapabilities_recipients_outIsAuthenticated_outError___block_invoke;
  v62[3] = &__block_descriptor_40_e24_B16__0__ECCMSRecipient_8l;
  v62[4] = a1;
  v17 = v16 & objc_msgSend(v54, "ef_all:", v62);
  v18 = (Class *)0x1E0D4D768;
  if (!v17)
    v18 = (Class *)0x1E0D4D780;
  v19 = (void *)objc_msgSend(objc_alloc(*v18), "initWithDataContent:recipient:", v52, v55);
  v48 = v17;
  v49 = a7;
  v50 = a8;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v20 = v51;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v59 != v22)
          objc_enumerationMutation(v20);
        v24 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v19, "addRecipient:", v24);
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v19, "addRecipientWithRecipient:", v24);
        }
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v21);
  }

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D770]), "initWithEmbeddedContent:", v19);
  v26 = v25;
  if (v25)
  {
    v57 = v56;
    objc_msgSend(v25, "encodeMessageSecurityObject:", &v57);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v57;

    if (v27)
    {
      if (v49)
        *v49 = v48;
      if (v50)
        *v50 = 0;
      v29 = v27;
    }
    else
    {
      _ef_log_ECCMSEncoder();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        +[ECCMSEncoder encryptedDataFromContentData:senderCertificate:senderCapabilities:recipients:outIsAuthenticated:outError:].cold.2(v38, v39, v40, v41, v42, v43, v44, v45);

      if (v50)
      {
        v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
        objc_msgSend(v46, "ef_initWithDomain:code:underlyingError:", CFSTR("ECCMSErrorDomain"), 6, v28);
        *v50 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

    v56 = v28;
  }
  else
  {
    _ef_log_ECCMSEncoder();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      +[ECCMSEncoder encryptedDataFromContentData:senderCertificate:senderCapabilities:recipients:outIsAuthenticated:outError:].cold.1(v30, v31, v32, v33, v34, v35, v36, v37);

    v27 = 0;
    if (v50)
      *v50 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ECCMSErrorDomain"), 5, 0);
  }

  return v27;
}

+ (id)_recipientInfoForCertificate:(void *)a3 andCapabilities:
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  objc_opt_self();
  v18 = a2;
  if (v20)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v20, "count"));
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v20;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v24 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v22 = 0;
          objc_msgSend(MEMORY[0x1E0D4D7B8], "OIDWithString:error:", v8, &v22, v18);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v22;
          if (v9)
          {
            objc_msgSend(v4, "addObject:", v9);
          }
          else
          {
            _ef_log_ECCMSEncoder();
            v11 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v10, "ef_publicDescription");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v29 = v8;
              v30 = 2114;
              v31 = v12;
              _os_log_error_impl(&dword_1B9ADE000, v11, OS_LOG_TYPE_ERROR, "Error for recipient OID %{public}@: %{public}@", buf, 0x16u);

            }
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      }
      while (v5);
    }

    v13 = v4;
  }
  else
  {
    v13 = 0;
  }
  if (objc_msgSend(v13, "count", v18))
  {
    v14 = objc_alloc(MEMORY[0x1E0D4D788]);
    v27 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithCertificate:algorithmCapabilities:", v19, v15);

  }
  else
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D788]), "initWithCertificate:", v19);
  }

  return v16;
}

+ (id)_recipientInfosForRecipients:(_QWORD *)a3 outError:
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  id v20;
  _BYTE v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = objc_opt_self();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __54__ECCMSEncoder__recipientInfosForRecipients_outError___block_invoke;
  v16 = &unk_1E7120C40;
  v18 = v5;
  v7 = v6;
  v17 = v7;
  objc_msgSend(v4, "ef_compactMap:", &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count", v13, v14, v15, v16))
  {
    _ef_log_ECCMSEncoder();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[ECCMSEncoder _recipientInfosForRecipients:outError:].cold.1((uint64_t)v21, objc_msgSend(v7, "count"), v9);

    if (a3)
    {
      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v19 = CFSTR("ECCMS_Recipient");
      v20 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *a3 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("ECCMSErrorDomain"), 3, v11);

    }
  }

  return v8;
}

+ (uint64_t)_capabilitiesContainCapabilityRequiringAuthEnvelopedData:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  objc_msgSend((id)objc_opt_self(), "oidStringsForAuthenticatedEncryption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__ECCMSEncoder__capabilitiesContainCapabilityRequiringAuthEnvelopedData___block_invoke;
  v7[3] = &unk_1E7120C18;
  v8 = v3;
  v4 = v3;
  v5 = objc_msgSend(v2, "ef_any:", v7);

  return v5;
}

uint64_t __121__ECCMSEncoder_encryptedDataFromContentData_senderCertificate_senderCapabilities_recipients_outIsAuthenticated_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[ECCMSEncoder _capabilitiesContainCapabilityRequiringAuthEnvelopedData:](v2, v3);

  return v4;
}

uint64_t __73__ECCMSEncoder__capabilitiesContainCapabilityRequiringAuthEnvelopedData___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

id __54__ECCMSEncoder__recipientInfosForRecipients_outError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __SecCertificate *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  CFStringRef commonName;
  _BYTE v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (__SecCertificate *)objc_msgSend(v3, "certificate");
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ECCMSEncoder _recipientInfoForCertificate:andCapabilities:](v5, (uint64_t)v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    commonName = 0;
    SecCertificateCopyCommonName(v4, &commonName);
    v8 = (__CFString *)commonName;
    _ef_log_ECCMSEncoder();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[__CFString emailAddressValue](v8, "emailAddressValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      __54__ECCMSEncoder__recipientInfosForRecipients_outError___block_invoke_cold_1(v10, (uint64_t)v13, v9);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }

  return v7;
}

+ (NSString)oidStringForEncryptedSubject
{
  return (NSString *)(id)*MEMORY[0x1E0D4D6A8];
}

+ (NSOrderedSet)oidStringsForAuthenticatedEncryption
{
  if (oidStringsForAuthenticatedEncryption_onceToken != -1)
    dispatch_once(&oidStringsForAuthenticatedEncryption_onceToken, &__block_literal_global_42);
  return (NSOrderedSet *)(id)oidStringsForAuthenticatedEncryption_authenticatedEncryptionOIDStrings;
}

void __52__ECCMSEncoder_oidStringsForAuthenticatedEncryption__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99E40]);
  v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E0D4D730], *MEMORY[0x1E0D4D720], *MEMORY[0x1E0D4D710], *MEMORY[0x1E0D4D728], *MEMORY[0x1E0D4D718], *MEMORY[0x1E0D4D708], 0);
  v2 = (void *)oidStringsForAuthenticatedEncryption_authenticatedEncryptionOIDStrings;
  oidStringsForAuthenticatedEncryption_authenticatedEncryptionOIDStrings = v1;

}

+ (id)oidsForEncryptWithGCM:(BOOL)a3 encryptSubject:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D4D790]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v6, "capabilities", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "OIDString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v12);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }

    if (v4)
    {
      objc_msgSend(a1, "oidStringForEncryptedSubject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v13);

    }
  }
  else
  {
    if (!a4)
    {
      v7 = (id)MEMORY[0x1E0C9AA60];
      return v7;
    }
    objc_msgSend(a1, "oidStringForEncryptedSubject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (void)encryptedDataFromContentData:(uint64_t)a3 senderCertificate:(uint64_t)a4 senderCapabilities:(uint64_t)a5 recipients:(uint64_t)a6 outIsAuthenticated:(uint64_t)a7 outError:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1B9ADE000, a1, a3, "Failed to create content infos", a5, a6, a7, a8, 0);
}

+ (void)encryptedDataFromContentData:(uint64_t)a3 senderCertificate:(uint64_t)a4 senderCapabilities:(uint64_t)a5 recipients:(uint64_t)a6 outIsAuthenticated:(uint64_t)a7 outError:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1B9ADE000, a1, a3, "Failed to encode content data", a5, a6, a7, a8, 0);
}

+ (void)encryptedDataFromContentData:(NSObject *)a3 senderCertificate:senderCapabilities:recipients:outIsAuthenticated:outError:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1B9ADE000, a2, a3, "Failed to create some recipient infos: %{public}@", (uint8_t *)a2);

}

+ (void)_recipientInfosForRecipients:(NSObject *)a3 outError:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0(&dword_1B9ADE000, a2, a3, "Failed to create %lu recipient infos", (uint8_t *)a1);
}

void __54__ECCMSEncoder__recipientInfosForRecipients_outError___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1B9ADE000, a2, a3, "Failed to create info for recipient: %{public}@", (uint8_t *)a2);

}

@end
