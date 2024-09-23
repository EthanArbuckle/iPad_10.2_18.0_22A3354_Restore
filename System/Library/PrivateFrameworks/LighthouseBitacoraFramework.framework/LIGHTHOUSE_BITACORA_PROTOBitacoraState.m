@implementation LIGHTHOUSE_BITACORA_PROTOBitacoraState

- (void)setIsAllocated:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isAllocated = a3;
}

- (void)setHasIsAllocated:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsAllocated
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setIsActivated:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isActivated = a3;
}

- (void)setHasIsActivated:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsActivated
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setCountGeneralTargetting:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_countGeneralTargetting = a3;
}

- (void)setHasCountGeneralTargetting:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCountGeneralTargetting
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCountGeneralTargettingMet:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_countGeneralTargettingMet = a3;
}

- (void)setHasCountGeneralTargettingMet:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCountGeneralTargettingMet
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCountCustomTargetting:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_countCustomTargetting = a3;
}

- (void)setHasCountCustomTargetting:(BOOL)a3
{
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCountCustomTargetting
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCountCustomTargettingMet:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_countCustomTargettingMet = a3;
}

- (void)setHasCountCustomTargettingMet:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCountCustomTargettingMet
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCountTaskFetchedSucceeded:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_countTaskFetchedSucceeded = a3;
}

- (void)setHasCountTaskFetchedSucceeded:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasCountTaskFetchedSucceeded
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setCountTaskFetchedFailed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_countTaskFetchedFailed = a3;
}

- (void)setHasCountTaskFetchedFailed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasCountTaskFetchedFailed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setCountTaskScheduledSucceeded:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_countTaskScheduledSucceeded = a3;
}

- (void)setHasCountTaskScheduledSucceeded:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasCountTaskScheduledSucceeded
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setCountTaskScheduledFailed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_countTaskScheduledFailed = a3;
}

- (void)setHasCountTaskScheduledFailed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasCountTaskScheduledFailed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setCountTaskCompletedSucceeded:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_countTaskCompletedSucceeded = a3;
}

- (void)setHasCountTaskCompletedSucceeded:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasCountTaskCompletedSucceeded
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCountTaskCompletedFailed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_countTaskCompletedFailed = a3;
}

- (void)setHasCountTaskCompletedFailed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasCountTaskCompletedFailed
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setCountPerformTaskSucceeded:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_countPerformTaskSucceeded = a3;
}

- (void)setHasCountPerformTaskSucceeded:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasCountPerformTaskSucceeded
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setCountPerformTaskFailed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_countPerformTaskFailed = a3;
}

- (void)setHasCountPerformTaskFailed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCountPerformTaskFailed
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setCountStopSucceeded:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_countStopSucceeded = a3;
}

- (void)setHasCountStopSucceeded:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCountStopSucceeded
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setCountStopFailed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_countStopFailed = a3;
}

- (void)setHasCountStopFailed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCountStopFailed
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (int)trialIdentifierType
{
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    return self->_trialIdentifierType;
  else
    return 0;
}

- (void)setTrialIdentifierType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_trialIdentifierType = a3;
}

- (void)setHasTrialIdentifierType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTrialIdentifierType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (id)trialIdentifierTypeAsString:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 < 3)
    return off_251095410[a3];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTrialIdentifierType:(id)a3
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

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("Unknown"), v5, v6) & 1) != 0)
  {
    v10 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("experiment"), v8, v9) & 1) != 0)
  {
    v10 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("BMLT"), v12, v13))
  {
    v10 = 2;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasTrialExperimentID
{
  return self->_trialExperimentID != 0;
}

- (BOOL)hasTrialDeploymentID
{
  return self->_trialDeploymentID != 0;
}

- (BOOL)hasTrialTreatmentID
{
  return self->_trialTreatmentID != 0;
}

- (BOOL)hasTrialTaskID
{
  return self->_trialTaskID != 0;
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
  v15.super_class = (Class)LIGHTHOUSE_BITACORA_PROTOBitacoraState;
  -[LIGHTHOUSE_BITACORA_PROTOBitacoraState description](&v15, sel_description);
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
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSString *telemetryID;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *trialIdentifiers;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSString *contextID;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  $2E176B132DAEB8AB2524947CF859ECFE has;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t trialIdentifierType;
  __CFString *v73;
  NSString *trialExperimentID;
  NSString *trialDeploymentID;
  NSString *trialTreatmentID;
  NSString *trialTaskID;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  telemetryID = self->_telemetryID;
  if (telemetryID)
    objc_msgSend_setObject_forKey_(v6, v7, (uint64_t)telemetryID, (uint64_t)CFSTR("telemetryID"), v9);
  trialIdentifiers = self->_trialIdentifiers;
  if (trialIdentifiers)
  {
    objc_msgSend_dictionaryRepresentation(trialIdentifiers, v7, (uint64_t)telemetryID, v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v10, v14, (uint64_t)v13, (uint64_t)CFSTR("trialIdentifiers"), v15);

  }
  contextID = self->_contextID;
  if (contextID)
    objc_msgSend_setObject_forKey_(v10, v7, (uint64_t)contextID, (uint64_t)CFSTR("contextID"), v9);
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v7, self->_timestamp, v8, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v18, (uint64_t)v17, (uint64_t)CFSTR("timestamp"), v19);

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v20, self->_isAllocated, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v10, v25, (uint64_t)v24, (uint64_t)CFSTR("isAllocated"), v26);

    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_10;
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v20, self->_isActivated, v21, v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v28, (uint64_t)v27, (uint64_t)CFSTR("isActivated"), v29);

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v20, self->_countGeneralTargetting, v21, v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v31, (uint64_t)v30, (uint64_t)CFSTR("countGeneralTargetting"), v32);

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v20, self->_countGeneralTargettingMet, v21, v22);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v34, (uint64_t)v33, (uint64_t)CFSTR("countGeneralTargettingMet"), v35);

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v20, self->_countCustomTargetting, v21, v22);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v37, (uint64_t)v36, (uint64_t)CFSTR("countCustomTargetting"), v38);

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v20, self->_countCustomTargettingMet, v21, v22);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v40, (uint64_t)v39, (uint64_t)CFSTR("countCustomTargettingMet"), v41);

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v20, self->_countTaskFetchedSucceeded, v21, v22);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v43, (uint64_t)v42, (uint64_t)CFSTR("countTaskFetchedSucceeded"), v44);

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v20, self->_countTaskFetchedFailed, v21, v22);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v46, (uint64_t)v45, (uint64_t)CFSTR("countTaskFetchedFailed"), v47);

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v20, self->_countTaskScheduledSucceeded, v21, v22);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v49, (uint64_t)v48, (uint64_t)CFSTR("countTaskScheduledSucceeded"), v50);

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v20, self->_countTaskScheduledFailed, v21, v22);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v52, (uint64_t)v51, (uint64_t)CFSTR("countTaskScheduledFailed"), v53);

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v20, self->_countTaskCompletedSucceeded, v21, v22);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v55, (uint64_t)v54, (uint64_t)CFSTR("countTaskCompletedSucceeded"), v56);

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v20, self->_countTaskCompletedFailed, v21, v22);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v58, (uint64_t)v57, (uint64_t)CFSTR("countTaskCompletedFailed"), v59);

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v20, self->_countPerformTaskSucceeded, v21, v22);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v61, (uint64_t)v60, (uint64_t)CFSTR("countPerformTaskSucceeded"), v62);

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v20, self->_countPerformTaskFailed, v21, v22);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v64, (uint64_t)v63, (uint64_t)CFSTR("countPerformTaskFailed"), v65);

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v20, self->_countStopSucceeded, v21, v22);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v67, (uint64_t)v66, (uint64_t)CFSTR("countStopSucceeded"), v68);

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_45;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v20, self->_countStopFailed, v21, v22);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v70, (uint64_t)v69, (uint64_t)CFSTR("countStopFailed"), v71);

  if ((*(_DWORD *)&self->_has & 0x4000) == 0)
    goto LABEL_45;
LABEL_41:
  trialIdentifierType = self->_trialIdentifierType;
  if (trialIdentifierType >= 3)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v20, (uint64_t)CFSTR("(unknown: %i)"), v21, v22, self->_trialIdentifierType);
    v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v73 = off_251095410[trialIdentifierType];
  }
  objc_msgSend_setObject_forKey_(v10, v20, (uint64_t)v73, (uint64_t)CFSTR("trialIdentifierType"), v22);

LABEL_45:
  trialExperimentID = self->_trialExperimentID;
  if (trialExperimentID)
    objc_msgSend_setObject_forKey_(v10, v20, (uint64_t)trialExperimentID, (uint64_t)CFSTR("trialExperimentID"), v22);
  trialDeploymentID = self->_trialDeploymentID;
  if (trialDeploymentID)
    objc_msgSend_setObject_forKey_(v10, v20, (uint64_t)trialDeploymentID, (uint64_t)CFSTR("trialDeploymentID"), v22);
  trialTreatmentID = self->_trialTreatmentID;
  if (trialTreatmentID)
    objc_msgSend_setObject_forKey_(v10, v20, (uint64_t)trialTreatmentID, (uint64_t)CFSTR("trialTreatmentID"), v22);
  trialTaskID = self->_trialTaskID;
  if (trialTaskID)
    objc_msgSend_setObject_forKey_(v10, v20, (uint64_t)trialTaskID, (uint64_t)CFSTR("trialTaskID"), v22);
  return v10;
}

- (BOOL)readFrom:(id)a3
{
  return LIGHTHOUSE_BITACORA_PROTOBitacoraStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $2E176B132DAEB8AB2524947CF859ECFE has;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->_telemetryID)
    sub_24031570C();
  v7 = v4;
  PBDataWriterWriteStringField();
  if (!self->_trialIdentifiers)
    sub_240315734();
  PBDataWriterWriteSubmessage();
  if (!self->_contextID)
    sub_24031575C();
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  v6 = v7;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v7;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_10:
      if ((*(_BYTE *)&has & 1) == 0)
        goto LABEL_11;
      goto LABEL_35;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field();
  v6 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  v6 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  v6 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  v6 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  v6 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  v6 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  v6 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  v6 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  v6 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  v6 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  v6 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  v6 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  v6 = v7;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_23:
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }
LABEL_24:
  if (self->_trialExperimentID)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
  if (self->_trialDeploymentID)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
  if (self->_trialTreatmentID)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
  if (self->_trialTaskID)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }

}

- (void)copyTo:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  $2E176B132DAEB8AB2524947CF859ECFE has;
  NSString *trialExperimentID;
  NSString *trialDeploymentID;
  NSString *trialTreatmentID;
  NSString *trialTaskID;
  id v22;

  v22 = a3;
  objc_msgSend_setTelemetryID_(v22, v4, (uint64_t)self->_telemetryID, v5, v6);
  objc_msgSend_setTrialIdentifiers_(v22, v7, (uint64_t)self->_trialIdentifiers, v8, v9);
  objc_msgSend_setContextID_(v22, v10, (uint64_t)self->_contextID, v11, v12);
  v16 = v22;
  *((_QWORD *)v22 + 1) = self->_timestamp;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    *((_BYTE *)v22 + 137) = self->_isAllocated;
    *((_DWORD *)v22 + 35) |= 0x10000u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v22 + 136) = self->_isActivated;
  *((_DWORD *)v22 + 35) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v22 + 8) = self->_countGeneralTargetting;
  *((_DWORD *)v22 + 35) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v22 + 9) = self->_countGeneralTargettingMet;
  *((_DWORD *)v22 + 35) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v22 + 6) = self->_countCustomTargetting;
  *((_DWORD *)v22 + 35) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v22 + 7) = self->_countCustomTargettingMet;
  *((_DWORD *)v22 + 35) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v22 + 17) = self->_countTaskFetchedSucceeded;
  *((_DWORD *)v22 + 35) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v22 + 16) = self->_countTaskFetchedFailed;
  *((_DWORD *)v22 + 35) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v22 + 19) = self->_countTaskScheduledSucceeded;
  *((_DWORD *)v22 + 35) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v22 + 18) = self->_countTaskScheduledFailed;
  *((_DWORD *)v22 + 35) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v22 + 15) = self->_countTaskCompletedSucceeded;
  *((_DWORD *)v22 + 35) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v22 + 14) = self->_countTaskCompletedFailed;
  *((_DWORD *)v22 + 35) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v22 + 11) = self->_countPerformTaskSucceeded;
  *((_DWORD *)v22 + 35) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v22 + 10) = self->_countPerformTaskFailed;
  *((_DWORD *)v22 + 35) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v22 + 13) = self->_countStopSucceeded;
  *((_DWORD *)v22 + 35) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_43:
  *((_DWORD *)v22 + 12) = self->_countStopFailed;
  *((_DWORD *)v22 + 35) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_18:
    *((_DWORD *)v22 + 26) = self->_trialIdentifierType;
    *((_DWORD *)v22 + 35) |= 0x4000u;
  }
LABEL_19:
  trialExperimentID = self->_trialExperimentID;
  if (trialExperimentID)
  {
    objc_msgSend_setTrialExperimentID_(v22, v13, (uint64_t)trialExperimentID, v14, v15);
    v16 = v22;
  }
  trialDeploymentID = self->_trialDeploymentID;
  if (trialDeploymentID)
  {
    objc_msgSend_setTrialDeploymentID_(v22, v13, (uint64_t)trialDeploymentID, v14, v15);
    v16 = v22;
  }
  trialTreatmentID = self->_trialTreatmentID;
  if (trialTreatmentID)
  {
    objc_msgSend_setTrialTreatmentID_(v22, v13, (uint64_t)trialTreatmentID, v14, v15);
    v16 = v22;
  }
  trialTaskID = self->_trialTaskID;
  if (trialTaskID)
  {
    objc_msgSend_setTrialTaskID_(v22, v13, (uint64_t)trialTaskID, v14, v15);
    v16 = v22;
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
  $2E176B132DAEB8AB2524947CF859ECFE has;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  v18 = objc_msgSend_copyWithZone_(self->_telemetryID, v15, (uint64_t)a3, v16, v17);
  v19 = *(void **)(v14 + 80);
  *(_QWORD *)(v14 + 80) = v18;

  v23 = objc_msgSend_copyWithZone_(self->_trialIdentifiers, v20, (uint64_t)a3, v21, v22);
  v24 = *(void **)(v14 + 112);
  *(_QWORD *)(v14 + 112) = v23;

  v28 = objc_msgSend_copyWithZone_(self->_contextID, v25, (uint64_t)a3, v26, v27);
  v29 = *(void **)(v14 + 16);
  *(_QWORD *)(v14 + 16) = v28;

  *(_QWORD *)(v14 + 8) = self->_timestamp;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    *(_BYTE *)(v14 + 137) = self->_isAllocated;
    *(_DWORD *)(v14 + 140) |= 0x10000u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v14 + 136) = self->_isActivated;
  *(_DWORD *)(v14 + 140) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v14 + 32) = self->_countGeneralTargetting;
  *(_DWORD *)(v14 + 140) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v14 + 36) = self->_countGeneralTargettingMet;
  *(_DWORD *)(v14 + 140) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v14 + 24) = self->_countCustomTargetting;
  *(_DWORD *)(v14 + 140) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v14 + 28) = self->_countCustomTargettingMet;
  *(_DWORD *)(v14 + 140) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v14 + 68) = self->_countTaskFetchedSucceeded;
  *(_DWORD *)(v14 + 140) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v14 + 64) = self->_countTaskFetchedFailed;
  *(_DWORD *)(v14 + 140) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v14 + 76) = self->_countTaskScheduledSucceeded;
  *(_DWORD *)(v14 + 140) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v14 + 72) = self->_countTaskScheduledFailed;
  *(_DWORD *)(v14 + 140) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v14 + 60) = self->_countTaskCompletedSucceeded;
  *(_DWORD *)(v14 + 140) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v14 + 56) = self->_countTaskCompletedFailed;
  *(_DWORD *)(v14 + 140) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(v14 + 44) = self->_countPerformTaskSucceeded;
  *(_DWORD *)(v14 + 140) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(v14 + 40) = self->_countPerformTaskFailed;
  *(_DWORD *)(v14 + 140) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
LABEL_35:
    *(_DWORD *)(v14 + 48) = self->_countStopFailed;
    *(_DWORD *)(v14 + 140) |= 0x40u;
    if ((*(_DWORD *)&self->_has & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_34:
  *(_DWORD *)(v14 + 52) = self->_countStopSucceeded;
  *(_DWORD *)(v14 + 140) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
    goto LABEL_35;
LABEL_17:
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_18:
    *(_DWORD *)(v14 + 104) = self->_trialIdentifierType;
    *(_DWORD *)(v14 + 140) |= 0x4000u;
  }
LABEL_19:
  v34 = objc_msgSend_copyWithZone_(self->_trialExperimentID, v30, (uint64_t)a3, v31, v32);
  v35 = *(void **)(v14 + 96);
  *(_QWORD *)(v14 + 96) = v34;

  v39 = objc_msgSend_copyWithZone_(self->_trialDeploymentID, v36, (uint64_t)a3, v37, v38);
  v40 = *(void **)(v14 + 88);
  *(_QWORD *)(v14 + 88) = v39;

  v44 = objc_msgSend_copyWithZone_(self->_trialTreatmentID, v41, (uint64_t)a3, v42, v43);
  v45 = *(void **)(v14 + 128);
  *(_QWORD *)(v14 + 128) = v44;

  v49 = objc_msgSend_copyWithZone_(self->_trialTaskID, v46, (uint64_t)a3, v47, v48);
  v50 = *(void **)(v14 + 120);
  *(_QWORD *)(v14 + 120) = v49;

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
  NSString *telemetryID;
  uint64_t v13;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *trialIdentifiers;
  uint64_t v15;
  NSString *contextID;
  uint64_t v17;
  $2E176B132DAEB8AB2524947CF859ECFE has;
  int v19;
  NSString *trialExperimentID;
  uint64_t v21;
  NSString *trialDeploymentID;
  uint64_t v23;
  NSString *trialTreatmentID;
  uint64_t v25;
  NSString *trialTaskID;
  uint64_t v27;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8))
    goto LABEL_108;
  telemetryID = self->_telemetryID;
  v13 = v4[10];
  if ((unint64_t)telemetryID | v13)
  {
    if (!objc_msgSend_isEqual_(telemetryID, v9, v13, v10, v11))
      goto LABEL_108;
  }
  trialIdentifiers = self->_trialIdentifiers;
  v15 = v4[14];
  if ((unint64_t)trialIdentifiers | v15)
  {
    if (!objc_msgSend_isEqual_(trialIdentifiers, v9, v15, v10, v11))
      goto LABEL_108;
  }
  contextID = self->_contextID;
  v17 = v4[2];
  if ((unint64_t)contextID | v17)
  {
    if (!objc_msgSend_isEqual_(contextID, v9, v17, v10, v11))
      goto LABEL_108;
  }
  if (self->_timestamp != v4[1])
    goto LABEL_108;
  has = self->_has;
  v19 = *((_DWORD *)v4 + 35);
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v19 & 0x10000) == 0)
      goto LABEL_108;
    if (self->_isAllocated)
    {
      if (!*((_BYTE *)v4 + 137))
        goto LABEL_108;
    }
    else if (*((_BYTE *)v4 + 137))
    {
      goto LABEL_108;
    }
  }
  else if ((v19 & 0x10000) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v19 & 0x8000) != 0)
    {
      if (self->_isActivated)
      {
        if (!*((_BYTE *)v4 + 136))
          goto LABEL_108;
        goto LABEL_25;
      }
      if (!*((_BYTE *)v4 + 136))
        goto LABEL_25;
    }
LABEL_108:
    isEqual = 0;
    goto LABEL_109;
  }
  if ((v19 & 0x8000) != 0)
    goto LABEL_108;
LABEL_25:
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v19 & 4) == 0 || self->_countGeneralTargetting != *((_DWORD *)v4 + 8))
      goto LABEL_108;
  }
  else if ((v19 & 4) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v19 & 8) == 0 || self->_countGeneralTargettingMet != *((_DWORD *)v4 + 9))
      goto LABEL_108;
  }
  else if ((v19 & 8) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v19 & 1) == 0 || self->_countCustomTargetting != *((_DWORD *)v4 + 6))
      goto LABEL_108;
  }
  else if ((v19 & 1) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v19 & 2) == 0 || self->_countCustomTargettingMet != *((_DWORD *)v4 + 7))
      goto LABEL_108;
  }
  else if ((v19 & 2) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v19 & 0x800) == 0 || self->_countTaskFetchedSucceeded != *((_DWORD *)v4 + 17))
      goto LABEL_108;
  }
  else if ((v19 & 0x800) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v19 & 0x400) == 0 || self->_countTaskFetchedFailed != *((_DWORD *)v4 + 16))
      goto LABEL_108;
  }
  else if ((v19 & 0x400) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v19 & 0x2000) == 0 || self->_countTaskScheduledSucceeded != *((_DWORD *)v4 + 19))
      goto LABEL_108;
  }
  else if ((v19 & 0x2000) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v19 & 0x1000) == 0 || self->_countTaskScheduledFailed != *((_DWORD *)v4 + 18))
      goto LABEL_108;
  }
  else if ((v19 & 0x1000) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v19 & 0x200) == 0 || self->_countTaskCompletedSucceeded != *((_DWORD *)v4 + 15))
      goto LABEL_108;
  }
  else if ((v19 & 0x200) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v19 & 0x100) == 0 || self->_countTaskCompletedFailed != *((_DWORD *)v4 + 14))
      goto LABEL_108;
  }
  else if ((v19 & 0x100) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v19 & 0x20) == 0 || self->_countPerformTaskSucceeded != *((_DWORD *)v4 + 11))
      goto LABEL_108;
  }
  else if ((v19 & 0x20) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v19 & 0x10) == 0 || self->_countPerformTaskFailed != *((_DWORD *)v4 + 10))
      goto LABEL_108;
  }
  else if ((v19 & 0x10) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v19 & 0x80) == 0 || self->_countStopSucceeded != *((_DWORD *)v4 + 13))
      goto LABEL_108;
  }
  else if ((v19 & 0x80) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v19 & 0x40) == 0 || self->_countStopFailed != *((_DWORD *)v4 + 12))
      goto LABEL_108;
  }
  else if ((v19 & 0x40) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v19 & 0x4000) == 0 || self->_trialIdentifierType != *((_DWORD *)v4 + 26))
      goto LABEL_108;
  }
  else if ((v19 & 0x4000) != 0)
  {
    goto LABEL_108;
  }
  trialExperimentID = self->_trialExperimentID;
  v21 = v4[12];
  if ((unint64_t)trialExperimentID | v21
    && !objc_msgSend_isEqual_(trialExperimentID, v9, v21, v10, v11))
  {
    goto LABEL_108;
  }
  trialDeploymentID = self->_trialDeploymentID;
  v23 = v4[11];
  if ((unint64_t)trialDeploymentID | v23)
  {
    if (!objc_msgSend_isEqual_(trialDeploymentID, v9, v23, v10, v11))
      goto LABEL_108;
  }
  trialTreatmentID = self->_trialTreatmentID;
  v25 = v4[16];
  if ((unint64_t)trialTreatmentID | v25)
  {
    if (!objc_msgSend_isEqual_(trialTreatmentID, v9, v25, v10, v11))
      goto LABEL_108;
  }
  trialTaskID = self->_trialTaskID;
  v27 = v4[15];
  if ((unint64_t)trialTaskID | v27)
    isEqual = objc_msgSend_isEqual_(trialTaskID, v9, v27, v10, v11);
  else
    isEqual = 1;
LABEL_109:

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
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  $2E176B132DAEB8AB2524947CF859ECFE has;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v6 = objc_msgSend_hash(self->_telemetryID, a2, v2, v3, v4);
  v11 = objc_msgSend_hash(self->_trialIdentifiers, v7, v8, v9, v10);
  v16 = objc_msgSend_hash(self->_contextID, v12, v13, v14, v15);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    v18 = 2654435761 * self->_isAllocated;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
LABEL_3:
      v19 = 2654435761 * self->_isActivated;
      if ((*(_BYTE *)&has & 4) != 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else
  {
    v18 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_3;
  }
  v19 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_4:
    v20 = 2654435761 * self->_countGeneralTargetting;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v20 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_5:
    v21 = 2654435761 * self->_countGeneralTargettingMet;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v21 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_6:
    v22 = 2654435761 * self->_countCustomTargetting;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  v22 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_7:
    v23 = 2654435761 * self->_countCustomTargettingMet;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  v23 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_8:
    v24 = 2654435761 * self->_countTaskFetchedSucceeded;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  v24 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_9:
    v25 = 2654435761 * self->_countTaskFetchedFailed;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  v25 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_10:
    v26 = 2654435761 * self->_countTaskScheduledSucceeded;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  v26 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_11:
    v27 = 2654435761 * self->_countTaskScheduledFailed;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  v27 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_12:
    v28 = 2654435761 * self->_countTaskCompletedSucceeded;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  v28 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_13:
    v29 = 2654435761 * self->_countTaskCompletedFailed;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_14;
LABEL_28:
    v30 = 0;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_15;
    goto LABEL_29;
  }
LABEL_27:
  v29 = 0;
  if ((*(_BYTE *)&has & 0x20) == 0)
    goto LABEL_28;
LABEL_14:
  v30 = 2654435761 * self->_countPerformTaskSucceeded;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_15:
    v31 = 2654435761 * self->_countPerformTaskFailed;
    goto LABEL_30;
  }
LABEL_29:
  v31 = 0;
LABEL_30:
  if ((*(_BYTE *)&has & 0x80) != 0)
    v32 = 2654435761 * self->_countStopSucceeded;
  else
    v32 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
    v33 = 2654435761 * self->_countStopFailed;
  else
    v33 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
    v34 = 2654435761 * self->_trialIdentifierType;
  else
    v34 = 0;
  v35 = v11 ^ v6 ^ v16 ^ v18 ^ v19 ^ (2654435761u * self->_timestamp);
  v36 = v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34 ^ objc_msgSend_hash(self->_trialExperimentID, (const char *)v27, v28, v29, v30);
  v41 = v35 ^ v36 ^ objc_msgSend_hash(self->_trialDeploymentID, v37, v38, v39, v40);
  v46 = objc_msgSend_hash(self->_trialTreatmentID, v42, v43, v44, v45);
  return v41 ^ v46 ^ objc_msgSend_hash(self->_trialTaskID, v47, v48, v49, v50);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *trialIdentifiers;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  v7 = *((_QWORD *)v4 + 10);
  v16 = v4;
  if (v7)
  {
    objc_msgSend_setTelemetryID_(self, (const char *)v4, v7, v5, v6);
    v4 = v16;
  }
  trialIdentifiers = self->_trialIdentifiers;
  v9 = *((_QWORD *)v4 + 14);
  if (trialIdentifiers)
  {
    if (!v9)
      goto LABEL_9;
    objc_msgSend_mergeFrom_(trialIdentifiers, (const char *)v4, v9, v5, v6);
  }
  else
  {
    if (!v9)
      goto LABEL_9;
    objc_msgSend_setTrialIdentifiers_(self, (const char *)v4, v9, v5, v6);
  }
  v4 = v16;
LABEL_9:
  v10 = *((_QWORD *)v4 + 2);
  if (v10)
  {
    objc_msgSend_setContextID_(self, (const char *)v4, v10, v5, v6);
    v4 = v16;
  }
  self->_timestamp = *((_QWORD *)v4 + 1);
  v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x10000) != 0)
  {
    self->_isAllocated = *((_BYTE *)v4 + 137);
    *(_DWORD *)&self->_has |= 0x10000u;
    v11 = *((_DWORD *)v4 + 35);
    if ((v11 & 0x8000) == 0)
    {
LABEL_13:
      if ((v11 & 4) == 0)
        goto LABEL_14;
      goto LABEL_40;
    }
  }
  else if ((v11 & 0x8000) == 0)
  {
    goto LABEL_13;
  }
  self->_isActivated = *((_BYTE *)v4 + 136);
  *(_DWORD *)&self->_has |= 0x8000u;
  v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 4) == 0)
  {
LABEL_14:
    if ((v11 & 8) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  self->_countGeneralTargetting = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 4u;
  v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 8) == 0)
  {
LABEL_15:
    if ((v11 & 1) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  self->_countGeneralTargettingMet = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 8u;
  v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 1) == 0)
  {
LABEL_16:
    if ((v11 & 2) == 0)
      goto LABEL_17;
    goto LABEL_43;
  }
LABEL_42:
  self->_countCustomTargetting = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 1u;
  v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 2) == 0)
  {
LABEL_17:
    if ((v11 & 0x800) == 0)
      goto LABEL_18;
    goto LABEL_44;
  }
LABEL_43:
  self->_countCustomTargettingMet = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 2u;
  v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x800) == 0)
  {
LABEL_18:
    if ((v11 & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_45;
  }
LABEL_44:
  self->_countTaskFetchedSucceeded = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x800u;
  v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x400) == 0)
  {
LABEL_19:
    if ((v11 & 0x2000) == 0)
      goto LABEL_20;
    goto LABEL_46;
  }
LABEL_45:
  self->_countTaskFetchedFailed = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x400u;
  v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x2000) == 0)
  {
LABEL_20:
    if ((v11 & 0x1000) == 0)
      goto LABEL_21;
    goto LABEL_47;
  }
LABEL_46:
  self->_countTaskScheduledSucceeded = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x2000u;
  v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x1000) == 0)
  {
LABEL_21:
    if ((v11 & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_48;
  }
LABEL_47:
  self->_countTaskScheduledFailed = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x1000u;
  v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x200) == 0)
  {
LABEL_22:
    if ((v11 & 0x100) == 0)
      goto LABEL_23;
    goto LABEL_49;
  }
LABEL_48:
  self->_countTaskCompletedSucceeded = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x200u;
  v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x100) == 0)
  {
LABEL_23:
    if ((v11 & 0x20) == 0)
      goto LABEL_24;
    goto LABEL_50;
  }
LABEL_49:
  self->_countTaskCompletedFailed = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x100u;
  v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x20) == 0)
  {
LABEL_24:
    if ((v11 & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_51;
  }
LABEL_50:
  self->_countPerformTaskSucceeded = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x20u;
  v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x10) == 0)
  {
LABEL_25:
    if ((v11 & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_52;
  }
LABEL_51:
  self->_countPerformTaskFailed = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x10u;
  v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x80) == 0)
  {
LABEL_26:
    if ((v11 & 0x40) == 0)
      goto LABEL_27;
    goto LABEL_53;
  }
LABEL_52:
  self->_countStopSucceeded = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x80u;
  v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x40) == 0)
  {
LABEL_27:
    if ((v11 & 0x4000) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_53:
  self->_countStopFailed = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x40u;
  if ((*((_DWORD *)v4 + 35) & 0x4000) != 0)
  {
LABEL_28:
    self->_trialIdentifierType = *((_DWORD *)v4 + 26);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_29:
  v12 = *((_QWORD *)v4 + 12);
  if (v12)
  {
    objc_msgSend_setTrialExperimentID_(self, (const char *)v4, v12, v5, v6);
    v4 = v16;
  }
  v13 = *((_QWORD *)v4 + 11);
  if (v13)
  {
    objc_msgSend_setTrialDeploymentID_(self, (const char *)v4, v13, v5, v6);
    v4 = v16;
  }
  v14 = *((_QWORD *)v4 + 16);
  if (v14)
  {
    objc_msgSend_setTrialTreatmentID_(self, (const char *)v4, v14, v5, v6);
    v4 = v16;
  }
  v15 = *((_QWORD *)v4 + 15);
  if (v15)
  {
    objc_msgSend_setTrialTaskID_(self, (const char *)v4, v15, v5, v6);
    v4 = v16;
  }

}

- (NSString)telemetryID
{
  return self->_telemetryID;
}

- (void)setTelemetryID:(id)a3
{
  objc_storeStrong((id *)&self->_telemetryID, a3);
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

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (BOOL)isAllocated
{
  return self->_isAllocated;
}

- (BOOL)isActivated
{
  return self->_isActivated;
}

- (unsigned)countGeneralTargetting
{
  return self->_countGeneralTargetting;
}

- (unsigned)countGeneralTargettingMet
{
  return self->_countGeneralTargettingMet;
}

- (unsigned)countCustomTargetting
{
  return self->_countCustomTargetting;
}

- (unsigned)countCustomTargettingMet
{
  return self->_countCustomTargettingMet;
}

- (unsigned)countTaskFetchedSucceeded
{
  return self->_countTaskFetchedSucceeded;
}

- (unsigned)countTaskFetchedFailed
{
  return self->_countTaskFetchedFailed;
}

- (unsigned)countTaskScheduledSucceeded
{
  return self->_countTaskScheduledSucceeded;
}

- (unsigned)countTaskScheduledFailed
{
  return self->_countTaskScheduledFailed;
}

- (unsigned)countTaskCompletedSucceeded
{
  return self->_countTaskCompletedSucceeded;
}

- (unsigned)countTaskCompletedFailed
{
  return self->_countTaskCompletedFailed;
}

- (unsigned)countPerformTaskSucceeded
{
  return self->_countPerformTaskSucceeded;
}

- (unsigned)countPerformTaskFailed
{
  return self->_countPerformTaskFailed;
}

- (unsigned)countStopSucceeded
{
  return self->_countStopSucceeded;
}

- (unsigned)countStopFailed
{
  return self->_countStopFailed;
}

- (NSString)trialExperimentID
{
  return self->_trialExperimentID;
}

- (void)setTrialExperimentID:(id)a3
{
  objc_storeStrong((id *)&self->_trialExperimentID, a3);
}

- (NSString)trialDeploymentID
{
  return self->_trialDeploymentID;
}

- (void)setTrialDeploymentID:(id)a3
{
  objc_storeStrong((id *)&self->_trialDeploymentID, a3);
}

- (NSString)trialTreatmentID
{
  return self->_trialTreatmentID;
}

- (void)setTrialTreatmentID:(id)a3
{
  objc_storeStrong((id *)&self->_trialTreatmentID, a3);
}

- (NSString)trialTaskID
{
  return self->_trialTaskID;
}

- (void)setTrialTaskID:(id)a3
{
  objc_storeStrong((id *)&self->_trialTaskID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialTreatmentID, 0);
  objc_storeStrong((id *)&self->_trialTaskID, 0);
  objc_storeStrong((id *)&self->_trialIdentifiers, 0);
  objc_storeStrong((id *)&self->_trialExperimentID, 0);
  objc_storeStrong((id *)&self->_trialDeploymentID, 0);
  objc_storeStrong((id *)&self->_telemetryID, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
}

@end
