@implementation LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEvent

- (BOOL)hasTrialIdentifiers
{
  return self->_trialIdentifiers != 0;
}

- (BOOL)hasContextID
{
  return self->_contextID != 0;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)eventType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_eventType;
  else
    return 0;
}

- (void)setEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 < 4)
    return off_2510953F0[a3];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEventType:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("Unknown"), v5, v6) & 1) != 0)
  {
    v10 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("allocation"), v8, v9) & 1) != 0)
  {
    v10 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("activation"), v12, v13) & 1) != 0)
  {
    v10 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v14, (uint64_t)CFSTR("deactivation"), v15, v16))
  {
    v10 = 3;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setEventSucceeded:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_eventSucceeded = a3;
}

- (void)setHasEventSucceeded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEventSucceeded
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v15.receiver = self;
  v15.super_class = (Class)LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEvent;
  -[LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEvent description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("%@ %@"), v11, v12, v4, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *trialIdentifiers;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSString *contextID;
  char has;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t eventType;
  __CFString *v25;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  trialIdentifiers = self->_trialIdentifiers;
  if (trialIdentifiers)
  {
    objc_msgSend_dictionaryRepresentation(trialIdentifiers, v6, v7, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v10, v13, (uint64_t)v12, (uint64_t)CFSTR("trialIdentifiers"), v14);

  }
  contextID = self->_contextID;
  if (contextID)
    objc_msgSend_setObject_forKey_(v10, v6, (uint64_t)contextID, (uint64_t)CFSTR("contextID"), v9);
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    eventType = self->_eventType;
    if (eventType >= 4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v6, (uint64_t)CFSTR("(unknown: %i)"), v8, v9, self->_eventType);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_2510953F0[eventType];
    }
    objc_msgSend_setObject_forKey_(v10, v6, (uint64_t)v25, (uint64_t)CFSTR("eventType"), v9);

    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
    return v10;
  }
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v6, (uint64_t)contextID, v8, v9, self->_timestamp);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v22, (uint64_t)v21, (uint64_t)CFSTR("timestamp"), v23);

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v6, self->_eventSucceeded, v8, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v10, v18, (uint64_t)v17, (uint64_t)CFSTR("eventSucceeded"), v19);

  }
  return v10;
}

- (BOOL)readFrom:(id)a3
{
  return LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_trialIdentifiers)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_contextID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_9:

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *trialIdentifiers;
  NSString *contextID;
  char has;
  id v11;

  v4 = a3;
  trialIdentifiers = self->_trialIdentifiers;
  v11 = v4;
  if (trialIdentifiers)
  {
    objc_msgSend_setTrialIdentifiers_(v4, v5, (uint64_t)trialIdentifiers, v6, v7);
    v4 = v11;
  }
  contextID = self->_contextID;
  if (contextID)
  {
    objc_msgSend_setContextID_(v11, v5, (uint64_t)contextID, v6, v7);
    v4 = v11;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    *((_DWORD *)v4 + 6) = self->_eventType;
    *((_BYTE *)v4 + 44) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_timestamp;
  *((_BYTE *)v4 + 44) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    *((_BYTE *)v4 + 40) = self->_eventSucceeded;
    *((_BYTE *)v4 + 44) |= 4u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char has;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  v18 = objc_msgSend_copyWithZone_(self->_trialIdentifiers, v15, (uint64_t)a3, v16, v17);
  v19 = *(void **)(v14 + 32);
  *(_QWORD *)(v14 + 32) = v18;

  v23 = objc_msgSend_copyWithZone_(self->_contextID, v20, (uint64_t)a3, v21, v22);
  v24 = *(void **)(v14 + 16);
  *(_QWORD *)(v14 + 16) = v23;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v14 + 24) = self->_eventType;
    *(_BYTE *)(v14 + 44) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v14;
    goto LABEL_4;
  }
  *(double *)(v14 + 8) = self->_timestamp;
  *(_BYTE *)(v14 + 44) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_BYTE *)(v14 + 40) = self->_eventSucceeded;
    *(_BYTE *)(v14 + 44) |= 4u;
  }
  return (id)v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *trialIdentifiers;
  uint64_t v13;
  NSString *contextID;
  uint64_t v15;
  BOOL v16;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8))
    goto LABEL_18;
  trialIdentifiers = self->_trialIdentifiers;
  v13 = v4[4];
  if ((unint64_t)trialIdentifiers | v13)
  {
    if (!objc_msgSend_isEqual_(trialIdentifiers, v9, v13, v10, v11))
      goto LABEL_18;
  }
  contextID = self->_contextID;
  v15 = v4[2];
  if ((unint64_t)contextID | v15)
  {
    if (!objc_msgSend_isEqual_(contextID, v9, v15, v10, v11))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_timestamp != *((double *)v4 + 1))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 6))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_18;
  }
  v16 = (*((_BYTE *)v4 + 44) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0)
    {
LABEL_18:
      v16 = 0;
      goto LABEL_19;
    }
    if (self->_eventSucceeded)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_18;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_18;
    }
    v16 = 1;
  }
LABEL_19:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char has;
  unint64_t v13;
  double timestamp;
  double v15;
  long double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;

  v6 = objc_msgSend_hash(self->_trialIdentifiers, a2, v2, v3, v4);
  v11 = objc_msgSend_hash(self->_contextID, v7, v8, v9, v10);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    timestamp = self->_timestamp;
    v15 = -timestamp;
    if (timestamp >= 0.0)
      v15 = self->_timestamp;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  if ((has & 2) != 0)
  {
    v18 = 2654435761 * self->_eventType;
    if ((has & 4) != 0)
      goto LABEL_11;
LABEL_13:
    v19 = 0;
    return v11 ^ v6 ^ v13 ^ v18 ^ v19;
  }
  v18 = 0;
  if ((has & 4) == 0)
    goto LABEL_13;
LABEL_11:
  v19 = 2654435761 * self->_eventSucceeded;
  return v11 ^ v6 ^ v13 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *trialIdentifiers;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;

  v4 = a3;
  trialIdentifiers = self->_trialIdentifiers;
  v8 = *((_QWORD *)v4 + 4);
  v11 = v4;
  if (trialIdentifiers)
  {
    if (!v8)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(trialIdentifiers, (const char *)v4, v8, v5, v6);
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    objc_msgSend_setTrialIdentifiers_(self, (const char *)v4, v8, v5, v6);
  }
  v4 = v11;
LABEL_7:
  v9 = *((_QWORD *)v4 + 2);
  if (v9)
  {
    objc_msgSend_setContextID_(self, (const char *)v4, v9, v5, v6);
    v4 = v11;
  }
  v10 = *((_BYTE *)v4 + 44);
  if ((v10 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0)
      goto LABEL_11;
LABEL_15:
    self->_eventType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 44) & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  self->_timestamp = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v10 = *((_BYTE *)v4 + 44);
  if ((v10 & 2) != 0)
    goto LABEL_15;
LABEL_11:
  if ((v10 & 4) != 0)
  {
LABEL_12:
    self->_eventSucceeded = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_13:

}

- (LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers)trialIdentifiers
{
  return self->_trialIdentifiers;
}

- (void)setTrialIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_trialIdentifiers, a3);
}

- (NSString)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
  objc_storeStrong((id *)&self->_contextID, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)eventSucceeded
{
  return self->_eventSucceeded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialIdentifiers, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
}

@end
