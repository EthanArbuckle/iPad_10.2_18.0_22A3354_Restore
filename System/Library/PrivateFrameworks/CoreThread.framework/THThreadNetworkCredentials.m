@implementation THThreadNetworkCredentials

- (THThreadNetworkCredentials)init
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  return -[THThreadNetworkCredentials initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:](self, "initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:", 0, 0, 0, 255, 0, 0, 0, v3);
}

- (THThreadNetworkCredentials)initWithMasterKey:(id)a3 passPhrase:(id)a4 PSKc:(id)a5 channel:(unsigned __int8)a6 PANID:(id)a7 userInfo:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[THThreadNetworkCredentials initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:](self, "initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:", a3, a4, a5, a6, a7, a8, 0, v9);
}

- (THThreadNetworkCredentials)initWithMasterKey:(id)a3 passPhrase:(id)a4 PSKc:(id)a5 channel:(unsigned __int8)a6 PANID:(id)a7 userInfo:(id)a8 credentialDataSet:(id)a9 isActiveDevice:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  THThreadNetworkCredentials *v19;
  THThreadNetworkCredentials *v20;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v16 = a3;
  v25 = a4;
  v24 = a5;
  v23 = a7;
  v17 = a8;
  v18 = a9;
  v26.receiver = self;
  v26.super_class = (Class)THThreadNetworkCredentials;
  v19 = -[THThreadNetworkCredentials init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_masterKey, a3);
    objc_storeStrong((id *)&v20->_passPhrase, a4);
    objc_storeStrong((id *)&v20->_PSKc, a5);
    v20->_channel = a6;
    objc_storeStrong((id *)&v20->_PANID, a7);
    objc_storeStrong((id *)&v20->_userInfo, a8);
    objc_storeStrong((id *)&v20->_credentialsDataSet, a9);
    v20->_isActiveDevice = a10;
  }

  return v20;
}

- (THThreadNetworkCredentials)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  unsigned __int8 v13;
  THThreadNetworkCredentials *v14;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mk"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("psk"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ch"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("panid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("info"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dscreds"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("active"));

  if (v8)
    v13 = objc_msgSend(v8, "charValue");
  else
    v13 = -1;
  LOBYTE(v16) = v12;
  v14 = -[THThreadNetworkCredentials initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:](self, "initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:", v5, v7, v6, v13, v9, v10, v11, v16);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[THThreadNetworkCredentials masterKey](self, "masterKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("mk"));

  -[THThreadNetworkCredentials PSKc](self, "PSKc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("psk"));

  -[THThreadNetworkCredentials passPhrase](self, "passPhrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("pp"));

  if (-[THThreadNetworkCredentials channel](self, "channel") == 255)
  {
    objc_msgSend(v11, "encodeObject:forKey:", 0, CFSTR("ch"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[THThreadNetworkCredentials channel](self, "channel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("ch"));

  }
  -[THThreadNetworkCredentials PANID](self, "PANID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("panid"));

  -[THThreadNetworkCredentials userInfo](self, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("info"));

  -[THThreadNetworkCredentials credentialsDataSet](self, "credentialsDataSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("dscreds"));

  objc_msgSend(v11, "encodeBool:forKey:", -[THThreadNetworkCredentials isActiveDevice](self, "isActiveDevice"), CFSTR("active"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)masterKey
{
  return self->_masterKey;
}

- (void)setMasterKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)passPhrase
{
  return self->_passPhrase;
}

- (void)setPassPhrase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)PSKc
{
  return self->_PSKc;
}

- (void)setPSKc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unsigned)channel
{
  return self->_channel;
}

- (void)setChannel:(unsigned __int8)a3
{
  self->_channel = a3;
}

- (NSData)PANID
{
  return self->_PANID;
}

- (void)setPANID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (THThreadNetworkCredentialsDataSet)credentialsDataSet
{
  return self->_credentialsDataSet;
}

- (void)setCredentialsDataSet:(id)a3
{
  objc_storeStrong((id *)&self->_credentialsDataSet, a3);
}

- (BOOL)isActiveDevice
{
  return self->_isActiveDevice;
}

- (void)setIsActiveDevice:(BOOL)a3
{
  self->_isActiveDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialsDataSet, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_PANID, 0);
  objc_storeStrong((id *)&self->_PSKc, 0);
  objc_storeStrong((id *)&self->_passPhrase, 0);
  objc_storeStrong((id *)&self->_masterKey, 0);
}

@end
