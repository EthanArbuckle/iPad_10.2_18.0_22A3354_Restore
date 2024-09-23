@implementation BMLighthouseTaskStatus

- (BMLighthouseTaskStatus)initWithVersion:(id)a3 taskName:(id)a4 taskState:(id)a5 taskSource:(id)a6 pushMetadata:(id)a7 pullMetadata:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BMLighthouseTaskStatus *v18;
  int v19;
  id v21;
  id v22;
  objc_super v23;

  v14 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMLighthouseTaskStatus;
  v18 = -[BMEventBase init](&v23, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v21, v22);
    if (v14)
    {
      v18->_hasVersion = 1;
      v19 = objc_msgSend(v14, "intValue");
    }
    else
    {
      v18->_hasVersion = 0;
      v19 = -1;
    }
    v18->_version = v19;
    objc_storeStrong((id *)&v18->_taskName, a4);
    objc_storeStrong((id *)&v18->_taskState, a5);
    objc_storeStrong((id *)&v18->_taskSource, a6);
    objc_storeStrong((id *)&v18->_pushMetadata, a7);
    objc_storeStrong((id *)&v18->_pullMetadata, a8);
  }

  return v18;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseTaskStatus version](self, "version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskStatus taskName](self, "taskName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskStatus taskState](self, "taskState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskStatus taskSource](self, "taskSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskStatus pushMetadata](self, "pushMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskStatus pullMetadata](self, "pullMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLighthouseTaskStatus with version: %@, taskName: %@, taskState: %@, taskSource: %@, pushMetadata: %@, pullMetadata: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLighthouseTaskStatus *v5;
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  objc_class *v30;
  uint64_t v31;
  void *v32;
  BMLighthouseTaskStatus *v33;
  objc_super v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMLighthouseTaskStatus;
  v5 = -[BMEventBase init](&v35, sel_init);
  if (!v5)
    goto LABEL_47;
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
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v5->_hasVersion = 1;
          break;
        case 2u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 32;
          goto LABEL_32;
        case 3u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 40;
          goto LABEL_32;
        case 4u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 48;
LABEL_32:
          v29 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

          continue;
        case 5u:
          v36 = 0;
          v37 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_46;
          v30 = -[BMLighthouseTaskStatusPushMetadata initByReadFrom:]([BMLighthouseTaskStatusPushMetadata alloc], "initByReadFrom:", v4);
          if (!v30)
            goto LABEL_46;
          v31 = 56;
          goto LABEL_39;
        case 6u:
          v36 = 0;
          v37 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_46;
          v30 = -[BMLighthouseTaskStatusPullMetadata initByReadFrom:]([BMLighthouseTaskStatusPullMetadata alloc], "initByReadFrom:", v4);
          if (!v30)
            goto LABEL_46;
          v31 = 64;
LABEL_39:
          v32 = *(Class *)((char *)&v5->super.super.isa + v31);
          *(Class *)((char *)&v5->super.super.isa + v31) = v30;

          PBReaderRecallMark();
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_46;
          continue;
      }
      while (1)
      {
        v23 = *v6;
        v24 = *(_QWORD *)&v4[v23];
        v25 = v24 + 1;
        if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
          break;
        v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
        *(_QWORD *)&v4[v23] = v25;
        v22 |= (unint64_t)(v26 & 0x7F) << v20;
        if ((v26 & 0x80) == 0)
          goto LABEL_41;
        v20 += 7;
        v17 = v21++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_43;
        }
      }
      v4[*v8] = 1;
LABEL_41:
      if (v4[*v8])
        LODWORD(v22) = 0;
LABEL_43:
      v5->_version = v22;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_46:
    v33 = 0;
  else
LABEL_47:
    v33 = v5;

  return v33;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasVersion)
    PBDataWriterWriteInt32Field();
  if (self->_taskName)
    PBDataWriterWriteStringField();
  if (self->_taskState)
    PBDataWriterWriteStringField();
  if (self->_taskSource)
    PBDataWriterWriteStringField();
  if (self->_pushMetadata)
  {
    PBDataWriterPlaceMark();
    -[BMLighthouseTaskStatusPushMetadata writeTo:](self->_pushMetadata, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_pullMetadata)
  {
    PBDataWriterPlaceMark();
    -[BMLighthouseTaskStatusPullMetadata writeTo:](self->_pullMetadata, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLighthouseTaskStatus writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLighthouseTaskStatus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BMLighthouseTaskStatusPushMetadata *v13;
  void *v14;
  BMLighthouseTaskStatusPullMetadata *v15;
  BMLighthouseTaskStatus *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id *v27;
  uint64_t v28;
  id *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  id *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  BMLighthouseTaskStatus *v57;
  id v58;
  id v59;
  uint64_t v60;
  BMLighthouseTaskStatusPullMetadata *v61;
  uint64_t v62;
  BMLighthouseTaskStatusPushMetadata *v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  id *v69;
  uint64_t v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v23 = 0;
          v16 = 0;
          goto LABEL_59;
        }
        v25 = v8;
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = a4;
        v28 = *MEMORY[0x1E0D025B8];
        v68 = *MEMORY[0x1E0CB2D50];
        v29 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("taskName"));
        v69 = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v26;
        v8 = v25;
        v31 = v28;
        a4 = v29;
        v16 = 0;
        v23 = 0;
        *v27 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v10);
        goto LABEL_58;
      }
      v56 = v9;
    }
    else
    {
      v56 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v16 = 0;
          goto LABEL_57;
        }
        v34 = v8;
        v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v36 = a4;
        v37 = *MEMORY[0x1E0D025B8];
        v66 = *MEMORY[0x1E0CB2D50];
        v54 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("taskState"));
        v67 = v54;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v35;
        v8 = v34;
        v39 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v37, 2, v11);
        v16 = 0;
        a4 = 0;
        *v36 = v39;
LABEL_56:

        self = v57;
LABEL_57:
        v23 = v56;
LABEL_58:

        v7 = v55;
        goto LABEL_59;
      }
      v52 = v10;
    }
    else
    {
      v52 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v8;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v54 = 0;
          v16 = 0;
          a4 = v52;
          goto LABEL_56;
        }
        v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v41 = *MEMORY[0x1E0D025B8];
        v64 = *MEMORY[0x1E0CB2D50];
        v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("taskSource"));
        v65 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
        v13 = (BMLighthouseTaskStatusPushMetadata *)objc_claimAutoreleasedReturnValue();
        v42 = v40;
        v8 = v53;
        v43 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v41, 2, v13);
        v16 = 0;
        v54 = 0;
        *a4 = v43;
        a4 = v52;
        goto LABEL_54;
      }
      v54 = v11;
    }
    else
    {
      v54 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pushMetadata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = 0;
LABEL_16:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pullMetadata"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v15 = 0;
LABEL_19:
        a4 = v52;
        v16 = -[BMLighthouseTaskStatus initWithVersion:taskName:taskState:taskSource:pushMetadata:pullMetadata:](v57, "initWithVersion:taskName:taskState:taskSource:pushMetadata:pullMetadata:", v53, v56, v52, v54, v13, v15);
        v57 = v16;
LABEL_52:

LABEL_53:
        v17 = v12;
        v8 = v53;
        goto LABEL_54;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v58 = 0;
        v50 = v14;
        v15 = -[BMLighthouseTaskStatusPullMetadata initWithJSONDictionary:error:]([BMLighthouseTaskStatusPullMetadata alloc], "initWithJSONDictionary:error:", v50, &v58);
        v32 = v58;
        if (!v32)
        {

          goto LABEL_19;
        }
        v33 = v32;
        if (a4)
          *a4 = objc_retainAutorelease(v32);

      }
      else
      {
        if (!a4)
        {
          v16 = 0;
          a4 = v52;
          goto LABEL_53;
        }
        v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v49 = *MEMORY[0x1E0D025B8];
        v60 = *MEMORY[0x1E0CB2D50];
        v15 = (BMLighthouseTaskStatusPullMetadata *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("pullMetadata"));
        v61 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v49, 2, v46);

      }
      v16 = 0;
      a4 = v52;
      goto LABEL_52;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v12;
      v59 = 0;
      v13 = -[BMLighthouseTaskStatusPushMetadata initWithJSONDictionary:error:]([BMLighthouseTaskStatusPushMetadata alloc], "initWithJSONDictionary:error:", v17, &v59);
      v18 = v59;
      if (!v18)
      {

        goto LABEL_16;
      }
      v19 = v18;
      if (a4)
        *a4 = objc_retainAutorelease(v18);

      v16 = 0;
    }
    else
    {
      if (!a4)
      {
        v16 = 0;
        a4 = v52;
        goto LABEL_55;
      }
      v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v44 = *MEMORY[0x1E0D025B8];
      v62 = *MEMORY[0x1E0CB2D50];
      v13 = (BMLighthouseTaskStatusPushMetadata *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("pushMetadata"));
      v63 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v44, 2, v45);

      v16 = 0;
      v17 = v12;
    }
    a4 = v52;
    v8 = v53;
LABEL_54:

    v12 = v17;
LABEL_55:

    goto LABEL_56;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v16 = 0;
    v8 = 0;
    goto LABEL_60;
  }
  v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v21 = a4;
  v22 = *MEMORY[0x1E0D025B8];
  v70 = *MEMORY[0x1E0CB2D50];
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("version"));
  v71[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v22, 2, v9);
  v16 = 0;
  v8 = 0;
  *v21 = v24;
LABEL_59:

LABEL_60:
  return v16;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[7];

  v24[6] = *MEMORY[0x1E0C80C00];
  if (-[BMLighthouseTaskStatus hasVersion](self, "hasVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseTaskStatus version](self, "version"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMLighthouseTaskStatus taskName](self, "taskName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskStatus taskState](self, "taskState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskStatus taskSource](self, "taskSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskStatus pushMetadata](self, "pushMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsonDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMLighthouseTaskStatus pullMetadata](self, "pullMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsonDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = CFSTR("version");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v11;
  v22 = (void *)v3;
  v24[0] = v11;
  v23[1] = CFSTR("taskName");
  v12 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v19 = v12;
  v24[1] = v12;
  v23[2] = CFSTR("taskState");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v12, v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[2] = v13;
  v23[3] = CFSTR("taskSource");
  v14 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[3] = v14;
  v23[4] = CFSTR("pushMetadata");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[4] = v15;
  v23[5] = CFSTR("pullMetadata");
  v16 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 6, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v8)
      goto LABEL_18;
  }
  else
  {

    if (v8)
    {
LABEL_18:
      if (v6)
        goto LABEL_19;
      goto LABEL_26;
    }
  }

  if (v6)
  {
LABEL_19:
    if (v5)
      goto LABEL_20;
LABEL_27:

    if (v4)
      goto LABEL_21;
    goto LABEL_28;
  }
LABEL_26:

  if (!v5)
    goto LABEL_27;
LABEL_20:
  if (v4)
    goto LABEL_21;
LABEL_28:

LABEL_21:
  if (!v22)

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMLighthouseTaskStatus hasVersion](self, "hasVersion") || objc_msgSend(v5, "hasVersion"))
    {
      if (!-[BMLighthouseTaskStatus hasVersion](self, "hasVersion"))
        goto LABEL_22;
      if (!objc_msgSend(v5, "hasVersion"))
        goto LABEL_22;
      v6 = -[BMLighthouseTaskStatus version](self, "version");
      if (v6 != objc_msgSend(v5, "version"))
        goto LABEL_22;
    }
    -[BMLighthouseTaskStatus taskName](self, "taskName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskName");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMLighthouseTaskStatus taskName](self, "taskName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_22;
    }
    -[BMLighthouseTaskStatus taskState](self, "taskState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskState");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMLighthouseTaskStatus taskState](self, "taskState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_22;
    }
    -[BMLighthouseTaskStatus taskSource](self, "taskSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskSource");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMLighthouseTaskStatus taskSource](self, "taskSource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskSource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_22;
    }
    -[BMLighthouseTaskStatus pushMetadata](self, "pushMetadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushMetadata");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[BMLighthouseTaskStatus pushMetadata](self, "pushMetadata");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pushMetadata");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
      {
LABEL_22:
        v13 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    -[BMLighthouseTaskStatus pullMetadata](self, "pullMetadata");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pullMetadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33 == v34)
    {
      v13 = 1;
    }
    else
    {
      -[BMLighthouseTaskStatus pullMetadata](self, "pullMetadata");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pullMetadata");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v35, "isEqual:", v36);

    }
    goto LABEL_23;
  }
  v13 = 0;
LABEL_24:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)version
{
  return self->_version;
}

- (BOOL)hasVersion
{
  return self->_hasVersion;
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (NSString)taskName
{
  return self->_taskName;
}

- (NSString)taskState
{
  return self->_taskState;
}

- (NSString)taskSource
{
  return self->_taskSource;
}

- (BMLighthouseTaskStatusPushMetadata)pushMetadata
{
  return self->_pushMetadata;
}

- (BMLighthouseTaskStatusPullMetadata)pullMetadata
{
  return self->_pullMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pullMetadata, 0);
  objc_storeStrong((id *)&self->_pushMetadata, 0);
  objc_storeStrong((id *)&self->_taskSource, 0);
  objc_storeStrong((id *)&self->_taskState, 0);
  objc_storeStrong((id *)&self->_taskName, 0);
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

    v4 = -[BMLighthouseTaskStatus initByReadFrom:]([BMLighthouseTaskStatus alloc], "initByReadFrom:", v7);
    v4[5] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("version"), 0, 0, 1, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("taskName"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("taskState"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("taskSource"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("pushMetadata_json"), 5, 1, &__block_literal_global_54789);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("pullMetadata_json"), 5, 1, &__block_literal_global_161_54790);
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
  return &unk_1E5F1E178;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("version"), 1, 2, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("taskName"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("taskState"), 3, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("taskSource"), 4, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("pushMetadata"), 5, 14, objc_opt_class());
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("pullMetadata"), 6, 14, objc_opt_class());
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __33__BMLighthouseTaskStatus_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pullMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __33__BMLighthouseTaskStatus_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BMLighthouseTaskStatus)initWithVersion:(id)a3 taskName:(id)a4 taskState:(id)a5
{
  return -[BMLighthouseTaskStatus initWithVersion:taskName:taskState:taskSource:pushMetadata:pullMetadata:](self, "initWithVersion:taskName:taskState:taskSource:pushMetadata:pullMetadata:", a3, a4, a5, 0, 0, 0);
}

@end
