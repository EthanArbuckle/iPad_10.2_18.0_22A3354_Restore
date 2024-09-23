@implementation IDSQRProtoUnAllocBindResponse

- (BOOL)hasReportingDataBlob
{
  return self->_reportingDataBlob != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoUnAllocBindResponse;
  -[IDSQRProtoUnAllocBindResponse description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  NSData *reportingDataBlob;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  reportingDataBlob = self->_reportingDataBlob;
  if (reportingDataBlob)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)reportingDataBlob, v7, CFSTR("reporting_data_blob"));
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoUnAllocBindResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_reportingDataBlob)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  double v3;
  NSData *reportingDataBlob;

  reportingDataBlob = self->_reportingDataBlob;
  if (reportingDataBlob)
    objc_msgSend_setReportingDataBlob_(a3, a2, (uint64_t)reportingDataBlob, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  _QWORD *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (_QWORD *)objc_msgSend_init(v8, v9, v10, v11);
  v15 = objc_msgSend_copyWithZone_(self->_reportingDataBlob, v13, (uint64_t)a3, v14);
  v16 = (void *)v12[1];
  v12[1] = v15;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSData *reportingDataBlob;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
  {
    reportingDataBlob = self->_reportingDataBlob;
    v11 = v4[1];
    if ((unint64_t)reportingDataBlob | v11)
      isEqual = objc_msgSend_isEqual_(reportingDataBlob, v8, v11, v9);
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
  double v3;

  return objc_msgSend_hash(self->_reportingDataBlob, a2, v2, v3);
}

- (void)mergeFrom:(id)a3
{
  double v3;
  uint64_t v4;

  v4 = *((_QWORD *)a3 + 1);
  if (v4)
    objc_msgSend_setReportingDataBlob_(self, a2, v4, v3);
}

- (NSData)reportingDataBlob
{
  return self->_reportingDataBlob;
}

- (void)setReportingDataBlob:(id)a3
{
  objc_storeStrong((id *)&self->_reportingDataBlob, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingDataBlob, 0);
}

@end
