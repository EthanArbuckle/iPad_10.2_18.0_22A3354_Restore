@implementation ABDynamicLoaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ABDynamicLoader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)loadFrameworkAtPath:(id)a3 andStoreHandle:(void *)a4 bundle:(id *)a5 logging:(BOOL)a6
{
  unsigned int v7;
  BOOL v8;
  id v9;
  id v11;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___ABDynamicLoaderAccessibility;
  v7 = objc_msgSendSuper2(&v12, sel_loadFrameworkAtPath_andStoreHandle_bundle_logging_, a3, a4, a5, a6);
  v8 = v7;
  if (a5 && v7 && *a5)
  {
    v11 = *a5;
    v9 = v11;
    AXPerformBlockOnMainThreadAfterDelay();

  }
  return v8;
}

uint64_t __82__ABDynamicLoaderAccessibility_loadFrameworkAtPath_andStoreHandle_bundle_logging___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "isLoaded") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "load");
  return objc_msgSend(MEMORY[0x24BEBADF8], "loadAccessibilityBundleForBundle:didLoadCallback:force:loadAllAccessibilityInfo:", *(_QWORD *)(a1 + 32), 0, 1, 0);
}

@end
