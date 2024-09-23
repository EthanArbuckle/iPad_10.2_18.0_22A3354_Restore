@implementation SPProtoAudioFilePlayerStatus

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasErrorDict
{
  return self->_errorDict != 0;
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
  v8.super_class = (Class)SPProtoAudioFilePlayerStatus;
  -[SPProtoAudioFilePlayerStatus description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoAudioFilePlayerStatus dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  void *v6;
  NSString *errorDomain;
  void *v8;
  NSData *errorDict;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_status);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("status"));

  }
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v4, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_errorCode);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("errorCode"));

  }
  errorDict = self->_errorDict;
  if (errorDict)
    objc_msgSend(v4, "setObject:forKey:", errorDict, CFSTR("errorDict"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFilePlayerStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_errorDict)
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
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_status;
    *((_BYTE *)v4 + 44) |= 2u;
  }
  if (self->_errorDomain)
  {
    objc_msgSend(v5, "setErrorDomain:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_errorCode;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  if (self->_errorDict)
  {
    objc_msgSend(v5, "setErrorDict:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_status;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_errorCode;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v10 = -[NSData copyWithZone:](self->_errorDict, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  char has;
  NSString *errorDomain;
  NSData *errorDict;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_19;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_status != *((_DWORD *)v4 + 10))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_19;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](errorDomain, "isEqual:"))
    {
LABEL_19:
      v9 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_errorCode != *((_QWORD *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_19;
  }
  errorDict = self->_errorDict;
  if ((unint64_t)errorDict | *((_QWORD *)v4 + 2))
    v9 = -[NSData isEqual:](errorDict, "isEqual:");
  else
    v9 = 1;
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_status;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_errorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_errorCode;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSData hash](self->_errorDict, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[SPProtoAudioFilePlayerStatus setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    self->_status = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[SPProtoAudioFilePlayerStatus setErrorDomain:](self, "setErrorDomain:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    self->_errorCode = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[SPProtoAudioFilePlayerStatus setErrorDict:](self, "setErrorDict:");
    v4 = v5;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int)status
{
  return self->_status;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (NSData)errorDict
{
  return self->_errorDict;
}

- (void)setErrorDict:(id)a3
{
  objc_storeStrong((id *)&self->_errorDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_errorDict, 0);
}

- (id)sockPuppetMessageForPlayerItemSetStatus
{
  SPProtoAudioFilePlayerItem *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFilePlayerItem);
  -[SPProtoAudioFilePlayerItem setSetStatus:](v3, "setSetStatus:", self);
  -[SPProtoAudioFilePlayerItem sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sockPuppetMessageForQueuePlayerSetStatus
{
  SPProtoAudioFileQueuePlayer *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  -[SPProtoAudioFileQueuePlayer setSetStatus:](v3, "setSetStatus:", self);
  -[SPProtoAudioFileQueuePlayer sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
