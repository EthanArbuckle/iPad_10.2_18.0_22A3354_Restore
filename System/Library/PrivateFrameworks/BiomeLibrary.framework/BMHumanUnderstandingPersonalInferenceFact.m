@implementation BMHumanUnderstandingPersonalInferenceFact

- (BMHumanUnderstandingPersonalInferenceFact)initWithSubjectID:(id)a3 subjectAlias:(id)a4 subjectIsa:(id)a5 predicateID:(id)a6 objectID:(id)a7 objectAlias:(id)a8
{
  id v15;
  id v16;
  id v17;
  BMHumanUnderstandingPersonalInferenceFact *v18;
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
  v23.super_class = (Class)BMHumanUnderstandingPersonalInferenceFact;
  v18 = -[BMEventBase init](&v23, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v18->_subjectID, a3);
    objc_storeStrong((id *)&v18->_subjectAlias, a4);
    objc_storeStrong((id *)&v18->_subjectIsa, a5);
    objc_storeStrong((id *)&v18->_predicateID, a6);
    objc_storeStrong((id *)&v18->_objectID, a7);
    objc_storeStrong((id *)&v18->_objectAlias, a8);
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
  -[BMHumanUnderstandingPersonalInferenceFact subjectID](self, "subjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHumanUnderstandingPersonalInferenceFact subjectAlias](self, "subjectAlias");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHumanUnderstandingPersonalInferenceFact subjectIsa](self, "subjectIsa");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHumanUnderstandingPersonalInferenceFact predicateID](self, "predicateID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHumanUnderstandingPersonalInferenceFact objectID](self, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHumanUnderstandingPersonalInferenceFact objectAlias](self, "objectAlias");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMHumanUnderstandingPersonalInferenceFact with subjectID: %@, subjectAlias: %@, subjectIsa: %@, predicateID: %@, objectID: %@, objectAlias: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMHumanUnderstandingPersonalInferenceFact *v5;
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
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *subjectIsa;
  int v27;
  BMHumanUnderstandingPersonalInferenceFact *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BMHumanUnderstandingPersonalInferenceFact;
  v5 = -[BMEventBase init](&v30, sel_init);
  if (!v5)
  {
LABEL_34:
    v28 = v5;
    goto LABEL_35;
  }
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_32:
    v25 = objc_msgSend(v6, "copy");
    subjectIsa = v5->_subjectIsa;
    v5->_subjectIsa = (NSArray *)v25;

    v27 = v4[*v9];
    if (v27)
      goto LABEL_33;
    goto LABEL_34;
  }
  v10 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v9])
      goto LABEL_32;
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
      goto LABEL_32;
    switch((v13 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 24;
        goto LABEL_29;
      case 2u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 32;
        goto LABEL_29;
      case 3u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        if (!v23)
          goto LABEL_36;
        v24 = (void *)v23;
        objc_msgSend(v6, "addObject:", v23);
        goto LABEL_30;
      case 4u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 48;
        goto LABEL_29;
      case 5u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 56;
        goto LABEL_29;
      case 6u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 64;
LABEL_29:
        v24 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;
LABEL_30:

        goto LABEL_31;
      default:
        if ((PBReaderSkipValueWithTag() & 1) != 0)
        {
LABEL_31:
          if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
            goto LABEL_32;
          continue;
        }
LABEL_36:

LABEL_33:
        v28 = 0;
LABEL_35:

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
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_subjectID)
    PBDataWriterWriteStringField();
  if (self->_subjectAlias)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_subjectIsa;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_predicateID)
    PBDataWriterWriteStringField();
  if (self->_objectID)
    PBDataWriterWriteStringField();
  if (self->_objectAlias)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMHumanUnderstandingPersonalInferenceFact writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMHumanUnderstandingPersonalInferenceFact)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  BMHumanUnderstandingPersonalInferenceFact *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t *v33;
  uint64_t *v34;
  id *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  BMHumanUnderstandingPersonalInferenceFact *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v56;
  id v57;
  id v58;
  void *v59;
  uint64_t v60;
  id v61;
  BMHumanUnderstandingPersonalInferenceFact *v62;
  void *v63;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _BYTE v80[128];
  uint64_t v81;
  void *v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  _QWORD v86[3];

  v86[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subjectID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v35 = a4;
        v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = *MEMORY[0x1E0D025B8];
        v85 = *MEMORY[0x1E0CB2D50];
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("subjectID"));
        v86[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2, v38);
        v8 = 0;
        v29 = 0;
        *v35 = v39;
        v10 = (void *)v38;
        goto LABEL_71;
      }
      v8 = 0;
      v29 = 0;
      goto LABEL_72;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subjectAlias"));
  v9 = objc_claimAutoreleasedReturnValue();
  v63 = v7;
  v64 = (void *)v9;
  v65 = v8;
  if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v41 = *MEMORY[0x1E0D025B8];
        v83 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("subjectAlias"));
        v84 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 0;
        v29 = 0;
        *a4 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2, v15);
        goto LABEL_69;
      }
      v11 = 0;
      v29 = 0;
      goto LABEL_71;
    }
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subjectIsa"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if (v14)
  {
    v62 = self;

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
          v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v43 = self;
          v44 = *MEMORY[0x1E0D025B8];
          v81 = *MEMORY[0x1E0CB2D50];
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("subjectIsa"));
          v82 = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
          v23 = (id)objc_claimAutoreleasedReturnValue();
          v45 = v44;
          self = v43;
          v29 = 0;
          *a4 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v45, 2, v23);
          goto LABEL_68;
        }
        v29 = 0;
        goto LABEL_70;
      }
    }
    v62 = self;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v12 = v12;
  v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
  v61 = v11;
  if (!v16)
    goto LABEL_21;
  v17 = v16;
  v18 = *(_QWORD *)v67;
  while (2)
  {
    v19 = 0;
    do
    {
      if (*(_QWORD *)v67 != v18)
        objc_enumerationMutation(v12);
      v20 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v19);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (a4)
        {
          v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v31 = *MEMORY[0x1E0D025B8];
          v78 = *MEMORY[0x1E0CB2D50];
          v60 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("subjectIsa"));
          v79 = v60;
          v32 = (void *)MEMORY[0x1E0C99D80];
          v33 = &v79;
          v34 = &v78;
LABEL_39:
          objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v33, v34, 1);
          v26 = (id)objc_claimAutoreleasedReturnValue();
          v11 = v61;
          v29 = 0;
          *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v26);
          v23 = v12;
          goto LABEL_66;
        }
LABEL_42:
        v29 = 0;
        v23 = v12;
        v11 = v61;
        self = v62;
        goto LABEL_68;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v31 = *MEMORY[0x1E0D025B8];
          v76 = *MEMORY[0x1E0CB2D50];
          v60 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("subjectIsa"));
          v77 = v60;
          v32 = (void *)MEMORY[0x1E0C99D80];
          v33 = &v77;
          v34 = &v76;
          goto LABEL_39;
        }
        goto LABEL_42;
      }
      objc_msgSend(v15, "addObject:", v20);
      ++v19;
    }
    while (v17 != v19);
    v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    v11 = v61;
    if (v17)
      continue;
    break;
  }
LABEL_21:

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("predicateID"));
  v21 = objc_claimAutoreleasedReturnValue();
  v60 = v21;
  if (v21)
  {
    v22 = (void *)v21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v22;
        v11 = v61;
        goto LABEL_24;
      }
      if (!a4)
      {
        v23 = 0;
        v29 = 0;
        v11 = v61;
        self = v62;
        goto LABEL_67;
      }
      v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v47 = *MEMORY[0x1E0D025B8];
      v74 = *MEMORY[0x1E0CB2D50];
      v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("predicateID"));
      v75 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = v47;
      v25 = (void *)v48;
      v50 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v49, 2, v48);
      v29 = 0;
      v23 = 0;
      *a4 = v50;
      goto LABEL_75;
    }
  }
  v23 = 0;
LABEL_24:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("objectID"));
  v24 = objc_claimAutoreleasedReturnValue();
  v59 = (void *)v24;
  if (v24)
  {
    v25 = (void *)v24;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = v25;
        v11 = v61;
        goto LABEL_27;
      }
      if (a4)
      {
        v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v51 = *MEMORY[0x1E0D025B8];
        v72 = *MEMORY[0x1E0CB2D50];
        v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("objectID"));
        v73 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v51, 2, v27);
        v29 = 0;
        v26 = 0;
        *a4 = v52;
LABEL_63:
        v11 = v61;
        goto LABEL_64;
      }
      v26 = 0;
      v29 = 0;
LABEL_75:
      v11 = v61;
      goto LABEL_65;
    }
  }
  v26 = 0;
LABEL_27:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("objectAlias"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v28 = 0;
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v56 = *MEMORY[0x1E0D025B8];
      v70 = *MEMORY[0x1E0CB2D50];
      v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("objectAlias"));
      v71 = v53;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v56, 2, v54);

    }
    v28 = 0;
    v29 = 0;
    goto LABEL_63;
  }
  v28 = v27;
  v11 = v61;
LABEL_30:
  v29 = -[BMHumanUnderstandingPersonalInferenceFact initWithSubjectID:subjectAlias:subjectIsa:predicateID:objectID:objectAlias:](v62, "initWithSubjectID:subjectAlias:subjectIsa:predicateID:objectID:objectAlias:", v65, v11, v15, v23, v26, v28);
  v62 = v29;
LABEL_64:

  v25 = v59;
LABEL_65:

LABEL_66:
  self = v62;

  v22 = (void *)v60;
LABEL_67:

LABEL_68:
LABEL_69:

  v7 = v63;
LABEL_70:
  v8 = v65;

  v10 = v64;
LABEL_71:

LABEL_72:
  return v29;
}

- (id)_subjectIsaJSONArray
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
  -[BMHumanUnderstandingPersonalInferenceFact subjectIsa](self, "subjectIsa", 0);
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
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  -[BMHumanUnderstandingPersonalInferenceFact subjectID](self, "subjectID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMHumanUnderstandingPersonalInferenceFact subjectAlias](self, "subjectAlias");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHumanUnderstandingPersonalInferenceFact _subjectIsaJSONArray](self, "_subjectIsaJSONArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHumanUnderstandingPersonalInferenceFact predicateID](self, "predicateID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHumanUnderstandingPersonalInferenceFact objectID](self, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHumanUnderstandingPersonalInferenceFact objectAlias](self, "objectAlias");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("subjectID");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v9;
  v22[0] = v9;
  v21[1] = CFSTR("subjectAlias");
  v10 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v10;
  v22[1] = v10;
  v21[2] = CFSTR("subjectIsa");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = CFSTR("predicateID");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v12;
  v21[4] = CFSTR("objectID");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v13;
  v21[5] = CFSTR("objectAlias");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_15;
LABEL_21:

    if (v6)
      goto LABEL_16;
    goto LABEL_22;
  }

  if (!v7)
    goto LABEL_21;
LABEL_15:
  if (v6)
    goto LABEL_16;
LABEL_22:

LABEL_16:
  if (v5)
  {
    if (v4)
      goto LABEL_18;
LABEL_24:

    if (v20)
      goto LABEL_19;
LABEL_25:

    goto LABEL_19;
  }

  if (!v4)
    goto LABEL_24;
LABEL_18:
  if (!v20)
    goto LABEL_25;
LABEL_19:

  return v15;
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
    -[BMHumanUnderstandingPersonalInferenceFact subjectID](self, "subjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subjectID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMHumanUnderstandingPersonalInferenceFact subjectID](self, "subjectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subjectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_21;
    }
    -[BMHumanUnderstandingPersonalInferenceFact subjectAlias](self, "subjectAlias");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subjectAlias");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMHumanUnderstandingPersonalInferenceFact subjectAlias](self, "subjectAlias");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subjectAlias");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_21;
    }
    -[BMHumanUnderstandingPersonalInferenceFact subjectIsa](self, "subjectIsa");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subjectIsa");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMHumanUnderstandingPersonalInferenceFact subjectIsa](self, "subjectIsa");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subjectIsa");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_21;
    }
    -[BMHumanUnderstandingPersonalInferenceFact predicateID](self, "predicateID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateID");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMHumanUnderstandingPersonalInferenceFact predicateID](self, "predicateID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predicateID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_21;
    }
    -[BMHumanUnderstandingPersonalInferenceFact objectID](self, "objectID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMHumanUnderstandingPersonalInferenceFact objectID](self, "objectID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectID");
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
    -[BMHumanUnderstandingPersonalInferenceFact objectAlias](self, "objectAlias");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAlias");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38 == v39)
    {
      v12 = 1;
    }
    else
    {
      -[BMHumanUnderstandingPersonalInferenceFact objectAlias](self, "objectAlias");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAlias");
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

- (NSString)subjectID
{
  return self->_subjectID;
}

- (NSString)subjectAlias
{
  return self->_subjectAlias;
}

- (NSArray)subjectIsa
{
  return self->_subjectIsa;
}

- (NSString)predicateID
{
  return self->_predicateID;
}

- (NSString)objectID
{
  return self->_objectID;
}

- (NSString)objectAlias
{
  return self->_objectAlias;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectAlias, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_predicateID, 0);
  objc_storeStrong((id *)&self->_subjectIsa, 0);
  objc_storeStrong((id *)&self->_subjectAlias, 0);
  objc_storeStrong((id *)&self->_subjectID, 0);
}

+ (unsigned)latestDataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 1)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMHumanUnderstandingPersonalInferenceFact initByReadFrom:]([BMHumanUnderstandingPersonalInferenceFact alloc], "initByReadFrom:", v6);
    v7[4] = 1;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subjectID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subjectAlias"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("subjectIsa_json"), 5, 1, &__block_literal_global_74008);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("predicateID"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("objectID"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("objectAlias"), 2, 0, 6, 13, 0);
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
  return &unk_1E5F1FB88;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subjectID"), 1, 13, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subjectAlias"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subjectIsa"), 3, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("predicateID"), 4, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("objectID"), 5, 13, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("objectAlias"), 6, 13, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __52__BMHumanUnderstandingPersonalInferenceFact_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_subjectIsaJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
