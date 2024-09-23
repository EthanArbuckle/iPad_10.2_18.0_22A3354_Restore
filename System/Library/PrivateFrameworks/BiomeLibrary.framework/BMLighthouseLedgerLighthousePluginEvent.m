@implementation BMLighthouseLedgerLighthousePluginEvent

- (BMLighthouseLedgerLighthousePluginEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 performTaskStatus:(id)a6 performTrialTaskStatus:(id)a7 stop:(id)a8
{
  return -[BMLighthouseLedgerLighthousePluginEvent initWithTrialIdentifiers:contextID:timestamp:usePrivateUpload:performTaskStatus:performTrialTaskStatus:stop:](self, "initWithTrialIdentifiers:contextID:timestamp:usePrivateUpload:performTaskStatus:performTrialTaskStatus:stop:", a3, a4, a5, 0, a6, a7, a8);
}

- (BMLighthouseLedgerLighthousePluginEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 usePrivateUpload:(id)a6 performTaskStatus:(id)a7 performTrialTaskStatus:(id)a8 stop:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  BMLighthouseLedgerLighthousePluginEvent *v20;
  double v21;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v16 = a5;
  v17 = a6;
  v23 = a7;
  v18 = a8;
  v19 = a9;
  v26.receiver = self;
  v26.super_class = (Class)BMLighthouseLedgerLighthousePluginEvent;
  v20 = -[BMEventBase init](&v26, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v20->_trialIdentifiers, a3);
    objc_storeStrong((id *)&v20->_contextID, a4);
    if (v16)
    {
      v20->_hasRaw_timestamp = 1;
      objc_msgSend(v16, "timeIntervalSince1970");
    }
    else
    {
      v20->_hasRaw_timestamp = 0;
      v21 = -1.0;
    }
    v20->_raw_timestamp = v21;
    if (v17)
    {
      v20->_hasUsePrivateUpload = 1;
      v20->_usePrivateUpload = objc_msgSend(v17, "BOOLValue");
    }
    else
    {
      v20->_hasUsePrivateUpload = 0;
      v20->_usePrivateUpload = 0;
    }
    objc_storeStrong((id *)&v20->_performTaskStatus, a7);
    objc_storeStrong((id *)&v20->_performTrialTaskStatus, a8);
    objc_storeStrong((id *)&v20->_stop, a9);
  }

  return v20;
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
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMLighthouseLedgerLighthousePluginEvent trialIdentifiers](self, "trialIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerLighthousePluginEvent contextID](self, "contextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerLighthousePluginEvent timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMLighthouseLedgerLighthousePluginEvent usePrivateUpload](self, "usePrivateUpload"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerLighthousePluginEvent performTaskStatus](self, "performTaskStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerLighthousePluginEvent performTrialTaskStatus](self, "performTrialTaskStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerLighthousePluginEvent stop](self, "stop");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLighthouseLedgerLighthousePluginEvent with trialIdentifiers: %@, contextID: %@, timestamp: %@, usePrivateUpload: %@, performTaskStatus: %@, performTrialTaskStatus: %@, stop: %@"), v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLighthouseLedgerLighthousePluginEvent *v5;
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
  unint64_t v20;
  objc_class *v21;
  uint64_t v22;
  uint64_t v23;
  NSString *contextID;
  uint64_t v25;
  unint64_t v26;
  double v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  void *v35;
  BMLighthouseLedgerLighthousePluginEvent *v36;
  objc_super v38;
  uint64_t v39;
  uint64_t v40;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMLighthouseLedgerLighthousePluginEvent;
  v5 = -[BMEventBase init](&v38, sel_init);
  if (!v5)
    goto LABEL_59;
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
      v20 = v12 >> 3;
      if ((int)(v12 >> 3) > 100)
      {
        switch((_DWORD)v20)
        {
          case 'e':
            v39 = 0;
            v40 = 0;
            if ((PBReaderPlaceMark() & 1) == 0)
              goto LABEL_58;
            v21 = -[BMLighthouseLedgerLighthousePluginEventEventStatus initByReadFrom:]([BMLighthouseLedgerLighthousePluginEventEventStatus alloc], "initByReadFrom:", v4);
            if (!v21)
              goto LABEL_58;
            v22 = 56;
            break;
          case 'f':
            v39 = 0;
            v40 = 0;
            if ((PBReaderPlaceMark() & 1) == 0)
              goto LABEL_58;
            v21 = -[BMLighthouseLedgerLighthousePluginEventEventStatus initByReadFrom:]([BMLighthouseLedgerLighthousePluginEventEventStatus alloc], "initByReadFrom:", v4);
            if (!v21)
              goto LABEL_58;
            v22 = 64;
            break;
          case 'g':
            v39 = 0;
            v40 = 0;
            if ((PBReaderPlaceMark() & 1) == 0)
              goto LABEL_58;
            v21 = -[BMLighthouseLedgerLighthousePluginEventEventStatus initByReadFrom:]([BMLighthouseLedgerLighthousePluginEventEventStatus alloc], "initByReadFrom:", v4);
            if (!v21)
              goto LABEL_58;
            v22 = 72;
            break;
          default:
LABEL_48:
            if (!PBReaderSkipValueWithTag())
              goto LABEL_58;
            continue;
        }
LABEL_47:
        v35 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = v21;

        PBReaderRecallMark();
      }
      else
      {
        switch((int)v20)
        {
          case 1:
            v39 = 0;
            v40 = 0;
            if ((PBReaderPlaceMark() & 1) == 0)
              goto LABEL_58;
            v21 = -[BMLighthouseLedgerTrialIdentifiers initByReadFrom:]([BMLighthouseLedgerTrialIdentifiers alloc], "initByReadFrom:", v4);
            if (!v21)
              goto LABEL_58;
            v22 = 40;
            goto LABEL_47;
          case 2:
            PBReaderReadString();
            v23 = objc_claimAutoreleasedReturnValue();
            contextID = v5->_contextID;
            v5->_contextID = (NSString *)v23;

            continue;
          case 3:
            v5->_hasRaw_timestamp = 1;
            v25 = *v6;
            v26 = *(_QWORD *)&v4[v25];
            if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)&v4[*v7])
            {
              v27 = *(double *)(*(_QWORD *)&v4[*v9] + v26);
              *(_QWORD *)&v4[v25] = v26 + 8;
            }
            else
            {
              v4[*v8] = 1;
              v27 = 0.0;
            }
            v5->_raw_timestamp = v27;
            continue;
          case 4:
            v28 = 0;
            v29 = 0;
            v30 = 0;
            v5->_hasUsePrivateUpload = 1;
            break;
          default:
            goto LABEL_48;
        }
        while (1)
        {
          v31 = *v6;
          v32 = *(_QWORD *)&v4[v31];
          v33 = v32 + 1;
          if (v32 == -1 || v33 > *(_QWORD *)&v4[*v7])
            break;
          v34 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
          *(_QWORD *)&v4[v31] = v33;
          v30 |= (unint64_t)(v34 & 0x7F) << v28;
          if ((v34 & 0x80) == 0)
            goto LABEL_51;
          v28 += 7;
          v17 = v29++ >= 9;
          if (v17)
          {
            v30 = 0;
            goto LABEL_53;
          }
        }
        v4[*v8] = 1;
LABEL_51:
        if (v4[*v8])
          v30 = 0;
LABEL_53:
        v5->_usePrivateUpload = v30 != 0;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_58:
    v36 = 0;
  else
LABEL_59:
    v36 = v5;

  return v36;
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
  if (self->_hasUsePrivateUpload)
    PBDataWriterWriteBOOLField();
  if (self->_performTaskStatus)
  {
    PBDataWriterPlaceMark();
    -[BMLighthouseLedgerLighthousePluginEventEventStatus writeTo:](self->_performTaskStatus, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_performTrialTaskStatus)
  {
    PBDataWriterPlaceMark();
    -[BMLighthouseLedgerLighthousePluginEventEventStatus writeTo:](self->_performTrialTaskStatus, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_stop)
  {
    PBDataWriterPlaceMark();
    -[BMLighthouseLedgerLighthousePluginEventEventStatus writeTo:](self->_stop, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLighthouseLedgerLighthousePluginEvent writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLighthouseLedgerLighthousePluginEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMLighthouseLedgerTrialIdentifiers *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BMLighthouseLedgerLighthousePluginEventEventStatus *v15;
  id v16;
  BMLighthouseLedgerLighthousePluginEventEventStatus *v17;
  BMLighthouseLedgerLighthousePluginEvent *v18;
  id v19;
  void *v20;
  objc_class *v21;
  id v22;
  id v23;
  double v24;
  double v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  id *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id *v59;
  BMLighthouseLedgerTrialIdentifiers *v60;
  void *v61;
  BMLighthouseLedgerLighthousePluginEventEventStatus *v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  BMLighthouseLedgerLighthousePluginEvent *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  BMLighthouseLedgerLighthousePluginEventEventStatus *v75;
  uint64_t v76;
  BMLighthouseLedgerLighthousePluginEventEventStatus *v77;
  uint64_t v78;
  BMLighthouseLedgerLighthousePluginEventEventStatus *v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  _QWORD v87[3];

  v87[1] = *MEMORY[0x1E0C80C00];
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
    v10 = v7;
    v73 = 0;
    v8 = -[BMLighthouseLedgerTrialIdentifiers initWithJSONDictionary:error:]([BMLighthouseLedgerTrialIdentifiers alloc], "initWithJSONDictionary:error:", v10, &v73);
    v19 = v73;
    if (v19)
    {
      v20 = v19;
      if (a4)
        *a4 = objc_retainAutorelease(v19);

      v18 = 0;
      goto LABEL_76;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contextID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v18 = 0;
          goto LABEL_75;
        }
        v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = *MEMORY[0x1E0D025B8];
        v84 = *MEMORY[0x1E0CB2D50];
        v68 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contextID"));
        v85 = v68;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
        v34 = a4;
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 0;
        v18 = 0;
        *v34 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v33, 2, v11);
LABEL_74:

LABEL_75:
        goto LABEL_76;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v9;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = (objc_class *)MEMORY[0x1E0C99D68];
        v22 = v11;
        v23 = [v21 alloc];
        objc_msgSend(v22, "doubleValue");
        v25 = v24;

        v68 = (id)objc_msgSend(v23, "initWithTimeIntervalSince1970:", v25);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v35 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v35, "dateFromString:", v11);
          v68 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v59)
            {
              v68 = 0;
              v18 = 0;
              goto LABEL_74;
            }
            v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v63 = *MEMORY[0x1E0D025B8];
            v82 = *MEMORY[0x1E0CB2D50];
            v64 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("timestamp"));
            v83 = v64;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v63, 2, v12);
            v68 = 0;
            v18 = 0;
            *v59 = v49;
            goto LABEL_73;
          }
          v68 = v11;
        }
      }
    }
    else
    {
      v68 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("usePrivateUpload"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = self;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v59)
        {
          v64 = 0;
          v18 = 0;
          goto LABEL_73;
        }
        v66 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v36 = v10;
        v37 = *MEMORY[0x1E0D025B8];
        v80 = *MEMORY[0x1E0CB2D50];
        v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("usePrivateUpload"));
        v81 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = v37;
        v10 = v36;
        v62 = (BMLighthouseLedgerLighthousePluginEventEventStatus *)v38;
        v40 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", v39, 2);
        v18 = 0;
        v64 = 0;
        *v59 = v40;
        goto LABEL_71;
      }
      v64 = v12;
    }
    else
    {
      v64 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("performTaskStatus"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v8;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v59)
        {
          v18 = 0;
          goto LABEL_72;
        }
        v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v51 = *MEMORY[0x1E0D025B8];
        v78 = *MEMORY[0x1E0CB2D50];
        v43 = v10;
        v44 = objc_alloc(MEMORY[0x1E0CB3940]);
        v50 = objc_opt_class();
        v45 = v44;
        v10 = v43;
        v62 = (BMLighthouseLedgerLighthousePluginEventEventStatus *)objc_msgSend(v45, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v50, CFSTR("performTaskStatus"));
        v79 = v62;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *v59 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v51, 2, v46);

        v18 = 0;
        v26 = v13;
LABEL_71:

        v13 = v26;
LABEL_72:

        self = v67;
LABEL_73:

        v9 = v61;
        goto LABEL_74;
      }
      v26 = v13;
      v72 = 0;
      v62 = -[BMLighthouseLedgerLighthousePluginEventEventStatus initWithJSONDictionary:error:]([BMLighthouseLedgerLighthousePluginEventEventStatus alloc], "initWithJSONDictionary:error:", v26, &v72);
      v27 = v72;
      if (v27)
      {
        v28 = v27;
        if (v59)
          *v59 = objc_retainAutorelease(v27);

        v18 = 0;
        goto LABEL_71;
      }

    }
    else
    {
      v62 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("performTrialTaskStatus"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v10;
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v59)
        {
          v18 = 0;
          goto LABEL_70;
        }
        v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v52 = *MEMORY[0x1E0D025B8];
        v76 = *MEMORY[0x1E0CB2D50];
        v15 = (BMLighthouseLedgerLighthousePluginEventEventStatus *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("performTrialTaskStatus"));
        v77 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        *v59 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v52, 2, v16);
LABEL_69:

        v8 = v60;
        v10 = v58;
LABEL_70:

        v26 = v13;
        goto LABEL_71;
      }
      v16 = v14;
      v71 = 0;
      v15 = -[BMLighthouseLedgerLighthousePluginEventEventStatus initWithJSONDictionary:error:]([BMLighthouseLedgerLighthousePluginEventEventStatus alloc], "initWithJSONDictionary:error:", v16, &v71);
      v31 = v71;
      if (v31)
      {
        v32 = v31;
        if (v59)
          *v59 = objc_retainAutorelease(v31);

        goto LABEL_78;
      }

    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stop"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v17 = 0;
LABEL_22:
      v18 = -[BMLighthouseLedgerLighthousePluginEvent initWithTrialIdentifiers:contextID:timestamp:usePrivateUpload:performTaskStatus:performTrialTaskStatus:stop:](v67, "initWithTrialIdentifiers:contextID:timestamp:usePrivateUpload:performTaskStatus:performTrialTaskStatus:stop:", v60, v58, v68, v64, v62, v15, v17);
      v67 = v18;
LABEL_68:

      goto LABEL_69;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v70 = 0;
      v54 = v16;
      v17 = -[BMLighthouseLedgerLighthousePluginEventEventStatus initWithJSONDictionary:error:]([BMLighthouseLedgerLighthousePluginEventEventStatus alloc], "initWithJSONDictionary:error:", v54, &v70);
      v41 = v70;
      if (!v41)
      {

        goto LABEL_22;
      }
      v42 = v41;
      if (v59)
        *v59 = objc_retainAutorelease(v41);

LABEL_67:
      v18 = 0;
      goto LABEL_68;
    }
    if (v59)
    {
      v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v53 = *MEMORY[0x1E0D025B8];
      v74 = *MEMORY[0x1E0CB2D50];
      v17 = (BMLighthouseLedgerLighthousePluginEventEventStatus *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("stop"));
      v75 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *v59 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v53, 2, v47);

      goto LABEL_67;
    }
LABEL_78:
    v18 = 0;
    goto LABEL_69;
  }
  if (a4)
  {
    v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v30 = *MEMORY[0x1E0D025B8];
    v86 = *MEMORY[0x1E0CB2D50];
    v87[0] = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("trialIdentifiers"));
    v8 = (BMLighthouseLedgerTrialIdentifiers *)v87[0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, &v86, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    *a4 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v10);
LABEL_76:

    goto LABEL_77;
  }
  v18 = 0;
LABEL_77:

  return v18;
}

- (id)jsonDictionary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[7];
  _QWORD v31[9];

  v31[7] = *MEMORY[0x1E0C80C00];
  -[BMLighthouseLedgerLighthousePluginEvent trialIdentifiers](self, "trialIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMLighthouseLedgerLighthousePluginEvent contextID](self, "contextID");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerLighthousePluginEvent timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLighthouseLedgerLighthousePluginEvent timestamp](self, "timestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    objc_msgSend(v7, "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }

  if (-[BMLighthouseLedgerLighthousePluginEvent hasUsePrivateUpload](self, "hasUsePrivateUpload"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMLighthouseLedgerLighthousePluginEvent usePrivateUpload](self, "usePrivateUpload"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[BMLighthouseLedgerLighthousePluginEvent performTaskStatus](self, "performTaskStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "jsonDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMLighthouseLedgerLighthousePluginEvent performTrialTaskStatus](self, "performTrialTaskStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "jsonDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMLighthouseLedgerLighthousePluginEvent stop](self, "stop");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "jsonDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = CFSTR("trialIdentifiers");
  v16 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v16;
  v31[0] = v16;
  v30[1] = CFSTR("contextID");
  v17 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v17;
  v31[1] = v17;
  v30[2] = CFSTR("timestamp");
  v18 = v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v4;
  v31[2] = v18;
  v30[3] = CFSTR("usePrivateUpload");
  v19 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v5;
  v31[3] = v19;
  v30[4] = CFSTR("performTaskStatus");
  v20 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[4] = v20;
  v30[5] = CFSTR("performTrialTaskStatus");
  v21 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[5] = v21;
  v30[6] = CFSTR("stop");
  v22 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[6] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (v13)
      goto LABEL_23;
LABEL_31:

    if (v11)
      goto LABEL_24;
    goto LABEL_32;
  }

  if (!v13)
    goto LABEL_31;
LABEL_23:
  if (v11)
    goto LABEL_24;
LABEL_32:

LABEL_24:
  if (!v9)

  if (v29)
  {
    if (v27)
      goto LABEL_28;
LABEL_34:

    if (v28)
      goto LABEL_29;
LABEL_35:

    goto LABEL_29;
  }

  if (!v27)
    goto LABEL_34;
LABEL_28:
  if (!v28)
    goto LABEL_35;
LABEL_29:

  return v23;
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
  char v12;
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
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMLighthouseLedgerLighthousePluginEvent trialIdentifiers](self, "trialIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trialIdentifiers");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMLighthouseLedgerLighthousePluginEvent trialIdentifiers](self, "trialIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trialIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_26;
    }
    -[BMLighthouseLedgerLighthousePluginEvent contextID](self, "contextID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMLighthouseLedgerLighthousePluginEvent contextID](self, "contextID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contextID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_26;
    }
    -[BMLighthouseLedgerLighthousePluginEvent timestamp](self, "timestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMLighthouseLedgerLighthousePluginEvent timestamp](self, "timestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_26;
    }
    if (-[BMLighthouseLedgerLighthousePluginEvent hasUsePrivateUpload](self, "hasUsePrivateUpload")
      || objc_msgSend(v5, "hasUsePrivateUpload"))
    {
      if (!-[BMLighthouseLedgerLighthousePluginEvent hasUsePrivateUpload](self, "hasUsePrivateUpload"))
        goto LABEL_26;
      if (!objc_msgSend(v5, "hasUsePrivateUpload"))
        goto LABEL_26;
      v25 = -[BMLighthouseLedgerLighthousePluginEvent usePrivateUpload](self, "usePrivateUpload");
      if (v25 != objc_msgSend(v5, "usePrivateUpload"))
        goto LABEL_26;
    }
    -[BMLighthouseLedgerLighthousePluginEvent performTaskStatus](self, "performTaskStatus");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performTaskStatus");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[BMLighthouseLedgerLighthousePluginEvent performTaskStatus](self, "performTaskStatus");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "performTaskStatus");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_26;
    }
    -[BMLighthouseLedgerLighthousePluginEvent performTrialTaskStatus](self, "performTrialTaskStatus");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performTrialTaskStatus");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v32 == (void *)v33)
    {

    }
    else
    {
      v34 = (void *)v33;
      -[BMLighthouseLedgerLighthousePluginEvent performTrialTaskStatus](self, "performTrialTaskStatus");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "performTrialTaskStatus");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqual:", v36);

      if (!v37)
      {
LABEL_26:
        v12 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    -[BMLighthouseLedgerLighthousePluginEvent stop](self, "stop");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stop");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39 == v40)
    {
      v12 = 1;
    }
    else
    {
      -[BMLighthouseLedgerLighthousePluginEvent stop](self, "stop");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stop");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v41, "isEqual:", v42);

    }
    goto LABEL_27;
  }
  v12 = 0;
LABEL_28:

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

- (BOOL)usePrivateUpload
{
  return self->_usePrivateUpload;
}

- (BOOL)hasUsePrivateUpload
{
  return self->_hasUsePrivateUpload;
}

- (void)setHasUsePrivateUpload:(BOOL)a3
{
  self->_hasUsePrivateUpload = a3;
}

- (BMLighthouseLedgerLighthousePluginEventEventStatus)performTaskStatus
{
  return self->_performTaskStatus;
}

- (BMLighthouseLedgerLighthousePluginEventEventStatus)performTrialTaskStatus
{
  return self->_performTrialTaskStatus;
}

- (BMLighthouseLedgerLighthousePluginEventEventStatus)stop
{
  return self->_stop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stop, 0);
  objc_storeStrong((id *)&self->_performTrialTaskStatus, 0);
  objc_storeStrong((id *)&self->_performTaskStatus, 0);
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

    v4 = -[BMLighthouseLedgerLighthousePluginEvent initByReadFrom:]([BMLighthouseLedgerLighthousePluginEvent alloc], "initByReadFrom:", v7);
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
  void *v8;
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("trialIdentifiers_json"), 5, 1, &__block_literal_global_14755);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contextID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timestamp"), 3, 0, 3, 0, 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("usePrivateUpload"), 0, 0, 4, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("performTaskStatus_json"), 5, 1, &__block_literal_global_159_14756);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("performTrialTaskStatus_json"), 5, 1, &__block_literal_global_160);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("stop_json"), 5, 1, &__block_literal_global_161);
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B688;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("trialIdentifiers"), 1, 14, objc_opt_class());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contextID"), 2, 13, 0, v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timestamp"), 3, 0, 0);
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("usePrivateUpload"), 4, 12, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("performTaskStatus"), 101, 14, objc_opt_class());
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("performTrialTaskStatus"), 102, 14, objc_opt_class());
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stop"), 103, 14, objc_opt_class());
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __50__BMLighthouseLedgerLighthousePluginEvent_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __50__BMLighthouseLedgerLighthousePluginEvent_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performTrialTaskStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __50__BMLighthouseLedgerLighthousePluginEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performTaskStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __50__BMLighthouseLedgerLighthousePluginEvent_columns__block_invoke(uint64_t a1, void *a2)
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
