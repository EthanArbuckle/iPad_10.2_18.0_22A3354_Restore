@implementation MCUIAppSigner

+ (id)_uppProfilesBySignerIDWithOutFreeDevProfilesBySignerID:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D44780];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__MCUIAppSigner__uppProfilesBySignerIDWithOutFreeDevProfilesBySignerID___block_invoke;
  v12[3] = &unk_1EA2B6168;
  v7 = v4;
  v13 = v7;
  v8 = v5;
  v14 = v8;
  objc_msgSend(v6, "enumerateProvisioningProfilesWithBlock:", v12);
  if (a3)
    *a3 = objc_retainAutorelease(v8);
  v9 = v14;
  v10 = v7;

  return v10;
}

+ (id)enterpriseAppSignersWithOutDeveloperAppSigners:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t j;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  MCUIAppSigner *v47;
  void *v48;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v74 = 0;
  +[MCUIAppSigner _uppProfilesBySignerIDWithOutFreeDevProfilesBySignerID:](MCUIAppSigner, "_uppProfilesBySignerIDWithOutFreeDevProfilesBySignerID:", &v74);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v74;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedAppIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  objc_msgSend(MEMORY[0x1E0D1BF88], "userApplications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v5;
  v58 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
  if (v58)
  {
    v7 = *(_QWORD *)v71;
    v54 = v3;
    v51 = *(_QWORD *)v71;
    v52 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v71 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1DF0AD824]();
        objc_msgSend(v9, "signerID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = objc_msgSend(v9, "isInstalled");
          objc_msgSend(v9, "bundleID");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v13;
          if ((v12 & 1) != 0)
          {
            v15 = objc_msgSend(v5, "containsObject:", v13);

            if (v15)
            {
              objc_msgSend(v9, "bundleID");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              NSLog(CFSTR("MCUIAppSigner: Ignoring potential app signer for app %@: App is managed"), v14);
            }
            else
            {
              objc_msgSend(v9, "signerID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "objectForKey:", v16);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v9, "signerID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "objectForKey:", v17);
              v18 = objc_claimAutoreleasedReturnValue();

              v19 = (void *)objc_opt_new();
              v20 = v19;
              if (v14)
                objc_msgSend(v19, "addObjectsFromArray:", v14);
              if (v18)
                objc_msgSend(v20, "addObjectsFromArray:", v18);
              v56 = (id)v18;
              v68 = 0u;
              v69 = 0u;
              v66 = 0u;
              v67 = 0u;
              v21 = v20;
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v67;
                while (2)
                {
                  for (i = 0; i != v23; ++i)
                  {
                    if (*(_QWORD *)v67 != v24)
                      objc_enumerationMutation(v21);
                    v26 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
                    if ((objc_msgSend(v26, "isAppleInternal") & 1) != 0
                      || (v27 = objc_msgSend(v9, "isBetaApp"), v27 == objc_msgSend(v26, "isBeta"))
                      && (objc_msgSend(v9, "appIDEntitlement"),
                          v28 = (void *)objc_claimAutoreleasedReturnValue(),
                          v29 = objc_msgSend(v26, "allowsAppIDEntitlement:", v28),
                          v28,
                          v29))
                    {
                      objc_msgSend(v9, "signerID");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      v3 = v54;
                      objc_msgSend(v54, "objectForKey:", v32);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v33)
                      {
                        objc_msgSend(v9, "bundleID");
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v33, "addObject:", v34);
                      }
                      else
                      {
                        v35 = (void *)MEMORY[0x1E0C99DE8];
                        objc_msgSend(v9, "bundleID");
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v35, "arrayWithObject:", v36);
                        v33 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v9, "signerID");
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v54, "setObject:forKey:", v33, v34);
                      }

                      goto LABEL_33;
                    }
                    objc_msgSend(v9, "bundleID");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "appIDEntitlement");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    NSLog(CFSTR("MCUIAppSigner: Skipping potential app signer for app %@: App ID entitlement does not match: %@"), v30, v31);

                  }
                  v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
                  v3 = v54;
                  if (v23)
                    continue;
                  break;
                }
              }
LABEL_33:

              v6 = v52;
              v5 = v53;
              v7 = v51;
            }
          }
          else
          {
            NSLog(CFSTR("MCUIAppSigner: Ignoring potential app signer for app %@: App not installed"), v13);
          }
        }
        else
        {
          objc_msgSend(v9, "bundleID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("MCUIAppSigner: Ignoring potential app signer for app %@: No signer identity"), v14);
        }

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v8 != v58);
      v37 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
      v58 = v37;
    }
    while (v37);
  }

  v57 = (id)objc_opt_new();
  v38 = (void *)objc_opt_new();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v39 = v3;
  v59 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
  if (v59)
  {
    v55 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v59; ++j)
      {
        if (*(_QWORD *)v63 != v55)
          objc_enumerationMutation(v39);
        v41 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
        objc_msgSend(v39, "objectForKey:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "objectForKey:", v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectForKey:", v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_opt_new();
        v46 = v45;
        if (v43)
          objc_msgSend(v45, "addObjectsFromArray:", v43);
        if (v44)
          objc_msgSend(v46, "addObjectsFromArray:", v44);
        v47 = -[MCUIAppSigner initWithIdentity:applications:provisioningProfiles:hasUPP:hasFreePP:]([MCUIAppSigner alloc], "initWithIdentity:applications:provisioningProfiles:hasUPP:hasFreePP:", v41, v42, v46, objc_msgSend(v43, "count") != 0, objc_msgSend(v44, "count") != 0);
        if (objc_msgSend(v43, "count"))
          v48 = v57;
        else
          v48 = v38;
        objc_msgSend(v48, "addObject:", v47);

      }
      v59 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    }
    while (v59);
  }

  if (a3)
    *a3 = objc_retainAutorelease(v38);

  return v57;
}

- (MCUIAppSigner)initWithIdentity:(id)a3 applications:(id)a4 provisioningProfiles:(id)a5 hasUPP:(BOOL)a6 hasFreePP:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  MCUIAppSigner *v16;
  MCUIAppSigner *v17;
  uint64_t v18;
  NSArray *applications;
  uint64_t v20;
  NSString *displayName;
  objc_super v23;

  v7 = a7;
  v8 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MCUIAppSigner;
  v16 = -[MCUIAppSigner init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identity, a3);
    v18 = objc_msgSend(v14, "mutableCopy");
    applications = v17->_applications;
    v17->_applications = (NSArray *)v18;

    objc_storeStrong((id *)&v17->_provisioningProfiles, a5);
    v17->_hasUniversalPP = v8;
    v17->_hasFreePP = v7;
    objc_msgSend(MEMORY[0x1E0D44780], "developerFromIdentity:hasFreePP:hasUPP:", v13, v7, v8);
    v20 = objc_claimAutoreleasedReturnValue();
    displayName = v17->_displayName;
    v17->_displayName = (NSString *)v20;

    -[MCUIAppSigner refreshApplications](v17, "refreshApplications");
  }

  return v17;
}

- (void)setIdentity:(id)a3
{
  NSString *v5;
  NSString *displayName;
  NSString *v7;

  v7 = (NSString *)a3;
  if (self->_identity != v7)
  {
    objc_storeStrong((id *)&self->_identity, a3);
    objc_msgSend(MEMORY[0x1E0D44780], "developerFromIdentity:hasFreePP:hasUPP:", v7, self->_hasFreePP, self->_hasUniversalPP);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    displayName = self->_displayName;
    self->_displayName = v5;

  }
}

- (void)refreshApplications
{
  id v3;

  -[MCUIAppSigner applications](self, "applications");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MCUIAppSigner _updateUntrustedAppCountsForBundleIDs:](self, "_updateUntrustedAppCountsForBundleIDs:", v3);

}

- (void)_updateUntrustedAppCountsForBundleIDs:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[MCUIAppSigner applications](self, "applications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1DF0AD824]();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BF88]), "initWithBundleID:dataSource:", v11, 0);
        v14 = objc_msgSend(v13, "misStateIncludingPending:", 1);
        if ((unint64_t)(v14 - 2) >= 2)
        {
          if (v14 == 1)
          {
            ++v7;
          }
          else
          {
            if (v14 == 5)
            {

              objc_autoreleasePoolPop(v12);
              goto LABEL_16;
            }
            ++v8;
          }
        }

        objc_autoreleasePoolPop(v12);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
LABEL_16:

  self->_untrustedAppCount = v8;
  self->_almostUntrustedAppCount = v7;

}

- (void)main_removeMCUIReferenceForBundleID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MCUIAppSigner *v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__MCUIAppSigner_main_removeMCUIReferenceForBundleID___block_invoke;
  v6[3] = &unk_1EA2B5CC0;
  objc_copyWeak(&v9, &location);
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_sync(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__MCUIAppSigner_main_removeMCUIReferenceForBundleID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "applications");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 32));
    v5 = objc_msgSend(v4, "copy");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = v5;

    WeakRetained = v8;
  }

}

- (BOOL)isTrusted
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trustedCodeSigningIdentities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUIAppSigner identity](self, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (!v6)
    return 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[MCUIAppSigner provisioningProfiles](self, "provisioningProfiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "length");

        if (v14)
        {
          v15 = (void *)MEMORY[0x1E0D44780];
          objc_msgSend(v12, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v15) = objc_msgSend(v15, "isTrustedProvisioningProfileUUID:", v16);

          if (!(_DWORD)v15)
          {
            v17 = 0;
            goto LABEL_15;
          }
        }
        else
        {
          NSLog(CFSTR("MCUIAppSigner: Could not find profile UUID for provisioning profile %@"), v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  v17 = 1;
LABEL_15:

  return v17;
}

- (BOOL)isAppRemovalAllowed
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F10]) != 2;

  return v3;
}

- (BOOL)isEnterpriseAppTrustAllowed
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FE0]) != 2;

  return v3;
}

- (BOOL)isTrustable
{
  if (-[MCUIAppSigner isTrusted](self, "isTrusted")
    && -[MCUIAppSigner isAppRemovalAllowed](self, "isAppRemovalAllowed"))
  {
    return 1;
  }
  if (-[MCUIAppSigner isTrusted](self, "isTrusted"))
    return 0;
  return -[MCUIAppSigner isEnterpriseAppTrustAllowed](self, "isEnterpriseAppTrustAllowed");
}

+ (void)_addProfile:(id)a3 toSignerIdentity:(id)a4 inDictionary:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v7);
  }
  objc_msgSend(v9, "addObject:", v10);

}

void __72__MCUIAppSigner__uppProfilesBySignerIDWithOutFreeDevProfilesBySignerID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v6, "isUniversalPP"))
    +[MCUIAppSigner _addProfile:toSignerIdentity:inDictionary:](MCUIAppSigner, "_addProfile:toSignerIdentity:inDictionary:", v6, v5, *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v6, "isFreePP"))
    +[MCUIAppSigner _addProfile:toSignerIdentity:inDictionary:](MCUIAppSigner, "_addProfile:toSignerIdentity:inDictionary:", v6, v5, *(_QWORD *)(a1 + 40));

}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)identity
{
  return self->_identity;
}

- (NSArray)applications
{
  return self->_applications;
}

- (NSArray)provisioningProfiles
{
  return self->_provisioningProfiles;
}

- (BOOL)hasFreePP
{
  return self->_hasFreePP;
}

- (BOOL)hasUniversalPP
{
  return self->_hasUniversalPP;
}

- (int64_t)untrustedAppCount
{
  return self->_untrustedAppCount;
}

- (int64_t)almostUntrustedAppCount
{
  return self->_almostUntrustedAppCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningProfiles, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
