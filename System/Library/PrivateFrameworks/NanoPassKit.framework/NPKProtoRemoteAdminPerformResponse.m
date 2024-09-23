@implementation NPKProtoRemoteAdminPerformResponse

- (BOOL)hasResponseDictionary
{
  return self->_responseDictionary != 0;
}

- (void)setHttpStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_httpStatus = a3;
}

- (void)setHasHttpStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHttpStatus
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)NPKProtoRemoteAdminPerformResponse;
  -[NPKProtoRemoteAdminPerformResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemoteAdminPerformResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *responseDictionary;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_resultCode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("resultCode"));

  responseDictionary = self->_responseDictionary;
  if (responseDictionary)
    objc_msgSend(v3, "setObject:forKey:", responseDictionary, CFSTR("responseDictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_httpStatus);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("httpStatus"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemoteAdminPerformResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_responseDictionary)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  v4[6] = self->_resultCode;
  if (self->_responseDictionary)
  {
    v5 = v4;
    objc_msgSend(v4, "setResponseDictionary:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_httpStatus;
    *((_BYTE *)v4 + 28) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_resultCode;
  v6 = -[NSData copyWithZone:](self->_responseDictionary, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_httpStatus;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *responseDictionary;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if (self->_resultCode != *((_DWORD *)v4 + 6))
    goto LABEL_9;
  responseDictionary = self->_responseDictionary;
  if ((unint64_t)responseDictionary | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](responseDictionary, "isEqual:"))
      goto LABEL_9;
  }
  v6 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0 && self->_httpStatus == *((_DWORD *)v4 + 2))
    {
      v6 = 1;
      goto LABEL_10;
    }
LABEL_9:
    v6 = 0;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  unsigned int resultCode;
  uint64_t v4;
  uint64_t v5;

  resultCode = self->_resultCode;
  v4 = -[NSData hash](self->_responseDictionary, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_httpStatus;
  else
    v5 = 0;
  return v4 ^ v5 ^ (2654435761 * resultCode);
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  self->_resultCode = v4[6];
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[NPKProtoRemoteAdminPerformResponse setResponseDictionary:](self, "setResponseDictionary:");
    v4 = v5;
  }
  if ((v4[7] & 1) != 0)
  {
    self->_httpStatus = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unsigned)resultCode
{
  return self->_resultCode;
}

- (void)setResultCode:(unsigned int)a3
{
  self->_resultCode = a3;
}

- (NSData)responseDictionary
{
  return self->_responseDictionary;
}

- (void)setResponseDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_responseDictionary, a3);
}

- (int)httpStatus
{
  return self->_httpStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
