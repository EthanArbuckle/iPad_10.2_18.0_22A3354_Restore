@implementation CKDPLocale

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_languageCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_regionCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)setRegionCode:(id)a3
{
  objc_storeStrong((id *)&self->_regionCode, a3);
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0;
}

- (BOOL)hasRegionCode
{
  return self->_regionCode != 0;
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
  v11.super_class = (Class)CKDPLocale;
  -[CKDPLocale description](&v11, sel_description);
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
  NSString *languageCode;
  NSString *regionCode;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  languageCode = self->_languageCode;
  if (languageCode)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)languageCode, CFSTR("languageCode"));
  regionCode = self->_regionCode;
  if (regionCode)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)regionCode, CFSTR("regionCode"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB96488((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *languageCode;
  NSString *regionCode;
  id v8;

  v4 = a3;
  languageCode = self->_languageCode;
  v8 = v4;
  if (languageCode)
  {
    objc_msgSend_setLanguageCode_(v4, v5, (uint64_t)languageCode);
    v4 = v8;
  }
  regionCode = self->_regionCode;
  if (regionCode)
  {
    objc_msgSend_setRegionCode_(v8, v5, (uint64_t)regionCode);
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
  v12 = objc_msgSend_copyWithZone_(self->_languageCode, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_regionCode, v14, (uint64_t)a3);
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
  NSString *languageCode;
  uint64_t v9;
  NSString *regionCode;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((languageCode = self->_languageCode, v9 = v4[1], !((unint64_t)languageCode | v9))
     || objc_msgSend_isEqual_(languageCode, v7, v9)))
  {
    regionCode = self->_regionCode;
    v11 = v4[2];
    if ((unint64_t)regionCode | v11)
      isEqual = objc_msgSend_isEqual_(regionCode, v7, v11);
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

  v4 = objc_msgSend_hash(self->_languageCode, a2, v2);
  return objc_msgSend_hash(self->_regionCode, v5, v6) ^ v4;
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
    objc_msgSend_setLanguageCode_(self, v5, v6);
    v4 = v8;
  }
  v7 = v4[2];
  if (v7)
  {
    objc_msgSend_setRegionCode_(self, v5, v7);
    v4 = v8;
  }

}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)regionCode
{
  return self->_regionCode;
}

@end
