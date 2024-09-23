@implementation PasscodeContentViewControllerFactory

+ (id)passcodeContentViewControllerForPasscode:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  PasscodeContentViewControllerFullScreen *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PasscodeContentViewControllerFullScreen initWithPasscode:options:]([PasscodeContentViewControllerFullScreen alloc], "initWithPasscode:options:", v6, v5);

  return v7;
}

@end
