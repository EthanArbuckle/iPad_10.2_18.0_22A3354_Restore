@implementation BMProactiveHarvestingPageView

- (BMProactiveHarvestingPageView)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 title:(id)a6 content:(id)a7 contentIsReaderText:(id)a8 url:(id)a9 contentProtection:(id)a10 personaId:(id)a11
{
  id v18;
  id v19;
  BMProactiveHarvestingPageView *v20;
  double v21;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v18 = a5;
  v27 = a6;
  v26 = a7;
  v19 = a8;
  v25 = a9;
  v24 = a10;
  v23 = a11;
  v30.receiver = self;
  v30.super_class = (Class)BMProactiveHarvestingPageView;
  v20 = -[BMEventBase init](&v30, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v20->_uniqueID, a3);
    objc_storeStrong((id *)&v20->_domainID, a4);
    if (v18)
    {
      v20->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v20->_hasRaw_absoluteTimestamp = 0;
      v21 = -1.0;
    }
    v20->_raw_absoluteTimestamp = v21;
    objc_storeStrong((id *)&v20->_title, a6);
    objc_storeStrong((id *)&v20->_content, a7);
    if (v19)
    {
      v20->_hasContentIsReaderText = 1;
      v20->_contentIsReaderText = objc_msgSend(v19, "BOOLValue");
    }
    else
    {
      v20->_hasContentIsReaderText = 0;
      v20->_contentIsReaderText = 0;
    }
    objc_storeStrong((id *)&v20->_url, a9);
    objc_storeStrong((id *)&v20->_contentProtection, a10);
    objc_storeStrong((id *)&v20->_personaId, a11);
  }

  return v20;
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
  -[BMProactiveHarvestingPageView uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPageView domainID](self, "domainID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPageView absoluteTimestamp](self, "absoluteTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPageView title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPageView content](self, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingPageView contentIsReaderText](self, "contentIsReaderText"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPageView url](self, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPageView contentProtection](self, "contentProtection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPageView personaId](self, "personaId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMProactiveHarvestingPageView with uniqueID: %@, domainID: %@, absoluteTimestamp: %@, title: %@, content: %@, contentIsReaderText: %@, url: %@, contentProtection: %@, personaId: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProactiveHarvestingPageView *v5;
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
  BOOL v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  double v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  void *v32;
  BMProactiveHarvestingPageView *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMProactiveHarvestingPageView;
  v5 = -[BMEventBase init](&v35, sel_init);
  if (!v5)
    goto LABEL_50;
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
        v17 = v11++ >= 9;
        if (v17)
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
          goto LABEL_39;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
          goto LABEL_39;
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
          continue;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
          goto LABEL_39;
        case 5u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
          goto LABEL_39;
        case 6u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v5->_hasContentIsReaderText = 1;
          break;
        case 7u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 72;
          goto LABEL_39;
        case 8u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 80;
          goto LABEL_39;
        case 9u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 88;
LABEL_39:
          v32 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_49;
          continue;
      }
      while (1)
      {
        v28 = *v6;
        v29 = *(_QWORD *)&v4[v28];
        v30 = v29 + 1;
        if (v29 == -1 || v30 > *(_QWORD *)&v4[*v7])
          break;
        v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v29);
        *(_QWORD *)&v4[v28] = v30;
        v27 |= (unint64_t)(v31 & 0x7F) << v25;
        if ((v31 & 0x80) == 0)
          goto LABEL_43;
        v25 += 7;
        v17 = v26++ >= 9;
        if (v17)
        {
          v27 = 0;
          goto LABEL_45;
        }
      }
      v4[*v8] = 1;
LABEL_43:
      if (v4[*v8])
        v27 = 0;
LABEL_45:
      v5->_contentIsReaderText = v27 != 0;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_49:
    v33 = 0;
  else
LABEL_50:
    v33 = v5;

  return v33;
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
  if (self->_hasContentIsReaderText)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_url)
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
  -[BMProactiveHarvestingPageView writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProactiveHarvestingPageView)initWithJSONDictionary:(id)a3 error:(id *)a4
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
  BMProactiveHarvestingPageView *v24;
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
  BMProactiveHarvestingPageView *v38;
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentIsReaderText"));
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
        v69 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("contentIsReaderText"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
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
        v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("url"));
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
    v24 = -[BMProactiveHarvestingPageView initWithUniqueID:domainID:absoluteTimestamp:title:content:contentIsReaderText:url:contentProtection:personaId:](v38, "initWithUniqueID:domainID:absoluteTimestamp:title:content:contentIsReaderText:url:contentProtection:personaId:", v71, v79, v80, v75, v78, v74, v69, v39, v41);
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
  uint64_t v9;
  uint64_t v10;
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
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[9];
  _QWORD v36[11];

  v36[9] = *MEMORY[0x1E0C80C00];
  -[BMProactiveHarvestingPageView uniqueID](self, "uniqueID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPageView domainID](self, "domainID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPageView absoluteTimestamp](self, "absoluteTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingPageView absoluteTimestamp](self, "absoluteTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  -[BMProactiveHarvestingPageView title](self, "title");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPageView content](self, "content");
  v10 = objc_claimAutoreleasedReturnValue();
  if (-[BMProactiveHarvestingPageView hasContentIsReaderText](self, "hasContentIsReaderText"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingPageView contentIsReaderText](self, "contentIsReaderText"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }
  -[BMProactiveHarvestingPageView url](self, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPageView contentProtection](self, "contentProtection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPageView personaId](self, "personaId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = CFSTR("uniqueID");
  v14 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v14;
  v36[0] = v14;
  v35[1] = CFSTR("domainID");
  v15 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v15;
  v36[1] = v15;
  v35[2] = CFSTR("absoluteTimestamp");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v16;
  v36[2] = v16;
  v35[3] = CFSTR("title");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v3;
  v26 = (void *)v17;
  v36[3] = v17;
  v35[4] = CFSTR("content");
  v18 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v4;
  v36[4] = v18;
  v35[5] = CFSTR("contentIsReaderText");
  v19 = v34;
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v10;
  v20 = (void *)v8;
  v36[5] = v19;
  v35[6] = CFSTR("url");
  v21 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v9;
  v36[6] = v21;
  v35[7] = CFSTR("contentProtection");
  v23 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36[7] = v23;
  v35[8] = CFSTR("personaId");
  v24 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36[8] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 9);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v12)
      goto LABEL_27;
LABEL_38:

    if (v11)
      goto LABEL_28;
    goto LABEL_39;
  }

  if (!v12)
    goto LABEL_38;
LABEL_27:
  if (v11)
    goto LABEL_28;
LABEL_39:

LABEL_28:
  if (!v34)

  if (!v31)
  if (v22)
  {
    if (v20)
      goto LABEL_34;
  }
  else
  {

    if (v20)
    {
LABEL_34:
      if (v32)
        goto LABEL_35;
LABEL_42:

      if (v33)
        goto LABEL_36;
LABEL_43:

      goto LABEL_36;
    }
  }

  if (!v32)
    goto LABEL_42;
LABEL_35:
  if (!v33)
    goto LABEL_43;
LABEL_36:

  return v30;
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
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMProactiveHarvestingPageView uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProactiveHarvestingPageView uniqueID](self, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_34;
    }
    -[BMProactiveHarvestingPageView domainID](self, "domainID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domainID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMProactiveHarvestingPageView domainID](self, "domainID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domainID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_34;
    }
    -[BMProactiveHarvestingPageView absoluteTimestamp](self, "absoluteTimestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMProactiveHarvestingPageView absoluteTimestamp](self, "absoluteTimestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_34;
    }
    -[BMProactiveHarvestingPageView title](self, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMProactiveHarvestingPageView title](self, "title");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_34;
    }
    -[BMProactiveHarvestingPageView content](self, "content");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMProactiveHarvestingPageView content](self, "content");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "content");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_34;
    }
    if (-[BMProactiveHarvestingPageView hasContentIsReaderText](self, "hasContentIsReaderText")
      || objc_msgSend(v5, "hasContentIsReaderText"))
    {
      if (!-[BMProactiveHarvestingPageView hasContentIsReaderText](self, "hasContentIsReaderText"))
        goto LABEL_34;
      if (!objc_msgSend(v5, "hasContentIsReaderText"))
        goto LABEL_34;
      v37 = -[BMProactiveHarvestingPageView contentIsReaderText](self, "contentIsReaderText");
      if (v37 != objc_msgSend(v5, "contentIsReaderText"))
        goto LABEL_34;
    }
    -[BMProactiveHarvestingPageView url](self, "url");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v38 == (void *)v39)
    {

    }
    else
    {
      v40 = (void *)v39;
      -[BMProactiveHarvestingPageView url](self, "url");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "url");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "isEqual:", v42);

      if (!v43)
        goto LABEL_34;
    }
    -[BMProactiveHarvestingPageView contentProtection](self, "contentProtection");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentProtection");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v44 == (void *)v45)
    {

    }
    else
    {
      v46 = (void *)v45;
      -[BMProactiveHarvestingPageView contentProtection](self, "contentProtection");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentProtection");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v47, "isEqual:", v48);

      if (!v49)
      {
LABEL_34:
        v12 = 0;
LABEL_35:

        goto LABEL_36;
      }
    }
    -[BMProactiveHarvestingPageView personaId](self, "personaId");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personaId");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51 == v52)
    {
      v12 = 1;
    }
    else
    {
      -[BMProactiveHarvestingPageView personaId](self, "personaId");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personaId");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v53, "isEqual:", v54);

    }
    goto LABEL_35;
  }
  v12 = 0;
LABEL_36:

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

- (BOOL)contentIsReaderText
{
  return self->_contentIsReaderText;
}

- (BOOL)hasContentIsReaderText
{
  return self->_hasContentIsReaderText;
}

- (void)setHasContentIsReaderText:(BOOL)a3
{
  self->_hasContentIsReaderText = a3;
}

- (NSString)url
{
  return self->_url;
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
  objc_storeStrong((id *)&self->_url, 0);
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

    v7 = -[BMProactiveHarvestingPageView initByReadFrom:]([BMProactiveHarvestingPageView alloc], "initByReadFrom:", v6);
    v7[9] = 1;

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
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentIsReaderText"), 0, 0, 6, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("url"), 2, 0, 7, 13, 0);
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
  return &unk_1E5F1E370;
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
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentIsReaderText"), 6, 12, 0);
  v13[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("url"), 7, 13, 0);
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
