@implementation BMProactiveHarvestingThirdPartyApp

- (BMProactiveHarvestingThirdPartyApp)initWithUniqueID:(id)a3 domainID:(id)a4 bundleID:(id)a5 absoluteTimestamp:(id)a6 title:(id)a7 desc:(id)a8 comment:(id)a9 content:(id)a10 contentProtection:(id)a11 personaId:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  BMProactiveHarvestingThirdPartyApp *v23;
  double v24;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v33 = a3;
  v32 = a4;
  v31 = a5;
  v18 = a6;
  v27 = a7;
  v30 = a7;
  v28 = a8;
  v29 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v34.receiver = self;
  v34.super_class = (Class)BMProactiveHarvestingThirdPartyApp;
  v23 = -[BMEventBase init](&v34, sel_init);
  if (v23)
  {
    v23->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v23->_uniqueID, a3);
    objc_storeStrong((id *)&v23->_domainID, a4);
    objc_storeStrong((id *)&v23->_bundleID, a5);
    if (v18)
    {
      v23->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v23->_hasRaw_absoluteTimestamp = 0;
      v24 = -1.0;
    }
    v23->_raw_absoluteTimestamp = v24;
    objc_storeStrong((id *)&v23->_title, v27);
    objc_storeStrong((id *)&v23->_desc, v28);
    objc_storeStrong((id *)&v23->_comment, a9);
    objc_storeStrong((id *)&v23->_content, a10);
    objc_storeStrong((id *)&v23->_contentProtection, a11);
    objc_storeStrong((id *)&v23->_personaId, a12);
  }

  return v23;
}

- (NSString)description
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
  void *v12;
  void *v14;
  id v15;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMProactiveHarvestingThirdPartyApp uniqueID](self, "uniqueID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp domainID](self, "domainID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp absoluteTimestamp](self, "absoluteTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp desc](self, "desc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp comment](self, "comment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp content](self, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp contentProtection](self, "contentProtection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp personaId](self, "personaId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("BMProactiveHarvestingThirdPartyApp with uniqueID: %@, domainID: %@, bundleID: %@, absoluteTimestamp: %@, title: %@, desc: %@, comment: %@, content: %@, contentProtection: %@, personaId: %@"), v14, v3, v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProactiveHarvestingThirdPartyApp *v5;
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
  BMProactiveHarvestingThirdPartyApp *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMProactiveHarvestingThirdPartyApp;
  v5 = -[BMEventBase init](&v28, sel_init);
  if (!v5)
    goto LABEL_41;
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
          goto LABEL_34;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
          goto LABEL_34;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
          goto LABEL_34;
        case 4u:
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
        case 5u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
          goto LABEL_34;
        case 6u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 72;
          goto LABEL_34;
        case 7u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 80;
          goto LABEL_34;
        case 8u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 88;
          goto LABEL_34;
        case 9u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 96;
          goto LABEL_34;
        case 0xAu:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 104;
LABEL_34:
          v25 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_40;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_40:
    v26 = 0;
  else
LABEL_41:
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
  if (self->_bundleID)
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
  if (self->_desc)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_comment)
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
  -[BMProactiveHarvestingThirdPartyApp writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProactiveHarvestingThirdPartyApp)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  id v13;
  id v14;
  double v15;
  double v16;
  id v17;
  id *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BMProactiveHarvestingThirdPartyApp *v23;
  id *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BMProactiveHarvestingThirdPartyApp *v41;
  id v42;
  void *v43;
  id v44;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id *v83;
  void *v84;
  id v85;
  id v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  _QWORD v107[3];

  v107[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("domainID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = a4;
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v9 = 0;
          v23 = 0;
          goto LABEL_60;
        }
        v24 = a4;
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v104 = *MEMORY[0x1E0CB2D50];
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("domainID"));
        v105 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v25;
        v10 = (void *)v28;
        v30 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v26, 2, v28);
        v9 = 0;
        v23 = 0;
        *v24 = v30;
        goto LABEL_59;
      }
      v9 = v8;
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v83)
        {
          v27 = 0;
          v23 = 0;
          goto LABEL_59;
        }
        v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = v9;
        v32 = *MEMORY[0x1E0D025B8];
        v102 = *MEMORY[0x1E0CB2D50];
        v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
        v103 = v84;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v32;
        v9 = v31;
        v27 = 0;
        v23 = 0;
        *v83 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v34, 2, v33);
        v11 = (void *)v33;
LABEL_58:

LABEL_59:
        goto LABEL_60;
      }
      v81 = v10;
    }
    else
    {
      v81 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v10;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (objc_class *)MEMORY[0x1E0C99D68];
        v13 = v11;
        v14 = [v12 alloc];
        objc_msgSend(v13, "doubleValue");
        v16 = v15;

        v17 = (id)objc_msgSend(v14, "initWithTimeIntervalSinceReferenceDate:", v16);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v35 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v35, "dateFromString:", v11);
          v84 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_30;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v83)
          {
            v84 = 0;
            v23 = 0;
            v27 = v81;
            goto LABEL_58;
          }
          v85 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v65 = v9;
          v66 = *MEMORY[0x1E0D025B8];
          v100 = *MEMORY[0x1E0CB2D50];
          v80 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
          v101 = v80;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v66;
          v9 = v65;
          v68 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v67, 2, v36);
          v84 = 0;
          v23 = 0;
          *v83 = v68;
          goto LABEL_56;
        }
        v17 = v11;
      }
      v84 = v17;
    }
    else
    {
      v84 = 0;
    }
LABEL_30:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v9;
    if (v36 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v83)
        {
          v80 = 0;
          v23 = 0;
          v27 = v81;
          goto LABEL_57;
        }
        v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v47 = *MEMORY[0x1E0D025B8];
        v98 = *MEMORY[0x1E0CB2D50];
        v78 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("title"));
        v99 = v78;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v46;
        v9 = v79;
        v49 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v47, 2, v37);
        v23 = 0;
        v80 = 0;
        *v83 = v49;
        goto LABEL_55;
      }
      v80 = v36;
    }
    else
    {
      v80 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("desc"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v8;
    v72 = v36;
    if (v37 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v83)
        {
          v78 = 0;
          v23 = 0;
          goto LABEL_54;
        }
        v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v51 = *MEMORY[0x1E0D025B8];
        v96 = *MEMORY[0x1E0CB2D50];
        v76 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("desc"));
        v97 = v76;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v50;
        v9 = v79;
        v53 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v51, 2, v38);
        v23 = 0;
        v78 = 0;
        *v83 = v53;
LABEL_53:

LABEL_54:
        v36 = v72;
LABEL_55:

LABEL_56:
        v27 = v81;
LABEL_57:

        v10 = v77;
        goto LABEL_58;
      }
      v78 = v37;
    }
    else
    {
      v78 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("comment"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v11;
    if (v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v83)
        {
          v76 = 0;
          v23 = 0;
          goto LABEL_53;
        }
        v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v55 = *MEMORY[0x1E0D025B8];
        v94 = *MEMORY[0x1E0CB2D50];
        v74 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("comment"));
        v95 = v74;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v55, 2, v39);
        v23 = 0;
        v76 = 0;
        *v83 = v56;
        goto LABEL_51;
      }
      v76 = v38;
    }
    else
    {
      v76 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("content"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v6;
    v71 = v7;
    if (v39 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v83)
        {
          v74 = 0;
          v23 = 0;
          goto LABEL_52;
        }
        v41 = self;
        v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v58 = *MEMORY[0x1E0D025B8];
        v92 = *MEMORY[0x1E0CB2D50];
        v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("content"));
        v93 = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v58, 2, v40);
        v23 = 0;
        v74 = 0;
        *v83 = v59;
        goto LABEL_50;
      }
      v74 = v39;
    }
    else
    {
      v74 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contentProtection"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v41 = self;
        if (!v83)
        {
          v42 = 0;
          v23 = 0;
          goto LABEL_50;
        }
        v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v61 = *MEMORY[0x1E0D025B8];
        v90 = *MEMORY[0x1E0CB2D50];
        v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contentProtection"));
        v91 = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v61, 2, v43);
        v23 = 0;
        v42 = 0;
        *v83 = v62;
        goto LABEL_49;
      }
      v41 = self;
      v42 = v40;
    }
    else
    {
      v41 = self;
      v42 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personaId"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v83)
        {
          v87 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v69 = *MEMORY[0x1E0D025B8];
          v88 = *MEMORY[0x1E0CB2D50];
          v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("personaId"));
          v89 = v63;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *v83 = (id)objc_msgSend(v87, "initWithDomain:code:userInfo:", v69, 2, v64);

        }
        v44 = 0;
        v23 = 0;
        goto LABEL_49;
      }
      v44 = v43;
    }
    else
    {
      v44 = 0;
    }
    v23 = -[BMProactiveHarvestingThirdPartyApp initWithUniqueID:domainID:bundleID:absoluteTimestamp:title:desc:comment:content:contentProtection:personaId:](v41, "initWithUniqueID:domainID:bundleID:absoluteTimestamp:title:desc:comment:content:contentProtection:personaId:", v71, v79, v81, v84, v80, v78, v76, v74, v42, v44);
    v41 = v23;
LABEL_49:

LABEL_50:
    self = v41;

    v6 = v70;
    v7 = v71;
LABEL_51:
    v9 = v79;
    v11 = v73;
LABEL_52:

    v8 = v75;
    goto LABEL_53;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    goto LABEL_4;
  }
  if (!a4)
  {
    v7 = 0;
    v23 = 0;
    goto LABEL_61;
  }
  v18 = a4;
  v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v20 = *MEMORY[0x1E0D025B8];
  v106 = *MEMORY[0x1E0CB2D50];
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("uniqueID"));
  v107[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, &v106, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20;
  v9 = (id)v21;
  v7 = 0;
  v23 = 0;
  *v18 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v22, 2, v8);
LABEL_60:

LABEL_61:
  return v23;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[10];
  _QWORD v40[12];

  v40[10] = *MEMORY[0x1E0C80C00];
  -[BMProactiveHarvestingThirdPartyApp uniqueID](self, "uniqueID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp domainID](self, "domainID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp bundleID](self, "bundleID");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp absoluteTimestamp](self, "absoluteTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingThirdPartyApp absoluteTimestamp](self, "absoluteTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  -[BMProactiveHarvestingThirdPartyApp title](self, "title");
  v10 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp desc](self, "desc");
  v11 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp comment](self, "comment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp content](self, "content");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp contentProtection](self, "contentProtection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingThirdPartyApp personaId](self, "personaId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = CFSTR("uniqueID");
  v15 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v15;
  v40[0] = v15;
  v39[1] = CFSTR("domainID");
  v16 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v16;
  v40[1] = v16;
  v39[2] = CFSTR("bundleID");
  v17 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v3;
  v30 = (void *)v17;
  v40[2] = v17;
  v39[3] = CFSTR("absoluteTimestamp");
  v18 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v4;
  v29 = (void *)v18;
  v40[3] = v18;
  v39[4] = CFSTR("title");
  v19 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v5;
  v28 = (void *)v19;
  v40[4] = v19;
  v39[5] = CFSTR("desc");
  v20 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v9;
  v40[5] = v20;
  v39[6] = CFSTR("comment");
  v21 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v10;
  v40[6] = v21;
  v39[7] = CFSTR("content");
  v23 = v38;
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v11;
  v40[7] = v23;
  v39[8] = CFSTR("contentProtection");
  v25 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40[8] = v25;
  v39[9] = CFSTR("personaId");
  v26 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40[9] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 10);
  v33 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v13)
      goto LABEL_26;
  }
  else
  {

    if (v13)
      goto LABEL_26;
  }

LABEL_26:
  if (!v38)

  if (!v12)
  if (!v24)

  if (!v22)
  if (!v34)

  if (v35)
  {
    if (v36)
      goto LABEL_38;
LABEL_43:

    if (v37)
      goto LABEL_39;
LABEL_44:

    goto LABEL_39;
  }

  if (!v36)
    goto LABEL_43;
LABEL_38:
  if (!v37)
    goto LABEL_44;
LABEL_39:

  return v33;
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
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMProactiveHarvestingThirdPartyApp uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProactiveHarvestingThirdPartyApp uniqueID](self, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_37;
    }
    -[BMProactiveHarvestingThirdPartyApp domainID](self, "domainID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domainID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMProactiveHarvestingThirdPartyApp domainID](self, "domainID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domainID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_37;
    }
    -[BMProactiveHarvestingThirdPartyApp bundleID](self, "bundleID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMProactiveHarvestingThirdPartyApp bundleID](self, "bundleID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_37;
    }
    -[BMProactiveHarvestingThirdPartyApp absoluteTimestamp](self, "absoluteTimestamp");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMProactiveHarvestingThirdPartyApp absoluteTimestamp](self, "absoluteTimestamp");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_37;
    }
    -[BMProactiveHarvestingThirdPartyApp title](self, "title");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMProactiveHarvestingThirdPartyApp title](self, "title");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_37;
    }
    -[BMProactiveHarvestingThirdPartyApp desc](self, "desc");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "desc");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMProactiveHarvestingThirdPartyApp desc](self, "desc");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "desc");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_37;
    }
    -[BMProactiveHarvestingThirdPartyApp comment](self, "comment");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "comment");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMProactiveHarvestingThirdPartyApp comment](self, "comment");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "comment");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_37;
    }
    -[BMProactiveHarvestingThirdPartyApp content](self, "content");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMProactiveHarvestingThirdPartyApp content](self, "content");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "content");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
        goto LABEL_37;
    }
    -[BMProactiveHarvestingThirdPartyApp contentProtection](self, "contentProtection");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentProtection");
    v56 = objc_claimAutoreleasedReturnValue();
    if (v55 == (void *)v56)
    {

    }
    else
    {
      v57 = (void *)v56;
      -[BMProactiveHarvestingThirdPartyApp contentProtection](self, "contentProtection");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentProtection");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqual:", v59);

      if (!v60)
      {
LABEL_37:
        v12 = 0;
LABEL_38:

        goto LABEL_39;
      }
    }
    -[BMProactiveHarvestingThirdPartyApp personaId](self, "personaId");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personaId");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62 == v63)
    {
      v12 = 1;
    }
    else
    {
      -[BMProactiveHarvestingThirdPartyApp personaId](self, "personaId");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personaId");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v64, "isEqual:", v65);

    }
    goto LABEL_38;
  }
  v12 = 0;
LABEL_39:

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

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)desc
{
  return self->_desc;
}

- (NSString)comment
{
  return self->_comment;
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
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
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

    v7 = -[BMProactiveHarvestingThirdPartyApp initByReadFrom:]([BMProactiveHarvestingThirdPartyApp alloc], "initByReadFrom:", v6);
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
  id v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domainID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 4, 0, 1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("title"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("desc"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("comment"), 2, 0, 7, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("content"), 2, 0, 8, 13, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentProtection"), 2, 0, 9, 13, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("personaId"), 2, 0, 10, 13, 0);
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v4;
  v14[3] = v5;
  v14[4] = v6;
  v14[5] = v7;
  v14[6] = v8;
  v14[7] = v9;
  v14[8] = v10;
  v14[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1E268;
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
  void *v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueID"), 1, 13, 0);
  v14[0] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domainID"), 2, 13, 0);
  v14[1] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 3, 13, 0);
  v14[2] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 4, 0, 0);
  v14[3] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("title"), 5, 13, 0);
  v14[4] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("desc"), 6, 13, 0);
  v14[5] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("comment"), 7, 13, 0);
  v14[6] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("content"), 8, 13, 0);
  v14[7] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentProtection"), 9, 13, 0);
  v14[8] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("personaId"), 10, 13, 0);
  v14[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
