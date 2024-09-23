@implementation CKDPRecordRetrieveVersionsRequest

+ (id)options
{
  if (qword_1ED700980 != -1)
    dispatch_once(&qword_1ED700980, &unk_1E7833228);
  return (id)qword_1ED700978;
}

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (BOOL)hasRequestedFields
{
  return self->_requestedFields != 0;
}

- (BOOL)hasMinimumVersionEtag
{
  return self->_minimumVersionEtag != 0;
}

- (BOOL)hasAssetsToDownload
{
  return self->_assetsToDownload != 0;
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
  v11.super_class = (Class)CKDPRecordRetrieveVersionsRequest;
  -[CKDPRecordRetrieveVersionsRequest description](&v11, sel_description);
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
  uint64_t v5;
  void *v6;
  CKDPRecordIdentifier *recordIdentifier;
  void *v8;
  const char *v9;
  CKDPRequestedFields *requestedFields;
  void *v11;
  const char *v12;
  NSString *minimumVersionEtag;
  CKDPAssetsToDownload *assetsToDownload;
  void *v15;
  const char *v16;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(recordIdentifier, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("recordIdentifier"));

  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    objc_msgSend_dictionaryRepresentation(requestedFields, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("requestedFields"));

  }
  minimumVersionEtag = self->_minimumVersionEtag;
  if (minimumVersionEtag)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)minimumVersionEtag, CFSTR("minimumVersionEtag"));
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    objc_msgSend_dictionaryRepresentation(assetsToDownload, v4, (uint64_t)minimumVersionEtag);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, CFSTR("assetsToDownload"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAEAB58((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_recordIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_requestedFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_minimumVersionEtag)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_assetsToDownload)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (unsigned)requestTypeCode
{
  return 45;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPRecordIdentifier *recordIdentifier;
  CKDPRequestedFields *requestedFields;
  NSString *minimumVersionEtag;
  CKDPAssetsToDownload *assetsToDownload;
  id v10;

  v4 = a3;
  recordIdentifier = self->_recordIdentifier;
  v10 = v4;
  if (recordIdentifier)
  {
    objc_msgSend_setRecordIdentifier_(v4, v5, (uint64_t)recordIdentifier);
    v4 = v10;
  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    objc_msgSend_setRequestedFields_(v10, v5, (uint64_t)requestedFields);
    v4 = v10;
  }
  minimumVersionEtag = self->_minimumVersionEtag;
  if (minimumVersionEtag)
  {
    objc_msgSend_setMinimumVersionEtag_(v10, v5, (uint64_t)minimumVersionEtag);
    v4 = v10;
  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    objc_msgSend_setAssetsToDownload_(v10, v5, (uint64_t)assetsToDownload);
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
  v12 = objc_msgSend_copyWithZone_(self->_recordIdentifier, v11, (uint64_t)a3);
  v13 = (void *)v10[3];
  v10[3] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_requestedFields, v14, (uint64_t)a3);
  v16 = (void *)v10[4];
  v10[4] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_minimumVersionEtag, v17, (uint64_t)a3);
  v19 = (void *)v10[2];
  v10[2] = v18;

  v21 = objc_msgSend_copyWithZone_(self->_assetsToDownload, v20, (uint64_t)a3);
  v22 = (void *)v10[1];
  v10[1] = v21;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecordIdentifier *recordIdentifier;
  uint64_t v9;
  CKDPRequestedFields *requestedFields;
  uint64_t v11;
  NSString *minimumVersionEtag;
  uint64_t v13;
  CKDPAssetsToDownload *assetsToDownload;
  uint64_t v15;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((recordIdentifier = self->_recordIdentifier, v9 = v4[3], !((unint64_t)recordIdentifier | v9))
     || objc_msgSend_isEqual_(recordIdentifier, v7, v9))
    && ((requestedFields = self->_requestedFields, v11 = v4[4], !((unint64_t)requestedFields | v11))
     || objc_msgSend_isEqual_(requestedFields, v7, v11))
    && ((minimumVersionEtag = self->_minimumVersionEtag, v13 = v4[2], !((unint64_t)minimumVersionEtag | v13))
     || objc_msgSend_isEqual_(minimumVersionEtag, v7, v13)))
  {
    assetsToDownload = self->_assetsToDownload;
    v15 = v4[1];
    if ((unint64_t)assetsToDownload | v15)
      isEqual = objc_msgSend_isEqual_(assetsToDownload, v7, v15);
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

  v4 = objc_msgSend_hash(self->_recordIdentifier, a2, v2);
  v7 = objc_msgSend_hash(self->_requestedFields, v5, v6) ^ v4;
  v10 = objc_msgSend_hash(self->_minimumVersionEtag, v8, v9);
  return v7 ^ v10 ^ objc_msgSend_hash(self->_assetsToDownload, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CKDPRecordIdentifier *recordIdentifier;
  uint64_t v6;
  CKDPRequestedFields *requestedFields;
  uint64_t v8;
  uint64_t v9;
  CKDPAssetsToDownload *assetsToDownload;
  uint64_t v11;
  _QWORD *v12;

  v4 = a3;
  recordIdentifier = self->_recordIdentifier;
  v6 = v4[3];
  v12 = v4;
  if (recordIdentifier)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(recordIdentifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setRecordIdentifier_(self, (const char *)v4, v6);
  }
  v4 = v12;
LABEL_7:
  requestedFields = self->_requestedFields;
  v8 = v4[4];
  if (requestedFields)
  {
    if (!v8)
      goto LABEL_13;
    objc_msgSend_mergeFrom_(requestedFields, (const char *)v4, v8);
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    objc_msgSend_setRequestedFields_(self, (const char *)v4, v8);
  }
  v4 = v12;
LABEL_13:
  v9 = v4[2];
  if (v9)
  {
    objc_msgSend_setMinimumVersionEtag_(self, (const char *)v4, v9);
    v4 = v12;
  }
  assetsToDownload = self->_assetsToDownload;
  v11 = v4[1];
  if (assetsToDownload)
  {
    if (v11)
    {
      objc_msgSend_mergeFrom_(assetsToDownload, (const char *)v4, v11);
LABEL_20:
      v4 = v12;
    }
  }
  else if (v11)
  {
    objc_msgSend_setAssetsToDownload_(self, (const char *)v4, v11);
    goto LABEL_20;
  }

}

- (CKDPRecordIdentifier)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_recordIdentifier, a3);
}

- (CKDPRequestedFields)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(id)a3
{
  objc_storeStrong((id *)&self->_requestedFields, a3);
}

- (NSString)minimumVersionEtag
{
  return self->_minimumVersionEtag;
}

- (void)setMinimumVersionEtag:(id)a3
{
  objc_storeStrong((id *)&self->_minimumVersionEtag, a3);
}

- (CKDPAssetsToDownload)assetsToDownload
{
  return self->_assetsToDownload;
}

- (void)setAssetsToDownload:(id)a3
{
  objc_storeStrong((id *)&self->_assetsToDownload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedFields, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_minimumVersionEtag, 0);
  objc_storeStrong((id *)&self->_assetsToDownload, 0);
}

@end
