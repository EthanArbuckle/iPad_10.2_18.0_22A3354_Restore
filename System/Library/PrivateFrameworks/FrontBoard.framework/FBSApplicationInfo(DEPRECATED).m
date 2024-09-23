@implementation FBSApplicationInfo(DEPRECATED)

- (id)_initForProfileManagerTesting
{
  void *v2;
  id v3;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = a1;
  v5.super_class = (Class)&off_1EE6DAAE8;
  v3 = objc_msgSendSuper2(&v5, sel__initWithBundleIdentifier_url_, CFSTR("com.apple.frontboard.appInfoTest"), v2);

  return v3;
}

- (uint64_t)signatureState
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_signatureValidationService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_mapSignatureStateFromTrustState:", objc_msgSend(v2, "trustStateForApplication:", a1));

  return v3;
}

- (id)_signatureValidationService
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc(MEMORY[0x1E0D23128]);
  objc_msgSend(MEMORY[0x1E0D231A8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "signerIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profilesForSignerIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D231A8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithApplicationInfo:andProvisioningProfiles:isManaged:", a1, v5, objc_msgSend(v6, "isManaged:", v7));

  return v8;
}

- (void)acceptApplicationSignatureIdentity
{
  void *v1;
  id MCProfileConnectionClass;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "signerIdentity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v7 = v1;
    MCProfileConnectionClass = getMCProfileConnectionClass();
    objc_msgSend(MCProfileConnectionClass, "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trustedCodeSigningIdentities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "mutableCopy");

    if (!v5)
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "addObject:", v7);
    objc_msgSend(MCProfileConnectionClass, "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTrustedCodeSigningIdentities:", v5);

    v1 = v7;
  }

}

- (uint64_t)_mapSignatureStateFromTrustState:()DEPRECATED
{
  if (a3 > 0xA)
    return 0;
  else
    return qword_1A3619A50[a3];
}

@end
