@implementation BMMapsRecentConversationsIntentContactInformation

- (BMMapsRecentConversationsIntentContactInformation)initWithIdentifier:(id)a3 fullDisplayName:(id)a4 friendlyName:(id)a5 emailAddress:(id)a6 phoneNumber:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMMapsRecentConversationsIntentContactInformation *v17;
  id v19;
  objc_super v20;

  v19 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMMapsRecentConversationsIntentContactInformation;
  v17 = -[BMEventBase init](&v20, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v17->_fullDisplayName, a4);
    objc_storeStrong((id *)&v17->_friendlyName, a5);
    objc_storeStrong((id *)&v17->_emailAddress, a6);
    objc_storeStrong((id *)&v17->_phoneNumber, a7);
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
  -[BMMapsRecentConversationsIntentContactInformation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsRecentConversationsIntentContactInformation fullDisplayName](self, "fullDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsRecentConversationsIntentContactInformation friendlyName](self, "friendlyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsRecentConversationsIntentContactInformation emailAddress](self, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsRecentConversationsIntentContactInformation phoneNumber](self, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMapsRecentConversationsIntentContactInformation with identifier: %@, fullDisplayName: %@, friendlyName: %@, emailAddress: %@, phoneNumber: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMapsRecentConversationsIntentContactInformation *v5;
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
  uint64_t v16;
  unint64_t v17;
  char v18;
  int v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSArray *emailAddress;
  uint64_t v30;
  NSArray *phoneNumber;
  int v32;
  BMMapsRecentConversationsIntentContactInformation *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMMapsRecentConversationsIntentContactInformation;
  v5 = -[BMEventBase init](&v35, sel_init);
  if (!v5)
  {
LABEL_35:
    v33 = v5;
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
    v28 = objc_msgSend(v6, "copy");
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSArray *)v28;

    v30 = objc_msgSend(v7, "copy");
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSArray *)v30;

    v32 = v4[*v10];
    if (v32)
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
      v17 = v16 + 1;
      if (v16 == -1 || v17 > *(_QWORD *)&v4[*v9])
        break;
      v18 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v16);
      *(_QWORD *)&v4[v15] = v17;
      v14 |= (unint64_t)(v18 & 0x7F) << v12;
      if ((v18 & 0x80) == 0)
        goto LABEL_13;
      v12 += 7;
      if (v13++ >= 9)
      {
        v14 = 0;
        v20 = v4[*v10];
        goto LABEL_15;
      }
    }
    v4[*v10] = 1;
LABEL_13:
    v20 = v4[*v10];
    if (v4[*v10])
      v14 = 0;
LABEL_15:
    if (v20 || (v14 & 7) == 4)
      goto LABEL_33;
    switch((v14 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 24;
        goto LABEL_25;
      case 2u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 32;
        goto LABEL_25;
      case 3u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 40;
LABEL_25:
        v24 = *(Class *)((char *)&v5->super.super.isa + v23);
        *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;
        goto LABEL_31;
      case 4u:
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
          goto LABEL_37;
        v24 = (void *)v25;
        v26 = v6;
        goto LABEL_30;
      case 5u:
        PBReaderReadString();
        v27 = objc_claimAutoreleasedReturnValue();
        if (!v27)
          goto LABEL_37;
        v24 = (void *)v27;
        v26 = v7;
LABEL_30:
        objc_msgSend(v26, "addObject:", v24);
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
        v33 = 0;
LABEL_36:

        return v33;
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
  if (self->_fullDisplayName)
    PBDataWriterWriteStringField();
  if (self->_friendlyName)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_emailAddress;
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
        PBDataWriterWriteStringField();
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
  v10 = self->_phoneNumber;
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
        PBDataWriterWriteStringField();
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
  -[BMMapsRecentConversationsIntentContactInformation writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMapsRecentConversationsIntentContactInformation)initWithJSONDictionary:(id)a3 error:(id *)a4
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  id v21;
  void *v22;
  int v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  BMMapsRecentConversationsIntentContactInformation *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id *v55;
  uint64_t v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void **v61;
  uint64_t *v62;
  void *v63;
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v69;
  BMMapsRecentConversationsIntentContactInformation *v70;
  void *v71;
  id *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  _BYTE v90[128];
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  _BYTE v97[128];
  uint64_t v98;
  void *v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  _QWORD v105[3];

  v105[1] = *MEMORY[0x1E0C80C00];
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
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = *MEMORY[0x1E0D025B8];
        v104 = *MEMORY[0x1E0CB2D50];
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
        v105[0] = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, &v104, 1);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v30;
        v9 = (void *)v33;
        v35 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v31, 2, v33);
        v8 = 0;
        v36 = 0;
        *a4 = v35;
        goto LABEL_72;
      }
      v8 = 0;
      v36 = 0;
      goto LABEL_73;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fullDisplayName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v39 = v9;
        v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v41 = *MEMORY[0x1E0D025B8];
        v102 = *MEMORY[0x1E0CB2D50];
        v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("fullDisplayName"));
        v103 = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = v40;
        v9 = v39;
        v77 = (void *)v43;
        v45 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v41, 2);
        v32 = 0;
        v36 = 0;
        *a4 = v45;
        goto LABEL_71;
      }
      v32 = 0;
      v36 = 0;
      goto LABEL_72;
    }
    v76 = v9;
  }
  else
  {
    v76 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("friendlyName"));
  v10 = objc_claimAutoreleasedReturnValue();
  v73 = v9;
  v74 = v7;
  v77 = (void *)v10;
  if (v10 && (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v47 = *MEMORY[0x1E0D025B8];
        v100 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("friendlyName"));
        v101 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 2, v15);
        v75 = 0;
        v36 = 0;
        *a4 = v48;
        v32 = v76;
        goto LABEL_69;
      }
      v42 = 0;
      v36 = 0;
      v32 = v76;
      goto LABEL_71;
    }
    v75 = v11;
  }
  else
  {
    v75 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("emailAddress"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if (v14)
  {
    v71 = v6;
    v72 = a4;
    v70 = self;

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
          v36 = 0;
          v32 = v76;
          goto LABEL_70;
        }
        v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v55 = a4;
        v56 = *MEMORY[0x1E0D025B8];
        v98 = *MEMORY[0x1E0CB2D50];
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("emailAddress"));
        v99 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v57 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v56, 2, v21);
        v36 = 0;
        *v55 = v57;
        goto LABEL_58;
      }
    }
    v71 = v6;
    v72 = a4;
    v70 = self;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v12 = v12;
  v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
  v69 = v8;
  if (!v16)
    goto LABEL_26;
  v17 = v16;
  v18 = *(_QWORD *)v83;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v83 != v18)
        objc_enumerationMutation(v12);
      v20 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v72)
        {
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v25 = *MEMORY[0x1E0D025B8];
          v95 = *MEMORY[0x1E0CB2D50];
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("emailAddress"));
          v96 = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v24;
          v29 = v25;
LABEL_38:
          v8 = v69;
          v32 = v76;
          *v72 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2, v27);

          v36 = 0;
          v21 = v12;
          goto LABEL_66;
        }
LABEL_41:
        v36 = 0;
        v21 = v12;
        self = v70;
        v6 = v71;
        v8 = v69;
LABEL_58:
        v32 = v76;
        goto LABEL_68;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v72)
        {
          v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v38 = *MEMORY[0x1E0D025B8];
          v93 = *MEMORY[0x1E0CB2D50];
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("emailAddress"));
          v94 = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v37;
          v29 = v38;
          goto LABEL_38;
        }
        goto LABEL_41;
      }
      objc_msgSend(v15, "addObject:", v20);
    }
    v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
    v8 = v69;
  }
  while (v17);
LABEL_26:

  v6 = v71;
  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("phoneNumber"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "isEqual:", v22);

  if (v23)
  {

    v21 = 0;
    goto LABEL_46;
  }
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v72)
      {
        v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v66 = *MEMORY[0x1E0D025B8];
        v91 = *MEMORY[0x1E0CB2D50];
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("phoneNumber"));
        v92 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *v72 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v66, 2, v67);

        v36 = 0;
        v32 = v76;
        goto LABEL_67;
      }
      v36 = 0;
      self = v70;
      goto LABEL_58;
    }
  }
LABEL_46:
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v21 = v21;
  v49 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
  if (!v49)
    goto LABEL_55;
  v50 = v49;
  v51 = *(_QWORD *)v79;
  while (2)
  {
    v52 = 0;
    while (2)
    {
      if (*(_QWORD *)v79 != v51)
        objc_enumerationMutation(v21);
      v53 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * v52);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v69;
        v32 = v76;
        if (v72)
        {
          v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v68 = *MEMORY[0x1E0D025B8];
          v88 = *MEMORY[0x1E0CB2D50];
          v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("phoneNumber"));
          v89 = v59;
          v60 = (void *)MEMORY[0x1E0C99D80];
          v61 = &v89;
          v62 = &v88;
LABEL_64:
          objc_msgSend(v60, "dictionaryWithObjects:forKeys:count:", v61, v62, 1);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *v72 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v68, 2, v63);

        }
LABEL_65:

        v36 = 0;
        goto LABEL_66;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = v69;
        v32 = v76;
        if (v72)
        {
          v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v68 = *MEMORY[0x1E0D025B8];
          v86 = *MEMORY[0x1E0CB2D50];
          v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("phoneNumber"));
          v87 = v59;
          v60 = (void *)MEMORY[0x1E0C99D80];
          v61 = &v87;
          v62 = &v86;
          goto LABEL_64;
        }
        goto LABEL_65;
      }
      objc_msgSend(v26, "addObject:", v53);
      if (v50 != ++v52)
        continue;
      break;
    }
    v50 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
    if (v50)
      continue;
    break;
  }
LABEL_55:

  v8 = v69;
  v32 = v76;
  v36 = -[BMMapsRecentConversationsIntentContactInformation initWithIdentifier:fullDisplayName:friendlyName:emailAddress:phoneNumber:](v70, "initWithIdentifier:fullDisplayName:friendlyName:emailAddress:phoneNumber:", v69, v76, v75, v15, v26);
  v70 = v36;
LABEL_66:
  v6 = v71;
LABEL_67:

  self = v70;
LABEL_68:

LABEL_69:
  v9 = v73;
LABEL_70:

  v7 = v74;
  v42 = v75;
LABEL_71:

LABEL_72:
LABEL_73:

  return v36;
}

- (id)_emailAddressJSONArray
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
  -[BMMapsRecentConversationsIntentContactInformation emailAddress](self, "emailAddress", 0);
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

- (id)_phoneNumberJSONArray
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
  -[BMMapsRecentConversationsIntentContactInformation phoneNumber](self, "phoneNumber", 0);
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
  -[BMMapsRecentConversationsIntentContactInformation identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsRecentConversationsIntentContactInformation fullDisplayName](self, "fullDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsRecentConversationsIntentContactInformation friendlyName](self, "friendlyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsRecentConversationsIntentContactInformation _emailAddressJSONArray](self, "_emailAddressJSONArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsRecentConversationsIntentContactInformation _phoneNumberJSONArray](self, "_phoneNumberJSONArray");
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
  v18 = CFSTR("fullDisplayName");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v9;
  v19 = CFSTR("friendlyName");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v10;
  v20 = CFSTR("emailAddress");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v11;
  v21 = CFSTR("phoneNumber");
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
    -[BMMapsRecentConversationsIntentContactInformation identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMapsRecentConversationsIntentContactInformation identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    -[BMMapsRecentConversationsIntentContactInformation fullDisplayName](self, "fullDisplayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fullDisplayName");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMapsRecentConversationsIntentContactInformation fullDisplayName](self, "fullDisplayName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fullDisplayName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_17;
    }
    -[BMMapsRecentConversationsIntentContactInformation friendlyName](self, "friendlyName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "friendlyName");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMMapsRecentConversationsIntentContactInformation friendlyName](self, "friendlyName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "friendlyName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_17;
    }
    -[BMMapsRecentConversationsIntentContactInformation emailAddress](self, "emailAddress");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "emailAddress");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMMapsRecentConversationsIntentContactInformation emailAddress](self, "emailAddress");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "emailAddress");
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
    -[BMMapsRecentConversationsIntentContactInformation phoneNumber](self, "phoneNumber");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "phoneNumber");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 == v32)
    {
      v12 = 1;
    }
    else
    {
      -[BMMapsRecentConversationsIntentContactInformation phoneNumber](self, "phoneNumber");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "phoneNumber");
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

- (NSString)fullDisplayName
{
  return self->_fullDisplayName;
}

- (NSString)friendlyName
{
  return self->_friendlyName;
}

- (NSArray)emailAddress
{
  return self->_emailAddress;
}

- (NSArray)phoneNumber
{
  return self->_phoneNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
  objc_storeStrong((id *)&self->_fullDisplayName, 0);
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

    v4 = -[BMMapsRecentConversationsIntentContactInformation initByReadFrom:]([BMMapsRecentConversationsIntentContactInformation alloc], "initByReadFrom:", v7);
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
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("fullDisplayName"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("friendlyName"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("emailAddress_json"), 5, 1, &__block_literal_global_73_73047);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("phoneNumber_json"), 5, 1, &__block_literal_global_74_73048);
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
  return &unk_1E5F1FAE0;
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
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fullDisplayName"), 2, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("friendlyName"), 3, 13, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("emailAddress"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("phoneNumber"), 5, 13, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __60__BMMapsRecentConversationsIntentContactInformation_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_phoneNumberJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __60__BMMapsRecentConversationsIntentContactInformation_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_emailAddressJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
