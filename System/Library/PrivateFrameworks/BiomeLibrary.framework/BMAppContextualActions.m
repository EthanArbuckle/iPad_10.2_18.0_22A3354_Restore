@implementation BMAppContextualActions

- (BMAppContextualActions)initWithIdentifier:(id)a3 appName:(id)a4 actionName:(id)a5 content:(id)a6 parameter:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMAppContextualActions *v17;
  id v19;
  objc_super v20;

  v19 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMAppContextualActions;
  v17 = -[BMEventBase init](&v20, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v17->_appName, a4);
    objc_storeStrong((id *)&v17->_actionName, a5);
    objc_storeStrong((id *)&v17->_content, a6);
    objc_storeStrong((id *)&v17->_parameter, a7);
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
  -[BMAppContextualActions identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppContextualActions appName](self, "appName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppContextualActions actionName](self, "actionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppContextualActions content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppContextualActions parameter](self, "parameter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAppContextualActions with identifier: %@, appName: %@, actionName: %@, content: %@, parameter: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppContextualActions *v5;
  void *v6;
  void *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  char v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  int v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSArray *content;
  uint64_t v29;
  NSArray *parameter;
  int v31;
  BMAppContextualActions *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BMAppContextualActions;
  v5 = -[BMEventBase init](&v34, sel_init);
  if (!v5)
  {
LABEL_35:
    v32 = v5;
    goto LABEL_36;
  }
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_33:
    v27 = objc_msgSend(v6, "copy");
    content = v5->_content;
    v5->_content = (NSArray *)v27;

    v29 = objc_msgSend(v7, "copy");
    parameter = v5->_parameter;
    v5->_parameter = (NSArray *)v29;

    v31 = v4[*v10];
    if (v31)
      goto LABEL_34;
    goto LABEL_35;
  }
  v11 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v10])
      goto LABEL_33;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    while (1)
    {
      v15 = *v8;
      v16 = *(_QWORD *)&v4[v15];
      if (v16 == -1 || v16 >= *(_QWORD *)&v4[*v9])
        break;
      v17 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v16);
      *(_QWORD *)&v4[v15] = v16 + 1;
      v14 |= (unint64_t)(v17 & 0x7F) << v12;
      if ((v17 & 0x80) == 0)
        goto LABEL_13;
      v12 += 7;
      if (v13++ >= 9)
      {
        v14 = 0;
        v19 = v4[*v10];
        goto LABEL_15;
      }
    }
    v4[*v10] = 1;
LABEL_13:
    v19 = v4[*v10];
    if (v4[*v10])
      v14 = 0;
LABEL_15:
    if (v19 || (v14 & 7) == 4)
      goto LABEL_33;
    switch((v14 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 24;
        goto LABEL_25;
      case 2u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 32;
        goto LABEL_25;
      case 3u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 40;
LABEL_25:
        v23 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;
        goto LABEL_31;
      case 4u:
        PBReaderReadData();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!v24)
          goto LABEL_37;
        v23 = (void *)v24;
        v25 = v6;
        goto LABEL_30;
      case 5u:
        PBReaderReadData();
        v26 = objc_claimAutoreleasedReturnValue();
        if (!v26)
          goto LABEL_37;
        v23 = (void *)v26;
        v25 = v7;
LABEL_30:
        objc_msgSend(v25, "addObject:", v23);
LABEL_31:

        goto LABEL_32;
      default:
        if ((PBReaderSkipValueWithTag() & 1) != 0)
        {
LABEL_32:
          if (*(_QWORD *)&v4[*v8] >= *(_QWORD *)&v4[*v9])
            goto LABEL_33;
          continue;
        }
LABEL_37:

LABEL_34:
        v32 = 0;
LABEL_36:

        return v32;
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
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_appName)
    PBDataWriterWriteStringField();
  if (self->_actionName)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_content;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_parameter;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteDataField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAppContextualActions writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppContextualActions)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  id v22;
  void *v23;
  int v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  BMAppContextualActions *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id *v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  void **v62;
  uint64_t *v63;
  void *v64;
  id v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id v70;
  void *v71;
  id v72;
  BMAppContextualActions *v73;
  id v74;
  void *v75;
  id *v76;
  void *v77;
  id v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  _BYTE v92[128];
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  _BYTE v99[128];
  uint64_t v100;
  void *v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD v107[3];

  v107[1] = *MEMORY[0x1E0C80C00];
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
        v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v32 = *MEMORY[0x1E0D025B8];
        v106 = *MEMORY[0x1E0CB2D50];
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
        v107[0] = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, &v106, 1);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v31;
        v9 = (void *)v34;
        v36 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v32, 2, v34);
        v8 = 0;
        v37 = 0;
        *a4 = v36;
        goto LABEL_72;
      }
      v8 = 0;
      v37 = 0;
      goto LABEL_73;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v41 = v9;
        v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v43 = *MEMORY[0x1E0D025B8];
        v104 = *MEMORY[0x1E0CB2D50];
        v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("appName"));
        v105 = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = v42;
        v9 = v41;
        v40 = (void *)v44;
        v79 = (void *)v45;
        v47 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v43, 2);
        v33 = 0;
        v37 = 0;
        *a4 = v47;
        goto LABEL_71;
      }
      v33 = 0;
      v37 = 0;
      goto LABEL_72;
    }
    v78 = v9;
  }
  else
  {
    v78 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actionName"));
  v10 = objc_claimAutoreleasedReturnValue();
  v77 = v7;
  v75 = v9;
  v79 = (void *)v10;
  if (v10 && (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v49 = *MEMORY[0x1E0D025B8];
        v102 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("actionName"));
        v103 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v49, 2, v16);
        v40 = 0;
        v37 = 0;
        *a4 = v50;
        v33 = v78;
        goto LABEL_69;
      }
      v40 = 0;
      v37 = 0;
      v33 = v78;
      goto LABEL_71;
    }
    v74 = v11;
  }
  else
  {
    v74 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("content"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if (v14)
  {
    v76 = a4;
    v73 = self;
    v15 = v6;

    v12 = 0;
  }
  else
  {
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v37 = 0;
          v33 = v78;
          v40 = v74;
          goto LABEL_70;
        }
        v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v57 = a4;
        v58 = *MEMORY[0x1E0D025B8];
        v100 = *MEMORY[0x1E0CB2D50];
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("content"));
        v101 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v59 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v58, 2, v22);
        v37 = 0;
        *v57 = v59;
        goto LABEL_59;
      }
    }
    v76 = a4;
    v73 = self;
    v15 = v6;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v12 = v12;
  v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
  v72 = v8;
  if (!v17)
    goto LABEL_26;
  v18 = v17;
  v19 = *(_QWORD *)v85;
  do
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v85 != v19)
        objc_enumerationMutation(v12);
      v21 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v76)
        {
          v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v26 = *MEMORY[0x1E0D025B8];
          v97 = *MEMORY[0x1E0CB2D50];
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("content"));
          v98 = v27;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v25;
          v30 = v26;
LABEL_38:
          v6 = v15;
          v8 = v72;
          v33 = v78;
          v40 = v74;
          *v76 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v28);

          v37 = 0;
          v22 = v12;
          goto LABEL_67;
        }
LABEL_41:
        v37 = 0;
        v22 = v12;
        v6 = v15;
        v8 = v72;
        self = v73;
LABEL_59:
        v33 = v78;
        v40 = v74;
        goto LABEL_68;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v76)
        {
          v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v39 = *MEMORY[0x1E0D025B8];
          v95 = *MEMORY[0x1E0CB2D50];
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("content"));
          v96 = v27;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v38;
          v30 = v39;
          goto LABEL_38;
        }
        goto LABEL_41;
      }
      objc_msgSend(v16, "addObject:", v21);
    }
    v18 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
    v8 = v72;
  }
  while (v18);
LABEL_26:

  v6 = v15;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parameter"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "isEqual:", v23);

  if (v24)
  {
    v71 = v15;

    v22 = 0;
    goto LABEL_47;
  }
  if (v22)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v76)
      {
        v66 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v67 = *MEMORY[0x1E0D025B8];
        v93 = *MEMORY[0x1E0CB2D50];
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("parameter"));
        v94 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *v76 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", v67, 2, v68);

        v37 = 0;
        v33 = v78;
        v40 = v74;
        goto LABEL_67;
      }
      v37 = 0;
      self = v73;
      goto LABEL_59;
    }
  }
  v71 = v15;
LABEL_47:
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v22, "count"));
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v22 = v22;
  v51 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
  if (!v51)
    goto LABEL_56;
  v52 = v51;
  v53 = *(_QWORD *)v81;
  while (2)
  {
    v54 = 0;
    while (2)
    {
      if (*(_QWORD *)v81 != v53)
        objc_enumerationMutation(v22);
      v55 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v54);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v71;
        v8 = v72;
        v33 = v78;
        v40 = v74;
        if (v76)
        {
          v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v69 = *MEMORY[0x1E0D025B8];
          v90 = *MEMORY[0x1E0CB2D50];
          v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("parameter"));
          v91 = v60;
          v61 = (void *)MEMORY[0x1E0C99D80];
          v62 = &v91;
          v63 = &v90;
LABEL_65:
          objc_msgSend(v61, "dictionaryWithObjects:forKeys:count:", v62, v63, 1);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *v76 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v69, 2, v64);

        }
LABEL_66:

        v37 = 0;
        goto LABEL_67;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = v71;
        v8 = v72;
        v33 = v78;
        v40 = v74;
        if (v76)
        {
          v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v69 = *MEMORY[0x1E0D025B8];
          v88 = *MEMORY[0x1E0CB2D50];
          v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("parameter"));
          v89 = v60;
          v61 = (void *)MEMORY[0x1E0C99D80];
          v62 = &v89;
          v63 = &v88;
          goto LABEL_65;
        }
        goto LABEL_66;
      }
      objc_msgSend(v27, "addObject:", v55);
      if (v52 != ++v54)
        continue;
      break;
    }
    v52 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
    if (v52)
      continue;
    break;
  }
LABEL_56:

  v8 = v72;
  v33 = v78;
  v40 = v74;
  v37 = -[BMAppContextualActions initWithIdentifier:appName:actionName:content:parameter:](v73, "initWithIdentifier:appName:actionName:content:parameter:", v72, v78, v74, v16, v27);
  v73 = v37;
  v6 = v71;
LABEL_67:

  self = v73;
LABEL_68:

LABEL_69:
  v9 = v75;
LABEL_70:

  v7 = v77;
LABEL_71:

LABEL_72:
LABEL_73:

  return v37;
}

- (id)_contentJSONArray
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
  -[BMAppContextualActions content](self, "content", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "base64EncodedStringWithOptions:", 0);
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

- (id)_parameterJSONArray
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
  -[BMAppContextualActions parameter](self, "parameter", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "base64EncodedStringWithOptions:", 0);
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
  -[BMAppContextualActions identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppContextualActions appName](self, "appName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppContextualActions actionName](self, "actionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppContextualActions _contentJSONArray](self, "_contentJSONArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppContextualActions _parameterJSONArray](self, "_parameterJSONArray");
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
  v18 = CFSTR("appName");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v9;
  v19 = CFSTR("actionName");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v10;
  v20 = CFSTR("content");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v11;
  v21 = CFSTR("parameter");
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
    -[BMAppContextualActions identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAppContextualActions identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    -[BMAppContextualActions appName](self, "appName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appName");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMAppContextualActions appName](self, "appName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_17;
    }
    -[BMAppContextualActions actionName](self, "actionName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionName");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMAppContextualActions actionName](self, "actionName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "actionName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_17;
    }
    -[BMAppContextualActions content](self, "content");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMAppContextualActions content](self, "content");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "content");
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
    -[BMAppContextualActions parameter](self, "parameter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parameter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 == v32)
    {
      v12 = 1;
    }
    else
    {
      -[BMAppContextualActions parameter](self, "parameter");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "parameter");
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

- (NSString)appName
{
  return self->_appName;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (NSArray)content
{
  return self->_content;
}

- (NSArray)parameter
{
  return self->_parameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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

    v7 = -[BMAppContextualActions initByReadFrom:]([BMAppContextualActions alloc], "initByReadFrom:", v6);
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
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appName"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("actionName"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("content_json"), 5, 1, &__block_literal_global_50387);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("parameter_json"), 5, 1, &__block_literal_global_35);
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
  return &unk_1E5F1DC80;
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
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appName"), 2, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("actionName"), 3, 13, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("content"), 4, 14, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("parameter"), 5, 14, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __33__BMAppContextualActions_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_parameterJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __33__BMAppContextualActions_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_contentJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
