@implementation HDCodableAuthorizationCompleteMessage

- (BOOL)hasAppBundleIdentifier
{
  return self->_appBundleIdentifier != 0;
}

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
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
  v8.super_class = (Class)HDCodableAuthorizationCompleteMessage;
  -[HDCodableAuthorizationCompleteMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableAuthorizationCompleteMessage dictionaryRepresentation](self, "dictionaryRepresentation");
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
  errorDescription = self->_errorDescription;
  if (errorDescription)
    objc_msgSend(v4, "setObject:forKey:", errorDescription, CFSTR("errorDescription"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableAuthorizationCompleteMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_errorDescription)
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
  if (self->_errorDescription)
  {
    objc_msgSend(v5, "setErrorDescription:");
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
  v6 = -[NSString copyWithZone:](self->_appBundleIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_requestIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_errorDescription, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *appBundleIdentifier;
  NSData *requestIdentifier;
  NSString *errorDescription;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((appBundleIdentifier = self->_appBundleIdentifier, !((unint64_t)appBundleIdentifier | v4[1]))
     || -[NSString isEqual:](appBundleIdentifier, "isEqual:"))
    && ((requestIdentifier = self->_requestIdentifier, !((unint64_t)requestIdentifier | v4[3]))
     || -[NSData isEqual:](requestIdentifier, "isEqual:")))
  {
    errorDescription = self->_errorDescription;
    if ((unint64_t)errorDescription | v4[2])
      v8 = -[NSString isEqual:](errorDescription, "isEqual:");
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
  uint64_t v4;

  v3 = -[NSString hash](self->_appBundleIdentifier, "hash");
  v4 = -[NSData hash](self->_requestIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_errorDescription, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[HDCodableAuthorizationCompleteMessage setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
  if (v4[3])
    -[HDCodableAuthorizationCompleteMessage setRequestIdentifier:](self, "setRequestIdentifier:");
  if (v4[2])
    -[HDCodableAuthorizationCompleteMessage setErrorDescription:](self, "setErrorDescription:");

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
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end
