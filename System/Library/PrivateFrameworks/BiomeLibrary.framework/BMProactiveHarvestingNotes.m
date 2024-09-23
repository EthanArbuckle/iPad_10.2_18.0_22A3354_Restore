@implementation BMProactiveHarvestingNotes

- (BMProactiveHarvestingNotes)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 title:(id)a6 content:(id)a7 contentProtection:(id)a8 personaId:(id)a9
{
  id v16;
  id v17;
  id v18;
  BMProactiveHarvestingNotes *v19;
  double v20;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v16 = a5;
  v23 = a6;
  v22 = a7;
  v17 = a8;
  v18 = a9;
  v26.receiver = self;
  v26.super_class = (Class)BMProactiveHarvestingNotes;
  v19 = -[BMEventBase init](&v26, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v22, v23, v24, v25);
    objc_storeStrong((id *)&v19->_uniqueID, a3);
    objc_storeStrong((id *)&v19->_domainID, a4);
    if (v16)
    {
      v19->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v19->_hasRaw_absoluteTimestamp = 0;
      v20 = -1.0;
    }
    v19->_raw_absoluteTimestamp = v20;
    objc_storeStrong((id *)&v19->_title, a6);
    objc_storeStrong((id *)&v19->_content, a7);
    objc_storeStrong((id *)&v19->_contentProtection, a8);
    objc_storeStrong((id *)&v19->_personaId, a9);
  }

  return v19;
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
  -[BMProactiveHarvestingNotes uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotes domainID](self, "domainID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotes absoluteTimestamp](self, "absoluteTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotes title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotes content](self, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotes contentProtection](self, "contentProtection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotes personaId](self, "personaId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMProactiveHarvestingNotes with uniqueID: %@, domainID: %@, absoluteTimestamp: %@, title: %@, content: %@, contentProtection: %@, personaId: %@"), v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProactiveHarvestingNotes *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  double v24;
  void *v25;
  BMProactiveHarvestingNotes *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMProactiveHarvestingNotes;
  v5 = -[BMEventBase init](&v28, sel_init);
  if (!v5)
    goto LABEL_38;
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
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v7])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        if (v11++ >= 9)
        {
          v12 = 0;
          v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v18 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v18 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 40;
          goto LABEL_31;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
          goto LABEL_31;
        case 3u:
          v5->_hasRaw_absoluteTimestamp = 1;
          v22 = *v6;
          v23 = *(_QWORD *)&v4[v22];
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v24 = *(double *)(*(_QWORD *)&v4[*v9] + v23);
            *(_QWORD *)&v4[v22] = v23 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v24 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v24;
          break;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
          goto LABEL_31;
        case 5u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
          goto LABEL_31;
        case 6u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 72;
          goto LABEL_31;
        case 7u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 80;
LABEL_31:
          v25 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_37;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_37:
    v26 = 0;
  else
LABEL_38:
    v26 = v5;

  return v26;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uniqueID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_domainID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_content)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_contentProtection)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_personaId)
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
  -[BMProactiveHarvestingNotes writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProactiveHarvestingNotes)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  BMProactiveHarvestingNotes *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  id *v45;
  id *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v52;
  id *v53;
  id *v54;
  id *v55;
  id *v56;
  id v57;
  id v58;
  id *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  _QWORD v82[3];

  v82[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("domainID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v68 = 0;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v9;
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = (objc_class *)MEMORY[0x1E0C99D68];
          v13 = v10;
          v14 = v10;
          v15 = [v12 alloc];
          objc_msgSend(v14, "doubleValue");
          v17 = v16;

          v10 = v13;
          v18 = (id)objc_msgSend(v15, "initWithTimeIntervalSinceReferenceDate:", v17);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v28 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
            objc_msgSend(v28, "dateFromString:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_23;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v11 = 0;
              v21 = v68;
              goto LABEL_68;
            }
            v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v59 = a4;
            v49 = *MEMORY[0x1E0D025B8];
            v77 = *MEMORY[0x1E0CB2D50];
            v67 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
            v78 = v67;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v49, 2, v29);
            v11 = 0;
            a4 = 0;
            *v59 = v50;
            v21 = v68;
            goto LABEL_67;
          }
          v18 = v10;
        }
        v11 = v18;
      }
      else
      {
        v11 = 0;
      }
LABEL_23:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v8;
      v61 = v10;
      v62 = v11;
      if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v67 = 0;
            v21 = v68;
LABEL_67:

            v9 = v63;
            goto LABEL_68;
          }
          v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v55 = a4;
          v37 = *MEMORY[0x1E0D025B8];
          v75 = *MEMORY[0x1E0CB2D50];
          v64 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("title"));
          v76 = v64;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v36;
          v10 = v61;
          v39 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v37, 2, v30);
          a4 = 0;
          v67 = 0;
          *v55 = v39;
          goto LABEL_58;
        }
        v67 = v29;
      }
      else
      {
        v67 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("content"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v7;
      if (!v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v64 = 0;
        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v64 = v30;
LABEL_29:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentProtection"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v31 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v32 = self;
          v33 = 0;
          goto LABEL_32;
        }
        objc_opt_class();
        v32 = self;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v33 = v31;
LABEL_32:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("personaId"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v35 = 0;
LABEL_35:
            a4 = -[BMProactiveHarvestingNotes initWithUniqueID:domainID:absoluteTimestamp:title:content:contentProtection:personaId:](v32, "initWithUniqueID:domainID:absoluteTimestamp:title:content:contentProtection:personaId:", v66, v68, v11, v67, v64, v33, v35);
            v32 = (BMProactiveHarvestingNotes *)a4;
LABEL_64:

            goto LABEL_65;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v35 = v34;
            goto LABEL_35;
          }
          if (a4)
          {
            v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v52 = *MEMORY[0x1E0D025B8];
            v69 = *MEMORY[0x1E0CB2D50];
            v46 = a4;
            v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("personaId"));
            v70 = v47;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *v46 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v52, 2, v48);

            v35 = 0;
            a4 = 0;
          }
          else
          {
            v35 = 0;
          }
LABEL_63:
          v11 = v62;
          goto LABEL_64;
        }
        if (a4)
        {
          v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v43 = *MEMORY[0x1E0D025B8];
          v71 = *MEMORY[0x1E0CB2D50];
          v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contentProtection"));
          v72 = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v43, 2, v34);
          v45 = a4;
          a4 = 0;
          v33 = 0;
          *v45 = v44;
          goto LABEL_63;
        }
        v33 = 0;
LABEL_65:

        self = v32;
        v7 = v60;
        v10 = v61;
        v21 = v68;
        goto LABEL_66;
      }
      if (a4)
      {
        v32 = self;
        v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v56 = a4;
        v41 = *MEMORY[0x1E0D025B8];
        v73 = *MEMORY[0x1E0CB2D50];
        v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("content"));
        v74 = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2, v31);
        a4 = 0;
        v64 = 0;
        *v56 = v42;
        goto LABEL_65;
      }
      v64 = 0;
LABEL_58:
      v21 = v68;
LABEL_66:

      v8 = v66;
      goto LABEL_67;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v68 = v9;
      goto LABEL_7;
    }
    if (a4)
    {
      v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v54 = a4;
      v24 = *MEMORY[0x1E0D025B8];
      v79 = *MEMORY[0x1E0CB2D50];
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("domainID"));
      v80 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v23;
      v10 = (void *)v25;
      v27 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v24, 2, v25);
      v21 = 0;
      a4 = 0;
      *v54 = v27;
LABEL_68:

      goto LABEL_69;
    }
    v21 = 0;
LABEL_69:

    goto LABEL_70;
  }
  if (a4)
  {
    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v53 = a4;
    v20 = *MEMORY[0x1E0D025B8];
    v81 = *MEMORY[0x1E0CB2D50];
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("uniqueID"));
    v82[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, &v81, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v9);
    v8 = 0;
    a4 = 0;
    *v53 = v22;
    goto LABEL_69;
  }
  v8 = 0;
LABEL_70:

  return (BMProactiveHarvestingNotes *)a4;
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
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[7];
  _QWORD v28[9];

  v28[7] = *MEMORY[0x1E0C80C00];
  -[BMProactiveHarvestingNotes uniqueID](self, "uniqueID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotes domainID](self, "domainID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotes absoluteTimestamp](self, "absoluteTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingNotes absoluteTimestamp](self, "absoluteTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }

  -[BMProactiveHarvestingNotes title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotes content](self, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotes contentProtection](self, "contentProtection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotes personaId](self, "personaId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("uniqueID");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v12;
  v28[0] = v12;
  v27[1] = CFSTR("domainID");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v13;
  v28[1] = v13;
  v27[2] = CFSTR("absoluteTimestamp");
  v14 = (uint64_t)v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v28[2] = v14;
  v27[3] = CFSTR("title");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v14;
  v25 = (void *)v3;
  v28[3] = v15;
  v27[4] = CFSTR("content");
  v16 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v4;
  v28[4] = v16;
  v27[5] = CFSTR("contentProtection");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[5] = v18;
  v27[6] = CFSTR("personaId");
  v19 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[6] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_20;
LABEL_28:

    if (v9)
      goto LABEL_21;
    goto LABEL_29;
  }

  if (!v10)
    goto LABEL_28;
LABEL_20:
  if (v9)
    goto LABEL_21;
LABEL_29:

LABEL_21:
  if (!v8)

  if (v26)
  {
    if (v17)
      goto LABEL_25;
LABEL_31:

    if (v25)
      goto LABEL_26;
LABEL_32:

    goto LABEL_26;
  }

  if (!v17)
    goto LABEL_31;
LABEL_25:
  if (!v25)
    goto LABEL_32;
LABEL_26:

  return v20;
}

- (NSDate)absoluteTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_absoluteTimestamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
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
    -[BMProactiveHarvestingNotes uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProactiveHarvestingNotes uniqueID](self, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_25;
    }
    -[BMProactiveHarvestingNotes domainID](self, "domainID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domainID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMProactiveHarvestingNotes domainID](self, "domainID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domainID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_25;
    }
    -[BMProactiveHarvestingNotes absoluteTimestamp](self, "absoluteTimestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMProactiveHarvestingNotes absoluteTimestamp](self, "absoluteTimestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_25;
    }
    -[BMProactiveHarvestingNotes title](self, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMProactiveHarvestingNotes title](self, "title");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_25;
    }
    -[BMProactiveHarvestingNotes content](self, "content");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMProactiveHarvestingNotes content](self, "content");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "content");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_25;
    }
    -[BMProactiveHarvestingNotes contentProtection](self, "contentProtection");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentProtection");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMProactiveHarvestingNotes contentProtection](self, "contentProtection");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentProtection");
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
    -[BMProactiveHarvestingNotes personaId](self, "personaId");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personaId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44 == v45)
    {
      v12 = 1;
    }
    else
    {
      -[BMProactiveHarvestingNotes personaId](self, "personaId");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personaId");
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

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)domainID
{
  return self->_domainID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)content
{
  return self->_content;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_domainID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
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

    v7 = -[BMProactiveHarvestingNotes initByReadFrom:]([BMProactiveHarvestingNotes alloc], "initByReadFrom:", v6);
    v7[8] = 1;

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
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domainID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 3, 0, 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("title"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("content"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentProtection"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("personaId"), 2, 0, 7, 13, 0);
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
  return &unk_1E5F1E220;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueID"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domainID"), 2, 13, 0, v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 3, 0, 0);
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("title"), 4, 13, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("content"), 5, 13, 0);
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentProtection"), 6, 13, 0);
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("personaId"), 7, 13, 0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
