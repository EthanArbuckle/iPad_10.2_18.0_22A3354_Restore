@implementation NTPBBackgroundSubscriptionValidation

- (int)resultType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_resultType;
  else
    return 0;
}

- (void)setResultType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_resultType = a3;
}

- (void)setHasResultType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResultType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
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
  v8.super_class = (Class)NTPBBackgroundSubscriptionValidation;
  -[NTPBBackgroundSubscriptionValidation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBBackgroundSubscriptionValidation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *errorMessage;
  NSString *errorCode;
  NSString *sourceChannelId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_resultType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("result_type"));

  }
  errorMessage = self->_errorMessage;
  if (errorMessage)
    objc_msgSend(v3, "setObject:forKey:", errorMessage, CFSTR("error_message"));
  errorCode = self->_errorCode;
  if (errorCode)
    objc_msgSend(v3, "setObject:forKey:", errorCode, CFSTR("error_code"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBBackgroundSubscriptionValidationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_errorMessage)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_errorCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_resultType;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_errorMessage, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_errorCode, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  v11 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *errorMessage;
  NSString *errorCode;
  NSString *sourceChannelId;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_resultType != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  errorMessage = self->_errorMessage;
  if ((unint64_t)errorMessage | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](errorMessage, "isEqual:"))
  {
    goto LABEL_13;
  }
  errorCode = self->_errorCode;
  if ((unint64_t)errorCode | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](errorCode, "isEqual:"))
      goto LABEL_13;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 4))
    v8 = -[NSString isEqual:](sourceChannelId, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_resultType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_errorMessage, "hash") ^ v3;
  v5 = -[NSString hash](self->_errorCode, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_sourceChannelId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[10] & 1) != 0)
  {
    self->_resultType = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBBackgroundSubscriptionValidation setErrorMessage:](self, "setErrorMessage:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBBackgroundSubscriptionValidation setErrorCode:](self, "setErrorCode:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBBackgroundSubscriptionValidation setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v5;
  }

}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
  objc_storeStrong((id *)&self->_errorMessage, a3);
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_errorCode, a3);
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
}

@end
