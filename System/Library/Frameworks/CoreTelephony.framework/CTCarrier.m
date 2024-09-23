@implementation CTCarrier

- (void)setCarrierName:(id)a3
{
  objc_storeStrong((id *)&self->_carrierName, a3);
}

- (void)setMobileNetworkCode:(id)a3
{
  objc_storeStrong((id *)&self->_mobileNetworkCode, a3);
}

- (void)setMobileCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_mobileCountryCode, a3);
}

- (void)setIsoCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_isoCountryCode, a3);
}

- (void)setAllowsVOIP:(BOOL)a3
{
  self->_allowsVOIP = a3;
}

- (CTCarrier)init
{
  CTCarrier *v2;
  CTCarrier *v3;
  NSString *carrierName;
  NSString *mobileCountryCode;
  NSString *mobileNetworkCode;
  NSString *isoCountryCode;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTCarrier;
  v2 = -[CTCarrier init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    carrierName = v2->_carrierName;
    v2->_carrierName = (NSString *)CFSTR("--");

    mobileCountryCode = v3->_mobileCountryCode;
    v3->_mobileCountryCode = (NSString *)CFSTR("65535");

    mobileNetworkCode = v3->_mobileNetworkCode;
    v3->_mobileNetworkCode = (NSString *)CFSTR("65535");

    isoCountryCode = v3->_isoCountryCode;
    v3->_isoCountryCode = (NSString *)CFSTR("--");

    v3->_allowsVOIP = 1;
  }
  return v3;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_mobileNetworkCode, 0);
  objc_storeStrong((id *)&self->_mobileCountryCode, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
}

- (NSString)mobileNetworkCode
{
  return self->_mobileNetworkCode;
}

- (NSString)mobileCountryCode
{
  return self->_mobileCountryCode;
}

- (BOOL)allowsVOIP
{
  return self->_allowsVOIP;
}

- (id)description
{
  __CFString *carrierName;
  __CFString *mobileCountryCode;
  __CFString *mobileNetworkCode;
  const __CFString *isoCountryCode;
  void *v7;
  const __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;

  if (self->_carrierName)
    carrierName = (__CFString *)self->_carrierName;
  else
    carrierName = CFSTR("<nil>");
  if (self->_mobileCountryCode)
    mobileCountryCode = (__CFString *)self->_mobileCountryCode;
  else
    mobileCountryCode = CFSTR("<nil>");
  mobileNetworkCode = (__CFString *)self->_mobileNetworkCode;
  if (!mobileNetworkCode)
    mobileNetworkCode = CFSTR("<nil>");
  if (self->_isoCountryCode)
    isoCountryCode = (const __CFString *)self->_isoCountryCode;
  else
    isoCountryCode = CFSTR("<nil>");
  v7 = (void *)MEMORY[0x1E0CB3940];
  if (self->_allowsVOIP)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = mobileNetworkCode;
  v10 = mobileCountryCode;
  v11 = carrierName;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("CTCarrier (%p) {\n\tCarrier name: [%@]\n\tMobile Country Code: [%@]\n\tMobile Network Code:[%@]\n\tISO Country Code:[%@]\n\tAllows VOIP? [%@]\n}\n"), self, v11, v10, v9, isoCountryCode, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  CTCarrier *v4;
  _BOOL4 allowsVOIP;
  NSString *carrierName;
  void *v7;
  NSString *mobileNetworkCode;
  void *v9;
  NSString *mobileCountryCode;
  void *v11;
  NSString *isoCountryCode;
  void *v13;
  char v14;

  v4 = (CTCarrier *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else if (-[CTCarrier isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (allowsVOIP = self->_allowsVOIP, allowsVOIP == -[CTCarrier allowsVOIP](v4, "allowsVOIP")))
  {
    carrierName = self->_carrierName;
    -[CTCarrier carrierName](v4, "carrierName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](carrierName, "isEqualToString:", v7))
    {
      mobileNetworkCode = self->_mobileNetworkCode;
      -[CTCarrier mobileNetworkCode](v4, "mobileNetworkCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](mobileNetworkCode, "isEqualToString:", v9))
      {
        mobileCountryCode = self->_mobileCountryCode;
        -[CTCarrier mobileCountryCode](v4, "mobileCountryCode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](mobileCountryCode, "isEqualToString:", v11))
        {
          isoCountryCode = self->_isoCountryCode;
          -[CTCarrier isoCountryCode](v4, "isoCountryCode");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[NSString isEqualToString:](isoCountryCode, "isEqualToString:", v13);

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
