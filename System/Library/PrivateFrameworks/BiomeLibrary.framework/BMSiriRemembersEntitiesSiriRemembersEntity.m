@implementation BMSiriRemembersEntitiesSiriRemembersEntity

- (BMSiriRemembersEntitiesSiriRemembersEntity)initWithIdentifier:(id)a3 type:(id)a4 entityFields:(id)a5 fields:(id)a6 fieldsTokens:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMSiriRemembersEntitiesSiriRemembersEntity *v17;
  id v19;
  objc_super v20;

  v19 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMSiriRemembersEntitiesSiriRemembersEntity;
  v17 = -[BMEventBase init](&v20, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v17->_type, a4);
    objc_storeStrong((id *)&v17->_entityFields, a5);
    objc_storeStrong((id *)&v17->_fields, a6);
    objc_storeStrong((id *)&v17->_fieldsTokens, a7);
  }

  return v17;
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
  -[BMSiriRemembersEntitiesSiriRemembersEntity identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersEntitiesSiriRemembersEntity type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersEntitiesSiriRemembersEntity entityFields](self, "entityFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersEntitiesSiriRemembersEntity fields](self, "fields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersEntitiesSiriRemembersEntity fieldsTokens](self, "fieldsTokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriRemembersEntitiesSiriRemembersEntity with identifier: %@, type: %@, entityFields: %@, fields: %@, fieldsTokens: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriRemembersEntitiesSiriRemembersEntity *v5;
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
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *entityFields;
  int v27;
  BMSiriRemembersEntitiesSiriRemembersEntity *v28;
  objc_super v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BMSiriRemembersEntitiesSiriRemembersEntity;
  v5 = -[BMEventBase init](&v30, sel_init);
  if (!v5)
  {
LABEL_33:
    v28 = v5;
    goto LABEL_34;
  }
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_31:
    v25 = objc_msgSend(v6, "copy");
    entityFields = v5->_entityFields;
    v5->_entityFields = (NSArray *)v25;

    v27 = v4[*v9];
    if (v27)
      goto LABEL_32;
    goto LABEL_33;
  }
  v10 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v9])
      goto LABEL_31;
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
      goto LABEL_31;
    switch((v13 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 24;
        goto LABEL_29;
      case 2u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 32;
        goto LABEL_29;
      case 3u:
        v31 = 0;
        v32 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_35;
        v22 = -[BMSiriRemembersField initByReadFrom:]([BMSiriRemembersField alloc], "initByReadFrom:", v4);
        if (!v22)
          goto LABEL_35;
        v23 = v22;
        objc_msgSend(v6, "addObject:", v22);
        PBReaderRecallMark();

        goto LABEL_30;
      case 4u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 48;
        goto LABEL_29;
      case 5u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 56;
LABEL_29:
        v24 = *(Class *)((char *)&v5->super.super.isa + v21);
        *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

        goto LABEL_30;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_30:
          if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
            goto LABEL_31;
          continue;
        }
LABEL_35:

LABEL_32:
        v28 = 0;
LABEL_34:

        return v28;
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
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_type)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_entityFields;
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

  if (self->_fields)
    PBDataWriterWriteStringField();
  if (self->_fieldsTokens)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriRemembersEntitiesSiriRemembersEntity writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriRemembersEntitiesSiriRemembersEntity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  BMSiriRemembersField *v20;
  BMSiriRemembersField *v21;
  id v22;
  id v23;
  id *v24;
  id v25;
  uint64_t v26;
  BMSiriRemembersEntitiesSiriRemembersEntity *v27;
  id v28;
  void *v29;
  BMSiriRemembersEntitiesSiriRemembersEntity *v30;
  void *v31;
  id *v32;
  id v33;
  uint64_t v34;
  id *v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id *v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  id *v57;
  BMSiriRemembersEntitiesSiriRemembersEntity *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  id v78;
  _BYTE v79[128];
  uint64_t v80;
  void *v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v24 = a4;
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v84 = *MEMORY[0x1E0CB2D50];
        v27 = self;
        v28 = objc_alloc(MEMORY[0x1E0CB3940]);
        v53 = objc_opt_class();
        v29 = v28;
        self = v27;
        v10 = (id)objc_msgSend(v29, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v53, CFSTR("identifier"));
        v85[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        v31 = 0;
        *v24 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v9);
        goto LABEL_68;
      }
      v30 = 0;
      v31 = 0;
      goto LABEL_69;
    }
    v63 = v7;
  }
  else
  {
    v63 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v8 = objc_claimAutoreleasedReturnValue();
  v61 = (void *)v8;
  v62 = v7;
  if (v8 && (v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v32 = a4;
        v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v34 = *MEMORY[0x1E0D025B8];
        v82 = *MEMORY[0x1E0CB2D50];
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("type"));
        v83 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        v10 = 0;
        *v32 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 2);
        v31 = v63;

        goto LABEL_67;
      }
      v10 = 0;
      v30 = 0;
      v31 = v63;
      goto LABEL_68;
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entityFields"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  v60 = v10;
  if (v13)
  {
    v57 = a4;
    v58 = self;

    v11 = 0;
  }
  else
  {
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v30 = 0;
          v31 = v63;
          goto LABEL_67;
        }
        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v44 = *MEMORY[0x1E0D025B8];
        v80 = *MEMORY[0x1E0CB2D50];
        v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("entityFields"));
        v81 = v64;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
        v45 = a4;
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v46 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v23);
        v30 = 0;
        *v45 = v46;
LABEL_45:
        v31 = v63;
        goto LABEL_66;
      }
    }
    v57 = a4;
    v58 = self;
  }
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v11 = v11;
  v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
  if (!v14)
    goto LABEL_22;
  v15 = v14;
  v16 = *(_QWORD *)v68;
  v56 = v6;
  while (2)
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v68 != v16)
        objc_enumerationMutation(v11);
      v18 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = v57;
        if (v57)
        {
          v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v37 = *MEMORY[0x1E0D025B8];
          v77 = *MEMORY[0x1E0CB2D50];
          v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("entityFields"));
          v78 = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
          v38 = (id)objc_claimAutoreleasedReturnValue();
          v39 = v36;
          v40 = v37;
LABEL_37:
          v30 = 0;
          *v35 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2, v38);
LABEL_41:
          v23 = v11;
          v6 = v56;
          self = v58;
          v10 = v60;
          v31 = v63;
          goto LABEL_64;
        }
        goto LABEL_44;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v35 = v57;
        if (v57)
        {
          v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v42 = *MEMORY[0x1E0D025B8];
          v75 = *MEMORY[0x1E0CB2D50];
          v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("entityFields"));
          v76 = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
          v38 = (id)objc_claimAutoreleasedReturnValue();
          v39 = v41;
          v40 = v42;
          goto LABEL_37;
        }
LABEL_44:
        v30 = 0;
        v23 = v11;
        v6 = v56;
        self = v58;
        v10 = v60;
        goto LABEL_45;
      }
      v19 = v18;
      v20 = [BMSiriRemembersField alloc];
      v66 = 0;
      v21 = -[BMSiriRemembersField initWithJSONDictionary:error:](v20, "initWithJSONDictionary:error:", v19, &v66);
      v22 = v66;
      if (v22)
      {
        v38 = v22;
        if (v57)
          *v57 = objc_retainAutorelease(v22);

        v30 = 0;
        goto LABEL_41;
      }
      objc_msgSend(v64, "addObject:", v21);

    }
    v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
    v6 = v56;
    if (v15)
      continue;
    break;
  }
LABEL_22:

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fields"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v23 = 0;
    self = v58;
    goto LABEL_49;
  }
  objc_opt_class();
  self = v58;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = 0;
LABEL_49:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fieldsTokens"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v47 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v38 = 0;
      v31 = v63;
      goto LABEL_52;
    }
    objc_opt_class();
    v31 = v63;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = v47;
LABEL_52:
      self = -[BMSiriRemembersEntitiesSiriRemembersEntity initWithIdentifier:type:entityFields:fields:fieldsTokens:](self, "initWithIdentifier:type:entityFields:fields:fieldsTokens:", v31, v10, v64, v23, v38);
      v30 = self;
    }
    else
    {
      if (v57)
      {
        v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v55 = *MEMORY[0x1E0D025B8];
        v71 = *MEMORY[0x1E0CB2D50];
        v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("fieldsTokens"));
        v72 = v50;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *v57 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v55, 2, v51);

      }
      v38 = 0;
      v30 = 0;
    }
LABEL_63:

LABEL_64:
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v19;
      goto LABEL_49;
    }
    if (v57)
    {
      v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v48 = *MEMORY[0x1E0D025B8];
      v73 = *MEMORY[0x1E0CB2D50];
      v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("fields"));
      v74 = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v48, 2, v47);
      v30 = 0;
      v23 = 0;
      *v57 = v49;
      v31 = v63;
      goto LABEL_63;
    }
    v23 = 0;
    v30 = 0;
    v31 = v63;
  }

LABEL_66:
LABEL_67:

  v9 = v61;
  v7 = v62;
LABEL_68:

LABEL_69:
  return v30;
}

- (id)_entityFieldsJSONArray
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
  -[BMSiriRemembersEntitiesSiriRemembersEntity entityFields](self, "entityFields", 0);
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
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  -[BMSiriRemembersEntitiesSiriRemembersEntity identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersEntitiesSiriRemembersEntity type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersEntitiesSiriRemembersEntity _entityFieldsJSONArray](self, "_entityFieldsJSONArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersEntitiesSiriRemembersEntity fields](self, "fields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersEntitiesSiriRemembersEntity fieldsTokens](self, "fieldsTokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("identifier");
  v8 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v8;
  v22[0] = v8;
  v18 = CFSTR("type");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v9;
  v19 = CFSTR("entityFields");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v10;
  v20 = CFSTR("fields");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v11;
  v21 = CFSTR("fieldsTokens");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
      goto LABEL_13;
  }
  else
  {

    if (v6)
    {
LABEL_13:
      if (v5)
        goto LABEL_14;
      goto LABEL_19;
    }
  }

  if (v5)
  {
LABEL_14:
    if (v4)
      goto LABEL_15;
LABEL_20:

    if (v3)
      goto LABEL_16;
LABEL_21:

    goto LABEL_16;
  }
LABEL_19:

  if (!v4)
    goto LABEL_20;
LABEL_15:
  if (!v3)
    goto LABEL_21;
LABEL_16:

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
  void *v32;
  void *v33;
  void *v34;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriRemembersEntitiesSiriRemembersEntity identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriRemembersEntitiesSiriRemembersEntity identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    -[BMSiriRemembersEntitiesSiriRemembersEntity type](self, "type");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "type");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriRemembersEntitiesSiriRemembersEntity type](self, "type");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "type");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_17;
    }
    -[BMSiriRemembersEntitiesSiriRemembersEntity entityFields](self, "entityFields");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entityFields");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSiriRemembersEntitiesSiriRemembersEntity entityFields](self, "entityFields");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entityFields");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_17;
    }
    -[BMSiriRemembersEntitiesSiriRemembersEntity fields](self, "fields");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fields");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMSiriRemembersEntitiesSiriRemembersEntity fields](self, "fields");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fields");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
      {
LABEL_17:
        v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    -[BMSiriRemembersEntitiesSiriRemembersEntity fieldsTokens](self, "fieldsTokens");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fieldsTokens");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 == v32)
    {
      v12 = 1;
    }
    else
    {
      -[BMSiriRemembersEntitiesSiriRemembersEntity fieldsTokens](self, "fieldsTokens");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fieldsTokens");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v33, "isEqual:", v34);

    }
    goto LABEL_23;
  }
  v12 = 0;
LABEL_24:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)type
{
  return self->_type;
}

- (NSArray)entityFields
{
  return self->_entityFields;
}

- (NSString)fields
{
  return self->_fields;
}

- (NSString)fieldsTokens
{
  return self->_fieldsTokens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldsTokens, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_entityFields, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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

    v4 = -[BMSiriRemembersEntitiesSiriRemembersEntity initByReadFrom:]([BMSiriRemembersEntitiesSiriRemembersEntity alloc], "initByReadFrom:", v7);
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
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("entityFields_json"), 5, 1, &__block_literal_global_21353);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("fields"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("fieldsTokens"), 2, 0, 5, 13, 0);
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1BBB0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 2, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("entityFields"), 3, 14, objc_opt_class());
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fields"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fieldsTokens"), 5, 13, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __53__BMSiriRemembersEntitiesSiriRemembersEntity_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_entityFieldsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriRemembersEntitiesSiriRemembersEntity)initWithIdentifier:(id)a3 type:(id)a4 entityFields:(id)a5
{
  return -[BMSiriRemembersEntitiesSiriRemembersEntity initWithIdentifier:type:entityFields:fields:fieldsTokens:](self, "initWithIdentifier:type:entityFields:fields:fieldsTokens:", a3, a4, a5, 0, 0);
}

@end
