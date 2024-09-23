@implementation NPKIDVRemoteDeviceProtoCreateCredentialRequest

- (BOOL)hasPartitionIdentifier
{
  return self->_partitionIdentifier != 0;
}

- (BOOL)hasCredentialOptionsData
{
  return self->_credentialOptionsData != 0;
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
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoCreateCredentialRequest;
  -[NPKIDVRemoteDeviceProtoCreateCredentialRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDVRemoteDeviceProtoCreateCredentialRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *partitionIdentifier;
  NSData *credentialOptionsData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  partitionIdentifier = self->_partitionIdentifier;
  if (partitionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", partitionIdentifier, CFSTR("partitionIdentifier"));
  credentialOptionsData = self->_credentialOptionsData;
  if (credentialOptionsData)
    objc_msgSend(v4, "setObject:forKey:", credentialOptionsData, CFSTR("credentialOptionsData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoCreateCredentialRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_partitionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_credentialOptionsData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_partitionIdentifier)
  {
    objc_msgSend(v4, "setPartitionIdentifier:");
    v4 = v5;
  }
  if (self->_credentialOptionsData)
  {
    objc_msgSend(v5, "setCredentialOptionsData:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_partitionIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_credentialOptionsData, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *partitionIdentifier;
  NSData *credentialOptionsData;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((partitionIdentifier = self->_partitionIdentifier, !((unint64_t)partitionIdentifier | v4[2]))
     || -[NSString isEqual:](partitionIdentifier, "isEqual:")))
  {
    credentialOptionsData = self->_credentialOptionsData;
    if ((unint64_t)credentialOptionsData | v4[1])
      v7 = -[NSData isEqual:](credentialOptionsData, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_partitionIdentifier, "hash");
  return -[NSData hash](self->_credentialOptionsData, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[NPKIDVRemoteDeviceProtoCreateCredentialRequest setPartitionIdentifier:](self, "setPartitionIdentifier:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[NPKIDVRemoteDeviceProtoCreateCredentialRequest setCredentialOptionsData:](self, "setCredentialOptionsData:");
    v4 = v5;
  }

}

- (NSString)partitionIdentifier
{
  return self->_partitionIdentifier;
}

- (void)setPartitionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_partitionIdentifier, a3);
}

- (NSData)credentialOptionsData
{
  return self->_credentialOptionsData;
}

- (void)setCredentialOptionsData:(id)a3
{
  objc_storeStrong((id *)&self->_credentialOptionsData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partitionIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialOptionsData, 0);
}

@end
