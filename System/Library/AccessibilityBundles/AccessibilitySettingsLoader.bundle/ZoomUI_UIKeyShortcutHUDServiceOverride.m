@implementation ZoomUI_UIKeyShortcutHUDServiceOverride

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyShortcutHUDService");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_requestHUDPresentationIfAllowedWithUnpreparedConfiguration:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldSuppressKeyCommandHUD");

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)ZoomUI_UIKeyShortcutHUDServiceOverride;
    -[ZoomUI_UIKeyShortcutHUDServiceOverride _requestHUDPresentationIfAllowedWithUnpreparedConfiguration:](&v7, sel__requestHUDPresentationIfAllowedWithUnpreparedConfiguration_, v4);
  }

}

@end
