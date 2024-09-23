@implementation BMMLSEShareSheetInferencePeopleSuggestions

- (BMMLSEShareSheetInferencePeopleSuggestions)initWithIdentifier:(id)a3 sourceBundleId:(id)a4 peopleSuggestions:(id)a5
{
  return -[BMMLSEShareSheetInferencePeopleSuggestions initWithIdentifier:sourceBundleId:peopleSuggestions:responseType:](self, "initWithIdentifier:sourceBundleId:peopleSuggestions:responseType:", a3, a4, a5, 0);
}

- (BMMLSEShareSheetInferencePeopleSuggestions)initWithIdentifier:(id)a3 sourceBundleId:(id)a4 peopleSuggestions:(id)a5 responseType:(int)a6
{
  id v11;
  id v12;
  id v13;
  BMMLSEShareSheetInferencePeopleSuggestions *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMMLSEShareSheetInferencePeopleSuggestions;
  v14 = -[BMEventBase init](&v16, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v14->_identifier, a3);
    objc_storeStrong((id *)&v14->_sourceBundleId, a4);
    objc_storeStrong((id *)&v14->_peopleSuggestions, a5);
    v14->_responseType = a6;
  }

  return v14;
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
  -[BMMLSEShareSheetInferencePeopleSuggestions identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetInferencePeopleSuggestions sourceBundleId](self, "sourceBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetInferencePeopleSuggestions peopleSuggestions](self, "peopleSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMMLSEShareSheetInferencePeopleSuggestionsResponseTypeAsString(-[BMMLSEShareSheetInferencePeopleSuggestions responseType](self, "responseType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMLSEShareSheetInferencePeopleSuggestions with identifier: %@, sourceBundleId: %@, peopleSuggestions: %@, responseType: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMLSEShareSheetInferencePeopleSuggestions *v5;
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
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  NSArray *peopleSuggestions;
  int v35;
  BMMLSEShareSheetInferencePeopleSuggestions *v36;
  objc_super v38;
  uint64_t v39;
  uint64_t v40;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMMLSEShareSheetInferencePeopleSuggestions;
  v5 = -[BMEventBase init](&v38, sel_init);
  if (!v5)
    goto LABEL_44;
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
          v22 = 24;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 32;
LABEL_24:
          v23 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        case 3u:
          v39 = 0;
          v40 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_46;
          v24 = -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion initByReadFrom:]([BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion alloc], "initByReadFrom:", v4);
          if (!v24)
            goto LABEL_46;
          v25 = v24;
          objc_msgSend(v6, "addObject:", v24);
          PBReaderRecallMark();

          continue;
        case 4u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          break;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_46:

          goto LABEL_43;
      }
      while (1)
      {
        v29 = *v7;
        v30 = *(_QWORD *)&v4[v29];
        v31 = v30 + 1;
        if (v30 == -1 || v31 > *(_QWORD *)&v4[*v8])
          break;
        v32 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v30);
        *(_QWORD *)&v4[v29] = v31;
        v28 |= (unint64_t)(v32 & 0x7F) << v26;
        if ((v32 & 0x80) == 0)
          goto LABEL_36;
        v26 += 7;
        v18 = v27++ >= 9;
        if (v18)
        {
          LODWORD(v28) = 0;
          goto LABEL_38;
        }
      }
      v4[*v9] = 1;
LABEL_36:
      if (v4[*v9])
        LODWORD(v28) = 0;
LABEL_38:
      if (v28 >= 4)
        LODWORD(v28) = 0;
      v5->_responseType = v28;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v33 = objc_msgSend(v6, "copy");
  peopleSuggestions = v5->_peopleSuggestions;
  v5->_peopleSuggestions = (NSArray *)v33;

  v35 = v4[*v9];
  if (v35)
LABEL_43:
    v36 = 0;
  else
LABEL_44:
    v36 = v5;

  return v36;
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
  v5 = self->_peopleSuggestions;
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
  -[BMMLSEShareSheetInferencePeopleSuggestions writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMLSEShareSheetInferencePeopleSuggestions)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *v20;
  BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  BMMLSEShareSheetInferencePeopleSuggestions *v27;
  id v28;
  uint64_t v29;
  id v30;
  id *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id *v35;
  uint64_t *v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  BMMLSEShareSheetInferencePeopleSuggestions *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id v65;
  _BYTE v66[128];
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sourceBundleId"));
    v8 = objc_claimAutoreleasedReturnValue();
    v51 = (void *)v8;
    if (!v8 || (v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
LABEL_7:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("peopleSuggestions"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (v13)
      {
        v47 = v10;
        v48 = v7;
        v49 = self;
        v50 = v6;

        v11 = 0;
LABEL_12:
        v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v11 = v11;
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
        if (!v14)
          goto LABEL_22;
        v15 = v14;
        v16 = *(_QWORD *)v57;
        v46 = v5;
LABEL_14:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v57 != v16)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v31 = a4;
            if (a4)
            {
              v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v33 = *MEMORY[0x1E0D025B8];
              v62 = *MEMORY[0x1E0CB2D50];
              v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("peopleSuggestions"));
              v63 = v19;
              v34 = (void *)MEMORY[0x1E0C99D80];
              v35 = &v63;
              v36 = &v62;
              goto LABEL_37;
            }
            goto LABEL_44;
          }
          v19 = v18;
          v20 = [BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion alloc];
          v55 = 0;
          v21 = -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion initWithJSONDictionary:error:](v20, "initWithJSONDictionary:error:", v19, &v55);
          v22 = v55;
          if (v22)
          {
            v37 = v22;
            if (a4)
              *a4 = objc_retainAutorelease(v22);

            goto LABEL_41;
          }
          objc_msgSend(v53, "addObject:", v21);

          if (v15 == ++v17)
          {
            v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
            v5 = v46;
            if (v15)
              goto LABEL_14;
LABEL_22:

            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("responseType"));
            v19 = (id)objc_claimAutoreleasedReturnValue();
            if (!v19)
            {
              v23 = 0;
              v7 = v48;
              self = v49;
              goto LABEL_53;
            }
            objc_opt_class();
            v7 = v48;
            self = v49;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = 0;
              goto LABEL_53;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = v19;
              goto LABEL_53;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMLSEShareSheetInferencePeopleSuggestionsResponseTypeFromString(v19));
              v23 = (id)objc_claimAutoreleasedReturnValue();
              v7 = v48;
LABEL_53:
              v10 = v47;
              self = -[BMMLSEShareSheetInferencePeopleSuggestions initWithIdentifier:sourceBundleId:peopleSuggestions:responseType:](self, "initWithIdentifier:sourceBundleId:peopleSuggestions:responseType:", v7, v47, v53, objc_msgSend(v23, "intValue"));
              v27 = self;
            }
            else
            {
              if (a4)
              {
                v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v42 = *MEMORY[0x1E0D025B8];
                v60 = *MEMORY[0x1E0CB2D50];
                v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("responseType"));
                v61 = v43;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                *a4 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v42, 2, v44);

              }
              v23 = 0;
              v27 = 0;
              v7 = v48;
              v10 = v47;
            }
LABEL_54:

            v6 = v50;
LABEL_55:

            goto LABEL_57;
          }
        }
        v31 = a4;
        if (a4)
        {
          v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v33 = *MEMORY[0x1E0D025B8];
          v64 = *MEMORY[0x1E0CB2D50];
          v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("peopleSuggestions"));
          v65 = v19;
          v34 = (void *)MEMORY[0x1E0C99D80];
          v35 = &v65;
          v36 = &v64;
LABEL_37:
          objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *v31 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v37);
LABEL_41:

          v27 = 0;
          v23 = v11;
          v5 = v46;
          v10 = v47;
          v7 = v48;
          self = v49;
          goto LABEL_54;
        }
LABEL_44:
        v27 = 0;
        v23 = v11;
        v5 = v46;
        v10 = v47;
        self = v49;
        v6 = v50;
        v7 = v48;
        goto LABEL_55;
      }
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v47 = v10;
        v48 = v7;
        v49 = self;
        v50 = v6;
        goto LABEL_12;
      }
      if (a4)
      {
        v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v39 = *MEMORY[0x1E0D025B8];
        v67 = *MEMORY[0x1E0CB2D50];
        v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("peopleSuggestions"));
        v68 = v53;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v40 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2, v23);
        v27 = 0;
        *a4 = v40;
        goto LABEL_55;
      }
      v27 = 0;
LABEL_57:

      v9 = v51;
      goto LABEL_58;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      goto LABEL_7;
    }
    if (a4)
    {
      v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v29 = *MEMORY[0x1E0D025B8];
      v69 = *MEMORY[0x1E0CB2D50];
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sourceBundleId"));
      v70 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2);
      v10 = 0;
      v27 = 0;
      *a4 = v30;

      goto LABEL_57;
    }
    v10 = 0;
    v27 = 0;
LABEL_58:

    goto LABEL_59;
  }
  if (a4)
  {
    v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v25 = *MEMORY[0x1E0D025B8];
    v71 = *MEMORY[0x1E0CB2D50];
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
    v72[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 2, v9);
    v7 = 0;
    v27 = 0;
    *a4 = v26;
    goto LABEL_58;
  }
  v7 = 0;
  v27 = 0;
LABEL_59:

  return v27;
}

- (id)_peopleSuggestionsJSONArray
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
  -[BMMLSEShareSheetInferencePeopleSuggestions peopleSuggestions](self, "peopleSuggestions", 0);
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
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  -[BMMLSEShareSheetInferencePeopleSuggestions identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetInferencePeopleSuggestions sourceBundleId](self, "sourceBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetInferencePeopleSuggestions _peopleSuggestionsJSONArray](self, "_peopleSuggestionsJSONArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMLSEShareSheetInferencePeopleSuggestions responseType](self, "responseType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("identifier");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v7;
  v13[1] = CFSTR("sourceBundleId");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v8;
  v13[2] = CFSTR("peopleSuggestions");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v9;
  v13[3] = CFSTR("responseType");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
      goto LABEL_11;
  }
  else
  {

    if (v5)
    {
LABEL_11:
      if (v4)
        goto LABEL_12;
LABEL_16:

      if (v3)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v4)
    goto LABEL_16;
LABEL_12:
  if (!v3)
    goto LABEL_17;
LABEL_13:

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
  int v25;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMLSEShareSheetInferencePeopleSuggestions identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMLSEShareSheetInferencePeopleSuggestions identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_13;
    }
    -[BMMLSEShareSheetInferencePeopleSuggestions sourceBundleId](self, "sourceBundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceBundleId");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMLSEShareSheetInferencePeopleSuggestions sourceBundleId](self, "sourceBundleId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceBundleId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_13;
    }
    -[BMMLSEShareSheetInferencePeopleSuggestions peopleSuggestions](self, "peopleSuggestions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "peopleSuggestions");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMMLSEShareSheetInferencePeopleSuggestions peopleSuggestions](self, "peopleSuggestions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "peopleSuggestions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
      {
LABEL_13:
        v12 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    v25 = -[BMMLSEShareSheetInferencePeopleSuggestions responseType](self, "responseType");
    v12 = v25 == objc_msgSend(v5, "responseType");
    goto LABEL_16;
  }
  v12 = 0;
LABEL_17:

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

- (NSArray)peopleSuggestions
{
  return self->_peopleSuggestions;
}

- (int)responseType
{
  return self->_responseType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleSuggestions, 0);
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

    v4 = -[BMMLSEShareSheetInferencePeopleSuggestions initByReadFrom:]([BMMLSEShareSheetInferencePeopleSuggestions alloc], "initByReadFrom:", v7);
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
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceBundleId"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("peopleSuggestions_json"), 5, 1, &__block_literal_global_273_75407);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("responseType"), 0, 0, 4, 4, 0);
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
  return &unk_1E5F1FE70;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceBundleId"), 2, 13, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("peopleSuggestions"), 3, 14, objc_opt_class());
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("responseType"), 4, 4, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __53__BMMLSEShareSheetInferencePeopleSuggestions_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_peopleSuggestionsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
