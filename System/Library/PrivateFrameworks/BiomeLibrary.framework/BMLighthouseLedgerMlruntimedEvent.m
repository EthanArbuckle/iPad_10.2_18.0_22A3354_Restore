@implementation BMLighthouseLedgerMlruntimedEvent

- (BMLighthouseLedgerMlruntimedEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 activityScheduleStatus:(id)a6 taskFetched:(id)a7 taskScheduled:(id)a8 taskCompleted:(id)a9
{
  id v16;
  id v17;
  id v18;
  BMLighthouseLedgerMlruntimedEvent *v19;
  double v20;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v16 = a5;
  v23 = a6;
  v22 = a7;
  v17 = a8;
  v18 = a9;
  v26.receiver = self;
  v26.super_class = (Class)BMLighthouseLedgerMlruntimedEvent;
  v19 = -[BMEventBase init](&v26, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v22, v23, v24, v25);
    objc_storeStrong((id *)&v19->_trialIdentifiers, a3);
    objc_storeStrong((id *)&v19->_contextID, a4);
    if (v16)
    {
      v19->_hasRaw_timestamp = 1;
      objc_msgSend(v16, "timeIntervalSince1970");
    }
    else
    {
      v19->_hasRaw_timestamp = 0;
      v20 = -1.0;
    }
    v19->_raw_timestamp = v20;
    objc_storeStrong((id *)&v19->_activityScheduleStatus, a6);
    objc_storeStrong((id *)&v19->_taskFetched, a7);
    objc_storeStrong((id *)&v19->_taskScheduled, a8);
    objc_storeStrong((id *)&v19->_taskCompleted, a9);
  }

  return v19;
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
  -[BMLighthouseLedgerMlruntimedEvent trialIdentifiers](self, "trialIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerMlruntimedEvent contextID](self, "contextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerMlruntimedEvent timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerMlruntimedEvent activityScheduleStatus](self, "activityScheduleStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerMlruntimedEvent taskFetched](self, "taskFetched");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerMlruntimedEvent taskScheduled](self, "taskScheduled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerMlruntimedEvent taskCompleted](self, "taskCompleted");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLighthouseLedgerMlruntimedEvent with trialIdentifiers: %@, contextID: %@, timestamp: %@, activityScheduleStatus: %@, taskFetched: %@, taskScheduled: %@, taskCompleted: %@"), v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLighthouseLedgerMlruntimedEvent *v5;
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
  int v18;
  unint64_t v20;
  objc_class *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  void *v26;
  uint64_t v27;
  NSString *contextID;
  BMLighthouseLedgerMlruntimedEvent *v29;
  objc_super v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMLighthouseLedgerMlruntimedEvent;
  v5 = -[BMEventBase init](&v31, sel_init);
  if (!v5)
    goto LABEL_52;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (v4[*v8])
        goto LABEL_50;
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
        if (v11++ >= 9)
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
        goto LABEL_50;
      v20 = v12 >> 3;
      if ((int)(v12 >> 3) > 100)
        break;
      switch((_DWORD)v20)
      {
        case 1:
          v32 = 0;
          v33 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_51;
          v21 = -[BMLighthouseLedgerTrialIdentifiers initByReadFrom:]([BMLighthouseLedgerTrialIdentifiers alloc], "initByReadFrom:", v4);
          if (!v21)
            goto LABEL_51;
          v22 = 40;
          goto LABEL_42;
        case 2:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          contextID = v5->_contextID;
          v5->_contextID = (NSString *)v27;

          break;
        case 3:
          v5->_hasRaw_timestamp = 1;
          v23 = *v6;
          v24 = *(_QWORD *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v25 = *(double *)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v25 = 0.0;
          }
          v5->_raw_timestamp = v25;
          break;
        default:
LABEL_45:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_51;
          break;
      }
LABEL_43:
      if (*(_QWORD *)&v4[*v6] >= *(_QWORD *)&v4[*v7])
        goto LABEL_50;
    }
    switch((int)v20)
    {
      case 'e':
        v32 = 0;
        v33 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_51;
        v21 = -[BMLighthouseLedgerMlruntimedEventScheduleStatus initByReadFrom:]([BMLighthouseLedgerMlruntimedEventScheduleStatus alloc], "initByReadFrom:", v4);
        if (!v21)
          goto LABEL_51;
        v22 = 56;
        break;
      case 'f':
        v32 = 0;
        v33 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_51;
        v21 = -[BMLighthouseLedgerMlruntimedEventTaskEvent initByReadFrom:]([BMLighthouseLedgerMlruntimedEventTaskEvent alloc], "initByReadFrom:", v4);
        if (!v21)
          goto LABEL_51;
        v22 = 64;
        break;
      case 'g':
        v32 = 0;
        v33 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_51;
        v21 = -[BMLighthouseLedgerMlruntimedEventTaskEvent initByReadFrom:]([BMLighthouseLedgerMlruntimedEventTaskEvent alloc], "initByReadFrom:", v4);
        if (!v21)
          goto LABEL_51;
        v22 = 72;
        break;
      case 'h':
        v32 = 0;
        v33 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_51;
        v21 = -[BMLighthouseLedgerMlruntimedEventTaskEvent initByReadFrom:]([BMLighthouseLedgerMlruntimedEventTaskEvent alloc], "initByReadFrom:", v4);
        if (!v21)
          goto LABEL_51;
        v22 = 80;
        break;
      default:
        goto LABEL_45;
    }
LABEL_42:
    v26 = *(Class *)((char *)&v5->super.super.isa + v22);
    *(Class *)((char *)&v5->super.super.isa + v22) = v21;

    PBReaderRecallMark();
    goto LABEL_43;
  }
LABEL_50:
  if (v4[*v8])
LABEL_51:
    v29 = 0;
  else
LABEL_52:
    v29 = v5;

  return v29;
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
  if (self->_activityScheduleStatus)
  {
    PBDataWriterPlaceMark();
    -[BMLighthouseLedgerMlruntimedEventScheduleStatus writeTo:](self->_activityScheduleStatus, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_taskFetched)
  {
    PBDataWriterPlaceMark();
    -[BMLighthouseLedgerMlruntimedEventTaskEvent writeTo:](self->_taskFetched, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_taskScheduled)
  {
    PBDataWriterPlaceMark();
    -[BMLighthouseLedgerMlruntimedEventTaskEvent writeTo:](self->_taskScheduled, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_taskCompleted)
  {
    PBDataWriterPlaceMark();
    -[BMLighthouseLedgerMlruntimedEventTaskEvent writeTo:](self->_taskCompleted, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLighthouseLedgerMlruntimedEvent writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLighthouseLedgerMlruntimedEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMLighthouseLedgerTrialIdentifiers *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  BMLighthouseLedgerMlruntimedEvent *v14;
  id *v15;
  objc_class *v16;
  id v17;
  id v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  id *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  BMLighthouseLedgerMlruntimedEventTaskEvent *v33;
  id v34;
  BMLighthouseLedgerMlruntimedEventTaskEvent *v35;
  void *v36;
  id *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id *v59;
  id v60;
  uint64_t v61;
  id v62;
  void *v63;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  id *v76;
  id *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  BMLighthouseLedgerMlruntimedEventTaskEvent *v83;
  id v84;
  id v85;
  BMLighthouseLedgerMlruntimedEventScheduleStatus *v86;
  BMLighthouseLedgerTrialIdentifiers *v87;
  BMLighthouseLedgerMlruntimedEvent *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  uint64_t v95;
  BMLighthouseLedgerMlruntimedEventTaskEvent *v96;
  uint64_t v97;
  BMLighthouseLedgerMlruntimedEventTaskEvent *v98;
  uint64_t v99;
  BMLighthouseLedgerMlruntimedEventTaskEvent *v100;
  uint64_t v101;
  BMLighthouseLedgerMlruntimedEventScheduleStatus *v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  _QWORD v108[3];

  v108[1] = *MEMORY[0x1E0C80C00];
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
    v94 = 0;
    v8 = -[BMLighthouseLedgerTrialIdentifiers initWithJSONDictionary:error:]([BMLighthouseLedgerTrialIdentifiers alloc], "initWithJSONDictionary:error:", v10, &v94);
    v12 = v94;
    if (v12)
    {
      v13 = v12;
      if (a4)
        *a4 = objc_retainAutorelease(v12);

      v14 = 0;
      goto LABEL_83;
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
          v10 = 0;
          v14 = 0;
LABEL_82:

          goto LABEL_83;
        }
        v23 = a4;
        v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v25 = v9;
        v26 = *MEMORY[0x1E0D025B8];
        v105 = *MEMORY[0x1E0CB2D50];
        v89 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contextID"));
        v106 = v89;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v26;
        v9 = v25;
        v10 = 0;
        v14 = 0;
        *v23 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v28, 2, v27);
        v11 = (void *)v27;
LABEL_81:

        goto LABEL_82;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v8;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v79 = v7;
      v15 = a4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (objc_class *)MEMORY[0x1E0C99D68];
        v17 = v11;
        v18 = [v16 alloc];
        objc_msgSend(v17, "doubleValue");
        v20 = v19;

        v89 = (id)objc_msgSend(v18, "initWithTimeIntervalSince1970:", v20);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v29, "dateFromString:", v11);
          v89 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v89 = 0;
              v14 = 0;
              v7 = v79;
              goto LABEL_81;
            }
            v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v66 = v9;
            v67 = *MEMORY[0x1E0D025B8];
            v103 = *MEMORY[0x1E0CB2D50];
            v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("timestamp"));
            v104 = v38;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
            v68 = objc_claimAutoreleasedReturnValue();
            v69 = v67;
            v9 = v66;
            v86 = (BMLighthouseLedgerMlruntimedEventScheduleStatus *)v68;
            v89 = 0;
            v14 = 0;
            *a4 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v69, 2);
            goto LABEL_91;
          }
          v89 = v11;
        }
      }
      a4 = v15;
      v7 = v79;
    }
    else
    {
      v89 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activityScheduleStatus"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = self;
    if (!v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v86 = 0;
LABEL_33:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskFetched"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v10;
      if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v14 = 0;
            goto LABEL_77;
          }
          v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v57 = *MEMORY[0x1E0D025B8];
          v99 = *MEMORY[0x1E0CB2D50];
          v82 = v7;
          v58 = v11;
          v59 = a4;
          v83 = (BMLighthouseLedgerMlruntimedEventTaskEvent *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("taskFetched"));
          v100 = v83;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
          v32 = (id)objc_claimAutoreleasedReturnValue();
          v60 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v57, 2, v32);
          v14 = 0;
          *v59 = v60;
          v11 = v58;
          v7 = v82;
          goto LABEL_75;
        }
        v77 = a4;
        v32 = v31;
        v92 = 0;
        v83 = -[BMLighthouseLedgerMlruntimedEventTaskEvent initWithJSONDictionary:error:]([BMLighthouseLedgerMlruntimedEventTaskEvent alloc], "initWithJSONDictionary:error:", v32, &v92);
        v41 = v92;
        if (v41)
        {
          v42 = v41;
          if (v77)
            *v77 = objc_retainAutorelease(v41);

          v14 = 0;
          goto LABEL_75;
        }

      }
      else
      {
        v77 = a4;
        v83 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskScheduled"));
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v75 = v9;
      if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v81 = v7;
          v56 = v11;
          if (!v77)
          {
            v14 = 0;
            v7 = v81;
            goto LABEL_76;
          }
          v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v61 = *MEMORY[0x1E0D025B8];
          v97 = *MEMORY[0x1E0CB2D50];
          v33 = (BMLighthouseLedgerMlruntimedEventTaskEvent *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("taskScheduled"));
          v98 = v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
          v34 = (id)objc_claimAutoreleasedReturnValue();
          v62 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v61, 2, v34);
          v14 = 0;
          *v77 = v62;
          goto LABEL_96;
        }
        v34 = v32;
        v91 = 0;
        v33 = -[BMLighthouseLedgerMlruntimedEventTaskEvent initWithJSONDictionary:error:]([BMLighthouseLedgerMlruntimedEventTaskEvent alloc], "initWithJSONDictionary:error:", v34, &v91);
        v43 = v91;
        if (v43)
        {
          v44 = v43;
          if (v77)
            *v77 = objc_retainAutorelease(v43);

          v14 = 0;
          goto LABEL_74;
        }

      }
      else
      {
        v33 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskCompleted"));
      v34 = (id)objc_claimAutoreleasedReturnValue();
      if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v35 = 0;
LABEL_42:
        v14 = -[BMLighthouseLedgerMlruntimedEvent initWithTrialIdentifiers:contextID:timestamp:activityScheduleStatus:taskFetched:taskScheduled:taskCompleted:](v88, "initWithTrialIdentifiers:contextID:timestamp:activityScheduleStatus:taskFetched:taskScheduled:taskCompleted:", v87, v85, v89, v86, v83, v33, v35);
        v88 = v14;
LABEL_73:

LABEL_74:
        v9 = v75;
LABEL_75:
        v10 = v85;
LABEL_76:

LABEL_77:
LABEL_78:
        v38 = v30;
        self = v88;
LABEL_79:

        v30 = v38;
LABEL_80:

        v8 = v87;
        goto LABEL_81;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v90 = 0;
        v72 = v34;
        v35 = -[BMLighthouseLedgerMlruntimedEventTaskEvent initWithJSONDictionary:error:]([BMLighthouseLedgerMlruntimedEventTaskEvent alloc], "initWithJSONDictionary:error:", v72, &v90);
        v54 = v90;
        if (!v54)
        {

          goto LABEL_42;
        }
        v55 = v54;
        v81 = v7;
        v56 = v11;
        if (v77)
          *v77 = objc_retainAutorelease(v54);

LABEL_72:
        v14 = 0;
        v11 = v56;
        v7 = v81;
        goto LABEL_73;
      }
      v81 = v7;
      v56 = v11;
      if (v77)
      {
        v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v71 = *MEMORY[0x1E0D025B8];
        v95 = *MEMORY[0x1E0CB2D50];
        v35 = (BMLighthouseLedgerMlruntimedEventTaskEvent *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("taskCompleted"));
        v96 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *v77 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v71, 2, v63);

        goto LABEL_72;
      }
      v14 = 0;
LABEL_96:
      v11 = v56;
      v7 = v81;
      goto LABEL_74;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v14 = 0;
        goto LABEL_80;
      }
      v84 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v45 = v9;
      v46 = *MEMORY[0x1E0D025B8];
      v101 = *MEMORY[0x1E0CB2D50];
      v80 = v7;
      v47 = v11;
      v48 = a4;
      v49 = v10;
      v50 = objc_alloc(MEMORY[0x1E0CB3940]);
      v70 = objc_opt_class();
      v51 = v50;
      v10 = v49;
      v86 = (BMLighthouseLedgerMlruntimedEventScheduleStatus *)objc_msgSend(v51, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v70, CFSTR("activityScheduleStatus"));
      v102 = v86;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v46;
      v9 = v45;
      *v48 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v53, 2, v52);
      v11 = v47;
      v7 = v80;

      v14 = 0;
      goto LABEL_78;
    }
    v79 = v7;
    v36 = v11;
    v37 = a4;
    v38 = v30;
    v93 = 0;
    v86 = -[BMLighthouseLedgerMlruntimedEventScheduleStatus initWithJSONDictionary:error:]([BMLighthouseLedgerMlruntimedEventScheduleStatus alloc], "initWithJSONDictionary:error:", v38, &v93);
    v39 = v93;
    if (!v39)
    {

      v11 = v36;
      v7 = v79;
      goto LABEL_33;
    }
    v40 = v39;
    if (v37)
      *v37 = objc_retainAutorelease(v39);

    v14 = 0;
    v11 = v36;
LABEL_91:
    v7 = v79;
    goto LABEL_79;
  }
  if (a4)
  {
    v76 = a4;
    v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v22 = *MEMORY[0x1E0D025B8];
    v107 = *MEMORY[0x1E0CB2D50];
    v8 = (BMLighthouseLedgerTrialIdentifiers *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("trialIdentifiers"));
    v108[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, &v107, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    *v76 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v10);
LABEL_83:

    goto LABEL_84;
  }
  v14 = 0;
LABEL_84:

  return v14;
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
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[7];
  _QWORD v33[9];

  v33[7] = *MEMORY[0x1E0C80C00];
  -[BMLighthouseLedgerMlruntimedEvent trialIdentifiers](self, "trialIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMLighthouseLedgerMlruntimedEvent contextID](self, "contextID");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerMlruntimedEvent timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLighthouseLedgerMlruntimedEvent timestamp](self, "timestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  -[BMLighthouseLedgerMlruntimedEvent activityScheduleStatus](self, "activityScheduleStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "jsonDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMLighthouseLedgerMlruntimedEvent taskFetched](self, "taskFetched");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "jsonDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMLighthouseLedgerMlruntimedEvent taskScheduled](self, "taskScheduled");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "jsonDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMLighthouseLedgerMlruntimedEvent taskCompleted](self, "taskCompleted");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "jsonDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = CFSTR("trialIdentifiers");
  v18 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v18;
  v33[0] = v18;
  v32[1] = CFSTR("contextID");
  v19 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v19;
  v33[1] = v19;
  v32[2] = CFSTR("timestamp");
  v20 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v4;
  v27 = (void *)v20;
  v33[2] = v20;
  v32[3] = CFSTR("activityScheduleStatus");
  v21 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v5;
  v33[3] = v21;
  v32[4] = CFSTR("taskFetched");
  v22 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[4] = v22;
  v32[5] = CFSTR("taskScheduled");
  v23 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[5] = v23;
  v32[6] = CFSTR("taskCompleted");
  v24 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[6] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (v15)
      goto LABEL_20;
LABEL_28:

    if (v13)
      goto LABEL_21;
    goto LABEL_29;
  }

  if (!v15)
    goto LABEL_28;
LABEL_20:
  if (v13)
    goto LABEL_21;
LABEL_29:

LABEL_21:
  if (!v11)

  if (v9)
  {
    if (v30)
      goto LABEL_25;
LABEL_31:

    if (v31)
      goto LABEL_26;
LABEL_32:

    goto LABEL_26;
  }

  if (!v30)
    goto LABEL_31;
LABEL_25:
  if (!v31)
    goto LABEL_32;
LABEL_26:

  return v25;
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
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMLighthouseLedgerMlruntimedEvent trialIdentifiers](self, "trialIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trialIdentifiers");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMLighthouseLedgerMlruntimedEvent trialIdentifiers](self, "trialIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trialIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_25;
    }
    -[BMLighthouseLedgerMlruntimedEvent contextID](self, "contextID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMLighthouseLedgerMlruntimedEvent contextID](self, "contextID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contextID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_25;
    }
    -[BMLighthouseLedgerMlruntimedEvent timestamp](self, "timestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMLighthouseLedgerMlruntimedEvent timestamp](self, "timestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_25;
    }
    -[BMLighthouseLedgerMlruntimedEvent activityScheduleStatus](self, "activityScheduleStatus");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityScheduleStatus");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMLighthouseLedgerMlruntimedEvent activityScheduleStatus](self, "activityScheduleStatus");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activityScheduleStatus");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_25;
    }
    -[BMLighthouseLedgerMlruntimedEvent taskFetched](self, "taskFetched");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskFetched");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMLighthouseLedgerMlruntimedEvent taskFetched](self, "taskFetched");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskFetched");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_25;
    }
    -[BMLighthouseLedgerMlruntimedEvent taskScheduled](self, "taskScheduled");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskScheduled");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMLighthouseLedgerMlruntimedEvent taskScheduled](self, "taskScheduled");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskScheduled");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
      {
LABEL_25:
        v12 = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    -[BMLighthouseLedgerMlruntimedEvent taskCompleted](self, "taskCompleted");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskCompleted");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44 == v45)
    {
      v12 = 1;
    }
    else
    {
      -[BMLighthouseLedgerMlruntimedEvent taskCompleted](self, "taskCompleted");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskCompleted");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v46, "isEqual:", v47);

    }
    goto LABEL_26;
  }
  v12 = 0;
LABEL_27:

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

- (BMLighthouseLedgerMlruntimedEventScheduleStatus)activityScheduleStatus
{
  return self->_activityScheduleStatus;
}

- (BMLighthouseLedgerMlruntimedEventTaskEvent)taskFetched
{
  return self->_taskFetched;
}

- (BMLighthouseLedgerMlruntimedEventTaskEvent)taskScheduled
{
  return self->_taskScheduled;
}

- (BMLighthouseLedgerMlruntimedEventTaskEvent)taskCompleted
{
  return self->_taskCompleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskCompleted, 0);
  objc_storeStrong((id *)&self->_taskScheduled, 0);
  objc_storeStrong((id *)&self->_taskFetched, 0);
  objc_storeStrong((id *)&self->_activityScheduleStatus, 0);
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

    v4 = -[BMLighthouseLedgerMlruntimedEvent initByReadFrom:]([BMLighthouseLedgerMlruntimedEvent alloc], "initByReadFrom:", v7);
    v4[8] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("trialIdentifiers_json"), 5, 1, &__block_literal_global_53839);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contextID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timestamp"), 3, 0, 3, 0, 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("activityScheduleStatus_json"), 5, 1, &__block_literal_global_180_53840);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("taskFetched_json"), 5, 1, &__block_literal_global_181_53841);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("taskScheduled_json"), 5, 1, &__block_literal_global_182_53842);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("taskCompleted_json"), 5, 1, &__block_literal_global_183_53843);
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
  return &unk_1E5F1E058;
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
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activityScheduleStatus"), 101, 14, objc_opt_class());
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("taskFetched"), 102, 14, objc_opt_class());
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("taskScheduled"), 103, 14, objc_opt_class());
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("taskCompleted"), 104, 14, objc_opt_class());
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __44__BMLighthouseLedgerMlruntimedEvent_columns__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "taskCompleted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__BMLighthouseLedgerMlruntimedEvent_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "taskScheduled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__BMLighthouseLedgerMlruntimedEvent_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "taskFetched");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__BMLighthouseLedgerMlruntimedEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityScheduleStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__BMLighthouseLedgerMlruntimedEvent_columns__block_invoke(uint64_t a1, void *a2)
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
