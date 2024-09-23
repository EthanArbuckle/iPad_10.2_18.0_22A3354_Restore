@implementation FPSearchableItemVersion

- (BOOL)readFrom:(id)a3
{
  return FPSearchableItemVersionReadFrom((uint64_t)self, (uint64_t)a3);
}

+ (id)versionFromString:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  FPSearchableItemVersion *v6;
  NSFileProviderItemVersion *v7;
  void *v8;
  void *v9;
  NSFileProviderItemVersion *v10;

  v3 = (objc_class *)MEMORY[0x1E0C99D50];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBase64EncodedString:options:", v4, 0);

  v6 = -[FPSearchableItemVersion initWithData:]([FPSearchableItemVersion alloc], "initWithData:", v5);
  v7 = [NSFileProviderItemVersion alloc];
  -[FPSearchableItemVersion contentVersion](v6, "contentVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSearchableItemVersion metadataVersion](v6, "metadataVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NSFileProviderItemVersion initWithContentVersion:metadataVersion:](v7, "initWithContentVersion:metadataVersion:", v8, v9);

  return v10;
}

- (NSData)metadataVersion
{
  return self->_metadataVersion;
}

- (NSData)contentVersion
{
  return self->_contentVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataVersion, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
}

+ (id)stringFromVersion:(id)a3
{
  id v3;
  FPSearchableItemVersion *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(FPSearchableItemVersion);
    objc_msgSend(v3, "contentVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPSearchableItemVersion setContentVersion:](v4, "setContentVersion:", v5);

    objc_msgSend(v3, "metadataVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[FPSearchableItemVersion setMetadataVersion:](v4, "setMetadataVersion:", v6);
    -[FPSearchableItemVersion data](v4, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)hasContentVersion
{
  return self->_contentVersion != 0;
}

- (BOOL)hasMetadataVersion
{
  return self->_metadataVersion != 0;
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
  v8.super_class = (Class)FPSearchableItemVersion;
  -[FPSearchableItemVersion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSearchableItemVersion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *contentVersion;
  NSData *metadataVersion;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  contentVersion = self->_contentVersion;
  if (contentVersion)
    objc_msgSend(v3, "setObject:forKey:", contentVersion, CFSTR("contentVersion"));
  metadataVersion = self->_metadataVersion;
  if (metadataVersion)
    objc_msgSend(v4, "setObject:forKey:", metadataVersion, CFSTR("metadataVersion"));
  return v4;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_contentVersion)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_metadataVersion)
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
  if (self->_contentVersion)
  {
    objc_msgSend(v4, "setContentVersion:");
    v4 = v5;
  }
  if (self->_metadataVersion)
  {
    objc_msgSend(v5, "setMetadataVersion:");
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
  v6 = -[NSData copyWithZone:](self->_contentVersion, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_metadataVersion, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *contentVersion;
  NSData *metadataVersion;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((contentVersion = self->_contentVersion, !((unint64_t)contentVersion | v4[1]))
     || -[NSData isEqual:](contentVersion, "isEqual:")))
  {
    metadataVersion = self->_metadataVersion;
    if ((unint64_t)metadataVersion | v4[2])
      v7 = -[NSData isEqual:](metadataVersion, "isEqual:");
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

  v3 = -[NSData hash](self->_contentVersion, "hash");
  return -[NSData hash](self->_metadataVersion, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[FPSearchableItemVersion setContentVersion:](self, "setContentVersion:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[FPSearchableItemVersion setMetadataVersion:](self, "setMetadataVersion:");
    v4 = v5;
  }

}

- (void)setContentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_contentVersion, a3);
}

- (void)setMetadataVersion:(id)a3
{
  objc_storeStrong((id *)&self->_metadataVersion, a3);
}

@end
