@implementation BMSiriUserEngagementStatisticsAccumulatedAggregationStats

- (BMSiriUserEngagementStatisticsAccumulatedAggregationStats)initWithAggregationStartTimestamp:(id)a3 numberOfDaysAggregation:(id)a4 aggregationStats:(id)a5 cohortType:(id)a6 intendedRequestRatio:(id)a7 uesScore:(id)a8 mitigationAssetVersion:(id)a9 sdsdRetryCount:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStats *v22;
  double v23;
  int v24;
  double v25;
  double v26;
  int v27;
  id v29;
  id v30;
  objc_super v31;

  v16 = a3;
  v17 = a4;
  v30 = a5;
  v29 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v31.receiver = self;
  v31.super_class = (Class)BMSiriUserEngagementStatisticsAccumulatedAggregationStats;
  v22 = -[BMEventBase init](&v31, sel_init);
  if (v22)
  {
    v22->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v29, v30);
    if (v16)
    {
      v22->_hasAggregationStartTimestamp = 1;
      objc_msgSend(v16, "doubleValue");
    }
    else
    {
      v22->_hasAggregationStartTimestamp = 0;
      v23 = -1.0;
    }
    v22->_aggregationStartTimestamp = v23;
    if (v17)
    {
      v22->_hasNumberOfDaysAggregation = 1;
      v24 = objc_msgSend(v17, "intValue");
    }
    else
    {
      v22->_hasNumberOfDaysAggregation = 0;
      v24 = -1;
    }
    v22->_numberOfDaysAggregation = v24;
    objc_storeStrong((id *)&v22->_aggregationStats, a5);
    objc_storeStrong((id *)&v22->_cohortType, a6);
    if (v18)
    {
      v22->_hasIntendedRequestRatio = 1;
      objc_msgSend(v18, "doubleValue");
    }
    else
    {
      v22->_hasIntendedRequestRatio = 0;
      v25 = -1.0;
    }
    v22->_intendedRequestRatio = v25;
    if (v19)
    {
      v22->_hasUesScore = 1;
      objc_msgSend(v19, "doubleValue");
    }
    else
    {
      v22->_hasUesScore = 0;
      v26 = -1.0;
    }
    v22->_uesScore = v26;
    objc_storeStrong((id *)&v22->_mitigationAssetVersion, a9);
    if (v21)
    {
      v22->_hasSdsdRetryCount = 1;
      v27 = objc_msgSend(v21, "intValue");
    }
    else
    {
      v22->_hasSdsdRetryCount = 0;
      v27 = -1;
    }
    v22->_sdsdRetryCount = v27;
  }

  return v22;
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
  void *v14;
  void *v15;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats aggregationStartTimestamp](self, "aggregationStartTimestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats numberOfDaysAggregation](self, "numberOfDaysAggregation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats aggregationStats](self, "aggregationStats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats cohortType](self, "cohortType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats intendedRequestRatio](self, "intendedRequestRatio");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats uesScore](self, "uesScore");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats mitigationAssetVersion](self, "mitigationAssetVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats sdsdRetryCount](self, "sdsdRetryCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriUserEngagementStatisticsAccumulatedAggregationStats with aggregationStartTimestamp: %@, numberOfDaysAggregation: %@, aggregationStats: %@, cohortType: %@, intendedRequestRatio: %@, uesScore: %@, mitigationAssetVersion: %@, sdsdRetryCount: %@"), v5, v6, v7, v8, v10, v12, v13, v14);

  return (NSString *)v15;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStats *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  int v21;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  int *v30;
  int *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  objc_class *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSArray *aggregationStats;
  int v54;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStats *v55;
  objc_super v57;
  uint64_t v58;
  uint64_t v59;

  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)BMSiriUserEngagementStatisticsAccumulatedAggregationStats;
  v5 = -[BMEventBase init](&v57, sel_init);
  if (!v5)
    goto LABEL_70;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = &OBJC_IVAR___BMMapsRecentConversationsIntent__dataVersion;
    v11 = &OBJC_IVAR___BMMapsRecentConversationsIntent__dataVersion;
    v12 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v7;
        v17 = *(_QWORD *)&v4[v16];
        v18 = v17 + 1;
        if (v17 == -1 || v18 > *(_QWORD *)&v4[*v8])
          break;
        v19 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v17);
        *(_QWORD *)&v4[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0)
          goto LABEL_13;
        v13 += 7;
        v20 = v14++ >= 9;
        if (v20)
        {
          v15 = 0;
          v21 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v21 = v4[*v9];
      if (v4[*v9])
        v15 = 0;
LABEL_15:
      if (v21 || (v15 & 7) == 4)
        break;
      switch((v15 >> 3))
      {
        case 1u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          *((_BYTE *)&v5->super.super.isa + v10[32]) = 1;
          while (1)
          {
            v26 = *v7;
            v27 = *(_QWORD *)&v4[v26];
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)&v4[*v8])
              break;
            v29 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v27);
            *(_QWORD *)&v4[v26] = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if ((v29 & 0x80) == 0)
              goto LABEL_52;
            v23 += 7;
            v20 = v24++ >= 9;
            if (v20)
            {
              LODWORD(v25) = 0;
              goto LABEL_54;
            }
          }
          v4[*v9] = 1;
LABEL_52:
          if (v4[*v9])
            LODWORD(v25) = 0;
LABEL_54:
          v50 = v11[33];
          goto LABEL_59;
        case 2u:
          v58 = 0;
          v59 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_72;
          v30 = v11;
          v31 = v10;
          v32 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats initByReadFrom:]([BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats alloc], "initByReadFrom:", v4);
          if (!v32)
            goto LABEL_72;
          v33 = v32;
          objc_msgSend(v6, "addObject:", v32);
          PBReaderRecallMark();

          v10 = v31;
          v11 = v30;
          continue;
        case 3u:
          PBReaderReadString();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = 56;
          goto LABEL_43;
        case 4u:
          v5->_hasIntendedRequestRatio = 1;
          v36 = *v7;
          v37 = *(_QWORD *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v38 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v37);
            *(_QWORD *)&v4[v36] = v37 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v38 = 0;
          }
          v51 = 64;
          goto LABEL_66;
        case 5u:
          v5->_hasAggregationStartTimestamp = 1;
          v39 = *v7;
          v40 = *(_QWORD *)&v4[v39];
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v38 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v40);
            *(_QWORD *)&v4[v39] = v40 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v38 = 0;
          }
          v51 = 40;
          goto LABEL_66;
        case 6u:
          v5->_hasUesScore = 1;
          v41 = *v7;
          v42 = *(_QWORD *)&v4[v41];
          if (v42 <= 0xFFFFFFFFFFFFFFF7 && v42 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v38 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v42);
            *(_QWORD *)&v4[v41] = v42 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v38 = 0;
          }
          v51 = 72;
LABEL_66:
          *(Class *)((char *)&v5->super.super.isa + v51) = v38;
          continue;
        case 7u:
          PBReaderReadString();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = 80;
LABEL_43:
          v43 = *(Class *)((char *)&v5->super.super.isa + v35);
          *(Class *)((char *)&v5->super.super.isa + v35) = (Class)v34;

          continue;
        case 8u:
          v44 = 0;
          v45 = 0;
          v25 = 0;
          v5->_hasSdsdRetryCount = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_72:

          goto LABEL_69;
      }
      while (1)
      {
        v46 = *v7;
        v47 = *(_QWORD *)&v4[v46];
        v48 = v47 + 1;
        if (v47 == -1 || v48 > *(_QWORD *)&v4[*v8])
          break;
        v49 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v47);
        *(_QWORD *)&v4[v46] = v48;
        v25 |= (unint64_t)(v49 & 0x7F) << v44;
        if ((v49 & 0x80) == 0)
          goto LABEL_56;
        v44 += 7;
        v20 = v45++ >= 9;
        if (v20)
        {
          LODWORD(v25) = 0;
          goto LABEL_58;
        }
      }
      v4[*v9] = 1;
LABEL_56:
      if (v4[*v9])
        LODWORD(v25) = 0;
LABEL_58:
      v50 = 32;
LABEL_59:
      *(_DWORD *)((char *)&v5->super.super.isa + v50) = v25;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v52 = objc_msgSend(v6, "copy");
  aggregationStats = v5->_aggregationStats;
  v5->_aggregationStats = (NSArray *)v52;

  v54 = v4[*v9];
  if (v54)
LABEL_69:
    v55 = 0;
  else
LABEL_70:
    v55 = v5;

  return v55;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hasAggregationStartTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_hasNumberOfDaysAggregation)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_aggregationStats;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_cohortType)
    PBDataWriterWriteStringField();
  if (self->_hasIntendedRequestRatio)
    PBDataWriterWriteDoubleField();
  if (self->_hasUesScore)
    PBDataWriterWriteDoubleField();
  if (self->_mitigationAssetVersion)
    PBDataWriterWriteStringField();
  if (self->_hasSdsdRetryCount)
    PBDataWriterWriteInt32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriUserEngagementStatisticsAccumulatedAggregationStats)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *v19;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStats *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id *v38;
  uint64_t *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStats *v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  void *v92;
  void *v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  id v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  id v112;
  _BYTE v113[128];
  uint64_t v114;
  void *v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  _QWORD v119[3];

  v119[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("aggregationStartTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v24 = *MEMORY[0x1E0D025B8];
        v118 = *MEMORY[0x1E0CB2D50];
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("aggregationStartTimestamp"));
        v119[0] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, &v118, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v9);
        v27 = 0;
        v7 = 0;
        *a4 = v26;
        goto LABEL_75;
      }
      v27 = 0;
      v7 = 0;
      goto LABEL_76;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberOfDaysAggregation"));
  v8 = objc_claimAutoreleasedReturnValue();
  v90 = (void *)v8;
  if (v8 && (v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v28 = v7;
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = *MEMORY[0x1E0D025B8];
        v116 = *MEMORY[0x1E0CB2D50];
        v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numberOfDaysAggregation"));
        v117 = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v29;
        v7 = v28;
        v93 = (void *)v31;
        v33 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v30, 2);
        v27 = 0;
        v25 = 0;
        *a4 = v33;

        goto LABEL_74;
      }
      v25 = 0;
      v27 = 0;
      goto LABEL_75;
    }
    v89 = v9;
  }
  else
  {
    v89 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("aggregationStats"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  v88 = v6;
  if (v12)
  {
    v84 = self;
    v87 = v7;

    v10 = 0;
  }
  else
  {
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v27 = 0;
          v25 = v89;
          goto LABEL_74;
        }
        v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v43 = *MEMORY[0x1E0D025B8];
        v114 = *MEMORY[0x1E0CB2D50];
        v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("aggregationStats"));
        v115 = v92;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v44 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v43, 2, v22);
        v27 = 0;
        *a4 = v44;
LABEL_45:
        v25 = v89;
        goto LABEL_72;
      }
    }
    v84 = self;
    v87 = v7;
  }
  v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v10 = v10;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v95, v113, 16);
  if (!v13)
    goto LABEL_22;
  v14 = v13;
  v15 = *(_QWORD *)v96;
  v83 = v5;
  while (2)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v96 != v15)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = a4;
        if (a4)
        {
          v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0D025B8];
          v111 = *MEMORY[0x1E0CB2D50];
          v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("aggregationStats"));
          v112 = v18;
          v37 = (void *)MEMORY[0x1E0C99D80];
          v38 = &v112;
          v39 = &v111;
LABEL_37:
          objc_msgSend(v37, "dictionaryWithObjects:forKeys:count:", v38, v39, 1);
          v40 = (id)objc_claimAutoreleasedReturnValue();
          v41 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v36, 2, v40);
          v27 = 0;
          *v34 = v41;
LABEL_41:
          v22 = v10;
          v5 = v83;
          self = v84;
          v7 = v87;
          v6 = v88;
          v25 = v89;
          goto LABEL_70;
        }
        goto LABEL_44;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v34 = a4;
        if (a4)
        {
          v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0D025B8];
          v109 = *MEMORY[0x1E0CB2D50];
          v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("aggregationStats"));
          v110 = v18;
          v37 = (void *)MEMORY[0x1E0C99D80];
          v38 = &v110;
          v39 = &v109;
          goto LABEL_37;
        }
LABEL_44:
        v27 = 0;
        v22 = v10;
        v5 = v83;
        self = v84;
        v7 = v87;
        v6 = v88;
        goto LABEL_45;
      }
      v18 = v17;
      v19 = [BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats alloc];
      v94 = 0;
      v20 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats initWithJSONDictionary:error:](v19, "initWithJSONDictionary:error:", v18, &v94);
      v21 = v94;
      if (v21)
      {
        v40 = v21;
        if (a4)
          *a4 = objc_retainAutorelease(v21);

        v27 = 0;
        goto LABEL_41;
      }
      objc_msgSend(v92, "addObject:", v20);

    }
    v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v95, v113, 16);
    v5 = v83;
    if (v14)
      continue;
    break;
  }
LABEL_22:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cohortType"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v22 = 0;
    self = v84;
    goto LABEL_49;
  }
  objc_opt_class();
  self = v84;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = 0;
    goto LABEL_49;
  }
  objc_opt_class();
  v7 = v87;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v18;
LABEL_49:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("intendedRequestRatio"));
    v45 = objc_claimAutoreleasedReturnValue();
    v81 = (void *)v45;
    if (!v45)
    {
      v40 = 0;
      goto LABEL_55;
    }
    v46 = (void *)v45;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = 0;
LABEL_55:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uesScore"));
      v47 = objc_claimAutoreleasedReturnValue();
      v80 = v22;
      v76 = (void *)v47;
      if (!v47 || (v48 = (void *)v47, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v85 = 0;
LABEL_58:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mitigationAssetVersion"));
        v49 = objc_claimAutoreleasedReturnValue();
        v75 = (void *)v49;
        if (v49 && (v50 = (void *)v49, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v77 = v50;
            goto LABEL_61;
          }
          if (a4)
          {
            v79 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v68 = *MEMORY[0x1E0D025B8];
            v101 = *MEMORY[0x1E0CB2D50];
            v52 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("mitigationAssetVersion"));
            v102 = v52;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v68, 2, v51);
            v27 = 0;
            v77 = 0;
            *a4 = v69;
            v25 = v89;
            goto LABEL_65;
          }
          v77 = 0;
          v27 = 0;
          v25 = v89;
        }
        else
        {
          v77 = 0;
LABEL_61:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sdsdRetryCount"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v51 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v52 = 0;
            v25 = v89;
            goto LABEL_64;
          }
          objc_opt_class();
          v25 = v89;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v52 = v51;
LABEL_64:
            self = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats initWithAggregationStartTimestamp:numberOfDaysAggregation:aggregationStats:cohortType:intendedRequestRatio:uesScore:mitigationAssetVersion:sdsdRetryCount:](self, "initWithAggregationStartTimestamp:numberOfDaysAggregation:aggregationStats:cohortType:intendedRequestRatio:uesScore:mitigationAssetVersion:sdsdRetryCount:", v87, v25, v92, v80, v40, v85, v77, v52);
            v27 = self;
          }
          else
          {
            if (a4)
            {
              v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v73 = *MEMORY[0x1E0D025B8];
              v99 = *MEMORY[0x1E0CB2D50];
              v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("sdsdRetryCount"));
              v100 = v70;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              *a4 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v73, 2, v71);

            }
            v52 = 0;
            v27 = 0;
          }
LABEL_65:

          v22 = v80;
        }
        v53 = v75;
LABEL_67:

        v7 = v87;
LABEL_68:

LABEL_69:
LABEL_70:

        goto LABEL_71;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v85 = v48;
        goto LABEL_58;
      }
      if (a4)
      {
        v86 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v65 = *MEMORY[0x1E0D025B8];
        v103 = *MEMORY[0x1E0CB2D50];
        v77 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("uesScore"));
        v104 = v77;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v65;
        v22 = v80;
        v67 = (id)objc_msgSend(v86, "initWithDomain:code:userInfo:", v66, 2, v53);
        v27 = 0;
        v85 = 0;
        *a4 = v67;
        v25 = v89;
        goto LABEL_67;
      }
      v85 = 0;
      v27 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = v46;
        goto LABEL_55;
      }
      if (!a4)
      {
        v40 = 0;
        v27 = 0;
        v7 = v87;
        v25 = v89;
        goto LABEL_69;
      }
      v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v60 = *MEMORY[0x1E0D025B8];
      v105 = *MEMORY[0x1E0CB2D50];
      v61 = v22;
      v62 = objc_alloc(MEMORY[0x1E0CB3940]);
      v72 = objc_opt_class();
      v63 = v62;
      v22 = v61;
      v85 = (id)objc_msgSend(v63, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v72, CFSTR("intendedRequestRatio"));
      v106 = v85;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v60, 2);
      v27 = 0;
      v40 = 0;
      *a4 = v64;
    }
    v7 = v87;
    v25 = v89;
    goto LABEL_68;
  }
  if (a4)
  {
    v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v56 = *MEMORY[0x1E0D025B8];
    v107 = *MEMORY[0x1E0CB2D50];
    v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("cohortType"));
    v108 = v40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = v55;
    v7 = v87;
    v82 = (void *)v57;
    v59 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v56, 2);
    v27 = 0;
    v22 = 0;
    *a4 = v59;
    v25 = v89;

    goto LABEL_70;
  }
  v22 = 0;
  v27 = 0;
  v25 = v89;
LABEL_71:

LABEL_72:
LABEL_74:

  v9 = v90;
LABEL_75:

LABEL_76:
  return v27;
}

- (id)_aggregationStatsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats aggregationStats](self, "aggregationStats", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[8];
  _QWORD v36[10];

  v36[8] = *MEMORY[0x1E0C80C00];
  if (!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasAggregationStartTimestamp](self, "hasAggregationStartTimestamp")|| (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats aggregationStartTimestamp](self, "aggregationStartTimestamp"), fabs(v3) == INFINITY))
  {
    v5 = 0;
  }
  else
  {
    -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats aggregationStartTimestamp](self, "aggregationStartTimestamp");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats aggregationStartTimestamp](self, "aggregationStartTimestamp");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasNumberOfDaysAggregation](self, "hasNumberOfDaysAggregation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats numberOfDaysAggregation](self, "numberOfDaysAggregation"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats _aggregationStatsJSONArray](self, "_aggregationStatsJSONArray");
  v7 = objc_claimAutoreleasedReturnValue();
  -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats cohortType](self, "cohortType");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasIntendedRequestRatio](self, "hasIntendedRequestRatio")|| (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats intendedRequestRatio](self, "intendedRequestRatio"), fabs(v9) == INFINITY))
  {
    v11 = 0;
  }
  else
  {
    -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats intendedRequestRatio](self, "intendedRequestRatio");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats intendedRequestRatio](self, "intendedRequestRatio");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasUesScore](self, "hasUesScore")
    || (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats uesScore](self, "uesScore"), fabs(v12) == INFINITY))
  {
    v14 = 0;
  }
  else
  {
    -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats uesScore](self, "uesScore");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats uesScore](self, "uesScore");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats mitigationAssetVersion](self, "mitigationAssetVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasSdsdRetryCount](self, "hasSdsdRetryCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats sdsdRetryCount](self, "sdsdRetryCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v35[0] = CFSTR("aggregationStartTimestamp");
  v17 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v5;
  v30 = (void *)v17;
  v36[0] = v17;
  v35[1] = CFSTR("numberOfDaysAggregation");
  v18 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v6;
  v29 = (void *)v18;
  v36[1] = v18;
  v35[2] = CFSTR("aggregationStats");
  v19 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v7;
  v28 = (void *)v19;
  v36[2] = v19;
  v35[3] = CFSTR("cohortType");
  v20 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v8;
  v36[3] = v20;
  v35[4] = CFSTR("intendedRequestRatio");
  v21 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v11;
  v36[4] = v21;
  v35[5] = CFSTR("uesScore");
  v23 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36[5] = v23;
  v35[6] = CFSTR("mitigationAssetVersion");
  v24 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36[6] = v24;
  v35[7] = CFSTR("sdsdRetryCount");
  v25 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36[7] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (v15)
      goto LABEL_37;
LABEL_50:

    if (v14)
      goto LABEL_38;
    goto LABEL_51;
  }

  if (!v15)
    goto LABEL_50;
LABEL_37:
  if (v14)
    goto LABEL_38;
LABEL_51:

LABEL_38:
  if (!v22)

  if (!v31)
  if (!v32)

  if (!v33)
  if (!v34)

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasAggregationStartTimestamp](self, "hasAggregationStartTimestamp")|| objc_msgSend(v5, "hasAggregationStartTimestamp"))
    {
      if (!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasAggregationStartTimestamp](self, "hasAggregationStartTimestamp"))goto LABEL_40;
      if (!objc_msgSend(v5, "hasAggregationStartTimestamp"))
        goto LABEL_40;
      -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats aggregationStartTimestamp](self, "aggregationStartTimestamp");
      v7 = v6;
      objc_msgSend(v5, "aggregationStartTimestamp");
      if (v7 != v8)
        goto LABEL_40;
    }
    if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasNumberOfDaysAggregation](self, "hasNumberOfDaysAggregation")|| objc_msgSend(v5, "hasNumberOfDaysAggregation"))
    {
      if (!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasNumberOfDaysAggregation](self, "hasNumberOfDaysAggregation"))goto LABEL_40;
      if (!objc_msgSend(v5, "hasNumberOfDaysAggregation"))
        goto LABEL_40;
      v9 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats numberOfDaysAggregation](self, "numberOfDaysAggregation");
      if (v9 != objc_msgSend(v5, "numberOfDaysAggregation"))
        goto LABEL_40;
    }
    -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats aggregationStats](self, "aggregationStats");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aggregationStats");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v10 == (void *)v11)
    {

    }
    else
    {
      v12 = (void *)v11;
      -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats aggregationStats](self, "aggregationStats");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "aggregationStats");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if (!v15)
        goto LABEL_40;
    }
    -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats cohortType](self, "cohortType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cohortType");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v17 == (void *)v18)
    {

    }
    else
    {
      v19 = (void *)v18;
      -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats cohortType](self, "cohortType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cohortType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqual:", v21);

      if (!v22)
        goto LABEL_40;
    }
    if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasIntendedRequestRatio](self, "hasIntendedRequestRatio")|| objc_msgSend(v5, "hasIntendedRequestRatio"))
    {
      if (!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasIntendedRequestRatio](self, "hasIntendedRequestRatio"))goto LABEL_40;
      if (!objc_msgSend(v5, "hasIntendedRequestRatio"))
        goto LABEL_40;
      -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats intendedRequestRatio](self, "intendedRequestRatio");
      v24 = v23;
      objc_msgSend(v5, "intendedRequestRatio");
      if (v24 != v25)
        goto LABEL_40;
    }
    if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasUesScore](self, "hasUesScore")
      || objc_msgSend(v5, "hasUesScore"))
    {
      if (!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasUesScore](self, "hasUesScore"))
        goto LABEL_40;
      if (!objc_msgSend(v5, "hasUesScore"))
        goto LABEL_40;
      -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats uesScore](self, "uesScore");
      v27 = v26;
      objc_msgSend(v5, "uesScore");
      if (v27 != v28)
        goto LABEL_40;
    }
    -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats mitigationAssetVersion](self, "mitigationAssetVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mitigationAssetVersion");
    v30 = objc_claimAutoreleasedReturnValue();
    if (v29 == (void *)v30)
    {

    }
    else
    {
      v31 = (void *)v30;
      -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats mitigationAssetVersion](self, "mitigationAssetVersion");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mitigationAssetVersion");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqual:", v33);

      if (!v34)
        goto LABEL_40;
    }
    if (!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasSdsdRetryCount](self, "hasSdsdRetryCount")
      && !objc_msgSend(v5, "hasSdsdRetryCount"))
    {
      v16 = 1;
      goto LABEL_41;
    }
    if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasSdsdRetryCount](self, "hasSdsdRetryCount")
      && objc_msgSend(v5, "hasSdsdRetryCount"))
    {
      v35 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats sdsdRetryCount](self, "sdsdRetryCount");
      v16 = v35 == objc_msgSend(v5, "sdsdRetryCount");
LABEL_41:

      goto LABEL_42;
    }
LABEL_40:
    v16 = 0;
    goto LABEL_41;
  }
  v16 = 0;
LABEL_42:

  return v16;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (double)aggregationStartTimestamp
{
  return self->_aggregationStartTimestamp;
}

- (BOOL)hasAggregationStartTimestamp
{
  return self->_hasAggregationStartTimestamp;
}

- (void)setHasAggregationStartTimestamp:(BOOL)a3
{
  self->_hasAggregationStartTimestamp = a3;
}

- (int)numberOfDaysAggregation
{
  return self->_numberOfDaysAggregation;
}

- (BOOL)hasNumberOfDaysAggregation
{
  return self->_hasNumberOfDaysAggregation;
}

- (void)setHasNumberOfDaysAggregation:(BOOL)a3
{
  self->_hasNumberOfDaysAggregation = a3;
}

- (NSArray)aggregationStats
{
  return self->_aggregationStats;
}

- (NSString)cohortType
{
  return self->_cohortType;
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

- (double)uesScore
{
  return self->_uesScore;
}

- (BOOL)hasUesScore
{
  return self->_hasUesScore;
}

- (void)setHasUesScore:(BOOL)a3
{
  self->_hasUesScore = a3;
}

- (NSString)mitigationAssetVersion
{
  return self->_mitigationAssetVersion;
}

- (int)sdsdRetryCount
{
  return self->_sdsdRetryCount;
}

- (BOOL)hasSdsdRetryCount
{
  return self->_hasSdsdRetryCount;
}

- (void)setHasSdsdRetryCount:(BOOL)a3
{
  self->_hasSdsdRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mitigationAssetVersion, 0);
  objc_storeStrong((id *)&self->_cohortType, 0);
  objc_storeStrong((id *)&self->_aggregationStats, 0);
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

    v4 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats initByReadFrom:]([BMSiriUserEngagementStatisticsAccumulatedAggregationStats alloc], "initByReadFrom:", v7);
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
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("aggregationStartTimestamp"), 1, 0, 5, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numberOfDaysAggregation"), 0, 0, 1, 2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("aggregationStats_json"), 5, 1, &__block_literal_global_257_73479);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cohortType"), 2, 0, 3, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("intendedRequestRatio"), 1, 0, 4, 0, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uesScore"), 1, 0, 6, 0, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mitigationAssetVersion"), 2, 0, 7, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sdsdRetryCount"), 0, 0, 8, 2, 0);
  v12[0] = v3;
  v12[1] = v4;
  v12[2] = v5;
  v12[3] = v6;
  v12[4] = v2;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1FB40;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("aggregationStartTimestamp"), 5, 0, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numberOfDaysAggregation"), 1, 2, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("aggregationStats"), 2, 14, objc_opt_class());
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cohortType"), 3, 13, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("intendedRequestRatio"), 4, 0, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uesScore"), 6, 0, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mitigationAssetVersion"), 7, 13, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sdsdRetryCount"), 8, 2, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __68__BMSiriUserEngagementStatisticsAccumulatedAggregationStats_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_aggregationStatsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
