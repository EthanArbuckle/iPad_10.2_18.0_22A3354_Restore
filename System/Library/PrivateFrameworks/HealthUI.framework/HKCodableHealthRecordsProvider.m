@implementation HKCodableHealthRecordsProvider

- (BOOL)hasProviderName
{
  return self->_providerName != 0;
}

- (BOOL)hasProviderURI
{
  return self->_providerURI != 0;
}

- (BOOL)hasProviderLogo
{
  return self->_providerLogo != 0;
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
  v8.super_class = (Class)HKCodableHealthRecordsProvider;
  -[HKCodableHealthRecordsProvider description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableHealthRecordsProvider dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *providerName;
  NSString *providerURI;
  NSData *providerLogo;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  providerName = self->_providerName;
  if (providerName)
    objc_msgSend(v3, "setObject:forKey:", providerName, CFSTR("providerName"));
  providerURI = self->_providerURI;
  if (providerURI)
    objc_msgSend(v4, "setObject:forKey:", providerURI, CFSTR("providerURI"));
  providerLogo = self->_providerLogo;
  if (providerLogo)
    objc_msgSend(v4, "setObject:forKey:", providerLogo, CFSTR("providerLogo"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableHealthRecordsProviderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_providerName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_providerURI)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_providerLogo)
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
  if (self->_providerName)
  {
    objc_msgSend(v4, "setProviderName:");
    v4 = v5;
  }
  if (self->_providerURI)
  {
    objc_msgSend(v5, "setProviderURI:");
    v4 = v5;
  }
  if (self->_providerLogo)
  {
    objc_msgSend(v5, "setProviderLogo:");
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
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_providerName, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_providerURI, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSData copyWithZone:](self->_providerLogo, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *providerName;
  NSString *providerURI;
  NSData *providerLogo;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((providerName = self->_providerName, !((unint64_t)providerName | v4[2]))
     || -[NSString isEqual:](providerName, "isEqual:"))
    && ((providerURI = self->_providerURI, !((unint64_t)providerURI | v4[3]))
     || -[NSString isEqual:](providerURI, "isEqual:")))
  {
    providerLogo = self->_providerLogo;
    if ((unint64_t)providerLogo | v4[1])
      v8 = -[NSData isEqual:](providerLogo, "isEqual:");
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
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_providerName, "hash");
  v4 = -[NSString hash](self->_providerURI, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_providerLogo, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[HKCodableHealthRecordsProvider setProviderName:](self, "setProviderName:");
  if (v4[3])
    -[HKCodableHealthRecordsProvider setProviderURI:](self, "setProviderURI:");
  if (v4[1])
    -[HKCodableHealthRecordsProvider setProviderLogo:](self, "setProviderLogo:");

}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
  objc_storeStrong((id *)&self->_providerName, a3);
}

- (NSString)providerURI
{
  return self->_providerURI;
}

- (void)setProviderURI:(id)a3
{
  objc_storeStrong((id *)&self->_providerURI, a3);
}

- (NSData)providerLogo
{
  return self->_providerLogo;
}

- (void)setProviderLogo:(id)a3
{
  objc_storeStrong((id *)&self->_providerLogo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerURI, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_providerLogo, 0);
}

@end
