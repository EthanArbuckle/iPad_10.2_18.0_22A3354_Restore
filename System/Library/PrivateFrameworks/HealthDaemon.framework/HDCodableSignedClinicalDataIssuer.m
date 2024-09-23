@implementation HDCodableSignedClinicalDataIssuer

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasWellKnownURL
{
  return self->_wellKnownURL != 0;
}

- (BOOL)hasMessageVersion
{
  return self->_messageVersion != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
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
  v8.super_class = (Class)HDCodableSignedClinicalDataIssuer;
  -[HDCodableSignedClinicalDataIssuer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSignedClinicalDataIssuer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *title;
  NSString *subtitle;
  NSString *identifier;
  NSString *wellKnownURL;
  HDCodableMessageVersion *messageVersion;
  void *v10;
  HDCodableSyncIdentity *syncIdentity;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v4, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v4, "setObject:forKey:", identifier, CFSTR("identifier"));
  wellKnownURL = self->_wellKnownURL;
  if (wellKnownURL)
    objc_msgSend(v4, "setObject:forKey:", wellKnownURL, CFSTR("wellKnownURL"));
  messageVersion = self->_messageVersion;
  if (messageVersion)
  {
    -[HDCodableMessageVersion dictionaryRepresentation](messageVersion, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("MessageVersion"));

  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("syncIdentity"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSignedClinicalDataIssuerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_subtitle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_wellKnownURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_messageVersion)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_syncIdentity)
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
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    v4 = v5;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v5, "setSubtitle:");
    v4 = v5;
  }
  if (self->_identifier)
  {
    objc_msgSend(v5, "setIdentifier:");
    v4 = v5;
  }
  if (self->_wellKnownURL)
  {
    objc_msgSend(v5, "setWellKnownURL:");
    v4 = v5;
  }
  if (self->_messageVersion)
  {
    objc_msgSend(v5, "setMessageVersion:");
    v4 = v5;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v5, "setSyncIdentity:");
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
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  v8 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSString copyWithZone:](self->_wellKnownURL, "copyWithZone:", a3);
  v13 = (void *)v5[6];
  v5[6] = v12;

  v14 = -[HDCodableMessageVersion copyWithZone:](self->_messageVersion, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  v16 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v17 = (void *)v5[4];
  v5[4] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *title;
  NSString *subtitle;
  NSString *identifier;
  NSString *wellKnownURL;
  HDCodableMessageVersion *messageVersion;
  HDCodableSyncIdentity *syncIdentity;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((title = self->_title, !((unint64_t)title | v4[5]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((subtitle = self->_subtitle, !((unint64_t)subtitle | v4[3]))
     || -[NSString isEqual:](subtitle, "isEqual:"))
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[1]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((wellKnownURL = self->_wellKnownURL, !((unint64_t)wellKnownURL | v4[6]))
     || -[NSString isEqual:](wellKnownURL, "isEqual:"))
    && ((messageVersion = self->_messageVersion, !((unint64_t)messageVersion | v4[2]))
     || -[HDCodableMessageVersion isEqual:](messageVersion, "isEqual:")))
  {
    syncIdentity = self->_syncIdentity;
    if ((unint64_t)syncIdentity | v4[4])
      v11 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_subtitle, "hash") ^ v3;
  v5 = -[NSString hash](self->_identifier, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_wellKnownURL, "hash");
  v7 = -[HDCodableMessageVersion hash](self->_messageVersion, "hash");
  return v6 ^ v7 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  HDCodableMessageVersion *messageVersion;
  uint64_t v5;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  if (v8[5])
    -[HDCodableSignedClinicalDataIssuer setTitle:](self, "setTitle:");
  if (v8[3])
    -[HDCodableSignedClinicalDataIssuer setSubtitle:](self, "setSubtitle:");
  if (v8[1])
    -[HDCodableSignedClinicalDataIssuer setIdentifier:](self, "setIdentifier:");
  if (v8[6])
    -[HDCodableSignedClinicalDataIssuer setWellKnownURL:](self, "setWellKnownURL:");
  messageVersion = self->_messageVersion;
  v5 = v8[2];
  if (messageVersion)
  {
    if (v5)
      -[HDCodableMessageVersion mergeFrom:](messageVersion, "mergeFrom:");
  }
  else if (v5)
  {
    -[HDCodableSignedClinicalDataIssuer setMessageVersion:](self, "setMessageVersion:");
  }
  syncIdentity = self->_syncIdentity;
  v7 = v8[4];
  if (syncIdentity)
  {
    if (v7)
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else if (v7)
  {
    -[HDCodableSignedClinicalDataIssuer setSyncIdentity:](self, "setSyncIdentity:");
  }

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)wellKnownURL
{
  return self->_wellKnownURL;
}

- (void)setWellKnownURL:(id)a3
{
  objc_storeStrong((id *)&self->_wellKnownURL, a3);
}

- (HDCodableMessageVersion)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
  objc_storeStrong((id *)&self->_messageVersion, a3);
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wellKnownURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_messageVersion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
