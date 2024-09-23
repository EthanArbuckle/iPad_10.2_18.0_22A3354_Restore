@implementation CKDPFieldPermittedCryptoFeatureSet

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CKDPFieldPermittedCryptoFeatureSet;
  -[CKDPFieldPermittedCryptoFeatureSet dealloc](&v3, sel_dealloc);
}

- (int)minimumSchemaVersion
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_minimumSchemaVersion;
  else
    return 1;
}

- (void)setMinimumSchemaVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_minimumSchemaVersion = a3;
}

- (void)setHasMinimumSchemaVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumSchemaVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)mmcsVersionsCount
{
  return self->_mmcsVersions.count;
}

- (int)mmcsVersions
{
  return self->_mmcsVersions.list;
}

- (void)clearMmcsVersions
{
  PBRepeatedInt32Clear();
}

- (void)addMmcsVersion:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)mmcsVersionAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_mmcsVersions;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  p_mmcsVersions = &self->_mmcsVersions;
  count = self->_mmcsVersions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v6, v9, v7, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise(v10, v11, v12);

  }
  return p_mmcsVersions->list[a3];
}

- (void)setMmcsVersions:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)encryptedFieldContextTypesCount
{
  return self->_encryptedFieldContextTypes.count;
}

- (int)encryptedFieldContextTypes
{
  return self->_encryptedFieldContextTypes.list;
}

- (void)clearEncryptedFieldContextTypes
{
  PBRepeatedInt32Clear();
}

- (void)addEncryptedFieldContextType:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)encryptedFieldContextTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_encryptedFieldContextTypes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  p_encryptedFieldContextTypes = &self->_encryptedFieldContextTypes;
  count = self->_encryptedFieldContextTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v6, v9, v7, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise(v10, v11, v12);

  }
  return p_encryptedFieldContextTypes->list[a3];
}

- (void)setEncryptedFieldContextTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)assetKeyEncryptionTypesCount
{
  return self->_assetKeyEncryptionTypes.count;
}

- (int)assetKeyEncryptionTypes
{
  return self->_assetKeyEncryptionTypes.list;
}

- (void)clearAssetKeyEncryptionTypes
{
  PBRepeatedInt32Clear();
}

- (void)addAssetKeyEncryptionType:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)assetKeyEncryptionTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_assetKeyEncryptionTypes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  p_assetKeyEncryptionTypes = &self->_assetKeyEncryptionTypes;
  count = self->_assetKeyEncryptionTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v6, v9, v7, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise(v10, v11, v12);

  }
  return p_assetKeyEncryptionTypes->list[a3];
}

- (void)setAssetKeyEncryptionTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
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
  v11.super_class = (Class)CKDPFieldPermittedCryptoFeatureSet;
  -[CKDPFieldPermittedCryptoFeatureSet description](&v11, sel_description);
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
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_minimumSchemaVersion);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, CFSTR("minimumSchemaVersion"));

  }
  PBRepeatedInt32NSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, CFSTR("mmcsVersion"));

  PBRepeatedInt32NSArray();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)v10, CFSTR("encryptedFieldContextType"));

  PBRepeatedInt32NSArray();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v13, (uint64_t)v12, CFSTR("assetKeyEncryptionType"));

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEBACD28((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_assetKeyEncryptionTypes;
  unint64_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v9;
  }
  if (self->_mmcsVersions.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v9;
      ++v5;
    }
    while (v5 < self->_mmcsVersions.count);
  }
  if (self->_encryptedFieldContextTypes.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v9;
      ++v6;
    }
    while (v6 < self->_encryptedFieldContextTypes.count);
  }
  p_assetKeyEncryptionTypes = &self->_assetKeyEncryptionTypes;
  if (p_assetKeyEncryptionTypes->count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v9;
      ++v8;
    }
    while (v8 < p_assetKeyEncryptionTypes->count);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  const char *v34;
  id v35;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[20] = self->_minimumSchemaVersion;
    *((_BYTE *)v4 + 84) |= 1u;
  }
  v35 = v4;
  if (objc_msgSend_mmcsVersionsCount(self, v5, v6))
  {
    objc_msgSend_clearMmcsVersions(v35, v7, v8);
    v11 = objc_msgSend_mmcsVersionsCount(self, v9, v10);
    if (v11)
    {
      v12 = v11;
      for (i = 0; i != v12; ++i)
      {
        v14 = objc_msgSend_mmcsVersionAtIndex_(self, v7, i);
        objc_msgSend_addMmcsVersion_(v35, v15, v14);
      }
    }
  }
  if (objc_msgSend_encryptedFieldContextTypesCount(self, v7, v8))
  {
    objc_msgSend_clearEncryptedFieldContextTypes(v35, v16, v17);
    v20 = objc_msgSend_encryptedFieldContextTypesCount(self, v18, v19);
    if (v20)
    {
      v21 = v20;
      for (j = 0; j != v21; ++j)
      {
        v23 = objc_msgSend_encryptedFieldContextTypeAtIndex_(self, v16, j);
        objc_msgSend_addEncryptedFieldContextType_(v35, v24, v23);
      }
    }
  }
  if (objc_msgSend_assetKeyEncryptionTypesCount(self, v16, v17))
  {
    objc_msgSend_clearAssetKeyEncryptionTypes(v35, v25, v26);
    v29 = objc_msgSend_assetKeyEncryptionTypesCount(self, v27, v28);
    if (v29)
    {
      v31 = v29;
      for (k = 0; k != v31; ++k)
      {
        v33 = objc_msgSend_assetKeyEncryptionTypeAtIndex_(self, v30, k);
        objc_msgSend_addAssetKeyEncryptionType_(v35, v34, v33);
      }
    }
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
  void *v11;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v11 = (void *)v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 80) = self->_minimumSchemaVersion;
    *(_BYTE *)(v10 + 84) |= 1u;
  }
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  char IsEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_minimumSchemaVersion != *((_DWORD *)v4 + 20))
      goto LABEL_10;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
LABEL_10:
    IsEqual = 0;
    goto LABEL_11;
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual())
    goto LABEL_10;
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_11:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_minimumSchemaVersion;
  else
    v2 = 0;
  v3 = PBRepeatedInt32Hash() ^ v2;
  v4 = PBRepeatedInt32Hash();
  return v3 ^ v4 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t k;
  uint64_t v25;
  const char *v26;
  id v27;

  v4 = a3;
  if ((v4[21] & 1) != 0)
  {
    self->_minimumSchemaVersion = v4[20];
    *(_BYTE *)&self->_has |= 1u;
  }
  v27 = v4;
  v7 = objc_msgSend_mmcsVersionsCount(v4, v5, v6);
  if (v7)
  {
    v10 = v7;
    for (i = 0; i != v10; ++i)
    {
      v12 = objc_msgSend_mmcsVersionAtIndex_(v27, v8, i);
      objc_msgSend_addMmcsVersion_(self, v13, v12);
    }
  }
  v14 = objc_msgSend_encryptedFieldContextTypesCount(v27, v8, v9);
  if (v14)
  {
    v17 = v14;
    for (j = 0; j != v17; ++j)
    {
      v19 = objc_msgSend_encryptedFieldContextTypeAtIndex_(v27, v15, j);
      objc_msgSend_addEncryptedFieldContextType_(self, v20, v19);
    }
  }
  v21 = objc_msgSend_assetKeyEncryptionTypesCount(v27, v15, v16);
  if (v21)
  {
    v23 = v21;
    for (k = 0; k != v23; ++k)
    {
      v25 = objc_msgSend_assetKeyEncryptionTypeAtIndex_(v27, v22, k);
      objc_msgSend_addAssetKeyEncryptionType_(self, v26, v25);
    }
  }

}

@end
