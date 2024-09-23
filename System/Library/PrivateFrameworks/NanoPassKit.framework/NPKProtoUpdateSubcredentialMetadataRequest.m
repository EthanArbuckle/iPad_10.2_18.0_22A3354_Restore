@implementation NPKProtoUpdateSubcredentialMetadataRequest

- (BOOL)hasPassData
{
  return self->_passData != 0;
}

- (BOOL)hasCredentialData
{
  return self->_credentialData != 0;
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
  v8.super_class = (Class)NPKProtoUpdateSubcredentialMetadataRequest;
  -[NPKProtoUpdateSubcredentialMetadataRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoUpdateSubcredentialMetadataRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *passData;
  NSData *credentialData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  passData = self->_passData;
  if (passData)
    objc_msgSend(v3, "setObject:forKey:", passData, CFSTR("passData"));
  credentialData = self->_credentialData;
  if (credentialData)
    objc_msgSend(v4, "setObject:forKey:", credentialData, CFSTR("credentialData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoUpdateSubcredentialMetadataRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_passData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_credentialData)
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
  if (self->_passData)
  {
    objc_msgSend(v4, "setPassData:");
    v4 = v5;
  }
  if (self->_credentialData)
  {
    objc_msgSend(v5, "setCredentialData:");
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
  v6 = -[NSData copyWithZone:](self->_passData, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_credentialData, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *passData;
  NSData *credentialData;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((passData = self->_passData, !((unint64_t)passData | v4[2]))
     || -[NSData isEqual:](passData, "isEqual:")))
  {
    credentialData = self->_credentialData;
    if ((unint64_t)credentialData | v4[1])
      v7 = -[NSData isEqual:](credentialData, "isEqual:");
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
  uint64_t v3;

  v3 = -[NSData hash](self->_passData, "hash");
  return -[NSData hash](self->_credentialData, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[NPKProtoUpdateSubcredentialMetadataRequest setPassData:](self, "setPassData:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoUpdateSubcredentialMetadataRequest setCredentialData:](self, "setCredentialData:");
    v4 = v5;
  }

}

- (NSData)passData
{
  return self->_passData;
}

- (void)setPassData:(id)a3
{
  objc_storeStrong((id *)&self->_passData, a3);
}

- (NSData)credentialData
{
  return self->_credentialData;
}

- (void)setCredentialData:(id)a3
{
  objc_storeStrong((id *)&self->_credentialData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passData, 0);
  objc_storeStrong((id *)&self->_credentialData, 0);
}

@end
