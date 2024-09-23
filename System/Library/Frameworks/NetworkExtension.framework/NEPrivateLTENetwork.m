@implementation NEPrivateLTENetwork

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NEPrivateLTENetwork mobileCountryCode](self, "mobileCountryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEPrivateLTENetwork mobileNetworkCode](self, "mobileNetworkCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEPrivateLTENetwork trackingAreaCode](self, "trackingAreaCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NEPrivateLTENetwork trackingAreaCode](self, "trackingAreaCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Mobile Country Code:[%@] Mobile Network Code:[%@] Tracking Area Code:[%@]"), v4, v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Mobile Country Code:[%@] Mobile Network Code:[%@] Tracking Area Code:[%@]"), v4, v5, &stru_1E3CC53C8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (NEPrivateLTENetwork)initWithCoder:(id)a3
{
  id v4;
  NEPrivateLTENetwork *v5;
  uint64_t v6;
  NSString *mobileCountryCode;
  uint64_t v8;
  NSString *mobileNetworkCode;
  uint64_t v10;
  NSString *trackingAreaCode;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEPrivateLTENetwork;
  v5 = -[NEPrivateLTENetwork init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLTEMCC"));
    v6 = objc_claimAutoreleasedReturnValue();
    mobileCountryCode = v5->_mobileCountryCode;
    v5->_mobileCountryCode = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLTEMNC"));
    v8 = objc_claimAutoreleasedReturnValue();
    mobileNetworkCode = v5->_mobileNetworkCode;
    v5->_mobileNetworkCode = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLTETAC"));
    v10 = objc_claimAutoreleasedReturnValue();
    trackingAreaCode = v5->_trackingAreaCode;
    v5->_trackingAreaCode = (NSString *)v10;

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
  -[NEPrivateLTENetwork mobileCountryCode](self, "mobileCountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PLTEMCC"));

  -[NEPrivateLTENetwork mobileNetworkCode](self, "mobileNetworkCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("PLTEMNC"));

  -[NEPrivateLTENetwork trackingAreaCode](self, "trackingAreaCode");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("PLTETAC"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NEPrivateLTENetwork *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[NEPrivateLTENetwork init](+[NEPrivateLTENetwork allocWithZone:](NEPrivateLTENetwork, "allocWithZone:", a3), "init");
  -[NEPrivateLTENetwork mobileCountryCode](self, "mobileCountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEPrivateLTENetwork setMobileCountryCode:](v4, "setMobileCountryCode:", v5);

  -[NEPrivateLTENetwork mobileNetworkCode](self, "mobileNetworkCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEPrivateLTENetwork setMobileNetworkCode:](v4, "setMobileNetworkCode:", v6);

  -[NEPrivateLTENetwork trackingAreaCode](self, "trackingAreaCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEPrivateLTENetwork setTrackingAreaCode:](v4, "setTrackingAreaCode:", v7);

  return v4;
}

- (NSString)mobileCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMobileCountryCode:(NSString *)mobileCountryCode
{
  objc_setProperty_atomic_copy(self, a2, mobileCountryCode, 8);
}

- (NSString)mobileNetworkCode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMobileNetworkCode:(NSString *)mobileNetworkCode
{
  objc_setProperty_atomic_copy(self, a2, mobileNetworkCode, 16);
}

- (NSString)trackingAreaCode
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTrackingAreaCode:(NSString *)trackingAreaCode
{
  objc_setProperty_atomic_copy(self, a2, trackingAreaCode, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingAreaCode, 0);
  objc_storeStrong((id *)&self->_mobileNetworkCode, 0);
  objc_storeStrong((id *)&self->_mobileCountryCode, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
