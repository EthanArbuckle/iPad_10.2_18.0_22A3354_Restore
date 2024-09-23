@implementation BMProactiveHarvestingParsecSearchEntity

- (BMProactiveHarvestingParsecSearchEntity)initWithName:(id)a3 category:(id)a4 probabilityScore:(id)a5 topics:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BMProactiveHarvestingParsecSearchEntity *v15;
  unsigned int v16;
  float v17;
  double v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMProactiveHarvestingParsecSearchEntity;
  v15 = -[BMEventBase init](&v20, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v15->_name, a3);
    if (v12)
    {
      v15->_hasCategory = 1;
      v16 = objc_msgSend(v12, "unsignedIntValue");
    }
    else
    {
      v16 = 0;
      v15->_hasCategory = 0;
    }
    v15->_category = v16;
    if (v13)
    {
      v15->_hasProbabilityScore = 1;
      objc_msgSend(v13, "floatValue");
      v18 = v17;
    }
    else
    {
      v15->_hasProbabilityScore = 0;
      v18 = -1.0;
    }
    v15->_probabilityScore = v18;
    objc_storeStrong((id *)&v15->_topics, a6);
  }

  return v15;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMProactiveHarvestingParsecSearchEntity name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMProactiveHarvestingParsecSearchEntity category](self, "category"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMProactiveHarvestingParsecSearchEntity probabilityScore](self, "probabilityScore");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingParsecSearchEntity topics](self, "topics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMProactiveHarvestingParsecSearchEntity with name: %@, category: %@, probabilityScore: %@, topics: %@"), v4, v5, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProactiveHarvestingParsecSearchEntity *v5;
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
  uint64_t v21;
  NSString *name;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  unint64_t v31;
  float v32;
  id v33;
  void *v34;
  uint64_t v35;
  NSArray *topics;
  int v37;
  BMProactiveHarvestingParsecSearchEntity *v38;
  objc_super v40;
  uint64_t v41;
  uint64_t v42;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMProactiveHarvestingParsecSearchEntity;
  v5 = -[BMEventBase init](&v40, sel_init);
  if (!v5)
    goto LABEL_45;
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
      switch((v13 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          name = v5->_name;
          v5->_name = (NSString *)v21;

          continue;
        case 2u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v5->_hasCategory = 1;
          break;
        case 3u:
          v5->_hasProbabilityScore = 1;
          v30 = *v7;
          v31 = *(_QWORD *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFFBLL && v31 + 4 <= *(_QWORD *)&v4[*v8])
          {
            v32 = *(float *)(*(_QWORD *)&v4[*v10] + v31);
            *(_QWORD *)&v4[v30] = v31 + 4;
          }
          else
          {
            v4[*v9] = 1;
            v32 = 0.0;
          }
          v5->_probabilityScore = v32;
          continue;
        case 4u:
          v41 = 0;
          v42 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_47;
          v33 = -[BMProactiveHarvestingParsecSearchEntityTopic initByReadFrom:]([BMProactiveHarvestingParsecSearchEntityTopic alloc], "initByReadFrom:", v4);
          if (!v33)
            goto LABEL_47;
          v34 = v33;
          objc_msgSend(v6, "addObject:", v33);
          PBReaderRecallMark();

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_47:

          goto LABEL_44;
      }
      while (1)
      {
        v26 = *v7;
        v27 = *(_QWORD *)&v4[v26];
        v28 = v27 + 1;
        if (v27 == -1 || v28 > *(_QWORD *)&v4[*v8])
          break;
        v29 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v27);
        *(_QWORD *)&v4[v26] = v28;
        v25 |= (unint64_t)(v29 & 0x7F) << v23;
        if ((v29 & 0x80) == 0)
          goto LABEL_37;
        v23 += 7;
        v18 = v24++ >= 9;
        if (v18)
        {
          LODWORD(v25) = 0;
          goto LABEL_39;
        }
      }
      v4[*v9] = 1;
LABEL_37:
      if (v4[*v9])
        LODWORD(v25) = 0;
LABEL_39:
      v5->_category = v25;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v35 = objc_msgSend(v6, "copy");
  topics = v5->_topics;
  v5->_topics = (NSArray *)v35;

  v37 = v4[*v9];
  if (v37)
LABEL_44:
    v38 = 0;
  else
LABEL_45:
    v38 = v5;

  return v38;
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
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_hasCategory)
    PBDataWriterWriteUint32Field();
  if (self->_hasProbabilityScore)
    PBDataWriterWriteFloatField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_topics;
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

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMProactiveHarvestingParsecSearchEntity writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProactiveHarvestingParsecSearchEntity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  BMProactiveHarvestingParsecSearchEntityTopic *v21;
  BMProactiveHarvestingParsecSearchEntityTopic *v22;
  id v23;
  BMProactiveHarvestingParsecSearchEntity *v24;
  id v25;
  uint64_t v26;
  id *v27;
  id v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  id *v38;
  uint64_t *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  id *v44;
  void *v45;
  uint64_t v46;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  BMProactiveHarvestingParsecSearchEntity *v53;
  id *v54;
  void *v55;
  id *v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  _BYTE v67[128];
  uint64_t v68;
  void *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  _QWORD v75[3];

  v75[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
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
        v74 = *MEMORY[0x1E0CB2D50];
        v27 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("name"));
        v75[0] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        v8 = 0;
        *a4 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v9);
        a4 = v27;
        goto LABEL_54;
      }
      v24 = 0;
      v8 = 0;
      goto LABEL_55;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = *MEMORY[0x1E0D025B8];
        v72 = *MEMORY[0x1E0CB2D50];
        v30 = a4;
        v57 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("category"));
        v73 = v57;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v29;
        v10 = (void *)v31;
        v24 = 0;
        a4 = 0;
        *v30 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v32, 2, v31);
        goto LABEL_53;
      }
      v24 = 0;
      goto LABEL_54;
    }
    v56 = v9;
  }
  else
  {
    v56 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("probabilityScore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = a4;
  v55 = v7;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v57 = 0;
        v24 = 0;
        a4 = v56;
        goto LABEL_53;
      }
      v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v34 = *MEMORY[0x1E0D025B8];
      v70 = *MEMORY[0x1E0CB2D50];
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("probabilityScore"));
      v71 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v57 = 0;
      *v54 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 2, v14);
      goto LABEL_50;
    }
    v57 = v10;
  }
  else
  {
    v57 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("topics"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (!v13)
  {
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v51 = v9;
      v52 = v8;
      v53 = self;
      goto LABEL_17;
    }
    if (!a4)
    {
      v24 = 0;
      a4 = v56;
      goto LABEL_52;
    }
    v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v50 = v10;
    v43 = *MEMORY[0x1E0D025B8];
    v68 = *MEMORY[0x1E0CB2D50];
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("topics"));
    v69 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
    v44 = a4;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v43;
    v10 = v50;
    *v44 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v46, 2, v45);

    v24 = 0;
LABEL_50:
    a4 = v56;
    goto LABEL_51;
  }
  v51 = v9;
  v52 = v8;
  v53 = self;

  v11 = 0;
LABEL_17:
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v11 = v11;
  v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (!v15)
    goto LABEL_27;
  v16 = v15;
  v17 = *(_QWORD *)v60;
  v48 = v6;
  v49 = v10;
  while (2)
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v60 != v17)
        objc_enumerationMutation(v11);
      v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v48;
        v8 = v52;
        self = v53;
        a4 = v56;
        if (v54)
        {
          v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0D025B8];
          v65 = *MEMORY[0x1E0CB2D50];
          v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("topics"));
          v66 = v20;
          v37 = (void *)MEMORY[0x1E0C99D80];
          v38 = &v66;
          v39 = &v65;
LABEL_42:
          objc_msgSend(v37, "dictionaryWithObjects:forKeys:count:", v38, v39, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v35;
          a4 = v56;
          *v54 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v36, 2, v40);
LABEL_46:

        }
LABEL_47:

        v24 = 0;
        v10 = v49;
        v9 = v51;
        goto LABEL_51;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = v48;
        v8 = v52;
        self = v53;
        a4 = v56;
        if (v54)
        {
          v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0D025B8];
          v63 = *MEMORY[0x1E0CB2D50];
          v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("topics"));
          v64 = v20;
          v37 = (void *)MEMORY[0x1E0C99D80];
          v38 = &v64;
          v39 = &v63;
          goto LABEL_42;
        }
        goto LABEL_47;
      }
      v20 = v19;
      v21 = [BMProactiveHarvestingParsecSearchEntityTopic alloc];
      v58 = 0;
      v22 = -[BMProactiveHarvestingParsecSearchEntityTopic initWithJSONDictionary:error:](v21, "initWithJSONDictionary:error:", v20, &v58);
      v23 = v58;
      if (v23)
      {
        v40 = v23;
        if (v54)
          *v54 = objc_retainAutorelease(v23);

        v6 = v48;
        v8 = v52;
        self = v53;
        a4 = v56;
        goto LABEL_46;
      }
      objc_msgSend(v14, "addObject:", v22);

    }
    v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    v6 = v48;
    v10 = v49;
    if (v16)
      continue;
    break;
  }
LABEL_27:

  v8 = v52;
  a4 = v56;
  self = -[BMProactiveHarvestingParsecSearchEntity initWithName:category:probabilityScore:topics:](v53, "initWithName:category:probabilityScore:topics:", v52, v56, v57, v14);
  v24 = self;
  v9 = v51;
LABEL_51:

LABEL_52:
  v7 = v55;
LABEL_53:

LABEL_54:
LABEL_55:

  return v24;
}

- (id)_topicsJSONArray
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
  -[BMProactiveHarvestingParsecSearchEntity topics](self, "topics", 0);
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
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  -[BMProactiveHarvestingParsecSearchEntity name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMProactiveHarvestingParsecSearchEntity hasCategory](self, "hasCategory"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMProactiveHarvestingParsecSearchEntity category](self, "category"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (!-[BMProactiveHarvestingParsecSearchEntity hasProbabilityScore](self, "hasProbabilityScore")
    || (-[BMProactiveHarvestingParsecSearchEntity probabilityScore](self, "probabilityScore"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMProactiveHarvestingParsecSearchEntity probabilityScore](self, "probabilityScore");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingParsecSearchEntity probabilityScore](self, "probabilityScore");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMProactiveHarvestingParsecSearchEntity _topicsJSONArray](self, "_topicsJSONArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("name");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[0] = v9;
  v15[1] = CFSTR("category");
  v10 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = v10;
  v15[2] = CFSTR("probabilityScore");
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[2] = v11;
  v15[3] = CFSTR("topics");
  v12 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_18;
  }
  else
  {

    if (v7)
    {
LABEL_18:
      if (v4)
        goto LABEL_19;
LABEL_23:

      if (v3)
        goto LABEL_20;
LABEL_24:

      goto LABEL_20;
    }
  }

  if (!v4)
    goto LABEL_23;
LABEL_19:
  if (!v3)
    goto LABEL_24;
LABEL_20:

  return v13;
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
  unsigned int v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMProactiveHarvestingParsecSearchEntity name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProactiveHarvestingParsecSearchEntity name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_19;
    }
    if (!-[BMProactiveHarvestingParsecSearchEntity hasCategory](self, "hasCategory")
      && !objc_msgSend(v5, "hasCategory")
      || -[BMProactiveHarvestingParsecSearchEntity hasCategory](self, "hasCategory")
      && objc_msgSend(v5, "hasCategory")
      && (v13 = -[BMProactiveHarvestingParsecSearchEntity category](self, "category"),
          v13 == objc_msgSend(v5, "category")))
    {
      if (!-[BMProactiveHarvestingParsecSearchEntity hasProbabilityScore](self, "hasProbabilityScore")
        && !objc_msgSend(v5, "hasProbabilityScore")
        || -[BMProactiveHarvestingParsecSearchEntity hasProbabilityScore](self, "hasProbabilityScore")
        && objc_msgSend(v5, "hasProbabilityScore")
        && (-[BMProactiveHarvestingParsecSearchEntity probabilityScore](self, "probabilityScore"),
            v15 = v14,
            objc_msgSend(v5, "probabilityScore"),
            v15 == v16))
      {
        -[BMProactiveHarvestingParsecSearchEntity topics](self, "topics");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "topics");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17 == v18)
        {
          v12 = 1;
        }
        else
        {
          -[BMProactiveHarvestingParsecSearchEntity topics](self, "topics");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "topics");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v19, "isEqual:", v20);

        }
        goto LABEL_20;
      }
    }
LABEL_19:
    v12 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v12 = 0;
LABEL_21:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)category
{
  return self->_category;
}

- (BOOL)hasCategory
{
  return self->_hasCategory;
}

- (void)setHasCategory:(BOOL)a3
{
  self->_hasCategory = a3;
}

- (double)probabilityScore
{
  return self->_probabilityScore;
}

- (BOOL)hasProbabilityScore
{
  return self->_hasProbabilityScore;
}

- (void)setHasProbabilityScore:(BOOL)a3
{
  self->_hasProbabilityScore = a3;
}

- (NSArray)topics
{
  return self->_topics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_name, 0);
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

    v7 = -[BMProactiveHarvestingParsecSearchEntity initByReadFrom:]([BMProactiveHarvestingParsecSearchEntity alloc], "initByReadFrom:", v6);
    v7[5] = 2;

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
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("name"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("category"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("probabilityScore"), 1, 0, 3, 1, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("topics_json"), 5, 1, &__block_literal_global_19777);
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B9B8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("name"), 1, 13, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("category"), 2, 4, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("probabilityScore"), 3, 1, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("topics"), 4, 14, objc_opt_class());
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __50__BMProactiveHarvestingParsecSearchEntity_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_topicsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
