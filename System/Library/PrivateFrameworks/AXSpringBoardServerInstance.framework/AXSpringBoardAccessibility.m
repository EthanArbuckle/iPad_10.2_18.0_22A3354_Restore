@implementation AXSpringBoardAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SpringBoard");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_takeScreenshotAndEdit:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)();
  void *v10;
  AXSpringBoardAccessibility *v11;
  BOOL v12;

  v3 = a3;
  if (_AXSVoiceOverTouchEnabled()
    || _AXSAssistiveTouchEnabled()
    || _AXSZoomTouchEnabled())
  {
    +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "springBoardActionOccurred:", 6);

    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __53__AXSpringBoardAccessibility__takeScreenshotAndEdit___block_invoke;
    v10 = &unk_24DDE5F58;
    v12 = v3;
    v11 = self;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AXSpringBoardAccessibility;
    -[AXSpringBoardAccessibility _takeScreenshotAndEdit:](&v6, sel__takeScreenshotAndEdit_, v3);
  }
}

uint64_t __53__AXSpringBoardAccessibility__takeScreenshotAndEdit___block_invoke()
{
  AXPerformSafeBlock();
  return AXPerformBlockOnMainThreadAfterDelay();
}

id __53__AXSpringBoardAccessibility__takeScreenshotAndEdit___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)AXSpringBoardAccessibility;
  return objc_msgSendSuper2(&v3, sel__takeScreenshotAndEdit_, v1);
}

void __53__AXSpringBoardAccessibility__takeScreenshotAndEdit___block_invoke_3()
{
  id v0;

  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "springBoardActionOccurred:", 7);

}

@end
