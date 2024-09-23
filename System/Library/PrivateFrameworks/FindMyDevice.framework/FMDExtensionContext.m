@implementation FMDExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  NSObject *v2;
  uint8_t v4[16];

  LogCategory_Extensions();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9939000, v2, OS_LOG_TYPE_DEFAULT, "#ext - extensionAuxVendorProto called", v4, 2u);
  }

  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_2);
  return (id)_extensionAuxiliaryVendorProtocol___interface;
}

void __56__FMDExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF925520);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___interface, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_fetchAllAccessoriesInfoWithInfo_withCompletion_, 0, 1);

}

+ (id)_extensionAuxiliaryHostProtocol
{
  NSObject *v2;
  uint8_t v4[16];

  LogCategory_Extensions();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9939000, v2, OS_LOG_TYPE_DEFAULT, "#ext - extensionAuxHostProto called", v4, 2u);
  }

  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_79);
  return (id)_extensionAuxiliaryHostProtocol___interface;
}

void __54__FMDExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF926FC8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface;
  _extensionAuxiliaryHostProtocol___interface = v0;

}

@end
