@implementation BMAeroMLPhotosSearchInsights

- (BMAeroMLPhotosSearchInsights)initWithWasThereAnyResultsShown:(id)a3 searchResultSize:(id)a4 didUserViewAnyPhoto:(id)a5 viewedPhotoCount:(id)a6 uiSurface:(int)a7 sizeOfPhotoDB:(id)a8 numberOfSearchesFromThisSurfaceLastWeek:(id)a9 numberOfSearchesFromThisSurfaceWeeklyAvg:(id)a10 queryRaw:(id)a11 numberOfTokensInQuery:(id)a12 numberOfKnownEntitiesInQuery:(id)a13 isSpecificPersonInQuery:(id)a14 isGeneralPersonReferenceInQuery:(id)a15 isSpecificLocationInQuery:(id)a16 isGeneralLocationReferenceInQuery:(id)a17 isSpecificDateInQuery:(id)a18 isGeneralDateReferenceInQuery:(id)a19 isHolidayReferenceInQuery:(id)a20 isActionRunningInQuery:(id)a21 isActionHoldingInQuery:(id)a22 isActionClimbingInQuery:(id)a23
{
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  BMAeroMLPhotosSearchInsights *v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  objc_super v58;

  v57 = a3;
  v56 = a4;
  v55 = a5;
  v54 = a6;
  v53 = a8;
  v52 = a9;
  v51 = a10;
  v47 = a11;
  v50 = a12;
  v48 = a13;
  v27 = a14;
  v28 = a15;
  v29 = a16;
  v30 = a17;
  v31 = a18;
  v32 = a19;
  v33 = a20;
  v34 = a21;
  v49 = a22;
  v35 = a23;
  v58.receiver = self;
  v58.super_class = (Class)BMAeroMLPhotosSearchInsights;
  v36 = -[BMEventBase init](&v58, sel_init);
  if (v36)
  {
    v36->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v57)
    {
      v36->_hasWasThereAnyResultsShown = 1;
      v36->_wasThereAnyResultsShown = objc_msgSend(v57, "BOOLValue");
    }
    else
    {
      v36->_hasWasThereAnyResultsShown = 0;
      v36->_wasThereAnyResultsShown = 0;
    }
    v37 = v56;
    if (v56)
    {
      v36->_hasSearchResultSize = 1;
      v37 = objc_msgSend(v56, "unsignedIntValue");
    }
    else
    {
      v36->_hasSearchResultSize = 0;
    }
    v36->_searchResultSize = v37;
    if (v55)
    {
      v36->_hasDidUserViewAnyPhoto = 1;
      v36->_didUserViewAnyPhoto = objc_msgSend(v55, "BOOLValue");
    }
    else
    {
      v36->_hasDidUserViewAnyPhoto = 0;
      v36->_didUserViewAnyPhoto = 0;
    }
    v38 = v54;
    if (v54)
    {
      v36->_hasViewedPhotoCount = 1;
      v38 = objc_msgSend(v54, "unsignedIntValue");
    }
    else
    {
      v36->_hasViewedPhotoCount = 0;
    }
    v36->_viewedPhotoCount = v38;
    v36->_uiSurface = a7;
    v39 = v53;
    if (v53)
    {
      v36->_hasSizeOfPhotoDB = 1;
      v39 = objc_msgSend(v53, "unsignedIntValue");
    }
    else
    {
      v36->_hasSizeOfPhotoDB = 0;
    }
    v36->_sizeOfPhotoDB = v39;
    v40 = v52;
    if (v52)
    {
      v36->_hasNumberOfSearchesFromThisSurfaceLastWeek = 1;
      v40 = objc_msgSend(v52, "unsignedIntValue");
    }
    else
    {
      v36->_hasNumberOfSearchesFromThisSurfaceLastWeek = 0;
    }
    v36->_numberOfSearchesFromThisSurfaceLastWeek = v40;
    v41 = v51;
    if (v51)
    {
      v36->_hasNumberOfSearchesFromThisSurfaceWeeklyAvg = 1;
      v41 = objc_msgSend(v51, "unsignedIntValue");
    }
    else
    {
      v36->_hasNumberOfSearchesFromThisSurfaceWeeklyAvg = 0;
    }
    v36->_numberOfSearchesFromThisSurfaceWeeklyAvg = v41;
    objc_storeStrong((id *)&v36->_queryRaw, a11);
    v42 = v50;
    if (v50)
    {
      v36->_hasNumberOfTokensInQuery = 1;
      v42 = objc_msgSend(v50, "unsignedIntValue");
    }
    else
    {
      v36->_hasNumberOfTokensInQuery = 0;
    }
    v36->_numberOfTokensInQuery = v42;
    if (v48)
    {
      v36->_hasNumberOfKnownEntitiesInQuery = 1;
      v43 = objc_msgSend(v48, "unsignedIntValue");
    }
    else
    {
      v43 = 0;
      v36->_hasNumberOfKnownEntitiesInQuery = 0;
    }
    v36->_numberOfKnownEntitiesInQuery = v43;
    if (v27)
    {
      v36->_hasIsSpecificPersonInQuery = 1;
      v36->_isSpecificPersonInQuery = objc_msgSend(v27, "BOOLValue");
    }
    else
    {
      v36->_hasIsSpecificPersonInQuery = 0;
      v36->_isSpecificPersonInQuery = 0;
    }
    if (v28)
    {
      v36->_hasIsGeneralPersonReferenceInQuery = 1;
      v36->_isGeneralPersonReferenceInQuery = objc_msgSend(v28, "BOOLValue");
    }
    else
    {
      v36->_hasIsGeneralPersonReferenceInQuery = 0;
      v36->_isGeneralPersonReferenceInQuery = 0;
    }
    if (v29)
    {
      v36->_hasIsSpecificLocationInQuery = 1;
      v36->_isSpecificLocationInQuery = objc_msgSend(v29, "BOOLValue");
    }
    else
    {
      v36->_hasIsSpecificLocationInQuery = 0;
      v36->_isSpecificLocationInQuery = 0;
    }
    if (v30)
    {
      v36->_hasIsGeneralLocationReferenceInQuery = 1;
      v36->_isGeneralLocationReferenceInQuery = objc_msgSend(v30, "BOOLValue");
    }
    else
    {
      v36->_hasIsGeneralLocationReferenceInQuery = 0;
      v36->_isGeneralLocationReferenceInQuery = 0;
    }
    if (v31)
    {
      v36->_hasIsSpecificDateInQuery = 1;
      v36->_isSpecificDateInQuery = objc_msgSend(v31, "BOOLValue");
    }
    else
    {
      v36->_hasIsSpecificDateInQuery = 0;
      v36->_isSpecificDateInQuery = 0;
    }
    if (v32)
    {
      v36->_hasIsGeneralDateReferenceInQuery = 1;
      v36->_isGeneralDateReferenceInQuery = objc_msgSend(v32, "BOOLValue");
    }
    else
    {
      v32 = 0;
      v36->_hasIsGeneralDateReferenceInQuery = 0;
      v36->_isGeneralDateReferenceInQuery = 0;
    }
    if (v33)
    {
      v36->_hasIsHolidayReferenceInQuery = 1;
      v36->_isHolidayReferenceInQuery = objc_msgSend(v33, "BOOLValue");
    }
    else
    {
      v36->_hasIsHolidayReferenceInQuery = 0;
      v36->_isHolidayReferenceInQuery = 0;
    }
    if (v34)
    {
      v36->_hasIsActionRunningInQuery = 1;
      v36->_isActionRunningInQuery = objc_msgSend(v34, "BOOLValue");
    }
    else
    {
      v36->_hasIsActionRunningInQuery = 0;
      v36->_isActionRunningInQuery = 0;
    }
    if (v49)
    {
      v36->_hasIsActionHoldingInQuery = 1;
      v36->_isActionHoldingInQuery = objc_msgSend(v49, "BOOLValue");
    }
    else
    {
      v36->_hasIsActionHoldingInQuery = 0;
      v36->_isActionHoldingInQuery = 0;
    }
    if (v35)
    {
      v36->_hasIsActionClimbingInQuery = 1;
      v36->_isActionClimbingInQuery = objc_msgSend(v35, "BOOLValue");
    }
    else
    {
      v36->_hasIsActionClimbingInQuery = 0;
      v36->_isActionClimbingInQuery = 0;
    }
  }

  return v36;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights wasThereAnyResultsShown](self, "wasThereAnyResultsShown"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights searchResultSize](self, "searchResultSize"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights didUserViewAnyPhoto](self, "didUserViewAnyPhoto"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights viewedPhotoCount](self, "viewedPhotoCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  BMAeroMLPhotosSearchInsightsUISurfaceTypeAsString(-[BMAeroMLPhotosSearchInsights uiSurface](self, "uiSurface"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights sizeOfPhotoDB](self, "sizeOfPhotoDB"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights numberOfSearchesFromThisSurfaceLastWeek](self, "numberOfSearchesFromThisSurfaceLastWeek"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights numberOfSearchesFromThisSurfaceWeeklyAvg](self, "numberOfSearchesFromThisSurfaceWeeklyAvg"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAeroMLPhotosSearchInsights queryRaw](self, "queryRaw");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights numberOfTokensInQuery](self, "numberOfTokensInQuery"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights numberOfKnownEntitiesInQuery](self, "numberOfKnownEntitiesInQuery"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isSpecificPersonInQuery](self, "isSpecificPersonInQuery"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isGeneralPersonReferenceInQuery](self, "isGeneralPersonReferenceInQuery"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isSpecificLocationInQuery](self, "isSpecificLocationInQuery"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isGeneralLocationReferenceInQuery](self, "isGeneralLocationReferenceInQuery"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isSpecificDateInQuery](self, "isSpecificDateInQuery"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isGeneralDateReferenceInQuery](self, "isGeneralDateReferenceInQuery"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isHolidayReferenceInQuery](self, "isHolidayReferenceInQuery"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isActionRunningInQuery](self, "isActionRunningInQuery"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isActionHoldingInQuery](self, "isActionHoldingInQuery"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isActionClimbingInQuery](self, "isActionClimbingInQuery"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("BMAeroMLPhotosSearchInsights with wasThereAnyResultsShown: %@, searchResultSize: %@, didUserViewAnyPhoto: %@, viewedPhotoCount: %@, uiSurface: %@, sizeOfPhotoDB: %@, numberOfSearchesFromThisSurfaceLastWeek: %@, numberOfSearchesFromThisSurfaceWeeklyAvg: %@, queryRaw: %@, numberOfTokensInQuery: %@, numberOfKnownEntitiesInQuery: %@, isSpecificPersonInQuery: %@, isGeneralPersonReferenceInQuery: %@, isSpecificLocationInQuery: %@, isGeneralLocationReferenceInQuery: %@, isSpecificDateInQuery: %@, isGeneralDateReferenceInQuery: %@, isHolidayReferenceInQuery: %@, isActionRunningInQuery: %@, isActionHoldingInQuery: %@, isActionClimbingInQuery: %@"), v25, v26, v24, v23, v16, v22, v21, v15, v20, v19, v14, v12, v13, v11, v10, v3,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8);

  return (NSString *)v18;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAeroMLPhotosSearchInsights *v5;
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
  BOOL v16;
  int v17;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
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
  char v53;
  unsigned int v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  uint64_t v63;
  NSString *queryRaw;
  char v65;
  unsigned int v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  char v70;
  unsigned int v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  char v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char v80;
  char v81;
  unsigned int v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  char v93;
  unsigned int v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char v98;
  char v99;
  unsigned int v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  char v104;
  char v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char v110;
  char v111;
  unsigned int v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  char v116;
  char v117;
  unsigned int v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  char v122;
  char v123;
  unsigned int v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  char v128;
  char v129;
  unsigned int v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  char v134;
  BOOL v135;
  uint64_t v136;
  uint64_t v137;
  BMAeroMLPhotosSearchInsights *v138;
  objc_super v140;

  v4 = a3;
  v140.receiver = self;
  v140.super_class = (Class)BMAeroMLPhotosSearchInsights;
  v5 = -[BMEventBase init](&v140, sel_init);
  if (!v5)
    goto LABEL_250;
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
        v16 = v11++ >= 9;
        if (v16)
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
          v19 = 0;
          v20 = 0;
          v21 = 0;
          v5->_hasWasThereAnyResultsShown = 1;
          while (1)
          {
            v22 = *v6;
            v23 = *(_QWORD *)&v4[v22];
            if (v23 == -1 || v23 >= *(_QWORD *)&v4[*v7])
              break;
            v24 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v23);
            *(_QWORD *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0)
              goto LABEL_164;
            v19 += 7;
            v16 = v20++ >= 9;
            if (v16)
            {
              v21 = 0;
              goto LABEL_166;
            }
          }
          v4[*v8] = 1;
LABEL_164:
          if (v4[*v8])
            v21 = 0;
LABEL_166:
          v135 = v21 != 0;
          v136 = 16;
          goto LABEL_246;
        case 2u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v5->_hasSearchResultSize = 1;
          while (2)
          {
            v28 = *v6;
            v29 = *(_QWORD *)&v4[v28];
            if (v29 == -1 || v29 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v29);
              *(_QWORD *)&v4[v28] = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v16 = v26++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_170;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_170:
          v137 = 52;
          goto LABEL_205;
        case 3u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v5->_hasDidUserViewAnyPhoto = 1;
          while (2)
          {
            v34 = *v6;
            v35 = *(_QWORD *)&v4[v34];
            if (v35 == -1 || v35 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v35);
              *(_QWORD *)&v4[v34] = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                v16 = v32++ >= 9;
                if (v16)
                {
                  v33 = 0;
                  goto LABEL_174;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v33 = 0;
LABEL_174:
          v135 = v33 != 0;
          v136 = 19;
          goto LABEL_246;
        case 4u:
          v37 = 0;
          v38 = 0;
          v27 = 0;
          v5->_hasViewedPhotoCount = 1;
          while (2)
          {
            v39 = *v6;
            v40 = *(_QWORD *)&v4[v39];
            if (v40 == -1 || v40 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v40);
              *(_QWORD *)&v4[v39] = v40 + 1;
              v27 |= (unint64_t)(v41 & 0x7F) << v37;
              if (v41 < 0)
              {
                v37 += 7;
                v16 = v38++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_178;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_178:
          v137 = 56;
          goto LABEL_205;
        case 5u:
          v42 = 0;
          v43 = 0;
          v44 = 0;
          while (2)
          {
            v45 = *v6;
            v46 = *(_QWORD *)&v4[v45];
            if (v46 == -1 || v46 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v46);
              *(_QWORD *)&v4[v45] = v46 + 1;
              v44 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                v16 = v43++ >= 9;
                if (v16)
                {
                  LODWORD(v44) = 0;
                  goto LABEL_182;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v44) = 0;
LABEL_182:
          if (v44 >= 5)
            LODWORD(v44) = 0;
          v5->_uiSurface = v44;
          continue;
        case 6u:
          v48 = 0;
          v49 = 0;
          v27 = 0;
          v5->_hasSizeOfPhotoDB = 1;
          while (2)
          {
            v50 = *v6;
            v51 = *(_QWORD *)&v4[v50];
            if (v51 == -1 || v51 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v52 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v51);
              *(_QWORD *)&v4[v50] = v51 + 1;
              v27 |= (unint64_t)(v52 & 0x7F) << v48;
              if (v52 < 0)
              {
                v48 += 7;
                v16 = v49++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_188;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_188:
          v137 = 64;
          goto LABEL_205;
        case 7u:
          v53 = 0;
          v54 = 0;
          v27 = 0;
          v5->_hasNumberOfSearchesFromThisSurfaceLastWeek = 1;
          while (2)
          {
            v55 = *v6;
            v56 = *(_QWORD *)&v4[v55];
            if (v56 == -1 || v56 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v57 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v56);
              *(_QWORD *)&v4[v55] = v56 + 1;
              v27 |= (unint64_t)(v57 & 0x7F) << v53;
              if (v57 < 0)
              {
                v53 += 7;
                v16 = v54++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_192;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_192:
          v137 = 68;
          goto LABEL_205;
        case 8u:
          v58 = 0;
          v59 = 0;
          v27 = 0;
          v5->_hasNumberOfSearchesFromThisSurfaceWeeklyAvg = 1;
          while (2)
          {
            v60 = *v6;
            v61 = *(_QWORD *)&v4[v60];
            if (v61 == -1 || v61 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v62 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v61);
              *(_QWORD *)&v4[v60] = v61 + 1;
              v27 |= (unint64_t)(v62 & 0x7F) << v58;
              if (v62 < 0)
              {
                v58 += 7;
                v16 = v59++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_196;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_196:
          v137 = 72;
          goto LABEL_205;
        case 9u:
          PBReaderReadString();
          v63 = objc_claimAutoreleasedReturnValue();
          queryRaw = v5->_queryRaw;
          v5->_queryRaw = (NSString *)v63;

          continue;
        case 0xAu:
          v65 = 0;
          v66 = 0;
          v27 = 0;
          v5->_hasNumberOfTokensInQuery = 1;
          while (2)
          {
            v67 = *v6;
            v68 = *(_QWORD *)&v4[v67];
            if (v68 == -1 || v68 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v69 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v68);
              *(_QWORD *)&v4[v67] = v68 + 1;
              v27 |= (unint64_t)(v69 & 0x7F) << v65;
              if (v69 < 0)
              {
                v65 += 7;
                v16 = v66++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_200;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_200:
          v137 = 76;
          goto LABEL_205;
        case 0xBu:
          v70 = 0;
          v71 = 0;
          v27 = 0;
          v5->_hasNumberOfKnownEntitiesInQuery = 1;
          while (2)
          {
            v72 = *v6;
            v73 = *(_QWORD *)&v4[v72];
            if (v73 == -1 || v73 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v74 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v73);
              *(_QWORD *)&v4[v72] = v73 + 1;
              v27 |= (unint64_t)(v74 & 0x7F) << v70;
              if (v74 < 0)
              {
                v70 += 7;
                v16 = v71++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_204;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_204:
          v137 = 80;
LABEL_205:
          *(_DWORD *)((char *)&v5->super.super.isa + v137) = v27;
          continue;
        case 0xCu:
          v75 = 0;
          v76 = 0;
          v77 = 0;
          v5->_hasIsSpecificPersonInQuery = 1;
          while (2)
          {
            v78 = *v6;
            v79 = *(_QWORD *)&v4[v78];
            if (v79 == -1 || v79 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v80 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v79);
              *(_QWORD *)&v4[v78] = v79 + 1;
              v77 |= (unint64_t)(v80 & 0x7F) << v75;
              if (v80 < 0)
              {
                v75 += 7;
                v16 = v76++ >= 9;
                if (v16)
                {
                  v77 = 0;
                  goto LABEL_209;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v77 = 0;
LABEL_209:
          v135 = v77 != 0;
          v136 = 27;
          goto LABEL_246;
        case 0xDu:
          v81 = 0;
          v82 = 0;
          v83 = 0;
          v5->_hasIsGeneralPersonReferenceInQuery = 1;
          while (2)
          {
            v84 = *v6;
            v85 = *(_QWORD *)&v4[v84];
            if (v85 == -1 || v85 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v86 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v85);
              *(_QWORD *)&v4[v84] = v85 + 1;
              v83 |= (unint64_t)(v86 & 0x7F) << v81;
              if (v86 < 0)
              {
                v81 += 7;
                v16 = v82++ >= 9;
                if (v16)
                {
                  v83 = 0;
                  goto LABEL_213;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v83 = 0;
LABEL_213:
          v135 = v83 != 0;
          v136 = 29;
          goto LABEL_246;
        case 0xEu:
          v87 = 0;
          v88 = 0;
          v89 = 0;
          v5->_hasIsSpecificLocationInQuery = 1;
          while (2)
          {
            v90 = *v6;
            v91 = *(_QWORD *)&v4[v90];
            if (v91 == -1 || v91 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v92 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v91);
              *(_QWORD *)&v4[v90] = v91 + 1;
              v89 |= (unint64_t)(v92 & 0x7F) << v87;
              if (v92 < 0)
              {
                v87 += 7;
                v16 = v88++ >= 9;
                if (v16)
                {
                  v89 = 0;
                  goto LABEL_217;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v89 = 0;
LABEL_217:
          v135 = v89 != 0;
          v136 = 31;
          goto LABEL_246;
        case 0xFu:
          v93 = 0;
          v94 = 0;
          v95 = 0;
          v5->_hasIsGeneralLocationReferenceInQuery = 1;
          while (2)
          {
            v96 = *v6;
            v97 = *(_QWORD *)&v4[v96];
            if (v97 == -1 || v97 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v98 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v97);
              *(_QWORD *)&v4[v96] = v97 + 1;
              v95 |= (unint64_t)(v98 & 0x7F) << v93;
              if (v98 < 0)
              {
                v93 += 7;
                v16 = v94++ >= 9;
                if (v16)
                {
                  v95 = 0;
                  goto LABEL_221;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v95 = 0;
LABEL_221:
          v135 = v95 != 0;
          v136 = 33;
          goto LABEL_246;
        case 0x10u:
          v99 = 0;
          v100 = 0;
          v101 = 0;
          v5->_hasIsSpecificDateInQuery = 1;
          while (2)
          {
            v102 = *v6;
            v103 = *(_QWORD *)&v4[v102];
            if (v103 == -1 || v103 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v104 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v103);
              *(_QWORD *)&v4[v102] = v103 + 1;
              v101 |= (unint64_t)(v104 & 0x7F) << v99;
              if (v104 < 0)
              {
                v99 += 7;
                v16 = v100++ >= 9;
                if (v16)
                {
                  v101 = 0;
                  goto LABEL_225;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v101 = 0;
LABEL_225:
          v135 = v101 != 0;
          v136 = 35;
          goto LABEL_246;
        case 0x11u:
          v105 = 0;
          v106 = 0;
          v107 = 0;
          v5->_hasIsGeneralDateReferenceInQuery = 1;
          while (2)
          {
            v108 = *v6;
            v109 = *(_QWORD *)&v4[v108];
            if (v109 == -1 || v109 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v110 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v109);
              *(_QWORD *)&v4[v108] = v109 + 1;
              v107 |= (unint64_t)(v110 & 0x7F) << v105;
              if (v110 < 0)
              {
                v105 += 7;
                v16 = v106++ >= 9;
                if (v16)
                {
                  v107 = 0;
                  goto LABEL_229;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v107 = 0;
LABEL_229:
          v135 = v107 != 0;
          v136 = 37;
          goto LABEL_246;
        case 0x12u:
          v111 = 0;
          v112 = 0;
          v113 = 0;
          v5->_hasIsHolidayReferenceInQuery = 1;
          while (2)
          {
            v114 = *v6;
            v115 = *(_QWORD *)&v4[v114];
            if (v115 == -1 || v115 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v116 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v115);
              *(_QWORD *)&v4[v114] = v115 + 1;
              v113 |= (unint64_t)(v116 & 0x7F) << v111;
              if (v116 < 0)
              {
                v111 += 7;
                v16 = v112++ >= 9;
                if (v16)
                {
                  v113 = 0;
                  goto LABEL_233;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v113 = 0;
LABEL_233:
          v135 = v113 != 0;
          v136 = 39;
          goto LABEL_246;
        case 0x13u:
          v117 = 0;
          v118 = 0;
          v119 = 0;
          v5->_hasIsActionRunningInQuery = 1;
          while (2)
          {
            v120 = *v6;
            v121 = *(_QWORD *)&v4[v120];
            if (v121 == -1 || v121 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v122 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v121);
              *(_QWORD *)&v4[v120] = v121 + 1;
              v119 |= (unint64_t)(v122 & 0x7F) << v117;
              if (v122 < 0)
              {
                v117 += 7;
                v16 = v118++ >= 9;
                if (v16)
                {
                  v119 = 0;
                  goto LABEL_237;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v119 = 0;
LABEL_237:
          v135 = v119 != 0;
          v136 = 41;
          goto LABEL_246;
        case 0x14u:
          v123 = 0;
          v124 = 0;
          v125 = 0;
          v5->_hasIsActionHoldingInQuery = 1;
          while (2)
          {
            v126 = *v6;
            v127 = *(_QWORD *)&v4[v126];
            if (v127 == -1 || v127 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v128 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v127);
              *(_QWORD *)&v4[v126] = v127 + 1;
              v125 |= (unint64_t)(v128 & 0x7F) << v123;
              if (v128 < 0)
              {
                v123 += 7;
                v16 = v124++ >= 9;
                if (v16)
                {
                  v125 = 0;
                  goto LABEL_241;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v125 = 0;
LABEL_241:
          v135 = v125 != 0;
          v136 = 43;
          goto LABEL_246;
        case 0x15u:
          v129 = 0;
          v130 = 0;
          v131 = 0;
          v5->_hasIsActionClimbingInQuery = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_249;
          continue;
      }
      while (1)
      {
        v132 = *v6;
        v133 = *(_QWORD *)&v4[v132];
        if (v133 == -1 || v133 >= *(_QWORD *)&v4[*v7])
          break;
        v134 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v133);
        *(_QWORD *)&v4[v132] = v133 + 1;
        v131 |= (unint64_t)(v134 & 0x7F) << v129;
        if ((v134 & 0x80) == 0)
          goto LABEL_243;
        v129 += 7;
        v16 = v130++ >= 9;
        if (v16)
        {
          v131 = 0;
          goto LABEL_245;
        }
      }
      v4[*v8] = 1;
LABEL_243:
      if (v4[*v8])
        v131 = 0;
LABEL_245:
      v135 = v131 != 0;
      v136 = 45;
LABEL_246:
      *((_BYTE *)&v5->super.super.isa + v136) = v135;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_249:
    v138 = 0;
  else
LABEL_250:
    v138 = v5;

  return v138;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_hasWasThereAnyResultsShown)
    PBDataWriterWriteBOOLField();
  if (self->_hasSearchResultSize)
    PBDataWriterWriteUint32Field();
  if (self->_hasDidUserViewAnyPhoto)
    PBDataWriterWriteBOOLField();
  if (self->_hasViewedPhotoCount)
    PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasSizeOfPhotoDB)
    PBDataWriterWriteUint32Field();
  if (self->_hasNumberOfSearchesFromThisSurfaceLastWeek)
    PBDataWriterWriteUint32Field();
  v4 = v5;
  if (self->_hasNumberOfSearchesFromThisSurfaceWeeklyAvg)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_queryRaw)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasNumberOfTokensInQuery)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasNumberOfKnownEntitiesInQuery)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasIsSpecificPersonInQuery)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsGeneralPersonReferenceInQuery)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsSpecificLocationInQuery)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsGeneralLocationReferenceInQuery)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsSpecificDateInQuery)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsGeneralDateReferenceInQuery)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsHolidayReferenceInQuery)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsActionRunningInQuery)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsActionHoldingInQuery)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsActionClimbingInQuery)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAeroMLPhotosSearchInsights writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAeroMLPhotosSearchInsights)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  BMAeroMLPhotosSearchInsights *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  BMAeroMLPhotosSearchInsights *v21;
  BMAeroMLPhotosSearchInsights *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  BMAeroMLPhotosSearchInsights *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  id v71;
  uint64_t v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  void *v90;
  id v91;
  id v92;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  id v117;
  id v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  void *v129;
  id v130;
  uint64_t v131;
  void *v132;
  id v133;
  uint64_t v134;
  id v135;
  void *v136;
  id v137;
  uint64_t v138;
  void *v139;
  void *v140;
  id v141;
  id v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  id v150;
  id v151;
  id v152;
  void *v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id *v158;
  void *v159;
  BMAeroMLPhotosSearchInsights *v160;
  uint64_t v161;
  id v162;
  id v163;
  void *v164;
  void *v165;
  id v166;
  void *v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  id v171;
  uint64_t v172;
  id v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  id v181;
  uint64_t v182;
  id v183;
  uint64_t v184;
  id v185;
  uint64_t v186;
  id v187;
  uint64_t v188;
  id v189;
  uint64_t v190;
  id v191;
  uint64_t v192;
  id v193;
  uint64_t v194;
  void *v195;
  uint64_t v196;
  id v197;
  uint64_t v198;
  id v199;
  uint64_t v200;
  void *v201;
  uint64_t v202;
  void *v203;
  uint64_t v204;
  id v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  _QWORD v209[3];

  v209[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wasThereAnyResultsShown"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v167 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v166 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v166 = v167;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("searchResultSize"));
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v165 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v165;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("didUserViewAnyPhoto"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v9 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("viewedPhotoCount"));
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v164 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v10 = v7;
          v11 = v9;
          v12 = v166;
          v162 = 0;
LABEL_13:
          v160 = self;
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uiSurface"));
          v13 = objc_claimAutoreleasedReturnValue();
          v159 = (void *)v13;
          v166 = v12;
          if (v13 && (v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v157 = v14;
            }
            else
            {
              v153 = v11;
              v139 = v10;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  v34 = 0;
                  v21 = 0;
                  v7 = v10;
                  v9 = v153;
                  goto LABEL_166;
                }
                v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v75 = *MEMORY[0x1E0D025B8];
                v200 = *MEMORY[0x1E0CB2D50];
                v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("uiSurface"));
                v201 = v40;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v201, &v200, 1);
                v76 = objc_claimAutoreleasedReturnValue();
                v77 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v75, 2, v76);
                v34 = 0;
                v21 = 0;
                *a4 = v77;
                v37 = (void *)v76;
                self = v160;
                v7 = v139;
                v9 = v153;
                goto LABEL_165;
              }
              v36 = v14;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAeroMLPhotosSearchInsightsUISurfaceTypeFromString(v36));
              v157 = (id)objc_claimAutoreleasedReturnValue();

            }
          }
          else
          {
            v157 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sizeOfPhotoDB"));
          v158 = a4;
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            objc_opt_class();
            v9 = v11;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              v7 = v10;
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v158)
                {
                  v40 = 0;
                  v21 = 0;
                  v34 = v157;
LABEL_165:

                  goto LABEL_166;
                }
                v151 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v148 = *MEMORY[0x1E0D025B8];
                v198 = *MEMORY[0x1E0CB2D50];
                v34 = v157;
                v155 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("sizeOfPhotoDB"));
                v199 = v155;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v199, &v198, 1);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = 0;
                v40 = 0;
                *v158 = (id)objc_msgSend(v151, "initWithDomain:code:userInfo:", v148, 2, v39);
                goto LABEL_164;
              }
              v38 = v37;
LABEL_42:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numberOfSearchesFromThisSurfaceLastWeek"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v39)
              {
                v146 = 0;
                v155 = 0;
                v40 = v38;
                goto LABEL_50;
              }
              objc_opt_class();
              v40 = v38;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v146 = v39;
                v155 = 0;
                goto LABEL_50;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v146 = v39;
                v155 = v39;
LABEL_50:
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numberOfSearchesFromThisSurfaceWeeklyAvg"));
                v41 = objc_claimAutoreleasedReturnValue();
                v147 = (void *)v41;
                v154 = v9;
                if (!v41 || (v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v150 = 0;
                  goto LABEL_53;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v150 = v42;
LABEL_53:
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queryRaw"));
                  v43 = objc_claimAutoreleasedReturnValue();
                  v143 = v37;
                  v144 = (void *)v43;
                  if (!v43 || (v44 = (void *)v43, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v135 = 0;
LABEL_56:
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numberOfTokensInQuery"));
                    v45 = objc_claimAutoreleasedReturnValue();
                    v136 = (void *)v45;
                    if (v45 && (v46 = (void *)v45, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v21 = (BMAeroMLPhotosSearchInsights *)v158;
                        if (!v158)
                        {
                          v137 = 0;
                          v39 = v146;
                          v34 = v157;
                          v67 = v135;
                          goto LABEL_161;
                        }
                        v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v138 = *MEMORY[0x1E0D025B8];
                        v190 = *MEMORY[0x1E0CB2D50];
                        v34 = v157;
                        v133 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numberOfTokensInQuery"));
                        v191 = v133;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1);
                        v132 = (void *)objc_claimAutoreleasedReturnValue();
                        v79 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v138, 2);
                        v21 = 0;
                        v137 = 0;
                        *v158 = v79;
                        v39 = v146;
                        v67 = v135;
                        goto LABEL_160;
                      }
                      v47 = v40;
                      v48 = v8;
                      v49 = v7;
                      v137 = v46;
                    }
                    else
                    {
                      v47 = v40;
                      v48 = v8;
                      v49 = v7;
                      v137 = 0;
                    }
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numberOfKnownEntitiesInQuery"));
                    v50 = objc_claimAutoreleasedReturnValue();
                    v132 = (void *)v50;
                    if (v50 && (v51 = (void *)v50, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!v158)
                        {
                          v133 = 0;
                          v21 = 0;
                          v39 = v146;
                          v34 = v157;
                          v67 = v135;
                          v7 = v49;
                          v8 = v48;
                          v40 = v47;
                          v37 = v143;
                          goto LABEL_160;
                        }
                        v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v134 = *MEMORY[0x1E0D025B8];
                        v188 = *MEMORY[0x1E0CB2D50];
                        v7 = v49;
                        v8 = v48;
                        v34 = v157;
                        v130 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numberOfKnownEntitiesInQuery"));
                        v189 = v130;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v189, &v188, 1);
                        v129 = (void *)objc_claimAutoreleasedReturnValue();
                        v81 = (id)objc_msgSend(v80, "initWithDomain:code:userInfo:", v134, 2);
                        v21 = 0;
                        v133 = 0;
                        *v158 = v81;
                        v40 = v47;
                        v37 = v143;
                        v39 = v146;
                        v67 = v135;
LABEL_159:

LABEL_160:
                        goto LABEL_161;
                      }
                      v133 = v51;
                    }
                    else
                    {
                      v133 = 0;
                    }
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSpecificPersonInQuery"));
                    v52 = objc_claimAutoreleasedReturnValue();
                    v53 = v49;
                    v129 = (void *)v52;
                    if (v52)
                    {
                      v54 = (void *)v52;
                      objc_opt_class();
                      v8 = v48;
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        objc_opt_class();
                        v40 = v47;
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          v37 = v143;
                          v21 = (BMAeroMLPhotosSearchInsights *)v158;
                          if (!v158)
                          {
                            v130 = 0;
                            v39 = v146;
                            v67 = v135;
                            v7 = v53;
                            v34 = v157;
                            goto LABEL_159;
                          }
                          v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v131 = *MEMORY[0x1E0D025B8];
                          v186 = *MEMORY[0x1E0CB2D50];
                          v7 = v53;
                          v34 = v157;
                          v127 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isSpecificPersonInQuery"));
                          v187 = v127;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v187, &v186, 1);
                          v119 = (void *)objc_claimAutoreleasedReturnValue();
                          v83 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v131, 2);
                          v21 = 0;
                          v130 = 0;
                          *v158 = v83;
                          v37 = v143;
                          v39 = v146;
                          goto LABEL_188;
                        }
                        v130 = v54;
LABEL_75:
                        v37 = v143;
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isGeneralPersonReferenceInQuery"));
                        v55 = objc_claimAutoreleasedReturnValue();
                        v7 = v53;
                        v119 = (void *)v55;
                        if (!v55 || (v56 = (void *)v55, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v127 = 0;
                          goto LABEL_78;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v127 = v56;
LABEL_78:
                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSpecificLocationInQuery"));
                          v57 = objc_claimAutoreleasedReturnValue();
                          v116 = (void *)v57;
                          if (!v57 || (v58 = (void *)v57, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v118 = 0;
                            goto LABEL_81;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v118 = v58;
LABEL_81:
                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isGeneralLocationReferenceInQuery"));
                            v59 = objc_claimAutoreleasedReturnValue();
                            v115 = (void *)v59;
                            if (!v59 || (v60 = (void *)v59, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v117 = 0;
                              goto LABEL_84;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v117 = v60;
LABEL_84:
                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSpecificDateInQuery"));
                              v61 = objc_claimAutoreleasedReturnValue();
                              v113 = (void *)v61;
                              if (!v61 || (v62 = (void *)v61, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v114 = 0;
LABEL_87:
                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isGeneralDateReferenceInQuery"));
                                v63 = (id)objc_claimAutoreleasedReturnValue();
                                v111 = v63;
                                if (!v63)
                                {
LABEL_124:
                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isHolidayReferenceInQuery"));
                                  v84 = (id)objc_claimAutoreleasedReturnValue();
                                  v112 = v63;
                                  v110 = v84;
                                  if (!v84)
                                  {
LABEL_132:
                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isActionRunningInQuery"));
                                    v87 = (id)objc_claimAutoreleasedReturnValue();
                                    v109 = v84;
                                    v107 = v87;
                                    if (!v87)
                                    {
LABEL_141:
                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isActionHoldingInQuery"));
                                      v89 = objc_claimAutoreleasedReturnValue();
                                      v105 = (void *)v89;
                                      v106 = v87;
                                      if (v89
                                        && (v90 = (void *)v89, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                        {
                                          v21 = (BMAeroMLPhotosSearchInsights *)v158;
                                          if (!v158)
                                          {
                                            v108 = 0;
                                            self = v160;
                                            v39 = v146;
                                            v34 = v157;
                                            goto LABEL_151;
                                          }
                                          v99 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v126 = *MEMORY[0x1E0D025B8];
                                          v170 = *MEMORY[0x1E0CB2D50];
                                          v34 = v157;
                                          v91 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isActionHoldingInQuery"));
                                          v171 = v91;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v171, &v170, 1);
                                          v104 = (void *)objc_claimAutoreleasedReturnValue();
                                          v21 = 0;
                                          v108 = 0;
                                          *v158 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v126, 2);
                                          v37 = v143;
                                          goto LABEL_149;
                                        }
                                        v108 = v90;
                                      }
                                      else
                                      {
                                        v108 = 0;
                                      }
                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isActionClimbingInQuery"));
                                      v91 = (id)objc_claimAutoreleasedReturnValue();
                                      v104 = v91;
                                      if (v91)
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                        {
                                          objc_opt_class();
                                          v92 = v117;
                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                          {
                                            v21 = (BMAeroMLPhotosSearchInsights *)v158;
                                            if (!v158)
                                            {
                                              v91 = 0;
                                              v39 = v146;
                                              v34 = v157;
                                              goto LABEL_150;
                                            }
                                            v100 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v101 = *MEMORY[0x1E0D025B8];
                                            v168 = *MEMORY[0x1E0CB2D50];
                                            v142 = v7;
                                            v102 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isActionClimbingInQuery"));
                                            v169 = v102;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v169, &v168, 1);
                                            v103 = (void *)objc_claimAutoreleasedReturnValue();
                                            v34 = v157;
                                            *v158 = (id)objc_msgSend(v100, "initWithDomain:code:userInfo:", v101, 2, v103);

                                            v7 = v142;
                                            v91 = 0;
                                            v21 = 0;
LABEL_149:
                                            v39 = v146;
LABEL_150:

                                            self = v160;
LABEL_151:
                                            v67 = v135;

LABEL_152:
LABEL_153:

LABEL_154:
LABEL_155:

LABEL_156:
LABEL_157:

LABEL_158:
                                            goto LABEL_159;
                                          }
                                          v91 = v91;
LABEL_148:
                                          v34 = v157;
                                          v117 = v92;
                                          v21 = objc_retain(-[BMAeroMLPhotosSearchInsights initWithWasThereAnyResultsShown:searchResultSize:didUserViewAnyPhoto:viewedPhotoCount:uiSurface:sizeOfPhotoDB:numberOfSearchesFromThisSurfaceLastWeek:numberOfSearchesFromThisSurfaceWeeklyAvg:queryRaw:numberOfTokensInQuery:numberOfKnownEntitiesInQuery:isSpecificPersonInQuery:isGeneralPersonReferenceInQuery:isSpecificLocationInQuery:isGeneralLocationReferenceInQuery:isSpecificDateInQuery:isGeneralDateReferenceInQuery:isHolidayReferenceInQuery:isActionRunningInQuery:isActionHoldingInQuery:isActionClimbingInQuery:](v160, "initWithWasThereAnyResultsShown:searchResultSize:didUserViewAnyPhoto:viewedPhotoCount:uiSurface:sizeOfPhotoDB:numberOfSearchesFromThisSurfaceLastWeek:numberOfSearchesFromThisSurfaceWeeklyAvg:queryRaw:numberOfTokensInQuery:numberOfKnownEntitiesInQuery:isSpecificPersonInQuery:isGeneralPersonReferenceInQuery:isSpecificLocationInQuery:isGeneralLocationReferenceInQuery:isSpecificDateInQuery:isGeneralDateReferenceInQuery:isHolidayReferenceInQuery:isActionRunningInQuery:isActionHoldingInQuery:isActionClimbingInQuery:", v166, v7, v154, v162, objc_msgSend(v157, "intValue"), v40, v155, v150, v135,
                                                    v137,
                                                    v133,
                                                    v130,
                                                    v127,
                                                    v118,
                                                    v92,
                                                    v114,
                                                    v112,
                                                    v84,
                                                    v87,
                                                    v108,
                                                    v91));
                                          v160 = v21;
                                          goto LABEL_149;
                                        }
                                        v91 = 0;
                                      }
                                      v92 = v117;
                                      goto LABEL_148;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v87 = 0;
                                      goto LABEL_141;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v87 = v87;
                                      goto LABEL_141;
                                    }
                                    v21 = (BMAeroMLPhotosSearchInsights *)v158;
                                    if (v158)
                                    {
                                      v98 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v125 = *MEMORY[0x1E0D025B8];
                                      v172 = *MEMORY[0x1E0CB2D50];
                                      v34 = v157;
                                      v108 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isActionRunningInQuery"));
                                      v173 = v108;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v173, &v172, 1);
                                      v105 = (void *)objc_claimAutoreleasedReturnValue();
                                      v21 = 0;
                                      v106 = 0;
                                      *v158 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v125, 2);
                                      v37 = v143;
                                      v39 = v146;
                                      goto LABEL_151;
                                    }
                                    v106 = 0;
                                    v39 = v146;
                                    v34 = v157;
LABEL_206:
                                    v67 = v135;
                                    goto LABEL_152;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v84 = 0;
                                    goto LABEL_132;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v84 = v84;
                                    goto LABEL_132;
                                  }
                                  v21 = (BMAeroMLPhotosSearchInsights *)v158;
                                  if (v158)
                                  {
                                    v97 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v124 = *MEMORY[0x1E0D025B8];
                                    v174 = *MEMORY[0x1E0CB2D50];
                                    v34 = v157;
                                    v106 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isHolidayReferenceInQuery"));
                                    v175 = v106;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v175, &v174, 1);
                                    v107 = (void *)objc_claimAutoreleasedReturnValue();
                                    v21 = 0;
                                    v109 = 0;
                                    *v158 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v124, 2);
                                    v37 = v143;
                                    v39 = v146;
                                    goto LABEL_206;
                                  }
                                  v109 = 0;
                                  v39 = v146;
                                  v34 = v157;
LABEL_204:
                                  v67 = v135;
                                  goto LABEL_153;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v63 = 0;
                                  goto LABEL_124;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v63 = v63;
                                  goto LABEL_124;
                                }
                                v21 = (BMAeroMLPhotosSearchInsights *)v158;
                                if (v158)
                                {
                                  v96 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v123 = *MEMORY[0x1E0D025B8];
                                  v176 = *MEMORY[0x1E0CB2D50];
                                  v34 = v157;
                                  v109 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isGeneralDateReferenceInQuery"));
                                  v177 = v109;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v177, &v176, 1);
                                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                                  v21 = 0;
                                  v112 = 0;
                                  *v158 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v123, 2);
                                  v37 = v143;
                                  v39 = v146;
                                  goto LABEL_204;
                                }
                                v112 = 0;
                                v39 = v146;
                                v34 = v157;
LABEL_202:
                                v67 = v135;
                                goto LABEL_154;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v114 = v62;
                                goto LABEL_87;
                              }
                              v21 = (BMAeroMLPhotosSearchInsights *)v158;
                              if (v158)
                              {
                                v95 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v122 = *MEMORY[0x1E0D025B8];
                                v178 = *MEMORY[0x1E0CB2D50];
                                v34 = v157;
                                v112 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isSpecificDateInQuery"));
                                v179 = v112;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1);
                                v111 = (void *)objc_claimAutoreleasedReturnValue();
                                v21 = 0;
                                v114 = 0;
                                *v158 = (id)objc_msgSend(v95, "initWithDomain:code:userInfo:", v122, 2);
                                v37 = v143;
                                v39 = v146;
                                goto LABEL_202;
                              }
                              v114 = 0;
                              v39 = v146;
                              v34 = v157;
LABEL_200:
                              v67 = v135;
                              goto LABEL_155;
                            }
                            v21 = (BMAeroMLPhotosSearchInsights *)v158;
                            if (v158)
                            {
                              v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v121 = *MEMORY[0x1E0D025B8];
                              v180 = *MEMORY[0x1E0CB2D50];
                              v34 = v157;
                              v114 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isGeneralLocationReferenceInQuery"));
                              v181 = v114;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v181, &v180, 1);
                              v113 = (void *)objc_claimAutoreleasedReturnValue();
                              v21 = 0;
                              v117 = 0;
                              *v158 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v121, 2);
                              v37 = v143;
                              v39 = v146;
                              goto LABEL_200;
                            }
                            v117 = 0;
                            v39 = v146;
                            v34 = v157;
LABEL_196:
                            v67 = v135;
                            goto LABEL_156;
                          }
                          v21 = (BMAeroMLPhotosSearchInsights *)v158;
                          if (v158)
                          {
                            v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v120 = *MEMORY[0x1E0D025B8];
                            v182 = *MEMORY[0x1E0CB2D50];
                            v34 = v157;
                            v117 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isSpecificLocationInQuery"));
                            v183 = v117;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v183, &v182, 1);
                            v115 = (void *)objc_claimAutoreleasedReturnValue();
                            v21 = 0;
                            v118 = 0;
                            *v158 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v120, 2);
                            v37 = v143;
                            v39 = v146;
                            goto LABEL_196;
                          }
                          v118 = 0;
                          v39 = v146;
                          v34 = v157;
LABEL_192:
                          v67 = v135;
                          goto LABEL_157;
                        }
                        v21 = (BMAeroMLPhotosSearchInsights *)v158;
                        if (v158)
                        {
                          v85 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v128 = *MEMORY[0x1E0D025B8];
                          v184 = *MEMORY[0x1E0CB2D50];
                          v34 = v157;
                          v118 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isGeneralPersonReferenceInQuery"));
                          v185 = v118;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v185, &v184, 1);
                          v116 = (void *)objc_claimAutoreleasedReturnValue();
                          v86 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v128, 2);
                          v21 = 0;
                          v127 = 0;
                          *v158 = v86;
                          v37 = v143;
                          v39 = v146;
                          goto LABEL_192;
                        }
                        v127 = 0;
                        v39 = v146;
                        v34 = v157;
LABEL_188:
                        v67 = v135;
                        goto LABEL_158;
                      }
                      v130 = 0;
                    }
                    else
                    {
                      v130 = 0;
                      v8 = v48;
                    }
                    v40 = v47;
                    goto LABEL_75;
                  }
                  v140 = v40;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v135 = v44;
                    goto LABEL_56;
                  }
                  if (v158)
                  {
                    v71 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v72 = *MEMORY[0x1E0D025B8];
                    v192 = *MEMORY[0x1E0CB2D50];
                    v137 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("queryRaw"));
                    v193 = v137;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v193, &v192, 1);
                    v136 = (void *)objc_claimAutoreleasedReturnValue();
                    v73 = (id)objc_msgSend(v71, "initWithDomain:code:userInfo:", v72, 2);
                    v21 = 0;
                    v67 = 0;
                    *v158 = v73;
                    v34 = v157;
                    v39 = v146;
LABEL_161:

                    goto LABEL_162;
                  }
                  v67 = 0;
                  v21 = 0;
                  v34 = v157;
LABEL_138:
                  v40 = v140;
                  v39 = v146;
LABEL_162:

                  v9 = v154;
                  goto LABEL_163;
                }
                v21 = (BMAeroMLPhotosSearchInsights *)v158;
                if (v158)
                {
                  v152 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v145 = *MEMORY[0x1E0D025B8];
                  v194 = *MEMORY[0x1E0CB2D50];
                  v140 = v40;
                  v34 = v157;
                  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numberOfSearchesFromThisSurfaceWeeklyAvg"));
                  v195 = v67;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v195, &v194, 1);
                  v68 = objc_claimAutoreleasedReturnValue();
                  v69 = v145;
                  v144 = (void *)v68;
                  v70 = (id)objc_msgSend(v152, "initWithDomain:code:userInfo:", v69, 2);
                  v21 = 0;
                  v150 = 0;
                  *v158 = v70;
                  goto LABEL_138;
                }
                v150 = 0;
                v39 = v146;
                v34 = v157;
LABEL_163:

                goto LABEL_164;
              }
              v21 = (BMAeroMLPhotosSearchInsights *)v158;
              if (v158)
              {
                v156 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v149 = *MEMORY[0x1E0D025B8];
                v196 = *MEMORY[0x1E0CB2D50];
                v141 = v38;
                v34 = v157;
                v150 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numberOfSearchesFromThisSurfaceLastWeek"));
                v197 = v150;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v197, &v196, 1);
                v64 = objc_claimAutoreleasedReturnValue();
                v65 = v149;
                v147 = (void *)v64;
                v66 = (id)objc_msgSend(v156, "initWithDomain:code:userInfo:", v65, 2);
                v21 = 0;
                v155 = 0;
                *v158 = v66;
                v40 = v141;
                goto LABEL_163;
              }
              v155 = 0;
              v34 = v157;
LABEL_164:

              goto LABEL_165;
            }
            v38 = 0;
          }
          else
          {
            v38 = 0;
            v9 = v11;
          }
          v7 = v10;
          goto LABEL_42;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v7;
          v11 = v9;
          v12 = v166;
          v162 = v164;
          goto LABEL_13;
        }
        if (a4)
        {
          v163 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v161 = *MEMORY[0x1E0D025B8];
          v202 = *MEMORY[0x1E0CB2D50];
          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("viewedPhotoCount"));
          v203 = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v203, &v202, 1);
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (id)objc_msgSend(v163, "initWithDomain:code:userInfo:", v161, 2);
          v162 = 0;
          v21 = 0;
          *a4 = v35;
LABEL_166:

          goto LABEL_167;
        }
        v162 = 0;
        v21 = 0;
LABEL_167:

        goto LABEL_168;
      }
      if (a4)
      {
        v28 = self;
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = *MEMORY[0x1E0D025B8];
        v204 = *MEMORY[0x1E0CB2D50];
        v162 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("didUserViewAnyPhoto"));
        v205 = v162;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v205, &v204, 1);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v29;
        self = v28;
        v164 = (void *)v31;
        v33 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v30, 2, v31);
        v9 = 0;
        v21 = 0;
        *a4 = v33;
        goto LABEL_167;
      }
      v9 = 0;
      v21 = 0;
LABEL_168:

      goto LABEL_169;
    }
    if (a4)
    {
      v22 = self;
      v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v24 = *MEMORY[0x1E0D025B8];
      v206 = *MEMORY[0x1E0CB2D50];
      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("searchResultSize"));
      v207 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v207, &v206, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v23;
      self = v22;
      v9 = (id)v25;
      v27 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v24, 2, v8);
      v7 = 0;
      v21 = 0;
      *a4 = v27;
      goto LABEL_168;
    }
    v7 = 0;
    v21 = 0;
LABEL_169:

    goto LABEL_170;
  }
  if (a4)
  {
    v15 = self;
    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = *MEMORY[0x1E0D025B8];
    v208 = *MEMORY[0x1E0CB2D50];
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("wasThereAnyResultsShown"));
    v209[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v209, &v208, 1);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v16;
    self = v15;
    v165 = (void *)v18;
    v20 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v17, 2);
    v166 = 0;
    v21 = 0;
    *a4 = v20;
    goto LABEL_169;
  }
  v166 = 0;
  v21 = 0;
LABEL_170:

  return v21;
}

- (id)jsonDictionary
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  _QWORD v72[21];
  _QWORD v73[23];

  v73[21] = *MEMORY[0x1E0C80C00];
  if (-[BMAeroMLPhotosSearchInsights hasWasThereAnyResultsShown](self, "hasWasThereAnyResultsShown"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights wasThereAnyResultsShown](self, "wasThereAnyResultsShown"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  if (-[BMAeroMLPhotosSearchInsights hasSearchResultSize](self, "hasSearchResultSize"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights searchResultSize](self, "searchResultSize"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  if (-[BMAeroMLPhotosSearchInsights hasDidUserViewAnyPhoto](self, "hasDidUserViewAnyPhoto"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights didUserViewAnyPhoto](self, "didUserViewAnyPhoto"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (-[BMAeroMLPhotosSearchInsights hasViewedPhotoCount](self, "hasViewedPhotoCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights viewedPhotoCount](self, "viewedPhotoCount"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAeroMLPhotosSearchInsights uiSurface](self, "uiSurface"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (-[BMAeroMLPhotosSearchInsights hasSizeOfPhotoDB](self, "hasSizeOfPhotoDB"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights sizeOfPhotoDB](self, "sizeOfPhotoDB"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (-[BMAeroMLPhotosSearchInsights hasNumberOfSearchesFromThisSurfaceLastWeek](self, "hasNumberOfSearchesFromThisSurfaceLastWeek"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights numberOfSearchesFromThisSurfaceLastWeek](self, "numberOfSearchesFromThisSurfaceLastWeek"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (-[BMAeroMLPhotosSearchInsights hasNumberOfSearchesFromThisSurfaceWeeklyAvg](self, "hasNumberOfSearchesFromThisSurfaceWeeklyAvg"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights numberOfSearchesFromThisSurfaceWeeklyAvg](self, "numberOfSearchesFromThisSurfaceWeeklyAvg"));
    v71 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v71 = 0;
  }
  -[BMAeroMLPhotosSearchInsights queryRaw](self, "queryRaw");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMAeroMLPhotosSearchInsights hasNumberOfTokensInQuery](self, "hasNumberOfTokensInQuery"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights numberOfTokensInQuery](self, "numberOfTokensInQuery"));
    v69 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v69 = 0;
  }
  if (-[BMAeroMLPhotosSearchInsights hasNumberOfKnownEntitiesInQuery](self, "hasNumberOfKnownEntitiesInQuery"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights numberOfKnownEntitiesInQuery](self, "numberOfKnownEntitiesInQuery"));
    v68 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v68 = 0;
  }
  if (-[BMAeroMLPhotosSearchInsights hasIsSpecificPersonInQuery](self, "hasIsSpecificPersonInQuery"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isSpecificPersonInQuery](self, "isSpecificPersonInQuery"));
    v67 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v67 = 0;
  }
  if (-[BMAeroMLPhotosSearchInsights hasIsGeneralPersonReferenceInQuery](self, "hasIsGeneralPersonReferenceInQuery"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isGeneralPersonReferenceInQuery](self, "isGeneralPersonReferenceInQuery"));
    v66 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v66 = 0;
  }
  if (-[BMAeroMLPhotosSearchInsights hasIsSpecificLocationInQuery](self, "hasIsSpecificLocationInQuery"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isSpecificLocationInQuery](self, "isSpecificLocationInQuery"));
    v65 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v65 = 0;
  }
  if (-[BMAeroMLPhotosSearchInsights hasIsGeneralLocationReferenceInQuery](self, "hasIsGeneralLocationReferenceInQuery"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isGeneralLocationReferenceInQuery](self, "isGeneralLocationReferenceInQuery"));
    v64 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v64 = 0;
  }
  if (-[BMAeroMLPhotosSearchInsights hasIsSpecificDateInQuery](self, "hasIsSpecificDateInQuery"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isSpecificDateInQuery](self, "isSpecificDateInQuery"));
    v63 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v63 = 0;
  }
  if (-[BMAeroMLPhotosSearchInsights hasIsGeneralDateReferenceInQuery](self, "hasIsGeneralDateReferenceInQuery"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isGeneralDateReferenceInQuery](self, "isGeneralDateReferenceInQuery"));
    v62 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v62 = 0;
  }
  if (-[BMAeroMLPhotosSearchInsights hasIsHolidayReferenceInQuery](self, "hasIsHolidayReferenceInQuery"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isHolidayReferenceInQuery](self, "isHolidayReferenceInQuery"));
    v61 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v61 = 0;
  }
  if (-[BMAeroMLPhotosSearchInsights hasIsActionRunningInQuery](self, "hasIsActionRunningInQuery"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isActionRunningInQuery](self, "isActionRunningInQuery"));
    v60 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v60 = 0;
  }
  if (-[BMAeroMLPhotosSearchInsights hasIsActionHoldingInQuery](self, "hasIsActionHoldingInQuery"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isActionHoldingInQuery](self, "isActionHoldingInQuery"));
    v59 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v59 = 0;
  }
  if (-[BMAeroMLPhotosSearchInsights hasIsActionClimbingInQuery](self, "hasIsActionClimbingInQuery"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchInsights isActionClimbingInQuery](self, "isActionClimbingInQuery"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v72[0] = CFSTR("wasThereAnyResultsShown");
  v11 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v11;
  v73[0] = v11;
  v72[1] = CFSTR("searchResultSize");
  v12 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v49 = (void *)v12;
  v73[1] = v12;
  v72[2] = CFSTR("didUserViewAnyPhoto");
  v13 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v13;
  v73[2] = v13;
  v72[3] = CFSTR("viewedPhotoCount");
  v14 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v14;
  v73[3] = v14;
  v72[4] = CFSTR("uiSurface");
  v15 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v15;
  v73[4] = v15;
  v72[5] = CFSTR("sizeOfPhotoDB");
  v16 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v16;
  v73[5] = v16;
  v72[6] = CFSTR("numberOfSearchesFromThisSurfaceLastWeek");
  v17 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v17;
  v73[6] = v17;
  v72[7] = CFSTR("numberOfSearchesFromThisSurfaceWeeklyAvg");
  v18 = (uint64_t)v71;
  if (!v71)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v73[7] = v18;
  v72[8] = CFSTR("queryRaw");
  v19 = (uint64_t)v70;
  if (!v70)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v73[8] = v19;
  v72[9] = CFSTR("numberOfTokensInQuery");
  v20 = (uint64_t)v69;
  if (!v69)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v20;
  v73[9] = v20;
  v72[10] = CFSTR("numberOfKnownEntitiesInQuery");
  v21 = (uint64_t)v68;
  if (!v68)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v57 = v5;
  v73[10] = v21;
  v72[11] = CFSTR("isSpecificPersonInQuery");
  v22 = (uint64_t)v67;
  v23 = (void *)v21;
  if (!v67)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v58 = v3;
  v73[11] = v22;
  v72[12] = CFSTR("isGeneralPersonReferenceInQuery");
  v24 = (uint64_t)v66;
  v25 = (void *)v22;
  if (!v66)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v55 = (void *)v7;
  v73[12] = v24;
  v72[13] = CFSTR("isSpecificLocationInQuery");
  v26 = (uint64_t)v65;
  v27 = (void *)v24;
  if (!v65)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v56 = v6;
  v52 = (void *)v26;
  v73[13] = v26;
  v72[14] = CFSTR("isGeneralLocationReferenceInQuery");
  v28 = (uint64_t)v64;
  if (!v64)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v19;
  v38 = v28;
  v73[14] = v28;
  v72[15] = CFSTR("isSpecificDateInQuery");
  v29 = v63;
  if (!v63)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40 = v25;
  v54 = v8;
  v73[15] = v29;
  v72[16] = CFSTR("isGeneralDateReferenceInQuery");
  v30 = v62;
  if (!v62)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v18;
  v31 = v9;
  v73[16] = v30;
  v72[17] = CFSTR("isHolidayReferenceInQuery");
  v32 = v61;
  if (!v61)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = v4;
  v73[17] = v32;
  v72[18] = CFSTR("isActionRunningInQuery");
  v34 = v60;
  if (!v60)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41 = v23;
  v73[18] = v34;
  v72[19] = CFSTR("isActionHoldingInQuery");
  v35 = v59;
  if (!v59)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v73[19] = v35;
  v72[20] = CFSTR("isActionClimbingInQuery");
  v36 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v73[20] = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 21, v38);
  v51 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)

  if (!v59)
  if (!v60)

  if (!v61)
  if (!v62)

  if (!v63)
  if (!v64)

  if (!v65)
  if (!v66)

  if (!v67)
  if (!v68)

  if (!v69)
  if (!v70)

  if (v71)
  {
    if (v31)
      goto LABEL_128;
  }
  else
  {

    if (v31)
    {
LABEL_128:
      if (v54)
        goto LABEL_129;
      goto LABEL_137;
    }
  }

  if (v54)
  {
LABEL_129:
    if (v55)
      goto LABEL_130;
    goto LABEL_138;
  }
LABEL_137:

  if (v55)
  {
LABEL_130:
    if (v56)
      goto LABEL_131;
    goto LABEL_139;
  }
LABEL_138:

  if (v56)
  {
LABEL_131:
    if (v57)
      goto LABEL_132;
    goto LABEL_140;
  }
LABEL_139:

  if (v57)
  {
LABEL_132:
    if (v33)
      goto LABEL_133;
LABEL_141:

    if (v58)
      goto LABEL_134;
LABEL_142:

    goto LABEL_134;
  }
LABEL_140:

  if (!v33)
    goto LABEL_141;
LABEL_133:
  if (!v58)
    goto LABEL_142;
LABEL_134:

  return v51;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  _BOOL4 v32;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMAeroMLPhotosSearchInsights hasWasThereAnyResultsShown](self, "hasWasThereAnyResultsShown")
      || objc_msgSend(v5, "hasWasThereAnyResultsShown"))
    {
      if (!-[BMAeroMLPhotosSearchInsights hasWasThereAnyResultsShown](self, "hasWasThereAnyResultsShown"))
        goto LABEL_103;
      if (!objc_msgSend(v5, "hasWasThereAnyResultsShown"))
        goto LABEL_103;
      v6 = -[BMAeroMLPhotosSearchInsights wasThereAnyResultsShown](self, "wasThereAnyResultsShown");
      if (v6 != objc_msgSend(v5, "wasThereAnyResultsShown"))
        goto LABEL_103;
    }
    if (-[BMAeroMLPhotosSearchInsights hasSearchResultSize](self, "hasSearchResultSize")
      || objc_msgSend(v5, "hasSearchResultSize"))
    {
      if (!-[BMAeroMLPhotosSearchInsights hasSearchResultSize](self, "hasSearchResultSize"))
        goto LABEL_103;
      if (!objc_msgSend(v5, "hasSearchResultSize"))
        goto LABEL_103;
      v7 = -[BMAeroMLPhotosSearchInsights searchResultSize](self, "searchResultSize");
      if (v7 != objc_msgSend(v5, "searchResultSize"))
        goto LABEL_103;
    }
    if (-[BMAeroMLPhotosSearchInsights hasDidUserViewAnyPhoto](self, "hasDidUserViewAnyPhoto")
      || objc_msgSend(v5, "hasDidUserViewAnyPhoto"))
    {
      if (!-[BMAeroMLPhotosSearchInsights hasDidUserViewAnyPhoto](self, "hasDidUserViewAnyPhoto"))
        goto LABEL_103;
      if (!objc_msgSend(v5, "hasDidUserViewAnyPhoto"))
        goto LABEL_103;
      v8 = -[BMAeroMLPhotosSearchInsights didUserViewAnyPhoto](self, "didUserViewAnyPhoto");
      if (v8 != objc_msgSend(v5, "didUserViewAnyPhoto"))
        goto LABEL_103;
    }
    if (-[BMAeroMLPhotosSearchInsights hasViewedPhotoCount](self, "hasViewedPhotoCount")
      || objc_msgSend(v5, "hasViewedPhotoCount"))
    {
      if (!-[BMAeroMLPhotosSearchInsights hasViewedPhotoCount](self, "hasViewedPhotoCount"))
        goto LABEL_103;
      if (!objc_msgSend(v5, "hasViewedPhotoCount"))
        goto LABEL_103;
      v9 = -[BMAeroMLPhotosSearchInsights viewedPhotoCount](self, "viewedPhotoCount");
      if (v9 != objc_msgSend(v5, "viewedPhotoCount"))
        goto LABEL_103;
    }
    v10 = -[BMAeroMLPhotosSearchInsights uiSurface](self, "uiSurface");
    if (v10 != objc_msgSend(v5, "uiSurface"))
      goto LABEL_103;
    if (-[BMAeroMLPhotosSearchInsights hasSizeOfPhotoDB](self, "hasSizeOfPhotoDB")
      || objc_msgSend(v5, "hasSizeOfPhotoDB"))
    {
      if (!-[BMAeroMLPhotosSearchInsights hasSizeOfPhotoDB](self, "hasSizeOfPhotoDB"))
        goto LABEL_103;
      if (!objc_msgSend(v5, "hasSizeOfPhotoDB"))
        goto LABEL_103;
      v11 = -[BMAeroMLPhotosSearchInsights sizeOfPhotoDB](self, "sizeOfPhotoDB");
      if (v11 != objc_msgSend(v5, "sizeOfPhotoDB"))
        goto LABEL_103;
    }
    if (-[BMAeroMLPhotosSearchInsights hasNumberOfSearchesFromThisSurfaceLastWeek](self, "hasNumberOfSearchesFromThisSurfaceLastWeek")|| objc_msgSend(v5, "hasNumberOfSearchesFromThisSurfaceLastWeek"))
    {
      if (!-[BMAeroMLPhotosSearchInsights hasNumberOfSearchesFromThisSurfaceLastWeek](self, "hasNumberOfSearchesFromThisSurfaceLastWeek"))goto LABEL_103;
      if (!objc_msgSend(v5, "hasNumberOfSearchesFromThisSurfaceLastWeek"))
        goto LABEL_103;
      v12 = -[BMAeroMLPhotosSearchInsights numberOfSearchesFromThisSurfaceLastWeek](self, "numberOfSearchesFromThisSurfaceLastWeek");
      if (v12 != objc_msgSend(v5, "numberOfSearchesFromThisSurfaceLastWeek"))
        goto LABEL_103;
    }
    if (-[BMAeroMLPhotosSearchInsights hasNumberOfSearchesFromThisSurfaceWeeklyAvg](self, "hasNumberOfSearchesFromThisSurfaceWeeklyAvg")|| objc_msgSend(v5, "hasNumberOfSearchesFromThisSurfaceWeeklyAvg"))
    {
      if (!-[BMAeroMLPhotosSearchInsights hasNumberOfSearchesFromThisSurfaceWeeklyAvg](self, "hasNumberOfSearchesFromThisSurfaceWeeklyAvg"))goto LABEL_103;
      if (!objc_msgSend(v5, "hasNumberOfSearchesFromThisSurfaceWeeklyAvg"))
        goto LABEL_103;
      v13 = -[BMAeroMLPhotosSearchInsights numberOfSearchesFromThisSurfaceWeeklyAvg](self, "numberOfSearchesFromThisSurfaceWeeklyAvg");
      if (v13 != objc_msgSend(v5, "numberOfSearchesFromThisSurfaceWeeklyAvg"))
        goto LABEL_103;
    }
    -[BMAeroMLPhotosSearchInsights queryRaw](self, "queryRaw");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryRaw");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMAeroMLPhotosSearchInsights queryRaw](self, "queryRaw");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "queryRaw");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_103;
    }
    if (!-[BMAeroMLPhotosSearchInsights hasNumberOfTokensInQuery](self, "hasNumberOfTokensInQuery")
      && !objc_msgSend(v5, "hasNumberOfTokensInQuery")
      || -[BMAeroMLPhotosSearchInsights hasNumberOfTokensInQuery](self, "hasNumberOfTokensInQuery")
      && objc_msgSend(v5, "hasNumberOfTokensInQuery")
      && (v21 = -[BMAeroMLPhotosSearchInsights numberOfTokensInQuery](self, "numberOfTokensInQuery"),
          v21 == objc_msgSend(v5, "numberOfTokensInQuery")))
    {
      if (!-[BMAeroMLPhotosSearchInsights hasNumberOfKnownEntitiesInQuery](self, "hasNumberOfKnownEntitiesInQuery")
        && !objc_msgSend(v5, "hasNumberOfKnownEntitiesInQuery")
        || -[BMAeroMLPhotosSearchInsights hasNumberOfKnownEntitiesInQuery](self, "hasNumberOfKnownEntitiesInQuery")
        && objc_msgSend(v5, "hasNumberOfKnownEntitiesInQuery")
        && (v22 = -[BMAeroMLPhotosSearchInsights numberOfKnownEntitiesInQuery](self, "numberOfKnownEntitiesInQuery"),
            v22 == objc_msgSend(v5, "numberOfKnownEntitiesInQuery")))
      {
        if (!-[BMAeroMLPhotosSearchInsights hasIsSpecificPersonInQuery](self, "hasIsSpecificPersonInQuery")
          && !objc_msgSend(v5, "hasIsSpecificPersonInQuery")
          || -[BMAeroMLPhotosSearchInsights hasIsSpecificPersonInQuery](self, "hasIsSpecificPersonInQuery")
          && objc_msgSend(v5, "hasIsSpecificPersonInQuery")
          && (v23 = -[BMAeroMLPhotosSearchInsights isSpecificPersonInQuery](self, "isSpecificPersonInQuery"),
              v23 == objc_msgSend(v5, "isSpecificPersonInQuery")))
        {
          if (!-[BMAeroMLPhotosSearchInsights hasIsGeneralPersonReferenceInQuery](self, "hasIsGeneralPersonReferenceInQuery")&& !objc_msgSend(v5, "hasIsGeneralPersonReferenceInQuery")|| -[BMAeroMLPhotosSearchInsights hasIsGeneralPersonReferenceInQuery](self, "hasIsGeneralPersonReferenceInQuery")&& objc_msgSend(v5, "hasIsGeneralPersonReferenceInQuery")&& (v24 = -[BMAeroMLPhotosSearchInsights isGeneralPersonReferenceInQuery](self, "isGeneralPersonReferenceInQuery"), v24 == objc_msgSend(v5, "isGeneralPersonReferenceInQuery")))
          {
            if (!-[BMAeroMLPhotosSearchInsights hasIsSpecificLocationInQuery](self, "hasIsSpecificLocationInQuery")
              && !objc_msgSend(v5, "hasIsSpecificLocationInQuery")
              || -[BMAeroMLPhotosSearchInsights hasIsSpecificLocationInQuery](self, "hasIsSpecificLocationInQuery")
              && objc_msgSend(v5, "hasIsSpecificLocationInQuery")
              && (v25 = -[BMAeroMLPhotosSearchInsights isSpecificLocationInQuery](self, "isSpecificLocationInQuery"),
                  v25 == objc_msgSend(v5, "isSpecificLocationInQuery")))
            {
              if (!-[BMAeroMLPhotosSearchInsights hasIsGeneralLocationReferenceInQuery](self, "hasIsGeneralLocationReferenceInQuery")&& !objc_msgSend(v5, "hasIsGeneralLocationReferenceInQuery")|| -[BMAeroMLPhotosSearchInsights hasIsGeneralLocationReferenceInQuery](self, "hasIsGeneralLocationReferenceInQuery")&& objc_msgSend(v5, "hasIsGeneralLocationReferenceInQuery")&& (v26 = -[BMAeroMLPhotosSearchInsights isGeneralLocationReferenceInQuery](self, "isGeneralLocationReferenceInQuery"), v26 == objc_msgSend(v5, "isGeneralLocationReferenceInQuery")))
              {
                if (!-[BMAeroMLPhotosSearchInsights hasIsSpecificDateInQuery](self, "hasIsSpecificDateInQuery")
                  && !objc_msgSend(v5, "hasIsSpecificDateInQuery")
                  || -[BMAeroMLPhotosSearchInsights hasIsSpecificDateInQuery](self, "hasIsSpecificDateInQuery")
                  && objc_msgSend(v5, "hasIsSpecificDateInQuery")
                  && (v27 = -[BMAeroMLPhotosSearchInsights isSpecificDateInQuery](self, "isSpecificDateInQuery"),
                      v27 == objc_msgSend(v5, "isSpecificDateInQuery")))
                {
                  if (!-[BMAeroMLPhotosSearchInsights hasIsGeneralDateReferenceInQuery](self, "hasIsGeneralDateReferenceInQuery")&& !objc_msgSend(v5, "hasIsGeneralDateReferenceInQuery")|| -[BMAeroMLPhotosSearchInsights hasIsGeneralDateReferenceInQuery](self, "hasIsGeneralDateReferenceInQuery")&& objc_msgSend(v5, "hasIsGeneralDateReferenceInQuery")&& (v28 = -[BMAeroMLPhotosSearchInsights isGeneralDateReferenceInQuery](self, "isGeneralDateReferenceInQuery"), v28 == objc_msgSend(v5, "isGeneralDateReferenceInQuery")))
                  {
                    if (!-[BMAeroMLPhotosSearchInsights hasIsHolidayReferenceInQuery](self, "hasIsHolidayReferenceInQuery")&& !objc_msgSend(v5, "hasIsHolidayReferenceInQuery")|| -[BMAeroMLPhotosSearchInsights hasIsHolidayReferenceInQuery](self, "hasIsHolidayReferenceInQuery")&& objc_msgSend(v5, "hasIsHolidayReferenceInQuery")&& (v29 = -[BMAeroMLPhotosSearchInsights isHolidayReferenceInQuery](self, "isHolidayReferenceInQuery"), v29 == objc_msgSend(v5, "isHolidayReferenceInQuery")))
                    {
                      if (!-[BMAeroMLPhotosSearchInsights hasIsActionRunningInQuery](self, "hasIsActionRunningInQuery")
                        && !objc_msgSend(v5, "hasIsActionRunningInQuery")
                        || -[BMAeroMLPhotosSearchInsights hasIsActionRunningInQuery](self, "hasIsActionRunningInQuery")
                        && objc_msgSend(v5, "hasIsActionRunningInQuery")
                        && (v30 = -[BMAeroMLPhotosSearchInsights isActionRunningInQuery](self, "isActionRunningInQuery"),
                            v30 == objc_msgSend(v5, "isActionRunningInQuery")))
                      {
                        if (!-[BMAeroMLPhotosSearchInsights hasIsActionHoldingInQuery](self, "hasIsActionHoldingInQuery")&& !objc_msgSend(v5, "hasIsActionHoldingInQuery")|| -[BMAeroMLPhotosSearchInsights hasIsActionHoldingInQuery](self, "hasIsActionHoldingInQuery")&& objc_msgSend(v5, "hasIsActionHoldingInQuery")&& (v31 = -[BMAeroMLPhotosSearchInsights isActionHoldingInQuery](self, "isActionHoldingInQuery"), v31 == objc_msgSend(v5, "isActionHoldingInQuery")))
                        {
                          if (!-[BMAeroMLPhotosSearchInsights hasIsActionClimbingInQuery](self, "hasIsActionClimbingInQuery")&& !objc_msgSend(v5, "hasIsActionClimbingInQuery"))
                          {
                            LOBYTE(v20) = 1;
                            goto LABEL_104;
                          }
                          if (-[BMAeroMLPhotosSearchInsights hasIsActionClimbingInQuery](self, "hasIsActionClimbingInQuery")&& objc_msgSend(v5, "hasIsActionClimbingInQuery"))
                          {
                            v32 = -[BMAeroMLPhotosSearchInsights isActionClimbingInQuery](self, "isActionClimbingInQuery");
                            v20 = v32 ^ objc_msgSend(v5, "isActionClimbingInQuery") ^ 1;
LABEL_104:

                            goto LABEL_105;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_103:
    LOBYTE(v20) = 0;
    goto LABEL_104;
  }
  LOBYTE(v20) = 0;
LABEL_105:

  return v20;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)wasThereAnyResultsShown
{
  return self->_wasThereAnyResultsShown;
}

- (BOOL)hasWasThereAnyResultsShown
{
  return self->_hasWasThereAnyResultsShown;
}

- (void)setHasWasThereAnyResultsShown:(BOOL)a3
{
  self->_hasWasThereAnyResultsShown = a3;
}

- (unsigned)searchResultSize
{
  return self->_searchResultSize;
}

- (BOOL)hasSearchResultSize
{
  return self->_hasSearchResultSize;
}

- (void)setHasSearchResultSize:(BOOL)a3
{
  self->_hasSearchResultSize = a3;
}

- (BOOL)didUserViewAnyPhoto
{
  return self->_didUserViewAnyPhoto;
}

- (BOOL)hasDidUserViewAnyPhoto
{
  return self->_hasDidUserViewAnyPhoto;
}

- (void)setHasDidUserViewAnyPhoto:(BOOL)a3
{
  self->_hasDidUserViewAnyPhoto = a3;
}

- (unsigned)viewedPhotoCount
{
  return self->_viewedPhotoCount;
}

- (BOOL)hasViewedPhotoCount
{
  return self->_hasViewedPhotoCount;
}

- (void)setHasViewedPhotoCount:(BOOL)a3
{
  self->_hasViewedPhotoCount = a3;
}

- (int)uiSurface
{
  return self->_uiSurface;
}

- (unsigned)sizeOfPhotoDB
{
  return self->_sizeOfPhotoDB;
}

- (BOOL)hasSizeOfPhotoDB
{
  return self->_hasSizeOfPhotoDB;
}

- (void)setHasSizeOfPhotoDB:(BOOL)a3
{
  self->_hasSizeOfPhotoDB = a3;
}

- (unsigned)numberOfSearchesFromThisSurfaceLastWeek
{
  return self->_numberOfSearchesFromThisSurfaceLastWeek;
}

- (BOOL)hasNumberOfSearchesFromThisSurfaceLastWeek
{
  return self->_hasNumberOfSearchesFromThisSurfaceLastWeek;
}

- (void)setHasNumberOfSearchesFromThisSurfaceLastWeek:(BOOL)a3
{
  self->_hasNumberOfSearchesFromThisSurfaceLastWeek = a3;
}

- (unsigned)numberOfSearchesFromThisSurfaceWeeklyAvg
{
  return self->_numberOfSearchesFromThisSurfaceWeeklyAvg;
}

- (BOOL)hasNumberOfSearchesFromThisSurfaceWeeklyAvg
{
  return self->_hasNumberOfSearchesFromThisSurfaceWeeklyAvg;
}

- (void)setHasNumberOfSearchesFromThisSurfaceWeeklyAvg:(BOOL)a3
{
  self->_hasNumberOfSearchesFromThisSurfaceWeeklyAvg = a3;
}

- (NSString)queryRaw
{
  return self->_queryRaw;
}

- (unsigned)numberOfTokensInQuery
{
  return self->_numberOfTokensInQuery;
}

- (BOOL)hasNumberOfTokensInQuery
{
  return self->_hasNumberOfTokensInQuery;
}

- (void)setHasNumberOfTokensInQuery:(BOOL)a3
{
  self->_hasNumberOfTokensInQuery = a3;
}

- (unsigned)numberOfKnownEntitiesInQuery
{
  return self->_numberOfKnownEntitiesInQuery;
}

- (BOOL)hasNumberOfKnownEntitiesInQuery
{
  return self->_hasNumberOfKnownEntitiesInQuery;
}

- (void)setHasNumberOfKnownEntitiesInQuery:(BOOL)a3
{
  self->_hasNumberOfKnownEntitiesInQuery = a3;
}

- (BOOL)isSpecificPersonInQuery
{
  return self->_isSpecificPersonInQuery;
}

- (BOOL)hasIsSpecificPersonInQuery
{
  return self->_hasIsSpecificPersonInQuery;
}

- (void)setHasIsSpecificPersonInQuery:(BOOL)a3
{
  self->_hasIsSpecificPersonInQuery = a3;
}

- (BOOL)isGeneralPersonReferenceInQuery
{
  return self->_isGeneralPersonReferenceInQuery;
}

- (BOOL)hasIsGeneralPersonReferenceInQuery
{
  return self->_hasIsGeneralPersonReferenceInQuery;
}

- (void)setHasIsGeneralPersonReferenceInQuery:(BOOL)a3
{
  self->_hasIsGeneralPersonReferenceInQuery = a3;
}

- (BOOL)isSpecificLocationInQuery
{
  return self->_isSpecificLocationInQuery;
}

- (BOOL)hasIsSpecificLocationInQuery
{
  return self->_hasIsSpecificLocationInQuery;
}

- (void)setHasIsSpecificLocationInQuery:(BOOL)a3
{
  self->_hasIsSpecificLocationInQuery = a3;
}

- (BOOL)isGeneralLocationReferenceInQuery
{
  return self->_isGeneralLocationReferenceInQuery;
}

- (BOOL)hasIsGeneralLocationReferenceInQuery
{
  return self->_hasIsGeneralLocationReferenceInQuery;
}

- (void)setHasIsGeneralLocationReferenceInQuery:(BOOL)a3
{
  self->_hasIsGeneralLocationReferenceInQuery = a3;
}

- (BOOL)isSpecificDateInQuery
{
  return self->_isSpecificDateInQuery;
}

- (BOOL)hasIsSpecificDateInQuery
{
  return self->_hasIsSpecificDateInQuery;
}

- (void)setHasIsSpecificDateInQuery:(BOOL)a3
{
  self->_hasIsSpecificDateInQuery = a3;
}

- (BOOL)isGeneralDateReferenceInQuery
{
  return self->_isGeneralDateReferenceInQuery;
}

- (BOOL)hasIsGeneralDateReferenceInQuery
{
  return self->_hasIsGeneralDateReferenceInQuery;
}

- (void)setHasIsGeneralDateReferenceInQuery:(BOOL)a3
{
  self->_hasIsGeneralDateReferenceInQuery = a3;
}

- (BOOL)isHolidayReferenceInQuery
{
  return self->_isHolidayReferenceInQuery;
}

- (BOOL)hasIsHolidayReferenceInQuery
{
  return self->_hasIsHolidayReferenceInQuery;
}

- (void)setHasIsHolidayReferenceInQuery:(BOOL)a3
{
  self->_hasIsHolidayReferenceInQuery = a3;
}

- (BOOL)isActionRunningInQuery
{
  return self->_isActionRunningInQuery;
}

- (BOOL)hasIsActionRunningInQuery
{
  return self->_hasIsActionRunningInQuery;
}

- (void)setHasIsActionRunningInQuery:(BOOL)a3
{
  self->_hasIsActionRunningInQuery = a3;
}

- (BOOL)isActionHoldingInQuery
{
  return self->_isActionHoldingInQuery;
}

- (BOOL)hasIsActionHoldingInQuery
{
  return self->_hasIsActionHoldingInQuery;
}

- (void)setHasIsActionHoldingInQuery:(BOOL)a3
{
  self->_hasIsActionHoldingInQuery = a3;
}

- (BOOL)isActionClimbingInQuery
{
  return self->_isActionClimbingInQuery;
}

- (BOOL)hasIsActionClimbingInQuery
{
  return self->_hasIsActionClimbingInQuery;
}

- (void)setHasIsActionClimbingInQuery:(BOOL)a3
{
  self->_hasIsActionClimbingInQuery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryRaw, 0);
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

    v4 = -[BMAeroMLPhotosSearchInsights initByReadFrom:]([BMAeroMLPhotosSearchInsights alloc], "initByReadFrom:", v7);
    v4[12] = 0;

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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[23];

  v25[21] = *MEMORY[0x1E0C80C00];
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("wasThereAnyResultsShown"), 0, 0, 1, 12, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("searchResultSize"), 0, 0, 2, 4, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("didUserViewAnyPhoto"), 0, 0, 3, 12, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("viewedPhotoCount"), 0, 0, 4, 4, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uiSurface"), 0, 0, 5, 4, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sizeOfPhotoDB"), 0, 0, 6, 4, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numberOfSearchesFromThisSurfaceLastWeek"), 0, 0, 7, 4, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numberOfSearchesFromThisSurfaceWeeklyAvg"), 0, 0, 8, 4, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("queryRaw"), 2, 0, 9, 13, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numberOfTokensInQuery"), 0, 0, 10, 4, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numberOfKnownEntitiesInQuery"), 0, 0, 11, 4, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isSpecificPersonInQuery"), 0, 0, 12, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isGeneralPersonReferenceInQuery"), 0, 0, 13, 12, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isSpecificLocationInQuery"), 0, 0, 14, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isGeneralLocationReferenceInQuery"), 0, 0, 15, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isSpecificDateInQuery"), 0, 0, 16, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isGeneralDateReferenceInQuery"), 0, 0, 17, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isHolidayReferenceInQuery"), 0, 0, 18, 12, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isActionRunningInQuery"), 0, 0, 19, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isActionHoldingInQuery"), 0, 0, 20, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isActionClimbingInQuery"), 0, 0, 21, 12, 0);
  v25[0] = v24;
  v25[1] = v23;
  v25[2] = v22;
  v25[3] = v13;
  v25[4] = v21;
  v25[5] = v20;
  v25[6] = v19;
  v25[7] = v18;
  v25[8] = v17;
  v25[9] = v16;
  v25[10] = v15;
  v25[11] = v2;
  v25[12] = v3;
  v25[13] = v14;
  v25[14] = v4;
  v25[15] = v5;
  v25[16] = v6;
  v25[17] = v7;
  v25[18] = v12;
  v25[19] = v8;
  v25[20] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 21);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1A5A8;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[23];

  v25[21] = *MEMORY[0x1E0C80C00];
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("wasThereAnyResultsShown"), 1, 12, 0);
  v25[0] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("searchResultSize"), 2, 4, 0);
  v25[1] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("didUserViewAnyPhoto"), 3, 12, 0);
  v25[2] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("viewedPhotoCount"), 4, 4, 0);
  v25[3] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uiSurface"), 5, 4, 0);
  v25[4] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sizeOfPhotoDB"), 6, 4, 0);
  v25[5] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numberOfSearchesFromThisSurfaceLastWeek"), 7, 4, 0);
  v25[6] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numberOfSearchesFromThisSurfaceWeeklyAvg"), 8, 4, 0);
  v25[7] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("queryRaw"), 9, 13, 0);
  v25[8] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numberOfTokensInQuery"), 10, 4, 0);
  v25[9] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numberOfKnownEntitiesInQuery"), 11, 4, 0);
  v25[10] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isSpecificPersonInQuery"), 12, 12, 0);
  v25[11] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isGeneralPersonReferenceInQuery"), 13, 12, 0);
  v25[12] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isSpecificLocationInQuery"), 14, 12, 0);
  v25[13] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isGeneralLocationReferenceInQuery"), 15, 12, 0);
  v25[14] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isSpecificDateInQuery"), 16, 12, 0);
  v25[15] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isGeneralDateReferenceInQuery"), 17, 12, 0);
  v25[16] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isHolidayReferenceInQuery"), 18, 12, 0);
  v25[17] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isActionRunningInQuery"), 19, 12, 0);
  v25[18] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isActionHoldingInQuery"), 20, 12, 0);
  v25[19] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isActionClimbingInQuery"), 21, 12, 0);
  v25[20] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
