@implementation _MRVolumeControlCapabilitiesDidChangeMessageProtobuf

- (BOOL)hasCapabilities
{
  return self->_capabilities != 0;
}

- (BOOL)hasEndpointUID
{
  return self->_endpointUID != 0;
}

- (BOOL)hasOutputDeviceUID
{
  return self->_outputDeviceUID != 0;
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
  v8.super_class = (Class)_MRVolumeControlCapabilitiesDidChangeMessageProtobuf;
  -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRVolumeControlAvailabilityProtobuf *capabilities;
  void *v5;
  NSString *endpointUID;
  NSString *outputDeviceUID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  capabilities = self->_capabilities;
  if (capabilities)
  {
    -[_MRVolumeControlAvailabilityProtobuf dictionaryRepresentation](capabilities, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("capabilities"));

  }
  endpointUID = self->_endpointUID;
  if (endpointUID)
    objc_msgSend(v3, "setObject:forKey:", endpointUID, CFSTR("endpointUID"));
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID)
    objc_msgSend(v3, "setObject:forKey:", outputDeviceUID, CFSTR("outputDeviceUID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRVolumeControlCapabilitiesDidChangeMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_capabilities)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_endpointUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_outputDeviceUID)
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
  if (self->_capabilities)
  {
    objc_msgSend(v4, "setCapabilities:");
    v4 = v5;
  }
  if (self->_endpointUID)
  {
    objc_msgSend(v5, "setEndpointUID:");
    v4 = v5;
  }
  if (self->_outputDeviceUID)
  {
    objc_msgSend(v5, "setOutputDeviceUID:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRVolumeControlAvailabilityProtobuf copyWithZone:](self->_capabilities, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_endpointUID, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_outputDeviceUID, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRVolumeControlAvailabilityProtobuf *capabilities;
  NSString *endpointUID;
  NSString *outputDeviceUID;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((capabilities = self->_capabilities, !((unint64_t)capabilities | v4[1]))
     || -[_MRVolumeControlAvailabilityProtobuf isEqual:](capabilities, "isEqual:"))
    && ((endpointUID = self->_endpointUID, !((unint64_t)endpointUID | v4[2]))
     || -[NSString isEqual:](endpointUID, "isEqual:")))
  {
    outputDeviceUID = self->_outputDeviceUID;
    if ((unint64_t)outputDeviceUID | v4[3])
      v8 = -[NSString isEqual:](outputDeviceUID, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[_MRVolumeControlAvailabilityProtobuf hash](self->_capabilities, "hash");
  v4 = -[NSString hash](self->_endpointUID, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_outputDeviceUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRVolumeControlAvailabilityProtobuf *capabilities;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  capabilities = self->_capabilities;
  v6 = v4[1];
  v7 = v4;
  if (capabilities)
  {
    if (!v6)
      goto LABEL_7;
    -[_MRVolumeControlAvailabilityProtobuf mergeFrom:](capabilities, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf setCapabilities:](self, "setCapabilities:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf setEndpointUID:](self, "setEndpointUID:");
    v4 = v7;
  }
  if (v4[3])
  {
    -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
    v4 = v7;
  }

}

- (_MRVolumeControlAvailabilityProtobuf)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (NSString)endpointUID
{
  return self->_endpointUID;
}

- (void)setEndpointUID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointUID, a3);
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
  objc_storeStrong((id *)&self->_endpointUID, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end
