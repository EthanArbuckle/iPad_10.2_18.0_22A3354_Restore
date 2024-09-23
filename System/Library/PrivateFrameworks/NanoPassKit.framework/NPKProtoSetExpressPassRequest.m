@implementation NPKProtoSetExpressPassRequest

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (void)setCancelOutstandingRequests:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cancelOutstandingRequests = a3;
}

- (void)setHasCancelOutstandingRequests:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCancelOutstandingRequests
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasApplicationIdentifier
{
  return self->_applicationIdentifier != 0;
}

- (void)setRequestAuthorization:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requestAuthorization = a3;
}

- (void)setHasRequestAuthorization:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestAuthorization
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasExpressPassInformation
{
  return self->_expressPassInformation != 0;
}

- (BOOL)hasExpressPassConfiguration
{
  return self->_expressPassConfiguration != 0;
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
  v8.super_class = (Class)NPKProtoSetExpressPassRequest;
  -[NPKProtoSetExpressPassRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoSetExpressPassRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uniqueID;
  void *v6;
  NSString *applicationIdentifier;
  void *v8;
  NSData *expressPassInformation;
  NSData *expressPassConfiguration;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uniqueID = self->_uniqueID;
  if (uniqueID)
    objc_msgSend(v3, "setObject:forKey:", uniqueID, CFSTR("uniqueID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cancelOutstandingRequests);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("cancelOutstandingRequests"));

  }
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier)
    objc_msgSend(v4, "setObject:forKey:", applicationIdentifier, CFSTR("applicationIdentifier"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_requestAuthorization);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("requestAuthorization"));

  }
  expressPassInformation = self->_expressPassInformation;
  if (expressPassInformation)
    objc_msgSend(v4, "setObject:forKey:", expressPassInformation, CFSTR("expressPassInformation"));
  expressPassConfiguration = self->_expressPassConfiguration;
  if (expressPassConfiguration)
    objc_msgSend(v4, "setObject:forKey:", expressPassConfiguration, CFSTR("expressPassConfiguration"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSetExpressPassRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uniqueID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_applicationIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_expressPassInformation)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_expressPassConfiguration)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_uniqueID)
  {
    objc_msgSend(v4, "setUniqueID:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[40] = self->_cancelOutstandingRequests;
    v4[44] |= 1u;
  }
  if (self->_applicationIdentifier)
  {
    objc_msgSend(v5, "setApplicationIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[41] = self->_requestAuthorization;
    v4[44] |= 2u;
  }
  if (self->_expressPassInformation)
  {
    objc_msgSend(v5, "setExpressPassInformation:");
    v4 = v5;
  }
  if (self->_expressPassConfiguration)
  {
    objc_msgSend(v5, "setExpressPassConfiguration:");
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
  v6 = -[NSString copyWithZone:](self->_uniqueID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_cancelOutstandingRequests;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_applicationIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 41) = self->_requestAuthorization;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
  v10 = -[NSData copyWithZone:](self->_expressPassInformation, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSData copyWithZone:](self->_expressPassConfiguration, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueID;
  char has;
  NSString *applicationIdentifier;
  NSData *expressPassInformation;
  NSData *expressPassConfiguration;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  uniqueID = self->_uniqueID;
  if ((unint64_t)uniqueID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](uniqueID, "isEqual:"))
      goto LABEL_27;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0)
      goto LABEL_27;
    if (self->_cancelOutstandingRequests)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_27;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_27;
  }
  applicationIdentifier = self->_applicationIdentifier;
  if ((unint64_t)applicationIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](applicationIdentifier, "isEqual:"))
      goto LABEL_27;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) != 0)
    {
      if (self->_requestAuthorization)
      {
        if (!*((_BYTE *)v4 + 41))
          goto LABEL_27;
        goto LABEL_23;
      }
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_23;
    }
LABEL_27:
    v10 = 0;
    goto LABEL_28;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
    goto LABEL_27;
LABEL_23:
  expressPassInformation = self->_expressPassInformation;
  if ((unint64_t)expressPassInformation | *((_QWORD *)v4 + 3)
    && !-[NSData isEqual:](expressPassInformation, "isEqual:"))
  {
    goto LABEL_27;
  }
  expressPassConfiguration = self->_expressPassConfiguration;
  if ((unint64_t)expressPassConfiguration | *((_QWORD *)v4 + 2))
    v10 = -[NSData isEqual:](expressPassConfiguration, "isEqual:");
  else
    v10 = 1;
LABEL_28:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_uniqueID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_cancelOutstandingRequests;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_applicationIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_requestAuthorization;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[NSData hash](self->_expressPassInformation, "hash");
  return v7 ^ v8 ^ -[NSData hash](self->_expressPassConfiguration, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[NPKProtoSetExpressPassRequest setUniqueID:](self, "setUniqueID:");
    v4 = v5;
  }
  if (v4[44])
  {
    self->_cancelOutstandingRequests = v4[40];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoSetExpressPassRequest setApplicationIdentifier:](self, "setApplicationIdentifier:");
    v4 = v5;
  }
  if ((v4[44] & 2) != 0)
  {
    self->_requestAuthorization = v4[41];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoSetExpressPassRequest setExpressPassInformation:](self, "setExpressPassInformation:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoSetExpressPassRequest setExpressPassConfiguration:](self, "setExpressPassConfiguration:");
    v4 = v5;
  }

}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (BOOL)cancelOutstandingRequests
{
  return self->_cancelOutstandingRequests;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIdentifier, a3);
}

- (BOOL)requestAuthorization
{
  return self->_requestAuthorization;
}

- (NSData)expressPassInformation
{
  return self->_expressPassInformation;
}

- (void)setExpressPassInformation:(id)a3
{
  objc_storeStrong((id *)&self->_expressPassInformation, a3);
}

- (NSData)expressPassConfiguration
{
  return self->_expressPassConfiguration;
}

- (void)setExpressPassConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_expressPassConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_expressPassInformation, 0);
  objc_storeStrong((id *)&self->_expressPassConfiguration, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
