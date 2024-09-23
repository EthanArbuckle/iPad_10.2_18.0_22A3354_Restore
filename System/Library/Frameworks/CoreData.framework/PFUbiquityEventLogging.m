@implementation PFUbiquityEventLogging

+ (void)initialize
{
  objc_opt_self();
}

- (PFUbiquityEventLogging)init
{
  PFUbiquityEventLogging *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFUbiquityEventLogging;
  v2 = -[PFUbiquityEventLogging init](&v4, sel_init);
  if (v2)
  {
    v2->_logEvents = (NSMutableSet *)objc_opt_new();
    v2->_logLevel = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "integerForKey:", CFSTR("com.apple.coredata.ubiquity.logLevel"));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityEventLogging;
  -[PFUbiquityEventLogging dealloc](&v3, sel_dealloc);
}

@end
