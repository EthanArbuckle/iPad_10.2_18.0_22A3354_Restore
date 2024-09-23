@implementation CKDPRecordRetrieveChangesRequest

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_syncContinuationToken)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_requestedFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_assetsToDownload)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_15;
LABEL_19:
    PBDataWriterWriteBOOLField();
    v4 = v7;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField();
  v4 = v7;
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
    goto LABEL_19;
LABEL_15:
  if ((v6 & 8) != 0)
  {
LABEL_16:
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
LABEL_17:

}

- (void)setZoneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIdentifier, a3);
}

- (void)setSyncContinuationToken:(id)a3
{
  objc_storeStrong((id *)&self->_syncContinuationToken, a3);
}

- (void)setRequestedChangeTypes:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requestedChangeTypes = a3;
}

- (void)setNewestFirst:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_newestFirst = a3;
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
  objc_storeStrong((id *)&self->_syncContinuationToken, 0);
  objc_storeStrong((id *)&self->_requestedFields, 0);
  objc_storeStrong((id *)&self->_assetsToDownload, 0);
}

+ (id)options
{
  if (qword_1ED700AB0 != -1)
    dispatch_once(&qword_1ED700AB0, &unk_1E7837D50);
  return (id)qword_1ED700AA8;
}

- (BOOL)hasSyncContinuationToken
{
  return self->_syncContinuationToken != 0;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (BOOL)hasRequestedFields
{
  return self->_requestedFields != 0;
}

- (void)setMaxChanges:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maxChanges = a3;
}

- (void)setHasMaxChanges:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxChanges
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)requestedChangeTypes
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_requestedChangeTypes;
  else
    return 3;
}

- (void)setHasRequestedChangeTypes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestedChangeTypes
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)requestedChangeTypesAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E7837D70[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestedChangeTypes:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("records")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("shares")) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("recordsAndShares")))
  {
    v6 = 3;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasAssetsToDownload
{
  return self->_assetsToDownload != 0;
}

- (void)setHasNewestFirst:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNewestFirst
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIgnoreCallingDeviceChanges:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_ignoreCallingDeviceChanges = a3;
}

- (void)setHasIgnoreCallingDeviceChanges:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIgnoreCallingDeviceChanges
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIncludeMergeableDeltas:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_includeMergeableDeltas = a3;
}

- (void)setHasIncludeMergeableDeltas:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIncludeMergeableDeltas
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v11.super_class = (Class)CKDPRecordRetrieveChangesRequest;
  -[CKDPRecordRetrieveChangesRequest description](&v11, sel_description);
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
  NSData *syncContinuationToken;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  void *v9;
  const char *v10;
  CKDPRequestedFields *requestedFields;
  void *v12;
  const char *v13;
  char has;
  void *v15;
  const char *v16;
  unsigned int v17;
  __CFString *v18;
  CKDPAssetsToDownload *assetsToDownload;
  void *v20;
  const char *v21;
  char v22;
  void *v23;
  const char *v24;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  syncContinuationToken = self->_syncContinuationToken;
  if (syncContinuationToken)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)syncContinuationToken, CFSTR("syncContinuationToken"));
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(zoneIdentifier, v5, (uint64_t)syncContinuationToken);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, CFSTR("zoneIdentifier"));

  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    objc_msgSend_dictionaryRepresentation(requestedFields, v5, (uint64_t)syncContinuationToken);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, CFSTR("requestedFields"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v5, self->_maxChanges);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, CFSTR("maxChanges"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v17 = self->_requestedChangeTypes - 1;
    if (v17 >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_requestedChangeTypes);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E7837D70[v17];
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v18, CFSTR("requestedChangeTypes"));

  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    objc_msgSend_dictionaryRepresentation(assetsToDownload, v5, (uint64_t)syncContinuationToken);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, CFSTR("assetsToDownload"));

  }
  v22 = (char)self->_has;
  if ((v22 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_18;
LABEL_22:
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_ignoreCallingDeviceChanges);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)v28, CFSTR("ignoreCallingDeviceChanges"));

    if ((*(_BYTE *)&self->_has & 8) == 0)
      return v6;
    goto LABEL_19;
  }
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_newestFirst);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v26, CFSTR("newestFirst"));

  v22 = (char)self->_has;
  if ((v22 & 4) != 0)
    goto LABEL_22;
LABEL_18:
  if ((v22 & 8) != 0)
  {
LABEL_19:
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_includeMergeableDeltas);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v24, (uint64_t)v23, CFSTR("includeMergeableDeltas"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC1C880((uint64_t)self, (uint64_t)a3);
}

- (unsigned)requestTypeCode
{
  return 7;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSData *syncContinuationToken;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  CKDPRequestedFields *requestedFields;
  char has;
  CKDPAssetsToDownload *assetsToDownload;
  char v11;
  id v12;

  v4 = a3;
  syncContinuationToken = self->_syncContinuationToken;
  v12 = v4;
  if (syncContinuationToken)
  {
    objc_msgSend_setSyncContinuationToken_(v4, v5, (uint64_t)syncContinuationToken);
    v4 = v12;
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v12, v5, (uint64_t)zoneIdentifier);
    v4 = v12;
  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    objc_msgSend_setRequestedFields_(v12, v5, (uint64_t)requestedFields);
    v4 = v12;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_maxChanges;
    *((_BYTE *)v4 + 52) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_requestedChangeTypes;
    *((_BYTE *)v4 + 52) |= 2u;
  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    objc_msgSend_setAssetsToDownload_(v12, v5, (uint64_t)assetsToDownload);
    v4 = v12;
  }
  v11 = (char)self->_has;
  if ((v11 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_15;
LABEL_19:
    *((_BYTE *)v4 + 48) = self->_ignoreCallingDeviceChanges;
    *((_BYTE *)v4 + 52) |= 4u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  *((_BYTE *)v4 + 50) = self->_newestFirst;
  *((_BYTE *)v4 + 52) |= 0x10u;
  v11 = (char)self->_has;
  if ((v11 & 4) != 0)
    goto LABEL_19;
LABEL_15:
  if ((v11 & 8) != 0)
  {
LABEL_16:
    *((_BYTE *)v4 + 49) = self->_includeMergeableDeltas;
    *((_BYTE *)v4 + 52) |= 8u;
  }
LABEL_17:

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
  char has;
  uint64_t v22;
  void *v23;
  char v24;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_syncContinuationToken, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v15;

  v18 = objc_msgSend_copyWithZone_(self->_requestedFields, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v18;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v10 + 16) = self->_maxChanges;
    *(_BYTE *)(v10 + 52) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 20) = self->_requestedChangeTypes;
    *(_BYTE *)(v10 + 52) |= 2u;
  }
  v22 = objc_msgSend_copyWithZone_(self->_assetsToDownload, v20, (uint64_t)a3);
  v23 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v22;

  v24 = (char)self->_has;
  if ((v24 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    *(_BYTE *)(v10 + 48) = self->_ignoreCallingDeviceChanges;
    *(_BYTE *)(v10 + 52) |= 4u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      return (id)v10;
    goto LABEL_8;
  }
  *(_BYTE *)(v10 + 50) = self->_newestFirst;
  *(_BYTE *)(v10 + 52) |= 0x10u;
  v24 = (char)self->_has;
  if ((v24 & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v24 & 8) != 0)
  {
LABEL_8:
    *(_BYTE *)(v10 + 49) = self->_includeMergeableDeltas;
    *(_BYTE *)(v10 + 52) |= 8u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSData *syncContinuationToken;
  uint64_t v9;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v11;
  CKDPRequestedFields *requestedFields;
  uint64_t v13;
  char has;
  char v15;
  CKDPAssetsToDownload *assetsToDownload;
  uint64_t v17;
  BOOL v18;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_39;
  syncContinuationToken = self->_syncContinuationToken;
  v9 = v4[4];
  if ((unint64_t)syncContinuationToken | v9)
  {
    if (!objc_msgSend_isEqual_(syncContinuationToken, v7, v9))
      goto LABEL_39;
  }
  zoneIdentifier = self->_zoneIdentifier;
  v11 = v4[5];
  if ((unint64_t)zoneIdentifier | v11)
  {
    if (!objc_msgSend_isEqual_(zoneIdentifier, v7, v11))
      goto LABEL_39;
  }
  requestedFields = self->_requestedFields;
  v13 = v4[3];
  if ((unint64_t)requestedFields | v13)
  {
    if (!objc_msgSend_isEqual_(requestedFields, v7, v13))
      goto LABEL_39;
  }
  has = (char)self->_has;
  v15 = *((_BYTE *)v4 + 52);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_maxChanges != *((_DWORD *)v4 + 4))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_requestedChangeTypes != *((_DWORD *)v4 + 5))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_39;
  }
  assetsToDownload = self->_assetsToDownload;
  v17 = v4[1];
  if ((unint64_t)assetsToDownload | v17)
  {
    if (!objc_msgSend_isEqual_(assetsToDownload, v7, v17))
      goto LABEL_39;
    has = (char)self->_has;
    v15 = *((_BYTE *)v4 + 52);
  }
  if ((has & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0)
      goto LABEL_39;
    if (self->_newestFirst)
    {
      if (!*((_BYTE *)v4 + 50))
        goto LABEL_39;
    }
    else if (*((_BYTE *)v4 + 50))
    {
      goto LABEL_39;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_39;
  }
  if ((has & 4) != 0)
  {
    if ((v15 & 4) == 0)
      goto LABEL_39;
    if (self->_ignoreCallingDeviceChanges)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_39;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_39;
    }
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_39;
  }
  v18 = (v15 & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((v15 & 8) != 0)
    {
      if (self->_includeMergeableDeltas)
      {
        if (!*((_BYTE *)v4 + 49))
          goto LABEL_39;
      }
      else if (*((_BYTE *)v4 + 49))
      {
        goto LABEL_39;
      }
      v18 = 1;
      goto LABEL_40;
    }
LABEL_39:
    v18 = 0;
  }
LABEL_40:

  return v18;
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
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = objc_msgSend_hash(self->_syncContinuationToken, a2, v2);
  v7 = objc_msgSend_hash(self->_zoneIdentifier, v5, v6);
  v12 = objc_msgSend_hash(self->_requestedFields, v8, v9);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v13 = 2654435761 * self->_maxChanges;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v13 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v14 = 2654435761 * self->_requestedChangeTypes;
      goto LABEL_6;
    }
  }
  v14 = 0;
LABEL_6:
  v15 = objc_msgSend_hash(self->_assetsToDownload, v10, v11);
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    v16 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
LABEL_11:
    v17 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_9;
LABEL_12:
    v18 = 0;
    return v7 ^ v4 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  }
  v16 = 2654435761 * self->_newestFirst;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_8:
  v17 = 2654435761 * self->_ignoreCallingDeviceChanges;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_9:
  v18 = 2654435761 * self->_includeMergeableDeltas;
  return v7 ^ v4 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v7;
  CKDPRequestedFields *requestedFields;
  uint64_t v9;
  char v10;
  CKDPAssetsToDownload *assetsToDownload;
  uint64_t v12;
  char v13;
  id v14;

  v4 = a3;
  v5 = *((_QWORD *)v4 + 4);
  v14 = v4;
  if (v5)
  {
    objc_msgSend_setSyncContinuationToken_(self, (const char *)v4, v5);
    v4 = v14;
  }
  zoneIdentifier = self->_zoneIdentifier;
  v7 = *((_QWORD *)v4 + 5);
  if (zoneIdentifier)
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v4, v7);
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend_setZoneIdentifier_(self, (const char *)v4, v7);
  }
  v4 = v14;
LABEL_9:
  requestedFields = self->_requestedFields;
  v9 = *((_QWORD *)v4 + 3);
  if (requestedFields)
  {
    if (!v9)
      goto LABEL_15;
    objc_msgSend_mergeFrom_(requestedFields, (const char *)v4, v9);
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    objc_msgSend_setRequestedFields_(self, (const char *)v4, v9);
  }
  v4 = v14;
LABEL_15:
  v10 = *((_BYTE *)v4 + 52);
  if ((v10 & 1) != 0)
  {
    self->_maxChanges = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v10 = *((_BYTE *)v4 + 52);
  }
  if ((v10 & 2) != 0)
  {
    self->_requestedChangeTypes = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }
  assetsToDownload = self->_assetsToDownload;
  v12 = *((_QWORD *)v4 + 1);
  if (assetsToDownload)
  {
    if (!v12)
      goto LABEL_25;
    objc_msgSend_mergeFrom_(assetsToDownload, (const char *)v4, v12);
  }
  else
  {
    if (!v12)
      goto LABEL_25;
    objc_msgSend_setAssetsToDownload_(self, (const char *)v4, v12);
  }
  v4 = v14;
LABEL_25:
  v13 = *((_BYTE *)v4 + 52);
  if ((v13 & 0x10) == 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0)
      goto LABEL_27;
LABEL_31:
    self->_ignoreCallingDeviceChanges = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 52) & 8) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
  self->_newestFirst = *((_BYTE *)v4 + 50);
  *(_BYTE *)&self->_has |= 0x10u;
  v13 = *((_BYTE *)v4 + 52);
  if ((v13 & 4) != 0)
    goto LABEL_31;
LABEL_27:
  if ((v13 & 8) != 0)
  {
LABEL_28:
    self->_includeMergeableDeltas = *((_BYTE *)v4 + 49);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_29:

}

- (NSData)syncContinuationToken
{
  return self->_syncContinuationToken;
}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (CKDPRequestedFields)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(id)a3
{
  objc_storeStrong((id *)&self->_requestedFields, a3);
}

- (unsigned)maxChanges
{
  return self->_maxChanges;
}

- (BOOL)newestFirst
{
  return self->_newestFirst;
}

- (BOOL)ignoreCallingDeviceChanges
{
  return self->_ignoreCallingDeviceChanges;
}

- (BOOL)includeMergeableDeltas
{
  return self->_includeMergeableDeltas;
}

@end
