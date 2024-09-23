@implementation CKDPShareMetadata

- (id)_participantPermissionCKLogValue
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;

  v3 = objc_msgSend_participantPermission(self, a2, v2);
  if ((v3 - 1) < 4)
    return off_1E7834420[(int)v3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_participantStateCKLogValue
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;

  v3 = objc_msgSend_participantState(self, a2, v2);
  if ((v3 - 1) < 4)
    return off_1E78343E0[(int)v3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_participantTypeCKLogValue
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;

  v3 = objc_msgSend_participantType(self, a2, v2);
  if ((v3 - 1) < 4)
    return off_1E7834400[(int)v3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasRoutingKey
{
  return self->_routingKey != 0;
}

- (BOOL)hasProtectedFullToken
{
  return self->_protectedFullToken != 0;
}

- (BOOL)hasOwnerParticipant
{
  return self->_ownerParticipant != 0;
}

- (BOOL)hasCallerParticipant
{
  return self->_callerParticipant != 0;
}

- (int)participantPermission
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_participantPermission;
  else
    return 1;
}

- (void)setParticipantPermission:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_participantPermission = a3;
}

- (void)setHasParticipantPermission:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasParticipantPermission
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)participantPermissionAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E7834DF8[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsParticipantPermission:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("none")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("readOnly")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("readWrite")) & 1) != 0)
  {
    v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("derived")))
  {
    v6 = 4;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (int)participantState
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_participantState;
  else
    return 1;
}

- (void)setParticipantState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_participantState = a3;
}

- (void)setHasParticipantState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasParticipantState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)participantStateAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E7834E18[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsParticipantState:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("invited")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("accepted")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("removed")) & 1) != 0)
  {
    v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("unsubscribed")))
  {
    v6 = 4;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (int)participantType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_participantType;
  else
    return 1;
}

- (void)setParticipantType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_participantType = a3;
}

- (void)setHasParticipantType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasParticipantType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)participantTypeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E7834E38[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsParticipantType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("owner")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("administrator")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("user")) & 1) != 0)
  {
    v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("publicUser")))
  {
    v6 = 4;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasRootRecordType
{
  return self->_rootRecordType != 0;
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
  v11.super_class = (Class)CKDPShareMetadata;
  -[CKDPShareMetadata description](&v11, sel_description);
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
  NSString *routingKey;
  NSData *protectedFullToken;
  CKDPParticipant *ownerParticipant;
  void *v10;
  const char *v11;
  CKDPParticipant *callerParticipant;
  void *v13;
  const char *v14;
  char has;
  unsigned int v16;
  __CFString *v17;
  unsigned int v18;
  __CFString *v19;
  unsigned int v20;
  __CFString *v21;
  CKDPRecordType *rootRecordType;
  void *v23;
  const char *v24;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  routingKey = self->_routingKey;
  if (routingKey)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)routingKey, CFSTR("routingKey"));
  protectedFullToken = self->_protectedFullToken;
  if (protectedFullToken)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)protectedFullToken, CFSTR("protectedFullToken"));
  ownerParticipant = self->_ownerParticipant;
  if (ownerParticipant)
  {
    objc_msgSend_dictionaryRepresentation(ownerParticipant, v5, (uint64_t)protectedFullToken);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("ownerParticipant"));

  }
  callerParticipant = self->_callerParticipant;
  if (callerParticipant)
  {
    objc_msgSend_dictionaryRepresentation(callerParticipant, v5, (uint64_t)protectedFullToken);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("callerParticipant"));

  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_11;
LABEL_17:
    v18 = self->_participantState - 1;
    if (v18 >= 4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_participantState);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E7834E18[v18];
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v19, CFSTR("participantState"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_25;
    goto LABEL_21;
  }
  v16 = self->_participantPermission - 1;
  if (v16 >= 4)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_participantPermission);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_1E7834DF8[v16];
  }
  objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v17, CFSTR("participantPermission"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_17;
LABEL_11:
  if ((has & 4) != 0)
  {
LABEL_21:
    v20 = self->_participantType - 1;
    if (v20 >= 4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_participantType);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E7834E38[v20];
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v21, CFSTR("participantType"));

  }
LABEL_25:
  rootRecordType = self->_rootRecordType;
  if (rootRecordType)
  {
    objc_msgSend_dictionaryRepresentation(rootRecordType, v5, (uint64_t)protectedFullToken);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v24, (uint64_t)v23, CFSTR("rootRecordType"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPShareMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_routingKey)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_protectedFullToken)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_ownerParticipant)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_callerParticipant)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_12:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_13:
  if (self->_rootRecordType)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *routingKey;
  NSData *protectedFullToken;
  CKDPParticipant *ownerParticipant;
  CKDPParticipant *callerParticipant;
  char has;
  CKDPRecordType *rootRecordType;
  id v12;

  v4 = a3;
  routingKey = self->_routingKey;
  v12 = v4;
  if (routingKey)
  {
    objc_msgSend_setRoutingKey_(v4, v5, (uint64_t)routingKey);
    v4 = v12;
  }
  protectedFullToken = self->_protectedFullToken;
  if (protectedFullToken)
  {
    objc_msgSend_setProtectedFullToken_(v12, v5, (uint64_t)protectedFullToken);
    v4 = v12;
  }
  ownerParticipant = self->_ownerParticipant;
  if (ownerParticipant)
  {
    objc_msgSend_setOwnerParticipant_(v12, v5, (uint64_t)ownerParticipant);
    v4 = v12;
  }
  callerParticipant = self->_callerParticipant;
  if (callerParticipant)
  {
    objc_msgSend_setCallerParticipant_(v12, v5, (uint64_t)callerParticipant);
    v4 = v12;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_participantPermission;
    *((_BYTE *)v4 + 64) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v4 + 7) = self->_participantState;
  *((_BYTE *)v4 + 64) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 8) = self->_participantType;
    *((_BYTE *)v4 + 64) |= 4u;
  }
LABEL_13:
  rootRecordType = self->_rootRecordType;
  if (rootRecordType)
  {
    objc_msgSend_setRootRecordType_(v12, v5, (uint64_t)rootRecordType);
    v4 = v12;
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
  char has;
  uint64_t v25;
  void *v26;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_routingKey, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 56) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_protectedFullToken, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v15;

  v18 = objc_msgSend_copyWithZone_(self->_ownerParticipant, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v18;

  v21 = objc_msgSend_copyWithZone_(self->_callerParticipant, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v21;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v10 + 28) = self->_participantState;
    *(_BYTE *)(v10 + 64) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v10 + 24) = self->_participantPermission;
  *(_BYTE *)(v10 + 64) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v10 + 32) = self->_participantType;
    *(_BYTE *)(v10 + 64) |= 4u;
  }
LABEL_5:
  v25 = objc_msgSend_copyWithZone_(self->_rootRecordType, v23, (uint64_t)a3);
  v26 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v25;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *routingKey;
  uint64_t v9;
  NSData *protectedFullToken;
  uint64_t v11;
  CKDPParticipant *ownerParticipant;
  uint64_t v13;
  CKDPParticipant *callerParticipant;
  uint64_t v15;
  CKDPRecordType *rootRecordType;
  uint64_t v17;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_27;
  routingKey = self->_routingKey;
  v9 = v4[7];
  if ((unint64_t)routingKey | v9)
  {
    if (!objc_msgSend_isEqual_(routingKey, v7, v9))
      goto LABEL_27;
  }
  protectedFullToken = self->_protectedFullToken;
  v11 = v4[5];
  if ((unint64_t)protectedFullToken | v11)
  {
    if (!objc_msgSend_isEqual_(protectedFullToken, v7, v11))
      goto LABEL_27;
  }
  ownerParticipant = self->_ownerParticipant;
  v13 = v4[2];
  if ((unint64_t)ownerParticipant | v13)
  {
    if (!objc_msgSend_isEqual_(ownerParticipant, v7, v13))
      goto LABEL_27;
  }
  callerParticipant = self->_callerParticipant;
  v15 = v4[1];
  if ((unint64_t)callerParticipant | v15)
  {
    if (!objc_msgSend_isEqual_(callerParticipant, v7, v15))
      goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[8] & 1) == 0 || self->_participantPermission != *((_DWORD *)v4 + 6))
      goto LABEL_27;
  }
  else if ((v4[8] & 1) != 0)
  {
LABEL_27:
    isEqual = 0;
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[8] & 2) == 0 || self->_participantState != *((_DWORD *)v4 + 7))
      goto LABEL_27;
  }
  else if ((v4[8] & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[8] & 4) == 0 || self->_participantType != *((_DWORD *)v4 + 8))
      goto LABEL_27;
  }
  else if ((v4[8] & 4) != 0)
  {
    goto LABEL_27;
  }
  rootRecordType = self->_rootRecordType;
  v17 = v4[6];
  if ((unint64_t)rootRecordType | v17)
    isEqual = objc_msgSend_isEqual_(rootRecordType, v7, v17);
  else
    isEqual = 1;
LABEL_28:

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
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = objc_msgSend_hash(self->_routingKey, a2, v2);
  v7 = objc_msgSend_hash(self->_protectedFullToken, v5, v6);
  v10 = objc_msgSend_hash(self->_ownerParticipant, v8, v9);
  v13 = objc_msgSend_hash(self->_callerParticipant, v11, v12);
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v16 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v17 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v18 = 0;
    return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v17 ^ v18 ^ objc_msgSend_hash(self->_rootRecordType, v14, v15);
  }
  v16 = 2654435761 * self->_participantPermission;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v17 = 2654435761 * self->_participantState;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v18 = 2654435761 * self->_participantType;
  return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v17 ^ v18 ^ objc_msgSend_hash(self->_rootRecordType, v14, v15);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  CKDPParticipant *ownerParticipant;
  uint64_t v8;
  CKDPParticipant *callerParticipant;
  uint64_t v10;
  char v11;
  CKDPRecordType *rootRecordType;
  uint64_t v13;
  id v14;

  v4 = a3;
  v5 = *((_QWORD *)v4 + 7);
  v14 = v4;
  if (v5)
  {
    objc_msgSend_setRoutingKey_(self, (const char *)v4, v5);
    v4 = v14;
  }
  v6 = *((_QWORD *)v4 + 5);
  if (v6)
  {
    objc_msgSend_setProtectedFullToken_(self, (const char *)v4, v6);
    v4 = v14;
  }
  ownerParticipant = self->_ownerParticipant;
  v8 = *((_QWORD *)v4 + 2);
  if (ownerParticipant)
  {
    if (!v8)
      goto LABEL_11;
    objc_msgSend_mergeFrom_(ownerParticipant, (const char *)v4, v8);
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    objc_msgSend_setOwnerParticipant_(self, (const char *)v4, v8);
  }
  v4 = v14;
LABEL_11:
  callerParticipant = self->_callerParticipant;
  v10 = *((_QWORD *)v4 + 1);
  if (callerParticipant)
  {
    if (!v10)
      goto LABEL_17;
    objc_msgSend_mergeFrom_(callerParticipant, (const char *)v4, v10);
  }
  else
  {
    if (!v10)
      goto LABEL_17;
    objc_msgSend_setCallerParticipant_(self, (const char *)v4, v10);
  }
  v4 = v14;
LABEL_17:
  v11 = *((_BYTE *)v4 + 64);
  if ((v11 & 1) != 0)
  {
    self->_participantPermission = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
    v11 = *((_BYTE *)v4 + 64);
    if ((v11 & 2) == 0)
    {
LABEL_19:
      if ((v11 & 4) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 2) == 0)
  {
    goto LABEL_19;
  }
  self->_participantState = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
LABEL_20:
    self->_participantType = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_21:
  rootRecordType = self->_rootRecordType;
  v13 = *((_QWORD *)v4 + 6);
  if (rootRecordType)
  {
    if (v13)
    {
      objc_msgSend_mergeFrom_(rootRecordType, (const char *)v4, v13);
LABEL_29:
      v4 = v14;
    }
  }
  else if (v13)
  {
    objc_msgSend_setRootRecordType_(self, (const char *)v4, v13);
    goto LABEL_29;
  }

}

- (NSString)routingKey
{
  return self->_routingKey;
}

- (void)setRoutingKey:(id)a3
{
  objc_storeStrong((id *)&self->_routingKey, a3);
}

- (NSData)protectedFullToken
{
  return self->_protectedFullToken;
}

- (void)setProtectedFullToken:(id)a3
{
  objc_storeStrong((id *)&self->_protectedFullToken, a3);
}

- (CKDPParticipant)ownerParticipant
{
  return self->_ownerParticipant;
}

- (void)setOwnerParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_ownerParticipant, a3);
}

- (CKDPParticipant)callerParticipant
{
  return self->_callerParticipant;
}

- (void)setCallerParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_callerParticipant, a3);
}

- (CKDPRecordType)rootRecordType
{
  return self->_rootRecordType;
}

- (void)setRootRecordType:(id)a3
{
  objc_storeStrong((id *)&self->_rootRecordType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingKey, 0);
  objc_storeStrong((id *)&self->_rootRecordType, 0);
  objc_storeStrong((id *)&self->_protectedFullToken, 0);
  objc_storeStrong((id *)&self->_ownerParticipant, 0);
  objc_storeStrong((id *)&self->_callerParticipant, 0);
}

@end
