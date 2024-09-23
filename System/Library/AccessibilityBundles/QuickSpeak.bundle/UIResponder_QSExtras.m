@implementation UIResponder_QSExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIResponder");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  int v7;
  void *v8;
  char v9;
  objc_super v11;

  v6 = a4;
  v7 = -[UIResponder_QSExtras _accessibilityQScanPerformAction:withSender:](self, "_accessibilityQScanPerformAction:withSender:", a3, v6);
  +[AXQSMenuHelper sharedInstance](AXQSMenuHelper, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isShowingLanguageChoices");

  if ((v9 & 1) == 0
    && ((v7 | +[AXQuickSpeak isQuickSpeakSelector:](AXQuickSpeak, "isQuickSpeakSelector:", a3)) & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)UIResponder_QSExtras;
    LOBYTE(v7) = -[UIResponder_QSExtras canPerformAction:withSender:](&v11, sel_canPerformAction_withSender_, a3, v6);
  }

  return v7;
}

@end
