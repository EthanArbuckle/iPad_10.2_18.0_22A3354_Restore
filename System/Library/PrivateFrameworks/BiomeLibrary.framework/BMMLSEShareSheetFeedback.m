@implementation BMMLSEShareSheetFeedback

- (BMMLSEShareSheetFeedback)initWithIdentifier:(id)a3 engagementType:(int)a4 engagementIdentifier:(id)a5 visiblePeopleSuggestionCount:(id)a6 visibleAppSuggestionCount:(id)a7 airdropPeopleSuggestionShown:(id)a8 inferenceSource:(int)a9 trialIdentifier:(id)a10 timeouts:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  BMMLSEShareSheetFeedback *v22;
  unsigned int v23;
  unsigned int v24;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v27 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v26 = a10;
  v21 = a11;
  v29.receiver = self;
  v29.super_class = (Class)BMMLSEShareSheetFeedback;
  v22 = -[BMEventBase init](&v29, sel_init);
  if (v22)
  {
    v22->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v22->_identifier, a3);
    v22->_engagementType = a4;
    objc_storeStrong((id *)&v22->_engagementIdentifier, a5);
    if (v18)
    {
      v22->_hasVisiblePeopleSuggestionCount = 1;
      v23 = objc_msgSend(v18, "unsignedIntValue");
    }
    else
    {
      v23 = 0;
      v22->_hasVisiblePeopleSuggestionCount = 0;
    }
    v22->_visiblePeopleSuggestionCount = v23;
    if (v19)
    {
      v22->_hasVisibleAppSuggestionCount = 1;
      v24 = objc_msgSend(v19, "unsignedIntValue");
    }
    else
    {
      v24 = 0;
      v22->_hasVisibleAppSuggestionCount = 0;
    }
    v22->_visibleAppSuggestionCount = v24;
    if (v20)
    {
      v22->_hasAirdropPeopleSuggestionShown = 1;
      v22->_airdropPeopleSuggestionShown = objc_msgSend(v20, "BOOLValue");
    }
    else
    {
      v22->_hasAirdropPeopleSuggestionShown = 0;
      v22->_airdropPeopleSuggestionShown = 0;
    }
    v22->_inferenceSource = a9;
    objc_storeStrong((id *)&v22->_trialIdentifier, a10);
    objc_storeStrong((id *)&v22->_timeouts, a11);
  }

  return v22;
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
  -[BMMLSEShareSheetFeedback identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMMLSEShareSheetFeedbackEngagementTypeAsString(-[BMMLSEShareSheetFeedback engagementType](self, "engagementType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetFeedback engagementIdentifier](self, "engagementIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEShareSheetFeedback visiblePeopleSuggestionCount](self, "visiblePeopleSuggestionCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEShareSheetFeedback visibleAppSuggestionCount](self, "visibleAppSuggestionCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMLSEShareSheetFeedback airdropPeopleSuggestionShown](self, "airdropPeopleSuggestionShown"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMMLSEShareSheetFeedbackInferenceSourceAsString(-[BMMLSEShareSheetFeedback inferenceSource](self, "inferenceSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetFeedback trialIdentifier](self, "trialIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetFeedback timeouts](self, "timeouts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMLSEShareSheetFeedback with identifier: %@, engagementType: %@, engagementIdentifier: %@, visiblePeopleSuggestionCount: %@, visibleAppSuggestionCount: %@, airdropPeopleSuggestionShown: %@, inferenceSource: %@, trialIdentifier: %@, timeouts: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMLSEShareSheetFeedback *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  BOOL v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  void *v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  BMMLSEShareSheetFeedbackTrialIdentifier *v53;
  BMMLSEShareSheetFeedbackTrialIdentifier *trialIdentifier;
  int *v55;
  int *v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSArray *timeouts;
  int v63;
  BMMLSEShareSheetFeedback *v64;
  objc_super v66;
  uint64_t v67;
  uint64_t v68;

  v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)BMMLSEShareSheetFeedback;
  v5 = -[BMEventBase init](&v66, sel_init);
  if (!v5)
    goto LABEL_95;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v11 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v12 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v7;
        v17 = *(_QWORD *)&v4[v16];
        if (v17 == -1 || v17 >= *(_QWORD *)&v4[*v8])
          break;
        v18 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v17);
        *(_QWORD *)&v4[v16] = v17 + 1;
        v15 |= (unint64_t)(v18 & 0x7F) << v13;
        if ((v18 & 0x80) == 0)
          goto LABEL_13;
        v13 += 7;
        v19 = v14++ >= 9;
        if (v19)
        {
          v15 = 0;
          v20 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v20 = v4[*v9];
      if (v4[*v9])
        v15 = 0;
LABEL_15:
      if (v20 || (v15 & 7) == 4)
        break;
      switch((v15 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = v10[160];
          goto LABEL_31;
        case 2u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          while (2)
          {
            v27 = *v7;
            v28 = *(_QWORD *)&v4[v27];
            if (v28 == -1 || v28 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v28);
              *(_QWORD *)&v4[v27] = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                v19 = v25++ >= 9;
                if (v19)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v26) = 0;
LABEL_69:
          if (v26 >= 8)
            LODWORD(v26) = 0;
          v59 = v11[161];
          goto LABEL_91;
        case 3u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 48;
LABEL_31:
          v30 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        case 4u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v5->_hasVisiblePeopleSuggestionCount = 1;
          while (2)
          {
            v34 = *v7;
            v35 = *(_QWORD *)&v4[v34];
            if (v35 == -1 || v35 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v35);
              *(_QWORD *)&v4[v34] = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                v19 = v32++ >= 9;
                if (v19)
                {
                  LODWORD(v33) = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v33) = 0;
LABEL_75:
          v60 = 28;
          goto LABEL_80;
        case 5u:
          v37 = 0;
          v38 = 0;
          v33 = 0;
          v5->_hasVisibleAppSuggestionCount = 1;
          while (2)
          {
            v39 = *v7;
            v40 = *(_QWORD *)&v4[v39];
            if (v40 == -1 || v40 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v40);
              *(_QWORD *)&v4[v39] = v40 + 1;
              v33 |= (unint64_t)(v41 & 0x7F) << v37;
              if (v41 < 0)
              {
                v37 += 7;
                v19 = v38++ >= 9;
                if (v19)
                {
                  LODWORD(v33) = 0;
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v33) = 0;
LABEL_79:
          v60 = 32;
LABEL_80:
          *(_DWORD *)((char *)&v5->super.super.isa + v60) = v33;
          continue;
        case 6u:
          v42 = 0;
          v43 = 0;
          v44 = 0;
          v5->_hasAirdropPeopleSuggestionShown = 1;
          while (2)
          {
            v45 = *v7;
            v46 = *(_QWORD *)&v4[v45];
            if (v46 == -1 || v46 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v46);
              *(_QWORD *)&v4[v45] = v46 + 1;
              v44 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                v19 = v43++ >= 9;
                if (v19)
                {
                  v44 = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v44 = 0;
LABEL_84:
          v5->_airdropPeopleSuggestionShown = v44 != 0;
          continue;
        case 7u:
          v48 = 0;
          v49 = 0;
          v26 = 0;
          break;
        case 8u:
          v67 = 0;
          v68 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_97;
          v53 = -[BMMLSEShareSheetFeedbackTrialIdentifier initByReadFrom:]([BMMLSEShareSheetFeedbackTrialIdentifier alloc], "initByReadFrom:", v4);
          if (!v53)
            goto LABEL_97;
          trialIdentifier = v5->_trialIdentifier;
          v5->_trialIdentifier = v53;

          PBReaderRecallMark();
          continue;
        case 9u:
          v67 = 0;
          v68 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_97;
          v55 = v11;
          v56 = v10;
          v57 = -[BMMLSEShareSheetFeedbackTimeout initByReadFrom:]([BMMLSEShareSheetFeedbackTimeout alloc], "initByReadFrom:", v4);
          if (!v57)
            goto LABEL_97;
          v58 = v57;
          objc_msgSend(v6, "addObject:", v57);
          PBReaderRecallMark();

          v10 = v56;
          v11 = v55;
          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_97:

          goto LABEL_94;
      }
      while (1)
      {
        v50 = *v7;
        v51 = *(_QWORD *)&v4[v50];
        if (v51 == -1 || v51 >= *(_QWORD *)&v4[*v8])
          break;
        v52 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v51);
        *(_QWORD *)&v4[v50] = v51 + 1;
        v26 |= (unint64_t)(v52 & 0x7F) << v48;
        if ((v52 & 0x80) == 0)
          goto LABEL_86;
        v48 += 7;
        v19 = v49++ >= 9;
        if (v19)
        {
          LODWORD(v26) = 0;
          goto LABEL_88;
        }
      }
      v4[*v9] = 1;
LABEL_86:
      if (v4[*v9])
        LODWORD(v26) = 0;
LABEL_88:
      if (v26 >= 3)
        LODWORD(v26) = 0;
      v59 = 36;
LABEL_91:
      *(_DWORD *)((char *)&v5->super.super.isa + v59) = v26;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v61 = objc_msgSend(v6, "copy");
  timeouts = v5->_timeouts;
  v5->_timeouts = (NSArray *)v61;

  v63 = v4[*v9];
  if (v63)
LABEL_94:
    v64 = 0;
  else
LABEL_95:
    v64 = v5;

  return v64;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_engagementIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasVisiblePeopleSuggestionCount)
    PBDataWriterWriteUint32Field();
  if (self->_hasVisibleAppSuggestionCount)
    PBDataWriterWriteUint32Field();
  if (self->_hasAirdropPeopleSuggestionShown)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  if (self->_trialIdentifier)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMMLSEShareSheetFeedbackTrialIdentifier writeTo:](self->_trialIdentifier, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_timeouts;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        v15 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4, (_QWORD)v11);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMLSEShareSheetFeedback writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMLSEShareSheetFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  void *v61;
  uint64_t v62;
  id v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  id *v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  int v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  BMMLSEShareSheetFeedbackTimeout *v87;
  BMMLSEShareSheetFeedbackTimeout *v88;
  id v89;
  uint64_t v90;
  BMMLSEShareSheetFeedbackTrialIdentifier *v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  uint64_t v98;
  id v99;
  id v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  id *v105;
  id v106;
  uint64_t v107;
  void *v108;
  id *v109;
  uint64_t *v110;
  void *v111;
  void *v112;
  id v114;
  id v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  id v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  id v131;
  void *v132;
  id v133;
  BMMLSEShareSheetFeedbackTrialIdentifier *v134;
  void *v135;
  id v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  id v141;
  id v142;
  void *v143;
  id v144;
  void *v145;
  id *v146;
  id v147;
  void *v148;
  id v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  id v155;
  uint64_t v156;
  id v157;
  uint64_t v158;
  id v159;
  _BYTE v160[128];
  uint64_t v161;
  void *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  id v166;
  uint64_t v167;
  id v168;
  uint64_t v169;
  id v170;
  uint64_t v171;
  id v172;
  uint64_t v173;
  void *v174;
  uint64_t v175;
  id v176;
  uint64_t v177;
  _QWORD v178[3];

  v178[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0x1E0C99000uLL;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("engagementType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v147 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v28 = 0;
            goto LABEL_101;
          }
          v69 = a4;
          v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v71 = v9;
          v72 = *MEMORY[0x1E0D025B8];
          v175 = *MEMORY[0x1E0CB2D50];
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("engagementType"));
          v176 = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1);
          v73 = objc_claimAutoreleasedReturnValue();
          v74 = v72;
          v9 = v71;
          v148 = (void *)v73;
          v75 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v74, 2);
          v28 = 0;
          a4 = 0;
          *v69 = v75;
          goto LABEL_100;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMLSEShareSheetFeedbackEngagementTypeFromString(v9));
        v147 = (id)objc_claimAutoreleasedReturnValue();
        v7 = 0x1E0C99000;
      }
    }
    else
    {
      v147 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("engagementIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    v148 = (void *)v10;
    if (v10 && (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v146)
        {
          v12 = 0;
          a4 = 0;
          v28 = v147;
          goto LABEL_100;
        }
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = v9;
        v34 = *MEMORY[0x1E0D025B8];
        v173 = *MEMORY[0x1E0CB2D50];
        v35 = v8;
        v36 = objc_alloc(MEMORY[0x1E0CB3940]);
        v126 = objc_opt_class();
        v37 = v36;
        v8 = v35;
        v38 = (void *)objc_msgSend(v37, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v126, CFSTR("engagementIdentifier"));
        v174 = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v174, &v173, 1);
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = v34;
        v9 = v33;
        v145 = (void *)v39;
        v41 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v40, 2);
        v12 = 0;
        a4 = 0;
        *v146 = v41;
        goto LABEL_107;
      }
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("visiblePeopleSuggestionCount"));
    v13 = objc_claimAutoreleasedReturnValue();
    v145 = (void *)v13;
    if (!v13 || (v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v142 = 0;
LABEL_13:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("visibleAppSuggestionCount"));
      v15 = objc_claimAutoreleasedReturnValue();
      v143 = (void *)v15;
      if (v15 && (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v146)
          {
            v144 = 0;
            a4 = 0;
            v28 = v147;
            v38 = v142;
            goto LABEL_98;
          }
          v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v52 = v9;
          v53 = *MEMORY[0x1E0D025B8];
          v169 = *MEMORY[0x1E0CB2D50];
          v54 = v8;
          v55 = objc_alloc(MEMORY[0x1E0CB3940]);
          v128 = objc_opt_class();
          v56 = v55;
          v8 = v54;
          v141 = (id)objc_msgSend(v56, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v128, CFSTR("visibleAppSuggestionCount"));
          v170 = v141;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v170, &v169, 1);
          v57 = objc_claimAutoreleasedReturnValue();
          v58 = v53;
          v9 = v52;
          v140 = (void *)v57;
          v59 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v58, 2);
          v144 = 0;
          a4 = 0;
          *v146 = v59;
          goto LABEL_112;
        }
        v144 = v16;
      }
      else
      {
        v144 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("airdropPeopleSuggestionShown"));
      v17 = objc_claimAutoreleasedReturnValue();
      v140 = (void *)v17;
      if (!v17 || (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v141 = 0;
LABEL_19:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("inferenceSource"));
        v19 = objc_claimAutoreleasedReturnValue();
        v138 = (void *)v19;
        if (v19 && (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = v12;
            v139 = v20;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v146)
              {
                v139 = 0;
                a4 = 0;
                v28 = v147;
                goto LABEL_96;
              }
              v119 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v120 = v9;
              v121 = *MEMORY[0x1E0D025B8];
              v165 = *MEMORY[0x1E0CB2D50];
              v92 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("inferenceSource"));
              v166 = v92;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v166, &v165, 1);
              v91 = (BMMLSEShareSheetFeedbackTrialIdentifier *)objc_claimAutoreleasedReturnValue();
              v122 = v121;
              v9 = v120;
              v123 = (id)objc_msgSend(v119, "initWithDomain:code:userInfo:", v122, 2, v91);
              v139 = 0;
              a4 = 0;
              *v146 = v123;
              goto LABEL_93;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMLSEShareSheetFeedbackInferenceSourceFromString(v20));
            v139 = (id)objc_claimAutoreleasedReturnValue();
            v21 = v12;
          }
          v7 = 0x1E0C99000uLL;
        }
        else
        {
          v21 = v12;
          v139 = 0;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trialIdentifier"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = v9;
        if (!v76 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v134 = 0;
          v135 = v76;
LABEL_56:
          v136 = v5;
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeouts"));
          v77 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v7 + 3640), "null");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend(v77, "isEqual:", v78);

          v12 = v21;
          if (v79)
          {
            v132 = v6;

            v77 = 0;
LABEL_61:
            v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v77, "count"));
            v151 = 0u;
            v152 = 0u;
            v153 = 0u;
            v154 = 0u;
            v77 = v77;
            v81 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v151, v160, 16);
            if (!v81)
              goto LABEL_71;
            v82 = v81;
            v83 = *(_QWORD *)v152;
            v133 = v8;
            v131 = v12;
LABEL_63:
            v84 = 0;
            while (1)
            {
              if (*(_QWORD *)v152 != v83)
                objc_enumerationMutation(v77);
              v85 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * v84);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                break;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v8 = v133;
                v9 = v137;
                v105 = v146;
                v12 = v131;
                if (!v146)
                  goto LABEL_89;
                v106 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v107 = *MEMORY[0x1E0D025B8];
                v156 = *MEMORY[0x1E0CB2D50];
                v86 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("timeouts"));
                v157 = v86;
                v108 = (void *)MEMORY[0x1E0C99D80];
                v109 = &v157;
                v110 = &v156;
                goto LABEL_84;
              }
              v86 = v85;
              v87 = [BMMLSEShareSheetFeedbackTimeout alloc];
              v150 = 0;
              v88 = -[BMMLSEShareSheetFeedbackTimeout initWithJSONDictionary:error:](v87, "initWithJSONDictionary:error:", v86, &v150);
              v89 = v150;
              if (v89)
              {
                v111 = v89;
                if (v146)
                  *v146 = objc_retainAutorelease(v89);

                v8 = v133;
                v9 = v137;
                v12 = v131;
LABEL_88:

LABEL_89:
                a4 = 0;
                v6 = v132;
                goto LABEL_90;
              }
              objc_msgSend(v80, "addObject:", v88);

              if (v82 == ++v84)
              {
                v82 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v151, v160, 16);
                v8 = v133;
                v12 = v131;
                if (v82)
                  goto LABEL_63;
LABEL_71:

                v90 = objc_msgSend(v147, "intValue");
                v91 = v134;
                LODWORD(v124) = objc_msgSend(v139, "intValue");
                a4 = -[BMMLSEShareSheetFeedback initWithIdentifier:engagementType:engagementIdentifier:visiblePeopleSuggestionCount:visibleAppSuggestionCount:airdropPeopleSuggestionShown:inferenceSource:trialIdentifier:timeouts:](self, "initWithIdentifier:engagementType:engagementIdentifier:visiblePeopleSuggestionCount:visibleAppSuggestionCount:airdropPeopleSuggestionShown:inferenceSource:trialIdentifier:timeouts:", v8, v90, v12, v142, v144, v141, v124, v134, v80);
                self = (BMMLSEShareSheetFeedback *)a4;
                v6 = v132;
                v9 = v137;
LABEL_91:

                v92 = v135;
                goto LABEL_92;
              }
            }
            v8 = v133;
            v9 = v137;
            v105 = v146;
            v12 = v131;
            if (!v146)
              goto LABEL_89;
            v106 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v107 = *MEMORY[0x1E0D025B8];
            v158 = *MEMORY[0x1E0CB2D50];
            v86 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("timeouts"));
            v159 = v86;
            v108 = (void *)MEMORY[0x1E0C99D80];
            v109 = &v159;
            v110 = &v158;
LABEL_84:
            objc_msgSend(v108, "dictionaryWithObjects:forKeys:count:", v109, v110, 1);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = v106;
            v8 = v133;
            *v105 = (id)objc_msgSend(v112, "initWithDomain:code:userInfo:", v107, 2, v111);
            goto LABEL_88;
          }
          if (!v77 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v132 = v6;
            goto LABEL_61;
          }
          if (v146)
          {
            v114 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v115 = v8;
            v116 = *MEMORY[0x1E0D025B8];
            v161 = *MEMORY[0x1E0CB2D50];
            v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("timeouts"));
            v162 = v80;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v162, &v161, 1);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v118 = v116;
            v8 = v115;
            *v146 = (id)objc_msgSend(v114, "initWithDomain:code:userInfo:", v118, 2, v117);

            a4 = 0;
LABEL_90:
            v91 = v134;
            goto LABEL_91;
          }
          a4 = 0;
          v91 = v134;
          v92 = v135;
LABEL_92:

          v5 = v136;
          goto LABEL_93;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v92 = v76;
          v155 = 0;
          v91 = -[BMMLSEShareSheetFeedbackTrialIdentifier initWithJSONDictionary:error:]([BMMLSEShareSheetFeedbackTrialIdentifier alloc], "initWithJSONDictionary:error:", v92, &v155);
          v93 = v155;
          if (!v93)
          {
            v134 = v91;
            v135 = v76;

            v7 = 0x1E0C99000;
            goto LABEL_56;
          }
          v94 = v93;
          if (v146)
            *v146 = objc_retainAutorelease(v93);

          a4 = 0;
          v12 = v21;
        }
        else
        {
          v95 = v76;
          a4 = v146;
          if (!v146)
          {
            v92 = v76;
            v12 = v21;
            goto LABEL_94;
          }
          v96 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v97 = v8;
          v98 = *MEMORY[0x1E0D025B8];
          v163 = *MEMORY[0x1E0CB2D50];
          v99 = v5;
          v100 = objc_alloc(MEMORY[0x1E0CB3940]);
          v130 = objc_opt_class();
          v101 = v100;
          v5 = v99;
          v12 = v21;
          v102 = objc_msgSend(v101, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v130, CFSTR("trialIdentifier"));
          v164 = v102;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v164, &v163, 1);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = v98;
          v8 = v97;
          *v146 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v104, 2, v103);

          a4 = 0;
          v92 = v95;
          v91 = (BMMLSEShareSheetFeedbackTrialIdentifier *)v102;
          v9 = v137;
        }
LABEL_93:

LABEL_94:
        goto LABEL_95;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v141 = v18;
        goto LABEL_19;
      }
      if (v146)
      {
        v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v61 = v9;
        v62 = *MEMORY[0x1E0D025B8];
        v167 = *MEMORY[0x1E0CB2D50];
        v63 = v8;
        v64 = objc_alloc(MEMORY[0x1E0CB3940]);
        v129 = objc_opt_class();
        v65 = v64;
        v8 = v63;
        v139 = (id)objc_msgSend(v65, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v129, CFSTR("airdropPeopleSuggestionShown"));
        v168 = v139;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v168, &v167, 1);
        v66 = objc_claimAutoreleasedReturnValue();
        v67 = v62;
        v9 = v61;
        v138 = (void *)v66;
        v68 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v67, 2);
        v141 = 0;
        a4 = 0;
        *v146 = v68;
LABEL_95:
        v28 = v147;
LABEL_96:
        v38 = v142;

LABEL_97:
        goto LABEL_98;
      }
      v141 = 0;
      a4 = 0;
LABEL_112:
      v28 = v147;
      v38 = v142;
      goto LABEL_97;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v142 = v14;
      goto LABEL_13;
    }
    if (v146)
    {
      v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v43 = v9;
      v44 = *MEMORY[0x1E0D025B8];
      v171 = *MEMORY[0x1E0CB2D50];
      v45 = v8;
      v46 = objc_alloc(MEMORY[0x1E0CB3940]);
      v127 = objc_opt_class();
      v47 = v46;
      v8 = v45;
      v144 = (id)objc_msgSend(v47, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v127, CFSTR("visiblePeopleSuggestionCount"));
      v172 = v144;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v172, &v171, 1);
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = v44;
      v9 = v43;
      v143 = (void *)v48;
      v50 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v49, 2);
      v38 = 0;
      a4 = 0;
      *v146 = v50;
      v28 = v147;
LABEL_98:

LABEL_99:
LABEL_100:

      goto LABEL_101;
    }
    v38 = 0;
    a4 = 0;
LABEL_107:
    v28 = v147;
    goto LABEL_99;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    goto LABEL_4;
  }
  if (a4)
  {
    v22 = a4;
    v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v24 = *MEMORY[0x1E0D025B8];
    v177 = *MEMORY[0x1E0CB2D50];
    v25 = v6;
    v26 = objc_alloc(MEMORY[0x1E0CB3940]);
    v125 = objc_opt_class();
    v27 = v26;
    v6 = v25;
    v28 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v125, CFSTR("identifier"));
    v178[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v178, &v177, 1);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v24;
    v9 = (void *)v29;
    v31 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v30, 2, v29);
    a4 = 0;
    *v22 = v31;
    v8 = 0;
LABEL_101:

    goto LABEL_102;
  }
  v8 = 0;
LABEL_102:

  return (BMMLSEShareSheetFeedback *)a4;
}

- (id)_timeoutsJSONArray
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
  -[BMMLSEShareSheetFeedback timeouts](self, "timeouts", 0);
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
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[9];
  _QWORD v33[11];

  v33[9] = *MEMORY[0x1E0C80C00];
  -[BMMLSEShareSheetFeedback identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMLSEShareSheetFeedback engagementType](self, "engagementType"));
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetFeedback engagementIdentifier](self, "engagementIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (-[BMMLSEShareSheetFeedback hasVisiblePeopleSuggestionCount](self, "hasVisiblePeopleSuggestionCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEShareSheetFeedback visiblePeopleSuggestionCount](self, "visiblePeopleSuggestionCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[BMMLSEShareSheetFeedback hasVisibleAppSuggestionCount](self, "hasVisibleAppSuggestionCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEShareSheetFeedback visibleAppSuggestionCount](self, "visibleAppSuggestionCount"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (-[BMMLSEShareSheetFeedback hasAirdropPeopleSuggestionShown](self, "hasAirdropPeopleSuggestionShown"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMLSEShareSheetFeedback airdropPeopleSuggestionShown](self, "airdropPeopleSuggestionShown"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMLSEShareSheetFeedback inferenceSource](self, "inferenceSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetFeedback trialIdentifier](self, "trialIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsonDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMMLSEShareSheetFeedback _timeoutsJSONArray](self, "_timeoutsJSONArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = CFSTR("identifier");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v12;
  v33[0] = v12;
  v32[1] = CFSTR("engagementType");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v13;
  v33[1] = v13;
  v32[2] = CFSTR("engagementIdentifier");
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v3;
  v24 = (void *)v14;
  v33[2] = v14;
  v32[3] = CFSTR("visiblePeopleSuggestionCount");
  v15 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v4;
  v23 = (void *)v15;
  v33[3] = v15;
  v32[4] = CFSTR("visibleAppSuggestionCount");
  v16 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v5;
  v33[4] = v16;
  v32[5] = CFSTR("airdropPeopleSuggestionShown");
  v17 = v31;
  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[5] = v17;
  v32[6] = CFSTR("inferenceSource");
  v18 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v7;
  v33[6] = v18;
  v32[7] = CFSTR("trialIdentifier");
  v20 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[7] = v20;
  v32[8] = CFSTR("timeouts");
  v21 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[8] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 9);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_30;
LABEL_42:

    if (v8)
      goto LABEL_31;
    goto LABEL_43;
  }

  if (!v10)
    goto LABEL_42;
LABEL_30:
  if (v8)
    goto LABEL_31;
LABEL_43:

LABEL_31:
  if (!v31)

  if (!v19)
  if (!v6)

  if (v28)
  {
    if (v29)
      goto LABEL_39;
LABEL_45:

    if (v30)
      goto LABEL_40;
LABEL_46:

    goto LABEL_40;
  }

  if (!v29)
    goto LABEL_45;
LABEL_39:
  if (!v30)
    goto LABEL_46;
LABEL_40:

  return v27;
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
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMLSEShareSheetFeedback identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMLSEShareSheetFeedback identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_30;
    }
    v13 = -[BMMLSEShareSheetFeedback engagementType](self, "engagementType");
    if (v13 == objc_msgSend(v5, "engagementType"))
    {
      -[BMMLSEShareSheetFeedback engagementIdentifier](self, "engagementIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "engagementIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[BMMLSEShareSheetFeedback engagementIdentifier](self, "engagementIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "engagementIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_30;
      }
      if (-[BMMLSEShareSheetFeedback hasVisiblePeopleSuggestionCount](self, "hasVisiblePeopleSuggestionCount")
        || objc_msgSend(v5, "hasVisiblePeopleSuggestionCount"))
      {
        if (!-[BMMLSEShareSheetFeedback hasVisiblePeopleSuggestionCount](self, "hasVisiblePeopleSuggestionCount"))
          goto LABEL_30;
        if (!objc_msgSend(v5, "hasVisiblePeopleSuggestionCount"))
          goto LABEL_30;
        v20 = -[BMMLSEShareSheetFeedback visiblePeopleSuggestionCount](self, "visiblePeopleSuggestionCount");
        if (v20 != objc_msgSend(v5, "visiblePeopleSuggestionCount"))
          goto LABEL_30;
      }
      if (-[BMMLSEShareSheetFeedback hasVisibleAppSuggestionCount](self, "hasVisibleAppSuggestionCount")
        || objc_msgSend(v5, "hasVisibleAppSuggestionCount"))
      {
        if (!-[BMMLSEShareSheetFeedback hasVisibleAppSuggestionCount](self, "hasVisibleAppSuggestionCount"))
          goto LABEL_30;
        if (!objc_msgSend(v5, "hasVisibleAppSuggestionCount"))
          goto LABEL_30;
        v21 = -[BMMLSEShareSheetFeedback visibleAppSuggestionCount](self, "visibleAppSuggestionCount");
        if (v21 != objc_msgSend(v5, "visibleAppSuggestionCount"))
          goto LABEL_30;
      }
      if (-[BMMLSEShareSheetFeedback hasAirdropPeopleSuggestionShown](self, "hasAirdropPeopleSuggestionShown")
        || objc_msgSend(v5, "hasAirdropPeopleSuggestionShown"))
      {
        if (!-[BMMLSEShareSheetFeedback hasAirdropPeopleSuggestionShown](self, "hasAirdropPeopleSuggestionShown"))
          goto LABEL_30;
        if (!objc_msgSend(v5, "hasAirdropPeopleSuggestionShown"))
          goto LABEL_30;
        v22 = -[BMMLSEShareSheetFeedback airdropPeopleSuggestionShown](self, "airdropPeopleSuggestionShown");
        if (v22 != objc_msgSend(v5, "airdropPeopleSuggestionShown"))
          goto LABEL_30;
      }
      v23 = -[BMMLSEShareSheetFeedback inferenceSource](self, "inferenceSource");
      if (v23 != objc_msgSend(v5, "inferenceSource"))
        goto LABEL_30;
      -[BMMLSEShareSheetFeedback trialIdentifier](self, "trialIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trialIdentifier");
      v25 = objc_claimAutoreleasedReturnValue();
      if (v24 == (void *)v25)
      {

      }
      else
      {
        v26 = (void *)v25;
        -[BMMLSEShareSheetFeedback trialIdentifier](self, "trialIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "trialIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v27, "isEqual:", v28);

        if (!v29)
          goto LABEL_30;
      }
      -[BMMLSEShareSheetFeedback timeouts](self, "timeouts");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeouts");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31 == v32)
      {
        v12 = 1;
      }
      else
      {
        -[BMMLSEShareSheetFeedback timeouts](self, "timeouts");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "timeouts");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v33, "isEqual:", v34);

      }
      goto LABEL_31;
    }
LABEL_30:
    v12 = 0;
LABEL_31:

    goto LABEL_32;
  }
  v12 = 0;
LABEL_32:

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

- (int)engagementType
{
  return self->_engagementType;
}

- (NSString)engagementIdentifier
{
  return self->_engagementIdentifier;
}

- (unsigned)visiblePeopleSuggestionCount
{
  return self->_visiblePeopleSuggestionCount;
}

- (BOOL)hasVisiblePeopleSuggestionCount
{
  return self->_hasVisiblePeopleSuggestionCount;
}

- (void)setHasVisiblePeopleSuggestionCount:(BOOL)a3
{
  self->_hasVisiblePeopleSuggestionCount = a3;
}

- (unsigned)visibleAppSuggestionCount
{
  return self->_visibleAppSuggestionCount;
}

- (BOOL)hasVisibleAppSuggestionCount
{
  return self->_hasVisibleAppSuggestionCount;
}

- (void)setHasVisibleAppSuggestionCount:(BOOL)a3
{
  self->_hasVisibleAppSuggestionCount = a3;
}

- (BOOL)airdropPeopleSuggestionShown
{
  return self->_airdropPeopleSuggestionShown;
}

- (BOOL)hasAirdropPeopleSuggestionShown
{
  return self->_hasAirdropPeopleSuggestionShown;
}

- (void)setHasAirdropPeopleSuggestionShown:(BOOL)a3
{
  self->_hasAirdropPeopleSuggestionShown = a3;
}

- (int)inferenceSource
{
  return self->_inferenceSource;
}

- (BMMLSEShareSheetFeedbackTrialIdentifier)trialIdentifier
{
  return self->_trialIdentifier;
}

- (NSArray)timeouts
{
  return self->_timeouts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeouts, 0);
  objc_storeStrong((id *)&self->_trialIdentifier, 0);
  objc_storeStrong((id *)&self->_engagementIdentifier, 0);
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

    v4 = -[BMMLSEShareSheetFeedback initByReadFrom:]([BMMLSEShareSheetFeedback alloc], "initByReadFrom:", v7);
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
  void *v10;
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("engagementType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("engagementIdentifier"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("visiblePeopleSuggestionCount"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("visibleAppSuggestionCount"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("airdropPeopleSuggestionShown"), 0, 0, 6, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("inferenceSource"), 0, 0, 7, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("trialIdentifier_json"), 5, 1, &__block_literal_global_192);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("timeouts_json"), 5, 1, &__block_literal_global_193);
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
  return &unk_1E5F1B0B8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("engagementType"), 2, 4, 0, v2);
  v13[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("engagementIdentifier"), 3, 13, 0);
  v13[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visiblePeopleSuggestionCount"), 4, 4, 0);
  v13[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visibleAppSuggestionCount"), 5, 4, 0);
  v13[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("airdropPeopleSuggestionShown"), 6, 12, 0);
  v13[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("inferenceSource"), 7, 4, 0);
  v13[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("trialIdentifier"), 8, 14, objc_opt_class());
  v13[7] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timeouts"), 9, 14, objc_opt_class());
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __35__BMMLSEShareSheetFeedback_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_timeoutsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __35__BMMLSEShareSheetFeedback_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trialIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BMMLSEShareSheetFeedback)initWithIdentifier:(id)a3 engagementType:(int)a4 engagementIdentifier:(id)a5 visiblePeopleSuggestionCount:(id)a6 visibleAppSuggestionCount:(id)a7 airdropPeopleSuggestionShown:(id)a8 inferenceSource:(int)a9 trialIdentifier:(id)a10
{
  uint64_t v11;

  LODWORD(v11) = a9;
  return -[BMMLSEShareSheetFeedback initWithIdentifier:engagementType:engagementIdentifier:visiblePeopleSuggestionCount:visibleAppSuggestionCount:airdropPeopleSuggestionShown:inferenceSource:trialIdentifier:timeouts:](self, "initWithIdentifier:engagementType:engagementIdentifier:visiblePeopleSuggestionCount:visibleAppSuggestionCount:airdropPeopleSuggestionShown:inferenceSource:trialIdentifier:timeouts:", a3, *(_QWORD *)&a4, a5, a6, a7, a8, v11, a10, MEMORY[0x1E0C9AA60]);
}

- (BMMLSEShareSheetFeedback)initWithIdentifier:(id)a3 engagementType:(int)a4 engagementIdentifier:(id)a5 visiblePeopleSuggestionCount:(id)a6 visibleAppSuggestionCount:(id)a7 airdropPeopleSuggestionShown:(id)a8 inferenceSource:(int)a9
{
  uint64_t v10;

  LODWORD(v10) = a9;
  return -[BMMLSEShareSheetFeedback initWithIdentifier:engagementType:engagementIdentifier:visiblePeopleSuggestionCount:visibleAppSuggestionCount:airdropPeopleSuggestionShown:inferenceSource:trialIdentifier:](self, "initWithIdentifier:engagementType:engagementIdentifier:visiblePeopleSuggestionCount:visibleAppSuggestionCount:airdropPeopleSuggestionShown:inferenceSource:trialIdentifier:", a3, *(_QWORD *)&a4, a5, a6, a7, a8, v10, 0);
}

@end
