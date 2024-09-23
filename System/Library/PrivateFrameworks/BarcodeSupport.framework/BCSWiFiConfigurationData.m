@implementation BCSWiFiConfigurationData

- (BCSWiFiConfigurationData)initWithSSID:(id)a3 isWEP:(BOOL)a4 password:(id)a5 isHidden:(BOOL)a6
{
  id v10;
  id v11;
  BCSWiFiConfigurationData *v12;
  uint64_t v13;
  NSString *ssid;
  uint64_t v15;
  NSString *password;
  BCSWiFiConfigurationData *v17;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BCSWiFiConfigurationData;
  v12 = -[BCSWiFiConfigurationData init](&v19, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    ssid = v12->_ssid;
    v12->_ssid = (NSString *)v13;

    v12->_WEP = a4;
    v15 = objc_msgSend(v11, "copy");
    password = v12->_password;
    v12->_password = (NSString *)v15;

    v12->_hidden = a6;
    v17 = v12;
  }

  return v12;
}

- (int64_t)type
{
  return 8;
}

- (NSString)extraPreviewText
{
  return 0;
}

- (BCSWiFiConfigurationData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BCSWiFiConfigurationData *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ssid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isWEP"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("password"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isHidden"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = -[BCSWiFiConfigurationData initWithSSID:isWEP:password:isHidden:](self, "initWithSSID:isWEP:password:isHidden:", v5, v7, v8, v10);
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("airplayBrokerID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSWiFiConfigurationData setAirplayBrokerID:](v11, "setAirplayBrokerID:", v12);

  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("airplayBrokerPin"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSWiFiConfigurationData setAirplayBrokerPin:](v11, "setAirplayBrokerPin:", v13);

  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("captivePortalToken"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[BCSWiFiConfigurationData setCaptivePortalToken:](v11, "setCaptivePortalToken:", v14);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  NSString *airplayBrokerID;
  NSString *airplayBrokerPin;
  NSString *captivePortalToken;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeObject:forKey:", self->_ssid, CFSTR("ssid"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_WEP);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("isWEP"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_password, CFSTR("password"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hidden);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("isHidden"));

  airplayBrokerID = self->_airplayBrokerID;
  if (airplayBrokerID)
    objc_msgSend(v10, "encodeObject:forKey:", airplayBrokerID, CFSTR("airplayBrokerID"));
  airplayBrokerPin = self->_airplayBrokerPin;
  if (airplayBrokerPin)
    objc_msgSend(v10, "encodeObject:forKey:", airplayBrokerPin, CFSTR("airplayBrokerPin"));
  captivePortalToken = self->_captivePortalToken;
  v9 = v10;
  if (captivePortalToken)
  {
    objc_msgSend(v10, "encodeObject:forKey:", captivePortalToken, CFSTR("captivePortalToken"));
    v9 = v10;
  }

}

- (BOOL)hasAirplayPayload
{
  return self->_airplayBrokerID && self->_airplayBrokerPin != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (BOOL)isWEP
{
  return self->_WEP;
}

- (NSString)password
{
  return self->_password;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (NSString)airplayBrokerID
{
  return self->_airplayBrokerID;
}

- (void)setAirplayBrokerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)airplayBrokerPin
{
  return self->_airplayBrokerPin;
}

- (void)setAirplayBrokerPin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)captivePortalToken
{
  return self->_captivePortalToken;
}

- (void)setCaptivePortalToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captivePortalToken, 0);
  objc_storeStrong((id *)&self->_airplayBrokerPin, 0);
  objc_storeStrong((id *)&self->_airplayBrokerID, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end
