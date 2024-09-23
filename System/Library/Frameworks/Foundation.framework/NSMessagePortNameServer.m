@implementation NSMessagePortNameServer

+ (id)sharedInstance
{
  id result;

  result = (id)sharedInstance___NSMessagePortNameServerShared;
  if (!sharedInstance___NSMessagePortNameServerShared)
  {
    result = (id)objc_msgSend(objc_allocWithZone((Class)a1), "init");
    sharedInstance___NSMessagePortNameServerShared = (uint64_t)result;
  }
  return result;
}

- (NSPort)portForName:(NSString *)name
{
  return (NSPort *)(id)objc_msgSend(objc_allocWithZone((Class)NSMessagePort), "initWithRemoteName:", name);
}

- (NSPort)portForName:(NSString *)name host:(NSString *)host
{
  if (host && !objc_msgSend(&stru_1E0F56070, "isEqual:", host))
    return 0;
  else
    return -[NSMessagePortNameServer portForName:](self, "portForName:", name);
}

- (BOOL)registerPort:(id)a3 name:(id)a4
{
  return objc_msgSend(a3, "setName:", a4);
}

- (BOOL)removePortForName:(id)a3
{
  return 0;
}

@end
