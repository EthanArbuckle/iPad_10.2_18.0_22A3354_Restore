@implementation BMIntelligenceEngineInteractionTupleInteraction

- (BMIntelligenceEngineInteractionTupleInteraction)initWithCandidateIds:(id)a3 userAlignment:(int)a4
{
  id v7;
  BMIntelligenceEngineInteractionTupleInteraction *v8;
  objc_super v10;

  v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMIntelligenceEngineInteractionTupleInteraction;
  v8 = -[BMEventBase init](&v10, sel_init);
  if (v8)
  {
    v8->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v8->_candidateIds, a3);
    v8->_userAlignment = a4;
  }

  return v8;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMIntelligenceEngineInteractionTupleInteraction candidateIds](self, "candidateIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMIntelligenceEngineInteractionUserAlignmentAsString(-[BMIntelligenceEngineInteractionTupleInteraction userAlignment](self, "userAlignment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMIntelligenceEngineInteractionTupleInteraction with candidateIds: %@, userAlignment: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMIntelligenceEngineInteractionTupleInteraction *v5;
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
  BOOL v18;
  int v19;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  id v28;
  void *v29;
  uint64_t v30;
  NSArray *candidateIds;
  int v32;
  BMIntelligenceEngineInteractionTupleInteraction *v33;
  objc_super v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMIntelligenceEngineInteractionTupleInteraction;
  v5 = -[BMEventBase init](&v35, sel_init);
  if (!v5)
    goto LABEL_42;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
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
        v18 = v12++ >= 9;
        if (v18)
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
        break;
      if ((v13 >> 3) == 1)
      {
        v36 = 0;
        v37 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (v28 = -[BMIntelligenceEngineInteractionCandidateID initByReadFrom:]([BMIntelligenceEngineInteractionCandidateID alloc], "initByReadFrom:", v4)) == 0)
        {
LABEL_44:

          goto LABEL_41;
        }
        v29 = v28;
        objc_msgSend(v6, "addObject:", v28);
        PBReaderRecallMark();

      }
      else if ((v13 >> 3) == 2)
      {
        v21 = 0;
        v22 = 0;
        v23 = 0;
        while (1)
        {
          v24 = *v7;
          v25 = *(_QWORD *)&v4[v24];
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)&v4[*v8])
            break;
          v27 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v25);
          *(_QWORD *)&v4[v24] = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0)
            goto LABEL_34;
          v21 += 7;
          v18 = v22++ >= 9;
          if (v18)
          {
            LODWORD(v23) = 0;
            goto LABEL_36;
          }
        }
        v4[*v9] = 1;
LABEL_34:
        if (v4[*v9])
          LODWORD(v23) = 0;
LABEL_36:
        if (v23 >= 8)
          LODWORD(v23) = 0;
        v5->_userAlignment = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_44;
      }
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v30 = objc_msgSend(v6, "copy");
  candidateIds = v5->_candidateIds;
  v5->_candidateIds = (NSArray *)v30;

  v32 = v4[*v9];
  if (v32)
LABEL_41:
    v33 = 0;
  else
LABEL_42:
    v33 = v5;

  return v33;
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_candidateIds;
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

  PBDataWriterWriteUint32Field();
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMIntelligenceEngineInteractionTupleInteraction writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMIntelligenceEngineInteractionTupleInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  BMIntelligenceEngineInteractionCandidateID *v16;
  BMIntelligenceEngineInteractionCandidateID *v17;
  id v18;
  void *v19;
  id *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id *v24;
  uint64_t *v25;
  void *v26;
  void *v27;
  BMIntelligenceEngineInteractionTupleInteraction *v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  _BYTE *v34;
  void *v35;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id *v41;
  BMIntelligenceEngineInteractionTupleInteraction *v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("candidateIds"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    v41 = a4;
    v42 = self;
    v43 = v6;

    v7 = 0;
  }
  else
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v30 = *MEMORY[0x1E0D025B8];
          v57 = *MEMORY[0x1E0CB2D50];
          v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("candidateIds"));
          v58[0] = v44;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v19);
          v28 = 0;
          *a4 = v31;
          goto LABEL_39;
        }
        v28 = 0;
        goto LABEL_40;
      }
    }
    v41 = a4;
    v42 = self;
    v43 = v6;
  }
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v7 = v7;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (!v10)
    goto LABEL_16;
  v11 = v10;
  v12 = *(_QWORD *)v47;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v47 != v12)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = v41;
        if (v41)
        {
          v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v22 = *MEMORY[0x1E0D025B8];
          v54 = *MEMORY[0x1E0CB2D50];
          v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("candidateIds"));
          v55 = v15;
          v23 = (void *)MEMORY[0x1E0C99D80];
          v24 = &v55;
          v25 = &v54;
LABEL_23:
          objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *v20 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v26);

LABEL_27:
          v28 = 0;
          v19 = v7;
          self = v42;
          v6 = v43;
          goto LABEL_38;
        }
LABEL_30:
        v28 = 0;
        v19 = v7;
        self = v42;
        v6 = v43;
        goto LABEL_39;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v20 = v41;
        if (v41)
        {
          v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v22 = *MEMORY[0x1E0D025B8];
          v52 = *MEMORY[0x1E0CB2D50];
          v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("candidateIds"));
          v53 = v15;
          v23 = (void *)MEMORY[0x1E0C99D80];
          v24 = &v53;
          v25 = &v52;
          goto LABEL_23;
        }
        goto LABEL_30;
      }
      v15 = v14;
      v16 = [BMIntelligenceEngineInteractionCandidateID alloc];
      v45 = 0;
      v17 = -[BMIntelligenceEngineInteractionCandidateID initWithJSONDictionary:error:](v16, "initWithJSONDictionary:error:", v15, &v45);
      v18 = v45;
      if (v18)
      {
        v27 = v18;
        if (v41)
          *v41 = objc_retainAutorelease(v18);

        goto LABEL_27;
      }
      objc_msgSend(v44, "addObject:", v17);

    }
    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v11)
      continue;
    break;
  }
LABEL_16:

  v6 = v43;
  objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("userAlignment"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v19 = 0;
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = v15;
LABEL_36:
    v19 = v32;
LABEL_37:
    self = -[BMIntelligenceEngineInteractionTupleInteraction initWithCandidateIds:userAlignment:](v42, "initWithCandidateIds:userAlignment:", v44, objc_msgSend(v19, "intValue"));
    v28 = self;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = (void *)MEMORY[0x1E0CB37E8];
      v34 = BMIntelligenceEngineInteractionUserAlignmentFromString(v15);
      v35 = v33;
      v6 = v43;
      objc_msgSend(v35, "numberWithInt:", v34);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    if (v41)
    {
      v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v38 = *MEMORY[0x1E0D025B8];
      v50 = *MEMORY[0x1E0CB2D50];
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userAlignment"));
      v51 = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *v41 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 2, v40);

    }
    v19 = 0;
    v28 = 0;
    self = v42;
  }
LABEL_38:

LABEL_39:
LABEL_40:

  return v28;
}

- (id)_candidateIdsJSONArray
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
  -[BMIntelligenceEngineInteractionTupleInteraction candidateIds](self, "candidateIds", 0);
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
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[BMIntelligenceEngineInteractionTupleInteraction _candidateIdsJSONArray](self, "_candidateIdsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMIntelligenceEngineInteractionTupleInteraction userAlignment](self, "userAlignment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("candidateIds");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("userAlignment");
  v10[0] = v5;
  v6 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    if (v3)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v3)
    goto LABEL_9;
LABEL_7:

  return v7;
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
  int v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMIntelligenceEngineInteractionTupleInteraction candidateIds](self, "candidateIds");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidateIds");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMIntelligenceEngineInteractionTupleInteraction candidateIds](self, "candidateIds");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "candidateIds");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    v13 = -[BMIntelligenceEngineInteractionTupleInteraction userAlignment](self, "userAlignment");
    v12 = v13 == objc_msgSend(v5, "userAlignment");
    goto LABEL_8;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSArray)candidateIds
{
  return self->_candidateIds;
}

- (int)userAlignment
{
  return self->_userAlignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateIds, 0);
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

    v4 = -[BMIntelligenceEngineInteractionTupleInteraction initByReadFrom:]([BMIntelligenceEngineInteractionTupleInteraction alloc], "initByReadFrom:", v7);
    v4[4] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("candidateIds_json"), 5, 1, &__block_literal_global_191_26557);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userAlignment"), 0, 0, 2, 4, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C0C0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("candidateIds"), 1, 14, objc_opt_class());
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userAlignment"), 2, 4, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __58__BMIntelligenceEngineInteractionTupleInteraction_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_candidateIdsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
