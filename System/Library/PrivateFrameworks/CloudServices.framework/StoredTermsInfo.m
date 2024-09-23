@implementation StoredTermsInfo

- (void)setStorageVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_storageVersion = a3;
}

- (void)setHasStorageVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStorageVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasTermsInfo
{
  return self->_termsInfo != 0;
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)StoredTermsInfo;
  -[StoredTermsInfo description](&v11, sel_description);
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
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  SecureBackupTermsInfo *termsInfo;
  void *v10;
  const char *v11;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v4, self->_storageVersion);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, CFSTR("storageVersion"));

  }
  termsInfo = self->_termsInfo;
  if (termsInfo)
  {
    objc_msgSend_dictionaryRepresentation(termsInfo, v4, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("termsInfo"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_20D68F2F8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_termsInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  const char *v5;
  SecureBackupTermsInfo *termsInfo;
  _QWORD *v7;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_storageVersion;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  termsInfo = self->_termsInfo;
  if (termsInfo)
  {
    v7 = v4;
    objc_msgSend_setTermsInfo_(v4, v5, (uint64_t)termsInfo);
    v4 = v7;
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
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (_QWORD *)v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v10 + 8) = self->_storageVersion;
    *(_BYTE *)(v10 + 24) |= 1u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_termsInfo, v11, (uint64_t)a3);
  v14 = (void *)v12[2];
  v12[2] = v13;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  SecureBackupTermsInfo *termsInfo;
  uint64_t v9;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[3] & 1) == 0 || self->_storageVersion != v4[1])
      goto LABEL_9;
  }
  else if ((v4[3] & 1) != 0)
  {
LABEL_9:
    isEqual = 0;
    goto LABEL_10;
  }
  termsInfo = self->_termsInfo;
  v9 = v4[2];
  if ((unint64_t)termsInfo | v9)
    isEqual = objc_msgSend_isEqual_(termsInfo, v7, v9);
  else
    isEqual = 1;
LABEL_10:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  unint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_storageVersion;
  else
    v3 = 0;
  return objc_msgSend_hash(self->_termsInfo, a2, v2) ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  SecureBackupTermsInfo *termsInfo;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((v4[3] & 1) != 0)
  {
    self->_storageVersion = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  termsInfo = self->_termsInfo;
  v7 = v5[2];
  if (termsInfo)
  {
    if (v7)
    {
      v8 = v5;
      objc_msgSend_mergeFrom_(termsInfo, (const char *)v5, v7);
LABEL_8:
      v5 = v8;
    }
  }
  else if (v7)
  {
    v8 = v5;
    objc_msgSend_setTermsInfo_(self, (const char *)v5, v7);
    goto LABEL_8;
  }

}

- (unint64_t)storageVersion
{
  return self->_storageVersion;
}

- (SecureBackupTermsInfo)termsInfo
{
  return self->_termsInfo;
}

- (void)setTermsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_termsInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsInfo, 0);
}

@end
