@implementation CVAUserEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_254A6EE80 != -1)
    dispatch_once(&qword_254A6EE80, &unk_24CA35F20);
  return (id)qword_254A6EE78;
}

- (CVAUserEvent)initWithEventType:(unint64_t)a3 timestamp:(double)a4
{
  CVAUserEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CVAUserEvent;
  result = -[CVAUserEvent init](&v7, sel_init);
  if (result)
  {
    result->_eventType = a3;
    result->_timestamp = a4;
  }
  return result;
}

- (CVAUserEvent)initWithCoder:(id)a3
{
  id v4;
  CVAUserEvent *v5;
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
  v14.super_class = (Class)CVAUserEvent;
  v5 = -[CVAUserEvent init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    -[CVAUserEvent setEventType:](v5, "setEventType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ev")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    -[CVAUserEvent setTimestamp:](v5, "setTimestamp:");
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("pd"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAUserEvent setPeerDisplayName:](v5, "setPeerDisplayName:", v7);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAUserEvent setUuid:](v5, "setUuid:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("andt"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAUserEvent setAnchorData:](v5, "setAnchorData:", v9);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("tcta"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAUserEvent setTransformCameraToAnchor:](v5, "setTransformCameraToAnchor:", v10);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("sid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAUserEvent setSessionID:](v5, "setSessionID:", v11);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("mlt"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAUserEvent setMovLowestTimestamp:](v5, "setMovLowestTimestamp:", v12);

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
  objc_msgSend(v11, "encodeInteger:forKey:", -[CVAUserEvent eventType](self, "eventType"), CFSTR("ev"));
  -[CVAUserEvent timestamp](self, "timestamp");
  objc_msgSend(v11, "encodeDouble:forKey:", CFSTR("t"));
  -[CVAUserEvent peerDisplayName](self, "peerDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("pd"));

  -[CVAUserEvent uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("uuid"));

  -[CVAUserEvent anchorData](self, "anchorData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("andt"));

  -[CVAUserEvent transformCameraToAnchor](self, "transformCameraToAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("tcta"));

  -[CVAUserEvent sessionID](self, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("sid"));

  -[CVAUserEvent movLowestTimestamp](self, "movLowestTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("mlt"));

  objc_autoreleasePoolPop(v4);
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSData)anchorData
{
  return self->_anchorData;
}

- (void)setAnchorData:(id)a3
{
  objc_storeStrong((id *)&self->_anchorData, a3);
}

- (NSArray)transformCameraToAnchor
{
  return self->_transformCameraToAnchor;
}

- (void)setTransformCameraToAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_transformCameraToAnchor, a3);
}

- (NSString)peerDisplayName
{
  return self->_peerDisplayName;
}

- (void)setPeerDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_peerDisplayName, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movLowestTimestamp, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_peerDisplayName, 0);
  objc_storeStrong((id *)&self->_transformCameraToAnchor, 0);
  objc_storeStrong((id *)&self->_anchorData, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
