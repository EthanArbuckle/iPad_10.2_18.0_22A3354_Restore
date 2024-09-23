@implementation ModelKeyServerAPIFetchKeyResult

- (BOOL)hasKeyId
{
  return self->_keyId != 0;
}

- (BOOL)hasModelName
{
  return self->_modelName != 0;
}

- (BOOL)hasTeamId
{
  return self->_teamId != 0;
}

- (BOOL)hasSignedKey
{
  return self->_signedKey != 0;
}

- (void)setSignedKey:(id)a3
{
  ModelKeyServerAPISignedKey *v4;
  ModelKeyServerAPISignedKey *signedKey;

  v4 = (ModelKeyServerAPISignedKey *)a3;
  -[ModelKeyServerAPIFetchKeyResult clearOneofValuesForKey](self, "clearOneofValuesForKey");
  *(_BYTE *)&self->_has |= 1u;
  self->_key = 1;
  signedKey = self->_signedKey;
  self->_signedKey = v4;

}

- (BOOL)hasRawKey
{
  return self->_rawKey != 0;
}

- (void)setRawKey:(id)a3
{
  ModelKeyServerAPIRawKey *v4;
  ModelKeyServerAPIRawKey *rawKey;

  v4 = (ModelKeyServerAPIRawKey *)a3;
  -[ModelKeyServerAPIFetchKeyResult clearOneofValuesForKey](self, "clearOneofValuesForKey");
  *(_BYTE *)&self->_has |= 1u;
  self->_key = 2;
  rawKey = self->_rawKey;
  self->_rawKey = v4;

}

- (int)key
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_key;
  else
    return 0;
}

- (void)setKey:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_key = a3;
}

- (void)setHasKey:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKey
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)keyAsString:(int)a3
{
  if (a3 < 3)
    return off_1E3D64DC0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKey:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("signed_key")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("raw_key")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForKey
{
  ModelKeyServerAPISignedKey *signedKey;
  ModelKeyServerAPIRawKey *rawKey;

  *(_BYTE *)&self->_has &= ~1u;
  self->_key = 0;
  signedKey = self->_signedKey;
  self->_signedKey = 0;

  rawKey = self->_rawKey;
  self->_rawKey = 0;

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
  v8.super_class = (Class)ModelKeyServerAPIFetchKeyResult;
  -[ModelKeyServerAPIFetchKeyResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ModelKeyServerAPIFetchKeyResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *modelName;
  NSString *teamId;
  ModelKeyServerAPISignedKey *signedKey;
  void *v9;
  ModelKeyServerAPIRawKey *rawKey;
  void *v11;
  uint64_t key;
  __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  keyId = self->_keyId;
  if (keyId)
    objc_msgSend(v3, "setObject:forKey:", keyId, CFSTR("key_id"));
  modelName = self->_modelName;
  if (modelName)
    objc_msgSend(v4, "setObject:forKey:", modelName, CFSTR("model_name"));
  teamId = self->_teamId;
  if (teamId)
    objc_msgSend(v4, "setObject:forKey:", teamId, CFSTR("team_id"));
  signedKey = self->_signedKey;
  if (signedKey)
  {
    -[ModelKeyServerAPISignedKey dictionaryRepresentation](signedKey, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("signed_key"));

  }
  rawKey = self->_rawKey;
  if (rawKey)
  {
    -[ModelKeyServerAPIRawKey dictionaryRepresentation](rawKey, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("raw_key"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    key = self->_key;
    if (key >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_key);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E3D64DC0[key];
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Key"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ModelKeyServerAPIFetchKeyResultReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_modelName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_teamId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_signedKey)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_rawKey)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_key;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  v5 = v4;
  if (self->_keyId)
  {
    objc_msgSend(v4, "setKeyId:");
    v4 = v5;
  }
  if (self->_modelName)
  {
    objc_msgSend(v5, "setModelName:");
    v4 = v5;
  }
  if (self->_teamId)
  {
    objc_msgSend(v5, "setTeamId:");
    v4 = v5;
  }
  if (self->_signedKey)
  {
    objc_msgSend(v5, "setSignedKey:");
    v4 = v5;
  }
  if (self->_rawKey)
  {
    objc_msgSend(v5, "setRawKey:");
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
  id v13;
  void *v14;
  id v15;
  void *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_key;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_keyId, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_modelName, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  v11 = -[NSString copyWithZone:](self->_teamId, "copyWithZone:", a3);
  v12 = (void *)v6[6];
  v6[6] = v11;

  v13 = -[ModelKeyServerAPISignedKey copyWithZone:](self->_signedKey, "copyWithZone:", a3);
  v14 = (void *)v6[5];
  v6[5] = v13;

  v15 = -[ModelKeyServerAPIRawKey copyWithZone:](self->_rawKey, "copyWithZone:", a3);
  v16 = (void *)v6[4];
  v6[4] = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *keyId;
  NSString *modelName;
  NSString *teamId;
  ModelKeyServerAPISignedKey *signedKey;
  ModelKeyServerAPIRawKey *rawKey;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_key != *((_DWORD *)v4 + 2))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  keyId = self->_keyId;
  if ((unint64_t)keyId | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](keyId, "isEqual:"))
    goto LABEL_17;
  modelName = self->_modelName;
  if ((unint64_t)modelName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](modelName, "isEqual:"))
      goto LABEL_17;
  }
  teamId = self->_teamId;
  if ((unint64_t)teamId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](teamId, "isEqual:"))
      goto LABEL_17;
  }
  signedKey = self->_signedKey;
  if ((unint64_t)signedKey | *((_QWORD *)v4 + 5))
  {
    if (!-[ModelKeyServerAPISignedKey isEqual:](signedKey, "isEqual:"))
      goto LABEL_17;
  }
  rawKey = self->_rawKey;
  if ((unint64_t)rawKey | *((_QWORD *)v4 + 4))
    v10 = -[ModelKeyServerAPIRawKey isEqual:](rawKey, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_key;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_keyId, "hash") ^ v3;
  v5 = -[NSString hash](self->_modelName, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_teamId, "hash");
  v7 = -[ModelKeyServerAPISignedKey hash](self->_signedKey, "hash");
  return v6 ^ v7 ^ -[ModelKeyServerAPIRawKey hash](self->_rawKey, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  ModelKeyServerAPISignedKey *signedKey;
  uint64_t v7;
  ModelKeyServerAPIRawKey *rawKey;
  uint64_t v9;
  _QWORD *v10;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_key = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v10 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[ModelKeyServerAPIFetchKeyResult setKeyId:](self, "setKeyId:");
    v5 = v10;
  }
  if (v5[3])
  {
    -[ModelKeyServerAPIFetchKeyResult setModelName:](self, "setModelName:");
    v5 = v10;
  }
  if (v5[6])
  {
    -[ModelKeyServerAPIFetchKeyResult setTeamId:](self, "setTeamId:");
    v5 = v10;
  }
  signedKey = self->_signedKey;
  v7 = v5[5];
  if (signedKey)
  {
    if (!v7)
      goto LABEL_15;
    -[ModelKeyServerAPISignedKey mergeFrom:](signedKey, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_15;
    -[ModelKeyServerAPIFetchKeyResult setSignedKey:](self, "setSignedKey:");
  }
  v5 = v10;
LABEL_15:
  rawKey = self->_rawKey;
  v9 = v5[4];
  if (rawKey)
  {
    if (v9)
    {
      -[ModelKeyServerAPIRawKey mergeFrom:](rawKey, "mergeFrom:");
LABEL_20:
      v5 = v10;
    }
  }
  else if (v9)
  {
    -[ModelKeyServerAPIFetchKeyResult setRawKey:](self, "setRawKey:");
    goto LABEL_20;
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

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_storeStrong((id *)&self->_modelName, a3);
}

- (NSString)teamId
{
  return self->_teamId;
}

- (void)setTeamId:(id)a3
{
  objc_storeStrong((id *)&self->_teamId, a3);
}

- (ModelKeyServerAPISignedKey)signedKey
{
  return self->_signedKey;
}

- (ModelKeyServerAPIRawKey)rawKey
{
  return self->_rawKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_signedKey, 0);
  objc_storeStrong((id *)&self->_rawKey, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_keyId, 0);
}

@end
