@implementation AXSBServerHelperSBControlCenterController

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBControlCenterController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canBePresented
{
  void *v3;
  char v4;
  objc_super v6;

  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldBlockGestureActivation:", 2);

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)AXSBServerHelperSBControlCenterController;
  return -[AXSBServerHelperSBControlCenterController canBePresented](&v6, sel_canBePresented);
}

@end
