@implementation BMSiriExecution

- (BMSiriExecution)initWithTaskId:(id)a3 taskStep:(int)a4 statusReason:(id)a5 slotValue:(id)a6 intentName:(id)a7 appBundleID:(id)a8 interactionID:(id)a9 absoluteTimestamp:(id)a10
{
  id v17;
  id v18;
  BMSiriExecution *v19;
  double v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v17 = a9;
  v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)BMSiriExecution;
  v19 = -[BMEventBase init](&v27, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v19->_taskId, a3);
    v19->_taskStep = a4;
    objc_storeStrong((id *)&v19->_statusReason, a5);
    objc_storeStrong((id *)&v19->_slotValue, a6);
    objc_storeStrong((id *)&v19->_intentName, a7);
    objc_storeStrong((id *)&v19->_appBundleID, a8);
    objc_storeStrong((id *)&v19->_interactionID, a9);
    if (v18)
    {
      v19->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v19->_hasRaw_absoluteTimestamp = 0;
      v20 = -1.0;
    }
    v19->_raw_absoluteTimestamp = v20;
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
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriExecution taskId](self, "taskId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMSiriExecutionTaskStepAsString(-[BMSiriExecution taskStep](self, "taskStep"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExecution statusReason](self, "statusReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExecution slotValue](self, "slotValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExecution intentName](self, "intentName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExecution appBundleID](self, "appBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExecution interactionID](self, "interactionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExecution absoluteTimestamp](self, "absoluteTimestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriExecution with taskId: %@, taskStep: %@, statusReason: %@, slotValue: %@, intentName: %@, appBundleID: %@, interactionID: %@, absoluteTimestamp: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriExecution *v5;
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
  uint64_t v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  double v32;
  BMSiriExecution *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMSiriExecution;
  v5 = -[BMEventBase init](&v35, sel_init);
  if (!v5)
    goto LABEL_51;
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
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 40;
          goto LABEL_35;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          break;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
          goto LABEL_35;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
          goto LABEL_35;
        case 5u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
          goto LABEL_35;
        case 6u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 72;
          goto LABEL_35;
        case 7u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 80;
LABEL_35:
          v29 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 8u:
          v5->_hasRaw_absoluteTimestamp = 1;
          v30 = *v6;
          v31 = *(_QWORD *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v32 = *(double *)(*(_QWORD *)&v4[*v9] + v31);
            *(_QWORD *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v32 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v32;
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_50;
          continue;
      }
      while (1)
      {
        v25 = *v6;
        v26 = *(_QWORD *)&v4[v25];
        v27 = v26 + 1;
        if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
          break;
        v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
        *(_QWORD *)&v4[v25] = v27;
        v24 |= (unint64_t)(v28 & 0x7F) << v22;
        if ((v28 & 0x80) == 0)
          goto LABEL_42;
        v22 += 7;
        v17 = v23++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_44;
        }
      }
      v4[*v8] = 1;
LABEL_42:
      if (v4[*v8])
        LODWORD(v24) = 0;
LABEL_44:
      if (v24 >= 0x5F)
        LODWORD(v24) = 0;
      v5->_taskStep = v24;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_50:
    v33 = 0;
  else
LABEL_51:
    v33 = v5;

  return v33;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_taskId)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_statusReason)
    PBDataWriterWriteStringField();
  if (self->_slotValue)
    PBDataWriterWriteStringField();
  v4 = v5;
  if (self->_intentName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_appBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_interactionID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriExecution writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriExecution)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BMSiriExecution *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  objc_class *v34;
  id v35;
  id v36;
  double v37;
  double v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  id *v70;
  void *v71;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  _QWORD v88[3];

  v88[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskStep"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v10 = 0;
            a4 = 0;
            goto LABEL_76;
          }
          v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v52 = *MEMORY[0x1E0D025B8];
          v85 = *MEMORY[0x1E0CB2D50];
          v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("taskStep"));
          v86 = v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v52, 2);
          v10 = 0;
          a4 = 0;
          *v70 = v53;
          goto LABEL_75;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriExecutionTaskStepFromString(v9));
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v11;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("statusReason"));
    v18 = objc_claimAutoreleasedReturnValue();
    v67 = v9;
    v71 = (void *)v18;
    if (v18 && (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        a4 = v70;
        if (!v70)
        {
          v33 = 0;
LABEL_75:

          goto LABEL_76;
        }
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = v10;
        v30 = *MEMORY[0x1E0D025B8];
        v83 = *MEMORY[0x1E0CB2D50];
        v72 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("statusReason"));
        v84 = v72;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        v10 = v29;
        v32 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v31, 2, v20);
        v33 = 0;
        a4 = 0;
        *v70 = v32;
        goto LABEL_74;
      }
      v69 = v19;
    }
    else
    {
      v69 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("slotValue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v72 = 0;
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v72 = v20;
LABEL_22:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("intentName"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v7;
      v66 = v10;
      if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v68 = 0;
        goto LABEL_25;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v68 = v21;
LABEL_25:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appBundleID"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v8;
        if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v65 = 0;
LABEL_28:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interactionID"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            v24 = self;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v70)
              {
                v25 = 0;
                a4 = 0;
                goto LABEL_71;
              }
              v61 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v54 = *MEMORY[0x1E0D025B8];
              v75 = *MEMORY[0x1E0CB2D50];
              v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("interactionID"));
              v76 = v27;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v54, 2, v26);
              v25 = 0;
              a4 = 0;
              *v70 = v55;
              goto LABEL_70;
            }
            v25 = v23;
          }
          else
          {
            v24 = self;
            v25 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v27 = 0;
LABEL_69:
            a4 = -[BMSiriExecution initWithTaskId:taskStep:statusReason:slotValue:intentName:appBundleID:interactionID:absoluteTimestamp:](v24, "initWithTaskId:taskStep:statusReason:slotValue:intentName:appBundleID:interactionID:absoluteTimestamp:", v64, objc_msgSend(v66, "intValue"), v69, v72, v68, v65, v25, v27);
            v24 = (BMSiriExecution *)a4;
LABEL_70:

            goto LABEL_71;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v34 = (objc_class *)MEMORY[0x1E0C99D68];
            v35 = v26;
            v36 = [v34 alloc];
            objc_msgSend(v35, "doubleValue");
            v38 = v37;

            v39 = (id)objc_msgSend(v36, "initWithTimeIntervalSinceReferenceDate:", v38);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v56 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
              objc_msgSend(v56, "dateFromString:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_69;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v70)
              {
                v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v60 = *MEMORY[0x1E0D025B8];
                v73 = *MEMORY[0x1E0CB2D50];
                v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
                v74 = v58;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                *v70 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v60, 2, v59);

              }
              v27 = 0;
              a4 = 0;
              goto LABEL_70;
            }
            v39 = v26;
          }
          v27 = v39;
          goto LABEL_69;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v65 = v22;
          goto LABEL_28;
        }
        a4 = v70;
        if (v70)
        {
          v24 = self;
          v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v49 = *MEMORY[0x1E0D025B8];
          v77 = *MEMORY[0x1E0CB2D50];
          v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("appBundleID"));
          v78 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v49, 2, v23);
          v65 = 0;
          a4 = 0;
          *v70 = v50;
LABEL_71:

          self = v24;
          v8 = v64;
          goto LABEL_72;
        }
        v65 = 0;
LABEL_72:
        v33 = v69;

        v7 = v63;
        v10 = v66;
        goto LABEL_73;
      }
      a4 = v70;
      if (v70)
      {
        v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v46 = *MEMORY[0x1E0D025B8];
        v79 = *MEMORY[0x1E0CB2D50];
        v65 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("intentName"));
        v80 = v65;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2, v22);
        v68 = 0;
        a4 = 0;
        *v70 = v47;
        goto LABEL_72;
      }
      v68 = 0;
LABEL_64:
      v33 = v69;
LABEL_73:

      goto LABEL_74;
    }
    a4 = v70;
    if (v70)
    {
      v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v41 = v10;
      v42 = *MEMORY[0x1E0D025B8];
      v81 = *MEMORY[0x1E0CB2D50];
      v68 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("slotValue"));
      v82 = v68;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42;
      v10 = v41;
      v44 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v43, 2, v21);
      v72 = 0;
      a4 = 0;
      *v70 = v44;
      goto LABEL_64;
    }
    v72 = 0;
    v33 = v69;
LABEL_74:

    v9 = v67;
    goto LABEL_75;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    v12 = a4;
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = *MEMORY[0x1E0D025B8];
    v87 = *MEMORY[0x1E0CB2D50];
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("taskId"));
    v88[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, &v87, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v14;
    v10 = (void *)v15;
    v17 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v16, 2, v9);
    v8 = 0;
    a4 = 0;
    *v12 = v17;
LABEL_76:

    goto LABEL_77;
  }
  v8 = 0;
LABEL_77:

  return (BMSiriExecution *)a4;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[8];
  _QWORD v29[10];

  v29[8] = *MEMORY[0x1E0C80C00];
  -[BMSiriExecution taskId](self, "taskId");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriExecution taskStep](self, "taskStep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExecution statusReason](self, "statusReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExecution slotValue](self, "slotValue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExecution intentName](self, "intentName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExecution appBundleID](self, "appBundleID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExecution interactionID](self, "interactionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriExecution absoluteTimestamp](self, "absoluteTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriExecution absoluteTimestamp](self, "absoluteTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  v28[0] = CFSTR("taskId");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v11;
  v29[0] = v11;
  v28[1] = CFSTR("taskStep");
  v12 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v12;
  v29[1] = v12;
  v28[2] = CFSTR("statusReason");
  v13 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v13;
  v29[2] = v13;
  v28[3] = CFSTR("slotValue");
  v14 = v27;
  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v3;
  v29[3] = v14;
  v28[4] = CFSTR("intentName");
  v15 = v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[4] = v15;
  v28[5] = CFSTR("appBundleID");
  v16 = v25;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[5] = v16;
  v28[6] = CFSTR("interactionID");
  v17 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[6] = v17;
  v28[7] = CFSTR("absoluteTimestamp");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[7] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v6)
      goto LABEL_22;
  }
  else
  {

    if (v6)
      goto LABEL_22;
  }

LABEL_22:
  if (!v25)

  if (!v26)
  if (v27)
  {
    if (v5)
      goto LABEL_28;
  }
  else
  {

    if (v5)
    {
LABEL_28:
      if (v4)
        goto LABEL_29;
LABEL_35:

      if (v24)
        goto LABEL_30;
LABEL_36:

      goto LABEL_30;
    }
  }

  if (!v4)
    goto LABEL_35;
LABEL_29:
  if (!v24)
    goto LABEL_36;
LABEL_30:

  return v19;
}

- (NSDate)absoluteTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_absoluteTimestamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 1);
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
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
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
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriExecution taskId](self, "taskId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskId");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriExecution taskId](self, "taskId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_26;
    }
    v13 = -[BMSiriExecution taskStep](self, "taskStep");
    if (v13 == objc_msgSend(v5, "taskStep"))
    {
      -[BMSiriExecution statusReason](self, "statusReason");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statusReason");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[BMSiriExecution statusReason](self, "statusReason");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "statusReason");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_26;
      }
      -[BMSiriExecution slotValue](self, "slotValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "slotValue");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMSiriExecution slotValue](self, "slotValue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "slotValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_26;
      }
      -[BMSiriExecution intentName](self, "intentName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "intentName");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[BMSiriExecution intentName](self, "intentName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "intentName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_26;
      }
      -[BMSiriExecution appBundleID](self, "appBundleID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appBundleID");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        -[BMSiriExecution appBundleID](self, "appBundleID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appBundleID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqual:", v36);

        if (!v37)
          goto LABEL_26;
      }
      -[BMSiriExecution interactionID](self, "interactionID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "interactionID");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v38 == (void *)v39)
      {

      }
      else
      {
        v40 = (void *)v39;
        -[BMSiriExecution interactionID](self, "interactionID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "interactionID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "isEqual:", v42);

        if (!v43)
          goto LABEL_26;
      }
      -[BMSiriExecution absoluteTimestamp](self, "absoluteTimestamp");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45 == v46)
      {
        v12 = 1;
      }
      else
      {
        -[BMSiriExecution absoluteTimestamp](self, "absoluteTimestamp");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "absoluteTimestamp");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v47, "isEqual:", v48);

      }
      goto LABEL_27;
    }
LABEL_26:
    v12 = 0;
LABEL_27:

    goto LABEL_28;
  }
  v12 = 0;
LABEL_28:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)taskId
{
  return self->_taskId;
}

- (int)taskStep
{
  return self->_taskStep;
}

- (NSString)statusReason
{
  return self->_statusReason;
}

- (NSString)slotValue
{
  return self->_slotValue;
}

- (NSString)intentName
{
  return self->_intentName;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)interactionID
{
  return self->_interactionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_intentName, 0);
  objc_storeStrong((id *)&self->_slotValue, 0);
  objc_storeStrong((id *)&self->_statusReason, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
}

+ (unsigned)latestDataVersion
{
  return 3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  _DWORD *v8;

  v5 = a3;
  if (a4 == 3)
  {
    v6 = off_1E5E4B3F0;
  }
  else
  {
    if (a4 != 2)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4B3F8;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[8] = a4;

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
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("taskId"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("taskStep"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("statusReason"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("slotValue"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("intentName"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appBundleID"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("interactionID"), 2, 0, 7, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 8, 0, 1);
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
  return &unk_1E5F1AAD0;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("taskId"), 1, 13, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("taskStep"), 2, 4, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("statusReason"), 3, 13, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("slotValue"), 4, 13, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("intentName"), 5, 13, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appBundleID"), 6, 13, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("interactionID"), 7, 13, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 8, 0, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
