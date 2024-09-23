@implementation BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats

- (BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats)initWithTriggeredMechanism:(int)a3 requestCount:(id)a4 intendedRequestCount:(id)a5 unintendedRequestCount:(id)a6 intendedRequestRatio:(id)a7 triggeredMechanismRequestRatio:(id)a8 modelVersion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *v21;
  int v22;
  int v23;
  int v24;
  double v25;
  double v26;
  objc_super v28;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v28.receiver = self;
  v28.super_class = (Class)BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats;
  v21 = -[BMEventBase init](&v28, sel_init);
  if (v21)
  {
    v21->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v21->_triggeredMechanism = a3;
    if (v15)
    {
      v21->_hasRequestCount = 1;
      v22 = objc_msgSend(v15, "intValue");
    }
    else
    {
      v21->_hasRequestCount = 0;
      v22 = -1;
    }
    v21->_requestCount = v22;
    if (v16)
    {
      v21->_hasIntendedRequestCount = 1;
      v23 = objc_msgSend(v16, "intValue");
    }
    else
    {
      v21->_hasIntendedRequestCount = 0;
      v23 = -1;
    }
    v21->_intendedRequestCount = v23;
    if (v17)
    {
      v21->_hasUnintendedRequestCount = 1;
      v24 = objc_msgSend(v17, "intValue");
    }
    else
    {
      v21->_hasUnintendedRequestCount = 0;
      v24 = -1;
    }
    v21->_unintendedRequestCount = v24;
    if (v18)
    {
      v21->_hasIntendedRequestRatio = 1;
      objc_msgSend(v18, "doubleValue");
    }
    else
    {
      v21->_hasIntendedRequestRatio = 0;
      v25 = -1.0;
    }
    v21->_intendedRequestRatio = v25;
    if (v19)
    {
      v21->_hasTriggeredMechanismRequestRatio = 1;
      objc_msgSend(v19, "doubleValue");
    }
    else
    {
      v21->_hasTriggeredMechanismRequestRatio = 0;
      v26 = -1.0;
    }
    v21->_triggeredMechanismRequestRatio = v26;
    objc_storeStrong((id *)&v21->_modelVersion, a9);
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
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStatsTriggeredMechanismAsString(-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats triggeredMechanism](self, "triggeredMechanism"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats requestCount](self, "requestCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats intendedRequestCount](self, "intendedRequestCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats unintendedRequestCount](self, "unintendedRequestCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats intendedRequestRatio](self, "intendedRequestRatio");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats triggeredMechanismRequestRatio](self, "triggeredMechanismRequestRatio");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats modelVersion](self, "modelVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats with triggeredMechanism: %@, requestCount: %@, intendedRequestCount: %@, unintendedRequestCount: %@, intendedRequestRatio: %@, triggeredMechanismRequestRatio: %@, modelVersion: %@"), v4, v5, v6, v7, v9, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *v5;
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
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  unint64_t v40;
  objc_class *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  NSString *modelVersion;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *v55;
  objc_super v57;

  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats;
  v5 = -[BMEventBase init](&v57, sel_init);
  if (!v5)
    goto LABEL_84;
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
          v5->_hasRequestCount = 1;
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
              goto LABEL_58;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_60;
            }
          }
          v4[*v8] = 1;
LABEL_58:
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_60:
          v53 = 32;
          goto LABEL_69;
        case 2u:
          v27 = 0;
          v28 = 0;
          v22 = 0;
          v5->_hasIntendedRequestCount = 1;
          while (2)
          {
            v29 = *v6;
            v30 = *(_QWORD *)&v4[v29];
            v31 = v30 + 1;
            if (v30 == -1 || v31 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
              *(_QWORD *)&v4[v29] = v31;
              v22 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                v17 = v28++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_64:
          v53 = 36;
          goto LABEL_69;
        case 3u:
          v33 = 0;
          v34 = 0;
          v22 = 0;
          v5->_hasUnintendedRequestCount = 1;
          while (2)
          {
            v35 = *v6;
            v36 = *(_QWORD *)&v4[v35];
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v36);
              *(_QWORD *)&v4[v35] = v37;
              v22 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                v17 = v34++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_68:
          v53 = 40;
LABEL_69:
          *(_DWORD *)((char *)&v5->super.super.isa + v53) = v22;
          continue;
        case 4u:
          v5->_hasIntendedRequestRatio = 1;
          v39 = *v6;
          v40 = *(_QWORD *)&v4[v39];
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v41 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v40);
            *(_QWORD *)&v4[v39] = v40 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v41 = 0;
          }
          v54 = 48;
          goto LABEL_80;
        case 5u:
          v5->_hasTriggeredMechanismRequestRatio = 1;
          v42 = *v6;
          v43 = *(_QWORD *)&v4[v42];
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v41 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v43);
            *(_QWORD *)&v4[v42] = v43 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v41 = 0;
          }
          v54 = 56;
LABEL_80:
          *(Class *)((char *)&v5->super.super.isa + v54) = v41;
          continue;
        case 6u:
          PBReaderReadString();
          v44 = objc_claimAutoreleasedReturnValue();
          modelVersion = v5->_modelVersion;
          v5->_modelVersion = (NSString *)v44;

          continue;
        case 7u:
          v46 = 0;
          v47 = 0;
          v48 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_83;
          continue;
      }
      while (1)
      {
        v49 = *v6;
        v50 = *(_QWORD *)&v4[v49];
        v51 = v50 + 1;
        if (v50 == -1 || v51 > *(_QWORD *)&v4[*v7])
          break;
        v52 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v50);
        *(_QWORD *)&v4[v49] = v51;
        v48 |= (unint64_t)(v52 & 0x7F) << v46;
        if ((v52 & 0x80) == 0)
          goto LABEL_71;
        v46 += 7;
        v17 = v47++ >= 9;
        if (v17)
        {
          LODWORD(v48) = 0;
          goto LABEL_73;
        }
      }
      v4[*v8] = 1;
LABEL_71:
      if (v4[*v8])
        LODWORD(v48) = 0;
LABEL_73:
      if (v48 >= 4)
        LODWORD(v48) = 0;
      v5->_triggeredMechanism = v48;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_83:
    v55 = 0;
  else
LABEL_84:
    v55 = v5;

  return v55;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasRequestCount)
    PBDataWriterWriteInt32Field();
  if (self->_hasIntendedRequestCount)
    PBDataWriterWriteInt32Field();
  v4 = v5;
  if (self->_hasUnintendedRequestCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasIntendedRequestRatio)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasTriggeredMechanismRequestRatio)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_modelVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *v17;
  id v18;
  void *v19;
  id v20;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *v21;
  void *v22;
  id *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id *v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id *v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id *v49;
  id v50;
  uint64_t v51;
  id v52;
  id v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  id *v70;
  id v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("triggeredMechanism"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v21 = 0;
          goto LABEL_34;
        }
        v24 = a4;
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v82 = *MEMORY[0x1E0CB2D50];
        v71 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("requestCount"));
        v83 = v71;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v27);
        v21 = 0;
        v11 = 0;
        *v24 = v28;
        v12 = (void *)v27;
        goto LABEL_33;
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("intendedRequestCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v10;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v71 = 0;
          v21 = 0;
          goto LABEL_33;
        }
        v70 = a4;
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = *MEMORY[0x1E0D025B8];
        v80 = *MEMORY[0x1E0CB2D50];
        v31 = v11;
        v32 = objc_alloc(MEMORY[0x1E0CB3940]);
        v58 = objc_opt_class();
        v33 = v32;
        v11 = v31;
        v22 = (void *)objc_msgSend(v33, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v58, CFSTR("intendedRequestCount"));
        v81 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v13);
        v21 = 0;
        v71 = 0;
        *v70 = v34;
LABEL_32:

        v10 = v68;
LABEL_33:

        goto LABEL_34;
      }
      v71 = v12;
    }
    else
    {
      v71 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("unintendedRequestCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v12;
    v65 = v7;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v22 = 0;
          v21 = 0;
          goto LABEL_32;
        }
        v35 = a4;
        v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = *MEMORY[0x1E0D025B8];
        v78 = *MEMORY[0x1E0CB2D50];
        v38 = v11;
        v39 = objc_alloc(MEMORY[0x1E0CB3940]);
        v59 = objc_opt_class();
        v40 = v39;
        v11 = v38;
        v69 = (id)objc_msgSend(v40, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v59, CFSTR("unintendedRequestCount"));
        v79 = v69;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2, v14);
        v21 = 0;
        v22 = 0;
        *v35 = v41;
        v12 = v64;
        goto LABEL_31;
      }
      v67 = v13;
    }
    else
    {
      v67 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("intendedRequestRatio"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v8;
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v69 = 0;
          v21 = 0;
          goto LABEL_30;
        }
        v17 = self;
        v42 = a4;
        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v44 = *MEMORY[0x1E0D025B8];
        v76 = *MEMORY[0x1E0CB2D50];
        v45 = v11;
        v46 = objc_alloc(MEMORY[0x1E0CB3940]);
        v60 = objc_opt_class();
        v47 = v46;
        v11 = v45;
        v18 = (id)objc_msgSend(v47, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v60, CFSTR("intendedRequestRatio"));
        v77 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v16);
        v21 = 0;
        v69 = 0;
        *v42 = v48;
        goto LABEL_69;
      }
      v15 = a4;
      v69 = v14;
    }
    else
    {
      v15 = a4;
      v69 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("triggeredMechanismRequestRatio"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v11;
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v17 = self;
      v18 = 0;
      goto LABEL_24;
    }
    objc_opt_class();
    v17 = self;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v16;
LABEL_24:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modelVersion"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v15)
          {
            v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v61 = *MEMORY[0x1E0D025B8];
            v72 = *MEMORY[0x1E0CB2D50];
            v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("modelVersion"));
            v73 = v56;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *v15 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v61, 2, v57);

          }
          v20 = 0;
          v21 = 0;
          goto LABEL_28;
        }
        v20 = v19;
      }
      else
      {
        v20 = 0;
      }
      v21 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats initWithTriggeredMechanism:requestCount:intendedRequestCount:unintendedRequestCount:intendedRequestRatio:triggeredMechanismRequestRatio:modelVersion:](v17, "initWithTriggeredMechanism:requestCount:intendedRequestCount:unintendedRequestCount:intendedRequestRatio:triggeredMechanismRequestRatio:modelVersion:", objc_msgSend(v66, "intValue"), v63, v71, v67, v69, v18, v20);
      v17 = v21;
LABEL_28:
      v12 = v64;

      v11 = v63;
LABEL_29:

      self = v17;
      v8 = v66;
LABEL_30:
      v22 = v67;
LABEL_31:

      v7 = v65;
      goto LABEL_32;
    }
    if (v15)
    {
      v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v54 = *MEMORY[0x1E0D025B8];
      v74 = *MEMORY[0x1E0CB2D50];
      v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("triggeredMechanismRequestRatio"));
      v75 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2, v19);
      v21 = 0;
      v18 = 0;
      *v15 = v55;
      goto LABEL_28;
    }
    v18 = 0;
    v21 = 0;
LABEL_69:
    v12 = v64;
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
LABEL_8:
    v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStatsTriggeredMechanismFromString(v7));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v8 = 0;
    v21 = 0;
    goto LABEL_35;
  }
  v49 = a4;
  v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v51 = *MEMORY[0x1E0D025B8];
  v84 = *MEMORY[0x1E0CB2D50];
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("triggeredMechanism"));
  v85[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 2, v10);
  v8 = 0;
  v21 = 0;
  *v49 = v52;
LABEL_34:

LABEL_35:
  return v21;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[7];
  _QWORD v28[9];

  v28[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats triggeredMechanism](self, "triggeredMechanism"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasRequestCount](self, "hasRequestCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats requestCount](self, "requestCount"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasIntendedRequestCount](self, "hasIntendedRequestCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats intendedRequestCount](self, "intendedRequestCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasUnintendedRequestCount](self, "hasUnintendedRequestCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats unintendedRequestCount](self, "unintendedRequestCount"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }
  if (!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasIntendedRequestRatio](self, "hasIntendedRequestRatio")|| (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats intendedRequestRatio](self, "intendedRequestRatio"), fabs(v6) == INFINITY))
  {
    v8 = 0;
  }
  else
  {
    -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats intendedRequestRatio](self, "intendedRequestRatio");
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats intendedRequestRatio](self, "intendedRequestRatio");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasTriggeredMechanismRequestRatio](self, "hasTriggeredMechanismRequestRatio")|| (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats triggeredMechanismRequestRatio](self, "triggeredMechanismRequestRatio"), fabs(v9) == INFINITY))
  {
    v11 = 0;
  }
  else
  {
    -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats triggeredMechanismRequestRatio](self, "triggeredMechanismRequestRatio");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats triggeredMechanismRequestRatio](self, "triggeredMechanismRequestRatio");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats modelVersion](self, "modelVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("triggeredMechanism");
  v13 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v13;
  v28[0] = v13;
  v27[1] = CFSTR("requestCount");
  v14 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v3;
  v22 = (void *)v14;
  v28[1] = v14;
  v27[2] = CFSTR("intendedRequestCount");
  v15 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v4;
  v28[2] = v15;
  v27[3] = CFSTR("unintendedRequestCount");
  v16 = v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[3] = v16;
  v27[4] = CFSTR("intendedRequestRatio");
  v17 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[4] = v17;
  v27[5] = CFSTR("triggeredMechanismRequestRatio");
  v18 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[5] = v18;
  v27[6] = CFSTR("modelVersion");
  v19 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[6] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v11)
      goto LABEL_34;
LABEL_43:

    if (v8)
      goto LABEL_35;
    goto LABEL_44;
  }

  if (!v11)
    goto LABEL_43;
LABEL_34:
  if (v8)
    goto LABEL_35;
LABEL_44:

LABEL_35:
  if (!v26)

  if (!v5)
  if (!v24)
  {

    if (v25)
      goto LABEL_41;
LABEL_46:

    goto LABEL_41;
  }
  if (!v25)
    goto LABEL_46;
LABEL_41:

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats triggeredMechanism](self, "triggeredMechanism");
    if (v6 != objc_msgSend(v5, "triggeredMechanism"))
      goto LABEL_31;
    if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasRequestCount](self, "hasRequestCount")|| objc_msgSend(v5, "hasRequestCount"))
    {
      if (!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasRequestCount](self, "hasRequestCount"))goto LABEL_31;
      if (!objc_msgSend(v5, "hasRequestCount"))
        goto LABEL_31;
      v7 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats requestCount](self, "requestCount");
      if (v7 != objc_msgSend(v5, "requestCount"))
        goto LABEL_31;
    }
    if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasIntendedRequestCount](self, "hasIntendedRequestCount")|| objc_msgSend(v5, "hasIntendedRequestCount"))
    {
      if (!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasIntendedRequestCount](self, "hasIntendedRequestCount"))goto LABEL_31;
      if (!objc_msgSend(v5, "hasIntendedRequestCount"))
        goto LABEL_31;
      v8 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats intendedRequestCount](self, "intendedRequestCount");
      if (v8 != objc_msgSend(v5, "intendedRequestCount"))
        goto LABEL_31;
    }
    if ((!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasUnintendedRequestCount](self, "hasUnintendedRequestCount")&& !objc_msgSend(v5, "hasUnintendedRequestCount")|| -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasUnintendedRequestCount](self, "hasUnintendedRequestCount")&& objc_msgSend(v5, "hasUnintendedRequestCount")&& (v9 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats unintendedRequestCount](self, "unintendedRequestCount"), v9 == objc_msgSend(v5, "unintendedRequestCount")))&& (!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasIntendedRequestRatio](self, "hasIntendedRequestRatio")&& !objc_msgSend(v5, "hasIntendedRequestRatio")|| -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasIntendedRequestRatio](self, "hasIntendedRequestRatio")&& objc_msgSend(v5, "hasIntendedRequestRatio")
       && (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats intendedRequestRatio](self, "intendedRequestRatio"), v11 = v10, objc_msgSend(v5, "intendedRequestRatio"), v11 == v12))&& (!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasTriggeredMechanismRequestRatio](self, "hasTriggeredMechanismRequestRatio")&& !objc_msgSend(v5, "hasTriggeredMechanismRequestRatio")|| -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasTriggeredMechanismRequestRatio](self, "hasTriggeredMechanismRequestRatio")&& objc_msgSend(v5, "hasTriggeredMechanismRequestRatio")&& (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats triggeredMechanismRequestRatio](self, "triggeredMechanismRequestRatio"), v14 = v13, objc_msgSend(v5, "triggeredMechanismRequestRatio"), v14 == v15)))
    {
      -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats modelVersion](self, "modelVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "modelVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 == v17)
      {
        v20 = 1;
      }
      else
      {
        -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats modelVersion](self, "modelVersion");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "modelVersion");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

      }
    }
    else
    {
LABEL_31:
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)triggeredMechanism
{
  return self->_triggeredMechanism;
}

- (int)requestCount
{
  return self->_requestCount;
}

- (BOOL)hasRequestCount
{
  return self->_hasRequestCount;
}

- (void)setHasRequestCount:(BOOL)a3
{
  self->_hasRequestCount = a3;
}

- (int)intendedRequestCount
{
  return self->_intendedRequestCount;
}

- (BOOL)hasIntendedRequestCount
{
  return self->_hasIntendedRequestCount;
}

- (void)setHasIntendedRequestCount:(BOOL)a3
{
  self->_hasIntendedRequestCount = a3;
}

- (int)unintendedRequestCount
{
  return self->_unintendedRequestCount;
}

- (BOOL)hasUnintendedRequestCount
{
  return self->_hasUnintendedRequestCount;
}

- (void)setHasUnintendedRequestCount:(BOOL)a3
{
  self->_hasUnintendedRequestCount = a3;
}

- (double)intendedRequestRatio
{
  return self->_intendedRequestRatio;
}

- (BOOL)hasIntendedRequestRatio
{
  return self->_hasIntendedRequestRatio;
}

- (void)setHasIntendedRequestRatio:(BOOL)a3
{
  self->_hasIntendedRequestRatio = a3;
}

- (double)triggeredMechanismRequestRatio
{
  return self->_triggeredMechanismRequestRatio;
}

- (BOOL)hasTriggeredMechanismRequestRatio
{
  return self->_hasTriggeredMechanismRequestRatio;
}

- (void)setHasTriggeredMechanismRequestRatio:(BOOL)a3
{
  self->_hasTriggeredMechanismRequestRatio = a3;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersion, 0);
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

    v4 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats initByReadFrom:]([BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats alloc], "initByReadFrom:", v7);
    v4[6] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("triggeredMechanism"), 0, 0, 7, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("requestCount"), 0, 0, 1, 2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("intendedRequestCount"), 0, 0, 2, 2, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("unintendedRequestCount"), 0, 0, 3, 2, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("intendedRequestRatio"), 1, 0, 4, 0, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("triggeredMechanismRequestRatio"), 1, 0, 5, 0, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("modelVersion"), 2, 0, 6, 13, 0);
  v11[0] = v3;
  v11[1] = v4;
  v11[2] = v5;
  v11[3] = v6;
  v11[4] = v7;
  v11[5] = v8;
  v11[6] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1FB28;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("triggeredMechanism"), 7, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("requestCount"), 1, 2, 0, v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("intendedRequestCount"), 2, 2, 0);
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("unintendedRequestCount"), 3, 2, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("intendedRequestRatio"), 4, 0, 0);
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("triggeredMechanismRequestRatio"), 5, 0, 0);
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("modelVersion"), 6, 13, 0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
