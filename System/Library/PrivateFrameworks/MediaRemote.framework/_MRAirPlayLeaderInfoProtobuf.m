@implementation _MRAirPlayLeaderInfoProtobuf

- (BOOL)hasDeviceInfo
{
  return self->_deviceInfo != 0;
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
  v8.super_class = (Class)_MRAirPlayLeaderInfoProtobuf;
  -[_MRAirPlayLeaderInfoProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAirPlayLeaderInfoProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRDeviceInfoMessageProtobuf *deviceInfo;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    -[_MRDeviceInfoMessageProtobuf dictionaryRepresentation](deviceInfo, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("deviceInfo"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAirPlayLeaderInfoProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_deviceInfo)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  _MRDeviceInfoMessageProtobuf *deviceInfo;

  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
    objc_msgSend(a3, "setDeviceInfo:", deviceInfo);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRDeviceInfoMessageProtobuf copyWithZone:](self->_deviceInfo, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRDeviceInfoMessageProtobuf *deviceInfo;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    deviceInfo = self->_deviceInfo;
    if ((unint64_t)deviceInfo | v4[1])
      v6 = -[_MRDeviceInfoMessageProtobuf isEqual:](deviceInfo, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[_MRDeviceInfoMessageProtobuf hash](self->_deviceInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRDeviceInfoMessageProtobuf *deviceInfo;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  deviceInfo = self->_deviceInfo;
  v6 = v4[1];
  if (deviceInfo)
  {
    if (v6)
    {
      v7 = v4;
      -[_MRDeviceInfoMessageProtobuf mergeFrom:](deviceInfo, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[_MRAirPlayLeaderInfoProtobuf setDeviceInfo:](self, "setDeviceInfo:");
    goto LABEL_6;
  }

}

- (_MRDeviceInfoMessageProtobuf)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end
