@implementation CKFullScreenBalloonViewController_QSExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKFullScreenBalloonViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKFullScreenBalloonViewController"), CFSTR("performCancelAnimationWithCompletion:"), "v", "@?", 0);
}

- (void)performCancelAnimationWithCompletion:(id)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKFullScreenBalloonViewController_QSExtras;
  -[CKFullScreenBalloonViewController_QSExtras performCancelAnimationWithCompletion:](&v4, sel_performCancelAnimationWithCompletion_, a3);
  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContent:", 0);

}

@end
