@implementation CKCDPCodeServiceRequestOperationGroup

- (BOOL)hasOperationId
{
  return self->_operationId != 0;
}

- (BOOL)hasOperationGroupId
{
  return self->_operationGroupId != 0;
}

- (BOOL)hasOperationGroupName
{
  return self->_operationGroupName != 0;
}

- (void)setOperationGroupQuantity:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_operationGroupQuantity = a3;
}

- (void)setHasOperationGroupQuantity:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOperationGroupQuantity
{
  return *(_BYTE *)&self->_has & 1;
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
  v11.super_class = (Class)CKCDPCodeServiceRequestOperationGroup;
  -[CKCDPCodeServiceRequestOperationGroup description](&v11, sel_description);
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
  NSString *operationId;
  NSString *operationGroupId;
  NSString *operationGroupName;
  void *v10;
  const char *v11;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  operationId = self->_operationId;
  if (operationId)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)operationId, CFSTR("operationId"));
  operationGroupId = self->_operationGroupId;
  if (operationGroupId)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)operationGroupId, CFSTR("operationGroupId"));
  operationGroupName = self->_operationGroupName;
  if (operationGroupName)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)operationGroupName, CFSTR("operationGroupName"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v5, self->_operationGroupQuantity);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("operationGroupQuantity"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB6AEB4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_operationId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_operationGroupId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_operationGroupName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *operationId;
  NSString *operationGroupId;
  NSString *operationGroupName;
  id v9;

  v4 = a3;
  operationId = self->_operationId;
  v9 = v4;
  if (operationId)
  {
    objc_msgSend_setOperationId_(v4, v5, (uint64_t)operationId);
    v4 = v9;
  }
  operationGroupId = self->_operationGroupId;
  if (operationGroupId)
  {
    objc_msgSend_setOperationGroupId_(v9, v5, (uint64_t)operationGroupId);
    v4 = v9;
  }
  operationGroupName = self->_operationGroupName;
  if (operationGroupName)
  {
    objc_msgSend_setOperationGroupName_(v9, v5, (uint64_t)operationGroupName);
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_operationGroupQuantity;
    *((_BYTE *)v4 + 40) |= 1u;
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
  const char *v17;
  uint64_t v18;
  void *v19;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_operationId, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_operationGroupId, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v15;

  v18 = objc_msgSend_copyWithZone_(self->_operationGroupName, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v18;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v10 + 8) = self->_operationGroupQuantity;
    *(_BYTE *)(v10 + 40) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *operationId;
  uint64_t v9;
  NSString *operationGroupId;
  uint64_t v11;
  NSString *operationGroupName;
  uint64_t v13;
  BOOL v14;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_12;
  operationId = self->_operationId;
  v9 = v4[4];
  if ((unint64_t)operationId | v9)
  {
    if (!objc_msgSend_isEqual_(operationId, v7, v9))
      goto LABEL_12;
  }
  operationGroupId = self->_operationGroupId;
  v11 = v4[2];
  if ((unint64_t)operationGroupId | v11)
  {
    if (!objc_msgSend_isEqual_(operationGroupId, v7, v11))
      goto LABEL_12;
  }
  operationGroupName = self->_operationGroupName;
  v13 = v4[3];
  if ((unint64_t)operationGroupName | v13)
  {
    if (!objc_msgSend_isEqual_(operationGroupName, v7, v13))
      goto LABEL_12;
  }
  v14 = (v4[5] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[5] & 1) != 0 && self->_operationGroupQuantity == v4[1])
    {
      v14 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v14 = 0;
  }
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_msgSend_hash(self->_operationId, a2, v2);
  v7 = objc_msgSend_hash(self->_operationGroupId, v5, v6);
  v10 = objc_msgSend_hash(self->_operationGroupName, v8, v9);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_operationGroupQuantity;
  else
    v11 = 0;
  return v7 ^ v4 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v6 = v4[4];
  v9 = v4;
  if (v6)
  {
    objc_msgSend_setOperationId_(self, v5, v6);
    v4 = v9;
  }
  v7 = v4[2];
  if (v7)
  {
    objc_msgSend_setOperationGroupId_(self, v5, v7);
    v4 = v9;
  }
  v8 = v4[3];
  if (v8)
  {
    objc_msgSend_setOperationGroupName_(self, v5, v8);
    v4 = v9;
  }
  if ((v4[5] & 1) != 0)
  {
    self->_operationGroupQuantity = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)operationId
{
  return self->_operationId;
}

- (void)setOperationId:(id)a3
{
  objc_storeStrong((id *)&self->_operationId, a3);
}

- (NSString)operationGroupId
{
  return self->_operationGroupId;
}

- (void)setOperationGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_operationGroupId, a3);
}

- (NSString)operationGroupName
{
  return self->_operationGroupName;
}

- (void)setOperationGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_operationGroupName, a3);
}

- (int64_t)operationGroupQuantity
{
  return self->_operationGroupQuantity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationId, 0);
  objc_storeStrong((id *)&self->_operationGroupName, 0);
  objc_storeStrong((id *)&self->_operationGroupId, 0);
}

@end
