@implementation AVCNetworkAddress

- (AVCNetworkAddress)init
{
  AVCNetworkAddress *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)AVCNetworkAddress;
  v2 = -[AVCNetworkAddress init](&v4, sel_init);
  if (v2)
  {
    v2->ip = (NSString *)objc_opt_new();
    v2->interfaceName = (NSString *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVCNetworkAddress;
  -[AVCNetworkAddress dealloc](&v3, sel_dealloc);
}

- (NSString)interfaceName
{
  return self->interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)ip
{
  return self->ip;
}

- (void)setIp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unsigned)port
{
  return self->port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->port = a3;
}

- (BOOL)isIPv6
{
  return self->isIPv6;
}

- (void)setIsIPv6:(BOOL)a3
{
  self->isIPv6 = a3;
}

@end
