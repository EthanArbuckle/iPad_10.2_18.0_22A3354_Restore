@implementation CKDPStreamingAssetIdentifier

- (BOOL)hasOwner
{
  return self->_owner != 0;
}

- (BOOL)hasFileSignature
{
  return self->_fileSignature != 0;
}

- (BOOL)hasReferenceSignature
{
  return self->_referenceSignature != 0;
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
  v11.super_class = (Class)CKDPStreamingAssetIdentifier;
  -[CKDPStreamingAssetIdentifier description](&v11, sel_description);
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
  NSString *owner;
  NSData *fileSignature;
  NSData *referenceSignature;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  owner = self->_owner;
  if (owner)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)owner, CFSTR("owner"));
  fileSignature = self->_fileSignature;
  if (fileSignature)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)fileSignature, CFSTR("fileSignature"));
  referenceSignature = self->_referenceSignature;
  if (referenceSignature)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)referenceSignature, CFSTR("referenceSignature"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEA5CE38((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_owner)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_fileSignature)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_referenceSignature)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *owner;
  NSData *fileSignature;
  NSData *referenceSignature;
  id v9;

  v4 = a3;
  owner = self->_owner;
  v9 = v4;
  if (owner)
  {
    objc_msgSend_setOwner_(v4, v5, (uint64_t)owner);
    v4 = v9;
  }
  fileSignature = self->_fileSignature;
  if (fileSignature)
  {
    objc_msgSend_setFileSignature_(v9, v5, (uint64_t)fileSignature);
    v4 = v9;
  }
  referenceSignature = self->_referenceSignature;
  if (referenceSignature)
  {
    objc_msgSend_setReferenceSignature_(v9, v5, (uint64_t)referenceSignature);
    v4 = v9;
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
  const char *v17;
  uint64_t v18;
  void *v19;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_owner, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_fileSignature, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_referenceSignature, v17, (uint64_t)a3);
  v19 = (void *)v10[3];
  v10[3] = v18;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *owner;
  uint64_t v9;
  NSData *fileSignature;
  uint64_t v11;
  NSData *referenceSignature;
  uint64_t v13;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((owner = self->_owner, v9 = v4[2], !((unint64_t)owner | v9))
     || objc_msgSend_isEqual_(owner, v7, v9))
    && ((fileSignature = self->_fileSignature, v11 = v4[1], !((unint64_t)fileSignature | v11))
     || objc_msgSend_isEqual_(fileSignature, v7, v11)))
  {
    referenceSignature = self->_referenceSignature;
    v13 = v4[3];
    if ((unint64_t)referenceSignature | v13)
      isEqual = objc_msgSend_isEqual_(referenceSignature, v7, v13);
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
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v4 = objc_msgSend_hash(self->_owner, a2, v2);
  v7 = objc_msgSend_hash(self->_fileSignature, v5, v6) ^ v4;
  return v7 ^ objc_msgSend_hash(self->_referenceSignature, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  v5 = v8[2];
  if (v5)
    objc_msgSend_setOwner_(self, v4, v5);
  v6 = v8[1];
  if (v6)
    objc_msgSend_setFileSignature_(self, v4, v6);
  v7 = v8[3];
  if (v7)
    objc_msgSend_setReferenceSignature_(self, v4, v7);

}

- (NSString)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  objc_storeStrong((id *)&self->_owner, a3);
}

- (NSData)fileSignature
{
  return self->_fileSignature;
}

- (void)setFileSignature:(id)a3
{
  objc_storeStrong((id *)&self->_fileSignature, a3);
}

- (NSData)referenceSignature
{
  return self->_referenceSignature;
}

- (void)setReferenceSignature:(id)a3
{
  objc_storeStrong((id *)&self->_referenceSignature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceSignature, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_fileSignature, 0);
}

@end
