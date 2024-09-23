@implementation IDSQRProtoMaterialInfo

- (id)materialTypeAsString:(int)a3
{
  double v3;
  __CFString *v4;

  if (a3 < 0xF && ((0x78E1u >> a3) & 1) != 0)
  {
    v4 = off_1E3C1F188[a3];
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsMaterialType:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  int v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("UNDEFINED"), v5) & 1) != 0)
  {
    v8 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("PREKEY"), v7) & 1) != 0)
  {
    v8 = 11;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("AVCBLOB"), v10) & 1) != 0)
  {
    v8 = 12;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("MKM"), v12) & 1) != 0)
  {
    v8 = 13;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v13, (uint64_t)CFSTR("SKM"), v14) & 1) != 0)
  {
    v8 = 14;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v15, (uint64_t)CFSTR("MIRAGEKEY"), v16) & 1) != 0)
  {
    v8 = 5;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v17, (uint64_t)CFSTR("MIRAGEBLOB"), v18) & 1) != 0)
  {
    v8 = 6;
  }
  else if (objc_msgSend_isEqualToString_(v3, v19, (uint64_t)CFSTR("IDS_CONTEXT_BLOB"), v20))
  {
    v8 = 7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setShortMaterialIdLength:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_shortMaterialIdLength = a3;
}

- (void)setHasShortMaterialIdLength:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShortMaterialIdLength
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoMaterialInfo;
  -[IDSQRProtoMaterialInfo description](&v13, sel_description);
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
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  NSData *materialId;
  uint64_t materialType;
  __CFString *v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  NSData *materialContent;
  void *v17;
  const char *v18;
  double v19;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  materialId = self->_materialId;
  if (materialId)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)materialId, v7, CFSTR("material_id"));
  materialType = self->_materialType;
  if (materialType < 0xF && ((0x78E1u >> materialType) & 1) != 0)
  {
    v11 = off_1E3C1F188[materialType];
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)v11, v7, CFSTR("material_type"));
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("(unknown: %i)"), v7, self->_materialType);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v12, (uint64_t)v11, v13, CFSTR("material_type"));
  }

  materialContent = self->_materialContent;
  if (materialContent)
    objc_msgSend_setObject_forKey_(v8, v14, (uint64_t)materialContent, v15, CFSTR("material_content"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v14, self->_shortMaterialIdLength, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v18, (uint64_t)v17, v19, CFSTR("short_material_id_length"));

  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoMaterialInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_materialId)
    sub_19BAEF164();
  PBDataWriterWriteDataField();
  PBDataWriterWriteInt32Field();
  if (!self->_materialContent)
    sub_19BAEF18C();
  PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a3;
  objc_msgSend_setMaterialId_(v8, v4, (uint64_t)self->_materialId, v5);
  *((_DWORD *)v8 + 6) = self->_materialType;
  objc_msgSend_setMaterialContent_(v8, v6, (uint64_t)self->_materialContent, v7);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v8 + 7) = self->_shortMaterialIdLength;
    *((_BYTE *)v8 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  double v18;
  uint64_t v19;
  void *v20;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = objc_msgSend_copyWithZone_(self->_materialId, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 16);
  *(_QWORD *)(v12 + 16) = v15;

  *(_DWORD *)(v12 + 24) = self->_materialType;
  v19 = objc_msgSend_copyWithZone_(self->_materialContent, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v12 + 8);
  *(_QWORD *)(v12 + 8) = v19;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v12 + 28) = self->_shortMaterialIdLength;
    *(_BYTE *)(v12 + 32) |= 1u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSData *materialId;
  uint64_t v11;
  NSData *materialContent;
  uint64_t v13;
  BOOL v14;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_11;
  materialId = self->_materialId;
  v11 = v4[2];
  if ((unint64_t)materialId | v11)
  {
    if (!objc_msgSend_isEqual_(materialId, v8, v11, v9))
      goto LABEL_11;
  }
  if (self->_materialType != *((_DWORD *)v4 + 6))
    goto LABEL_11;
  materialContent = self->_materialContent;
  v13 = v4[1];
  if ((unint64_t)materialContent | v13)
  {
    if (!objc_msgSend_isEqual_(materialContent, v8, v13, v9))
      goto LABEL_11;
  }
  v14 = (v4[4] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[4] & 1) != 0 && self->_shortMaterialIdLength == *((_DWORD *)v4 + 7))
    {
      v14 = 1;
      goto LABEL_12;
    }
LABEL_11:
    v14 = 0;
  }
LABEL_12:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  uint64_t materialType;
  const char *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;

  v5 = objc_msgSend_hash(self->_materialId, a2, v2, v3);
  materialType = self->_materialType;
  v10 = objc_msgSend_hash(self->_materialContent, v7, v8, v9);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_shortMaterialIdLength;
  else
    v11 = 0;
  return (2654435761 * materialType) ^ v5 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v7 = *((_QWORD *)v4 + 2);
  v9 = v4;
  if (v7)
  {
    objc_msgSend_setMaterialId_(self, v5, v7, v6);
    v4 = v9;
  }
  self->_materialType = *((_DWORD *)v4 + 6);
  v8 = *((_QWORD *)v4 + 1);
  if (v8)
  {
    objc_msgSend_setMaterialContent_(self, v5, v8, v6);
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_shortMaterialIdLength = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)materialId
{
  return self->_materialId;
}

- (void)setMaterialId:(id)a3
{
  objc_storeStrong((id *)&self->_materialId, a3);
}

- (int)materialType
{
  return self->_materialType;
}

- (void)setMaterialType:(int)a3
{
  self->_materialType = a3;
}

- (NSData)materialContent
{
  return self->_materialContent;
}

- (void)setMaterialContent:(id)a3
{
  objc_storeStrong((id *)&self->_materialContent, a3);
}

- (unsigned)shortMaterialIdLength
{
  return self->_shortMaterialIdLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialId, 0);
  objc_storeStrong((id *)&self->_materialContent, 0);
}

@end
