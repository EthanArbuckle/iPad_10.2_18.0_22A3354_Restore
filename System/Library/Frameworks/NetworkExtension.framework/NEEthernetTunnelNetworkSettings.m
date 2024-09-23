@implementation NEEthernetTunnelNetworkSettings

- (NEEthernetTunnelNetworkSettings)initWithTunnelRemoteAddress:(NSString *)address ethernetAddress:(NSString *)ethernetAddress mtu:(NSInteger)mtu
{
  NSString *v9;
  NEEthernetTunnelNetworkSettings *v10;
  NEEthernetTunnelNetworkSettings *v11;
  void *v12;
  objc_super v14;

  v9 = ethernetAddress;
  v14.receiver = self;
  v14.super_class = (Class)NEEthernetTunnelNetworkSettings;
  v10 = -[NETunnelNetworkSettings initWithTunnelRemoteAddress:](&v14, sel_initWithTunnelRemoteAddress_, address);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_ethernetAddress, ethernetAddress);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", mtu);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEPacketTunnelNetworkSettings setMTU:](v11, "setMTU:", v12);

  }
  return v11;
}

- (NEEthernetTunnelNetworkSettings)initWithCoder:(id)a3
{
  id v4;
  NEEthernetTunnelNetworkSettings *v5;
  uint64_t v6;
  NSString *ethernetAddress;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NEEthernetTunnelNetworkSettings;
  v5 = -[NEPacketTunnelNetworkSettings initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ethernetAddress"));
    v6 = objc_claimAutoreleasedReturnValue();
    ethernetAddress = v5->_ethernetAddress;
    v5->_ethernetAddress = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NEEthernetTunnelNetworkSettings;
  v4 = a3;
  -[NEPacketTunnelNetworkSettings encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[NEEthernetTunnelNetworkSettings ethernetAddress](self, "ethernetAddress", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ethernetAddress"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NEEthernetTunnelNetworkSettings;
  v4 = -[NEPacketTunnelNetworkSettings copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[NEEthernetTunnelNetworkSettings ethernetAddress](self, "ethernetAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEthernetAddress:", v5);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEEthernetTunnelNetworkSettings;
  v5 = -[NEPacketTunnelNetworkSettings checkValidityAndCollectErrors:](&v13, sel_checkValidityAndCollectErrors_, v4);
  -[NEEthernetTunnelNetworkSettings ethernetAddress](self, "ethernetAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("No MAC address was specified"), v4);
    v5 = 0;
  }
  -[NEEthernetTunnelNetworkSettings ethernetAddress](self, "ethernetAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  createEthernetAddressFromString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid ethernet address"), v4);
    v5 = 0;
  }
  -[NEPacketTunnelNetworkSettings MTU](self, "MTU");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("No MTU was specified"), v4);
    v5 = 0;
  }
  -[NEPacketTunnelNetworkSettings MTU](self, "MTU");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  if (!v11)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid MTU, the MTU must be greater than 0"), v4);
    v5 = 0;
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v12.receiver = self;
  v12.super_class = (Class)NEEthernetTunnelNetworkSettings;
  -[NEPacketTunnelNetworkSettings descriptionWithIndent:options:](&v12, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  -[NEEthernetTunnelNetworkSettings ethernetAddress](self, "ethernetAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("ethernetAddress"), v5, a4);

  return v9;
}

- (NSString)ethernetAddress
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEthernetAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ethernetAddress, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
