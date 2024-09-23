@implementation AXGIFQuickLookGlue

+ (void)accessibilityInitializeBundle
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:", &__block_literal_global, &__block_literal_global_176, &__block_literal_global_180);

}

uint64_t __51__AXGIFQuickLookGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __51__AXGIFQuickLookGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setOverrideProcessName:", CFSTR("GIF QuickLook"));
  return 1;
}

uint64_t __51__AXGIFQuickLookGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("QLGIFDisplayBundleAccessibility"), 1);
}

@end
