@implementation BMMapsShareETAFeedback

- (BMMapsShareETAFeedback)initWithIdentifier:(id)a3 bundleId:(id)a4 handle:(id)a5 startLocationId:(id)a6 endLocationId:(id)a7 contactId:(id)a8 groupId:(id)a9
{
  id v16;
  id v17;
  BMMapsShareETAFeedback *v18;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a5;
  v21 = a6;
  v20 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)BMMapsShareETAFeedback;
  v18 = -[BMEventBase init](&v25, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v18->_bundleId, a4);
    objc_storeStrong((id *)&v18->_handle, a5);
    objc_storeStrong((id *)&v18->_startLocationId, a6);
    objc_storeStrong((id *)&v18->_endLocationId, a7);
    objc_storeStrong((id *)&v18->_contactId, a8);
    objc_storeStrong((id *)&v18->_groupId, a9);
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
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMapsShareETAFeedback identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsShareETAFeedback bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsShareETAFeedback handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsShareETAFeedback startLocationId](self, "startLocationId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsShareETAFeedback endLocationId](self, "endLocationId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsShareETAFeedback contactId](self, "contactId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsShareETAFeedback groupId](self, "groupId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMapsShareETAFeedback with identifier: %@, bundleId: %@, handle: %@, startLocationId: %@, endLocationId: %@, contactId: %@, groupId: %@"), v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMapsShareETAFeedback *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  int v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BMMapsShareETAFeedback *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BMMapsShareETAFeedback;
  v5 = -[BMEventBase init](&v24, sel_init);
  if (!v5)
    goto LABEL_33;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v6;
        v14 = *(_QWORD *)&v4[v13];
        if (v14 == -1 || v14 >= *(_QWORD *)&v4[*v7])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        if (v11++ >= 9)
        {
          v12 = 0;
          v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v17 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v17 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 24;
          goto LABEL_29;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 32;
          goto LABEL_29;
        case 3u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_29;
        case 4u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 48;
          goto LABEL_29;
        case 5u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 56;
          goto LABEL_29;
        case 6u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 64;
          goto LABEL_29;
        case 7u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 72;
LABEL_29:
          v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_32;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_32:
    v22 = 0;
  else
LABEL_33:
    v22 = v5;

  return v22;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_handle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_startLocationId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_endLocationId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_contactId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_groupId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMapsShareETAFeedback writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMapsShareETAFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BMMapsShareETAFeedback *v15;
  id v16;
  void *v17;
  id v18;
  BMMapsShareETAFeedback *v19;
  void *v20;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v19 = 0;
          goto LABEL_29;
        }
        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = *MEMORY[0x1E0D025B8];
        v67 = *MEMORY[0x1E0CB2D50];
        v56 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleId"));
        v68 = v56;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
        v29 = a4;
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 2, v11);
        v19 = 0;
        v10 = 0;
        *v29 = v30;
        goto LABEL_28;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v9;
    v55 = v10;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v54)
        {
          v56 = 0;
          v19 = 0;
          goto LABEL_28;
        }
        v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v32 = *MEMORY[0x1E0D025B8];
        v65 = *MEMORY[0x1E0CB2D50];
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("handle"));
        v66 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v31;
        v10 = v55;
        v34 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v32, 2, v12);
        v19 = 0;
        v56 = 0;
        *v54 = v34;
LABEL_27:

        v9 = v52;
LABEL_28:

        goto LABEL_29;
      }
      v56 = v11;
    }
    else
    {
      v56 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startLocationId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v7;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v54)
        {
          v20 = 0;
          v19 = 0;
          goto LABEL_27;
        }
        v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v36 = *MEMORY[0x1E0D025B8];
        v63 = *MEMORY[0x1E0CB2D50];
        v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("startLocationId"));
        v64 = v53;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v35;
        v10 = v55;
        v38 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v36, 2, v13);
        v19 = 0;
        v20 = 0;
        *v54 = v38;
        goto LABEL_26;
      }
      v51 = v12;
    }
    else
    {
      v51 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endLocationId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v8;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v54)
        {
          v53 = 0;
          v19 = 0;
          goto LABEL_25;
        }
        v15 = self;
        v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v40 = *MEMORY[0x1E0D025B8];
        v61 = *MEMORY[0x1E0CB2D50];
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("endLocationId"));
        v62 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2, v14);
        v19 = 0;
        v53 = 0;
        *v54 = v41;
LABEL_24:

        self = v15;
        v8 = v50;
        v10 = v55;
LABEL_25:
        v20 = v51;
LABEL_26:

        v7 = v49;
        goto LABEL_27;
      }
      v53 = v13;
    }
    else
    {
      v53 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contactId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      v15 = self;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v54)
        {
          v16 = 0;
          v19 = 0;
          goto LABEL_24;
        }
        v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v43 = *MEMORY[0x1E0D025B8];
        v59 = *MEMORY[0x1E0CB2D50];
        v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contactId"));
        v60 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v43, 2, v17);
        v19 = 0;
        v16 = 0;
        *v54 = v44;
        goto LABEL_23;
      }
      v16 = v14;
    }
    else
    {
      v15 = self;
      v16 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("groupId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v54)
        {
          v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v47 = *MEMORY[0x1E0D025B8];
          v57 = *MEMORY[0x1E0CB2D50];
          v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("groupId"));
          v58 = v45;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *v54 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v47, 2, v46);

        }
        v18 = 0;
        v19 = 0;
        goto LABEL_23;
      }
      v18 = v17;
    }
    else
    {
      v18 = 0;
    }
    v19 = -[BMMapsShareETAFeedback initWithIdentifier:bundleId:handle:startLocationId:endLocationId:contactId:groupId:](v15, "initWithIdentifier:bundleId:handle:startLocationId:endLocationId:contactId:groupId:", v50, v55, v56, v51, v53, v16, v18);
    v15 = v19;
LABEL_23:

    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v19 = 0;
    v8 = 0;
    goto LABEL_30;
  }
  v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v23 = *MEMORY[0x1E0D025B8];
  v69 = *MEMORY[0x1E0CB2D50];
  v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
  v70[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v22;
  v10 = (id)v24;
  v26 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v23, 2, v9);
  v19 = 0;
  v8 = 0;
  *a4 = v26;
LABEL_29:

LABEL_30:
  return v19;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[7];
  _QWORD v25[9];

  v25[7] = *MEMORY[0x1E0C80C00];
  -[BMMapsShareETAFeedback identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMMapsShareETAFeedback bundleId](self, "bundleId");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMMapsShareETAFeedback handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsShareETAFeedback startLocationId](self, "startLocationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsShareETAFeedback endLocationId](self, "endLocationId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsShareETAFeedback contactId](self, "contactId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsShareETAFeedback groupId](self, "groupId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = CFSTR("identifier");
  v10 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v10;
  v25[0] = v10;
  v24[1] = CFSTR("bundleId");
  v11 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v3;
  v20 = (void *)v11;
  v25[1] = v11;
  v24[2] = CFSTR("handle");
  v12 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v4;
  v19 = (void *)v12;
  v25[2] = v12;
  v24[3] = CFSTR("startLocationId");
  v13 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v13;
  v24[4] = CFSTR("endLocationId");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v14;
  v24[5] = CFSTR("contactId");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[5] = v15;
  v24[6] = CFSTR("groupId");
  v16 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      goto LABEL_17;
  }
  else
  {

    if (v8)
    {
LABEL_17:
      if (v7)
        goto LABEL_18;
LABEL_26:

      if (v6)
        goto LABEL_19;
      goto LABEL_27;
    }
  }

  if (!v7)
    goto LABEL_26;
LABEL_18:
  if (v6)
    goto LABEL_19;
LABEL_27:

LABEL_19:
  if (!v5)

  if (!v22)
  {

    if (v23)
      goto LABEL_23;
LABEL_29:

    goto LABEL_23;
  }
  if (!v23)
    goto LABEL_29;
LABEL_23:

  return v17;
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
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMapsShareETAFeedback identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMapsShareETAFeedback identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_25;
    }
    -[BMMapsShareETAFeedback bundleId](self, "bundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleId");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMapsShareETAFeedback bundleId](self, "bundleId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_25;
    }
    -[BMMapsShareETAFeedback handle](self, "handle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handle");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMMapsShareETAFeedback handle](self, "handle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_25;
    }
    -[BMMapsShareETAFeedback startLocationId](self, "startLocationId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startLocationId");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMMapsShareETAFeedback startLocationId](self, "startLocationId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startLocationId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_25;
    }
    -[BMMapsShareETAFeedback endLocationId](self, "endLocationId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endLocationId");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMMapsShareETAFeedback endLocationId](self, "endLocationId");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endLocationId");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_25;
    }
    -[BMMapsShareETAFeedback contactId](self, "contactId");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactId");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMMapsShareETAFeedback contactId](self, "contactId");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contactId");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
      {
LABEL_25:
        v12 = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    -[BMMapsShareETAFeedback groupId](self, "groupId");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44 == v45)
    {
      v12 = 1;
    }
    else
    {
      -[BMMapsShareETAFeedback groupId](self, "groupId");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "groupId");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v46, "isEqual:", v47);

    }
    goto LABEL_26;
  }
  v12 = 0;
LABEL_27:

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

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)startLocationId
{
  return self->_startLocationId;
}

- (NSString)endLocationId
{
  return self->_endLocationId;
}

- (NSString)contactId
{
  return self->_contactId;
}

- (NSString)groupId
{
  return self->_groupId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_contactId, 0);
  objc_storeStrong((id *)&self->_endLocationId, 0);
  objc_storeStrong((id *)&self->_startLocationId, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
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

    v4 = -[BMMapsShareETAFeedback initByReadFrom:]([BMMapsShareETAFeedback alloc], "initByReadFrom:", v7);
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
  void *v8;
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleId"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("handle"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startLocationId"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("endLocationId"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contactId"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("groupId"), 2, 0, 7, 13, 0);
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1E5F20008;
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
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleId"), 2, 13, 0, v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("handle"), 3, 13, 0);
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startLocationId"), 4, 13, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("endLocationId"), 5, 13, 0);
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contactId"), 6, 13, 0);
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("groupId"), 7, 13, 0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
