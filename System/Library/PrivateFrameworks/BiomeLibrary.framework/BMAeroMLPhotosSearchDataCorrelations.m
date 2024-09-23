@implementation BMAeroMLPhotosSearchDataCorrelations

- (BMAeroMLPhotosSearchDataCorrelations)initWithSearchSessionUUID:(id)a3 uiSurface:(int)a4 matchedPeopleRatio:(id)a5 matchedLocationRatio:(id)a6 matchedSceneRatio:(id)a7 matchedSceneConfidence:(id)a8 matchedSceneBoundingBox:(id)a9 matchedOCRCharacterRatio:(id)a10 matchedOCRImportance:(id)a11 matchedFieldsCount:(id)a12 L1Score:(id)a13 freshness:(id)a14 favorited:(id)a15 aestheticScore:(id)a16 curationScore:(id)a17 hasEverClickInLastWeek:(id)a18 hasEverClickInLastMonth:(id)a19 hasEverShareInLastWeek:(id)a20 hasEverShareInLastMonth:(id)a21 clickCountInLastWeekNormalizedAcrossItems:(id)a22 clickCountInLastMonthNormalizedAcrossItems:(id)a23 shareCountInLastWeekNormalizedAcrossItems:(id)a24 shareCountInLastMonthNormalizedAcrossItems:(id)a25 clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(id)a26 clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(id)a27 clickCountGivenLocationInLastWeekNormalizedAcrossItems:(id)a28 clickCountGivenLocationInLastMonthNormalizedAcrossItems:(id)a29 clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(id)a30 clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(id)a31 clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(id)a32 clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(id)a33 clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(id)a34 clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(id)a35 clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(id)a36 clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(id)a37 shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(id)a38 shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(id)a39 shareCountGivenLocationInLastWeekNormalizedAcrossItems:(id)a40 shareCountGivenLocationInLastMonthNormalizedAcrossItems:(id)a41 shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(id)a42 shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(id)a43 shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(id)a44 shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(id)a45 shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(id)a46 shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(id)a47 shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(id)a48 shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(id)a49 clipScore:(id)a50 correlationMetricVersion:(id)a51 correlationMetricWindowInDays:(id)a52
{
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  BMAeroMLPhotosSearchDataCorrelations *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  unsigned int v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  unsigned int v109;
  unsigned int v110;
  BMAeroMLPhotosSearchDataCorrelations *v111;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v154;
  id v155;
  id v156;
  id v157;
  objc_super v158;

  v116 = a3;
  v157 = a5;
  v156 = a6;
  v155 = a7;
  v154 = a8;
  v152 = a9;
  v151 = a10;
  v150 = a11;
  v149 = a12;
  v148 = a13;
  v147 = a14;
  v146 = a15;
  v145 = a16;
  v144 = a17;
  v143 = a18;
  v142 = a19;
  v141 = a20;
  v140 = a21;
  v139 = a22;
  v138 = a23;
  v137 = a24;
  v136 = a25;
  v135 = a26;
  v134 = a27;
  v133 = a28;
  v132 = a29;
  v131 = a30;
  v130 = a31;
  v129 = a32;
  v128 = a33;
  v127 = a34;
  v126 = a35;
  v125 = a36;
  v124 = a37;
  v123 = a38;
  v122 = a39;
  v121 = a40;
  v120 = a41;
  v119 = a42;
  v118 = a43;
  v117 = a44;
  v55 = a45;
  v56 = a46;
  v57 = a47;
  v58 = a48;
  v59 = a49;
  v60 = a50;
  v61 = a51;
  v62 = a52;
  v158.receiver = self;
  v158.super_class = (Class)BMAeroMLPhotosSearchDataCorrelations;
  v63 = -[BMEventBase init](&v158, sel_init);

  if (v63)
  {
    v63->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v63->_searchSessionUUID, a3);
    v63->_uiSurface = a4;
    if (v157)
    {
      v63->_hasMatchedPeopleRatio = 1;
      objc_msgSend(v157, "doubleValue");
    }
    else
    {
      v63->_hasMatchedPeopleRatio = 0;
      v64 = -1.0;
    }
    v63->_matchedPeopleRatio = v64;
    if (v156)
    {
      v63->_hasMatchedLocationRatio = 1;
      objc_msgSend(v156, "doubleValue");
    }
    else
    {
      v63->_hasMatchedLocationRatio = 0;
      v65 = -1.0;
    }
    v63->_matchedLocationRatio = v65;
    if (v155)
    {
      v63->_hasMatchedSceneRatio = 1;
      objc_msgSend(v155, "doubleValue");
    }
    else
    {
      v63->_hasMatchedSceneRatio = 0;
      v66 = -1.0;
    }
    v63->_matchedSceneRatio = v66;
    if (v154)
    {
      v63->_hasMatchedSceneConfidence = 1;
      objc_msgSend(v154, "doubleValue");
    }
    else
    {
      v63->_hasMatchedSceneConfidence = 0;
      v67 = -1.0;
    }
    v63->_matchedSceneConfidence = v67;
    if (v152)
    {
      v63->_hasMatchedSceneBoundingBox = 1;
      objc_msgSend(v152, "doubleValue");
    }
    else
    {
      v63->_hasMatchedSceneBoundingBox = 0;
      v68 = -1.0;
    }
    v63->_matchedSceneBoundingBox = v68;
    if (v151)
    {
      v63->_hasMatchedOCRCharacterRatio = 1;
      objc_msgSend(v151, "doubleValue");
    }
    else
    {
      v63->_hasMatchedOCRCharacterRatio = 0;
      v69 = -1.0;
    }
    v63->_matchedOCRCharacterRatio = v69;
    if (v150)
    {
      v63->_hasMatchedOCRImportance = 1;
      objc_msgSend(v150, "doubleValue");
    }
    else
    {
      v63->_hasMatchedOCRImportance = 0;
      v70 = -1.0;
    }
    v63->_matchedOCRImportance = v70;
    v71 = v149;
    if (v149)
    {
      v63->_hasMatchedFieldsCount = 1;
      v71 = objc_msgSend(v149, "unsignedIntValue");
    }
    else
    {
      v63->_hasMatchedFieldsCount = 0;
    }
    v63->_matchedFieldsCount = v71;
    if (v148)
    {
      v63->_hasL1Score = 1;
      objc_msgSend(v148, "doubleValue");
    }
    else
    {
      v63->_hasL1Score = 0;
      v72 = -1.0;
    }
    v63->_L1Score = v72;
    if (v147)
    {
      v63->_hasFreshness = 1;
      objc_msgSend(v147, "doubleValue");
    }
    else
    {
      v63->_hasFreshness = 0;
      v73 = -1.0;
    }
    v63->_freshness = v73;
    if (v146)
    {
      v63->_hasFavorited = 1;
      v63->_favorited = objc_msgSend(v146, "BOOLValue");
    }
    else
    {
      v63->_hasFavorited = 0;
      v63->_favorited = 0;
    }
    if (v145)
    {
      v63->_hasAestheticScore = 1;
      objc_msgSend(v145, "doubleValue");
    }
    else
    {
      v63->_hasAestheticScore = 0;
      v74 = -1.0;
    }
    v63->_aestheticScore = v74;
    if (v144)
    {
      v63->_hasCurationScore = 1;
      objc_msgSend(v144, "doubleValue");
    }
    else
    {
      v63->_hasCurationScore = 0;
      v75 = -1.0;
    }
    v63->_curationScore = v75;
    if (v143)
    {
      v63->_hasHasEverClickInLastWeek = 1;
      objc_msgSend(v143, "doubleValue");
    }
    else
    {
      v63->_hasHasEverClickInLastWeek = 0;
      v76 = -1.0;
    }
    v63->_hasEverClickInLastWeek = v76;
    if (v142)
    {
      v63->_hasHasEverClickInLastMonth = 1;
      objc_msgSend(v142, "doubleValue");
    }
    else
    {
      v63->_hasHasEverClickInLastMonth = 0;
      v77 = -1.0;
    }
    v63->_hasEverClickInLastMonth = v77;
    if (v141)
    {
      v63->_hasHasEverShareInLastWeek = 1;
      objc_msgSend(v141, "doubleValue");
    }
    else
    {
      v63->_hasHasEverShareInLastWeek = 0;
      v78 = -1.0;
    }
    v63->_hasEverShareInLastWeek = v78;
    if (v140)
    {
      v63->_hasHasEverShareInLastMonth = 1;
      objc_msgSend(v140, "doubleValue");
    }
    else
    {
      v63->_hasHasEverShareInLastMonth = 0;
      v79 = -1.0;
    }
    v63->_hasEverShareInLastMonth = v79;
    if (v139)
    {
      v63->_hasClickCountInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v139, "doubleValue");
    }
    else
    {
      v63->_hasClickCountInLastWeekNormalizedAcrossItems = 0;
      v80 = -1.0;
    }
    v63->_clickCountInLastWeekNormalizedAcrossItems = v80;
    if (v138)
    {
      v63->_hasClickCountInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v138, "doubleValue");
    }
    else
    {
      v63->_hasClickCountInLastMonthNormalizedAcrossItems = 0;
      v81 = -1.0;
    }
    v63->_clickCountInLastMonthNormalizedAcrossItems = v81;
    if (v137)
    {
      v63->_hasShareCountInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v137, "doubleValue");
    }
    else
    {
      v63->_hasShareCountInLastWeekNormalizedAcrossItems = 0;
      v82 = -1.0;
    }
    v63->_shareCountInLastWeekNormalizedAcrossItems = v82;
    if (v136)
    {
      v63->_hasShareCountInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v136, "doubleValue");
    }
    else
    {
      v63->_hasShareCountInLastMonthNormalizedAcrossItems = 0;
      v83 = -1.0;
    }
    v63->_shareCountInLastMonthNormalizedAcrossItems = v83;
    if (v135)
    {
      v63->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v135, "doubleValue");
    }
    else
    {
      v63->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 0;
      v84 = -1.0;
    }
    v63->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = v84;
    if (v134)
    {
      v63->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v134, "doubleValue");
    }
    else
    {
      v63->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 0;
      v85 = -1.0;
    }
    v63->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = v85;
    if (v133)
    {
      v63->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v133, "doubleValue");
    }
    else
    {
      v63->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems = 0;
      v86 = -1.0;
    }
    v63->_clickCountGivenLocationInLastWeekNormalizedAcrossItems = v86;
    if (v132)
    {
      v63->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v132, "doubleValue");
    }
    else
    {
      v63->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems = 0;
      v87 = -1.0;
    }
    v63->_clickCountGivenLocationInLastMonthNormalizedAcrossItems = v87;
    if (v131)
    {
      v63->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v131, "doubleValue");
    }
    else
    {
      v63->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 0;
      v88 = -1.0;
    }
    v63->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = v88;
    if (v130)
    {
      v63->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v130, "doubleValue");
    }
    else
    {
      v63->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 0;
      v89 = -1.0;
    }
    v63->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = v89;
    if (v129)
    {
      v63->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v129, "doubleValue");
    }
    else
    {
      v63->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 0;
      v90 = -1.0;
    }
    v63->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = v90;
    if (v128)
    {
      v63->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v128, "doubleValue");
    }
    else
    {
      v63->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 0;
      v91 = -1.0;
    }
    v63->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = v91;
    if (v127)
    {
      v63->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v127, "doubleValue");
    }
    else
    {
      v63->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 0;
      v92 = -1.0;
    }
    v63->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = v92;
    if (v126)
    {
      v63->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v126, "doubleValue");
    }
    else
    {
      v63->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 0;
      v93 = -1.0;
    }
    v63->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = v93;
    if (v125)
    {
      v63->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v125, "doubleValue");
    }
    else
    {
      v63->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 0;
      v94 = -1.0;
    }
    v63->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = v94;
    if (v124)
    {
      v63->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v124, "doubleValue");
    }
    else
    {
      v63->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 0;
      v95 = -1.0;
    }
    v63->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = v95;
    if (v123)
    {
      v63->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v123, "doubleValue");
    }
    else
    {
      v63->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 0;
      v96 = -1.0;
    }
    v63->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = v96;
    if (v122)
    {
      v63->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v122, "doubleValue");
    }
    else
    {
      v63->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 0;
      v97 = -1.0;
    }
    v63->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = v97;
    if (v121)
    {
      v63->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v121, "doubleValue");
    }
    else
    {
      v63->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems = 0;
      v98 = -1.0;
    }
    v63->_shareCountGivenLocationInLastWeekNormalizedAcrossItems = v98;
    if (v120)
    {
      v63->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v120, "doubleValue");
    }
    else
    {
      v63->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems = 0;
      v99 = -1.0;
    }
    v63->_shareCountGivenLocationInLastMonthNormalizedAcrossItems = v99;
    if (v119)
    {
      v63->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v119, "doubleValue");
    }
    else
    {
      v63->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 0;
      v100 = -1.0;
    }
    v63->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = v100;
    if (v118)
    {
      v63->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v118, "doubleValue");
    }
    else
    {
      v63->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 0;
      v101 = -1.0;
    }
    v63->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = v101;
    if (v117)
    {
      v63->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v117, "doubleValue");
    }
    else
    {
      v63->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 0;
      v102 = -1.0;
    }
    v63->_shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = v102;
    if (v55)
    {
      v63->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v55, "doubleValue");
    }
    else
    {
      v63->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 0;
      v103 = -1.0;
    }
    v63->_shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = v103;
    if (v56)
    {
      v63->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v56, "doubleValue");
    }
    else
    {
      v63->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 0;
      v104 = -1.0;
    }
    v63->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = v104;
    if (v57)
    {
      v63->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v57, "doubleValue");
    }
    else
    {
      v63->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 0;
      v105 = -1.0;
    }
    v63->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = v105;
    if (v58)
    {
      v63->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v58, "doubleValue");
    }
    else
    {
      v63->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 0;
      v106 = -1.0;
    }
    v63->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = v106;
    if (v59)
    {
      v63->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v59, "doubleValue");
    }
    else
    {
      v63->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 0;
      v107 = -1.0;
    }
    v63->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = v107;
    if (v60)
    {
      v63->_hasClipScore = 1;
      objc_msgSend(v60, "doubleValue");
    }
    else
    {
      v63->_hasClipScore = 0;
      v108 = -1.0;
    }
    v63->_clipScore = v108;
    if (v61)
    {
      v63->_hasCorrelationMetricVersion = 1;
      v109 = objc_msgSend(v61, "unsignedIntValue");
    }
    else
    {
      v109 = 0;
      v63->_hasCorrelationMetricVersion = 0;
    }
    v63->_correlationMetricVersion = v109;
    if (v62)
    {
      v63->_hasCorrelationMetricWindowInDays = 1;
      v110 = objc_msgSend(v62, "unsignedIntValue");
    }
    else
    {
      v110 = 0;
      v63->_hasCorrelationMetricWindowInDays = 0;
    }
    v63->_correlationMetricWindowInDays = v110;
  }
  v111 = v63;

  return v111;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
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
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;

  v62 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAeroMLPhotosSearchDataCorrelations searchSessionUUID](self, "searchSessionUUID");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  BMAeroMLPhotosSearchDataCorrelationsUISurfaceTypeAsString(-[BMAeroMLPhotosSearchDataCorrelations uiSurface](self, "uiSurface"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations matchedPeopleRatio](self, "matchedPeopleRatio");
  objc_msgSend(v3, "numberWithDouble:");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations matchedLocationRatio](self, "matchedLocationRatio");
  objc_msgSend(v4, "numberWithDouble:");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations matchedSceneRatio](self, "matchedSceneRatio");
  objc_msgSend(v5, "numberWithDouble:");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations matchedSceneConfidence](self, "matchedSceneConfidence");
  objc_msgSend(v6, "numberWithDouble:");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations matchedSceneBoundingBox](self, "matchedSceneBoundingBox");
  objc_msgSend(v7, "numberWithDouble:");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations matchedOCRCharacterRatio](self, "matchedOCRCharacterRatio");
  objc_msgSend(v8, "numberWithDouble:");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations matchedOCRImportance](self, "matchedOCRImportance");
  objc_msgSend(v9, "numberWithDouble:");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchDataCorrelations matchedFieldsCount](self, "matchedFieldsCount"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations L1Score](self, "L1Score");
  objc_msgSend(v10, "numberWithDouble:");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations freshness](self, "freshness");
  objc_msgSend(v11, "numberWithDouble:");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchDataCorrelations favorited](self, "favorited"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations aestheticScore](self, "aestheticScore");
  objc_msgSend(v12, "numberWithDouble:");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations curationScore](self, "curationScore");
  objc_msgSend(v13, "numberWithDouble:");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations hasEverClickInLastWeek](self, "hasEverClickInLastWeek");
  objc_msgSend(v14, "numberWithDouble:");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations hasEverClickInLastMonth](self, "hasEverClickInLastMonth");
  objc_msgSend(v15, "numberWithDouble:");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations hasEverShareInLastWeek](self, "hasEverShareInLastWeek");
  objc_msgSend(v16, "numberWithDouble:");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations hasEverShareInLastMonth](self, "hasEverShareInLastMonth");
  objc_msgSend(v17, "numberWithDouble:");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations clickCountInLastWeekNormalizedAcrossItems](self, "clickCountInLastWeekNormalizedAcrossItems");
  objc_msgSend(v18, "numberWithDouble:");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations clickCountInLastMonthNormalizedAcrossItems](self, "clickCountInLastMonthNormalizedAcrossItems");
  objc_msgSend(v19, "numberWithDouble:");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations shareCountInLastWeekNormalizedAcrossItems](self, "shareCountInLastWeekNormalizedAcrossItems");
  objc_msgSend(v20, "numberWithDouble:");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations shareCountInLastMonthNormalizedAcrossItems](self, "shareCountInLastMonthNormalizedAcrossItems");
  objc_msgSend(v21, "numberWithDouble:");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems");
  objc_msgSend(v22, "numberWithDouble:");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems");
  objc_msgSend(v23, "numberWithDouble:");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "clickCountGivenLocationInLastWeekNormalizedAcrossItems");
  objc_msgSend(v24, "numberWithDouble:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "clickCountGivenLocationInLastMonthNormalizedAcrossItems");
  objc_msgSend(v25, "numberWithDouble:");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems");
  objc_msgSend(v26, "numberWithDouble:");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems");
  objc_msgSend(v27, "numberWithDouble:");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems");
  objc_msgSend(v28, "numberWithDouble:");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems");
  objc_msgSend(v29, "numberWithDouble:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems");
  objc_msgSend(v30, "numberWithDouble:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems");
  objc_msgSend(v31, "numberWithDouble:");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems");
  objc_msgSend(v32, "numberWithDouble:");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems");
  objc_msgSend(v33, "numberWithDouble:");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems");
  objc_msgSend(v34, "numberWithDouble:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems");
  objc_msgSend(v35, "numberWithDouble:");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "shareCountGivenLocationInLastWeekNormalizedAcrossItems");
  objc_msgSend(v36, "numberWithDouble:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "shareCountGivenLocationInLastMonthNormalizedAcrossItems");
  objc_msgSend(v37, "numberWithDouble:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems");
  objc_msgSend(v38, "numberWithDouble:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems");
  objc_msgSend(v39, "numberWithDouble:");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems");
  objc_msgSend(v40, "numberWithDouble:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems");
  objc_msgSend(v41, "numberWithDouble:");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems");
  objc_msgSend(v42, "numberWithDouble:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems");
  objc_msgSend(v43, "numberWithDouble:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems");
  objc_msgSend(v44, "numberWithDouble:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems");
  objc_msgSend(v46, "numberWithDouble:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchDataCorrelations clipScore](self, "clipScore");
  objc_msgSend(v48, "numberWithDouble:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchDataCorrelations correlationMetricVersion](self, "correlationMetricVersion"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchDataCorrelations correlationMetricWindowInDays](self, "correlationMetricWindowInDays"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (id)objc_msgSend(v62, "initWithFormat:", CFSTR("BMAeroMLPhotosSearchDataCorrelations with searchSessionUUID: %@, uiSurface: %@, matchedPeopleRatio: %@, matchedLocationRatio: %@, matchedSceneRatio: %@, matchedSceneConfidence: %@, matchedSceneBoundingBox: %@, matchedOCRCharacterRatio: %@, matchedOCRImportance: %@, matchedFieldsCount: %@, L1Score: %@, freshness: %@, favorited: %@, aestheticScore: %@, curationScore: %@, hasEverClickInLastWeek: %@, hasEverClickInLastMonth: %@, hasEverShareInLastWeek: %@, hasEverShareInLastMonth: %@, clickCountInLastWeekNormalizedAcrossItems: %@, clickCountInLastMonthNormalizedAcrossItems: %@, shareCountInLastWeekNormalizedAcrossItems: %@, shareCountInLastMonthNormalizedAcrossItems: %@, clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems: %@, clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems: %@, clickCountGivenLocationInLastWeekNormalizedAcrossItems: %@, clickCountGivenLocationInLastMonthNormalizedAcrossItems: %@, clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems: %@, clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems: %@, clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems: %@, clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems: %@, clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems: %@, clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems: %@, clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems: %@, clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems: %@, shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems: %@, shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems: %@, shareCountGivenLocationInLastWeekNormalizedAcrossItems: %@, shareCountGivenLocationInLastMonthNormalizedAcrossItems: %@, shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems: %@, shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems: %@, shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems: %@, shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems: %@, shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems: %@, shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems: %@, shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems: %@, shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems: %@, clipScore: %@, correlationMetricVersion: %@, correlationMetricWindowInDays: %@"), v96, v99, v98, v97, v93, v95, v94, v92, v89, v91, v88, v90, v85, v87, v84, v82,
              v86,
              v83,
              v79,
              v81,
              v78,
              v76,
              v80,
              v75,
              v77,
              v74,
              v73,
              v72,
              v70,
              v61,
              v71,
              v60,
              v69,
              v68,
              v67,
              v59,
              v66,
              v58,
              v65,
              v57,
              v64,
              v56,
              v55,
              v54,
              v53,
              v45,
              v47,
              v49,
              v50,
              v51);

  return (NSString *)v63;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAeroMLPhotosSearchDataCorrelations *v5;
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
  NSString *searchSessionUUID;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  objc_class *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  unint64_t v131;
  char v132;
  unsigned int v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  char v137;
  char v138;
  unsigned int v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  char v143;
  uint64_t v144;
  uint64_t v145;
  BMAeroMLPhotosSearchDataCorrelations *v146;
  objc_super v148;

  v4 = a3;
  v148.receiver = self;
  v148.super_class = (Class)BMAeroMLPhotosSearchDataCorrelations;
  v5 = -[BMEventBase init](&v148, sel_init);
  if (!v5)
    goto LABEL_305;
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
          searchSessionUUID = v5->_searchSessionUUID;
          v5->_searchSessionUUID = (NSString *)v20;

          continue;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          while (2)
          {
            v25 = *v6;
            v26 = *(_QWORD *)&v4[v25];
            v27 = v26 + 1;
            if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
              *(_QWORD *)&v4[v25] = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                v17 = v23++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_193;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_193:
          if (v24 >= 4)
            LODWORD(v24) = 0;
          v5->_uiSurface = v24;
          continue;
        case 3u:
          v5->_hasMatchedPeopleRatio = 1;
          v29 = *v6;
          v30 = *(_QWORD *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v30);
            *(_QWORD *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 96;
          goto LABEL_301;
        case 4u:
          v5->_hasMatchedLocationRatio = 1;
          v32 = *v6;
          v33 = *(_QWORD *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v33);
            *(_QWORD *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 104;
          goto LABEL_301;
        case 5u:
          v5->_hasMatchedSceneRatio = 1;
          v34 = *v6;
          v35 = *(_QWORD *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v35);
            *(_QWORD *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 112;
          goto LABEL_301;
        case 6u:
          v5->_hasMatchedSceneConfidence = 1;
          v36 = *v6;
          v37 = *(_QWORD *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v37);
            *(_QWORD *)&v4[v36] = v37 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 120;
          goto LABEL_301;
        case 7u:
          v5->_hasMatchedSceneBoundingBox = 1;
          v38 = *v6;
          v39 = *(_QWORD *)&v4[v38];
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v39);
            *(_QWORD *)&v4[v38] = v39 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 128;
          goto LABEL_301;
        case 8u:
          v5->_hasMatchedOCRCharacterRatio = 1;
          v40 = *v6;
          v41 = *(_QWORD *)&v4[v40];
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v41);
            *(_QWORD *)&v4[v40] = v41 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 136;
          goto LABEL_301;
        case 9u:
          v5->_hasMatchedOCRImportance = 1;
          v42 = *v6;
          v43 = *(_QWORD *)&v4[v42];
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v43);
            *(_QWORD *)&v4[v42] = v43 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 144;
          goto LABEL_301;
        case 0xAu:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          v5->_hasMatchedFieldsCount = 1;
          while (2)
          {
            v47 = *v6;
            v48 = *(_QWORD *)&v4[v47];
            v49 = v48 + 1;
            if (v48 == -1 || v49 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v50 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v48);
              *(_QWORD *)&v4[v47] = v49;
              v46 |= (unint64_t)(v50 & 0x7F) << v44;
              if (v50 < 0)
              {
                v44 += 7;
                v17 = v45++ >= 9;
                if (v17)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_199;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v46) = 0;
LABEL_199:
          v144 = 76;
          goto LABEL_212;
        case 0xBu:
          v5->_hasL1Score = 1;
          v51 = *v6;
          v52 = *(_QWORD *)&v4[v51];
          if (v52 <= 0xFFFFFFFFFFFFFFF7 && v52 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v52);
            *(_QWORD *)&v4[v51] = v52 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 152;
          goto LABEL_301;
        case 0xCu:
          v5->_hasFreshness = 1;
          v53 = *v6;
          v54 = *(_QWORD *)&v4[v53];
          if (v54 <= 0xFFFFFFFFFFFFFFF7 && v54 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v54);
            *(_QWORD *)&v4[v53] = v54 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 160;
          goto LABEL_301;
        case 0xDu:
          v55 = 0;
          v56 = 0;
          v57 = 0;
          v5->_hasFavorited = 1;
          while (2)
          {
            v58 = *v6;
            v59 = *(_QWORD *)&v4[v58];
            v60 = v59 + 1;
            if (v59 == -1 || v60 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v61 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v59);
              *(_QWORD *)&v4[v58] = v60;
              v57 |= (unint64_t)(v61 & 0x7F) << v55;
              if (v61 < 0)
              {
                v55 += 7;
                v17 = v56++ >= 9;
                if (v17)
                {
                  v57 = 0;
                  goto LABEL_203;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v57 = 0;
LABEL_203:
          v5->_favorited = v57 != 0;
          continue;
        case 0xEu:
          v5->_hasAestheticScore = 1;
          v62 = *v6;
          v63 = *(_QWORD *)&v4[v62];
          if (v63 <= 0xFFFFFFFFFFFFFFF7 && v63 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v63);
            *(_QWORD *)&v4[v62] = v63 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 168;
          goto LABEL_301;
        case 0xFu:
          v5->_hasCurationScore = 1;
          v64 = *v6;
          v65 = *(_QWORD *)&v4[v64];
          if (v65 <= 0xFFFFFFFFFFFFFFF7 && v65 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v65);
            *(_QWORD *)&v4[v64] = v65 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 176;
          goto LABEL_301;
        case 0x10u:
          v5->_hasHasEverClickInLastWeek = 1;
          v66 = *v6;
          v67 = *(_QWORD *)&v4[v66];
          if (v67 <= 0xFFFFFFFFFFFFFFF7 && v67 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v67);
            *(_QWORD *)&v4[v66] = v67 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 184;
          goto LABEL_301;
        case 0x11u:
          v5->_hasHasEverClickInLastMonth = 1;
          v68 = *v6;
          v69 = *(_QWORD *)&v4[v68];
          if (v69 <= 0xFFFFFFFFFFFFFFF7 && v69 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v69);
            *(_QWORD *)&v4[v68] = v69 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 192;
          goto LABEL_301;
        case 0x12u:
          v5->_hasHasEverShareInLastWeek = 1;
          v70 = *v6;
          v71 = *(_QWORD *)&v4[v70];
          if (v71 <= 0xFFFFFFFFFFFFFFF7 && v71 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v71);
            *(_QWORD *)&v4[v70] = v71 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 200;
          goto LABEL_301;
        case 0x13u:
          v5->_hasHasEverShareInLastMonth = 1;
          v72 = *v6;
          v73 = *(_QWORD *)&v4[v72];
          if (v73 <= 0xFFFFFFFFFFFFFFF7 && v73 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v73);
            *(_QWORD *)&v4[v72] = v73 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 208;
          goto LABEL_301;
        case 0x14u:
          v5->_hasClickCountInLastWeekNormalizedAcrossItems = 1;
          v74 = *v6;
          v75 = *(_QWORD *)&v4[v74];
          if (v75 <= 0xFFFFFFFFFFFFFFF7 && v75 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v75);
            *(_QWORD *)&v4[v74] = v75 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 216;
          goto LABEL_301;
        case 0x15u:
          v5->_hasClickCountInLastMonthNormalizedAcrossItems = 1;
          v76 = *v6;
          v77 = *(_QWORD *)&v4[v76];
          if (v77 <= 0xFFFFFFFFFFFFFFF7 && v77 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v77);
            *(_QWORD *)&v4[v76] = v77 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 224;
          goto LABEL_301;
        case 0x16u:
          v5->_hasShareCountInLastWeekNormalizedAcrossItems = 1;
          v78 = *v6;
          v79 = *(_QWORD *)&v4[v78];
          if (v79 <= 0xFFFFFFFFFFFFFFF7 && v79 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v79);
            *(_QWORD *)&v4[v78] = v79 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 232;
          goto LABEL_301;
        case 0x17u:
          v5->_hasShareCountInLastMonthNormalizedAcrossItems = 1;
          v80 = *v6;
          v81 = *(_QWORD *)&v4[v80];
          if (v81 <= 0xFFFFFFFFFFFFFFF7 && v81 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v81);
            *(_QWORD *)&v4[v80] = v81 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 240;
          goto LABEL_301;
        case 0x18u:
          v5->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 1;
          v82 = *v6;
          v83 = *(_QWORD *)&v4[v82];
          if (v83 <= 0xFFFFFFFFFFFFFFF7 && v83 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v83);
            *(_QWORD *)&v4[v82] = v83 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 248;
          goto LABEL_301;
        case 0x19u:
          v5->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 1;
          v84 = *v6;
          v85 = *(_QWORD *)&v4[v84];
          if (v85 <= 0xFFFFFFFFFFFFFFF7 && v85 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v85);
            *(_QWORD *)&v4[v84] = v85 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 256;
          goto LABEL_301;
        case 0x1Au:
          v5->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems = 1;
          v86 = *v6;
          v87 = *(_QWORD *)&v4[v86];
          if (v87 <= 0xFFFFFFFFFFFFFFF7 && v87 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v87);
            *(_QWORD *)&v4[v86] = v87 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 264;
          goto LABEL_301;
        case 0x1Bu:
          v5->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems = 1;
          v88 = *v6;
          v89 = *(_QWORD *)&v4[v88];
          if (v89 <= 0xFFFFFFFFFFFFFFF7 && v89 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v89);
            *(_QWORD *)&v4[v88] = v89 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 272;
          goto LABEL_301;
        case 0x1Cu:
          v5->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 1;
          v90 = *v6;
          v91 = *(_QWORD *)&v4[v90];
          if (v91 <= 0xFFFFFFFFFFFFFFF7 && v91 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v91);
            *(_QWORD *)&v4[v90] = v91 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 280;
          goto LABEL_301;
        case 0x1Du:
          v5->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 1;
          v92 = *v6;
          v93 = *(_QWORD *)&v4[v92];
          if (v93 <= 0xFFFFFFFFFFFFFFF7 && v93 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v93);
            *(_QWORD *)&v4[v92] = v93 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 288;
          goto LABEL_301;
        case 0x1Eu:
          v5->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 1;
          v94 = *v6;
          v95 = *(_QWORD *)&v4[v94];
          if (v95 <= 0xFFFFFFFFFFFFFFF7 && v95 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v95);
            *(_QWORD *)&v4[v94] = v95 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 296;
          goto LABEL_301;
        case 0x1Fu:
          v5->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 1;
          v96 = *v6;
          v97 = *(_QWORD *)&v4[v96];
          if (v97 <= 0xFFFFFFFFFFFFFFF7 && v97 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v97);
            *(_QWORD *)&v4[v96] = v97 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 304;
          goto LABEL_301;
        case 0x20u:
          v5->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 1;
          v98 = *v6;
          v99 = *(_QWORD *)&v4[v98];
          if (v99 <= 0xFFFFFFFFFFFFFFF7 && v99 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v99);
            *(_QWORD *)&v4[v98] = v99 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 312;
          goto LABEL_301;
        case 0x21u:
          v5->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 1;
          v100 = *v6;
          v101 = *(_QWORD *)&v4[v100];
          if (v101 <= 0xFFFFFFFFFFFFFFF7 && v101 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v101);
            *(_QWORD *)&v4[v100] = v101 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 320;
          goto LABEL_301;
        case 0x22u:
          v5->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 1;
          v102 = *v6;
          v103 = *(_QWORD *)&v4[v102];
          if (v103 <= 0xFFFFFFFFFFFFFFF7 && v103 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v103);
            *(_QWORD *)&v4[v102] = v103 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 328;
          goto LABEL_301;
        case 0x23u:
          v5->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 1;
          v104 = *v6;
          v105 = *(_QWORD *)&v4[v104];
          if (v105 <= 0xFFFFFFFFFFFFFFF7 && v105 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v105);
            *(_QWORD *)&v4[v104] = v105 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 336;
          goto LABEL_301;
        case 0x24u:
          v5->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 1;
          v106 = *v6;
          v107 = *(_QWORD *)&v4[v106];
          if (v107 <= 0xFFFFFFFFFFFFFFF7 && v107 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v107);
            *(_QWORD *)&v4[v106] = v107 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 344;
          goto LABEL_301;
        case 0x25u:
          v5->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 1;
          v108 = *v6;
          v109 = *(_QWORD *)&v4[v108];
          if (v109 <= 0xFFFFFFFFFFFFFFF7 && v109 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v109);
            *(_QWORD *)&v4[v108] = v109 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 352;
          goto LABEL_301;
        case 0x26u:
          v5->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems = 1;
          v110 = *v6;
          v111 = *(_QWORD *)&v4[v110];
          if (v111 <= 0xFFFFFFFFFFFFFFF7 && v111 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v111);
            *(_QWORD *)&v4[v110] = v111 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 360;
          goto LABEL_301;
        case 0x27u:
          v5->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems = 1;
          v112 = *v6;
          v113 = *(_QWORD *)&v4[v112];
          if (v113 <= 0xFFFFFFFFFFFFFFF7 && v113 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v113);
            *(_QWORD *)&v4[v112] = v113 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 368;
          goto LABEL_301;
        case 0x28u:
          v5->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 1;
          v114 = *v6;
          v115 = *(_QWORD *)&v4[v114];
          if (v115 <= 0xFFFFFFFFFFFFFFF7 && v115 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v115);
            *(_QWORD *)&v4[v114] = v115 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 376;
          goto LABEL_301;
        case 0x29u:
          v5->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 1;
          v116 = *v6;
          v117 = *(_QWORD *)&v4[v116];
          if (v117 <= 0xFFFFFFFFFFFFFFF7 && v117 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v117);
            *(_QWORD *)&v4[v116] = v117 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 384;
          goto LABEL_301;
        case 0x2Au:
          v5->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 1;
          v118 = *v6;
          v119 = *(_QWORD *)&v4[v118];
          if (v119 <= 0xFFFFFFFFFFFFFFF7 && v119 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v119);
            *(_QWORD *)&v4[v118] = v119 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 392;
          goto LABEL_301;
        case 0x2Bu:
          v5->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 1;
          v120 = *v6;
          v121 = *(_QWORD *)&v4[v120];
          if (v121 <= 0xFFFFFFFFFFFFFFF7 && v121 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v121);
            *(_QWORD *)&v4[v120] = v121 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 400;
          goto LABEL_301;
        case 0x2Cu:
          v5->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 1;
          v122 = *v6;
          v123 = *(_QWORD *)&v4[v122];
          if (v123 <= 0xFFFFFFFFFFFFFFF7 && v123 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v123);
            *(_QWORD *)&v4[v122] = v123 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 408;
          goto LABEL_301;
        case 0x2Du:
          v5->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 1;
          v124 = *v6;
          v125 = *(_QWORD *)&v4[v124];
          if (v125 <= 0xFFFFFFFFFFFFFFF7 && v125 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v125);
            *(_QWORD *)&v4[v124] = v125 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 416;
          goto LABEL_301;
        case 0x2Eu:
          v5->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 1;
          v126 = *v6;
          v127 = *(_QWORD *)&v4[v126];
          if (v127 <= 0xFFFFFFFFFFFFFFF7 && v127 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v127);
            *(_QWORD *)&v4[v126] = v127 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 424;
          goto LABEL_301;
        case 0x2Fu:
          v5->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 1;
          v128 = *v6;
          v129 = *(_QWORD *)&v4[v128];
          if (v129 <= 0xFFFFFFFFFFFFFFF7 && v129 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v129);
            *(_QWORD *)&v4[v128] = v129 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 432;
          goto LABEL_301;
        case 0x30u:
          v5->_hasClipScore = 1;
          v130 = *v6;
          v131 = *(_QWORD *)&v4[v130];
          if (v131 <= 0xFFFFFFFFFFFFFFF7 && v131 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v131);
            *(_QWORD *)&v4[v130] = v131 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v145 = 440;
LABEL_301:
          *(Class *)((char *)&v5->super.super.isa + v145) = v31;
          continue;
        case 0x31u:
          v132 = 0;
          v133 = 0;
          v46 = 0;
          v5->_hasCorrelationMetricVersion = 1;
          while (2)
          {
            v134 = *v6;
            v135 = *(_QWORD *)&v4[v134];
            v136 = v135 + 1;
            if (v135 == -1 || v136 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v137 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v135);
              *(_QWORD *)&v4[v134] = v136;
              v46 |= (unint64_t)(v137 & 0x7F) << v132;
              if (v137 < 0)
              {
                v132 += 7;
                v17 = v133++ >= 9;
                if (v17)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_207;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v46) = 0;
LABEL_207:
          v144 = 80;
          goto LABEL_212;
        case 0x32u:
          v138 = 0;
          v139 = 0;
          v46 = 0;
          v5->_hasCorrelationMetricWindowInDays = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_304;
          continue;
      }
      while (1)
      {
        v140 = *v6;
        v141 = *(_QWORD *)&v4[v140];
        v142 = v141 + 1;
        if (v141 == -1 || v142 > *(_QWORD *)&v4[*v7])
          break;
        v143 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v141);
        *(_QWORD *)&v4[v140] = v142;
        v46 |= (unint64_t)(v143 & 0x7F) << v138;
        if ((v143 & 0x80) == 0)
          goto LABEL_209;
        v138 += 7;
        v17 = v139++ >= 9;
        if (v17)
        {
          LODWORD(v46) = 0;
          goto LABEL_211;
        }
      }
      v4[*v8] = 1;
LABEL_209:
      if (v4[*v8])
        LODWORD(v46) = 0;
LABEL_211:
      v144 = 84;
LABEL_212:
      *(_DWORD *)((char *)&v5->super.super.isa + v144) = v46;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_304:
    v146 = 0;
  else
LABEL_305:
    v146 = v5;

  return v146;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_searchSessionUUID)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasMatchedPeopleRatio)
    PBDataWriterWriteDoubleField();
  if (self->_hasMatchedLocationRatio)
    PBDataWriterWriteDoubleField();
  v4 = v5;
  if (self->_hasMatchedSceneRatio)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasMatchedSceneConfidence)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasMatchedSceneBoundingBox)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasMatchedOCRCharacterRatio)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasMatchedOCRImportance)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasMatchedFieldsCount)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasL1Score)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasFreshness)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasFavorited)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasAestheticScore)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasCurationScore)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasHasEverClickInLastWeek)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasHasEverClickInLastMonth)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasHasEverShareInLastWeek)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasHasEverShareInLastMonth)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasClickCountInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasClickCountInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasShareCountInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasShareCountInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasClipScore)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasCorrelationMetricVersion)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasCorrelationMetricWindowInDays)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAeroMLPhotosSearchDataCorrelations writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAeroMLPhotosSearchDataCorrelations)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  BMAeroMLPhotosSearchDataCorrelations *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  uint64_t v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  id v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  id v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  id v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  void *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  id v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  id v124;
  uint64_t v125;
  id v126;
  void *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  void *v137;
  uint64_t v138;
  id v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  uint64_t v144;
  id v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  id v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  id v153;
  uint64_t v154;
  void *v155;
  id v156;
  void *v157;
  id v158;
  uint64_t v159;
  void *v160;
  id v161;
  uint64_t v162;
  void *v163;
  id v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  id v174;
  void *v175;
  uint64_t v176;
  id v177;
  void *v178;
  uint64_t v179;
  uint64_t v180;
  id v181;
  void *v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  uint64_t v186;
  uint64_t v187;
  id v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  id v192;
  uint64_t v193;
  id v194;
  void *v195;
  uint64_t v196;
  uint64_t v197;
  id v198;
  uint64_t v199;
  void *v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  uint64_t v204;
  uint64_t v205;
  id v206;
  uint64_t v207;
  void *v208;
  uint64_t v209;
  void *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  id v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  uint64_t v219;
  void *v220;
  uint64_t v221;
  void *v222;
  uint64_t v223;
  void *v224;
  void *v225;
  uint64_t v226;
  void *v227;
  uint64_t v228;
  void *v229;
  uint64_t v230;
  void *v231;
  uint64_t v232;
  void *v233;
  uint64_t v234;
  void *v235;
  uint64_t v236;
  void *v237;
  uint64_t v238;
  void *v239;
  uint64_t v240;
  void *v241;
  void *v242;
  id v243;
  id v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  id v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  id v255;
  uint64_t v256;
  void *v257;
  uint64_t v258;
  uint64_t v259;
  id v260;
  id v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  id v265;
  uint64_t v266;
  void *v267;
  uint64_t v268;
  uint64_t v269;
  id v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  id v274;
  uint64_t v275;
  void *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  void *v288;
  uint64_t v289;
  uint64_t v290;
  id v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  id v295;
  id v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  id v300;
  uint64_t v301;
  id v302;
  uint64_t v303;
  uint64_t v304;
  id v305;
  uint64_t v306;
  id v307;
  id v308;
  uint64_t v309;
  id v310;
  id v311;
  uint64_t v312;
  id v313;
  id v314;
  uint64_t v315;
  id v316;
  id v317;
  uint64_t v318;
  id v319;
  uint64_t v320;
  void *v321;
  void *v322;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  void *v340;
  id v341;
  id v342;
  void *v343;
  id v344;
  void *v345;
  id v346;
  void *v347;
  id v348;
  void *v349;
  id v350;
  void *v351;
  id v352;
  void *v353;
  id v354;
  void *v355;
  id v356;
  id v357;
  void *v358;
  id v359;
  void *v360;
  id v361;
  void *v362;
  void *v363;
  void *v364;
  id v365;
  id v366;
  void *v367;
  id v368;
  id v369;
  id v370;
  void *v371;
  void *v372;
  id v373;
  id v374;
  void *v375;
  void *v376;
  void *v377;
  id v378;
  id v379;
  void *v380;
  id v381;
  id v382;
  void *v383;
  id v384;
  id v385;
  void *v386;
  id v387;
  id v388;
  void *v389;
  id v390;
  id v391;
  id v392;
  id v393;
  id v394;
  id v395;
  id v396;
  id v397;
  id v398;
  id v399;
  void *v400;
  id v401;
  void *v402;
  id v403;
  void *v404;
  uint64_t v405;
  id v406;
  void *v407;
  uint64_t v408;
  id v409;
  void *v410;
  id v411;
  void *v412;
  id v413;
  id v414;
  void *v415;
  void *v416;
  id v417;
  id v418;
  void *v419;
  id v420;
  id v421;
  id v422;
  void *v423;
  id v424;
  void *v425;
  void *v426;
  uint64_t v427;
  id v428;
  id v429;
  void *v430;
  id v431;
  id v432;
  void *v433;
  id v434;
  id v435;
  id v436;
  void *v437;
  id v438;
  id v439;
  void *v440;
  void *v441;
  id v442;
  id v443;
  id v444;
  id v445;
  void *v446;
  void *v447;
  id v448;
  id *v449;
  id v450;
  id v451;
  id v452;
  id v453;
  void *v454;
  id v455;
  void *v456;
  id v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  void *v472;
  id v473;
  id v474;
  void *v475;
  void *v476;
  id v477;
  id v478;
  id v479;
  id v480;
  id v481;
  id v482;
  id v483;
  id v484;
  id v485;
  id v486;
  id v487;
  id v488;
  id v489;
  id v490;
  id v491;
  id v492;
  id v493;
  id v494;
  id v495;
  id v496;
  id v497;
  id v498;
  id v499;
  id v500;
  void *v501;
  void *v502;
  id v503;
  id v504;
  id *v505;
  void *v506;
  id v507;
  void *v508;
  id v509;
  void *v511;
  void *v512;
  uint64_t v513;
  void *v514;
  uint64_t v515;
  id v516;
  uint64_t v517;
  id v518;
  uint64_t v519;
  id v520;
  uint64_t v521;
  id v522;
  uint64_t v523;
  id v524;
  uint64_t v525;
  id v526;
  uint64_t v527;
  id v528;
  uint64_t v529;
  id v530;
  uint64_t v531;
  id v532;
  uint64_t v533;
  id v534;
  uint64_t v535;
  void *v536;
  uint64_t v537;
  void *v538;
  uint64_t v539;
  id v540;
  uint64_t v541;
  id v542;
  uint64_t v543;
  id v544;
  uint64_t v545;
  id v546;
  uint64_t v547;
  void *v548;
  uint64_t v549;
  id v550;
  uint64_t v551;
  void *v552;
  uint64_t v553;
  id v554;
  uint64_t v555;
  id v556;
  uint64_t v557;
  id v558;
  uint64_t v559;
  id v560;
  uint64_t v561;
  id v562;
  uint64_t v563;
  void *v564;
  uint64_t v565;
  void *v566;
  uint64_t v567;
  void *v568;
  uint64_t v569;
  id v570;
  uint64_t v571;
  id v572;
  uint64_t v573;
  id v574;
  uint64_t v575;
  void *v576;
  uint64_t v577;
  id v578;
  uint64_t v579;
  id v580;
  uint64_t v581;
  id v582;
  uint64_t v583;
  id v584;
  uint64_t v585;
  id v586;
  uint64_t v587;
  id v588;
  uint64_t v589;
  void *v590;
  uint64_t v591;
  uint64_t v592;
  uint64_t v593;
  id v594;
  uint64_t v595;
  void *v596;
  uint64_t v597;
  id *v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  void *v602;
  uint64_t v603;
  id v604;
  uint64_t v605;
  id v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  void *v610;
  uint64_t v611;
  _QWORD v612[3];

  v612[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("searchSessionUUID"));
  v511 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v511 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v509 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v509 = v511;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uiSurface"));
    v512 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v512 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v507 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v507 = v512;
LABEL_15:

LABEL_16:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchedPeopleRatio"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v505 = a4;
        v11 = 0;
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v505 = a4;
        v11 = v10;
LABEL_19:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchedLocationRatio"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v502 = v12;
          v503 = 0;
          goto LABEL_22;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v502 = v12;
          v503 = v12;
LABEL_22:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchedSceneRatio"));
          v508 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v508 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v504 = 0;
            goto LABEL_25;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v504 = v508;
LABEL_25:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchedSceneConfidence"));
            v13 = objc_claimAutoreleasedReturnValue();
            v501 = (void *)v13;
            if (!v13 || (v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v15 = 0;
              goto LABEL_28;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v14;
LABEL_28:
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchedSceneBoundingBox"));
              v16 = objc_claimAutoreleasedReturnValue();
              v476 = (void *)v16;
              if (!v16 || (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v473 = 0;
                goto LABEL_31;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v473 = v17;
LABEL_31:
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchedOCRCharacterRatio"));
                v18 = objc_claimAutoreleasedReturnValue();
                v475 = (void *)v18;
                if (!v18 || (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v20 = 0;
                  goto LABEL_34;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v20 = v19;
LABEL_34:
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchedOCRImportance"));
                  v21 = objc_claimAutoreleasedReturnValue();
                  v458 = (void *)v21;
                  if (!v21 || (v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v23 = 0;
                    goto LABEL_37;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v23 = v22;
LABEL_37:
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchedFieldsCount"));
                    v24 = objc_claimAutoreleasedReturnValue();
                    v453 = v20;
                    v456 = (void *)v24;
                    if (!v24 || (v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v450 = 0;
                      goto LABEL_40;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v450 = v25;
LABEL_40:
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("L1Score"));
                      v26 = objc_claimAutoreleasedReturnValue();
                      v449 = v23;
                      v454 = (void *)v26;
                      if (!v26 || (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v451 = 0;
                        goto LABEL_43;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v451 = v27;
LABEL_43:
                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("freshness"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v11;
                        if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v30 = 0;
                          goto LABEL_46;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v30 = v28;
LABEL_46:
                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("favorited"));
                          v31 = objc_claimAutoreleasedReturnValue();
                          v444 = v15;
                          v441 = v28;
                          v445 = v30;
                          v447 = (void *)v31;
                          if (!v31 || (v32 = (void *)v31, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v33 = 0;
LABEL_49:
                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("aestheticScore"));
                            v34 = objc_claimAutoreleasedReturnValue();
                            v35 = (void *)v34;
                            v446 = v33;
                            if (v34 && (v36 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                if (!v505)
                                {
                                  v442 = 0;
                                  v8 = 0;
                                  v59 = v502;
                                  v40 = v473;
LABEL_456:
                                  v101 = v450;
                                  goto LABEL_457;
                                }
                                v443 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v482 = v5;
                                v131 = *MEMORY[0x1E0D025B8];
                                v585 = *MEMORY[0x1E0CB2D50];
                                v35 = v36;
                                v132 = objc_alloc(MEMORY[0x1E0CB3940]);
                                v333 = objc_opt_class();
                                v133 = v132;
                                v40 = v473;
                                v438 = (id)objc_msgSend(v133, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v333, CFSTR("aestheticScore"));
                                v586 = v438;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v586, &v585, 1);
                                v134 = objc_claimAutoreleasedReturnValue();
                                v135 = v131;
                                v5 = v482;
                                v440 = (void *)v134;
                                v136 = (id)objc_msgSend(v443, "initWithDomain:code:userInfo:", v135, 2);
                                v8 = 0;
                                v442 = 0;
                                *v505 = v136;
                                v59 = v502;
                                goto LABEL_455;
                              }
                              v442 = v36;
                            }
                            else
                            {
                              v442 = 0;
                            }
                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("curationScore"));
                            v37 = objc_claimAutoreleasedReturnValue();
                            v440 = (void *)v37;
                            if (!v37 || (v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v438 = 0;
                              goto LABEL_55;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v438 = v38;
LABEL_55:
                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hasEverClickInLastWeek"));
                              v39 = objc_claimAutoreleasedReturnValue();
                              v40 = v473;
                              v437 = (void *)v39;
                              if (!v39 || (v41 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v42 = 0;
                                goto LABEL_58;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v42 = v41;
LABEL_58:
                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hasEverClickInLastMonth"));
                                v43 = (void *)objc_claimAutoreleasedReturnValue();
                                if (!v43 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v430 = v43;
                                  v44 = v473;
                                  v435 = 0;
                                  goto LABEL_61;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v123 = v43;
                                  v44 = v473;
                                  v430 = v123;
                                  v435 = v123;
LABEL_61:
                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hasEverShareInLastWeek"));
                                  v45 = objc_claimAutoreleasedReturnValue();
                                  v433 = (void *)v45;
                                  if (!v45
                                    || (v46 = (void *)v45, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v431 = 0;
                                    goto LABEL_64;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v431 = v46;
LABEL_64:
                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hasEverShareInLastMonth"));
                                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                                    v474 = v44;
                                    if (!v47 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v425 = v47;
                                      v48 = v42;
                                      v428 = 0;
                                      goto LABEL_67;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v137 = v47;
                                      v48 = v42;
                                      v425 = v137;
                                      v428 = v137;
LABEL_67:
                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clickCountInLastWeekNormalizedAcrossItems"));
                                      v49 = objc_claimAutoreleasedReturnValue();
                                      v426 = (void *)v49;
                                      if (!v49
                                        || (v50 = (void *)v49, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v420 = 0;
                                        goto LABEL_70;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v420 = v50;
LABEL_70:
                                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clickCountInLastMonthNormalizedAcrossItems"));
                                        v51 = objc_claimAutoreleasedReturnValue();
                                        v423 = (void *)v51;
                                        if (!v51
                                          || (v52 = (void *)v51, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v421 = 0;
LABEL_73:
                                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shareCountInLastWeekNormalizedAcrossItems"));
                                          v53 = objc_claimAutoreleasedReturnValue();
                                          v419 = (void *)v53;
                                          if (!v53)
                                          {
                                            v417 = 0;
                                            v415 = v35;
                                            goto LABEL_161;
                                          }
                                          v54 = (void *)v53;
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v415 = v35;
                                            v417 = 0;
LABEL_161:
                                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shareCountInLastMonthNormalizedAcrossItems"));
                                            v154 = objc_claimAutoreleasedReturnValue();
                                            v42 = v48;
                                            v416 = (void *)v154;
                                            if (v154
                                              && (v155 = (void *)v154,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                            {
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                              {
                                                if (!v505)
                                                {
                                                  v156 = 0;
                                                  v8 = 0;
                                                  v59 = v502;
                                                  v35 = v415;
LABEL_446:
                                                  v178 = v420;
                                                  v43 = v430;
                                                  goto LABEL_447;
                                                }
                                                v413 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v469 = v10;
                                                v199 = *MEMORY[0x1E0D025B8];
                                                v567 = *MEMORY[0x1E0CB2D50];
                                                v35 = v415;
                                                v200 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountInLastMonthNormalizedAcrossItems"));
                                                v568 = v200;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v568, &v567, 1);
                                                v157 = (void *)objc_claimAutoreleasedReturnValue();
                                                v201 = v199;
                                                v10 = v469;
                                                v8 = 0;
                                                v156 = 0;
                                                *v505 = (id)objc_msgSend(v413, "initWithDomain:code:userInfo:", v201, 2, v157);
                                                goto LABEL_307;
                                              }
                                              v156 = v155;
                                            }
                                            else
                                            {
                                              v156 = 0;
                                            }
                                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"));
                                            v157 = (void *)objc_claimAutoreleasedReturnValue();
                                            v35 = v415;
                                            if (!v157 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              v407 = v157;
                                              v158 = v156;
                                              v406 = 0;
                                              goto LABEL_167;
                                            }
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v182 = v157;
                                              v158 = v156;
                                              v407 = v182;
                                              v406 = v182;
LABEL_167:
                                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"));
                                              v159 = objc_claimAutoreleasedReturnValue();
                                              v409 = v42;
                                              v412 = (void *)v159;
                                              if (!v159
                                                || (v160 = (void *)v159,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                v161 = 0;
                                                goto LABEL_170;
                                              }
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v161 = v160;
LABEL_170:
                                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clickCountGivenLocationInLastWeekNormalizedAcrossItems"));
                                                v162 = objc_claimAutoreleasedReturnValue();
                                                v410 = v161;
                                                v404 = (void *)v162;
                                                if (!v162
                                                  || (v163 = (void *)v162,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  v164 = 0;
LABEL_173:
                                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clickCountGivenLocationInLastMonthNormalizedAcrossItems"));
                                                  v165 = objc_claimAutoreleasedReturnValue();
                                                  v402 = v164;
                                                  v389 = (void *)v165;
                                                  if (v165
                                                    && (v166 = (void *)v165,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) == 0))
                                                  {
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                                    {
                                                      if (!v505)
                                                      {
                                                        v388 = 0;
                                                        v8 = 0;
                                                        v59 = v502;
                                                        v200 = v406;
                                                        v156 = v158;
                                                        v42 = v409;
LABEL_441:
                                                        v157 = v407;
                                                        goto LABEL_442;
                                                      }
                                                      v392 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                      v486 = v5;
                                                      v215 = *MEMORY[0x1E0D025B8];
                                                      v559 = *MEMORY[0x1E0CB2D50];
                                                      v156 = v158;
                                                      v42 = v409;
                                                      v387 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clickCountGivenLocationInLastMonthNormalizedAcrossItems"));
                                                      v560 = v387;
                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v560, &v559, 1);
                                                      v167 = (void *)objc_claimAutoreleasedReturnValue();
                                                      v216 = v215;
                                                      v5 = v486;
                                                      v8 = 0;
                                                      v388 = 0;
                                                      *v505 = (id)objc_msgSend(v392, "initWithDomain:code:userInfo:", v216, 2, v167);
                                                      v59 = v502;
                                                      v200 = v406;
                                                      goto LABEL_440;
                                                    }
                                                    v388 = v166;
                                                  }
                                                  else
                                                  {
                                                    v388 = 0;
                                                  }
                                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"));
                                                  v156 = v158;
                                                  v167 = (void *)objc_claimAutoreleasedReturnValue();
                                                  if (!v167 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    v391 = v156;
                                                    v168 = v167;
                                                    v387 = 0;
                                                    goto LABEL_179;
                                                  }
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    v391 = v156;
                                                    v168 = v167;
                                                    v387 = v167;
LABEL_179:
                                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"));
                                                    v169 = objc_claimAutoreleasedReturnValue();
                                                    v386 = (void *)v169;
                                                    if (!v169
                                                      || (v170 = (void *)v169,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      v384 = 0;
LABEL_182:
                                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"));
                                                      v171 = objc_claimAutoreleasedReturnValue();
                                                      v383 = (void *)v171;
                                                      if (!v171)
                                                      {
                                                        v381 = 0;
                                                        v42 = v409;
                                                        goto LABEL_227;
                                                      }
                                                      v172 = (void *)v171;
                                                      objc_opt_class();
                                                      v42 = v409;
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v381 = 0;
                                                        goto LABEL_227;
                                                      }
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v381 = v172;
LABEL_227:
                                                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"));
                                                        v207 = objc_claimAutoreleasedReturnValue();
                                                        v376 = v168;
                                                        v380 = (void *)v207;
                                                        if (!v207
                                                          || (v208 = (void *)v207,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          v378 = 0;
LABEL_230:
                                                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"));
                                                          v209 = objc_claimAutoreleasedReturnValue();
                                                          v377 = (void *)v209;
                                                          if (!v209)
                                                          {
                                                            v373 = 0;
                                                            v156 = v391;
                                                            goto LABEL_244;
                                                          }
                                                          v210 = (void *)v209;
                                                          objc_opt_class();
                                                          v156 = v391;
                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                          {
                                                            v373 = 0;
LABEL_244:
                                                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"));
                                                            v217 = objc_claimAutoreleasedReturnValue();
                                                            v375 = (void *)v217;
                                                            if (v217
                                                              && (v218 = (void *)v217,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                                            {
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                              {
                                                                if (!v505)
                                                                {
                                                                  v374 = 0;
                                                                  v8 = 0;
                                                                  v59 = v502;
                                                                  v200 = v406;
LABEL_434:
                                                                  v257 = v373;
                                                                  goto LABEL_435;
                                                                }
                                                                v394 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                v490 = v5;
                                                                v266 = *MEMORY[0x1E0D025B8];
                                                                v547 = *MEMORY[0x1E0CB2D50];
                                                                v42 = v409;
                                                                v267 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"));
                                                                v548 = v267;
                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v548, &v547, 1);
                                                                v268 = objc_claimAutoreleasedReturnValue();
                                                                v269 = v266;
                                                                v5 = v490;
                                                                v372 = (void *)v268;
                                                                v8 = 0;
                                                                v374 = 0;
                                                                *v505 = (id)objc_msgSend(v394, "initWithDomain:code:userInfo:", v269, 2);
                                                                goto LABEL_359;
                                                              }
                                                              v374 = v218;
                                                            }
                                                            else
                                                            {
                                                              v374 = 0;
                                                            }
                                                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"));
                                                            v219 = objc_claimAutoreleasedReturnValue();
                                                            v372 = (void *)v219;
                                                            if (!v219
                                                              || (v220 = (void *)v219,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              v369 = 0;
LABEL_250:
                                                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"));
                                                              v221 = objc_claimAutoreleasedReturnValue();
                                                              v371 = (void *)v221;
                                                              if (v221
                                                                && (v222 = (void *)v221,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                              {
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                {
                                                                  if (!v505)
                                                                  {
                                                                    v370 = 0;
                                                                    v8 = 0;
                                                                    v59 = v502;
                                                                    v200 = v406;
LABEL_431:
                                                                    v267 = v369;
                                                                    goto LABEL_432;
                                                                  }
                                                                  v395 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                  v492 = v5;
                                                                  v275 = *MEMORY[0x1E0D025B8];
                                                                  v543 = *MEMORY[0x1E0CB2D50];
                                                                  v42 = v409;
                                                                  v368 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"));
                                                                  v544 = v368;
                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v544, &v543, 1);
                                                                  v276 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  v277 = v275;
                                                                  v5 = v492;
                                                                  v8 = 0;
                                                                  v370 = 0;
                                                                  *v505 = (id)objc_msgSend(v395, "initWithDomain:code:userInfo:", v277, 2, v276);
                                                                  v59 = v502;
                                                                  v200 = v406;
LABEL_430:

                                                                  goto LABEL_431;
                                                                }
                                                                v370 = v222;
                                                              }
                                                              else
                                                              {
                                                                v370 = 0;
                                                              }
                                                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"));
                                                              v223 = objc_claimAutoreleasedReturnValue();
                                                              v367 = (void *)v223;
                                                              if (v223
                                                                && (v224 = (void *)v223,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                              {
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                {
                                                                  if (!v505)
                                                                  {
                                                                    v368 = 0;
                                                                    v8 = 0;
                                                                    v59 = v502;
                                                                    v200 = v406;
LABEL_429:
                                                                    v276 = v367;
                                                                    goto LABEL_430;
                                                                  }
                                                                  v396 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                  v493 = v5;
                                                                  v278 = *MEMORY[0x1E0D025B8];
                                                                  v541 = *MEMORY[0x1E0CB2D50];
                                                                  v42 = v409;
                                                                  v366 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"));
                                                                  v542 = v366;
                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v542, &v541, 1);
                                                                  v225 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  v279 = v278;
                                                                  v5 = v493;
                                                                  v8 = 0;
                                                                  v368 = 0;
                                                                  *v505 = (id)objc_msgSend(v396, "initWithDomain:code:userInfo:", v279, 2, v225);
                                                                  goto LABEL_375;
                                                                }
                                                                v368 = v224;
                                                              }
                                                              else
                                                              {
                                                                v368 = 0;
                                                              }
                                                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"));
                                                              v225 = (void *)objc_claimAutoreleasedReturnValue();
                                                              if (!v225
                                                                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                v363 = v225;
                                                                v366 = 0;
LABEL_259:
                                                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shareCountGivenLocationInLastWeekNormalizedAcrossItems"));
                                                                v226 = objc_claimAutoreleasedReturnValue();
                                                                v364 = (void *)v226;
                                                                if (v226
                                                                  && (v227 = (void *)v226,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                  {
                                                                    if (!v505)
                                                                    {
                                                                      v365 = 0;
                                                                      v8 = 0;
                                                                      v59 = v502;
                                                                      v200 = v406;
LABEL_426:
                                                                      v225 = v363;
                                                                      goto LABEL_427;
                                                                    }
                                                                    v398 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                    v495 = v5;
                                                                    v283 = *MEMORY[0x1E0D025B8];
                                                                    v537 = *MEMORY[0x1E0CB2D50];
                                                                    v42 = v409;
                                                                    v284 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenLocationInLastWeekNormalizedAcrossItems"));
                                                                    v538 = v284;
                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v538, &v537, 1);
                                                                    v285 = objc_claimAutoreleasedReturnValue();
                                                                    v286 = v283;
                                                                    v5 = v495;
                                                                    v362 = (void *)v285;
                                                                    v8 = 0;
                                                                    v365 = 0;
                                                                    *v505 = (id)objc_msgSend(v398, "initWithDomain:code:userInfo:", v286, 2);
                                                                    goto LABEL_386;
                                                                  }
                                                                  v365 = v227;
                                                                }
                                                                else
                                                                {
                                                                  v365 = 0;
                                                                }
                                                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shareCountGivenLocationInLastMonthNormalizedAcrossItems"));
                                                                v228 = objc_claimAutoreleasedReturnValue();
                                                                v362 = (void *)v228;
                                                                if (!v228
                                                                  || (v229 = (void *)v228,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  v361 = 0;
                                                                  goto LABEL_265;
                                                                }
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                {
                                                                  v361 = v229;
LABEL_265:
                                                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"));
                                                                  v230 = objc_claimAutoreleasedReturnValue();
                                                                  v360 = (void *)v230;
                                                                  if (!v230
                                                                    || (v231 = (void *)v230,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    v357 = 0;
                                                                    goto LABEL_268;
                                                                  }
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                  {
                                                                    v357 = v231;
LABEL_268:
                                                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"));
                                                                    v232 = objc_claimAutoreleasedReturnValue();
                                                                    v358 = (void *)v232;
                                                                    if (!v232
                                                                      || (v233 = (void *)v232,
                                                                          objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      v359 = 0;
                                                                      goto LABEL_271;
                                                                    }
                                                                    objc_opt_class();
                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                    {
                                                                      v359 = v233;
LABEL_271:
                                                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"));
                                                                      v234 = objc_claimAutoreleasedReturnValue();
                                                                      v355 = (void *)v234;
                                                                      if (!v234
                                                                        || (v235 = (void *)v234,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        v356 = 0;
                                                                        goto LABEL_274;
                                                                      }
                                                                      objc_opt_class();
                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                      {
                                                                        v356 = v235;
LABEL_274:
                                                                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"));
                                                                        v236 = objc_claimAutoreleasedReturnValue();
                                                                        v353 = (void *)v236;
                                                                        if (!v236
                                                                          || (v237 = (void *)v236,
                                                                              objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                        {
                                                                          v354 = 0;
                                                                          goto LABEL_277;
                                                                        }
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                        {
                                                                          v354 = v237;
LABEL_277:
                                                                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"));
                                                                          v238 = objc_claimAutoreleasedReturnValue();
                                                                          v351 = (void *)v238;
                                                                          if (!v238
                                                                            || (v239 = (void *)v238,
                                                                                objc_opt_class(),
                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                          {
                                                                            v352 = 0;
                                                                            goto LABEL_280;
                                                                          }
                                                                          objc_opt_class();
                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                          {
                                                                            v352 = v239;
LABEL_280:
                                                                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"));
                                                                            v349 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            if (!v349
                                                                              || (objc_opt_class(),
                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                            {
                                                                              v350 = 0;
                                                                              goto LABEL_283;
                                                                            }
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                            {
                                                                              v350 = v349;
LABEL_283:
                                                                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"));
                                                                              v347 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              if (!v347
                                                                                || (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                              {
                                                                                v348 = 0;
                                                                                goto LABEL_286;
                                                                              }
                                                                              objc_opt_class();
                                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                              {
                                                                                v348 = v347;
LABEL_286:
                                                                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"));
                                                                                v345 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                if (!v345
                                                                                  || (objc_opt_class(),
                                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                                {
                                                                                  v346 = 0;
                                                                                  goto LABEL_289;
                                                                                }
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                {
                                                                                  v346 = v345;
LABEL_289:
                                                                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clipScore"));
                                                                                  v343 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  if (!v343
                                                                                    || (objc_opt_class(),
                                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                                  {
                                                                                    v344 = 0;
                                                                                    goto LABEL_292;
                                                                                  }
                                                                                  v401 = v156;
                                                                                  objc_opt_class();
                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                  {
                                                                                    v344 = v343;
                                                                                    v35 = v415;
LABEL_292:
                                                                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("correlationMetricVersion"));
                                                                                    v240 = objc_claimAutoreleasedReturnValue();
                                                                                    v340 = (void *)v240;
                                                                                    if (!v240
                                                                                      || (v241 = (void *)v240,
                                                                                          objc_opt_class(),
                                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                                    {
                                                                                      v342 = 0;
                                                                                      goto LABEL_295;
                                                                                    }
                                                                                    v401 = v156;
                                                                                    objc_opt_class();
                                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                    {
                                                                                      v342 = v241;
                                                                                      v35 = v415;
LABEL_295:
                                                                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("correlationMetricWindowInDays"));
                                                                                      v242 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      if (!v242
                                                                                        || (objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                                      {
                                                                                        v506 = v242;
                                                                                        v341 = 0;
                                                                                        v59 = v502;
                                                                                        v243 = v503;
                                                                                        v244 = v474;
LABEL_298:
                                                                                        v200 = v406;
                                                                                        v503 = v243;
                                                                                        v8 = objc_retain(-[BMAeroMLPhotosSearchDataCorrelations initWithSearchSessionUUID:uiSurface:matchedPeopleRatio:matchedLocationRatio:matchedSceneRatio:matchedSceneConfidence:matchedSceneBoundingBox:matchedOCRCharacterRatio:matchedOCRImportance:matchedFieldsCount:L1Score:freshness:favorited:aestheticScore:curationScore:hasEverClickInLastWeek:hasEverClickInLastMonth:hasEverShareInLastWeek:hasEverShareInLastMonth:clickCountInLastWeekNormalizedAcrossItems:clickCountInLastMonthNormalizedAcrossItems:shareCountInLastWeekNormalizedAcrossItems:shareCountInLastMonthNormalizedAcrossItems:clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:clickCountGivenLocationInLastWeekNormalizedAcrossItems:clickCountGivenLocationInLastMonthNormalizedAcrossItems:clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:shareCountGivenLocationInLastWeekNormalizedAcrossItems:shareCountGivenLocationInLastMonthNormalizedAcrossItems:shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:clipScore:correlationMetricVersion:correlationMetricWindowInDays:](self, "initWithSearchSessionUUID:uiSurface:matchedPeopleRatio:matchedLocationRatio:matchedSceneRatio:matchedSceneConfidence:matchedSceneBoundingBox:matchedOCRCharacterRatio:matchedOCRImportance:matchedFieldsCount:L1Score:freshness:favorited:aestheticScore:curationScore:hasEverClickInLastWeek:hasEverClickInLastMonth:hasEverShareInLastWeek:hasEverShareInLastMonth:clickCountInLastWeekNormalizedAcro"
                                                                                                 "ssItems:clickCountInLas"
                                                                                                 "tMonthNormalizedAcrossI"
                                                                                                 "tems:shareCountInLastWe"
                                                                                                 "ekNormalizedAcrossItems"
                                                                                                 ":shareCountInLastMonthN"
                                                                                                 "ormalizedAcrossItems:cl"
                                                                                                 "ickCountGivenTimeOfDayI"
                                                                                                 "nLastWeekNormalizedAcro"
                                                                                                 "ssItems:clickCountGiven"
                                                                                                 "TimeOfDayInLastMonthNor"
                                                                                                 "malizedAcrossItems:clic"
                                                                                                 "kCountGivenLocationInLa"
                                                                                                 "stWeekNormalizedAcrossI"
                                                                                                 "tems:clickCountGivenLoc"
                                                                                                 "ationInLastMonthNormali"
                                                                                                 "zedAcrossItems:clickCou"
                                                                                                 "ntGivenDayCategoryInLas"
                                                                                                 "tWeekNormalizedAcrossIt"
                                                                                                 "ems:clickCountGivenDayC"
                                                                                                 "ategoryInLastMonthNorma"
                                                                                                 "lizedAcrossItems:clickC"
                                                                                                 "ountGivenRecencyCategor"
                                                                                                 "yInLastWeekNormalizedAc"
                                                                                                 "rossItems:clickCountGiv"
                                                                                                 "enRecencyCategoryInLast"
                                                                                                 "MonthNormalizedAcrossIt"
                                                                                                 "ems:clickCountGivenScen"
                                                                                                 "eCategoryInLastWeekNorm"
                                                                                                 "alizedAcrossItems:click"
                                                                                                 "CountGivenSceneCategory"
                                                                                                 "InLastMonthNormalizedAc"
                                                                                                 "rossItems:clickCountGiv"
                                                                                                 "enFaceCountCategoryInLa"
                                                                                                 "stWeekNormalizedAcrossI"
                                                                                                 "tems:clickCountGivenFac"
                                                                                                 "eCountCategoryInLastMon"
                                                                                                 "thNormalizedAcrossItems"
                                                                                                 ":shareCountGivenTimeOfD"
                                                                                                 "ayInLastWeekNormalizedA"
                                                                                                 "crossItems:shareCountGi"
                                                                                                 "venTimeOfDayInLastMonth"
                                                                                                 "NormalizedAcrossItems:s"
                                                                                                 "hareCountGivenLocationI"
                                                                                                 "nLastWeekNormalizedAcro"
                                                                                                 "ssItems:shareCountGiven"
                                                                                                 "LocationInLastMonthNorm"
                                                                                                 "alizedAcrossItems:share"
                                                                                                 "CountGivenDayCategoryIn"
                                                                                                 "LastWeekNormalizedAcros"
                                                                                                 "sItems:shareCountGivenD"
                                                                                                 "ayCategoryInLastMonthNo"
                                                                                                 "rmalizedAcrossItems:sha"
                                                                                                 "reCountGivenRecencyCate"
                                                                                                 "goryInLastWeekNormalize"
                                                                                                 "dAcrossItems:shareCount"
                                                                                                 "GivenRecencyCategoryInL"
                                                                                                 "astMonthNormalizedAcros"
                                                                                                 "sItems:shareCountGivenS"
                                                                                                 "ceneCategoryInLastWeekN"
                                                                                                 "ormalizedAcrossItems:sh"
                                                                                                 "areCountGivenSceneCateg"
                                                                                                 "oryInLastMonthNormalize"
                                                                                                 "dAcrossItems:shareCount"
                                                                                                 "GivenFaceCountCategoryI"
                                                                                                 "nLastWeekNormalizedAcro"
                                                                                                 "ssItems:shareCountGiven"
                                                                                                 "FaceCountCategoryInLast"
                                                                                                 "MonthNormalizedAcrossIt"
                                                                                                 "ems:clipScore:correlati"
                                                                                                 "onMetricVersion:correla"
                                                                                                 "tionMetricWindowInDays:",
                                                                                                 v509,
                                                                                                 objc_msgSend(v507, "intValue"), v29, v243, v504, v444, v244, v453, v449, v450, v451, v445, v446, v442, v438, v42, v435, v431, v428,
                                                                                                 v420,
                                                                                                 v421,
                                                                                                 v417,
                                                                                                 v156,
                                                                                                 v406,
                                                                                                 v410,
                                                                                                 v402,
                                                                                                 v388,
                                                                                                 v387,
                                                                                                 v384,
                                                                                                 v381,
                                                                                                 v378,
                                                                                                 v373,
                                                                                                 v374,
                                                                                                 v369,
                                                                                                 v370,
                                                                                                 v368,
                                                                                                 v366,
                                                                                                 v365,
                                                                                                 v361,
                                                                                                 v357,
                                                                                                 v359,
                                                                                                 v356,
                                                                                                 v354,
                                                                                                 v352,
                                                                                                 v350,
                                                                                                 v348,
                                                                                                 v346,
                                                                                                 v344,
                                                                                                 v342,
                                                                                                 v341));
                                                                                        self = v8;
                                                                                        v242 = v506;
LABEL_414:

LABEL_415:
                                                                                        v288 = v357;

LABEL_416:
LABEL_417:

LABEL_418:
LABEL_419:

                                                                                        goto LABEL_420;
                                                                                      }
                                                                                      v401 = v156;
                                                                                      objc_opt_class();
                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                      {
                                                                                        v506 = v242;
                                                                                        v341 = v242;
                                                                                        v59 = v502;
                                                                                        v243 = v503;
                                                                                        v244 = v474;
                                                                                        goto LABEL_298;
                                                                                      }
                                                                                      v500 = v5;
                                                                                      v472 = v10;
                                                                                      if (v505)
                                                                                      {
                                                                                        v319 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                        v320 = *MEMORY[0x1E0D025B8];
                                                                                        v513 = *MEMORY[0x1E0CB2D50];
                                                                                        v321 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("correlationMetricWindowInDays"));
                                                                                        v514 = v321;
                                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v514, &v513, 1);
                                                                                        v322 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        *v505 = (id)objc_msgSend(v319, "initWithDomain:code:userInfo:", v320, 2, v322);

                                                                                      }
                                                                                      v341 = 0;
                                                                                      v8 = 0;
                                                                                      v10 = v472;
                                                                                      v5 = v500;
                                                                                      v59 = v502;
                                                                                      v42 = v409;
LABEL_413:
                                                                                      v156 = v401;
                                                                                      v200 = v406;
                                                                                      goto LABEL_414;
                                                                                    }
                                                                                    if (v505)
                                                                                    {
                                                                                      v317 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                      v318 = *MEMORY[0x1E0D025B8];
                                                                                      v515 = *MEMORY[0x1E0CB2D50];
                                                                                      v341 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("correlationMetricVersion"));
                                                                                      v516 = v341;
                                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v516, &v515, 1);
                                                                                      v242 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      v8 = 0;
                                                                                      v342 = 0;
                                                                                      *v505 = (id)objc_msgSend(v317, "initWithDomain:code:userInfo:", v318, 2, v242);
                                                                                      v59 = v502;
                                                                                      v35 = v415;
                                                                                      goto LABEL_413;
                                                                                    }
                                                                                    v342 = 0;
                                                                                    v8 = 0;
LABEL_480:
                                                                                    v59 = v502;
                                                                                    v35 = v415;
                                                                                    v156 = v401;
                                                                                    v200 = v406;
                                                                                    goto LABEL_415;
                                                                                  }
                                                                                  if (v505)
                                                                                  {
                                                                                    v314 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                    v315 = *MEMORY[0x1E0D025B8];
                                                                                    v517 = *MEMORY[0x1E0CB2D50];
                                                                                    v342 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clipScore"));
                                                                                    v518 = v342;
                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v518, &v517, 1);
                                                                                    v340 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    v316 = (id)objc_msgSend(v314, "initWithDomain:code:userInfo:", v315, 2);
                                                                                    v8 = 0;
                                                                                    v344 = 0;
                                                                                    *v505 = v316;
                                                                                    goto LABEL_480;
                                                                                  }
                                                                                  v344 = 0;
                                                                                  v8 = 0;
                                                                                  v59 = v502;
                                                                                  v35 = v415;
LABEL_478:
                                                                                  v200 = v406;
                                                                                  v288 = v357;
                                                                                  goto LABEL_416;
                                                                                }
                                                                                v400 = v29;
                                                                                if (v505)
                                                                                {
                                                                                  v311 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                  v312 = *MEMORY[0x1E0D025B8];
                                                                                  v519 = *MEMORY[0x1E0CB2D50];
                                                                                  v344 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"));
                                                                                  v520 = v344;
                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v520, &v519, 1);
                                                                                  v343 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  v313 = (id)objc_msgSend(v311, "initWithDomain:code:userInfo:", v312, 2);
                                                                                  v8 = 0;
                                                                                  v346 = 0;
                                                                                  *v505 = v313;
                                                                                  v29 = v400;
                                                                                  v59 = v502;
                                                                                  goto LABEL_478;
                                                                                }
                                                                                v346 = 0;
                                                                                v8 = 0;
LABEL_476:
                                                                                v29 = v400;
                                                                                v59 = v502;
                                                                                v200 = v406;
                                                                                v288 = v357;
                                                                                goto LABEL_417;
                                                                              }
                                                                              v400 = v29;
                                                                              if (v505)
                                                                              {
                                                                                v308 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                v309 = *MEMORY[0x1E0D025B8];
                                                                                v521 = *MEMORY[0x1E0CB2D50];
                                                                                v346 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"));
                                                                                v522 = v346;
                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v522, &v521, 1);
                                                                                v345 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                v310 = (id)objc_msgSend(v308, "initWithDomain:code:userInfo:", v309, 2);
                                                                                v8 = 0;
                                                                                v348 = 0;
                                                                                *v505 = v310;
                                                                                goto LABEL_476;
                                                                              }
                                                                              v348 = 0;
                                                                              v8 = 0;
LABEL_474:
                                                                              v29 = v400;
                                                                              v59 = v502;
                                                                              v200 = v406;
                                                                              v288 = v357;
                                                                              goto LABEL_418;
                                                                            }
                                                                            v400 = v29;
                                                                            if (v505)
                                                                            {
                                                                              v305 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                              v306 = *MEMORY[0x1E0D025B8];
                                                                              v523 = *MEMORY[0x1E0CB2D50];
                                                                              v348 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"));
                                                                              v524 = v348;
                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v524, &v523, 1);
                                                                              v347 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              v307 = (id)objc_msgSend(v305, "initWithDomain:code:userInfo:", v306, 2);
                                                                              v8 = 0;
                                                                              v350 = 0;
                                                                              *v505 = v307;
                                                                              goto LABEL_474;
                                                                            }
                                                                            v350 = 0;
                                                                            v8 = 0;
LABEL_472:
                                                                            v29 = v400;
                                                                            v59 = v502;
                                                                            v200 = v406;
                                                                            v288 = v357;
                                                                            goto LABEL_419;
                                                                          }
                                                                          v400 = v29;
                                                                          if (v505)
                                                                          {
                                                                            v499 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                            v304 = *MEMORY[0x1E0D025B8];
                                                                            v525 = *MEMORY[0x1E0CB2D50];
                                                                            v350 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"));
                                                                            v526 = v350;
                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v526, &v525, 1);
                                                                            v349 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            v8 = 0;
                                                                            v352 = 0;
                                                                            *v505 = (id)objc_msgSend(v499, "initWithDomain:code:userInfo:", v304, 2);
                                                                            goto LABEL_472;
                                                                          }
                                                                          v352 = 0;
                                                                          v8 = 0;
LABEL_409:
                                                                          v29 = v400;
                                                                          v59 = v502;
                                                                          v200 = v406;
                                                                          v288 = v357;
LABEL_420:

                                                                          goto LABEL_421;
                                                                        }
                                                                        v400 = v29;
                                                                        if (v505)
                                                                        {
                                                                          v302 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                          v303 = *MEMORY[0x1E0D025B8];
                                                                          v527 = *MEMORY[0x1E0CB2D50];
                                                                          v352 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"));
                                                                          v528 = v352;
                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v528, &v527, 1);
                                                                          v351 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          v8 = 0;
                                                                          v354 = 0;
                                                                          *v505 = (id)objc_msgSend(v302, "initWithDomain:code:userInfo:", v303, 2);
                                                                          goto LABEL_409;
                                                                        }
                                                                        v354 = 0;
                                                                        v8 = 0;
LABEL_405:
                                                                        v29 = v400;
                                                                        v59 = v502;
                                                                        v200 = v406;
                                                                        v288 = v357;
LABEL_421:

                                                                        goto LABEL_422;
                                                                      }
                                                                      v400 = v29;
                                                                      if (v505)
                                                                      {
                                                                        v300 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                        v301 = *MEMORY[0x1E0D025B8];
                                                                        v529 = *MEMORY[0x1E0CB2D50];
                                                                        v354 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"));
                                                                        v530 = v354;
                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v530, &v529, 1);
                                                                        v353 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        v8 = 0;
                                                                        v356 = 0;
                                                                        *v505 = (id)objc_msgSend(v300, "initWithDomain:code:userInfo:", v301, 2);
                                                                        goto LABEL_405;
                                                                      }
                                                                      v356 = 0;
                                                                      v8 = 0;
LABEL_401:
                                                                      v59 = v502;
                                                                      v200 = v406;
                                                                      v288 = v357;
LABEL_422:

                                                                      goto LABEL_423;
                                                                    }
                                                                    if (v505)
                                                                    {
                                                                      v296 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                      v498 = v5;
                                                                      v297 = *MEMORY[0x1E0D025B8];
                                                                      v531 = *MEMORY[0x1E0CB2D50];
                                                                      v42 = v409;
                                                                      v356 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"));
                                                                      v532 = v356;
                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v532, &v531, 1);
                                                                      v298 = objc_claimAutoreleasedReturnValue();
                                                                      v299 = v297;
                                                                      v5 = v498;
                                                                      v355 = (void *)v298;
                                                                      v8 = 0;
                                                                      v359 = 0;
                                                                      *v505 = (id)objc_msgSend(v296, "initWithDomain:code:userInfo:", v299, 2);
                                                                      goto LABEL_401;
                                                                    }
                                                                    v359 = 0;
                                                                    v8 = 0;
                                                                    v59 = v502;
                                                                    v200 = v406;
                                                                    v288 = v357;
LABEL_423:

                                                                    goto LABEL_424;
                                                                  }
                                                                  if (v505)
                                                                  {
                                                                    v291 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                    v497 = v5;
                                                                    v292 = *MEMORY[0x1E0D025B8];
                                                                    v533 = *MEMORY[0x1E0CB2D50];
                                                                    v42 = v409;
                                                                    v359 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"));
                                                                    v534 = v359;
                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v534, &v533, 1);
                                                                    v293 = objc_claimAutoreleasedReturnValue();
                                                                    v294 = v292;
                                                                    v5 = v497;
                                                                    v358 = (void *)v293;
                                                                    v295 = (id)objc_msgSend(v291, "initWithDomain:code:userInfo:", v294, 2);
                                                                    v8 = 0;
                                                                    v288 = 0;
                                                                    *v505 = v295;
                                                                    v59 = v502;
                                                                    v200 = v406;
                                                                    goto LABEL_423;
                                                                  }
                                                                  v288 = 0;
                                                                  v8 = 0;
LABEL_392:
                                                                  v59 = v502;
                                                                  v200 = v406;
LABEL_424:

                                                                  v284 = v361;
                                                                  goto LABEL_425;
                                                                }
                                                                if (v505)
                                                                {
                                                                  v399 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                  v496 = v5;
                                                                  v287 = *MEMORY[0x1E0D025B8];
                                                                  v535 = *MEMORY[0x1E0CB2D50];
                                                                  v42 = v409;
                                                                  v288 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenLocationInLastMonthNormalizedAcrossItems"));
                                                                  v536 = v288;
                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v536, &v535, 1);
                                                                  v289 = objc_claimAutoreleasedReturnValue();
                                                                  v290 = v287;
                                                                  v5 = v496;
                                                                  v360 = (void *)v289;
                                                                  v8 = 0;
                                                                  v361 = 0;
                                                                  *v505 = (id)objc_msgSend(v399, "initWithDomain:code:userInfo:", v290, 2);
                                                                  goto LABEL_392;
                                                                }
                                                                v284 = 0;
                                                                v8 = 0;
LABEL_386:
                                                                v59 = v502;
                                                                v200 = v406;
LABEL_425:

                                                                goto LABEL_426;
                                                              }
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                              {
                                                                v363 = v225;
                                                                v366 = v225;
                                                                goto LABEL_259;
                                                              }
                                                              if (v505)
                                                              {
                                                                v397 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                v494 = v5;
                                                                v280 = *MEMORY[0x1E0D025B8];
                                                                v539 = *MEMORY[0x1E0CB2D50];
                                                                v42 = v409;
                                                                v365 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"));
                                                                v540 = v365;
                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v540, &v539, 1);
                                                                v281 = objc_claimAutoreleasedReturnValue();
                                                                v282 = v280;
                                                                v5 = v494;
                                                                v364 = (void *)v281;
                                                                v8 = 0;
                                                                v366 = 0;
                                                                *v505 = (id)objc_msgSend(v397, "initWithDomain:code:userInfo:", v282, 2);
                                                                v59 = v502;
                                                                v200 = v406;
LABEL_427:

                                                                goto LABEL_428;
                                                              }
                                                              v366 = 0;
                                                              v8 = 0;
LABEL_375:
                                                              v59 = v502;
                                                              v200 = v406;
LABEL_428:

                                                              goto LABEL_429;
                                                            }
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                            {
                                                              v369 = v220;
                                                              goto LABEL_250;
                                                            }
                                                            if (v505)
                                                            {
                                                              v270 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                              v491 = v5;
                                                              v271 = *MEMORY[0x1E0D025B8];
                                                              v545 = *MEMORY[0x1E0CB2D50];
                                                              v42 = v409;
                                                              v370 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"));
                                                              v546 = v370;
                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v546, &v545, 1);
                                                              v272 = objc_claimAutoreleasedReturnValue();
                                                              v273 = v271;
                                                              v5 = v491;
                                                              v371 = (void *)v272;
                                                              v274 = (id)objc_msgSend(v270, "initWithDomain:code:userInfo:", v273, 2);
                                                              v8 = 0;
                                                              v267 = 0;
                                                              *v505 = v274;
                                                              v59 = v502;
                                                              v200 = v406;
LABEL_432:

                                                              goto LABEL_433;
                                                            }
                                                            v267 = 0;
                                                            v8 = 0;
LABEL_359:
                                                            v59 = v502;
                                                            v200 = v406;
LABEL_433:

                                                            goto LABEL_434;
                                                          }
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                          {
                                                            v373 = v210;
                                                            goto LABEL_244;
                                                          }
                                                          if (v505)
                                                          {
                                                            v261 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v489 = v5;
                                                            v262 = *MEMORY[0x1E0D025B8];
                                                            v549 = *MEMORY[0x1E0CB2D50];
                                                            v42 = v409;
                                                            v374 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"));
                                                            v550 = v374;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v550, &v549, 1);
                                                            v263 = objc_claimAutoreleasedReturnValue();
                                                            v264 = v262;
                                                            v5 = v489;
                                                            v375 = (void *)v263;
                                                            v265 = (id)objc_msgSend(v261, "initWithDomain:code:userInfo:", v264, 2);
                                                            v8 = 0;
                                                            v257 = 0;
                                                            *v505 = v265;
                                                            v59 = v502;
                                                            v200 = v406;
LABEL_435:

                                                            goto LABEL_436;
                                                          }
                                                          v257 = 0;
                                                          v8 = 0;
LABEL_348:
                                                          v59 = v502;
                                                          v200 = v406;
LABEL_436:

                                                          v167 = v376;
                                                          goto LABEL_437;
                                                        }
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                        {
                                                          v378 = v208;
                                                          goto LABEL_230;
                                                        }
                                                        if (v505)
                                                        {
                                                          v379 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                          v488 = v5;
                                                          v256 = *MEMORY[0x1E0D025B8];
                                                          v551 = *MEMORY[0x1E0CB2D50];
                                                          v156 = v391;
                                                          v42 = v409;
                                                          v257 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"));
                                                          v552 = v257;
                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v552, &v551, 1);
                                                          v258 = objc_claimAutoreleasedReturnValue();
                                                          v259 = v256;
                                                          v5 = v488;
                                                          v377 = (void *)v258;
                                                          v260 = (id)objc_msgSend(v379, "initWithDomain:code:userInfo:", v259, 2);
                                                          v8 = 0;
                                                          v378 = 0;
                                                          *v505 = v260;
                                                          goto LABEL_348;
                                                        }
                                                        v378 = 0;
                                                        v8 = 0;
                                                        v59 = v502;
                                                        v200 = v406;
                                                        v167 = v168;
                                                        v156 = v391;
LABEL_437:

                                                        goto LABEL_438;
                                                      }
                                                      v167 = v168;
                                                      if (v505)
                                                      {
                                                        v382 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                        v471 = v10;
                                                        v252 = *MEMORY[0x1E0D025B8];
                                                        v553 = *MEMORY[0x1E0CB2D50];
                                                        v156 = v391;
                                                        v42 = v409;
                                                        v378 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"));
                                                        v554 = v378;
                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v554, &v553, 1);
                                                        v253 = objc_claimAutoreleasedReturnValue();
                                                        v254 = v252;
                                                        v10 = v471;
                                                        v380 = (void *)v253;
                                                        v255 = (id)objc_msgSend(v382, "initWithDomain:code:userInfo:", v254, 2);
                                                        v8 = 0;
                                                        v381 = 0;
                                                        *v505 = v255;
                                                        v59 = v502;
                                                        v200 = v406;
                                                        goto LABEL_437;
                                                      }
                                                      v381 = 0;
                                                      v8 = 0;
                                                      v59 = v502;
                                                      v200 = v406;
                                                      v156 = v391;
LABEL_438:

                                                      goto LABEL_439;
                                                    }
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v384 = v170;
                                                      goto LABEL_182;
                                                    }
                                                    if (v505)
                                                    {
                                                      v385 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                      v470 = v10;
                                                      v248 = *MEMORY[0x1E0D025B8];
                                                      v555 = *MEMORY[0x1E0CB2D50];
                                                      v167 = v168;
                                                      v156 = v391;
                                                      v42 = v409;
                                                      v381 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"));
                                                      v556 = v381;
                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v556, &v555, 1);
                                                      v249 = objc_claimAutoreleasedReturnValue();
                                                      v250 = v248;
                                                      v10 = v470;
                                                      v383 = (void *)v249;
                                                      v251 = (id)objc_msgSend(v385, "initWithDomain:code:userInfo:", v250, 2);
                                                      v8 = 0;
                                                      v384 = 0;
                                                      *v505 = v251;
                                                      v59 = v502;
                                                      v200 = v406;
                                                      goto LABEL_438;
                                                    }
                                                    v384 = 0;
                                                    v8 = 0;
                                                    v59 = v502;
                                                    v200 = v406;
                                                    v42 = v409;
                                                    v167 = v168;
                                                    v156 = v391;
LABEL_439:

                                                    goto LABEL_440;
                                                  }
                                                  if (v505)
                                                  {
                                                    v393 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                    v487 = v5;
                                                    v245 = *MEMORY[0x1E0D025B8];
                                                    v557 = *MEMORY[0x1E0CB2D50];
                                                    v42 = v409;
                                                    v384 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"));
                                                    v558 = v384;
                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v558, &v557, 1);
                                                    v246 = objc_claimAutoreleasedReturnValue();
                                                    v247 = v245;
                                                    v5 = v487;
                                                    v386 = (void *)v246;
                                                    v8 = 0;
                                                    v387 = 0;
                                                    *v505 = (id)objc_msgSend(v393, "initWithDomain:code:userInfo:", v247, 2);
                                                    v59 = v502;
                                                    v200 = v406;
                                                    goto LABEL_439;
                                                  }
                                                  v387 = 0;
                                                  v8 = 0;
                                                  v59 = v502;
                                                  v200 = v406;
                                                  v42 = v409;
LABEL_440:

                                                  goto LABEL_441;
                                                }
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  v164 = v163;
                                                  goto LABEL_173;
                                                }
                                                if (v505)
                                                {
                                                  v403 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v485 = v5;
                                                  v211 = *MEMORY[0x1E0D025B8];
                                                  v561 = *MEMORY[0x1E0CB2D50];
                                                  v156 = v158;
                                                  v157 = v407;
                                                  v42 = v409;
                                                  v388 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clickCountGivenLocationInLastWeekNormalizedAcrossItems"));
                                                  v562 = v388;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v562, &v561, 1);
                                                  v212 = objc_claimAutoreleasedReturnValue();
                                                  v213 = v211;
                                                  v5 = v485;
                                                  v389 = (void *)v212;
                                                  v214 = (id)objc_msgSend(v403, "initWithDomain:code:userInfo:", v213, 2);
                                                  v8 = 0;
                                                  v402 = 0;
                                                  *v505 = v214;
                                                  v59 = v502;
                                                  v200 = v406;
LABEL_442:

                                                  goto LABEL_443;
                                                }
                                                v402 = 0;
                                                v8 = 0;
                                                v59 = v502;
                                                v200 = v406;
                                                v156 = v158;
                                                v42 = v409;
                                                v157 = v407;
LABEL_443:

                                                goto LABEL_444;
                                              }
                                              if (v505)
                                              {
                                                v411 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v405 = *MEMORY[0x1E0D025B8];
                                                v563 = *MEMORY[0x1E0CB2D50];
                                                v156 = v158;
                                                v157 = v407;
                                                v402 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"));
                                                v564 = v402;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v564, &v563, 1);
                                                v204 = objc_claimAutoreleasedReturnValue();
                                                v205 = v405;
                                                v404 = (void *)v204;
                                                v206 = (id)objc_msgSend(v411, "initWithDomain:code:userInfo:", v205, 2);
                                                v8 = 0;
                                                v410 = 0;
                                                *v505 = v206;
                                                v59 = v502;
                                                v200 = v406;
                                                goto LABEL_443;
                                              }
                                              v410 = 0;
                                              v8 = 0;
                                              v59 = v502;
                                              v200 = v406;
                                              v156 = v158;
                                              v157 = v407;
LABEL_444:

                                              goto LABEL_445;
                                            }
                                            if (v505)
                                            {
                                              v414 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v408 = *MEMORY[0x1E0D025B8];
                                              v565 = *MEMORY[0x1E0CB2D50];
                                              v410 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"));
                                              v566 = v410;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v566, &v565, 1);
                                              v202 = objc_claimAutoreleasedReturnValue();
                                              v203 = v414;
                                              v412 = (void *)v202;
                                              v8 = 0;
                                              v200 = 0;
                                              *v505 = (id)objc_msgSend(v203, "initWithDomain:code:userInfo:", v408, 2);
                                              v59 = v502;
                                              goto LABEL_444;
                                            }
                                            v200 = 0;
                                            v8 = 0;
LABEL_307:
                                            v59 = v502;
LABEL_445:

                                            goto LABEL_446;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v415 = v35;
                                            v417 = v54;
                                            goto LABEL_161;
                                          }
                                          if (v505)
                                          {
                                            v418 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v468 = v10;
                                            v193 = *MEMORY[0x1E0D025B8];
                                            v569 = *MEMORY[0x1E0CB2D50];
                                            v194 = objc_alloc(MEMORY[0x1E0CB3940]);
                                            v339 = objc_opt_class();
                                            v195 = v194;
                                            v178 = v420;
                                            v42 = v48;
                                            v43 = v430;
                                            v156 = (id)objc_msgSend(v195, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v339, CFSTR("shareCountInLastWeekNormalizedAcrossItems"));
                                            v570 = v156;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v570, &v569, 1);
                                            v196 = objc_claimAutoreleasedReturnValue();
                                            v197 = v193;
                                            v10 = v468;
                                            v416 = (void *)v196;
                                            v198 = (id)objc_msgSend(v418, "initWithDomain:code:userInfo:", v197, 2);
                                            v8 = 0;
                                            v417 = 0;
                                            *v505 = v198;
                                            v59 = v502;
LABEL_447:

                                            v47 = v425;
                                            goto LABEL_448;
                                          }
                                          v417 = 0;
                                          v8 = 0;
                                          v59 = v502;
                                          v42 = v48;
                                          v47 = v425;
                                          v178 = v420;
                                          v43 = v430;
LABEL_448:

                                          goto LABEL_449;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v421 = v52;
                                          goto LABEL_73;
                                        }
                                        if (v505)
                                        {
                                          v422 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v467 = v10;
                                          v187 = *MEMORY[0x1E0D025B8];
                                          v571 = *MEMORY[0x1E0CB2D50];
                                          v188 = objc_alloc(MEMORY[0x1E0CB3940]);
                                          v338 = objc_opt_class();
                                          v189 = v188;
                                          v178 = v420;
                                          v42 = v48;
                                          v43 = v430;
                                          v47 = v425;
                                          v417 = (id)objc_msgSend(v189, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v338, CFSTR("clickCountInLastMonthNormalizedAcrossItems"));
                                          v572 = v417;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v572, &v571, 1);
                                          v190 = objc_claimAutoreleasedReturnValue();
                                          v191 = v187;
                                          v10 = v467;
                                          v419 = (void *)v190;
                                          v192 = (id)objc_msgSend(v422, "initWithDomain:code:userInfo:", v191, 2);
                                          v8 = 0;
                                          v421 = 0;
                                          *v505 = v192;
                                          v59 = v502;
                                          goto LABEL_448;
                                        }
                                        v421 = 0;
                                        v8 = 0;
                                        v59 = v502;
                                        v42 = v48;
                                        v47 = v425;
                                        v178 = v420;
                                        v43 = v430;
LABEL_449:

                                        goto LABEL_450;
                                      }
                                      if (v505)
                                      {
                                        v424 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v466 = v10;
                                        v183 = *MEMORY[0x1E0D025B8];
                                        v573 = *MEMORY[0x1E0CB2D50];
                                        v42 = v48;
                                        v43 = v430;
                                        v47 = v425;
                                        v421 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clickCountInLastWeekNormalizedAcrossItems"));
                                        v574 = v421;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v574, &v573, 1);
                                        v184 = objc_claimAutoreleasedReturnValue();
                                        v185 = v424;
                                        v186 = v183;
                                        v10 = v466;
                                        v423 = (void *)v184;
                                        v8 = 0;
                                        v178 = 0;
                                        *v505 = (id)objc_msgSend(v185, "initWithDomain:code:userInfo:", v186, 2);
                                        v59 = v502;
                                        goto LABEL_449;
                                      }
                                      v178 = 0;
                                      v8 = 0;
                                      v59 = v502;
                                      v42 = v48;
                                      v47 = v425;
                                      v43 = v430;
LABEL_450:

                                      v40 = v474;
                                      goto LABEL_451;
                                    }
                                    if (v505)
                                    {
                                      v429 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v427 = *MEMORY[0x1E0D025B8];
                                      v575 = *MEMORY[0x1E0CB2D50];
                                      v43 = v430;
                                      v178 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("hasEverShareInLastMonth"));
                                      v576 = v178;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v576, &v575, 1);
                                      v179 = objc_claimAutoreleasedReturnValue();
                                      v180 = v427;
                                      v426 = (void *)v179;
                                      v181 = (id)objc_msgSend(v429, "initWithDomain:code:userInfo:", v180, 2);
                                      v8 = 0;
                                      v428 = 0;
                                      *v505 = v181;
                                      v59 = v502;
                                      goto LABEL_450;
                                    }
                                    v40 = v44;
                                    v428 = 0;
                                    v8 = 0;
                                    v59 = v502;
                                    v43 = v430;
LABEL_451:

                                    goto LABEL_452;
                                  }
                                  if (v505)
                                  {
                                    v432 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v465 = v10;
                                    v173 = *MEMORY[0x1E0D025B8];
                                    v577 = *MEMORY[0x1E0CB2D50];
                                    v174 = objc_alloc(MEMORY[0x1E0CB3940]);
                                    v337 = objc_opt_class();
                                    v175 = v174;
                                    v40 = v44;
                                    v43 = v430;
                                    v428 = (id)objc_msgSend(v175, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v337, CFSTR("hasEverShareInLastWeek"));
                                    v578 = v428;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v578, &v577, 1);
                                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                                    v176 = v173;
                                    v10 = v465;
                                    v177 = (id)objc_msgSend(v432, "initWithDomain:code:userInfo:", v176, 2, v47);
                                    v8 = 0;
                                    v431 = 0;
                                    *v505 = v177;
                                    v59 = v502;
                                    goto LABEL_451;
                                  }
                                  v431 = 0;
                                  v8 = 0;
                                  v59 = v502;
                                  v40 = v44;
                                  v43 = v430;
LABEL_452:

                                  goto LABEL_453;
                                }
                                if (v505)
                                {
                                  v436 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v464 = v10;
                                  v148 = *MEMORY[0x1E0D025B8];
                                  v579 = *MEMORY[0x1E0CB2D50];
                                  v149 = objc_alloc(MEMORY[0x1E0CB3940]);
                                  v336 = objc_opt_class();
                                  v150 = v149;
                                  v40 = v473;
                                  v431 = (id)objc_msgSend(v150, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v336, CFSTR("hasEverClickInLastMonth"));
                                  v580 = v431;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v580, &v579, 1);
                                  v151 = objc_claimAutoreleasedReturnValue();
                                  v152 = v148;
                                  v10 = v464;
                                  v433 = (void *)v151;
                                  v153 = (id)objc_msgSend(v436, "initWithDomain:code:userInfo:", v152, 2);
                                  v8 = 0;
                                  v435 = 0;
                                  *v505 = v153;
                                  v59 = v502;
                                  goto LABEL_452;
                                }
                                v435 = 0;
                                v8 = 0;
                                v59 = v502;
LABEL_453:

                                goto LABEL_454;
                              }
                              if (v505)
                              {
                                v434 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v484 = v5;
                                v144 = *MEMORY[0x1E0D025B8];
                                v581 = *MEMORY[0x1E0CB2D50];
                                v145 = objc_alloc(MEMORY[0x1E0CB3940]);
                                v335 = objc_opt_class();
                                v146 = v145;
                                v40 = v473;
                                v435 = (id)objc_msgSend(v146, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v335, CFSTR("hasEverClickInLastWeek"));
                                v582 = v435;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v582, &v581, 1);
                                v43 = (void *)objc_claimAutoreleasedReturnValue();
                                v147 = v144;
                                v5 = v484;
                                v8 = 0;
                                v42 = 0;
                                *v505 = (id)objc_msgSend(v434, "initWithDomain:code:userInfo:", v147, 2, v43);
                                v59 = v502;
                                goto LABEL_453;
                              }
                              v42 = 0;
                              v8 = 0;
LABEL_203:
                              v59 = v502;
LABEL_454:

                              v28 = v441;
                              goto LABEL_455;
                            }
                            if (v505)
                            {
                              v439 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v483 = v5;
                              v138 = *MEMORY[0x1E0D025B8];
                              v583 = *MEMORY[0x1E0CB2D50];
                              v139 = objc_alloc(MEMORY[0x1E0CB3940]);
                              v334 = objc_opt_class();
                              v140 = v139;
                              v40 = v473;
                              v42 = (id)objc_msgSend(v140, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v334, CFSTR("curationScore"));
                              v584 = v42;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v584, &v583, 1);
                              v141 = objc_claimAutoreleasedReturnValue();
                              v142 = v138;
                              v5 = v483;
                              v437 = (void *)v141;
                              v143 = (id)objc_msgSend(v439, "initWithDomain:code:userInfo:", v142, 2);
                              v8 = 0;
                              v438 = 0;
                              *v505 = v143;
                              goto LABEL_203;
                            }
                            v438 = 0;
                            v8 = 0;
                            v59 = v502;
                            v40 = v473;
LABEL_455:

                            goto LABEL_456;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v33 = v32;
                            goto LABEL_49;
                          }
                          if (v505)
                          {
                            v124 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v481 = v5;
                            v125 = *MEMORY[0x1E0D025B8];
                            v587 = *MEMORY[0x1E0CB2D50];
                            v126 = objc_alloc(MEMORY[0x1E0CB3940]);
                            v332 = objc_opt_class();
                            v127 = v126;
                            v101 = v450;
                            v40 = v473;
                            v442 = (id)objc_msgSend(v127, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v332, CFSTR("favorited"));
                            v588 = v442;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v588, &v587, 1);
                            v128 = objc_claimAutoreleasedReturnValue();
                            v129 = v124;
                            v130 = v125;
                            v5 = v481;
                            v35 = (void *)v128;
                            v8 = 0;
                            v446 = 0;
                            *v505 = (id)objc_msgSend(v129, "initWithDomain:code:userInfo:", v130, 2);
                            v59 = v502;
LABEL_457:

                            v15 = v444;
                            v30 = v445;
                            goto LABEL_458;
                          }
                          v446 = 0;
                          v8 = 0;
                          v59 = v502;
                          v40 = v473;
                          v101 = v450;
LABEL_458:

                          goto LABEL_459;
                        }
                        v30 = v505;
                        if (v505)
                        {
                          v448 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v480 = v5;
                          v117 = *MEMORY[0x1E0D025B8];
                          v589 = *MEMORY[0x1E0CB2D50];
                          v390 = v11;
                          v118 = objc_alloc(MEMORY[0x1E0CB3940]);
                          v331 = objc_opt_class();
                          v119 = v118;
                          v101 = v450;
                          v40 = v473;
                          v29 = v390;
                          v446 = (void *)objc_msgSend(v119, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v331, CFSTR("freshness"));
                          v590 = v446;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v590, &v589, 1);
                          v120 = objc_claimAutoreleasedReturnValue();
                          v121 = v448;
                          v122 = v117;
                          v5 = v480;
                          v447 = (void *)v120;
                          v8 = 0;
                          *v505 = (id)objc_msgSend(v121, "initWithDomain:code:userInfo:", v122, 2);
                          v30 = 0;
                          v59 = v502;
                          goto LABEL_458;
                        }
                        v8 = 0;
                        v59 = v502;
                        v40 = v473;
                        v101 = v450;
LABEL_459:

                        v23 = v449;
                        goto LABEL_460;
                      }
                      if (v505)
                      {
                        v452 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v479 = v5;
                        v111 = *MEMORY[0x1E0D025B8];
                        v591 = *MEMORY[0x1E0CB2D50];
                        v112 = objc_alloc(MEMORY[0x1E0CB3940]);
                        v330 = objc_opt_class();
                        v113 = v112;
                        v40 = v473;
                        v29 = v11;
                        v101 = v450;
                        v114 = objc_msgSend(v113, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v330, CFSTR("L1Score"));
                        v592 = v114;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v592, &v591, 1);
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v115 = v111;
                        v5 = v479;
                        v116 = (id)objc_msgSend(v452, "initWithDomain:code:userInfo:", v115, 2, v28);
                        v8 = 0;
                        v451 = 0;
                        *v505 = v116;
                        v30 = (id)v114;
                        v59 = v502;
                        goto LABEL_459;
                      }
                      v451 = 0;
                      v8 = 0;
                      v59 = v502;
                      v29 = v11;
                      v40 = v473;
                      v101 = v450;
LABEL_460:

                      v20 = v453;
                      goto LABEL_461;
                    }
                    if (v505)
                    {
                      v455 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v478 = v5;
                      v105 = *MEMORY[0x1E0D025B8];
                      v593 = *MEMORY[0x1E0CB2D50];
                      v106 = objc_alloc(MEMORY[0x1E0CB3940]);
                      v329 = objc_opt_class();
                      v107 = v106;
                      v40 = v473;
                      v451 = (id)objc_msgSend(v107, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v329, CFSTR("matchedFieldsCount"));
                      v594 = v451;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v594, &v593, 1);
                      v108 = objc_claimAutoreleasedReturnValue();
                      v109 = v455;
                      v110 = v105;
                      v5 = v478;
                      v454 = (void *)v108;
                      v8 = 0;
                      *v505 = (id)objc_msgSend(v109, "initWithDomain:code:userInfo:", v110, 2);
                      v29 = v11;
                      v101 = 0;
                      v59 = v502;
                      goto LABEL_460;
                    }
                    v8 = 0;
                    v59 = v502;
                    v29 = v11;
                    v101 = 0;
                    v40 = v473;
LABEL_461:

                    v78 = v40;
                    v62 = v503;
                    goto LABEL_462;
                  }
                  v23 = v505;
                  if (v505)
                  {
                    v457 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v463 = v10;
                    v98 = *MEMORY[0x1E0D025B8];
                    v595 = *MEMORY[0x1E0CB2D50];
                    v99 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v328 = objc_opt_class();
                    v100 = v99;
                    v40 = v473;
                    v29 = v11;
                    v101 = (void *)objc_msgSend(v100, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v328, CFSTR("matchedOCRImportance"));
                    v596 = v101;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v596, &v595, 1);
                    v102 = objc_claimAutoreleasedReturnValue();
                    v103 = v457;
                    v104 = v98;
                    v10 = v463;
                    v456 = (void *)v102;
                    v8 = 0;
                    *v505 = (id)objc_msgSend(v103, "initWithDomain:code:userInfo:", v104, 2);
                    v23 = 0;
                    v59 = v502;
                    goto LABEL_461;
                  }
                  v8 = 0;
                  v59 = v502;
                  v29 = v11;
                  v62 = v503;
                  v78 = v473;
LABEL_462:

                  goto LABEL_463;
                }
                v20 = v505;
                if (v505)
                {
                  v92 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v462 = v10;
                  v93 = *MEMORY[0x1E0D025B8];
                  v597 = *MEMORY[0x1E0CB2D50];
                  v94 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v327 = objc_opt_class();
                  v95 = v94;
                  v62 = v503;
                  v29 = v11;
                  v78 = v473;
                  v23 = (id *)objc_msgSend(v95, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v327, CFSTR("matchedOCRCharacterRatio"));
                  v598 = v23;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v598, &v597, 1);
                  v96 = objc_claimAutoreleasedReturnValue();
                  v97 = v93;
                  v10 = v462;
                  v458 = (void *)v96;
                  v8 = 0;
                  *v505 = (id)objc_msgSend(v92, "initWithDomain:code:userInfo:", v97, 2);
                  v20 = 0;
                  v59 = v502;
                  goto LABEL_462;
                }
                v8 = 0;
                v59 = v502;
                v29 = v11;
                v62 = v503;
                v78 = v473;
LABEL_463:

                goto LABEL_464;
              }
              if (v505)
              {
                v85 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v461 = v10;
                v86 = *MEMORY[0x1E0D025B8];
                v599 = *MEMORY[0x1E0CB2D50];
                v87 = objc_alloc(MEMORY[0x1E0CB3940]);
                v326 = objc_opt_class();
                v88 = v87;
                v62 = v503;
                v29 = v11;
                v89 = objc_msgSend(v88, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v326, CFSTR("matchedSceneBoundingBox"));
                v600 = v89;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v600, &v599, 1);
                v90 = objc_claimAutoreleasedReturnValue();
                v91 = v86;
                v10 = v461;
                v475 = (void *)v90;
                v8 = 0;
                *v505 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v91, 2);
                v20 = (id)v89;
                v78 = 0;
                v59 = v502;
                goto LABEL_463;
              }
              v8 = 0;
              v59 = v502;
              v29 = v11;
              v78 = 0;
              v62 = v503;
LABEL_464:

              goto LABEL_465;
            }
            if (v505)
            {
              v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v460 = v10;
              v75 = *MEMORY[0x1E0D025B8];
              v601 = *MEMORY[0x1E0CB2D50];
              v76 = objc_alloc(MEMORY[0x1E0CB3940]);
              v325 = objc_opt_class();
              v77 = v76;
              v62 = v503;
              v29 = v11;
              v78 = (void *)objc_msgSend(v77, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v325, CFSTR("matchedSceneConfidence"));
              v602 = v78;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v602, &v601, 1);
              v79 = objc_claimAutoreleasedReturnValue();
              v80 = v75;
              v10 = v460;
              v476 = (void *)v79;
              v8 = 0;
              v15 = 0;
              *v505 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v80, 2);
              v59 = v502;
              goto LABEL_464;
            }
            v15 = 0;
            v8 = 0;
            v59 = v502;
            v29 = v11;
            v62 = v503;
LABEL_465:

            goto LABEL_466;
          }
          v29 = v11;
          if (v505)
          {
            v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v459 = v10;
            v69 = *MEMORY[0x1E0D025B8];
            v603 = *MEMORY[0x1E0CB2D50];
            v70 = objc_alloc(MEMORY[0x1E0CB3940]);
            v324 = objc_opt_class();
            v71 = v70;
            v62 = v503;
            v15 = (id)objc_msgSend(v71, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v324, CFSTR("matchedSceneRatio"));
            v604 = v15;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v604, &v603, 1);
            v72 = objc_claimAutoreleasedReturnValue();
            v73 = v69;
            v10 = v459;
            v501 = (void *)v72;
            v8 = 0;
            v504 = 0;
            *v505 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v73, 2);
            v59 = v502;
            goto LABEL_465;
          }
          v504 = 0;
          v8 = 0;
          v59 = v502;
          v62 = v503;
LABEL_466:

          goto LABEL_467;
        }
        v59 = v12;
        if (v505)
        {
          v477 = v5;
          v63 = v10;
          v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v65 = *MEMORY[0x1E0D025B8];
          v605 = *MEMORY[0x1E0CB2D50];
          v29 = v11;
          v504 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("matchedLocationRatio"));
          v606 = v504;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v606, &v605, 1);
          v66 = objc_claimAutoreleasedReturnValue();
          v67 = v64;
          v10 = v63;
          v5 = v477;
          v508 = (void *)v66;
          v8 = 0;
          v62 = 0;
          *v505 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v65, 2, v66);
          goto LABEL_466;
        }
        v62 = 0;
        v8 = 0;
        v29 = v11;
LABEL_467:

        goto LABEL_468;
      }
      if (a4)
      {
        v55 = v10;
        v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v57 = *MEMORY[0x1E0D025B8];
        v607 = *MEMORY[0x1E0CB2D50];
        v58 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("matchedPeopleRatio"));
        v608 = v58;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v608, &v607, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v56;
        v10 = v55;
        v61 = v57;
        v62 = (void *)v58;
        v8 = 0;
        v29 = 0;
        *a4 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v61, 2, v59);
        goto LABEL_467;
      }
      v29 = 0;
      v8 = 0;
LABEL_468:

      goto LABEL_469;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v512;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAeroMLPhotosSearchDataCorrelationsUISurfaceTypeFromString(v9));
      v507 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    if (a4)
    {
      v81 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v82 = *MEMORY[0x1E0D025B8];
      v609 = *MEMORY[0x1E0CB2D50];
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("uiSurface"));
      v610 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v610, &v609, 1);
      v83 = objc_claimAutoreleasedReturnValue();
      v84 = v82;
      v10 = (void *)v83;
      v507 = 0;
      v8 = 0;
      *a4 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v84, 2);
      goto LABEL_468;
    }
    v507 = 0;
    v8 = 0;
LABEL_469:

    goto LABEL_470;
  }
  if (a4)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = *MEMORY[0x1E0D025B8];
    v611 = *MEMORY[0x1E0CB2D50];
    v507 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("searchSessionUUID"));
    v612[0] = v507;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v612, &v611, 1);
    v512 = (void *)objc_claimAutoreleasedReturnValue();
    v509 = 0;
    v8 = 0;
    *a4 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, 2);
    goto LABEL_469;
  }
  v509 = 0;
  v8 = 0;
LABEL_470:

  return v8;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  void *v6;
  id v7;
  double v8;
  void *v9;
  id v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  void *v15;
  id v16;
  double v17;
  void *v18;
  id v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  double v58;
  void *v59;
  double v60;
  void *v61;
  double v62;
  void *v63;
  double v64;
  void *v65;
  double v66;
  void *v67;
  double v68;
  void *v69;
  double v70;
  void *v71;
  double v72;
  void *v73;
  double v74;
  void *v75;
  double v76;
  void *v77;
  double v78;
  void *v79;
  double v80;
  void *v81;
  double v82;
  void *v83;
  double v84;
  void *v85;
  double v86;
  void *v87;
  double v88;
  void *v89;
  double v90;
  void *v91;
  double v92;
  void *v93;
  double v94;
  void *v95;
  double v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  id v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  id v200;
  id v201;
  id v202;
  id v203;
  id v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  id v212;
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  id v218;
  id v219;
  id v220;
  id v221;
  id v222;
  id v223;
  id v224;
  id v225;
  id v226;
  id v227;
  id v228;
  id v229;
  id v230;
  id v231;
  id v232;
  id v233;
  id v234;
  id v235;
  id v236;
  id v237;
  id v238;
  id v239;
  id v240;
  id v241;
  id v242;
  _QWORD v243[50];
  _QWORD v244[52];

  v244[50] = *MEMORY[0x1E0C80C00];
  -[BMAeroMLPhotosSearchDataCorrelations searchSessionUUID](self, "searchSessionUUID");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAeroMLPhotosSearchDataCorrelations uiSurface](self, "uiSurface"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedPeopleRatio](self, "hasMatchedPeopleRatio")
    || (-[BMAeroMLPhotosSearchDataCorrelations matchedPeopleRatio](self, "matchedPeopleRatio"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations matchedPeopleRatio](self, "matchedPeopleRatio");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations matchedPeopleRatio](self, "matchedPeopleRatio");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedLocationRatio](self, "hasMatchedLocationRatio")
    || (-[BMAeroMLPhotosSearchDataCorrelations matchedLocationRatio](self, "matchedLocationRatio"), fabs(v8) == INFINITY))
  {
    v10 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations matchedLocationRatio](self, "matchedLocationRatio");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations matchedLocationRatio](self, "matchedLocationRatio");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedSceneRatio](self, "hasMatchedSceneRatio")
    || (-[BMAeroMLPhotosSearchDataCorrelations matchedSceneRatio](self, "matchedSceneRatio"), fabs(v11) == INFINITY))
  {
    v13 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations matchedSceneRatio](self, "matchedSceneRatio");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations matchedSceneRatio](self, "matchedSceneRatio");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedSceneConfidence](self, "hasMatchedSceneConfidence")
    || (-[BMAeroMLPhotosSearchDataCorrelations matchedSceneConfidence](self, "matchedSceneConfidence"),
        fabs(v14) == INFINITY))
  {
    v16 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations matchedSceneConfidence](self, "matchedSceneConfidence");
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations matchedSceneConfidence](self, "matchedSceneConfidence");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedSceneBoundingBox](self, "hasMatchedSceneBoundingBox")
    || (-[BMAeroMLPhotosSearchDataCorrelations matchedSceneBoundingBox](self, "matchedSceneBoundingBox"),
        fabs(v17) == INFINITY))
  {
    v19 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations matchedSceneBoundingBox](self, "matchedSceneBoundingBox");
    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations matchedSceneBoundingBox](self, "matchedSceneBoundingBox");
    objc_msgSend(v18, "numberWithDouble:");
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedOCRCharacterRatio](self, "hasMatchedOCRCharacterRatio")
    || (-[BMAeroMLPhotosSearchDataCorrelations matchedOCRCharacterRatio](self, "matchedOCRCharacterRatio"),
        fabs(v20) == INFINITY))
  {
    v242 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations matchedOCRCharacterRatio](self, "matchedOCRCharacterRatio");
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations matchedOCRCharacterRatio](self, "matchedOCRCharacterRatio");
    objc_msgSend(v21, "numberWithDouble:");
    v242 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedOCRImportance](self, "hasMatchedOCRImportance")
    || (-[BMAeroMLPhotosSearchDataCorrelations matchedOCRImportance](self, "matchedOCRImportance"), fabs(v22) == INFINITY))
  {
    v241 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations matchedOCRImportance](self, "matchedOCRImportance");
    v23 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations matchedOCRImportance](self, "matchedOCRImportance");
    objc_msgSend(v23, "numberWithDouble:");
    v241 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMAeroMLPhotosSearchDataCorrelations hasMatchedFieldsCount](self, "hasMatchedFieldsCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchDataCorrelations matchedFieldsCount](self, "matchedFieldsCount"));
    v240 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v240 = 0;
  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasL1Score](self, "hasL1Score")
    || (-[BMAeroMLPhotosSearchDataCorrelations L1Score](self, "L1Score"), fabs(v24) == INFINITY))
  {
    v239 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations L1Score](self, "L1Score");
    v25 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations L1Score](self, "L1Score");
    objc_msgSend(v25, "numberWithDouble:");
    v239 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasFreshness](self, "hasFreshness")
    || (-[BMAeroMLPhotosSearchDataCorrelations freshness](self, "freshness"), fabs(v26) == INFINITY))
  {
    v238 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations freshness](self, "freshness");
    v27 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations freshness](self, "freshness");
    objc_msgSend(v27, "numberWithDouble:");
    v238 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMAeroMLPhotosSearchDataCorrelations hasFavorited](self, "hasFavorited"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchDataCorrelations favorited](self, "favorited"));
    v237 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v237 = 0;
  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasAestheticScore](self, "hasAestheticScore")
    || (-[BMAeroMLPhotosSearchDataCorrelations aestheticScore](self, "aestheticScore"), fabs(v28) == INFINITY))
  {
    v236 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations aestheticScore](self, "aestheticScore");
    v29 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations aestheticScore](self, "aestheticScore");
    objc_msgSend(v29, "numberWithDouble:");
    v236 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasCurationScore](self, "hasCurationScore")
    || (-[BMAeroMLPhotosSearchDataCorrelations curationScore](self, "curationScore"), fabs(v30) == INFINITY))
  {
    v235 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations curationScore](self, "curationScore");
    v31 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations curationScore](self, "curationScore");
    objc_msgSend(v31, "numberWithDouble:");
    v235 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasHasEverClickInLastWeek](self, "hasHasEverClickInLastWeek")
    || (-[BMAeroMLPhotosSearchDataCorrelations hasEverClickInLastWeek](self, "hasEverClickInLastWeek"),
        fabs(v32) == INFINITY))
  {
    v234 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations hasEverClickInLastWeek](self, "hasEverClickInLastWeek");
    v33 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations hasEverClickInLastWeek](self, "hasEverClickInLastWeek");
    objc_msgSend(v33, "numberWithDouble:");
    v234 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasHasEverClickInLastMonth](self, "hasHasEverClickInLastMonth")
    || (-[BMAeroMLPhotosSearchDataCorrelations hasEverClickInLastMonth](self, "hasEverClickInLastMonth"),
        fabs(v34) == INFINITY))
  {
    v233 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations hasEverClickInLastMonth](self, "hasEverClickInLastMonth");
    v35 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations hasEverClickInLastMonth](self, "hasEverClickInLastMonth");
    objc_msgSend(v35, "numberWithDouble:");
    v233 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasHasEverShareInLastWeek](self, "hasHasEverShareInLastWeek")
    || (-[BMAeroMLPhotosSearchDataCorrelations hasEverShareInLastWeek](self, "hasEverShareInLastWeek"),
        fabs(v36) == INFINITY))
  {
    v232 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations hasEverShareInLastWeek](self, "hasEverShareInLastWeek");
    v37 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations hasEverShareInLastWeek](self, "hasEverShareInLastWeek");
    objc_msgSend(v37, "numberWithDouble:");
    v232 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasHasEverShareInLastMonth](self, "hasHasEverShareInLastMonth")
    || (-[BMAeroMLPhotosSearchDataCorrelations hasEverShareInLastMonth](self, "hasEverShareInLastMonth"),
        fabs(v38) == INFINITY))
  {
    v231 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations hasEverShareInLastMonth](self, "hasEverShareInLastMonth");
    v39 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations hasEverShareInLastMonth](self, "hasEverShareInLastMonth");
    objc_msgSend(v39, "numberWithDouble:");
    v231 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountInLastWeekNormalizedAcrossItems](self, "hasClickCountInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations clickCountInLastWeekNormalizedAcrossItems](self, "clickCountInLastWeekNormalizedAcrossItems"), fabs(v40) == INFINITY))
  {
    v230 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations clickCountInLastWeekNormalizedAcrossItems](self, "clickCountInLastWeekNormalizedAcrossItems");
    v41 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations clickCountInLastWeekNormalizedAcrossItems](self, "clickCountInLastWeekNormalizedAcrossItems");
    objc_msgSend(v41, "numberWithDouble:");
    v230 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountInLastMonthNormalizedAcrossItems](self, "hasClickCountInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations clickCountInLastMonthNormalizedAcrossItems](self, "clickCountInLastMonthNormalizedAcrossItems"), fabs(v42) == INFINITY))
  {
    v229 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations clickCountInLastMonthNormalizedAcrossItems](self, "clickCountInLastMonthNormalizedAcrossItems");
    v43 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations clickCountInLastMonthNormalizedAcrossItems](self, "clickCountInLastMonthNormalizedAcrossItems");
    objc_msgSend(v43, "numberWithDouble:");
    v229 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountInLastWeekNormalizedAcrossItems](self, "hasShareCountInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations shareCountInLastWeekNormalizedAcrossItems](self, "shareCountInLastWeekNormalizedAcrossItems"), fabs(v44) == INFINITY))
  {
    v228 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations shareCountInLastWeekNormalizedAcrossItems](self, "shareCountInLastWeekNormalizedAcrossItems");
    v45 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations shareCountInLastWeekNormalizedAcrossItems](self, "shareCountInLastWeekNormalizedAcrossItems");
    objc_msgSend(v45, "numberWithDouble:");
    v228 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountInLastMonthNormalizedAcrossItems](self, "hasShareCountInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations shareCountInLastMonthNormalizedAcrossItems](self, "shareCountInLastMonthNormalizedAcrossItems"), fabs(v46) == INFINITY))
  {
    v227 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations shareCountInLastMonthNormalizedAcrossItems](self, "shareCountInLastMonthNormalizedAcrossItems");
    v47 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations shareCountInLastMonthNormalizedAcrossItems](self, "shareCountInLastMonthNormalizedAcrossItems");
    objc_msgSend(v47, "numberWithDouble:");
    v227 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), fabs(v48) == INFINITY))
  {
    v226 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems");
    v49 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems");
    objc_msgSend(v49, "numberWithDouble:");
    v226 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), fabs(v50) == INFINITY))
  {
    v225 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems");
    v51 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems");
    objc_msgSend(v51, "numberWithDouble:");
    v225 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "clickCountGivenLocationInLastWeekNormalizedAcrossItems"), fabs(v52) == INFINITY))
  {
    v224 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "clickCountGivenLocationInLastWeekNormalizedAcrossItems");
    v53 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "clickCountGivenLocationInLastWeekNormalizedAcrossItems");
    objc_msgSend(v53, "numberWithDouble:");
    v224 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "clickCountGivenLocationInLastMonthNormalizedAcrossItems"), fabs(v54) == INFINITY))
  {
    v223 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "clickCountGivenLocationInLastMonthNormalizedAcrossItems");
    v55 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "clickCountGivenLocationInLastMonthNormalizedAcrossItems");
    objc_msgSend(v55, "numberWithDouble:");
    v223 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), fabs(v56) == INFINITY))
  {
    v222 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems");
    v57 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems");
    objc_msgSend(v57, "numberWithDouble:");
    v222 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), fabs(v58) == INFINITY))
  {
    v221 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems");
    v59 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems");
    objc_msgSend(v59, "numberWithDouble:");
    v221 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), fabs(v60) == INFINITY))
  {
    v220 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems");
    v61 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems");
    objc_msgSend(v61, "numberWithDouble:");
    v220 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), fabs(v62) == INFINITY))
  {
    v219 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems");
    v63 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems");
    objc_msgSend(v63, "numberWithDouble:");
    v219 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), fabs(v64) == INFINITY))
  {
    v218 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems");
    v65 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems");
    objc_msgSend(v65, "numberWithDouble:");
    v218 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), fabs(v66) == INFINITY))
  {
    v217 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems");
    v67 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems");
    objc_msgSend(v67, "numberWithDouble:");
    v217 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), fabs(v68) == INFINITY))
  {
    v216 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems");
    v69 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems");
    objc_msgSend(v69, "numberWithDouble:");
    v216 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), fabs(v70) == INFINITY))
  {
    v215 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems");
    v71 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems");
    objc_msgSend(v71, "numberWithDouble:");
    v215 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), fabs(v72) == INFINITY))
  {
    v214 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems");
    v73 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems");
    objc_msgSend(v73, "numberWithDouble:");
    v214 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), fabs(v74) == INFINITY))
  {
    v213 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems");
    v75 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems");
    objc_msgSend(v75, "numberWithDouble:");
    v213 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "shareCountGivenLocationInLastWeekNormalizedAcrossItems"), fabs(v76) == INFINITY))
  {
    v212 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "shareCountGivenLocationInLastWeekNormalizedAcrossItems");
    v77 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "shareCountGivenLocationInLastWeekNormalizedAcrossItems");
    objc_msgSend(v77, "numberWithDouble:");
    v212 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "shareCountGivenLocationInLastMonthNormalizedAcrossItems"), fabs(v78) == INFINITY))
  {
    v211 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "shareCountGivenLocationInLastMonthNormalizedAcrossItems");
    v79 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "shareCountGivenLocationInLastMonthNormalizedAcrossItems");
    objc_msgSend(v79, "numberWithDouble:");
    v211 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), fabs(v80) == INFINITY))
  {
    v210 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems");
    v81 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems");
    objc_msgSend(v81, "numberWithDouble:");
    v210 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), fabs(v82) == INFINITY))
  {
    v209 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems");
    v83 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems");
    objc_msgSend(v83, "numberWithDouble:");
    v209 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), fabs(v84) == INFINITY))
  {
    v208 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems");
    v85 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems");
    objc_msgSend(v85, "numberWithDouble:");
    v208 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), fabs(v86) == INFINITY))
  {
    v207 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems");
    v87 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems");
    objc_msgSend(v87, "numberWithDouble:");
    v207 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), fabs(v88) == INFINITY))
  {
    v206 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems");
    v89 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems");
    objc_msgSend(v89, "numberWithDouble:");
    v206 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), fabs(v90) == INFINITY))
  {
    v205 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems");
    v91 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems");
    objc_msgSend(v91, "numberWithDouble:");
    v205 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), fabs(v92) == INFINITY))
  {
    v204 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems");
    v93 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems");
    objc_msgSend(v93, "numberWithDouble:");
    v204 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), fabs(v94) == INFINITY))
  {
    v203 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems");
    v95 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems");
    objc_msgSend(v95, "numberWithDouble:");
    v203 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClipScore](self, "hasClipScore")
    || (-[BMAeroMLPhotosSearchDataCorrelations clipScore](self, "clipScore"), fabs(v96) == INFINITY))
  {
    v202 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchDataCorrelations clipScore](self, "clipScore");
    v97 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchDataCorrelations clipScore](self, "clipScore");
    objc_msgSend(v97, "numberWithDouble:");
    v202 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMAeroMLPhotosSearchDataCorrelations hasCorrelationMetricVersion](self, "hasCorrelationMetricVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchDataCorrelations correlationMetricVersion](self, "correlationMetricVersion"));
    v201 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v201 = 0;
  }
  if (-[BMAeroMLPhotosSearchDataCorrelations hasCorrelationMetricWindowInDays](self, "hasCorrelationMetricWindowInDays"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchDataCorrelations correlationMetricWindowInDays](self, "correlationMetricWindowInDays"));
    v200 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v200 = 0;
  }
  v243[0] = CFSTR("searchSessionUUID");
  v98 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v98 = objc_claimAutoreleasedReturnValue();
  }
  v192 = (void *)v98;
  v244[0] = v98;
  v243[1] = CFSTR("uiSurface");
  v99 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v99 = objc_claimAutoreleasedReturnValue();
  }
  v191 = (void *)v99;
  v244[1] = v99;
  v243[2] = CFSTR("matchedPeopleRatio");
  v100 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v100 = objc_claimAutoreleasedReturnValue();
  }
  v190 = (void *)v100;
  v244[2] = v100;
  v243[3] = CFSTR("matchedLocationRatio");
  v101 = (uint64_t)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v101 = objc_claimAutoreleasedReturnValue();
  }
  v189 = (void *)v101;
  v244[3] = v101;
  v243[4] = CFSTR("matchedSceneRatio");
  v102 = (uint64_t)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v102 = objc_claimAutoreleasedReturnValue();
  }
  v188 = (void *)v102;
  v244[4] = v102;
  v243[5] = CFSTR("matchedSceneConfidence");
  v103 = (uint64_t)v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v103 = objc_claimAutoreleasedReturnValue();
  }
  v187 = (void *)v103;
  v244[5] = v103;
  v243[6] = CFSTR("matchedSceneBoundingBox");
  v104 = (uint64_t)v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v104 = objc_claimAutoreleasedReturnValue();
  }
  v186 = (void *)v104;
  v244[6] = v104;
  v243[7] = CFSTR("matchedOCRCharacterRatio");
  v105 = (uint64_t)v242;
  if (!v242)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v105 = objc_claimAutoreleasedReturnValue();
  }
  v244[7] = v105;
  v243[8] = CFSTR("matchedOCRImportance");
  v106 = v241;
  if (!v241)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v244[8] = v106;
  v243[9] = CFSTR("matchedFieldsCount");
  v107 = (uint64_t)v240;
  if (!v240)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v107 = objc_claimAutoreleasedReturnValue();
  }
  v244[9] = v107;
  v243[10] = CFSTR("L1Score");
  v108 = (uint64_t)v239;
  if (!v239)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v108 = objc_claimAutoreleasedReturnValue();
  }
  v183 = (void *)v108;
  v244[10] = v108;
  v243[11] = CFSTR("freshness");
  v109 = (uint64_t)v238;
  if (!v238)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v109 = objc_claimAutoreleasedReturnValue();
  }
  v194 = (void *)v4;
  v195 = (void *)v109;
  v244[11] = v109;
  v243[12] = CFSTR("favorited");
  v110 = (uint64_t)v237;
  if (!v237)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v110 = objc_claimAutoreleasedReturnValue();
  }
  v111 = (void *)v110;
  v244[12] = v110;
  v243[13] = CFSTR("aestheticScore");
  v112 = (uint64_t)v236;
  if (!v236)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v112 = objc_claimAutoreleasedReturnValue();
  }
  v182 = (void *)v112;
  v244[13] = v112;
  v243[14] = CFSTR("curationScore");
  v113 = (uint64_t)v235;
  if (!v235)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v113 = objc_claimAutoreleasedReturnValue();
  }
  v181 = (void *)v113;
  v244[14] = v113;
  v243[15] = CFSTR("hasEverClickInLastWeek");
  v114 = (uint64_t)v234;
  if (!v234)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v114 = objc_claimAutoreleasedReturnValue();
  }
  v180 = (void *)v114;
  v244[15] = v114;
  v243[16] = CFSTR("hasEverClickInLastMonth");
  v115 = (uint64_t)v233;
  if (!v233)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v115 = objc_claimAutoreleasedReturnValue();
  }
  v179 = (void *)v115;
  v244[16] = v115;
  v243[17] = CFSTR("hasEverShareInLastWeek");
  v116 = (uint64_t)v232;
  if (!v232)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v116 = objc_claimAutoreleasedReturnValue();
  }
  v178 = (void *)v116;
  v244[17] = v116;
  v243[18] = CFSTR("hasEverShareInLastMonth");
  v117 = (uint64_t)v231;
  if (!v231)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v117 = objc_claimAutoreleasedReturnValue();
  }
  v177 = (void *)v117;
  v244[18] = v117;
  v243[19] = CFSTR("clickCountInLastWeekNormalizedAcrossItems");
  v118 = (uint64_t)v230;
  if (!v230)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v118 = objc_claimAutoreleasedReturnValue();
  }
  v176 = (void *)v118;
  v244[19] = v118;
  v243[20] = CFSTR("clickCountInLastMonthNormalizedAcrossItems");
  v119 = (uint64_t)v229;
  if (!v229)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v119 = objc_claimAutoreleasedReturnValue();
  }
  v175 = (void *)v119;
  v244[20] = v119;
  v243[21] = CFSTR("shareCountInLastWeekNormalizedAcrossItems");
  v120 = (uint64_t)v228;
  if (!v228)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v120 = objc_claimAutoreleasedReturnValue();
  }
  v174 = (void *)v120;
  v244[21] = v120;
  v243[22] = CFSTR("shareCountInLastMonthNormalizedAcrossItems");
  v121 = (uint64_t)v227;
  if (!v227)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v121 = objc_claimAutoreleasedReturnValue();
  }
  v173 = (void *)v121;
  v244[22] = v121;
  v243[23] = CFSTR("clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems");
  v122 = (uint64_t)v226;
  if (!v226)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v122 = objc_claimAutoreleasedReturnValue();
  }
  v172 = (void *)v122;
  v244[23] = v122;
  v243[24] = CFSTR("clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems");
  v123 = (uint64_t)v225;
  if (!v225)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v123 = objc_claimAutoreleasedReturnValue();
  }
  v171 = (void *)v123;
  v244[24] = v123;
  v243[25] = CFSTR("clickCountGivenLocationInLastWeekNormalizedAcrossItems");
  v124 = (uint64_t)v224;
  if (!v224)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v124 = objc_claimAutoreleasedReturnValue();
  }
  v170 = (void *)v124;
  v244[25] = v124;
  v243[26] = CFSTR("clickCountGivenLocationInLastMonthNormalizedAcrossItems");
  v125 = (uint64_t)v223;
  if (!v223)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v125 = objc_claimAutoreleasedReturnValue();
  }
  v169 = (void *)v125;
  v244[26] = v125;
  v243[27] = CFSTR("clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems");
  v126 = (uint64_t)v222;
  if (!v222)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v126 = objc_claimAutoreleasedReturnValue();
  }
  v168 = (void *)v126;
  v244[27] = v126;
  v243[28] = CFSTR("clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems");
  v127 = (uint64_t)v221;
  if (!v221)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v127 = objc_claimAutoreleasedReturnValue();
  }
  v167 = (void *)v127;
  v244[28] = v127;
  v243[29] = CFSTR("clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems");
  v128 = (uint64_t)v220;
  if (!v220)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v128 = objc_claimAutoreleasedReturnValue();
  }
  v166 = (void *)v128;
  v244[29] = v128;
  v243[30] = CFSTR("clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems");
  v129 = (uint64_t)v219;
  if (!v219)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v129 = objc_claimAutoreleasedReturnValue();
  }
  v165 = (void *)v129;
  v244[30] = v129;
  v243[31] = CFSTR("clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems");
  v130 = (uint64_t)v218;
  if (!v218)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v130 = objc_claimAutoreleasedReturnValue();
  }
  v164 = (void *)v130;
  v244[31] = v130;
  v243[32] = CFSTR("clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems");
  v131 = (uint64_t)v217;
  if (!v217)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v131 = objc_claimAutoreleasedReturnValue();
  }
  v163 = (void *)v131;
  v244[32] = v131;
  v243[33] = CFSTR("clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems");
  v132 = (uint64_t)v216;
  if (!v216)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v132 = objc_claimAutoreleasedReturnValue();
  }
  v162 = (void *)v132;
  v244[33] = v132;
  v243[34] = CFSTR("clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems");
  v133 = (uint64_t)v215;
  if (!v215)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v133 = objc_claimAutoreleasedReturnValue();
  }
  v161 = (void *)v133;
  v244[34] = v133;
  v243[35] = CFSTR("shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems");
  v134 = (uint64_t)v214;
  if (!v214)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v134 = objc_claimAutoreleasedReturnValue();
  }
  v160 = (void *)v134;
  v244[35] = v134;
  v243[36] = CFSTR("shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems");
  v135 = (uint64_t)v213;
  if (!v213)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v135 = objc_claimAutoreleasedReturnValue();
  }
  v159 = (void *)v135;
  v244[36] = v135;
  v243[37] = CFSTR("shareCountGivenLocationInLastWeekNormalizedAcrossItems");
  v136 = (uint64_t)v212;
  if (!v212)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v136 = objc_claimAutoreleasedReturnValue();
  }
  v158 = (void *)v136;
  v244[37] = v136;
  v243[38] = CFSTR("shareCountGivenLocationInLastMonthNormalizedAcrossItems");
  v137 = (uint64_t)v211;
  if (!v211)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v137 = objc_claimAutoreleasedReturnValue();
  }
  v157 = (void *)v137;
  v244[38] = v137;
  v243[39] = CFSTR("shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems");
  v138 = (uint64_t)v210;
  if (!v210)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v138 = objc_claimAutoreleasedReturnValue();
  }
  v156 = (void *)v138;
  v244[39] = v138;
  v243[40] = CFSTR("shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems");
  v139 = (uint64_t)v209;
  if (!v209)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v139 = objc_claimAutoreleasedReturnValue();
  }
  v199 = (void *)v3;
  v155 = (void *)v139;
  v244[40] = v139;
  v243[41] = CFSTR("shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems");
  v140 = (uint64_t)v208;
  if (!v208)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v140 = objc_claimAutoreleasedReturnValue();
  }
  v197 = v19;
  v154 = (void *)v140;
  v244[41] = v140;
  v243[42] = CFSTR("shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems");
  v141 = (uint64_t)v207;
  if (!v207)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v141 = objc_claimAutoreleasedReturnValue();
  }
  v184 = (void *)v107;
  v153 = (void *)v141;
  v244[42] = v141;
  v243[43] = CFSTR("shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems");
  v142 = (uint64_t)v206;
  if (!v206)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v142 = objc_claimAutoreleasedReturnValue();
  }
  v152 = (void *)v142;
  v244[43] = v142;
  v243[44] = CFSTR("shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems");
  v143 = v205;
  if (!v205)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v198 = v16;
  v196 = v13;
  v244[44] = v143;
  v243[45] = CFSTR("shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems");
  v144 = v204;
  if (!v204)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v145 = v10;
  v244[45] = v144;
  v243[46] = CFSTR("shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems");
  v146 = v203;
  if (!v203)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v185 = (void *)v105;
  v244[46] = v146;
  v243[47] = CFSTR("clipScore");
  v147 = v202;
  if (!v202)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v244[47] = v147;
  v243[48] = CFSTR("correlationMetricVersion");
  v148 = v201;
  if (!v201)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v244[48] = v148;
  v243[49] = CFSTR("correlationMetricWindowInDays");
  v149 = v200;
  if (!v200)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v244[49] = v149;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v244, v243, 50);
  v193 = (id)objc_claimAutoreleasedReturnValue();
  if (!v200)

  v150 = v111;
  if (!v201)
  {

    v150 = v111;
  }
  if (!v202)
  {

    v150 = v111;
  }
  if (!v203)
  {

    v150 = v111;
  }
  if (!v204)
  {

    v150 = v111;
  }
  if (!v205)
  {

    v150 = v111;
  }
  if (!v206)
  {

    v150 = v111;
  }
  if (!v207)
  {

    v150 = v111;
  }
  if (!v208)
  {

    v150 = v111;
  }
  if (!v209)
  {

    v150 = v111;
  }
  if (!v210)
  {

    v150 = v111;
  }
  if (!v211)
  {

    v150 = v111;
  }
  if (!v212)
  {

    v150 = v111;
  }
  if (!v213)
  {

    v150 = v111;
  }
  if (!v214)
  {

    v150 = v111;
  }
  if (!v215)
  {

    v150 = v111;
  }
  if (!v216)
  {

    v150 = v111;
  }
  if (!v217)
  {

    v150 = v111;
  }
  if (!v218)
  {

    v150 = v111;
  }
  if (!v219)
  {

    v150 = v111;
  }
  if (!v220)
  {

    v150 = v111;
  }
  if (!v221)
  {

    v150 = v111;
  }
  if (!v222)
  {

    v150 = v111;
  }
  if (!v223)
  {

    v150 = v111;
  }
  if (!v224)
  {

    v150 = v111;
  }
  if (!v225)
  {

    v150 = v111;
  }
  if (!v226)
  {

    v150 = v111;
  }
  if (!v227)
  {

    v150 = v111;
  }
  if (!v228)
  {

    v150 = v111;
  }
  if (!v229)
  {

    v150 = v111;
  }
  if (!v230)
  {

    v150 = v111;
  }
  if (!v231)
  {

    v150 = v111;
  }
  if (!v232)
  {

    v150 = v111;
  }
  if (!v233)
  {

    v150 = v111;
  }
  if (!v234)
  {

    v150 = v111;
  }
  if (!v235)
  {

    v150 = v111;
  }
  if (!v236)
  {

    v150 = v111;
  }
  if (!v237)

  if (!v238)
  if (!v239)

  if (!v240)
  if (!v241)

  if (v242)
  {
    if (v197)
      goto LABEL_375;
  }
  else
  {

    if (v197)
    {
LABEL_375:
      if (v198)
        goto LABEL_376;
      goto LABEL_384;
    }
  }

  if (v198)
  {
LABEL_376:
    if (v196)
      goto LABEL_377;
    goto LABEL_385;
  }
LABEL_384:

  if (v196)
  {
LABEL_377:
    if (v145)
      goto LABEL_378;
    goto LABEL_386;
  }
LABEL_385:

  if (v145)
  {
LABEL_378:
    if (v7)
      goto LABEL_379;
    goto LABEL_387;
  }
LABEL_386:

  if (v7)
  {
LABEL_379:
    if (v194)
      goto LABEL_380;
LABEL_388:

    if (v199)
      goto LABEL_381;
LABEL_389:

    goto LABEL_381;
  }
LABEL_387:

  if (!v194)
    goto LABEL_388;
LABEL_380:
  if (!v199)
    goto LABEL_389;
LABEL_381:

  return v193;
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
  BOOL v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  unsigned int v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  int v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  unsigned int v148;
  unsigned int v149;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAeroMLPhotosSearchDataCorrelations searchSessionUUID](self, "searchSessionUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchSessionUUID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAeroMLPhotosSearchDataCorrelations searchSessionUUID](self, "searchSessionUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "searchSessionUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_248;
    }
    v13 = -[BMAeroMLPhotosSearchDataCorrelations uiSurface](self, "uiSurface");
    if (v13 == objc_msgSend(v5, "uiSurface"))
    {
      if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedPeopleRatio](self, "hasMatchedPeopleRatio")
        && !objc_msgSend(v5, "hasMatchedPeopleRatio")
        || -[BMAeroMLPhotosSearchDataCorrelations hasMatchedPeopleRatio](self, "hasMatchedPeopleRatio")
        && objc_msgSend(v5, "hasMatchedPeopleRatio")
        && (-[BMAeroMLPhotosSearchDataCorrelations matchedPeopleRatio](self, "matchedPeopleRatio"),
            v15 = v14,
            objc_msgSend(v5, "matchedPeopleRatio"),
            v15 == v16))
      {
        if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedLocationRatio](self, "hasMatchedLocationRatio")
          && !objc_msgSend(v5, "hasMatchedLocationRatio")
          || -[BMAeroMLPhotosSearchDataCorrelations hasMatchedLocationRatio](self, "hasMatchedLocationRatio")
          && objc_msgSend(v5, "hasMatchedLocationRatio")
          && (-[BMAeroMLPhotosSearchDataCorrelations matchedLocationRatio](self, "matchedLocationRatio"),
              v18 = v17,
              objc_msgSend(v5, "matchedLocationRatio"),
              v18 == v19))
        {
          if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedSceneRatio](self, "hasMatchedSceneRatio")
            && !objc_msgSend(v5, "hasMatchedSceneRatio")
            || -[BMAeroMLPhotosSearchDataCorrelations hasMatchedSceneRatio](self, "hasMatchedSceneRatio")
            && objc_msgSend(v5, "hasMatchedSceneRatio")
            && (-[BMAeroMLPhotosSearchDataCorrelations matchedSceneRatio](self, "matchedSceneRatio"),
                v21 = v20,
                objc_msgSend(v5, "matchedSceneRatio"),
                v21 == v22))
          {
            if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedSceneConfidence](self, "hasMatchedSceneConfidence")
              && !objc_msgSend(v5, "hasMatchedSceneConfidence")
              || -[BMAeroMLPhotosSearchDataCorrelations hasMatchedSceneConfidence](self, "hasMatchedSceneConfidence")
              && objc_msgSend(v5, "hasMatchedSceneConfidence")
              && (-[BMAeroMLPhotosSearchDataCorrelations matchedSceneConfidence](self, "matchedSceneConfidence"),
                  v24 = v23,
                  objc_msgSend(v5, "matchedSceneConfidence"),
                  v24 == v25))
            {
              if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedSceneBoundingBox](self, "hasMatchedSceneBoundingBox")&& !objc_msgSend(v5, "hasMatchedSceneBoundingBox")|| -[BMAeroMLPhotosSearchDataCorrelations hasMatchedSceneBoundingBox](self, "hasMatchedSceneBoundingBox")&& objc_msgSend(v5, "hasMatchedSceneBoundingBox")&& (-[BMAeroMLPhotosSearchDataCorrelations matchedSceneBoundingBox](self, "matchedSceneBoundingBox"), v27 = v26, objc_msgSend(v5, "matchedSceneBoundingBox"), v27 == v28))
              {
                if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedOCRCharacterRatio](self, "hasMatchedOCRCharacterRatio")&& !objc_msgSend(v5, "hasMatchedOCRCharacterRatio")|| -[BMAeroMLPhotosSearchDataCorrelations hasMatchedOCRCharacterRatio](self, "hasMatchedOCRCharacterRatio")&& objc_msgSend(v5, "hasMatchedOCRCharacterRatio")&& (-[BMAeroMLPhotosSearchDataCorrelations matchedOCRCharacterRatio](self, "matchedOCRCharacterRatio"), v30 = v29, objc_msgSend(v5, "matchedOCRCharacterRatio"), v30 == v31))
                {
                  if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedOCRImportance](self, "hasMatchedOCRImportance")
                    && !objc_msgSend(v5, "hasMatchedOCRImportance")
                    || -[BMAeroMLPhotosSearchDataCorrelations hasMatchedOCRImportance](self, "hasMatchedOCRImportance")
                    && objc_msgSend(v5, "hasMatchedOCRImportance")
                    && (-[BMAeroMLPhotosSearchDataCorrelations matchedOCRImportance](self, "matchedOCRImportance"),
                        v33 = v32,
                        objc_msgSend(v5, "matchedOCRImportance"),
                        v33 == v34))
                  {
                    if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedFieldsCount](self, "hasMatchedFieldsCount")
                      && !objc_msgSend(v5, "hasMatchedFieldsCount")
                      || -[BMAeroMLPhotosSearchDataCorrelations hasMatchedFieldsCount](self, "hasMatchedFieldsCount")
                      && objc_msgSend(v5, "hasMatchedFieldsCount")
                      && (v35 = -[BMAeroMLPhotosSearchDataCorrelations matchedFieldsCount](self, "matchedFieldsCount"),
                          v35 == objc_msgSend(v5, "matchedFieldsCount")))
                    {
                      if (!-[BMAeroMLPhotosSearchDataCorrelations hasL1Score](self, "hasL1Score")
                        && !objc_msgSend(v5, "hasL1Score")
                        || -[BMAeroMLPhotosSearchDataCorrelations hasL1Score](self, "hasL1Score")
                        && objc_msgSend(v5, "hasL1Score")
                        && (-[BMAeroMLPhotosSearchDataCorrelations L1Score](self, "L1Score"),
                            v37 = v36,
                            objc_msgSend(v5, "L1Score"),
                            v37 == v38))
                      {
                        if (!-[BMAeroMLPhotosSearchDataCorrelations hasFreshness](self, "hasFreshness")
                          && !objc_msgSend(v5, "hasFreshness")
                          || -[BMAeroMLPhotosSearchDataCorrelations hasFreshness](self, "hasFreshness")
                          && objc_msgSend(v5, "hasFreshness")
                          && (-[BMAeroMLPhotosSearchDataCorrelations freshness](self, "freshness"),
                              v40 = v39,
                              objc_msgSend(v5, "freshness"),
                              v40 == v41))
                        {
                          if (!-[BMAeroMLPhotosSearchDataCorrelations hasFavorited](self, "hasFavorited")
                            && !objc_msgSend(v5, "hasFavorited")
                            || -[BMAeroMLPhotosSearchDataCorrelations hasFavorited](self, "hasFavorited")
                            && objc_msgSend(v5, "hasFavorited")
                            && (v42 = -[BMAeroMLPhotosSearchDataCorrelations favorited](self, "favorited"),
                                v42 == objc_msgSend(v5, "favorited")))
                          {
                            if (!-[BMAeroMLPhotosSearchDataCorrelations hasAestheticScore](self, "hasAestheticScore")
                              && !objc_msgSend(v5, "hasAestheticScore")
                              || -[BMAeroMLPhotosSearchDataCorrelations hasAestheticScore](self, "hasAestheticScore")
                              && objc_msgSend(v5, "hasAestheticScore")
                              && (-[BMAeroMLPhotosSearchDataCorrelations aestheticScore](self, "aestheticScore"),
                                  v44 = v43,
                                  objc_msgSend(v5, "aestheticScore"),
                                  v44 == v45))
                            {
                              if (!-[BMAeroMLPhotosSearchDataCorrelations hasCurationScore](self, "hasCurationScore")
                                && !objc_msgSend(v5, "hasCurationScore")
                                || -[BMAeroMLPhotosSearchDataCorrelations hasCurationScore](self, "hasCurationScore")
                                && objc_msgSend(v5, "hasCurationScore")
                                && (-[BMAeroMLPhotosSearchDataCorrelations curationScore](self, "curationScore"),
                                    v47 = v46,
                                    objc_msgSend(v5, "curationScore"),
                                    v47 == v48))
                              {
                                if (!-[BMAeroMLPhotosSearchDataCorrelations hasHasEverClickInLastWeek](self, "hasHasEverClickInLastWeek")&& !objc_msgSend(v5, "hasHasEverClickInLastWeek")|| -[BMAeroMLPhotosSearchDataCorrelations hasHasEverClickInLastWeek](self, "hasHasEverClickInLastWeek")&& objc_msgSend(v5, "hasHasEverClickInLastWeek")&& (-[BMAeroMLPhotosSearchDataCorrelations hasEverClickInLastWeek](self, "hasEverClickInLastWeek"), v50 = v49, objc_msgSend(v5, "hasEverClickInLastWeek"), v50 == v51))
                                {
                                  if (!-[BMAeroMLPhotosSearchDataCorrelations hasHasEverClickInLastMonth](self, "hasHasEverClickInLastMonth")&& !objc_msgSend(v5, "hasHasEverClickInLastMonth")|| -[BMAeroMLPhotosSearchDataCorrelations hasHasEverClickInLastMonth](self, "hasHasEverClickInLastMonth")&& objc_msgSend(v5, "hasHasEverClickInLastMonth")&& (-[BMAeroMLPhotosSearchDataCorrelations hasEverClickInLastMonth](self, "hasEverClickInLastMonth"), v53 = v52, objc_msgSend(v5, "hasEverClickInLastMonth"), v53 == v54))
                                  {
                                    if (!-[BMAeroMLPhotosSearchDataCorrelations hasHasEverShareInLastWeek](self, "hasHasEverShareInLastWeek")&& !objc_msgSend(v5, "hasHasEverShareInLastWeek")|| -[BMAeroMLPhotosSearchDataCorrelations hasHasEverShareInLastWeek](self, "hasHasEverShareInLastWeek")&& objc_msgSend(v5, "hasHasEverShareInLastWeek")&& (-[BMAeroMLPhotosSearchDataCorrelations hasEverShareInLastWeek](self, "hasEverShareInLastWeek"), v56 = v55, objc_msgSend(v5, "hasEverShareInLastWeek"), v56 == v57))
                                    {
                                      if (!-[BMAeroMLPhotosSearchDataCorrelations hasHasEverShareInLastMonth](self, "hasHasEverShareInLastMonth")&& !objc_msgSend(v5, "hasHasEverShareInLastMonth")|| -[BMAeroMLPhotosSearchDataCorrelations hasHasEverShareInLastMonth](self, "hasHasEverShareInLastMonth")&& objc_msgSend(v5, "hasHasEverShareInLastMonth")&& (-[BMAeroMLPhotosSearchDataCorrelations hasEverShareInLastMonth](self, "hasEverShareInLastMonth"), v59 = v58, objc_msgSend(v5, "hasEverShareInLastMonth"), v59 == v60))
                                      {
                                        if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountInLastWeekNormalizedAcrossItems](self, "hasClickCountInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountInLastWeekNormalizedAcrossItems](self, "hasClickCountInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountInLastWeekNormalizedAcrossItems](self, "clickCountInLastWeekNormalizedAcrossItems"), v62 = v61, objc_msgSend(v5, "clickCountInLastWeekNormalizedAcrossItems"), v62 == v63))
                                        {
                                          if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountInLastMonthNormalizedAcrossItems](self, "hasClickCountInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountInLastMonthNormalizedAcrossItems](self, "hasClickCountInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountInLastMonthNormalizedAcrossItems](self, "clickCountInLastMonthNormalizedAcrossItems"), v65 = v64, objc_msgSend(v5, "clickCountInLastMonthNormalizedAcrossItems"), v65 == v66))
                                          {
                                            if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountInLastWeekNormalizedAcrossItems](self, "hasShareCountInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountInLastWeekNormalizedAcrossItems](self, "hasShareCountInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountInLastWeekNormalizedAcrossItems](self, "shareCountInLastWeekNormalizedAcrossItems"), v68 = v67, objc_msgSend(v5, "shareCountInLastWeekNormalizedAcrossItems"), v68 == v69))
                                            {
                                              if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountInLastMonthNormalizedAcrossItems](self, "hasShareCountInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountInLastMonthNormalizedAcrossItems](self, "hasShareCountInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountInLastMonthNormalizedAcrossItems](self, "shareCountInLastMonthNormalizedAcrossItems"), v71 = v70, objc_msgSend(v5, "shareCountInLastMonthNormalizedAcrossItems"), v71 == v72))
                                              {
                                                if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), v74 = v73, objc_msgSend(v5, "clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), v74 == v75))
                                                {
                                                  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), v77 = v76, objc_msgSend(v5, "clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), v77 == v78))
                                                  {
                                                    if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenLocationInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenLocationInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "clickCountGivenLocationInLastWeekNormalizedAcrossItems"), v80 = v79, objc_msgSend(v5, "clickCountGivenLocationInLastWeekNormalizedAcrossItems"), v80 == v81))
                                                    {
                                                      if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenLocationInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenLocationInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "clickCountGivenLocationInLastMonthNormalizedAcrossItems"), v83 = v82, objc_msgSend(v5, "clickCountGivenLocationInLastMonthNormalizedAcrossItems"), v83 == v84))
                                                      {
                                                        if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), v86 = v85, objc_msgSend(v5,
                                                                "clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"),
                                                              v86 == v87))
                                                        {
                                                          if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), v89 = v88, objc_msgSend(v5,
                                                                  "clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"),
                                                                v89 == v90))
                                                          {
                                                            if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), v92 = v91, objc_msgSend(v5,
                                                                    "clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"),
                                                                  v92 == v93))
                                                            {
                                                              if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), v95 = v94, objc_msgSend(v5,
                                                                      "clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"),
                                                                    v95 == v96))
                                                              {
                                                                if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), v98 = v97, objc_msgSend(v5,
                                                                        "clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"),
                                                                      v98 == v99))
                                                                {
                                                                  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), v101 = v100,
                                                                        objc_msgSend(v5, "clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), v101 == v102))
                                                                  {
                                                                    if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"),
                                                                          v104 = v103,
                                                                          objc_msgSend(v5, "clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), v104 == v105))
                                                                    {
                                                                      if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"),
                                                                            v107 = v106,
                                                                            objc_msgSend(v5, "clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), v107 == v108))
                                                                      {
                                                                        if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), v110 = v109,
                                                                              objc_msgSend(v5, "shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), v110 == v111))
                                                                        {
                                                                          if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"),
                                                                                v113 = v112,
                                                                                objc_msgSend(v5, "shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), v113 == v114))
                                                                          {
                                                                            if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenLocationInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenLocationInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "shareCountGivenLocationInLastWeekNormalizedAcrossItems"),
                                                                                  v116 = v115,
                                                                                  objc_msgSend(v5, "shareCountGivenLocationInLastWeekNormalizedAcrossItems"), v116 == v117))
                                                                            {
                                                                              if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenLocationInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenLocationInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "shareCountGivenLocationInLastMonthNormalizedAcrossItems"),
                                                                                    v119 = v118,
                                                                                    objc_msgSend(v5, "shareCountGivenLocationInLastMonthNormalizedAcrossItems"), v119 == v120))
                                                                              {
                                                                                if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), v122 = v121, objc_msgSend(v5, "shareCountGivenDayCategoryInLast"
                                                                                        "WeekNormalizedAcrossItems"),
                                                                                      v122 == v123))
                                                                                {
                                                                                  if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), v125 = v124, objc_msgSend(v5, "shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), v125 == v126))
                                                                                  {
                                                                                    if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), v128 = v127, objc_msgSend(v5, "shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), v128 == v129))
                                                                                    {
                                                                                      if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), v131 = v130, objc_msgSend(v5, "shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), v131 == v132))
                                                                                      {
                                                                                        if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), v134 = v133, objc_msgSend(v5, "shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), v134 == v135))
                                                                                        {
                                                                                          if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), v137 = v136, objc_msgSend(v5,
                                                                                                  "shareCountGivenSceneCa"
                                                                                                  "tegoryInLastMonthNorma"
                                                                                                  "lizedAcrossItems"),
                                                                                                v137 == v138))
                                                                                          {
                                                                                            if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), v140 = v139, objc_msgSend(v5, "shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), v140 == v141))
                                                                                            {
                                                                                              if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")
                                                                                                && !objc_msgSend(v5, "hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")
                                                                                                || -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), v143 = v142, objc_msgSend(v5, "shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), v143 == v144))
                                                                                              {
                                                                                                if (!-[BMAeroMLPhotosSearchDataCorrelations hasClipScore](self, "hasClipScore") && !objc_msgSend(v5, "hasClipScore") || -[BMAeroMLPhotosSearchDataCorrelations hasClipScore](self, "hasClipScore") && objc_msgSend(v5, "hasClipScore") && (-[BMAeroMLPhotosSearchDataCorrelations clipScore](self, "clipScore"), v146 = v145, objc_msgSend(v5, "clipScore"), v146 == v147))
                                                                                                {
                                                                                                  if (!-[BMAeroMLPhotosSearchDataCorrelations hasCorrelationMetricVersion](self, "hasCorrelationMetricVersion") && !objc_msgSend(v5, "hasCorrelationMetricVersion") || -[BMAeroMLPhotosSearchDataCorrelations hasCorrelationMetricVersion](self, "hasCorrelationMetricVersion") && objc_msgSend(v5, "hasCorrelationMetricVersion") && (v148 = -[BMAeroMLPhotosSearchDataCorrelations correlationMetricVersion](self, "correlationMetricVersion"), v148 == objc_msgSend(v5, "correlationMetricVersion")))
                                                                                                  {
                                                                                                    if (!-[BMAeroMLPhotosSearchDataCorrelations hasCorrelationMetricWindowInDays](self, "hasCorrelationMetricWindowInDays") && !objc_msgSend(v5, "hasCorrelationMetricWindowInDays"))
                                                                                                    {
                                                                                                      v12 = 1;
                                                                                                      goto LABEL_249;
                                                                                                    }
                                                                                                    if (-[BMAeroMLPhotosSearchDataCorrelations hasCorrelationMetricWindowInDays](self, "hasCorrelationMetricWindowInDays") && objc_msgSend(v5, "hasCorrelationMetricWindowInDays"))
                                                                                                    {
                                                                                                      v149 = -[BMAeroMLPhotosSearchDataCorrelations correlationMetricWindowInDays](self, "correlationMetricWindowInDays");
                                                                                                      v12 = v149 == objc_msgSend(v5, "correlationMetricWindowInDays");
LABEL_249:

                                                                                                      goto LABEL_250;
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
    }
LABEL_248:
    v12 = 0;
    goto LABEL_249;
  }
  v12 = 0;
LABEL_250:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)searchSessionUUID
{
  return self->_searchSessionUUID;
}

- (int)uiSurface
{
  return self->_uiSurface;
}

- (double)matchedPeopleRatio
{
  return self->_matchedPeopleRatio;
}

- (BOOL)hasMatchedPeopleRatio
{
  return self->_hasMatchedPeopleRatio;
}

- (void)setHasMatchedPeopleRatio:(BOOL)a3
{
  self->_hasMatchedPeopleRatio = a3;
}

- (double)matchedLocationRatio
{
  return self->_matchedLocationRatio;
}

- (BOOL)hasMatchedLocationRatio
{
  return self->_hasMatchedLocationRatio;
}

- (void)setHasMatchedLocationRatio:(BOOL)a3
{
  self->_hasMatchedLocationRatio = a3;
}

- (double)matchedSceneRatio
{
  return self->_matchedSceneRatio;
}

- (BOOL)hasMatchedSceneRatio
{
  return self->_hasMatchedSceneRatio;
}

- (void)setHasMatchedSceneRatio:(BOOL)a3
{
  self->_hasMatchedSceneRatio = a3;
}

- (double)matchedSceneConfidence
{
  return self->_matchedSceneConfidence;
}

- (BOOL)hasMatchedSceneConfidence
{
  return self->_hasMatchedSceneConfidence;
}

- (void)setHasMatchedSceneConfidence:(BOOL)a3
{
  self->_hasMatchedSceneConfidence = a3;
}

- (double)matchedSceneBoundingBox
{
  return self->_matchedSceneBoundingBox;
}

- (BOOL)hasMatchedSceneBoundingBox
{
  return self->_hasMatchedSceneBoundingBox;
}

- (void)setHasMatchedSceneBoundingBox:(BOOL)a3
{
  self->_hasMatchedSceneBoundingBox = a3;
}

- (double)matchedOCRCharacterRatio
{
  return self->_matchedOCRCharacterRatio;
}

- (BOOL)hasMatchedOCRCharacterRatio
{
  return self->_hasMatchedOCRCharacterRatio;
}

- (void)setHasMatchedOCRCharacterRatio:(BOOL)a3
{
  self->_hasMatchedOCRCharacterRatio = a3;
}

- (double)matchedOCRImportance
{
  return self->_matchedOCRImportance;
}

- (BOOL)hasMatchedOCRImportance
{
  return self->_hasMatchedOCRImportance;
}

- (void)setHasMatchedOCRImportance:(BOOL)a3
{
  self->_hasMatchedOCRImportance = a3;
}

- (unsigned)matchedFieldsCount
{
  return self->_matchedFieldsCount;
}

- (BOOL)hasMatchedFieldsCount
{
  return self->_hasMatchedFieldsCount;
}

- (void)setHasMatchedFieldsCount:(BOOL)a3
{
  self->_hasMatchedFieldsCount = a3;
}

- (double)L1Score
{
  return self->_L1Score;
}

- (BOOL)hasL1Score
{
  return self->_hasL1Score;
}

- (void)setHasL1Score:(BOOL)a3
{
  self->_hasL1Score = a3;
}

- (double)freshness
{
  return self->_freshness;
}

- (BOOL)hasFreshness
{
  return self->_hasFreshness;
}

- (void)setHasFreshness:(BOOL)a3
{
  self->_hasFreshness = a3;
}

- (BOOL)favorited
{
  return self->_favorited;
}

- (BOOL)hasFavorited
{
  return self->_hasFavorited;
}

- (void)setHasFavorited:(BOOL)a3
{
  self->_hasFavorited = a3;
}

- (double)aestheticScore
{
  return self->_aestheticScore;
}

- (BOOL)hasAestheticScore
{
  return self->_hasAestheticScore;
}

- (void)setHasAestheticScore:(BOOL)a3
{
  self->_hasAestheticScore = a3;
}

- (double)curationScore
{
  return self->_curationScore;
}

- (BOOL)hasCurationScore
{
  return self->_hasCurationScore;
}

- (void)setHasCurationScore:(BOOL)a3
{
  self->_hasCurationScore = a3;
}

- (double)hasEverClickInLastWeek
{
  return self->_hasEverClickInLastWeek;
}

- (BOOL)hasHasEverClickInLastWeek
{
  return self->_hasHasEverClickInLastWeek;
}

- (void)setHasHasEverClickInLastWeek:(BOOL)a3
{
  self->_hasHasEverClickInLastWeek = a3;
}

- (double)hasEverClickInLastMonth
{
  return self->_hasEverClickInLastMonth;
}

- (BOOL)hasHasEverClickInLastMonth
{
  return self->_hasHasEverClickInLastMonth;
}

- (void)setHasHasEverClickInLastMonth:(BOOL)a3
{
  self->_hasHasEverClickInLastMonth = a3;
}

- (double)hasEverShareInLastWeek
{
  return self->_hasEverShareInLastWeek;
}

- (BOOL)hasHasEverShareInLastWeek
{
  return self->_hasHasEverShareInLastWeek;
}

- (void)setHasHasEverShareInLastWeek:(BOOL)a3
{
  self->_hasHasEverShareInLastWeek = a3;
}

- (double)hasEverShareInLastMonth
{
  return self->_hasEverShareInLastMonth;
}

- (BOOL)hasHasEverShareInLastMonth
{
  return self->_hasHasEverShareInLastMonth;
}

- (void)setHasHasEverShareInLastMonth:(BOOL)a3
{
  self->_hasHasEverShareInLastMonth = a3;
}

- (double)clickCountInLastWeekNormalizedAcrossItems
{
  return self->_clickCountInLastWeekNormalizedAcrossItems;
}

- (BOOL)hasClickCountInLastWeekNormalizedAcrossItems
{
  return self->_hasClickCountInLastWeekNormalizedAcrossItems;
}

- (void)setHasClickCountInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountInLastWeekNormalizedAcrossItems = a3;
}

- (double)clickCountInLastMonthNormalizedAcrossItems
{
  return self->_clickCountInLastMonthNormalizedAcrossItems;
}

- (BOOL)hasClickCountInLastMonthNormalizedAcrossItems
{
  return self->_hasClickCountInLastMonthNormalizedAcrossItems;
}

- (void)setHasClickCountInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountInLastMonthNormalizedAcrossItems = a3;
}

- (double)shareCountInLastWeekNormalizedAcrossItems
{
  return self->_shareCountInLastWeekNormalizedAcrossItems;
}

- (BOOL)hasShareCountInLastWeekNormalizedAcrossItems
{
  return self->_hasShareCountInLastWeekNormalizedAcrossItems;
}

- (void)setHasShareCountInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountInLastWeekNormalizedAcrossItems = a3;
}

- (double)shareCountInLastMonthNormalizedAcrossItems
{
  return self->_shareCountInLastMonthNormalizedAcrossItems;
}

- (BOOL)hasShareCountInLastMonthNormalizedAcrossItems
{
  return self->_hasShareCountInLastMonthNormalizedAcrossItems;
}

- (void)setHasShareCountInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountInLastMonthNormalizedAcrossItems = a3;
}

- (double)clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
}

- (BOOL)hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems
{
  return self->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
}

- (void)setHasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = a3;
}

- (double)clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
}

- (BOOL)hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems
{
  return self->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
}

- (void)setHasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = a3;
}

- (double)clickCountGivenLocationInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems;
}

- (BOOL)hasClickCountGivenLocationInLastWeekNormalizedAcrossItems
{
  return self->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems;
}

- (void)setHasClickCountGivenLocationInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems = a3;
}

- (double)clickCountGivenLocationInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems;
}

- (BOOL)hasClickCountGivenLocationInLastMonthNormalizedAcrossItems
{
  return self->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems;
}

- (void)setHasClickCountGivenLocationInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems = a3;
}

- (double)clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
}

- (BOOL)hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems
{
  return self->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
}

- (void)setHasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (double)clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
}

- (BOOL)hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems
{
  return self->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
}

- (void)setHasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (double)clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
}

- (BOOL)hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems
{
  return self->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
}

- (void)setHasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (double)clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
}

- (BOOL)hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems
{
  return self->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
}

- (void)setHasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (double)clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
}

- (BOOL)hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems
{
  return self->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
}

- (void)setHasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (double)clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
}

- (BOOL)hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems
{
  return self->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
}

- (void)setHasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (double)clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
}

- (BOOL)hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems
{
  return self->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
}

- (void)setHasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (double)clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
}

- (BOOL)hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems
{
  return self->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
}

- (void)setHasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (double)shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
}

- (BOOL)hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems
{
  return self->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
}

- (void)setHasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = a3;
}

- (double)shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
}

- (BOOL)hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems
{
  return self->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
}

- (void)setHasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = a3;
}

- (double)shareCountGivenLocationInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems;
}

- (BOOL)hasShareCountGivenLocationInLastWeekNormalizedAcrossItems
{
  return self->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems;
}

- (void)setHasShareCountGivenLocationInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems = a3;
}

- (double)shareCountGivenLocationInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems;
}

- (BOOL)hasShareCountGivenLocationInLastMonthNormalizedAcrossItems
{
  return self->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems;
}

- (void)setHasShareCountGivenLocationInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems = a3;
}

- (double)shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
}

- (BOOL)hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems
{
  return self->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
}

- (void)setHasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (double)shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
}

- (BOOL)hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems
{
  return self->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
}

- (void)setHasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (double)shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
}

- (BOOL)hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems
{
  return self->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
}

- (void)setHasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (double)shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
}

- (BOOL)hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems
{
  return self->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
}

- (void)setHasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (double)shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
}

- (BOOL)hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems
{
  return self->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
}

- (void)setHasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (double)shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
}

- (BOOL)hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems
{
  return self->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
}

- (void)setHasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (double)shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
}

- (BOOL)hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems
{
  return self->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
}

- (void)setHasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (double)shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
}

- (BOOL)hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems
{
  return self->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
}

- (void)setHasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (double)clipScore
{
  return self->_clipScore;
}

- (BOOL)hasClipScore
{
  return self->_hasClipScore;
}

- (void)setHasClipScore:(BOOL)a3
{
  self->_hasClipScore = a3;
}

- (unsigned)correlationMetricVersion
{
  return self->_correlationMetricVersion;
}

- (BOOL)hasCorrelationMetricVersion
{
  return self->_hasCorrelationMetricVersion;
}

- (void)setHasCorrelationMetricVersion:(BOOL)a3
{
  self->_hasCorrelationMetricVersion = a3;
}

- (unsigned)correlationMetricWindowInDays
{
  return self->_correlationMetricWindowInDays;
}

- (BOOL)hasCorrelationMetricWindowInDays
{
  return self->_hasCorrelationMetricWindowInDays;
}

- (void)setHasCorrelationMetricWindowInDays:(BOOL)a3
{
  self->_hasCorrelationMetricWindowInDays = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSessionUUID, 0);
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

    v4 = -[BMAeroMLPhotosSearchDataCorrelations initByReadFrom:]([BMAeroMLPhotosSearchDataCorrelations alloc], "initByReadFrom:", v7);
    v4[17] = 0;

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
  id v12;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
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
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[52];

  v54[50] = *MEMORY[0x1E0C80C00];
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("searchSessionUUID"), 2, 0, 1, 13, 0);
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uiSurface"), 0, 0, 2, 4, 0);
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedPeopleRatio"), 1, 0, 3, 0, 0);
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedLocationRatio"), 1, 0, 4, 0, 0);
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedSceneRatio"), 1, 0, 5, 0, 0);
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedSceneConfidence"), 1, 0, 6, 0, 0);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedSceneBoundingBox"), 1, 0, 7, 0, 0);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedOCRCharacterRatio"), 1, 0, 8, 0, 0);
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedOCRImportance"), 1, 0, 9, 0, 0);
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedFieldsCount"), 0, 0, 10, 4, 0);
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("L1Score"), 1, 0, 11, 0, 0);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("freshness"), 1, 0, 12, 0, 0);
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("favorited"), 0, 0, 13, 12, 0);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("aestheticScore"), 1, 0, 14, 0, 0);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("curationScore"), 1, 0, 15, 0, 0);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasEverClickInLastWeek"), 1, 0, 16, 0, 0);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasEverClickInLastMonth"), 1, 0, 17, 0, 0);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasEverShareInLastWeek"), 1, 0, 18, 0, 0);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasEverShareInLastMonth"), 1, 0, 19, 0, 0);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountInLastWeekNormalizedAcrossItems"), 1, 0, 20, 0, 0);
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountInLastMonthNormalizedAcrossItems"), 1, 0, 21, 0, 0);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountInLastWeekNormalizedAcrossItems"), 1, 0, 22, 0, 0);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountInLastMonthNormalizedAcrossItems"), 1, 0, 23, 0, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), 1, 0, 24, 0, 0);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), 1, 0, 25, 0, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenLocationInLastWeekNormalizedAcrossItems"), 1, 0, 26, 0, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenLocationInLastMonthNormalizedAcrossItems"), 1, 0, 27, 0, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), 1, 0, 28, 0, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), 1, 0, 29, 0, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), 1, 0, 30, 0, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), 1, 0, 31, 0, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), 1, 0, 32, 0, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), 1, 0, 33, 0, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), 1, 0, 34, 0, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), 1, 0, 35, 0, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), 1, 0, 36, 0, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), 1, 0, 37, 0, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenLocationInLastWeekNormalizedAcrossItems"), 1, 0, 38, 0, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenLocationInLastMonthNormalizedAcrossItems"), 1, 0, 39, 0, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), 1, 0, 40, 0, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), 1, 0, 41, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), 1, 0, 42, 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), 1, 0, 43, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), 1, 0, 44, 0, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), 1, 0, 45, 0, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), 1, 0, 46, 0, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), 1, 0, 47, 0, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clipScore"), 1, 0, 48, 0, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("correlationMetricVersion"), 0, 0, 49, 4, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("correlationMetricWindowInDays"), 0, 0, 50, 4, 0);
  v54[0] = v52;
  v54[1] = v53;
  v54[2] = v51;
  v54[3] = v50;
  v54[4] = v49;
  v54[5] = v48;
  v54[6] = v47;
  v54[7] = v46;
  v54[8] = v45;
  v54[9] = v44;
  v54[10] = v43;
  v54[11] = v42;
  v54[12] = v41;
  v54[13] = v40;
  v54[14] = v39;
  v54[15] = v38;
  v54[16] = v37;
  v54[17] = v36;
  v54[18] = v35;
  v54[19] = v34;
  v54[20] = v33;
  v54[21] = v32;
  v54[22] = v31;
  v54[23] = v30;
  v54[24] = v29;
  v54[25] = v28;
  v54[26] = v27;
  v54[27] = v26;
  v54[28] = v25;
  v54[29] = v24;
  v54[30] = v23;
  v54[31] = v22;
  v54[32] = v21;
  v54[33] = v20;
  v54[34] = v19;
  v54[35] = v18;
  v54[36] = v17;
  v54[37] = v16;
  v54[38] = v15;
  v54[39] = v14;
  v54[40] = v2;
  v54[41] = v3;
  v54[42] = v4;
  v54[43] = v5;
  v54[44] = v6;
  v54[45] = v7;
  v54[46] = v8;
  v54[47] = v13;
  v54[48] = v9;
  v54[49] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 50);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B880;
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
  id v13;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
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
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[52];

  v54[50] = *MEMORY[0x1E0C80C00];
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("searchSessionUUID"), 1, 13, 0);
  v54[0] = v53;
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uiSurface"), 2, 4, 0);
  v54[1] = v52;
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedPeopleRatio"), 3, 0, 0);
  v54[2] = v51;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedLocationRatio"), 4, 0, 0);
  v54[3] = v50;
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedSceneRatio"), 5, 0, 0);
  v54[4] = v49;
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedSceneConfidence"), 6, 0, 0);
  v54[5] = v48;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedSceneBoundingBox"), 7, 0, 0);
  v54[6] = v47;
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedOCRCharacterRatio"), 8, 0, 0);
  v54[7] = v46;
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedOCRImportance"), 9, 0, 0);
  v54[8] = v45;
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedFieldsCount"), 10, 4, 0);
  v54[9] = v44;
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("L1Score"), 11, 0, 0);
  v54[10] = v43;
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("freshness"), 12, 0, 0);
  v54[11] = v42;
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("favorited"), 13, 12, 0);
  v54[12] = v41;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("aestheticScore"), 14, 0, 0);
  v54[13] = v40;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("curationScore"), 15, 0, 0);
  v54[14] = v39;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasEverClickInLastWeek"), 16, 0, 0);
  v54[15] = v38;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasEverClickInLastMonth"), 17, 0, 0);
  v54[16] = v37;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasEverShareInLastWeek"), 18, 0, 0);
  v54[17] = v36;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasEverShareInLastMonth"), 19, 0, 0);
  v54[18] = v35;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountInLastWeekNormalizedAcrossItems"), 20, 0, 0);
  v54[19] = v34;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountInLastMonthNormalizedAcrossItems"), 21, 0, 0);
  v54[20] = v33;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountInLastWeekNormalizedAcrossItems"), 22, 0, 0);
  v54[21] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountInLastMonthNormalizedAcrossItems"), 23, 0, 0);
  v54[22] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), 24, 0, 0);
  v54[23] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), 25, 0, 0);
  v54[24] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenLocationInLastWeekNormalizedAcrossItems"), 26, 0, 0);
  v54[25] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenLocationInLastMonthNormalizedAcrossItems"), 27, 0, 0);
  v54[26] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), 28, 0, 0);
  v54[27] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), 29, 0, 0);
  v54[28] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), 30, 0, 0);
  v54[29] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), 31, 0, 0);
  v54[30] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), 32, 0, 0);
  v54[31] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), 33, 0, 0);
  v54[32] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), 34, 0, 0);
  v54[33] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), 35, 0, 0);
  v54[34] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), 36, 0, 0);
  v54[35] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), 37, 0, 0);
  v54[36] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenLocationInLastWeekNormalizedAcrossItems"), 38, 0, 0);
  v54[37] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenLocationInLastMonthNormalizedAcrossItems"), 39, 0, 0);
  v54[38] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), 40, 0, 0);
  v54[39] = v14;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), 41, 0, 0);
  v54[40] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), 42, 0, 0);
  v54[41] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), 43, 0, 0);
  v54[42] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), 44, 0, 0);
  v54[43] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), 45, 0, 0);
  v54[44] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), 46, 0, 0);
  v54[45] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), 47, 0, 0);
  v54[46] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clipScore"), 48, 0, 0);
  v54[47] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("correlationMetricVersion"), 49, 4, 0);
  v54[48] = v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("correlationMetricWindowInDays"), 50, 4, 0);
  v54[49] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 50);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
