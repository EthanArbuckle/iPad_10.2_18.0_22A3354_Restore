@implementation IDSQRProtoTestRequest

- (void)setRequestedMessageType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requestedMessageType = a3;
}

- (void)setHasRequestedMessageType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestedMessageType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRequestedErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requestedErrorCode = a3;
}

- (void)setHasRequestedErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestedErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSubOperation
{
  return self->_subOperation != 0;
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
  v13.super_class = (Class)IDSQRProtoTestRequest;
  -[IDSQRProtoTestRequest description](&v13, sel_description);
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
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  char has;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  NSString *subOperation;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v6, self->_testOptionFlags, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, CFSTR("test_option_flags"));

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v11, self->_requestedMessageType, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, v16, CFSTR("requested_message_type"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v11, self->_requestedErrorCode, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v18, (uint64_t)v17, v19, CFSTR("requested_error_code"));

  }
  subOperation = self->_subOperation;
  if (subOperation)
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)subOperation, v12, CFSTR("sub_operation"));
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoTestRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  id v6;

  v6 = a3;
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint32Field();
  v5 = v6;
  if (self->_subOperation)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  double v6;
  char has;
  NSString *subOperation;
  _DWORD *v9;

  v4 = a3;
  v4[6] = self->_testOptionFlags;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_requestedMessageType;
    *((_BYTE *)v4 + 28) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[2] = self->_requestedErrorCode;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  subOperation = self->_subOperation;
  if (subOperation)
  {
    v9 = v4;
    objc_msgSend_setSubOperation_(v4, v5, (uint64_t)subOperation, v6);
    v4 = v9;
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
  _QWORD *v15;
  char has;
  uint64_t v17;
  void *v18;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (_QWORD *)v12;
  *(_DWORD *)(v12 + 24) = self->_testOptionFlags;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v12 + 12) = self->_requestedMessageType;
    *(_BYTE *)(v12 + 28) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v12 + 8) = self->_requestedErrorCode;
    *(_BYTE *)(v12 + 28) |= 1u;
  }
  v17 = objc_msgSend_copyWithZone_(self->_subOperation, v13, (uint64_t)a3, v14);
  v18 = (void *)v15[2];
  v15[2] = v17;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSString *subOperation;
  uint64_t v11;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) || self->_testOptionFlags != *((_DWORD *)v4 + 6))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_requestedMessageType != *((_DWORD *)v4 + 3))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
LABEL_15:
    isEqual = 0;
    goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_requestedErrorCode != *((_DWORD *)v4 + 2))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_15;
  }
  subOperation = self->_subOperation;
  v11 = v4[2];
  if ((unint64_t)subOperation | v11)
    isEqual = objc_msgSend_isEqual_(subOperation, v8, v11, v9);
  else
    isEqual = 1;
LABEL_16:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  unsigned int testOptionFlags;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_requestedMessageType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_requestedErrorCode;
LABEL_6:
  testOptionFlags = self->_testOptionFlags;
  return v5 ^ v6 ^ objc_msgSend_hash(self->_subOperation, a2, v2, v3) ^ (2654435761 * testOptionFlags);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  self->_testOptionFlags = *((_DWORD *)v4 + 6);
  v7 = *((_BYTE *)v4 + 28);
  if ((v7 & 2) != 0)
  {
    self->_requestedMessageType = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 28);
  }
  if ((v7 & 1) != 0)
  {
    self->_requestedErrorCode = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v8 = *((_QWORD *)v4 + 2);
  if (v8)
  {
    v9 = v4;
    objc_msgSend_setSubOperation_(self, v5, v8, v6);
    v4 = v9;
  }

}

- (unsigned)testOptionFlags
{
  return self->_testOptionFlags;
}

- (void)setTestOptionFlags:(unsigned int)a3
{
  self->_testOptionFlags = a3;
}

- (unsigned)requestedMessageType
{
  return self->_requestedMessageType;
}

- (unsigned)requestedErrorCode
{
  return self->_requestedErrorCode;
}

- (NSString)subOperation
{
  return self->_subOperation;
}

- (void)setSubOperation:(id)a3
{
  objc_storeStrong((id *)&self->_subOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subOperation, 0);
}

@end
