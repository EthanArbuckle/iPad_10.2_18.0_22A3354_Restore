@implementation CKDPAnonymousZoneInfo

- (BOOL)hasAnonymousZoneInfoID
{
  return self->_anonymousZoneInfoID != 0;
}

- (BOOL)hasAnonymousZoneInfoData
{
  return self->_anonymousZoneInfoData != 0;
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
  v11.super_class = (Class)CKDPAnonymousZoneInfo;
  -[CKDPAnonymousZoneInfo description](&v11, sel_description);
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
  NSString *anonymousZoneInfoID;
  NSData *anonymousZoneInfoData;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  anonymousZoneInfoID = self->_anonymousZoneInfoID;
  if (anonymousZoneInfoID)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)anonymousZoneInfoID, CFSTR("anonymousZoneInfoID"));
  anonymousZoneInfoData = self->_anonymousZoneInfoData;
  if (anonymousZoneInfoData)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)anonymousZoneInfoData, CFSTR("anonymousZoneInfoData"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB5A474((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_anonymousZoneInfoID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_anonymousZoneInfoData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *anonymousZoneInfoID;
  NSData *anonymousZoneInfoData;
  id v8;

  v4 = a3;
  anonymousZoneInfoID = self->_anonymousZoneInfoID;
  v8 = v4;
  if (anonymousZoneInfoID)
  {
    objc_msgSend_setAnonymousZoneInfoID_(v4, v5, (uint64_t)anonymousZoneInfoID);
    v4 = v8;
  }
  anonymousZoneInfoData = self->_anonymousZoneInfoData;
  if (anonymousZoneInfoData)
  {
    objc_msgSend_setAnonymousZoneInfoData_(v8, v5, (uint64_t)anonymousZoneInfoData);
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
  v12 = objc_msgSend_copyWithZone_(self->_anonymousZoneInfoID, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_anonymousZoneInfoData, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *anonymousZoneInfoID;
  uint64_t v9;
  NSData *anonymousZoneInfoData;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((anonymousZoneInfoID = self->_anonymousZoneInfoID, v9 = v4[2], !((unint64_t)anonymousZoneInfoID | v9))
     || objc_msgSend_isEqual_(anonymousZoneInfoID, v7, v9)))
  {
    anonymousZoneInfoData = self->_anonymousZoneInfoData;
    v11 = v4[1];
    if ((unint64_t)anonymousZoneInfoData | v11)
      isEqual = objc_msgSend_isEqual_(anonymousZoneInfoData, v7, v11);
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

  v4 = objc_msgSend_hash(self->_anonymousZoneInfoID, a2, v2);
  return objc_msgSend_hash(self->_anonymousZoneInfoData, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v6 = v4[2];
  v8 = v4;
  if (v6)
  {
    objc_msgSend_setAnonymousZoneInfoID_(self, v5, v6);
    v4 = v8;
  }
  v7 = v4[1];
  if (v7)
  {
    objc_msgSend_setAnonymousZoneInfoData_(self, v5, v7);
    v4 = v8;
  }

}

- (NSString)anonymousZoneInfoID
{
  return self->_anonymousZoneInfoID;
}

- (void)setAnonymousZoneInfoID:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousZoneInfoID, a3);
}

- (NSData)anonymousZoneInfoData
{
  return self->_anonymousZoneInfoData;
}

- (void)setAnonymousZoneInfoData:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousZoneInfoData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymousZoneInfoID, 0);
  objc_storeStrong((id *)&self->_anonymousZoneInfoData, 0);
}

@end
