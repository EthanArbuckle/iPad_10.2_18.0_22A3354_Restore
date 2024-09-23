@implementation DASExtensionRemoteContext

void __61___DASExtensionRemoteContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEDF4B8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface;
  _extensionAuxiliaryHostProtocol___interface = v0;

}

void __63___DASExtensionRemoteContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEDCC10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

}

void __51___DASExtensionRemoteContext_hostContextWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend(*(id *)(a1 + 32), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __51___DASExtensionRemoteContext_hostContextWithError___block_invoke_cold_1((uint64_t)v4, v5);

}

uint64_t __39___DASExtensionRemoteContext_extension__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;
  NSObject *v5;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)extension_extension;
  extension_extension = v2;

  result = objc_msgSend((id)extension_extension, "isMemberOfClass:", objc_opt_class());
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __39___DASExtensionRemoteContext_extension__block_invoke_cold_1(v5);

    exit(0);
  }
  return result;
}

void __46___DASExtensionRemoteContext_performActivity___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "extension");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runner:performActivity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __51___DASExtensionRemoteContext_hostContextWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B0DF4000, a2, OS_LOG_TYPE_ERROR, "Error getting host context %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __39___DASExtensionRemoteContext_extension__block_invoke_cold_1(NSObject *a1)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = objc_opt_class();
  v4 = 2112;
  v5 = extension_extension;
  _os_log_fault_impl(&dword_1B0DF4000, a1, OS_LOG_TYPE_FAULT, "Found unexpected principalObject of class %@: %@.", (uint8_t *)&v2, 0x16u);
}

@end
