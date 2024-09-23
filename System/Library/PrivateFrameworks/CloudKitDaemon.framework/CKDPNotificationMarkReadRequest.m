@implementation CKDPNotificationMarkReadRequest

+ (id)options
{
  if (qword_1ED702C88 != -1)
    dispatch_once(&qword_1ED702C88, &unk_1E78383A8);
  return (id)qword_1ED702C80;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
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
  v11.super_class = (Class)CKDPNotificationMarkReadRequest;
  -[CKDPNotificationMarkReadRequest description](&v11, sel_description);
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
  NSString *uuid;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)uuid, CFSTR("uuid"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC4051C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_uuid)
    PBDataWriterWriteStringField();
}

- (unsigned)requestTypeCode
{
  return 66;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  NSString *uuid;

  uuid = self->_uuid;
  if (uuid)
    objc_msgSend_setUuid_(a3, a2, (uint64_t)uuid);
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
  v12 = objc_msgSend_copyWithZone_(self->_uuid, v11, (uint64_t)a3);
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
  NSString *uuid;
  uint64_t v9;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5))
  {
    uuid = self->_uuid;
    v9 = v4[1];
    if ((unint64_t)uuid | v9)
      isEqual = objc_msgSend_isEqual_(uuid, v7, v9);
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

  return objc_msgSend_hash(self->_uuid, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)a3 + 1);
  if (v3)
    objc_msgSend_setUuid_(self, a2, v3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
