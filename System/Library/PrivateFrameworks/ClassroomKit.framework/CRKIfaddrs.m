@implementation CRKIfaddrs

- (CRKIfaddrs)initWithIfaddrs:(ifaddrs *)a3
{
  CRKIfaddrs *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRKIfaddrs;
  result = -[CRKIfaddrs init](&v5, sel_init);
  if (result)
    result->mIfaddrs = a3;
  return result;
}

- (BOOL)isInternetInterface
{
  return self->mIfaddrs->ifa_addr->sa_family == 2;
}

- (NSString)name
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", self->mIfaddrs->ifa_name);
}

- (NSString)IPAddress
{
  in_addr v2;
  void *v3;

  v2.s_addr = *(_DWORD *)&self->mIfaddrs->ifa_addr->sa_data[2];
  if (v2.s_addr)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", inet_ntoa(v2));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (CRKIfaddrs)next
{
  ifaddrs *ifa_next;
  void *v3;

  ifa_next = self->mIfaddrs->ifa_next;
  if (ifa_next)
    v3 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIfaddrs:", ifa_next);
  else
    v3 = 0;
  return (CRKIfaddrs *)v3;
}

@end
