@implementation NPKIDVRemoteDeviceProtoUpdateProofingConfigurationRequest

- (BOOL)hasConfigurationData
{
  return self->_configurationData != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoUpdateProofingConfigurationRequest;
  -[NPKIDVRemoteDeviceProtoUpdateProofingConfigurationRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDVRemoteDeviceProtoUpdateProofingConfigurationRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *configurationData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  configurationData = self->_configurationData;
  if (configurationData)
    objc_msgSend(v3, "setObject:forKey:", configurationData, CFSTR("configurationData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoUpdateProofingConfigurationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_configurationData)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  NSData *configurationData;

  configurationData = self->_configurationData;
  if (configurationData)
    objc_msgSend(a3, "setConfigurationData:", configurationData);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_configurationData, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *configurationData;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    configurationData = self->_configurationData;
    if ((unint64_t)configurationData | v4[1])
      v6 = -[NSData isEqual:](configurationData, "isEqual:");
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
  return -[NSData hash](self->_configurationData, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[NPKIDVRemoteDeviceProtoUpdateProofingConfigurationRequest setConfigurationData:](self, "setConfigurationData:");
}

- (NSData)configurationData
{
  return self->_configurationData;
}

- (void)setConfigurationData:(id)a3
{
  objc_storeStrong((id *)&self->_configurationData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationData, 0);
}

@end
