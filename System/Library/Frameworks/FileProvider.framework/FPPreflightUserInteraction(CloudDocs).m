@implementation FPPreflightUserInteraction(CloudDocs)

+ (void)userInteractionErrorsInInfoPlistDict:()CloudDocs forAction:bundleID:hierarchyServicer:sourceNSFPItems:destinationNSFPItem:localizationLookup:provider:domain:extensionCapabilities:useFPFS:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] Got nil fpItem for sourceItem %@", v2);
  OUTLINED_FUNCTION_3();
}

@end
