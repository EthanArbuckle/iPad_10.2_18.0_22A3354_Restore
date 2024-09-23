@implementation CKDPPackageManifestItem

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (void)setSize:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSize
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setLastItem:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lastItem = a3;
}

- (void)setHasLastItem:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastItem
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v11.super_class = (Class)CKDPPackageManifestItem;
  -[CKDPPackageManifestItem description](&v11, sel_description);
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
  NSData *signature;
  char has;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  signature = self->_signature;
  if (signature)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)signature, CFSTR("signature"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v5, self->_size);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, CFSTR("size"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_lastItem);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("lastItem"));

  }
  return v6;
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
  unint64_t v18;
  NSData *v19;
  NSData *signature;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  int64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  int v33;

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
      v18 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)&self->_has |= 2u;
        while (1)
        {
          v24 = *v4;
          v25 = *(_QWORD *)((char *)a3 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)((char *)a3 + *v5))
            break;
          v26 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v25);
          *(_QWORD *)((char *)a3 + v24) = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0)
            goto LABEL_39;
          v21 += 7;
          v15 = v22++ >= 9;
          if (v15)
          {
            v23 = 0;
            goto LABEL_41;
          }
        }
        *((_BYTE *)a3 + *v6) = 1;
LABEL_39:
        if (*((_BYTE *)a3 + *v6))
          v23 = 0;
LABEL_41:
        self->_lastItem = v23 != 0;
      }
      else if ((_DWORD)v18 == 2)
      {
        v27 = 0;
        v28 = 0;
        v29 = 0;
        *(_BYTE *)&self->_has |= 1u;
        while (1)
        {
          v30 = *v4;
          v31 = *(_QWORD *)((char *)a3 + v30);
          if (v31 == -1 || v31 >= *(_QWORD *)((char *)a3 + *v5))
            break;
          v32 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v31);
          *(_QWORD *)((char *)a3 + v30) = v31 + 1;
          v29 |= (unint64_t)(v32 & 0x7F) << v27;
          if ((v32 & 0x80) == 0)
            goto LABEL_43;
          v27 += 7;
          v15 = v28++ >= 9;
          if (v15)
          {
            v29 = 0;
            goto LABEL_45;
          }
        }
        *((_BYTE *)a3 + *v6) = 1;
LABEL_43:
        if (*((_BYTE *)a3 + *v6))
          v29 = 0;
LABEL_45:
        self->_size = v29;
      }
      else if ((_DWORD)v18 == 1)
      {
        PBReaderReadData();
        v19 = (NSData *)objc_claimAutoreleasedReturnValue();
        signature = self->_signature;
        self->_signature = v19;

      }
      else
      {
        v33 = PBReaderSkipValueWithTag();
        if (!v33)
          return v33;
      }
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v33) = *((_BYTE *)a3 + *v6) == 0;
  return v33;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_signature)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSData *signature;
  char has;
  id v8;

  v4 = a3;
  signature = self->_signature;
  if (signature)
  {
    v8 = v4;
    objc_msgSend_setSignature_(v4, v5, (uint64_t)signature);
    v4 = v8;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_size;
    *((_BYTE *)v4 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 24) = self->_lastItem;
    *((_BYTE *)v4 + 28) |= 2u;
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
  char has;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_signature, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v12;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v10 + 8) = self->_size;
    *(_BYTE *)(v10 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v10 + 24) = self->_lastItem;
    *(_BYTE *)(v10 + 28) |= 2u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSData *signature;
  uint64_t v9;
  BOOL v10;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_11;
  signature = self->_signature;
  v9 = v4[2];
  if ((unint64_t)signature | v9)
  {
    if (!objc_msgSend_isEqual_(signature, v7, v9))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_size != v4[1])
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_11;
  }
  v10 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
    {
LABEL_11:
      v10 = 0;
      goto LABEL_12;
    }
    if (self->_lastItem)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_11;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_11;
    }
    v10 = 1;
  }
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(self->_signature, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_size;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v5 ^ v4 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_lastItem;
  return v5 ^ v4 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  v6 = *((_QWORD *)v4 + 2);
  if (v6)
  {
    v8 = v4;
    objc_msgSend_setSignature_(self, v5, v6);
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 28);
  if ((v7 & 1) != 0)
  {
    self->_size = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 28);
  }
  if ((v7 & 2) != 0)
  {
    self->_lastItem = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (int64_t)size
{
  return self->_size;
}

- (BOOL)lastItem
{
  return self->_lastItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
}

@end
