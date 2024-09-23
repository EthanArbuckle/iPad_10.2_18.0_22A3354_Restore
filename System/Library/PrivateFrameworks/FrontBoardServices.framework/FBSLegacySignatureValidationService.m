@implementation FBSLegacySignatureValidationService

- (FBSLegacySignatureValidationService)initWithApplicationInfo:(id)a3 andProvisioningProfiles:(id)a4 isManaged:(BOOL)a5
{
  id v10;
  id v11;
  void *v12;
  FBSLegacySignatureValidationService *v13;
  FBSLegacySignatureValidationService *v14;
  uint64_t Serial;
  OS_dispatch_queue *workQueue;
  FBSLegacySignatureValidationService *result;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  if (v10)
  {
    v12 = v11;
    v19.receiver = self;
    v19.super_class = (Class)FBSLegacySignatureValidationService;
    v13 = -[FBSLegacySignatureValidationService init](&v19, sel_init);
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_appInfo, a3);
      v14->_isManaged = a5;
      -[FBSLegacySignatureValidationService _initializeProfiles:](v14, "_initializeProfiles:", v12);
      Serial = BSDispatchQueueCreateSerial();
      workQueue = v14->_workQueue;
      v14->_workQueue = (OS_dispatch_queue *)Serial;

    }
    return v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("appInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSLegacySignatureValidationService initWithApplicationInfo:andProvisioningProfiles:isManaged:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    result = (FBSLegacySignatureValidationService *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (unint64_t)trustStateForApplication:(id)a3
{
  FBSApplicationInfo *v5;
  FBSApplicationInfo *v6;
  NSObject *workQueue;
  unint64_t v8;
  unint64_t result;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = (FBSApplicationInfo *)a3;
  if (self->_appInfo == v5)
  {
    v6 = v5;
    kdebug_trace();
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 8;
    workQueue = self->_workQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__FBSLegacySignatureValidationService_trustStateForApplication___block_invoke;
    v11[3] = &unk_1E38EB628;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(workQueue, v11);
    kdebug_trace();
    v8 = v13[3];
    _Block_object_dispose(&v12, 8);

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("App info objects must match or we've done something wrong."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSLegacySignatureValidationService trustStateForApplication:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

void __64__FBSLegacySignatureValidationService_trustStateForApplication___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  void *v5;
  char v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  _BYTE *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  void *v40;
  unsigned int v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "type");
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isBeta");
  if (v2 == 1)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 8;
    return;
  }
  v4 = v3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signerIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isProvisioningProfileValidated");
    v7 = *(id **)(a1 + 32);
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "_workQueue_expirationDateForProvisioningProfile");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "bundleURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = soft_MISAppApprovalState((uint64_t)v10, 0);
        if (v11 == 4)
        {
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v13 = 2;
LABEL_28:
          *(_QWORD *)(v12 + 24) = v13;
          goto LABEL_29;
        }
      }
      else
      {
        v11 = 0;
      }
      if (v8 && (objc_msgSend(v8, "timeIntervalSinceNow"), v16 < 0.0)
        || v4 && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v13 = 3;
        goto LABEL_28;
      }
      v17 = *(_BYTE **)(a1 + 32);
      if (v17[16] || v17[17])
      {
        if (v11 == 3)
          goto LABEL_29;
        if (v11)
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 7;
          if (v11 == 1)
          {
            v33 = v8;
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 6;
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            v23 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v37;
              v27 = MEMORY[0x1E0C809B0];
              do
              {
                for (i = 0; i != v25; ++i)
                {
                  if (*(_QWORD *)v37 != v26)
                    objc_enumerationMutation(v23);
                  v29 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                  if ((objc_msgSend(v29, "provisionsAllDevices", v33) & 1) != 0
                    || objc_msgSend(v29, "isFreeDeveloperProfile"))
                  {
                    objc_msgSend(v29, "UUID");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    dispatch_get_global_queue(0, 0);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    v34[0] = v27;
                    v34[1] = 3221225472;
                    v34[2] = __64__FBSLegacySignatureValidationService_trustStateForApplication___block_invoke_2;
                    v34[3] = &unk_1E38EDB40;
                    v35 = v30;
                    v32 = v30;
                    soft_MISValidateUPP((uint64_t)v32, v31, v34);

                  }
                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
              }
              while (v25);
            }

            v8 = v33;
          }
          goto LABEL_29;
        }
      }
      else if (v4)
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v13 = 8;
        goto LABEL_28;
      }
      if (objc_msgSend(v17, "_workQueue_signatureNeedsExplicitUserTrust"))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v13 = 7;
        goto LABEL_28;
      }
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v7[1], "cachedCDHashInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    if (v14)
    {
      if ((soft_MISQueryBlacklistForCdHash(objc_msgSend(v14, "cachedCodeDirectoryHash"), objc_msgSend(v14, "cachedCodeDirectoryHashType"), 1, 0, 0) & 1) != 0)
      {
LABEL_10:
        v15 = 2;
LABEL_26:
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v15;
LABEL_30:

        return;
      }
    }
    else
    {
      v41 = 26;
      v40 = 0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "bundleURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = soft_MISQueryBlacklistForBundle(objc_msgSend(v18, "path"), 0, 1, 0, (uint64_t)&v40, (uint64_t)&v41, 0);

      v20 = v40;
      if (v40)
      {
        v21 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
        +[_FBSCDHashCacheInfo cacheInfoWithData:hashType:](_FBSCDHashCacheInfo, "cacheInfoWithData:hashType:", v40, v41);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setCachedCDHashInfo:", v22);

      }
      if ((v19 & 1) != 0)
        goto LABEL_10;
    }
    v15 = 8;
    goto LABEL_26;
  }
}

void __64__FBSLegacySignatureValidationService_trustStateForApplication___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;

  if (a3)
  {
    FBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __64__FBSLegacySignatureValidationService_trustStateForApplication___block_invoke_2_cold_1(a1, a3, v5);

  }
}

- (void)_initializeProfiles:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSArray *v23;
  NSArray *provisioningProfiles;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isAppleInternalProfile") & 1) == 0)
        {
          v12 = -[FBSApplicationInfo isBeta](self->_appInfo, "isBeta");
          if (v12 != objc_msgSend(v11, "isBeta"))
            continue;
          -[FBSApplicationInfo _appIDEntitlement](self->_appInfo, "_appIDEntitlement");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v11, "allowsApplicationIdentifierEntitlement:", v13);

          if (!v14)
            continue;
        }
        objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = 0;
    v20 = *(_QWORD *)v26;
    while (2)
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v15);
        v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        v18 |= objc_msgSend(v22, "provisionsAllDevices", (_QWORD)v25);
        v19 |= objc_msgSend(v22, "isFreeDeveloperProfile");
        if ((v18 & 1) != 0 && (v19 & 1) != 0)
        {
          LOBYTE(v18) = 1;
          LOBYTE(v19) = 1;
          goto LABEL_24;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v17)
        continue;
      break;
    }
  }
  else
  {
    LOBYTE(v18) = 0;
    LOBYTE(v19) = 0;
  }
LABEL_24:

  v23 = (NSArray *)objc_msgSend(v6, "copy");
  provisioningProfiles = self->_provisioningProfiles;
  self->_provisioningProfiles = v23;

  self->_hasUniversalProvisioningProfile = v18 & 1;
  self->_hasFreeDeveloperProvisioningProfile = v19 & 1;

}

- (id)_workQueue_expirationDateForProvisioningProfile
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  NSArray *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!-[FBSApplicationInfo isProvisioningProfileValidated](self->_appInfo, "isProvisioningProfileValidated"))
    goto LABEL_20;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_provisioningProfiles;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v4)
  {
    v6 = v3;
LABEL_19:

LABEL_20:
    v6 = 0;
    return v6;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "expirationDate", (_QWORD)v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        if (v6)
          goto LABEL_11;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
LABEL_11:
          objc_msgSend(v9, "timeIntervalSinceDate:", v6);
          if (v10 <= 0.0)
            goto LABEL_13;
        }
      }
      v11 = v9;

      v6 = v11;
LABEL_13:

    }
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NSArray isEqual:](v6, "isEqual:", v12);

    if (v13)
      goto LABEL_19;
  }
  return v6;
}

- (BOOL)_workQueue_signatureNeedsExplicitUserTrust
{
  BOOL v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!-[FBSApplicationInfo isProvisioningProfileValidated](self->_appInfo, "isProvisioningProfileValidated")
    || self->_isManaged)
  {
    return 0;
  }
  objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trustedCodeSigningIdentities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBSApplicationInfo signerIdentity](self->_appInfo, "signerIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if ((v8 & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = self->_provisioningProfiles;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_msgSend(v14, "provisionsAllDevices", (_QWORD)v15) & 1) != 0
            || (objc_msgSend(v14, "isFreeDeveloperProfile") & 1) != 0)
          {
            v3 = 1;
            goto LABEL_19;
          }
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v3 = 0;
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      v3 = 0;
    }
LABEL_19:

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_provisioningProfiles, 0);
  objc_storeStrong((id *)&self->_appInfo, 0);
}

- (void)initWithApplicationInfo:(const char *)a1 andProvisioningProfiles:isManaged:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)trustStateForApplication:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __64__FBSLegacySignatureValidationService_trustStateForApplication___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  _os_log_error_impl(&dword_19A6D4000, log, OS_LOG_TYPE_ERROR, "Failed to verify universal provisioning profile %{public}@ with error %lld", (uint8_t *)&v4, 0x16u);
}

@end
