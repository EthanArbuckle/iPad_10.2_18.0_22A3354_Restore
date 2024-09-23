@implementation CKDPRecordSaveResponse

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasTimeStatistics
{
  return self->_timeStatistics != 0;
}

- (BOOL)hasServerFields
{
  return self->_serverFields != 0;
}

- (BOOL)hasExpirationTime
{
  return self->_expirationTime != 0;
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
  v11.super_class = (Class)CKDPRecordSaveResponse;
  -[CKDPRecordSaveResponse description](&v11, sel_description);
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
  NSString *etag;
  CKDPDateStatistics *timeStatistics;
  void *v9;
  const char *v10;
  CKDPRecord *serverFields;
  void *v12;
  const char *v13;
  CKDPDate *expirationTime;
  void *v15;
  const char *v16;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  etag = self->_etag;
  if (etag)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)etag, CFSTR("etag"));
  timeStatistics = self->_timeStatistics;
  if (timeStatistics)
  {
    objc_msgSend_dictionaryRepresentation(timeStatistics, v5, (uint64_t)etag);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, CFSTR("timeStatistics"));

  }
  serverFields = self->_serverFields;
  if (serverFields)
  {
    objc_msgSend_dictionaryRepresentation(serverFields, v5, (uint64_t)etag);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, CFSTR("serverFields"));

  }
  expirationTime = self->_expirationTime;
  if (expirationTime)
  {
    objc_msgSend_dictionaryRepresentation(expirationTime, v5, (uint64_t)etag);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, CFSTR("expirationTime"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEACFA64((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_etag)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_timeStatistics)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_serverFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_expirationTime)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *etag;
  CKDPDateStatistics *timeStatistics;
  CKDPRecord *serverFields;
  CKDPDate *expirationTime;
  id v10;

  v4 = a3;
  etag = self->_etag;
  v10 = v4;
  if (etag)
  {
    objc_msgSend_setEtag_(v4, v5, (uint64_t)etag);
    v4 = v10;
  }
  timeStatistics = self->_timeStatistics;
  if (timeStatistics)
  {
    objc_msgSend_setTimeStatistics_(v10, v5, (uint64_t)timeStatistics);
    v4 = v10;
  }
  serverFields = self->_serverFields;
  if (serverFields)
  {
    objc_msgSend_setServerFields_(v10, v5, (uint64_t)serverFields);
    v4 = v10;
  }
  expirationTime = self->_expirationTime;
  if (expirationTime)
  {
    objc_msgSend_setExpirationTime_(v10, v5, (uint64_t)expirationTime);
    v4 = v10;
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
  const char *v20;
  uint64_t v21;
  void *v22;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_etag, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_timeStatistics, v14, (uint64_t)a3);
  v16 = (void *)v10[4];
  v10[4] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_serverFields, v17, (uint64_t)a3);
  v19 = (void *)v10[3];
  v10[3] = v18;

  v21 = objc_msgSend_copyWithZone_(self->_expirationTime, v20, (uint64_t)a3);
  v22 = (void *)v10[2];
  v10[2] = v21;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *etag;
  uint64_t v9;
  CKDPDateStatistics *timeStatistics;
  uint64_t v11;
  CKDPRecord *serverFields;
  uint64_t v13;
  CKDPDate *expirationTime;
  uint64_t v15;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((etag = self->_etag, v9 = v4[1], !((unint64_t)etag | v9))
     || objc_msgSend_isEqual_(etag, v7, v9))
    && ((timeStatistics = self->_timeStatistics, v11 = v4[4], !((unint64_t)timeStatistics | v11))
     || objc_msgSend_isEqual_(timeStatistics, v7, v11))
    && ((serverFields = self->_serverFields, v13 = v4[3], !((unint64_t)serverFields | v13))
     || objc_msgSend_isEqual_(serverFields, v7, v13)))
  {
    expirationTime = self->_expirationTime;
    v15 = v4[2];
    if ((unint64_t)expirationTime | v15)
      isEqual = objc_msgSend_isEqual_(expirationTime, v7, v15);
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
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  v4 = objc_msgSend_hash(self->_etag, a2, v2);
  v7 = objc_msgSend_hash(self->_timeStatistics, v5, v6) ^ v4;
  v10 = objc_msgSend_hash(self->_serverFields, v8, v9);
  return v7 ^ v10 ^ objc_msgSend_hash(self->_expirationTime, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  CKDPDateStatistics *timeStatistics;
  uint64_t v7;
  CKDPRecord *serverFields;
  uint64_t v9;
  CKDPDate *expirationTime;
  uint64_t v11;
  _QWORD *v12;

  v4 = a3;
  v5 = v4[1];
  v12 = v4;
  if (v5)
  {
    objc_msgSend_setEtag_(self, (const char *)v4, v5);
    v4 = v12;
  }
  timeStatistics = self->_timeStatistics;
  v7 = v4[4];
  if (timeStatistics)
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend_mergeFrom_(timeStatistics, (const char *)v4, v7);
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend_setTimeStatistics_(self, (const char *)v4, v7);
  }
  v4 = v12;
LABEL_9:
  serverFields = self->_serverFields;
  v9 = v4[3];
  if (serverFields)
  {
    if (!v9)
      goto LABEL_15;
    objc_msgSend_mergeFrom_(serverFields, (const char *)v4, v9);
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    objc_msgSend_setServerFields_(self, (const char *)v4, v9);
  }
  v4 = v12;
LABEL_15:
  expirationTime = self->_expirationTime;
  v11 = v4[2];
  if (expirationTime)
  {
    if (v11)
    {
      objc_msgSend_mergeFrom_(expirationTime, (const char *)v4, v11);
LABEL_20:
      v4 = v12;
    }
  }
  else if (v11)
  {
    objc_msgSend_setExpirationTime_(self, (const char *)v4, v11);
    goto LABEL_20;
  }

}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (CKDPDateStatistics)timeStatistics
{
  return self->_timeStatistics;
}

- (void)setTimeStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_timeStatistics, a3);
}

- (CKDPRecord)serverFields
{
  return self->_serverFields;
}

- (void)setServerFields:(id)a3
{
  objc_storeStrong((id *)&self->_serverFields, a3);
}

- (CKDPDate)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(id)a3
{
  objc_storeStrong((id *)&self->_expirationTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStatistics, 0);
  objc_storeStrong((id *)&self->_serverFields, 0);
  objc_storeStrong((id *)&self->_expirationTime, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end
