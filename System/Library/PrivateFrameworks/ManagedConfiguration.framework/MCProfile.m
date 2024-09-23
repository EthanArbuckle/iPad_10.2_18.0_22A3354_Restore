@implementation MCProfile

- (BOOL)isUserEnrollmentProfile
{
  void *v2;
  void *v3;
  char v4;

  -[MCProfile payloadsWithClass:](self, "payloadsWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "isUserEnrollment");
  else
    v4 = 0;

  return v4;
}

- (NSString)removalPasscode
{
  return self->_removalPasscode;
}

- (void)setRemovalPasscode:(id)a3
{
  NSString *v5;
  NSString **p_removalPasscode;
  NSString *removalPasscode;
  NSString *v8;

  v5 = (NSString *)a3;
  removalPasscode = self->_removalPasscode;
  p_removalPasscode = &self->_removalPasscode;
  if (removalPasscode != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_removalPasscode, a3);
    v5 = v8;
  }

}

- (id)hasRequiredAppIDForMDM
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  id v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MCProfile payloads](self, "payloads", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = v6;
          objc_msgSend(v7, "requiredAppIDForMDM");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            objc_msgSend(v7, "requiredAppIDForMDM");
            v3 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }

        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:

  return v3;
}

- (int)trustLevel
{
  NSObject *trustEvaluationQueue;
  _QWORD block[5];

  trustEvaluationQueue = self->_trustEvaluationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__MCProfile_trustLevel__block_invoke;
  block[3] = &unk_1E41E0C18;
  block[4] = self;
  dispatch_sync(trustEvaluationQueue, block);
  return self->_trustQueueTrustLevel;
}

void __23__MCProfile_trustLevel__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[12])
  {
    objc_msgSend(v2, "signerCertificates");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "signatureVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = +[MCProfile evaluateTrustOfCertificateChain:signatureVersion:](MCProfile, "evaluateTrustOfCertificateChain:signatureVersion:", v3, v4);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = 1;
  }
}

- (__SecCertificate)signerCertificate
{
  void *v2;
  __SecCertificate *v3;

  -[MCProfile signerCertificates](self, "signerCertificates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v3 = (__SecCertificate *)objc_msgSend(v2, "firstObject");
  else
    v3 = 0;

  return v3;
}

- (NSArray)signerCertificates
{
  NSObject *signerEvaluationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__13;
  v10 = __Block_byref_object_dispose__13;
  v11 = 0;
  signerEvaluationQueue = self->_signerEvaluationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__MCProfile_signerCertificates__block_invoke;
  v5[3] = &unk_1E41E0CF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(signerEvaluationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __31__MCProfile_signerCertificates__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (NSArray)signerCertificatesData
{
  NSObject *signerEvaluationQueue;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t Length;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__13;
  v21 = __Block_byref_object_dispose__13;
  v22 = 0;
  signerEvaluationQueue = self->_signerEvaluationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MCProfile_signerCertificatesData__block_invoke;
  block[3] = &unk_1E41E0CF8;
  block[4] = self;
  block[5] = &v17;
  dispatch_sync(signerEvaluationQueue, block);
  v3 = objc_msgSend((id)v18[5], "count");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (id)v18[5];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v23, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          Length = SecCertificateGetLength();
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", SecCertificateGetBytePtr(), Length, v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v23, 16);
      }
      while (v6);
    }

  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return (NSArray *)v4;
}

void __35__MCProfile_signerCertificatesData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)signerSummary
{
  void *v2;
  void *v3;

  -[MCProfile signerCertificates](self, "signerCertificates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    +[MCProfile signerSummaryOfCertificate:](MCProfile, "signerSummaryOfCertificate:", objc_msgSend(v2, "firstObject"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setSignerCertificates:(id)a3
{
  id v4;
  NSObject *signerEvaluationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  signerEvaluationQueue = self->_signerEvaluationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MCProfile_setSignerCertificates___block_invoke;
  block[3] = &unk_1E41E0D70;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(signerEvaluationQueue, block);

}

void __35__MCProfile_setSignerCertificates___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (NSArray)installationWarnings
{
  return (NSArray *)-[MCProfile installationWarningsIncludeUnsignedProfileWarning:](self, "installationWarningsIncludeUnsignedProfileWarning:", 1);
}

- (id)installationWarningsIncludeUnsignedProfileWarning:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[MCProfile trustLevel](self, "trustLevel") != 2)
  {
    if (-[MCProfile isSigned](self, "isSigned"))
    {
      MCLocalizedString(CFSTR("INSTALL_WARNING_NOT_VERIFIED_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCProfile friendlyName](self, "friendlyName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      MCLocalizedFormat(CFSTR("INSTALL_WARNING_NOT_VERIFIED_P_TITLE"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v6, v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v16);

    }
    else
    {
      MCLocalizedString(CFSTR("INSTALL_WARNING_NOT_SIGNED_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      MCLocalizedString(CFSTR("INSTALL_WARNING_NOT_SIGNED"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v6, v7, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v15);
    }

  }
  if (-[MCProfile isLocked](self, "isLocked"))
  {
    -[MCProfile removalPasscode](self, "removalPasscode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    MCLocalizedString(CFSTR("INSTALL_WARNING_NOT_REMOVABLE_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v20 = CFSTR("INSTALL_WARNING_NOT_REMOVABLE_AUTH");
    else
      v20 = CFSTR("INSTALL_WARNING_NOT_REMOVABLE");
    MCLocalizedString(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v19, v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v22);

  }
  return v5;
}

- (BOOL)mustInstallNonInteractively
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_mustInstallNonInteractively)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    -[MCProfile payloads](self, "payloads", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v2)
    {
      v4 = *(_QWORD *)v8;
      while (2)
      {
        for (i = 0; i != v2; ++i)
        {
          if (*(_QWORD *)v8 != v4)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "mustInstallNonInteractively") & 1) != 0)
          {
            LOBYTE(v2) = 1;
            goto LABEL_13;
          }
        }
        v2 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (v2)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v2;
}

+ (MCProfile)profileWithData:(id)a3 outError:(id *)a4
{
  return (MCProfile *)objc_msgSend(a1, "profileWithData:options:fileName:allowEmptyPayload:outError:", a3, 0, 0, 0, a4);
}

+ (MCProfile)profileWithData:(id)a3 fileName:(id)a4 outError:(id *)a5
{
  return (MCProfile *)objc_msgSend(a1, "profileWithData:options:fileName:allowEmptyPayload:outError:", a3, 0, a4, 0, a5);
}

+ (MCProfile)profileWithData:(id)a3 fileName:(id)a4 allowEmptyPayload:(BOOL)a5 outError:(id *)a6
{
  return (MCProfile *)objc_msgSend(a1, "profileWithData:options:fileName:allowEmptyPayload:outError:", a3, 0, a4, a5, a6);
}

- (NSArray)payloads
{
  return 0;
}

- (NSArray)payloadsContentInfo
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (-[MCProfile isEncrypted](self, "isEncrypted"))
    return (NSArray *)0;
  -[MCProfile payloads](self, "payloads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v11 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "version"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("PayloadVersion"));

        objc_msgSend(v10, "type");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v10, "type");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("PayloadType"));

        }
        objc_msgSend(v10, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v10, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("PayloadIdentifier"));

        }
        objc_msgSend(v10, "UUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v10, "UUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("PayloadUUID"));

        }
        objc_msgSend(v10, "displayName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v10, "displayName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("PayloadDisplayName"));

        }
        objc_msgSend(v10, "payloadDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v10, "payloadDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, CFSTR("PayloadDescription"));

        }
        objc_msgSend(v10, "organization");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(v10, "organization");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, CFSTR("PayloadOrganization"));

        }
        objc_msgSend(v5, "addObject:", v11);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  return (NSArray *)v5;
}

- (NSArray)managedPayloads
{
  return 0;
}

- (id)payloadWithUUID:(id)a3
{
  return 0;
}

- (__SecCertificate)copyCertificateFromPayloadWithUUID:(id)a3
{
  return 0;
}

- (id)subjectSummaryFromCertificatePayloadWithUUID:(id)a3
{
  return 0;
}

- (__SecCertificate)copyCertificateWithPersistentID:(id)a3
{
  return 0;
}

- (id)subjectSummaryFromCertificateWithPersistentID:(id)a3
{
  return 0;
}

- (BOOL)isSigned
{
  void *v2;
  BOOL v3;

  -[MCProfile signerCertificates](self, "signerCertificates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (int64_t)installType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[MCProfile installOptions](self, "installOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("installationType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)isInstalledForSystem
{
  return -[MCProfile installType](self, "installType") != 2;
}

- (BOOL)isInstalledForUser
{
  return -[MCProfile installType](self, "installType") == 2;
}

- (NSString)friendlyName
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  int v14;
  id v15;
  __int16 v16;
  MCProfile *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MCProfile displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[MCProfile displayName](self, "displayName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MCProfile identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      -[MCProfile identifier](self, "identifier");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MCProfile UUID](self, "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (v9)
      {
        -[MCProfile UUID](self, "UUID");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = (void *)_MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          v11 = v10;
          v14 = 138543618;
          v15 = (id)objc_opt_class();
          v16 = 2048;
          v17 = self;
          v12 = v15;
          _os_log_impl(&dword_19ECC4000, v11, OS_LOG_TYPE_ERROR, "Profile %{public}@ %p has no friendly name.", (uint8_t *)&v14, 0x16u);

        }
        v5 = CFSTR("Profile");
      }
    }
  }
  return (NSString *)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Profile %@ %p, version %d:\n"), objc_opt_class(), self, self->_version);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_displayName, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("Display Name: “%@”\n"), self->_displayName);
  if (-[NSString length](self->_profileDescription, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("Description : “%@”\n"), self->_profileDescription);
  if (-[NSString length](self->_identifier, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("Identifier  : %@\n"), self->_identifier);
  if (-[NSString length](self->_UUID, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("UUID        : %@\n"), self->_UUID);
  if (-[NSString length](self->_organization, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("Organization: %@\n"), self->_organization);
  if (self->_installDate)
    objc_msgSend(v3, "appendFormat:", CFSTR("Installed   : %@\n"), self->_installDate);
  if (self->_installOptions)
    objc_msgSend(v3, "appendFormat:", CFSTR("Install opts: %@\n"), self->_installOptions);
  MCStringForBool(self->_isStub);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Is Stub     : %@\n"), v4);

  MCStringForBool(self->_isLocked);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Locked      : %@\n"), v5);

  if (self->_removalPasscode)
    objc_msgSend(v3, "appendFormat:", CFSTR("Removal passcode present\n"));
  MCStringForBool(self->_encrypted);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Encrypted   : %@\n"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("Trusted     : %d\n"), -[MCProfile trustLevel](self, "trustLevel"));
  MCStringForBool(-[MCProfile isSigned](self, "isSigned"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Signed      : %@\n"), v7);

  -[MCProfile expiryDate](self, "expiryDate");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    objc_msgSend(v3, "appendFormat:", CFSTR("Expires     : %@\n"), v8);
  if (-[MCProfile isManagedByProfileService](self, "isManagedByProfileService"))
    objc_msgSend(v3, "appendFormat:", CFSTR("Profile svc : Yes\n"));
  if (self->_removalDate)
    objc_msgSend(v3, "appendFormat:", CFSTR("Remove after: %@\n"), self->_removalDate);
  if (self->_localizedConsentText)
    objc_msgSend(v3, "appendFormat:", CFSTR("Consent text: %@\n"), self->_localizedConsentText);
  objc_msgSend(v3, "appendFormat:", CFSTR("Device Type : %lu\n"), self->_targetDeviceType);
  if (-[MCProfile mustInstallNonInteractively](self, "mustInstallNonInteractively"))
    objc_msgSend(v3, "appendString:", CFSTR("Must be installed non-interactively.\n"));
  if (self->_needsReboot)
    objc_msgSend(v3, "appendFormat:", CFSTR("Needs reboot\n"));

  return v3;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[MCProfile description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MCProfile signerCertificates](self, "signerCertificates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("Signers     : "));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[MCProfile signerCertificates](self, "signerCertificates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      v11 = 1;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x1A1AF0250]();
          +[MCProfile signerSummaryOfCertificate:](MCProfile, "signerSummaryOfCertificate:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v11 & 1) == 0)
            objc_msgSend(v4, "appendFormat:", CFSTR("              "));
          objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), v15);

          objc_autoreleasePoolPop(v14);
          v11 = 0;
          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v11 = 0;
      }
      while (v9);
    }

  }
  return v4;
}

- (id)serializedDictionary
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSDate *installDate;
  void *v8;
  NSDictionary *installOptions;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSDate *removalDate;
  void *v32;
  NSString *localizedConsentText;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Class"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_version);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Version"));

  if (-[NSString length](self->_displayName, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_displayName, CFSTR("Display Name"));
  if (-[NSString length](self->_profileDescription, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_profileDescription, CFSTR("Description"));
  if (-[NSString length](self->_identifier, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("Identifier"));
  if (-[NSString length](self->_UUID, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_UUID, CFSTR("UUID"));
  if (-[NSString length](self->_organization, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_organization, CFSTR("Organization"));
  installDate = self->_installDate;
  if (installDate)
  {
    -[NSDate description](installDate, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("Install Date"));

  }
  installOptions = self->_installOptions;
  if (installOptions)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", installOptions, CFSTR("Install Options"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStub);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("Is Stub"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLocked);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("Is Locked"));

  if (self->_removalPasscode)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E4212AF0, CFSTR("Has Removal Passcode"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_encrypted);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("Encrypted"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MCProfile trustLevel](self, "trustLevel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("Trusted"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCProfile isSigned](self, "isSigned"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("Signed"));

  -[MCProfile signerCertificates](self, "signerCertificates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[MCProfile signerCertificates](self, "signerCertificates");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v18, "count"));

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[MCProfile signerCertificates](self, "signerCertificates", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          v26 = (void *)MEMORY[0x1A1AF0250]();
          +[MCProfile signerSummaryOfCertificate:](MCProfile, "signerSummaryOfCertificate:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v27);

          objc_autoreleasePoolPop(v26);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("Signers"));
  }
  -[MCProfile expiryDate](self, "expiryDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    objc_msgSend(v28, "description");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("Expiry"));

  }
  if (-[MCProfile isManagedByProfileService](self, "isManagedByProfileService"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E4212AF0, CFSTR("Profile Service"));
  removalDate = self->_removalDate;
  if (removalDate)
  {
    -[NSDate description](removalDate, "description");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("Removal Date"));

  }
  localizedConsentText = self->_localizedConsentText;
  if (localizedConsentText)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", localizedConsentText, CFSTR("Consent Text"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_targetDeviceType);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("Device Type"));

  if (-[MCProfile mustInstallNonInteractively](self, "mustInstallNonInteractively"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E4212AF0, CFSTR("Must Install Non-Interactively"));
  if (self->_needsReboot)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E4212AF0, CFSTR("Needs Reboot"));

  return v3;
}

- (NSArray)localizedPayloadSummaryByType
{
  return 0;
}

- (NSArray)localizedManagedPayloadSummaryByType
{
  return 0;
}

- (NSDate)earliestCertificateExpiryDate
{
  return 0;
}

- (NSDictionary)localizedManagedProfileConsentTexts
{
  void *v3;
  NSString *localizedConsentText;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!self->_localizedConsentText)
    return (NSDictionary *)MEMORY[0x1E0C9AA70];
  -[MCProfile friendlyName](self, "friendlyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  localizedConsentText = self->_localizedConsentText;
  v7 = v3;
  v8[0] = localizedConsentText;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (NSDate)expiryDate
{
  uint64_t v3;
  void *v4;
  NSDate *v5;
  uint64_t v6;
  NSDate *expiryDate;
  NSDate *v8;

  -[MCProfile earliestCertificateExpiryDate](self, "earliestCertificateExpiryDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v3, -1209600.0),
        v5 = (NSDate *)objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    if (self->_expiryDate)
    {
      v6 = -[NSDate compare:](v5, "compare:");
      expiryDate = v5;
      if (v6 != -1)
        expiryDate = self->_expiryDate;
      v8 = expiryDate;

      v5 = v8;
    }
  }
  else
  {
    v5 = self->_expiryDate;
  }
  return v5;
}

- (NSDate)unmodifiedExpiryDate
{
  NSDate *v3;
  NSDate *v4;
  NSDate *expiryDate;
  uint64_t v6;
  NSDate *v7;

  -[MCProfile earliestCertificateExpiryDate](self, "earliestCertificateExpiryDate");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    expiryDate = v3;
    if (self->_expiryDate)
    {
      v6 = -[NSDate compare:](v3, "compare:");
      expiryDate = v4;
      if (v6 != -1)
        expiryDate = self->_expiryDate;
    }
  }
  else
  {
    expiryDate = self->_expiryDate;
  }
  v7 = expiryDate;

  return v7;
}

- (BOOL)isManagedByProfileService
{
  return 0;
}

- (void)evaluateSignerTrust
{
  id v3;

  -[MCProfile trustLevel](self, "trustLevel");
  v3 = -[MCProfile signerSummary](self, "signerSummary");
}

- (void)evaluateSignerTrustAsynchronouslyWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__MCProfile_evaluateSignerTrustAsynchronouslyWithCompletion___block_invoke;
  v7[3] = &unk_1E41E41F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __61__MCProfile_evaluateSignerTrustAsynchronouslyWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "evaluateSignerTrust");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (BOOL)doesSigningAllowReplacementWithProfile:(id)a3
{
  id v4;
  int AppBooleanValue;
  BOOL v6;
  uint64_t v7;
  BOOL v8;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v4 = a3;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MCOriginalSignerCheck"), CFSTR("com.apple.profiled"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v6 = AppBooleanValue == 0;
  else
    v6 = 1;
  v7 = !v6;
  v8 = -[MCProfile doesSigningAllowReplacementWithProfile:useOriginalCheck:](self, "doesSigningAllowReplacementWithProfile:useOriginalCheck:", v4, v7);

  return v8;
}

- (BOOL)doesSigningAllowReplacementWithProfile:(id)a3 useOriginalCheck:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  __SecCertificate *v7;
  __SecCertificate *v8;
  const void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  const void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[MCProfile signerCertificate](self, "signerCertificate");
  if (v7)
  {
    v8 = v7;
    v9 = (const void *)objc_msgSend(v6, "signerCertificate");
    if (v9)
    {
      if (v4
        && (-[MCProfile installOptions](self, "installOptions"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("signatureVersion")),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v11,
            v10,
            !v11))
      {
        -[MCProfile signerCertificates](self, "signerCertificates");
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v21;
          while (2)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v21 != v17)
                objc_enumerationMutation(v14);
              v19 = *(const void **)(*((_QWORD *)&v20 + 1) + 8 * i);
              if (v19 && CFEqual(v9, v19))
              {
                LODWORD(v9) = 1;
                goto LABEL_20;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            if (v16)
              continue;
            break;
          }
        }
        LODWORD(v9) = 0;
LABEL_20:

      }
      else
      {
        LODWORD(v9) = CFEqual(v9, v8) != 0;
      }
    }
    v12 = (_DWORD)v9 != 0;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)isProfileUIInstallationEffectivelyAllowed
{
  void *v2;
  int v3;

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveRestrictedBoolForSetting:", CFSTR("allowUIConfigurationProfileInstallation"));

  return v3 != 2;
}

- (BOOL)mayInstallWithOptions:(id)a3 hasInteractionClient:(BOOL)a4 outError:(id *)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v6 = a4;
  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v6
    && (-[MCProfile mustInstallNonInteractively](self, "mustInstallNonInteractively")
     || !-[MCProfile isProfileUIInstallationEffectivelyAllowed](self, "isProfileUIInstallationEffectivelyAllowed")))
  {
    v36 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("ERROR_PROFILE_NO_INTERACTIVE_INSTALLATION"), v9, v10, v11, v12, v13, v14, v15, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v36;
    v39 = 4020;
    goto LABEL_28;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isCloudProfile"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v35 = 0;
    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v40 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("ERROR_PROFILE_MUST_BE_CONFIGURATION"), v17, v18, v19, v20, v21, v22, v23, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v40;
    v39 = 4011;
LABEL_28:
    objc_msgSend(v38, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCInstallationErrorDomain"), v39, v37, CFSTR("MCFatalError"));
    v35 = (id)objc_claimAutoreleasedReturnValue();

    if (!a5)
      goto LABEL_35;
    goto LABEL_33;
  }
  if (mayInstallWithOptions_hasInteractionClient_outError__onceToken != -1)
    dispatch_once(&mayInstallWithOptions_hasInteractionClient_outError__onceToken, &__block_literal_global_40);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[MCProfile payloads](self, "payloads");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v59;
    v52 = a5;
    v53 = v8;
    while (1)
    {
      v28 = 0;
LABEL_11:
      if (*(_QWORD *)v59 != v27)
        objc_enumerationMutation(v24);
      v29 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v28);
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v30 = (id)mayInstallWithOptions_hasInteractionClient_outError__acceptablePayloadClasses;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      if (!v31)
        break;
      v32 = v31;
      v33 = *(_QWORD *)v55;
LABEL_15:
      v34 = 0;
      while (1)
      {
        if (*(_QWORD *)v55 != v33)
          objc_enumerationMutation(v30);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v32 == ++v34)
        {
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          if (v32)
            goto LABEL_15;
          goto LABEL_30;
        }
      }

      if (++v28 != v26)
        goto LABEL_11;
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      v35 = 0;
      a5 = v52;
      v8 = v53;
      if (!v26)
        goto LABEL_32;
    }
LABEL_30:

    v41 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v29, "type");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    MCErrorArray(CFSTR("ERROR_UNNACEPTABLE_PAYLOAD_P_TYPE"), v43, v44, v45, v46, v47, v48, v49, v42);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCInstallationErrorDomain"), 4022, v50, CFSTR("MCFatalError"));
    v35 = (id)objc_claimAutoreleasedReturnValue();

    a5 = v52;
    v8 = v53;
  }
  else
  {
    v35 = 0;
  }
LABEL_32:

  if (a5)
  {
LABEL_33:
    if (v35)
    {
      v35 = objc_retainAutorelease(v35);
      *a5 = v35;
    }
  }
LABEL_35:

  return v35 == 0;
}

void __65__MCProfile_mayInstallWithOptions_hasInteractionClient_outError___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mayInstallWithOptions_hasInteractionClient_outError__acceptablePayloadClasses;
  mayInstallWithOptions_hasInteractionClient_outError__acceptablePayloadClasses = v0;

}

- (id)restrictionsWithHeuristicsAppliedOutError:(id *)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  MCProfile *v39;
  id *v40;
  id v41;
  uint8_t buf[8];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[MCProfile payloads](self, "payloads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v7)
  {
    v8 = v7;
    v39 = self;
    v40 = a3;
    v9 = *(_QWORD *)v45;
    v10 = 1;
LABEL_3:
    v11 = 0;
    v12 = v5;
    while (1)
    {
      if (*(_QWORD *)v45 != v9)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v11);
      if (v13)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v11), "restrictions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "MCValidateRestrictions");

      }
      else
      {
        v15 = 1;
      }
      v16 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v13, "restrictions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dictionaryWithDictionary:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v15 & 1) == 0)
        objc_msgSend(v18, "MCSanitizeRestrictions");
      v10 &= v15;
      v43 = 0;
      +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:](MCRestrictionManager, "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:", v18, v12, 0, &v43);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v19 = v43;

      if (v19)
        break;
      ++v11;
      v12 = v5;
      if (v8 == v11)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }

    if ((v10 & 1) != 0)
    {
      self = v39;
      a3 = v40;
    }
    else
    {
      v20 = _MCLogObjects;
      self = v39;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19ECC4000, v20, OS_LOG_TYPE_DEFAULT, "Profile contains invalid restrictions", buf, 2u);
      }
      a3 = v40;
    }
  }
  else
  {

    v19 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isSupervised");

  if ((v22 & 1) == 0)
  {
    +[MCRestrictionManager filterGrandfatheredRestrictionsIfNeededFromRestrictions:](MCRestrictionManager, "filterGrandfatheredRestrictionsIfNeededFromRestrictions:", v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "mutableCopy");

    v5 = (id)v24;
  }
  v25 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v25, OS_LOG_TYPE_DEFAULT, "Applying heuristics to restrictions.", buf, 2u);
  }
  +[MCHacks sharedHacks](MCHacks, "sharedHacks");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_applyHeuristicsToRestrictions:forProfile:ignoresUnrestrictableApps:", v5, self, 0);

  if (v19)
    goto LABEL_26;
  -[MCProfile friendlyName](self, "friendlyName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedErrorFormatByDevice(CFSTR("ENCRYPTION_POLICY_PAYLOAD_FAILURE_TEXT"), v28, v29, v30, v31, v32, v33, v34, (uint64_t)v27);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCDeviceCapabilities currentDevice](MCDeviceCapabilities, "currentDevice");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v36, "validateCapabilitiesRequiredByRestrictions:localizedIncompatibilityMessage:outError:", v5, v35, &v41);
  v19 = v41;

  if (v19)
  {
LABEL_26:
    if (a3)
    {
      v19 = objc_retainAutorelease(v19);
      v37 = 0;
      *a3 = v19;
    }
    else
    {
      v37 = 0;
    }
  }
  else
  {
    v37 = v5;
  }

  return v37;
}

- (id)appAccessibilityParameters
{
  return 0;
}

- (BOOL)shouldHaveFullSSLTrust
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[MCProfile installOptions](self, "installOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("isInstalledByMDM"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("isInstalledInteractively"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = (v5 & 1) != 0
    || v6 && !objc_msgSend(v6, "BOOLValue")
    || -[MCProfile containsPayloadOfClass:](self, "containsPayloadOfClass:", objc_opt_class());

  return v8;
}

- (BOOL)isManagedByMDM
{
  void *v2;
  BOOL v3;

  -[MCProfile managingProfileIdentifier](self, "managingProfileIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)managingProfileIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  +[MCDependencyReader sharedReader](MCDependencyReader, "sharedReader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dependentsOfParent:inDomain:", self->_identifier, CFSTR("ManagedProfileToManagingProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isSupervisionProfile
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[MCProfile containsPayloadOfClass:](self, "containsPayloadOfClass:", objc_opt_class());
}

- (id)payloadsOfKindOfClass:(Class)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MCProfile payloads](self, "payloads", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (NSString)profileDescription
{
  return self->_profileDescription;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (BOOL)isEncrypted
{
  return self->_encrypted;
}

- (void)setEncrypted:(BOOL)a3
{
  self->_encrypted = a3;
}

- (NSString)organization
{
  return self->_organization;
}

- (int64_t)version
{
  return self->_version;
}

- (NSDate)installDate
{
  return self->_installDate;
}

- (void)setInstallDate:(id)a3
{
  objc_storeStrong((id *)&self->_installDate, a3);
}

- (unint64_t)targetDeviceType
{
  return self->_targetDeviceType;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (BOOL)needsReboot
{
  return self->_needsReboot;
}

- (BOOL)isStub
{
  return self->_isStub;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (NSDate)removalDate
{
  return self->_removalDate;
}

- (NSDictionary)installOptions
{
  return self->_installOptions;
}

- (void)setInstallOptions:(id)a3
{
  objc_storeStrong((id *)&self->_installOptions, a3);
}

- (void)setMustInstallNonInteractively:(BOOL)a3
{
  self->_mustInstallNonInteractively = a3;
}

- (NSString)localizedConsentText
{
  return self->_localizedConsentText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedConsentText, 0);
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_removalDate, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_removalPasscode, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_installDate, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_profileDescription, 0);
  objc_storeStrong((id *)&self->_signerEvaluationQueue, 0);
  objc_storeStrong((id *)&self->_signerQueueSignerCertificates, 0);
  objc_storeStrong((id *)&self->_signerQueueSignerSummary, 0);
  objc_storeStrong((id *)&self->_trustEvaluationQueue, 0);
}

+ (MCProfile)profileWithData:(id)a3 options:(id)a4 outError:(id *)a5
{
  return (MCProfile *)objc_msgSend(a1, "profileWithData:options:fileName:allowEmptyPayload:outError:", a3, a4, 0, 0, a5);
}

+ (id)_malformedProfileError
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("MALFORMED_PAYLOAD_ERROR_DESCRIPTION"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1000, v9, CFSTR("MCFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_unsupportedEnrollmentServiceProfileError
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("UNSUPPORTED_PROFILE_TYPE_ERROR_DESCRIPTION"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1016, v9, CFSTR("MCFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_unsupportedProfileTypeError
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("UNSUPPORTED_PROFILE_TYPE_ERROR_DESCRIPTION"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1017, v9, CFSTR("MCFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)badFieldTypeErrorWithField:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1003, v9, CFSTR("MCFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)missingFieldErrorWithField:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1002, v9, CFSTR("MCFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (MCProfile)profileWithData:(id)a3 options:(id)a4 fileName:(id)a5 allowEmptyPayload:(BOOL)a6 outError:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  char *v25;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v8 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (objc_msgSend(v12, "length"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(a1, "_malformedProfileError");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      if (!v17)
      {
LABEL_25:
        v20 = v21;
LABEL_26:

        goto LABEL_27;
      }
LABEL_11:
      if (a7)
        *a7 = objc_retainAutorelease(v17);
      v22 = objc_msgSend(v17, "code");
      v23 = _MCLogObjects;
      if (v22 == 1005)
      {
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_DEBUG, "Empty profile. This is probably not an error.", buf, 2u);
        }
      }
      else if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v24 = v23;
        objc_msgSend(v17, "MCVerboseDescription");
        v25 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v25;
        _os_log_impl(&dword_19ECC4000, v24, OS_LOG_TYPE_ERROR, "Failed to parse profile data. Error: %{public}@", buf, 0xCu);

      }
      v20 = 0;
      goto LABEL_26;
    }
    v29 = 0;
    v30 = 0;
    objc_msgSend(a1, "profileDictionaryFromProfileData:outSignerCerts:outError:", v12, &v30, &v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v30;
    v17 = v29;
    if (v15)
    {
      v18 = v16;
    }
    else
    {
      v28 = v16;
      +[MCCertificateWrapperProfile wrapperProfileDictionaryWithCertificateData:fileName:outSignerCerts:](MCCertificateWrapperProfile, "wrapperProfileDictionaryWithCertificateData:fileName:outSignerCerts:", v12, v14, &v28);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v28;

      if (!v15)
      {
        v21 = 0;
        goto LABEL_24;
      }
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = 0;
      objc_msgSend(a1, "profileWithDictionary:options:signerCerts:fileName:allowEmptyPayload:outError:", v15, v13, v18, v14, v8, &v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v27;
    }
    else
    {
      objc_msgSend(a1, "_malformedProfileError");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v21 = 0;
    }

LABEL_24:
    if (!v17)
      goto LABEL_25;
    goto LABEL_11;
  }
  if (a7)
  {
    objc_msgSend(a1, "_malformedProfileError");
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "+[MCProfile(Private) profileWithData:options:fileName:allowEmptyPayload:outError:]";
    _os_log_impl(&dword_19ECC4000, v19, OS_LOG_TYPE_ERROR, "%s: Trying to initialize a profile from data with zero bytes", buf, 0xCu);
  }
  v20 = 0;
LABEL_27:

  return (MCProfile *)v20;
}

+ (id)profileDictionaryFromProfileData:(id)a3 outSignerCerts:(id *)a4 outError:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  CFDataRef v39;
  void *v40;
  void *v41;
  id *v42;
  id *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  id v49;
  uint64_t v50;
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!objc_msgSend(v8, "length"))
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("ERROR_PROFILE_EMPTY"), v9, v10, v11, v12, v13, v14, v15, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1005, v20, CFSTR("MCFatalError"));
    v21 = (id)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v8, 1, 0, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = 0;
      goto LABEL_8;
    }
    objc_msgSend(a1, "_malformedProfileError");
    v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v18 = 0;
    if (v21)
      goto LABEL_15;
    goto LABEL_20;
  }
  v51 = 0;
  +[MCProfile dataFromCMSEncodedData:outSignerCertificates:](MCProfile, "dataFromCMSEncodedData:outSignerCertificates:", v8, &v51);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v51;
  if (!v22)
  {
    v17 = 0;
LABEL_19:
    objc_msgSend(a1, "_malformedProfileError");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (v21)
      goto LABEL_15;
LABEL_20:
    v28 = v17;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v22, 1, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_19;
LABEL_8:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_19;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TargetDeviceType"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "unsignedIntegerValue");
  if ((unint64_t)objc_msgSend(v23, "unsignedIntegerValue") >= 8)
  {
    objc_msgSend(a1, "_malformedProfileError");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
  v50 = 0;
  v49 = 0;
  +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v17, CFSTR("EncryptedPayloadContent"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v49);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v49;
  v43 = a5;
  if (v24)
  {
    v48 = v21;
    v25 = v24;
    +[MCCrypto objectFromEncryptedData:outCertificate:outError:](MCCrypto, "objectFromEncryptedData:outCertificate:outError:", v24, &v50, &v48);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = v48;

    if (v27)
    {
      v21 = v27;
      v24 = v25;
LABEL_43:

      a5 = v43;
      goto LABEL_44;
    }
    v24 = v25;
    if (v26)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(a1, "_malformedProfileError");
        v21 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      }
      v30 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v31 = v50;
        v32 = v30;
        +[MCProfile signerSummaryOfCertificate:](MCProfile, "signerSummaryOfCertificate:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v54 = v33;
        _os_log_impl(&dword_19ECC4000, v32, OS_LOG_TYPE_INFO, "Decrypted profile with identity: %{public}@", buf, 0xCu);

        v24 = v25;
      }
      objc_msgSend(v17, "setObject:forKey:", v26, CFSTR("PayloadContent"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ProfileWasEncrypted"));
    }
    v42 = a4;

    v21 = 0;
    a5 = v43;
  }
  else
  {
    v42 = a4;
  }
  if (objc_msgSend(v18, "count"))
  {
    v40 = v24;
    v41 = v23;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v34 = v18;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v45 != v37)
            objc_enumerationMutation(v34);
          v39 = SecCertificateCopyData(*(SecCertificateRef *)(*((_QWORD *)&v44 + 1) + 8 * i));
          if (v39)
            objc_msgSend(v26, "addObject:", v39);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v36);
    }

    if (v42)
    {
      v26 = objc_retainAutorelease(v26);
      *v42 = v26;
    }
    v24 = v40;
    v23 = v41;
    goto LABEL_43;
  }
LABEL_44:

LABEL_45:
  if (!v21)
    goto LABEL_20;
LABEL_15:
  v28 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v21);
LABEL_21:

  return v28;
}

+ (MCProfile)profileWithDictionary:(id)a3 options:(id)a4 signerCerts:(id)a5 fileName:(id)a6 allowEmptyPayload:(BOOL)a7 outError:(id *)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  void *v16;
  MCConfigurationProfile *v17;
  void *v18;
  MCConfigurationProfile *v19;
  __objc2_class *v20;

  v9 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  objc_msgSend(v13, "objectForKey:", CFSTR("PayloadType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectForKey:", CFSTR("PayloadType"));
  if (v16)
  {
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("Configuration")))
    {
      v17 = -[MCConfigurationProfile initWithDictionary:options:signerCerts:allowEmptyPayload:outError:]([MCConfigurationProfile alloc], "initWithDictionary:options:signerCerts:allowEmptyPayload:outError:", v13, v14, v15, v9, a8);
LABEL_12:
      v19 = v17;
      goto LABEL_19;
    }
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("CertificateWrapper")))
    {
      v20 = MCCertificateWrapperProfile;
LABEL_11:
      v17 = (MCConfigurationProfile *)objc_msgSend([v20 alloc], "initWithDictionary:signerCerts:allowEmptyPayload:outError:", v13, v15, v9, a8);
      goto LABEL_12;
    }
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("Profile Service")))
    {
      v20 = MCProfileServiceProfile;
      goto LABEL_11;
    }
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("Enrollment Service")))
    {
      if (a8)
      {
        objc_msgSend((id)objc_opt_class(), "_unsupportedEnrollmentServiceProfileError");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
    }
    else if (a8)
    {
      objc_msgSend(a1, "_unsupportedProfileTypeError");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  if (!a8)
    goto LABEL_18;
  objc_msgSend(a1, "_malformedProfileError");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v19 = 0;
  *a8 = v18;
LABEL_19:

  return (MCProfile *)v19;
}

- (NSString)stubFileName
{
  void *v2;
  void *v3;

  -[MCProfile identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MCHashedFilenameWithExtension:", CFSTR("stub"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)profileIDHashFileName
{
  void *v2;
  void *v3;

  -[MCProfile identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MCHashedFilenameWithExtension:", CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)profileDataFileName
{
  void *v2;
  void *v3;

  -[MCProfile identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MCHashedFilenameWithExtension:", CFSTR("pdata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (MCProfile)initWithDictionary:(id)a3 signerCerts:(id)a4 allowEmptyPayload:(BOOL)a5 outError:(id *)a6
{
  id v9;
  id v10;
  MCProfile *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *trustEvaluationQueue;
  dispatch_queue_t v14;
  OS_dispatch_queue *signerEvaluationQueue;
  void *v16;
  NSString *v17;
  void *v18;
  NSString *v19;
  OS_dispatch_queue *v20;
  OS_dispatch_queue *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  MCProfile *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  int64_t version;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSString *identifier;
  uint64_t v43;
  NSString *UUID;
  _UNKNOWN **v45;
  uint64_t v46;
  NSString *profileDescription;
  NSString *v48;
  NSString *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSString *displayName;
  uint64_t v54;
  NSString *organization;
  void *v56;
  int v57;
  NSString *v58;
  uint64_t v60;
  NSDate *expiryDate;
  uint64_t v62;
  NSString *productVersion;
  uint64_t v64;
  NSString *productBuildVersion;
  uint64_t v66;
  NSDate *removalDate;
  void *v68;
  NSString *v69;
  uint64_t v70;
  void *v71;
  NSDate *v72;
  NSDate *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t j;
  SecCertificateRef v83;
  SecCertificateRef v84;
  void *v85;
  NSString *v86;
  id v87;
  uint64_t v88;
  NSDate *installDate;
  NSString *v90;
  uint64_t v91;
  NSDictionary *installOptions;
  uint64_t v93;
  NSString *removalPasscode;
  void *v95;
  id obj;
  NSDate *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  id v101;
  void *v102;
  id i;
  id v104;
  id v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  id v115;
  id v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  objc_super v146;
  uint8_t buf[4];
  MCProfile *v148;
  __int16 v149;
  void *v150;
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v146.receiver = self;
  v146.super_class = (Class)MCProfile;
  v11 = -[MCProfile init](&v146, sel_init);
  if (!v11)
    goto LABEL_42;
  v12 = dispatch_queue_create("com.apple.managedconfiguration.trustEvaluationQueue", 0);
  trustEvaluationQueue = v11->_trustEvaluationQueue;
  v11->_trustEvaluationQueue = (OS_dispatch_queue *)v12;

  v14 = dispatch_queue_create("com.apple.managedconfiguration.signerEvaluationQueue", 0);
  signerEvaluationQueue = v11->_signerEvaluationQueue;
  v11->_signerEvaluationQueue = (OS_dispatch_queue *)v14;

  v145 = 0;
  +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("MCProfileIsRemovalStub"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v145);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (NSString *)v145;
  if (!v17)
  {
    v11->_isStub = objc_msgSend(v16, "BOOLValue");
    v144 = 0;
    +[MCProfile removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("PayloadVersion"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1002, CFSTR("ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v144);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (NSString *)v144;
    if (v19)
    {
      v17 = v19;

      goto LABEL_5;
    }
    v28 = objc_msgSend(v18, "intValue");
    v11->_version = v28;
    if (v11->_isStub)
    {
      if (v28 >= 3)
      {
        v36 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          version = v11->_version;
          *(_DWORD *)buf = 67109120;
          LODWORD(v148) = version;
          _os_log_impl(&dword_19ECC4000, v36, OS_LOG_TYPE_ERROR, "WARNING: profile contains invalid PayloadVersion “%d”.", buf, 8u);
        }
      }
    }
    else if ((v28 - 3) <= 0xFFFFFFFD)
    {
      v38 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(CFSTR("ERROR_UNSUPPORTED_VERSION"), v29, v30, v31, v32, v33, v34, v35, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1001, v39, CFSTR("MCFatalError"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (NSString *)objc_msgSend(v40, "MCCopyAsPrimaryError");
LABEL_40:

LABEL_41:
      if (v17)
        goto LABEL_6;
LABEL_42:
      v27 = v11;
      goto LABEL_43;
    }
    v143 = 0;
    +[MCProfile removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("PayloadIdentifier"), CFSTR("MCProfileErrorDomain"), 1002, CFSTR("ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v143);
    v41 = objc_claimAutoreleasedReturnValue();
    v17 = (NSString *)v143;
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v41;

    if (!v17)
    {
      v142 = 0;
      +[MCProfile removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("PayloadUUID"), CFSTR("MCProfileErrorDomain"), 1002, CFSTR("ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v142);
      v43 = objc_claimAutoreleasedReturnValue();
      v17 = (NSString *)v142;
      UUID = v11->_UUID;
      v11->_UUID = (NSString *)v43;

    }
    objc_msgSend(v9, "objectForKey:", CFSTR("PayloadDescription"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      v45 = &off_1E41DE000;
      goto LABEL_28;
    }
    objc_opt_class();
    v45 = &off_1E41DE000;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      MCStringFromArrayOfStrings(v39);
      v46 = objc_claimAutoreleasedReturnValue();
      profileDescription = v11->_profileDescription;
      v11->_profileDescription = (NSString *)v46;

      if (v11->_profileDescription)
        goto LABEL_28;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = v39;
        v49 = v11->_profileDescription;
        v11->_profileDescription = v48;
LABEL_27:

LABEL_28:
        objc_msgSend(v9, "removeObjectForKey:", CFSTR("PayloadDescription"));
        if (v17)
          goto LABEL_41;
        v113 = v39;
        v51 = v45[151];
        v141 = 0;
        objc_msgSend(v51, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("PayloadDisplayName"), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v141);
        v52 = objc_claimAutoreleasedReturnValue();
        v17 = (NSString *)v141;
        displayName = v11->_displayName;
        v11->_displayName = (NSString *)v52;

        if (!v17)
        {
          v140 = 0;
          +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("PayloadOrganization"), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v140);
          v54 = objc_claimAutoreleasedReturnValue();
          v17 = (NSString *)v140;
          organization = v11->_organization;
          v11->_organization = (NSString *)v54;

        }
        objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "isSupervised");

        if (v57)
        {
          if (!v17)
          {
            v139 = 0;
            +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("PayloadRemovalDisallowed"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v139);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = (NSString *)v139;
            if (v58)
            {
LABEL_38:
              v17 = v58;
              goto LABEL_39;
            }
            v11->_isLocked = objc_msgSend(v40, "BOOLValue");

LABEL_37:
            v138 = 0;
            +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("PayloadRebootSuggested"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v138);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = (NSString *)v138;
            if (v58)
              goto LABEL_38;
            v112 = v40;
            v11->_needsReboot = objc_msgSend(v40, "BOOLValue");
            v137 = 0;
            +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("PayloadExpirationDate"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v137);
            v60 = objc_claimAutoreleasedReturnValue();
            v17 = (NSString *)v137;
            expiryDate = v11->_expiryDate;
            v11->_expiryDate = (NSDate *)v60;

            if (v17)
              goto LABEL_48;
            v136 = 0;
            +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("ProductVersion"), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v136);
            v62 = objc_claimAutoreleasedReturnValue();
            v17 = (NSString *)v136;
            productVersion = v11->_productVersion;
            v11->_productVersion = (NSString *)v62;

            if (v17)
              goto LABEL_48;
            v135 = 0;
            +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("ProductBuildVersion"), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v135);
            v64 = objc_claimAutoreleasedReturnValue();
            v17 = (NSString *)v135;
            productBuildVersion = v11->_productBuildVersion;
            v11->_productBuildVersion = (NSString *)v64;

            if (v17
              || (v134 = 0,
                  +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("RemovalDate"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v134), v66 = objc_claimAutoreleasedReturnValue(), v17 = (NSString *)v134, removalDate = v11->_removalDate, v11->_removalDate = (NSDate *)v66, removalDate, v17))
            {
LABEL_48:
              v68 = 0;
LABEL_49:
              v39 = v113;
LABEL_50:

              v40 = v112;
              goto LABEL_40;
            }
            v133 = 0;
            +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("TargetDeviceType"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v133);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = (NSString *)v133;
            if (v69)
            {
              v17 = v69;
              goto LABEL_49;
            }
            v11->_targetDeviceType = objc_msgSend(v68, "unsignedIntValue");

            v132 = 0;
            +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("DurationUntilRemoval"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v132);
            v70 = objc_claimAutoreleasedReturnValue();
            v17 = (NSString *)v132;
            v112 = (void *)v70;
            if (v70)
            {
              v71 = (void *)MEMORY[0x1E0C99D68];
              objc_msgSend(v112, "doubleValue");
              objc_msgSend(v71, "dateWithTimeIntervalSinceNow:");
              v97 = (NSDate *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v97 = 0;
            }
            if (!v11->_removalDate || v112 && v97 && -[NSDate compare:](v97, "compare:") == NSOrderedAscending)
            {
              v72 = v97;
              v73 = v11->_removalDate;
              v11->_removalDate = v97;

            }
            if (v17
              || (v131 = 0,
                  +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("ConsentText"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v131), v74 = (void *)objc_claimAutoreleasedReturnValue(), v17 = (NSString *)v131, (v102 = v74) == 0))
            {
              v102 = 0;
            }
            else if (objc_msgSend(v74, "count"))
            {
              objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
              v75 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "allKeys");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = (void *)v75;
              objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:forPreferences:");
              v127 = 0u;
              v128 = 0u;
              v129 = 0u;
              v130 = 0u;
              obj = (id)objc_claimAutoreleasedReturnValue();
              v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v153, 16);
              if (v99)
              {
                v98 = *(_QWORD *)v128;
                while (2)
                {
                  for (i = 0; i != (id)v99; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v128 != v98)
                      objc_enumerationMutation(obj);
                    v109 = *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * (_QWORD)i);
                    v123 = 0u;
                    v124 = 0u;
                    v125 = 0u;
                    v126 = 0u;
                    v105 = v100;
                    v76 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v123, v152, 16);
                    if (v76)
                    {
                      v77 = v76;
                      v107 = *(_QWORD *)v124;
LABEL_75:
                      v78 = 0;
                      while (1)
                      {
                        if (*(_QWORD *)v124 != v107)
                          objc_enumerationMutation(v105);
                        if ((objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * v78), "hasPrefix:", v109) & 1) != 0)
                          break;
                        if (v77 == ++v78)
                        {
                          v77 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v123, v152, 16);
                          if (v77)
                            goto LABEL_75;
                          goto LABEL_81;
                        }
                      }

                      objc_msgSend(v102, "objectForKey:", v109);
                      v79 = objc_claimAutoreleasedReturnValue();
                      if (!v79)
                        continue;
                      v80 = (void *)v79;
                      v81 = obj;
                      goto LABEL_108;
                    }
LABEL_81:

                  }
                  v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v153, 16);
                  if (v99)
                    continue;
                  break;
                }
              }

              objc_msgSend(v102, "objectForKey:", CFSTR("default"));
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v80)
              {
                objc_msgSend(v102, "objectForKey:", CFSTR("en"));
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v80)
                {
                  objc_msgSend(v102, "allValues");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v81, "firstObject");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_108:

                }
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_storeStrong((id *)&v11->_localizedConsentText, v80);
              else
                v87 = +[MCProfile badFieldTypeErrorWithField:](MCProfile, "badFieldTypeErrorWithField:", CFSTR("ConsentText"));

            }
            if (v11->_isStub)
            {
              if (v17)
              {

LABEL_124:
                v39 = v113;
                v68 = v97;
                goto LABEL_50;
              }
              v122 = 0;
              +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("SignerCerts"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v122);
              v101 = (id)objc_claimAutoreleasedReturnValue();
              v17 = (NSString *)v122;
              if (v17)
              {
LABEL_123:

                goto LABEL_124;
              }
            }
            else
            {
              v101 = v10;
            }
            if (objc_msgSend(v101, "count"))
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v101, "count"));
              v106 = (id)objc_claimAutoreleasedReturnValue();
              v118 = 0u;
              v119 = 0u;
              v120 = 0u;
              v121 = 0u;
              v104 = v101;
              v110 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v118, v151, 16);
              if (v110)
              {
                v108 = *(_QWORD *)v119;
                do
                {
                  for (j = 0; j != v110; ++j)
                  {
                    if (*(_QWORD *)v119 != v108)
                      objc_enumerationMutation(v104);
                    v83 = SecCertificateCreateWithData(0, *(CFDataRef *)(*((_QWORD *)&v118 + 1) + 8 * j));
                    if (v83)
                    {
                      v84 = v83;
                      objc_msgSend(v106, "addObject:", v83);
                      CFRelease(v84);
                    }
                  }
                  v110 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v118, v151, 16);
                }
                while (v110);
              }

            }
            else
            {
              v106 = 0;
            }
            objc_storeStrong((id *)&v11->_signerQueueSignerCertificates, v106);
            if (v17)
            {
              v85 = 0;
            }
            else
            {
              v117 = 0;
              +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("ProfileWasEncrypted"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v117);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = (NSString *)v117;
              if (v86)
              {
                v17 = v86;
              }
              else
              {
                v11->_encrypted = objc_msgSend(v85, "BOOLValue");
                objc_msgSend(v9, "removeObjectForKey:", CFSTR("ProfileWasTrusted"));
                objc_msgSend(v9, "removeObjectForKey:", CFSTR("ProfileWasSigned"));
                objc_msgSend(v9, "removeObjectForKey:", CFSTR("ProfileTrustLevel"));
                if (v11->_isStub)
                {
                  v116 = 0;
                  +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("InstallDate"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v116);
                  v88 = objc_claimAutoreleasedReturnValue();
                  v17 = (NSString *)v116;
                  installDate = v11->_installDate;
                  v11->_installDate = (NSDate *)v88;

                  if (v17)
                  {

                  }
                  else
                  {
                    v115 = 0;
                    +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("ProfileWasLocked"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v115);
                    v111 = (void *)objc_claimAutoreleasedReturnValue();
                    v90 = (NSString *)v115;
                    if (v90)
                    {
                      v17 = v90;
                    }
                    else
                    {
                      v11->_isLocked = objc_msgSend(v111, "BOOLValue");
                      v114 = 0;
                      +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("InstallOptions"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v114);
                      v91 = objc_claimAutoreleasedReturnValue();
                      v17 = (NSString *)v114;
                      installOptions = v11->_installOptions;
                      v11->_installOptions = (NSDictionary *)v91;

                      if (v11->_isLocked)
                      {
                        +[MCKeychain stringFromService:account:label:description:useSystemKeychain:outError:](MCKeychain, "stringFromService:account:label:description:useSystemKeychain:outError:", CFSTR("MCProfileRemovalPasscode"), v11->_UUID, 0, 0, -[MCProfile isInstalledForSystem](v11, "isInstalledForSystem"), 0);
                        v93 = objc_claimAutoreleasedReturnValue();
                        removalPasscode = v11->_removalPasscode;
                        v11->_removalPasscode = (NSString *)v93;

                      }
                    }

                  }
                }
                else
                {
                  v17 = 0;
                }
              }
            }

            goto LABEL_123;
          }
        }
        else if (!v17)
        {
          goto LABEL_37;
        }
        v40 = 0;
LABEL_39:
        v39 = v113;
        goto LABEL_40;
      }
    }
    +[MCProfile badFieldTypeErrorWithField:](MCProfile, "badFieldTypeErrorWithField:", CFSTR("PayloadDescription"));
    v50 = objc_claimAutoreleasedReturnValue();
    v49 = v17;
    v17 = (NSString *)v50;
    goto LABEL_27;
  }
LABEL_5:

LABEL_6:
  v20 = v11->_signerEvaluationQueue;
  v11->_signerEvaluationQueue = 0;

  v21 = v11->_trustEvaluationQueue;
  v11->_trustEvaluationQueue = 0;

  -[MCProfile malformedProfileErrorWithError:](v11, "malformedProfileErrorWithError:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (a6)
    *a6 = objc_retainAutorelease(v22);
  v24 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v25 = v24;
    objc_msgSend(v23, "MCVerboseDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v148 = v11;
    v149 = 2114;
    v150 = v26;
    _os_log_impl(&dword_19ECC4000, v25, OS_LOG_TYPE_ERROR, "%p Can't parse profile: %{public}@", buf, 0x16u);

  }
  v27 = 0;
LABEL_43:

  return v27;
}

- (id)malformedProfileErrorWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[MCProfile friendlyName](self, "friendlyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  v14 = (void *)MEMORY[0x1E0CB35C8];
  if (v5)
    MCErrorArray(CFSTR("ERROR_PROFILE_MALFORMED_P_ID"), v6, v7, v8, v9, v10, v11, v12, v5);
  else
    MCErrorArray(CFSTR("MALFORMED_PAYLOAD_ERROR_DESCRIPTION"), v6, v7, v8, v9, v10, v11, v12, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCProfileErrorDomain"), 1000, v15, v4, CFSTR("MCFatalError"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)writeStubToDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCProfile stubFileName](self, "stubFileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[MCProfile writeStubToPath:](self, "writeStubToPath:", v6);
  return (char)self;
}

- (BOOL)writeStubToPath:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MCProfile stubDictionary](self, "stubDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "MCWriteToBinaryFile:", v4);

  return v6;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  NSString *identifier;
  NSString *UUID;
  void *v8;
  void *v9;
  void *v10;
  NSDate *removalDate;
  NSString *localizedConsentText;
  void *v13;
  void *v14;
  NSDictionary *installOptions;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  CFDataRef v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  const __CFString *v35;
  NSString *v36;
  _QWORD v37[5];
  _QWORD v38[7];

  v38[5] = *MEMORY[0x1E0C80C00];
  MCProductVersion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MCProductBuildVersion();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "MCSetObjectIfNotNil:forKey:", v3, CFSTR("ProductVersion"));
  objc_msgSend(0, "MCSetObjectIfNotNil:forKey:", v4, CFSTR("ProductBuildVersion"));
  v37[0] = CFSTR("PayloadVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_version);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  UUID = self->_UUID;
  v38[0] = v5;
  v38[1] = identifier;
  v37[1] = CFSTR("PayloadIdentifier");
  v37[2] = CFSTR("PayloadUUID");
  v38[2] = UUID;
  v37[3] = CFSTR("ProfileWasEncrypted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_encrypted);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = CFSTR("MCProfileIsRemovalStub");
  v38[3] = v8;
  v38[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  removalDate = self->_removalDate;
  if (removalDate)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", removalDate, CFSTR("RemovalDate"));
  localizedConsentText = self->_localizedConsentText;
  if (localizedConsentText)
  {
    v35 = CFSTR("default");
    v36 = localizedConsentText;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("ConsentText"));

  }
  objc_msgSend(v10, "MCSetObjectIfNotNil:forKey:", self->_displayName, CFSTR("PayloadDisplayName"));
  objc_msgSend(v10, "MCSetObjectIfNotNil:forKey:", self->_profileDescription, CFSTR("PayloadDescription"));
  objc_msgSend(v10, "MCSetObjectIfNotNil:forKey:", self->_organization, CFSTR("PayloadOrganization"));
  objc_msgSend(v10, "MCSetObjectIfNotNil:forKey:", self->_installDate, CFSTR("InstallDate"));
  objc_msgSend(v10, "MCSetObjectIfNotNil:forKey:", self->_expiryDate, CFSTR("PayloadExpirationDate"));
  if (self->_needsReboot)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MCSetObjectIfNotNil:forKey:", v14, CFSTR("PayloadRebootSuggested"));

  }
  else
  {
    objc_msgSend(v10, "MCSetObjectIfNotNil:forKey:", 0, CFSTR("PayloadRebootSuggested"));
  }
  installOptions = self->_installOptions;
  if (installOptions)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", installOptions, CFSTR("InstallOptions"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_targetDeviceType);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("TargetDeviceType"));

  -[MCProfile signerCertificates](self, "signerCertificates");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0C99DE8];
    -[MCProfile signerCertificates](self, "signerCertificates");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayWithCapacity:", objc_msgSend(v20, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[MCProfile signerCertificates](self, "signerCertificates", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          v27 = SecCertificateCopyData(*(SecCertificateRef *)(*((_QWORD *)&v30 + 1) + 8 * i));
          if (v27)
            objc_msgSend(v21, "addObject:", v27);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v24);
    }

    objc_msgSend(v10, "setObject:forKey:", v21, CFSTR("SignerCerts"));
  }
  if (self->_isLocked)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v28, CFSTR("ProfileWasLocked"));

  }
  return v10;
}

- (BOOL)containsPayloadOfClass:(Class)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MCProfile payloads](self, "payloads", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)containsAnyPayloadOfClasses:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MCProfile payloads](self, "payloads", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(v4, "containsObject:", objc_opt_class()) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)containsOnlyPayloadsOfClasses:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MCProfile payloads](self, "payloads", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(v4, "containsObject:", objc_opt_class()))
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (unint64_t)countOfPayloadsOfClass:(Class)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MCProfile payloads](self, "payloads", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_opt_isKindOfClass() & 1;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)removeRequiredObjectInDictionary:(id)a3 key:(id)a4 type:(Class)a5 errorDomain:(id)a6 missingDataCode:(int64_t)a7 missingDataErrorString:(id)a8 invalidDataCode:(int64_t)a9 invalidDataErrorString:(id)a10 outError:(id *)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  int64_t v40;
  void *v41;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v19 = a10;
  objc_msgSend(v15, "objectForKey:", v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    if (a11)
    {
      v36 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(v18, v20, v21, v22, v23, v24, v25, v26, v16);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v36;
      v39 = v17;
      v40 = a7;
LABEL_8:
      objc_msgSend(v38, "MCErrorWithDomain:code:descriptionArray:errorType:", v39, v40, v37, CFSTR("MCFatalError"));
      *a11 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_9:
    v35 = 0;
    goto LABEL_10;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a11)
    {
      v41 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(v19, v28, v29, v30, v31, v32, v33, v34, v16);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v41;
      v39 = v17;
      v40 = a9;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(v15, "removeObjectForKey:", v16);
  v35 = v27;
LABEL_10:

  return v35;
}

+ (id)removeOptionalObjectInDictionary:(id)a3 key:(id)a4 type:(Class)a5 errorDomain:(id)a6 invalidDataCode:(int64_t)a7 invalidDataErrorString:(id)a8 outError:(id *)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a8;
  objc_msgSend(v13, "objectForKey:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 && (objc_msgSend(v13, "removeObjectForKey:", v14), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (a9)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(v16, v18, v19, v20, v21, v22, v23, v24, v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "MCErrorWithDomain:code:descriptionArray:errorType:", v15, a7, v27, CFSTR("MCFatalError"));
      *a9 = (id)objc_claimAutoreleasedReturnValue();

    }
    v25 = 0;
  }
  else
  {
    v25 = v17;
  }

  return v25;
}

+ (id)removeRequiredNonZeroLengthStringInDictionary:(id)a3 key:(id)a4 errorDomain:(id)a5 missingDataCode:(int64_t)a6 missingDataErrorString:(id)a7 invalidDataCode:(int64_t)a8 invalidDataErrorString:(id)a9 outError:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  int64_t v40;
  void *v41;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a9;
  objc_msgSend(v15, "objectForKey:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v15, "removeObjectForKey:", v16);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v15, "removeObjectForKey:", v16);
      if (a10)
      {
        v36 = (void *)MEMORY[0x1E0CB35C8];
        MCErrorArray(v19, v29, v30, v31, v32, v33, v34, v35, v16);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v36;
        v39 = v17;
        v40 = a8;
LABEL_9:
        objc_msgSend(v38, "MCErrorWithDomain:code:descriptionArray:errorType:", v39, v40, v37, CFSTR("MCFatalError"));
        *a10 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_10:
      v28 = 0;
      goto LABEL_11;
    }
  }
  if (!objc_msgSend(v20, "length"))
  {
    if (a10)
    {
      v41 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(v18, v21, v22, v23, v24, v25, v26, v27, v16);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v41;
      v39 = v17;
      v40 = a6;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v28 = v20;
LABEL_11:

  return v28;
}

+ (id)removeOptionalNonZeroLengthStringInDictionary:(id)a3 key:(id)a4 errorDomain:(id)a5 invalidDataCode:(int64_t)a6 invalidDataErrorString:(id)a7 outError:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  objc_msgSend(v13, "objectForKey:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_4;
  objc_msgSend(v13, "removeObjectForKey:", v14);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a8)
      goto LABEL_8;
    v25 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(v16, v18, v19, v20, v21, v22, v23, v24, v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "MCErrorWithDomain:code:descriptionArray:errorType:", v15, a6, v26, CFSTR("MCFatalError"));
    *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    a8 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v17, "length"))
    goto LABEL_7;
LABEL_4:
  a8 = v17;
LABEL_8:

  return a8;
}

+ (BOOL)checkString:(id)a3 isOneOfStrings:(id)a4 key:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7 errorString:(id)a8 outError:(id *)a9
{
  id v14;
  id v15;
  id v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  void *v26;
  void *v27;

  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = objc_msgSend(a4, "containsObject:", a3);
  v25 = v17;
  if (a9 && (v17 & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(v16, v18, v19, v20, v21, v22, v23, v24, v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "MCErrorWithDomain:code:descriptionArray:errorType:", v15, a7, v27, CFSTR("MCFatalError"));
    *a9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v25;
}

+ (int)evaluateTrust:(__SecTrust *)a3
{
  SecCertificateRef CertificateAtIndex;
  int v5;
  CFErrorRef error;

  if (SecTrustGetCertificateCount(a3) == 1
    && (CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, 0), SecCertificateIsSelfSignedCA()))
  {
    v5 = 2;
    if (!+[MCKeychain itemExistsInKeychain:useSystemKeychain:](MCKeychain, "itemExistsInKeychain:useSystemKeychain:", CertificateAtIndex, 1))
    {
      if (+[MCKeychain itemExistsInKeychain:useSystemKeychain:](MCKeychain, "itemExistsInKeychain:useSystemKeychain:", CertificateAtIndex, 0))
      {
        return 2;
      }
      else
      {
        return 0;
      }
    }
  }
  else
  {
    error = 0;
    if (SecTrustEvaluateWithError(a3, &error))
    {
      return 2;
    }
    else
    {
      CFRelease(error);
      return 0;
    }
  }
  return v5;
}

+ (int)evaluateTrustOfCertificateChain:(id)a3 signatureVersion:(id)a4
{
  return objc_msgSend(a1, "evaluateTrustOfCertificateChain:signatureVersion:outIsAllowedToWriteDefaults:", a3, a4, 0);
}

+ (int)evaluateTrustOfCertificateChain:(id)a3 signatureVersion:(id)a4 outIsAllowedToWriteDefaults:(BOOL *)a5
{
  return objc_msgSend(a1, "evaluateTrustOfCertificateChain:signatureVersion:outIsAllowedToInstallUnsupportedPayloads:outIsAllowedToWriteDefaults:", a3, a4, 0, a5);
}

+ (int)evaluateTrustOfCertificateChain:(id)a3 signatureVersion:(id)a4 outIsAllowedToInstallUnsupportedPayloads:(BOOL *)a5 outIsAllowedToWriteDefaults:(BOOL *)a6
{
  return objc_msgSend(a1, "evaluateTrustOfCertificateChain:signatureVersion:outIsAllowedToInstallUnsupportedPayloads:outIsAllowedToWriteDefaults:outIsAllowedToInstallSupervisedRestrictionsOnUnsupervisedDevices:", a3, a4, a5, a6, 0);
}

+ (int)evaluateTrustOfCertificateChain:(id)a3 signatureVersion:(id)a4 outIsAllowedToInstallUnsupportedPayloads:(BOOL *)a5 outIsAllowedToWriteDefaults:(BOOL *)a6 outIsAllowedToInstallSupervisedRestrictionsOnUnsupervisedDevices:(BOOL *)a7
{
  id v11;
  uint64_t v12;
  char v13;
  char v14;
  char v15;
  int v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  SecPolicyRef BasicX509;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  __CFString *v29;
  void *v30;
  const void *v31;
  SecPolicyRef v32;
  BOOL *v34;
  CFErrorRef error;
  SecTrustRef trust;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  const void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  LODWORD(a4) = objc_msgSend(a4, "intValue");
  v12 = objc_msgSend(v11, "count");
  if ((int)a4 < 2)
  {
    if (v12 == 1)
    {
      objc_msgSend(v11, "objectAtIndex:", 0);
      if (SecCertificateIsSelfSignedCA())
      {
        v16 = 2;
        SecTrustStoreForDomain();
        if (SecTrustStoreContains())
        {
          v13 = 0;
          v14 = 0;
          v15 = 0;
          goto LABEL_33;
        }
      }
    }
LABEL_10:
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v18 = v11;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v38 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          if ((SecCertificateIsSelfSignedCA() & 1) == 0)
            objc_msgSend(v17, "addObject:", v23);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v20);
    }

    if (objc_msgSend(v17, "count"))
    {
      trust = 0;
      BasicX509 = SecPolicyCreateBasicX509();
      if (SecTrustCreateWithCertificates(v17, BasicX509, &trust))
      {
        v16 = 0;
      }
      else
      {
        v16 = +[MCProfile evaluateTrust:](MCProfile, "evaluateTrust:", trust);
        CFRelease(trust);
      }
      CFRelease(BasicX509);
    }
    else
    {
      v16 = 0;
    }
    if (a6)
    {
      +[MCHacks sharedHacks](MCHacks, "sharedHacks");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v25, "sanitizedProfileSignerCertificateChainIsAllowedToWriteDefaults:", v17);

      if (a5)
        goto LABEL_27;
    }
    else
    {
      v14 = 0;
      if (a5)
      {
LABEL_27:
        +[MCHacks sharedHacks](MCHacks, "sharedHacks");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v26, "sanitizedProfileSignerCertificateChainIsAllowedToInstallUnsupportedPayload:", v17);

        if (a7)
        {
LABEL_28:
          +[MCHacks sharedHacks](MCHacks, "sharedHacks");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v27, "sanitizedProfileSignerCertificateChainIsAllowedToInstallSupervisedRestrictionsOnUnsupervisedDevices:", v17);

LABEL_32:
          goto LABEL_33;
        }
LABEL_31:
        v13 = 0;
        goto LABEL_32;
      }
    }
    v15 = 0;
    if (a7)
      goto LABEL_28;
    goto LABEL_31;
  }
  if (!v12 || !objc_msgSend(v11, "objectAtIndex:", 0) || !SecCertificateIsSelfSignedCA())
    goto LABEL_10;
  SecTrustStoreForDomain();
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 2 * (SecTrustStoreContains() != 0);
LABEL_33:
  if (objc_msgSend(v11, "count") && !v16)
  {
    v34 = a7;
    v28 = v14;
    v29 = (__CFString *)SecCertificateCopySubjectSummary((SecCertificateRef)objc_msgSend(v11, "objectAtIndex:", 0));
    v30 = MCHCUCopyHostCertificateForMappedLabel(v29);
    if (!v30)
    {
      v16 = 0;
LABEL_47:

      v14 = v28;
      a7 = v34;
      goto LABEL_48;
    }
    v31 = v30;
    v32 = SecPolicyCreateBasicX509();
    trust = 0;
    if (!SecTrustCreateWithCertificates(v11, v32, &trust))
    {
      v41 = v31;
      if (!SecTrustSetAnchorCertificates(trust, (CFArrayRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1))&& !SecTrustSetAnchorCertificatesOnly(trust, 1u))
      {
        error = 0;
        if (SecTrustEvaluateWithError(trust, &error))
        {
          v16 = 2;
LABEL_44:
          if (v32)
            CFRelease(v32);
          CFRelease(v31);
          goto LABEL_47;
        }
        CFRelease(error);
      }
    }
    v16 = 0;
    goto LABEL_44;
  }
LABEL_48:
  if (a5)
    *a5 = v15;
  if (a6)
    *a6 = v14;
  if (a7)
    *a7 = v13;

  return v16;
}

+ (id)signerSummaryOfCertificate:(__SecCertificate *)a3
{
  CFDataRef v4;
  const __CFArray *v5;
  const __CFArray *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  void *v9;
  CFRange v11;

  v4 = CFDataCreate(0, signerSummaryOfCertificate__emailProtectionOID, 8);
  v5 = (const __CFArray *)SecCertificateCopyExtendedKeyUsage();
  if (v5)
  {
    v6 = v5;
    v11.length = CFArrayGetCount(v5);
    v11.location = 0;
    if (CFArrayContainsValue(v6, v11, v4) && (v7 = (const __CFArray *)SecCertificateCopyRFC822Names()) != 0)
    {
      v8 = v7;
      if (CFArrayGetCount(v7))
      {
        CFArrayGetValueAtIndex(v8, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      v9 = 0;
    }
    CFRelease(v6);
    if (v4)
      goto LABEL_12;
  }
  else
  {
    v9 = 0;
    if (v4)
LABEL_12:
      CFRelease(v4);
  }
  if (!v9)
    v9 = (void *)SecCertificateCopySubjectSummary(a3);
  return v9;
}

+ (id)dataFromCMSEncodedData:(id)a3 outSignerCertificates:(id *)a4
{
  id v5;
  SecPolicyRef BasicX509;
  void *v7;
  const __CFArray *Value;
  const __CFArray *v10;
  SecCertificateRef CertificateAtIndex;
  CFIndex Count;
  unint64_t v13;
  const void *ValueAtIndex;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    BasicX509 = SecPolicyCreateBasicX509();
    v7 = 0;
    if (!SecCMSVerifyCopyDataAndAttributes())
    {
      Value = (const __CFArray *)CFDictionaryGetValue(0, (const void *)*MEMORY[0x1E0CD6C48]);
      if (Value)
      {
        v10 = Value;
        CertificateAtIndex = SecTrustGetCertificateAtIndex(0, 0);
        Count = CFArrayGetCount(v10);
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (Count >= 1)
        {
          v13 = Count + 1;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v10, v13 - 2);
            if (CFEqual(ValueAtIndex, CertificateAtIndex))
              objc_msgSend(v7, "insertObject:atIndex:", ValueAtIndex, 0);
            else
              objc_msgSend(v7, "addObject:", ValueAtIndex);
            --v13;
          }
          while (v13 > 1);
        }
      }
      else
      {
        v7 = 0;
      }
    }
    if (BasicX509)
      CFRelease(BasicX509);
    if (a4)
      *a4 = objc_retainAutorelease(v7);

  }
  return 0;
}

- (id)signatureVersion
{
  void *v3;
  id v4;

  if (-[MCProfile isStub](self, "isStub"))
  {
    -[MCProfile installOptions](self, "installOptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("signatureVersion"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = +[MCProfile newProfileSignatureVersion](MCProfile, "newProfileSignatureVersion");
  }
  return v4;
}

+ (id)newProfileSignatureVersion
{
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)stringForDeviceType:(unint64_t)a3
{
  id result;

  switch(a3)
  {
    case 0uLL:
      result = CFSTR("any");
      break;
    case 1uLL:
      result = CFSTR("phone");
      break;
    case 2uLL:
      result = CFSTR("watch");
      break;
    case 3uLL:
      result = CFSTR("homepod");
      break;
    case 4uLL:
      result = CFSTR("tv");
      break;
    case 5uLL:
      result = CFSTR("mac");
      break;
    case 6uLL:
      result = CFSTR("vision");
      break;
    case 7uLL:
      result = CFSTR("unknown");
      break;
    default:
      if (a3 == 99)
        result = CFSTR("error");
      else
        result = 0;
      break;
  }
  return result;
}

+ (unint64_t)thisDeviceType
{
  if ((MCGestaltIsVisionDevice() & 1) != 0)
    return 6;
  if ((MCGestaltIsWatch() & 1) != 0)
    return 2;
  if ((MCGestaltIsHomePod() & 1) != 0)
    return 3;
  if (MCGestaltIsAppleTV())
    return 4;
  return 1;
}

- (id)loggingID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MCProfile identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfile UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)payloadsWithClass:(Class)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MCProfile payloads](self, "payloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "addObject:", v10, (_QWORD)v13);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

@end
