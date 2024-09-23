@implementation ASCodableRelationshipStorage

- (BOOL)hasLegacyRelationshipContainer
{
  return self->_legacyRelationshipContainer != 0;
}

- (BOOL)hasLegacyRemoteRelationshipContainer
{
  return self->_legacyRemoteRelationshipContainer != 0;
}

- (BOOL)hasSecureCloudRelationshipContainer
{
  return self->_secureCloudRelationshipContainer != 0;
}

- (BOOL)hasSecureCloudRemoteRelationshipContainer
{
  return self->_secureCloudRemoteRelationshipContainer != 0;
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
  v8.super_class = (Class)ASCodableRelationshipStorage;
  -[ASCodableRelationshipStorage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableRelationshipStorage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ASCodableRelationshipContainer *legacyRelationshipContainer;
  void *v5;
  ASCodableRelationshipContainer *legacyRemoteRelationshipContainer;
  void *v7;
  ASCodableRelationshipContainer *secureCloudRelationshipContainer;
  void *v9;
  ASCodableRelationshipContainer *secureCloudRemoteRelationshipContainer;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  legacyRelationshipContainer = self->_legacyRelationshipContainer;
  if (legacyRelationshipContainer)
  {
    -[ASCodableRelationshipContainer dictionaryRepresentation](legacyRelationshipContainer, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("legacyRelationshipContainer"));

  }
  legacyRemoteRelationshipContainer = self->_legacyRemoteRelationshipContainer;
  if (legacyRemoteRelationshipContainer)
  {
    -[ASCodableRelationshipContainer dictionaryRepresentation](legacyRemoteRelationshipContainer, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("legacyRemoteRelationshipContainer"));

  }
  secureCloudRelationshipContainer = self->_secureCloudRelationshipContainer;
  if (secureCloudRelationshipContainer)
  {
    -[ASCodableRelationshipContainer dictionaryRepresentation](secureCloudRelationshipContainer, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("secureCloudRelationshipContainer"));

  }
  secureCloudRemoteRelationshipContainer = self->_secureCloudRemoteRelationshipContainer;
  if (secureCloudRemoteRelationshipContainer)
  {
    -[ASCodableRelationshipContainer dictionaryRepresentation](secureCloudRemoteRelationshipContainer, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("secureCloudRemoteRelationshipContainer"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableRelationshipStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_legacyRelationshipContainer)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_legacyRemoteRelationshipContainer)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_secureCloudRelationshipContainer)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_secureCloudRemoteRelationshipContainer)
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
  if (self->_legacyRelationshipContainer)
  {
    objc_msgSend(v4, "setLegacyRelationshipContainer:");
    v4 = v5;
  }
  if (self->_legacyRemoteRelationshipContainer)
  {
    objc_msgSend(v5, "setLegacyRemoteRelationshipContainer:");
    v4 = v5;
  }
  if (self->_secureCloudRelationshipContainer)
  {
    objc_msgSend(v5, "setSecureCloudRelationshipContainer:");
    v4 = v5;
  }
  if (self->_secureCloudRemoteRelationshipContainer)
  {
    objc_msgSend(v5, "setSecureCloudRemoteRelationshipContainer:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ASCodableRelationshipContainer copyWithZone:](self->_legacyRelationshipContainer, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[ASCodableRelationshipContainer copyWithZone:](self->_legacyRemoteRelationshipContainer, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[ASCodableRelationshipContainer copyWithZone:](self->_secureCloudRelationshipContainer, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[ASCodableRelationshipContainer copyWithZone:](self->_secureCloudRemoteRelationshipContainer, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  ASCodableRelationshipContainer *legacyRelationshipContainer;
  ASCodableRelationshipContainer *legacyRemoteRelationshipContainer;
  ASCodableRelationshipContainer *secureCloudRelationshipContainer;
  ASCodableRelationshipContainer *secureCloudRemoteRelationshipContainer;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((legacyRelationshipContainer = self->_legacyRelationshipContainer,
         !((unint64_t)legacyRelationshipContainer | v4[1]))
     || -[ASCodableRelationshipContainer isEqual:](legacyRelationshipContainer, "isEqual:"))
    && ((legacyRemoteRelationshipContainer = self->_legacyRemoteRelationshipContainer,
         !((unint64_t)legacyRemoteRelationshipContainer | v4[2]))
     || -[ASCodableRelationshipContainer isEqual:](legacyRemoteRelationshipContainer, "isEqual:"))
    && ((secureCloudRelationshipContainer = self->_secureCloudRelationshipContainer,
         !((unint64_t)secureCloudRelationshipContainer | v4[3]))
     || -[ASCodableRelationshipContainer isEqual:](secureCloudRelationshipContainer, "isEqual:")))
  {
    secureCloudRemoteRelationshipContainer = self->_secureCloudRemoteRelationshipContainer;
    if ((unint64_t)secureCloudRemoteRelationshipContainer | v4[4])
      v9 = -[ASCodableRelationshipContainer isEqual:](secureCloudRemoteRelationshipContainer, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[ASCodableRelationshipContainer hash](self->_legacyRelationshipContainer, "hash");
  v4 = -[ASCodableRelationshipContainer hash](self->_legacyRemoteRelationshipContainer, "hash") ^ v3;
  v5 = -[ASCodableRelationshipContainer hash](self->_secureCloudRelationshipContainer, "hash");
  return v4 ^ v5 ^ -[ASCodableRelationshipContainer hash](self->_secureCloudRemoteRelationshipContainer, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  ASCodableRelationshipContainer *legacyRelationshipContainer;
  uint64_t v6;
  ASCodableRelationshipContainer *legacyRemoteRelationshipContainer;
  uint64_t v8;
  ASCodableRelationshipContainer *secureCloudRelationshipContainer;
  uint64_t v10;
  ASCodableRelationshipContainer *secureCloudRemoteRelationshipContainer;
  uint64_t v12;
  _QWORD *v13;

  v4 = a3;
  legacyRelationshipContainer = self->_legacyRelationshipContainer;
  v6 = v4[1];
  v13 = v4;
  if (legacyRelationshipContainer)
  {
    if (!v6)
      goto LABEL_7;
    -[ASCodableRelationshipContainer mergeFrom:](legacyRelationshipContainer, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[ASCodableRelationshipStorage setLegacyRelationshipContainer:](self, "setLegacyRelationshipContainer:");
  }
  v4 = v13;
LABEL_7:
  legacyRemoteRelationshipContainer = self->_legacyRemoteRelationshipContainer;
  v8 = v4[2];
  if (legacyRemoteRelationshipContainer)
  {
    if (!v8)
      goto LABEL_13;
    -[ASCodableRelationshipContainer mergeFrom:](legacyRemoteRelationshipContainer, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[ASCodableRelationshipStorage setLegacyRemoteRelationshipContainer:](self, "setLegacyRemoteRelationshipContainer:");
  }
  v4 = v13;
LABEL_13:
  secureCloudRelationshipContainer = self->_secureCloudRelationshipContainer;
  v10 = v4[3];
  if (secureCloudRelationshipContainer)
  {
    if (!v10)
      goto LABEL_19;
    -[ASCodableRelationshipContainer mergeFrom:](secureCloudRelationshipContainer, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[ASCodableRelationshipStorage setSecureCloudRelationshipContainer:](self, "setSecureCloudRelationshipContainer:");
  }
  v4 = v13;
LABEL_19:
  secureCloudRemoteRelationshipContainer = self->_secureCloudRemoteRelationshipContainer;
  v12 = v4[4];
  if (secureCloudRemoteRelationshipContainer)
  {
    if (v12)
    {
      -[ASCodableRelationshipContainer mergeFrom:](secureCloudRemoteRelationshipContainer, "mergeFrom:");
LABEL_24:
      v4 = v13;
    }
  }
  else if (v12)
  {
    -[ASCodableRelationshipStorage setSecureCloudRemoteRelationshipContainer:](self, "setSecureCloudRemoteRelationshipContainer:");
    goto LABEL_24;
  }

}

- (ASCodableRelationshipContainer)legacyRelationshipContainer
{
  return self->_legacyRelationshipContainer;
}

- (void)setLegacyRelationshipContainer:(id)a3
{
  objc_storeStrong((id *)&self->_legacyRelationshipContainer, a3);
}

- (ASCodableRelationshipContainer)legacyRemoteRelationshipContainer
{
  return self->_legacyRemoteRelationshipContainer;
}

- (void)setLegacyRemoteRelationshipContainer:(id)a3
{
  objc_storeStrong((id *)&self->_legacyRemoteRelationshipContainer, a3);
}

- (ASCodableRelationshipContainer)secureCloudRelationshipContainer
{
  return self->_secureCloudRelationshipContainer;
}

- (void)setSecureCloudRelationshipContainer:(id)a3
{
  objc_storeStrong((id *)&self->_secureCloudRelationshipContainer, a3);
}

- (ASCodableRelationshipContainer)secureCloudRemoteRelationshipContainer
{
  return self->_secureCloudRemoteRelationshipContainer;
}

- (void)setSecureCloudRemoteRelationshipContainer:(id)a3
{
  objc_storeStrong((id *)&self->_secureCloudRemoteRelationshipContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureCloudRemoteRelationshipContainer, 0);
  objc_storeStrong((id *)&self->_secureCloudRelationshipContainer, 0);
  objc_storeStrong((id *)&self->_legacyRemoteRelationshipContainer, 0);
  objc_storeStrong((id *)&self->_legacyRelationshipContainer, 0);
}

@end
