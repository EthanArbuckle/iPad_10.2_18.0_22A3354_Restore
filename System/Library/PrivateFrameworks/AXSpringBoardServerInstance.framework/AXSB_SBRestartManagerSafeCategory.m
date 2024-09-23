@implementation AXSB_SBRestartManagerSafeCategory

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBRestartManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRestartManager"), CFSTR("initializeAndRunStartupTransition:"), "v", "@?", 0);
}

- (void)initializeAndRunStartupTransition:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __71__AXSB_SBRestartManagerSafeCategory_initializeAndRunStartupTransition___block_invoke;
  v6[3] = &unk_24DDE6310;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AXSB_SBRestartManagerSafeCategory;
  v6[0] = MEMORY[0x24BDAC760];
  v4 = v7;
  -[AXSB_SBRestartManagerSafeCategory initializeAndRunStartupTransition:](&v5, sel_initializeAndRunStartupTransition_, v6);

}

@end
