@implementation CKCodeProto2ProtectedEnvelope

- (BOOL)hasEncrypted
{
  return self->_encrypted != 0;
}

- (void)setEncrypted:(id)a3
{
  NSData *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSData *encrypted;

  v4 = (NSData *)a3;
  objc_msgSend_clearOneofValuesForContents(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_contents = 1;
  encrypted = self->_encrypted;
  self->_encrypted = v4;

}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setValue:(id)a3
{
  CKCodeProto2Any *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKCodeProto2Any *value;

  v4 = (CKCodeProto2Any *)a3;
  objc_msgSend_clearOneofValuesForContents(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_contents = 2;
  value = self->_value;
  self->_value = v4;

}

- (int)contents
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_contents;
  else
    return 0;
}

- (void)setContents:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_contents = a3;
}

- (void)setHasContents:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContents
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)contentsAsString:(int)a3
{
  uint64_t v3;

  if (a3 < 3)
    return off_1E1F62840[a3];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsContents:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("PBUNSET"), v5) & 1) != 0)
  {
    v8 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("encrypted"), v7) & 1) != 0)
  {
    v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("value"), v10))
  {
    v8 = 2;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)clearOneofValuesForContents
{
  NSData *encrypted;
  CKCodeProto2Any *value;

  *(_BYTE *)&self->_has &= ~1u;
  self->_contents = 0;
  encrypted = self->_encrypted;
  self->_encrypted = 0;

  value = self->_value;
  self->_value = 0;

}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)CKCodeProto2ProtectedEnvelope;
  -[CKCodeProto2ProtectedEnvelope description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSData *encrypted;
  CKCodeProto2Any *value;
  void *v11;
  const char *v12;
  uint64_t contents;
  __CFString *v14;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  encrypted = self->_encrypted;
  if (encrypted)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)encrypted, (uint64_t)CFSTR("encrypted"));
  value = self->_value;
  if (value)
  {
    objc_msgSend_dictionaryRepresentation(value, v6, (uint64_t)encrypted, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v12, (uint64_t)v11, (uint64_t)CFSTR("value"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    contents = self->_contents;
    if (contents >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("(unknown: %i)"), v7, self->_contents);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E1F62840[contents];
    }
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)v14, (uint64_t)CFSTR("contents"));

  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  uint64_t v3;

  return CKCodeProto2ProtectedEnvelopeReadFrom((uint64_t)self, (uint64_t)a3, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_encrypted)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  uint64_t v6;
  NSData *encrypted;
  CKCodeProto2Any *value;
  _DWORD *v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_contents;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  encrypted = self->_encrypted;
  v9 = v4;
  if (encrypted)
  {
    objc_msgSend_setEncrypted_(v4, v5, (uint64_t)encrypted, v6);
    v4 = v9;
  }
  value = self->_value;
  if (value)
  {
    objc_msgSend_setValue_(v9, v5, (uint64_t)value, v6);
    v4 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (_QWORD *)v12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v12 + 8) = self->_contents;
    *(_BYTE *)(v12 + 32) |= 1u;
  }
  v16 = objc_msgSend_copyWithZone_(self->_encrypted, v13, (uint64_t)a3, v14);
  v17 = (void *)v15[2];
  v15[2] = v16;

  v20 = objc_msgSend_copyWithZone_(self->_value, v18, (uint64_t)a3, v19);
  v21 = (void *)v15[3];
  v15[3] = v20;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSData *encrypted;
  uint64_t v11;
  CKCodeProto2Any *value;
  uint64_t v13;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[4] & 1) == 0 || self->_contents != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((v4[4] & 1) != 0)
  {
LABEL_11:
    isEqual = 0;
    goto LABEL_12;
  }
  encrypted = self->_encrypted;
  v11 = v4[2];
  if ((unint64_t)encrypted | v11 && !objc_msgSend_isEqual_(encrypted, v8, v11, v9))
    goto LABEL_11;
  value = self->_value;
  v13 = v4[3];
  if ((unint64_t)value | v13)
    isEqual = objc_msgSend_isEqual_(value, v8, v13, v9);
  else
    isEqual = 1;
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_contents;
  else
    v5 = 0;
  v6 = objc_msgSend_hash(self->_encrypted, a2, v2, v3) ^ v5;
  return v6 ^ objc_msgSend_hash(self->_value, v7, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  CKCodeProto2Any *value;
  uint64_t v9;
  char *v10;

  v4 = a3;
  v6 = (char *)v4;
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_contents = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v7 = *((_QWORD *)v4 + 2);
  v10 = (char *)v4;
  if (v7)
  {
    objc_msgSend_setEncrypted_(self, (const char *)v4, v7, v5);
    v6 = v10;
  }
  value = self->_value;
  v9 = *((_QWORD *)v6 + 3);
  if (value)
  {
    if (v9)
    {
      objc_msgSend_mergeFrom_(value, v6, v9, v5);
LABEL_10:
      v6 = v10;
    }
  }
  else if (v9)
  {
    objc_msgSend_setValue_(self, v6, v9, v5);
    goto LABEL_10;
  }

}

- (NSData)encrypted
{
  return self->_encrypted;
}

- (CKCodeProto2Any)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_encrypted, 0);
}

@end
