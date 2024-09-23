@implementation BMMomentsEventDataEventBundlePerson

- (BMMomentsEventDataEventBundlePerson)initWithPersonRelationships:(id)a3 isMEPerson:(id)a4 significanceScore:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMMomentsEventDataEventBundlePerson *v12;
  double v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMMomentsEventDataEventBundlePerson;
  v12 = -[BMEventBase init](&v15, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_personRelationships, a3);
    if (v10)
    {
      v12->_hasIsMEPerson = 1;
      v12->_isMEPerson = objc_msgSend(v10, "BOOLValue");
    }
    else
    {
      v12->_hasIsMEPerson = 0;
      v12->_isMEPerson = 0;
    }
    if (v11)
    {
      v12->_hasSignificanceScore = 1;
      objc_msgSend(v11, "doubleValue");
    }
    else
    {
      v12->_hasSignificanceScore = 0;
      v13 = -1.0;
    }
    v12->_significanceScore = v13;
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
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMomentsEventDataEventBundlePerson personRelationships](self, "personRelationships");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundlePerson isMEPerson](self, "isMEPerson"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundlePerson significanceScore](self, "significanceScore");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMomentsEventDataEventBundlePerson with personRelationships: %@, isMEPerson: %@, significanceScore: %@"), v4, v5, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMomentsEventDataEventBundlePerson *v5;
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
  unint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  double v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  NSArray *personRelationships;
  int v36;
  BMMomentsEventDataEventBundlePerson *v37;
  objc_super v39;
  uint64_t v40;
  uint64_t v41;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BMMomentsEventDataEventBundlePerson;
  v5 = -[BMEventBase init](&v39, sel_init);
  if (!v5)
    goto LABEL_46;
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
      v21 = v13 >> 3;
      if ((v13 >> 3) == 3)
      {
        v5->_hasSignificanceScore = 1;
        v24 = *v7;
        v25 = *(_QWORD *)&v4[v24];
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)&v4[*v8])
        {
          v26 = *(double *)(*(_QWORD *)&v4[*v10] + v25);
          *(_QWORD *)&v4[v24] = v25 + 8;
        }
        else
        {
          v4[*v9] = 1;
          v26 = 0.0;
        }
        v5->_significanceScore = v26;
      }
      else if ((_DWORD)v21 == 2)
      {
        v27 = 0;
        v28 = 0;
        v29 = 0;
        v5->_hasIsMEPerson = 1;
        while (1)
        {
          v30 = *v7;
          v31 = *(_QWORD *)&v4[v30];
          v32 = v31 + 1;
          if (v31 == -1 || v32 > *(_QWORD *)&v4[*v8])
            break;
          v33 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v31);
          *(_QWORD *)&v4[v30] = v32;
          v29 |= (unint64_t)(v33 & 0x7F) << v27;
          if ((v33 & 0x80) == 0)
            goto LABEL_38;
          v27 += 7;
          v18 = v28++ >= 9;
          if (v18)
          {
            v29 = 0;
            goto LABEL_40;
          }
        }
        v4[*v9] = 1;
LABEL_38:
        if (v4[*v9])
          v29 = 0;
LABEL_40:
        v5->_isMEPerson = v29 != 0;
      }
      else if ((_DWORD)v21 == 1)
      {
        v40 = 0;
        v41 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (v22 = -[BMMomentsEventDataEventBundlePersonPersonRelationship initByReadFrom:]([BMMomentsEventDataEventBundlePersonPersonRelationship alloc], "initByReadFrom:", v4)) == 0)
        {
LABEL_48:

          goto LABEL_45;
        }
        v23 = v22;
        objc_msgSend(v6, "addObject:", v22);
        PBReaderRecallMark();

      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_48;
      }
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v34 = objc_msgSend(v6, "copy");
  personRelationships = v5->_personRelationships;
  v5->_personRelationships = (NSArray *)v34;

  v36 = v4[*v9];
  if (v36)
LABEL_45:
    v37 = 0;
  else
LABEL_46:
    v37 = v5;

  return v37;
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
  v5 = self->_personRelationships;
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

  if (self->_hasIsMEPerson)
    PBDataWriterWriteBOOLField();
  if (self->_hasSignificanceScore)
    PBDataWriterWriteDoubleField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMomentsEventDataEventBundlePerson writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEventDataEventBundlePerson)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  BMMomentsEventDataEventBundlePersonPersonRelationship *v15;
  BMMomentsEventDataEventBundlePersonPersonRelationship *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  BMMomentsEventDataEventBundlePerson *v21;
  id *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id *v26;
  uint64_t *v27;
  id v28;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  BMMomentsEventDataEventBundlePerson *v38;
  uint64_t v39;
  void *v40;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personRelationships"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    v38 = self;
    v40 = v5;

    v6 = 0;
  }
  else
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v31 = *MEMORY[0x1E0D025B8];
          v57 = *MEMORY[0x1E0CB2D50];
          v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("personRelationships"));
          v58[0] = v42;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v21 = 0;
          *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v18);
          goto LABEL_35;
        }
        v21 = 0;
        goto LABEL_36;
      }
    }
    v38 = self;
    v40 = v5;
  }
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v6 = v6;
  v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (!v9)
    goto LABEL_16;
  v10 = v9;
  v11 = *(_QWORD *)v45;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v45 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = a4;
        if (a4)
        {
          v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v24 = *MEMORY[0x1E0D025B8];
          v54 = *MEMORY[0x1E0CB2D50];
          v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("personRelationships"));
          v55 = v14;
          v25 = (void *)MEMORY[0x1E0C99D80];
          v26 = &v55;
          v27 = &v54;
LABEL_28:
          objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          v28 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v20);
          v21 = 0;
          *v22 = v28;
LABEL_32:
          v18 = v6;
          self = v38;
          v5 = v40;
          goto LABEL_33;
        }
LABEL_39:
        v21 = 0;
        v18 = v6;
        self = v38;
        v5 = v40;
        goto LABEL_35;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = a4;
        if (a4)
        {
          v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v24 = *MEMORY[0x1E0D025B8];
          v52 = *MEMORY[0x1E0CB2D50];
          v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("personRelationships"));
          v53 = v14;
          v25 = (void *)MEMORY[0x1E0C99D80];
          v26 = &v53;
          v27 = &v52;
          goto LABEL_28;
        }
        goto LABEL_39;
      }
      v14 = v13;
      v15 = [BMMomentsEventDataEventBundlePersonPersonRelationship alloc];
      v43 = 0;
      v16 = -[BMMomentsEventDataEventBundlePersonPersonRelationship initWithJSONDictionary:error:](v15, "initWithJSONDictionary:error:", v14, &v43);
      v17 = v43;
      if (v17)
      {
        v20 = v17;
        if (a4)
          *a4 = objc_retainAutorelease(v17);

        v21 = 0;
        goto LABEL_32;
      }
      objc_msgSend(v42, "addObject:", v16);

    }
    v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v10)
      continue;
    break;
  }
LABEL_16:

  v5 = v40;
  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("isMEPerson"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    self = v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v14;
      goto LABEL_19;
    }
    if (a4)
    {
      v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v33 = *MEMORY[0x1E0D025B8];
      v50 = *MEMORY[0x1E0CB2D50];
      v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isMEPerson"));
      v51 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v19);
      v21 = 0;
      v18 = 0;
      *a4 = v34;
      goto LABEL_23;
    }
    v18 = 0;
    v21 = 0;
  }
  else
  {
    v18 = 0;
    self = v38;
LABEL_19:
    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("significanceScore"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v20 = 0;
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v19;
LABEL_22:
      self = -[BMMomentsEventDataEventBundlePerson initWithPersonRelationships:isMEPerson:significanceScore:](self, "initWithPersonRelationships:isMEPerson:significanceScore:", v42, v18, v20);
      v21 = self;
    }
    else
    {
      if (a4)
      {
        v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v39 = *MEMORY[0x1E0D025B8];
        v48 = *MEMORY[0x1E0CB2D50];
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("significanceScore"));
        v49 = v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v39, 2, v37);

      }
      v20 = 0;
      v21 = 0;
    }
LABEL_23:

LABEL_33:
  }

LABEL_35:
LABEL_36:

  return v21;
}

- (id)_personRelationshipsJSONArray
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
  -[BMMomentsEventDataEventBundlePerson personRelationships](self, "personRelationships", 0);
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
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  -[BMMomentsEventDataEventBundlePerson _personRelationshipsJSONArray](self, "_personRelationshipsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEventBundlePerson hasIsMEPerson](self, "hasIsMEPerson"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundlePerson isMEPerson](self, "isMEPerson"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (!-[BMMomentsEventDataEventBundlePerson hasSignificanceScore](self, "hasSignificanceScore")
    || (-[BMMomentsEventDataEventBundlePerson significanceScore](self, "significanceScore"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundlePerson significanceScore](self, "significanceScore");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundlePerson significanceScore](self, "significanceScore");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = CFSTR("personRelationships");
  v8 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v8;
  v13[1] = CFSTR("isMEPerson");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v9;
  v13[2] = CFSTR("significanceScore");
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
    if (v4)
      goto LABEL_16;
LABEL_19:

    if (v3)
      goto LABEL_17;
LABEL_20:

    goto LABEL_17;
  }

  if (!v4)
    goto LABEL_19;
LABEL_16:
  if (!v3)
    goto LABEL_20;
LABEL_17:

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
  BOOL v12;
  int v13;
  double v14;
  double v15;
  double v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMomentsEventDataEventBundlePerson personRelationships](self, "personRelationships");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personRelationships");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMomentsEventDataEventBundlePerson personRelationships](self, "personRelationships");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personRelationships");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    if (!-[BMMomentsEventDataEventBundlePerson hasIsMEPerson](self, "hasIsMEPerson")
      && !objc_msgSend(v5, "hasIsMEPerson")
      || -[BMMomentsEventDataEventBundlePerson hasIsMEPerson](self, "hasIsMEPerson")
      && objc_msgSend(v5, "hasIsMEPerson")
      && (v13 = -[BMMomentsEventDataEventBundlePerson isMEPerson](self, "isMEPerson"),
          v13 == objc_msgSend(v5, "isMEPerson")))
    {
      if (!-[BMMomentsEventDataEventBundlePerson hasSignificanceScore](self, "hasSignificanceScore")
        && !objc_msgSend(v5, "hasSignificanceScore"))
      {
        v12 = 1;
        goto LABEL_18;
      }
      if (-[BMMomentsEventDataEventBundlePerson hasSignificanceScore](self, "hasSignificanceScore")
        && objc_msgSend(v5, "hasSignificanceScore"))
      {
        -[BMMomentsEventDataEventBundlePerson significanceScore](self, "significanceScore");
        v15 = v14;
        objc_msgSend(v5, "significanceScore");
        v12 = v15 == v16;
LABEL_18:

        goto LABEL_19;
      }
    }
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  v12 = 0;
LABEL_19:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSArray)personRelationships
{
  return self->_personRelationships;
}

- (BOOL)isMEPerson
{
  return self->_isMEPerson;
}

- (BOOL)hasIsMEPerson
{
  return self->_hasIsMEPerson;
}

- (void)setHasIsMEPerson:(BOOL)a3
{
  self->_hasIsMEPerson = a3;
}

- (double)significanceScore
{
  return self->_significanceScore;
}

- (BOOL)hasSignificanceScore
{
  return self->_hasSignificanceScore;
}

- (void)setHasSignificanceScore:(BOOL)a3
{
  self->_hasSignificanceScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personRelationships, 0);
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

    v4 = -[BMMomentsEventDataEventBundlePerson initByReadFrom:]([BMMomentsEventDataEventBundlePerson alloc], "initByReadFrom:", v7);
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
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("personRelationships_json"), 5, 1, &__block_literal_global_2020);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isMEPerson"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("significanceScore"), 1, 0, 3, 0, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1A710;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("personRelationships"), 1, 14, objc_opt_class());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isMEPerson"), 2, 12, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("significanceScore"), 3, 0, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __46__BMMomentsEventDataEventBundlePerson_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_personRelationshipsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
