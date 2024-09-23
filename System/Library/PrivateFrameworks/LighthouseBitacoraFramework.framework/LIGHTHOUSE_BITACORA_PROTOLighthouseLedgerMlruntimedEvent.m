@implementation LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEvent

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

- (BOOL)hasActivityScheduleStatus
{
  return self->_activityScheduleStatus != 0;
}

- (BOOL)hasTaskFetched
{
  return self->_taskFetched != 0;
}

- (BOOL)hasTaskScheduled
{
  return self->_taskScheduled != 0;
}

- (BOOL)hasTaskCompleted
{
  return self->_taskCompleted != 0;
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
  v15.super_class = (Class)LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEvent;
  -[LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEvent description](&v15, sel_description);
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
  void *v16;
  const char *v17;
  uint64_t v18;
  LIGHTHOUSE_BITACORA_PROTOScheduleStatus *activityScheduleStatus;
  void *v20;
  const char *v21;
  uint64_t v22;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *taskFetched;
  void *v24;
  const char *v25;
  uint64_t v26;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *taskScheduled;
  void *v28;
  const char *v29;
  uint64_t v30;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *taskCompleted;
  void *v32;
  const char *v33;
  uint64_t v34;

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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v6, (uint64_t)contextID, v8, v9, self->_timestamp);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v10, v17, (uint64_t)v16, (uint64_t)CFSTR("timestamp"), v18);

  }
  activityScheduleStatus = self->_activityScheduleStatus;
  if (activityScheduleStatus)
  {
    objc_msgSend_dictionaryRepresentation(activityScheduleStatus, v6, (uint64_t)contextID, v8, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v10, v21, (uint64_t)v20, (uint64_t)CFSTR("activityScheduleStatus"), v22);

  }
  taskFetched = self->_taskFetched;
  if (taskFetched)
  {
    objc_msgSend_dictionaryRepresentation(taskFetched, v6, (uint64_t)contextID, v8, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v10, v25, (uint64_t)v24, (uint64_t)CFSTR("taskFetched"), v26);

  }
  taskScheduled = self->_taskScheduled;
  if (taskScheduled)
  {
    objc_msgSend_dictionaryRepresentation(taskScheduled, v6, (uint64_t)contextID, v8, v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v10, v29, (uint64_t)v28, (uint64_t)CFSTR("taskScheduled"), v30);

  }
  taskCompleted = self->_taskCompleted;
  if (taskCompleted)
  {
    objc_msgSend_dictionaryRepresentation(taskCompleted, v6, (uint64_t)contextID, v8, v9);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v10, v33, (uint64_t)v32, (uint64_t)CFSTR("taskCompleted"), v34);

  }
  return v10;
}

- (BOOL)readFrom:(id)a3
{
  return LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_trialIdentifiers)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_contextID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_activityScheduleStatus)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_taskFetched)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_taskScheduled)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_taskCompleted)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *trialIdentifiers;
  NSString *contextID;
  LIGHTHOUSE_BITACORA_PROTOScheduleStatus *activityScheduleStatus;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *taskFetched;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *taskScheduled;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *taskCompleted;
  id v14;

  v4 = a3;
  trialIdentifiers = self->_trialIdentifiers;
  v14 = v4;
  if (trialIdentifiers)
  {
    objc_msgSend_setTrialIdentifiers_(v4, v5, (uint64_t)trialIdentifiers, v6, v7);
    v4 = v14;
  }
  contextID = self->_contextID;
  if (contextID)
  {
    objc_msgSend_setContextID_(v14, v5, (uint64_t)contextID, v6, v7);
    v4 = v14;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  activityScheduleStatus = self->_activityScheduleStatus;
  if (activityScheduleStatus)
  {
    objc_msgSend_setActivityScheduleStatus_(v14, v5, (uint64_t)activityScheduleStatus, v6, v7);
    v4 = v14;
  }
  taskFetched = self->_taskFetched;
  if (taskFetched)
  {
    objc_msgSend_setTaskFetched_(v14, v5, (uint64_t)taskFetched, v6, v7);
    v4 = v14;
  }
  taskScheduled = self->_taskScheduled;
  if (taskScheduled)
  {
    objc_msgSend_setTaskScheduled_(v14, v5, (uint64_t)taskScheduled, v6, v7);
    v4 = v14;
  }
  taskCompleted = self->_taskCompleted;
  if (taskCompleted)
  {
    objc_msgSend_setTaskCompleted_(v14, v5, (uint64_t)taskCompleted, v6, v7);
    v4 = v14;
  }

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
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  v18 = objc_msgSend_copyWithZone_(self->_trialIdentifiers, v15, (uint64_t)a3, v16, v17);
  v19 = *(void **)(v14 + 56);
  *(_QWORD *)(v14 + 56) = v18;

  v23 = objc_msgSend_copyWithZone_(self->_contextID, v20, (uint64_t)a3, v21, v22);
  v24 = *(void **)(v14 + 24);
  *(_QWORD *)(v14 + 24) = v23;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v14 + 8) = self->_timestamp;
    *(_BYTE *)(v14 + 64) |= 1u;
  }
  v28 = objc_msgSend_copyWithZone_(self->_activityScheduleStatus, v25, (uint64_t)a3, v26, v27);
  v29 = *(void **)(v14 + 16);
  *(_QWORD *)(v14 + 16) = v28;

  v33 = objc_msgSend_copyWithZone_(self->_taskFetched, v30, (uint64_t)a3, v31, v32);
  v34 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v33;

  v38 = objc_msgSend_copyWithZone_(self->_taskScheduled, v35, (uint64_t)a3, v36, v37);
  v39 = *(void **)(v14 + 48);
  *(_QWORD *)(v14 + 48) = v38;

  v43 = objc_msgSend_copyWithZone_(self->_taskCompleted, v40, (uint64_t)a3, v41, v42);
  v44 = *(void **)(v14 + 32);
  *(_QWORD *)(v14 + 32) = v43;

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
  LIGHTHOUSE_BITACORA_PROTOScheduleStatus *activityScheduleStatus;
  uint64_t v17;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *taskFetched;
  uint64_t v19;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *taskScheduled;
  uint64_t v21;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *taskCompleted;
  uint64_t v23;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8))
    goto LABEL_19;
  trialIdentifiers = self->_trialIdentifiers;
  v13 = v4[7];
  if ((unint64_t)trialIdentifiers | v13)
  {
    if (!objc_msgSend_isEqual_(trialIdentifiers, v9, v13, v10, v11))
      goto LABEL_19;
  }
  contextID = self->_contextID;
  v15 = v4[3];
  if ((unint64_t)contextID | v15)
  {
    if (!objc_msgSend_isEqual_(contextID, v9, v15, v10, v11))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[8] & 1) == 0 || self->_timestamp != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((v4[8] & 1) != 0)
  {
LABEL_19:
    isEqual = 0;
    goto LABEL_20;
  }
  activityScheduleStatus = self->_activityScheduleStatus;
  v17 = v4[2];
  if ((unint64_t)activityScheduleStatus | v17
    && !objc_msgSend_isEqual_(activityScheduleStatus, v9, v17, v10, v11))
  {
    goto LABEL_19;
  }
  taskFetched = self->_taskFetched;
  v19 = v4[5];
  if ((unint64_t)taskFetched | v19)
  {
    if (!objc_msgSend_isEqual_(taskFetched, v9, v19, v10, v11))
      goto LABEL_19;
  }
  taskScheduled = self->_taskScheduled;
  v21 = v4[6];
  if ((unint64_t)taskScheduled | v21)
  {
    if (!objc_msgSend_isEqual_(taskScheduled, v9, v21, v10, v11))
      goto LABEL_19;
  }
  taskCompleted = self->_taskCompleted;
  v23 = v4[4];
  if ((unint64_t)taskCompleted | v23)
    isEqual = objc_msgSend_isEqual_(taskCompleted, v9, v23, v10, v11);
  else
    isEqual = 1;
LABEL_20:

  return isEqual;
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
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  double timestamp;
  double v18;
  long double v19;
  double v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v6 = objc_msgSend_hash(self->_trialIdentifiers, a2, v2, v3, v4);
  v15 = objc_msgSend_hash(self->_contextID, v7, v8, v9, v10);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    timestamp = self->_timestamp;
    v18 = -timestamp;
    if (timestamp >= 0.0)
      v18 = self->_timestamp;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  v21 = v15 ^ v6 ^ v16 ^ objc_msgSend_hash(self->_activityScheduleStatus, v11, v12, v13, v14);
  v26 = objc_msgSend_hash(self->_taskFetched, v22, v23, v24, v25);
  v31 = v26 ^ objc_msgSend_hash(self->_taskScheduled, v27, v28, v29, v30);
  return v21 ^ v31 ^ objc_msgSend_hash(self->_taskCompleted, v32, v33, v34, v35);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *trialIdentifiers;
  uint64_t v8;
  uint64_t v9;
  LIGHTHOUSE_BITACORA_PROTOScheduleStatus *activityScheduleStatus;
  uint64_t v11;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *taskFetched;
  uint64_t v13;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *taskScheduled;
  uint64_t v15;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *taskCompleted;
  uint64_t v17;
  id v18;

  v4 = a3;
  trialIdentifiers = self->_trialIdentifiers;
  v8 = *((_QWORD *)v4 + 7);
  v18 = v4;
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
  v4 = v18;
LABEL_7:
  v9 = *((_QWORD *)v4 + 3);
  if (v9)
  {
    objc_msgSend_setContextID_(self, (const char *)v4, v9, v5, v6);
    v4 = v18;
  }
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_timestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  activityScheduleStatus = self->_activityScheduleStatus;
  v11 = *((_QWORD *)v4 + 2);
  if (activityScheduleStatus)
  {
    if (!v11)
      goto LABEL_17;
    objc_msgSend_mergeFrom_(activityScheduleStatus, (const char *)v4, v11, v5, v6);
  }
  else
  {
    if (!v11)
      goto LABEL_17;
    objc_msgSend_setActivityScheduleStatus_(self, (const char *)v4, v11, v5, v6);
  }
  v4 = v18;
LABEL_17:
  taskFetched = self->_taskFetched;
  v13 = *((_QWORD *)v4 + 5);
  if (taskFetched)
  {
    if (!v13)
      goto LABEL_23;
    objc_msgSend_mergeFrom_(taskFetched, (const char *)v4, v13, v5, v6);
  }
  else
  {
    if (!v13)
      goto LABEL_23;
    objc_msgSend_setTaskFetched_(self, (const char *)v4, v13, v5, v6);
  }
  v4 = v18;
LABEL_23:
  taskScheduled = self->_taskScheduled;
  v15 = *((_QWORD *)v4 + 6);
  if (taskScheduled)
  {
    if (!v15)
      goto LABEL_29;
    objc_msgSend_mergeFrom_(taskScheduled, (const char *)v4, v15, v5, v6);
  }
  else
  {
    if (!v15)
      goto LABEL_29;
    objc_msgSend_setTaskScheduled_(self, (const char *)v4, v15, v5, v6);
  }
  v4 = v18;
LABEL_29:
  taskCompleted = self->_taskCompleted;
  v17 = *((_QWORD *)v4 + 4);
  if (taskCompleted)
  {
    if (v17)
    {
      objc_msgSend_mergeFrom_(taskCompleted, (const char *)v4, v17, v5, v6);
LABEL_34:
      v4 = v18;
    }
  }
  else if (v17)
  {
    objc_msgSend_setTaskCompleted_(self, (const char *)v4, v17, v5, v6);
    goto LABEL_34;
  }

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

- (LIGHTHOUSE_BITACORA_PROTOScheduleStatus)activityScheduleStatus
{
  return self->_activityScheduleStatus;
}

- (void)setActivityScheduleStatus:(id)a3
{
  objc_storeStrong((id *)&self->_activityScheduleStatus, a3);
}

- (LIGHTHOUSE_BITACORA_PROTOTaskEvent)taskFetched
{
  return self->_taskFetched;
}

- (void)setTaskFetched:(id)a3
{
  objc_storeStrong((id *)&self->_taskFetched, a3);
}

- (LIGHTHOUSE_BITACORA_PROTOTaskEvent)taskScheduled
{
  return self->_taskScheduled;
}

- (void)setTaskScheduled:(id)a3
{
  objc_storeStrong((id *)&self->_taskScheduled, a3);
}

- (LIGHTHOUSE_BITACORA_PROTOTaskEvent)taskCompleted
{
  return self->_taskCompleted;
}

- (void)setTaskCompleted:(id)a3
{
  objc_storeStrong((id *)&self->_taskCompleted, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialIdentifiers, 0);
  objc_storeStrong((id *)&self->_taskScheduled, 0);
  objc_storeStrong((id *)&self->_taskFetched, 0);
  objc_storeStrong((id *)&self->_taskCompleted, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_activityScheduleStatus, 0);
}

@end
