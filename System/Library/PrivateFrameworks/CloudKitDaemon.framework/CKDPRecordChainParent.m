@implementation CKDPRecordChainParent

- (BOOL)hasPublicKeyID
{
  return self->_publicKeyID != 0;
}

- (BOOL)hasReference
{
  return self->_reference != 0;
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
  v11.super_class = (Class)CKDPRecordChainParent;
  -[CKDPRecordChainParent description](&v11, sel_description);
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
  NSData *publicKeyID;
  CKDPRecordReference *reference;
  void *v9;
  const char *v10;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  publicKeyID = self->_publicKeyID;
  if (publicKeyID)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)publicKeyID, CFSTR("publicKeyID"));
  reference = self->_reference;
  if (reference)
  {
    objc_msgSend_dictionaryRepresentation(reference, v5, (uint64_t)publicKeyID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, CFSTR("reference"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordChainParentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_publicKeyID)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_reference)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSData *publicKeyID;
  CKDPRecordReference *reference;
  id v8;

  v4 = a3;
  publicKeyID = self->_publicKeyID;
  v8 = v4;
  if (publicKeyID)
  {
    objc_msgSend_setPublicKeyID_(v4, v5, (uint64_t)publicKeyID);
    v4 = v8;
  }
  reference = self->_reference;
  if (reference)
  {
    objc_msgSend_setReference_(v8, v5, (uint64_t)reference);
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
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_publicKeyID, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_reference, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSData *publicKeyID;
  uint64_t v9;
  CKDPRecordReference *reference;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((publicKeyID = self->_publicKeyID, v9 = v4[1], !((unint64_t)publicKeyID | v9))
     || objc_msgSend_isEqual_(publicKeyID, v7, v9)))
  {
    reference = self->_reference;
    v11 = v4[2];
    if ((unint64_t)reference | v11)
      isEqual = objc_msgSend_isEqual_(reference, v7, v11);
    else
      isEqual = 1;
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(self->_publicKeyID, a2, v2);
  return objc_msgSend_hash(self->_reference, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  CKDPRecordReference *reference;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4[1];
  v8 = v4;
  if (v5)
  {
    objc_msgSend_setPublicKeyID_(self, (const char *)v4, v5);
    v4 = v8;
  }
  reference = self->_reference;
  v7 = v4[2];
  if (reference)
  {
    if (v7)
    {
      objc_msgSend_mergeFrom_(reference, (const char *)v4, v7);
LABEL_8:
      v4 = v8;
    }
  }
  else if (v7)
  {
    objc_msgSend_setReference_(self, (const char *)v4, v7);
    goto LABEL_8;
  }

}

- (NSData)publicKeyID
{
  return self->_publicKeyID;
}

- (void)setPublicKeyID:(id)a3
{
  objc_storeStrong((id *)&self->_publicKeyID, a3);
}

- (CKDPRecordReference)reference
{
  return self->_reference;
}

- (void)setReference:(id)a3
{
  objc_storeStrong((id *)&self->_reference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_publicKeyID, 0);
}

@end
