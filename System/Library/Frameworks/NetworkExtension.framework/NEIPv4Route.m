@implementation NEIPv4Route

- (NEIPv4Route)initWithDestinationAddress:(NSString *)address subnetMask:(NSString *)subnetMask
{
  NSString *v7;
  NSString *v8;
  NEIPv4Route *v9;
  NEIPv4Route *v10;
  objc_super v12;

  v7 = address;
  v8 = subnetMask;
  v12.receiver = self;
  v12.super_class = (Class)NEIPv4Route;
  v9 = -[NEIPv4Route init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_destinationAddress, address);
    objc_storeStrong((id *)&v10->_destinationSubnetMask, subnetMask);
  }

  return v10;
}

- (BOOL)isDefaultRoute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  +[NEIPv4Route defaultRoute](NEIPv4Route, "defaultRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv4Route destinationAddress](self, "destinationAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destinationAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    -[NEIPv4Route destinationSubnetMask](self, "destinationSubnetMask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "destinationSubnetMask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NEIPv4Route)initWithCoder:(id)a3
{
  id v4;
  NEIPv4Route *v5;
  uint64_t v6;
  NSString *destinationAddress;
  uint64_t v8;
  NSString *destinationSubnetMask;
  uint64_t v10;
  NSString *gatewayAddress;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEIPv4Route;
  v5 = -[NEIPv4Route init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DestinationAddress"));
    v6 = objc_claimAutoreleasedReturnValue();
    destinationAddress = v5->_destinationAddress;
    v5->_destinationAddress = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DestinationSubnetMask"));
    v8 = objc_claimAutoreleasedReturnValue();
    destinationSubnetMask = v5->_destinationSubnetMask;
    v5->_destinationSubnetMask = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RouteGatewayAddress"));
    v10 = objc_claimAutoreleasedReturnValue();
    gatewayAddress = v5->_gatewayAddress;
    v5->_gatewayAddress = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[NEIPv4Route destinationAddress](self, "destinationAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("DestinationAddress"));

  -[NEIPv4Route destinationSubnetMask](self, "destinationSubnetMask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("DestinationSubnetMask"));

  -[NEIPv4Route gatewayAddress](self, "gatewayAddress");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("RouteGatewayAddress"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NEIPv4Route *v4;
  void *v5;
  void *v6;
  NEIPv4Route *v7;
  void *v8;

  v4 = +[NEIPv4Route allocWithZone:](NEIPv4Route, "allocWithZone:", a3);
  -[NEIPv4Route destinationAddress](self, "destinationAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv4Route destinationSubnetMask](self, "destinationSubnetMask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NEIPv4Route initWithDestinationAddress:subnetMask:](v4, "initWithDestinationAddress:subnetMask:", v5, v6);

  -[NEIPv4Route gatewayAddress](self, "gatewayAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv4Route setGatewayAddress:](v7, "setGatewayAddress:", v8);

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  int v14;

  v4 = a3;
  v14 = 0;
  -[NEIPv4Route destinationAddress](self, "destinationAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing IPv4Route Destination address"), v4);
    goto LABEL_9;
  }
  -[NEIPv4Route destinationAddress](self, "destinationAddress");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = inet_pton(2, (const char *)objc_msgSend(v6, "UTF8String"), &v14);

  if (!v7)
  {
    v8 = CFSTR("Invalid IPv4Route Destination address");
    goto LABEL_7;
  }
  if (v14 == 127)
  {
    v8 = CFSTR("IPv4Route Destination address is loopback");
LABEL_7:
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v8, v4);
    LOBYTE(v5) = 0;
    goto LABEL_9;
  }
  LOBYTE(v5) = 1;
LABEL_9:
  -[NEIPv4Route destinationSubnetMask](self, "destinationSubnetMask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing IPv4Route Destination subnetmask"), v4);
  -[NEIPv4Route gatewayAddress](self, "gatewayAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NEIPv4Route gatewayAddress](self, "gatewayAddress");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = inet_pton(2, (const char *)objc_msgSend(v11, "UTF8String"), &v14);

    if (!v12)
    {
      +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid IPv4Route Gateway address"), v4);
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (id)copyLegacyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NEIPv4Route destinationAddress](self, "destinationAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NEIPv4Route destinationAddress](self, "destinationAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CE8CF0]);

  }
  -[NEIPv4Route destinationSubnetMask](self, "destinationSubnetMask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEIPv4Route destinationSubnetMask](self, "destinationSubnetMask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CE8D08]);

  }
  -[NEIPv4Route gatewayAddress](self, "gatewayAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEIPv4Route gatewayAddress](self, "gatewayAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CE8CF8]);

  }
  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v4;
  NEIPv4Route *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *destinationAddress;
  uint64_t v9;
  NSString *destinationSubnetMask;
  uint64_t v11;
  NSString *gatewayAddress;

  v4 = (const __CFDictionary *)a3;
  v5 = -[NEIPv4Route init](self, "init");
  if (v5)
  {
    if (v4)
    {
      v6 = CFDICTIONARY_TYPE;
      if (CFGetTypeID(v4) == v6)
      {
        NEGetValueWithType(v4, (const void *)*MEMORY[0x1E0CE8CF0], CFSTRING_TYPE);
        v7 = objc_claimAutoreleasedReturnValue();
        destinationAddress = v5->_destinationAddress;
        v5->_destinationAddress = (NSString *)v7;

        NEGetValueWithType(v4, (const void *)*MEMORY[0x1E0CE8D08], CFSTRING_TYPE);
        v9 = objc_claimAutoreleasedReturnValue();
        destinationSubnetMask = v5->_destinationSubnetMask;
        v5->_destinationSubnetMask = (NSString *)v9;

        NEGetValueWithType(v4, (const void *)*MEMORY[0x1E0CE8CF8], CFSTRING_TYPE);
        v11 = objc_claimAutoreleasedReturnValue();
        gatewayAddress = v5->_gatewayAddress;
        v5->_gatewayAddress = (NSString *)v11;

      }
    }
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  -[NEIPv4Route destinationAddress](self, "destinationAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a4 | 1;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("destinationAddress"), v5, a4 | 1);

  -[NEIPv4Route destinationSubnetMask](self, "destinationSubnetMask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("destinationSubnetMask"), v5, a4);

  -[NEIPv4Route gatewayAddress](self, "gatewayAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("gatewayAddress"), v5, v9);

  return v7;
}

- (NSString)destinationAddress
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)destinationSubnetMask
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)gatewayAddress
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setGatewayAddress:(NSString *)gatewayAddress
{
  objc_setProperty_atomic_copy(self, a2, gatewayAddress, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatewayAddress, 0);
  objc_storeStrong((id *)&self->_destinationSubnetMask, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
}

+ (NEIPv4Route)defaultRoute
{
  objc_opt_self();
  if (initGlobals_onceToken != -1)
    dispatch_once(&initGlobals_onceToken, &__block_literal_global_14515);
  return (NEIPv4Route *)(id)NEIPv4DefaultRoute;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __26__NEIPv4Route_initGlobals__block_invoke()
{
  NEIPv4Route *v0;
  void *v1;

  v0 = -[NEIPv4Route initWithDestinationAddress:subnetMask:]([NEIPv4Route alloc], "initWithDestinationAddress:subnetMask:", CFSTR("0.0.0.0"), CFSTR("0.0.0.0"));
  v1 = (void *)NEIPv4DefaultRoute;
  NEIPv4DefaultRoute = (uint64_t)v0;

}

@end
