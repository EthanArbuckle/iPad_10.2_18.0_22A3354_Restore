@implementation BMProactiveHarvestingParsecSearch

- (BMProactiveHarvestingParsecSearch)initWithResultID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 userInput:(id)a6 completedQuery:(id)a7 entities:(id)a8 uniqueID:(id)a9 contentProtection:(id)a10 personaId:(id)a11
{
  id v18;
  void *v19;
  id v20;
  BMProactiveHarvestingParsecSearch *v21;
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
  v31.super_class = (Class)BMProactiveHarvestingParsecSearch;
  v21 = -[BMEventBase init](&v31, sel_init);
  if (v21)
  {
    v21->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v21->_resultID, a3);
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
    objc_storeStrong((id *)&v21->_userInput, a6);
    objc_storeStrong((id *)&v21->_completedQuery, a7);
    objc_storeStrong((id *)&v21->_entities, a8);
    objc_storeStrong((id *)&v21->_uniqueID, a9);
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
  -[BMProactiveHarvestingParsecSearch resultID](self, "resultID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingParsecSearch domainID](self, "domainID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingParsecSearch absoluteTimestamp](self, "absoluteTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingParsecSearch userInput](self, "userInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingParsecSearch completedQuery](self, "completedQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingParsecSearch entities](self, "entities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingParsecSearch uniqueID](self, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingParsecSearch contentProtection](self, "contentProtection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingParsecSearch personaId](self, "personaId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMProactiveHarvestingParsecSearch with resultID: %@, domainID: %@, absoluteTimestamp: %@, userInput: %@, completedQuery: %@, entities: %@, uniqueID: %@, contentProtection: %@, personaId: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProactiveHarvestingParsecSearch *v5;
  void *v6;
  int *v7;
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
  uint64_t v24;
  unint64_t v25;
  double v26;
  int *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSArray *entities;
  int v33;
  BMProactiveHarvestingParsecSearch *v34;
  objc_super v36;
  uint64_t v37;
  uint64_t v38;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMProactiveHarvestingParsecSearch;
  v5 = -[BMEventBase init](&v36, sel_init);
  if (!v5)
  {
LABEL_42:
    v34 = v5;
    goto LABEL_43;
  }
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_40:
    v31 = objc_msgSend(v6, "copy");
    entities = v5->_entities;
    v5->_entities = (NSArray *)v31;

    v33 = v4[*v9];
    if (v33)
      goto LABEL_41;
    goto LABEL_42;
  }
  v10 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
  v11 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v9])
      goto LABEL_40;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    while (1)
    {
      v15 = *v7;
      v16 = *(_QWORD *)&v4[v15];
      v17 = v16 + 1;
      if (v16 == -1 || v17 > *(_QWORD *)&v4[*v8])
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
        v20 = v4[*v9];
        goto LABEL_15;
      }
    }
    v4[*v9] = 1;
LABEL_13:
    v20 = v4[*v9];
    if (v4[*v9])
      v14 = 0;
LABEL_15:
    if (v20 || (v14 & 7) == 4)
      goto LABEL_40;
    switch((v14 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = v10[984];
        goto LABEL_35;
      case 2u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 48;
        goto LABEL_35;
      case 3u:
        v5->_hasRaw_absoluteTimestamp = 1;
        v24 = *v7;
        v25 = *(_QWORD *)&v4[v24];
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)&v4[*v8])
        {
          v26 = *(double *)(*(_QWORD *)&v4[*v11] + v25);
          *(_QWORD *)&v4[v24] = v25 + 8;
        }
        else
        {
          v4[*v9] = 1;
          v26 = 0.0;
        }
        v5->_raw_absoluteTimestamp = v26;
        goto LABEL_36;
      case 4u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 56;
        goto LABEL_35;
      case 5u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 64;
        goto LABEL_35;
      case 6u:
        v37 = 0;
        v38 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_44;
        v27 = v10;
        v28 = -[BMProactiveHarvestingParsecSearchEntity initByReadFrom:]([BMProactiveHarvestingParsecSearchEntity alloc], "initByReadFrom:", v4);
        if (!v28)
          goto LABEL_44;
        v29 = v28;
        objc_msgSend(v6, "addObject:", v28);
        PBReaderRecallMark();

        v10 = v27;
        goto LABEL_36;
      case 7u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 80;
        goto LABEL_35;
      case 8u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 88;
        goto LABEL_35;
      case 9u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 96;
LABEL_35:
        v30 = *(Class *)((char *)&v5->super.super.isa + v23);
        *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

        goto LABEL_36;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_36:
          if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
            goto LABEL_40;
          continue;
        }
LABEL_44:

LABEL_41:
        v34 = 0;
LABEL_43:

        return v34;
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
  if (self->_resultID)
    PBDataWriterWriteStringField();
  if (self->_domainID)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_userInput)
    PBDataWriterWriteStringField();
  if (self->_completedQuery)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_entities;
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

  if (self->_uniqueID)
    PBDataWriterWriteStringField();
  if (self->_contentProtection)
    PBDataWriterWriteStringField();
  if (self->_personaId)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMProactiveHarvestingParsecSearch writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProactiveHarvestingParsecSearch)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;
  id v14;
  double v15;
  double v16;
  id v17;
  id v18;
  uint64_t v19;
  id *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BMProactiveHarvestingParsecSearch *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  BMProactiveHarvestingParsecSearchEntity *v47;
  BMProactiveHarvestingParsecSearchEntity *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  id *v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  id *v63;
  id v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id *v69;
  id v70;
  uint64_t v71;
  void *v72;
  id *v73;
  uint64_t *v74;
  id v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  void *v79;
  void *v80;
  id v81;
  void *v83;
  id v84;
  uint64_t v85;
  id *v86;
  id v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  id v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  id v103;
  id *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  BMProactiveHarvestingParsecSearch *v109;
  id v110;
  uint64_t v111;
  void *v112;
  id v113;
  id v114;
  void *v115;
  id *v116;
  void *v117;
  void *v118;
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  id v129;
  uint64_t v130;
  id v131;
  uint64_t v132;
  id v133;
  _BYTE v134[128];
  uint64_t v135;
  void *v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  id v140;
  uint64_t v141;
  id v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  _QWORD v146[3];

  v146[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("resultID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v116 = a4;
    a4 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v116 = a4;
    a4 = v7;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("domainID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v114 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v114 = v8;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
      v9 = objc_claimAutoreleasedReturnValue();
      v115 = (void *)v9;
      if (!v9 || (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v111 = 0;
LABEL_23:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userInput"));
        v35 = objc_claimAutoreleasedReturnValue();
        v112 = (void *)v35;
        if (v35 && (v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v116)
            {
              v113 = 0;
              v24 = 0;
              v21 = v114;
              v31 = (void *)v111;
              goto LABEL_91;
            }
            v51 = v8;
            v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v53 = *MEMORY[0x1E0D025B8];
            v139 = *MEMORY[0x1E0CB2D50];
            v54 = a4;
            v55 = objc_alloc(MEMORY[0x1E0CB3940]);
            v98 = objc_opt_class();
            v56 = v55;
            a4 = v54;
            v110 = (id)objc_msgSend(v56, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v98, CFSTR("userInput"));
            v140 = v110;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
            v57 = objc_claimAutoreleasedReturnValue();
            v58 = v52;
            v8 = v51;
            v59 = v53;
            v37 = (void *)v57;
            v24 = 0;
            v113 = 0;
            *v116 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v59, 2, v57);
            goto LABEL_101;
          }
          v113 = v36;
        }
        else
        {
          v113 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("completedQuery"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = v37;
        v108 = v7;
        if (!v37 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v107 = v8;
          v110 = 0;
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v107 = v8;
          v110 = v37;
LABEL_29:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entities"));
          v38 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v38, "isEqual:", v39);

          v109 = self;
          if (v40)
          {
            v104 = a4;
            v106 = v6;

            v38 = 0;
          }
          else
          {
            if (v38)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v116)
                {
                  v24 = 0;
                  v8 = v107;
                  v21 = v114;
                  v31 = (void *)v111;
                  goto LABEL_89;
                }
                v77 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v78 = *MEMORY[0x1E0D025B8];
                v135 = *MEMORY[0x1E0CB2D50];
                v118 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("entities"));
                v136 = v118;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
                v50 = (id)objc_claimAutoreleasedReturnValue();
                v24 = 0;
                *v116 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v78, 2, v50);
                goto LABEL_66;
              }
            }
            v104 = a4;
            v106 = v6;
          }
          v118 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v38, "count"));
          v120 = 0u;
          v121 = 0u;
          v122 = 0u;
          v123 = 0u;
          v38 = v38;
          v41 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v120, v134, 16);
          if (!v41)
            goto LABEL_44;
          v42 = v41;
          v43 = *(_QWORD *)v121;
LABEL_36:
          v44 = 0;
          while (1)
          {
            if (*(_QWORD *)v121 != v43)
              objc_enumerationMutation(v38);
            v45 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v44);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v69 = v116;
              if (v116)
              {
                v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v71 = *MEMORY[0x1E0D025B8];
                v130 = *MEMORY[0x1E0CB2D50];
                v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("entities"));
                v131 = v46;
                v72 = (void *)MEMORY[0x1E0C99D80];
                v73 = &v131;
                v74 = &v130;
                goto LABEL_59;
              }
              goto LABEL_65;
            }
            v46 = v45;
            v47 = [BMProactiveHarvestingParsecSearchEntity alloc];
            v119 = 0;
            v48 = -[BMProactiveHarvestingParsecSearchEntity initWithJSONDictionary:error:](v47, "initWithJSONDictionary:error:", v46, &v119);
            v49 = v119;
            if (v49)
            {
              v75 = v49;
              if (v116)
                *v116 = objc_retainAutorelease(v49);

              v24 = 0;
              v50 = v38;
              a4 = v104;
              v6 = v106;
              v8 = v107;
              v37 = v117;
              goto LABEL_85;
            }
            objc_msgSend(v118, "addObject:", v48);

            ++v44;
            v37 = v117;
            if (v42 == v44)
            {
              v42 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v120, v134, 16);
              if (v42)
                goto LABEL_36;
LABEL_44:

              v6 = v106;
              objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("uniqueID"));
              v46 = (id)objc_claimAutoreleasedReturnValue();
              if (!v46)
              {
                v50 = 0;
                a4 = v104;
                goto LABEL_74;
              }
              objc_opt_class();
              a4 = v104;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v50 = 0;
LABEL_74:
                objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("contentProtection"));
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                if (v79 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v75 = v79;
                    goto LABEL_77;
                  }
                  if (v116)
                  {
                    v105 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v93 = *MEMORY[0x1E0D025B8];
                    v126 = *MEMORY[0x1E0CB2D50];
                    v81 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contentProtection"));
                    v127 = v81;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    v94 = (id)objc_msgSend(v105, "initWithDomain:code:userInfo:", v93, 2, v80);
                    v24 = 0;
                    v75 = 0;
                    *v116 = v94;
                    goto LABEL_81;
                  }
                  v75 = 0;
                  v24 = 0;
                }
                else
                {
                  v75 = 0;
LABEL_77:
                  objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("personaId"));
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v80 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v81 = 0;
                    goto LABEL_80;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v81 = v80;
LABEL_80:
                    v24 = -[BMProactiveHarvestingParsecSearch initWithResultID:domainID:absoluteTimestamp:userInput:completedQuery:entities:uniqueID:contentProtection:personaId:](v109, "initWithResultID:domainID:absoluteTimestamp:userInput:completedQuery:entities:uniqueID:contentProtection:personaId:", a4, v114, v111, v113, v110, v118, v50, v75, v81);
                    v109 = v24;
                  }
                  else
                  {
                    if (v116)
                    {
                      v103 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v101 = *MEMORY[0x1E0D025B8];
                      v124 = *MEMORY[0x1E0CB2D50];
                      v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("personaId"));
                      v125 = v95;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1);
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                      *v116 = (id)objc_msgSend(v103, "initWithDomain:code:userInfo:", v101, 2, v96);

                    }
                    v81 = 0;
                    v24 = 0;
                  }
LABEL_81:

LABEL_82:
                  v37 = v117;
                }

LABEL_84:
                v8 = v107;
LABEL_85:

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v50 = v46;
                  goto LABEL_74;
                }
                if (v116)
                {
                  v102 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v91 = *MEMORY[0x1E0D025B8];
                  v128 = *MEMORY[0x1E0CB2D50];
                  v75 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("uniqueID"));
                  v129 = v75;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  v92 = (id)objc_msgSend(v102, "initWithDomain:code:userInfo:", v91, 2, v79);
                  v24 = 0;
                  v50 = 0;
                  *v116 = v92;
                  goto LABEL_82;
                }
                v50 = 0;
                v24 = 0;
                v8 = v107;
                v37 = v117;
              }

LABEL_87:
              self = v109;
LABEL_88:
              v21 = v114;
              v31 = (void *)v111;

LABEL_89:
              v7 = v108;
LABEL_90:

LABEL_91:
              goto LABEL_92;
            }
          }
          v69 = v116;
          if (v116)
          {
            v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v71 = *MEMORY[0x1E0D025B8];
            v132 = *MEMORY[0x1E0CB2D50];
            v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("entities"));
            v133 = v46;
            v72 = (void *)MEMORY[0x1E0C99D80];
            v73 = &v133;
            v74 = &v132;
LABEL_59:
            objc_msgSend(v72, "dictionaryWithObjects:forKeys:count:", v73, v74, 1);
            v75 = (id)objc_claimAutoreleasedReturnValue();
            v76 = v71;
            v37 = v117;
            v24 = 0;
            *v69 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v76, 2, v75);
            v50 = v38;
            a4 = v104;
            v6 = v106;
            goto LABEL_84;
          }
LABEL_65:
          v24 = 0;
          v50 = v38;
          a4 = v104;
          v6 = v106;
LABEL_66:
          v8 = v107;
          goto LABEL_87;
        }
        if (v116)
        {
          v60 = v8;
          v61 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v62 = *MEMORY[0x1E0D025B8];
          v137 = *MEMORY[0x1E0CB2D50];
          v63 = a4;
          v64 = objc_alloc(MEMORY[0x1E0CB3940]);
          v99 = objc_opt_class();
          v65 = v64;
          a4 = v63;
          v38 = (id)objc_msgSend(v65, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v99, CFSTR("completedQuery"));
          v138 = v38;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
          v66 = objc_claimAutoreleasedReturnValue();
          v67 = v61;
          v8 = v60;
          v68 = v62;
          v37 = v117;
          v118 = (void *)v66;
          v24 = 0;
          v110 = 0;
          *v116 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v68, 2);
          goto LABEL_88;
        }
        v110 = 0;
        v24 = 0;
LABEL_101:
        v21 = v114;
        v31 = (void *)v111;
        goto LABEL_90;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (objc_class *)MEMORY[0x1E0C99D68];
        v12 = v8;
        v13 = v10;
        v14 = [v11 alloc];
        objc_msgSend(v13, "doubleValue");
        v16 = v15;

        v8 = v12;
        v17 = (id)objc_msgSend(v14, "initWithTimeIntervalSinceReferenceDate:", v16);
LABEL_16:
        v111 = (uint64_t)v17;
        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v34, "dateFromString:", v10);
        v111 = objc_claimAutoreleasedReturnValue();

        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v10;
        goto LABEL_16;
      }
      if (v116)
      {
        v83 = v8;
        v84 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v85 = *MEMORY[0x1E0D025B8];
        v141 = *MEMORY[0x1E0CB2D50];
        v86 = a4;
        v87 = objc_alloc(MEMORY[0x1E0CB3940]);
        v100 = objc_opt_class();
        v88 = v87;
        a4 = v86;
        v113 = (id)objc_msgSend(v88, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), v100, CFSTR("absoluteTimestamp"));
        v142 = v113;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
        v89 = objc_claimAutoreleasedReturnValue();
        v90 = v84;
        v8 = v83;
        v112 = (void *)v89;
        v31 = 0;
        v24 = 0;
        *v116 = (id)objc_msgSend(v90, "initWithDomain:code:userInfo:", v85, 2);
        v21 = v114;
        goto LABEL_91;
      }
      v31 = 0;
      v24 = 0;
      v21 = v114;
LABEL_92:

      goto LABEL_93;
    }
    if (v116)
    {
      v25 = v8;
      v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v27 = *MEMORY[0x1E0D025B8];
      v143 = *MEMORY[0x1E0CB2D50];
      v28 = a4;
      v29 = objc_alloc(MEMORY[0x1E0CB3940]);
      v97 = objc_opt_class();
      v30 = v29;
      a4 = v28;
      v31 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v97, CFSTR("domainID"));
      v144 = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v26;
      v8 = v25;
      v115 = (void *)v32;
      v21 = 0;
      v24 = 0;
      *v116 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v27, 2);
      goto LABEL_92;
    }
    v21 = 0;
    v24 = 0;
LABEL_93:

    goto LABEL_94;
  }
  if (a4)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v19 = *MEMORY[0x1E0D025B8];
    v145 = *MEMORY[0x1E0CB2D50];
    v20 = a4;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("resultID"));
    v146[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v146, &v145, 1);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v18;
    v8 = (void *)v22;
    a4 = 0;
    v24 = 0;
    *v20 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v19, 2, v22);
    goto LABEL_93;
  }
  v24 = 0;
LABEL_94:

  return v24;
}

- (id)_entitiesJSONArray
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
  -[BMProactiveHarvestingParsecSearch entities](self, "entities", 0);
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
  -[BMProactiveHarvestingParsecSearch resultID](self, "resultID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingParsecSearch domainID](self, "domainID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingParsecSearch absoluteTimestamp](self, "absoluteTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingParsecSearch absoluteTimestamp](self, "absoluteTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  -[BMProactiveHarvestingParsecSearch userInput](self, "userInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingParsecSearch completedQuery](self, "completedQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingParsecSearch _entitiesJSONArray](self, "_entitiesJSONArray");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingParsecSearch uniqueID](self, "uniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingParsecSearch contentProtection](self, "contentProtection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingParsecSearch personaId](self, "personaId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = CFSTR("resultID");
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
  v33[3] = CFSTR("userInput");
  v17 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v4;
  v24 = (void *)v17;
  v34[3] = v17;
  v33[4] = CFSTR("completedQuery");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v8;
  v34[4] = v18;
  v33[5] = CFSTR("entities");
  v19 = v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[5] = v19;
  v33[6] = CFSTR("uniqueID");
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
    -[BMProactiveHarvestingParsecSearch resultID](self, "resultID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resultID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProactiveHarvestingParsecSearch resultID](self, "resultID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resultID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_33;
    }
    -[BMProactiveHarvestingParsecSearch domainID](self, "domainID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domainID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMProactiveHarvestingParsecSearch domainID](self, "domainID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domainID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_33;
    }
    -[BMProactiveHarvestingParsecSearch absoluteTimestamp](self, "absoluteTimestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMProactiveHarvestingParsecSearch absoluteTimestamp](self, "absoluteTimestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_33;
    }
    -[BMProactiveHarvestingParsecSearch userInput](self, "userInput");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInput");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMProactiveHarvestingParsecSearch userInput](self, "userInput");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userInput");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_33;
    }
    -[BMProactiveHarvestingParsecSearch completedQuery](self, "completedQuery");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "completedQuery");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMProactiveHarvestingParsecSearch completedQuery](self, "completedQuery");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "completedQuery");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_33;
    }
    -[BMProactiveHarvestingParsecSearch entities](self, "entities");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entities");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMProactiveHarvestingParsecSearch entities](self, "entities");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entities");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_33;
    }
    -[BMProactiveHarvestingParsecSearch uniqueID](self, "uniqueID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMProactiveHarvestingParsecSearch uniqueID](self, "uniqueID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_33;
    }
    -[BMProactiveHarvestingParsecSearch contentProtection](self, "contentProtection");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentProtection");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMProactiveHarvestingParsecSearch contentProtection](self, "contentProtection");
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
    -[BMProactiveHarvestingParsecSearch personaId](self, "personaId");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personaId");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56 == v57)
    {
      v12 = 1;
    }
    else
    {
      -[BMProactiveHarvestingParsecSearch personaId](self, "personaId");
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

- (NSString)resultID
{
  return self->_resultID;
}

- (NSString)domainID
{
  return self->_domainID;
}

- (NSString)userInput
{
  return self->_userInput;
}

- (NSString)completedQuery
{
  return self->_completedQuery;
}

- (NSArray)entities
{
  return self->_entities;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
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
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_completedQuery, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_domainID, 0);
  objc_storeStrong((id *)&self->_resultID, 0);
}

+ (unsigned)latestDataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 2)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMProactiveHarvestingParsecSearch initByReadFrom:]([BMProactiveHarvestingParsecSearch alloc], "initByReadFrom:", v6);
    v7[8] = 2;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("resultID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domainID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 3, 0, 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userInput"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("completedQuery"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("entities_json"), 5, 1, &__block_literal_global_198_19845);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueID"), 2, 0, 7, 13, 0);
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
  return &unk_1E5F1B9D0;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("resultID"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domainID"), 2, 13, 0, v2);
  v13[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 3, 0, 0);
  v13[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userInput"), 4, 13, 0);
  v13[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("completedQuery"), 5, 13, 0);
  v13[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("entities"), 6, 14, objc_opt_class());
  v13[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueID"), 7, 13, 0);
  v13[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentProtection"), 8, 13, 0);
  v13[7] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("personaId"), 9, 13, 0);
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __44__BMProactiveHarvestingParsecSearch_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_entitiesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
