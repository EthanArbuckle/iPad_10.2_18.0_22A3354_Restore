@implementation BMSiriUserEngagementStatistics

- (BMSiriUserEngagementStatistics)initWithUserEngagementStatsMetadata:(id)a3 dailyAggregatedStats:(id)a4 accumulatedAggregationStats:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMSiriUserEngagementStatistics *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMSiriUserEngagementStatistics;
  v12 = -[BMEventBase init](&v14, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_userEngagementStatsMetadata, a3);
    objc_storeStrong((id *)&v12->_dailyAggregatedStats, a4);
    objc_storeStrong((id *)&v12->_accumulatedAggregationStats, a5);
  }

  return v12;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriUserEngagementStatistics userEngagementStatsMetadata](self, "userEngagementStatsMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUserEngagementStatistics dailyAggregatedStats](self, "dailyAggregatedStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUserEngagementStatistics accumulatedAggregationStats](self, "accumulatedAggregationStats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriUserEngagementStatistics with userEngagementStatsMetadata: %@, dailyAggregatedStats: %@, accumulatedAggregationStats: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriUserEngagementStatistics *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  int v19;
  unint64_t v21;
  objc_class *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  NSArray *accumulatedAggregationStats;
  int v29;
  BMSiriUserEngagementStatistics *v30;
  objc_super v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMSiriUserEngagementStatistics;
  v5 = -[BMEventBase init](&v32, sel_init);
  if (!v5)
    goto LABEL_35;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (v4[*v9])
        goto LABEL_34;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v7;
        v15 = *(_QWORD *)&v4[v14];
        v16 = v15 + 1;
        if (v15 == -1 || v16 > *(_QWORD *)&v4[*v8])
          break;
        v17 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        if (v12++ >= 9)
        {
          v13 = 0;
          v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v19 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v19 || (v13 & 7) == 4)
        goto LABEL_34;
      v21 = v13 >> 3;
      if ((v13 >> 3) == 1)
        break;
      if ((_DWORD)v21 == 2)
      {
        v33 = 0;
        v34 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_36;
        v25 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats initByReadFrom:]([BMSiriUserEngagementStatisticsAccumulatedAggregationStats alloc], "initByReadFrom:", v4);
        if (!v25)
          goto LABEL_36;
        v26 = v25;
        objc_msgSend(v6, "addObject:", v25);
        PBReaderRecallMark();

      }
      else
      {
        if ((_DWORD)v21 == 3)
        {
          v33 = 0;
          v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_36;
          v22 = -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata initByReadFrom:]([BMSiriUserEngagementStatisticsUserEngagementStatsMetadata alloc], "initByReadFrom:", v4);
          if (!v22)
            goto LABEL_36;
          v23 = 24;
LABEL_28:
          v24 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = v22;

          PBReaderRecallMark();
          goto LABEL_33;
        }
        if (!PBReaderSkipValueWithTag())
          goto LABEL_36;
      }
LABEL_33:
      if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
        goto LABEL_34;
    }
    v33 = 0;
    v34 = 0;
    if ((PBReaderPlaceMark() & 1) == 0
      || (v22 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats initByReadFrom:]([BMSiriUserEngagementStatisticsAccumulatedAggregationStats alloc], "initByReadFrom:", v4)) == 0)
    {
LABEL_36:

      goto LABEL_37;
    }
    v23 = 32;
    goto LABEL_28;
  }
LABEL_34:
  v27 = objc_msgSend(v6, "copy");
  accumulatedAggregationStats = v5->_accumulatedAggregationStats;
  v5->_accumulatedAggregationStats = (NSArray *)v27;

  v29 = v4[*v9];
  if (v29)
LABEL_37:
    v30 = 0;
  else
LABEL_35:
    v30 = v5;

  return v30;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_userEngagementStatsMetadata)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata writeTo:](self->_userEngagementStatsMetadata, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_dailyAggregatedStats)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats writeTo:](self->_dailyAggregatedStats, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_accumulatedAggregationStats;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        v15 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4, (_QWORD)v11);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriUserEngagementStatistics writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriUserEngagementStatistics)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *v8;
  id v9;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStats *v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStats *v23;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStats *v24;
  id v25;
  BMSiriUserEngagementStatistics *v26;
  id v27;
  void *v28;
  id v29;
  id *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id *v38;
  uint64_t *v39;
  void *v40;
  uint64_t v42;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStats *v43;
  id *v44;
  void *v45;
  BMSiriUserEngagementStatistics *v46;
  id v47;
  id *v48;
  id *v49;
  BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *v50;
  BMSiriUserEngagementStatisticsAccumulatedAggregationStats *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id v65;
  _BYTE v66[128];
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userEngagementStatsMetadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = a4;
        v31 = *MEMORY[0x1E0D025B8];
        v71 = *MEMORY[0x1E0CB2D50];
        v8 = (BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("userEngagementStatsMetadata"));
        v72[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        *v30 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v31, 2, v9);
        goto LABEL_50;
      }
      v26 = 0;
      goto LABEL_51;
    }
    v9 = v7;
    v61 = 0;
    v8 = -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata initWithJSONDictionary:error:]([BMSiriUserEngagementStatisticsUserEngagementStatsMetadata alloc], "initWithJSONDictionary:error:", v9, &v61);
    v14 = v61;
    if (v14)
    {
      v15 = v14;
      if (a4)
        *a4 = objc_retainAutorelease(v14);

LABEL_37:
      v26 = 0;
      goto LABEL_50;
    }

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dailyAggregatedStats"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v49 = a4;
      v33 = *MEMORY[0x1E0D025B8];
      v69 = *MEMORY[0x1E0CB2D50];
      v70 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("dailyAggregatedStats"));
      v10 = (BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)v70;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      *v49 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v11);
      goto LABEL_49;
    }
    goto LABEL_37;
  }
  v11 = v9;
  v60 = 0;
  v10 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats initWithJSONDictionary:error:]([BMSiriUserEngagementStatisticsAccumulatedAggregationStats alloc], "initWithJSONDictionary:error:", v11, &v60);
  v27 = v60;
  if (v27)
  {
    v28 = v27;
    if (a4)
      *a4 = objc_retainAutorelease(v27);

    goto LABEL_54;
  }

LABEL_7:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accumulatedAggregationStats"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  v54 = v7;
  if (!v13)
  {
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v50 = v8;
      v51 = v10;
      v48 = a4;
      v52 = v6;
      goto LABEL_17;
    }
    if (a4)
    {
      v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v42 = *MEMORY[0x1E0D025B8];
      v67 = *MEMORY[0x1E0CB2D50];
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("accumulatedAggregationStats"));
      v68 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v43 = v10;
      v44 = a4;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *v44 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v42, 2, v45);
      v10 = v43;

      v26 = 0;
      goto LABEL_48;
    }
LABEL_54:
    v26 = 0;
    goto LABEL_49;
  }
  v50 = v8;
  v51 = v10;
  v48 = a4;
  v52 = v6;

  v11 = 0;
LABEL_17:
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v11 = v11;
  v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  if (!v17)
    goto LABEL_27;
  v18 = v17;
  v19 = *(_QWORD *)v57;
  v46 = self;
  v47 = v9;
  while (2)
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v57 != v19)
        objc_enumerationMutation(v11);
      v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        self = v46;
        v34 = v48;
        v8 = v50;
        if (v48)
        {
          v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0D025B8];
          v64 = *MEMORY[0x1E0CB2D50];
          v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("accumulatedAggregationStats"));
          v65 = v22;
          v37 = (void *)MEMORY[0x1E0C99D80];
          v38 = &v65;
          v39 = &v64;
LABEL_42:
          objc_msgSend(v37, "dictionaryWithObjects:forKeys:count:", v38, v39, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *v34 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v36, 2, v40);
LABEL_46:

        }
LABEL_47:

        v26 = 0;
        v10 = v51;
        v6 = v52;
        v9 = v47;
        goto LABEL_48;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        self = v46;
        v34 = v48;
        v8 = v50;
        if (v48)
        {
          v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0D025B8];
          v62 = *MEMORY[0x1E0CB2D50];
          v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("accumulatedAggregationStats"));
          v63 = v22;
          v37 = (void *)MEMORY[0x1E0C99D80];
          v38 = &v63;
          v39 = &v62;
          goto LABEL_42;
        }
        goto LABEL_47;
      }
      v22 = v21;
      v23 = [BMSiriUserEngagementStatisticsAccumulatedAggregationStats alloc];
      v55 = 0;
      v24 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats initWithJSONDictionary:error:](v23, "initWithJSONDictionary:error:", v22, &v55);
      v25 = v55;
      if (v25)
      {
        v40 = v25;
        if (v48)
          *v48 = objc_retainAutorelease(v25);

        self = v46;
        v8 = v50;
        goto LABEL_46;
      }
      objc_msgSend(v16, "addObject:", v24);

    }
    v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    self = v46;
    v9 = v47;
    if (v18)
      continue;
    break;
  }
LABEL_27:

  v8 = v50;
  v10 = v51;
  self = -[BMSiriUserEngagementStatistics initWithUserEngagementStatsMetadata:dailyAggregatedStats:accumulatedAggregationStats:](self, "initWithUserEngagementStatsMetadata:dailyAggregatedStats:accumulatedAggregationStats:", v50, v51, v16);
  v26 = self;
  v6 = v52;
LABEL_48:

  v7 = v54;
LABEL_49:

LABEL_50:
LABEL_51:

  return v26;
}

- (id)_accumulatedAggregationStatsJSONArray
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
  -[BMSiriUserEngagementStatistics accumulatedAggregationStats](self, "accumulatedAggregationStats", 0);
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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  -[BMSiriUserEngagementStatistics userEngagementStatsMetadata](self, "userEngagementStatsMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSiriUserEngagementStatistics dailyAggregatedStats](self, "dailyAggregatedStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSiriUserEngagementStatistics _accumulatedAggregationStatsJSONArray](self, "_accumulatedAggregationStatsJSONArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("userEngagementStatsMetadata");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v8;
  v13[1] = CFSTR("dailyAggregatedStats");
  v9 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v9;
  v13[2] = CFSTR("accumulatedAggregationStats");
  v10 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
      goto LABEL_9;
LABEL_12:

    if (v4)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v6)
    goto LABEL_12;
LABEL_9:
  if (!v4)
    goto LABEL_13;
LABEL_10:

  return v11;
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
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriUserEngagementStatistics userEngagementStatsMetadata](self, "userEngagementStatsMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userEngagementStatsMetadata");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriUserEngagementStatistics userEngagementStatsMetadata](self, "userEngagementStatsMetadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userEngagementStatsMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
    }
    -[BMSiriUserEngagementStatistics dailyAggregatedStats](self, "dailyAggregatedStats");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dailyAggregatedStats");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriUserEngagementStatistics dailyAggregatedStats](self, "dailyAggregatedStats");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dailyAggregatedStats");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
      {
LABEL_9:
        v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    -[BMSiriUserEngagementStatistics accumulatedAggregationStats](self, "accumulatedAggregationStats");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accumulatedAggregationStats");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == v20)
    {
      v12 = 1;
    }
    else
    {
      -[BMSiriUserEngagementStatistics accumulatedAggregationStats](self, "accumulatedAggregationStats");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accumulatedAggregationStats");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v21, "isEqual:", v22);

    }
    goto LABEL_15;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMSiriUserEngagementStatisticsUserEngagementStatsMetadata)userEngagementStatsMetadata
{
  return self->_userEngagementStatsMetadata;
}

- (BMSiriUserEngagementStatisticsAccumulatedAggregationStats)dailyAggregatedStats
{
  return self->_dailyAggregatedStats;
}

- (NSArray)accumulatedAggregationStats
{
  return self->_accumulatedAggregationStats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulatedAggregationStats, 0);
  objc_storeStrong((id *)&self->_dailyAggregatedStats, 0);
  objc_storeStrong((id *)&self->_userEngagementStatsMetadata, 0);
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

    v4 = -[BMSiriUserEngagementStatistics initByReadFrom:]([BMSiriUserEngagementStatistics alloc], "initByReadFrom:", v7);
    v4[4] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("userEngagementStatsMetadata_json"), 5, 1, &__block_literal_global_330);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("dailyAggregatedStats_json"), 5, 1, &__block_literal_global_331);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("accumulatedAggregationStats_json"), 5, 1, &__block_literal_global_332);
  v7[0] = v3;
  v7[1] = v4;
  v7[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1FB58;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userEngagementStatsMetadata"), 3, 14, objc_opt_class());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dailyAggregatedStats"), 1, 14, objc_opt_class(), v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("accumulatedAggregationStats"), 2, 14, objc_opt_class());
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __41__BMSiriUserEngagementStatistics_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accumulatedAggregationStatsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __41__BMSiriUserEngagementStatistics_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dailyAggregatedStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __41__BMSiriUserEngagementStatistics_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userEngagementStatsMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
