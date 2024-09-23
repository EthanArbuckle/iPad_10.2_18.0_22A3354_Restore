@implementation CKDPFetchArchivedRecordsRequest

+ (id)options
{
  if (qword_1ED7009E0 != -1)
    dispatch_once(&qword_1ED7009E0, &unk_1E7834458);
  return (id)qword_1ED7009D8;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (BOOL)hasArchiveContinuationToken
{
  return self->_archiveContinuationToken != 0;
}

- (void)setNewestFirst:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_newestFirst = a3;
}

- (void)setHasNewestFirst:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNewestFirst
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLimit:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_limit = a3;
}

- (void)setHasLimit:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLimit
{
  return *(_BYTE *)&self->_has & 1;
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
  v11.super_class = (Class)CKDPFetchArchivedRecordsRequest;
  -[CKDPFetchArchivedRecordsRequest description](&v11, sel_description);
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
  CKDPRecordZoneIdentifier *zoneIdentifier;
  void *v8;
  const char *v9;
  NSData *archiveContinuationToken;
  char has;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  CKDPAssetsToDownload *assetsToDownload;
  void *v17;
  const char *v18;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(zoneIdentifier, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("zoneIdentifier"));

  }
  archiveContinuationToken = self->_archiveContinuationToken;
  if (archiveContinuationToken)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)archiveContinuationToken, CFSTR("archiveContinuationToken"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_newestFirst);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, CFSTR("newestFirst"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v4, self->_limit);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("limit"));

  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    objc_msgSend_dictionaryRepresentation(assetsToDownload, v4, (uint64_t)archiveContinuationToken);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, CFSTR("assetsToDownload"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB35AB0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_archiveContinuationToken)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  if (self->_assetsToDownload)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (unsigned)requestTypeCode
{
  return 79;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  NSData *archiveContinuationToken;
  char has;
  CKDPAssetsToDownload *assetsToDownload;
  id v10;

  v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  v10 = v4;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v4, v5, (uint64_t)zoneIdentifier);
    v4 = v10;
  }
  archiveContinuationToken = self->_archiveContinuationToken;
  if (archiveContinuationToken)
  {
    objc_msgSend_setArchiveContinuationToken_(v10, v5, (uint64_t)archiveContinuationToken);
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 40) = self->_newestFirst;
    *((_BYTE *)v4 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_limit;
    *((_BYTE *)v4 + 44) |= 1u;
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
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  char has;
  uint64_t v19;
  void *v20;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_archiveContinuationToken, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v15;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v10 + 40) = self->_newestFirst;
    *(_BYTE *)(v10 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v10 + 24) = self->_limit;
    *(_BYTE *)(v10 + 44) |= 1u;
  }
  v19 = objc_msgSend_copyWithZone_(self->_assetsToDownload, v17, (uint64_t)a3);
  v20 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v19;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v9;
  NSData *archiveContinuationToken;
  uint64_t v11;
  CKDPAssetsToDownload *assetsToDownload;
  uint64_t v13;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_21;
  zoneIdentifier = self->_zoneIdentifier;
  v9 = v4[4];
  if ((unint64_t)zoneIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(zoneIdentifier, v7, v9))
      goto LABEL_21;
  }
  archiveContinuationToken = self->_archiveContinuationToken;
  v11 = v4[1];
  if ((unint64_t)archiveContinuationToken | v11)
  {
    if (!objc_msgSend_isEqual_(archiveContinuationToken, v7, v11))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) != 0)
    {
      if (self->_newestFirst)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_21;
        goto LABEL_14;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_14;
    }
LABEL_21:
    isEqual = 0;
    goto LABEL_22;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
    goto LABEL_21;
LABEL_14:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_limit != *((_DWORD *)v4 + 6))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_21;
  }
  assetsToDownload = self->_assetsToDownload;
  v13 = v4[2];
  if ((unint64_t)assetsToDownload | v13)
    isEqual = objc_msgSend_isEqual_(assetsToDownload, v7, v13);
  else
    isEqual = 1;
LABEL_22:

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

  v4 = objc_msgSend_hash(self->_zoneIdentifier, a2, v2);
  v7 = objc_msgSend_hash(self->_archiveContinuationToken, v5, v6);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10 = 2654435761 * self->_newestFirst;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    return v7 ^ v4 ^ v10 ^ v11 ^ objc_msgSend_hash(self->_assetsToDownload, v8, v9);
  }
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v11 = 2654435761 * self->_limit;
  return v7 ^ v4 ^ v10 ^ v11 ^ objc_msgSend_hash(self->_assetsToDownload, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v6;
  uint64_t v7;
  char v8;
  CKDPAssetsToDownload *assetsToDownload;
  uint64_t v10;
  id v11;

  v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  v6 = *((_QWORD *)v4 + 4);
  v11 = v4;
  if (zoneIdentifier)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setZoneIdentifier_(self, (const char *)v4, v6);
  }
  v4 = v11;
LABEL_7:
  v7 = *((_QWORD *)v4 + 1);
  if (v7)
  {
    objc_msgSend_setArchiveContinuationToken_(self, (const char *)v4, v7);
    v4 = v11;
  }
  v8 = *((_BYTE *)v4 + 44);
  if ((v8 & 2) != 0)
  {
    self->_newestFirst = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 2u;
    v8 = *((_BYTE *)v4 + 44);
  }
  if ((v8 & 1) != 0)
  {
    self->_limit = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  assetsToDownload = self->_assetsToDownload;
  v10 = *((_QWORD *)v4 + 2);
  if (assetsToDownload)
  {
    if (v10)
    {
      objc_msgSend_mergeFrom_(assetsToDownload, (const char *)v4, v10);
LABEL_18:
      v4 = v11;
    }
  }
  else if (v10)
  {
    objc_msgSend_setAssetsToDownload_(self, (const char *)v4, v10);
    goto LABEL_18;
  }

}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIdentifier, a3);
}

- (NSData)archiveContinuationToken
{
  return self->_archiveContinuationToken;
}

- (void)setArchiveContinuationToken:(id)a3
{
  objc_storeStrong((id *)&self->_archiveContinuationToken, a3);
}

- (BOOL)newestFirst
{
  return self->_newestFirst;
}

- (unsigned)limit
{
  return self->_limit;
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
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_assetsToDownload, 0);
  objc_storeStrong((id *)&self->_archiveContinuationToken, 0);
}

@end
