@implementation SBHProxiedApplicationPlaceholderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHProxiedApplicationPlaceholder");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHProxiedApplicationPlaceholder"), CFSTR("icon:statusDescriptionForLocation:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FBSApplicationPlaceholder"), CFSTR("progress"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("FBSApplicationPlaceholderProgress"), CFSTR("percentComplete"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHProxiedApplicationPlaceholder"), CFSTR("placeholderProxy"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHProxiedApplicationPlaceholder"), CFSTR("isFailed"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHProxiedApplicationPlaceholder"), CFSTR("isPausable"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHProxiedApplicationPlaceholder"), CFSTR("isPaused"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHProxiedApplicationPlaceholder"), CFSTR("isDownloading"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHProxiedApplicationPlaceholder"), CFSTR("applicationDisplayName"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  -[SBHProxiedApplicationPlaceholderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("applicationDisplayName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  AXPerformSafeBlock();
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __67__SBHProxiedApplicationPlaceholderAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(void **)(a1 + 32);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v3 = (id *)getSBIconLocationNoneSymbolLoc_ptr;
  v12 = getSBIconLocationNoneSymbolLoc_ptr;
  if (!getSBIconLocationNoneSymbolLoc_ptr)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getSBIconLocationNoneSymbolLoc_block_invoke;
    v8[3] = &unk_250383A90;
    v8[4] = &v9;
    __getSBIconLocationNoneSymbolLoc_block_invoke((uint64_t)v8);
    v3 = (id *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v3)
    __67__SBHProxiedApplicationPlaceholderAccessibility_accessibilityLabel__block_invoke_cold_1();
  v4 = *v3;
  objc_msgSend(v2, "icon:statusDescriptionForLocation:", 0, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  int v7;
  void *v8;
  float v9;

  -[SBHProxiedApplicationPlaceholderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("placeholderProxy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("progress"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeDoubleForKey:", CFSTR("percentComplete"));
  v6 = v5;

  v7 = -[SBHProxiedApplicationPlaceholderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isDownloading"));
  v8 = 0;
  if (v7 && v6 > 0.0)
  {
    v9 = v6;
    MEMORY[0x234920004](0, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)accessibilityHint
{
  void *v3;
  char v4;
  void *v5;
  __CFString *v6;

  AXSBHIconManagerFromSharedIconController();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isEditing"));

  if ((v4 & 1) != 0)
    goto LABEL_2;
  if ((-[SBHProxiedApplicationPlaceholderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isFailed")) & 1) != 0
    || (-[SBHProxiedApplicationPlaceholderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isPaused")) & 1) != 0)
  {
    v6 = CFSTR("app.icon.resume.download.hint");
LABEL_6:
    accessibilityLocalizedString(v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if (-[SBHProxiedApplicationPlaceholderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isPausable")))
  {
    v6 = CFSTR("app.icon.pause.download.hint");
    goto LABEL_6;
  }
LABEL_2:
  v5 = 0;
  return v5;
}

void __67__SBHProxiedApplicationPlaceholderAccessibility_accessibilityLabel__block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBIconLocationNone(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBHProxiedApplicationPlaceholderAccessibility.m"), 17, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
