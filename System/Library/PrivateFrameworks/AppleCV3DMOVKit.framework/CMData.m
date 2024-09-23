@implementation CMData

- (CMData)initWithMessage:(id)a3 timestamp:(double)a4 isSent:(BOOL)a5
{
  id v8;
  CMData *v9;
  CMData *v10;
  uint64_t v11;
  NSString *sourcePeerDisplayName;
  uint64_t v13;
  NSData *data;
  uint64_t v15;
  NSData *additionalData;
  objc_super v18;

  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CMData;
  v9 = -[CMData init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_timestamp = a4;
    v9->_isSent = a5;
    objc_msgSend(v8, "fromPeerDisplayName");
    v11 = objc_claimAutoreleasedReturnValue();
    sourcePeerDisplayName = v10->_sourcePeerDisplayName;
    v10->_sourcePeerDisplayName = (NSString *)v11;

    v10->_type = objc_msgSend(v8, "cmDataType");
    objc_msgSend(v8, "cmData");
    v13 = objc_claimAutoreleasedReturnValue();
    data = v10->_data;
    v10->_data = (NSData *)v13;

    objc_msgSend(v8, "cmAdditionalData");
    v15 = objc_claimAutoreleasedReturnValue();
    additionalData = v10->_additionalData;
    v10->_additionalData = (NSData *)v15;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_254A6EE50 != -1)
    dispatch_once(&qword_254A6EE50, &unk_24CA35EC0);
  return (id)qword_254A6EE48;
}

- (CMData)initWithCoder:(id)a3
{
  id v4;
  CMData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CMData;
  v5 = -[CMData init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("pd"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMData setSourcePeerDisplayName:](v5, "setSourcePeerDisplayName:", v7);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    -[CMData setTimestamp:](v5, "setTimestamp:");
    -[CMData setType:](v5, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cmType")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cmData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMData setData:](v5, "setData:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cmAddData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMData setAdditionalData:](v5, "setAdditionalData:", v9);

    -[CMData setIsSent:](v5, "setIsSent:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("is")));
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
  id v8;

  v8 = a3;
  v4 = (void *)MEMORY[0x212BC8864]();
  -[CMData sourcePeerDisplayName](self, "sourcePeerDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("pd"));

  -[CMData timestamp](self, "timestamp");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("t"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[CMData type](self, "type"), CFSTR("cmType"));
  -[CMData data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("cmData"));

  -[CMData additionalData](self, "additionalData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("cmAddData"));

  objc_msgSend(v8, "encodeBool:forKey:", -[CMData isSent](self, "isSent"), CFSTR("is"));
  objc_autoreleasePoolPop(v4);

}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSData)additionalData
{
  return self->_additionalData;
}

- (void)setAdditionalData:(id)a3
{
  objc_storeStrong((id *)&self->_additionalData, a3);
}

- (NSString)sourcePeerDisplayName
{
  return self->_sourcePeerDisplayName;
}

- (void)setSourcePeerDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_sourcePeerDisplayName, a3);
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
  objc_storeStrong((id *)&self->_sourcePeerDisplayName, 0);
  objc_storeStrong((id *)&self->_additionalData, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
