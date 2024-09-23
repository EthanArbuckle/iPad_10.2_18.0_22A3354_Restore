@implementation HDCodableAuthorizationResponseMessage

- (BOOL)hasAppBundleIdentifier
{
  return self->_appBundleIdentifier != 0;
}

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (void)setShouldPrompt:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_shouldPrompt = a3;
}

- (void)setHasShouldPrompt:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShouldPrompt
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasHostAppName
{
  return self->_hostAppName != 0;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
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
  v8.super_class = (Class)HDCodableAuthorizationResponseMessage;
  -[HDCodableAuthorizationResponseMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableAuthorizationResponseMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *appBundleIdentifier;
  NSData *requestIdentifier;
  void *v7;
  NSString *hostAppName;
  NSString *errorDescription;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  appBundleIdentifier = self->_appBundleIdentifier;
  if (appBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", appBundleIdentifier, CFSTR("appBundleIdentifier"));
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier)
    objc_msgSend(v4, "setObject:forKey:", requestIdentifier, CFSTR("requestIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldPrompt);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("shouldPrompt"));

  }
  hostAppName = self->_hostAppName;
  if (hostAppName)
    objc_msgSend(v4, "setObject:forKey:", hostAppName, CFSTR("hostAppName"));
  errorDescription = self->_errorDescription;
  if (errorDescription)
    objc_msgSend(v4, "setObject:forKey:", errorDescription, CFSTR("errorDescription"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableAuthorizationResponseMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_appBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_requestIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hostAppName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_appBundleIdentifier)
  {
    objc_msgSend(v4, "setAppBundleIdentifier:");
    v4 = v5;
  }
  if (self->_requestIdentifier)
  {
    objc_msgSend(v5, "setRequestIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[40] = self->_shouldPrompt;
    v4[44] |= 1u;
  }
  if (self->_hostAppName)
  {
    objc_msgSend(v5, "setHostAppName:");
    v4 = v5;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v5, "setErrorDescription:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_appBundleIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSData copyWithZone:](self->_requestIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_shouldPrompt;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_hostAppName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_errorDescription, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *appBundleIdentifier;
  NSData *requestIdentifier;
  NSString *hostAppName;
  NSString *errorDescription;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  appBundleIdentifier = self->_appBundleIdentifier;
  if ((unint64_t)appBundleIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](appBundleIdentifier, "isEqual:"))
      goto LABEL_18;
  }
  requestIdentifier = self->_requestIdentifier;
  if ((unint64_t)requestIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](requestIdentifier, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) != 0)
    {
      if (self->_shouldPrompt)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_18;
        goto LABEL_14;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_14;
    }
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
    goto LABEL_18;
LABEL_14:
  hostAppName = self->_hostAppName;
  if ((unint64_t)hostAppName | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](hostAppName, "isEqual:"))
  {
    goto LABEL_18;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((_QWORD *)v4 + 2))
    v9 = -[NSString isEqual:](errorDescription, "isEqual:");
  else
    v9 = 1;
LABEL_19:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_appBundleIdentifier, "hash");
  v4 = -[NSData hash](self->_requestIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_shouldPrompt;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_hostAppName, "hash");
  return v6 ^ -[NSString hash](self->_errorDescription, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[HDCodableAuthorizationResponseMessage setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCodableAuthorizationResponseMessage setRequestIdentifier:](self, "setRequestIdentifier:");
    v4 = v5;
  }
  if (v4[44])
  {
    self->_shouldPrompt = v4[40];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCodableAuthorizationResponseMessage setHostAppName:](self, "setHostAppName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[HDCodableAuthorizationResponseMessage setErrorDescription:](self, "setErrorDescription:");
    v4 = v5;
  }

}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, a3);
}

- (NSData)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (BOOL)shouldPrompt
{
  return self->_shouldPrompt;
}

- (NSString)hostAppName
{
  return self->_hostAppName;
}

- (void)setHostAppName:(id)a3
{
  objc_storeStrong((id *)&self->_hostAppName, a3);
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_errorDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_hostAppName, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end
