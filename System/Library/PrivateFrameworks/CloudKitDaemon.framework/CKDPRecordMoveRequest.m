@implementation CKDPRecordMoveRequest

+ (id)options
{
  if (qword_1ED700930 != -1)
    dispatch_once(&qword_1ED700930, &unk_1E7832A78);
  return (id)qword_1ED700928;
}

- (int)semantics
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_semantics;
  else
    return 1;
}

- (void)setSemantics:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_semantics = a3;
}

- (void)setHasSemantics:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSemantics
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)semanticsAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("failIfExists");
  if (a3 == 2)
  {
    v3 = CFSTR("failIfEtagMismatch");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSemantics:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;

  v3 = a3;
  v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("failIfExists")) & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("failIfEtagMismatch")))
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

- (BOOL)hasOriginId
{
  return self->_originId != 0;
}

- (BOOL)hasOriginEtag
{
  return self->_originEtag != 0;
}

- (BOOL)hasDestinationEtag
{
  return self->_destinationEtag != 0;
}

- (BOOL)hasDestinationZoneProtectionInfoTag
{
  return self->_destinationZoneProtectionInfoTag != 0;
}

- (BOOL)hasDestinationRecordProtectionInfoTag
{
  return self->_destinationRecordProtectionInfoTag != 0;
}

- (BOOL)hasDestinationRecord
{
  return self->_destinationRecord != 0;
}

- (void)setMerge:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_merge = a3;
}

- (void)setHasMerge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMerge
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v11.super_class = (Class)CKDPRecordMoveRequest;
  -[CKDPRecordMoveRequest description](&v11, sel_description);
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
  int semantics;
  __CFString *v8;
  const char *v9;
  CKDPRecordIdentifier *originId;
  void *v11;
  const char *v12;
  NSString *originEtag;
  NSString *destinationEtag;
  NSString *destinationZoneProtectionInfoTag;
  NSString *destinationRecordProtectionInfoTag;
  CKDPRecord *destinationRecord;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    semantics = self->_semantics;
    if (semantics == 1)
    {
      v8 = CFSTR("failIfExists");
      objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("failIfExists"), CFSTR("semantics"));
    }
    else if (semantics == 2)
    {
      v8 = CFSTR("failIfEtagMismatch");
      objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("failIfEtagMismatch"), CFSTR("semantics"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_semantics);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("semantics"));
    }

  }
  originId = self->_originId;
  if (originId)
  {
    objc_msgSend_dictionaryRepresentation(originId, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("originId"));

  }
  originEtag = self->_originEtag;
  if (originEtag)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)originEtag, CFSTR("originEtag"));
  destinationEtag = self->_destinationEtag;
  if (destinationEtag)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)destinationEtag, CFSTR("destinationEtag"));
  destinationZoneProtectionInfoTag = self->_destinationZoneProtectionInfoTag;
  if (destinationZoneProtectionInfoTag)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)destinationZoneProtectionInfoTag, CFSTR("destinationZoneProtectionInfoTag"));
  destinationRecordProtectionInfoTag = self->_destinationRecordProtectionInfoTag;
  if (destinationRecordProtectionInfoTag)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)destinationRecordProtectionInfoTag, CFSTR("destinationRecordProtectionInfoTag"));
  destinationRecord = self->_destinationRecord;
  if (destinationRecord)
  {
    objc_msgSend_dictionaryRepresentation(destinationRecord, v4, (uint64_t)destinationRecordProtectionInfoTag);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)v18, CFSTR("destinationRecord"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_merge);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, CFSTR("merge"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAB09B4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_originId)
    PBDataWriterWriteSubmessage();
  if (self->_originEtag)
    PBDataWriterWriteStringField();
  if (self->_destinationEtag)
    PBDataWriterWriteStringField();
  if (self->_destinationZoneProtectionInfoTag)
    PBDataWriterWriteStringField();
  if (self->_destinationRecordProtectionInfoTag)
    PBDataWriterWriteStringField();
  if (self->_destinationRecord)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();

}

- (unsigned)requestTypeCode
{
  return 78;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  const char *v4;
  CKDPRecordIdentifier *originId;
  NSString *originEtag;
  NSString *destinationEtag;
  NSString *destinationZoneProtectionInfoTag;
  NSString *destinationRecordProtectionInfoTag;
  CKDPRecord *destinationRecord;
  _DWORD *v11;

  v11 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v11[14] = self->_semantics;
    *((_BYTE *)v11 + 64) |= 1u;
  }
  originId = self->_originId;
  if (originId)
    objc_msgSend_setOriginId_(v11, v4, (uint64_t)originId);
  originEtag = self->_originEtag;
  if (originEtag)
    objc_msgSend_setOriginEtag_(v11, v4, (uint64_t)originEtag);
  destinationEtag = self->_destinationEtag;
  if (destinationEtag)
    objc_msgSend_setDestinationEtag_(v11, v4, (uint64_t)destinationEtag);
  destinationZoneProtectionInfoTag = self->_destinationZoneProtectionInfoTag;
  if (destinationZoneProtectionInfoTag)
    objc_msgSend_setDestinationZoneProtectionInfoTag_(v11, v4, (uint64_t)destinationZoneProtectionInfoTag);
  destinationRecordProtectionInfoTag = self->_destinationRecordProtectionInfoTag;
  if (destinationRecordProtectionInfoTag)
    objc_msgSend_setDestinationRecordProtectionInfoTag_(v11, v4, (uint64_t)destinationRecordProtectionInfoTag);
  destinationRecord = self->_destinationRecord;
  if (destinationRecord)
    objc_msgSend_setDestinationRecord_(v11, v4, (uint64_t)destinationRecord);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v11 + 60) = self->_merge;
    *((_BYTE *)v11 + 64) |= 2u;
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
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 56) = self->_semantics;
    *(_BYTE *)(v10 + 64) |= 1u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_originId, v11, (uint64_t)a3);
  v14 = *(void **)(v12 + 48);
  *(_QWORD *)(v12 + 48) = v13;

  v16 = objc_msgSend_copyWithZone_(self->_originEtag, v15, (uint64_t)a3);
  v17 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v16;

  v19 = objc_msgSend_copyWithZone_(self->_destinationEtag, v18, (uint64_t)a3);
  v20 = *(void **)(v12 + 8);
  *(_QWORD *)(v12 + 8) = v19;

  v22 = objc_msgSend_copyWithZone_(self->_destinationZoneProtectionInfoTag, v21, (uint64_t)a3);
  v23 = *(void **)(v12 + 32);
  *(_QWORD *)(v12 + 32) = v22;

  v25 = objc_msgSend_copyWithZone_(self->_destinationRecordProtectionInfoTag, v24, (uint64_t)a3);
  v26 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = v25;

  v28 = objc_msgSend_copyWithZone_(self->_destinationRecord, v27, (uint64_t)a3);
  v29 = *(void **)(v12 + 16);
  *(_QWORD *)(v12 + 16) = v28;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v12 + 60) = self->_merge;
    *(_BYTE *)(v12 + 64) |= 2u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecordIdentifier *originId;
  uint64_t v9;
  NSString *originEtag;
  uint64_t v11;
  NSString *destinationEtag;
  uint64_t v13;
  NSString *destinationZoneProtectionInfoTag;
  uint64_t v15;
  NSString *destinationRecordProtectionInfoTag;
  uint64_t v17;
  CKDPRecord *destinationRecord;
  uint64_t v19;
  BOOL v20;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[8] & 1) == 0 || self->_semantics != *((_DWORD *)v4 + 14))
      goto LABEL_21;
  }
  else if ((v4[8] & 1) != 0)
  {
    goto LABEL_21;
  }
  originId = self->_originId;
  v9 = v4[6];
  if ((unint64_t)originId | v9 && !objc_msgSend_isEqual_(originId, v7, v9))
    goto LABEL_21;
  originEtag = self->_originEtag;
  v11 = v4[5];
  if ((unint64_t)originEtag | v11)
  {
    if (!objc_msgSend_isEqual_(originEtag, v7, v11))
      goto LABEL_21;
  }
  destinationEtag = self->_destinationEtag;
  v13 = v4[1];
  if ((unint64_t)destinationEtag | v13)
  {
    if (!objc_msgSend_isEqual_(destinationEtag, v7, v13))
      goto LABEL_21;
  }
  destinationZoneProtectionInfoTag = self->_destinationZoneProtectionInfoTag;
  v15 = v4[4];
  if ((unint64_t)destinationZoneProtectionInfoTag | v15)
  {
    if (!objc_msgSend_isEqual_(destinationZoneProtectionInfoTag, v7, v15))
      goto LABEL_21;
  }
  destinationRecordProtectionInfoTag = self->_destinationRecordProtectionInfoTag;
  v17 = v4[3];
  if ((unint64_t)destinationRecordProtectionInfoTag | v17)
  {
    if (!objc_msgSend_isEqual_(destinationRecordProtectionInfoTag, v7, v17))
      goto LABEL_21;
  }
  destinationRecord = self->_destinationRecord;
  v19 = v4[2];
  if ((unint64_t)destinationRecord | v19)
  {
    if (!objc_msgSend_isEqual_(destinationRecord, v7, v19))
      goto LABEL_21;
  }
  v20 = (v4[8] & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[8] & 2) == 0)
    {
LABEL_21:
      v20 = 0;
      goto LABEL_22;
    }
    if (self->_merge)
    {
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_21;
    }
    else if (*((_BYTE *)v4 + 60))
    {
      goto LABEL_21;
    }
    v20 = 1;
  }
LABEL_22:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_semantics;
  else
    v4 = 0;
  v5 = objc_msgSend_hash(self->_originId, a2, v2);
  v8 = objc_msgSend_hash(self->_originEtag, v6, v7);
  v11 = objc_msgSend_hash(self->_destinationEtag, v9, v10);
  v14 = objc_msgSend_hash(self->_destinationZoneProtectionInfoTag, v12, v13);
  v17 = objc_msgSend_hash(self->_destinationRecordProtectionInfoTag, v15, v16);
  v20 = objc_msgSend_hash(self->_destinationRecord, v18, v19);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v21 = 2654435761 * self->_merge;
  else
    v21 = 0;
  return v5 ^ v4 ^ v8 ^ v11 ^ v14 ^ v17 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  CKDPRecordIdentifier *originId;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CKDPRecord *destinationRecord;
  uint64_t v13;
  id v14;

  v4 = a3;
  v5 = v4;
  if ((v4[16] & 1) != 0)
  {
    self->_semantics = v4[14];
    *(_BYTE *)&self->_has |= 1u;
  }
  originId = self->_originId;
  v7 = *((_QWORD *)v5 + 6);
  v14 = v5;
  if (originId)
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend_mergeFrom_(originId, (const char *)v5, v7);
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend_setOriginId_(self, (const char *)v5, v7);
  }
  v5 = v14;
LABEL_9:
  v8 = *((_QWORD *)v5 + 5);
  if (v8)
  {
    objc_msgSend_setOriginEtag_(self, (const char *)v5, v8);
    v5 = v14;
  }
  v9 = *((_QWORD *)v5 + 1);
  if (v9)
  {
    objc_msgSend_setDestinationEtag_(self, (const char *)v5, v9);
    v5 = v14;
  }
  v10 = *((_QWORD *)v5 + 4);
  if (v10)
  {
    objc_msgSend_setDestinationZoneProtectionInfoTag_(self, (const char *)v5, v10);
    v5 = v14;
  }
  v11 = *((_QWORD *)v5 + 3);
  if (v11)
  {
    objc_msgSend_setDestinationRecordProtectionInfoTag_(self, (const char *)v5, v11);
    v5 = v14;
  }
  destinationRecord = self->_destinationRecord;
  v13 = *((_QWORD *)v5 + 2);
  if (destinationRecord)
  {
    if (!v13)
      goto LABEL_23;
    objc_msgSend_mergeFrom_(destinationRecord, (const char *)v5, v13);
  }
  else
  {
    if (!v13)
      goto LABEL_23;
    objc_msgSend_setDestinationRecord_(self, (const char *)v5, v13);
  }
  v5 = v14;
LABEL_23:
  if ((*((_BYTE *)v5 + 64) & 2) != 0)
  {
    self->_merge = *((_BYTE *)v5 + 60);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (CKDPRecordIdentifier)originId
{
  return self->_originId;
}

- (void)setOriginId:(id)a3
{
  objc_storeStrong((id *)&self->_originId, a3);
}

- (NSString)originEtag
{
  return self->_originEtag;
}

- (void)setOriginEtag:(id)a3
{
  objc_storeStrong((id *)&self->_originEtag, a3);
}

- (NSString)destinationEtag
{
  return self->_destinationEtag;
}

- (void)setDestinationEtag:(id)a3
{
  objc_storeStrong((id *)&self->_destinationEtag, a3);
}

- (NSString)destinationZoneProtectionInfoTag
{
  return self->_destinationZoneProtectionInfoTag;
}

- (void)setDestinationZoneProtectionInfoTag:(id)a3
{
  objc_storeStrong((id *)&self->_destinationZoneProtectionInfoTag, a3);
}

- (NSString)destinationRecordProtectionInfoTag
{
  return self->_destinationRecordProtectionInfoTag;
}

- (void)setDestinationRecordProtectionInfoTag:(id)a3
{
  objc_storeStrong((id *)&self->_destinationRecordProtectionInfoTag, a3);
}

- (CKDPRecord)destinationRecord
{
  return self->_destinationRecord;
}

- (void)setDestinationRecord:(id)a3
{
  objc_storeStrong((id *)&self->_destinationRecord, a3);
}

- (BOOL)merge
{
  return self->_merge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originId, 0);
  objc_storeStrong((id *)&self->_originEtag, 0);
  objc_storeStrong((id *)&self->_destinationZoneProtectionInfoTag, 0);
  objc_storeStrong((id *)&self->_destinationRecordProtectionInfoTag, 0);
  objc_storeStrong((id *)&self->_destinationRecord, 0);
  objc_storeStrong((id *)&self->_destinationEtag, 0);
}

@end
