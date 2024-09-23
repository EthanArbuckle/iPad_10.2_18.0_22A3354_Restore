@implementation NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry;
  -[NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *type;
  NPKProtoStandalonePaymentProvisioningMethodMetadata *metadata;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  type = self->_type;
  if (type)
    objc_msgSend(v3, "setObject:forKey:", type, CFSTR("type"));
  metadata = self->_metadata;
  if (metadata)
  {
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata dictionaryRepresentation](metadata, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("metadata"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_metadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_type)
  {
    objc_msgSend(v4, "setType:");
    v4 = v5;
  }
  if (self->_metadata)
  {
    objc_msgSend(v5, "setMetadata:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NPKProtoStandalonePaymentProvisioningMethodMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *type;
  NPKProtoStandalonePaymentProvisioningMethodMetadata *metadata;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((type = self->_type, !((unint64_t)type | v4[2])) || -[NSString isEqual:](type, "isEqual:")))
  {
    metadata = self->_metadata;
    if ((unint64_t)metadata | v4[1])
      v7 = -[NPKProtoStandalonePaymentProvisioningMethodMetadata isEqual:](metadata, "isEqual:");
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

  v3 = -[NSString hash](self->_type, "hash");
  return -[NPKProtoStandalonePaymentProvisioningMethodMetadata hash](self->_metadata, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NPKProtoStandalonePaymentProvisioningMethodMetadata *metadata;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry setType:](self, "setType:");
    v4 = v7;
  }
  metadata = self->_metadata;
  v6 = v4[1];
  if (metadata)
  {
    if (v6)
    {
      -[NPKProtoStandalonePaymentProvisioningMethodMetadata mergeFrom:](metadata, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry setMetadata:](self, "setMetadata:");
    goto LABEL_8;
  }

}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NPKProtoStandalonePaymentProvisioningMethodMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
