@implementation BMLighthouseLedgerDediscoPrivacyEvent

- (BMLighthouseLedgerDediscoPrivacyEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 eventIdentifier:(id)a6 event:(id)a7 aggregateFunction:(int)a8 errorCode:(id)a9 count:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  BMLighthouseLedgerDediscoPrivacyEvent *v21;
  double v22;
  int v23;
  int v24;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v27 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v20 = a10;
  v29.receiver = self;
  v29.super_class = (Class)BMLighthouseLedgerDediscoPrivacyEvent;
  v21 = -[BMEventBase init](&v29, sel_init);
  if (v21)
  {
    v21->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v21->_trialIdentifiers, a3);
    objc_storeStrong((id *)&v21->_contextID, a4);
    if (v16)
    {
      v21->_hasRaw_timestamp = 1;
      objc_msgSend(v16, "timeIntervalSince1970");
    }
    else
    {
      v21->_hasRaw_timestamp = 0;
      v22 = -1.0;
    }
    v21->_raw_timestamp = v22;
    objc_storeStrong((id *)&v21->_eventIdentifier, a6);
    objc_storeStrong((id *)&v21->_event, a7);
    v21->_aggregateFunction = a8;
    if (v19)
    {
      v21->_hasErrorCode = 1;
      v23 = objc_msgSend(v19, "intValue");
    }
    else
    {
      v21->_hasErrorCode = 0;
      v23 = -1;
    }
    v21->_errorCode = v23;
    if (v20)
    {
      v21->_hasCount = 1;
      v24 = objc_msgSend(v20, "intValue");
    }
    else
    {
      v21->_hasCount = 0;
      v24 = -1;
    }
    v21->_count = v24;
  }

  return v21;
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
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMLighthouseLedgerDediscoPrivacyEvent trialIdentifiers](self, "trialIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerDediscoPrivacyEvent contextID](self, "contextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerDediscoPrivacyEvent timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerDediscoPrivacyEvent eventIdentifier](self, "eventIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerDediscoPrivacyEvent event](self, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BMLighthouseLedgerDediscoPrivacyEventAggregateFunctionAsString(-[BMLighthouseLedgerDediscoPrivacyEvent aggregateFunction](self, "aggregateFunction"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseLedgerDediscoPrivacyEvent errorCode](self, "errorCode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseLedgerDediscoPrivacyEvent count](self, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLighthouseLedgerDediscoPrivacyEvent with trialIdentifiers: %@, contextID: %@, timestamp: %@, eventIdentifier: %@, event: %@, aggregateFunction: %@, errorCode: %@, count: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLighthouseLedgerDediscoPrivacyEvent *v5;
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
  objc_class *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  double v26;
  void *v27;
  void *v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  uint64_t v49;
  BMLighthouseLedgerDediscoPrivacyEvent *v50;
  objc_super v52;
  uint64_t v53;
  uint64_t v54;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)BMLighthouseLedgerDediscoPrivacyEvent;
  v5 = -[BMEventBase init](&v52, sel_init);
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
          v53 = 0;
          v54 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_75;
          v20 = -[BMLighthouseLedgerTrialIdentifiers initByReadFrom:]([BMLighthouseLedgerTrialIdentifiers alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_75;
          v21 = 56;
          goto LABEL_34;
        case 2u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 64;
          goto LABEL_30;
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
          continue;
        case 4u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 72;
LABEL_30:
          v27 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        case 5u:
          v53 = 0;
          v54 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_75;
          v20 = -[BMLighthouseLedgerDediscoPrivacyEventEventState initByReadFrom:]([BMLighthouseLedgerDediscoPrivacyEventEventState alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_75;
          v21 = 80;
LABEL_34:
          v28 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = v20;

          PBReaderRecallMark();
          continue;
        case 6u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          while (2)
          {
            v32 = *v6;
            v33 = *(_QWORD *)&v4[v32];
            v34 = v33 + 1;
            if (v33 == -1 || v34 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v33);
              *(_QWORD *)&v4[v32] = v34;
              v31 |= (unint64_t)(v35 & 0x7F) << v29;
              if (v35 < 0)
              {
                v29 += 7;
                v17 = v30++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v31) = 0;
LABEL_59:
          if (v31 >= 4)
            LODWORD(v31) = 0;
          v5->_aggregateFunction = v31;
          continue;
        case 7u:
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v5->_hasErrorCode = 1;
          while (2)
          {
            v39 = *v6;
            v40 = *(_QWORD *)&v4[v39];
            v41 = v40 + 1;
            if (v40 == -1 || v41 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v40);
              *(_QWORD *)&v4[v39] = v41;
              v38 |= (unint64_t)(v42 & 0x7F) << v36;
              if (v42 < 0)
              {
                v36 += 7;
                v17 = v37++ >= 9;
                if (v17)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v38) = 0;
LABEL_65:
          v49 = 44;
          goto LABEL_70;
        case 8u:
          v43 = 0;
          v44 = 0;
          v38 = 0;
          v5->_hasCount = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_75;
          continue;
      }
      while (1)
      {
        v45 = *v6;
        v46 = *(_QWORD *)&v4[v45];
        v47 = v46 + 1;
        if (v46 == -1 || v47 > *(_QWORD *)&v4[*v7])
          break;
        v48 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v46);
        *(_QWORD *)&v4[v45] = v47;
        v38 |= (unint64_t)(v48 & 0x7F) << v43;
        if ((v48 & 0x80) == 0)
          goto LABEL_67;
        v43 += 7;
        v17 = v44++ >= 9;
        if (v17)
        {
          LODWORD(v38) = 0;
          goto LABEL_69;
        }
      }
      v4[*v8] = 1;
LABEL_67:
      if (v4[*v8])
        LODWORD(v38) = 0;
LABEL_69:
      v49 = 48;
LABEL_70:
      *(_DWORD *)((char *)&v5->super.super.isa + v49) = v38;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_75:
    v50 = 0;
  else
LABEL_76:
    v50 = v5;

  return v50;
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
  if (self->_eventIdentifier)
    PBDataWriterWriteStringField();
  if (self->_event)
  {
    PBDataWriterPlaceMark();
    -[BMLighthouseLedgerDediscoPrivacyEventEventState writeTo:](self->_event, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasErrorCode)
    PBDataWriterWriteInt32Field();
  if (self->_hasCount)
    PBDataWriterWriteInt32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLighthouseLedgerDediscoPrivacyEvent writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLighthouseLedgerDediscoPrivacyEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  BMLighthouseLedgerTrialIdentifiers *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  BMLighthouseLedgerDediscoPrivacyEvent *v14;
  objc_class *v15;
  id v16;
  id v17;
  double v18;
  double v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  BMLighthouseLedgerTrialIdentifiers *v50;
  id v51;
  void *v52;
  id *v53;
  uint64_t v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  BMLighthouseLedgerDediscoPrivacyEventEventState *v76;
  void *v77;
  id v78;
  void *v79;
  BMLighthouseLedgerDediscoPrivacyEvent *v80;
  id v82;
  id v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  id *v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  BMLighthouseLedgerDediscoPrivacyEventEventState *v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  _QWORD v99[3];

  v99[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trialIdentifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v6;
    v83 = 0;
    v7 = -[BMLighthouseLedgerTrialIdentifiers initWithJSONDictionary:error:]([BMLighthouseLedgerTrialIdentifiers alloc], "initWithJSONDictionary:error:", v9, &v83);
    v12 = v83;
    if (v12)
    {
      v13 = v12;
      if (a4)
        *a4 = objc_retainAutorelease(v12);

      v14 = 0;
      goto LABEL_66;
    }

LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contextID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v9 = 0;
          v14 = 0;
          goto LABEL_65;
        }
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = *MEMORY[0x1E0D025B8];
        v96 = *MEMORY[0x1E0CB2D50];
        v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contextID"));
        v97 = v79;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2);
        v9 = 0;
        v14 = 0;
        *a4 = v28;
LABEL_64:

LABEL_65:
        goto LABEL_66;
      }
      v9 = v8;
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v10 = objc_claimAutoreleasedReturnValue();
    v77 = (void *)v10;
    v78 = v9;
    if (v10 && (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (objc_class *)MEMORY[0x1E0C99D68];
        v16 = v11;
        v17 = [v15 alloc];
        objc_msgSend(v16, "doubleValue");
        v19 = v18;

        v9 = v78;
        v20 = (id)objc_msgSend(v17, "initWithTimeIntervalSince1970:", v19);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v29, "dateFromString:", v11);
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_26;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v79 = 0;
            v14 = 0;
            goto LABEL_64;
          }
          v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v63 = *MEMORY[0x1E0D025B8];
          v94 = *MEMORY[0x1E0CB2D50];
          v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("timestamp"));
          v95 = v32;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = v62;
          v9 = v78;
          v75 = (void *)v64;
          v66 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v63, 2);
          v79 = 0;
          v14 = 0;
          *a4 = v66;
          goto LABEL_63;
        }
        v20 = v11;
      }
      v79 = v20;
    }
    else
    {
      v79 = 0;
    }
LABEL_26:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eventIdentifier"));
    v30 = objc_claimAutoreleasedReturnValue();
    v80 = self;
    v75 = (void *)v30;
    if (v30 && (v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v32 = 0;
          v14 = 0;
          goto LABEL_63;
        }
        v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v40 = *MEMORY[0x1E0D025B8];
        v92 = *MEMORY[0x1E0CB2D50];
        v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("eventIdentifier"));
        v93 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = v39;
        v9 = v78;
        v76 = (BMLighthouseLedgerDediscoPrivacyEventEventState *)v41;
        v43 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v40, 2);
        v32 = 0;
        v14 = 0;
        *a4 = v43;
        goto LABEL_61;
      }
      v32 = v31;
    }
    else
    {
      v32 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("event"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v8;
    if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v14 = 0;
          goto LABEL_62;
        }
        v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v44 = *MEMORY[0x1E0D025B8];
        v90 = *MEMORY[0x1E0CB2D50];
        v45 = v32;
        v46 = objc_alloc(MEMORY[0x1E0CB3940]);
        v67 = objc_opt_class();
        v47 = v46;
        v32 = v45;
        v76 = (BMLighthouseLedgerDediscoPrivacyEventEventState *)objc_msgSend(v47, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v67, CFSTR("event"));
        v91 = v76;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v78;
        *a4 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v44, 2, v48);

        v14 = 0;
        v35 = v33;
LABEL_61:

        v33 = v35;
LABEL_62:

        self = v80;
LABEL_63:

        goto LABEL_64;
      }
      v35 = v33;
      v82 = 0;
      v76 = -[BMLighthouseLedgerDediscoPrivacyEventEventState initWithJSONDictionary:error:]([BMLighthouseLedgerDediscoPrivacyEventEventState alloc], "initWithJSONDictionary:error:", v35, &v82);
      v36 = v82;
      if (v36)
      {
        v37 = v36;
        if (a4)
          *a4 = objc_retainAutorelease(v36);

        v14 = 0;
        v9 = v78;
        goto LABEL_61;
      }

    }
    else
    {
      v76 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("aggregateFunction"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v32;
    if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = v34;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v72 = 0;
            v14 = 0;
            goto LABEL_60;
          }
          v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v60 = *MEMORY[0x1E0D025B8];
          v88 = *MEMORY[0x1E0CB2D50];
          v51 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("aggregateFunction"));
          v89 = v51;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v60, 2, v49);
          v72 = 0;
          v14 = 0;
          *a4 = v61;
LABEL_59:

LABEL_60:
          v35 = v33;
          v9 = v78;
          v32 = v74;
          goto LABEL_61;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLighthouseLedgerDediscoPrivacyEventAggregateFunctionFromString(v34));
        v38 = (id)objc_claimAutoreleasedReturnValue();
      }
      v72 = v38;
    }
    else
    {
      v72 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v51 = 0;
          v14 = 0;
          goto LABEL_59;
        }
        v50 = v7;
        v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v55 = *MEMORY[0x1E0D025B8];
        v86 = *MEMORY[0x1E0CB2D50];
        v53 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("errorCode"));
        v87 = v53;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v55, 2, v52);
        v14 = 0;
        v51 = 0;
        *a4 = v56;
        goto LABEL_58;
      }
      v50 = v7;
      v51 = v49;
    }
    else
    {
      v50 = v7;
      v51 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("count"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v53 = a4;
        if (a4)
        {
          v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v68 = *MEMORY[0x1E0D025B8];
          v84 = *MEMORY[0x1E0CB2D50];
          v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("count"));
          v85 = v57;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v68, 2, v58);

          v53 = 0;
        }
        v14 = 0;
        goto LABEL_58;
      }
      v53 = v52;
    }
    else
    {
      v53 = 0;
    }
    v14 = -[BMLighthouseLedgerDediscoPrivacyEvent initWithTrialIdentifiers:contextID:timestamp:eventIdentifier:event:aggregateFunction:errorCode:count:](v80, "initWithTrialIdentifiers:contextID:timestamp:eventIdentifier:event:aggregateFunction:errorCode:count:", v50, v78, v79, v74, v76, objc_msgSend(v72, "intValue"), v51, v53);
    v80 = v14;
LABEL_58:

    v7 = v50;
    v8 = v71;
    goto LABEL_59;
  }
  if (!a4)
  {
    v14 = 0;
    goto LABEL_67;
  }
  v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v22 = *MEMORY[0x1E0D025B8];
  v98 = *MEMORY[0x1E0CB2D50];
  v99[0] = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("trialIdentifiers"));
  v7 = (BMLighthouseLedgerTrialIdentifiers *)v99[0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, &v98, 1);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v21;
  v9 = (id)v23;
  v25 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v22, 2, v23);
  v14 = 0;
  *a4 = v25;
LABEL_66:

LABEL_67:
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[8];
  _QWORD v32[10];

  v32[8] = *MEMORY[0x1E0C80C00];
  -[BMLighthouseLedgerDediscoPrivacyEvent trialIdentifiers](self, "trialIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMLighthouseLedgerDediscoPrivacyEvent contextID](self, "contextID");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerDediscoPrivacyEvent timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLighthouseLedgerDediscoPrivacyEvent timestamp](self, "timestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  -[BMLighthouseLedgerDediscoPrivacyEvent eventIdentifier](self, "eventIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerDediscoPrivacyEvent event](self, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "jsonDictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseLedgerDediscoPrivacyEvent aggregateFunction](self, "aggregateFunction"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMLighthouseLedgerDediscoPrivacyEvent hasErrorCode](self, "hasErrorCode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseLedgerDediscoPrivacyEvent errorCode](self, "errorCode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  if (-[BMLighthouseLedgerDediscoPrivacyEvent hasCount](self, "hasCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseLedgerDediscoPrivacyEvent count](self, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v31[0] = CFSTR("trialIdentifiers");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v13;
  v32[0] = v13;
  v31[1] = CFSTR("contextID");
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v14;
  v32[1] = v14;
  v31[2] = CFSTR("timestamp");
  v15 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v15;
  v32[2] = v15;
  v31[3] = CFSTR("eventIdentifier");
  v16 = v30;
  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v4;
  v32[3] = v16;
  v31[4] = CFSTR("event");
  v17 = v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v5;
  v32[4] = v17;
  v31[5] = CFSTR("aggregateFunction");
  v19 = v28;
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[5] = v19;
  v31[6] = CFSTR("errorCode");
  v20 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[6] = v20;
  v31[7] = CFSTR("count");
  v21 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[7] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v11)
      goto LABEL_28;
  }
  else
  {

    if (v11)
      goto LABEL_28;
  }

LABEL_28:
  if (!v28)

  if (!v29)
  if (v30)
  {
    if (v9)
      goto LABEL_34;
  }
  else
  {

    if (v9)
    {
LABEL_34:
      if (v18)
        goto LABEL_35;
LABEL_41:

      if (v27)
        goto LABEL_36;
LABEL_42:

      goto LABEL_36;
    }
  }

  if (!v18)
    goto LABEL_41;
LABEL_35:
  if (!v27)
    goto LABEL_42;
LABEL_36:

  return v22;
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
  BOOL v12;
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
  int v37;
  int v38;
  int v39;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMLighthouseLedgerDediscoPrivacyEvent trialIdentifiers](self, "trialIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trialIdentifiers");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMLighthouseLedgerDediscoPrivacyEvent trialIdentifiers](self, "trialIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trialIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_34;
    }
    -[BMLighthouseLedgerDediscoPrivacyEvent contextID](self, "contextID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMLighthouseLedgerDediscoPrivacyEvent contextID](self, "contextID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contextID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_34;
    }
    -[BMLighthouseLedgerDediscoPrivacyEvent timestamp](self, "timestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMLighthouseLedgerDediscoPrivacyEvent timestamp](self, "timestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_34;
    }
    -[BMLighthouseLedgerDediscoPrivacyEvent eventIdentifier](self, "eventIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMLighthouseLedgerDediscoPrivacyEvent eventIdentifier](self, "eventIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_34;
    }
    -[BMLighthouseLedgerDediscoPrivacyEvent event](self, "event");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "event");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMLighthouseLedgerDediscoPrivacyEvent event](self, "event");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "event");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_34;
    }
    v37 = -[BMLighthouseLedgerDediscoPrivacyEvent aggregateFunction](self, "aggregateFunction");
    if (v37 == objc_msgSend(v5, "aggregateFunction"))
    {
      if (!-[BMLighthouseLedgerDediscoPrivacyEvent hasErrorCode](self, "hasErrorCode")
        && !objc_msgSend(v5, "hasErrorCode")
        || -[BMLighthouseLedgerDediscoPrivacyEvent hasErrorCode](self, "hasErrorCode")
        && objc_msgSend(v5, "hasErrorCode")
        && (v38 = -[BMLighthouseLedgerDediscoPrivacyEvent errorCode](self, "errorCode"),
            v38 == objc_msgSend(v5, "errorCode")))
      {
        if (!-[BMLighthouseLedgerDediscoPrivacyEvent hasCount](self, "hasCount")
          && !objc_msgSend(v5, "hasCount"))
        {
          v12 = 1;
          goto LABEL_35;
        }
        if (-[BMLighthouseLedgerDediscoPrivacyEvent hasCount](self, "hasCount")
          && objc_msgSend(v5, "hasCount"))
        {
          v39 = -[BMLighthouseLedgerDediscoPrivacyEvent count](self, "count");
          v12 = v39 == objc_msgSend(v5, "count");
LABEL_35:

          goto LABEL_36;
        }
      }
    }
LABEL_34:
    v12 = 0;
    goto LABEL_35;
  }
  v12 = 0;
LABEL_36:

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

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (BMLighthouseLedgerDediscoPrivacyEventEventState)event
{
  return self->_event;
}

- (int)aggregateFunction
{
  return self->_aggregateFunction;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (BOOL)hasErrorCode
{
  return self->_hasErrorCode;
}

- (void)setHasErrorCode:(BOOL)a3
{
  self->_hasErrorCode = a3;
}

- (int)count
{
  return self->_count;
}

- (BOOL)hasCount
{
  return self->_hasCount;
}

- (void)setHasCount:(BOOL)a3
{
  self->_hasCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
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

    v4 = -[BMLighthouseLedgerDediscoPrivacyEvent initByReadFrom:]([BMLighthouseLedgerDediscoPrivacyEvent alloc], "initByReadFrom:", v7);
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
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("trialIdentifiers_json"), 5, 1, &__block_literal_global_176);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contextID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timestamp"), 3, 0, 3, 0, 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventIdentifier"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("event_json"), 5, 1, &__block_literal_global_177);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("aggregateFunction"), 0, 0, 6, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("errorCode"), 0, 0, 7, 2, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("count"), 0, 0, 8, 2, 0);
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1DFE0;
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
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("trialIdentifiers"), 1, 14, objc_opt_class());
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contextID"), 2, 13, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timestamp"), 3, 0, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventIdentifier"), 4, 13, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("event"), 5, 14, objc_opt_class());
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("aggregateFunction"), 6, 4, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("errorCode"), 7, 2, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("count"), 8, 2, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __48__BMLighthouseLedgerDediscoPrivacyEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __48__BMLighthouseLedgerDediscoPrivacyEvent_columns__block_invoke(uint64_t a1, void *a2)
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

- (BMLighthouseLedgerDediscoPrivacyEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 eventIdentifier:(id)a6 event:(id)a7
{
  return -[BMLighthouseLedgerDediscoPrivacyEvent initWithTrialIdentifiers:contextID:timestamp:eventIdentifier:event:aggregateFunction:errorCode:count:](self, "initWithTrialIdentifiers:contextID:timestamp:eventIdentifier:event:aggregateFunction:errorCode:count:", a3, a4, a5, a6, a7, 0, &unk_1E5F203C8, &unk_1E5F203C8);
}

@end
