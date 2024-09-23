@implementation WGWidgetHostingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WGWidgetHostingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGWidgetHostingViewController"), CFSTR("_requestInsertionOfRemoteViewAfterViewWillAppearForSequence:completionHandler:"), "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGWidgetLifeCycleSequence"), CFSTR("currentState"), "q", 0);

}

- (void)_requestInsertionOfRemoteViewAfterViewWillAppearForSequence:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __124__WGWidgetHostingViewControllerAccessibility__requestInsertionOfRemoteViewAfterViewWillAppearForSequence_completionHandler___block_invoke;
  v11[3] = &unk_2503E7EE8;
  v12 = v6;
  v7 = v6;
  v8 = a3;
  v9 = (void *)MEMORY[0x234925638](v11);
  v10.receiver = self;
  v10.super_class = (Class)WGWidgetHostingViewControllerAccessibility;
  -[WGWidgetHostingViewControllerAccessibility _requestInsertionOfRemoteViewAfterViewWillAppearForSequence:completionHandler:](&v10, sel__requestInsertionOfRemoteViewAfterViewWillAppearForSequence_completionHandler_, v8, v9);

}

void __124__WGWidgetHostingViewControllerAccessibility__requestInsertionOfRemoteViewAfterViewWillAppearForSequence_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  if (objc_msgSend(v5, "safeIntegerForKey:", CFSTR("currentState")) == 4)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

@end
