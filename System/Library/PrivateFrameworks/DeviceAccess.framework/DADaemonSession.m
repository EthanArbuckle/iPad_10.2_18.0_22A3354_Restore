@implementation DADaemonSession

- (DADaemonSession)init
{
  DADaemonSession *v2;
  DADaemonSession *v3;
  DADaemonSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DADaemonSession;
  v2 = -[DASession init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

@end
