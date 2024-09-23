@implementation OTJoiningConfiguration

- (OTJoiningConfiguration)initWithProtocolType:(id)a3 uniqueDeviceID:(id)a4 uniqueClientID:(id)a5 pairingUUID:(id)a6 epoch:(unint64_t)a7 isInitiator:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  OTJoiningConfiguration *v18;
  OTJoiningConfiguration *v19;
  objc_super v21;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)OTJoiningConfiguration;
  v18 = -[OTJoiningConfiguration init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    -[OTJoiningConfiguration setProtocolType:](v18, "setProtocolType:", v14);
    -[OTJoiningConfiguration setUniqueDeviceID:](v19, "setUniqueDeviceID:", v15);
    -[OTJoiningConfiguration setUniqueClientID:](v19, "setUniqueClientID:", v16);
    -[OTJoiningConfiguration setIsInitiator:](v19, "setIsInitiator:", v8);
    -[OTJoiningConfiguration setPairingUUID:](v19, "setPairingUUID:", v17);
    -[OTJoiningConfiguration setEpoch:](v19, "setEpoch:", a7);
    -[OTJoiningConfiguration setTestsEnabled:](v19, "setTestsEnabled:", 0);
    v19->_timeout = 0;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *protocolType;
  id v5;

  protocolType = self->_protocolType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", protocolType, CFSTR("protocolType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueClientID, CFSTR("uniqueClientID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueDeviceID, CFSTR("uniqueDeviceID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isInitiator, CFSTR("isInitiator"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pairingUUID, CFSTR("pairingUUID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_epoch, CFSTR("epoch"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_timeout, CFSTR("timeout"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_testsEnabled, CFSTR("testsEnabled"));

}

- (OTJoiningConfiguration)initWithCoder:(id)a3
{
  id v4;
  OTJoiningConfiguration *v5;
  uint64_t v6;
  NSString *protocolType;
  uint64_t v8;
  NSString *uniqueClientID;
  uint64_t v10;
  NSString *uniqueDeviceID;
  uint64_t v12;
  NSString *pairingUUID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)OTJoiningConfiguration;
  v5 = -[OTJoiningConfiguration init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protocolType"));
    v6 = objc_claimAutoreleasedReturnValue();
    protocolType = v5->_protocolType;
    v5->_protocolType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueClientID"));
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueClientID = v5->_uniqueClientID;
    v5->_uniqueClientID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueDeviceID"));
    v10 = objc_claimAutoreleasedReturnValue();
    uniqueDeviceID = v5->_uniqueDeviceID;
    v5->_uniqueDeviceID = (NSString *)v10;

    v5->_isInitiator = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isInitiator"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingUUID"));
    v12 = objc_claimAutoreleasedReturnValue();
    pairingUUID = v5->_pairingUUID;
    v5->_pairingUUID = (NSString *)v12;

    v5->_epoch = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("epoch"));
    v5->_timeout = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("timeout"));
    v5->_testsEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("testsEnabled"));
  }

  return v5;
}

- (void)enableForTests
{
  -[OTJoiningConfiguration setTestsEnabled:](self, "setTestsEnabled:", 1);
}

- (NSString)protocolType
{
  return self->_protocolType;
}

- (void)setProtocolType:(id)a3
{
  objc_storeStrong((id *)&self->_protocolType, a3);
}

- (NSString)uniqueDeviceID
{
  return self->_uniqueDeviceID;
}

- (void)setUniqueDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueDeviceID, a3);
}

- (NSString)uniqueClientID
{
  return self->_uniqueClientID;
}

- (void)setUniqueClientID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueClientID, a3);
}

- (NSString)pairingUUID
{
  return self->_pairingUUID;
}

- (void)setPairingUUID:(id)a3
{
  objc_storeStrong((id *)&self->_pairingUUID, a3);
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (void)setEpoch:(unint64_t)a3
{
  self->_epoch = a3;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (void)setIsInitiator:(BOOL)a3
{
  self->_isInitiator = a3;
}

- (BOOL)testsEnabled
{
  return self->_testsEnabled;
}

- (void)setTestsEnabled:(BOOL)a3
{
  self->_testsEnabled = a3;
}

- (int64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(int64_t)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingUUID, 0);
  objc_storeStrong((id *)&self->_uniqueClientID, 0);
  objc_storeStrong((id *)&self->_uniqueDeviceID, 0);
  objc_storeStrong((id *)&self->_protocolType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
