@implementation NPKProtoSignDataRequest

- (BOOL)hasDataToSign
{
  return self->_dataToSign != 0;
}

- (BOOL)hasDigestToSign
{
  return self->_digestToSign != 0;
}

- (int)entanglementMode
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_entanglementMode;
  else
    return 0;
}

- (void)setEntanglementMode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_entanglementMode = a3;
}

- (void)setHasEntanglementMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEntanglementMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)entanglementModeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("PlatformIdentifier");
  if (a3 == 1)
  {
    v3 = CFSTR("JCOPInfo");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsEntanglementMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PlatformIdentifier")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("JCOPInfo"));

  return v4;
}

- (BOOL)hasAid
{
  return self->_aid != 0;
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
  v8.super_class = (Class)NPKProtoSignDataRequest;
  -[NPKProtoSignDataRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoSignDataRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *dataToSign;
  NSData *digestToSign;
  int entanglementMode;
  __CFString *v8;
  NSString *aid;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  dataToSign = self->_dataToSign;
  if (dataToSign)
    objc_msgSend(v3, "setObject:forKey:", dataToSign, CFSTR("dataToSign"));
  digestToSign = self->_digestToSign;
  if (digestToSign)
    objc_msgSend(v4, "setObject:forKey:", digestToSign, CFSTR("digestToSign"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    entanglementMode = self->_entanglementMode;
    if (entanglementMode)
    {
      if (entanglementMode == 1)
      {
        v8 = CFSTR("JCOPInfo");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_entanglementMode);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v8 = CFSTR("PlatformIdentifier");
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("entanglementMode"));

  }
  aid = self->_aid;
  if (aid)
    objc_msgSend(v4, "setObject:forKey:", aid, CFSTR("aid"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSignDataRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_dataToSign)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_digestToSign)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_aid)
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
  if (self->_dataToSign)
  {
    objc_msgSend(v4, "setDataToSign:");
    v4 = v5;
  }
  if (self->_digestToSign)
  {
    objc_msgSend(v5, "setDigestToSign:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_entanglementMode;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  if (self->_aid)
  {
    objc_msgSend(v5, "setAid:");
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
  v6 = -[NSData copyWithZone:](self->_dataToSign, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSData copyWithZone:](self->_digestToSign, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_entanglementMode;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_aid, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *dataToSign;
  NSData *digestToSign;
  NSString *aid;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  dataToSign = self->_dataToSign;
  if ((unint64_t)dataToSign | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](dataToSign, "isEqual:"))
      goto LABEL_13;
  }
  digestToSign = self->_digestToSign;
  if ((unint64_t)digestToSign | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](digestToSign, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_entanglementMode != *((_DWORD *)v4 + 8))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  aid = self->_aid;
  if ((unint64_t)aid | *((_QWORD *)v4 + 1))
    v8 = -[NSString isEqual:](aid, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSData hash](self->_dataToSign, "hash");
  v4 = -[NSData hash](self->_digestToSign, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_entanglementMode;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_aid, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoSignDataRequest setDataToSign:](self, "setDataToSign:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoSignDataRequest setDigestToSign:](self, "setDigestToSign:");
    v4 = v5;
  }
  if ((v4[9] & 1) != 0)
  {
    self->_entanglementMode = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoSignDataRequest setAid:](self, "setAid:");
    v4 = v5;
  }

}

- (NSData)dataToSign
{
  return self->_dataToSign;
}

- (void)setDataToSign:(id)a3
{
  objc_storeStrong((id *)&self->_dataToSign, a3);
}

- (NSData)digestToSign
{
  return self->_digestToSign;
}

- (void)setDigestToSign:(id)a3
{
  objc_storeStrong((id *)&self->_digestToSign, a3);
}

- (NSString)aid
{
  return self->_aid;
}

- (void)setAid:(id)a3
{
  objc_storeStrong((id *)&self->_aid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestToSign, 0);
  objc_storeStrong((id *)&self->_dataToSign, 0);
  objc_storeStrong((id *)&self->_aid, 0);
}

@end
