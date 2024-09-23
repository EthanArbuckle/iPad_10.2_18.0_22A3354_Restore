@implementation ModelKeyServerAPIFetchKeyRequest

- (BOOL)hasKeyId
{
  return self->_keyId != 0;
}

- (BOOL)hasTeamId
{
  return self->_teamId != 0;
}

- (BOOL)hasSignedKeyRequest
{
  return self->_signedKeyRequest != 0;
}

- (void)setRawRequest:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_rawRequest = a3;
}

- (void)setHasRawRequest:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRawRequest
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ModelKeyServerAPIFetchKeyRequest;
  -[ModelKeyServerAPIFetchKeyRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ModelKeyServerAPIFetchKeyRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *keyId;
  NSString *teamId;
  NSData *signedKeyRequest;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  keyId = self->_keyId;
  if (keyId)
    objc_msgSend(v3, "setObject:forKey:", keyId, CFSTR("key_id"));
  teamId = self->_teamId;
  if (teamId)
    objc_msgSend(v4, "setObject:forKey:", teamId, CFSTR("team_id"));
  signedKeyRequest = self->_signedKeyRequest;
  if (signedKeyRequest)
    objc_msgSend(v4, "setObject:forKey:", signedKeyRequest, CFSTR("signed_key_request"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_rawRequest);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("raw_request"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  objc_class *v18;
  uint64_t v19;
  int v20;
  void *v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*((_BYTE *)a3 + *v6))
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        break;
      switch((v11 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v19 = 8;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v19 = 24;
          goto LABEL_24;
        case 3u:
          PBReaderReadData();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v19 = 16;
LABEL_24:
          v21 = *(Class *)((char *)&self->super.super.super.isa + v19);
          *(Class *)((char *)&self->super.super.super.isa + v19) = v18;

          continue;
        case 4u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          *(_BYTE *)&self->_has |= 1u;
          break;
        default:
          v20 = PBReaderSkipValueWithTag();
          if (!v20)
            return v20;
          continue;
      }
      while (1)
      {
        v25 = *v4;
        v26 = *(_QWORD *)((char *)a3 + v25);
        if (v26 == -1 || v26 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v27 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v26);
        *(_QWORD *)((char *)a3 + v25) = v26 + 1;
        v24 |= (unint64_t)(v27 & 0x7F) << v22;
        if ((v27 & 0x80) == 0)
          goto LABEL_33;
        v22 += 7;
        v15 = v23++ >= 9;
        if (v15)
        {
          v24 = 0;
          goto LABEL_35;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_33:
      if (*((_BYTE *)a3 + *v6))
        v24 = 0;
LABEL_35:
      self->_rawRequest = v24 != 0;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v20) = *((_BYTE *)a3 + *v6) == 0;
  return v20;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_keyId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_teamId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_signedKeyRequest)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_keyId)
  {
    objc_msgSend(v4, "setKeyId:");
    v4 = v5;
  }
  if (self->_teamId)
  {
    objc_msgSend(v5, "setTeamId:");
    v4 = v5;
  }
  if (self->_signedKeyRequest)
  {
    objc_msgSend(v5, "setSignedKeyRequest:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[32] = self->_rawRequest;
    v4[36] |= 1u;
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
  v6 = -[NSString copyWithZone:](self->_keyId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_teamId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSData copyWithZone:](self->_signedKeyRequest, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_rawRequest;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *keyId;
  NSString *teamId;
  NSData *signedKeyRequest;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  keyId = self->_keyId;
  if ((unint64_t)keyId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](keyId, "isEqual:"))
      goto LABEL_10;
  }
  teamId = self->_teamId;
  if ((unint64_t)teamId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](teamId, "isEqual:"))
      goto LABEL_10;
  }
  signedKeyRequest = self->_signedKeyRequest;
  if ((unint64_t)signedKeyRequest | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](signedKeyRequest, "isEqual:"))
      goto LABEL_10;
  }
  v8 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0)
    {
LABEL_10:
      v8 = 0;
      goto LABEL_11;
    }
    if (self->_rawRequest)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_10;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_10;
    }
    v8 = 1;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_keyId, "hash");
  v4 = -[NSString hash](self->_teamId, "hash");
  v5 = -[NSData hash](self->_signedKeyRequest, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_rawRequest;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[ModelKeyServerAPIFetchKeyRequest setKeyId:](self, "setKeyId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ModelKeyServerAPIFetchKeyRequest setTeamId:](self, "setTeamId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[ModelKeyServerAPIFetchKeyRequest setSignedKeyRequest:](self, "setSignedKeyRequest:");
    v4 = v5;
  }
  if (v4[36])
  {
    self->_rawRequest = v4[32];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)keyId
{
  return self->_keyId;
}

- (void)setKeyId:(id)a3
{
  objc_storeStrong((id *)&self->_keyId, a3);
}

- (NSString)teamId
{
  return self->_teamId;
}

- (void)setTeamId:(id)a3
{
  objc_storeStrong((id *)&self->_teamId, a3);
}

- (NSData)signedKeyRequest
{
  return self->_signedKeyRequest;
}

- (void)setSignedKeyRequest:(id)a3
{
  objc_storeStrong((id *)&self->_signedKeyRequest, a3);
}

- (BOOL)rawRequest
{
  return self->_rawRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_signedKeyRequest, 0);
  objc_storeStrong((id *)&self->_keyId, 0);
}

@end
