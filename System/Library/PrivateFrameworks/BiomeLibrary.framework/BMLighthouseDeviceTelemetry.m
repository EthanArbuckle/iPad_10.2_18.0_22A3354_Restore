@implementation BMLighthouseDeviceTelemetry

- (BMLighthouseDeviceTelemetry)initWithVersion:(id)a3 bucketStart:(id)a4 bucketEnd:(id)a5 tasksCount:(id)a6 tasksRun:(id)a7 tasksDeferred:(id)a8 tasksFailed:(id)a9 tasksCompleted:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BMLighthouseDeviceTelemetry *v24;
  int v25;
  double v26;
  double v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  objc_super v34;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v34.receiver = self;
  v34.super_class = (Class)BMLighthouseDeviceTelemetry;
  v24 = -[BMEventBase init](&v34, sel_init);
  if (v24)
  {
    v24->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v16)
    {
      v24->_hasVersion = 1;
      v25 = objc_msgSend(v16, "intValue");
    }
    else
    {
      v24->_hasVersion = 0;
      v25 = -1;
    }
    v24->_version = v25;
    if (v17)
    {
      v24->_hasRaw_bucketStart = 1;
      objc_msgSend(v17, "timeIntervalSince1970");
    }
    else
    {
      v24->_hasRaw_bucketStart = 0;
      v26 = -1.0;
    }
    v24->_raw_bucketStart = v26;
    if (v18)
    {
      v24->_hasRaw_bucketEnd = 1;
      objc_msgSend(v18, "timeIntervalSince1970");
    }
    else
    {
      v24->_hasRaw_bucketEnd = 0;
      v27 = -1.0;
    }
    v24->_raw_bucketEnd = v27;
    if (v19)
    {
      v24->_hasTasksCount = 1;
      v28 = objc_msgSend(v19, "intValue");
    }
    else
    {
      v24->_hasTasksCount = 0;
      v28 = -1;
    }
    v24->_tasksCount = v28;
    if (v20)
    {
      v24->_hasTasksRun = 1;
      v29 = objc_msgSend(v20, "intValue");
    }
    else
    {
      v24->_hasTasksRun = 0;
      v29 = -1;
    }
    v24->_tasksRun = v29;
    if (v21)
    {
      v24->_hasTasksDeferred = 1;
      v30 = objc_msgSend(v21, "intValue");
    }
    else
    {
      v24->_hasTasksDeferred = 0;
      v30 = -1;
    }
    v24->_tasksDeferred = v30;
    if (v22)
    {
      v24->_hasTasksFailed = 1;
      v31 = objc_msgSend(v22, "intValue");
    }
    else
    {
      v24->_hasTasksFailed = 0;
      v31 = -1;
    }
    v24->_tasksFailed = v31;
    if (v23)
    {
      v24->_hasTasksCompleted = 1;
      v32 = objc_msgSend(v23, "intValue");
    }
    else
    {
      v24->_hasTasksCompleted = 0;
      v32 = -1;
    }
    v24->_tasksCompleted = v32;
  }

  return v24;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseDeviceTelemetry version](self, "version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseDeviceTelemetry bucketStart](self, "bucketStart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseDeviceTelemetry bucketEnd](self, "bucketEnd");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksCount](self, "tasksCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksRun](self, "tasksRun"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksDeferred](self, "tasksDeferred"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksFailed](self, "tasksFailed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksCompleted](self, "tasksCompleted"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLighthouseDeviceTelemetry with version: %@, bucketStart: %@, bucketEnd: %@, tasksCount: %@, tasksRun: %@, tasksDeferred: %@, tasksFailed: %@, tasksCompleted: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLighthouseDeviceTelemetry *v5;
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
  unint64_t v28;
  objc_class *v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  BMLighthouseDeviceTelemetry *v64;
  objc_super v66;

  v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)BMLighthouseDeviceTelemetry;
  v5 = -[BMEventBase init](&v66, sel_init);
  if (!v5)
    goto LABEL_103;
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
              goto LABEL_71;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_73;
            }
          }
          v4[*v8] = 1;
LABEL_71:
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_73:
          v62 = 60;
          goto LABEL_94;
        case 2u:
          v5->_hasRaw_bucketStart = 1;
          v27 = *v6;
          v28 = *(_QWORD *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v28);
            *(_QWORD *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v63 = 24;
          goto LABEL_99;
        case 3u:
          v5->_hasRaw_bucketEnd = 1;
          v30 = *v6;
          v31 = *(_QWORD *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v31);
            *(_QWORD *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v63 = 40;
LABEL_99:
          *(Class *)((char *)&v5->super.super.isa + v63) = v29;
          continue;
        case 4u:
          v32 = 0;
          v33 = 0;
          v22 = 0;
          v5->_hasTasksCount = 1;
          while (2)
          {
            v34 = *v6;
            v35 = *(_QWORD *)&v4[v34];
            v36 = v35 + 1;
            if (v35 == -1 || v36 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v35);
              *(_QWORD *)&v4[v34] = v36;
              v22 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v17 = v33++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_77:
          v62 = 64;
          goto LABEL_94;
        case 5u:
          v38 = 0;
          v39 = 0;
          v22 = 0;
          v5->_hasTasksRun = 1;
          while (2)
          {
            v40 = *v6;
            v41 = *(_QWORD *)&v4[v40];
            v42 = v41 + 1;
            if (v41 == -1 || v42 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v41);
              *(_QWORD *)&v4[v40] = v42;
              v22 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v17 = v39++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_81:
          v62 = 68;
          goto LABEL_94;
        case 6u:
          v44 = 0;
          v45 = 0;
          v22 = 0;
          v5->_hasTasksDeferred = 1;
          while (2)
          {
            v46 = *v6;
            v47 = *(_QWORD *)&v4[v46];
            v48 = v47 + 1;
            if (v47 == -1 || v48 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v47);
              *(_QWORD *)&v4[v46] = v48;
              v22 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                v17 = v45++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_85:
          v62 = 72;
          goto LABEL_94;
        case 7u:
          v50 = 0;
          v51 = 0;
          v22 = 0;
          v5->_hasTasksFailed = 1;
          while (2)
          {
            v52 = *v6;
            v53 = *(_QWORD *)&v4[v52];
            v54 = v53 + 1;
            if (v53 == -1 || v54 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v55 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v53);
              *(_QWORD *)&v4[v52] = v54;
              v22 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                v17 = v51++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_89;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_89:
          v62 = 76;
          goto LABEL_94;
        case 8u:
          v56 = 0;
          v57 = 0;
          v22 = 0;
          v5->_hasTasksCompleted = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_102;
          continue;
      }
      while (1)
      {
        v58 = *v6;
        v59 = *(_QWORD *)&v4[v58];
        v60 = v59 + 1;
        if (v59 == -1 || v60 > *(_QWORD *)&v4[*v7])
          break;
        v61 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v59);
        *(_QWORD *)&v4[v58] = v60;
        v22 |= (unint64_t)(v61 & 0x7F) << v56;
        if ((v61 & 0x80) == 0)
          goto LABEL_91;
        v56 += 7;
        v17 = v57++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_93;
        }
      }
      v4[*v8] = 1;
LABEL_91:
      if (v4[*v8])
        LODWORD(v22) = 0;
LABEL_93:
      v62 = 80;
LABEL_94:
      *(_DWORD *)((char *)&v5->super.super.isa + v62) = v22;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_102:
    v64 = 0;
  else
LABEL_103:
    v64 = v5;

  return v64;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasVersion)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRaw_bucketStart)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasRaw_bucketEnd)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasTasksCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasTasksRun)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasTasksDeferred)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasTasksFailed)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasTasksCompleted)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLighthouseDeviceTelemetry writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLighthouseDeviceTelemetry)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  id v13;
  double v14;
  double v15;
  objc_class *v16;
  id v17;
  id v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  id *v23;
  id v24;
  id *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  BMLighthouseDeviceTelemetry *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  BMLighthouseDeviceTelemetry *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id *v54;
  uint64_t v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id *v66;
  id v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  id v73;
  id *v74;
  id *v75;
  id *v76;
  id v77;
  id *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  _QWORD v105[3];

  v105[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bucketStart"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (objc_class *)MEMORY[0x1E0C99D68];
        v12 = v9;
        v13 = [v11 alloc];
        objc_msgSend(v12, "doubleValue");
        v15 = v14;

        v89 = (id)objc_msgSend(v13, "initWithTimeIntervalSince1970:", v15);
      }
      else
      {
        v25 = a4;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v26, "dateFromString:", v9);
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
              a4 = 0;
              goto LABEL_49;
            }
            v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v60 = v9;
            v61 = v8;
            v62 = *MEMORY[0x1E0D025B8];
            v102 = *MEMORY[0x1E0CB2D50];
            v87 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("bucketStart"));
            v103 = v87;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
            v63 = objc_claimAutoreleasedReturnValue();
            v64 = v62;
            v8 = v61;
            v9 = v60;
            v10 = (void *)v63;
            v89 = 0;
            a4 = 0;
            *v25 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v64, 2, v63);
            goto LABEL_48;
          }
          v89 = v9;
        }
      }
    }
    else
    {
      v89 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bucketEnd"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v9;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (objc_class *)MEMORY[0x1E0C99D68];
        v17 = v10;
        v18 = [v16 alloc];
        objc_msgSend(v17, "doubleValue");
        v20 = v19;

        v87 = (id)objc_msgSend(v18, "initWithTimeIntervalSince1970:", v20);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v27, "dateFromString:", v10);
          v87 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v65 = v10;
            if (!a4)
            {
              v87 = 0;
              a4 = 0;
              goto LABEL_48;
            }
            v66 = a4;
            v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v67 = v8;
            v68 = *MEMORY[0x1E0D025B8];
            v100 = *MEMORY[0x1E0CB2D50];
            v69 = v65;
            v86 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("bucketEnd"));
            v101 = v86;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v68;
            v8 = v67;
            v9 = v84;
            v71 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v70, 2, v28);
            v87 = 0;
            a4 = 0;
            *v66 = v71;
            v10 = v69;
LABEL_47:

LABEL_48:
            goto LABEL_49;
          }
          v87 = v10;
        }
      }
    }
    else
    {
      v87 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tasksCount"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v10;
    if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v86 = 0;
          goto LABEL_47;
        }
        v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v40 = v8;
        v41 = *MEMORY[0x1E0D025B8];
        v98 = *MEMORY[0x1E0CB2D50];
        v74 = a4;
        v85 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("tasksCount"));
        v99 = v85;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        v8 = v40;
        v10 = v83;
        a4 = 0;
        v86 = 0;
        *v74 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v42, 2, v29);
        goto LABEL_46;
      }
      v86 = v28;
    }
    else
    {
      v86 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tasksRun"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v85 = 0;
          goto LABEL_46;
        }
        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v44 = v8;
        v45 = *MEMORY[0x1E0D025B8];
        v96 = *MEMORY[0x1E0CB2D50];
        v75 = a4;
        v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("tasksRun"));
        v97 = v46;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v43;
        v37 = (void *)v46;
        v48 = v45;
        v8 = v44;
        v10 = v83;
        a4 = 0;
        v85 = 0;
        *v75 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v48, 2, v30);
LABEL_45:

LABEL_46:
        v9 = v84;
        goto LABEL_47;
      }
      v81 = v28;
      v85 = v29;
    }
    else
    {
      v81 = v28;
      v85 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tasksDeferred"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v8;
    if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v37 = 0;
          goto LABEL_44;
        }
        v76 = a4;
        v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v50 = self;
        v51 = *MEMORY[0x1E0D025B8];
        v94 = *MEMORY[0x1E0CB2D50];
        v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("tasksDeferred"));
        v95 = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51;
        self = v50;
        v10 = v83;
        v53 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v52, 2, v32);
        a4 = 0;
        v37 = 0;
        *v76 = v53;
LABEL_43:

        v8 = v82;
LABEL_44:
        v28 = v81;
        goto LABEL_45;
      }
      v80 = v29;
      v31 = v30;
    }
    else
    {
      v80 = v29;
      v31 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tasksFailed"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v7;
    if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v34 = 0;
          v37 = v31;
          v29 = v80;
          goto LABEL_43;
        }
        v33 = self;
        v77 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v54 = a4;
        v55 = *MEMORY[0x1E0D025B8];
        v92 = *MEMORY[0x1E0CB2D50];
        v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("tasksFailed"));
        v93 = v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v55, 2, v35);
        a4 = 0;
        v34 = 0;
        *v54 = v56;
        v37 = v31;
        v29 = v80;
        goto LABEL_42;
      }
      v33 = self;
      v34 = v32;
    }
    else
    {
      v33 = self;
      v34 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tasksCompleted"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      v37 = v31;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v29 = v80;
        if (a4)
        {
          v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v72 = *MEMORY[0x1E0D025B8];
          v90 = *MEMORY[0x1E0CB2D50];
          v78 = a4;
          v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("tasksCompleted"));
          v91 = v57;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *v78 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v72, 2, v58);

          v36 = 0;
          a4 = 0;
        }
        else
        {
          v36 = 0;
        }
        goto LABEL_42;
      }
      v36 = v35;
    }
    else
    {
      v36 = 0;
      v37 = v31;
    }
    v29 = v80;
    a4 = -[BMLighthouseDeviceTelemetry initWithVersion:bucketStart:bucketEnd:tasksCount:tasksRun:tasksDeferred:tasksFailed:tasksCompleted:](v33, "initWithVersion:bucketStart:bucketEnd:tasksCount:tasksRun:tasksDeferred:tasksFailed:tasksCompleted:", v82, v89, v87, v86, v85, v37, v34, v36);
    v33 = (BMLighthouseDeviceTelemetry *)a4;
LABEL_42:

    self = v33;
    v7 = v79;
    v10 = v83;
    goto LABEL_43;
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
    goto LABEL_50;
  }
  v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v22 = *MEMORY[0x1E0D025B8];
  v104 = *MEMORY[0x1E0CB2D50];
  v23 = a4;
  v89 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("version"));
  v105[0] = v89;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, &v104, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v9);
  v8 = 0;
  a4 = 0;
  *v23 = v24;
LABEL_49:

LABEL_50:
  return (BMLighthouseDeviceTelemetry *)a4;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[8];
  _QWORD v34[10];

  v34[8] = *MEMORY[0x1E0C80C00];
  if (-[BMLighthouseDeviceTelemetry hasVersion](self, "hasVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseDeviceTelemetry version](self, "version"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMLighthouseDeviceTelemetry bucketStart](self, "bucketStart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLighthouseDeviceTelemetry bucketStart](self, "bucketStart");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  -[BMLighthouseDeviceTelemetry bucketEnd](self, "bucketEnd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLighthouseDeviceTelemetry bucketEnd](self, "bucketEnd");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    objc_msgSend(v9, "numberWithDouble:");
    v11 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  if (-[BMLighthouseDeviceTelemetry hasTasksCount](self, "hasTasksCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksCount](self, "tasksCount"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
  if (-[BMLighthouseDeviceTelemetry hasTasksRun](self, "hasTasksRun"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksRun](self, "tasksRun"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  if (-[BMLighthouseDeviceTelemetry hasTasksDeferred](self, "hasTasksDeferred"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksDeferred](self, "tasksDeferred"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if (-[BMLighthouseDeviceTelemetry hasTasksFailed](self, "hasTasksFailed"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksFailed](self, "tasksFailed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  if (-[BMLighthouseDeviceTelemetry hasTasksCompleted](self, "hasTasksCompleted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksCompleted](self, "tasksCompleted"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v33[0] = CFSTR("version");
  v15 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v15;
  v34[0] = v15;
  v33[1] = CFSTR("bucketStart");
  v16 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v16;
  v34[1] = v16;
  v33[2] = CFSTR("bucketEnd");
  v17 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v3;
  v26 = (void *)v17;
  v34[2] = v17;
  v33[3] = CFSTR("tasksCount");
  v18 = v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v7;
  v34[3] = v18;
  v33[4] = CFSTR("tasksRun");
  v19 = v31;
  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v11;
  v34[4] = v19;
  v33[5] = CFSTR("tasksDeferred");
  v21 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[5] = v21;
  v33[6] = CFSTR("tasksFailed");
  v22 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[6] = v22;
  v33[7] = CFSTR("tasksCompleted");
  v23 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[7] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v13)
      goto LABEL_43;
LABEL_53:

    if (v12)
      goto LABEL_44;
    goto LABEL_54;
  }

  if (!v13)
    goto LABEL_53;
LABEL_43:
  if (v12)
    goto LABEL_44;
LABEL_54:

LABEL_44:
  if (!v31)

  if (!v32)
  if (v20)
  {
    if (v29)
      goto LABEL_50;
LABEL_56:

    if (v30)
      goto LABEL_51;
LABEL_57:

    goto LABEL_51;
  }

  if (!v29)
    goto LABEL_56;
LABEL_50:
  if (!v30)
    goto LABEL_57;
LABEL_51:

  return v24;
}

- (NSDate)bucketStart
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_bucketStart)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_bucketStart);
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

- (NSDate)bucketEnd
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_bucketEnd)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_bucketEnd);
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
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMLighthouseDeviceTelemetry hasVersion](self, "hasVersion") || objc_msgSend(v5, "hasVersion"))
    {
      if (!-[BMLighthouseDeviceTelemetry hasVersion](self, "hasVersion"))
        goto LABEL_41;
      if (!objc_msgSend(v5, "hasVersion"))
        goto LABEL_41;
      v6 = -[BMLighthouseDeviceTelemetry version](self, "version");
      if (v6 != objc_msgSend(v5, "version"))
        goto LABEL_41;
    }
    -[BMLighthouseDeviceTelemetry bucketStart](self, "bucketStart");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bucketStart");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMLighthouseDeviceTelemetry bucketStart](self, "bucketStart");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bucketStart");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_41;
    }
    -[BMLighthouseDeviceTelemetry bucketEnd](self, "bucketEnd");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bucketEnd");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMLighthouseDeviceTelemetry bucketEnd](self, "bucketEnd");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bucketEnd");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_41;
    }
    if (!-[BMLighthouseDeviceTelemetry hasTasksCount](self, "hasTasksCount")
      && !objc_msgSend(v5, "hasTasksCount")
      || -[BMLighthouseDeviceTelemetry hasTasksCount](self, "hasTasksCount")
      && objc_msgSend(v5, "hasTasksCount")
      && (v20 = -[BMLighthouseDeviceTelemetry tasksCount](self, "tasksCount"),
          v20 == objc_msgSend(v5, "tasksCount")))
    {
      if (!-[BMLighthouseDeviceTelemetry hasTasksRun](self, "hasTasksRun")
        && !objc_msgSend(v5, "hasTasksRun")
        || -[BMLighthouseDeviceTelemetry hasTasksRun](self, "hasTasksRun")
        && objc_msgSend(v5, "hasTasksRun")
        && (v21 = -[BMLighthouseDeviceTelemetry tasksRun](self, "tasksRun"),
            v21 == objc_msgSend(v5, "tasksRun")))
      {
        if (!-[BMLighthouseDeviceTelemetry hasTasksDeferred](self, "hasTasksDeferred")
          && !objc_msgSend(v5, "hasTasksDeferred")
          || -[BMLighthouseDeviceTelemetry hasTasksDeferred](self, "hasTasksDeferred")
          && objc_msgSend(v5, "hasTasksDeferred")
          && (v22 = -[BMLighthouseDeviceTelemetry tasksDeferred](self, "tasksDeferred"),
              v22 == objc_msgSend(v5, "tasksDeferred")))
        {
          if (!-[BMLighthouseDeviceTelemetry hasTasksFailed](self, "hasTasksFailed")
            && !objc_msgSend(v5, "hasTasksFailed")
            || -[BMLighthouseDeviceTelemetry hasTasksFailed](self, "hasTasksFailed")
            && objc_msgSend(v5, "hasTasksFailed")
            && (v23 = -[BMLighthouseDeviceTelemetry tasksFailed](self, "tasksFailed"),
                v23 == objc_msgSend(v5, "tasksFailed")))
          {
            if (!-[BMLighthouseDeviceTelemetry hasTasksCompleted](self, "hasTasksCompleted")
              && !objc_msgSend(v5, "hasTasksCompleted"))
            {
              v13 = 1;
              goto LABEL_42;
            }
            if (-[BMLighthouseDeviceTelemetry hasTasksCompleted](self, "hasTasksCompleted")
              && objc_msgSend(v5, "hasTasksCompleted"))
            {
              v24 = -[BMLighthouseDeviceTelemetry tasksCompleted](self, "tasksCompleted");
              v13 = v24 == objc_msgSend(v5, "tasksCompleted");
LABEL_42:

              goto LABEL_43;
            }
          }
        }
      }
    }
LABEL_41:
    v13 = 0;
    goto LABEL_42;
  }
  v13 = 0;
LABEL_43:

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

- (int)tasksCount
{
  return self->_tasksCount;
}

- (BOOL)hasTasksCount
{
  return self->_hasTasksCount;
}

- (void)setHasTasksCount:(BOOL)a3
{
  self->_hasTasksCount = a3;
}

- (int)tasksRun
{
  return self->_tasksRun;
}

- (BOOL)hasTasksRun
{
  return self->_hasTasksRun;
}

- (void)setHasTasksRun:(BOOL)a3
{
  self->_hasTasksRun = a3;
}

- (int)tasksDeferred
{
  return self->_tasksDeferred;
}

- (BOOL)hasTasksDeferred
{
  return self->_hasTasksDeferred;
}

- (void)setHasTasksDeferred:(BOOL)a3
{
  self->_hasTasksDeferred = a3;
}

- (int)tasksFailed
{
  return self->_tasksFailed;
}

- (BOOL)hasTasksFailed
{
  return self->_hasTasksFailed;
}

- (void)setHasTasksFailed:(BOOL)a3
{
  self->_hasTasksFailed = a3;
}

- (int)tasksCompleted
{
  return self->_tasksCompleted;
}

- (BOOL)hasTasksCompleted
{
  return self->_hasTasksCompleted;
}

- (void)setHasTasksCompleted:(BOOL)a3
{
  self->_hasTasksCompleted = a3;
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

    v4 = -[BMLighthouseDeviceTelemetry initByReadFrom:]([BMLighthouseDeviceTelemetry alloc], "initByReadFrom:", v7);
    v4[14] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("version"), 0, 0, 1, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bucketStart"), 3, 0, 2, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bucketEnd"), 3, 0, 3, 0, 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tasksCount"), 0, 0, 4, 2, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tasksRun"), 0, 0, 5, 2, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tasksDeferred"), 0, 0, 6, 2, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tasksFailed"), 0, 0, 7, 2, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tasksCompleted"), 0, 0, 8, 2, 0);
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
  return &unk_1E5F1FE28;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("version"), 1, 2, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bucketStart"), 2, 0, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bucketEnd"), 3, 0, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tasksCount"), 4, 2, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tasksRun"), 5, 2, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tasksDeferred"), 6, 2, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tasksFailed"), 7, 2, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tasksCompleted"), 8, 2, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
