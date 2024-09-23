@implementation CKDPResponseOperationResultErrorExtension

- (BOOL)hasExtensionName
{
  return self->_extensionName != 0;
}

- (void)setTypeCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_typeCode = a3;
}

- (void)setHasTypeCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTypeCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasExtensionPayload
{
  return self->_extensionPayload != 0;
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
  v11.super_class = (Class)CKDPResponseOperationResultErrorExtension;
  -[CKDPResponseOperationResultErrorExtension description](&v11, sel_description);
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
  NSString *extensionName;
  void *v8;
  const char *v9;
  NSData *extensionPayload;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  extensionName = self->_extensionName;
  if (extensionName)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)extensionName, CFSTR("extensionName"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v5, self->_typeCode);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("typeCode"));

  }
  extensionPayload = self->_extensionPayload;
  if (extensionPayload)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)extensionPayload, CFSTR("extensionPayload"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPResponseOperationResultErrorExtensionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_extensionName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_extensionPayload)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *extensionName;
  NSData *extensionPayload;
  id v8;

  v4 = a3;
  extensionName = self->_extensionName;
  v8 = v4;
  if (extensionName)
  {
    objc_msgSend_setExtensionName_(v4, v5, (uint64_t)extensionName);
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_typeCode;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  extensionPayload = self->_extensionPayload;
  if (extensionPayload)
  {
    objc_msgSend_setExtensionPayload_(v8, v5, (uint64_t)extensionPayload);
    v4 = v8;
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

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_extensionName, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 24) = self->_typeCode;
    *(_BYTE *)(v10 + 28) |= 1u;
  }
  v15 = objc_msgSend_copyWithZone_(self->_extensionPayload, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v15;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *extensionName;
  uint64_t v9;
  NSData *extensionPayload;
  uint64_t v11;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_11;
  extensionName = self->_extensionName;
  v9 = v4[1];
  if ((unint64_t)extensionName | v9)
  {
    if (!objc_msgSend_isEqual_(extensionName, v7, v9))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_typeCode != *((_DWORD *)v4 + 6))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    isEqual = 0;
    goto LABEL_12;
  }
  extensionPayload = self->_extensionPayload;
  v11 = v4[2];
  if ((unint64_t)extensionPayload | v11)
    isEqual = objc_msgSend_isEqual_(extensionPayload, v7, v11);
  else
    isEqual = 1;
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend_hash(self->_extensionName, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_typeCode;
  else
    v7 = 0;
  return v7 ^ v4 ^ objc_msgSend_hash(self->_extensionPayload, v5, v6);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v6 = *((_QWORD *)v4 + 1);
  v8 = v4;
  if (v6)
  {
    objc_msgSend_setExtensionName_(self, v5, v6);
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_typeCode = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  v7 = *((_QWORD *)v4 + 2);
  if (v7)
  {
    objc_msgSend_setExtensionPayload_(self, v5, v7);
    v4 = v8;
  }

}

- (NSString)extensionName
{
  return self->_extensionName;
}

- (void)setExtensionName:(id)a3
{
  objc_storeStrong((id *)&self->_extensionName, a3);
}

- (unsigned)typeCode
{
  return self->_typeCode;
}

- (NSData)extensionPayload
{
  return self->_extensionPayload;
}

- (void)setExtensionPayload:(id)a3
{
  objc_storeStrong((id *)&self->_extensionPayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPayload, 0);
  objc_storeStrong((id *)&self->_extensionName, 0);
}

@end
