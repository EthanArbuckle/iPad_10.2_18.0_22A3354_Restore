@implementation CKDPOneTimeFullTokenInfo

- (BOOL)hasSharingKeyBytes
{
  return self->_sharingKeyBytes != 0;
}

- (void)setSharingKeyType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sharingKeyType = a3;
}

- (void)setHasSharingKeyType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSharingKeyType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSharingKeySeed
{
  return self->_sharingKeySeed != 0;
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
  v13.super_class = (Class)CKDPOneTimeFullTokenInfo;
  -[CKDPOneTimeFullTokenInfo description](&v13, sel_description);
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
  NSData *sharingKeyBytes;
  void *v10;
  const char *v11;
  NSData *sharingKeySeed;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  sharingKeyBytes = self->_sharingKeyBytes;
  if (sharingKeyBytes)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)sharingKeyBytes, (uint64_t)CFSTR("sharingKeyBytes"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v6, self->_sharingKeyType, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, (uint64_t)CFSTR("sharingKeyType"));

  }
  sharingKeySeed = self->_sharingKeySeed;
  if (sharingKeySeed)
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)sharingKeySeed, (uint64_t)CFSTR("sharingKeySeed"));
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPOneTimeFullTokenInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sharingKeyBytes)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_sharingKeySeed)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSData *sharingKeyBytes;
  NSData *sharingKeySeed;
  id v9;

  v4 = a3;
  sharingKeyBytes = self->_sharingKeyBytes;
  v9 = v4;
  if (sharingKeyBytes)
  {
    objc_msgSend_setSharingKeyBytes_(v4, v5, (uint64_t)sharingKeyBytes, v6);
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_sharingKeyType;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  sharingKeySeed = self->_sharingKeySeed;
  if (sharingKeySeed)
  {
    objc_msgSend_setSharingKeySeed_(v9, v5, (uint64_t)sharingKeySeed, v6);
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
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = objc_msgSend_copyWithZone_(self->_sharingKeyBytes, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 8);
  *(_QWORD *)(v12 + 8) = v15;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v12 + 24) = self->_sharingKeyType;
    *(_BYTE *)(v12 + 28) |= 1u;
  }
  v19 = objc_msgSend_copyWithZone_(self->_sharingKeySeed, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v12 + 16);
  *(_QWORD *)(v12 + 16) = v19;

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSData *sharingKeyBytes;
  uint64_t v11;
  NSData *sharingKeySeed;
  uint64_t v13;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_11;
  sharingKeyBytes = self->_sharingKeyBytes;
  v11 = v4[1];
  if ((unint64_t)sharingKeyBytes | v11)
  {
    if (!objc_msgSend_isEqual_(sharingKeyBytes, v8, v11, v9))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_sharingKeyType != *((_DWORD *)v4 + 6))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    isEqual = 0;
    goto LABEL_12;
  }
  sharingKeySeed = self->_sharingKeySeed;
  v13 = v4[2];
  if ((unint64_t)sharingKeySeed | v13)
    isEqual = objc_msgSend_isEqual_(sharingKeySeed, v8, v13, v9);
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
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = objc_msgSend_hash(self->_sharingKeyBytes, a2, v2, v3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761 * self->_sharingKeyType;
  else
    v9 = 0;
  return v9 ^ v5 ^ objc_msgSend_hash(self->_sharingKeySeed, v6, v7, v8);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v7 = *((_QWORD *)v4 + 1);
  v9 = v4;
  if (v7)
  {
    objc_msgSend_setSharingKeyBytes_(self, v5, v7, v6);
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_sharingKeyType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  v8 = *((_QWORD *)v4 + 2);
  if (v8)
  {
    objc_msgSend_setSharingKeySeed_(self, v5, v8, v6);
    v4 = v9;
  }

}

- (NSData)sharingKeyBytes
{
  return self->_sharingKeyBytes;
}

- (void)setSharingKeyBytes:(id)a3
{
  objc_storeStrong((id *)&self->_sharingKeyBytes, a3);
}

- (int)sharingKeyType
{
  return self->_sharingKeyType;
}

- (NSData)sharingKeySeed
{
  return self->_sharingKeySeed;
}

- (void)setSharingKeySeed:(id)a3
{
  objc_storeStrong((id *)&self->_sharingKeySeed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingKeySeed, 0);
  objc_storeStrong((id *)&self->_sharingKeyBytes, 0);
}

@end
