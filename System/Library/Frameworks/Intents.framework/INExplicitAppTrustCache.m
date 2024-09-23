@implementation INExplicitAppTrustCache

- (BOOL)enterpriseAppTrustAllowed
{
  void *v3;

  if (!self->_enterpriseAppTrustAllowedLoaded)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_enterpriseAppTrustAllowed = objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FE0]) != 2;

    self->_enterpriseAppTrustAllowedLoaded = 1;
  }
  return self->_enterpriseAppTrustAllowed;
}

- (NSArray)managedBundleIdentifiers
{
  void *v3;
  NSArray *v4;
  NSArray *managedBundleIdentifiers;

  if (!self->_loadedManagedBundleIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "managedAppIDs");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    managedBundleIdentifiers = self->_managedBundleIdentifiers;
    self->_managedBundleIdentifiers = v4;

    self->_loadedManagedBundleIdentifiers = 1;
  }
  return self->_managedBundleIdentifiers;
}

- (NSArray)trustedCodeSigningIdentities
{
  void *v3;
  NSArray *v4;
  NSArray *trustedCodeSigningIdentities;

  if (!self->_loadedTrustedCodeSigningIdentities)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trustedCodeSigningIdentities");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    trustedCodeSigningIdentities = self->_trustedCodeSigningIdentities;
    self->_trustedCodeSigningIdentities = v4;

    self->_loadedTrustedCodeSigningIdentities = 1;
  }
  return self->_trustedCodeSigningIdentities;
}

- (NSSet)signingIdentitiesRequiringExplicitTrust
{
  NSSet *signingIdentitiesRequiringExplicitTrust;
  NSSet **p_signingIdentitiesRequiringExplicitTrust;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  p_signingIdentitiesRequiringExplicitTrust = &self->_signingIdentitiesRequiringExplicitTrust;
  signingIdentitiesRequiringExplicitTrust = self->_signingIdentitiesRequiringExplicitTrust;
  if (!signingIdentitiesRequiringExplicitTrust)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__24972;
    v9 = __Block_byref_object_dispose__24973;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    MISEnumerateInstalledProvisioningProfiles();
    objc_storeStrong((id *)p_signingIdentitiesRequiringExplicitTrust, (id)v6[5]);
    _Block_object_dispose(&v5, 8);

    signingIdentitiesRequiringExplicitTrust = *p_signingIdentitiesRequiringExplicitTrust;
  }
  return signingIdentitiesRequiringExplicitTrust;
}

- (void)setEnterpriseAppTrustAllowed:(BOOL)a3
{
  self->_enterpriseAppTrustAllowed = a3;
}

- (void)setManagedBundleIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_managedBundleIdentifiers, a3);
}

- (void)setTrustedCodeSigningIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_trustedCodeSigningIdentities, a3);
}

- (void)setSigningIdentitiesRequiringExplicitTrust:(id)a3
{
  objc_storeStrong((id *)&self->_signingIdentitiesRequiringExplicitTrust, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingIdentitiesRequiringExplicitTrust, 0);
  objc_storeStrong((id *)&self->_trustedCodeSigningIdentities, 0);
  objc_storeStrong((id *)&self->_managedBundleIdentifiers, 0);
}

uint64_t __66__INExplicitAppTrustCache_signingIdentitiesRequiringExplicitTrust__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __SecCertificate *v6;
  __SecCertificate *v7;
  __CFString *v8;
  int v9;
  const __CFBoolean *Value;
  const __CFBoolean *v11;
  CFTypeID v12;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  MISProvisioningProfileGetDeveloperCertificates();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v2)
    goto LABEL_20;
  v3 = v2;
  v4 = *(_QWORD *)v16;
  while (2)
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v16 != v4)
        objc_enumerationMutation(v1);
      v6 = SecCertificateCreateWithData(0, *(CFDataRef *)(*((_QWORD *)&v15 + 1) + 8 * i));
      if (v6)
      {
        v7 = v6;
        v8 = (__CFString *)SecCertificateCopySubjectSummary(v6);
        if (!v8)
        {
LABEL_15:
          CFRelease(v7);

          continue;
        }
        v9 = MISProvisioningProfileProvisionsAllDevices();
        Value = (const __CFBoolean *)MISProfileGetValue();
        if (Value)
        {
          v11 = Value;
          v12 = CFGetTypeID(Value);
          if (v12 != CFBooleanGetTypeID())
          {
            LODWORD(Value) = 0;
            if (v9)
              goto LABEL_19;
LABEL_14:
            if ((_DWORD)Value)
            {
LABEL_19:
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v8);
              CFRelease(v7);

              goto LABEL_20;
            }
            goto LABEL_15;
          }
          LODWORD(Value) = CFBooleanGetValue(v11);
        }
        if (v9)
          goto LABEL_19;
        goto LABEL_14;
      }
    }
    v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v3)
      continue;
    break;
  }
LABEL_20:

  return 1;
}

@end
