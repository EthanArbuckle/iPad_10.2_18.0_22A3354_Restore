@implementation MPCPlaybackDelegationProperties

- (MPCPlaybackDelegationProperties)initWithStoreAccountID:(unint64_t)a3 deviceGUID:(id)a4
{
  id v6;
  MPCPlaybackDelegationProperties *v7;
  MPCPlaybackDelegationProperties *v8;
  uint64_t v9;
  NSString *deviceGUID;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCPlaybackDelegationProperties;
  v7 = -[MPCPlaybackDelegationProperties init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_storeAccountID = a3;
    v9 = objc_msgSend(v6, "copy");
    deviceGUID = v8->_deviceGUID;
    v8->_deviceGUID = (NSString *)v9;

  }
  return v8;
}

- (MPCPlaybackDelegationProperties)initWithCoder:(id)a3
{
  id v4;
  MPCPlaybackDelegationProperties *v5;
  uint64_t v6;
  NSString *deviceGUID;
  uint64_t v8;
  NSString *deviceName;
  uint64_t v10;
  NSString *requestUserAgent;
  uint64_t v12;
  NSTimeZone *timeZone;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPCPlaybackDelegationProperties;
  v5 = -[MPCPlaybackDelegationProperties init](&v15, sel_init);
  if (v5)
  {
    v5->_storeAccountID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("storeAccountID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceGUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceGUID = v5->_deviceGUID;
    v5->_deviceGUID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestUserAgent"));
    v10 = objc_claimAutoreleasedReturnValue();
    requestUserAgent = v5->_requestUserAgent;
    v5->_requestUserAgent = (NSString *)v10;

    v5->_systemReleaseType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("systemReleaseType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v12 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t storeAccountID;
  id v5;

  storeAccountID = self->_storeAccountID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", storeAccountID, CFSTR("storeAccountID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceGUID, CFSTR("deviceGUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceName, CFSTR("deviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestUserAgent, CFSTR("requestUserAgent"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_systemReleaseType, CFSTR("systemReleaseType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("timeZone"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MPCPlaybackDelegationProperties _copyWithClass:zone:](self, "_copyWithClass:zone:", objc_opt_class(), a3);
}

- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4
{
  objc_class *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = -[objc_class initWithStoreAccountID:deviceGUID:](-[objc_class allocWithZone:](a3, "allocWithZone:", a4), "initWithStoreAccountID:deviceGUID:", self->_storeAccountID, self->_deviceGUID);
  if (v6)
  {
    v7 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a4);
    v8 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v7;

    v9 = -[NSString copyWithZone:](self->_requestUserAgent, "copyWithZone:", a4);
    v10 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v9;

    *((_QWORD *)v6 + 3) = self->_systemReleaseType;
    v11 = -[NSTimeZone copyWithZone:](self->_timeZone, "copyWithZone:", a4);
    v12 = (void *)*((_QWORD *)v6 + 6);
    *((_QWORD *)v6 + 6) = v11;

  }
  return v6;
}

- (unint64_t)storeAccountID
{
  return self->_storeAccountID;
}

- (NSString)deviceGUID
{
  return self->_deviceGUID;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (int64_t)systemReleaseType
{
  return self->_systemReleaseType;
}

- (NSString)requestUserAgent
{
  return self->_requestUserAgent;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_requestUserAgent, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mpc_jsonValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[MPCPlaybackDelegationProperties storeAccountID](self, "storeAccountID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("accountID"));

  -[MPCPlaybackDelegationProperties deviceGUID](self, "deviceGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceGUID"));

  -[MPCPlaybackDelegationProperties deviceName](self, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[MPCPlaybackDelegationProperties systemReleaseType](self, "systemReleaseType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("systemType"));

  -[MPCPlaybackDelegationProperties requestUserAgent](self, "requestUserAgent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("requestUserAgent"));

  -[MPCPlaybackDelegationProperties timeZone](self, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("timeZone"));

  return v3;
}

+ (id)payloadValueFromJSONValue:(id)a3
{
  id v3;
  MPCMutablePlaybackDelegationProperties *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  MPCMutablePlaybackDelegationProperties *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3)
  {
    v3 = a3;
    v4 = [MPCMutablePlaybackDelegationProperties alloc];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accountID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceGUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MPCPlaybackDelegationProperties initWithStoreAccountID:deviceGUID:](v4, "initWithStoreAccountID:deviceGUID:", v6, v7);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCMutablePlaybackDelegationProperties setDeviceName:](v8, "setDeviceName:", v9);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("systemType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCMutablePlaybackDelegationProperties setSystemReleaseType:](v8, "setSystemReleaseType:", objc_msgSend(v10, "integerValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("requestUserAgent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCMutablePlaybackDelegationProperties setRequestUserAgent:](v8, "setRequestUserAgent:", v11);

    v12 = (void *)MEMORY[0x24BDBCF38];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timeZone"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "timeZoneWithName:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCMutablePlaybackDelegationProperties setTimeZone:](v8, "setTimeZone:", v14);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
