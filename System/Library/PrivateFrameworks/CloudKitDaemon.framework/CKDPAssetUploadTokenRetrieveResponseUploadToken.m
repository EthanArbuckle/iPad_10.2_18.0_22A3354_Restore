@implementation CKDPAssetUploadTokenRetrieveResponseUploadToken

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

- (void)setTokenExpiration:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_tokenExpiration = a3;
}

- (void)setHasTokenExpiration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTokenExpiration
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDuplicateAsset:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_duplicateAsset = a3;
}

- (void)setHasDuplicateAsset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuplicateAsset
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
  v11.super_class = (Class)CKDPAssetUploadTokenRetrieveResponseUploadToken;
  -[CKDPAssetUploadTokenRetrieveResponseUploadToken description](&v11, sel_description);
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
  NSString *token;
  CKDPAsset *asset;
  void *v9;
  const char *v10;
  char has;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  token = self->_token;
  if (token)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)token, CFSTR("token"));
  asset = self->_asset;
  if (asset)
  {
    objc_msgSend_dictionaryRepresentation(asset, v5, (uint64_t)token);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, CFSTR("asset"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v5, self->_tokenExpiration);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, CFSTR("tokenExpiration"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_duplicateAsset);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("duplicateAsset"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAB5C14((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_token)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_asset)
  {
    PBDataWriterWriteSubmessage();
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
  NSString *token;
  CKDPAsset *asset;
  char has;
  id v9;

  v4 = a3;
  token = self->_token;
  v9 = v4;
  if (token)
  {
    objc_msgSend_setToken_(v4, v5, (uint64_t)token);
    v4 = v9;
  }
  asset = self->_asset;
  if (asset)
  {
    objc_msgSend_setAsset_(v9, v5, (uint64_t)asset);
    v4 = v9;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_tokenExpiration;
    *((_BYTE *)v4 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 32) = self->_duplicateAsset;
    *((_BYTE *)v4 + 36) |= 2u;
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
  uint64_t v15;
  void *v16;
  char has;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_token, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_asset, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v15;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v10 + 8) = self->_tokenExpiration;
    *(_BYTE *)(v10 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v10 + 32) = self->_duplicateAsset;
    *(_BYTE *)(v10 + 36) |= 2u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *token;
  uint64_t v9;
  CKDPAsset *asset;
  uint64_t v11;
  BOOL v12;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_13;
  token = self->_token;
  v9 = v4[3];
  if ((unint64_t)token | v9)
  {
    if (!objc_msgSend_isEqual_(token, v7, v9))
      goto LABEL_13;
  }
  asset = self->_asset;
  v11 = v4[2];
  if ((unint64_t)asset | v11)
  {
    if (!objc_msgSend_isEqual_(asset, v7, v11))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_tokenExpiration != v4[1])
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_13;
  }
  v12 = (*((_BYTE *)v4 + 36) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0)
    {
LABEL_13:
      v12 = 0;
      goto LABEL_14;
    }
    if (self->_duplicateAsset)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_13;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_13;
    }
    v12 = 1;
  }
LABEL_14:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = objc_msgSend_hash(self->_token, a2, v2);
  v7 = objc_msgSend_hash(self->_asset, v5, v6);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = 2654435761 * self->_tokenExpiration;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    return v7 ^ v4 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v9 = 2654435761 * self->_duplicateAsset;
  return v7 ^ v4 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  CKDPAsset *asset;
  uint64_t v7;
  char v8;
  id v9;

  v4 = a3;
  v5 = *((_QWORD *)v4 + 3);
  v9 = v4;
  if (v5)
  {
    objc_msgSend_setToken_(self, (const char *)v4, v5);
    v4 = v9;
  }
  asset = self->_asset;
  v7 = *((_QWORD *)v4 + 2);
  if (asset)
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend_mergeFrom_(asset, (const char *)v4, v7);
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend_setAsset_(self, (const char *)v4, v7);
  }
  v4 = v9;
LABEL_9:
  v8 = *((_BYTE *)v4 + 36);
  if ((v8 & 1) != 0)
  {
    self->_tokenExpiration = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v8 = *((_BYTE *)v4 + 36);
  }
  if ((v8 & 2) != 0)
  {
    self->_duplicateAsset = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (CKDPAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (int64_t)tokenExpiration
{
  return self->_tokenExpiration;
}

- (BOOL)duplicateAsset
{
  return self->_duplicateAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
