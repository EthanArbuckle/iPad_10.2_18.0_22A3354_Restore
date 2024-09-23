@implementation SOInternalProtocols

+ (id)interfaceWithInternalProtocol:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v3 = a3;
  if (interfaceWithInternalProtocol__onceToken != -1)
    dispatch_once(&interfaceWithInternalProtocol__onceToken, &__block_literal_global);
  objc_msgSend((id)interfaceWithInternalProtocol__protocolCache, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (&unk_1EFB8FA98 == v3)
    {
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = objc_opt_class();
      v7 = objc_opt_class();
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_profilesWithExtensionBundleIdentifier_completion_, 0, 1);

    }
    objc_msgSend((id)interfaceWithInternalProtocol__protocolCache, "setObject:forKey:", v4, v3);
  }
  v13 = v4;

  return v13;
}

void __53__SOInternalProtocols_interfaceWithInternalProtocol___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)interfaceWithInternalProtocol__protocolCache;
  interfaceWithInternalProtocol__protocolCache = v0;

}

@end
