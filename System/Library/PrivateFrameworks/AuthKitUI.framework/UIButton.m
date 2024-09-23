@implementation UIButton

void __56__UIButton_AuthKitUI___ak_passwordRecoveryButtonTapped___block_invoke()
{
  AKCAReporter *v0;

  v0 = -[AKCAReporter initWithEvent:]([AKCAReporter alloc], "initWithEvent:", CFSTR("com.apple.authkitui.password_recovery_button_tapped"));
  -[AKCAReporter sendReport](v0, "sendReport");

}

@end
