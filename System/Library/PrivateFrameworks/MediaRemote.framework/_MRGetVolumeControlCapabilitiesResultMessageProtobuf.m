@implementation _MRGetVolumeControlCapabilitiesResultMessageProtobuf

- (BOOL)hasCapabilities
{
  return self->_capabilities != 0;
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
  v8.super_class = (Class)_MRGetVolumeControlCapabilitiesResultMessageProtobuf;
  -[_MRGetVolumeControlCapabilitiesResultMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGetVolumeControlCapabilitiesResultMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  capabilities = self->_capabilities;
  if (capabilities)
  {
    -[_MRVolumeControlAvailabilityProtobuf dictionaryRepresentation](capabilities, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("capabilities"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGetVolumeControlCapabilitiesResultMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_capabilities)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  _MRVolumeControlAvailabilityProtobuf *capabilities;

  capabilities = self->_capabilities;
  if (capabilities)
    objc_msgSend(a3, "setCapabilities:", capabilities);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRVolumeControlAvailabilityProtobuf copyWithZone:](self->_capabilities, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRVolumeControlAvailabilityProtobuf *capabilities;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    capabilities = self->_capabilities;
    if ((unint64_t)capabilities | v4[1])
      v6 = -[_MRVolumeControlAvailabilityProtobuf isEqual:](capabilities, "isEqual:");
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
  return -[_MRVolumeControlAvailabilityProtobuf hash](self->_capabilities, "hash");
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
  if (capabilities)
  {
    if (v6)
    {
      v7 = v4;
      -[_MRVolumeControlAvailabilityProtobuf mergeFrom:](capabilities, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[_MRGetVolumeControlCapabilitiesResultMessageProtobuf setCapabilities:](self, "setCapabilities:");
    goto LABEL_6;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end
