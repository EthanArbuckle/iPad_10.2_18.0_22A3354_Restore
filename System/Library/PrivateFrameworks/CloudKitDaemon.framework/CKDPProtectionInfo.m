@implementation CKDPProtectionInfo

- (BOOL)hasProtectionInfo
{
  return self->_protectionInfo != 0;
}

- (BOOL)hasProtectionInfoTag
{
  return self->_protectionInfoTag != 0;
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
  v11.super_class = (Class)CKDPProtectionInfo;
  -[CKDPProtectionInfo description](&v11, sel_description);
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
  NSData *protectionInfo;
  NSString *protectionInfoTag;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)protectionInfo, CFSTR("protectionInfo"));
  protectionInfoTag = self->_protectionInfoTag;
  if (protectionInfoTag)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)protectionInfoTag, CFSTR("protectionInfoTag"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEA1BDA4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_protectionInfo)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_protectionInfoTag)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSData *protectionInfo;
  NSString *protectionInfoTag;
  id v8;

  v4 = a3;
  protectionInfo = self->_protectionInfo;
  v8 = v4;
  if (protectionInfo)
  {
    objc_msgSend_setProtectionInfo_(v4, v5, (uint64_t)protectionInfo);
    v4 = v8;
  }
  protectionInfoTag = self->_protectionInfoTag;
  if (protectionInfoTag)
  {
    objc_msgSend_setProtectionInfoTag_(v8, v5, (uint64_t)protectionInfoTag);
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
  v12 = objc_msgSend_copyWithZone_(self->_protectionInfo, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_protectionInfoTag, v14, (uint64_t)a3);
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
  NSData *protectionInfo;
  uint64_t v9;
  NSString *protectionInfoTag;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((protectionInfo = self->_protectionInfo, v9 = v4[1], !((unint64_t)protectionInfo | v9))
     || objc_msgSend_isEqual_(protectionInfo, v7, v9)))
  {
    protectionInfoTag = self->_protectionInfoTag;
    v11 = v4[2];
    if ((unint64_t)protectionInfoTag | v11)
      isEqual = objc_msgSend_isEqual_(protectionInfoTag, v7, v11);
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

  v4 = objc_msgSend_hash(self->_protectionInfo, a2, v2);
  return objc_msgSend_hash(self->_protectionInfoTag, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v6 = v4[1];
  v8 = v4;
  if (v6)
  {
    objc_msgSend_setProtectionInfo_(self, v5, v6);
    v4 = v8;
  }
  v7 = v4[2];
  if (v7)
  {
    objc_msgSend_setProtectionInfoTag_(self, v5, v7);
    v4 = v8;
  }

}

- (NSData)protectionInfo
{
  return self->_protectionInfo;
}

- (void)setProtectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_protectionInfo, a3);
}

- (NSString)protectionInfoTag
{
  return self->_protectionInfoTag;
}

- (void)setProtectionInfoTag:(id)a3
{
  objc_storeStrong((id *)&self->_protectionInfoTag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionInfoTag, 0);
  objc_storeStrong((id *)&self->_protectionInfo, 0);
}

@end
