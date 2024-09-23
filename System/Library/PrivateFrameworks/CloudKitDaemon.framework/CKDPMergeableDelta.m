@implementation CKDPMergeableDelta

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (BOOL)hasData
{
  return self->_data != 0;
}

- (void)setData:(id)a3
{
  NSData *v4;
  const char *v5;
  uint64_t v6;
  NSData *data;

  v4 = (NSData *)a3;
  objc_msgSend_clearOneofValuesForPayload(self, v5, v6);
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 1;
  data = self->_data;
  self->_data = v4;

}

- (BOOL)hasEncryptedData
{
  return self->_encryptedData != 0;
}

- (void)setEncryptedData:(id)a3
{
  NSData *v4;
  const char *v5;
  uint64_t v6;
  NSData *encryptedData;

  v4 = (NSData *)a3;
  objc_msgSend_clearOneofValuesForPayload(self, v5, v6);
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 2;
  encryptedData = self->_encryptedData;
  self->_encryptedData = v4;

}

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

- (void)setAsset:(id)a3
{
  CKDPAsset *v4;
  const char *v5;
  uint64_t v6;
  CKDPAsset *asset;

  v4 = (CKDPAsset *)a3;
  objc_msgSend_clearOneofValuesForPayload(self, v5, v6);
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 3;
  asset = self->_asset;
  self->_asset = v4;

}

- (BOOL)hasEncryptedAsset
{
  return self->_encryptedAsset != 0;
}

- (void)setEncryptedAsset:(id)a3
{
  CKDPAsset *v4;
  const char *v5;
  uint64_t v6;
  CKDPAsset *encryptedAsset;

  v4 = (CKDPAsset *)a3;
  objc_msgSend_clearOneofValuesForPayload(self, v5, v6);
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 4;
  encryptedAsset = self->_encryptedAsset;
  self->_encryptedAsset = v4;

}

- (int)payload
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_payload;
  else
    return 0;
}

- (void)setPayload:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = a3;
}

- (void)setHasPayload:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPayload
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)payloadAsString:(int)a3
{
  if (a3 < 5)
    return *((id *)&off_1E7835048 + a3);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPayload:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;
  const char *v9;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("PBUNSET")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("data")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("encryptedData")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("asset")) & 1) != 0)
  {
    v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("encryptedAsset")))
  {
    v6 = 4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)clearOneofValuesForPayload
{
  NSData *data;
  NSData *encryptedData;
  CKDPAsset *asset;
  CKDPAsset *encryptedAsset;

  *(_BYTE *)&self->_has &= ~1u;
  self->_payload = 0;
  data = self->_data;
  self->_data = 0;

  encryptedData = self->_encryptedData;
  self->_encryptedData = 0;

  asset = self->_asset;
  self->_asset = 0;

  encryptedAsset = self->_encryptedAsset;
  self->_encryptedAsset = 0;

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
  v11.super_class = (Class)CKDPMergeableDelta;
  -[CKDPMergeableDelta description](&v11, sel_description);
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
  CKDPMergeableDeltaMetadata *metadata;
  void *v8;
  const char *v9;
  NSData *data;
  NSData *encryptedData;
  CKDPAsset *asset;
  void *v13;
  const char *v14;
  CKDPAsset *encryptedAsset;
  void *v16;
  const char *v17;
  uint64_t payload;
  void *v19;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  metadata = self->_metadata;
  if (metadata)
  {
    objc_msgSend_dictionaryRepresentation(metadata, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("metadata"));

  }
  data = self->_data;
  if (data)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)data, CFSTR("data"));
  encryptedData = self->_encryptedData;
  if (encryptedData)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)encryptedData, CFSTR("encryptedData"));
  asset = self->_asset;
  if (asset)
  {
    objc_msgSend_dictionaryRepresentation(asset, v4, (uint64_t)encryptedData);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("asset"));

  }
  encryptedAsset = self->_encryptedAsset;
  if (encryptedAsset)
  {
    objc_msgSend_dictionaryRepresentation(encryptedAsset, v4, (uint64_t)encryptedData);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, CFSTR("encryptedAsset"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    payload = self->_payload;
    if (payload >= 5)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_payload);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = (void *)*((_QWORD *)&off_1E7835048 + payload);
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v19, CFSTR("payload"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPMergeableDeltaReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_metadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_data)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_encryptedData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_asset)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_encryptedAsset)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  CKDPMergeableDeltaMetadata *metadata;
  NSData *data;
  NSData *encryptedData;
  CKDPAsset *asset;
  CKDPAsset *encryptedAsset;
  _DWORD *v11;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[12] = self->_payload;
    *((_BYTE *)v4 + 52) |= 1u;
  }
  metadata = self->_metadata;
  v11 = v4;
  if (metadata)
  {
    objc_msgSend_setMetadata_(v4, v5, (uint64_t)metadata);
    v4 = v11;
  }
  data = self->_data;
  if (data)
  {
    objc_msgSend_setData_(v11, v5, (uint64_t)data);
    v4 = v11;
  }
  encryptedData = self->_encryptedData;
  if (encryptedData)
  {
    objc_msgSend_setEncryptedData_(v11, v5, (uint64_t)encryptedData);
    v4 = v11;
  }
  asset = self->_asset;
  if (asset)
  {
    objc_msgSend_setAsset_(v11, v5, (uint64_t)asset);
    v4 = v11;
  }
  encryptedAsset = self->_encryptedAsset;
  if (encryptedAsset)
  {
    objc_msgSend_setEncryptedAsset_(v11, v5, (uint64_t)encryptedAsset);
    v4 = v11;
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
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (_QWORD *)v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 48) = self->_payload;
    *(_BYTE *)(v10 + 52) |= 1u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_metadata, v11, (uint64_t)a3);
  v14 = (void *)v12[5];
  v12[5] = v13;

  v16 = objc_msgSend_copyWithZone_(self->_data, v15, (uint64_t)a3);
  v17 = (void *)v12[2];
  v12[2] = v16;

  v19 = objc_msgSend_copyWithZone_(self->_encryptedData, v18, (uint64_t)a3);
  v20 = (void *)v12[4];
  v12[4] = v19;

  v22 = objc_msgSend_copyWithZone_(self->_asset, v21, (uint64_t)a3);
  v23 = (void *)v12[1];
  v12[1] = v22;

  v25 = objc_msgSend_copyWithZone_(self->_encryptedAsset, v24, (uint64_t)a3);
  v26 = (void *)v12[3];
  v12[3] = v25;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPMergeableDeltaMetadata *metadata;
  uint64_t v9;
  NSData *data;
  uint64_t v11;
  NSData *encryptedData;
  uint64_t v13;
  CKDPAsset *asset;
  uint64_t v15;
  CKDPAsset *encryptedAsset;
  uint64_t v17;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_payload != *((_DWORD *)v4 + 12))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
LABEL_17:
    isEqual = 0;
    goto LABEL_18;
  }
  metadata = self->_metadata;
  v9 = v4[5];
  if ((unint64_t)metadata | v9 && !objc_msgSend_isEqual_(metadata, v7, v9))
    goto LABEL_17;
  data = self->_data;
  v11 = v4[2];
  if ((unint64_t)data | v11)
  {
    if (!objc_msgSend_isEqual_(data, v7, v11))
      goto LABEL_17;
  }
  encryptedData = self->_encryptedData;
  v13 = v4[4];
  if ((unint64_t)encryptedData | v13)
  {
    if (!objc_msgSend_isEqual_(encryptedData, v7, v13))
      goto LABEL_17;
  }
  asset = self->_asset;
  v15 = v4[1];
  if ((unint64_t)asset | v15)
  {
    if (!objc_msgSend_isEqual_(asset, v7, v15))
      goto LABEL_17;
  }
  encryptedAsset = self->_encryptedAsset;
  v17 = v4[3];
  if ((unint64_t)encryptedAsset | v17)
    isEqual = objc_msgSend_isEqual_(encryptedAsset, v7, v17);
  else
    isEqual = 1;
LABEL_18:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_payload;
  else
    v4 = 0;
  v5 = objc_msgSend_hash(self->_metadata, a2, v2) ^ v4;
  v8 = objc_msgSend_hash(self->_data, v6, v7);
  v11 = v5 ^ v8 ^ objc_msgSend_hash(self->_encryptedData, v9, v10);
  v14 = objc_msgSend_hash(self->_asset, v12, v13);
  return v11 ^ v14 ^ objc_msgSend_hash(self->_encryptedAsset, v15, v16);
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _QWORD *v5;
  CKDPMergeableDeltaMetadata *metadata;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CKDPAsset *asset;
  uint64_t v11;
  CKDPAsset *encryptedAsset;
  uint64_t v13;
  _QWORD *v14;

  v4 = a3;
  v5 = v4;
  if ((v4[13] & 1) != 0)
  {
    self->_payload = v4[12];
    *(_BYTE *)&self->_has |= 1u;
  }
  metadata = self->_metadata;
  v7 = v5[5];
  v14 = v5;
  if (metadata)
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend_mergeFrom_(metadata, (const char *)v5, v7);
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend_setMetadata_(self, (const char *)v5, v7);
  }
  v5 = v14;
LABEL_9:
  v8 = v5[2];
  if (v8)
  {
    objc_msgSend_setData_(self, (const char *)v5, v8);
    v5 = v14;
  }
  v9 = v5[4];
  if (v9)
  {
    objc_msgSend_setEncryptedData_(self, (const char *)v5, v9);
    v5 = v14;
  }
  asset = self->_asset;
  v11 = v5[1];
  if (asset)
  {
    if (!v11)
      goto LABEL_19;
    objc_msgSend_mergeFrom_(asset, (const char *)v5, v11);
  }
  else
  {
    if (!v11)
      goto LABEL_19;
    objc_msgSend_setAsset_(self, (const char *)v5, v11);
  }
  v5 = v14;
LABEL_19:
  encryptedAsset = self->_encryptedAsset;
  v13 = v5[3];
  if (encryptedAsset)
  {
    if (v13)
    {
      objc_msgSend_mergeFrom_(encryptedAsset, (const char *)v5, v13);
LABEL_24:
      v5 = v14;
    }
  }
  else if (v13)
  {
    objc_msgSend_setEncryptedAsset_(self, (const char *)v5, v13);
    goto LABEL_24;
  }

}

- (CKDPMergeableDeltaMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSData)data
{
  return self->_data;
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (CKDPAsset)asset
{
  return self->_asset;
}

- (CKDPAsset)encryptedAsset
{
  return self->_encryptedAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_encryptedAsset, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
