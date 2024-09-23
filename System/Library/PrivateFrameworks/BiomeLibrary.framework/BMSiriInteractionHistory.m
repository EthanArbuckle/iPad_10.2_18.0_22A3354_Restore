@implementation BMSiriInteractionHistory

- (NSString)identifier
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriInteractionHistory interaction](self, "interaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[BMSiriInteractionHistory interaction](self, "interaction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("nil");
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%@"), v4, v7);
  return (NSString *)v8;
}

- (BMSiriInteractionHistory)initWithInteraction:(id)a3 entities:(id)a4
{
  id v7;
  id v8;
  BMSiriInteractionHistory *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMSiriInteractionHistory;
  v9 = -[BMEventBase init](&v11, sel_init);
  if (v9)
  {
    v9->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v9->_interaction, a3);
    objc_storeStrong((id *)&v9->_entities, a4);
  }

  return v9;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriInteractionHistory interaction](self, "interaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriInteractionHistory entities](self, "entities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriInteractionHistory with interaction: %@, entities: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriInteractionHistory *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  int v18;
  BMSiriRemembersInteraction *v20;
  BMSiriRemembersInteraction *interaction;
  id v22;
  void *v23;
  uint64_t v24;
  NSArray *entities;
  int v26;
  BMSiriInteractionHistory *v27;
  objc_super v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMSiriInteractionHistory;
  v5 = -[BMEventBase init](&v29, sel_init);
  if (!v5)
    goto LABEL_30;
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
        if (v15 == -1 || v15 >= *(_QWORD *)&v4[*v8])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        if (v12++ >= 9)
        {
          v13 = 0;
          v18 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v18 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v18 || (v13 & 7) == 4)
        break;
      if ((v13 >> 3) == 2)
      {
        v30 = 0;
        v31 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (v22 = -[BMSiriRemembersEntities initByReadFrom:]([BMSiriRemembersEntities alloc], "initByReadFrom:", v4)) == 0)
        {
LABEL_31:

          goto LABEL_32;
        }
        v23 = v22;
        objc_msgSend(v6, "addObject:", v22);
        PBReaderRecallMark();

      }
      else if ((v13 >> 3) == 1)
      {
        v30 = 0;
        v31 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_31;
        v20 = -[BMSiriRemembersInteraction initByReadFrom:]([BMSiriRemembersInteraction alloc], "initByReadFrom:", v4);
        if (!v20)
          goto LABEL_31;
        interaction = v5->_interaction;
        v5->_interaction = v20;

        PBReaderRecallMark();
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_31;
      }
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v24 = objc_msgSend(v6, "copy");
  entities = v5->_entities;
  v5->_entities = (NSArray *)v24;

  v26 = v4[*v9];
  if (v26)
LABEL_32:
    v27 = 0;
  else
LABEL_30:
    v27 = v5;

  return v27;
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
  if (self->_interaction)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMSiriRemembersInteraction writeTo:](self->_interaction, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_entities;
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
  -[BMSiriInteractionHistory writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriInteractionHistory)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMSiriRemembersInteraction *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  BMSiriRemembersEntities *v19;
  BMSiriRemembersEntities *v20;
  id v21;
  BMSiriInteractionHistory *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v34;
  uint64_t v35;
  void *v36;
  BMSiriInteractionHistory *v37;
  id *v38;
  void *v39;
  id v40;
  BMSiriRemembersInteraction *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interaction"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v55 = *MEMORY[0x1E0CB2D50];
        v56[0] = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("interaction"));
        v8 = (BMSiriRemembersInteraction *)v56[0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v27 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v9);
        v22 = 0;
        *a4 = v27;
        goto LABEL_37;
      }
      v22 = 0;
      goto LABEL_38;
    }
    v9 = v7;
    v47 = 0;
    v8 = -[BMSiriRemembersInteraction initWithJSONDictionary:error:]([BMSiriRemembersInteraction alloc], "initWithJSONDictionary:error:", v9, &v47);
    v23 = v47;
    if (v23)
    {
      v24 = v23;
      if (a4)
        *a4 = objc_retainAutorelease(v23);

      goto LABEL_41;
    }

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entities"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  v38 = a4;
  if (!v11)
  {
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v40 = v6;
      v41 = v8;
      v39 = v7;
      goto LABEL_9;
    }
    if (a4)
    {
      v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v35 = *MEMORY[0x1E0D025B8];
      v53 = *MEMORY[0x1E0CB2D50];
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("entities"));
      v54 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v35, 2, v36);

      v22 = 0;
      goto LABEL_36;
    }
LABEL_41:
    v22 = 0;
    goto LABEL_37;
  }
  v40 = v6;
  v41 = v8;
  v39 = v7;

  v9 = 0;
LABEL_9:
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v9 = v9;
  v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (!v13)
    goto LABEL_19;
  v14 = v13;
  v15 = *(_QWORD *)v44;
  v37 = self;
  while (2)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v44 != v15)
        objc_enumerationMutation(v9);
      v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        self = v37;
        v7 = v39;
        v6 = v40;
        if (v38)
        {
          v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v29 = *MEMORY[0x1E0D025B8];
          v50 = *MEMORY[0x1E0CB2D50];
          v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("entities"));
          v51 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *v38 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2, v30);
LABEL_34:

        }
LABEL_35:

        v22 = 0;
        v8 = v41;
        goto LABEL_36;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        self = v37;
        v7 = v39;
        v6 = v40;
        if (v38)
        {
          v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v32 = *MEMORY[0x1E0D025B8];
          v48 = *MEMORY[0x1E0CB2D50];
          v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("entities"));
          v49 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *v38 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v32, 2, v30);
          goto LABEL_34;
        }
        goto LABEL_35;
      }
      v18 = v17;
      v19 = [BMSiriRemembersEntities alloc];
      v42 = 0;
      v20 = -[BMSiriRemembersEntities initWithJSONDictionary:error:](v19, "initWithJSONDictionary:error:", v18, &v42);
      v21 = v42;
      if (v21)
      {
        v30 = v21;
        if (v38)
          *v38 = objc_retainAutorelease(v21);

        self = v37;
        v7 = v39;
        v6 = v40;
        goto LABEL_34;
      }
      objc_msgSend(v12, "addObject:", v20);

    }
    v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    self = v37;
    if (v14)
      continue;
    break;
  }
LABEL_19:

  v8 = v41;
  self = -[BMSiriInteractionHistory initWithInteraction:entities:](self, "initWithInteraction:entities:", v41, v12);
  v22 = self;
  v7 = v39;
  v6 = v40;
LABEL_36:

LABEL_37:
LABEL_38:

  return v22;
}

- (id)_entitiesJSONArray
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
  -[BMSiriInteractionHistory entities](self, "entities", 0);
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
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[BMSiriInteractionHistory interaction](self, "interaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSiriInteractionHistory _entitiesJSONArray](self, "_entitiesJSONArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("interaction");
  v6 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("entities");
  v11[0] = v6;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    if (v4)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v4)
    goto LABEL_9;
LABEL_7:

  return v8;
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
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriInteractionHistory interaction](self, "interaction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interaction");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriInteractionHistory interaction](self, "interaction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "interaction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    -[BMSiriInteractionHistory entities](self, "entities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v12 = 1;
    }
    else
    {
      -[BMSiriInteractionHistory entities](self, "entities");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entities");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "isEqual:", v16);

    }
    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMSiriRemembersInteraction)interaction
{
  return self->_interaction;
}

- (NSArray)entities
{
  return self->_entities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
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

    v4 = -[BMSiriInteractionHistory initByReadFrom:]([BMSiriInteractionHistory alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("interaction_json"), 5, 1, &__block_literal_global_74674);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("entities_json"), 5, 1, &__block_literal_global_27_74675);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1FD80;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("interaction"), 1, 14, objc_opt_class());
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("entities"), 2, 14, objc_opt_class());
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __35__BMSiriInteractionHistory_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_entitiesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __35__BMSiriInteractionHistory_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
