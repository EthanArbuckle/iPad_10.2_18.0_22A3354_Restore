@implementation SharedFlowPluginServiceAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriKitRuntime.SharedFlowPluginService");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriKitRuntime.SharedFlowPluginService"), CFSTR("loadFlowPluginWithBundleId:bundlePath:rcId:hypothesisId:reply:"), "v", "@", "@", "@", "@", "@?", 0);
}

- (void)loadFlowPluginWithBundleId:(id)a3 bundlePath:(id)a4 rcId:(id)a5 hypothesisId:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  void *v17;
  int v18;
  void *v19;
  void *v20;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD))a7;
  v17 = (void *)objc_opt_new();
  v18 = objc_msgSend(v17, "isClarityBoardEnabled");

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BE16E00], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "applicationBundleIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!AXIsPluginAllowedInClarity())
    {
      v16[2](v16, 0);

      goto LABEL_6;
    }

  }
  v21.receiver = self;
  v21.super_class = (Class)SharedFlowPluginServiceAccessibility;
  -[SharedFlowPluginServiceAccessibility loadFlowPluginWithBundleId:bundlePath:rcId:hypothesisId:reply:](&v21, sel_loadFlowPluginWithBundleId_bundlePath_rcId_hypothesisId_reply_, v12, v13, v14, v15, v16);
LABEL_6:

}

@end
