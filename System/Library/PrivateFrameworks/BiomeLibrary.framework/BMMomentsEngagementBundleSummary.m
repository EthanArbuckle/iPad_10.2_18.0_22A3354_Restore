@implementation BMMomentsEngagementBundleSummary

- (BMMomentsEngagementBundleSummary)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 interfaceType:(int)a6 rankingScore:(id)a7 attachedPhotoAssets:(id)a8
{
  return -[BMMomentsEngagementBundleSummary initWithIdentifier:startDate:endDate:interfaceType:rankingScore:attachedPhotoAssets:bundleInterfaceType:bundleEvergreenType:](self, "initWithIdentifier:startDate:endDate:interfaceType:rankingScore:attachedPhotoAssets:bundleInterfaceType:bundleEvergreenType:", a3, a4, a5, *(_QWORD *)&a6, a7, a8, 0, 0);
}

- (BMMomentsEngagementBundleSummary)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 interfaceType:(int)a6 rankingScore:(id)a7 attachedPhotoAssets:(id)a8 bundleInterfaceType:(id)a9 bundleEvergreenType:(id)a10
{
  uint64_t v11;

  LODWORD(v11) = 0;
  return -[BMMomentsEngagementBundleSummary initWithIdentifier:startDate:endDate:interfaceType:rankingScore:attachedPhotoAssets:bundleInterfaceType:bundleEvergreenType:bundleSubType:bundleSuperType:bundleGoodnessScore:ordinalRankInRecommendedTab:visibilityCategoryForUI:assets:](self, "initWithIdentifier:startDate:endDate:interfaceType:rankingScore:attachedPhotoAssets:bundleInterfaceType:bundleEvergreenType:bundleSubType:bundleSuperType:bundleGoodnessScore:ordinalRankInRecommendedTab:visibilityCategoryForUI:assets:", a3, a4, a5, *(_QWORD *)&a6, a7, a8, a9, a10, 0, 0, 0, v11, MEMORY[0x1E0C9AA60]);
}

- (BMMomentsEngagementBundleSummary)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 interfaceType:(int)a6 rankingScore:(id)a7 attachedPhotoAssets:(id)a8 bundleInterfaceType:(id)a9 bundleEvergreenType:(id)a10 bundleSubType:(int)a11 bundleSuperType:(int)a12 bundleGoodnessScore:(id)a13 ordinalRankInRecommendedTab:(id)a14 visibilityCategoryForUI:(int)a15 assets:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  BMMomentsEngagementBundleSummary *v26;
  double v27;
  double v28;
  float v29;
  double v30;
  float v31;
  double v32;
  int v33;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;

  v40 = a3;
  v21 = a4;
  v41 = a5;
  v22 = a7;
  v39 = a8;
  v38 = a9;
  v37 = a10;
  v23 = a13;
  v24 = a14;
  v25 = a16;
  v42.receiver = self;
  v42.super_class = (Class)BMMomentsEngagementBundleSummary;
  v26 = -[BMEventBase init](&v42, sel_init);
  if (v26)
  {
    v26->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v26->_identifier, a3);
    if (v21)
    {
      v26->_hasRaw_startDate = 1;
      objc_msgSend(v21, "timeIntervalSince1970");
    }
    else
    {
      v26->_hasRaw_startDate = 0;
      v27 = -1.0;
    }
    v26->_raw_startDate = v27;
    if (v41)
    {
      v26->_hasRaw_endDate = 1;
      objc_msgSend(v41, "timeIntervalSince1970");
    }
    else
    {
      v26->_hasRaw_endDate = 0;
      v28 = -1.0;
    }
    v26->_raw_endDate = v28;
    v26->_interfaceType = a6;
    if (v22)
    {
      v26->_hasRankingScore = 1;
      objc_msgSend(v22, "floatValue");
      v30 = v29;
    }
    else
    {
      v26->_hasRankingScore = 0;
      v30 = -1.0;
    }
    v26->_rankingScore = v30;
    objc_storeStrong((id *)&v26->_attachedPhotoAssets, a8);
    objc_storeStrong((id *)&v26->_bundleInterfaceType, a9);
    objc_storeStrong((id *)&v26->_bundleEvergreenType, a10);
    v26->_bundleSubType = a11;
    v26->_bundleSuperType = a12;
    if (v23)
    {
      v26->_hasBundleGoodnessScore = 1;
      objc_msgSend(v23, "floatValue");
      v32 = v31;
    }
    else
    {
      v26->_hasBundleGoodnessScore = 0;
      v32 = -1.0;
    }
    v26->_bundleGoodnessScore = v32;
    if (v24)
    {
      v26->_hasOrdinalRankInRecommendedTab = 1;
      v33 = objc_msgSend(v24, "intValue");
    }
    else
    {
      v26->_hasOrdinalRankInRecommendedTab = 0;
      v33 = -1;
    }
    v26->_ordinalRankInRecommendedTab = v33;
    v26->_visibilityCategoryForUI = a15;
    objc_storeStrong((id *)&v26->_assets, a16);
  }

  return v26;
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
  void *v13;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMomentsEngagementBundleSummary identifier](self, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementBundleSummary startDate](self, "startDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementBundleSummary endDate](self, "endDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEngagementBundleInterfaceTypeAsString(-[BMMomentsEngagementBundleSummary interfaceType](self, "interfaceType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEngagementBundleSummary rankingScore](self, "rankingScore");
  objc_msgSend(v3, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementBundleSummary attachedPhotoAssets](self, "attachedPhotoAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementBundleSummary bundleInterfaceType](self, "bundleInterfaceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementBundleSummary bundleEvergreenType](self, "bundleEvergreenType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataEventBundleBundleSubTypeAsString(-[BMMomentsEngagementBundleSummary bundleSubType](self, "bundleSubType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataEventBundleBundleSuperTypeAsString(-[BMMomentsEngagementBundleSummary bundleSuperType](self, "bundleSuperType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEngagementBundleSummary bundleGoodnessScore](self, "bundleGoodnessScore");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementBundleSummary ordinalRankInRecommendedTab](self, "ordinalRankInRecommendedTab"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEngagementBundleSummaryVisibilityCategoryForUIAsString(-[BMMomentsEngagementBundleSummary visibilityCategoryForUI](self, "visibilityCategoryForUI"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementBundleSummary assets](self, "assets");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "initWithFormat:", CFSTR("BMMomentsEngagementBundleSummary with identifier: %@, startDate: %@, endDate: %@, interfaceType: %@, rankingScore: %@, attachedPhotoAssets: %@, bundleInterfaceType: %@, bundleEvergreenType: %@, bundleSubType: %@, bundleSuperType: %@, bundleGoodnessScore: %@, ordinalRankInRecommendedTab: %@, visibilityCategoryForUI: %@, assets: %@"), v21, v20, v19, v18, v15, v4, v5, v6, v7, v8, v10, v11, v12, v13);

  return (NSString *)v17;
}

- (id)initByReadFrom:(id)a3
{
  uint64_t v3;
  _BYTE *v5;
  BMMomentsEngagementBundleSummary *v6;
  void *v7;
  void *v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  int v21;
  BMMomentsEngagementSuggestionIdentifier *v23;
  BMMomentsEngagementSuggestionIdentifier *identifier;
  uint64_t v25;
  unint64_t v26;
  double v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  unint64_t v38;
  float v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  uint64_t v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  uint64_t v61;
  unint64_t v62;
  float v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  char v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  void *v77;
  uint64_t v78;
  id v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSArray *attachedPhotoAssets;
  uint64_t v85;
  NSArray *assets;
  int v87;
  BMMomentsEngagementBundleSummary *v88;
  objc_super v90;
  uint64_t v91;
  uint64_t v92;

  v5 = a3;
  v90.receiver = self;
  v90.super_class = (Class)BMMomentsEngagementBundleSummary;
  v6 = -[BMEventBase init](&v90, sel_init);
  if (!v6)
  {
LABEL_121:
    v88 = v6;
    goto LABEL_122;
  }
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (int *)MEMORY[0x1E0D82BF0];
  v10 = (int *)MEMORY[0x1E0D82BD8];
  v11 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v5[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v5[*MEMORY[0x1E0D82BD8]])
  {
LABEL_119:
    v83 = objc_msgSend(v7, "copy");
    attachedPhotoAssets = v6->_attachedPhotoAssets;
    v6->_attachedPhotoAssets = (NSArray *)v83;

    v85 = objc_msgSend(v8, "copy");
    assets = v6->_assets;
    v6->_assets = (NSArray *)v85;

    v87 = v5[*v11];
    if (v87)
      goto LABEL_120;
    goto LABEL_121;
  }
  v12 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v5[*v11])
      goto LABEL_119;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = *v9;
      v17 = *(_QWORD *)&v5[v16];
      v18 = v17 + 1;
      if (v17 == -1 || v18 > *(_QWORD *)&v5[*v10])
        break;
      v19 = *(_BYTE *)(*(_QWORD *)&v5[*v12] + v17);
      *(_QWORD *)&v5[v16] = v18;
      v15 |= (unint64_t)(v19 & 0x7F) << v13;
      if ((v19 & 0x80) == 0)
        goto LABEL_13;
      v13 += 7;
      v20 = v14++ >= 9;
      if (v20)
      {
        v15 = 0;
        v21 = v5[*v11];
        goto LABEL_15;
      }
    }
    v5[*v11] = 1;
LABEL_13:
    v21 = v5[*v11];
    if (v5[*v11])
      v15 = 0;
LABEL_15:
    if (v21 || (v15 & 7) == 4)
      goto LABEL_119;
    switch((v15 >> 3))
    {
      case 1u:
        v91 = 0;
        v92 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_125;
        v23 = -[BMMomentsEngagementSuggestionIdentifier initByReadFrom:]([BMMomentsEngagementSuggestionIdentifier alloc], "initByReadFrom:", v5);
        if (!v23)
          goto LABEL_125;
        identifier = v6->_identifier;
        v6->_identifier = v23;

        PBReaderRecallMark();
        goto LABEL_118;
      case 2u:
        v6->_hasRaw_startDate = 1;
        v25 = *v9;
        v26 = *(_QWORD *)&v5[v25];
        if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)&v5[*v10])
        {
          v27 = *(double *)(*(_QWORD *)&v5[*v12] + v26);
          *(_QWORD *)&v5[v25] = v26 + 8;
        }
        else
        {
          v5[*v11] = 1;
          v27 = 0.0;
        }
        v82 = 24;
        goto LABEL_117;
      case 3u:
        v6->_hasRaw_endDate = 1;
        v28 = *v9;
        v29 = *(_QWORD *)&v5[v28];
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)&v5[*v10])
        {
          v27 = *(double *)(*(_QWORD *)&v5[*v12] + v29);
          *(_QWORD *)&v5[v28] = v29 + 8;
        }
        else
        {
          v5[*v11] = 1;
          v27 = 0.0;
        }
        v82 = 40;
        goto LABEL_117;
      case 4u:
        v30 = 0;
        v31 = 0;
        v32 = 0;
        while (2)
        {
          v33 = *v9;
          v34 = *(_QWORD *)&v5[v33];
          v35 = v34 + 1;
          if (v34 == -1 || v35 > *(_QWORD *)&v5[*v10])
          {
            v5[*v11] = 1;
          }
          else
          {
            v36 = *(_BYTE *)(*(_QWORD *)&v5[*v12] + v34);
            *(_QWORD *)&v5[v33] = v35;
            v32 |= (unint64_t)(v36 & 0x7F) << v30;
            if (v36 < 0)
            {
              v30 += 7;
              v20 = v31++ >= 9;
              if (v20)
              {
                LODWORD(v32) = 0;
                goto LABEL_84;
              }
              continue;
            }
          }
          break;
        }
        if (v5[*v11])
          LODWORD(v32) = 0;
LABEL_84:
        if (v32 >= 0x10)
          LODWORD(v32) = 0;
        v81 = 56;
        goto LABEL_108;
      case 5u:
        v6->_hasRankingScore = 1;
        v37 = *v9;
        v38 = *(_QWORD *)&v5[v37];
        if (v38 <= 0xFFFFFFFFFFFFFFFBLL && v38 + 4 <= *(_QWORD *)&v5[*v10])
        {
          v39 = *(float *)(*(_QWORD *)&v5[*v12] + v38);
          *(_QWORD *)&v5[v37] = v38 + 4;
        }
        else
        {
          v5[*v11] = 1;
          v39 = 0.0;
        }
        v27 = v39;
        v82 = 88;
        goto LABEL_117;
      case 6u:
        v91 = 0;
        v92 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_125;
        v40 = v8;
        v41 = v3;
        v42 = -[BMMomentsEngagementPhotosAssets initByReadFrom:]([BMMomentsEngagementPhotosAssets alloc], "initByReadFrom:", v5);
        if (!v42)
        {
          v8 = v40;
          goto LABEL_125;
        }
        v43 = v42;
        objc_msgSend(v7, "addObject:", v42);
        PBReaderRecallMark();

        v3 = v41;
        v8 = v40;
        goto LABEL_118;
      case 7u:
        PBReaderReadString();
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = 104;
        goto LABEL_46;
      case 8u:
        PBReaderReadString();
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = 112;
LABEL_46:
        v46 = *(Class *)((char *)&v6->super.super.isa + v45);
        *(Class *)((char *)&v6->super.super.isa + v45) = (Class)v44;

        goto LABEL_118;
      case 9u:
        v47 = 0;
        v48 = 0;
        v49 = 0;
        while (2)
        {
          v50 = *v9;
          v51 = *(_QWORD *)&v5[v50];
          v52 = v51 + 1;
          if (v51 == -1 || v52 > *(_QWORD *)&v5[*v10])
          {
            v5[*v11] = 1;
          }
          else
          {
            v53 = *(_BYTE *)(*(_QWORD *)&v5[*v12] + v51);
            *(_QWORD *)&v5[v50] = v52;
            v49 |= (unint64_t)(v53 & 0x7F) << v47;
            if (v53 < 0)
            {
              v47 += 7;
              v20 = v48++ >= 9;
              if (v20)
              {
                v54 = 0;
                goto LABEL_91;
              }
              continue;
            }
          }
          break;
        }
        if (v5[*v11])
          v54 = 0;
        else
          v54 = v49;
LABEL_91:
        v6->_bundleSubType = BMMomentsEventDataEventBundleBundleSubTypeDecode(v54);
        goto LABEL_118;
      case 0xAu:
        v55 = 0;
        v56 = 0;
        v32 = 0;
        while (2)
        {
          v57 = *v9;
          v58 = *(_QWORD *)&v5[v57];
          v59 = v58 + 1;
          if (v58 == -1 || v59 > *(_QWORD *)&v5[*v10])
          {
            v5[*v11] = 1;
          }
          else
          {
            v60 = *(_BYTE *)(*(_QWORD *)&v5[*v12] + v58);
            *(_QWORD *)&v5[v57] = v59;
            v32 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              v20 = v56++ >= 9;
              if (v20)
              {
                LODWORD(v32) = 0;
                goto LABEL_95;
              }
              continue;
            }
          }
          break;
        }
        if (v5[*v11])
          LODWORD(v32) = 0;
LABEL_95:
        if (v32 >= 0xA)
          LODWORD(v32) = 0;
        v81 = 64;
        goto LABEL_108;
      case 0xBu:
        v6->_hasBundleGoodnessScore = 1;
        v61 = *v9;
        v62 = *(_QWORD *)&v5[v61];
        if (v62 <= 0xFFFFFFFFFFFFFFFBLL && v62 + 4 <= *(_QWORD *)&v5[*v10])
        {
          v63 = *(float *)(*(_QWORD *)&v5[*v12] + v62);
          *(_QWORD *)&v5[v61] = v62 + 4;
        }
        else
        {
          v5[*v11] = 1;
          v63 = 0.0;
        }
        v27 = v63;
        v82 = 120;
LABEL_117:
        *(double *)((char *)&v6->super.super.isa + v82) = v27;
        goto LABEL_118;
      case 0xCu:
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v6->_hasOrdinalRankInRecommendedTab = 1;
        while (2)
        {
          v67 = *v9;
          v68 = *(_QWORD *)&v5[v67];
          v69 = v68 + 1;
          if (v68 == -1 || v69 > *(_QWORD *)&v5[*v10])
          {
            v5[*v11] = 1;
          }
          else
          {
            v70 = *(_BYTE *)(*(_QWORD *)&v5[*v12] + v68);
            *(_QWORD *)&v5[v67] = v69;
            v66 |= (unint64_t)(v70 & 0x7F) << v64;
            if (v70 < 0)
            {
              v64 += 7;
              v20 = v65++ >= 9;
              if (v20)
              {
                LODWORD(v66) = 0;
                goto LABEL_101;
              }
              continue;
            }
          }
          break;
        }
        if (v5[*v11])
          LODWORD(v66) = 0;
LABEL_101:
        v6->_ordinalRankInRecommendedTab = v66;
        goto LABEL_118;
      case 0xDu:
        v71 = 0;
        v72 = 0;
        v32 = 0;
        while (2)
        {
          v73 = *v9;
          v74 = *(_QWORD *)&v5[v73];
          v75 = v74 + 1;
          if (v74 == -1 || v75 > *(_QWORD *)&v5[*v10])
          {
            v5[*v11] = 1;
          }
          else
          {
            v76 = *(_BYTE *)(*(_QWORD *)&v5[*v12] + v74);
            *(_QWORD *)&v5[v73] = v75;
            v32 |= (unint64_t)(v76 & 0x7F) << v71;
            if (v76 < 0)
            {
              v71 += 7;
              v20 = v72++ >= 9;
              if (v20)
              {
                LODWORD(v32) = 0;
                goto LABEL_105;
              }
              continue;
            }
          }
          break;
        }
        if (v5[*v11])
          LODWORD(v32) = 0;
LABEL_105:
        if (v32 >= 5)
          LODWORD(v32) = 0;
        v81 = 72;
LABEL_108:
        *(_DWORD *)((char *)&v6->super.super.isa + v81) = v32;
        goto LABEL_118;
      case 0xEu:
        v91 = 0;
        v92 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_125;
        v77 = v7;
        v78 = v3;
        v79 = -[BMMomentsEngagementBundleSummarySuggestionAsset initByReadFrom:]([BMMomentsEngagementBundleSummarySuggestionAsset alloc], "initByReadFrom:", v5);
        if (v79)
        {
          v80 = v79;
          objc_msgSend(v8, "addObject:", v79);
          PBReaderRecallMark();

          v3 = v78;
          v7 = v77;
LABEL_118:
          if (*(_QWORD *)&v5[*v9] >= *(_QWORD *)&v5[*v10])
            goto LABEL_119;
          continue;
        }
        v7 = v77;
LABEL_125:

LABEL_120:
        v88 = 0;
LABEL_122:

        return v88;
      default:
        if (!PBReaderSkipValueWithTag())
          goto LABEL_125;
        goto LABEL_118;
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
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
  {
    v25 = 0;
    PBDataWriterPlaceMark();
    -[BMMomentsEngagementSuggestionIdentifier writeTo:](self->_identifier, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasRaw_startDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_endDate)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  if (self->_hasRankingScore)
    PBDataWriterWriteFloatField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_attachedPhotoAssets;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        v25 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v7);
  }

  if (self->_bundleInterfaceType)
    PBDataWriterWriteStringField();
  if (self->_bundleEvergreenType)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasBundleGoodnessScore)
    PBDataWriterWriteFloatField();
  if (self->_hasOrdinalRankInRecommendedTab)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_assets;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        v25 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v16, "writeTo:", v4, (_QWORD)v17);
        PBDataWriterRecallMark();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    }
    while (v13);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMomentsEngagementBundleSummary writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEngagementBundleSummary)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  BMMomentsEngagementSuggestionIdentifier *v13;
  objc_class *v14;
  id v15;
  id v16;
  double v17;
  double v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id *v25;
  id v26;
  void *v27;
  void *v28;
  objc_class *v29;
  id v30;
  id v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  id v46;
  BMMomentsEngagementPhotosAssets *v47;
  BMMomentsEngagementPhotosAssets *v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id *v57;
  id v58;
  uint64_t v59;
  void *v60;
  id *v61;
  uint64_t *v62;
  id v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  id v76;
  uint64_t v77;
  void *v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  id v87;
  id v88;
  uint64_t v89;
  id *v90;
  void *v91;
  void *v92;
  _BYTE *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  _BYTE *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  id v124;
  BMMomentsEngagementBundleSummarySuggestionAsset *v125;
  BMMomentsEngagementBundleSummarySuggestionAsset *v126;
  id v127;
  uint64_t v128;
  unsigned int v129;
  unsigned int v130;
  void *v131;
  id *v132;
  uint64_t v133;
  void *v134;
  id *v135;
  uint64_t *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  void *v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  void *v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  id v151;
  uint64_t v152;
  uint64_t v154;
  unint64_t v155;
  uint64_t v156;
  id v157;
  void *v158;
  id v159;
  void *v160;
  id v161;
  void *v162;
  id v163;
  void *v164;
  id v165;
  void *v166;
  id v167;
  id v168;
  void *v169;
  void *v170;
  id obj;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  BMMomentsEngagementBundleSummary *v177;
  id v178;
  void *v179;
  id v180;
  id v181;
  void *v182;
  id v183;
  id v184;
  BMMomentsEngagementSuggestionIdentifier *v185;
  id *v186;
  id *v187;
  void *v188;
  void *v189;
  void *v190;
  id v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  id v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  id v201;
  uint64_t v202;
  id v203;
  uint64_t v204;
  id v205;
  _BYTE v206[128];
  uint64_t v207;
  void *v208;
  uint64_t v209;
  id v210;
  uint64_t v211;
  id v212;
  uint64_t v213;
  id v214;
  uint64_t v215;
  id v216;
  uint64_t v217;
  id v218;
  uint64_t v219;
  id v220;
  uint64_t v221;
  id v222;
  uint64_t v223;
  id v224;
  uint64_t v225;
  id v226;
  _BYTE v227[128];
  uint64_t v228;
  void *v229;
  uint64_t v230;
  id v231;
  uint64_t v232;
  id v233;
  uint64_t v234;
  id v235;
  uint64_t v236;
  void *v237;
  uint64_t v238;
  _QWORD v239[3];

  v239[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = v6;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v185 = 0;
    v186 = a4;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    v201 = 0;
    v185 = -[BMMomentsEngagementSuggestionIdentifier initWithJSONDictionary:error:]([BMMomentsEngagementSuggestionIdentifier alloc], "initWithJSONDictionary:error:", v10, &v201);
    v11 = v201;
    if (v11)
    {
      v12 = v11;
      if (a4)
        *a4 = objc_retainAutorelease(v11);

      a4 = 0;
      v13 = v185;
      goto LABEL_189;
    }
    v186 = a4;

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    v182 = (void *)v8;
    if (!v8 || (v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (objc_class *)MEMORY[0x1E0C99D68];
      v15 = v9;
      v16 = [v14 alloc];
      objc_msgSend(v15, "doubleValue");
      v18 = v17;

      v19 = (id)objc_msgSend(v16, "initWithTimeIntervalSince1970:", v18);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v26, "dateFromString:", v9);
        v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endDate"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v183 = v10;
        if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v180 = 0;
          goto LABEL_22;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = (objc_class *)MEMORY[0x1E0C99D68];
          v30 = v27;
          v31 = [v29 alloc];
          objc_msgSend(v30, "doubleValue");
          v33 = v32;

          v180 = (id)objc_msgSend(v31, "initWithTimeIntervalSince1970:", v33);
          goto LABEL_22;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v35 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v35, "dateFromString:", v27);
          v180 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_22;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v180 = v27;
LABEL_22:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interfaceType"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v177 = self;
          if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v181 = 0;
            goto LABEL_33;
          }
          v34 = v27;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v181 = v28;
            goto LABEL_33;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEngagementBundleInterfaceTypeFromString(v28));
            v181 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rankingScore"));
            v36 = objc_claimAutoreleasedReturnValue();
            v175 = v28;
            v176 = (void *)v36;
            if (v36 && (v37 = (void *)v36, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v186)
                {
                  v50 = v28;
                  v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v52 = *MEMORY[0x1E0D025B8];
                  v230 = *MEMORY[0x1E0CB2D50];
                  v53 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v154 = objc_opt_class();
                  v54 = v53;
                  v10 = v183;
                  v38 = (id)objc_msgSend(v54, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v154, CFSTR("rankingScore"));
                  v231 = v38;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v231, &v230, 1);
                  v55 = objc_claimAutoreleasedReturnValue();
                  v56 = v51;
                  v28 = v50;
                  v190 = (void *)v55;
                  v178 = 0;
                  a4 = 0;
                  *v186 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v52, 2);
                  v13 = v185;

                  goto LABEL_182;
                }
                v178 = 0;
                a4 = 0;
                v13 = v185;
                goto LABEL_183;
              }
              v178 = v37;
            }
            else
            {
              v178 = 0;
            }
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("attachedPhotoAssets"));
            v38 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v38, "isEqual:", v39);

            v179 = v7;
            if (v40)
            {

              v38 = 0;
            }
            else if (v38)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v186)
                {
                  v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v66 = *MEMORY[0x1E0D025B8];
                  v228 = *MEMORY[0x1E0CB2D50];
                  v189 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("attachedPhotoAssets"));
                  v229 = v189;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v229, &v228, 1);
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  a4 = 0;
                  *v186 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v66, 2, v64);
                  v10 = v183;
                  v13 = v185;
                  v28 = v175;
                  goto LABEL_181;
                }
                a4 = 0;
                v10 = v183;
                v13 = v185;
                v28 = v175;
                goto LABEL_182;
              }
            }
            v189 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v38, "count"));
            v197 = 0u;
            v198 = 0u;
            v199 = 0u;
            v200 = 0u;
            v38 = v38;
            v41 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v197, v227, 16);
            if (!v41)
              goto LABEL_50;
            v42 = v41;
            v43 = *(_QWORD *)v198;
            v173 = v27;
            while (1)
            {
              for (i = 0; i != v42; ++i)
              {
                if (*(_QWORD *)v198 != v43)
                  objc_enumerationMutation(v38);
                v45 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v57 = v186;
                  if (v186)
                  {
                    v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v59 = *MEMORY[0x1E0D025B8];
                    v225 = *MEMORY[0x1E0CB2D50];
                    v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("attachedPhotoAssets"));
                    v226 = v46;
                    v60 = (void *)MEMORY[0x1E0C99D80];
                    v61 = &v226;
                    v62 = &v225;
                    goto LABEL_61;
                  }
LABEL_68:
                  a4 = 0;
                  v64 = v38;
                  v10 = v183;
                  v13 = v185;
                  v27 = v173;
                  v28 = v175;
                  goto LABEL_181;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v57 = v186;
                  if (!v186)
                    goto LABEL_68;
                  v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v59 = *MEMORY[0x1E0D025B8];
                  v223 = *MEMORY[0x1E0CB2D50];
                  v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("attachedPhotoAssets"));
                  v224 = v46;
                  v60 = (void *)MEMORY[0x1E0C99D80];
                  v61 = &v224;
                  v62 = &v223;
LABEL_61:
                  objc_msgSend(v60, "dictionaryWithObjects:forKeys:count:", v61, v62, 1);
                  v63 = (id)objc_claimAutoreleasedReturnValue();
                  a4 = 0;
                  *v57 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v59, 2, v63);
                  v64 = v38;
                  v13 = v185;
LABEL_65:
                  v10 = v183;
                  v27 = v173;
                  v28 = v175;
                  goto LABEL_179;
                }
                v46 = v45;
                v47 = [BMMomentsEngagementPhotosAssets alloc];
                v196 = 0;
                v48 = -[BMMomentsEngagementPhotosAssets initWithJSONDictionary:error:](v47, "initWithJSONDictionary:error:", v46, &v196);
                v49 = v196;
                if (v49)
                {
                  v63 = v49;
                  v13 = v185;
                  if (v186)
                    *v186 = objc_retainAutorelease(v49);

                  a4 = 0;
                  v64 = v38;
                  goto LABEL_65;
                }
                objc_msgSend(v189, "addObject:", v48);

              }
              v42 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v197, v227, 16);
              v27 = v173;
              if (!v42)
              {
LABEL_50:

                objc_msgSend(v188, "objectForKeyedSubscript:", CFSTR("bundleInterfaceType"));
                v46 = (id)objc_claimAutoreleasedReturnValue();
                if (!v46)
                {
                  v168 = 0;
                  a4 = v186;
                  goto LABEL_77;
                }
                objc_opt_class();
                a4 = v186;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v168 = 0;
                  goto LABEL_77;
                }
                objc_opt_class();
                v10 = v183;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v168 = v46;
LABEL_77:
                  v28 = v175;
                  objc_msgSend(v188, "objectForKeyedSubscript:", CFSTR("bundleEvergreenType"));
                  v67 = objc_claimAutoreleasedReturnValue();
                  v169 = (void *)v67;
                  if (!v67)
                  {
                    v187 = a4;
                    v63 = 0;
                    v10 = v183;
                    goto LABEL_85;
                  }
                  v68 = (void *)v67;
                  objc_opt_class();
                  v10 = v183;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v187 = a4;
                    v63 = 0;
LABEL_85:
                    objc_msgSend(v188, "objectForKeyedSubscript:", CFSTR("bundleSubType"));
                    v74 = objc_claimAutoreleasedReturnValue();
                    v174 = v27;
                    v166 = (void *)v74;
                    if (!v74 || (v75 = (void *)v74, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v167 = 0;
LABEL_103:
                      objc_msgSend(v188, "objectForKeyedSubscript:", CFSTR("bundleSuperType"));
                      v95 = objc_claimAutoreleasedReturnValue();
                      v164 = (void *)v95;
                      if (!v95 || (v96 = (void *)v95, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v165 = 0;
LABEL_110:
                        objc_msgSend(v188, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore"));
                        v101 = objc_claimAutoreleasedReturnValue();
                        v162 = (void *)v101;
                        if (!v101 || (v102 = (void *)v101, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v163 = 0;
LABEL_113:
                          objc_msgSend(v188, "objectForKeyedSubscript:", CFSTR("ordinalRankInRecommendedTab"));
                          v103 = objc_claimAutoreleasedReturnValue();
                          v160 = (void *)v103;
                          if (!v103 || (v104 = (void *)v103, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v161 = 0;
LABEL_116:
                            objc_msgSend(v188, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI"));
                            v105 = objc_claimAutoreleasedReturnValue();
                            v158 = (void *)v105;
                            if (!v105 || (v106 = (void *)v105, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v159 = 0;
                              goto LABEL_131;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v159 = v106;
                              goto LABEL_131;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEngagementBundleSummaryVisibilityCategoryForUIFromString(v106));
                              v159 = (id)objc_claimAutoreleasedReturnValue();
                              v10 = v183;
LABEL_131:
                              objc_msgSend(v188, "objectForKeyedSubscript:", CFSTR("assets"));
                              v115 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(MEMORY[0x1E0C99E38], "null");
                              v116 = (void *)objc_claimAutoreleasedReturnValue();
                              v117 = objc_msgSend(v115, "isEqual:", v116);

                              v7 = v179;
                              if (v117)
                              {

                                v115 = 0;
LABEL_135:
                                v118 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v115, "count"));
                                v192 = 0u;
                                v193 = 0u;
                                v194 = 0u;
                                v195 = 0u;
                                obj = v115;
                                v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v192, v206, 16);
                                if (!v119)
                                  goto LABEL_145;
                                v120 = v119;
                                v121 = *(_QWORD *)v193;
                                v172 = (void *)v118;
LABEL_137:
                                v122 = 0;
                                while (1)
                                {
                                  if (*(_QWORD *)v193 != v121)
                                    objc_enumerationMutation(obj);
                                  v123 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * v122);
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                    break;
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    v10 = v183;
                                    v13 = v185;
                                    v27 = v174;
                                    v132 = v187;
                                    v64 = v168;
                                    if (!v187)
                                      goto LABEL_155;
                                    v157 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v133 = *MEMORY[0x1E0D025B8];
                                    v202 = *MEMORY[0x1E0CB2D50];
                                    v124 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("assets"));
                                    v203 = v124;
                                    v134 = (void *)MEMORY[0x1E0C99D80];
                                    v135 = &v203;
                                    v136 = &v202;
                                    goto LABEL_150;
                                  }
                                  v124 = v123;
                                  v125 = [BMMomentsEngagementBundleSummarySuggestionAsset alloc];
                                  v191 = 0;
                                  v126 = -[BMMomentsEngagementBundleSummarySuggestionAsset initWithJSONDictionary:error:](v125, "initWithJSONDictionary:error:", v124, &v191);
                                  v127 = v191;
                                  if (v127)
                                  {
                                    v137 = v127;
                                    if (v187)
                                      *v187 = objc_retainAutorelease(v127);

                                    v10 = v183;
                                    v13 = v185;
                                    v27 = v174;
                                    v64 = v168;
LABEL_154:

                                    v7 = v179;
LABEL_155:

                                    a4 = 0;
                                    v131 = v172;
                                    goto LABEL_171;
                                  }
                                  objc_msgSend(v172, "addObject:", v126);

                                  ++v122;
                                  v7 = v179;
                                  if (v120 == v122)
                                  {
                                    v120 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v192, v206, 16);
                                    v118 = (uint64_t)v172;
                                    if (v120)
                                      goto LABEL_137;
LABEL_145:

                                    v128 = objc_msgSend(v181, "intValue");
                                    v129 = objc_msgSend(v167, "intValue");
                                    v130 = objc_msgSend(v165, "intValue");
                                    LODWORD(v156) = objc_msgSend(v159, "intValue");
                                    v155 = __PAIR64__(v130, v129);
                                    v64 = v168;
                                    v10 = v183;
                                    v13 = v185;
                                    a4 = -[BMMomentsEngagementBundleSummary initWithIdentifier:startDate:endDate:interfaceType:rankingScore:attachedPhotoAssets:bundleInterfaceType:bundleEvergreenType:bundleSubType:bundleSuperType:bundleGoodnessScore:ordinalRankInRecommendedTab:visibilityCategoryForUI:assets:](v177, "initWithIdentifier:startDate:endDate:interfaceType:rankingScore:attachedPhotoAssets:bundleInterfaceType:bundleEvergreenType:bundleSubType:bundleSuperType:bundleGoodnessScore:ordinalRankInRecommendedTab:visibilityCategoryForUI:assets:", v185, v183, v180, v128, v178, v189, v168, v63, v155, v163, v161, v156, v118);
                                    v177 = (BMMomentsEngagementBundleSummary *)a4;
                                    v131 = (void *)v118;
                                    v27 = v174;
LABEL_171:

                                    v28 = v175;
LABEL_172:

LABEL_173:
LABEL_174:

LABEL_175:
LABEL_176:

LABEL_177:
LABEL_178:

LABEL_179:
                                    goto LABEL_180;
                                  }
                                }
                                v10 = v183;
                                v13 = v185;
                                v27 = v174;
                                v132 = v187;
                                v64 = v168;
                                if (!v187)
                                  goto LABEL_155;
                                v157 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v133 = *MEMORY[0x1E0D025B8];
                                v204 = *MEMORY[0x1E0CB2D50];
                                v124 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("assets"));
                                v205 = v124;
                                v134 = (void *)MEMORY[0x1E0C99D80];
                                v135 = &v205;
                                v136 = &v204;
LABEL_150:
                                objc_msgSend(v134, "dictionaryWithObjects:forKeys:count:", v135, v136, 1);
                                v137 = (void *)objc_claimAutoreleasedReturnValue();
                                v138 = v133;
                                v64 = v168;
                                *v132 = (id)objc_msgSend(v157, "initWithDomain:code:userInfo:", v138, 2, v137);
                                goto LABEL_154;
                              }
                              if (!v115)
                                goto LABEL_135;
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                goto LABEL_135;
                              obj = v115;
                              if (!v187)
                              {
                                a4 = 0;
                                v13 = v185;
                                v28 = v175;
                                v64 = v168;
                                goto LABEL_172;
                              }
                              v184 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v139 = *MEMORY[0x1E0D025B8];
                              v207 = *MEMORY[0x1E0CB2D50];
                              v131 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("assets"));
                              v208 = v131;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v208, &v207, 1);
                              v140 = (void *)objc_claimAutoreleasedReturnValue();
                              *v187 = (id)objc_msgSend(v184, "initWithDomain:code:userInfo:", v139, 2, v140);

                              a4 = 0;
                              v13 = v185;
LABEL_170:
                              v64 = v168;
                              goto LABEL_171;
                            }
                            if (v187)
                            {
                              v151 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v152 = *MEMORY[0x1E0D025B8];
                              v209 = *MEMORY[0x1E0CB2D50];
                              obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("visibilityCategoryForUI"));
                              v210 = obj;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v210, &v209, 1);
                              v131 = (void *)objc_claimAutoreleasedReturnValue();
                              v159 = 0;
                              a4 = 0;
                              *v187 = (id)objc_msgSend(v151, "initWithDomain:code:userInfo:", v152, 2, v131);
                              v7 = v179;
                              v10 = v183;
                              v13 = v185;
                              goto LABEL_170;
                            }
                            v159 = 0;
                            a4 = 0;
                            v7 = v179;
                            v10 = v183;
                            v13 = v185;
                            v28 = v175;
LABEL_199:
                            v64 = v168;
                            goto LABEL_173;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v161 = v104;
                            goto LABEL_116;
                          }
                          if (v187)
                          {
                            v111 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v112 = *MEMORY[0x1E0D025B8];
                            v211 = *MEMORY[0x1E0CB2D50];
                            v159 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("ordinalRankInRecommendedTab"));
                            v212 = v159;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v212, &v211, 1);
                            v113 = objc_claimAutoreleasedReturnValue();
                            v114 = v111;
                            v28 = v175;
                            v158 = (void *)v113;
                            v161 = 0;
                            a4 = 0;
                            *v187 = (id)objc_msgSend(v114, "initWithDomain:code:userInfo:", v112, 2);
                            v7 = v179;
                            v13 = v185;
                            goto LABEL_199;
                          }
                          v161 = 0;
                          a4 = 0;
LABEL_192:
                          v7 = v179;
                          v13 = v185;
                          v64 = v168;
                          goto LABEL_174;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v163 = v102;
                          goto LABEL_113;
                        }
                        if (v187)
                        {
                          v107 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v108 = *MEMORY[0x1E0D025B8];
                          v213 = *MEMORY[0x1E0CB2D50];
                          v161 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("bundleGoodnessScore"));
                          v214 = v161;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v214, &v213, 1);
                          v109 = objc_claimAutoreleasedReturnValue();
                          v110 = v107;
                          v28 = v175;
                          v160 = (void *)v109;
                          v163 = 0;
                          a4 = 0;
                          *v187 = (id)objc_msgSend(v110, "initWithDomain:code:userInfo:", v108, 2);
                          goto LABEL_192;
                        }
                        v163 = 0;
                        a4 = 0;
                        v7 = v179;
                        v13 = v185;
LABEL_167:
                        v64 = v168;
                        goto LABEL_175;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v165 = v96;
                        goto LABEL_110;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v97 = v28;
                        v98 = (void *)MEMORY[0x1E0CB37E8];
                        v99 = BMMomentsEventDataEventBundleBundleSuperTypeFromString(v96);
                        v100 = v98;
                        v28 = v97;
                        objc_msgSend(v100, "numberWithInt:", v99);
                        v165 = (id)objc_claimAutoreleasedReturnValue();
                        v10 = v183;
                        goto LABEL_110;
                      }
                      if (v187)
                      {
                        v146 = v28;
                        v147 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v148 = *MEMORY[0x1E0D025B8];
                        v215 = *MEMORY[0x1E0CB2D50];
                        v163 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("bundleSuperType"));
                        v216 = v163;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v216, &v215, 1);
                        v149 = objc_claimAutoreleasedReturnValue();
                        v150 = v147;
                        v28 = v146;
                        v162 = (void *)v149;
                        v165 = 0;
                        a4 = 0;
                        *v187 = (id)objc_msgSend(v150, "initWithDomain:code:userInfo:", v148, 2);
                        v7 = v179;
                        v10 = v183;
                        v13 = v185;
                        goto LABEL_167;
                      }
                      v165 = 0;
                      a4 = 0;
LABEL_197:
                      v7 = v179;
                      v10 = v183;
                      v13 = v185;
                      v64 = v168;
                      goto LABEL_176;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v167 = v75;
                      goto LABEL_103;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v91 = v28;
                      v92 = (void *)MEMORY[0x1E0CB37E8];
                      v93 = BMMomentsEventDataEventBundleBundleSubTypeFromString(v75);
                      v94 = v92;
                      v28 = v91;
                      objc_msgSend(v94, "numberWithInt:", v93);
                      v167 = (id)objc_claimAutoreleasedReturnValue();
                      v10 = v183;
                      goto LABEL_103;
                    }
                    if (v187)
                    {
                      v141 = v28;
                      v142 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v143 = *MEMORY[0x1E0D025B8];
                      v217 = *MEMORY[0x1E0CB2D50];
                      v165 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("bundleSubType"));
                      v218 = v165;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v218, &v217, 1);
                      v144 = objc_claimAutoreleasedReturnValue();
                      v145 = v142;
                      v28 = v141;
                      v164 = (void *)v144;
                      v167 = 0;
                      a4 = 0;
                      *v187 = (id)objc_msgSend(v145, "initWithDomain:code:userInfo:", v143, 2);
                      goto LABEL_197;
                    }
                    v167 = 0;
                    a4 = 0;
                    v7 = v179;
                    v10 = v183;
                    v13 = v185;
                  }
                  else
                  {
                    v73 = v27;
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v187 = a4;
                      v63 = v68;
                      v28 = v175;
                      goto LABEL_85;
                    }
                    if (!a4)
                    {
                      v63 = 0;
                      v7 = v179;
                      v13 = v185;
                      v28 = v175;
                      v64 = v168;
                      goto LABEL_178;
                    }
                    v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v89 = *MEMORY[0x1E0D025B8];
                    v219 = *MEMORY[0x1E0CB2D50];
                    v90 = a4;
                    v167 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleEvergreenType"));
                    v220 = v167;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v220, &v219, 1);
                    v166 = (void *)objc_claimAutoreleasedReturnValue();
                    v63 = 0;
                    a4 = 0;
                    *v90 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2);
                    v7 = v179;
                    v13 = v185;
                    v27 = v73;
                    v28 = v175;
                  }
                  v64 = v168;
                  goto LABEL_177;
                }
                if (v186)
                {
                  v85 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v86 = *MEMORY[0x1E0D025B8];
                  v221 = *MEMORY[0x1E0CB2D50];
                  v63 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleInterfaceType"));
                  v222 = v63;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v222, &v221, 1);
                  v170 = (void *)objc_claimAutoreleasedReturnValue();
                  v87 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v86, 2);
                  v64 = 0;
                  a4 = 0;
                  *v186 = v87;
                  v13 = v185;
                  v28 = v175;

                  goto LABEL_179;
                }
                v64 = 0;
                v13 = v185;
                v28 = v175;
LABEL_180:

LABEL_181:
                self = v177;

LABEL_182:
LABEL_183:
                v71 = v176;
LABEL_184:

                goto LABEL_185;
              }
            }
          }
          if (v186)
          {
            v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v70 = *MEMORY[0x1E0D025B8];
            v232 = *MEMORY[0x1E0CB2D50];
            v178 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("interfaceType"));
            v233 = v178;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v233, &v232, 1);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = v70;
            v10 = v183;
            v181 = 0;
            a4 = 0;
            *v186 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v72, 2, v71);
            v13 = v185;
            v27 = v34;
            goto LABEL_184;
          }
          v181 = 0;
          a4 = 0;
          v13 = v185;
LABEL_185:
          v78 = v180;
          goto LABEL_186;
        }
        if (v186)
        {
          v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v81 = *MEMORY[0x1E0D025B8];
          v234 = *MEMORY[0x1E0CB2D50];
          v181 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("endDate"));
          v235 = v181;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v235, &v234, 1);
          v82 = objc_claimAutoreleasedReturnValue();
          v83 = v80;
          v28 = (void *)v82;
          v84 = v81;
          v10 = v183;
          v78 = 0;
          a4 = 0;
          *v186 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v84, 2, v82);
          v13 = v185;
LABEL_186:

          goto LABEL_187;
        }
        v78 = 0;
        a4 = 0;
        v13 = v185;
LABEL_187:

        goto LABEL_188;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v186)
        {
          v10 = 0;
          a4 = 0;
          v13 = v185;
LABEL_188:

          goto LABEL_189;
        }
        v76 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v77 = *MEMORY[0x1E0D025B8];
        v236 = *MEMORY[0x1E0CB2D50];
        v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("startDate"));
        v237 = v78;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v237, &v236, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v77, 2, v27);
        v10 = 0;
        a4 = 0;
        *v186 = v79;
        v13 = v185;
        goto LABEL_187;
      }
      v19 = v9;
    }
    v10 = v19;
    goto LABEL_19;
  }
  if (a4)
  {
    v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v21 = *MEMORY[0x1E0D025B8];
    v238 = *MEMORY[0x1E0CB2D50];
    v13 = (BMMomentsEngagementSuggestionIdentifier *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("identifier"));
    v239[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v239, &v238, 1);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v21;
    v10 = (id)v22;
    v24 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v23, 2, v22);
    v25 = a4;
    a4 = 0;
    *v25 = v24;
LABEL_189:

  }
  return (BMMomentsEngagementBundleSummary *)a4;
}

- (id)_attachedPhotoAssetsJSONArray
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
  -[BMMomentsEngagementBundleSummary attachedPhotoAssets](self, "attachedPhotoAssets", 0);
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

- (id)_assetsJSONArray
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
  -[BMMomentsEngagementBundleSummary assets](self, "assets", 0);
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  _QWORD v56[14];
  _QWORD v57[16];

  v57[14] = *MEMORY[0x1E0C80C00];
  -[BMMomentsEngagementBundleSummary identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMMomentsEngagementBundleSummary startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEngagementBundleSummary startDate](self, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  -[BMMomentsEngagementBundleSummary endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEngagementBundleSummary endDate](self, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
    objc_msgSend(v10, "numberWithDouble:");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementBundleSummary interfaceType](self, "interfaceType"));
  v13 = objc_claimAutoreleasedReturnValue();
  if (!-[BMMomentsEngagementBundleSummary hasRankingScore](self, "hasRankingScore")
    || (-[BMMomentsEngagementBundleSummary rankingScore](self, "rankingScore"), fabs(v14) == INFINITY))
  {
    v55 = 0;
  }
  else
  {
    -[BMMomentsEngagementBundleSummary rankingScore](self, "rankingScore");
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEngagementBundleSummary rankingScore](self, "rankingScore");
    objc_msgSend(v15, "numberWithDouble:");
    v55 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[BMMomentsEngagementBundleSummary _attachedPhotoAssetsJSONArray](self, "_attachedPhotoAssetsJSONArray");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementBundleSummary bundleInterfaceType](self, "bundleInterfaceType");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementBundleSummary bundleEvergreenType](self, "bundleEvergreenType");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementBundleSummary bundleSubType](self, "bundleSubType"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementBundleSummary bundleSuperType](self, "bundleSuperType"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMMomentsEngagementBundleSummary hasBundleGoodnessScore](self, "hasBundleGoodnessScore")
    || (-[BMMomentsEngagementBundleSummary bundleGoodnessScore](self, "bundleGoodnessScore"), fabs(v16) == INFINITY))
  {
    v49 = 0;
  }
  else
  {
    -[BMMomentsEngagementBundleSummary bundleGoodnessScore](self, "bundleGoodnessScore");
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEngagementBundleSummary bundleGoodnessScore](self, "bundleGoodnessScore");
    objc_msgSend(v17, "numberWithDouble:");
    v49 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMMomentsEngagementBundleSummary hasOrdinalRankInRecommendedTab](self, "hasOrdinalRankInRecommendedTab"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementBundleSummary ordinalRankInRecommendedTab](self, "ordinalRankInRecommendedTab"));
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementBundleSummary visibilityCategoryForUI](self, "visibilityCategoryForUI"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementBundleSummary _assetsJSONArray](self, "_assetsJSONArray");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = CFSTR("identifier");
  v20 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v20;
  v57[0] = v20;
  v56[1] = CFSTR("startDate");
  v21 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v21;
  v57[1] = v21;
  v56[2] = CFSTR("endDate");
  v22 = (uint64_t)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v22;
  v57[2] = v22;
  v56[3] = CFSTR("interfaceType");
  v23 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v23;
  v57[3] = v23;
  v56[4] = CFSTR("rankingScore");
  v24 = (uint64_t)v55;
  if (!v55)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v57[4] = v24;
  v56[5] = CFSTR("attachedPhotoAssets");
  v25 = (uint64_t)v54;
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v57[5] = v25;
  v56[6] = CFSTR("bundleInterfaceType");
  v26 = (uint64_t)v53;
  if (!v53)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v47 = v8;
  v57[6] = v26;
  v56[7] = CFSTR("bundleEvergreenType");
  v27 = (uint64_t)v52;
  if (!v52)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v36 = v27;
  v57[7] = v27;
  v56[8] = CFSTR("bundleSubType");
  v28 = v51;
  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v26;
  v40 = (void *)v24;
  v57[8] = v28;
  v56[9] = CFSTR("bundleSuperType");
  v29 = v50;
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v13;
  v57[9] = v29;
  v56[10] = CFSTR("bundleGoodnessScore");
  v30 = v49;
  if (!v49)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v25;
  v57[10] = v30;
  v56[11] = CFSTR("ordinalRankInRecommendedTab");
  v31 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = v18;
  v57[11] = v31;
  v56[12] = CFSTR("visibilityCategoryForUI");
  v33 = v48;
  if (!v48)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v57[12] = v33;
  v56[13] = CFSTR("assets");
  v34 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v57[13] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 14, v36);
  v45 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19)

  if (!v48)
  if (!v32)

  if (!v49)
  if (!v50)

  if (!v51)
  if (!v52)

  if (!v53)
  if (!v54)

  if (v55)
  {
    if (v46)
      goto LABEL_66;
  }
  else
  {

    if (v46)
    {
LABEL_66:
      if (v12)
        goto LABEL_67;
      goto LABEL_72;
    }
  }

  if (v12)
  {
LABEL_67:
    if (v47)
      goto LABEL_68;
LABEL_73:

    if (v4)
      goto LABEL_69;
LABEL_74:

    goto LABEL_69;
  }
LABEL_72:

  if (!v47)
    goto LABEL_73;
LABEL_68:
  if (!v4)
    goto LABEL_74;
LABEL_69:

  return v45;
}

- (NSDate)startDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_startDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_startDate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_endDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_endDate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
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
  int v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  int v47;
  int v48;
  double v49;
  double v50;
  double v51;
  int v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMomentsEngagementBundleSummary identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMomentsEngagementBundleSummary identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_48;
    }
    -[BMMomentsEngagementBundleSummary startDate](self, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMomentsEngagementBundleSummary startDate](self, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_48;
    }
    -[BMMomentsEngagementBundleSummary endDate](self, "endDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMMomentsEngagementBundleSummary endDate](self, "endDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_48;
    }
    v25 = -[BMMomentsEngagementBundleSummary interfaceType](self, "interfaceType");
    if (v25 != objc_msgSend(v5, "interfaceType"))
      goto LABEL_48;
    if (-[BMMomentsEngagementBundleSummary hasRankingScore](self, "hasRankingScore")
      || objc_msgSend(v5, "hasRankingScore"))
    {
      if (!-[BMMomentsEngagementBundleSummary hasRankingScore](self, "hasRankingScore"))
        goto LABEL_48;
      if (!objc_msgSend(v5, "hasRankingScore"))
        goto LABEL_48;
      -[BMMomentsEngagementBundleSummary rankingScore](self, "rankingScore");
      v27 = v26;
      objc_msgSend(v5, "rankingScore");
      if (v27 != v28)
        goto LABEL_48;
    }
    -[BMMomentsEngagementBundleSummary attachedPhotoAssets](self, "attachedPhotoAssets");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachedPhotoAssets");
    v30 = objc_claimAutoreleasedReturnValue();
    if (v29 == (void *)v30)
    {

    }
    else
    {
      v31 = (void *)v30;
      -[BMMomentsEngagementBundleSummary attachedPhotoAssets](self, "attachedPhotoAssets");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attachedPhotoAssets");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqual:", v33);

      if (!v34)
        goto LABEL_48;
    }
    -[BMMomentsEngagementBundleSummary bundleInterfaceType](self, "bundleInterfaceType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleInterfaceType");
    v36 = objc_claimAutoreleasedReturnValue();
    if (v35 == (void *)v36)
    {

    }
    else
    {
      v37 = (void *)v36;
      -[BMMomentsEngagementBundleSummary bundleInterfaceType](self, "bundleInterfaceType");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleInterfaceType");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "isEqual:", v39);

      if (!v40)
        goto LABEL_48;
    }
    -[BMMomentsEngagementBundleSummary bundleEvergreenType](self, "bundleEvergreenType");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleEvergreenType");
    v42 = objc_claimAutoreleasedReturnValue();
    if (v41 == (void *)v42)
    {

    }
    else
    {
      v43 = (void *)v42;
      -[BMMomentsEngagementBundleSummary bundleEvergreenType](self, "bundleEvergreenType");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleEvergreenType");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v44, "isEqual:", v45);

      if (!v46)
        goto LABEL_48;
    }
    v47 = -[BMMomentsEngagementBundleSummary bundleSubType](self, "bundleSubType");
    if (v47 == objc_msgSend(v5, "bundleSubType"))
    {
      v48 = -[BMMomentsEngagementBundleSummary bundleSuperType](self, "bundleSuperType");
      if (v48 == objc_msgSend(v5, "bundleSuperType"))
      {
        if (!-[BMMomentsEngagementBundleSummary hasBundleGoodnessScore](self, "hasBundleGoodnessScore")
          && !objc_msgSend(v5, "hasBundleGoodnessScore")
          || -[BMMomentsEngagementBundleSummary hasBundleGoodnessScore](self, "hasBundleGoodnessScore")
          && objc_msgSend(v5, "hasBundleGoodnessScore")
          && (-[BMMomentsEngagementBundleSummary bundleGoodnessScore](self, "bundleGoodnessScore"),
              v50 = v49,
              objc_msgSend(v5, "bundleGoodnessScore"),
              v50 == v51))
        {
          if (!-[BMMomentsEngagementBundleSummary hasOrdinalRankInRecommendedTab](self, "hasOrdinalRankInRecommendedTab")&& !objc_msgSend(v5, "hasOrdinalRankInRecommendedTab")|| -[BMMomentsEngagementBundleSummary hasOrdinalRankInRecommendedTab](self, "hasOrdinalRankInRecommendedTab")&& objc_msgSend(v5, "hasOrdinalRankInRecommendedTab")&& (v52 = -[BMMomentsEngagementBundleSummary ordinalRankInRecommendedTab](self, "ordinalRankInRecommendedTab"), v52 == objc_msgSend(v5, "ordinalRankInRecommendedTab")))
          {
            v53 = -[BMMomentsEngagementBundleSummary visibilityCategoryForUI](self, "visibilityCategoryForUI");
            if (v53 == objc_msgSend(v5, "visibilityCategoryForUI"))
            {
              -[BMMomentsEngagementBundleSummary assets](self, "assets");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "assets");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              if (v54 == v55)
              {
                v12 = 1;
              }
              else
              {
                -[BMMomentsEngagementBundleSummary assets](self, "assets");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "assets");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = objc_msgSend(v56, "isEqual:", v57);

              }
              goto LABEL_49;
            }
          }
        }
      }
    }
LABEL_48:
    v12 = 0;
LABEL_49:

    goto LABEL_50;
  }
  v12 = 0;
LABEL_50:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMMomentsEngagementSuggestionIdentifier)identifier
{
  return self->_identifier;
}

- (int)interfaceType
{
  return self->_interfaceType;
}

- (double)rankingScore
{
  return self->_rankingScore;
}

- (BOOL)hasRankingScore
{
  return self->_hasRankingScore;
}

- (void)setHasRankingScore:(BOOL)a3
{
  self->_hasRankingScore = a3;
}

- (NSArray)attachedPhotoAssets
{
  return self->_attachedPhotoAssets;
}

- (NSString)bundleInterfaceType
{
  return self->_bundleInterfaceType;
}

- (NSString)bundleEvergreenType
{
  return self->_bundleEvergreenType;
}

- (int)bundleSubType
{
  return self->_bundleSubType;
}

- (int)bundleSuperType
{
  return self->_bundleSuperType;
}

- (double)bundleGoodnessScore
{
  return self->_bundleGoodnessScore;
}

- (BOOL)hasBundleGoodnessScore
{
  return self->_hasBundleGoodnessScore;
}

- (void)setHasBundleGoodnessScore:(BOOL)a3
{
  self->_hasBundleGoodnessScore = a3;
}

- (int)ordinalRankInRecommendedTab
{
  return self->_ordinalRankInRecommendedTab;
}

- (BOOL)hasOrdinalRankInRecommendedTab
{
  return self->_hasOrdinalRankInRecommendedTab;
}

- (void)setHasOrdinalRankInRecommendedTab:(BOOL)a3
{
  self->_hasOrdinalRankInRecommendedTab = a3;
}

- (int)visibilityCategoryForUI
{
  return self->_visibilityCategoryForUI;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_bundleEvergreenType, 0);
  objc_storeStrong((id *)&self->_bundleInterfaceType, 0);
  objc_storeStrong((id *)&self->_attachedPhotoAssets, 0);
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

    v4 = -[BMMomentsEngagementBundleSummary initByReadFrom:]([BMMomentsEngagementBundleSummary alloc], "initByReadFrom:", v7);
    v4[13] = 0;

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
  _QWORD v18[16];

  v18[14] = *MEMORY[0x1E0C80C00];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("identifier_json"), 5, 1, &__block_literal_global_346);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startDate"), 3, 0, 2, 0, 2);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("endDate"), 3, 0, 3, 0, 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("interfaceType"), 0, 0, 4, 4, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rankingScore"), 1, 0, 5, 1, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("attachedPhotoAssets_json"), 5, 1, &__block_literal_global_347);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleInterfaceType"), 2, 0, 7, 13, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleEvergreenType"), 2, 0, 8, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleSubType"), 0, 0, 9, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleSuperType"), 0, 0, 10, 4, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleGoodnessScore"), 1, 0, 11, 1, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ordinalRankInRecommendedTab"), 0, 0, 12, 2, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("visibilityCategoryForUI"), 0, 0, 13, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("assets_json"), 5, 1, &__block_literal_global_348);
  v18[0] = v17;
  v18[1] = v16;
  v18[2] = v2;
  v18[3] = v3;
  v18[4] = v13;
  v18[5] = v12;
  v18[6] = v4;
  v18[7] = v15;
  v18[8] = v5;
  v18[9] = v6;
  v18[10] = v14;
  v18[11] = v7;
  v18[12] = v8;
  v18[13] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 14);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D5F0;
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
  _QWORD v18[16];

  v18[14] = *MEMORY[0x1E0C80C00];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 14, objc_opt_class());
  v18[0] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startDate"), 2, 0, 0);
  v18[1] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("endDate"), 3, 0, 0);
  v18[2] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("interfaceType"), 4, 4, 0);
  v18[3] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rankingScore"), 5, 1, 0);
  v18[4] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("attachedPhotoAssets"), 6, 14, objc_opt_class());
  v18[5] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleInterfaceType"), 7, 13, 0);
  v18[6] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleEvergreenType"), 8, 13, 0);
  v18[7] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleSubType"), 9, 4, 0);
  v18[8] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleSuperType"), 10, 4, 0);
  v18[9] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleGoodnessScore"), 11, 1, 0);
  v18[10] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ordinalRankInRecommendedTab"), 12, 2, 0);
  v18[11] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visibilityCategoryForUI"), 13, 4, 0);
  v18[12] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("assets"), 14, 14, objc_opt_class());
  v18[13] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __43__BMMomentsEngagementBundleSummary_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_assetsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __43__BMMomentsEngagementBundleSummary_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_attachedPhotoAssetsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __43__BMMomentsEngagementBundleSummary_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
