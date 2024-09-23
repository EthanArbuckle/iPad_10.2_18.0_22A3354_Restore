@implementation HAP2AccessoryServerDiscoveryAccessoryInfo

- (HAP2AccessoryServerDiscoveryAccessoryInfo)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HAP2AccessoryServerDiscoveryAccessoryInfo)initWithDeviceID:(id)a3 rawDiscoveryInfo:(id)a4
{
  id v7;
  id v8;
  HAP2AccessoryServerDiscoveryAccessoryInfo *v9;
  HAP2AccessoryServerDiscoveryAccessoryInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAP2AccessoryServerDiscoveryAccessoryInfo;
  v9 = -[HAP2AccessoryServerDiscoveryAccessoryInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceID, a3);
    objc_storeStrong((id *)&v10->_rawDiscoveryInfo, a4);
  }

  return v10;
}

- (NSString)airPlayDeviceUUIDString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  -[HAP2AccessoryServerDiscoveryAccessoryInfo rawDiscoveryInfo](self, "rawDiscoveryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bonjourTXTRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("psi"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (HAPDeviceID)deviceID
{
  return self->_deviceID;
}

- (NSDictionary)rawDiscoveryInfo
{
  return self->_rawDiscoveryInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawDiscoveryInfo, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

+ (id)new
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

@end
