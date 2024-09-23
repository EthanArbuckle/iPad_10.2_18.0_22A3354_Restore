@implementation BMLighthouseLedgerTrialdEvent

- (BMLighthouseLedgerTrialdEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 eventType:(int)a6 eventSucceeded:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMLighthouseLedgerTrialdEvent *v17;
  double v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMLighthouseLedgerTrialdEvent;
  v17 = -[BMEventBase init](&v20, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_trialIdentifiers, a3);
    objc_storeStrong((id *)&v17->_contextID, a4);
    if (v15)
    {
      v17->_hasRaw_timestamp = 1;
      objc_msgSend(v15, "timeIntervalSince1970");
    }
    else
    {
      v17->_hasRaw_timestamp = 0;
      v18 = -1.0;
    }
    v17->_raw_timestamp = v18;
    v17->_eventType = a6;
    if (v16)
    {
      v17->_hasEventSucceeded = 1;
      v17->_eventSucceeded = objc_msgSend(v16, "BOOLValue");
    }
    else
    {
      v17->_hasEventSucceeded = 0;
      v17->_eventSucceeded = 0;
    }
  }

  return v17;
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
  -[BMLighthouseLedgerTrialdEvent trialIdentifiers](self, "trialIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerTrialdEvent contextID](self, "contextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerTrialdEvent timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMLighthouseLedgerTrialdEventEventTypeAsString(-[BMLighthouseLedgerTrialdEvent eventType](self, "eventType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMLighthouseLedgerTrialdEvent eventSucceeded](self, "eventSucceeded"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLighthouseLedgerTrialdEvent with trialIdentifiers: %@, contextID: %@, timestamp: %@, eventType: %@, eventSucceeded: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLighthouseLedgerTrialdEvent *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  BMLighthouseLedgerTrialIdentifiers *v20;
  BMLighthouseLedgerTrialIdentifiers *trialIdentifiers;
  uint64_t v22;
  NSString *contextID;
  uint64_t v24;
  unint64_t v25;
  double v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  BMLighthouseLedgerTrialdEvent *v41;
  objc_super v43;
  uint64_t v44;
  uint64_t v45;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMLighthouseLedgerTrialdEvent;
  v5 = -[BMEventBase init](&v43, sel_init);
  if (!v5)
    goto LABEL_58;
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
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v7])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v17 = v11++ >= 9;
        if (v17)
        {
          v12 = 0;
          v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v18 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v18 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          v44 = 0;
          v45 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_57;
          v20 = -[BMLighthouseLedgerTrialIdentifiers initByReadFrom:]([BMLighthouseLedgerTrialIdentifiers alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_57;
          trialIdentifiers = v5->_trialIdentifiers;
          v5->_trialIdentifiers = v20;

          PBReaderRecallMark();
          break;
        case 2u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          contextID = v5->_contextID;
          v5->_contextID = (NSString *)v22;

          break;
        case 3u:
          v5->_hasRaw_timestamp = 1;
          v24 = *v6;
          v25 = *(_QWORD *)&v4[v24];
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v26 = *(double *)(*(_QWORD *)&v4[*v9] + v25);
            *(_QWORD *)&v4[v24] = v25 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v26 = 0.0;
          }
          v5->_raw_timestamp = v26;
          break;
        case 4u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          while (1)
          {
            v30 = *v6;
            v31 = *(_QWORD *)&v4[v30];
            v32 = v31 + 1;
            if (v31 == -1 || v32 > *(_QWORD *)&v4[*v7])
              break;
            v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
            *(_QWORD *)&v4[v30] = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if ((v33 & 0x80) == 0)
              goto LABEL_44;
            v27 += 7;
            v17 = v28++ >= 9;
            if (v17)
            {
              LODWORD(v29) = 0;
              goto LABEL_46;
            }
          }
          v4[*v8] = 1;
LABEL_44:
          if (v4[*v8])
            LODWORD(v29) = 0;
LABEL_46:
          if (v29 >= 4)
            LODWORD(v29) = 0;
          v5->_eventType = v29;
          break;
        case 5u:
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v5->_hasEventSucceeded = 1;
          while (1)
          {
            v37 = *v6;
            v38 = *(_QWORD *)&v4[v37];
            v39 = v38 + 1;
            if (v38 == -1 || v39 > *(_QWORD *)&v4[*v7])
              break;
            v40 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v38);
            *(_QWORD *)&v4[v37] = v39;
            v36 |= (unint64_t)(v40 & 0x7F) << v34;
            if ((v40 & 0x80) == 0)
              goto LABEL_50;
            v34 += 7;
            v17 = v35++ >= 9;
            if (v17)
            {
              v36 = 0;
              goto LABEL_52;
            }
          }
          v4[*v8] = 1;
LABEL_50:
          if (v4[*v8])
            v36 = 0;
LABEL_52:
          v5->_eventSucceeded = v36 != 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_57;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_57:
    v41 = 0;
  else
LABEL_58:
    v41 = v5;

  return v41;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_trialIdentifiers)
  {
    PBDataWriterPlaceMark();
    -[BMLighthouseLedgerTrialIdentifiers writeTo:](self->_trialIdentifiers, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_contextID)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_timestamp)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  if (self->_hasEventSucceeded)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLighthouseLedgerTrialdEvent writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLighthouseLedgerTrialdEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMLighthouseLedgerTrialIdentifiers *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  BMLighthouseLedgerTrialdEvent *v14;
  objc_class *v15;
  id *v16;
  id v17;
  id v18;
  double v19;
  double v20;
  id v21;
  id *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  id *v29;
  void *v30;
  id v31;
  void *v32;
  id *v34;
  void *v35;
  void *v36;
  id *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id *v42;
  id v43;
  id v44;
  id *v45;
  void *v46;
  BMLighthouseLedgerTrialIdentifiers *v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trialIdentifiers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v7;
    v50 = 0;
    v8 = -[BMLighthouseLedgerTrialIdentifiers initWithJSONDictionary:error:]([BMLighthouseLedgerTrialIdentifiers alloc], "initWithJSONDictionary:error:", v11, &v50);
    v12 = v50;
    if (v12)
    {
      v13 = v12;
      if (a4)
        *a4 = objc_retainAutorelease(v12);

      v14 = 0;
      goto LABEL_42;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contextID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v14 = 0;
          goto LABEL_41;
        }
        v42 = a4;
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v57 = *MEMORY[0x1E0CB2D50];
        v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contextID"));
        v58 = v48;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0;
        v14 = 0;
        *v42 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v10);
LABEL_40:

        v11 = v49;
LABEL_41:

        goto LABEL_42;
      }
      v49 = v9;
    }
    else
    {
      v49 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v9;
    v47 = v8;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (objc_class *)MEMORY[0x1E0C99D68];
        v16 = a4;
        v17 = v10;
        v18 = [v15 alloc];
        objc_msgSend(v17, "doubleValue");
        v20 = v19;

        a4 = v16;
        v21 = (id)objc_msgSend(v18, "initWithTimeIntervalSince1970:", v20);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v27, "dateFromString:", v10);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_26;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v48 = 0;
            v14 = 0;
            goto LABEL_40;
          }
          v45 = a4;
          v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v39 = *MEMORY[0x1E0D025B8];
          v55 = *MEMORY[0x1E0CB2D50];
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("timestamp"));
          v56 = v30;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0;
          v14 = 0;
          *v45 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2, v28);
          goto LABEL_39;
        }
        v21 = v10;
      }
      v48 = v21;
    }
    else
    {
      v48 = 0;
    }
LABEL_26:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = a4;
    if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = v28;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v30 = 0;
            v14 = 0;
            goto LABEL_39;
          }
          v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v41 = *MEMORY[0x1E0D025B8];
          v53 = *MEMORY[0x1E0CB2D50];
          v37 = a4;
          v29 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("eventType"));
          v54 = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          v14 = 0;
          *v37 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v41, 2, v32);
          goto LABEL_38;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLighthouseLedgerTrialdEventEventTypeFromString(v28));
        v31 = (id)objc_claimAutoreleasedReturnValue();
      }
      v30 = v31;
    }
    else
    {
      v30 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventSucceeded"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v29)
        {
          v34 = v29;
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v40 = *MEMORY[0x1E0D025B8];
          v51 = *MEMORY[0x1E0CB2D50];
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("eventSucceeded"));
          v52 = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *v34 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v40, 2, v36);

          v29 = 0;
        }
        v14 = 0;
        goto LABEL_38;
      }
      v29 = v32;
    }
    else
    {
      v29 = 0;
    }
    v14 = -[BMLighthouseLedgerTrialdEvent initWithTrialIdentifiers:contextID:timestamp:eventType:eventSucceeded:](self, "initWithTrialIdentifiers:contextID:timestamp:eventType:eventSucceeded:", v47, v49, v48, objc_msgSend(v30, "intValue"), v29);
    self = v14;
LABEL_38:

LABEL_39:
    v9 = v46;
    v8 = v47;
    goto LABEL_40;
  }
  if (!a4)
  {
    v14 = 0;
    goto LABEL_43;
  }
  v22 = a4;
  v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v24 = *MEMORY[0x1E0D025B8];
  v59 = *MEMORY[0x1E0CB2D50];
  v8 = (BMLighthouseLedgerTrialIdentifiers *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("trialIdentifiers"));
  v60[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  *v22 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v11);
LABEL_42:

LABEL_43:
  return v14;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  -[BMLighthouseLedgerTrialdEvent trialIdentifiers](self, "trialIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMLighthouseLedgerTrialdEvent contextID](self, "contextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerTrialdEvent timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLighthouseLedgerTrialdEvent timestamp](self, "timestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseLedgerTrialdEvent eventType](self, "eventType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMLighthouseLedgerTrialdEvent hasEventSucceeded](self, "hasEventSucceeded"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMLighthouseLedgerTrialdEvent eventSucceeded](self, "eventSucceeded"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v21 = CFSTR("trialIdentifiers");
  v12 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v19 = v12;
  v26[0] = v12;
  v22 = CFSTR("contextID");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v12, v21, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[1] = v13;
  v23 = CFSTR("timestamp");
  v14 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[2] = v14;
  v24 = CFSTR("eventType");
  v15 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[3] = v15;
  v25 = CFSTR("eventSucceeded");
  v16 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v21, 5, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_19;
  }
  else
  {

    if (v10)
    {
LABEL_19:
      if (v9)
        goto LABEL_20;
      goto LABEL_25;
    }
  }

  if (v9)
  {
LABEL_20:
    if (v5)
      goto LABEL_21;
LABEL_26:

    if (v4)
      goto LABEL_22;
LABEL_27:

    goto LABEL_22;
  }
LABEL_25:

  if (!v5)
    goto LABEL_26;
LABEL_21:
  if (!v4)
    goto LABEL_27;
LABEL_22:

  return v17;
}

- (NSDate)timestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_timestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_timestamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  _BOOL4 v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMLighthouseLedgerTrialdEvent trialIdentifiers](self, "trialIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trialIdentifiers");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMLighthouseLedgerTrialdEvent trialIdentifiers](self, "trialIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trialIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_21;
    }
    -[BMLighthouseLedgerTrialdEvent contextID](self, "contextID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMLighthouseLedgerTrialdEvent contextID](self, "contextID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contextID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_21;
    }
    -[BMLighthouseLedgerTrialdEvent timestamp](self, "timestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMLighthouseLedgerTrialdEvent timestamp](self, "timestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_21;
    }
    v25 = -[BMLighthouseLedgerTrialdEvent eventType](self, "eventType");
    if (v25 == objc_msgSend(v5, "eventType"))
    {
      if (!-[BMLighthouseLedgerTrialdEvent hasEventSucceeded](self, "hasEventSucceeded")
        && !objc_msgSend(v5, "hasEventSucceeded"))
      {
        LOBYTE(v12) = 1;
        goto LABEL_22;
      }
      if (-[BMLighthouseLedgerTrialdEvent hasEventSucceeded](self, "hasEventSucceeded")
        && objc_msgSend(v5, "hasEventSucceeded"))
      {
        v26 = -[BMLighthouseLedgerTrialdEvent eventSucceeded](self, "eventSucceeded");
        v12 = v26 ^ objc_msgSend(v5, "eventSucceeded") ^ 1;
LABEL_22:

        goto LABEL_23;
      }
    }
LABEL_21:
    LOBYTE(v12) = 0;
    goto LABEL_22;
  }
  LOBYTE(v12) = 0;
LABEL_23:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMLighthouseLedgerTrialIdentifiers)trialIdentifiers
{
  return self->_trialIdentifiers;
}

- (NSString)contextID
{
  return self->_contextID;
}

- (int)eventType
{
  return self->_eventType;
}

- (BOOL)eventSucceeded
{
  return self->_eventSucceeded;
}

- (BOOL)hasEventSucceeded
{
  return self->_hasEventSucceeded;
}

- (void)setHasEventSucceeded:(BOOL)a3
{
  self->_hasEventSucceeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_trialIdentifiers, 0);
}

+ (unsigned)latestDataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  _DWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D82B90];
    v6 = a3;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v4 = -[BMLighthouseLedgerTrialdEvent initByReadFrom:]([BMLighthouseLedgerTrialdEvent alloc], "initByReadFrom:", v7);
    v4[9] = 0;

  }
  return v4;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("trialIdentifiers_json"), 5, 1, &__block_literal_global_47_62704);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contextID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timestamp"), 3, 0, 3, 0, 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventType"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventSucceeded"), 0, 0, 5, 12, 0);
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
  return &unk_1E5F1ED30;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("trialIdentifiers"), 1, 14, objc_opt_class());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contextID"), 2, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timestamp"), 3, 0, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventType"), 4, 4, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventSucceeded"), 5, 12, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __40__BMLighthouseLedgerTrialdEvent_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trialIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
