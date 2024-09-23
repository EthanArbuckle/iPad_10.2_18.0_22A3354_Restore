@implementation NSExtensionContext(ExtensionKitAdditions)

- (id)_derivedExtensionAuxiliaryHostProtocol
{
  void *v0;
  NSObject *v1;

  +[EXExtensionContextImplementation _derivedExtensionAuxiliaryHostProtocolWithContextClass:](EXExtensionContextImplementation, "_derivedExtensionAuxiliaryHostProtocolWithContextClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _EXLegacyLog();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    -[NSExtensionContext(ExtensionKitAdditions) _derivedExtensionAuxiliaryHostProtocol].cold.1();

  return v0;
}

+ (uint64_t)_allowedItemPayloadClasses
{
  return 0;
}

- (void)_derivedExtensionAuxiliaryHostProtocol
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_190C25000, v0, v1, "Derived context: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
