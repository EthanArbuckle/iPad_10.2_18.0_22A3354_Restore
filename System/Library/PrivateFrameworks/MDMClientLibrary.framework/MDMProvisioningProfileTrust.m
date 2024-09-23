@implementation MDMProvisioningProfileTrust

- (MDMProvisioningProfileTrust)initWithValidationQueue:(id)a3
{
  id v5;
  MDMProvisioningProfileTrust *v6;
  MDMProvisioningProfileTrust *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MDMProvisioningProfileTrust;
  v6 = -[MDMProvisioningProfileTrust init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_misVerificationQueue, a3);

  return v7;
}

+ (id)allTrustedSignerIdentities
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = (id)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__MDMProvisioningProfileTrust_allTrustedSignerIdentities__block_invoke;
  v6[3] = &unk_1E9852470;
  v6[4] = &v7;
  v6[5] = a1;
  if (objc_msgSend(a1, "_enumerateProvisioningProfilesWithBlock:", v6))
    v3 = (void *)v8[5];
  else
    v3 = 0;
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __57__MDMProvisioningProfileTrust_allTrustedSignerIdentities__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  MISProvisioningProfileGetUUID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(*(id *)(a1 + 40), "isTrustedProvisioningProfileUUID:", v4))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);

}

+ (id)signerIdentitiesFromProvisioningProfileUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v5 = v4;
  v11 = v5;
  if (MISEnumerateInstalledProvisioningProfiles() || !v13[3])
  {
    v6 = (void *)MISCopyErrorStringForErrorCode();
    v7 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v5;
      v18 = 2114;
      v19 = v6;
      _os_log_impl(&dword_1D4BF7000, v7, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust could not find provisioning profile for UUID %{public}@ with error: %{public}@", buf, 0x16u);
    }

    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "_signerIdentitiesFromProvisioningProfile:", v10, 3221225472, __75__MDMProvisioningProfileTrust_signerIdentitiesFromProvisioningProfileUUID___block_invoke, &unk_1E9852498, v5, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease((CFTypeRef)v13[3]);
  }

  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __75__MDMProvisioningProfileTrust_signerIdentitiesFromProvisioningProfileUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  int v5;

  MISProvisioningProfileGetUUID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v4);
  if (v5)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    CFRetain(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  }

  return v5 ^ 1u;
}

+ (id)_signerIdentitiesFromProvisioningProfile:(void *)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const __CFData *v11;
  __SecCertificate *v12;
  __SecCertificate *v13;
  __CFString *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const __CFData *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  MISXMLProvisioningProfileGetDeveloperCertificates();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(const __CFData **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v12 = SecCertificateCreateWithData(0, v11);
          if (v12)
          {
            v13 = v12;
            v14 = (__CFString *)SecCertificateCopySubjectSummary(v12);
            if (v14)
            {
              objc_msgSend(v4, "addObject:", v14);
            }
            else
            {
              v16 = *(NSObject **)(DMCLogObjects() + 8);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v24 = a3;
                v25 = 2112;
                v26 = v13;
                _os_log_impl(&dword_1D4BF7000, v16, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust cannot construct identity for profile %{public}@ from cert: %@", buf, 0x16u);
              }
            }
            CFRelease(v13);

          }
          else
          {
            v15 = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v24 = a3;
              v25 = 2114;
              v26 = v11;
              _os_log_impl(&dword_1D4BF7000, v15, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust cannot construct certificate for profile %{public}@ with cert data: %{public}@", buf, 0x16u);
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v8);
    }
  }
  else
  {
    v17 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = a3;
      _os_log_impl(&dword_1D4BF7000, v17, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust cannot get dev certs from DER-encoded profile: %{public}@", buf, 0xCu);
    }
  }

  return v4;
}

+ (BOOL)_enumerateProvisioningProfilesWithBlock:(id)a3
{
  id v3;
  int v4;
  void *v5;
  NSObject *v6;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = MISEnumerateInstalledProvisioningProfiles();
  if (v4)
  {
    v5 = (void *)MISCopyErrorStringForErrorCode();
    v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v5;
      _os_log_impl(&dword_1D4BF7000, v6, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust could not enumerate provisioning profiles with error: %{public}@", buf, 0xCu);
    }

  }
  return v4 == 0;
}

uint64_t __71__MDMProvisioningProfileTrust__enumerateProvisioningProfilesWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1D82650DC]();
  v5 = MISProvisioningProfileProvisionsAllDevices();
  v6 = objc_msgSend(*(id *)(a1 + 40), "_isFreeSignedAppDeveloper:", a2);
  if (v5 || v6)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "_signerIdentitiesFromProvisioningProfile:", a2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
  objc_autoreleasePoolPop(v4);
  return 1;
}

+ (BOOL)_enumerateProvisioningProfileUUIDsWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__MDMProvisioningProfileTrust__enumerateProvisioningProfileUUIDsWithBlock___block_invoke;
  v7[3] = &unk_1E98524E8;
  v8 = v4;
  v5 = v4;
  LOBYTE(a1) = objc_msgSend(a1, "_enumerateProvisioningProfilesWithBlock:", v7);

  return (char)a1;
}

void __75__MDMProvisioningProfileTrust__enumerateProvisioningProfileUUIDsWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MISProvisioningProfileGetUUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = a2;
      _os_log_impl(&dword_1D4BF7000, v8, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust missing UUID for profile: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }

}

+ (BOOL)enumerateProvisioningProfilesWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__MDMProvisioningProfileTrust_enumerateProvisioningProfilesWithBlock___block_invoke;
  v7[3] = &unk_1E98524E8;
  v8 = v4;
  v5 = v4;
  LOBYTE(a1) = objc_msgSend(a1, "_enumerateProvisioningProfilesWithBlock:", v7);

  return (char)a1;
}

void __70__MDMProvisioningProfileTrust_enumerateProvisioningProfilesWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  MDMProvisioningProfile *v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = -[MDMProvisioningProfile initWithProfile:]([MDMProvisioningProfile alloc], "initWithProfile:", a2);
  (*(void (**)(uint64_t, MDMProvisioningProfile *, id))(v4 + 16))(v4, v6, v5);

}

+ (BOOL)anyUPPExistsForManagedAppSigners
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  +[MDMProvisioningProfileTrust managedAppSigners](MDMProvisioningProfileTrust, "managedAppSigners");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__MDMProvisioningProfileTrust_anyUPPExistsForManagedAppSigners__block_invoke;
  v6[3] = &unk_1E9852510;
  v4 = v3;
  v7 = v4;
  v8 = &v9;
  objc_msgSend(a1, "_enumerateProvisioningProfilesWithBlock:", v6);
  LOBYTE(a1) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)a1;
}

uint64_t __63__MDMProvisioningProfileTrust_anyUPPExistsForManagedAppSigners__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:");
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

+ (BOOL)isTrustedProvisioningProfileUUID:(id)a3
{
  return MISUPPTrusted();
}

- (void)uiTrustAndVerifyProvisioningProfiles:(id)a3 developer:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  int v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v23 = a4;
  v22 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");

        if (v15)
        {
          objc_msgSend(v13, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = AMFIProfileRequiresReboot();

          if (v17)
          {
            v18 = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v19 = v18;
              objc_msgSend(v13, "uuid");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v29 = v20;
              v30 = 1026;
              v31 = v17;
              _os_log_impl(&dword_1D4BF7000, v19, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust failed to reboot check provisioning profile UUID %{public}@ with error: %{public}d", buf, 0x12u);

            }
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v10);
  }

  -[MDMProvisioningProfileTrust _uiSetTrustForProvisioningProfiles:developer:completion:](self, "_uiSetTrustForProvisioningProfiles:developer:completion:", v8, v23, v22);
}

- (void)uiVerifyProvisioningProfileUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__MDMProvisioningProfileTrust_uiVerifyProvisioningProfileUUID_completion___block_invoke;
  v8[3] = &unk_1E9852538;
  v9 = v6;
  v7 = v6;
  -[MDMProvisioningProfileTrust _verifyProvisioningProfileUUID:completion:](self, "_verifyProvisioningProfileUUID:completion:", a3, v8);

}

uint64_t __74__MDMProvisioningProfileTrust_uiVerifyProvisioningProfileUUID_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  if (a3)
    DMCSendUPPVerificationOfflineNotification();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_uiSetTrustForProvisioningProfiles:(id)a3 developer:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  MDMProvisioningProfileTrust *v14;
  id v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__MDMProvisioningProfileTrust__uiSetTrustForProvisioningProfiles_developer_completion___block_invoke;
  v12[3] = &unk_1E9852560;
  v14 = self;
  v15 = v9;
  v13 = v8;
  v10 = v8;
  v11 = v9;
  -[MDMProvisioningProfileTrust _presentTrustAlertForDeveloper:restart:completion:](self, "_presentTrustAlertForDeveloper:restart:completion:", a4, 0, v12);

}

uint64_t __87__MDMProvisioningProfileTrust__uiSetTrustForProvisioningProfiles_developer_completion___block_invoke(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  int v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v22;
    *(_QWORD *)&v5 = 138543362;
    v20 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "uuid", v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = AMFIProfileSetTrust();

        v12 = *(NSObject **)(DMCLogObjects() + 8);
        if (v11)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = v12;
            objc_msgSend(v9, "uuid");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v26 = v14;
            v27 = 1026;
            v28 = v11;
            _os_log_impl(&dword_1D4BF7000, v13, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust failed to set manual trust for provisioning profile UUID %{public}@ with error: %{public}d", buf, 0x12u);

          }
          DMCSendUPPTrustFailedNotification();
        }
        else
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v15 = v12;
            objc_msgSend(v9, "uuid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v20;
            v26 = v16;
            _os_log_impl(&dword_1D4BF7000, v15, OS_LOG_TYPE_DEFAULT, "MDMProvisioningProfileTrust successfully set manual trust for provisioning profile UUID %{public}@", buf, 0xCu);

          }
          v17 = *(void **)(a1 + 40);
          objc_msgSend(v9, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "uiVerifyProvisioningProfileUUID:completion:", v18, 0);

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v6);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_uiScheduleTrustForProvisioningProfileUUID:(id)a3 developer:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__MDMProvisioningProfileTrust__uiScheduleTrustForProvisioningProfileUUID_developer_completion___block_invoke;
  v12[3] = &unk_1E9852588;
  v13 = v8;
  v14 = v9;
  v10 = v8;
  v11 = v9;
  -[MDMProvisioningProfileTrust _presentTrustAlertForDeveloper:restart:completion:](self, "_presentTrustAlertForDeveloper:restart:completion:", a4, 1, v12);

}

uint64_t __95__MDMProvisioningProfileTrust__uiScheduleTrustForProvisioningProfileUUID_developer_completion___block_invoke(uint64_t a1, char a2)
{
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  v3 = AMFIProfileScheduleTrust();
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v5;
      v11 = 1026;
      v12 = v3;
      _os_log_impl(&dword_1D4BF7000, v4, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust failed to schedule trust for provisioning profile UUID %{public}@ with error: %{public}d", (uint8_t *)&v9, 0x12u);
    }
    DMCSendUPPTrustFailedNotification();
    v6 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1D4BF7000, v4, OS_LOG_TYPE_DEFAULT, "MDMProvisioningProfileTrust successfully scheduled trust for provisioning profile UUID %{public}@", (uint8_t *)&v9, 0xCu);
    }
    v6 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v6();
}

- (void)_presentTrustAlertForDeveloper:(id)a3 restart:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = v7;
    v24 = 1026;
    v25 = v6;
    _os_log_impl(&dword_1D4BF7000, v9, OS_LOG_TYPE_DEFAULT, "MDMProvisioningProfileTrust presenting trust alert for developer “%{public}@” with restart: %{public}d", buf, 0x12u);
  }
  if (v7)
    DMCLocalizedFormat();
  else
    DMCLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("PROVISIONING_PROFILE_TRUST_ALLOW_RESTART");
  if (!v6)
    v11 = CFSTR("PROVISIONING_PROFILE_TRUST_ALLOW");
  v12 = (void *)MEMORY[0x1E0D1C1A0];
  v13 = v11;
  DMCLocalizedStringByDevice();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  DMCLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  DMCLocalizedString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__MDMProvisioningProfileTrust__presentTrustAlertForDeveloper_restart_completion___block_invoke;
  v19[3] = &unk_1E98525B0;
  v20 = v7;
  v21 = v8;
  v17 = v7;
  v18 = v8;
  objc_msgSend(v12, "displayAlertWithTitle:message:defaultButtonText:altButtonText:destructive:completion:", v10, v14, v15, v16, 1, v19);

}

uint64_t __81__MDMProvisioningProfileTrust__presentTrustAlertForDeveloper_restart_completion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2 == 1)
    return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1);
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1D4BF7000, v4, OS_LOG_TYPE_DEFAULT, "MDMProvisioningProfileTrust not allowing trust for developer: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)_untrustProvisioningProfileUUID:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = AMFIProfileRemoveTrust();
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = 67240192;
      LODWORD(v11) = v4;
      v6 = "MDMProvisioningProfileTrust AMFI failed to untrust provisioning profile with error: %{public}d";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 8;
LABEL_6:
      _os_log_impl(&dword_1D4BF7000, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v3;
    v6 = "MDMProvisioningProfileTrust AMFI succesfully untrusted provisioning profile: %{public}@";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEFAULT;
    v9 = 12;
    goto LABEL_6;
  }

}

- (void)_verifyProvisioningProfileUUID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_1D4BF7000, v7, OS_LOG_TYPE_DEFAULT, "MDMProvisioningProfileTrust verifying provisioning profile UUID %{public}@...", buf, 0xCu);
  }
  v10 = v5;
  v8 = v6;
  v9 = v5;
  MISValidateUPP();

}

uint64_t __73__MDMProvisioningProfileTrust__verifyProvisioningProfileUUID_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t (*v9)(void);
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = *(NSObject **)(DMCLogObjects() + 8);
  if (a3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[4];
      v14 = 138543618;
      v15 = v7;
      v16 = 2050;
      v17 = a3;
      _os_log_impl(&dword_1D4BF7000, v6, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust failed to verify provisioning profile %{public}@ with error %{public}lld", (uint8_t *)&v14, 0x16u);
    }
    result = a1[6];
    if (result)
    {
      v9 = *(uint64_t (**)(void))(result + 16);
      return v9();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = a1[4];
      v10 = (void *)a1[5];
      v12 = v6;
      objc_msgSend(v10, "_descriptionForMISState:", a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v11;
      v16 = 2114;
      v17 = v13;
      v18 = 2050;
      v19 = a2;
      _os_log_impl(&dword_1D4BF7000, v12, OS_LOG_TYPE_DEFAULT, "MDMProvisioningProfileTrust successfully verified provisioning profile %{public}@ as %{public}@ (%{public}ld)", (uint8_t *)&v14, 0x20u);

    }
    result = a1[6];
    if (result)
    {
      v9 = *(uint64_t (**)(void))(result + 16);
      return v9();
    }
  }
  return result;
}

+ (void)didEnrollInMDMWithPasscode:(id)a3 duringMigration:(BOOL)a4
{
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  __CFString *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 buf;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  if (a4)
  {
    v6 = 0;
  }
  else
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v7 = (void *)getLAContextClass_softClass;
    v24 = getLAContextClass_softClass;
    if (!getLAContextClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v26 = __getLAContextClass_block_invoke;
      v27 = &unk_1E9852678;
      v28 = &v21;
      __getLAContextClass_block_invoke((uint64_t)&buf);
      v7 = (void *)v22[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v21, 8);
    v6 = (void *)objc_opt_new();
    if (v5)
      v9 = v5;
    else
      v9 = &stru_1E9853740;
    -[__CFString dataUsingEncoding:](v9, "dataUsingEncoding:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v11 = objc_msgSend(v6, "setCredential:type:error:", v10, -1, &v20);
    v12 = v20;
    if ((v11 & 1) == 0)
    {
      v13 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v12;
        _os_log_impl(&dword_1D4BF7000, v13, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust AMFI failed to set context credential with error: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }

  }
  v14 = AMFIMDMModeEnroll();
  v15 = *(NSObject **)(DMCLogObjects() + 8);
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 67240192;
      DWORD1(buf) = v14;
      v16 = "MDMProvisioningProfileTrust AMFI failed to enroll in MDM with error: %{public}d";
      v17 = v15;
      v18 = OS_LOG_TYPE_ERROR;
      v19 = 8;
LABEL_17:
      _os_log_impl(&dword_1D4BF7000, v17, v18, v16, (uint8_t *)&buf, v19);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    v16 = "MDMProvisioningProfileTrust AMFI successfully enrolled in MDM";
    v17 = v15;
    v18 = OS_LOG_TYPE_DEFAULT;
    v19 = 2;
    goto LABEL_17;
  }

}

+ (void)didUnenrollFromMDM
{
  int v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint32_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = AMFIMDMModeRemove();
  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      v13 = v2;
      v4 = "MDMProvisioningProfileTrust AMFI failed to unenroll from MDM with error: %{public}d";
      v5 = v3;
      v6 = OS_LOG_TYPE_ERROR;
      v7 = 8;
LABEL_6:
      _os_log_impl(&dword_1D4BF7000, v5, v6, v4, buf, v7);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v4 = "MDMProvisioningProfileTrust AMFI successfully unenrolled from MDM";
    v5 = v3;
    v6 = OS_LOG_TYPE_DEFAULT;
    v7 = 2;
    goto LABEL_6;
  }
  +[MDMProvisioningProfileTrust managedAppSigners](MDMProvisioningProfileTrust, "managedAppSigners");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__MDMProvisioningProfileTrust_didUnenrollFromMDM__block_invoke;
  v10[3] = &unk_1E9852600;
  v11 = v8;
  v9 = v8;
  +[MDMProvisioningProfileTrust _enumerateProvisioningProfileUUIDsWithBlock:](MDMProvisioningProfileTrust, "_enumerateProvisioningProfileUUIDsWithBlock:", v10);

}

void __49__MDMProvisioningProfileTrust_didUnenrollFromMDM__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a3))
    +[MDMProvisioningProfileTrust _untrustProvisioningProfileUUID:](MDMProvisioningProfileTrust, "_untrustProvisioningProfileUUID:", v5);

}

+ (void)didSuperviseThroughADE
{
  int v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint32_t v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = AMFISupervisedModeSetState();
  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      return;
    v8[0] = 67240192;
    v8[1] = v2;
    v4 = "MDMProvisioningProfileTrust AMFI failed to supervise through ADE with error: %{public}d";
    v5 = v3;
    v6 = OS_LOG_TYPE_ERROR;
    v7 = 8;
  }
  else
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      return;
    LOWORD(v8[0]) = 0;
    v4 = "MDMProvisioningProfileTrust AMFI successfully supervised through ADE";
    v5 = v3;
    v6 = OS_LOG_TYPE_DEFAULT;
    v7 = 2;
  }
  _os_log_impl(&dword_1D4BF7000, v5, v6, v4, (uint8_t *)v8, v7);
}

+ (void)didSuperviseThroughConfigurator
{
  int v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint32_t v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = AMFISupervisedModeSetState();
  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      return;
    v8[0] = 67240192;
    v8[1] = v2;
    v4 = "MDMProvisioningProfileTrust AMFI failed to supervise through Configurator with error: %{public}d";
    v5 = v3;
    v6 = OS_LOG_TYPE_ERROR;
    v7 = 8;
  }
  else
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      return;
    LOWORD(v8[0]) = 0;
    v4 = "MDMProvisioningProfileTrust AMFI successfully supervised through Configurator";
    v5 = v3;
    v6 = OS_LOG_TYPE_DEFAULT;
    v7 = 2;
  }
  _os_log_impl(&dword_1D4BF7000, v5, v6, v4, (uint8_t *)v8, v7);
}

- (id)updateTrustedCodeSigningIdentities:(id)a3 validateBundleIDs:(id)a4 validateManagedApps:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
  NSObject *v54;
  void *v55;
  id v56;
  id v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  BOOL v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void *v101;
  id v102;
  _BYTE v103[128];
  uint8_t v104[128];
  uint8_t buf[4];
  uint64_t v106;
  __int16 v107;
  uint64_t v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v66 = a3;
  v7 = a4;
  +[MDMProvisioningProfileTrust managedAppSigners](MDMProvisioningProfileTrust, "managedAppSigners");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v7;
  if (v7)
  {
    +[MDMProvisioningProfileTrust _appSignerIdentitiesFromBundleIDs:](MDMProvisioningProfileTrust, "_appSignerIdentitiesFromBundleIDs:", v7);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v61 = 0;
  }
  v9 = (void *)objc_opt_new();
  v10 = MEMORY[0x1E0C809B0];
  v98 = MEMORY[0x1E0C809B0];
  v99 = 3221225472;
  v100 = __104__MDMProvisioningProfileTrust_updateTrustedCodeSigningIdentities_validateBundleIDs_validateManagedApps___block_invoke;
  v101 = &unk_1E9852628;
  v11 = v9;
  v102 = v11;
  MISEnumerateTrustedUPPs();
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  v89[0] = v10;
  v89[1] = 3221225472;
  v89[2] = __104__MDMProvisioningProfileTrust_updateTrustedCodeSigningIdentities_validateBundleIDs_validateManagedApps___block_invoke_2;
  v89[3] = &unk_1E9852650;
  v63 = v8;
  v90 = v63;
  v16 = v12;
  v91 = v16;
  v97 = a5;
  v64 = v14;
  v92 = v64;
  v17 = v66;
  v93 = v17;
  v68 = v13;
  v94 = v68;
  v18 = v61;
  v95 = v18;
  v62 = v15;
  v96 = v62;
  if (+[MDMProvisioningProfileTrust _enumerateProvisioningProfileUUIDsWithBlock:](MDMProvisioningProfileTrust, "_enumerateProvisioningProfileUUIDsWithBlock:", v89))
  {
    v58 = v18;
    v59 = v16;
    v60 = v17;
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v19 = v16;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v85, v111, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v86 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i);
          objc_msgSend(v11, "removeObject:", v24);
          objc_msgSend(v68, "removeObject:", v24);
          +[MDMProvisioningProfileTrust _performAMFIOperation:label:uuid:](MDMProvisioningProfileTrust, "_performAMFIOperation:label:uuid:", AMFIProfileSetTrust(), CFSTR("MDM trust"), v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v85, v111, 16);
      }
      while (v21);
    }

    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v25 = v68;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v81, v110, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v82;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v82 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * j);
          objc_msgSend(v11, "removeObject:", v30);
          +[MDMProvisioningProfileTrust _performAMFIOperation:label:uuid:](MDMProvisioningProfileTrust, "_performAMFIOperation:label:uuid:", AMFIProfileSetTrust(), CFSTR("manual trust"), v30);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v81, v110, 16);
      }
      while (v27);
    }

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v31 = v11;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v77, v109, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v78 != v34)
            objc_enumerationMutation(v31);
          v36 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * k);
          v37 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v106 = v36;
            _os_log_impl(&dword_1D4BF7000, v37, OS_LOG_TYPE_DEFAULT, "MDMProvisioningProfileTrust removing trust for orphaned UPP UUID: %{public}@", buf, 0xCu);
          }
          +[MDMProvisioningProfileTrust _untrustProvisioningProfileUUID:](MDMProvisioningProfileTrust, "_untrustProvisioningProfileUUID:", v36);
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v77, v109, 16);
      }
      while (v33);
    }

    v38 = *(NSObject **)(DMCLogObjects() + 8);
    v39 = v64;
    v40 = v62;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v41 = v38;
      v42 = objc_msgSend(v64, "count");
      v43 = objc_msgSend(v62, "count");
      *(_DWORD *)buf = 134349312;
      v106 = v42;
      v107 = 2050;
      v108 = v43;
      _os_log_impl(&dword_1D4BF7000, v41, OS_LOG_TYPE_DEFAULT, "MDMProvisioningProfileTrust will verify %{public}lu managed profiles and %{public}lu other profiles", buf, 0x16u);

    }
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v44 = v64;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v73, v104, 16);
    v18 = v58;
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v74;
      do
      {
        for (m = 0; m != v46; ++m)
        {
          if (*(_QWORD *)v74 != v47)
            objc_enumerationMutation(v44);
          -[MDMProvisioningProfileTrust _verifyProvisioningProfileUUID:completion:](self, "_verifyProvisioningProfileUUID:completion:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * m), 0);
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v73, v104, 16);
      }
      while (v46);
    }

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v49 = v62;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v69, v103, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v70;
      do
      {
        for (n = 0; n != v51; ++n)
        {
          if (*(_QWORD *)v70 != v52)
            objc_enumerationMutation(v49);
          -[MDMProvisioningProfileTrust _verifyProvisioningProfileUUID:completion:](self, "_verifyProvisioningProfileUUID:completion:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * n), 0);
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v69, v103, 16);
      }
      while (v51);
    }

    v16 = v59;
    v17 = v60;
  }
  else
  {
    v54 = *(NSObject **)(DMCLogObjects() + 8);
    v39 = v64;
    v40 = v62;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4BF7000, v54, OS_LOG_TYPE_ERROR, "MDMProvisioningProfileTrust skipping UPP sync because MIS enumeration failed", buf, 2u);
    }
  }
  v55 = v96;
  v56 = v63;

  return v56;
}

uint64_t __104__MDMProvisioningProfileTrust_updateTrustedCodeSigningIdentities_validateBundleIDs_validateManagedApps___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __104__MDMProvisioningProfileTrust_updateTrustedCodeSigningIdentities_validateBundleIDs_validateManagedApps___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    if (!*(_BYTE *)(a1 + 88))
      goto LABEL_7;
    v6 = (id *)(a1 + 48);
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 56), "containsObject:", v5))
      goto LABEL_7;
    v6 = (id *)(a1 + 64);
  }
  objc_msgSend(*v6, "addObject:", v7);
LABEL_7:
  if (objc_msgSend(*(id *)(a1 + 72), "containsObject:", v5))
    objc_msgSend(*(id *)(a1 + 80), "addObject:", v7);

}

+ (void)_performAMFIOperation:(unsigned int)a3 label:(id)a4 uuid:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  id v15;
  __int16 v16;
  _WORD v17[17];

  *(_QWORD *)&v17[13] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = *(NSObject **)(DMCLogObjects() + 8);
  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543874;
      v15 = v7;
      v16 = 1026;
      *(_DWORD *)v17 = a3;
      v17[2] = 2114;
      *(_QWORD *)&v17[3] = v8;
      v10 = "MDMProvisioningProfileTrust AMFI %{public}@ failed (%{public}d) for provisioning profile %{public}@";
      v11 = v9;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 28;
LABEL_6:
      _os_log_impl(&dword_1D4BF7000, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543618;
    v15 = v7;
    v16 = 2114;
    *(_QWORD *)v17 = v8;
    v10 = "MDMProvisioningProfileTrust AMFI %{public}@ success for provisioning profile: %{public}@";
    v11 = v9;
    v12 = OS_LOG_TYPE_DEFAULT;
    v13 = 22;
    goto LABEL_6;
  }

}

+ (BOOL)_isFreeSignedAppDeveloper:(void *)a3
{
  const __CFBoolean *Value;
  const __CFBoolean *v4;
  CFTypeID v5;

  Value = (const __CFBoolean *)MISProfileGetValue();
  if (Value)
  {
    v4 = Value;
    v5 = CFGetTypeID(Value);
    LOBYTE(Value) = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) != 0;
  }
  return (char)Value;
}

- (id)_descriptionForMISState:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("unknown");
  else
    return off_1E98526B0[a3];
}

+ (id)managedAppSigners
{
  void *v2;
  void *v3;

  +[MDMManagedMediaReader managedAppIDs](MDMManagedMediaReader, "managedAppIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MDMProvisioningProfileTrust _appSignerIdentitiesFromBundleIDs:](MDMProvisioningProfileTrust, "_appSignerIdentitiesFromBundleIDs:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_appSignerIdentitiesFromBundleIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D82650DC](v6);
        +[MDMProvisioningProfileTrust _appSignerIdentityForBundleID:](MDMProvisioningProfileTrust, "_appSignerIdentityForBundleID:", v10, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 = v6;
    }
    while (v6);
  }

  return v4;
}

+ (id)_appSignerIdentityForBundleID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v10);
  v5 = v10;
  if (v4)
  {
    objc_msgSend(v4, "signerIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v3;
        _os_log_impl(&dword_1D4BF7000, v7, OS_LOG_TYPE_ERROR, "MDMProvisoningProfileTrust could not find signer identity of managed app '%{public}@'", buf, 0xCu);
      }
    }
  }
  else
  {
    v8 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v12 = v3;
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_1D4BF7000, v8, OS_LOG_TYPE_ERROR, "MDMProvisoningProfileTrust could not find record of managed app '%{public}@' with error: %{public}@", buf, 0x16u);
    }
    v6 = 0;
  }

  return v6;
}

+ (id)developerFromIdentity:(id)a3 hasFreePP:(BOOL)a4 hasUPP:(BOOL)a5
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a4;
  objc_msgSend(a1, "_developer:withoutPrefix:", a3, CFSTR("iPhone Distribution: "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_developer:withoutPrefix:", v8, CFSTR("iPhone Developer: "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_developer:withoutPrefix:", v9, CFSTR("Apple Development: "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !a5)
  {
    v11 = objc_msgSend(v10, "rangeOfString:", CFSTR(" ("));
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v10, "substringToIndex:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
  }
  return v10;
}

+ (id)_developer:(id)a3 withoutPrefix:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasPrefix:", v6)
    && (v7 = objc_msgSend(v5, "length"), v7 > objc_msgSend(v6, "length")))
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

- (OS_dispatch_queue)misVerificationQueue
{
  return self->_misVerificationQueue;
}

- (void)setMisVerificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_misVerificationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_misVerificationQueue, 0);
}

@end
