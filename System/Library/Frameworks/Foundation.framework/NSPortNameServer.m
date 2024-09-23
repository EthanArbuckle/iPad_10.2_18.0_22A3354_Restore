@implementation NSPortNameServer

+ (NSPortNameServer)systemDefaultPortNameServer
{
  NSPortNameServer *result;

  result = (NSPortNameServer *)systemDefaultPortNameServer___NSDefaultNameServer;
  if (!systemDefaultPortNameServer___NSDefaultNameServer)
  {
    result = +[NSMachBootstrapServer sharedInstance](NSMachBootstrapServer, "sharedInstance");
    systemDefaultPortNameServer___NSDefaultNameServer = (uint64_t)result;
  }
  return result;
}

+ (id)defaultPortNameServer
{
  return +[NSPortNameServer systemDefaultPortNameServer](NSPortNameServer, "systemDefaultPortNameServer");
}

- (NSPort)portForName:(NSString *)name
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSPortNameServer"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSPort)portForName:(NSString *)name host:(NSString *)host
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSPortNameServer"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (BOOL)registerPort:(NSPort *)port name:(NSString *)name
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSPortNameServer"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (BOOL)removePortForName:(NSString *)name
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSPortNameServer"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

@end
