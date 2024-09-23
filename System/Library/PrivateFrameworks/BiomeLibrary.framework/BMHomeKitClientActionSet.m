@implementation BMHomeKitClientActionSet

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("base_json"), 5, 1, &__block_literal_global_40667);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("actionSetUniqueIdentifier"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("actionSetType"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("associatedAccessoryUniqueIdentifiers_json"), 5, 1, &__block_literal_global_37);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("actionSetName"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("homeName"), 2, 0, 6, 13, 0);
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

- (BMHomeKitClientActionSet)initWithBase:(id)a3 actionSetUniqueIdentifier:(id)a4 actionSetType:(id)a5 associatedAccessoryUniqueIdentifiers:(id)a6 actionSetName:(id)a7 homeName:(id)a8
{
  id v15;
  id v16;
  id v17;
  BMHomeKitClientActionSet *v18;
  id v20;
  id v21;
  id v22;
  objc_super v23;

  v22 = a3;
  v21 = a4;
  v20 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMHomeKitClientActionSet;
  v18 = -[BMEventBase init](&v23, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v18->_base, a3);
    objc_storeStrong((id *)&v18->_actionSetUniqueIdentifier, a4);
    objc_storeStrong((id *)&v18->_actionSetType, a5);
    objc_storeStrong((id *)&v18->_associatedAccessoryUniqueIdentifiers, a6);
    objc_storeStrong((id *)&v18->_actionSetName, a7);
    objc_storeStrong((id *)&v18->_homeName, a8);
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
  -[BMHomeKitClientActionSet base](self, "base");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientActionSet actionSetUniqueIdentifier](self, "actionSetUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientActionSet actionSetType](self, "actionSetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientActionSet associatedAccessoryUniqueIdentifiers](self, "associatedAccessoryUniqueIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientActionSet actionSetName](self, "actionSetName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientActionSet homeName](self, "homeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMHomeKitClientActionSet with base: %@, actionSetUniqueIdentifier: %@, actionSetType: %@, associatedAccessoryUniqueIdentifiers: %@, actionSetName: %@, homeName: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMHomeKitClientActionSet *v5;
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
  BMHomeKitBase *v20;
  BMHomeKitBase *base;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *associatedAccessoryUniqueIdentifiers;
  int v29;
  BMHomeKitClientActionSet *v30;
  objc_super v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMHomeKitClientActionSet;
  v5 = -[BMEventBase init](&v32, sel_init);
  if (!v5)
  {
LABEL_35:
    v30 = v5;
    goto LABEL_36;
  }
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_33:
    v27 = objc_msgSend(v6, "copy");
    associatedAccessoryUniqueIdentifiers = v5->_associatedAccessoryUniqueIdentifiers;
    v5->_associatedAccessoryUniqueIdentifiers = (NSArray *)v27;

    v29 = v4[*v9];
    if (v29)
      goto LABEL_34;
    goto LABEL_35;
  }
  v10 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v9])
      goto LABEL_33;
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
      goto LABEL_33;
    switch((v13 >> 3))
    {
      case 1u:
        v33 = 0;
        v34 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_37;
        v20 = -[BMHomeKitBase initByReadFrom:]([BMHomeKitBase alloc], "initByReadFrom:", v4);
        if (!v20)
          goto LABEL_37;
        base = v5->_base;
        v5->_base = v20;

        PBReaderRecallMark();
        goto LABEL_32;
      case 2u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 32;
        goto LABEL_31;
      case 3u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 40;
        goto LABEL_31;
      case 4u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!v24)
          goto LABEL_37;
        v25 = (void *)v24;
        objc_msgSend(v6, "addObject:", v24);

        goto LABEL_32;
      case 5u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 56;
        goto LABEL_31;
      case 6u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 64;
LABEL_31:
        v26 = *(Class *)((char *)&v5->super.super.isa + v23);
        *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

        goto LABEL_32;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_32:
          if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
            goto LABEL_33;
          continue;
        }
LABEL_37:

LABEL_34:
        v30 = 0;
LABEL_36:

        return v30;
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
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_base)
  {
    v14 = 0;
    PBDataWriterPlaceMark();
    -[BMHomeKitBase writeTo:](self->_base, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_actionSetUniqueIdentifier)
    PBDataWriterWriteStringField();
  if (self->_actionSetType)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_associatedAccessoryUniqueIdentifiers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

  if (self->_actionSetName)
    PBDataWriterWriteStringField();
  if (self->_homeName)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMHomeKitClientActionSet writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMHomeKitClientActionSet)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMHomeKitBase *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  BMHomeKitClientActionSet *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  id v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  BMHomeKitBase *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  BMHomeKitClientActionSet *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  _BYTE v79[128];
  uint64_t v80;
  void *v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  _QWORD v87[3];

  v87[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("base"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = *MEMORY[0x1E0D025B8];
        v86 = *MEMORY[0x1E0CB2D50];
        v87[0] = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("base"));
        v8 = (BMHomeKitBase *)v87[0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, &v86, 1);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = v31;
        v10 = (id)v32;
        v18 = 0;
        *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v33, 2, v32);
        goto LABEL_63;
      }
      v18 = 0;
      goto LABEL_64;
    }
    v10 = v7;
    v70 = 0;
    v8 = -[BMHomeKitBase initWithJSONDictionary:error:]([BMHomeKitBase alloc], "initWithJSONDictionary:error:", v10, &v70);
    v16 = v70;
    if (v16)
    {
      v17 = v16;
      if (a4)
        *a4 = objc_retainAutorelease(v16);

      v18 = 0;
      goto LABEL_63;
    }
    v65 = v7;

  }
  else
  {
    v65 = v7;
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actionSetUniqueIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v41 = *MEMORY[0x1E0D025B8];
        v84 = *MEMORY[0x1E0CB2D50];
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("actionSetUniqueIdentifier"));
        v85 = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2);
        v10 = 0;
        v18 = 0;
        *a4 = v42;
        goto LABEL_61;
      }
      v10 = 0;
      v18 = 0;
      goto LABEL_62;
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actionSetType"));
  v11 = objc_claimAutoreleasedReturnValue();
  v63 = (void *)v11;
  v64 = self;
  v62 = v9;
  if (v11 && (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v43 = v10;
        v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v45 = *MEMORY[0x1E0D025B8];
        v82 = *MEMORY[0x1E0CB2D50];
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("actionSetType"));
        v83 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v44;
        v10 = v43;
        v47 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v45, 2, v19);
        v29 = 0;
        v18 = 0;
        *a4 = v47;
        goto LABEL_59;
      }
      v29 = 0;
      v18 = 0;
      goto LABEL_61;
    }
    v61 = v10;
    v60 = v12;
  }
  else
  {
    v60 = 0;
    v61 = v10;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("associatedAccessoryUniqueIdentifiers"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if (v15)
  {
    v59 = v8;

    v13 = 0;
  }
  else
  {
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v18 = 0;
          v29 = v60;
          v10 = v61;
          goto LABEL_60;
        }
        v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v49 = *MEMORY[0x1E0D025B8];
        v80 = *MEMORY[0x1E0CB2D50];
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("associatedAccessoryUniqueIdentifiers"));
        v81 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        v50 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v49, 2, v26);
        v18 = 0;
        *a4 = v50;
LABEL_57:
        v29 = v60;
        v10 = v61;
        goto LABEL_58;
      }
    }
    v59 = v8;
  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v13 = v13;
  v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
  if (!v20)
    goto LABEL_29;
  v21 = v20;
  v22 = *(_QWORD *)v67;
  while (2)
  {
    v23 = 0;
    do
    {
      if (*(_QWORD *)v67 != v22)
        objc_enumerationMutation(v13);
      v24 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v23);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (a4)
        {
          v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v35 = *MEMORY[0x1E0D025B8];
          v77 = *MEMORY[0x1E0CB2D50];
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("associatedAccessoryUniqueIdentifiers"));
          v78 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
          v28 = (id)objc_claimAutoreleasedReturnValue();
          v36 = v34;
          v37 = v35;
LABEL_47:
          v29 = v60;
          v18 = 0;
          *a4 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2, v28);
          v26 = v13;
          goto LABEL_48;
        }
        goto LABEL_52;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v39 = *MEMORY[0x1E0D025B8];
          v75 = *MEMORY[0x1E0CB2D50];
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("associatedAccessoryUniqueIdentifiers"));
          v76 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
          v28 = (id)objc_claimAutoreleasedReturnValue();
          v36 = v38;
          v37 = v39;
          goto LABEL_47;
        }
LABEL_52:
        v18 = 0;
        v26 = v13;
        v8 = v59;
        goto LABEL_57;
      }
      objc_msgSend(v19, "addObject:", v24);
      ++v23;
    }
    while (v21 != v23);
    v21 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    if (v21)
      continue;
    break;
  }
LABEL_29:

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actionSetName"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v25;
      goto LABEL_32;
    }
    if (a4)
    {
      v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v53 = *MEMORY[0x1E0D025B8];
      v73 = *MEMORY[0x1E0CB2D50];
      v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("actionSetName"));
      v74 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v53, 2, v27);
      v18 = 0;
      v26 = 0;
      *a4 = v54;
      v29 = v60;
      goto LABEL_36;
    }
    v26 = 0;
    v18 = 0;
    v8 = v59;
    v29 = v60;
  }
  else
  {
    v26 = 0;
LABEL_32:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("homeName"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v28 = 0;
      v29 = v60;
      goto LABEL_35;
    }
    objc_opt_class();
    v29 = v60;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v27;
LABEL_35:
      v18 = -[BMHomeKitClientActionSet initWithBase:actionSetUniqueIdentifier:actionSetType:associatedAccessoryUniqueIdentifiers:actionSetName:homeName:](v64, "initWithBase:actionSetUniqueIdentifier:actionSetType:associatedAccessoryUniqueIdentifiers:actionSetName:homeName:", v59, v61, v29, v19, v26, v28);
      v64 = v18;
    }
    else
    {
      if (a4)
      {
        v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v57 = *MEMORY[0x1E0D025B8];
        v71 = *MEMORY[0x1E0CB2D50];
        v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("homeName"));
        v72 = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v57, 2, v56);

      }
      v28 = 0;
      v18 = 0;
    }
LABEL_36:

LABEL_48:
    v8 = v59;

  }
  v10 = v61;
LABEL_58:

LABEL_59:
LABEL_60:

  self = v64;
  v9 = v62;
LABEL_61:

LABEL_62:
  v7 = v65;
LABEL_63:

LABEL_64:
  return v18;
}

- (id)_associatedAccessoryUniqueIdentifiersJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMHomeKitClientActionSet associatedAccessoryUniqueIdentifiers](self, "associatedAccessoryUniqueIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  -[BMHomeKitClientActionSet base](self, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMHomeKitClientActionSet actionSetUniqueIdentifier](self, "actionSetUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientActionSet actionSetType](self, "actionSetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientActionSet _associatedAccessoryUniqueIdentifiersJSONArray](self, "_associatedAccessoryUniqueIdentifiersJSONArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientActionSet actionSetName](self, "actionSetName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitClientActionSet homeName](self, "homeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = CFSTR("base");
  v10 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v10;
  v23[0] = v10;
  v22[1] = CFSTR("actionSetUniqueIdentifier");
  v11 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v18 = v11;
  v23[1] = v11;
  v22[2] = CFSTR("actionSetType");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v11, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v4;
  v23[2] = v12;
  v22[3] = CFSTR("associatedAccessoryUniqueIdentifiers");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[3] = v13;
  v22[4] = CFSTR("actionSetName");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[4] = v14;
  v22[5] = CFSTR("homeName");
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[5] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 6, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      goto LABEL_15;
LABEL_21:

    if (v7)
      goto LABEL_16;
    goto LABEL_22;
  }

  if (!v8)
    goto LABEL_21;
LABEL_15:
  if (v7)
    goto LABEL_16;
LABEL_22:

LABEL_16:
  if (v6)
  {
    if (v5)
      goto LABEL_18;
LABEL_24:

    if (v21)
      goto LABEL_19;
LABEL_25:

    goto LABEL_19;
  }

  if (!v5)
    goto LABEL_24;
LABEL_18:
  if (!v21)
    goto LABEL_25;
LABEL_19:

  return v16;
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
    -[BMHomeKitClientActionSet base](self, "base");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "base");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMHomeKitClientActionSet base](self, "base");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "base");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_21;
    }
    -[BMHomeKitClientActionSet actionSetUniqueIdentifier](self, "actionSetUniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionSetUniqueIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMHomeKitClientActionSet actionSetUniqueIdentifier](self, "actionSetUniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "actionSetUniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_21;
    }
    -[BMHomeKitClientActionSet actionSetType](self, "actionSetType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionSetType");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMHomeKitClientActionSet actionSetType](self, "actionSetType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "actionSetType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_21;
    }
    -[BMHomeKitClientActionSet associatedAccessoryUniqueIdentifiers](self, "associatedAccessoryUniqueIdentifiers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "associatedAccessoryUniqueIdentifiers");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMHomeKitClientActionSet associatedAccessoryUniqueIdentifiers](self, "associatedAccessoryUniqueIdentifiers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "associatedAccessoryUniqueIdentifiers");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_21;
    }
    -[BMHomeKitClientActionSet actionSetName](self, "actionSetName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionSetName");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMHomeKitClientActionSet actionSetName](self, "actionSetName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "actionSetName");
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
    -[BMHomeKitClientActionSet homeName](self, "homeName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38 == v39)
    {
      v12 = 1;
    }
    else
    {
      -[BMHomeKitClientActionSet homeName](self, "homeName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "homeName");
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

- (BMHomeKitBase)base
{
  return self->_base;
}

- (NSString)actionSetUniqueIdentifier
{
  return self->_actionSetUniqueIdentifier;
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (NSArray)associatedAccessoryUniqueIdentifiers
{
  return self->_associatedAccessoryUniqueIdentifiers;
}

- (NSString)actionSetName
{
  return self->_actionSetName;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_actionSetName, 0);
  objc_storeStrong((id *)&self->_associatedAccessoryUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionSetType, 0);
  objc_storeStrong((id *)&self->_actionSetUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
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

    v4 = -[BMHomeKitClientActionSet initByReadFrom:]([BMHomeKitClientActionSet alloc], "initByReadFrom:", v7);
    v4[4] = 0;

  }
  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D0F8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("base"), 1, 14, objc_opt_class());
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("actionSetUniqueIdentifier"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("actionSetType"), 3, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("associatedAccessoryUniqueIdentifiers"), 4, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("actionSetName"), 5, 13, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("homeName"), 6, 13, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __35__BMHomeKitClientActionSet_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_associatedAccessoryUniqueIdentifiersJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __35__BMHomeKitClientActionSet_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
