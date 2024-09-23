@implementation BMSiriUI

- (BMSiriUI)initWithSessionID:(id)a3 uuid:(id)a4 viewMode:(id)a5 dismissalReason:(id)a6 starting:(id)a7 absoluteTimestamp:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  BMSiriUI *v19;
  double v20;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BMSiriUI;
  v19 = -[BMEventBase init](&v24, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v22, v23);
    objc_storeStrong((id *)&v19->_sessionID, a3);
    objc_storeStrong((id *)&v19->_uuid, a4);
    objc_storeStrong((id *)&v19->_viewMode, a5);
    objc_storeStrong((id *)&v19->_dismissalReason, a6);
    if (v17)
    {
      v19->_hasStarting = 1;
      v19->_starting = objc_msgSend(v17, "BOOLValue");
    }
    else
    {
      v19->_hasStarting = 0;
      v19->_starting = 0;
    }
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriUI sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUI uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUI viewMode](self, "viewMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUI dismissalReason](self, "dismissalReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriUI starting](self, "starting"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUI absoluteTimestamp](self, "absoluteTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriUI with sessionID: %@, uuid: %@, viewMode: %@, dismissalReason: %@, starting: %@, absoluteTimestamp: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriUI *v5;
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
  void *v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  unint64_t v31;
  double v32;
  BMSiriUI *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMSiriUI;
  v5 = -[BMEventBase init](&v35, sel_init);
  if (!v5)
    goto LABEL_46;
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
          goto LABEL_26;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
          goto LABEL_26;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
          goto LABEL_26;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
LABEL_26:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 5u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v5->_hasStarting = 1;
          break;
        case 6u:
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
            goto LABEL_45;
          continue;
      }
      while (1)
      {
        v26 = *v6;
        v27 = *(_QWORD *)&v4[v26];
        v28 = v27 + 1;
        if (v27 == -1 || v28 > *(_QWORD *)&v4[*v7])
          break;
        v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v27);
        *(_QWORD *)&v4[v26] = v28;
        v25 |= (unint64_t)(v29 & 0x7F) << v23;
        if ((v29 & 0x80) == 0)
          goto LABEL_38;
        v23 += 7;
        v17 = v24++ >= 9;
        if (v17)
        {
          v25 = 0;
          goto LABEL_40;
        }
      }
      v4[*v8] = 1;
LABEL_38:
      if (v4[*v8])
        v25 = 0;
LABEL_40:
      v5->_starting = v25 != 0;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_45:
    v33 = 0;
  else
LABEL_46:
    v33 = v5;

  return v33;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sessionID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_viewMode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_dismissalReason)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasStarting)
  {
    PBDataWriterWriteBOOLField();
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
  -[BMSiriUI writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriUI)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  void *v15;
  id *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  BMSiriUI *v21;
  objc_class *v22;
  id v23;
  id v24;
  double v25;
  double v26;
  _QWORD *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  id *v47;
  id *v48;
  _QWORD *v49;
  _QWORD *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  BMSiriUI *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  _QWORD v68[3];

  v68[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v54 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = v9;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("viewMode"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = self;
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v55 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v55 = v10;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dismissalReason"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v8;
        v12 = a4;
        if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v52 = 0;
LABEL_13:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("starting"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v12)
              {
                v14 = 0;
                v21 = 0;
                goto LABEL_52;
              }
              v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v39 = *MEMORY[0x1E0D025B8];
              v59 = *MEMORY[0x1E0CB2D50];
              v49 = v12;
              v12 = (_QWORD *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("starting"));
              v60 = v12;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2, v15);
              v14 = 0;
              v21 = 0;
              *v49 = v40;
              goto LABEL_51;
            }
            v14 = v13;
          }
          else
          {
            v14 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v12 = 0;
LABEL_50:
            v21 = -[BMSiriUI initWithSessionID:uuid:viewMode:dismissalReason:starting:absoluteTimestamp:](v56, "initWithSessionID:uuid:viewMode:dismissalReason:starting:absoluteTimestamp:", v51, v54, v55, v52, v14, v12);
            v56 = v21;
LABEL_51:

            goto LABEL_52;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = (objc_class *)MEMORY[0x1E0C99D68];
            v23 = v15;
            v24 = [v22 alloc];
            objc_msgSend(v23, "doubleValue");
            v26 = v25;

            v27 = (_QWORD *)objc_msgSend(v24, "initWithTimeIntervalSinceReferenceDate:", v26);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v41 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
              objc_msgSend(v41, "dateFromString:", v15);
              v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();

              goto LABEL_50;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v12)
              {
                v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v45 = *MEMORY[0x1E0D025B8];
                v57 = *MEMORY[0x1E0CB2D50];
                v50 = v12;
                v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
                v58 = v43;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                *v50 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v45, 2, v44);

                v12 = 0;
              }
              v21 = 0;
              goto LABEL_51;
            }
            v27 = v15;
          }
          v12 = v27;
          goto LABEL_50;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v52 = v11;
          goto LABEL_13;
        }
        if (a4)
        {
          v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0D025B8];
          v61 = *MEMORY[0x1E0CB2D50];
          v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("dismissalReason"));
          v62 = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v36, 2, v13);
          v52 = 0;
          v21 = 0;
          *v12 = v37;
LABEL_52:

          v8 = v51;
          goto LABEL_53;
        }
        v52 = 0;
        v21 = 0;
LABEL_53:
        v19 = v54;

        self = v56;
        goto LABEL_54;
      }
      if (a4)
      {
        v48 = a4;
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = v8;
        v34 = *MEMORY[0x1E0D025B8];
        v63 = *MEMORY[0x1E0CB2D50];
        v52 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("viewMode"));
        v64 = v52;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        v8 = v33;
        v55 = 0;
        v21 = 0;
        *v48 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v35, 2, v11);
        goto LABEL_53;
      }
      v55 = 0;
      v21 = 0;
      v19 = v54;
LABEL_54:

      goto LABEL_55;
    }
    if (a4)
    {
      v47 = a4;
      v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v29 = v8;
      v30 = *MEMORY[0x1E0D025B8];
      v65 = *MEMORY[0x1E0CB2D50];
      v55 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("uuid"));
      v66 = v55;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      v8 = v29;
      v19 = 0;
      v21 = 0;
      *v47 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v31, 2, v10);
      goto LABEL_54;
    }
    v19 = 0;
    v21 = 0;
LABEL_55:

    goto LABEL_56;
  }
  if (a4)
  {
    v16 = a4;
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = *MEMORY[0x1E0D025B8];
    v67 = *MEMORY[0x1E0CB2D50];
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sessionID"));
    v68[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 2, v9);
    v8 = 0;
    v21 = 0;
    *v16 = v20;
    goto LABEL_55;
  }
  v8 = 0;
  v21 = 0;
LABEL_56:

  return v21;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
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
  void *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[6];
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  -[BMSiriUI sessionID](self, "sessionID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMSiriUI uuid](self, "uuid");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMSiriUI viewMode](self, "viewMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUI dismissalReason](self, "dismissalReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriUI hasStarting](self, "hasStarting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriUI starting](self, "starting"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[BMSiriUI absoluteTimestamp](self, "absoluteTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriUI absoluteTimestamp](self, "absoluteTimestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    objc_msgSend(v9, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  v23 = (void *)v3;
  v24[0] = CFSTR("sessionID");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v20 = v12;
  v22 = (void *)v4;
  v25[0] = v12;
  v24[1] = CFSTR("uuid");
  v13 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[1] = v13;
  v24[2] = CFSTR("viewMode");
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v14;
  v24[3] = CFSTR("dismissalReason");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v15;
  v24[4] = CFSTR("starting");
  v16 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v16;
  v24[5] = CFSTR("absoluteTimestamp");
  v17 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 6, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v7)
      goto LABEL_21;
  }
  else
  {

    if (v7)
    {
LABEL_21:
      if (v6)
        goto LABEL_22;
LABEL_30:

      if (v5)
        goto LABEL_23;
      goto LABEL_31;
    }
  }

  if (!v6)
    goto LABEL_30;
LABEL_22:
  if (v5)
    goto LABEL_23;
LABEL_31:

LABEL_23:
  if (!v22)

  if (!v23)
  return v18;
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
  int v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriUI sessionID](self, "sessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriUI sessionID](self, "sessionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sessionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_24;
    }
    -[BMSiriUI uuid](self, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriUI uuid](self, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_24;
    }
    -[BMSiriUI viewMode](self, "viewMode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewMode");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSiriUI viewMode](self, "viewMode");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "viewMode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_24;
    }
    -[BMSiriUI dismissalReason](self, "dismissalReason");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissalReason");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMSiriUI dismissalReason](self, "dismissalReason");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dismissalReason");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_24;
    }
    if (!-[BMSiriUI hasStarting](self, "hasStarting") && !objc_msgSend(v5, "hasStarting")
      || -[BMSiriUI hasStarting](self, "hasStarting")
      && objc_msgSend(v5, "hasStarting")
      && (v31 = -[BMSiriUI starting](self, "starting"), v31 == objc_msgSend(v5, "starting")))
    {
      -[BMSiriUI absoluteTimestamp](self, "absoluteTimestamp");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33 == v34)
      {
        v12 = 1;
      }
      else
      {
        -[BMSiriUI absoluteTimestamp](self, "absoluteTimestamp");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "absoluteTimestamp");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v35, "isEqual:", v36);

      }
      goto LABEL_25;
    }
LABEL_24:
    v12 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v12 = 0;
LABEL_26:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)viewMode
{
  return self->_viewMode;
}

- (NSString)dismissalReason
{
  return self->_dismissalReason;
}

- (BOOL)starting
{
  return self->_starting;
}

- (BOOL)hasStarting
{
  return self->_hasStarting;
}

- (void)setHasStarting:(BOOL)a3
{
  self->_hasStarting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalReason, 0);
  objc_storeStrong((id *)&self->_viewMode, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
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

    v4 = -[BMSiriUI initByReadFrom:]([BMSiriUI alloc], "initByReadFrom:", v7);
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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sessionID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uuid"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("viewMode"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dismissalReason"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("starting"), 0, 0, 5, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 6, 0, 1);
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1CCF0;
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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sessionID"), 1, 13, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uuid"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("viewMode"), 3, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dismissalReason"), 4, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("starting"), 5, 12, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 6, 0, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
