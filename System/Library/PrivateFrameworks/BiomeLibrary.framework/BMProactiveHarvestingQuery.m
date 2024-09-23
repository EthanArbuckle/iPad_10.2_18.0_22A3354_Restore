@implementation BMProactiveHarvestingQuery

- (BMProactiveHarvestingQuery)initWithAbsoluteTimestamp:(id)a3 query:(id)a4 results:(id)a5 uniqueID:(id)a6 contentProtection:(id)a7 personaId:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BMProactiveHarvestingQuery *v18;
  double v19;
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
  v23.super_class = (Class)BMProactiveHarvestingQuery;
  v18 = -[BMEventBase init](&v23, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v21, v22);
    if (v14)
    {
      v18->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v18->_hasRaw_absoluteTimestamp = 0;
      v19 = -1.0;
    }
    v18->_raw_absoluteTimestamp = v19;
    objc_storeStrong((id *)&v18->_query, a4);
    objc_storeStrong((id *)&v18->_results, a5);
    objc_storeStrong((id *)&v18->_uniqueID, a6);
    objc_storeStrong((id *)&v18->_contentProtection, a7);
    objc_storeStrong((id *)&v18->_personaId, a8);
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
  -[BMProactiveHarvestingQuery absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingQuery query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingQuery results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingQuery uniqueID](self, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingQuery contentProtection](self, "contentProtection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingQuery personaId](self, "personaId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMProactiveHarvestingQuery with absoluteTimestamp: %@, query: %@, results: %@, uniqueID: %@, contentProtection: %@, personaId: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProactiveHarvestingQuery *v5;
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
  uint64_t v21;
  unint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSArray *results;
  int v31;
  BMProactiveHarvestingQuery *v32;
  objc_super v34;
  uint64_t v35;
  uint64_t v36;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BMProactiveHarvestingQuery;
  v5 = -[BMEventBase init](&v34, sel_init);
  if (!v5)
  {
LABEL_38:
    v32 = v5;
    goto LABEL_39;
  }
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_36:
    v29 = objc_msgSend(v6, "copy");
    results = v5->_results;
    v5->_results = (NSArray *)v29;

    v31 = v4[*v9];
    if (v31)
      goto LABEL_37;
    goto LABEL_38;
  }
  v10 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v9])
      goto LABEL_36;
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
      goto LABEL_36;
    switch((v13 >> 3))
    {
      case 1u:
        v5->_hasRaw_absoluteTimestamp = 1;
        v21 = *v7;
        v22 = *(_QWORD *)&v4[v21];
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)&v4[*v8])
        {
          v23 = *(double *)(*(_QWORD *)&v4[*v10] + v22);
          *(_QWORD *)&v4[v21] = v22 + 8;
        }
        else
        {
          v4[*v9] = 1;
          v23 = 0.0;
        }
        v5->_raw_absoluteTimestamp = v23;
        goto LABEL_35;
      case 2u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 40;
        goto LABEL_32;
      case 3u:
        v35 = 0;
        v36 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_40;
        v26 = -[BMProactiveHarvestingQueryResult initByReadFrom:]([BMProactiveHarvestingQueryResult alloc], "initByReadFrom:", v4);
        if (!v26)
          goto LABEL_40;
        v27 = v26;
        objc_msgSend(v6, "addObject:", v26);
        PBReaderRecallMark();

        goto LABEL_35;
      case 4u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 56;
        goto LABEL_32;
      case 5u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 64;
        goto LABEL_32;
      case 6u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 72;
LABEL_32:
        v28 = *(Class *)((char *)&v5->super.super.isa + v25);
        *(Class *)((char *)&v5->super.super.isa + v25) = (Class)v24;

        goto LABEL_35;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_35:
          if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
            goto LABEL_36;
          continue;
        }
LABEL_40:

LABEL_37:
        v32 = 0;
LABEL_39:

        return v32;
    }
  }
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
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_query)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_results;
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

  if (self->_uniqueID)
    PBDataWriterWriteStringField();
  if (self->_contentProtection)
    PBDataWriterWriteStringField();
  if (self->_personaId)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMProactiveHarvestingQuery writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProactiveHarvestingQuery)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  BMProactiveHarvestingQueryResult *v27;
  BMProactiveHarvestingQueryResult *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  BMProactiveHarvestingQuery *v36;
  id *v37;
  id v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v51;
  id v52;
  uint64_t v53;
  BMProactiveHarvestingQuery *v54;
  id v55;
  void *v56;
  id v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  BMProactiveHarvestingQuery *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v74;
  void *v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  id v90;
  _BYTE v91[128];
  uint64_t v92;
  void *v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  _QWORD v97[3];

  v97[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (objc_class *)MEMORY[0x1E0C99D68];
    v9 = v6;
    v10 = [v8 alloc];
    objc_msgSend(v9, "doubleValue");
    v12 = v11;

    v13 = (id)objc_msgSend(v10, "initWithTimeIntervalSinceReferenceDate:", v12);
LABEL_6:
    v7 = v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v53 = *MEMORY[0x1E0D025B8];
        v96 = *MEMORY[0x1E0CB2D50];
        v54 = self;
        v55 = objc_alloc(MEMORY[0x1E0CB3940]);
        v62 = objc_opt_class();
        v56 = v55;
        self = v54;
        v17 = (id)objc_msgSend(v56, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), v62, CFSTR("absoluteTimestamp"));
        v97[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, &v96, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v53, 2, v16);
        v7 = 0;
        v36 = 0;
        *a4 = v57;
        goto LABEL_64;
      }
      v7 = 0;
      v36 = 0;
      goto LABEL_65;
    }
    v13 = v6;
    goto LABEL_6;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v14, "dateFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("query"));
  v15 = objc_claimAutoreleasedReturnValue();
  v71 = (void *)v15;
  v72 = v6;
  if (v15 && (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v31 = v7;
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = *MEMORY[0x1E0D025B8];
        v94 = *MEMORY[0x1E0CB2D50];
        v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("query"));
        v95 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v32;
        v7 = v31;
        v75 = (void *)v34;
        v36 = 0;
        v17 = 0;
        *a4 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v33, 2);

        goto LABEL_63;
      }
      v17 = 0;
      v36 = 0;
      goto LABEL_64;
    }
    v70 = v7;
    v17 = v16;
  }
  else
  {
    v70 = v7;
    v17 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("results"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqual:", v19);

  v69 = v17;
  if (v20)
  {
    v67 = self;

    v18 = 0;
  }
  else
  {
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v36 = 0;
          v7 = v70;
          goto LABEL_63;
        }
        v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v46 = *MEMORY[0x1E0D025B8];
        v92 = *MEMORY[0x1E0CB2D50];
        v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("results"));
        v93 = v74;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v36 = 0;
        *a4 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2, v30);
LABEL_46:
        v7 = v70;
        goto LABEL_61;
      }
    }
    v67 = self;
  }
  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v18, "count"));
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v18 = v18;
  v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
  if (!v21)
    goto LABEL_27;
  v22 = v21;
  v23 = *(_QWORD *)v78;
  v66 = v5;
  while (2)
  {
    for (i = 0; i != v22; ++i)
    {
      if (*(_QWORD *)v78 != v23)
        objc_enumerationMutation(v18);
      v25 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = a4;
        if (a4)
        {
          v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v39 = *MEMORY[0x1E0D025B8];
          v89 = *MEMORY[0x1E0CB2D50];
          v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("results"));
          v90 = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
          v40 = (id)objc_claimAutoreleasedReturnValue();
          v41 = v38;
          v42 = v39;
LABEL_38:
          v36 = 0;
          *v37 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v42, 2, v40);
LABEL_42:
          v30 = v18;
          v5 = v66;
          self = v67;
          goto LABEL_59;
        }
        goto LABEL_45;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v37 = a4;
        if (a4)
        {
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v44 = *MEMORY[0x1E0D025B8];
          v87 = *MEMORY[0x1E0CB2D50];
          v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("results"));
          v88 = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
          v40 = (id)objc_claimAutoreleasedReturnValue();
          v41 = v43;
          v42 = v44;
          goto LABEL_38;
        }
LABEL_45:
        v36 = 0;
        v30 = v18;
        v5 = v66;
        self = v67;
        goto LABEL_46;
      }
      v26 = v25;
      v27 = [BMProactiveHarvestingQueryResult alloc];
      v76 = 0;
      v28 = -[BMProactiveHarvestingQueryResult initWithJSONDictionary:error:](v27, "initWithJSONDictionary:error:", v26, &v76);
      v29 = v76;
      if (v29)
      {
        v40 = v29;
        if (a4)
          *a4 = objc_retainAutorelease(v29);

        v36 = 0;
        goto LABEL_42;
      }
      objc_msgSend(v74, "addObject:", v28);

    }
    v22 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
    v5 = v66;
    if (v22)
      continue;
    break;
  }
LABEL_27:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    v30 = 0;
    self = v67;
    goto LABEL_50;
  }
  objc_opt_class();
  self = v67;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = 0;
LABEL_50:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contentProtection"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = v47;
        goto LABEL_53;
      }
      if (a4)
      {
        v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v58 = *MEMORY[0x1E0D025B8];
        v83 = *MEMORY[0x1E0CB2D50];
        v49 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contentProtection"));
        v84 = v49;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v58, 2, v48);
        v36 = 0;
        v40 = 0;
        *a4 = v59;
        goto LABEL_57;
      }
      v40 = 0;
      v36 = 0;
    }
    else
    {
      v40 = 0;
LABEL_53:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personaId"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v48 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v49 = 0;
        goto LABEL_56;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v49 = v48;
LABEL_56:
        self = -[BMProactiveHarvestingQuery initWithAbsoluteTimestamp:query:results:uniqueID:contentProtection:personaId:](self, "initWithAbsoluteTimestamp:query:results:uniqueID:contentProtection:personaId:", v70, v69, v74, v30, v40, v49);
        v36 = self;
      }
      else
      {
        if (a4)
        {
          v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v63 = *MEMORY[0x1E0D025B8];
          v81 = *MEMORY[0x1E0CB2D50];
          v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("personaId"));
          v82 = v60;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v63, 2, v61);

        }
        v49 = 0;
        v36 = 0;
      }
LABEL_57:

    }
LABEL_58:

LABEL_59:
    v7 = v70;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = v26;
      goto LABEL_50;
    }
    if (a4)
    {
      v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v51 = *MEMORY[0x1E0D025B8];
      v85 = *MEMORY[0x1E0CB2D50];
      v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("uniqueID"));
      v86 = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      v30 = 0;
      *a4 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v51, 2, v47);
      goto LABEL_58;
    }
    v30 = 0;
    v36 = 0;
    v7 = v70;
  }

LABEL_61:
  v17 = v69;

LABEL_63:
  v16 = v71;
  v6 = v72;
LABEL_64:

LABEL_65:
  return v36;
}

- (id)_resultsJSONArray
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
  -[BMProactiveHarvestingQuery results](self, "results", 0);
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
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
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
  -[BMProactiveHarvestingQuery absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingQuery absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMProactiveHarvestingQuery query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingQuery _resultsJSONArray](self, "_resultsJSONArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingQuery uniqueID](self, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingQuery contentProtection](self, "contentProtection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingQuery personaId](self, "personaId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = CFSTR("absoluteTimestamp");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v12;
  v25[0] = v12;
  v24[1] = CFSTR("query");
  v13 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v20 = v13;
  v25[1] = v13;
  v24[2] = CFSTR("results");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v13, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v6;
  v25[2] = v14;
  v24[3] = CFSTR("uniqueID");
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v15;
  v24[4] = CFSTR("contentProtection");
  v16 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v16;
  v24[5] = CFSTR("personaId");
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
    if (v10)
      goto LABEL_18;
LABEL_24:

    if (v9)
      goto LABEL_19;
    goto LABEL_25;
  }

  if (!v10)
    goto LABEL_24;
LABEL_18:
  if (v9)
    goto LABEL_19;
LABEL_25:

LABEL_19:
  if (v8)
  {
    if (v7)
      goto LABEL_21;
LABEL_27:

    if (v23)
      goto LABEL_22;
LABEL_28:

    goto LABEL_22;
  }

  if (!v7)
    goto LABEL_27;
LABEL_21:
  if (!v23)
    goto LABEL_28;
LABEL_22:

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
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMProactiveHarvestingQuery absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProactiveHarvestingQuery absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_21;
    }
    -[BMProactiveHarvestingQuery query](self, "query");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "query");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMProactiveHarvestingQuery query](self, "query");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "query");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_21;
    }
    -[BMProactiveHarvestingQuery results](self, "results");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "results");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMProactiveHarvestingQuery results](self, "results");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "results");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_21;
    }
    -[BMProactiveHarvestingQuery uniqueID](self, "uniqueID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMProactiveHarvestingQuery uniqueID](self, "uniqueID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_21;
    }
    -[BMProactiveHarvestingQuery contentProtection](self, "contentProtection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentProtection");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMProactiveHarvestingQuery contentProtection](self, "contentProtection");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentProtection");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
      {
LABEL_21:
        v12 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    -[BMProactiveHarvestingQuery personaId](self, "personaId");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personaId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38 == v39)
    {
      v12 = 1;
    }
    else
    {
      -[BMProactiveHarvestingQuery personaId](self, "personaId");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personaId");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v40, "isEqual:", v41);

    }
    goto LABEL_22;
  }
  v12 = 0;
LABEL_23:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)query
{
  return self->_query;
}

- (NSArray)results
{
  return self->_results;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

+ (unsigned)latestDataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 2)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMProactiveHarvestingQuery initByReadFrom:]([BMProactiveHarvestingQuery alloc], "initByReadFrom:", v6);
    v7[8] = 2;

  }
  else
  {
    v7 = 0;
  }
  return v7;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("query"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("results_json"), 5, 1, &__block_literal_global_24766);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueID"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentProtection"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("personaId"), 2, 0, 6, 13, 0);
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
  return &unk_1E5F1BEE0;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("query"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("results"), 3, 14, objc_opt_class());
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueID"), 4, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentProtection"), 5, 13, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("personaId"), 6, 13, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __37__BMProactiveHarvestingQuery_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_resultsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
