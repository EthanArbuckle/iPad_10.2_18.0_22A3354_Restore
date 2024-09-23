@implementation BMProactiveHarvestingNewsArticle

- (BMProactiveHarvestingNewsArticle)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 title:(id)a6 content:(id)a7 summary:(id)a8 publication:(id)a9 contentProtection:(id)a10 personaId:(id)a11
{
  id v18;
  void *v19;
  id v20;
  BMProactiveHarvestingNewsArticle *v21;
  double v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v29 = a4;
  v18 = a5;
  v28 = a6;
  v27 = a7;
  v26 = a8;
  v25 = a9;
  v19 = v18;
  v24 = a10;
  v20 = a11;
  v31.receiver = self;
  v31.super_class = (Class)BMProactiveHarvestingNewsArticle;
  v21 = -[BMEventBase init](&v31, sel_init);
  if (v21)
  {
    v21->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v21->_uniqueID, a3);
    objc_storeStrong((id *)&v21->_domainID, a4);
    if (v19)
    {
      v21->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v19, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v21->_hasRaw_absoluteTimestamp = 0;
      v22 = -1.0;
    }
    v21->_raw_absoluteTimestamp = v22;
    objc_storeStrong((id *)&v21->_title, a6);
    objc_storeStrong((id *)&v21->_content, a7);
    objc_storeStrong((id *)&v21->_summary, a8);
    objc_storeStrong((id *)&v21->_publication, a9);
    objc_storeStrong((id *)&v21->_contentProtection, a10);
    objc_storeStrong((id *)&v21->_personaId, a11);
  }

  return v21;
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
  void *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMProactiveHarvestingNewsArticle uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNewsArticle domainID](self, "domainID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNewsArticle absoluteTimestamp](self, "absoluteTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNewsArticle title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNewsArticle content](self, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNewsArticle summary](self, "summary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNewsArticle publication](self, "publication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNewsArticle contentProtection](self, "contentProtection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNewsArticle personaId](self, "personaId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMProactiveHarvestingNewsArticle with uniqueID: %@, domainID: %@, absoluteTimestamp: %@, title: %@, content: %@, summary: %@, publication: %@, contentProtection: %@, personaId: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProactiveHarvestingNewsArticle *v5;
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
  BMProactiveHarvestingNewsArticle *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMProactiveHarvestingNewsArticle;
  v5 = -[BMEventBase init](&v28, sel_init);
  if (!v5)
    goto LABEL_40;
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
          goto LABEL_33;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
          goto LABEL_33;
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
          goto LABEL_33;
        case 5u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
          goto LABEL_33;
        case 6u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 72;
          goto LABEL_33;
        case 7u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 80;
          goto LABEL_33;
        case 8u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 88;
          goto LABEL_33;
        case 9u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 96;
LABEL_33:
          v25 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_39;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_39:
    v26 = 0;
  else
LABEL_40:
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
  if (self->_summary)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_publication)
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
  -[BMProactiveHarvestingNewsArticle writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProactiveHarvestingNewsArticle)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  id v18;
  id *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BMProactiveHarvestingNewsArticle *v24;
  id *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BMProactiveHarvestingNewsArticle *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id *v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  _QWORD v99[3];

  v99[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("domainID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v24 = 0;
          goto LABEL_50;
        }
        v25 = a4;
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = *MEMORY[0x1E0D025B8];
        v96 = *MEMORY[0x1E0CB2D50];
        v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("domainID"));
        v97 = v80;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v26;
        v11 = (void *)v28;
        v30 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v27, 2, v28);
        v10 = 0;
        v24 = 0;
        *v25 = v30;
        goto LABEL_49;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v10;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (objc_class *)MEMORY[0x1E0C99D68];
        v13 = v11;
        v14 = v11;
        v15 = [v12 alloc];
        objc_msgSend(v14, "doubleValue");
        v17 = v16;

        v11 = v13;
        v18 = (id)objc_msgSend(v15, "initWithTimeIntervalSinceReferenceDate:", v17);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v31, "dateFromString:", v11);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_23;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v76)
          {
            v80 = 0;
            v24 = 0;
            goto LABEL_49;
          }
          v81 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v61 = *MEMORY[0x1E0D025B8];
          v94 = *MEMORY[0x1E0CB2D50];
          v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
          v95 = v42;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = v61;
          v10 = v79;
          v77 = (void *)v62;
          v64 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v63, 2);
          v80 = 0;
          v24 = 0;
          *v76 = v64;
LABEL_48:

LABEL_49:
          goto LABEL_50;
        }
        v18 = v11;
      }
      v80 = v18;
    }
    else
    {
      v80 = 0;
    }
LABEL_23:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
    v32 = objc_claimAutoreleasedReturnValue();
    v72 = v11;
    v73 = v9;
    v77 = (void *)v32;
    if (v32 && (v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v76)
        {
          v42 = 0;
          v24 = 0;
          goto LABEL_48;
        }
        v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v45 = *MEMORY[0x1E0D025B8];
        v92 = *MEMORY[0x1E0CB2D50];
        v78 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("title"));
        v93 = v78;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v44;
        v11 = v72;
        v47 = v45;
        v10 = v79;
        v24 = 0;
        v42 = 0;
        *v76 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 2, v34);
        goto LABEL_47;
      }
      v75 = v33;
    }
    else
    {
      v75 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("content"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v76)
        {
          v78 = 0;
          v24 = 0;
          goto LABEL_46;
        }
        v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v49 = *MEMORY[0x1E0D025B8];
        v90 = *MEMORY[0x1E0CB2D50];
        v74 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("content"));
        v91 = v74;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v48;
        v11 = v72;
        v51 = v49;
        v10 = v79;
        v24 = 0;
        v78 = 0;
        *v76 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 2, v35);
LABEL_45:

LABEL_46:
        v42 = v75;
LABEL_47:

        v9 = v73;
        goto LABEL_48;
      }
      v78 = v34;
    }
    else
    {
      v78 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("summary"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v8;
    if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v76)
        {
          v74 = 0;
          v24 = 0;
          goto LABEL_45;
        }
        v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v53 = *MEMORY[0x1E0D025B8];
        v88 = *MEMORY[0x1E0CB2D50];
        v69 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("summary"));
        v89 = v69;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v53, 2, v36);
        v24 = 0;
        v74 = 0;
        *v76 = v54;
        goto LABEL_44;
      }
      v74 = v35;
    }
    else
    {
      v74 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("publication"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v7;
    if (v36 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v76)
        {
          v69 = 0;
          v24 = 0;
          goto LABEL_44;
        }
        v38 = self;
        v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v55 = *MEMORY[0x1E0D025B8];
        v86 = *MEMORY[0x1E0CB2D50];
        v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("publication"));
        v87 = v39;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v55, 2, v37);
        v24 = 0;
        v69 = 0;
        *v76 = v56;
LABEL_43:

        self = v38;
        v7 = v68;
LABEL_44:
        v11 = v72;

        v8 = v71;
        v10 = v79;
        goto LABEL_45;
      }
      v69 = v36;
    }
    else
    {
      v69 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentProtection"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      v38 = self;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v76)
        {
          v39 = 0;
          v24 = 0;
          goto LABEL_43;
        }
        v66 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v57 = *MEMORY[0x1E0D025B8];
        v84 = *MEMORY[0x1E0CB2D50];
        v41 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contentProtection"));
        v85 = v41;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", v57, 2, v40);
        v24 = 0;
        v39 = 0;
        *v76 = v58;
        goto LABEL_42;
      }
      v39 = v37;
    }
    else
    {
      v38 = self;
      v39 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("personaId"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v76)
        {
          v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v65 = *MEMORY[0x1E0D025B8];
          v82 = *MEMORY[0x1E0CB2D50];
          v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("personaId"));
          v83 = v59;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *v76 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v65, 2, v60);

        }
        v41 = 0;
        v24 = 0;
        goto LABEL_42;
      }
      v41 = v40;
    }
    else
    {
      v41 = 0;
    }
    v24 = -[BMProactiveHarvestingNewsArticle initWithUniqueID:domainID:absoluteTimestamp:title:content:summary:publication:contentProtection:personaId:](v38, "initWithUniqueID:domainID:absoluteTimestamp:title:content:summary:publication:contentProtection:personaId:", v71, v79, v80, v75, v78, v74, v69, v39, v41);
    v38 = v24;
LABEL_42:

    goto LABEL_43;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v8 = 0;
    v24 = 0;
    goto LABEL_51;
  }
  v19 = a4;
  v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v21 = *MEMORY[0x1E0D025B8];
  v98 = *MEMORY[0x1E0CB2D50];
  v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("uniqueID"));
  v99[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, &v98, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21;
  v10 = (id)v22;
  v8 = 0;
  v24 = 0;
  *v19 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v23, 2, v9);
LABEL_50:

LABEL_51:
  return v24;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[9];
  _QWORD v34[11];

  v34[9] = *MEMORY[0x1E0C80C00];
  -[BMProactiveHarvestingNewsArticle uniqueID](self, "uniqueID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNewsArticle domainID](self, "domainID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNewsArticle absoluteTimestamp](self, "absoluteTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingNewsArticle absoluteTimestamp](self, "absoluteTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  -[BMProactiveHarvestingNewsArticle title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNewsArticle content](self, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNewsArticle summary](self, "summary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNewsArticle publication](self, "publication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNewsArticle contentProtection](self, "contentProtection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNewsArticle personaId](self, "personaId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = CFSTR("uniqueID");
  v14 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v14;
  v34[0] = v14;
  v33[1] = CFSTR("domainID");
  v15 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v15;
  v34[1] = v15;
  v33[2] = CFSTR("absoluteTimestamp");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v3;
  v25 = (void *)v16;
  v34[2] = v16;
  v33[3] = CFSTR("title");
  v17 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v4;
  v24 = (void *)v17;
  v34[3] = v17;
  v33[4] = CFSTR("content");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v8;
  v34[4] = v18;
  v33[5] = CFSTR("summary");
  v19 = v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[5] = v19;
  v33[6] = CFSTR("publication");
  v20 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[6] = v20;
  v33[7] = CFSTR("contentProtection");
  v21 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[7] = v21;
  v33[8] = CFSTR("personaId");
  v22 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[8] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 9);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v12)
      goto LABEL_24;
LABEL_36:

    if (v11)
      goto LABEL_25;
    goto LABEL_37;
  }

  if (!v12)
    goto LABEL_36;
LABEL_24:
  if (v11)
    goto LABEL_25;
LABEL_37:

LABEL_25:
  if (!v32)

  if (!v10)
  if (!v9)

  if (v29)
  {
    if (v30)
      goto LABEL_33;
LABEL_39:

    if (v31)
      goto LABEL_34;
LABEL_40:

    goto LABEL_34;
  }

  if (!v30)
    goto LABEL_39;
LABEL_33:
  if (!v31)
    goto LABEL_40;
LABEL_34:

  return v28;
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
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMProactiveHarvestingNewsArticle uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProactiveHarvestingNewsArticle uniqueID](self, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_33;
    }
    -[BMProactiveHarvestingNewsArticle domainID](self, "domainID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domainID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMProactiveHarvestingNewsArticle domainID](self, "domainID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domainID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_33;
    }
    -[BMProactiveHarvestingNewsArticle absoluteTimestamp](self, "absoluteTimestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMProactiveHarvestingNewsArticle absoluteTimestamp](self, "absoluteTimestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_33;
    }
    -[BMProactiveHarvestingNewsArticle title](self, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMProactiveHarvestingNewsArticle title](self, "title");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_33;
    }
    -[BMProactiveHarvestingNewsArticle content](self, "content");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMProactiveHarvestingNewsArticle content](self, "content");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "content");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_33;
    }
    -[BMProactiveHarvestingNewsArticle summary](self, "summary");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "summary");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMProactiveHarvestingNewsArticle summary](self, "summary");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "summary");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_33;
    }
    -[BMProactiveHarvestingNewsArticle publication](self, "publication");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "publication");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMProactiveHarvestingNewsArticle publication](self, "publication");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "publication");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_33;
    }
    -[BMProactiveHarvestingNewsArticle contentProtection](self, "contentProtection");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentProtection");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMProactiveHarvestingNewsArticle contentProtection](self, "contentProtection");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentProtection");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
      {
LABEL_33:
        v12 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    -[BMProactiveHarvestingNewsArticle personaId](self, "personaId");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personaId");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56 == v57)
    {
      v12 = 1;
    }
    else
    {
      -[BMProactiveHarvestingNewsArticle personaId](self, "personaId");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personaId");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v58, "isEqual:", v59);

    }
    goto LABEL_34;
  }
  v12 = 0;
LABEL_35:

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

- (NSString)summary
{
  return self->_summary;
}

- (NSString)publication
{
  return self->_publication;
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
  objc_storeStrong((id *)&self->_publication, 0);
  objc_storeStrong((id *)&self->_summary, 0);
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

    v7 = -[BMProactiveHarvestingNewsArticle initByReadFrom:]([BMProactiveHarvestingNewsArticle alloc], "initByReadFrom:", v6);
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
  void *v10;
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domainID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 3, 0, 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("title"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("content"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("summary"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("publication"), 2, 0, 7, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentProtection"), 2, 0, 8, 13, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("personaId"), 2, 0, 9, 13, 0);
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1BBE0;
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
  void *v10;
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueID"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domainID"), 2, 13, 0, v2);
  v13[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 3, 0, 0);
  v13[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("title"), 4, 13, 0);
  v13[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("content"), 5, 13, 0);
  v13[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("summary"), 6, 13, 0);
  v13[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("publication"), 7, 13, 0);
  v13[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentProtection"), 8, 13, 0);
  v13[7] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("personaId"), 9, 13, 0);
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
