@implementation MCUIAppSignerUninstallerUtilities

+ (void)uninstallAppSigner:(id)a3 withUninstaller:(id)a4 dispatchGroup:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__MCUIAppSignerUninstallerUtilities_uninstallAppSigner_withUninstaller_dispatchGroup_completion___block_invoke;
  block[3] = &unk_1EA2B6190;
  v22 = v13;
  v23 = a1;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  dispatch_group_notify(v15, MEMORY[0x1E0C80D38], block);

}

void __97__MCUIAppSignerUninstallerUtilities_uninstallAppSigner_withUninstaller_dispatchGroup_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 64), "_asyncUninstallProvisioningProfilesForAppSigner:withUninstaller:dispatchGroup:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 64), "_asyncUninstallApplicationsForAppsigner:withUninstaller:dispatchGroup:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__MCUIAppSignerUninstallerUtilities_uninstallAppSigner_withUninstaller_dispatchGroup_completion___block_invoke_2;
  block[3] = &unk_1EA2B5D88;
  v2 = *(NSObject **)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  dispatch_group_notify(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __97__MCUIAppSignerUninstallerUtilities_uninstallAppSigner_withUninstaller_dispatchGroup_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)_asyncUninstallProvisioningProfilesForAppSigner:(id)a3 withUninstaller:(id)a4 dispatchGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(25, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __115__MCUIAppSignerUninstallerUtilities__asyncUninstallProvisioningProfilesForAppSigner_withUninstaller_dispatchGroup___block_invoke;
  v15[3] = &unk_1EA2B61E0;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v19 = a1;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __115__MCUIAppSignerUninstallerUtilities__asyncUninstallProvisioningProfilesForAppSigner_withUninstaller_dispatchGroup___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  size_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 56), "_provisioningProfileUUIDsForAppSigner:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("MCUIAppSignerUninstallerUtilities async uninstalling %lu provisioning profiles..."), objc_msgSend(v2, "count"));
  if (objc_msgSend(v2, "count"))
  {
    v3 = 0;
    do
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      ++v3;
    }
    while (objc_msgSend(v2, "count") > v3);
  }
  v4 = objc_msgSend(v2, "count");
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__MCUIAppSignerUninstallerUtilities__asyncUninstallProvisioningProfilesForAppSigner_withUninstaller_dispatchGroup___block_invoke_2;
  block[3] = &unk_1EA2B61B8;
  v8 = *(id *)(a1 + 48);
  v9 = v2;
  v10 = *(id *)(a1 + 40);
  v6 = v2;
  dispatch_apply(v4, v5, block);

}

void __115__MCUIAppSignerUninstallerUtilities__asyncUninstallProvisioningProfilesForAppSigner_withUninstaller_dispatchGroup___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uninstallProvisioningProfileWithUUID:", v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

+ (void)_asyncUninstallApplicationsForAppsigner:(id)a3 withUninstaller:(id)a4 dispatchGroup:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_get_global_queue(25, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__MCUIAppSignerUninstallerUtilities__asyncUninstallApplicationsForAppsigner_withUninstaller_dispatchGroup___block_invoke;
  block[3] = &unk_1EA2B6060;
  v15 = v7;
  v16 = v9;
  v17 = v8;
  v11 = v8;
  v12 = v9;
  v13 = v7;
  dispatch_async(v10, block);

}

void __107__MCUIAppSignerUninstallerUtilities__asyncUninstallApplicationsForAppsigner_withUninstaller_dispatchGroup___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  size_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "applications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("MCUIAppSignerUninstallerUtilities async uninstalling %lu apps..."), objc_msgSend(v2, "count"));
  if (objc_msgSend(v2, "count"))
  {
    v3 = 0;
    do
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      ++v3;
    }
    while (objc_msgSend(v2, "count") > v3);
  }
  v4 = objc_msgSend(v2, "count");
  dispatch_get_global_queue(-2, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__MCUIAppSignerUninstallerUtilities__asyncUninstallApplicationsForAppsigner_withUninstaller_dispatchGroup___block_invoke_2;
  block[3] = &unk_1EA2B6208;
  v8 = *(id *)(a1 + 48);
  v9 = v2;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v6 = v2;
  dispatch_apply(v4, v5, block);

}

void __107__MCUIAppSignerUninstallerUtilities__asyncUninstallApplicationsForAppsigner_withUninstaller_dispatchGroup___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uninstallApplicationWithBundleID:", v5);

  v6 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "main_removeMCUIReferenceForBundleID:", v7);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

+ (id)_provisioningProfileUUIDsForAppSigner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "provisioningProfiles", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        if (v12)
        {
          objc_msgSend(v10, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

@end
