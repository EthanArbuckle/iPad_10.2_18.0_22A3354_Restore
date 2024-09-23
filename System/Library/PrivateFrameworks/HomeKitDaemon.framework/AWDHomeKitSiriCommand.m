@implementation AWDHomeKitSiriCommand

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (int)actionType
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_actionType;
  else
    return 0;
}

- (void)setActionType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_actionType = a3;
}

- (void)setHasActionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasActionType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)actionTypeAsString:(int)a3
{
  if (a3 < 8)
    return off_24E785AF0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsActionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandActionType_Get")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandActionType_GetTarget")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandActionType_Set")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandActionType_Decrease")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandActionType_Increase")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandActionType_Toggle")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandActionType_SetToMinimum")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandActionType_SetToMaximum")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)outcome
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_outcome;
  else
    return 0;
}

- (void)setOutcome:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_outcome = a3;
}

- (void)setHasOutcome:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasOutcome
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)outcomeAsString:(int)a3
{
  if (a3 < 0xC)
    return off_24E785B30[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOutcome:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandOutcome_Success")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandOutcome_NoMatches")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandOutcome_RemoteAccessNotSetup")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandOutcome_RequiresUnlock")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandOutcome_SceneInProgress")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandOutcome_ScenePartialFailure")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandOutcome_SceneNotSetup")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandOutcome_SecureAccessDenied")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandOutcome_IncompleteSyncData")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandOutcome_Failure")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandOutcome_SceneSecuringFailure")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSiriCommandOutcome_FoundNoMatchingEntities")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setNumEntities:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numEntities = a3;
}

- (void)setHasNumEntities:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumEntities
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumFailures:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numFailures = a3;
}

- (void)setHasNumFailures:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumFailures
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNumIncompleteOperations:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numIncompleteOperations = a3;
}

- (void)setHasNumIncompleteOperations:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumIncompleteOperations
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setCurrentConfigurationVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_currentConfigurationVersion = a3;
}

- (void)setHasCurrentConfigurationVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCurrentConfigurationVersion
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setLastSyncedConfigurationVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_lastSyncedConfigurationVersion = a3;
}

- (void)setHasLastSyncedConfigurationVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLastSyncedConfigurationVersion
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setServerConfigurationVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_serverConfigurationVersion = a3;
}

- (void)setHasServerConfigurationVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasServerConfigurationVersion
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasClientMetricIdentifier
{
  return self->_clientMetricIdentifier != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AWDHomeKitSiriCommand;
  -[AWDHomeKitSiriCommand description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitSiriCommand dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  NSString *clientMetricIdentifier;
  void *v8;
  uint64_t actionType;
  __CFString *v10;
  void *v11;
  uint64_t outcome;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  actionType = self->_actionType;
  if (actionType >= 8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_actionType);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_24E785AF0[actionType];
  }
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("actionType"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_duration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("duration"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_21:
  outcome = self->_outcome;
  if (outcome >= 0xC)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_outcome);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_24E785B30[outcome];
  }
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("outcome"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numEntities);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("numEntities"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numFailures);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("numFailures"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numIncompleteOperations);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("numIncompleteOperations"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_currentConfigurationVersion);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("currentConfigurationVersion"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_lastSyncedConfigurationVersion);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("lastSyncedConfigurationVersion"));

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_serverConfigurationVersion);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("serverConfigurationVersion"));

  }
LABEL_12:
  clientMetricIdentifier = self->_clientMetricIdentifier;
  if (clientMetricIdentifier)
    objc_msgSend(v3, "setObject:forKey:", clientMetricIdentifier, CFSTR("clientMetricIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  char v66;
  unsigned int v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  NSString *v71;
  NSString *clientMetricIdentifier;
  uint64_t v73;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
  {
    v8 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*((_BYTE *)a3 + *v6))
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        break;
      switch((v11 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_WORD *)&self->_has |= 1u;
          while (1)
          {
            v21 = *v4;
            v22 = *(_QWORD *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v22);
            *(_QWORD *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_93;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_95;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_93:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_95:
          self->_timestamp = v20;
          continue;
        case 2u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_WORD *)&self->_has |= 2u;
          while (2)
          {
            v28 = *v4;
            v29 = *(_QWORD *)((char *)a3 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v29);
              *(_QWORD *)((char *)a3 + v28) = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v15 = v26++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_99:
          v73 = 16;
          goto LABEL_132;
        case 3u:
          v31 = 0;
          v32 = 0;
          v27 = 0;
          *(_WORD *)&self->_has |= 8u;
          while (2)
          {
            v33 = *v4;
            v34 = *(_QWORD *)((char *)a3 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v34);
              *(_QWORD *)((char *)a3 + v33) = v34 + 1;
              v27 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v15 = v32++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_103;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_103:
          v73 = 36;
          goto LABEL_132;
        case 4u:
          v36 = 0;
          v37 = 0;
          v27 = 0;
          *(_WORD *)&self->_has |= 0x100u;
          while (2)
          {
            v38 = *v4;
            v39 = *(_QWORD *)((char *)a3 + v38);
            if (v39 == -1 || v39 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v39);
              *(_QWORD *)((char *)a3 + v38) = v39 + 1;
              v27 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                v15 = v37++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_107;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_107:
          v73 = 56;
          goto LABEL_132;
        case 5u:
          v41 = 0;
          v42 = 0;
          v27 = 0;
          *(_WORD *)&self->_has |= 0x20u;
          while (2)
          {
            v43 = *v4;
            v44 = *(_QWORD *)((char *)a3 + v43);
            if (v44 == -1 || v44 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v44);
              *(_QWORD *)((char *)a3 + v43) = v44 + 1;
              v27 |= (unint64_t)(v45 & 0x7F) << v41;
              if (v45 < 0)
              {
                v41 += 7;
                v15 = v42++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_111;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_111:
          v73 = 44;
          goto LABEL_132;
        case 6u:
          v46 = 0;
          v47 = 0;
          v27 = 0;
          *(_WORD *)&self->_has |= 0x40u;
          while (2)
          {
            v48 = *v4;
            v49 = *(_QWORD *)((char *)a3 + v48);
            if (v49 == -1 || v49 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v50 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v49);
              *(_QWORD *)((char *)a3 + v48) = v49 + 1;
              v27 |= (unint64_t)(v50 & 0x7F) << v46;
              if (v50 < 0)
              {
                v46 += 7;
                v15 = v47++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_115;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_115:
          v73 = 48;
          goto LABEL_132;
        case 7u:
          v51 = 0;
          v52 = 0;
          v27 = 0;
          *(_WORD *)&self->_has |= 0x80u;
          while (2)
          {
            v53 = *v4;
            v54 = *(_QWORD *)((char *)a3 + v53);
            if (v54 == -1 || v54 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v55 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v54);
              *(_QWORD *)((char *)a3 + v53) = v54 + 1;
              v27 |= (unint64_t)(v55 & 0x7F) << v51;
              if (v55 < 0)
              {
                v51 += 7;
                v15 = v52++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_119;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_119:
          v73 = 52;
          goto LABEL_132;
        case 8u:
          v56 = 0;
          v57 = 0;
          v27 = 0;
          *(_WORD *)&self->_has |= 4u;
          while (2)
          {
            v58 = *v4;
            v59 = *(_QWORD *)((char *)a3 + v58);
            if (v59 == -1 || v59 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v60 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v59);
              *(_QWORD *)((char *)a3 + v58) = v59 + 1;
              v27 |= (unint64_t)(v60 & 0x7F) << v56;
              if (v60 < 0)
              {
                v56 += 7;
                v15 = v57++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_123;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_123:
          v73 = 32;
          goto LABEL_132;
        case 9u:
          v61 = 0;
          v62 = 0;
          v27 = 0;
          *(_WORD *)&self->_has |= 0x10u;
          while (2)
          {
            v63 = *v4;
            v64 = *(_QWORD *)((char *)a3 + v63);
            if (v64 == -1 || v64 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v65 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v64);
              *(_QWORD *)((char *)a3 + v63) = v64 + 1;
              v27 |= (unint64_t)(v65 & 0x7F) << v61;
              if (v65 < 0)
              {
                v61 += 7;
                v15 = v62++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_127;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_127:
          v73 = 40;
          goto LABEL_132;
        case 0xAu:
          v66 = 0;
          v67 = 0;
          v27 = 0;
          *(_WORD *)&self->_has |= 0x200u;
          break;
        case 0xBu:
          PBReaderReadString();
          v71 = (NSString *)objc_claimAutoreleasedReturnValue();
          clientMetricIdentifier = self->_clientMetricIdentifier;
          self->_clientMetricIdentifier = v71;

          continue;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          continue;
      }
      while (1)
      {
        v68 = *v4;
        v69 = *(_QWORD *)((char *)a3 + v68);
        if (v69 == -1 || v69 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v70 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v69);
        *(_QWORD *)((char *)a3 + v68) = v69 + 1;
        v27 |= (unint64_t)(v70 & 0x7F) << v66;
        if ((v70 & 0x80) == 0)
          goto LABEL_129;
        v66 += 7;
        v15 = v67++ >= 9;
        if (v15)
        {
          LODWORD(v27) = 0;
          goto LABEL_131;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_129:
      if (*((_BYTE *)a3 + *v6))
        LODWORD(v27) = 0;
LABEL_131:
      v73 = 60;
LABEL_132:
      *(_DWORD *)((char *)&self->super.super.isa + v73) = v27;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  id v6;

  v4 = a3;
  has = (__int16)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_12:
  if (self->_clientMetricIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  _QWORD *v6;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 32) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 4) = self->_actionType;
  *((_WORD *)v4 + 32) |= 2u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 9) = self->_duration;
  *((_WORD *)v4 + 32) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 14) = self->_outcome;
  *((_WORD *)v4 + 32) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 11) = self->_numEntities;
  *((_WORD *)v4 + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 12) = self->_numFailures;
  *((_WORD *)v4 + 32) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 13) = self->_numIncompleteOperations;
  *((_WORD *)v4 + 32) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 8) = self->_currentConfigurationVersion;
  *((_WORD *)v4 + 32) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_23:
  *((_DWORD *)v4 + 10) = self->_lastSyncedConfigurationVersion;
  *((_WORD *)v4 + 32) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 15) = self->_serverConfigurationVersion;
    *((_WORD *)v4 + 32) |= 0x200u;
  }
LABEL_12:
  if (self->_clientMetricIdentifier)
  {
    v6 = v4;
    objc_msgSend(v4, "setClientMetricIdentifier:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  __int16 has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 64) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_actionType;
  *(_WORD *)(v5 + 64) |= 2u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 36) = self->_duration;
  *(_WORD *)(v5 + 64) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v5 + 56) = self->_outcome;
  *(_WORD *)(v5 + 64) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 44) = self->_numEntities;
  *(_WORD *)(v5 + 64) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 48) = self->_numFailures;
  *(_WORD *)(v5 + 64) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 52) = self->_numIncompleteOperations;
  *(_WORD *)(v5 + 64) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
LABEL_21:
    *(_DWORD *)(v5 + 40) = self->_lastSyncedConfigurationVersion;
    *(_WORD *)(v5 + 64) |= 0x10u;
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  *(_DWORD *)(v5 + 32) = self->_currentConfigurationVersion;
  *(_WORD *)(v5 + 64) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 0x200) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 60) = self->_serverConfigurationVersion;
    *(_WORD *)(v5 + 64) |= 0x200u;
  }
LABEL_12:
  v8 = -[NSString copyWithZone:](self->_clientMetricIdentifier, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSString *clientMetricIdentifier;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_54;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 32);
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_54;
  }
  else if ((v6 & 1) != 0)
  {
LABEL_54:
    v8 = 0;
    goto LABEL_55;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_actionType != *((_DWORD *)v4 + 4))
      goto LABEL_54;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_duration != *((_DWORD *)v4 + 9))
      goto LABEL_54;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0 || self->_outcome != *((_DWORD *)v4 + 14))
      goto LABEL_54;
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_numEntities != *((_DWORD *)v4 + 11))
      goto LABEL_54;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_numFailures != *((_DWORD *)v4 + 12))
      goto LABEL_54;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_numIncompleteOperations != *((_DWORD *)v4 + 13))
      goto LABEL_54;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_currentConfigurationVersion != *((_DWORD *)v4 + 8))
      goto LABEL_54;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_lastSyncedConfigurationVersion != *((_DWORD *)v4 + 10))
      goto LABEL_54;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x200) == 0 || self->_serverConfigurationVersion != *((_DWORD *)v4 + 15))
      goto LABEL_54;
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
    goto LABEL_54;
  }
  clientMetricIdentifier = self->_clientMetricIdentifier;
  if ((unint64_t)clientMetricIdentifier | *((_QWORD *)v4 + 3))
    v8 = -[NSString isEqual:](clientMetricIdentifier, "isEqual:");
  else
    v8 = 1;
LABEL_55:

  return v8;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_actionType;
      if ((has & 8) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_duration;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_outcome;
    if ((has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_numEntities;
    if ((has & 0x40) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v7 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_numFailures;
    if ((has & 0x80) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v8 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_numIncompleteOperations;
    if ((has & 4) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v9 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_currentConfigurationVersion;
    if ((has & 0x10) != 0)
      goto LABEL_10;
LABEL_20:
    v11 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
LABEL_21:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSString hash](self->_clientMetricIdentifier, "hash");
  }
LABEL_19:
  v10 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_20;
LABEL_10:
  v11 = 2654435761 * self->_lastSyncedConfigurationVersion;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_21;
LABEL_11:
  v12 = 2654435761 * self->_serverConfigurationVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSString hash](self->_clientMetricIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;

  v4 = a3;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_actionType = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_duration = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  self->_outcome = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  self->_numEntities = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  self->_numFailures = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  self->_numIncompleteOperations = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  self->_currentConfigurationVersion = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_23:
  self->_lastSyncedConfigurationVersion = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
LABEL_11:
    self->_serverConfigurationVersion = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 3))
  {
    v6 = v4;
    -[AWDHomeKitSiriCommand setClientMetricIdentifier:](self, "setClientMetricIdentifier:");
    v4 = v6;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)numEntities
{
  return self->_numEntities;
}

- (unsigned)numFailures
{
  return self->_numFailures;
}

- (unsigned)numIncompleteOperations
{
  return self->_numIncompleteOperations;
}

- (unsigned)currentConfigurationVersion
{
  return self->_currentConfigurationVersion;
}

- (unsigned)lastSyncedConfigurationVersion
{
  return self->_lastSyncedConfigurationVersion;
}

- (unsigned)serverConfigurationVersion
{
  return self->_serverConfigurationVersion;
}

- (NSString)clientMetricIdentifier
{
  return self->_clientMetricIdentifier;
}

- (void)setClientMetricIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientMetricIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientMetricIdentifier, 0);
}

@end
