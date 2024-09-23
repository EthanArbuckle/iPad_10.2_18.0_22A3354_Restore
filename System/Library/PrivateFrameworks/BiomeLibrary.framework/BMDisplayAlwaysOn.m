@implementation BMDisplayAlwaysOn

- (BMDisplayAlwaysOn)initWithUserSetState:(int)a3 resolvedState:(int)a4 blockingPolicies:(id)a5
{
  id v9;
  BMDisplayAlwaysOn *v10;
  objc_super v12;

  v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)BMDisplayAlwaysOn;
  v10 = -[BMEventBase init](&v12, sel_init);
  if (v10)
  {
    v10->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v10->_userSetState = a3;
    v10->_resolvedState = a4;
    objc_storeStrong((id *)&v10->_blockingPolicies, a5);
  }

  return v10;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMDisplayAlwaysOnStateAsString(-[BMDisplayAlwaysOn userSetState](self, "userSetState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMDisplayAlwaysOnStateAsString(-[BMDisplayAlwaysOn resolvedState](self, "resolvedState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDisplayAlwaysOn blockingPolicies](self, "blockingPolicies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMDisplayAlwaysOn with userSetState: %@, resolvedState: %@, blockingPolicies: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDisplayAlwaysOn *v5;
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
  BOOL v17;
  int v18;
  unint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSArray *blockingPolicies;
  int v37;
  BMDisplayAlwaysOn *v38;
  objc_super v40;
  uint64_t v41;
  uint64_t v42;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMDisplayAlwaysOn;
  v5 = -[BMEventBase init](&v40, sel_init);
  if (!v5)
    goto LABEL_57;
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
        goto LABEL_55;
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
        v17 = v12++ >= 9;
        if (v17)
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
        goto LABEL_55;
      v20 = v13 >> 3;
      if ((v13 >> 3) == 1)
        break;
      if ((_DWORD)v20 == 3)
      {
        v41 = 0;
        v42 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (v32 = -[BMDisplayAlwaysOnBlockingPolicy initByReadFrom:]([BMDisplayAlwaysOnBlockingPolicy alloc], "initByReadFrom:", v4)) == 0)
        {
LABEL_59:

          goto LABEL_56;
        }
        v33 = v32;
        objc_msgSend(v6, "addObject:", v32);
        PBReaderRecallMark();

      }
      else
      {
        if ((_DWORD)v20 == 2)
        {
          v21 = 0;
          v22 = 0;
          v23 = 0;
          while (1)
          {
            v24 = *v7;
            v25 = *(_QWORD *)&v4[v24];
            if (v25 == -1 || v25 >= *(_QWORD *)&v4[*v8])
              break;
            v26 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v25);
            *(_QWORD *)&v4[v24] = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if ((v26 & 0x80) == 0)
              goto LABEL_42;
            v21 += 7;
            v17 = v22++ >= 9;
            if (v17)
            {
              LODWORD(v23) = 0;
              goto LABEL_44;
            }
          }
          v4[*v9] = 1;
LABEL_42:
          if (v4[*v9])
            LODWORD(v23) = 0;
LABEL_44:
          if (v23 >= 3)
            LODWORD(v23) = 0;
          v34 = 24;
LABEL_53:
          *(_DWORD *)((char *)&v5->super.super.isa + v34) = v23;
          goto LABEL_54;
        }
        if (!PBReaderSkipValueWithTag())
          goto LABEL_59;
      }
LABEL_54:
      if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
        goto LABEL_55;
    }
    v27 = 0;
    v28 = 0;
    v23 = 0;
    while (1)
    {
      v29 = *v7;
      v30 = *(_QWORD *)&v4[v29];
      if (v30 == -1 || v30 >= *(_QWORD *)&v4[*v8])
        break;
      v31 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v30);
      *(_QWORD *)&v4[v29] = v30 + 1;
      v23 |= (unint64_t)(v31 & 0x7F) << v27;
      if ((v31 & 0x80) == 0)
        goto LABEL_48;
      v27 += 7;
      v17 = v28++ >= 9;
      if (v17)
      {
        LODWORD(v23) = 0;
        goto LABEL_50;
      }
    }
    v4[*v9] = 1;
LABEL_48:
    if (v4[*v9])
      LODWORD(v23) = 0;
LABEL_50:
    if (v23 >= 3)
      LODWORD(v23) = 0;
    v34 = 20;
    goto LABEL_53;
  }
LABEL_55:
  v35 = objc_msgSend(v6, "copy");
  blockingPolicies = v5->_blockingPolicies;
  v5->_blockingPolicies = (NSArray *)v35;

  v37 = v4[*v9];
  if (v37)
LABEL_56:
    v38 = 0;
  else
LABEL_57:
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
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_blockingPolicies;
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
  -[BMDisplayAlwaysOn writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDisplayAlwaysOn)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  BMDisplayAlwaysOnBlockingPolicy *v22;
  BMDisplayAlwaysOnBlockingPolicy *v23;
  id v24;
  BMDisplayAlwaysOn *v25;
  id *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  uint64_t v34;
  id *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  BMDisplayAlwaysOn *v44;
  id v45;
  void *v46;
  id *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  BMDisplayAlwaysOn *v51;
  id *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
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
  _QWORD v73[3];

  v73[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userSetState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v38 = *MEMORY[0x1E0D025B8];
          v72 = *MEMORY[0x1E0CB2D50];
          v39 = v7;
          v40 = objc_alloc(MEMORY[0x1E0CB3940]);
          v48 = objc_opt_class();
          v41 = v40;
          v7 = v39;
          v57 = (id)objc_msgSend(v41, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), v48, CFSTR("userSetState"));
          v73[0] = v57;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 0;
          v25 = 0;
          *a4 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 2, v11);
          goto LABEL_44;
        }
        v8 = 0;
        v25 = 0;
        goto LABEL_45;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDisplayAlwaysOnStateFromString(v7));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v9;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("resolvedState"));
  v10 = objc_claimAutoreleasedReturnValue();
  v56 = (void *)v10;
  if (v10 && (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = v11;
    }
    else
    {
      v31 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v43 = *MEMORY[0x1E0D025B8];
          v70 = *MEMORY[0x1E0CB2D50];
          v44 = self;
          v45 = objc_alloc(MEMORY[0x1E0CB3940]);
          v49 = objc_opt_class();
          v46 = v45;
          self = v44;
          v12 = (id)objc_msgSend(v46, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), v49, CFSTR("resolvedState"));
          v71 = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
          v47 = a4;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = 0;
          v25 = 0;
          *v47 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v43, 2, v15);
          v8 = v31;
          goto LABEL_42;
        }
        v57 = 0;
        v25 = 0;
        goto LABEL_44;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDisplayAlwaysOnStateFromString(v11));
      v57 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v57 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("blockingPolicies"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if (v14)
  {
    v52 = a4;
    v53 = v8;
    v54 = v7;
    v55 = v6;

    v12 = 0;
  }
  else
  {
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v34 = *MEMORY[0x1E0D025B8];
          v68 = *MEMORY[0x1E0CB2D50];
          v35 = a4;
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("blockingPolicies"));
          v69 = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *v35 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 2, v36);

          v25 = 0;
          goto LABEL_42;
        }
        v25 = 0;
        goto LABEL_43;
      }
    }
    v52 = a4;
    v53 = v8;
    v54 = v7;
    v55 = v6;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v12 = v12;
  v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (!v16)
    goto LABEL_27;
  v17 = v16;
  v18 = *(_QWORD *)v60;
  v51 = self;
  while (2)
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v60 != v18)
        objc_enumerationMutation(v12);
      v20 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        self = v51;
        v26 = v52;
        v8 = v53;
        v7 = v54;
        if (v52)
        {
          v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v28 = *MEMORY[0x1E0D025B8];
          v65 = *MEMORY[0x1E0CB2D50];
          v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("blockingPolicies"));
          v66 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v27;
LABEL_34:
          *v26 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v28, 2, v29);
LABEL_40:

        }
LABEL_41:

        v25 = 0;
        v6 = v55;
        goto LABEL_42;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        self = v51;
        v26 = v52;
        v8 = v53;
        v7 = v54;
        if (v52)
        {
          v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v28 = *MEMORY[0x1E0D025B8];
          v63 = *MEMORY[0x1E0CB2D50];
          v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("blockingPolicies"));
          v64 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v50;
          goto LABEL_34;
        }
        goto LABEL_41;
      }
      v21 = v20;
      v22 = [BMDisplayAlwaysOnBlockingPolicy alloc];
      v58 = 0;
      v23 = -[BMDisplayAlwaysOnBlockingPolicy initWithJSONDictionary:error:](v22, "initWithJSONDictionary:error:", v21, &v58);
      v24 = v58;
      if (v24)
      {
        v29 = v24;
        if (v52)
          *v52 = objc_retainAutorelease(v24);

        self = v51;
        v8 = v53;
        v7 = v54;
        goto LABEL_40;
      }
      objc_msgSend(v15, "addObject:", v23);

    }
    v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    self = v51;
    if (v17)
      continue;
    break;
  }
LABEL_27:

  v8 = v53;
  self = -[BMDisplayAlwaysOn initWithUserSetState:resolvedState:blockingPolicies:](self, "initWithUserSetState:resolvedState:blockingPolicies:", objc_msgSend(v53, "intValue"), objc_msgSend(v57, "intValue"), v15);
  v25 = self;
  v7 = v54;
  v6 = v55;
LABEL_42:

LABEL_43:
  v11 = v56;
LABEL_44:

LABEL_45:
  return v25;
}

- (id)_blockingPoliciesJSONArray
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
  -[BMDisplayAlwaysOn blockingPolicies](self, "blockingPolicies", 0);
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
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDisplayAlwaysOn userSetState](self, "userSetState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDisplayAlwaysOn resolvedState](self, "resolvedState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDisplayAlwaysOn _blockingPoliciesJSONArray](self, "_blockingPoliciesJSONArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("userSetState");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("resolvedState");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("blockingPolicies");
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v4)
      goto LABEL_9;
LABEL_12:

    if (v3)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v4)
    goto LABEL_12;
LABEL_9:
  if (!v3)
    goto LABEL_13;
LABEL_10:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMDisplayAlwaysOn userSetState](self, "userSetState");
    if (v6 == objc_msgSend(v5, "userSetState")
      && (v7 = -[BMDisplayAlwaysOn resolvedState](self, "resolvedState"),
          v7 == objc_msgSend(v5, "resolvedState")))
    {
      -[BMDisplayAlwaysOn blockingPolicies](self, "blockingPolicies");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "blockingPolicies");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9)
      {
        v12 = 1;
      }
      else
      {
        -[BMDisplayAlwaysOn blockingPolicies](self, "blockingPolicies");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "blockingPolicies");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)userSetState
{
  return self->_userSetState;
}

- (int)resolvedState
{
  return self->_resolvedState;
}

- (NSArray)blockingPolicies
{
  return self->_blockingPolicies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockingPolicies, 0);
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

    v4 = -[BMDisplayAlwaysOn initByReadFrom:]([BMDisplayAlwaysOn alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userSetState"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("resolvedState"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("blockingPolicies_json"), 5, 1, &__block_literal_global_134);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C240;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userSetState"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("resolvedState"), 2, 4, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("blockingPolicies"), 3, 14, objc_opt_class());
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __28__BMDisplayAlwaysOn_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_blockingPoliciesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
