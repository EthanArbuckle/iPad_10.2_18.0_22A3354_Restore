@implementation AXSBServerSBHUDController

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHUDController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_presentHUD:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  char isKindOfClass;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldBlockGestureActivation:", 4);

  if (!v8
    || (-[AXSBServerSBHUDController safeValueForKey:](self, "safeValueForKey:", CFSTR("hudViewController")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        NSClassFromString(CFSTR("SBElasticHUDViewController")),
        isKindOfClass = objc_opt_isKindOfClass(),
        v9,
        (isKindOfClass & 1) == 0))
  {
    v11.receiver = self;
    v11.super_class = (Class)AXSBServerSBHUDController;
    -[AXSBServerSBHUDController _presentHUD:animated:](&v11, sel__presentHUD_animated_, v6, v4);
  }

}

@end
