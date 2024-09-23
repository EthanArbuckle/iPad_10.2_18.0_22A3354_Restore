@implementation AXWebKitGlueLegacy

+ (void)accessibilityInitializeBundle
{
  id v3;

  if (_UIApplicationIsWebKitLoaded())
  {
    objc_msgSend(a1, "_webKitInitialized");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel__webKitInitialized, CFSTR("UIApplicationLoadedWebKit"), 0);

  }
}

+ (void)_webKitInitialized
{
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __40__AXWebKitGlueLegacy__webKitInitialized__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__webKitInitialized");
}

+ (void)__webKitInitialized
{
  id v2;

  if (__webKitInitialized_onceToken != -1)
    dispatch_once(&__webKitInitialized_onceToken, &__block_literal_global_0);
  objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addHandler:forFramework:", &__block_literal_global_238, CFSTR("DataDetectors"));

}

void __41__AXWebKitGlueLegacy___webKitInitialized__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_180, &__block_literal_global_216, 0, &__block_literal_global_222);

}

uint64_t __41__AXWebKitGlueLegacy___webKitInitialized__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebPDFView"), CFSTR("doc"), "^{CGPDFDocument=}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebView"), CFSTR("_UIKitDelegate"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WAKScrollView"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebHTMLView"), CFSTR("_accessibilityParentForSubview:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("UIWebBrowserView"), CFSTR("_overflowScrollViews"), "NSMutableSet");
  objc_msgSend(v2, "validateClass:", CFSTR("UIWebOverflowScrollView"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("UIWebOverflowScrollView"), CFSTR("_overflowContentView"), "UIWebOverflowContentView");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebView"), CFSTR("webView: didFinishLoadForFrame:"), "v", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebBrowserView"), CFSTR("assistFormNode:"), "v", "@", 0);

  return 1;
}

uint64_t __41__AXWebKitGlueLegacy___webKitInitialized__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("WebKitLegacy AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("WebKitLegacy"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __41__AXWebKitGlueLegacy___webKitInitialized__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIWebViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIWebDocumentViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("DOMNodeAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIWebBrowserViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WebHTMLViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WebViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WebPDFViewAccessibility"), 1);

}

void __41__AXWebKitGlueLegacy___webKitInitialized__block_invoke_5()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_239, &__block_literal_global_247, 0, 0);

}

uint64_t __41__AXWebKitGlueLegacy___webKitInitialized__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("DDDetectionController"), CFSTR("sharedController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DDDetectionController"), CFSTR("_resultForURL: forContainer: context:"), "^{__DDResult=}", "@", "@", "@", 0);

  return 1;
}

uint64_t __41__AXWebKitGlueLegacy___webKitInitialized__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("DataDetectorsWebKit AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("DataDetectorsWebKit"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

@end
