@implementation _MRRegisterHIDDeviceMessageProtobuf

- (BOOL)hasDeviceDescriptor
{
  return self->_deviceDescriptor != 0;
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
  v8.super_class = (Class)_MRRegisterHIDDeviceMessageProtobuf;
  -[_MRRegisterHIDDeviceMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRRegisterHIDDeviceMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRVirtualTouchDeviceDescriptorProtobuf *deviceDescriptor;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  deviceDescriptor = self->_deviceDescriptor;
  if (deviceDescriptor)
  {
    -[_MRVirtualTouchDeviceDescriptorProtobuf dictionaryRepresentation](deviceDescriptor, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("deviceDescriptor"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRegisterHIDDeviceMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_deviceDescriptor)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  _MRVirtualTouchDeviceDescriptorProtobuf *deviceDescriptor;

  deviceDescriptor = self->_deviceDescriptor;
  if (deviceDescriptor)
    objc_msgSend(a3, "setDeviceDescriptor:", deviceDescriptor);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRVirtualTouchDeviceDescriptorProtobuf copyWithZone:](self->_deviceDescriptor, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRVirtualTouchDeviceDescriptorProtobuf *deviceDescriptor;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    deviceDescriptor = self->_deviceDescriptor;
    if ((unint64_t)deviceDescriptor | v4[1])
      v6 = -[_MRVirtualTouchDeviceDescriptorProtobuf isEqual:](deviceDescriptor, "isEqual:");
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
  return -[_MRVirtualTouchDeviceDescriptorProtobuf hash](self->_deviceDescriptor, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRVirtualTouchDeviceDescriptorProtobuf *deviceDescriptor;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  deviceDescriptor = self->_deviceDescriptor;
  v6 = v4[1];
  if (deviceDescriptor)
  {
    if (v6)
    {
      v7 = v4;
      -[_MRVirtualTouchDeviceDescriptorProtobuf mergeFrom:](deviceDescriptor, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[_MRRegisterHIDDeviceMessageProtobuf setDeviceDescriptor:](self, "setDeviceDescriptor:");
    goto LABEL_6;
  }

}

- (_MRVirtualTouchDeviceDescriptorProtobuf)deviceDescriptor
{
  return self->_deviceDescriptor;
}

- (void)setDeviceDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_deviceDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceDescriptor, 0);
}

@end
