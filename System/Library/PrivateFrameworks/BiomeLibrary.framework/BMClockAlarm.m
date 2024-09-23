@implementation BMClockAlarm

- (BMClockAlarm)initWithIsSleepAlarm:(id)a3 eventType:(int)a4 alarmID:(id)a5 lastEventType:(int)a6
{
  return -[BMClockAlarm initWithIsSleepAlarm:eventType:alarmID:lastEventType:enabled:](self, "initWithIsSleepAlarm:eventType:alarmID:lastEventType:enabled:", a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, 0);
}

- (BMClockAlarm)initWithIsSleepAlarm:(id)a3 eventType:(int)a4 alarmID:(id)a5 lastEventType:(int)a6 enabled:(id)a7
{
  id v12;
  id v13;
  id v14;
  BMClockAlarm *v15;
  objc_super v17;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v17.receiver = self;
  v17.super_class = (Class)BMClockAlarm;
  v15 = -[BMEventBase init](&v17, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v12)
    {
      v15->_hasIsSleepAlarm = 1;
      v15->_isSleepAlarm = objc_msgSend(v12, "BOOLValue");
    }
    else
    {
      v15->_hasIsSleepAlarm = 0;
      v15->_isSleepAlarm = 0;
    }
    v15->_eventType = a4;
    objc_storeStrong((id *)&v15->_alarmID, a5);
    v15->_lastEventType = a6;
    if (v14)
    {
      v15->_hasEnabled = 1;
      v15->_enabled = objc_msgSend(v14, "BOOLValue");
    }
    else
    {
      v15->_hasEnabled = 0;
      v15->_enabled = 0;
    }
  }

  return v15;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMClockAlarm isSleepAlarm](self, "isSleepAlarm"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMClockAlarmEventTypeAsString(-[BMClockAlarm eventType](self, "eventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMClockAlarm alarmID](self, "alarmID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMClockAlarmLastEventTypeAsString(-[BMClockAlarm lastEventType](self, "lastEventType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMClockAlarm enabled](self, "enabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMClockAlarm with isSleepAlarm: %@, eventType: %@, alarmID: %@, lastEventType: %@, enabled: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMClockAlarm *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  NSString *alarmID;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  BMClockAlarm *v47;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BMClockAlarm;
  v5 = -[BMEventBase init](&v49, sel_init);
  if (!v5)
    goto LABEL_76;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v6;
        v14 = *(_QWORD *)&v4[v13];
        if (v14 == -1 || v14 >= *(_QWORD *)&v4[*v7])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v16 = v11++ >= 9;
        if (v16)
        {
          v12 = 0;
          v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v17 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v17 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          v19 = 0;
          v20 = 0;
          v21 = 0;
          v5->_hasIsSleepAlarm = 1;
          while (1)
          {
            v22 = *v6;
            v23 = *(_QWORD *)&v4[v22];
            if (v23 == -1 || v23 >= *(_QWORD *)&v4[*v7])
              break;
            v24 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v23);
            *(_QWORD *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0)
              goto LABEL_52;
            v19 += 7;
            v16 = v20++ >= 9;
            if (v16)
            {
              v21 = 0;
              goto LABEL_54;
            }
          }
          v4[*v8] = 1;
LABEL_52:
          if (v4[*v8])
            v21 = 0;
LABEL_54:
          v44 = v21 != 0;
          v45 = 16;
          goto LABEL_72;
        case 2u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          while (2)
          {
            v28 = *v6;
            v29 = *(_QWORD *)&v4[v28];
            if (v29 == -1 || v29 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v29);
              *(_QWORD *)&v4[v28] = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v16 = v26++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_58:
          if (v27 >= 7)
            LODWORD(v27) = 0;
          v46 = 24;
          goto LABEL_67;
        case 3u:
          PBReaderReadString();
          v31 = objc_claimAutoreleasedReturnValue();
          alarmID = v5->_alarmID;
          v5->_alarmID = (NSString *)v31;

          continue;
        case 4u:
          v33 = 0;
          v34 = 0;
          v27 = 0;
          while (2)
          {
            v35 = *v6;
            v36 = *(_QWORD *)&v4[v35];
            if (v36 == -1 || v36 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v36);
              *(_QWORD *)&v4[v35] = v36 + 1;
              v27 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                v16 = v34++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_64:
          if (v27 >= 0xC)
            LODWORD(v27) = 0;
          v46 = 28;
LABEL_67:
          *(_DWORD *)((char *)&v5->super.super.isa + v46) = v27;
          continue;
        case 5u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v5->_hasEnabled = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_75;
          continue;
      }
      while (1)
      {
        v41 = *v6;
        v42 = *(_QWORD *)&v4[v41];
        if (v42 == -1 || v42 >= *(_QWORD *)&v4[*v7])
          break;
        v43 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v42);
        *(_QWORD *)&v4[v41] = v42 + 1;
        v40 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0)
          goto LABEL_69;
        v38 += 7;
        v16 = v39++ >= 9;
        if (v16)
        {
          v40 = 0;
          goto LABEL_71;
        }
      }
      v4[*v8] = 1;
LABEL_69:
      if (v4[*v8])
        v40 = 0;
LABEL_71:
      v44 = v40 != 0;
      v45 = 18;
LABEL_72:
      *((_BYTE *)&v5->super.super.isa + v45) = v44;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_75:
    v47 = 0;
  else
LABEL_76:
    v47 = v5;

  return v47;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasIsSleepAlarm)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  if (self->_alarmID)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasEnabled)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMClockAlarm writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMClockAlarm)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  BMClockAlarm *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSleepAlarm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v35 = 0;
            v13 = 0;
            goto LABEL_38;
          }
          v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v25 = *MEMORY[0x1E0D025B8];
          v43 = *MEMORY[0x1E0CB2D50];
          v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("eventType"));
          v44 = v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v25, 2, v14);
          v35 = 0;
          v13 = 0;
          *v31 = v26;
          goto LABEL_37;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMClockAlarmEventTypeFromString(v9));
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v35 = v10;
    }
    else
    {
      v35 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("alarmID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v8;
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v31)
        {
          v33 = 0;
          v13 = 0;
          goto LABEL_37;
        }
        v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v18 = *MEMORY[0x1E0D025B8];
        v41 = *MEMORY[0x1E0CB2D50];
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("alarmID"));
        v42 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v18, 2, v15);
        v33 = 0;
        v13 = 0;
        *v31 = v19;
LABEL_36:

        v8 = v32;
LABEL_37:

        goto LABEL_38;
      }
      v33 = v14;
    }
    else
    {
      v33 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastEventType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v15;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v31)
          {
            v16 = 0;
            v13 = 0;
            goto LABEL_36;
          }
          v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v28 = *MEMORY[0x1E0D025B8];
          v39 = *MEMORY[0x1E0CB2D50];
          v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("lastEventType"));
          v40 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 0;
          v13 = 0;
          *v31 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v28, 2, v20);
          goto LABEL_35;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMClockAlarmLastEventTypeFromString(v15));
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v17;
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v31)
        {
          v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v27 = *MEMORY[0x1E0D025B8];
          v37 = *MEMORY[0x1E0CB2D50];
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("enabled"));
          v38 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *v31 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v27, 2, v24);

        }
        v21 = 0;
        v13 = 0;
        goto LABEL_35;
      }
      v21 = v20;
    }
    else
    {
      v21 = 0;
    }
    v13 = -[BMClockAlarm initWithIsSleepAlarm:eventType:alarmID:lastEventType:enabled:](self, "initWithIsSleepAlarm:eventType:alarmID:lastEventType:enabled:", v32, objc_msgSend(v35, "intValue"), v33, objc_msgSend(v16, "intValue"), v21);
    self = v13;
LABEL_35:

    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v8 = 0;
    v13 = 0;
    goto LABEL_39;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0D025B8];
  v45 = *MEMORY[0x1E0CB2D50];
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isSleepAlarm"));
  v46[0] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v13 = 0;
  *a4 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 2, v9);
LABEL_38:

LABEL_39:
  return v13;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  if (-[BMClockAlarm hasIsSleepAlarm](self, "hasIsSleepAlarm"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMClockAlarm isSleepAlarm](self, "isSleepAlarm"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMClockAlarm eventType](self, "eventType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMClockAlarm alarmID](self, "alarmID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMClockAlarm lastEventType](self, "lastEventType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMClockAlarm hasEnabled](self, "hasEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMClockAlarm enabled](self, "enabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v17 = CFSTR("isSleepAlarm");
  v8 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v8;
  v22[0] = v8;
  v18 = CFSTR("eventType");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v9;
  v19 = CFSTR("alarmID");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v10;
  v20 = CFSTR("lastEventType");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v11;
  v21 = CFSTR("enabled");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
      goto LABEL_19;
  }
  else
  {

    if (v6)
    {
LABEL_19:
      if (v5)
        goto LABEL_20;
      goto LABEL_25;
    }
  }

  if (v5)
  {
LABEL_20:
    if (v4)
      goto LABEL_21;
LABEL_26:

    if (v3)
      goto LABEL_22;
LABEL_27:

    goto LABEL_22;
  }
LABEL_25:

  if (!v4)
    goto LABEL_26;
LABEL_21:
  if (!v3)
    goto LABEL_27;
LABEL_22:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  _BOOL4 v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMClockAlarm hasIsSleepAlarm](self, "hasIsSleepAlarm") || objc_msgSend(v5, "hasIsSleepAlarm"))
    {
      if (!-[BMClockAlarm hasIsSleepAlarm](self, "hasIsSleepAlarm"))
        goto LABEL_19;
      if (!objc_msgSend(v5, "hasIsSleepAlarm"))
        goto LABEL_19;
      v6 = -[BMClockAlarm isSleepAlarm](self, "isSleepAlarm");
      if (v6 != objc_msgSend(v5, "isSleepAlarm"))
        goto LABEL_19;
    }
    v7 = -[BMClockAlarm eventType](self, "eventType");
    if (v7 != objc_msgSend(v5, "eventType"))
      goto LABEL_19;
    -[BMClockAlarm alarmID](self, "alarmID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alarmID");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v9)
    {

    }
    else
    {
      v10 = (void *)v9;
      -[BMClockAlarm alarmID](self, "alarmID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "alarmID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_19;
    }
    v15 = -[BMClockAlarm lastEventType](self, "lastEventType");
    if (v15 == objc_msgSend(v5, "lastEventType"))
    {
      if (!-[BMClockAlarm hasEnabled](self, "hasEnabled") && !objc_msgSend(v5, "hasEnabled"))
      {
        LOBYTE(v14) = 1;
        goto LABEL_20;
      }
      if (-[BMClockAlarm hasEnabled](self, "hasEnabled") && objc_msgSend(v5, "hasEnabled"))
      {
        v16 = -[BMClockAlarm enabled](self, "enabled");
        v14 = v16 ^ objc_msgSend(v5, "enabled") ^ 1;
LABEL_20:

        goto LABEL_21;
      }
    }
LABEL_19:
    LOBYTE(v14) = 0;
    goto LABEL_20;
  }
  LOBYTE(v14) = 0;
LABEL_21:

  return v14;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isSleepAlarm
{
  return self->_isSleepAlarm;
}

- (BOOL)hasIsSleepAlarm
{
  return self->_hasIsSleepAlarm;
}

- (void)setHasIsSleepAlarm:(BOOL)a3
{
  self->_hasIsSleepAlarm = a3;
}

- (int)eventType
{
  return self->_eventType;
}

- (NSString)alarmID
{
  return self->_alarmID;
}

- (int)lastEventType
{
  return self->_lastEventType;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)hasEnabled
{
  return self->_hasEnabled;
}

- (void)setHasEnabled:(BOOL)a3
{
  self->_hasEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmID, 0);
}

+ (unsigned)latestDataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  _DWORD *v8;

  v5 = a3;
  if (a4 == 2)
  {
    v6 = off_1E5E4A818;
  }
  else
  {
    if (a4 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4A820;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[5] = a4;

LABEL_7:
  return v8;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isSleepAlarm"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("alarmID"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("lastEventType"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("enabled"), 0, 0, 5, 12, 0);
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C138;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isSleepAlarm"), 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventType"), 2, 4, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("alarmID"), 3, 13, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("lastEventType"), 4, 4, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("enabled"), 5, 12, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
