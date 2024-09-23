@implementation HAPBLEPeripheralInfo

- (HAPBLEPeripheralInfo)initWithPeripheralInfo:(id)a3 advertisedProtocolVersion:(unint64_t)a4 previousProtocolVersion:(int64_t)a5 resumeSessionId:(unint64_t)a6 lastSeen:(double)a7 statusFlags:(id)a8 stateNumber:(id)a9 configNumber:(id)a10 categoryIdentifier:(id)a11 accessoryName:(id)a12
{
  id v18;
  id v19;
  HAPBLEPeripheralInfo *v20;
  HAPBLEPeripheralInfo *v21;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v27 = a8;
  v26 = a9;
  v25 = a10;
  v18 = a11;
  v19 = a12;
  v29.receiver = self;
  v29.super_class = (Class)HAPBLEPeripheralInfo;
  v20 = -[HAPBLEPeripheralInfo init](&v29, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_peripheralUUID, a3);
    v21->_advertisedProtocolVersion = a4;
    v21->_previousProtocolVersion = a5;
    v21->_resumeSessionId = a6;
    v21->_lastSeen = a7;
    objc_storeStrong((id *)&v21->_statusFlags, a8);
    objc_storeStrong((id *)&v21->_stateNumber, a9);
    objc_storeStrong((id *)&v21->_configNumber, a10);
    objc_storeStrong((id *)&v21->_categoryIdentifier, a11);
    objc_storeStrong((id *)&v21->_accessoryName, a12);
  }

  return v21;
}

- (void)updateProtocolVersion:(unint64_t)a3
{
  if (-[HAPBLEPeripheralInfo advertisedProtocolVersion](self, "advertisedProtocolVersion") != a3)
  {
    -[HAPBLEPeripheralInfo setPreviousProtocolVersion:](self, "setPreviousProtocolVersion:", -[HAPBLEPeripheralInfo advertisedProtocolVersion](self, "advertisedProtocolVersion"));
    -[HAPBLEPeripheralInfo setAdvertisedProtocolVersion:](self, "setAdvertisedProtocolVersion:", a3);
  }
}

- (void)saveBroadcastKey:(id)a3 keyUpdatedStateNumber:(id)a4 updatedTime:(double)a5
{
  id v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  v8 = a4;
  -[HAPBLEPeripheralInfo broadcastKey](self, "broadcastKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v11, "isEqualToData:", v9);

  if ((v10 & 1) == 0)
  {
    -[HAPBLEPeripheralInfo setBroadcastKey:](self, "setBroadcastKey:", v11);
    if (a5 > 0.0)
      -[HAPBLEPeripheralInfo setKeyUpdatedTime:](self, "setKeyUpdatedTime:", a5);
    -[HAPBLEPeripheralInfo setKeyUpdatedStateNumber:](self, "setKeyUpdatedStateNumber:", v8);
  }

}

- (void)updateBroadcastKey:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[HAPBLEPeripheralInfo broadcastKey](self, "broadcastKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqualToData:", v4);

  if ((v5 & 1) == 0)
  {
    -[HAPBLEPeripheralInfo setBroadcastKey:](self, "setBroadcastKey:", v6);
    -[HAPBLEPeripheralInfo setKeyUpdatedTime:](self, "setKeyUpdatedTime:", CFAbsoluteTimeGetCurrent());
  }

}

- (void)updateAccessoryName:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "length");
  -[HAPBLEPeripheralInfo accessoryName](self, "accessoryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v4 > v6)
    -[HAPBLEPeripheralInfo setAccessoryName:](self, "setAccessoryName:", v7);

}

- (void)resetBroadcastKeyConfig
{
  -[HAPBLEPeripheralInfo setKeyUpdatedStateNumber:](self, "setKeyUpdatedStateNumber:", 0);
  -[HAPBLEPeripheralInfo setBroadcastKey:](self, "setBroadcastKey:", 0);
  -[HAPBLEPeripheralInfo setKeyUpdatedTime:](self, "setKeyUpdatedTime:", 0.0);
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
  id v12;

  v4 = a3;
  -[HAPBLEPeripheralInfo peripheralUUID](self, "peripheralUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PUUI"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HAPBLEPeripheralInfo advertisedProtocolVersion](self, "advertisedProtocolVersion"), CFSTR("PV"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HAPBLEPeripheralInfo previousProtocolVersion](self, "previousProtocolVersion"), CFSTR("PPV"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[HAPBLEPeripheralInfo resumeSessionId](self, "resumeSessionId"), CFSTR("RSI"));
  -[HAPBLEPeripheralInfo lastSeen](self, "lastSeen");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("LS"));
  -[HAPBLEPeripheralInfo statusFlags](self, "statusFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SF"));

  -[HAPBLEPeripheralInfo stateNumber](self, "stateNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("SN"));

  -[HAPBLEPeripheralInfo configNumber](self, "configNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("CF"));

  -[HAPBLEPeripheralInfo categoryIdentifier](self, "categoryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("CI"));

  -[HAPBLEPeripheralInfo accessoryName](self, "accessoryName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("AN"));

  -[HAPBLEPeripheralInfo broadcastKey](self, "broadcastKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("BK"));

  -[HAPBLEPeripheralInfo keyUpdatedTime](self, "keyUpdatedTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("BKUT"));
  -[HAPBLEPeripheralInfo keyUpdatedStateNumber](self, "keyUpdatedStateNumber");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("BKUSN"));

}

- (HAPBLEPeripheralInfo)initWithCoder:(id)a3
{
  id v4;
  HAPBLEPeripheralInfo *v5;
  uint64_t v6;
  NSUUID *peripheralUUID;
  double v8;
  uint64_t v9;
  NSNumber *statusFlags;
  uint64_t v11;
  NSNumber *stateNumber;
  uint64_t v13;
  NSNumber *configNumber;
  uint64_t v15;
  NSNumber *categoryIdentifier;
  uint64_t v17;
  NSString *accessoryName;
  uint64_t v19;
  NSData *broadcastKey;
  double v21;
  uint64_t v22;
  NSNumber *keyUpdatedStateNumber;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HAPBLEPeripheralInfo;
  v5 = -[HAPBLEPeripheralInfo init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PUUI"));
    v6 = objc_claimAutoreleasedReturnValue();
    peripheralUUID = v5->_peripheralUUID;
    v5->_peripheralUUID = (NSUUID *)v6;

    v5->_advertisedProtocolVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PV"));
    v5->_previousProtocolVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PPV"));
    v5->_resumeSessionId = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("RSI"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("LS"));
    v5->_lastSeen = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SF"));
    v9 = objc_claimAutoreleasedReturnValue();
    statusFlags = v5->_statusFlags;
    v5->_statusFlags = (NSNumber *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SN"));
    v11 = objc_claimAutoreleasedReturnValue();
    stateNumber = v5->_stateNumber;
    v5->_stateNumber = (NSNumber *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CF"));
    v13 = objc_claimAutoreleasedReturnValue();
    configNumber = v5->_configNumber;
    v5->_configNumber = (NSNumber *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CI"));
    v15 = objc_claimAutoreleasedReturnValue();
    categoryIdentifier = v5->_categoryIdentifier;
    v5->_categoryIdentifier = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AN"));
    v17 = objc_claimAutoreleasedReturnValue();
    accessoryName = v5->_accessoryName;
    v5->_accessoryName = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BK"));
    v19 = objc_claimAutoreleasedReturnValue();
    broadcastKey = v5->_broadcastKey;
    v5->_broadcastKey = (NSData *)v19;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BKUT"));
    v5->_keyUpdatedTime = v21;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BKUSN"));
    v22 = objc_claimAutoreleasedReturnValue();
    keyUpdatedStateNumber = v5->_keyUpdatedStateNumber;
    v5->_keyUpdatedStateNumber = (NSNumber *)v22;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HAPBLEPeripheralInfo *v4;
  HAPBLEPeripheralInfo *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HAPBLEPeripheralInfo *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HAPBLEPeripheralInfo peripheralUUID](self, "peripheralUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLEPeripheralInfo peripheralUUID](v5, "peripheralUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HAPBLEPeripheralInfo peripheralUUID](self, "peripheralUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;

  v19 = (void *)MEMORY[0x1E0CB3940];
  -[HAPBLEPeripheralInfo peripheralUUID](self, "peripheralUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HAPBLEPeripheralInfo advertisedProtocolVersion](self, "advertisedProtocolVersion");
  v17 = -[HAPBLEPeripheralInfo previousProtocolVersion](self, "previousProtocolVersion");
  v16 = -[HAPBLEPeripheralInfo resumeSessionId](self, "resumeSessionId");
  v3 = (void *)MEMORY[0x1E0C99D68];
  -[HAPBLEPeripheralInfo lastSeen](self, "lastSeen");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheralInfo statusFlags](self, "statusFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheralInfo stateNumber](self, "stateNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheralInfo configNumber](self, "configNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheralInfo categoryIdentifier](self, "categoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HAPIsInternalBuild();
  if (v9)
  {
    -[HAPBLEPeripheralInfo accessoryName](self, "accessoryName");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("<private>");
  }
  v11 = (void *)MEMORY[0x1E0C99D68];
  -[HAPBLEPeripheralInfo keyUpdatedTime](self, "keyUpdatedTime");
  objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEPeripheralInfo keyUpdatedStateNumber](self, "keyUpdatedStateNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("\nPeripheral Info:\n\tPeripheral UUID: %@,\n\tProtocol Version: %tu,\n\tPrevious Version: %tu,\n\tResume Id: %llu,\n\tLast Seen:%@,\n\tStatus Flags: %@,\n\tState Number:%@,\n\tConfig Number: %@,\n\tCategory Id: %@,\n\tName: %@,\n\tKeyUpdatedTime: %@,\n\tKeyUpdated State Number: %@"), v20, v18, v17, v16, v4, v5, v6, v7, v8, v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  return v14;
}

- (NSUUID)peripheralUUID
{
  return self->_peripheralUUID;
}

- (unint64_t)advertisedProtocolVersion
{
  return self->_advertisedProtocolVersion;
}

- (void)setAdvertisedProtocolVersion:(unint64_t)a3
{
  self->_advertisedProtocolVersion = a3;
}

- (unint64_t)previousProtocolVersion
{
  return self->_previousProtocolVersion;
}

- (void)setPreviousProtocolVersion:(unint64_t)a3
{
  self->_previousProtocolVersion = a3;
}

- (unint64_t)resumeSessionId
{
  return self->_resumeSessionId;
}

- (void)setResumeSessionId:(unint64_t)a3
{
  self->_resumeSessionId = a3;
}

- (double)lastSeen
{
  return self->_lastSeen;
}

- (NSNumber)statusFlags
{
  return self->_statusFlags;
}

- (NSNumber)stateNumber
{
  return self->_stateNumber;
}

- (void)setStateNumber:(id)a3
{
  objc_storeStrong((id *)&self->_stateNumber, a3);
}

- (NSNumber)configNumber
{
  return self->_configNumber;
}

- (NSNumber)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryName, a3);
}

- (NSData)broadcastKey
{
  return self->_broadcastKey;
}

- (void)setBroadcastKey:(id)a3
{
  objc_storeStrong((id *)&self->_broadcastKey, a3);
}

- (double)keyUpdatedTime
{
  return self->_keyUpdatedTime;
}

- (void)setKeyUpdatedTime:(double)a3
{
  self->_keyUpdatedTime = a3;
}

- (NSNumber)keyUpdatedStateNumber
{
  return self->_keyUpdatedStateNumber;
}

- (void)setKeyUpdatedStateNumber:(id)a3
{
  objc_storeStrong((id *)&self->_keyUpdatedStateNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyUpdatedStateNumber, 0);
  objc_storeStrong((id *)&self->_broadcastKey, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_configNumber, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong((id *)&self->_statusFlags, 0);
  objc_storeStrong((id *)&self->_peripheralUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
