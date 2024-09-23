@implementation CMMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMMessage)initWithMessageType:(unint64_t)a3
{
  CMMessage *v4;
  CMMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMMessage;
  v4 = -[CMMessage init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[CMMessage setMessageType:](v4, "setMessageType:", a3);
  return v5;
}

- (CMMessage)initWithCoder:(id)a3
{
  id v4;
  CMMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CMMessage;
  v5 = -[CMMessage init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    -[CMMessage setMessageType:](v5, "setMessageType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cmd")));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("pd"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMessage setFromPeerDisplayName:](v5, "setFromPeerDisplayName:", v7);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("pds"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMessage setToPeerDisplays:](v5, "setToPeerDisplays:", v8);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    -[CMMessage setTimestamp:](v5, "setTimestamp:");
    -[CMMessage setCmDataType:](v5, "setCmDataType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cmType")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cmData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMessage setCmData:](v5, "setCmData:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cmAddData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMessage setCmAdditionalData:](v5, "setCmAdditionalData:", v10);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("sid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMessage setSessionID:](v5, "setSessionID:", v11);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("mlt"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMessage setMovLowestTimestamp:](v5, "setMovLowestTimestamp:", v12);

    objc_autoreleasePoolPop(v6);
  }

  return v5;
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
  v4 = (void *)MEMORY[0x212BC8864]();
  objc_msgSend(v11, "encodeInteger:forKey:", -[CMMessage messageType](self, "messageType"), CFSTR("cmd"));
  -[CMMessage fromPeerDisplayName](self, "fromPeerDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("pd"));

  -[CMMessage toPeerDisplays](self, "toPeerDisplays");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("pds"));

  -[CMMessage timestamp](self, "timestamp");
  objc_msgSend(v11, "encodeDouble:forKey:", CFSTR("t"));
  objc_msgSend(v11, "encodeInteger:forKey:", -[CMMessage cmDataType](self, "cmDataType"), CFSTR("cmType"));
  -[CMMessage cmData](self, "cmData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("cmData"));

  -[CMMessage cmAdditionalData](self, "cmAdditionalData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("cmAddData"));

  -[CMMessage sessionID](self, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("sid"));

  -[CMMessage movLowestTimestamp](self, "movLowestTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("mlt"));

  objc_autoreleasePoolPop(v4);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  if (-[CMMessage messageType](self, "messageType"))
  {
    if (-[CMMessage messageType](self, "messageType") == 1)
    {
      v3 = (void *)MEMORY[0x24BDD17C8];
      -[CMMessage sessionID](self, "sessionID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMMessage movLowestTimestamp](self, "movLowestTimestamp");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("SessionID: %@ %@"), v4, v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = &stru_24CA36578;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DataType: %ld"), -[CMMessage cmDataType](self, "cmDataType"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = -[CMMessage messageType](self, "messageType");
  -[CMMessage timestamp](self, "timestamp");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("CMMessage: %lu %.6lf: %@"), v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unint64_t)a3
{
  self->_messageType = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSString)fromPeerDisplayName
{
  return self->_fromPeerDisplayName;
}

- (void)setFromPeerDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_fromPeerDisplayName, a3);
}

- (NSArray)toPeerDisplays
{
  return self->_toPeerDisplays;
}

- (void)setToPeerDisplays:(id)a3
{
  objc_storeStrong((id *)&self->_toPeerDisplays, a3);
}

- (int64_t)cmDataType
{
  return self->_cmDataType;
}

- (void)setCmDataType:(int64_t)a3
{
  self->_cmDataType = a3;
}

- (NSData)cmData
{
  return self->_cmData;
}

- (void)setCmData:(id)a3
{
  objc_storeStrong((id *)&self->_cmData, a3);
}

- (NSData)cmAdditionalData
{
  return self->_cmAdditionalData;
}

- (void)setCmAdditionalData:(id)a3
{
  objc_storeStrong((id *)&self->_cmAdditionalData, a3);
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSNumber)movLowestTimestamp
{
  return self->_movLowestTimestamp;
}

- (void)setMovLowestTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_movLowestTimestamp, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (BOOL)isSent
{
  return self->_isSent;
}

- (void)setIsSent:(BOOL)a3
{
  self->_isSent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_movLowestTimestamp, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_cmAdditionalData, 0);
  objc_storeStrong((id *)&self->_cmData, 0);
  objc_storeStrong((id *)&self->_toPeerDisplays, 0);
  objc_storeStrong((id *)&self->_fromPeerDisplayName, 0);
}

@end
