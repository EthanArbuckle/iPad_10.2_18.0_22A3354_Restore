@implementation CKCodeRecordTransport

- (CKCodeRecordTransport)initWithRecord:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CKCodeRecordTransport *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *inited;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v31;
  const char *v32;
  objc_super v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CKCodeRecordTransport;
  v9 = -[CKCodeRecordTransport init](&v33, sel_init);
  if (v9)
  {
    objc_msgSend_valueStore(v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v34, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_containsValueOfClasses_options_passingTest_(v10, v13, (uint64_t)v12, 1, &unk_1E1F58378);

    if (v14)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v15, v16, v17);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, (uint64_t)v9, CFSTR("CKRecord_CodeExtensions.m"), 23, CFSTR("CKRecords sent via Inverness cannot container in-memory asset content"));

    }
    v18 = objc_alloc(MEMORY[0x1E0CB36F8]);
    inited = (void *)objc_msgSend_initRequiringSecureCoding_(v18, v19, 1, v20);
    objc_msgSend_encodeWithCoder_(v5, v22, (uint64_t)inited, v23);
    objc_msgSend_encodedData(inited, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocalSerialization_(v9, v28, (uint64_t)v27, v29);

  }
  return v9;
}

- (BOOL)hasLocalSerialization
{
  return self->_localSerialization != 0;
}

- (void)setLocalSerialization:(id)a3
{
  NSData *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSData *localSerialization;

  v4 = (NSData *)a3;
  objc_msgSend_clearOneofValuesForContents(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_contents = 1;
  localSerialization = self->_localSerialization;
  self->_localSerialization = v4;

}

- (BOOL)hasWireSerialization
{
  return self->_wireSerialization != 0;
}

- (void)setWireSerialization:(id)a3
{
  NSData *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSData *wireSerialization;

  v4 = (NSData *)a3;
  objc_msgSend_clearOneofValuesForContents(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_contents = 2;
  wireSerialization = self->_wireSerialization;
  self->_wireSerialization = v4;

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
    return off_1E1F64D78[a3];
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
  else if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("localSerialization"), v7) & 1) != 0)
  {
    v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("wireSerialization"), v10))
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
  NSData *localSerialization;
  NSData *wireSerialization;

  *(_BYTE *)&self->_has &= ~1u;
  self->_contents = 0;
  localSerialization = self->_localSerialization;
  self->_localSerialization = 0;

  wireSerialization = self->_wireSerialization;
  self->_wireSerialization = 0;

}

- (BOOL)hasEncryptedMasterKey
{
  return self->_encryptedMasterKey != 0;
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
  v13.super_class = (Class)CKCodeRecordTransport;
  -[CKCodeRecordTransport description](&v13, sel_description);
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
  NSData *localSerialization;
  NSData *wireSerialization;
  uint64_t contents;
  __CFString *v12;
  NSData *encryptedMasterKey;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  localSerialization = self->_localSerialization;
  if (localSerialization)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)localSerialization, (uint64_t)CFSTR("localSerialization"));
  wireSerialization = self->_wireSerialization;
  if (wireSerialization)
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)wireSerialization, (uint64_t)CFSTR("wireSerialization"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    contents = self->_contents;
    if (contents >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("(unknown: %i)"), v7, self->_contents);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E1F64D78[contents];
    }
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)v12, (uint64_t)CFSTR("contents"));

  }
  encryptedMasterKey = self->_encryptedMasterKey;
  if (encryptedMasterKey)
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)encryptedMasterKey, (uint64_t)CFSTR("encryptedMasterKey"));
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  uint64_t v3;

  return CKCodeRecordTransportReadFrom((uint64_t)self, (uint64_t)a3, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_localSerialization)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_wireSerialization)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_encryptedMasterKey)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  uint64_t v6;
  NSData *localSerialization;
  NSData *wireSerialization;
  NSData *encryptedMasterKey;
  _DWORD *v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_contents;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  localSerialization = self->_localSerialization;
  v10 = v4;
  if (localSerialization)
  {
    objc_msgSend_setLocalSerialization_(v4, v5, (uint64_t)localSerialization, v6);
    v4 = v10;
  }
  wireSerialization = self->_wireSerialization;
  if (wireSerialization)
  {
    objc_msgSend_setWireSerialization_(v10, v5, (uint64_t)wireSerialization, v6);
    v4 = v10;
  }
  encryptedMasterKey = self->_encryptedMasterKey;
  if (encryptedMasterKey)
  {
    objc_msgSend_setEncryptedMasterKey_(v10, v5, (uint64_t)encryptedMasterKey, v6);
    v4 = v10;
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
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (_QWORD *)v12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v12 + 8) = self->_contents;
    *(_BYTE *)(v12 + 40) |= 1u;
  }
  v16 = objc_msgSend_copyWithZone_(self->_localSerialization, v13, (uint64_t)a3, v14);
  v17 = (void *)v15[3];
  v15[3] = v16;

  v20 = objc_msgSend_copyWithZone_(self->_wireSerialization, v18, (uint64_t)a3, v19);
  v21 = (void *)v15[4];
  v15[4] = v20;

  v24 = objc_msgSend_copyWithZone_(self->_encryptedMasterKey, v22, (uint64_t)a3, v23);
  v25 = (void *)v15[2];
  v15[2] = v24;

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
  NSData *localSerialization;
  uint64_t v11;
  NSData *wireSerialization;
  uint64_t v13;
  NSData *encryptedMasterKey;
  uint64_t v15;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[5] & 1) == 0 || self->_contents != *((_DWORD *)v4 + 2))
      goto LABEL_13;
  }
  else if ((v4[5] & 1) != 0)
  {
LABEL_13:
    isEqual = 0;
    goto LABEL_14;
  }
  localSerialization = self->_localSerialization;
  v11 = v4[3];
  if ((unint64_t)localSerialization | v11
    && !objc_msgSend_isEqual_(localSerialization, v8, v11, v9))
  {
    goto LABEL_13;
  }
  wireSerialization = self->_wireSerialization;
  v13 = v4[4];
  if ((unint64_t)wireSerialization | v13)
  {
    if (!objc_msgSend_isEqual_(wireSerialization, v8, v13, v9))
      goto LABEL_13;
  }
  encryptedMasterKey = self->_encryptedMasterKey;
  v15 = v4[2];
  if ((unint64_t)encryptedMasterKey | v15)
    isEqual = objc_msgSend_isEqual_(encryptedMasterKey, v8, v15, v9);
  else
    isEqual = 1;
LABEL_14:

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
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_contents;
  else
    v5 = 0;
  v6 = objc_msgSend_hash(self->_localSerialization, a2, v2, v3) ^ v5;
  v10 = objc_msgSend_hash(self->_wireSerialization, v7, v8, v9);
  return v6 ^ v10 ^ objc_msgSend_hash(self->_encryptedMasterKey, v11, v12, v13);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_contents = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v7 = *((_QWORD *)v4 + 3);
  v10 = v4;
  if (v7)
  {
    objc_msgSend_setLocalSerialization_(self, v5, v7, v6);
    v4 = v10;
  }
  v8 = *((_QWORD *)v4 + 4);
  if (v8)
  {
    objc_msgSend_setWireSerialization_(self, v5, v8, v6);
    v4 = v10;
  }
  v9 = *((_QWORD *)v4 + 2);
  if (v9)
  {
    objc_msgSend_setEncryptedMasterKey_(self, v5, v9, v6);
    v4 = v10;
  }

}

- (NSData)localSerialization
{
  return self->_localSerialization;
}

- (NSData)wireSerialization
{
  return self->_wireSerialization;
}

- (NSData)encryptedMasterKey
{
  return self->_encryptedMasterKey;
}

- (void)setEncryptedMasterKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedMasterKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wireSerialization, 0);
  objc_storeStrong((id *)&self->_localSerialization, 0);
  objc_storeStrong((id *)&self->_encryptedMasterKey, 0);
}

@end
