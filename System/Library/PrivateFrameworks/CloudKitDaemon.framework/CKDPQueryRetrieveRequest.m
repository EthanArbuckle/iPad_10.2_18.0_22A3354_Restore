@implementation CKDPQueryRetrieveRequest

- (CKDPRequestedFields)requestedFields
{
  return self->_requestedFields;
}

+ (id)options
{
  if (qword_1ED700AA0 != -1)
    dispatch_once(&qword_1ED700AA0, &unk_1E78368E0);
  return (id)qword_1ED700A98;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_query)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_continuationMarker)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_requestedFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_assetsToDownload)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)setZoneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIdentifier, a3);
}

- (void)setRequestedFields:(id)a3
{
  objc_storeStrong((id *)&self->_requestedFields, a3);
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)setLimit:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_limit = a3;
}

- (void)setAssetsToDownload:(id)a3
{
  objc_storeStrong((id *)&self->_assetsToDownload, a3);
}

- (CKDPAssetsToDownload)assetsToDownload
{
  return self->_assetsToDownload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_requestedFields, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_continuationMarker, 0);
  objc_storeStrong((id *)&self->_assetsToDownload, 0);
}

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (BOOL)hasContinuationMarker
{
  return self->_continuationMarker != 0;
}

- (void)setHasLimit:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLimit
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (BOOL)hasRequestedFields
{
  return self->_requestedFields != 0;
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
  v11.super_class = (Class)CKDPQueryRetrieveRequest;
  -[CKDPQueryRetrieveRequest description](&v11, sel_description);
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
  CKDPQuery *query;
  void *v8;
  const char *v9;
  NSData *continuationMarker;
  void *v11;
  const char *v12;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  void *v14;
  const char *v15;
  CKDPRequestedFields *requestedFields;
  void *v17;
  const char *v18;
  CKDPAssetsToDownload *assetsToDownload;
  void *v20;
  const char *v21;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  query = self->_query;
  if (query)
  {
    objc_msgSend_dictionaryRepresentation(query, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("query"));

  }
  continuationMarker = self->_continuationMarker;
  if (continuationMarker)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)continuationMarker, CFSTR("continuationMarker"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v4, self->_limit);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("limit"));

  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(zoneIdentifier, v4, (uint64_t)continuationMarker);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("zoneIdentifier"));

  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    objc_msgSend_dictionaryRepresentation(requestedFields, v4, (uint64_t)continuationMarker);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, CFSTR("requestedFields"));

  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    objc_msgSend_dictionaryRepresentation(assetsToDownload, v4, (uint64_t)continuationMarker);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, CFSTR("assetsToDownload"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEBCBC2C((uint64_t)self, (uint64_t)a3);
}

- (unsigned)requestTypeCode
{
  return 11;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPQuery *query;
  NSData *continuationMarker;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  CKDPRequestedFields *requestedFields;
  CKDPAssetsToDownload *assetsToDownload;
  id v11;

  v4 = a3;
  query = self->_query;
  v11 = v4;
  if (query)
  {
    objc_msgSend_setQuery_(v4, v5, (uint64_t)query);
    v4 = v11;
  }
  continuationMarker = self->_continuationMarker;
  if (continuationMarker)
  {
    objc_msgSend_setContinuationMarker_(v11, v5, (uint64_t)continuationMarker);
    v4 = v11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_limit;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v11, v5, (uint64_t)zoneIdentifier);
    v4 = v11;
  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    objc_msgSend_setRequestedFields_(v11, v5, (uint64_t)requestedFields);
    v4 = v11;
  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    objc_msgSend_setAssetsToDownload_(v11, v5, (uint64_t)assetsToDownload);
    v4 = v11;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
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
  const char *v23;
  uint64_t v24;
  void *v25;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_query, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_continuationMarker, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v15;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 24) = self->_limit;
    *(_BYTE *)(v10 + 56) |= 1u;
  }
  v18 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v18;

  v21 = objc_msgSend_copyWithZone_(self->_requestedFields, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v21;

  v24 = objc_msgSend_copyWithZone_(self->_assetsToDownload, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v24;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPQuery *query;
  uint64_t v9;
  NSData *continuationMarker;
  uint64_t v11;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v13;
  CKDPRequestedFields *requestedFields;
  uint64_t v15;
  CKDPAssetsToDownload *assetsToDownload;
  uint64_t v17;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_17;
  query = self->_query;
  v9 = v4[4];
  if ((unint64_t)query | v9)
  {
    if (!objc_msgSend_isEqual_(query, v7, v9))
      goto LABEL_17;
  }
  continuationMarker = self->_continuationMarker;
  v11 = v4[2];
  if ((unint64_t)continuationMarker | v11)
  {
    if (!objc_msgSend_isEqual_(continuationMarker, v7, v11))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[7] & 1) == 0 || self->_limit != *((_DWORD *)v4 + 6))
      goto LABEL_17;
  }
  else if ((v4[7] & 1) != 0)
  {
LABEL_17:
    isEqual = 0;
    goto LABEL_18;
  }
  zoneIdentifier = self->_zoneIdentifier;
  v13 = v4[6];
  if ((unint64_t)zoneIdentifier | v13 && !objc_msgSend_isEqual_(zoneIdentifier, v7, v13))
    goto LABEL_17;
  requestedFields = self->_requestedFields;
  v15 = v4[5];
  if ((unint64_t)requestedFields | v15)
  {
    if (!objc_msgSend_isEqual_(requestedFields, v7, v15))
      goto LABEL_17;
  }
  assetsToDownload = self->_assetsToDownload;
  v17 = v4[1];
  if ((unint64_t)assetsToDownload | v17)
    isEqual = objc_msgSend_isEqual_(assetsToDownload, v7, v17);
  else
    isEqual = 1;
LABEL_18:

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
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;

  v4 = objc_msgSend_hash(self->_query, a2, v2);
  v7 = objc_msgSend_hash(self->_continuationMarker, v5, v6);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v10 = 2654435761 * self->_limit;
  else
    v10 = 0;
  v11 = v7 ^ v4 ^ v10 ^ objc_msgSend_hash(self->_zoneIdentifier, v8, v9);
  v14 = objc_msgSend_hash(self->_requestedFields, v12, v13);
  return v11 ^ v14 ^ objc_msgSend_hash(self->_assetsToDownload, v15, v16);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPQuery *query;
  uint64_t v6;
  uint64_t v7;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v9;
  CKDPRequestedFields *requestedFields;
  uint64_t v11;
  CKDPAssetsToDownload *assetsToDownload;
  uint64_t v13;
  id v14;

  v4 = a3;
  query = self->_query;
  v6 = *((_QWORD *)v4 + 4);
  v14 = v4;
  if (query)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(query, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setQuery_(self, (const char *)v4, v6);
  }
  v4 = v14;
LABEL_7:
  v7 = *((_QWORD *)v4 + 2);
  if (v7)
  {
    objc_msgSend_setContinuationMarker_(self, (const char *)v4, v7);
    v4 = v14;
  }
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_limit = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  zoneIdentifier = self->_zoneIdentifier;
  v9 = *((_QWORD *)v4 + 6);
  if (zoneIdentifier)
  {
    if (!v9)
      goto LABEL_17;
    objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v4, v9);
  }
  else
  {
    if (!v9)
      goto LABEL_17;
    objc_msgSend_setZoneIdentifier_(self, (const char *)v4, v9);
  }
  v4 = v14;
LABEL_17:
  requestedFields = self->_requestedFields;
  v11 = *((_QWORD *)v4 + 5);
  if (requestedFields)
  {
    if (!v11)
      goto LABEL_23;
    objc_msgSend_mergeFrom_(requestedFields, (const char *)v4, v11);
  }
  else
  {
    if (!v11)
      goto LABEL_23;
    objc_msgSend_setRequestedFields_(self, (const char *)v4, v11);
  }
  v4 = v14;
LABEL_23:
  assetsToDownload = self->_assetsToDownload;
  v13 = *((_QWORD *)v4 + 1);
  if (assetsToDownload)
  {
    if (v13)
    {
      objc_msgSend_mergeFrom_(assetsToDownload, (const char *)v4, v13);
LABEL_28:
      v4 = v14;
    }
  }
  else if (v13)
  {
    objc_msgSend_setAssetsToDownload_(self, (const char *)v4, v13);
    goto LABEL_28;
  }

}

- (CKDPQuery)query
{
  return self->_query;
}

- (NSData)continuationMarker
{
  return self->_continuationMarker;
}

- (void)setContinuationMarker:(id)a3
{
  objc_storeStrong((id *)&self->_continuationMarker, a3);
}

- (unsigned)limit
{
  return self->_limit;
}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

@end
