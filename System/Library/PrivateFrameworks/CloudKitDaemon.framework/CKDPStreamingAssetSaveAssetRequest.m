@implementation CKDPStreamingAssetSaveAssetRequest

- (void)setRequestedSize:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requestedSize = a3;
}

- (void)setHasRequestedSize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestedSize
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setUploadedSize:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_uploadedSize = a3;
}

- (void)setHasUploadedSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUploadedSize
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasUploadReceipt
{
  return self->_uploadReceipt != 0;
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
  v11.super_class = (Class)CKDPStreamingAssetSaveAssetRequest;
  -[CKDPStreamingAssetSaveAssetRequest description](&v11, sel_description);
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
  char has;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  NSString *uploadReceipt;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v4, self->_requestedSize);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, CFSTR("requestedSize"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v4, self->_uploadedSize);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v10, (uint64_t)v9, CFSTR("uploadedSize"));

  }
  uploadReceipt = self->_uploadReceipt;
  if (uploadReceipt)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)uploadReceipt, CFSTR("uploadReceipt"));
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEA89788((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_uploadReceipt)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  const char *v5;
  char has;
  NSString *uploadReceipt;
  _QWORD *v8;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_requestedSize;
    *((_BYTE *)v4 + 32) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = self->_uploadedSize;
    *((_BYTE *)v4 + 32) |= 2u;
  }
  uploadReceipt = self->_uploadReceipt;
  if (uploadReceipt)
  {
    v8 = v4;
    objc_msgSend_setUploadReceipt_(v4, v5, (uint64_t)uploadReceipt);
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
  _QWORD *v12;
  char has;
  uint64_t v14;
  void *v15;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (_QWORD *)v10;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v10 + 8) = self->_requestedSize;
    *(_BYTE *)(v10 + 32) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v10 + 16) = self->_uploadedSize;
    *(_BYTE *)(v10 + 32) |= 2u;
  }
  v14 = objc_msgSend_copyWithZone_(self->_uploadReceipt, v11, (uint64_t)a3);
  v15 = (void *)v12[3];
  v12[3] = v14;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *uploadReceipt;
  uint64_t v9;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[4] & 1) == 0 || self->_requestedSize != v4[1])
      goto LABEL_14;
  }
  else if ((v4[4] & 1) != 0)
  {
LABEL_14:
    isEqual = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[4] & 2) == 0 || self->_uploadedSize != v4[2])
      goto LABEL_14;
  }
  else if ((v4[4] & 2) != 0)
  {
    goto LABEL_14;
  }
  uploadReceipt = self->_uploadReceipt;
  v9 = v4[3];
  if ((unint64_t)uploadReceipt | v9)
    isEqual = objc_msgSend_isEqual_(uploadReceipt, v7, v9);
  else
    isEqual = 1;
LABEL_15:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_requestedSize;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3 ^ objc_msgSend_hash(self->_uploadReceipt, a2, v2);
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_uploadedSize;
  return v4 ^ v3 ^ objc_msgSend_hash(self->_uploadReceipt, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  char v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v6 = *((_BYTE *)v4 + 32);
  if ((v6 & 1) != 0)
  {
    self->_requestedSize = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 32);
  }
  if ((v6 & 2) != 0)
  {
    self->_uploadedSize = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  v7 = *((_QWORD *)v4 + 3);
  if (v7)
  {
    v8 = v4;
    objc_msgSend_setUploadReceipt_(self, v5, v7);
    v4 = v8;
  }

}

- (int64_t)requestedSize
{
  return self->_requestedSize;
}

- (int64_t)uploadedSize
{
  return self->_uploadedSize;
}

- (NSString)uploadReceipt
{
  return self->_uploadReceipt;
}

- (void)setUploadReceipt:(id)a3
{
  objc_storeStrong((id *)&self->_uploadReceipt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadReceipt, 0);
}

@end
