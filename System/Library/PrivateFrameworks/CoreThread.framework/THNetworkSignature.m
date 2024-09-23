@implementation THNetworkSignature

- (THNetworkSignature)initWithSignatures:(id)a3 ipv6NwSignature:(id)a4 wifSSID:(id)a5 wifiPassword:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  THNetworkSignature *v14;
  uint64_t v15;
  NSData *ipv4NwSignature;
  uint64_t v17;
  NSData *ipv6NwSignature;
  uint64_t v19;
  NSString *wifiSSID;
  uint64_t v21;
  NSString *wifiPassword;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)THNetworkSignature;
  v14 = -[THNetworkSignature init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    ipv4NwSignature = v14->_ipv4NwSignature;
    v14->_ipv4NwSignature = (NSData *)v15;

    v17 = objc_msgSend(v11, "copy");
    ipv6NwSignature = v14->_ipv6NwSignature;
    v14->_ipv6NwSignature = (NSData *)v17;

    v19 = objc_msgSend(v12, "copy");
    wifiSSID = v14->_wifiSSID;
    v14->_wifiSSID = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    wifiPassword = v14->_wifiPassword;
    v14->_wifiPassword = (NSString *)v21;

  }
  return v14;
}

- (id)initSignaturesWithArrays:(char *)a3 ipv4BytesLen:(int)a4 ipv6Bytes:(char *)a5 ipv6BytesLen:(int)a6 wifSSID:(id)a7 wifiPassword:(id)a8
{
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  THNetworkSignature *v20;

  v14 = a7;
  v15 = a8;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a5, a6);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v16)
    v19 = v17 == 0;
  else
    v19 = 1;
  if (v19)
  {
    v20 = 0;
  }
  else
  {
    self = -[THNetworkSignature initWithSignatures:ipv6NwSignature:wifSSID:wifiPassword:](self, "initWithSignatures:ipv6NwSignature:wifSSID:wifiPassword:", v16, v17, v14, v15);
    v20 = self;
  }

  return v20;
}

- (THNetworkSignature)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  THNetworkSignature *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ipv4"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ipv6"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ssid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passwd"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[THNetworkSignature initWithSignatures:ipv6NwSignature:wifSSID:wifiPassword:](self, "initWithSignatures:ipv6NwSignature:wifSSID:wifiPassword:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[THNetworkSignature ipv4NwSignature](self, "ipv4NwSignature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ipv4"));

  -[THNetworkSignature ipv6NwSignature](self, "ipv6NwSignature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ipv6"));

  -[THNetworkSignature wifiSSID](self, "wifiSSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ssid"));

  -[THNetworkSignature wifiPassword](self, "wifiPassword");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("passwd"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)ipv4NwSignature
{
  return self->_ipv4NwSignature;
}

- (NSData)ipv6NwSignature
{
  return self->_ipv6NwSignature;
}

- (NSString)wifiSSID
{
  return self->_wifiSSID;
}

- (NSString)wifiPassword
{
  return self->_wifiPassword;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiPassword, 0);
  objc_storeStrong((id *)&self->_wifiSSID, 0);
  objc_storeStrong((id *)&self->_ipv6NwSignature, 0);
  objc_storeStrong((id *)&self->_ipv4NwSignature, 0);
}

@end
