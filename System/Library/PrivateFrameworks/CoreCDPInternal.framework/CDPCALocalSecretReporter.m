@implementation CDPCALocalSecretReporter

- (CDPCALocalSecretReporter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDPCALocalSecretReporter;
  return -[CDPCAReporter initWithEvent:](&v3, sel_initWithEvent_, CFSTR("com.apple.CoreCDP.LocalSecret"));
}

- (void)didChangeLocalSecret
{
  -[CDPCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", CFSTR("didChangeLocalSecret"), CFSTR("LocalSecretResult"));
  -[CDPCAReporter sendReport](self, "sendReport");
}

- (void)didRemoveLocalSecret
{
  -[CDPCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", CFSTR("didRemoveLocalSecret"), CFSTR("LocalSecretResult"));
  -[CDPCAReporter sendReport](self, "sendReport");
}

@end
