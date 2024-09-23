@implementation BMMLSEShareSheetInferenceAppSuggestions

- (BMMLSEShareSheetInferenceAppSuggestions)initWithIdentifier:(id)a3 sourceBundleId:(id)a4 appSuggestions:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMMLSEShareSheetInferenceAppSuggestions *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMMLSEShareSheetInferenceAppSuggestions;
  v12 = -[BMEventBase init](&v14, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v12->_sourceBundleId, a4);
    objc_storeStrong((id *)&v12->_appSuggestions, a5);
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
  -[BMMLSEShareSheetInferenceAppSuggestions identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetInferenceAppSuggestions sourceBundleId](self, "sourceBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetInferenceAppSuggestions appSuggestions](self, "appSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMLSEShareSheetInferenceAppSuggestions with identifier: %@, sourceBundleId: %@, appSuggestions: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMLSEShareSheetInferenceAppSuggestions *v5;
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
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSArray *appSuggestions;
  int v28;
  BMMLSEShareSheetInferenceAppSuggestions *v29;
  objc_super v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMMLSEShareSheetInferenceAppSuggestions;
  v5 = -[BMEventBase init](&v31, sel_init);
  if (!v5)
    goto LABEL_32;
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
      v20 = v13 >> 3;
      if ((v13 >> 3) == 3)
      {
        v32 = 0;
        v33 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (v23 = -[BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion initByReadFrom:]([BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion alloc], "initByReadFrom:", v4)) == 0)
        {
LABEL_34:

          goto LABEL_31;
        }
        v24 = v23;
        objc_msgSend(v6, "addObject:", v23);
        PBReaderRecallMark();

      }
      else
      {
        if ((_DWORD)v20 == 2)
        {
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 32;
          goto LABEL_27;
        }
        if ((_DWORD)v20 == 1)
        {
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 24;
LABEL_27:
          v25 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        }
        if (!PBReaderSkipValueWithTag())
          goto LABEL_34;
      }
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v26 = objc_msgSend(v6, "copy");
  appSuggestions = v5->_appSuggestions;
  v5->_appSuggestions = (NSArray *)v26;

  v28 = v4[*v9];
  if (v28)
LABEL_31:
    v29 = 0;
  else
LABEL_32:
    v29 = v5;

  return v29;
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
  if (self->_sourceBundleId)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_appSuggestions;
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
  -[BMMLSEShareSheetInferenceAppSuggestions writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMLSEShareSheetInferenceAppSuggestions)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  id v21;
  BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion *v22;
  BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion *v23;
  id v24;
  void *v25;
  BMMLSEShareSheetInferenceAppSuggestions *v26;
  id v27;
  uint64_t v28;
  id *v29;
  id v30;
  id v31;
  uint64_t v32;
  BMMLSEShareSheetInferenceAppSuggestions *v33;
  id v34;
  void *v35;
  id v36;
  id *v37;
  id v38;
  uint64_t v39;
  void *v40;
  id *v41;
  uint64_t *v42;
  void *v43;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  BMMLSEShareSheetInferenceAppSuggestions *v49;
  id *v50;
  id v51;
  id v52;
  id *v53;
  void *v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0x1E0C99000uLL;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v26 = 0;
        goto LABEL_45;
      }
      v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v28 = *MEMORY[0x1E0D025B8];
      v70 = *MEMORY[0x1E0CB2D50];
      v29 = a4;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
      v71[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 2, v10);
      v26 = 0;
      a4 = 0;
      *v29 = v30;
      goto LABEL_44;
    }
    v53 = a4;
    a4 = v7;
  }
  else
  {
    v53 = a4;
    a4 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceBundleId"));
  v9 = objc_claimAutoreleasedReturnValue();
  v54 = v7;
  v55 = (void *)v9;
  if (!v9 || (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v52 = 0;
LABEL_7:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appSuggestions"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (v13)
    {
      v50 = a4;
      v51 = v6;

      v11 = 0;
LABEL_12:
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v11 = v11;
      v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      if (!v15)
        goto LABEL_22;
      v16 = v15;
      v17 = *(_QWORD *)v58;
      v49 = self;
LABEL_14:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v58 != v17)
          objc_enumerationMutation(v11);
        v19 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          self = v49;
          a4 = v50;
          v37 = v53;
          if (!v53)
            goto LABEL_40;
          v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v39 = *MEMORY[0x1E0D025B8];
          v61 = *MEMORY[0x1E0CB2D50];
          v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("appSuggestions"));
          v62 = v21;
          v40 = (void *)MEMORY[0x1E0C99D80];
          v41 = &v62;
          v42 = &v61;
          goto LABEL_35;
        }
        v20 = v8;
        v21 = v19;
        v22 = [BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion alloc];
        v56 = 0;
        v23 = -[BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion initWithJSONDictionary:error:](v22, "initWithJSONDictionary:error:", v21, &v56);
        v24 = v56;
        if (v24)
        {
          v43 = v24;
          if (v53)
            *v53 = objc_retainAutorelease(v24);

          self = v49;
          a4 = v50;
LABEL_39:

LABEL_40:
          v26 = 0;
          v6 = v51;
          goto LABEL_41;
        }
        objc_msgSend(v14, "addObject:", v23);

        ++v18;
        v8 = v20;
        if (v16 == v18)
        {
          v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
          self = v49;
          if (v16)
            goto LABEL_14;
LABEL_22:

          a4 = v50;
          v25 = v52;
          self = -[BMMLSEShareSheetInferenceAppSuggestions initWithIdentifier:sourceBundleId:appSuggestions:](self, "initWithIdentifier:sourceBundleId:appSuggestions:", v50, v52, v14);
          v26 = self;
          v6 = v51;
LABEL_42:

          v7 = v54;
          goto LABEL_43;
        }
      }
      self = v49;
      a4 = v50;
      v37 = v53;
      if (!v53)
        goto LABEL_40;
      v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v39 = *MEMORY[0x1E0D025B8];
      v63 = *MEMORY[0x1E0CB2D50];
      v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("appSuggestions"));
      v64 = v21;
      v40 = (void *)MEMORY[0x1E0C99D80];
      v41 = &v64;
      v42 = &v63;
LABEL_35:
      objc_msgSend(v40, "dictionaryWithObjects:forKeys:count:", v41, v42, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *v37 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2, v43);
      goto LABEL_39;
    }
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v50 = a4;
      v51 = v6;
      goto LABEL_12;
    }
    if (v53)
    {
      v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v46 = *MEMORY[0x1E0D025B8];
      v66 = *MEMORY[0x1E0CB2D50];
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("appSuggestions"));
      v67 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *v53 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2, v47);

      v26 = 0;
LABEL_41:
      v25 = v52;
      goto LABEL_42;
    }
    v26 = 0;
    v25 = v52;
LABEL_43:

    v10 = v55;
    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = v10;
    goto LABEL_7;
  }
  if (v53)
  {
    v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v32 = *MEMORY[0x1E0D025B8];
    v68 = *MEMORY[0x1E0CB2D50];
    v33 = self;
    v34 = objc_alloc(MEMORY[0x1E0CB3940]);
    v48 = objc_opt_class();
    v35 = v34;
    self = v33;
    v11 = (id)objc_msgSend(v35, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v48, CFSTR("sourceBundleId"));
    v69 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v32, 2, v14);
    v26 = 0;
    v25 = 0;
    *v53 = v36;
    goto LABEL_42;
  }
  v25 = 0;
  v26 = 0;
LABEL_44:

LABEL_45:
  return v26;
}

- (id)_appSuggestionsJSONArray
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
  -[BMMLSEShareSheetInferenceAppSuggestions appSuggestions](self, "appSuggestions", 0);
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
  -[BMMLSEShareSheetInferenceAppSuggestions identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetInferenceAppSuggestions sourceBundleId](self, "sourceBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetInferenceAppSuggestions _appSuggestionsJSONArray](self, "_appSuggestionsJSONArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("identifier");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("sourceBundleId");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("appSuggestions");
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
    -[BMMLSEShareSheetInferenceAppSuggestions identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMLSEShareSheetInferenceAppSuggestions identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
    }
    -[BMMLSEShareSheetInferenceAppSuggestions sourceBundleId](self, "sourceBundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceBundleId");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMLSEShareSheetInferenceAppSuggestions sourceBundleId](self, "sourceBundleId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceBundleId");
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
    -[BMMLSEShareSheetInferenceAppSuggestions appSuggestions](self, "appSuggestions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appSuggestions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == v20)
    {
      v12 = 1;
    }
    else
    {
      -[BMMLSEShareSheetInferenceAppSuggestions appSuggestions](self, "appSuggestions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appSuggestions");
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

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (NSArray)appSuggestions
{
  return self->_appSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSuggestions, 0);
  objc_storeStrong((id *)&self->_sourceBundleId, 0);
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

    v4 = -[BMMLSEShareSheetInferenceAppSuggestions initByReadFrom:]([BMMLSEShareSheetInferenceAppSuggestions alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceBundleId"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("appSuggestions_json"), 5, 1, &__block_literal_global_39378);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1CFD8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceBundleId"), 2, 13, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appSuggestions"), 3, 14, objc_opt_class());
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __50__BMMLSEShareSheetInferenceAppSuggestions_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_appSuggestionsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
