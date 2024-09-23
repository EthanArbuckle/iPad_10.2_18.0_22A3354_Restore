@implementation BMSafariBrowsingAssistantDimensionContext

- (BMSafariBrowsingAssistantDimensionContext)initWithWebpageViewIdentifier:(id)a3 systemLocale:(id)a4 currentCountry:(id)a5 build:(id)a6 osType:(id)a7 productType:(id)a8 buildType:(int)a9 duEnabled:(id)a10 searchBarPosition:(int)a11 prefixStoreVersion:(id)a12 trialExperiment:(id)a13
{
  id v20;
  id v21;
  id v22;
  BMSafariBrowsingAssistantDimensionContext *v23;
  id obj;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v30 = a4;
  v29 = a5;
  v28 = a6;
  v27 = a7;
  obj = a8;
  v26 = a8;
  v20 = a10;
  v21 = a12;
  v22 = a13;
  v32.receiver = self;
  v32.super_class = (Class)BMSafariBrowsingAssistantDimensionContext;
  v23 = -[BMEventBase init](&v32, sel_init);
  if (v23)
  {
    v23->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v23->_webpageViewIdentifier, a3);
    objc_storeStrong((id *)&v23->_systemLocale, a4);
    objc_storeStrong((id *)&v23->_currentCountry, a5);
    objc_storeStrong((id *)&v23->_build, a6);
    objc_storeStrong((id *)&v23->_osType, a7);
    objc_storeStrong((id *)&v23->_productType, obj);
    v23->_buildType = a9;
    if (v20)
    {
      v23->_hasDuEnabled = 1;
      v23->_duEnabled = objc_msgSend(v20, "BOOLValue");
    }
    else
    {
      v23->_hasDuEnabled = 0;
      v23->_duEnabled = 0;
    }
    v23->_searchBarPosition = a11;
    objc_storeStrong((id *)&v23->_prefixStoreVersion, a12);
    objc_storeStrong((id *)&v23->_trialExperiment, a13);
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
  id v14;
  id v15;
  void *v16;

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSafariBrowsingAssistantDimensionContext webpageViewIdentifier](self, "webpageViewIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantDimensionContext systemLocale](self, "systemLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantDimensionContext currentCountry](self, "currentCountry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantDimensionContext build](self, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantDimensionContext osType](self, "osType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantDimensionContext productType](self, "productType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariBrowsingAssistantBuildTypeAsString(-[BMSafariBrowsingAssistantDimensionContext buildType](self, "buildType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariBrowsingAssistantDimensionContext duEnabled](self, "duEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariBrowsingAssistantSearchBarPositionAsString(-[BMSafariBrowsingAssistantDimensionContext searchBarPosition](self, "searchBarPosition"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantDimensionContext prefixStoreVersion](self, "prefixStoreVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantDimensionContext trialExperiment](self, "trialExperiment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "initWithFormat:", CFSTR("BMSafariBrowsingAssistantDimensionContext with webpageViewIdentifier: %@, systemLocale: %@, currentCountry: %@, build: %@, osType: %@, productType: %@, buildType: %@, duEnabled: %@, searchBarPosition: %@, prefixStoreVersion: %@, trialExperiment: %@"), v16, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v15;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSafariBrowsingAssistantDimensionContext *v5;
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
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  uint64_t v21;
  uint64_t v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  void *v40;
  int *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  NSArray *trialExperiment;
  int v47;
  BMSafariBrowsingAssistantDimensionContext *v48;
  objc_super v50;
  uint64_t v51;
  uint64_t v52;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMSafariBrowsingAssistantDimensionContext;
  v5 = -[BMEventBase init](&v50, sel_init);
  if (!v5)
    goto LABEL_74;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
    v11 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      while (1)
      {
        v15 = *v7;
        v16 = *(_QWORD *)&v4[v15];
        if (v16 == -1 || v16 >= *(_QWORD *)&v4[*v8])
          break;
        v17 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v16);
        *(_QWORD *)&v4[v15] = v16 + 1;
        v14 |= (unint64_t)(v17 & 0x7F) << v12;
        if ((v17 & 0x80) == 0)
          goto LABEL_13;
        v12 += 7;
        v18 = v13++ >= 9;
        if (v18)
        {
          v14 = 0;
          v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v19 = v4[*v9];
      if (v4[*v9])
        v14 = 0;
LABEL_15:
      if (v19 || (v14 & 7) == 4)
        break;
      switch((v14 >> 3))
      {
        case 1u:
          PBReaderReadData();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = v10[273];
          goto LABEL_50;
        case 2u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 40;
          goto LABEL_50;
        case 3u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 48;
          goto LABEL_50;
        case 4u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 56;
          goto LABEL_50;
        case 5u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 64;
          goto LABEL_50;
        case 6u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 72;
          goto LABEL_50;
        case 7u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          while (2)
          {
            v26 = *v7;
            v27 = *(_QWORD *)&v4[v26];
            if (v27 == -1 || v27 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v27);
              *(_QWORD *)&v4[v26] = v27 + 1;
              v25 |= (unint64_t)(v28 & 0x7F) << v23;
              if (v28 < 0)
              {
                v23 += 7;
                v18 = v24++ >= 9;
                if (v18)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v25) = 0;
LABEL_57:
          if (v25 >= 5)
            LODWORD(v25) = 0;
          v44 = 24;
          goto LABEL_70;
        case 8u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          v5->_hasDuEnabled = 1;
          while (2)
          {
            v32 = *v7;
            v33 = *(_QWORD *)&v4[v32];
            if (v33 == -1 || v33 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v33);
              *(_QWORD *)&v4[v32] = v33 + 1;
              v31 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                v18 = v30++ >= 9;
                if (v18)
                {
                  v31 = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v31 = 0;
LABEL_63:
          v5->_duEnabled = v31 != 0;
          continue;
        case 9u:
          v35 = 0;
          v36 = 0;
          v25 = 0;
          break;
        case 0xAu:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 80;
LABEL_50:
          v40 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        case 0xBu:
          v51 = 0;
          v52 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_76;
          v41 = v10;
          v42 = -[BMSafariBrowsingAssistantTrialExperiment initByReadFrom:]([BMSafariBrowsingAssistantTrialExperiment alloc], "initByReadFrom:", v4);
          if (!v42)
            goto LABEL_76;
          v43 = v42;
          objc_msgSend(v6, "addObject:", v42);
          PBReaderRecallMark();

          v10 = v41;
          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_76:

          goto LABEL_73;
      }
      while (1)
      {
        v37 = *v7;
        v38 = *(_QWORD *)&v4[v37];
        if (v38 == -1 || v38 >= *(_QWORD *)&v4[*v8])
          break;
        v39 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v38);
        *(_QWORD *)&v4[v37] = v38 + 1;
        v25 |= (unint64_t)(v39 & 0x7F) << v35;
        if ((v39 & 0x80) == 0)
          goto LABEL_65;
        v35 += 7;
        v18 = v36++ >= 9;
        if (v18)
        {
          LODWORD(v25) = 0;
          goto LABEL_67;
        }
      }
      v4[*v9] = 1;
LABEL_65:
      if (v4[*v9])
        LODWORD(v25) = 0;
LABEL_67:
      if (v25 >= 3)
        LODWORD(v25) = 0;
      v44 = 28;
LABEL_70:
      *(_DWORD *)((char *)&v5->super.super.isa + v44) = v25;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v45 = objc_msgSend(v6, "copy");
  trialExperiment = v5->_trialExperiment;
  v5->_trialExperiment = (NSArray *)v45;

  v47 = v4[*v9];
  if (v47)
LABEL_73:
    v48 = 0;
  else
LABEL_74:
    v48 = v5;

  return v48;
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
  if (self->_webpageViewIdentifier)
    PBDataWriterWriteDataField();
  if (self->_systemLocale)
    PBDataWriterWriteStringField();
  if (self->_currentCountry)
    PBDataWriterWriteStringField();
  if (self->_build)
    PBDataWriterWriteStringField();
  if (self->_osType)
    PBDataWriterWriteStringField();
  if (self->_productType)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasDuEnabled)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  if (self->_prefixStoreVersion)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_trialExperiment;
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

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSafariBrowsingAssistantDimensionContext writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSafariBrowsingAssistantDimensionContext)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  id *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  BMSafariBrowsingAssistantDimensionContext *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  id v61;
  BMSafariBrowsingAssistantTrialExperiment *v62;
  BMSafariBrowsingAssistantTrialExperiment *v63;
  id v64;
  int v65;
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  id *v70;
  id v71;
  id v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  id v78;
  id v79;
  uint64_t v80;
  id v81;
  id v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  id v88;
  id v89;
  uint64_t v90;
  id v91;
  id v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  id v98;
  id v99;
  uint64_t v100;
  id v101;
  id v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  id *v107;
  id v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  id *v113;
  void *v114;
  id v115;
  uint64_t v116;
  void *v117;
  id *v118;
  uint64_t *v119;
  void *v120;
  void *v121;
  id v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  id v127;
  id v128;
  uint64_t v129;
  id v130;
  id v131;
  void *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  id v136;
  id v137;
  uint64_t v138;
  id v139;
  id v140;
  void *v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  id *v155;
  void *v156;
  id v157;
  void *v158;
  void *v159;
  id v160;
  id v161;
  void *v162;
  id v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  id v168;
  void *v169;
  id v170;
  void *v171;
  id *v172;
  id v173;
  id v174;
  void *v175;
  void *v176;
  id v177;
  void *v178;
  id v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  uint64_t v185;
  id v186;
  uint64_t v187;
  id v188;
  _BYTE v189[128];
  uint64_t v190;
  void *v191;
  uint64_t v192;
  id v193;
  uint64_t v194;
  id v195;
  uint64_t v196;
  id v197;
  uint64_t v198;
  id v199;
  uint64_t v200;
  id v201;
  uint64_t v202;
  id v203;
  uint64_t v204;
  id v205;
  uint64_t v206;
  id *v207;
  uint64_t v208;
  id v209;
  uint64_t v210;
  _QWORD v211[3];

  v211[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("webpageViewIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = *MEMORY[0x1E0D025B8];
        v210 = *MEMORY[0x1E0CB2D50];
        v30 = v6;
        v31 = objc_alloc(MEMORY[0x1E0CB3940]);
        v146 = objc_opt_class();
        v32 = v31;
        v6 = v30;
        v33 = objc_msgSend(v32, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), v146, CFSTR("webpageViewIdentifier"));
        v211[0] = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v211, &v210, 1);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v28;
        v8 = (void *)v34;
        v36 = v29;
        v9 = (id)v33;
        v7 = 0;
        v37 = 0;
        *a4 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v36, 2, v34);
        goto LABEL_111;
      }
      v7 = 0;
      v37 = 0;
      goto LABEL_112;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("systemLocale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v38 = v8;
        v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v40 = *MEMORY[0x1E0D025B8];
        v208 = *MEMORY[0x1E0CB2D50];
        v177 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("systemLocale"));
        v209 = v177;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v209, &v208, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v39;
        v8 = v38;
        v43 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v40, 2, v41);
        v9 = 0;
        v37 = 0;
        *a4 = v43;
        goto LABEL_110;
      }
      v9 = 0;
      v37 = 0;
      goto LABEL_111;
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("currentCountry"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v165 = v6;
      v44 = a4;
      v45 = v10;
      if (v44)
      {
        v46 = v8;
        v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v48 = v9;
        v49 = *MEMORY[0x1E0D025B8];
        v206 = *MEMORY[0x1E0CB2D50];
        v50 = v7;
        v51 = objc_alloc(MEMORY[0x1E0CB3940]);
        v147 = objc_opt_class();
        v41 = v45;
        v52 = v51;
        v7 = v50;
        a4 = (id *)objc_msgSend(v52, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v147, CFSTR("currentCountry"));
        v207 = a4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v207, &v206, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v47;
        v8 = v46;
        v54 = v49;
        v9 = v48;
        v177 = 0;
        v37 = 0;
        *v44 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2, v11);
        v6 = v165;
        goto LABEL_109;
      }
      v177 = 0;
      v37 = 0;
      v41 = v10;
      v6 = v165;
      goto LABEL_110;
    }
    v175 = v10;
    v177 = v10;
  }
  else
  {
    v175 = v10;
    v177 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("build"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = v11;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v66 = v8;
        v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v68 = v9;
        v69 = *MEMORY[0x1E0D025B8];
        v204 = *MEMORY[0x1E0CB2D50];
        v166 = v6;
        v70 = a4;
        v71 = v7;
        v72 = objc_alloc(MEMORY[0x1E0CB3940]);
        v148 = objc_opt_class();
        v73 = v72;
        v7 = v71;
        v174 = (id)objc_msgSend(v73, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v148, CFSTR("build"));
        v205 = v174;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v205, &v204, 1);
        v74 = objc_claimAutoreleasedReturnValue();
        v75 = v67;
        v8 = v66;
        v12 = (void *)v74;
        v76 = v69;
        v9 = v68;
        a4 = 0;
        v37 = 0;
        *v70 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v76, 2, v74);
        v6 = v166;
        v41 = v175;
        goto LABEL_108;
      }
      v37 = 0;
      v41 = v175;
      goto LABEL_109;
    }
    v172 = v11;
  }
  else
  {
    v172 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("osType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = v12;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v174 = 0;
        v37 = 0;
        v41 = v175;
        a4 = v172;
        goto LABEL_108;
      }
      v77 = v8;
      v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v79 = v9;
      v80 = *MEMORY[0x1E0D025B8];
      v202 = *MEMORY[0x1E0CB2D50];
      v81 = v7;
      v82 = objc_alloc(MEMORY[0x1E0CB3940]);
      v149 = objc_opt_class();
      v83 = v82;
      v7 = v81;
      v173 = (id)objc_msgSend(v83, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v149, CFSTR("osType"));
      v203 = v173;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v203, &v202, 1);
      v84 = objc_claimAutoreleasedReturnValue();
      v85 = v78;
      v8 = v77;
      v12 = v178;
      v86 = v80;
      v9 = v79;
      v171 = (void *)v84;
      v174 = 0;
      v37 = 0;
      *a4 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v86, 2);
      goto LABEL_120;
    }
    v174 = v12;
  }
  else
  {
    v174 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("productType"));
  v13 = objc_claimAutoreleasedReturnValue();
  v171 = (void *)v13;
  if (v13)
  {
    v14 = (void *)v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v173 = v14;
        goto LABEL_19;
      }
      if (a4)
      {
        v87 = v8;
        v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v89 = v9;
        v90 = *MEMORY[0x1E0D025B8];
        v200 = *MEMORY[0x1E0CB2D50];
        v91 = v7;
        v92 = objc_alloc(MEMORY[0x1E0CB3940]);
        v150 = objc_opt_class();
        v93 = v92;
        v7 = v91;
        v170 = (id)objc_msgSend(v93, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v150, CFSTR("productType"));
        v201 = v170;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v201, &v200, 1);
        v94 = objc_claimAutoreleasedReturnValue();
        v95 = v88;
        v8 = v87;
        v12 = v178;
        v96 = v90;
        v9 = v89;
        v169 = (void *)v94;
        v173 = 0;
        v37 = 0;
        *a4 = (id)objc_msgSend(v95, "initWithDomain:code:userInfo:", v96, 2);
        v41 = v175;
        v11 = v176;
        a4 = v172;
        goto LABEL_106;
      }
      v173 = 0;
      v37 = 0;
LABEL_120:
      v41 = v175;
      v11 = v176;
      a4 = v172;
      goto LABEL_107;
    }
  }
  v173 = 0;
LABEL_19:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("buildType"));
  v15 = objc_claimAutoreleasedReturnValue();
  v169 = (void *)v15;
  if (v15 && (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v170 = v16;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v159 = v8;
          v127 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v128 = v9;
          v129 = *MEMORY[0x1E0D025B8];
          v198 = *MEMORY[0x1E0CB2D50];
          v130 = v7;
          v131 = objc_alloc(MEMORY[0x1E0CB3940]);
          v152 = objc_opt_class();
          v132 = v131;
          v7 = v130;
          v168 = (id)objc_msgSend(v132, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), v152, CFSTR("buildType"));
          v199 = v168;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v199, &v198, 1);
          v133 = objc_claimAutoreleasedReturnValue();
          v134 = v127;
          v8 = v159;
          v135 = v129;
          v9 = v128;
          v167 = (void *)v133;
          v170 = 0;
          v37 = 0;
          *a4 = (id)objc_msgSend(v134, "initWithDomain:code:userInfo:", v135, 2);
          v41 = v175;
          v11 = v176;
          a4 = v172;
          goto LABEL_105;
        }
        v170 = 0;
        v37 = 0;
        v41 = v175;
        a4 = v172;
        goto LABEL_106;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariBrowsingAssistantBuildTypeFromString(v16));
      v170 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v170 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("duEnabled"));
  v17 = objc_claimAutoreleasedReturnValue();
  v167 = (void *)v17;
  if (v17 && (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v97 = v8;
        v98 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v99 = v9;
        v100 = *MEMORY[0x1E0D025B8];
        v196 = *MEMORY[0x1E0CB2D50];
        v101 = v7;
        v102 = objc_alloc(MEMORY[0x1E0CB3940]);
        v151 = objc_opt_class();
        v103 = v102;
        v7 = v101;
        v11 = v176;
        v163 = (id)objc_msgSend(v103, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v151, CFSTR("duEnabled"));
        v197 = v163;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v197, &v196, 1);
        v104 = objc_claimAutoreleasedReturnValue();
        v105 = v98;
        v8 = v97;
        v12 = v178;
        v106 = v100;
        v9 = v99;
        v162 = (void *)v104;
        v168 = 0;
        v37 = 0;
        *a4 = (id)objc_msgSend(v105, "initWithDomain:code:userInfo:", v106, 2);
        v41 = v175;
        a4 = v172;
        goto LABEL_104;
      }
      v168 = 0;
      v37 = 0;
      v41 = v175;
      a4 = v172;
      goto LABEL_105;
    }
    v168 = v18;
  }
  else
  {
    v168 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("searchBarPosition"));
  v19 = objc_claimAutoreleasedReturnValue();
  v162 = (void *)v19;
  v158 = v8;
  v160 = v7;
  if (v19 && (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = a4;
      v163 = v20;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v136 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v137 = v9;
          v138 = *MEMORY[0x1E0D025B8];
          v194 = *MEMORY[0x1E0CB2D50];
          v139 = v7;
          v140 = objc_alloc(MEMORY[0x1E0CB3940]);
          v153 = objc_opt_class();
          v141 = v140;
          v7 = v139;
          v161 = (id)objc_msgSend(v141, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), v153, CFSTR("searchBarPosition"));
          v195 = v161;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v195, &v194, 1);
          v142 = objc_claimAutoreleasedReturnValue();
          v143 = v136;
          v8 = v158;
          v144 = v138;
          v9 = v137;
          v156 = (void *)v142;
          v163 = 0;
          v37 = 0;
          *a4 = (id)objc_msgSend(v143, "initWithDomain:code:userInfo:", v144, 2);
          v41 = v175;
          v11 = v176;
          a4 = v172;
          goto LABEL_103;
        }
        v163 = 0;
        v37 = 0;
        v41 = v175;
        a4 = v172;
        goto LABEL_104;
      }
      v21 = a4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariBrowsingAssistantSearchBarPositionFromString(v20));
      v163 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v21 = a4;
    v163 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("prefixStoreVersion"));
  v22 = objc_claimAutoreleasedReturnValue();
  v156 = (void *)v22;
  v157 = v9;
  if (v22 && (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v21)
      {
        v161 = 0;
        v37 = 0;
        v41 = v175;
        a4 = v172;
        v7 = v160;
        goto LABEL_103;
      }
      v107 = v21;
      v108 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v109 = *MEMORY[0x1E0D025B8];
      v192 = *MEMORY[0x1E0CB2D50];
      v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("prefixStoreVersion"));
      v193 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v193, &v192, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = v108;
      v7 = v160;
      v111 = v109;
      v12 = v178;
      v37 = 0;
      v161 = 0;
      *v107 = (id)objc_msgSend(v110, "initWithDomain:code:userInfo:", v111, 2, v55);
      goto LABEL_100;
    }
    v161 = v23;
  }
  else
  {
    v161 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trialExperiment"));
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "isEqual:", v25);

  v27 = v21;
  if (!v26)
  {
    v7 = v160;
    if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v155 = v27;
      v164 = v6;
      goto LABEL_56;
    }
    if (!v27)
    {
      v37 = 0;
      v41 = v175;
      a4 = v172;
      goto LABEL_102;
    }
    v123 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v124 = *MEMORY[0x1E0D025B8];
    v190 = *MEMORY[0x1E0CB2D50];
    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("trialExperiment"));
    v191 = v55;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = v124;
    v7 = v160;
    *v27 = (id)objc_msgSend(v123, "initWithDomain:code:userInfo:", v126, 2, v125);

    v12 = v178;
    v37 = 0;
LABEL_100:
    a4 = v172;
    goto LABEL_101;
  }
  v155 = v21;
  v164 = v6;

  v24 = 0;
LABEL_56:
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v24, "count"));
  v181 = 0u;
  v182 = 0u;
  v183 = 0u;
  v184 = 0u;
  v24 = v24;
  v56 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v181, v189, 16);
  if (!v56)
    goto LABEL_66;
  v57 = v56;
  v58 = *(_QWORD *)v182;
  while (2)
  {
    for (i = 0; i != v57; ++i)
    {
      if (*(_QWORD *)v182 != v58)
        objc_enumerationMutation(v24);
      v60 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v112 = v164;
        v7 = v160;
        v11 = v176;
        v113 = v155;
        if (v155)
        {
          v114 = v160;
          v115 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v116 = *MEMORY[0x1E0D025B8];
          v187 = *MEMORY[0x1E0CB2D50];
          v61 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("trialExperiment"));
          v188 = v61;
          v117 = (void *)MEMORY[0x1E0C99D80];
          v118 = &v188;
          v119 = &v187;
LABEL_94:
          objc_msgSend(v117, "dictionaryWithObjects:forKeys:count:", v118, v119, 1);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v121 = v115;
          v7 = v114;
          v11 = v176;
          *v113 = (id)objc_msgSend(v121, "initWithDomain:code:userInfo:", v116, 2, v120);
LABEL_98:

          v12 = v178;
        }
LABEL_99:

        v37 = 0;
        v6 = v112;
        goto LABEL_100;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v112 = v164;
        v7 = v160;
        v11 = v176;
        v113 = v155;
        if (v155)
        {
          v114 = v160;
          v115 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v116 = *MEMORY[0x1E0D025B8];
          v185 = *MEMORY[0x1E0CB2D50];
          v61 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("trialExperiment"));
          v186 = v61;
          v117 = (void *)MEMORY[0x1E0C99D80];
          v118 = &v186;
          v119 = &v185;
          goto LABEL_94;
        }
        goto LABEL_99;
      }
      v61 = v60;
      v62 = [BMSafariBrowsingAssistantTrialExperiment alloc];
      v180 = 0;
      v63 = -[BMSafariBrowsingAssistantTrialExperiment initWithJSONDictionary:error:](v62, "initWithJSONDictionary:error:", v61, &v180);
      v64 = v180;
      if (v64)
      {
        v120 = v64;
        if (v155)
          *v155 = objc_retainAutorelease(v64);

        v112 = v164;
        v7 = v160;
        v11 = v176;
        goto LABEL_98;
      }
      objc_msgSend(v55, "addObject:", v63);

      v12 = v178;
    }
    v57 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v181, v189, 16);
    if (v57)
      continue;
    break;
  }
LABEL_66:

  v65 = objc_msgSend(v170, "intValue");
  v7 = v160;
  LODWORD(v154) = objc_msgSend(v163, "intValue");
  LODWORD(v145) = v65;
  a4 = v172;
  v37 = -[BMSafariBrowsingAssistantDimensionContext initWithWebpageViewIdentifier:systemLocale:currentCountry:build:osType:productType:buildType:duEnabled:searchBarPosition:prefixStoreVersion:trialExperiment:](self, "initWithWebpageViewIdentifier:systemLocale:currentCountry:build:osType:productType:buildType:duEnabled:searchBarPosition:prefixStoreVersion:trialExperiment:", v160, v157, v177, v172, v174, v173, v145, v168, v154, v161, v55);
  self = v37;
  v6 = v164;
  v11 = v176;
LABEL_101:

  v41 = v175;
LABEL_102:

  v9 = v157;
  v8 = v158;
LABEL_103:

LABEL_104:
LABEL_105:

LABEL_106:
LABEL_107:

LABEL_108:
LABEL_109:

LABEL_110:
LABEL_111:

LABEL_112:
  return v37;
}

- (id)_trialExperimentJSONArray
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
  -[BMSafariBrowsingAssistantDimensionContext trialExperiment](self, "trialExperiment", 0);
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
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[11];
  _QWORD v38[13];

  v38[11] = *MEMORY[0x1E0C80C00];
  -[BMSafariBrowsingAssistantDimensionContext webpageViewIdentifier](self, "webpageViewIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMSafariBrowsingAssistantDimensionContext systemLocale](self, "systemLocale");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantDimensionContext currentCountry](self, "currentCountry");
  v6 = objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantDimensionContext build](self, "build");
  v7 = objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantDimensionContext osType](self, "osType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantDimensionContext productType](self, "productType");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariBrowsingAssistantDimensionContext buildType](self, "buildType"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (-[BMSafariBrowsingAssistantDimensionContext hasDuEnabled](self, "hasDuEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariBrowsingAssistantDimensionContext duEnabled](self, "duEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariBrowsingAssistantDimensionContext searchBarPosition](self, "searchBarPosition"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantDimensionContext prefixStoreVersion](self, "prefixStoreVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantDimensionContext _trialExperimentJSONArray](self, "_trialExperimentJSONArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = CFSTR("webpageViewIdentifier");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v12;
  v38[0] = v12;
  v37[1] = CFSTR("systemLocale");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v13;
  v38[1] = v13;
  v37[2] = CFSTR("currentCountry");
  v14 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v14;
  v38[2] = v14;
  v37[3] = CFSTR("build");
  v15 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v4;
  v25 = (void *)v15;
  v38[3] = v15;
  v37[4] = CFSTR("osType");
  v16 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v5;
  v24 = (void *)v16;
  v38[4] = v16;
  v37[5] = CFSTR("productType");
  v17 = v36;
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v6;
  v38[5] = v17;
  v37[6] = CFSTR("buildType");
  v18 = v35;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v7;
  v38[6] = v18;
  v37[7] = CFSTR("duEnabled");
  v19 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[7] = v19;
  v37[8] = CFSTR("searchBarPosition");
  v20 = v34;
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[8] = v20;
  v37[9] = CFSTR("prefixStoreVersion");
  v21 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[9] = v21;
  v37[10] = CFSTR("trialExperiment");
  v22 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[10] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 11);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_27;
  }
  else
  {

    if (v10)
      goto LABEL_27;
  }

LABEL_27:
  if (v34)
  {
    if (v9)
      goto LABEL_29;
  }
  else
  {

    if (v9)
      goto LABEL_29;
  }

LABEL_29:
  if (!v35)

  if (!v36)
  if (!v8)

  if (v30)
  {
    if (v31)
      goto LABEL_37;
  }
  else
  {

    if (v31)
    {
LABEL_37:
      if (v32)
        goto LABEL_38;
LABEL_46:

      if (v33)
        goto LABEL_39;
LABEL_47:

      goto LABEL_39;
    }
  }

  if (!v32)
    goto LABEL_46;
LABEL_38:
  if (!v33)
    goto LABEL_47;
LABEL_39:

  return v29;
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
  int v43;
  int v44;
  int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSafariBrowsingAssistantDimensionContext webpageViewIdentifier](self, "webpageViewIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "webpageViewIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSafariBrowsingAssistantDimensionContext webpageViewIdentifier](self, "webpageViewIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "webpageViewIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_36;
    }
    -[BMSafariBrowsingAssistantDimensionContext systemLocale](self, "systemLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemLocale");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSafariBrowsingAssistantDimensionContext systemLocale](self, "systemLocale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "systemLocale");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_36;
    }
    -[BMSafariBrowsingAssistantDimensionContext currentCountry](self, "currentCountry");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentCountry");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSafariBrowsingAssistantDimensionContext currentCountry](self, "currentCountry");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentCountry");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_36;
    }
    -[BMSafariBrowsingAssistantDimensionContext build](self, "build");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "build");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMSafariBrowsingAssistantDimensionContext build](self, "build");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "build");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_36;
    }
    -[BMSafariBrowsingAssistantDimensionContext osType](self, "osType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "osType");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMSafariBrowsingAssistantDimensionContext osType](self, "osType");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "osType");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_36;
    }
    -[BMSafariBrowsingAssistantDimensionContext productType](self, "productType");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "productType");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMSafariBrowsingAssistantDimensionContext productType](self, "productType");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "productType");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_36;
    }
    v43 = -[BMSafariBrowsingAssistantDimensionContext buildType](self, "buildType");
    if (v43 != objc_msgSend(v5, "buildType"))
      goto LABEL_36;
    if (-[BMSafariBrowsingAssistantDimensionContext hasDuEnabled](self, "hasDuEnabled")
      || objc_msgSend(v5, "hasDuEnabled"))
    {
      if (!-[BMSafariBrowsingAssistantDimensionContext hasDuEnabled](self, "hasDuEnabled"))
        goto LABEL_36;
      if (!objc_msgSend(v5, "hasDuEnabled"))
        goto LABEL_36;
      v44 = -[BMSafariBrowsingAssistantDimensionContext duEnabled](self, "duEnabled");
      if (v44 != objc_msgSend(v5, "duEnabled"))
        goto LABEL_36;
    }
    v45 = -[BMSafariBrowsingAssistantDimensionContext searchBarPosition](self, "searchBarPosition");
    if (v45 != objc_msgSend(v5, "searchBarPosition"))
      goto LABEL_36;
    -[BMSafariBrowsingAssistantDimensionContext prefixStoreVersion](self, "prefixStoreVersion");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prefixStoreVersion");
    v47 = objc_claimAutoreleasedReturnValue();
    if (v46 == (void *)v47)
    {

    }
    else
    {
      v48 = (void *)v47;
      -[BMSafariBrowsingAssistantDimensionContext prefixStoreVersion](self, "prefixStoreVersion");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "prefixStoreVersion");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v49, "isEqual:", v50);

      if (!v51)
      {
LABEL_36:
        v12 = 0;
LABEL_37:

        goto LABEL_38;
      }
    }
    -[BMSafariBrowsingAssistantDimensionContext trialExperiment](self, "trialExperiment");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trialExperiment");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53 == v54)
    {
      v12 = 1;
    }
    else
    {
      -[BMSafariBrowsingAssistantDimensionContext trialExperiment](self, "trialExperiment");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trialExperiment");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v55, "isEqual:", v56);

    }
    goto LABEL_37;
  }
  v12 = 0;
LABEL_38:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSData)webpageViewIdentifier
{
  return self->_webpageViewIdentifier;
}

- (NSString)systemLocale
{
  return self->_systemLocale;
}

- (NSString)currentCountry
{
  return self->_currentCountry;
}

- (NSString)build
{
  return self->_build;
}

- (NSString)osType
{
  return self->_osType;
}

- (NSString)productType
{
  return self->_productType;
}

- (int)buildType
{
  return self->_buildType;
}

- (BOOL)duEnabled
{
  return self->_duEnabled;
}

- (BOOL)hasDuEnabled
{
  return self->_hasDuEnabled;
}

- (void)setHasDuEnabled:(BOOL)a3
{
  self->_hasDuEnabled = a3;
}

- (int)searchBarPosition
{
  return self->_searchBarPosition;
}

- (NSString)prefixStoreVersion
{
  return self->_prefixStoreVersion;
}

- (NSArray)trialExperiment
{
  return self->_trialExperiment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialExperiment, 0);
  objc_storeStrong((id *)&self->_prefixStoreVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_osType, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_currentCountry, 0);
  objc_storeStrong((id *)&self->_systemLocale, 0);
  objc_storeStrong((id *)&self->_webpageViewIdentifier, 0);
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

    v4 = -[BMSafariBrowsingAssistantDimensionContext initByReadFrom:]([BMSafariBrowsingAssistantDimensionContext alloc], "initByReadFrom:", v7);
    v4[5] = 0;

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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[12];

  v15[11] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("webpageViewIdentifier"), 4, 0, 1, 14, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("systemLocale"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("currentCountry"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("build"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("osType"), 2, 0, 5, 13, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("productType"), 2, 0, 6, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("buildType"), 0, 0, 7, 4, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("duEnabled"), 0, 0, 8, 12, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("searchBarPosition"), 0, 0, 9, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("prefixStoreVersion"), 2, 0, 10, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("trialExperiment_json"), 5, 1, &__block_literal_global_212_42017);
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v6;
  v15[5] = v12;
  v15[6] = v7;
  v15[7] = v14;
  v15[8] = v13;
  v15[9] = v8;
  v15[10] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 11);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D230;
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
  void *v14;
  _QWORD v15[12];

  v15[11] = *MEMORY[0x1E0C80C00];
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("webpageViewIdentifier"), 1, 14, 0);
  v15[0] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("systemLocale"), 2, 13, 0);
  v15[1] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("currentCountry"), 3, 13, 0);
  v15[2] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("build"), 4, 13, 0);
  v15[3] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("osType"), 5, 13, 0);
  v15[4] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("productType"), 6, 13, 0);
  v15[5] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("buildType"), 7, 4, 0);
  v15[6] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("duEnabled"), 8, 12, 0);
  v15[7] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("searchBarPosition"), 9, 4, 0);
  v15[8] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("prefixStoreVersion"), 10, 13, 0);
  v15[9] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("trialExperiment"), 11, 14, objc_opt_class());
  v15[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __52__BMSafariBrowsingAssistantDimensionContext_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_trialExperimentJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
