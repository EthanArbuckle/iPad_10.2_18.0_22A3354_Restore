@implementation CDPCARecoveryKeyVerificationReporter

- (CDPCARecoveryKeyVerificationReporter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDPCARecoveryKeyVerificationReporter;
  return -[CDPCAReporter initWithEvent:](&v3, sel_initWithEvent_, CFSTR("com.apple.CoreCDP.recoveryKeyVerification"));
}

@end
