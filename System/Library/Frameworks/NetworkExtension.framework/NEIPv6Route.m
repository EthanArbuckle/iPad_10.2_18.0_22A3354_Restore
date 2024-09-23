@implementation NEIPv6Route

- (NEIPv6Route)initWithDestinationAddress:(NSString *)address networkPrefixLength:(NSNumber *)networkPrefixLength
{
  NSString *v7;
  NSNumber *v8;
  NEIPv6Route *v9;
  NEIPv6Route *v10;
  objc_super v12;

  v7 = address;
  v8 = networkPrefixLength;
  v12.receiver = self;
  v12.super_class = (Class)NEIPv6Route;
  v9 = -[NEIPv6Route init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_destinationAddress, address);
    objc_storeStrong((id *)&v10->_destinationNetworkPrefixLength, networkPrefixLength);
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

  +[NEIPv6Route defaultRoute](NEIPv6Route, "defaultRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv6Route destinationAddress](self, "destinationAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destinationAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    -[NEIPv6Route destinationNetworkPrefixLength](self, "destinationNetworkPrefixLength");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "destinationNetworkPrefixLength");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToNumber:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NEIPv6Route)initWithCoder:(id)a3
{
  id v4;
  NEIPv6Route *v5;
  uint64_t v6;
  NSString *destinationAddress;
  uint64_t v8;
  NSNumber *destinationNetworkPrefixLength;
  uint64_t v10;
  NSString *gatewayAddress;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEIPv6Route;
  v5 = -[NEIPv6Route init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DestinationAddress"));
    v6 = objc_claimAutoreleasedReturnValue();
    destinationAddress = v5->_destinationAddress;
    v5->_destinationAddress = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DestinationPrefixLength"));
    v8 = objc_claimAutoreleasedReturnValue();
    destinationNetworkPrefixLength = v5->_destinationNetworkPrefixLength;
    v5->_destinationNetworkPrefixLength = (NSNumber *)v8;

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
  -[NEIPv6Route destinationAddress](self, "destinationAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("DestinationAddress"));

  -[NEIPv6Route destinationNetworkPrefixLength](self, "destinationNetworkPrefixLength");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("DestinationPrefixLength"));

  -[NEIPv6Route gatewayAddress](self, "gatewayAddress");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("RouteGatewayAddress"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NEIPv6Route *v4;
  void *v5;
  void *v6;
  NEIPv6Route *v7;
  void *v8;

  v4 = +[NEIPv6Route allocWithZone:](NEIPv6Route, "allocWithZone:", a3);
  -[NEIPv6Route destinationAddress](self, "destinationAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv6Route destinationNetworkPrefixLength](self, "destinationNetworkPrefixLength");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NEIPv6Route initWithDestinationAddress:networkPrefixLength:](v4, "initWithDestinationAddress:networkPrefixLength:", v5, v6);

  -[NEIPv6Route gatewayAddress](self, "gatewayAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv6Route setGatewayAddress:](v7, "setGatewayAddress:", v8);

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  int32x4_t v17;

  v4 = a3;
  v17 = 0uLL;
  -[NEIPv6Route destinationAddress](self, "destinationAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing NEIPv6Route Destination address"), v4);
    goto LABEL_9;
  }
  -[NEIPv6Route destinationAddress](self, "destinationAddress");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = inet_pton(30, (const char *)objc_msgSend(v6, "UTF8String"), &v17);

  if (!v7)
  {
    v8 = CFSTR("Invalid NEIPv6Route Destination address");
LABEL_8:
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v8, v4);
    LOBYTE(v5) = 0;
    goto LABEL_9;
  }
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_s32(v17, (int32x4_t)xmmword_19BED74F0)))) & 1) == 0)
  {
    v8 = CFSTR("IPv6Route Destination address in loopback");
    goto LABEL_8;
  }
  LOBYTE(v5) = 1;
LABEL_9:
  -[NEIPv6Route destinationNetworkPrefixLength](self, "destinationNetworkPrefixLength");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (void *)v9,
        -[NEIPv6Route destinationNetworkPrefixLength](self, "destinationNetworkPrefixLength"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "integerValue"),
        v11,
        v10,
        v12 >= 129))
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing NEIPv6Route Destination Network Prefix Length"), v4);
  }
  -[NEIPv6Route gatewayAddress](self, "gatewayAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NEIPv6Route gatewayAddress](self, "gatewayAddress");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = inet_pton(30, (const char *)objc_msgSend(v14, "UTF8String"), &v17);

    if (!v15)
    {
      +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid NEIPv6Route Gateway address"), v4);
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
  -[NEIPv6Route destinationAddress](self, "destinationAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NEIPv6Route destinationAddress](self, "destinationAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CE8D58]);

  }
  -[NEIPv6Route destinationNetworkPrefixLength](self, "destinationNetworkPrefixLength");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEIPv6Route destinationNetworkPrefixLength](self, "destinationNetworkPrefixLength");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CE8D70]);

  }
  -[NEIPv6Route gatewayAddress](self, "gatewayAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEIPv6Route gatewayAddress](self, "gatewayAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CE8D60]);

  }
  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v4;
  NEIPv6Route *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *destinationAddress;
  uint64_t v9;
  NSNumber *destinationNetworkPrefixLength;
  uint64_t v11;
  NSString *gatewayAddress;

  v4 = (const __CFDictionary *)a3;
  v5 = -[NEIPv6Route init](self, "init");
  if (v5)
  {
    if (v4)
    {
      v6 = CFDICTIONARY_TYPE;
      if (CFGetTypeID(v4) == v6)
      {
        NEGetValueWithType(v4, (const void *)*MEMORY[0x1E0CE8D58], CFSTRING_TYPE);
        v7 = objc_claimAutoreleasedReturnValue();
        destinationAddress = v5->_destinationAddress;
        v5->_destinationAddress = (NSString *)v7;

        NEGetValueWithType(v4, (const void *)*MEMORY[0x1E0CE8D70], CFNUMBER_TYPE);
        v9 = objc_claimAutoreleasedReturnValue();
        destinationNetworkPrefixLength = v5->_destinationNetworkPrefixLength;
        v5->_destinationNetworkPrefixLength = (NSNumber *)v9;

        NEGetValueWithType(v4, (const void *)*MEMORY[0x1E0CE8D60], CFSTRING_TYPE);
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
  -[NEIPv6Route destinationAddress](self, "destinationAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a4 | 1;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("destinationAddress"), v5, a4 | 1);

  -[NEIPv6Route destinationNetworkPrefixLength](self, "destinationNetworkPrefixLength");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("destinationNetworkPrefixLength"), v5, a4);

  -[NEIPv6Route gatewayAddress](self, "gatewayAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("gatewayAddress"), v5, v9);

  return v7;
}

- (NSString)destinationAddress
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)destinationNetworkPrefixLength
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
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
  objc_storeStrong((id *)&self->_destinationNetworkPrefixLength, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
}

+ (NEIPv6Route)defaultRoute
{
  objc_opt_self();
  if (initGlobals_onceToken_14722 != -1)
    dispatch_once(&initGlobals_onceToken_14722, &__block_literal_global_14723);
  return (NEIPv6Route *)(id)NEIPv6DefaultRoute;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __26__NEIPv6Route_initGlobals__block_invoke()
{
  NEIPv6Route *v0;
  void *v1;

  v0 = -[NEIPv6Route initWithDestinationAddress:networkPrefixLength:]([NEIPv6Route alloc], "initWithDestinationAddress:networkPrefixLength:", CFSTR("::"), &unk_1E3D036E8);
  v1 = (void *)NEIPv6DefaultRoute;
  NEIPv6DefaultRoute = (uint64_t)v0;

}

@end
