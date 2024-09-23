@implementation CRKASMCredentialStoreFactory

+ (CRKASMCredentialStore)studentCredentialStore
{
  return (CRKASMCredentialStore *)objc_msgSend(a1, "makeCredentialStoreWithRole:keychainOverride:", CFSTR("student"), 0);
}

+ (CRKASMCredentialStore)instructorCredentialStore
{
  return (CRKASMCredentialStore *)objc_msgSend(a1, "makeInstructorCredentialStoreWithKeychainOverride:", 0);
}

+ (CRKASMCredentialStore)instructorCredentialStoreWithoutKeychain
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(a1, "makeInstructorCredentialStoreWithKeychainOverride:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRKASMCredentialStore *)v4;
}

+ (id)makeInstructorCredentialStoreWithKeychainOverride:(id)a3
{
  return (id)objc_msgSend(a1, "makeCredentialStoreWithRole:keychainOverride:", CFSTR("instructor"), a3);
}

+ (id)makeCredentialStoreWithRole:(id)a3 keychainOverride:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  CRKASMCredentialStore *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "storageKeyWithRole:suffix:", v7, CFSTR("certificates"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "storageKeyWithRole:suffix:", v7, CFSTR("identities"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v10 = v6;
  }
  else
  {
    +[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "keychain");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  v12 = -[CRKASMCredentialStore initWithKeychain:accessGroup:certificateManifestStorageKey:identityManifestStorageKey:]([CRKASMCredentialStore alloc], "initWithKeychain:accessGroup:certificateManifestStorageKey:identityManifestStorageKey:", v10, CFSTR("com.apple.classroom"), v8, v9);

  return v12;
}

+ (id)storageKeyWithRole:(id)a3 suffix:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.classroom.asm.%@.annotations.%@"), a3, a4);
}

@end
