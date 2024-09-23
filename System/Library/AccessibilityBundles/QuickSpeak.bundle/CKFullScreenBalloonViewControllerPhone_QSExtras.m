@implementation CKFullScreenBalloonViewControllerPhone_QSExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKFullScreenBalloonViewControllerPhone");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKFullScreenBalloonViewControllerPhone"), CFSTR("setBalloonView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKTextBalloonView"));

}

- (void)setBalloonView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHasTextBalloonView:", 0);

  v7.receiver = self;
  v7.super_class = (Class)CKFullScreenBalloonViewControllerPhone_QSExtras;
  -[CKFullScreenBalloonViewControllerPhone_QSExtras setBalloonView:](&v7, sel_setBalloonView_, v4);
  NSClassFromString(CFSTR("CKTextBalloonView"));
  LOBYTE(self) = objc_opt_isKindOfClass();

  if ((self & 1) != 0)
  {
    +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHasTextBalloonView:", 1);

  }
}

@end
