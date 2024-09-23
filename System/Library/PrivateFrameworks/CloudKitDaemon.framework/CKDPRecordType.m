@implementation CKDPRecordType

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)writeTo:(id)a3
{
  if (self->_name)
    PBDataWriterWriteStringField();
}

- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  id v9;

  v5 = a3;
  objc_msgSend_name(self, v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeString_(v5, v8, (uint64_t)v9);

}

- (BOOL)hasName
{
  return self->_name != 0;
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
  v11.super_class = (Class)CKDPRecordType;
  -[CKDPRecordType description](&v11, sel_description);
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
  NSString *name;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  name = self->_name;
  if (name)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)name, CFSTR("name"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordTypeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  NSString *name;

  name = self->_name;
  if (name)
    objc_msgSend_setName_(a3, a2, (uint64_t)name);
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

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_name, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *name;
  uint64_t v9;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5))
  {
    name = self->_name;
    v9 = v4[1];
    if ((unint64_t)name | v9)
      isEqual = objc_msgSend_isEqual_(name, v7, v9);
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

  return objc_msgSend_hash(self->_name, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)a3 + 1);
  if (v3)
    objc_msgSend_setName_(self, a2, v3);
}

- (NSString)name
{
  return self->_name;
}

@end
