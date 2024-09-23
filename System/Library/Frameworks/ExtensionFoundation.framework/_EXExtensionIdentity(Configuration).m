@implementation _EXExtensionIdentity(Configuration)

- (BOOL)requiresUIKitSceneHosting
{
  void *v3;
  char v4;

  if (!-[_EXExtensionIdentity targetsSystemExtensionPoint](self, "targetsSystemExtensionPoint"))
    return 1;
  -[_EXExtensionIdentity extensionPointConfiguration](self, "extensionPointConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_EX_BOOLForKey:", CFSTR("EXRequiresUIKitSceneHosting"));

  return v4;
}

- (void)connectionHandlerClass
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  NSStringFromProtocol((Protocol *)&unk_1EE2126C0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_190C25000, a1, OS_LOG_TYPE_ERROR, "EXConnectionHandlerClass must conform to %{public}@.", (uint8_t *)&v3, 0xCu);

}

@end
