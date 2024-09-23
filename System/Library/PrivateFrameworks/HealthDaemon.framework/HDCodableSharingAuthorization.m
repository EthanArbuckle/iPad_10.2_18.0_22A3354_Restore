@implementation HDCodableSharingAuthorization

- (BOOL)hasAuthorizationIdentifier
{
  return self->_authorizationIdentifier != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasDisplaySubtitle
{
  return self->_displaySubtitle != 0;
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
  v8.super_class = (Class)HDCodableSharingAuthorization;
  -[HDCodableSharingAuthorization description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSharingAuthorization dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *authorizationIdentifier;
  NSString *displayName;
  NSString *displaySubtitle;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  authorizationIdentifier = self->_authorizationIdentifier;
  if (authorizationIdentifier)
    objc_msgSend(v3, "setObject:forKey:", authorizationIdentifier, CFSTR("authorizationIdentifier"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKey:", displayName, CFSTR("displayName"));
  displaySubtitle = self->_displaySubtitle;
  if (displaySubtitle)
    objc_msgSend(v4, "setObject:forKey:", displaySubtitle, CFSTR("displaySubtitle"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSharingAuthorizationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_authorizationIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_displaySubtitle)
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
  if (self->_authorizationIdentifier)
  {
    objc_msgSend(v4, "setAuthorizationIdentifier:");
    v4 = v5;
  }
  if (self->_displayName)
  {
    objc_msgSend(v5, "setDisplayName:");
    v4 = v5;
  }
  if (self->_displaySubtitle)
  {
    objc_msgSend(v5, "setDisplaySubtitle:");
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
  v6 = -[NSString copyWithZone:](self->_authorizationIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_displaySubtitle, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *authorizationIdentifier;
  NSString *displayName;
  NSString *displaySubtitle;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((authorizationIdentifier = self->_authorizationIdentifier, !((unint64_t)authorizationIdentifier | v4[1]))
     || -[NSString isEqual:](authorizationIdentifier, "isEqual:"))
    && ((displayName = self->_displayName, !((unint64_t)displayName | v4[2]))
     || -[NSString isEqual:](displayName, "isEqual:")))
  {
    displaySubtitle = self->_displaySubtitle;
    if ((unint64_t)displaySubtitle | v4[3])
      v8 = -[NSString isEqual:](displaySubtitle, "isEqual:");
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

  v3 = -[NSString hash](self->_authorizationIdentifier, "hash");
  v4 = -[NSString hash](self->_displayName, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_displaySubtitle, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[HDCodableSharingAuthorization setAuthorizationIdentifier:](self, "setAuthorizationIdentifier:");
  if (v4[2])
    -[HDCodableSharingAuthorization setDisplayName:](self, "setDisplayName:");
  if (v4[3])
    -[HDCodableSharingAuthorization setDisplaySubtitle:](self, "setDisplaySubtitle:");

}

- (NSString)authorizationIdentifier
{
  return self->_authorizationIdentifier;
}

- (void)setAuthorizationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationIdentifier, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)displaySubtitle
{
  return self->_displaySubtitle;
}

- (void)setDisplaySubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_displaySubtitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displaySubtitle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifier, 0);
}

- (HDCodableSharingAuthorization)initWithSharingAuthorization:(id)a3
{
  id v4;
  HDCodableSharingAuthorization *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDCodableSharingAuthorization;
  v5 = -[HDCodableSharingAuthorization init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "authorizationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableSharingAuthorization setAuthorizationIdentifier:](v5, "setAuthorizationIdentifier:", v6);

    objc_msgSend(v4, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableSharingAuthorization setDisplayName:](v5, "setDisplayName:", v8);

    }
    objc_msgSend(v4, "displaySubtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "displaySubtitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableSharingAuthorization setDisplaySubtitle:](v5, "setDisplaySubtitle:", v10);

    }
  }

  return v5;
}

- (id)sharingAuthorization
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB6B90]);
  -[HDCodableSharingAuthorization authorizationIdentifier](self, "authorizationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSharingAuthorization displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSharingAuthorization displaySubtitle](self, "displaySubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithAuthorizationIdentifier:displayName:displaySubtitle:", v4, v5, v6);

  return v7;
}

@end
