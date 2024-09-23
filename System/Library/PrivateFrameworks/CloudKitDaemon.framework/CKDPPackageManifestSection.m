@implementation CKDPPackageManifestSection

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

- (void)setLastSection:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lastSection = a3;
}

- (void)setHasLastSection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastSection
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasVerificationKey
{
  return self->_verificationKey != 0;
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
  v11.super_class = (Class)CKDPPackageManifestSection;
  -[CKDPPackageManifestSection description](&v11, sel_description);
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
  NSData *verificationKey;

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
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_lastSection);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("lastSection"));

  }
  verificationKey = self->_verificationKey;
  if (verificationKey)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)verificationKey, CFSTR("verificationKey"));
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
  objc_class *v18;
  uint64_t v19;
  int v20;
  char v21;
  unsigned int v22;
  int64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  void *v33;

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
          PBReaderReadData();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v19 = 16;
          goto LABEL_37;
        case 2u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (2)
          {
            v24 = *v4;
            v25 = *(_QWORD *)((char *)a3 + v24);
            if (v25 == -1 || v25 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v25);
              *(_QWORD *)((char *)a3 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v15 = v22++ >= 9;
                if (v15)
                {
                  v23 = 0;
                  goto LABEL_41;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v23 = 0;
LABEL_41:
          self->_size = v23;
          continue;
        case 3u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_BYTE *)&self->_has |= 2u;
          break;
        case 4u:
          PBReaderReadData();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v19 = 24;
LABEL_37:
          v33 = *(Class *)((char *)&self->super.super.isa + v19);
          *(Class *)((char *)&self->super.super.isa + v19) = v18;

          continue;
        default:
          v20 = PBReaderSkipValueWithTag();
          if (!v20)
            return v20;
          continue;
      }
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
      self->_lastSection = v29 != 0;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v20) = *((_BYTE *)a3 + *v6) == 0;
  return v20;
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
  if (self->_verificationKey)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSData *signature;
  char has;
  NSData *verificationKey;
  id v9;

  v4 = a3;
  signature = self->_signature;
  v9 = v4;
  if (signature)
  {
    objc_msgSend_setSignature_(v4, v5, (uint64_t)signature);
    v4 = v9;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_size;
    *((_BYTE *)v4 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 32) = self->_lastSection;
    *((_BYTE *)v4 + 36) |= 2u;
  }
  verificationKey = self->_verificationKey;
  if (verificationKey)
  {
    objc_msgSend_setVerificationKey_(v9, v5, (uint64_t)verificationKey);
    v4 = v9;
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
  const char *v14;
  char has;
  uint64_t v16;
  void *v17;

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
    *(_BYTE *)(v10 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v10 + 32) = self->_lastSection;
    *(_BYTE *)(v10 + 36) |= 2u;
  }
  v16 = objc_msgSend_copyWithZone_(self->_verificationKey, v14, (uint64_t)a3);
  v17 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v16;

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
  char isEqual;
  NSData *verificationKey;
  uint64_t v13;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_13;
  signature = self->_signature;
  v9 = v4[2];
  if ((unint64_t)signature | v9)
  {
    if (!objc_msgSend_isEqual_(signature, v7, v9))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_size != v4[1])
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0)
      goto LABEL_19;
LABEL_13:
    isEqual = 0;
    goto LABEL_14;
  }
  if ((*((_BYTE *)v4 + 36) & 2) == 0)
    goto LABEL_13;
  if (!self->_lastSection)
  {
    if (!*((_BYTE *)v4 + 32))
      goto LABEL_19;
    goto LABEL_13;
  }
  if (!*((_BYTE *)v4 + 32))
    goto LABEL_13;
LABEL_19:
  verificationKey = self->_verificationKey;
  v13 = v4[3];
  if ((unint64_t)verificationKey | v13)
    isEqual = objc_msgSend_isEqual_(verificationKey, v7, v13);
  else
    isEqual = 1;
LABEL_14:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend_hash(self->_signature, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = 2654435761 * self->_size;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    return v7 ^ v4 ^ v8 ^ objc_msgSend_hash(self->_verificationKey, v5, v6);
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v8 = 2654435761 * self->_lastSection;
  return v7 ^ v4 ^ v8 ^ objc_msgSend_hash(self->_verificationKey, v5, v6);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v6 = *((_QWORD *)v4 + 2);
  v9 = v4;
  if (v6)
  {
    objc_msgSend_setSignature_(self, v5, v6);
    v4 = v9;
  }
  v7 = *((_BYTE *)v4 + 36);
  if ((v7 & 1) != 0)
  {
    self->_size = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 36);
  }
  if ((v7 & 2) != 0)
  {
    self->_lastSection = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 2u;
  }
  v8 = *((_QWORD *)v4 + 3);
  if (v8)
  {
    objc_msgSend_setVerificationKey_(self, v5, v8);
    v4 = v9;
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

- (BOOL)lastSection
{
  return self->_lastSection;
}

- (NSData)verificationKey
{
  return self->_verificationKey;
}

- (void)setVerificationKey:(id)a3
{
  objc_storeStrong((id *)&self->_verificationKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationKey, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

@end
