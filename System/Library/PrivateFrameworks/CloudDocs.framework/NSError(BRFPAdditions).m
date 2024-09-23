@implementation NSError(BRFPAdditions)

- (uint64_t)_br_getFileProviderDomainErrorCode:()BRFPAdditions
{
  void *v5;
  char v6;
  uint64_t *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (_br_getFileProviderDomainErrorCode__once != -1)
    dispatch_once(&_br_getFileProviderDomainErrorCode__once, &__block_literal_global_5);
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  if ((v6 & 1) != 0)
  {
    v7 = &_br_getFileProviderDomainErrorCode__cocoaErrorToFPError;
    goto LABEL_24;
  }
  objc_msgSend(a1, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("BRCloudDocsErrorDomain"));

  if (v9)
  {
    if (objc_msgSend(a1, "code") == 17)
    {
      objc_msgSend(a1, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CB3388]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = objc_msgSend(v11, "_br_getFileProviderDomainErrorCode:", a3);

        return v12;
      }
    }
    v7 = &_br_getFileProviderDomainErrorCode__clouddocsErrorToFPError;
LABEL_24:
    v24 = (id)*v7;
    if (v24)
    {
      v25 = v24;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(a1, "code"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        *a3 = objc_msgSend(v27, "longValue");

        return 1;
      }

    }
    return 0;
  }
  objc_msgSend(a1, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (!v14)
  {
    objc_msgSend(a1, "domain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

    if (v23)
    {
      *a3 = -1004;
      return 1;
    }
    return 0;
  }
  if (objc_msgSend(a1, "code") != 2)
  {
    v7 = &_br_getFileProviderDomainErrorCode__cloudKitErrorToFPError;
    goto LABEL_24;
  }
  objc_msgSend(a1, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v16, "objectEnumerator", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "_br_getFileProviderDomainErrorCode:", a3) & 1) != 0)
        {
          v12 = 1;
          goto LABEL_32;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v19)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_32:

  return v12;
}

- (void)_br_populateErrorMessageOnUserInfo:()BRFPAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "br_isCloudDocsErrorCode:", 17))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(a1, "underlyingErrors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v37;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        if (objc_msgSend(v10, "br_isCKErrorCode:", 115))
        {
          objc_msgSend(MEMORY[0x1E0CFAD38], "neediCloudTermsAcceptanceDeviceSpecificMessage");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CFAD38], "neediCloudTermsAcceptanceTitle");
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        }
        if (objc_msgSend(v10, "br_isCKErrorCode:", 3))
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v10, "underlyingErrors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v12)
      {
        v14 = *(_QWORD *)v33;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v33 != v14)
              objc_enumerationMutation(v13);
            v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            if (objc_msgSend(v16, "br_isNSURLErrorCode:", -1009))
            {
              objc_msgSend(v16, "userInfo");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3310]);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18 && objc_msgSend(v18, "intValue") == 1)
              {
                objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                _BRLocalizedStringWithFormat(CFSTR("ICD_CELLULAR_DISABLED_TITLE"), CFSTR("Localizable"), v19, v20, v21, v22, v23, v24, v32);
                v12 = objc_claimAutoreleasedReturnValue();

                if (MGGetBoolAnswer())
                  v25 = CFSTR("ICD_CELLULAR_DISABLED_CH_BODY");
                else
                  v25 = CFSTR("ICD_CELLULAR_DISABLED_BODY");
                objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                _BRLocalizedStringWithFormat(v25, CFSTR("Localizable"), v26, v27, v28, v29, v30, v31, v32);
                v11 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v12 = 0;
                v11 = 0;
              }

              goto LABEL_31;
            }
          }
          v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v12)
            continue;
          break;
        }
      }
      v11 = 0;
LABEL_31:

LABEL_32:
      if (v11)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB2D68]);
      if (v12)
      {
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB2D50]);
        v5 = (void *)v12;
        goto LABEL_36;
      }
    }
    else
    {
LABEL_11:
      v11 = 0;
LABEL_36:

    }
  }
  else
  {
    v11 = 0;
  }

}

- (uint64_t)_isTransientError:()BRFPAdditions code:
{
  uint64_t result;

  result = objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CAAB50]);
  if ((_DWORD)result)
    return a4 == -2005 || *MEMORY[0x1E0CAAB68] == a4;
  return result;
}

- (id)_br_populateUserInfoDictWithDomain:()BRFPAdditions code:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v6 = a3;
  if (_br_populateUserInfoDictWithDomain_code__once != -1)
    dispatch_once(&_br_populateUserInfoDictWithDomain_code__once, &__block_literal_global_55);
  objc_msgSend(a1, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = (void *)_br_populateUserInfoDictWithDomain_code__brUserInfoKeyToFPUserInfoKey;
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __66__NSError_BRFPAdditions___br_populateUserInfoDictWithDomain_code___block_invoke_2;
  v23[3] = &unk_1E3DA4E80;
  v11 = v7;
  v24 = v11;
  v12 = v8;
  v25 = v12;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v23);
  v13 = (void *)_br_populateUserInfoDictWithDomain_code__brUserInfoKeyToBRErrorCodeFPUserInfoKeyMap;
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __66__NSError_BRFPAdditions___br_populateUserInfoDictWithDomain_code___block_invoke_3;
  v19[3] = &unk_1E3DA4EA8;
  v20 = v11;
  v21 = a1;
  v14 = v12;
  v22 = v14;
  v15 = v11;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v19);
  if (objc_msgSend(a1, "_isTransientError:code:", v6, a4))
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CAAB78]);
  objc_msgSend(a1, "_br_populateErrorMessageOnUserInfo:", v14);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", a1, *MEMORY[0x1E0CB3388]);
  v16 = v22;
  v17 = v14;

  return v17;
}

- (id)_createWrappedErrorWithDomain:()BRFPAdditions code:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = a3;
  objc_msgSend(a1, "_br_populateUserInfoDictWithDomain:code:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)br_fileProviderError
{
  return objc_msgSend(a1, "br_fileProviderErrorWithFPFS:", BRIsFPFSEnabled(a1, a2));
}

- (id)br_fileProviderErrorWithFPFS:()BRFPAdditions
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v15;

  v15 = 0;
  if (objc_msgSend(a1, "_br_getFileProviderDomainErrorCode:", &v15))
  {
    v5 = *MEMORY[0x1E0CAAB50];
    v6 = v15;
    v7 = a1;
    goto LABEL_11;
  }
  if (!a3)
    return a1;
  objc_msgSend(a1, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("BRCloudDocsErrorDomain"));

  if (v9)
  {
    v5 = *MEMORY[0x1E0CAAB50];
    v7 = a1;
    v6 = -2005;
    goto LABEL_11;
  }
  objc_msgSend(a1, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CB28A8];
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {

    return a1;
  }
  objc_msgSend(a1, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CAAB50]);

  if ((v13 & 1) != 0)
    return a1;
  v7 = a1;
  v5 = v11;
  v6 = 4101;
LABEL_11:
  objc_msgSend(v7, "_createWrappedErrorWithDomain:code:", v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
