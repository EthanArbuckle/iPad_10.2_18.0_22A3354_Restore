@implementation AXSBUIWindow

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_setRotatableViewOrientation:(int64_t)a3 duration:(double)a4 force:(BOOL)a5
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)AXSBUIWindow;
  -[AXSBUIWindow _setRotatableViewOrientation:duration:force:](&v14, sel__setRotatableViewOrientation_duration_force_, a3, a5);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isHidden") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("_frontMostAppOrientation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    v15[0] = *MEMORY[0x24BE003B0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v15[1] = *MEMORY[0x24BE003B8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "springBoardActionOccurred:withPayload:", 4, v12);

  }
}

@end
