@implementation HMDNetworkRouterAdvertisementProtocol

+ (id)protocolFromFirewallRuleAdvertisingProtocol:(unsigned __int8)a3
{
  uint64_t v3;
  HMDNetworkRouterAdvertisementProtocol *v4;

  if (a3)
  {
    if (a3 != 1)
    {
      v4 = 0;
      return v4;
    }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  v4 = -[HMDNetworkRouterAdvertisementProtocol initWithAdvertisementProtocol:]([HMDNetworkRouterAdvertisementProtocol alloc], "initWithAdvertisementProtocol:", v3);
  return v4;
}

- (HMDNetworkRouterAdvertisementProtocol)init
{
  HMDNetworkRouterAdvertisementProtocol *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterAdvertisementProtocol;
  result = -[HMDNetworkRouterAdvertisementProtocol init](&v3, sel_init);
  if (result)
    result->_advertisementProtocol = 0;
  return result;
}

- (HMDNetworkRouterAdvertisementProtocol)initWithAdvertisementProtocol:(int64_t)a3
{
  HMDNetworkRouterAdvertisementProtocol *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDNetworkRouterAdvertisementProtocol;
  result = -[HMDNetworkRouterAdvertisementProtocol init](&v5, sel_init);
  if (result)
    result->_advertisementProtocol = a3;
  return result;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  id v9;

  v6 = a3;
  v7 = v6;
  if (!a4)
  {
    if (!objc_msgSend(v6, "length"))
    {
      v8 = 0;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  *a4 = 0;
  if (objc_msgSend(v6, "length"))
  {
LABEL_5:
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v8 = 1;
    -[HMDNetworkRouterAdvertisementProtocol setAdvertisementProtocol:](self, "setAdvertisementProtocol:", HAPTLVParseUInt64());
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
  v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (id)serializeWithError:(id *)a3
{
  -[HMDNetworkRouterAdvertisementProtocol advertisementProtocol](self, "advertisementProtocol", a3);
  return (id)HAPTLVWriteUInt64();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HMDNetworkRouterAdvertisementProtocol initWithAdvertisementProtocol:](+[HMDNetworkRouterAdvertisementProtocol allocWithZone:](HMDNetworkRouterAdvertisementProtocol, "allocWithZone:", a3), "initWithAdvertisementProtocol:", -[HMDNetworkRouterAdvertisementProtocol advertisementProtocol](self, "advertisementProtocol"));
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterAdvertisementProtocol *v4;
  HMDNetworkRouterAdvertisementProtocol *v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (HMDNetworkRouterAdvertisementProtocol *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[HMDNetworkRouterAdvertisementProtocol advertisementProtocol](self, "advertisementProtocol");
      v7 = -[HMDNetworkRouterAdvertisementProtocol advertisementProtocol](v5, "advertisementProtocol");

      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  void *v2;
  int64_t v3;
  __CFString *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[HMDNetworkRouterAdvertisementProtocol advertisementProtocol](self, "advertisementProtocol");
  if (v3)
  {
    if (v3 == 1)
    {
      v4 = CFSTR("HMDNetworkRouterAdvertisementProtocolTypeSSDP");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMDNetworkRouterAdvertisementProtocolType %ld"), v3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = CFSTR("HMDNetworkRouterAdvertisementProtocolTypeDNSSD");
  }
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HMDNetworkRouterAdvertisementProtocol advertisementProtocol=%@>"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (int64_t)advertisementProtocol
{
  return self->_advertisementProtocol;
}

- (void)setAdvertisementProtocol:(int64_t)a3
{
  self->_advertisementProtocol = a3;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDNetworkRouterAdvertisementProtocol *v6;
  HMDNetworkRouterAdvertisementProtocol *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterAdvertisementProtocol);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterAdvertisementProtocol parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
    v8 = v10;
    if (v8)
    {

      v7 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }

  }
  return v7;
}

@end
