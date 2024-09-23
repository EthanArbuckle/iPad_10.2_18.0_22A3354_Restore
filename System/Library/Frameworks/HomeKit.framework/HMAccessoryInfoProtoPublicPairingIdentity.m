@implementation HMAccessoryInfoProtoPublicPairingIdentity

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasPublicPairingKeyData
{
  return self->_publicPairingKeyData != 0;
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
  v8.super_class = (Class)HMAccessoryInfoProtoPublicPairingIdentity;
  -[HMAccessoryInfoProtoPublicPairingIdentity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoPublicPairingIdentity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSData *publicPairingKeyData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  publicPairingKeyData = self->_publicPairingKeyData;
  if (publicPairingKeyData)
    objc_msgSend(v4, "setObject:forKey:", publicPairingKeyData, CFSTR("publicPairingKeyData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryInfoProtoPublicPairingIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_publicPairingKeyData)
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
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v5;
  }
  if (self->_publicPairingKeyData)
  {
    objc_msgSend(v5, "setPublicPairingKeyData:");
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
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_publicPairingKeyData, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSData *publicPairingKeyData;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[1]))
     || -[NSString isEqual:](identifier, "isEqual:")))
  {
    publicPairingKeyData = self->_publicPairingKeyData;
    if ((unint64_t)publicPairingKeyData | v4[2])
      v7 = -[NSData isEqual:](publicPairingKeyData, "isEqual:");
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

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[NSData hash](self->_publicPairingKeyData, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[HMAccessoryInfoProtoPublicPairingIdentity setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[HMAccessoryInfoProtoPublicPairingIdentity setPublicPairingKeyData:](self, "setPublicPairingKeyData:");
    v4 = v5;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSData)publicPairingKeyData
{
  return self->_publicPairingKeyData;
}

- (void)setPublicPairingKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_publicPairingKeyData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicPairingKeyData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
