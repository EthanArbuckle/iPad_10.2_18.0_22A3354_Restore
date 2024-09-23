@implementation ENAppConfiguration

- (ENAppConfiguration)initWithRegion:(id)a3 andAppConfigInfo:(id)a4
{
  id v6;
  id v7;
  ENAppConfiguration *v8;
  ENAppConfiguration *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ENAppConfiguration;
  v8 = -[ENAppConfiguration init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ENAppConfiguration setRegionID:](v8, "setRegionID:", v6);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("appBundleId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAppConfiguration setAppID:](v9, "setAppID:", v10);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("publicKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAppConfiguration setPublicKey:](v9, "setPublicKey:", v11);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("publicKeyVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAppConfiguration setPublicKeyVersion:](v9, "setPublicKeyVersion:", v12);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("exposureMatching"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAppConfiguration setExposureMatching:](v9, "setExposureMatching:", objc_msgSend(v13, "BOOLValue"));

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("maxMatchingAttempts"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAppConfiguration setMaxMatchingAttempts:](v9, "setMaxMatchingAttempts:", objc_msgSend(v14, "integerValue"));

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("maxTtkMatchAttempt"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAppConfiguration setMaxTtkMatchAttempt:](v9, "setMaxTtkMatchAttempt:", objc_msgSend(v15, "integerValue"));

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("maxTtkMatchAttemptPerDay"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAppConfiguration setMaxTtkMatchAttemptPerDay:](v9, "setMaxTtkMatchAttemptPerDay:", objc_msgSend(v16, "integerValue"));

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("callbackIntervalInMin"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    -[ENAppConfiguration setCallbackIntervalInMin:](v9, "setCallbackIntervalInMin:");

    objc_msgSend(MEMORY[0x1E0C99D60], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSince1970");
    -[ENAppConfiguration setLastCachedEpochTimeInterval:](v9, "setLastCachedEpochTimeInterval:");

  }
  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3938];
  -[ENAppConfiguration regionID](self, "regionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAppConfiguration appID](self, "appID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAppConfiguration publicKey](self, "publicKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAppConfiguration publicKeyVersion](self, "publicKeyVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ENAppConfiguration exposureMatching](self, "exposureMatching");
  v9 = -[ENAppConfiguration maxMatchingAttempts](self, "maxMatchingAttempts");
  v10 = -[ENAppConfiguration maxTtkMatchAttempt](self, "maxTtkMatchAttempt");
  v11 = -[ENAppConfiguration maxTtkMatchAttemptPerDay](self, "maxTtkMatchAttemptPerDay");
  -[ENAppConfiguration callbackIntervalInMin](self, "callbackIntervalInMin");
  v13 = v12;
  -[ENAppConfiguration lastCachedEpochTimeInterval](self, "lastCachedEpochTimeInterval");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ENAppConfiguration - RegionID: %@, App ID: %@, Public Key: %@, Public Key Version: %@, exposureMatching: %i, maxMatchingAttempts: %ld, maxTtkMatchAttempt: %ld, maxTtkMatchAttemptPerDay: %ld, callbackIntervalInMin: %f, lastCachedEpochTimeInterval: %f"), v4, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)appConfigurationForRegion:(id)a3 withInfo:(id)a4
{
  id v5;
  id v6;
  ENAppConfiguration *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ENAppConfiguration initWithRegion:andAppConfigInfo:]([ENAppConfiguration alloc], "initWithRegion:andAppConfigInfo:", v6, v5);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ENAppConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[ENAppConfiguration init](+[ENAppConfiguration allocWithZone:](ENAppConfiguration, "allocWithZone:", a3), "init");
  -[ENAppConfiguration appID](self, "appID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAppConfiguration setAppID:](v4, "setAppID:", v5);

  -[ENAppConfiguration regionID](self, "regionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAppConfiguration setRegionID:](v4, "setRegionID:", v6);

  -[ENAppConfiguration publicKey](self, "publicKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAppConfiguration setPublicKey:](v4, "setPublicKey:", v7);

  -[ENAppConfiguration publicKeyVersion](self, "publicKeyVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAppConfiguration setPublicKeyVersion:](v4, "setPublicKeyVersion:", v8);

  -[ENAppConfiguration setExposureMatching:](v4, "setExposureMatching:", -[ENAppConfiguration exposureMatching](self, "exposureMatching"));
  -[ENAppConfiguration setMaxMatchingAttempts:](v4, "setMaxMatchingAttempts:", -[ENAppConfiguration maxMatchingAttempts](self, "maxMatchingAttempts"));
  -[ENAppConfiguration setMaxTtkMatchAttempt:](v4, "setMaxTtkMatchAttempt:", -[ENAppConfiguration maxTtkMatchAttempt](self, "maxTtkMatchAttempt"));
  -[ENAppConfiguration setMaxTtkMatchAttemptPerDay:](v4, "setMaxTtkMatchAttemptPerDay:", -[ENAppConfiguration maxTtkMatchAttemptPerDay](self, "maxTtkMatchAttemptPerDay"));
  -[ENAppConfiguration callbackIntervalInMin](self, "callbackIntervalInMin");
  -[ENAppConfiguration setCallbackIntervalInMin:](v4, "setCallbackIntervalInMin:");
  -[ENAppConfiguration lastCachedEpochTimeInterval](self, "lastCachedEpochTimeInterval");
  -[ENAppConfiguration setLastCachedEpochTimeInterval:](v4, "setLastCachedEpochTimeInterval:");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  int64_t v15;
  void *v16;
  int64_t v17;
  void *v18;
  int64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  id v26;

  v4 = a3;
  -[ENAppConfiguration appID](self, "appID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_appID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[ENAppConfiguration regionID](self, "regionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_regionID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[ENAppConfiguration publicKey](self, "publicKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_publicKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[ENAppConfiguration publicKeyVersion](self, "publicKeyVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_publicKeyVersion);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  v13 = -[ENAppConfiguration exposureMatching](self, "exposureMatching");
  NSStringFromSelector(sel_exposureMatching);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v13, v14);

  v15 = -[ENAppConfiguration maxMatchingAttempts](self, "maxMatchingAttempts");
  NSStringFromSelector(sel_maxMatchingAttempts);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v15, v16);

  v17 = -[ENAppConfiguration maxTtkMatchAttempt](self, "maxTtkMatchAttempt");
  NSStringFromSelector(sel_maxTtkMatchAttempt);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v17, v18);

  v19 = -[ENAppConfiguration maxTtkMatchAttemptPerDay](self, "maxTtkMatchAttemptPerDay");
  NSStringFromSelector(sel_maxTtkMatchAttemptPerDay);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v19, v20);

  -[ENAppConfiguration callbackIntervalInMin](self, "callbackIntervalInMin");
  v22 = v21;
  NSStringFromSelector(sel_callbackIntervalInMin);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v23, v22);

  -[ENAppConfiguration lastCachedEpochTimeInterval](self, "lastCachedEpochTimeInterval");
  v25 = v24;
  NSStringFromSelector(sel_lastCachedEpochTimeInterval);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v26, v25);

}

- (ENAppConfiguration)initWithCoder:(id)a3
{
  id v3;
  ENAppConfiguration *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)ENAppConfiguration;
  v3 = a3;
  v4 = -[ENAppConfiguration init](&v26, sel_init);
  v5 = objc_opt_class();
  NSStringFromSelector(sel_appID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v5, v6, v26.receiver, v26.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAppConfiguration setAppID:](v4, "setAppID:", v7);

  v8 = objc_opt_class();
  NSStringFromSelector(sel_regionID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAppConfiguration setRegionID:](v4, "setRegionID:", v10);

  v11 = objc_opt_class();
  NSStringFromSelector(sel_publicKey);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAppConfiguration setPublicKey:](v4, "setPublicKey:", v13);

  v14 = objc_opt_class();
  NSStringFromSelector(sel_publicKeyVersion);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAppConfiguration setPublicKeyVersion:](v4, "setPublicKeyVersion:", v16);

  NSStringFromSelector(sel_exposureMatching);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAppConfiguration setExposureMatching:](v4, "setExposureMatching:", objc_msgSend(v3, "decodeBoolForKey:", v17));

  NSStringFromSelector(sel_maxMatchingAttempts);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAppConfiguration setMaxMatchingAttempts:](v4, "setMaxMatchingAttempts:", objc_msgSend(v3, "decodeIntegerForKey:", v18));

  NSStringFromSelector(sel_maxTtkMatchAttempt);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAppConfiguration setMaxTtkMatchAttempt:](v4, "setMaxTtkMatchAttempt:", objc_msgSend(v3, "decodeIntegerForKey:", v19));

  NSStringFromSelector(sel_maxTtkMatchAttemptPerDay);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENAppConfiguration setMaxTtkMatchAttemptPerDay:](v4, "setMaxTtkMatchAttemptPerDay:", objc_msgSend(v3, "decodeIntegerForKey:", v20));

  NSStringFromSelector(sel_callbackIntervalInMin);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeDoubleForKey:", v21);
  -[ENAppConfiguration setCallbackIntervalInMin:](v4, "setCallbackIntervalInMin:");

  NSStringFromSelector(sel_lastCachedEpochTimeInterval);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeDoubleForKey:", v22);
  v24 = v23;

  -[ENAppConfiguration setLastCachedEpochTimeInterval:](v4, "setLastCachedEpochTimeInterval:", v24);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)regionID
{
  return self->_regionID;
}

- (void)setRegionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)publicKeyVersion
{
  return self->_publicKeyVersion;
}

- (void)setPublicKeyVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)exposureMatching
{
  return self->_exposureMatching;
}

- (void)setExposureMatching:(BOOL)a3
{
  self->_exposureMatching = a3;
}

- (int64_t)maxMatchingAttempts
{
  return self->_maxMatchingAttempts;
}

- (void)setMaxMatchingAttempts:(int64_t)a3
{
  self->_maxMatchingAttempts = a3;
}

- (int64_t)maxTtkMatchAttempt
{
  return self->_maxTtkMatchAttempt;
}

- (void)setMaxTtkMatchAttempt:(int64_t)a3
{
  self->_maxTtkMatchAttempt = a3;
}

- (int64_t)maxTtkMatchAttemptPerDay
{
  return self->_maxTtkMatchAttemptPerDay;
}

- (void)setMaxTtkMatchAttemptPerDay:(int64_t)a3
{
  self->_maxTtkMatchAttemptPerDay = a3;
}

- (double)callbackIntervalInMin
{
  return self->_callbackIntervalInMin;
}

- (void)setCallbackIntervalInMin:(double)a3
{
  self->_callbackIntervalInMin = a3;
}

- (double)lastCachedEpochTimeInterval
{
  return self->_lastCachedEpochTimeInterval;
}

- (void)setLastCachedEpochTimeInterval:(double)a3
{
  self->_lastCachedEpochTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyVersion, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_regionID, 0);
  objc_storeStrong((id *)&self->_appID, 0);
}

@end
