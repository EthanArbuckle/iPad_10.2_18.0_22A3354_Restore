@implementation AXSBServerUIApplication

- (int64_t)interfaceOrientation
{
  objc_super v4;

  if (objc_msgSend((id)SBServerHelper, "shouldOverrideInterfaceOrientation"))
    return objc_msgSend((id)*MEMORY[0x24BEBDF78], "activeInterfaceOrientation");
  v4.receiver = self;
  v4.super_class = (Class)AXSBServerUIApplication;
  return -[AXSBServerUIApplication interfaceOrientation](&v4, sel_interfaceOrientation);
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)alertInterfaceOrientation
{
  objc_super v4;

  if (objc_msgSend((id)SBServerHelper, "shouldOverrideInterfaceOrientation"))
    return objc_msgSend((id)*MEMORY[0x24BEBDF78], "activeInterfaceOrientation");
  v4.receiver = self;
  v4.super_class = (Class)AXSBServerUIApplication;
  return -[AXSBServerUIApplication alertInterfaceOrientation](&v4, sel_alertInterfaceOrientation);
}

@end
