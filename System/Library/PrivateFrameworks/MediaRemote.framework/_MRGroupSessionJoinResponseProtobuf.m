@implementation _MRGroupSessionJoinResponseProtobuf

- (BOOL)hasPublicSigningKeyData
{
  return self->_publicSigningKeyData != 0;
}

- (BOOL)hasJoinURL
{
  return self->_joinURL != 0;
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
  v8.super_class = (Class)_MRGroupSessionJoinResponseProtobuf;
  -[_MRGroupSessionJoinResponseProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionJoinResponseProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *publicSigningKeyData;
  NSString *joinURL;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  publicSigningKeyData = self->_publicSigningKeyData;
  if (publicSigningKeyData)
    objc_msgSend(v3, "setObject:forKey:", publicSigningKeyData, CFSTR("publicSigningKeyData"));
  joinURL = self->_joinURL;
  if (joinURL)
    objc_msgSend(v4, "setObject:forKey:", joinURL, CFSTR("joinURL"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionJoinResponseProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_publicSigningKeyData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_joinURL)
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
  if (self->_publicSigningKeyData)
  {
    objc_msgSend(v4, "setPublicSigningKeyData:");
    v4 = v5;
  }
  if (self->_joinURL)
  {
    objc_msgSend(v5, "setJoinURL:");
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
  v6 = -[NSData copyWithZone:](self->_publicSigningKeyData, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_joinURL, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *publicSigningKeyData;
  NSString *joinURL;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((publicSigningKeyData = self->_publicSigningKeyData, !((unint64_t)publicSigningKeyData | v4[2]))
     || -[NSData isEqual:](publicSigningKeyData, "isEqual:")))
  {
    joinURL = self->_joinURL;
    if ((unint64_t)joinURL | v4[1])
      v7 = -[NSString isEqual:](joinURL, "isEqual:");
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

  v3 = -[NSData hash](self->_publicSigningKeyData, "hash");
  return -[NSString hash](self->_joinURL, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[_MRGroupSessionJoinResponseProtobuf setPublicSigningKeyData:](self, "setPublicSigningKeyData:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[_MRGroupSessionJoinResponseProtobuf setJoinURL:](self, "setJoinURL:");
    v4 = v5;
  }

}

- (NSData)publicSigningKeyData
{
  return self->_publicSigningKeyData;
}

- (void)setPublicSigningKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_publicSigningKeyData, a3);
}

- (NSString)joinURL
{
  return self->_joinURL;
}

- (void)setJoinURL:(id)a3
{
  objc_storeStrong((id *)&self->_joinURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicSigningKeyData, 0);
  objc_storeStrong((id *)&self->_joinURL, 0);
}

@end
