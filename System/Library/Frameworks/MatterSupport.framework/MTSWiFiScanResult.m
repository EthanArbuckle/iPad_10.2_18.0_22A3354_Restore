@implementation MTSWiFiScanResult

- (MTSWiFiScanResult)initWithSSID:(id)a3 rssi:(id)a4 security:(unsigned __int8)a5 band:(unsigned __int8)a6
{
  id v10;
  id v11;
  void *v12;
  MTSWiFiScanResult *v13;
  uint64_t v14;
  NSData *ssid;
  MTSWiFiScanResult *v17;
  SEL v18;
  _NSZone *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_7:
    v17 = (MTSWiFiScanResult *)_HMFPreconditionFailure();
    return (MTSWiFiScanResult *)-[MTSWiFiScanResult copyWithZone:](v17, v18, v19);
  }
  v20.receiver = self;
  v20.super_class = (Class)MTSWiFiScanResult;
  v13 = -[MTSWiFiScanResult init](&v20, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    ssid = v13->_ssid;
    v13->_ssid = (NSData *)v14;

    objc_storeStrong((id *)&v13->_rssi, a4);
    v13->_security = a5;
    v13->_band = a6;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[MTSWiFiScanResult ssid](self, "ssid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ssid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[MTSWiFiScanResult rssi](self, "rssi");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rssi");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10)
        && (v11 = -[MTSWiFiScanResult security](self, "security"), v11 == objc_msgSend(v6, "security")))
      {
        v12 = -[MTSWiFiScanResult band](self, "band");
        v13 = v12 == objc_msgSend(v6, "band");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[MTSWiFiScanResult ssid](self, "ssid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MTSWiFiScanResult rssi](self, "rssi");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[MTSWiFiScanResult security](self, "security"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[MTSWiFiScanResult band](self, "band"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (MTSWiFiScanResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  void *v12;
  MTSWiFiScanResult *v13;
  MTSWiFiScanResult *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSWSR.ck.ssid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSWSR.ck.rssi"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MTSWSR.ck.security"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MTSWSR.ck.band"));
  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = (void *)MEMORY[0x23493F978](v8);
    v13 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v12;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_2344FE000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded ssid: %@, rssi: %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = 0;
  }
  else
  {
    v13 = -[MTSWiFiScanResult initWithSSID:rssi:security:band:](self, "initWithSSID:rssi:security:band:", v5, v6, v7, v8);
    v14 = v13;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MTSWiFiScanResult ssid](self, "ssid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("MTSWSR.ck.ssid"));

  -[MTSWiFiScanResult rssi](self, "rssi");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("MTSWSR.ck.rssi"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[MTSWiFiScanResult security](self, "security"), CFSTR("MTSWSR.ck.security"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[MTSWiFiScanResult band](self, "band"), CFSTR("MTSWSR.ck.band"));

}

- (NSData)ssid
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)rssi
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (unsigned)security
{
  return self->_security;
}

- (unsigned)band
{
  return self->_band;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
