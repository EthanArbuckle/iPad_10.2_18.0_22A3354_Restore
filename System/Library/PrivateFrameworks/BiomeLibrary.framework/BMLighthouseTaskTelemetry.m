@implementation BMLighthouseTaskTelemetry

- (BMLighthouseTaskTelemetry)initWithVersion:(id)a3 bucketStart:(id)a4 bucketEnd:(id)a5 taskName:(id)a6 taskState:(id)a7 latestEventTimestamp:(id)a8 countCompleted:(id)a9 countFailed:(id)a10 countDeferred:(id)a11 dailyExecutionLatency:(id)a12 crossExecutionDelay:(id)a13 executionCompletionTime:(id)a14 executionFailureTime:(id)a15 executionDeferralTime:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  BMLighthouseTaskTelemetry *v32;
  int v33;
  double v34;
  double v35;
  double v36;
  int v37;
  int v38;
  int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id obj;
  id v47;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  objc_super v54;

  v21 = a3;
  v22 = a4;
  v23 = a5;
  obj = a6;
  v50 = a6;
  v47 = a7;
  v49 = a7;
  v24 = a8;
  v25 = a9;
  v53 = a10;
  v26 = v23;
  v52 = a11;
  v27 = v22;
  v51 = a12;
  v28 = a13;
  v29 = a14;
  v30 = a15;
  v31 = a16;
  v54.receiver = self;
  v54.super_class = (Class)BMLighthouseTaskTelemetry;
  v32 = -[BMEventBase init](&v54, sel_init);
  if (v32)
  {
    v32->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v21)
    {
      v32->_hasVersion = 1;
      v33 = objc_msgSend(v21, "intValue");
    }
    else
    {
      v32->_hasVersion = 0;
      v33 = -1;
    }
    v32->_version = v33;
    if (v27)
    {
      v32->_hasRaw_bucketStart = 1;
      objc_msgSend(v27, "timeIntervalSince1970");
    }
    else
    {
      v32->_hasRaw_bucketStart = 0;
      v34 = -1.0;
    }
    v32->_raw_bucketStart = v34;
    if (v26)
    {
      v32->_hasRaw_bucketEnd = 1;
      objc_msgSend(v26, "timeIntervalSince1970");
    }
    else
    {
      v32->_hasRaw_bucketEnd = 0;
      v35 = -1.0;
    }
    v32->_raw_bucketEnd = v35;
    objc_storeStrong((id *)&v32->_taskName, obj);
    objc_storeStrong((id *)&v32->_taskState, v47);
    if (v24)
    {
      v32->_hasRaw_latestEventTimestamp = 1;
      objc_msgSend(v24, "timeIntervalSince1970");
    }
    else
    {
      v32->_hasRaw_latestEventTimestamp = 0;
      v36 = -1.0;
    }
    v32->_raw_latestEventTimestamp = v36;
    if (v25)
    {
      v32->_hasCountCompleted = 1;
      v37 = objc_msgSend(v25, "intValue");
    }
    else
    {
      v32->_hasCountCompleted = 0;
      v37 = -1;
    }
    v32->_countCompleted = v37;
    if (v53)
    {
      v32->_hasCountFailed = 1;
      v38 = objc_msgSend(v53, "intValue");
    }
    else
    {
      v32->_hasCountFailed = 0;
      v38 = -1;
    }
    v32->_countFailed = v38;
    if (v52)
    {
      v32->_hasCountDeferred = 1;
      v39 = objc_msgSend(v52, "intValue");
    }
    else
    {
      v32->_hasCountDeferred = 0;
      v39 = -1;
    }
    v32->_countDeferred = v39;
    if (v51)
    {
      v32->_hasDailyExecutionLatency = 1;
      objc_msgSend(v51, "doubleValue");
    }
    else
    {
      v32->_hasDailyExecutionLatency = 0;
      v40 = -1.0;
    }
    v32->_dailyExecutionLatency = v40;
    if (v28)
    {
      v32->_hasCrossExecutionDelay = 1;
      objc_msgSend(v28, "doubleValue");
    }
    else
    {
      v32->_hasCrossExecutionDelay = 0;
      v41 = -1.0;
    }
    v32->_crossExecutionDelay = v41;
    if (v29)
    {
      v32->_hasExecutionCompletionTime = 1;
      objc_msgSend(v29, "doubleValue");
    }
    else
    {
      v32->_hasExecutionCompletionTime = 0;
      v42 = -1.0;
    }
    v32->_executionCompletionTime = v42;
    if (v30)
    {
      v32->_hasExecutionFailureTime = 1;
      objc_msgSend(v30, "doubleValue");
    }
    else
    {
      v32->_hasExecutionFailureTime = 0;
      v43 = -1.0;
    }
    v32->_executionFailureTime = v43;
    if (v31)
    {
      v32->_hasExecutionDeferralTime = 1;
      objc_msgSend(v31, "doubleValue");
    }
    else
    {
      v32->_hasExecutionDeferralTime = 0;
      v44 = -1.0;
    }
    v32->_executionDeferralTime = v44;
  }

  return v32;
}

- (NSString)description
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
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseTaskTelemetry version](self, "version"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskTelemetry bucketStart](self, "bucketStart");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskTelemetry bucketEnd](self, "bucketEnd");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskTelemetry taskName](self, "taskName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskTelemetry taskState](self, "taskState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskTelemetry latestEventTimestamp](self, "latestEventTimestamp");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseTaskTelemetry countCompleted](self, "countCompleted"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseTaskTelemetry countFailed](self, "countFailed"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseTaskTelemetry countDeferred](self, "countDeferred"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMLighthouseTaskTelemetry dailyExecutionLatency](self, "dailyExecutionLatency");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMLighthouseTaskTelemetry crossExecutionDelay](self, "crossExecutionDelay");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMLighthouseTaskTelemetry executionCompletionTime](self, "executionCompletionTime");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[BMLighthouseTaskTelemetry executionFailureTime](self, "executionFailureTime");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[BMLighthouseTaskTelemetry executionDeferralTime](self, "executionDeferralTime");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("BMLighthouseTaskTelemetry with version: %@, bucketStart: %@, bucketEnd: %@, taskName: %@, taskState: %@, latestEventTimestamp: %@, countCompleted: %@, countFailed: %@, countDeferred: %@, dailyExecutionLatency: %@, crossExecutionDelay: %@, executionCompletionTime: %@, executionFailureTime: %@, executionDeferralTime: %@"), v19, v24, v23, v22, v15, v18, v17, v16, v3, v5, v7, v9, v11, v13);

  return (NSString *)v21;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLighthouseTaskTelemetry *v5;
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
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  unsigned int v38;
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
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  BMLighthouseTaskTelemetry *v67;
  objc_super v69;

  v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)BMLighthouseTaskTelemetry;
  v5 = -[BMEventBase init](&v69, sel_init);
  if (!v5)
    goto LABEL_114;
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
              goto LABEL_78;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_80;
            }
          }
          v4[*v8] = 1;
LABEL_78:
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_80:
          v65 = 80;
          goto LABEL_93;
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
          v66 = 24;
          goto LABEL_110;
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
          v66 = 40;
          goto LABEL_110;
        case 4u:
          PBReaderReadString();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = 96;
          goto LABEL_37;
        case 5u:
          PBReaderReadString();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = 104;
LABEL_37:
          v34 = *(Class *)((char *)&v5->super.super.isa + v33);
          *(Class *)((char *)&v5->super.super.isa + v33) = (Class)v32;

          continue;
        case 6u:
          v5->_hasRaw_latestEventTimestamp = 1;
          v35 = *v6;
          v36 = *(_QWORD *)&v4[v35];
          if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v36);
            *(_QWORD *)&v4[v35] = v36 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v66 = 56;
          goto LABEL_110;
        case 7u:
          v37 = 0;
          v38 = 0;
          v22 = 0;
          v5->_hasCountCompleted = 1;
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
              v22 |= (unint64_t)(v42 & 0x7F) << v37;
              if (v42 < 0)
              {
                v37 += 7;
                v17 = v38++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_84:
          v65 = 84;
          goto LABEL_93;
        case 8u:
          v43 = 0;
          v44 = 0;
          v22 = 0;
          v5->_hasCountFailed = 1;
          while (2)
          {
            v45 = *v6;
            v46 = *(_QWORD *)&v4[v45];
            v47 = v46 + 1;
            if (v46 == -1 || v47 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v46);
              *(_QWORD *)&v4[v45] = v47;
              v22 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                v17 = v44++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_88;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_88:
          v65 = 88;
          goto LABEL_93;
        case 9u:
          v49 = 0;
          v50 = 0;
          v22 = 0;
          v5->_hasCountDeferred = 1;
          break;
        case 0xAu:
          v5->_hasDailyExecutionLatency = 1;
          v55 = *v6;
          v56 = *(_QWORD *)&v4[v55];
          if (v56 <= 0xFFFFFFFFFFFFFFF7 && v56 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v56);
            *(_QWORD *)&v4[v55] = v56 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v66 = 112;
          goto LABEL_110;
        case 0xBu:
          v5->_hasCrossExecutionDelay = 1;
          v57 = *v6;
          v58 = *(_QWORD *)&v4[v57];
          if (v58 <= 0xFFFFFFFFFFFFFFF7 && v58 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v58);
            *(_QWORD *)&v4[v57] = v58 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v66 = 120;
          goto LABEL_110;
        case 0xCu:
          v5->_hasExecutionCompletionTime = 1;
          v59 = *v6;
          v60 = *(_QWORD *)&v4[v59];
          if (v60 <= 0xFFFFFFFFFFFFFFF7 && v60 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v60);
            *(_QWORD *)&v4[v59] = v60 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v66 = 128;
          goto LABEL_110;
        case 0xDu:
          v5->_hasExecutionFailureTime = 1;
          v61 = *v6;
          v62 = *(_QWORD *)&v4[v61];
          if (v62 <= 0xFFFFFFFFFFFFFFF7 && v62 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v62);
            *(_QWORD *)&v4[v61] = v62 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v66 = 136;
          goto LABEL_110;
        case 0xEu:
          v5->_hasExecutionDeferralTime = 1;
          v63 = *v6;
          v64 = *(_QWORD *)&v4[v63];
          if (v64 <= 0xFFFFFFFFFFFFFFF7 && v64 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v64);
            *(_QWORD *)&v4[v63] = v64 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v66 = 144;
LABEL_110:
          *(Class *)((char *)&v5->super.super.isa + v66) = v29;
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_113;
          continue;
      }
      while (1)
      {
        v51 = *v6;
        v52 = *(_QWORD *)&v4[v51];
        v53 = v52 + 1;
        if (v52 == -1 || v53 > *(_QWORD *)&v4[*v7])
          break;
        v54 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v52);
        *(_QWORD *)&v4[v51] = v53;
        v22 |= (unint64_t)(v54 & 0x7F) << v49;
        if ((v54 & 0x80) == 0)
          goto LABEL_90;
        v49 += 7;
        v17 = v50++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_92;
        }
      }
      v4[*v8] = 1;
LABEL_90:
      if (v4[*v8])
        LODWORD(v22) = 0;
LABEL_92:
      v65 = 92;
LABEL_93:
      *(_DWORD *)((char *)&v5->super.super.isa + v65) = v22;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_113:
    v67 = 0;
  else
LABEL_114:
    v67 = v5;

  return v67;
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
  if (self->_taskName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_taskState)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasRaw_latestEventTimestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasCountCompleted)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasCountFailed)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasCountDeferred)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasDailyExecutionLatency)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasCrossExecutionDelay)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasExecutionCompletionTime)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasExecutionFailureTime)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasExecutionDeferralTime)
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
  -[BMLighthouseTaskTelemetry writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLighthouseTaskTelemetry)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  BMLighthouseTaskTelemetry *v20;
  id v21;
  void *v22;
  id *v23;
  objc_class *v24;
  void *v25;
  id v26;
  id v27;
  double v28;
  double v29;
  id *v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  objc_class *v38;
  void *v39;
  id v40;
  id v41;
  double v42;
  double v43;
  id v44;
  id *v45;
  id *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  BMLighthouseTaskTelemetry *v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  id v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  id v104;
  uint64_t v105;
  void *v106;
  id v107;
  uint64_t v108;
  void *v109;
  id v110;
  uint64_t v111;
  id v112;
  void *v113;
  uint64_t v114;
  id *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  id v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  id *v126;
  id v127;
  uint64_t v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  id v145;
  id v146;
  void *v147;
  void *v148;
  void *v149;
  id v150;
  id *v151;
  id v152;
  void *v153;
  uint64_t v154;
  void *v155;
  id *v156;
  id v157;
  void *v158;
  id v159;
  void *v160;
  void *v161;
  void *v162;
  id v163;
  id v165;
  uint64_t v166;
  void *v167;
  uint64_t v168;
  id v169;
  uint64_t v170;
  id v171;
  uint64_t v172;
  id v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;
  id v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  id v181;
  uint64_t v182;
  void *v183;
  uint64_t v184;
  void *v185;
  uint64_t v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  id *v191;
  uint64_t v192;
  _QWORD v193[3];

  v193[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v163 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v163 = v6;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bucketStart"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = v6;
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (objc_class *)MEMORY[0x1E0C99D68];
      v10 = v7;
      v11 = [v9 alloc];
      objc_msgSend(v10, "doubleValue");
      v13 = v12;

      v14 = (id)objc_msgSend(v11, "initWithTimeIntervalSince1970:", v13);
LABEL_11:
      v8 = v14;
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
      objc_msgSend(v21, "dateFromString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bucketEnd"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v162 = v8;
      if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v23 = 0;
        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = (objc_class *)MEMORY[0x1E0C99D68];
        v25 = v22;
        v26 = v22;
        v27 = [v24 alloc];
        objc_msgSend(v26, "doubleValue");
        v29 = v28;

        v22 = v25;
        v30 = (id *)objc_msgSend(v27, "initWithTimeIntervalSince1970:", v29);
LABEL_21:
        v23 = v30;
        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v31, "dateFromString:", v22);
        v23 = (id *)objc_claimAutoreleasedReturnValue();

LABEL_24:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("taskName"));
        v32 = objc_claimAutoreleasedReturnValue();
        v160 = (void *)v32;
        if (!v32 || (v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v157 = 0;
          goto LABEL_27;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v157 = v33;
LABEL_27:
          v156 = a4;
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("taskState"));
          v34 = objc_claimAutoreleasedReturnValue();
          v158 = (void *)v34;
          if (v34)
          {
            v35 = (void *)v34;
            a4 = v23;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v159 = v35;
                goto LABEL_33;
              }
              if (v156)
              {
                v55 = v22;
                v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v57 = v7;
                v58 = *MEMORY[0x1E0D025B8];
                v184 = *MEMORY[0x1E0CB2D50];
                v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("taskState"));
                v185 = v59;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v185, &v184, 1);
                v60 = objc_claimAutoreleasedReturnValue();
                v61 = v56;
                v22 = v55;
                v62 = v58;
                v7 = v57;
                v155 = (void *)v60;
                v159 = 0;
                v20 = 0;
                *v156 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v62, 2);
                goto LABEL_45;
              }
              v159 = 0;
              v20 = 0;
              v54 = v157;
LABEL_108:
              v19 = v163;
LABEL_148:

              goto LABEL_149;
            }
          }
          else
          {
            a4 = v23;
          }
          v159 = 0;
LABEL_33:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("latestEventTimestamp"));
          v36 = objc_claimAutoreleasedReturnValue();
          v155 = (void *)v36;
          if (!v36 || (v37 = (void *)v36, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v154 = 0;
LABEL_48:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("countCompleted"));
            v64 = objc_claimAutoreleasedReturnValue();
            v65 = a4;
            v153 = (void *)v64;
            v151 = a4;
            if (v64 && (v66 = (void *)v64, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v156)
                {
                  a4 = v65;
                  v90 = 0;
                  v20 = 0;
                  v54 = v157;
                  v19 = v163;
LABEL_145:
                  v59 = (void *)v154;
                  goto LABEL_146;
                }
                a4 = v65;
                v83 = v22;
                v84 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v85 = v7;
                v86 = *MEMORY[0x1E0D025B8];
                v180 = *MEMORY[0x1E0CB2D50];
                v152 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("countCompleted"));
                v181 = v152;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v181, &v180, 1);
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                v88 = v84;
                v22 = v83;
                v89 = v86;
                v7 = v85;
                v20 = 0;
                v90 = 0;
                v54 = v157;
                *v156 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2, v87);
                v19 = v163;
LABEL_144:

                goto LABEL_145;
              }
              v150 = v66;
            }
            else
            {
              v150 = 0;
            }
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("countFailed"));
            v67 = objc_claimAutoreleasedReturnValue();
            v149 = (void *)v67;
            if (v67 && (v68 = (void *)v67, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v156)
                {
                  a4 = v151;
                  v152 = 0;
                  v20 = 0;
                  v54 = v157;
                  v19 = v163;
LABEL_143:
                  v87 = v149;
                  v90 = v150;
                  goto LABEL_144;
                }
                v91 = v22;
                v92 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v93 = *MEMORY[0x1E0D025B8];
                v178 = *MEMORY[0x1E0CB2D50];
                v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("countFailed"));
                v179 = v82;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1);
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                v95 = v92;
                v22 = v91;
                v20 = 0;
                v152 = 0;
                v54 = v157;
                *v156 = (id)objc_msgSend(v95, "initWithDomain:code:userInfo:", v93, 2, v94);
                v19 = v163;
                goto LABEL_142;
              }
              v152 = v68;
            }
            else
            {
              v152 = 0;
            }
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("countDeferred"));
            v69 = objc_claimAutoreleasedReturnValue();
            v148 = (void *)v69;
            if (!v69 || (v70 = (void *)v69, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v144 = 0;
              goto LABEL_57;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v144 = v70;
LABEL_57:
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dailyExecutionLatency"));
              v71 = objc_claimAutoreleasedReturnValue();
              v143 = v22;
              v147 = (void *)v71;
              if (!v71 || (v72 = (void *)v71, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v73 = 0;
                goto LABEL_60;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v73 = v72;
LABEL_60:
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("crossExecutionDelay"));
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v141 = v7;
                v146 = v73;
                if (!v74 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v75 = 0;
                  goto LABEL_63;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v75 = v74;
LABEL_63:
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("executionCompletionTime"));
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  v142 = v75;
                  if (!v76 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v145 = 0;
                    goto LABEL_66;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v145 = v76;
LABEL_66:
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("executionFailureTime"));
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v77 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v78 = self;
                      v79 = 0;
                      goto LABEL_69;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v78 = self;
                      v79 = v77;
LABEL_69:
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("executionDeferralTime"));
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v80 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v81 = 0;
LABEL_72:
                        v82 = v144;
                        v20 = -[BMLighthouseTaskTelemetry initWithVersion:bucketStart:bucketEnd:taskName:taskState:latestEventTimestamp:countCompleted:countFailed:countDeferred:dailyExecutionLatency:crossExecutionDelay:executionCompletionTime:executionFailureTime:executionDeferralTime:](v78, "initWithVersion:bucketStart:bucketEnd:taskName:taskState:latestEventTimestamp:countCompleted:countFailed:countDeferred:dailyExecutionLatency:crossExecutionDelay:executionCompletionTime:executionFailureTime:executionDeferralTime:", v163, v162, v151, v157, v159, v154, v150, v152, v144, v146, v75, v145, v79, v81);
                        v78 = v20;
LABEL_137:
                        self = v78;

                        goto LABEL_138;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v81 = v80;
                        goto LABEL_72;
                      }
                      v20 = (BMLighthouseTaskTelemetry *)v156;
                      if (v156)
                      {
                        v165 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v140 = *MEMORY[0x1E0D025B8];
                        v166 = *MEMORY[0x1E0CB2D50];
                        v130 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("executionDeferralTime"));
                        v167 = v130;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v167, &v166, 1);
                        v131 = (void *)objc_claimAutoreleasedReturnValue();
                        *v156 = (id)objc_msgSend(v165, "initWithDomain:code:userInfo:", v140, 2, v131);

                        v81 = 0;
                        v20 = 0;
                      }
                      else
                      {
                        v81 = 0;
                      }
LABEL_136:
                      v82 = v144;
                      goto LABEL_137;
                    }
                    if (v156)
                    {
                      v78 = self;
                      v127 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v128 = *MEMORY[0x1E0D025B8];
                      v168 = *MEMORY[0x1E0CB2D50];
                      v81 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("executionFailureTime"));
                      v169 = v81;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v169, &v168, 1);
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
                      v129 = (id)objc_msgSend(v127, "initWithDomain:code:userInfo:", v128, 2, v80);
                      v20 = 0;
                      v79 = 0;
                      *v156 = v129;
                      goto LABEL_136;
                    }
                    v79 = 0;
                    v20 = 0;
LABEL_134:
                    v82 = v144;
LABEL_138:

                    v7 = v141;
                    v54 = v157;
                    goto LABEL_139;
                  }
                  if (v156)
                  {
                    v110 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v111 = *MEMORY[0x1E0D025B8];
                    v170 = *MEMORY[0x1E0CB2D50];
                    v79 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("executionCompletionTime"));
                    v171 = v79;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v171, &v170, 1);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    v20 = 0;
                    v145 = 0;
                    *v156 = (id)objc_msgSend(v110, "initWithDomain:code:userInfo:", v111, 2, v77);
                    goto LABEL_134;
                  }
                  v145 = 0;
                  v20 = 0;
LABEL_129:
                  v54 = v157;
                  v82 = v144;
LABEL_139:

                  v19 = v163;
                  v73 = v146;
                  goto LABEL_140;
                }
                if (v156)
                {
                  v107 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v108 = *MEMORY[0x1E0D025B8];
                  v172 = *MEMORY[0x1E0CB2D50];
                  v145 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("crossExecutionDelay"));
                  v173 = v145;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v173, &v172, 1);
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  v109 = v107;
                  v7 = v141;
                  v20 = 0;
                  v142 = 0;
                  *v156 = (id)objc_msgSend(v109, "initWithDomain:code:userInfo:", v108, 2, v76);
                  goto LABEL_129;
                }
                v142 = 0;
                v20 = 0;
LABEL_127:
                v54 = v157;
                v19 = v163;
                v82 = v144;
LABEL_140:

                v22 = v143;
                goto LABEL_141;
              }
              if (v156)
              {
                v103 = v7;
                v104 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v105 = *MEMORY[0x1E0D025B8];
                v174 = *MEMORY[0x1E0CB2D50];
                v142 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("dailyExecutionLatency"));
                v175 = v142;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v175, &v174, 1);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v106 = v104;
                v7 = v103;
                v20 = 0;
                v73 = 0;
                *v156 = (id)objc_msgSend(v106, "initWithDomain:code:userInfo:", v105, 2, v74);
                goto LABEL_127;
              }
              v73 = 0;
              v20 = 0;
              v54 = v157;
              v19 = v163;
              v82 = v144;
LABEL_141:

              v94 = v148;
              goto LABEL_142;
            }
            if (v156)
            {
              v96 = v22;
              v97 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v98 = v7;
              v99 = *MEMORY[0x1E0D025B8];
              v176 = *MEMORY[0x1E0CB2D50];
              v73 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("countDeferred"));
              v177 = v73;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v177, &v176, 1);
              v100 = objc_claimAutoreleasedReturnValue();
              v101 = v97;
              v22 = v96;
              v102 = v99;
              v7 = v98;
              v147 = (void *)v100;
              v20 = 0;
              *v156 = (id)objc_msgSend(v101, "initWithDomain:code:userInfo:", v102, 2);
              v54 = v157;
              v19 = v163;
              v82 = 0;
              goto LABEL_141;
            }
            v20 = 0;
            v54 = v157;
            v19 = v163;
            v94 = v148;
            v82 = 0;
LABEL_142:
            a4 = v151;

            goto LABEL_143;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v38 = (objc_class *)MEMORY[0x1E0C99D68];
            v39 = v22;
            v40 = v37;
            v41 = [v38 alloc];
            objc_msgSend(v40, "doubleValue");
            v43 = v42;

            v22 = v39;
            v44 = (id)objc_msgSend(v41, "initWithTimeIntervalSince1970:", v43);
LABEL_40:
            v154 = (uint64_t)v44;
            goto LABEL_48;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v63 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
            objc_msgSend(v63, "dateFromString:", v37);
            v154 = objc_claimAutoreleasedReturnValue();

            goto LABEL_48;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v44 = v37;
            goto LABEL_40;
          }
          v59 = v156;
          if (v156)
          {
            v132 = v22;
            v133 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v134 = v7;
            v135 = *MEMORY[0x1E0D025B8];
            v182 = *MEMORY[0x1E0CB2D50];
            v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("latestEventTimestamp"));
            v183 = v90;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v183, &v182, 1);
            v136 = objc_claimAutoreleasedReturnValue();
            v137 = v133;
            v22 = v132;
            v138 = v135;
            v7 = v134;
            v153 = (void *)v136;
            v20 = 0;
            *v156 = (id)objc_msgSend(v137, "initWithDomain:code:userInfo:", v138, 2);
            v59 = 0;
            v54 = v157;
            v19 = v163;
LABEL_146:

            goto LABEL_147;
          }
          v20 = 0;
LABEL_45:
          v54 = v157;
          v19 = v163;
LABEL_147:

          goto LABEL_148;
        }
        if (a4)
        {
          v45 = a4;
          a4 = v23;
          v46 = v45;
          v47 = v22;
          v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v49 = v7;
          v50 = *MEMORY[0x1E0D025B8];
          v186 = *MEMORY[0x1E0CB2D50];
          v159 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("taskName"));
          v187 = v159;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v187, &v186, 1);
          v51 = objc_claimAutoreleasedReturnValue();
          v52 = v48;
          v22 = v47;
          v53 = v50;
          v7 = v49;
          v158 = (void *)v51;
          v54 = 0;
          v20 = 0;
          *v46 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v53, 2);
          goto LABEL_108;
        }
        a4 = v23;
        v54 = 0;
        v20 = 0;
LABEL_115:
        v19 = v163;
LABEL_149:

        v8 = v162;
        goto LABEL_150;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = v22;
        goto LABEL_21;
      }
      if (a4)
      {
        v119 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v120 = v7;
        v121 = *MEMORY[0x1E0D025B8];
        v188 = *MEMORY[0x1E0CB2D50];
        v122 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("bucketEnd"));
        v189 = v122;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v189, &v188, 1);
        v123 = objc_claimAutoreleasedReturnValue();
        v124 = v121;
        v7 = v120;
        v54 = (void *)v122;
        v160 = (void *)v123;
        v125 = (id)objc_msgSend(v119, "initWithDomain:code:userInfo:", v124, 2);
        v126 = a4;
        a4 = 0;
        v20 = 0;
        *v126 = v125;
        goto LABEL_115;
      }
      v20 = 0;
LABEL_132:
      v19 = v163;
LABEL_150:

      v6 = v161;
      goto LABEL_151;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v7;
      goto LABEL_11;
    }
    if (a4)
    {
      v112 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v113 = v7;
      v114 = *MEMORY[0x1E0D025B8];
      v190 = *MEMORY[0x1E0CB2D50];
      v115 = a4;
      a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("bucketStart"));
      v191 = a4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1);
      v116 = objc_claimAutoreleasedReturnValue();
      v117 = v112;
      v22 = (void *)v116;
      v118 = v114;
      v7 = v113;
      v8 = 0;
      v20 = 0;
      *v115 = (id)objc_msgSend(v117, "initWithDomain:code:userInfo:", v118, 2, v116);
      goto LABEL_132;
    }
    v8 = 0;
    v20 = 0;
    v19 = v163;
LABEL_151:

    goto LABEL_152;
  }
  if (a4)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = *MEMORY[0x1E0D025B8];
    v192 = *MEMORY[0x1E0CB2D50];
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("version"));
    v193[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v193, &v192, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v16;
    v7 = (void *)v17;
    v19 = 0;
    v20 = 0;
    *a4 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v18, 2, v17);
    goto LABEL_151;
  }
  v19 = 0;
  v20 = 0;
LABEL_152:

  return v20;
}

- (id)jsonDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  _QWORD v62[14];
  _QWORD v63[16];

  v63[14] = *MEMORY[0x1E0C80C00];
  if (-[BMLighthouseTaskTelemetry hasVersion](self, "hasVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseTaskTelemetry version](self, "version"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  -[BMLighthouseTaskTelemetry bucketStart](self, "bucketStart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLighthouseTaskTelemetry bucketStart](self, "bucketStart");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  -[BMLighthouseTaskTelemetry bucketEnd](self, "bucketEnd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLighthouseTaskTelemetry bucketEnd](self, "bucketEnd");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    objc_msgSend(v9, "numberWithDouble:");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  -[BMLighthouseTaskTelemetry taskName](self, "taskName");
  v12 = objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskTelemetry taskState](self, "taskState");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskTelemetry latestEventTimestamp](self, "latestEventTimestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLighthouseTaskTelemetry latestEventTimestamp](self, "latestEventTimestamp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    objc_msgSend(v14, "numberWithDouble:");
    v60 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v60 = 0;
  }

  if (-[BMLighthouseTaskTelemetry hasCountCompleted](self, "hasCountCompleted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseTaskTelemetry countCompleted](self, "countCompleted"));
    v59 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v59 = 0;
  }
  if (-[BMLighthouseTaskTelemetry hasCountFailed](self, "hasCountFailed"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseTaskTelemetry countFailed](self, "countFailed"));
    v58 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v58 = 0;
  }
  if (-[BMLighthouseTaskTelemetry hasCountDeferred](self, "hasCountDeferred"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseTaskTelemetry countDeferred](self, "countDeferred"));
    v57 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v57 = 0;
  }
  if (!-[BMLighthouseTaskTelemetry hasDailyExecutionLatency](self, "hasDailyExecutionLatency")
    || (-[BMLighthouseTaskTelemetry dailyExecutionLatency](self, "dailyExecutionLatency"), fabs(v16) == INFINITY))
  {
    v56 = 0;
  }
  else
  {
    -[BMLighthouseTaskTelemetry dailyExecutionLatency](self, "dailyExecutionLatency");
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLighthouseTaskTelemetry dailyExecutionLatency](self, "dailyExecutionLatency");
    objc_msgSend(v17, "numberWithDouble:");
    v56 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMLighthouseTaskTelemetry hasCrossExecutionDelay](self, "hasCrossExecutionDelay")
    || (-[BMLighthouseTaskTelemetry crossExecutionDelay](self, "crossExecutionDelay"), fabs(v18) == INFINITY))
  {
    v55 = 0;
  }
  else
  {
    -[BMLighthouseTaskTelemetry crossExecutionDelay](self, "crossExecutionDelay");
    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLighthouseTaskTelemetry crossExecutionDelay](self, "crossExecutionDelay");
    objc_msgSend(v19, "numberWithDouble:");
    v55 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMLighthouseTaskTelemetry hasExecutionCompletionTime](self, "hasExecutionCompletionTime")
    || (-[BMLighthouseTaskTelemetry executionCompletionTime](self, "executionCompletionTime"), fabs(v20) == INFINITY))
  {
    v54 = 0;
  }
  else
  {
    -[BMLighthouseTaskTelemetry executionCompletionTime](self, "executionCompletionTime");
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLighthouseTaskTelemetry executionCompletionTime](self, "executionCompletionTime");
    objc_msgSend(v21, "numberWithDouble:");
    v54 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMLighthouseTaskTelemetry hasExecutionFailureTime](self, "hasExecutionFailureTime")
    || (-[BMLighthouseTaskTelemetry executionFailureTime](self, "executionFailureTime"), fabs(v22) == INFINITY))
  {
    v53 = 0;
  }
  else
  {
    -[BMLighthouseTaskTelemetry executionFailureTime](self, "executionFailureTime");
    v23 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLighthouseTaskTelemetry executionFailureTime](self, "executionFailureTime");
    objc_msgSend(v23, "numberWithDouble:");
    v53 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMLighthouseTaskTelemetry hasExecutionDeferralTime](self, "hasExecutionDeferralTime")
    || (-[BMLighthouseTaskTelemetry executionDeferralTime](self, "executionDeferralTime"), fabs(v24) == INFINITY))
  {
    v26 = 0;
  }
  else
  {
    -[BMLighthouseTaskTelemetry executionDeferralTime](self, "executionDeferralTime");
    v25 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLighthouseTaskTelemetry executionDeferralTime](self, "executionDeferralTime");
    objc_msgSend(v25, "numberWithDouble:");
    v26 = (id)objc_claimAutoreleasedReturnValue();

  }
  v62[0] = CFSTR("version");
  v27 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v27;
  v63[0] = v27;
  v62[1] = CFSTR("bucketStart");
  v28 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v28;
  v63[1] = v28;
  v62[2] = CFSTR("bucketEnd");
  v29 = (uint64_t)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v29;
  v63[2] = v29;
  v62[3] = CFSTR("taskName");
  v30 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v30;
  v63[3] = v30;
  v62[4] = CFSTR("taskState");
  v31 = (uint64_t)v61;
  if (!v61)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v52 = v3;
  v63[4] = v31;
  v62[5] = CFSTR("latestEventTimestamp");
  v32 = (uint64_t)v60;
  if (!v60)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v12;
  v51 = v11;
  v63[5] = v32;
  v62[6] = CFSTR("countCompleted");
  v33 = v59;
  if (!v59)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v31;
  v63[6] = v33;
  v62[7] = CFSTR("countFailed");
  v34 = v58;
  if (!v58)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v63[7] = v34;
  v62[8] = CFSTR("countDeferred");
  v35 = v57;
  if (!v57)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36 = v7;
  v63[8] = v35;
  v62[9] = CFSTR("dailyExecutionLatency");
  v37 = v56;
  if (!v56)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v63[9] = v37;
  v62[10] = CFSTR("crossExecutionDelay");
  v38 = v55;
  if (!v55)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v32;
  v63[10] = v38;
  v62[11] = CFSTR("executionCompletionTime");
  v39 = v54;
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v63[11] = v39;
  v62[12] = CFSTR("executionFailureTime");
  v40 = v53;
  if (!v53)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v63[12] = v40;
  v62[13] = CFSTR("executionDeferralTime");
  v41 = v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v63[13] = v41;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 14);
  v49 = (id)objc_claimAutoreleasedReturnValue();
  if (!v26)

  if (!v53)
  if (!v54)

  if (!v55)
  if (!v56)

  if (!v57)
  if (!v58)

  if (!v59)
  if (!v60)

  if (v61)
  {
    if (v50)
      goto LABEL_90;
  }
  else
  {

    if (v50)
    {
LABEL_90:
      if (v51)
        goto LABEL_91;
      goto LABEL_96;
    }
  }

  if (v51)
  {
LABEL_91:
    if (v36)
      goto LABEL_92;
LABEL_97:

    if (v52)
      goto LABEL_93;
LABEL_98:

    goto LABEL_93;
  }
LABEL_96:

  if (!v36)
    goto LABEL_97;
LABEL_92:
  if (!v52)
    goto LABEL_98;
LABEL_93:

  return v49;
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

- (NSDate)latestEventTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_latestEventTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_latestEventTimestamp);
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
  int v38;
  int v39;
  int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMLighthouseTaskTelemetry hasVersion](self, "hasVersion") || objc_msgSend(v5, "hasVersion"))
    {
      if (!-[BMLighthouseTaskTelemetry hasVersion](self, "hasVersion"))
        goto LABEL_68;
      if (!objc_msgSend(v5, "hasVersion"))
        goto LABEL_68;
      v6 = -[BMLighthouseTaskTelemetry version](self, "version");
      if (v6 != objc_msgSend(v5, "version"))
        goto LABEL_68;
    }
    -[BMLighthouseTaskTelemetry bucketStart](self, "bucketStart");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bucketStart");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMLighthouseTaskTelemetry bucketStart](self, "bucketStart");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bucketStart");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_68;
    }
    -[BMLighthouseTaskTelemetry bucketEnd](self, "bucketEnd");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bucketEnd");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMLighthouseTaskTelemetry bucketEnd](self, "bucketEnd");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bucketEnd");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_68;
    }
    -[BMLighthouseTaskTelemetry taskName](self, "taskName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskName");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMLighthouseTaskTelemetry taskName](self, "taskName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_68;
    }
    -[BMLighthouseTaskTelemetry taskState](self, "taskState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskState");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[BMLighthouseTaskTelemetry taskState](self, "taskState");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskState");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_68;
    }
    -[BMLighthouseTaskTelemetry latestEventTimestamp](self, "latestEventTimestamp");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "latestEventTimestamp");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v32 == (void *)v33)
    {

    }
    else
    {
      v34 = (void *)v33;
      -[BMLighthouseTaskTelemetry latestEventTimestamp](self, "latestEventTimestamp");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "latestEventTimestamp");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqual:", v36);

      if (!v37)
        goto LABEL_68;
    }
    if (!-[BMLighthouseTaskTelemetry hasCountCompleted](self, "hasCountCompleted")
      && !objc_msgSend(v5, "hasCountCompleted")
      || -[BMLighthouseTaskTelemetry hasCountCompleted](self, "hasCountCompleted")
      && objc_msgSend(v5, "hasCountCompleted")
      && (v38 = -[BMLighthouseTaskTelemetry countCompleted](self, "countCompleted"),
          v38 == objc_msgSend(v5, "countCompleted")))
    {
      if (!-[BMLighthouseTaskTelemetry hasCountFailed](self, "hasCountFailed")
        && !objc_msgSend(v5, "hasCountFailed")
        || -[BMLighthouseTaskTelemetry hasCountFailed](self, "hasCountFailed")
        && objc_msgSend(v5, "hasCountFailed")
        && (v39 = -[BMLighthouseTaskTelemetry countFailed](self, "countFailed"),
            v39 == objc_msgSend(v5, "countFailed")))
      {
        if (!-[BMLighthouseTaskTelemetry hasCountDeferred](self, "hasCountDeferred")
          && !objc_msgSend(v5, "hasCountDeferred")
          || -[BMLighthouseTaskTelemetry hasCountDeferred](self, "hasCountDeferred")
          && objc_msgSend(v5, "hasCountDeferred")
          && (v40 = -[BMLighthouseTaskTelemetry countDeferred](self, "countDeferred"),
              v40 == objc_msgSend(v5, "countDeferred")))
        {
          if (!-[BMLighthouseTaskTelemetry hasDailyExecutionLatency](self, "hasDailyExecutionLatency")
            && !objc_msgSend(v5, "hasDailyExecutionLatency")
            || -[BMLighthouseTaskTelemetry hasDailyExecutionLatency](self, "hasDailyExecutionLatency")
            && objc_msgSend(v5, "hasDailyExecutionLatency")
            && (-[BMLighthouseTaskTelemetry dailyExecutionLatency](self, "dailyExecutionLatency"),
                v42 = v41,
                objc_msgSend(v5, "dailyExecutionLatency"),
                v42 == v43))
          {
            if (!-[BMLighthouseTaskTelemetry hasCrossExecutionDelay](self, "hasCrossExecutionDelay")
              && !objc_msgSend(v5, "hasCrossExecutionDelay")
              || -[BMLighthouseTaskTelemetry hasCrossExecutionDelay](self, "hasCrossExecutionDelay")
              && objc_msgSend(v5, "hasCrossExecutionDelay")
              && (-[BMLighthouseTaskTelemetry crossExecutionDelay](self, "crossExecutionDelay"),
                  v45 = v44,
                  objc_msgSend(v5, "crossExecutionDelay"),
                  v45 == v46))
            {
              if (!-[BMLighthouseTaskTelemetry hasExecutionCompletionTime](self, "hasExecutionCompletionTime")
                && !objc_msgSend(v5, "hasExecutionCompletionTime")
                || -[BMLighthouseTaskTelemetry hasExecutionCompletionTime](self, "hasExecutionCompletionTime")
                && objc_msgSend(v5, "hasExecutionCompletionTime")
                && (-[BMLighthouseTaskTelemetry executionCompletionTime](self, "executionCompletionTime"),
                    v48 = v47,
                    objc_msgSend(v5, "executionCompletionTime"),
                    v48 == v49))
              {
                if (!-[BMLighthouseTaskTelemetry hasExecutionFailureTime](self, "hasExecutionFailureTime")
                  && !objc_msgSend(v5, "hasExecutionFailureTime")
                  || -[BMLighthouseTaskTelemetry hasExecutionFailureTime](self, "hasExecutionFailureTime")
                  && objc_msgSend(v5, "hasExecutionFailureTime")
                  && (-[BMLighthouseTaskTelemetry executionFailureTime](self, "executionFailureTime"),
                      v51 = v50,
                      objc_msgSend(v5, "executionFailureTime"),
                      v51 == v52))
                {
                  if (!-[BMLighthouseTaskTelemetry hasExecutionDeferralTime](self, "hasExecutionDeferralTime")
                    && !objc_msgSend(v5, "hasExecutionDeferralTime"))
                  {
                    v13 = 1;
                    goto LABEL_69;
                  }
                  if (-[BMLighthouseTaskTelemetry hasExecutionDeferralTime](self, "hasExecutionDeferralTime")
                    && objc_msgSend(v5, "hasExecutionDeferralTime"))
                  {
                    -[BMLighthouseTaskTelemetry executionDeferralTime](self, "executionDeferralTime");
                    v54 = v53;
                    objc_msgSend(v5, "executionDeferralTime");
                    v13 = v54 == v55;
LABEL_69:

                    goto LABEL_70;
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_68:
    v13 = 0;
    goto LABEL_69;
  }
  v13 = 0;
LABEL_70:

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

- (int)countCompleted
{
  return self->_countCompleted;
}

- (BOOL)hasCountCompleted
{
  return self->_hasCountCompleted;
}

- (void)setHasCountCompleted:(BOOL)a3
{
  self->_hasCountCompleted = a3;
}

- (int)countFailed
{
  return self->_countFailed;
}

- (BOOL)hasCountFailed
{
  return self->_hasCountFailed;
}

- (void)setHasCountFailed:(BOOL)a3
{
  self->_hasCountFailed = a3;
}

- (int)countDeferred
{
  return self->_countDeferred;
}

- (BOOL)hasCountDeferred
{
  return self->_hasCountDeferred;
}

- (void)setHasCountDeferred:(BOOL)a3
{
  self->_hasCountDeferred = a3;
}

- (double)dailyExecutionLatency
{
  return self->_dailyExecutionLatency;
}

- (BOOL)hasDailyExecutionLatency
{
  return self->_hasDailyExecutionLatency;
}

- (void)setHasDailyExecutionLatency:(BOOL)a3
{
  self->_hasDailyExecutionLatency = a3;
}

- (double)crossExecutionDelay
{
  return self->_crossExecutionDelay;
}

- (BOOL)hasCrossExecutionDelay
{
  return self->_hasCrossExecutionDelay;
}

- (void)setHasCrossExecutionDelay:(BOOL)a3
{
  self->_hasCrossExecutionDelay = a3;
}

- (double)executionCompletionTime
{
  return self->_executionCompletionTime;
}

- (BOOL)hasExecutionCompletionTime
{
  return self->_hasExecutionCompletionTime;
}

- (void)setHasExecutionCompletionTime:(BOOL)a3
{
  self->_hasExecutionCompletionTime = a3;
}

- (double)executionFailureTime
{
  return self->_executionFailureTime;
}

- (BOOL)hasExecutionFailureTime
{
  return self->_hasExecutionFailureTime;
}

- (void)setHasExecutionFailureTime:(BOOL)a3
{
  self->_hasExecutionFailureTime = a3;
}

- (double)executionDeferralTime
{
  return self->_executionDeferralTime;
}

- (BOOL)hasExecutionDeferralTime
{
  return self->_hasExecutionDeferralTime;
}

- (void)setHasExecutionDeferralTime:(BOOL)a3
{
  self->_hasExecutionDeferralTime = a3;
}

- (void).cxx_destruct
{
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

    v4 = -[BMLighthouseTaskTelemetry initByReadFrom:]([BMLighthouseTaskTelemetry alloc], "initByReadFrom:", v7);
    v4[19] = 0;

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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[16];

  v18[14] = *MEMORY[0x1E0C80C00];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("version"), 0, 0, 1, 2, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bucketStart"), 3, 0, 2, 0, 2);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bucketEnd"), 3, 0, 3, 0, 2);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("taskName"), 2, 0, 4, 13, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("taskState"), 2, 0, 5, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("latestEventTimestamp"), 3, 0, 6, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("countCompleted"), 0, 0, 7, 2, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("countFailed"), 0, 0, 8, 2, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("countDeferred"), 0, 0, 9, 2, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dailyExecutionLatency"), 1, 0, 10, 0, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("crossExecutionDelay"), 1, 0, 11, 0, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("executionCompletionTime"), 1, 0, 12, 0, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("executionFailureTime"), 1, 0, 13, 0, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("executionDeferralTime"), 1, 0, 14, 0, 0);
  v18[0] = v17;
  v18[1] = v16;
  v18[2] = v15;
  v18[3] = v14;
  v18[4] = v2;
  v18[5] = v3;
  v18[6] = v4;
  v18[7] = v5;
  v18[8] = v6;
  v18[9] = v13;
  v18[10] = v7;
  v18[11] = v12;
  v18[12] = v8;
  v18[13] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 14);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B718;
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
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[16];

  v18[14] = *MEMORY[0x1E0C80C00];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("version"), 1, 2, 0);
  v18[0] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bucketStart"), 2, 0, 0);
  v18[1] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bucketEnd"), 3, 0, 0);
  v18[2] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("taskName"), 4, 13, 0);
  v18[3] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("taskState"), 5, 13, 0);
  v18[4] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("latestEventTimestamp"), 6, 0, 0);
  v18[5] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("countCompleted"), 7, 2, 0);
  v18[6] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("countFailed"), 8, 2, 0);
  v18[7] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("countDeferred"), 9, 2, 0);
  v18[8] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dailyExecutionLatency"), 10, 0, 0);
  v18[9] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("crossExecutionDelay"), 11, 0, 0);
  v18[10] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("executionCompletionTime"), 12, 0, 0);
  v18[11] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("executionFailureTime"), 13, 0, 0);
  v18[12] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("executionDeferralTime"), 14, 0, 0);
  v18[13] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
