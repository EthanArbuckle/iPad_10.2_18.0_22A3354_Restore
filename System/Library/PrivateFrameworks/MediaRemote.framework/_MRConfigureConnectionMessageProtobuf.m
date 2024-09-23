@implementation _MRConfigureConnectionMessageProtobuf

- (BOOL)hasGroupID
{
  return self->_groupID != 0;
}

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (BOOL)hasSourceOutputDeviceUID
{
  return self->_sourceOutputDeviceUID != 0;
}

- (BOOL)hasSourceOutputDeviceName
{
  return self->_sourceOutputDeviceName != 0;
}

- (BOOL)hasDestinationOutputDeviceUID
{
  return self->_destinationOutputDeviceUID != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MRConfigureConnectionMessageProtobuf;
  -[_MRConfigureConnectionMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRConfigureConnectionMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *groupID;
  NSString *serviceName;
  NSString *sourceOutputDeviceUID;
  NSString *sourceOutputDeviceName;
  NSString *destinationOutputDeviceUID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  groupID = self->_groupID;
  if (groupID)
    objc_msgSend(v3, "setObject:forKey:", groupID, CFSTR("groupID"));
  serviceName = self->_serviceName;
  if (serviceName)
    objc_msgSend(v4, "setObject:forKey:", serviceName, CFSTR("serviceName"));
  sourceOutputDeviceUID = self->_sourceOutputDeviceUID;
  if (sourceOutputDeviceUID)
    objc_msgSend(v4, "setObject:forKey:", sourceOutputDeviceUID, CFSTR("sourceOutputDeviceUID"));
  sourceOutputDeviceName = self->_sourceOutputDeviceName;
  if (sourceOutputDeviceName)
    objc_msgSend(v4, "setObject:forKey:", sourceOutputDeviceName, CFSTR("sourceOutputDeviceName"));
  destinationOutputDeviceUID = self->_destinationOutputDeviceUID;
  if (destinationOutputDeviceUID)
    objc_msgSend(v4, "setObject:forKey:", destinationOutputDeviceUID, CFSTR("destinationOutputDeviceUID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRConfigureConnectionMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_groupID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_serviceName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sourceOutputDeviceUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sourceOutputDeviceName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_destinationOutputDeviceUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_groupID)
  {
    objc_msgSend(v4, "setGroupID:");
    v4 = v5;
  }
  if (self->_serviceName)
  {
    objc_msgSend(v5, "setServiceName:");
    v4 = v5;
  }
  if (self->_sourceOutputDeviceUID)
  {
    objc_msgSend(v5, "setSourceOutputDeviceUID:");
    v4 = v5;
  }
  if (self->_sourceOutputDeviceName)
  {
    objc_msgSend(v5, "setSourceOutputDeviceName:");
    v4 = v5;
  }
  if (self->_destinationOutputDeviceUID)
  {
    objc_msgSend(v5, "setDestinationOutputDeviceUID:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_groupID, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_sourceOutputDeviceUID, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[NSString copyWithZone:](self->_sourceOutputDeviceName, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSString copyWithZone:](self->_destinationOutputDeviceUID, "copyWithZone:", a3);
  v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *groupID;
  NSString *serviceName;
  NSString *sourceOutputDeviceUID;
  NSString *sourceOutputDeviceName;
  NSString *destinationOutputDeviceUID;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((groupID = self->_groupID, !((unint64_t)groupID | v4[2]))
     || -[NSString isEqual:](groupID, "isEqual:"))
    && ((serviceName = self->_serviceName, !((unint64_t)serviceName | v4[3]))
     || -[NSString isEqual:](serviceName, "isEqual:"))
    && ((sourceOutputDeviceUID = self->_sourceOutputDeviceUID, !((unint64_t)sourceOutputDeviceUID | v4[5]))
     || -[NSString isEqual:](sourceOutputDeviceUID, "isEqual:"))
    && ((sourceOutputDeviceName = self->_sourceOutputDeviceName, !((unint64_t)sourceOutputDeviceName | v4[4]))
     || -[NSString isEqual:](sourceOutputDeviceName, "isEqual:")))
  {
    destinationOutputDeviceUID = self->_destinationOutputDeviceUID;
    if ((unint64_t)destinationOutputDeviceUID | v4[1])
      v10 = -[NSString isEqual:](destinationOutputDeviceUID, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_groupID, "hash");
  v4 = -[NSString hash](self->_serviceName, "hash") ^ v3;
  v5 = -[NSString hash](self->_sourceOutputDeviceUID, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_sourceOutputDeviceName, "hash");
  return v6 ^ -[NSString hash](self->_destinationOutputDeviceUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[_MRConfigureConnectionMessageProtobuf setGroupID:](self, "setGroupID:");
  if (v4[3])
    -[_MRConfigureConnectionMessageProtobuf setServiceName:](self, "setServiceName:");
  if (v4[5])
    -[_MRConfigureConnectionMessageProtobuf setSourceOutputDeviceUID:](self, "setSourceOutputDeviceUID:");
  if (v4[4])
    -[_MRConfigureConnectionMessageProtobuf setSourceOutputDeviceName:](self, "setSourceOutputDeviceName:");
  if (v4[1])
    -[_MRConfigureConnectionMessageProtobuf setDestinationOutputDeviceUID:](self, "setDestinationOutputDeviceUID:");

}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSString)sourceOutputDeviceUID
{
  return self->_sourceOutputDeviceUID;
}

- (void)setSourceOutputDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceOutputDeviceUID, a3);
}

- (NSString)sourceOutputDeviceName
{
  return self->_sourceOutputDeviceName;
}

- (void)setSourceOutputDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_sourceOutputDeviceName, a3);
}

- (NSString)destinationOutputDeviceUID
{
  return self->_destinationOutputDeviceUID;
}

- (void)setDestinationOutputDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_destinationOutputDeviceUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceOutputDeviceUID, 0);
  objc_storeStrong((id *)&self->_sourceOutputDeviceName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_destinationOutputDeviceUID, 0);
}

@end
