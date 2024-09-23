@implementation FCCKPResponseOperationResultError

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverError, 0);
  objc_storeStrong((id *)&self->_extensionError, 0);
  objc_storeStrong((id *)&self->_errorKey, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_clientError, 0);
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
  v8.super_class = (Class)FCCKPResponseOperationResultError;
  -[FCCKPResponseOperationResultError description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPResponseOperationResultError dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  FCCKPResponseOperationResultErrorClient *clientError;
  void *v5;
  FCCKPResponseOperationResultErrorServer *serverError;
  void *v7;
  FCCKPResponseOperationResultErrorExtension *extensionError;
  void *v9;
  void *v10;
  NSString *errorDescription;
  NSString *errorKey;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  clientError = self->_clientError;
  if (clientError)
  {
    -[FCCKPResponseOperationResultErrorClient dictionaryRepresentation](clientError, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("clientError"));

  }
  serverError = self->_serverError;
  if (serverError)
  {
    -[FCCKPResponseOperationResultErrorServer dictionaryRepresentation](serverError, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("serverError"));

  }
  extensionError = self->_extensionError;
  if (extensionError)
  {
    -[FCCKPResponseOperationResultErrorExtension dictionaryRepresentation](extensionError, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("extensionError"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_retryAfterSeconds);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("retryAfterSeconds"));

  }
  errorDescription = self->_errorDescription;
  if (errorDescription)
    objc_msgSend(v3, "setObject:forKey:", errorDescription, CFSTR("errorDescription"));
  errorKey = self->_errorKey;
  if (errorKey)
    objc_msgSend(v3, "setObject:forKey:", errorKey, CFSTR("errorKey"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPResponseOperationResultErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_clientError)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_serverError)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_errorKey)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_extensionError)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[FCCKPResponseOperationResultErrorClient copyWithZone:](self->_clientError, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[FCCKPResponseOperationResultErrorServer copyWithZone:](self->_serverError, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_retryAfterSeconds;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_errorDescription, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_errorKey, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = -[FCCKPResponseOperationResultErrorExtension copyWithZone:](self->_extensionError, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  FCCKPResponseOperationResultErrorClient *clientError;
  FCCKPResponseOperationResultErrorServer *serverError;
  NSString *errorDescription;
  NSString *errorKey;
  FCCKPResponseOperationResultErrorExtension *extensionError;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  clientError = self->_clientError;
  if ((unint64_t)clientError | *((_QWORD *)v4 + 1))
  {
    if (!-[FCCKPResponseOperationResultErrorClient isEqual:](clientError, "isEqual:"))
      goto LABEL_17;
  }
  serverError = self->_serverError;
  if ((unint64_t)serverError | *((_QWORD *)v4 + 6))
  {
    if (!-[FCCKPResponseOperationResultErrorServer isEqual:](serverError, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_retryAfterSeconds != *((_DWORD *)v4 + 10))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](errorDescription, "isEqual:"))
  {
    goto LABEL_17;
  }
  errorKey = self->_errorKey;
  if ((unint64_t)errorKey | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](errorKey, "isEqual:"))
      goto LABEL_17;
  }
  extensionError = self->_extensionError;
  if ((unint64_t)extensionError | *((_QWORD *)v4 + 4))
    v10 = -[FCCKPResponseOperationResultErrorExtension isEqual:](extensionError, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[FCCKPResponseOperationResultErrorClient hash](self->_clientError, "hash");
  v4 = -[FCCKPResponseOperationResultErrorServer hash](self->_serverError, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_retryAfterSeconds;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_errorDescription, "hash");
  v7 = -[NSString hash](self->_errorKey, "hash");
  return v6 ^ v7 ^ -[FCCKPResponseOperationResultErrorExtension hash](self->_extensionError, "hash");
}

@end
