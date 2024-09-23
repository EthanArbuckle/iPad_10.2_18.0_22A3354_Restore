@implementation MFMessageContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFMessageContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMessageContentView"), CFSTR("webView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMessageContentView"), CFSTR("generateSnapshotImageWithCompletion:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFMessageContentView"), CFSTR("UIView"));

}

- (MFMessageContentViewAccessibility)initWithFrame:(CGRect)a3
{
  MFMessageContentViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFMessageContentViewAccessibility;
  v3 = -[MFMessageContentViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MFMessageContentViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)generateSnapshotImageWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__MFMessageContentViewAccessibility_generateSnapshotImageWithCompletion___block_invoke;
  v8[3] = &unk_250285BD0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x23491506C](v8);
  v7.receiver = self;
  v7.super_class = (Class)MFMessageContentViewAccessibility;
  -[MFMessageContentViewAccessibility generateSnapshotImageWithCompletion:](&v7, sel_generateSnapshotImageWithCompletion_, v6);

}

void __73__MFMessageContentViewAccessibility_generateSnapshotImageWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludeWindowlessViews:", 1);
  objc_msgSend(v4, "setSorted:", 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBADD8]), "initWithRootElement:traversalOptions:", *(_QWORD *)(a1 + 32), v4);
  objc_msgSend(v5, "setShouldResolveRemoteElements:", 1);
  v10 = 0;
  objc_msgSend(v5, "encodeWithError:", &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (v7)
  {
    AXLogAppAccessibility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __73__MFMessageContentViewAccessibility_generateSnapshotImageWithCompletion___block_invoke_cold_1((uint64_t)v7, v8);

  }
  objc_msgSend(v3, "_setAccessibilityEncodedHierarchyData:", v6);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFMessageContentViewAccessibility;
  -[MFMessageContentViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[MFMessageContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("webView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilitySetIdentification:", CFSTR("kAXMailContentViewWebViewIdentifier"));

}

- (int64_t)accessibilityNavigationStyle
{
  return 1;
}

void __73__MFMessageContentViewAccessibility_generateSnapshotImageWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_232774000, a2, OS_LOG_TYPE_ERROR, "Could not encode ax hierarchy for mail snapshot. %@", (uint8_t *)&v2, 0xCu);
}

@end
