@implementation CKDPProtectionInfoKeysToRemoveProtectionInfoKey

- (BOOL)hasKeyId
{
  return self->_keyId != 0;
}

- (int)keyType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_keyType;
  else
    return 1;
}

- (void)setKeyType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_keyType = a3;
}

- (void)setHasKeyType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKeyType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)keyTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E78386B8[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKeyType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("primary")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("keyPair")) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("sharee")))
  {
    v6 = 3;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPProtectionInfoKeysToRemoveProtectionInfoKey;
  -[CKDPProtectionInfoKeysToRemoveProtectionInfoKey description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  NSData *keyId;
  unsigned int v8;
  __CFString *v9;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  keyId = self->_keyId;
  if (keyId)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)keyId, CFSTR("keyId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = self->_keyType - 1;
    if (v8 >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_keyType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E78386B8[v8];
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v9, CFSTR("keyType"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC63044((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_keyId)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSData *keyId;
  id v7;

  v4 = a3;
  keyId = self->_keyId;
  if (keyId)
  {
    v7 = v4;
    objc_msgSend_setKeyId_(v4, v5, (uint64_t)keyId);
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_keyType;
    *((_BYTE *)v4 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_keyId, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 16) = self->_keyType;
    *(_BYTE *)(v10 + 20) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSData *keyId;
  uint64_t v9;
  BOOL v10;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_8;
  keyId = self->_keyId;
  v9 = v4[1];
  if ((unint64_t)keyId | v9)
  {
    if (!objc_msgSend_isEqual_(keyId, v7, v9))
      goto LABEL_8;
  }
  v10 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_keyType == *((_DWORD *)v4 + 4))
    {
      v10 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v10 = 0;
  }
LABEL_9:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend_hash(self->_keyId, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_keyType;
  else
    v5 = 0;
  return v5 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v6 = *((_QWORD *)v4 + 1);
  if (v6)
  {
    v7 = v4;
    objc_msgSend_setKeyId_(self, v5, v6);
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_keyType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)keyId
{
  return self->_keyId;
}

- (void)setKeyId:(id)a3
{
  objc_storeStrong((id *)&self->_keyId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyId, 0);
}

@end
