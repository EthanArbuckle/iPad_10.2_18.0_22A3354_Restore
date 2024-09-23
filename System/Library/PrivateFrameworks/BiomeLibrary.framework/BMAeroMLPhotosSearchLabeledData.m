@implementation BMAeroMLPhotosSearchLabeledData

- (BMAeroMLPhotosSearchLabeledData)initWithSearchSessionUUID:(id)a3 uiSurface:(int)a4 matchedPeopleRatio:(id)a5 matchedLocationRatio:(id)a6 matchedSceneRatio:(id)a7 matchedSceneConfidence:(id)a8 matchedSceneBoundingBox:(id)a9 matchedOCRCharacterRatio:(id)a10 matchedOCRImportance:(id)a11 matchedFieldsCount:(id)a12 L1Score:(id)a13 freshness:(id)a14 favorited:(id)a15 aestheticScore:(id)a16 curationScore:(id)a17 hasEverClickInLastWeek:(id)a18 hasEverClickInLastMonth:(id)a19 hasEverShareInLastWeek:(id)a20 hasEverShareInLastMonth:(id)a21 clickCountInLastWeekNormalizedAcrossItems:(id)a22 clickCountInLastMonthNormalizedAcrossItems:(id)a23 shareCountInLastWeekNormalizedAcrossItems:(id)a24 shareCountInLastMonthNormalizedAcrossItems:(id)a25 clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(id)a26 clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(id)a27 clickCountGivenLocationInLastWeekNormalizedAcrossItems:(id)a28 clickCountGivenLocationInLastMonthNormalizedAcrossItems:(id)a29 clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(id)a30 clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(id)a31 clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(id)a32 clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(id)a33 clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(id)a34 clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(id)a35 clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(id)a36 clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(id)a37 shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(id)a38 shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(id)a39 shareCountGivenLocationInLastWeekNormalizedAcrossItems:(id)a40 shareCountGivenLocationInLastMonthNormalizedAcrossItems:(id)a41 shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(id)a42 shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(id)a43 shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(id)a44 shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(id)a45 shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(id)a46 shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(id)a47 shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(id)a48 shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(id)a49 clipScore:(id)a50 clicked:(id)a51 clickOrder:(id)a52 itemPosition:(id)a53 L2ModelScore:(id)a54 isDuplicate:(id)a55 isCompleteMatch:(id)a56
{
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  BMAeroMLPhotosSearchLabeledData *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  unsigned int v76;
  double v77;
  void *v78;
  id v79;
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
  unsigned int v116;
  unsigned int v117;
  double v118;
  double v119;
  double v120;
  BMAeroMLPhotosSearchLabeledData *v121;
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
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v168;
  id v169;
  id v170;
  objc_super v171;

  v125 = a3;
  v169 = a5;
  v170 = a6;
  v166 = a7;
  v168 = a8;
  v165 = a9;
  v164 = a10;
  v163 = a11;
  v162 = a12;
  v126 = a13;
  v60 = a14;
  v161 = a15;
  v61 = a16;
  v62 = a17;
  v63 = a18;
  v64 = a19;
  v65 = a20;
  v66 = a21;
  v67 = a22;
  v160 = a23;
  v159 = a24;
  v158 = a25;
  v157 = a26;
  v156 = a27;
  v155 = a28;
  v154 = a29;
  v153 = a30;
  v152 = a31;
  v151 = a32;
  v150 = a33;
  v149 = a34;
  v148 = a35;
  v147 = a36;
  v146 = a37;
  v145 = a38;
  v144 = a39;
  v143 = a40;
  v142 = a41;
  v141 = a42;
  v140 = a43;
  v139 = a44;
  v138 = a45;
  v137 = a46;
  v136 = a47;
  v135 = a48;
  v134 = a49;
  v133 = a50;
  v132 = a51;
  v131 = a52;
  v130 = a53;
  v129 = a54;
  v128 = a55;
  v127 = a56;
  v171.receiver = self;
  v171.super_class = (Class)BMAeroMLPhotosSearchLabeledData;
  v68 = -[BMEventBase init](&v171, sel_init);

  if (v68)
  {
    v68->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v68->_searchSessionUUID, a3);
    v68->_uiSurface = a4;
    if (v169)
    {
      v68->_hasMatchedPeopleRatio = 1;
      objc_msgSend(v169, "doubleValue");
    }
    else
    {
      v68->_hasMatchedPeopleRatio = 0;
      v69 = -1.0;
    }
    v68->_matchedPeopleRatio = v69;
    if (v170)
    {
      v68->_hasMatchedLocationRatio = 1;
      objc_msgSend(v170, "doubleValue");
    }
    else
    {
      v68->_hasMatchedLocationRatio = 0;
      v70 = -1.0;
    }
    v68->_matchedLocationRatio = v70;
    if (v166)
    {
      v68->_hasMatchedSceneRatio = 1;
      objc_msgSend(v166, "doubleValue");
    }
    else
    {
      v68->_hasMatchedSceneRatio = 0;
      v71 = -1.0;
    }
    v68->_matchedSceneRatio = v71;
    if (v168)
    {
      v68->_hasMatchedSceneConfidence = 1;
      objc_msgSend(v168, "doubleValue");
    }
    else
    {
      v68->_hasMatchedSceneConfidence = 0;
      v72 = -1.0;
    }
    v68->_matchedSceneConfidence = v72;
    if (v165)
    {
      v68->_hasMatchedSceneBoundingBox = 1;
      objc_msgSend(v165, "doubleValue");
    }
    else
    {
      v68->_hasMatchedSceneBoundingBox = 0;
      v73 = -1.0;
    }
    v68->_matchedSceneBoundingBox = v73;
    if (v164)
    {
      v68->_hasMatchedOCRCharacterRatio = 1;
      objc_msgSend(v164, "doubleValue");
    }
    else
    {
      v68->_hasMatchedOCRCharacterRatio = 0;
      v74 = -1.0;
    }
    v68->_matchedOCRCharacterRatio = v74;
    if (v163)
    {
      v68->_hasMatchedOCRImportance = 1;
      objc_msgSend(v163, "doubleValue");
    }
    else
    {
      v68->_hasMatchedOCRImportance = 0;
      v75 = -1.0;
    }
    v68->_matchedOCRImportance = v75;
    v76 = v162;
    if (v162)
    {
      v68->_hasMatchedFieldsCount = 1;
      v76 = objc_msgSend(v162, "unsignedIntValue");
    }
    else
    {
      v68->_hasMatchedFieldsCount = 0;
    }
    v68->_matchedFieldsCount = v76;
    if (v126)
    {
      v68->_hasL1Score = 1;
      objc_msgSend(v126, "doubleValue");
    }
    else
    {
      v68->_hasL1Score = 0;
      v77 = -1.0;
    }
    v78 = v61;
    v68->_L1Score = v77;
    if (v60)
    {
      v68->_hasFreshness = 1;
      v79 = v60;
      objc_msgSend(v60, "doubleValue");
    }
    else
    {
      v79 = 0;
      v68->_hasFreshness = 0;
      v80 = -1.0;
    }
    v68->_freshness = v80;
    if (v161)
    {
      v68->_hasFavorited = 1;
      v68->_favorited = objc_msgSend(v161, "BOOLValue");
    }
    else
    {
      v68->_hasFavorited = 0;
      v68->_favorited = 0;
    }
    v60 = v79;
    v61 = v78;
    if (v78)
    {
      v68->_hasAestheticScore = 1;
      objc_msgSend(v78, "doubleValue");
    }
    else
    {
      v68->_hasAestheticScore = 0;
      v81 = -1.0;
    }
    v68->_aestheticScore = v81;
    if (v62)
    {
      v68->_hasCurationScore = 1;
      objc_msgSend(v62, "doubleValue");
    }
    else
    {
      v68->_hasCurationScore = 0;
      v82 = -1.0;
    }
    v68->_curationScore = v82;
    if (v63)
    {
      v68->_hasHasEverClickInLastWeek = 1;
      objc_msgSend(v63, "doubleValue");
    }
    else
    {
      v68->_hasHasEverClickInLastWeek = 0;
      v83 = -1.0;
    }
    v68->_hasEverClickInLastWeek = v83;
    if (v64)
    {
      v68->_hasHasEverClickInLastMonth = 1;
      objc_msgSend(v64, "doubleValue");
    }
    else
    {
      v68->_hasHasEverClickInLastMonth = 0;
      v84 = -1.0;
    }
    v68->_hasEverClickInLastMonth = v84;
    if (v65)
    {
      v68->_hasHasEverShareInLastWeek = 1;
      objc_msgSend(v65, "doubleValue");
    }
    else
    {
      v68->_hasHasEverShareInLastWeek = 0;
      v85 = -1.0;
    }
    v68->_hasEverShareInLastWeek = v85;
    if (v66)
    {
      v68->_hasHasEverShareInLastMonth = 1;
      objc_msgSend(v66, "doubleValue");
    }
    else
    {
      v68->_hasHasEverShareInLastMonth = 0;
      v86 = -1.0;
    }
    v68->_hasEverShareInLastMonth = v86;
    if (v67)
    {
      v68->_hasClickCountInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v67, "doubleValue");
    }
    else
    {
      v68->_hasClickCountInLastWeekNormalizedAcrossItems = 0;
      v87 = -1.0;
    }
    v68->_clickCountInLastWeekNormalizedAcrossItems = v87;
    if (v160)
    {
      v68->_hasClickCountInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v160, "doubleValue");
    }
    else
    {
      v68->_hasClickCountInLastMonthNormalizedAcrossItems = 0;
      v88 = -1.0;
    }
    v68->_clickCountInLastMonthNormalizedAcrossItems = v88;
    if (v159)
    {
      v68->_hasShareCountInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v159, "doubleValue");
    }
    else
    {
      v68->_hasShareCountInLastWeekNormalizedAcrossItems = 0;
      v89 = -1.0;
    }
    v68->_shareCountInLastWeekNormalizedAcrossItems = v89;
    if (v158)
    {
      v68->_hasShareCountInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v158, "doubleValue");
    }
    else
    {
      v68->_hasShareCountInLastMonthNormalizedAcrossItems = 0;
      v90 = -1.0;
    }
    v68->_shareCountInLastMonthNormalizedAcrossItems = v90;
    if (v157)
    {
      v68->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v157, "doubleValue");
    }
    else
    {
      v68->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 0;
      v91 = -1.0;
    }
    v68->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = v91;
    if (v156)
    {
      v68->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v156, "doubleValue");
    }
    else
    {
      v68->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 0;
      v92 = -1.0;
    }
    v68->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = v92;
    if (v155)
    {
      v68->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v155, "doubleValue");
    }
    else
    {
      v68->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems = 0;
      v93 = -1.0;
    }
    v68->_clickCountGivenLocationInLastWeekNormalizedAcrossItems = v93;
    if (v154)
    {
      v68->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v154, "doubleValue");
    }
    else
    {
      v68->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems = 0;
      v94 = -1.0;
    }
    v68->_clickCountGivenLocationInLastMonthNormalizedAcrossItems = v94;
    if (v153)
    {
      v68->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v153, "doubleValue");
    }
    else
    {
      v68->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 0;
      v95 = -1.0;
    }
    v68->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = v95;
    if (v152)
    {
      v68->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v152, "doubleValue");
    }
    else
    {
      v68->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 0;
      v96 = -1.0;
    }
    v68->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = v96;
    if (v151)
    {
      v68->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v151, "doubleValue");
    }
    else
    {
      v68->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 0;
      v97 = -1.0;
    }
    v68->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = v97;
    if (v150)
    {
      v68->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v150, "doubleValue");
    }
    else
    {
      v68->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 0;
      v98 = -1.0;
    }
    v68->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = v98;
    if (v149)
    {
      v68->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v149, "doubleValue");
    }
    else
    {
      v68->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 0;
      v99 = -1.0;
    }
    v68->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = v99;
    if (v148)
    {
      v68->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v148, "doubleValue");
    }
    else
    {
      v68->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 0;
      v100 = -1.0;
    }
    v68->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = v100;
    if (v147)
    {
      v68->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v147, "doubleValue");
    }
    else
    {
      v68->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 0;
      v101 = -1.0;
    }
    v68->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = v101;
    if (v146)
    {
      v68->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v146, "doubleValue");
    }
    else
    {
      v68->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 0;
      v102 = -1.0;
    }
    v68->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = v102;
    if (v145)
    {
      v68->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v145, "doubleValue");
    }
    else
    {
      v68->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 0;
      v103 = -1.0;
    }
    v68->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = v103;
    if (v144)
    {
      v68->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v144, "doubleValue");
    }
    else
    {
      v68->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 0;
      v104 = -1.0;
    }
    v68->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = v104;
    if (v143)
    {
      v68->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v143, "doubleValue");
    }
    else
    {
      v68->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems = 0;
      v105 = -1.0;
    }
    v68->_shareCountGivenLocationInLastWeekNormalizedAcrossItems = v105;
    if (v142)
    {
      v68->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v142, "doubleValue");
    }
    else
    {
      v68->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems = 0;
      v106 = -1.0;
    }
    v68->_shareCountGivenLocationInLastMonthNormalizedAcrossItems = v106;
    if (v141)
    {
      v68->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v141, "doubleValue");
    }
    else
    {
      v68->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 0;
      v107 = -1.0;
    }
    v68->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = v107;
    if (v140)
    {
      v68->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v140, "doubleValue");
    }
    else
    {
      v68->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 0;
      v108 = -1.0;
    }
    v68->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = v108;
    if (v139)
    {
      v68->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v139, "doubleValue");
    }
    else
    {
      v68->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 0;
      v109 = -1.0;
    }
    v68->_shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = v109;
    if (v138)
    {
      v68->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v138, "doubleValue");
    }
    else
    {
      v68->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 0;
      v110 = -1.0;
    }
    v68->_shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = v110;
    if (v137)
    {
      v68->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v137, "doubleValue");
    }
    else
    {
      v68->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 0;
      v111 = -1.0;
    }
    v68->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = v111;
    if (v136)
    {
      v68->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v136, "doubleValue");
    }
    else
    {
      v68->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 0;
      v112 = -1.0;
    }
    v68->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = v112;
    if (v135)
    {
      v68->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 1;
      objc_msgSend(v135, "doubleValue");
    }
    else
    {
      v68->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 0;
      v113 = -1.0;
    }
    v68->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = v113;
    if (v134)
    {
      v68->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 1;
      objc_msgSend(v134, "doubleValue");
    }
    else
    {
      v68->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 0;
      v114 = -1.0;
    }
    v68->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = v114;
    if (v133)
    {
      v68->_hasClipScore = 1;
      objc_msgSend(v133, "doubleValue");
    }
    else
    {
      v68->_hasClipScore = 0;
      v115 = -1.0;
    }
    v68->_clipScore = v115;
    if (v132)
    {
      v68->_hasClicked = 1;
      v68->_clicked = objc_msgSend(v132, "BOOLValue");
    }
    else
    {
      v68->_hasClicked = 0;
      v68->_clicked = 0;
    }
    v116 = v131;
    if (v131)
    {
      v68->_hasClickOrder = 1;
      v116 = objc_msgSend(v131, "unsignedIntValue");
    }
    else
    {
      v68->_hasClickOrder = 0;
    }
    v68->_clickOrder = v116;
    v117 = v130;
    if (v130)
    {
      v68->_hasItemPosition = 1;
      v117 = objc_msgSend(v130, "unsignedIntValue");
    }
    else
    {
      v68->_hasItemPosition = 0;
    }
    v68->_itemPosition = v117;
    if (v129)
    {
      v68->_hasL2ModelScore = 1;
      objc_msgSend(v129, "doubleValue");
    }
    else
    {
      v68->_hasL2ModelScore = 0;
      v118 = -1.0;
    }
    v68->_L2ModelScore = v118;
    if (v128)
    {
      v68->_hasIsDuplicate = 1;
      objc_msgSend(v128, "doubleValue");
    }
    else
    {
      v68->_hasIsDuplicate = 0;
      v119 = -1.0;
    }
    v68->_isDuplicate = v119;
    if (v127)
    {
      v68->_hasIsCompleteMatch = 1;
      objc_msgSend(v127, "doubleValue");
    }
    else
    {
      v68->_hasIsCompleteMatch = 0;
      v120 = -1.0;
    }
    v68->_isCompleteMatch = v120;
  }
  v121 = v68;

  return v121;
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
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
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
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;

  v67 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAeroMLPhotosSearchLabeledData searchSessionUUID](self, "searchSessionUUID");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  BMAeroMLPhotosSearchLabeledDataUISurfaceTypeAsString(-[BMAeroMLPhotosSearchLabeledData uiSurface](self, "uiSurface"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData matchedPeopleRatio](self, "matchedPeopleRatio");
  objc_msgSend(v3, "numberWithDouble:");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData matchedLocationRatio](self, "matchedLocationRatio");
  objc_msgSend(v4, "numberWithDouble:");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData matchedSceneRatio](self, "matchedSceneRatio");
  objc_msgSend(v5, "numberWithDouble:");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData matchedSceneConfidence](self, "matchedSceneConfidence");
  objc_msgSend(v6, "numberWithDouble:");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData matchedSceneBoundingBox](self, "matchedSceneBoundingBox");
  objc_msgSend(v7, "numberWithDouble:");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData matchedOCRCharacterRatio](self, "matchedOCRCharacterRatio");
  objc_msgSend(v8, "numberWithDouble:");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData matchedOCRImportance](self, "matchedOCRImportance");
  objc_msgSend(v9, "numberWithDouble:");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchLabeledData matchedFieldsCount](self, "matchedFieldsCount"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData L1Score](self, "L1Score");
  objc_msgSend(v10, "numberWithDouble:");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData freshness](self, "freshness");
  objc_msgSend(v11, "numberWithDouble:");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchLabeledData favorited](self, "favorited"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData aestheticScore](self, "aestheticScore");
  objc_msgSend(v12, "numberWithDouble:");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData curationScore](self, "curationScore");
  objc_msgSend(v13, "numberWithDouble:");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData hasEverClickInLastWeek](self, "hasEverClickInLastWeek");
  objc_msgSend(v14, "numberWithDouble:");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData hasEverClickInLastMonth](self, "hasEverClickInLastMonth");
  objc_msgSend(v15, "numberWithDouble:");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData hasEverShareInLastWeek](self, "hasEverShareInLastWeek");
  objc_msgSend(v16, "numberWithDouble:");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData hasEverShareInLastMonth](self, "hasEverShareInLastMonth");
  objc_msgSend(v17, "numberWithDouble:");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData clickCountInLastWeekNormalizedAcrossItems](self, "clickCountInLastWeekNormalizedAcrossItems");
  objc_msgSend(v18, "numberWithDouble:");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData clickCountInLastMonthNormalizedAcrossItems](self, "clickCountInLastMonthNormalizedAcrossItems");
  objc_msgSend(v19, "numberWithDouble:");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData shareCountInLastWeekNormalizedAcrossItems](self, "shareCountInLastWeekNormalizedAcrossItems");
  objc_msgSend(v20, "numberWithDouble:");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData shareCountInLastMonthNormalizedAcrossItems](self, "shareCountInLastMonthNormalizedAcrossItems");
  objc_msgSend(v21, "numberWithDouble:");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems");
  objc_msgSend(v22, "numberWithDouble:");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems");
  objc_msgSend(v23, "numberWithDouble:");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData clickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "clickCountGivenLocationInLastWeekNormalizedAcrossItems");
  objc_msgSend(v24, "numberWithDouble:");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData clickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "clickCountGivenLocationInLastMonthNormalizedAcrossItems");
  objc_msgSend(v25, "numberWithDouble:");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems");
  objc_msgSend(v26, "numberWithDouble:");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems");
  objc_msgSend(v27, "numberWithDouble:");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems");
  objc_msgSend(v28, "numberWithDouble:");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems");
  objc_msgSend(v29, "numberWithDouble:");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems");
  objc_msgSend(v30, "numberWithDouble:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems");
  objc_msgSend(v31, "numberWithDouble:");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems");
  objc_msgSend(v32, "numberWithDouble:");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems");
  objc_msgSend(v33, "numberWithDouble:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems");
  objc_msgSend(v34, "numberWithDouble:");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems");
  objc_msgSend(v35, "numberWithDouble:");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData shareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "shareCountGivenLocationInLastWeekNormalizedAcrossItems");
  objc_msgSend(v36, "numberWithDouble:");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData shareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "shareCountGivenLocationInLastMonthNormalizedAcrossItems");
  objc_msgSend(v37, "numberWithDouble:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems");
  objc_msgSend(v38, "numberWithDouble:");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems");
  objc_msgSend(v39, "numberWithDouble:");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems");
  objc_msgSend(v40, "numberWithDouble:");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems");
  objc_msgSend(v41, "numberWithDouble:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems");
  objc_msgSend(v42, "numberWithDouble:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems");
  objc_msgSend(v43, "numberWithDouble:");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems");
  objc_msgSend(v44, "numberWithDouble:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems");
  objc_msgSend(v45, "numberWithDouble:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData clipScore](self, "clipScore");
  objc_msgSend(v46, "numberWithDouble:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchLabeledData clicked](self, "clicked"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchLabeledData clickOrder](self, "clickOrder"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchLabeledData itemPosition](self, "itemPosition"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData L2ModelScore](self, "L2ModelScore");
  objc_msgSend(v47, "numberWithDouble:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData isDuplicate](self, "isDuplicate");
  objc_msgSend(v49, "numberWithDouble:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchLabeledData isCompleteMatch](self, "isCompleteMatch");
  objc_msgSend(v51, "numberWithDouble:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (id)objc_msgSend(v67, "initWithFormat:", CFSTR("BMAeroMLPhotosSearchLabeledData with searchSessionUUID: %@, uiSurface: %@, matchedPeopleRatio: %@, matchedLocationRatio: %@, matchedSceneRatio: %@, matchedSceneConfidence: %@, matchedSceneBoundingBox: %@, matchedOCRCharacterRatio: %@, matchedOCRImportance: %@, matchedFieldsCount: %@, L1Score: %@, freshness: %@, favorited: %@, aestheticScore: %@, curationScore: %@, hasEverClickInLastWeek: %@, hasEverClickInLastMonth: %@, hasEverShareInLastWeek: %@, hasEverShareInLastMonth: %@, clickCountInLastWeekNormalizedAcrossItems: %@, clickCountInLastMonthNormalizedAcrossItems: %@, shareCountInLastWeekNormalizedAcrossItems: %@, shareCountInLastMonthNormalizedAcrossItems: %@, clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems: %@, clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems: %@, clickCountGivenLocationInLastWeekNormalizedAcrossItems: %@, clickCountGivenLocationInLastMonthNormalizedAcrossItems: %@, clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems: %@, clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems: %@, clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems: %@, clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems: %@, clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems: %@, clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems: %@, clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems: %@, clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems: %@, shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems: %@, shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems: %@, shareCountGivenLocationInLastWeekNormalizedAcrossItems: %@, shareCountGivenLocationInLastMonthNormalizedAcrossItems: %@, shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems: %@, shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems: %@, shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems: %@, shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems: %@, shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems: %@, shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems: %@, shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems: %@, shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems: %@, clipScore: %@, clicked: %@, clickOrder: %@, itemPosition: %@, L2ModelScore: %@, isDuplicate: %@, isCompleteMatch: %@"), v103, v106, v105, v104, v100, v102, v101, v97, v99, v98, v95, v96, v92, v94, v91, v93,
              v88,
              v90,
              v87,
              v86,
              v89,
              v83,
              v85,
              v82,
              v81,
              v80,
              v84,
              v77,
              v79,
              v76,
              v75,
              v74,
              v73,
              v78,
              v71,
              v72,
              v69,
              v66,
              v65,
              v64,
              v70,
              v63,
              v62,
              v59,
              v61,
              v60,
              v58,
              v57,
              v56,
              v55,
              v54,
              v48,
              v50,
              v52);

  return (NSString *)v68;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAeroMLPhotosSearchLabeledData *v5;
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
  uint64_t v136;
  unint64_t v137;
  char v138;
  char v139;
  unsigned int v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  char v144;
  char v145;
  unsigned int v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  char v150;
  uint64_t v151;
  unint64_t v152;
  uint64_t v153;
  unint64_t v154;
  uint64_t v155;
  unint64_t v156;
  uint64_t v157;
  BOOL v158;
  uint64_t v159;
  uint64_t v160;
  BMAeroMLPhotosSearchLabeledData *v161;
  objc_super v163;

  v4 = a3;
  v163.receiver = self;
  v163.super_class = (Class)BMAeroMLPhotosSearchLabeledData;
  v5 = -[BMEventBase init](&v163, sel_init);
  if (!v5)
    goto LABEL_332;
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
                  goto LABEL_209;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_209:
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
          v160 = 104;
          goto LABEL_328;
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
          v160 = 112;
          goto LABEL_328;
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
          v160 = 120;
          goto LABEL_328;
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
          v160 = 128;
          goto LABEL_328;
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
          v160 = 136;
          goto LABEL_328;
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
          v160 = 144;
          goto LABEL_328;
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
          v160 = 152;
          goto LABEL_328;
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
                  goto LABEL_215;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v46) = 0;
LABEL_215:
          v157 = 80;
          goto LABEL_233;
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
          v160 = 160;
          goto LABEL_328;
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
          v160 = 168;
          goto LABEL_328;
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
                  goto LABEL_219;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v57 = 0;
LABEL_219:
          v158 = v57 != 0;
          v159 = 26;
          goto LABEL_224;
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
          v160 = 176;
          goto LABEL_328;
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
          v160 = 184;
          goto LABEL_328;
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
          v160 = 192;
          goto LABEL_328;
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
          v160 = 200;
          goto LABEL_328;
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
          v160 = 208;
          goto LABEL_328;
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
          v160 = 216;
          goto LABEL_328;
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
          v160 = 224;
          goto LABEL_328;
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
          v160 = 232;
          goto LABEL_328;
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
          v160 = 240;
          goto LABEL_328;
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
          v160 = 248;
          goto LABEL_328;
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
          v160 = 256;
          goto LABEL_328;
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
          v160 = 264;
          goto LABEL_328;
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
          v160 = 272;
          goto LABEL_328;
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
          v160 = 280;
          goto LABEL_328;
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
          v160 = 288;
          goto LABEL_328;
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
          v160 = 296;
          goto LABEL_328;
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
          v160 = 304;
          goto LABEL_328;
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
          v160 = 312;
          goto LABEL_328;
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
          v160 = 320;
          goto LABEL_328;
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
          v160 = 328;
          goto LABEL_328;
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
          v160 = 336;
          goto LABEL_328;
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
          v160 = 344;
          goto LABEL_328;
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
          v160 = 352;
          goto LABEL_328;
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
          v160 = 360;
          goto LABEL_328;
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
          v160 = 368;
          goto LABEL_328;
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
          v160 = 376;
          goto LABEL_328;
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
          v160 = 384;
          goto LABEL_328;
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
          v160 = 392;
          goto LABEL_328;
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
          v160 = 400;
          goto LABEL_328;
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
          v160 = 408;
          goto LABEL_328;
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
          v160 = 416;
          goto LABEL_328;
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
          v160 = 424;
          goto LABEL_328;
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
          v160 = 432;
          goto LABEL_328;
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
          v160 = 440;
          goto LABEL_328;
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
          v160 = 448;
          goto LABEL_328;
        case 0x31u:
          v132 = 0;
          v133 = 0;
          v134 = 0;
          v5->_hasClicked = 1;
          while (2)
          {
            v135 = *v6;
            v136 = *(_QWORD *)&v4[v135];
            v137 = v136 + 1;
            if (v136 == -1 || v137 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v138 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v136);
              *(_QWORD *)&v4[v135] = v137;
              v134 |= (unint64_t)(v138 & 0x7F) << v132;
              if (v138 < 0)
              {
                v132 += 7;
                v17 = v133++ >= 9;
                if (v17)
                {
                  v134 = 0;
                  goto LABEL_223;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v134 = 0;
LABEL_223:
          v158 = v134 != 0;
          v159 = 63;
LABEL_224:
          *((_BYTE *)&v5->super.super.isa + v159) = v158;
          continue;
        case 0x32u:
          v139 = 0;
          v140 = 0;
          v46 = 0;
          v5->_hasClickOrder = 1;
          while (2)
          {
            v141 = *v6;
            v142 = *(_QWORD *)&v4[v141];
            v143 = v142 + 1;
            if (v142 == -1 || v143 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v144 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v142);
              *(_QWORD *)&v4[v141] = v143;
              v46 |= (unint64_t)(v144 & 0x7F) << v139;
              if (v144 < 0)
              {
                v139 += 7;
                v17 = v140++ >= 9;
                if (v17)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_228;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v46) = 0;
LABEL_228:
          v157 = 84;
          goto LABEL_233;
        case 0x33u:
          v145 = 0;
          v146 = 0;
          v46 = 0;
          v5->_hasItemPosition = 1;
          break;
        case 0x34u:
          v5->_hasL2ModelScore = 1;
          v151 = *v6;
          v152 = *(_QWORD *)&v4[v151];
          if (v152 <= 0xFFFFFFFFFFFFFFF7 && v152 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v152);
            *(_QWORD *)&v4[v151] = v152 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v160 = 456;
          goto LABEL_328;
        case 0x35u:
          v5->_hasIsDuplicate = 1;
          v153 = *v6;
          v154 = *(_QWORD *)&v4[v153];
          if (v154 <= 0xFFFFFFFFFFFFFFF7 && v154 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v154);
            *(_QWORD *)&v4[v153] = v154 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v160 = 464;
          goto LABEL_328;
        case 0x36u:
          v5->_hasIsCompleteMatch = 1;
          v155 = *v6;
          v156 = *(_QWORD *)&v4[v155];
          if (v156 <= 0xFFFFFFFFFFFFFFF7 && v156 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v156);
            *(_QWORD *)&v4[v155] = v156 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v160 = 472;
LABEL_328:
          *(Class *)((char *)&v5->super.super.isa + v160) = v31;
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_331;
          continue;
      }
      while (1)
      {
        v147 = *v6;
        v148 = *(_QWORD *)&v4[v147];
        v149 = v148 + 1;
        if (v148 == -1 || v149 > *(_QWORD *)&v4[*v7])
          break;
        v150 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v148);
        *(_QWORD *)&v4[v147] = v149;
        v46 |= (unint64_t)(v150 & 0x7F) << v145;
        if ((v150 & 0x80) == 0)
          goto LABEL_230;
        v145 += 7;
        v17 = v146++ >= 9;
        if (v17)
        {
          LODWORD(v46) = 0;
          goto LABEL_232;
        }
      }
      v4[*v8] = 1;
LABEL_230:
      if (v4[*v8])
        LODWORD(v46) = 0;
LABEL_232:
      v157 = 88;
LABEL_233:
      *(_DWORD *)((char *)&v5->super.super.isa + v157) = v46;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_331:
    v161 = 0;
  else
LABEL_332:
    v161 = v5;

  return v161;
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
  if (self->_hasClicked)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasClickOrder)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasItemPosition)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasL2ModelScore)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasIsDuplicate)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasIsCompleteMatch)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAeroMLPhotosSearchLabeledData writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAeroMLPhotosSearchLabeledData)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BMAeroMLPhotosSearchLabeledData *v18;
  id *v19;
  id v20;
  void *v21;
  id *v22;
  id *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  BMAeroMLPhotosSearchLabeledData *v57;
  uint64_t v58;
  id *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  id *v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id v74;
  uint64_t v75;
  id *v76;
  id v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  id *v85;
  id v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  id v94;
  id v95;
  uint64_t v96;
  id *v97;
  id v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  id v104;
  id v105;
  uint64_t v106;
  id *v107;
  id v108;
  void *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  id v113;
  uint64_t v114;
  id v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  id v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  void *v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  void *v171;
  uint64_t v172;
  void *v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;
  void *v177;
  id v178;
  id v179;
  void *v180;
  void *v181;
  void *v182;
  BMAeroMLPhotosSearchLabeledData *v183;
  uint64_t v184;
  id v185;
  void *v186;
  uint64_t v187;
  uint64_t v188;
  id v189;
  uint64_t v190;
  id v191;
  void *v192;
  uint64_t v193;
  uint64_t v194;
  id v195;
  uint64_t v196;
  id v197;
  void *v198;
  uint64_t v199;
  uint64_t v200;
  id v201;
  uint64_t v202;
  id v203;
  void *v204;
  void *v205;
  uint64_t v206;
  id v207;
  id v208;
  uint64_t v209;
  id v210;
  void *v211;
  void *v212;
  uint64_t v213;
  id v214;
  uint64_t v215;
  id *v216;
  id v217;
  void *v218;
  uint64_t v219;
  void *v220;
  uint64_t v221;
  id v222;
  uint64_t v223;
  id *v224;
  id v225;
  void *v226;
  uint64_t v227;
  uint64_t v228;
  id v229;
  uint64_t v230;
  id *v231;
  id v232;
  void *v233;
  void *v234;
  uint64_t v235;
  void *v236;
  uint64_t v237;
  id v238;
  uint64_t v239;
  id v240;
  void *v241;
  void *v242;
  uint64_t v243;
  uint64_t v244;
  id v245;
  uint64_t v246;
  id v247;
  void *v248;
  uint64_t v249;
  uint64_t v250;
  id v251;
  id v252;
  uint64_t v253;
  id v254;
  void *v255;
  uint64_t v256;
  uint64_t v257;
  id v258;
  uint64_t v259;
  id v260;
  void *v261;
  uint64_t v262;
  uint64_t v263;
  id v264;
  uint64_t v265;
  id v266;
  void *v267;
  uint64_t v268;
  uint64_t v269;
  id v270;
  uint64_t v271;
  id v272;
  void *v273;
  uint64_t v274;
  uint64_t v275;
  id v276;
  uint64_t v277;
  id v278;
  void *v279;
  uint64_t v280;
  uint64_t v281;
  id v282;
  uint64_t v283;
  id v284;
  void *v285;
  uint64_t v286;
  uint64_t v287;
  id v288;
  uint64_t v289;
  id v290;
  void *v291;
  uint64_t v292;
  uint64_t v293;
  id v294;
  uint64_t v295;
  id v296;
  void *v297;
  uint64_t v298;
  uint64_t v299;
  id v300;
  uint64_t v301;
  id v302;
  void *v303;
  uint64_t v304;
  uint64_t v305;
  id v306;
  uint64_t v307;
  id v308;
  void *v309;
  void *v310;
  uint64_t v311;
  uint64_t v312;
  id v313;
  uint64_t v314;
  id v315;
  void *v316;
  uint64_t v317;
  uint64_t v318;
  id v319;
  id v320;
  uint64_t v321;
  id v322;
  void *v323;
  uint64_t v324;
  uint64_t v325;
  id v326;
  uint64_t v327;
  id v328;
  void *v329;
  uint64_t v330;
  uint64_t v331;
  id v332;
  uint64_t v333;
  id v334;
  void *v335;
  uint64_t v336;
  uint64_t v337;
  id v338;
  uint64_t v339;
  id v340;
  void *v341;
  uint64_t v342;
  uint64_t v343;
  id v344;
  uint64_t v345;
  id v346;
  void *v347;
  void *v348;
  uint64_t v349;
  id v350;
  uint64_t v351;
  id v352;
  void *v353;
  uint64_t v354;
  id v355;
  uint64_t v356;
  id v357;
  void *v358;
  id v359;
  uint64_t v360;
  uint64_t v361;
  id v362;
  uint64_t v363;
  id v364;
  void *v365;
  uint64_t v366;
  uint64_t v367;
  id v368;
  uint64_t v369;
  id v370;
  void *v371;
  uint64_t v372;
  uint64_t v373;
  id v374;
  uint64_t v375;
  id v376;
  void *v377;
  uint64_t v378;
  uint64_t v379;
  id v380;
  uint64_t v381;
  id v382;
  void *v383;
  uint64_t v384;
  uint64_t v385;
  void *v386;
  BMAeroMLPhotosSearchLabeledData *v387;
  id *v388;
  id v389;
  uint64_t v390;
  id *v391;
  id v392;
  uint64_t v393;
  id v394;
  BMAeroMLPhotosSearchLabeledData *v395;
  id *v396;
  id v397;
  uint64_t v398;
  id v399;
  id *v400;
  id v401;
  uint64_t v402;
  id v403;
  id *v404;
  id v405;
  uint64_t v406;
  id v407;
  id v408;
  id v409;
  void *v410;
  id *v411;
  id v412;
  uint64_t v413;
  id v414;
  id v415;
  uint64_t v416;
  id v417;
  uint64_t v418;
  uint64_t v419;
  id v420;
  uint64_t v421;
  id v422;
  uint64_t v423;
  id v424;
  uint64_t v425;
  id v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  id v431;
  uint64_t v432;
  void *v433;
  void *v434;
  uint64_t v435;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  void *v475;
  void *v476;
  void *v477;
  id v478;
  void *v479;
  id v480;
  id v481;
  void *v482;
  id v483;
  void *v484;
  void *v485;
  id v486;
  id v487;
  void *v488;
  id v489;
  void *v490;
  id v491;
  void *v492;
  void *v493;
  id v494;
  void *v495;
  id v496;
  id v497;
  void *v498;
  id v499;
  void *v500;
  id v501;
  void *v502;
  id v503;
  void *v504;
  void *v505;
  id v506;
  void *v507;
  id v508;
  id v509;
  void *v510;
  id v511;
  void *v512;
  id v513;
  void *v514;
  id v515;
  void *v516;
  id v517;
  void *v518;
  void *v519;
  id v520;
  id v521;
  void *v522;
  id v523;
  void *v524;
  id v525;
  void *v526;
  id v527;
  void *v528;
  id v529;
  void *v530;
  id v531;
  void *v532;
  void *v533;
  void *v534;
  id v535;
  void *v536;
  id v537;
  void *v538;
  id v539;
  id v540;
  void *v541;
  id v542;
  void *v543;
  _QWORD *v544;
  void *v545;
  void *v546;
  id v547;
  void *v548;
  id v549;
  void *v550;
  id *v551;
  id *v552;
  id *v553;
  id *v554;
  id *v555;
  id *v556;
  id *v557;
  id v558;
  id v559;
  void *v560;
  id v561;
  id v562;
  id v563;
  void *v564;
  id v565;
  id v566;
  void *v567;
  id v568;
  id v569;
  void *v570;
  id v571;
  id v572;
  void *v573;
  id v574;
  id v575;
  id v576;
  void *v577;
  id v578;
  void *v579;
  void *v580;
  void *v581;
  void *v582;
  void *v583;
  void *v584;
  void *v585;
  void *v586;
  void *v587;
  void *v588;
  void *v589;
  void *v590;
  void *v591;
  void *v592;
  void *v593;
  void *v594;
  void *v595;
  void *v596;
  void *v597;
  void *v598;
  void *v599;
  void *v600;
  void *v601;
  void *v602;
  void *v603;
  void *v604;
  void *v605;
  void *v606;
  void *v607;
  void *v608;
  void *v609;
  id v610;
  id v611;
  void *v612;
  id v613;
  void *v614;
  id v615;
  id v616;
  id v617;
  void *v618;
  void *v619;
  void *v620;
  void *v621;
  void *v622;
  void *v623;
  void *v624;
  void *v625;
  void *v626;
  void *v627;
  void *v628;
  void *v629;
  id v630;
  void *v631;
  id *v632;
  BMAeroMLPhotosSearchLabeledData *v633;
  id v634;
  uint64_t v635;
  void *v636;
  uint64_t v637;
  uint64_t v638;
  uint64_t v639;
  void *v640;
  uint64_t v641;
  id v642;
  uint64_t v643;
  id v644;
  uint64_t v645;
  id v646;
  uint64_t v647;
  id v648;
  uint64_t v649;
  id v650;
  uint64_t v651;
  id v652;
  uint64_t v653;
  id v654;
  uint64_t v655;
  id v656;
  uint64_t v657;
  id v658;
  uint64_t v659;
  id v660;
  uint64_t v661;
  id v662;
  uint64_t v663;
  id v664;
  uint64_t v665;
  id v666;
  uint64_t v667;
  id v668;
  uint64_t v669;
  id v670;
  uint64_t v671;
  id v672;
  uint64_t v673;
  id v674;
  uint64_t v675;
  id v676;
  uint64_t v677;
  id v678;
  uint64_t v679;
  id v680;
  uint64_t v681;
  id v682;
  uint64_t v683;
  id v684;
  uint64_t v685;
  void *v686;
  uint64_t v687;
  id v688;
  uint64_t v689;
  id v690;
  uint64_t v691;
  id v692;
  uint64_t v693;
  id v694;
  uint64_t v695;
  id v696;
  uint64_t v697;
  id v698;
  uint64_t v699;
  void *v700;
  uint64_t v701;
  id v702;
  uint64_t v703;
  id v704;
  uint64_t v705;
  id v706;
  uint64_t v707;
  void *v708;
  uint64_t v709;
  void *v710;
  uint64_t v711;
  id *v712;
  uint64_t v713;
  id v714;
  uint64_t v715;
  id v716;
  uint64_t v717;
  void *v718;
  uint64_t v719;
  id v720;
  uint64_t v721;
  id v722;
  uint64_t v723;
  id v724;
  uint64_t v725;
  id v726;
  uint64_t v727;
  id v728;
  uint64_t v729;
  uint64_t v730;
  uint64_t v731;
  id v732;
  uint64_t v733;
  uint64_t v734;
  uint64_t v735;
  id v736;
  uint64_t v737;
  uint64_t v738;
  uint64_t v739;
  id *v740;
  uint64_t v741;
  _QWORD v742[3];

  v742[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("searchSessionUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v634 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v634 = v7;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uiSurface"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v633 = self;
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = 0;
      goto LABEL_16;
    }
    v10 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
LABEL_15:

LABEL_16:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("matchedPeopleRatio"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v22 = a4;
        v23 = 0;
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = a4;
        v23 = v21;
LABEL_19:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("matchedLocationRatio"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v632 = v23;
        v631 = v21;
        if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v25 = v8;
          v629 = v24;
          v26 = 0;
          goto LABEL_22;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = v8;
          v629 = v24;
          v26 = v24;
LABEL_22:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("matchedSceneRatio"));
          v27 = objc_claimAutoreleasedReturnValue();
          v627 = (void *)v27;
          v613 = v9;
          if (!v27 || (v28 = (void *)v27, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v630 = 0;
            goto LABEL_25;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v630 = v28;
LABEL_25:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("matchedSceneConfidence"));
            v29 = objc_claimAutoreleasedReturnValue();
            v628 = (void *)v29;
            if (!v29 || (v30 = (void *)v29, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v31 = v6;
              v32 = 0;
              goto LABEL_28;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v31 = v6;
              v32 = v30;
LABEL_28:
              objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("matchedSceneBoundingBox"));
              v33 = objc_claimAutoreleasedReturnValue();
              v612 = (void *)v33;
              if (!v33 || (v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v610 = 0;
                goto LABEL_31;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v610 = v34;
LABEL_31:
                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("matchedOCRCharacterRatio"));
                v35 = objc_claimAutoreleasedReturnValue();
                v579 = (void *)v35;
                if (!v35 || (v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v574 = 0;
                  goto LABEL_34;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v574 = v36;
LABEL_34:
                  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("matchedOCRImportance"));
                  v37 = objc_claimAutoreleasedReturnValue();
                  v577 = (void *)v37;
                  if (!v37 || (v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v575 = 0;
                    goto LABEL_37;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v575 = v38;
LABEL_37:
                    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("matchedFieldsCount"));
                    v39 = objc_claimAutoreleasedReturnValue();
                    v573 = (void *)v39;
                    if (!v39 || (v40 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v571 = 0;
                      goto LABEL_40;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v571 = v40;
LABEL_40:
                      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("L1Score"));
                      v41 = objc_claimAutoreleasedReturnValue();
                      v570 = (void *)v41;
                      if (!v41 || (v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v568 = 0;
                        goto LABEL_43;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v568 = v42;
LABEL_43:
                        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("freshness"));
                        v43 = objc_claimAutoreleasedReturnValue();
                        v567 = (void *)v43;
                        if (!v43 || (v44 = (void *)v43, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v565 = 0;
LABEL_46:
                          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("favorited"));
                          v45 = objc_claimAutoreleasedReturnValue();
                          v561 = v26;
                          v564 = (void *)v45;
                          if (v45 && (v46 = (void *)v45, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              if (!v22)
                              {
                                v562 = 0;
                                v18 = 0;
                                v65 = v629;
                                self = v633;
LABEL_500:
                                v103 = v574;
                                goto LABEL_501;
                              }
                              v563 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v586 = v7;
                              v202 = *MEMORY[0x1E0D025B8];
                              v717 = *MEMORY[0x1E0CB2D50];
                              v556 = v22;
                              v203 = objc_alloc(MEMORY[0x1E0CB3940]);
                              v446 = objc_opt_class();
                              v204 = v203;
                              self = v633;
                              v205 = (void *)objc_msgSend(v204, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v446, CFSTR("favorited"));
                              v718 = v205;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v718, &v717, 1);
                              v50 = (void *)objc_claimAutoreleasedReturnValue();
                              v206 = v202;
                              v7 = v586;
                              v207 = (id)objc_msgSend(v563, "initWithDomain:code:userInfo:", v206, 2, v50);
                              v18 = 0;
                              v562 = 0;
                              *v556 = v207;
                              v65 = v629;
                              goto LABEL_499;
                            }
                            v562 = v46;
                          }
                          else
                          {
                            v562 = 0;
                          }
                          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("aestheticScore"));
                          v47 = objc_claimAutoreleasedReturnValue();
                          v48 = v22;
                          v49 = v25;
                          v560 = (void *)v47;
                          if (!v47)
                          {
                            v549 = v32;
                            v51 = v7;
                            v558 = 0;
                            self = v633;
                            goto LABEL_96;
                          }
                          v50 = (void *)v47;
                          objc_opt_class();
                          self = v633;
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v549 = v32;
                            v51 = v7;
                            v558 = 0;
                            goto LABEL_96;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v549 = v32;
                            v51 = v7;
                            v558 = v50;
LABEL_96:
                            objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("curationScore"));
                            v120 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!v120 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v546 = v120;
                              v559 = 0;
                              goto LABEL_99;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v546 = v120;
                              v559 = v120;
LABEL_99:
                              objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("hasEverClickInLastWeek"));
                              v121 = objc_claimAutoreleasedReturnValue();
                              v548 = (void *)v121;
                              if (!v121 || (v122 = (void *)v121, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v547 = 0;
LABEL_102:
                                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("hasEverClickInLastMonth"));
                                v123 = objc_claimAutoreleasedReturnValue();
                                v545 = (void *)v123;
                                if (v123
                                  && (v124 = (void *)v123, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (!v48)
                                    {
                                      v18 = 0;
                                      v65 = v629;
                                      v212 = v546;
                                      v7 = v51;
LABEL_495:
                                      v32 = v549;
                                      goto LABEL_496;
                                    }
                                    v229 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v619 = v31;
                                    v590 = v51;
                                    v230 = *MEMORY[0x1E0D025B8];
                                    v709 = *MEMORY[0x1E0CB2D50];
                                    v231 = v48;
                                    v232 = objc_alloc(MEMORY[0x1E0CB3940]);
                                    v450 = objc_opt_class();
                                    v233 = v232;
                                    self = v633;
                                    v234 = (void *)objc_msgSend(v233, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v450, CFSTR("hasEverClickInLastMonth"));
                                    v710 = v234;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v710, &v709, 1);
                                    v235 = objc_claimAutoreleasedReturnValue();
                                    v236 = v229;
                                    v237 = v230;
                                    v7 = v590;
                                    v49 = v25;
                                    v31 = v619;
                                    v550 = (void *)v235;
                                    v18 = 0;
                                    v48 = 0;
                                    *v231 = (id)objc_msgSend(v236, "initWithDomain:code:userInfo:", v237, 2);
                                    v65 = v629;
                                    v212 = v546;
                                    goto LABEL_494;
                                  }
                                  v544 = v124;
                                }
                                else
                                {
                                  v544 = 0;
                                }
                                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("hasEverShareInLastWeek"));
                                v7 = v51;
                                v550 = (void *)objc_claimAutoreleasedReturnValue();
                                if (!v550 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v542 = 0;
                                  goto LABEL_108;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v542 = v550;
LABEL_108:
                                  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("hasEverShareInLastMonth"));
                                  v125 = objc_claimAutoreleasedReturnValue();
                                  v543 = (void *)v125;
                                  if (!v125
                                    || (v126 = (void *)v125, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v539 = 0;
                                    goto LABEL_111;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v539 = v126;
LABEL_111:
                                    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clickCountInLastWeekNormalizedAcrossItems"));
                                    v127 = objc_claimAutoreleasedReturnValue();
                                    v541 = (void *)v127;
                                    if (!v127
                                      || (v128 = (void *)v127, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v540 = 0;
                                      goto LABEL_114;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v540 = v128;
LABEL_114:
                                      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clickCountInLastMonthNormalizedAcrossItems"));
                                      v129 = objc_claimAutoreleasedReturnValue();
                                      v538 = (void *)v129;
                                      if (!v129
                                        || (v130 = (void *)v129, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v537 = 0;
                                        goto LABEL_117;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v537 = v130;
LABEL_117:
                                        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("shareCountInLastWeekNormalizedAcrossItems"));
                                        v131 = objc_claimAutoreleasedReturnValue();
                                        v536 = (void *)v131;
                                        if (!v131
                                          || (v132 = (void *)v131, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v535 = 0;
                                          goto LABEL_120;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v535 = v132;
LABEL_120:
                                          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("shareCountInLastMonthNormalizedAcrossItems"));
                                          v133 = objc_claimAutoreleasedReturnValue();
                                          v534 = (void *)v133;
                                          if (!v133
                                            || (v134 = (void *)v133,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            v135 = 0;
                                            goto LABEL_123;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v135 = v134;
LABEL_123:
                                            objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"));
                                            v136 = objc_claimAutoreleasedReturnValue();
                                            v533 = v135;
                                            v532 = (void *)v136;
                                            if (!v136
                                              || (v137 = (void *)v136,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              v531 = 0;
                                              goto LABEL_126;
                                            }
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v531 = v137;
LABEL_126:
                                              objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"));
                                              v138 = objc_claimAutoreleasedReturnValue();
                                              v530 = (void *)v138;
                                              if (!v138
                                                || (v139 = (void *)v138,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                v529 = 0;
                                                goto LABEL_129;
                                              }
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v529 = v139;
LABEL_129:
                                                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clickCountGivenLocationInLastWeekNormalizedAcrossItems"));
                                                v140 = objc_claimAutoreleasedReturnValue();
                                                v528 = (void *)v140;
                                                if (!v140
                                                  || (v141 = (void *)v140,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  v527 = 0;
                                                  goto LABEL_132;
                                                }
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  v527 = v141;
LABEL_132:
                                                  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clickCountGivenLocationInLastMonthNormalizedAcrossItems"));
                                                  v142 = objc_claimAutoreleasedReturnValue();
                                                  v526 = (void *)v142;
                                                  if (!v142
                                                    || (v143 = (void *)v142,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    v525 = 0;
                                                    goto LABEL_135;
                                                  }
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    v525 = v143;
LABEL_135:
                                                    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"));
                                                    v144 = objc_claimAutoreleasedReturnValue();
                                                    v524 = (void *)v144;
                                                    if (!v144
                                                      || (v145 = (void *)v144,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      v523 = 0;
LABEL_138:
                                                      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"));
                                                      v146 = objc_claimAutoreleasedReturnValue();
                                                      v522 = (void *)v146;
                                                      if (v146
                                                        && (v147 = (void *)v146,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                      {
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                        {
                                                          if (!v48)
                                                          {
                                                            v521 = 0;
                                                            v18 = 0;
                                                            v65 = v629;
                                                            v212 = v546;
                                                            v48 = (id *)v544;
LABEL_482:
                                                            v242 = v539;
                                                            goto LABEL_483;
                                                          }
                                                          v306 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                          v596 = v7;
                                                          v307 = *MEMORY[0x1E0D025B8];
                                                          v685 = *MEMORY[0x1E0CB2D50];
                                                          v308 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                          v462 = objc_opt_class();
                                                          v309 = v308;
                                                          self = v633;
                                                          v310 = (void *)objc_msgSend(v309, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v462, CFSTR("clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"));
                                                          v686 = v310;
                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v686, &v685, 1);
                                                          v311 = objc_claimAutoreleasedReturnValue();
                                                          v312 = v307;
                                                          v7 = v596;
                                                          v519 = (void *)v311;
                                                          v18 = 0;
                                                          v521 = 0;
                                                          *v48 = (id)objc_msgSend(v306, "initWithDomain:code:userInfo:", v312, 2);
                                                          goto LABEL_341;
                                                        }
                                                        v521 = v147;
                                                      }
                                                      else
                                                      {
                                                        v521 = 0;
                                                      }
                                                      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"));
                                                      v148 = objc_claimAutoreleasedReturnValue();
                                                      v519 = (void *)v148;
                                                      if (!v148
                                                        || (v149 = (void *)v148,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        v520 = 0;
                                                        goto LABEL_144;
                                                      }
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v520 = v149;
LABEL_144:
                                                        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"));
                                                        v150 = objc_claimAutoreleasedReturnValue();
                                                        v518 = (void *)v150;
                                                        if (!v150
                                                          || (v151 = (void *)v150,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          v517 = 0;
                                                          goto LABEL_147;
                                                        }
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                        {
                                                          v517 = v151;
LABEL_147:
                                                          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"));
                                                          v152 = objc_claimAutoreleasedReturnValue();
                                                          v516 = (void *)v152;
                                                          if (!v152
                                                            || (v153 = (void *)v152,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            v515 = 0;
                                                            goto LABEL_150;
                                                          }
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                          {
                                                            v515 = v153;
LABEL_150:
                                                            objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"));
                                                            v154 = objc_claimAutoreleasedReturnValue();
                                                            v514 = (void *)v154;
                                                            if (!v154
                                                              || (v155 = (void *)v154,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              v513 = 0;
                                                              goto LABEL_153;
                                                            }
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                            {
                                                              v513 = v155;
LABEL_153:
                                                              objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"));
                                                              v156 = objc_claimAutoreleasedReturnValue();
                                                              v512 = (void *)v156;
                                                              if (!v156
                                                                || (v157 = (void *)v156,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                v511 = 0;
LABEL_156:
                                                                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"));
                                                                v158 = objc_claimAutoreleasedReturnValue();
                                                                v510 = (void *)v158;
                                                                if (v158
                                                                  && (v159 = (void *)v158,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                  {
                                                                    if (!v48)
                                                                    {
                                                                      v509 = 0;
                                                                      v18 = 0;
                                                                      v65 = v629;
                                                                      v212 = v546;
                                                                      v48 = (id *)v544;
LABEL_475:
                                                                      v310 = v520;
                                                                      goto LABEL_476;
                                                                    }
                                                                    v344 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                    v602 = v7;
                                                                    v345 = *MEMORY[0x1E0D025B8];
                                                                    v673 = *MEMORY[0x1E0CB2D50];
                                                                    v346 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                    v468 = objc_opt_class();
                                                                    v347 = v346;
                                                                    self = v633;
                                                                    v508 = (id)objc_msgSend(v347, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v468, CFSTR("clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"));
                                                                    v674 = v508;
                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v674, &v673, 1);
                                                                    v348 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v349 = v345;
                                                                    v7 = v602;
                                                                    v18 = 0;
                                                                    v509 = 0;
                                                                    *v48 = (id)objc_msgSend(v344, "initWithDomain:code:userInfo:", v349, 2, v348);
                                                                    v65 = v629;
                                                                    v212 = v546;
                                                                    v48 = (id *)v544;
LABEL_474:

                                                                    goto LABEL_475;
                                                                  }
                                                                  v509 = v159;
                                                                }
                                                                else
                                                                {
                                                                  v509 = 0;
                                                                }
                                                                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"));
                                                                v160 = objc_claimAutoreleasedReturnValue();
                                                                v507 = (void *)v160;
                                                                if (v160
                                                                  && (v161 = (void *)v160,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                  {
                                                                    if (!v48)
                                                                    {
                                                                      v508 = 0;
                                                                      v18 = 0;
                                                                      v65 = v629;
                                                                      v212 = v546;
                                                                      v48 = (id *)v544;
LABEL_473:
                                                                      v348 = v507;
                                                                      goto LABEL_474;
                                                                    }
                                                                    v350 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                    v603 = v7;
                                                                    v351 = *MEMORY[0x1E0D025B8];
                                                                    v671 = *MEMORY[0x1E0CB2D50];
                                                                    v352 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                    v469 = objc_opt_class();
                                                                    v353 = v352;
                                                                    self = v633;
                                                                    v506 = (id)objc_msgSend(v353, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v469, CFSTR("shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"));
                                                                    v672 = v506;
                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v672, &v671, 1);
                                                                    v163 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v354 = v351;
                                                                    v7 = v603;
                                                                    v18 = 0;
                                                                    v508 = 0;
                                                                    *v48 = (id)objc_msgSend(v350, "initWithDomain:code:userInfo:", v354, 2, v163);
                                                                    goto LABEL_377;
                                                                  }
                                                                  v508 = v161;
                                                                }
                                                                else
                                                                {
                                                                  v508 = 0;
                                                                }
                                                                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"));
                                                                v162 = objc_claimAutoreleasedReturnValue();
                                                                v504 = (void *)v162;
                                                                if (!v162
                                                                  || (v163 = (void *)v162,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  v506 = 0;
                                                                  goto LABEL_165;
                                                                }
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                {
                                                                  v506 = v163;
LABEL_165:
                                                                  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("shareCountGivenLocationInLastWeekNormalizedAcrossItems"));
                                                                  v164 = objc_claimAutoreleasedReturnValue();
                                                                  v505 = (void *)v164;
                                                                  if (!v164
                                                                    || (v165 = (void *)v164,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    v503 = 0;
                                                                    goto LABEL_168;
                                                                  }
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                  {
                                                                    v503 = v165;
LABEL_168:
                                                                    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("shareCountGivenLocationInLastMonthNormalizedAcrossItems"));
                                                                    v166 = objc_claimAutoreleasedReturnValue();
                                                                    v502 = (void *)v166;
                                                                    if (!v166
                                                                      || (v167 = (void *)v166,
                                                                          objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      v501 = 0;
                                                                      goto LABEL_171;
                                                                    }
                                                                    objc_opt_class();
                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                    {
                                                                      v501 = v167;
LABEL_171:
                                                                      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"));
                                                                      v168 = objc_claimAutoreleasedReturnValue();
                                                                      v500 = (void *)v168;
                                                                      if (!v168
                                                                        || (v169 = (void *)v168,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        v499 = 0;
                                                                        goto LABEL_174;
                                                                      }
                                                                      objc_opt_class();
                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                      {
                                                                        v499 = v169;
LABEL_174:
                                                                        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"));
                                                                        v170 = objc_claimAutoreleasedReturnValue();
                                                                        v498 = (void *)v170;
                                                                        if (!v170
                                                                          || (v171 = (void *)v170,
                                                                              objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                        {
                                                                          v497 = 0;
                                                                          goto LABEL_177;
                                                                        }
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                        {
                                                                          v497 = v171;
LABEL_177:
                                                                          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"));
                                                                          v172 = objc_claimAutoreleasedReturnValue();
                                                                          v495 = (void *)v172;
                                                                          if (!v172
                                                                            || (v173 = (void *)v172,
                                                                                objc_opt_class(),
                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                          {
                                                                            v496 = 0;
                                                                            goto LABEL_180;
                                                                          }
                                                                          objc_opt_class();
                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                          {
                                                                            v496 = v173;
LABEL_180:
                                                                            objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"));
                                                                            v174 = objc_claimAutoreleasedReturnValue();
                                                                            v493 = (void *)v174;
                                                                            if (!v174
                                                                              || (v175 = (void *)v174,
                                                                                  objc_opt_class(),
                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                            {
                                                                              v494 = 0;
                                                                              goto LABEL_183;
                                                                            }
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                            {
                                                                              v494 = v175;
LABEL_183:
                                                                              objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"));
                                                                              v492 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              if (!v492
                                                                                || (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                              {
                                                                                v491 = 0;
                                                                                goto LABEL_186;
                                                                              }
                                                                              objc_opt_class();
                                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                              {
                                                                                v491 = v492;
LABEL_186:
                                                                                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"));
                                                                                v490 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                if (!v490
                                                                                  || (objc_opt_class(),
                                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                                {
                                                                                  v489 = 0;
                                                                                  goto LABEL_189;
                                                                                }
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                {
                                                                                  v489 = v490;
LABEL_189:
                                                                                  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"));
                                                                                  v488 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  if (!v488
                                                                                    || (objc_opt_class(),
                                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                                  {
                                                                                    v487 = 0;
                                                                                    goto LABEL_192;
                                                                                  }
                                                                                  objc_opt_class();
                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                  {
                                                                                    v487 = v488;
LABEL_192:
                                                                                    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"));
                                                                                    v485 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    if (!v485
                                                                                      || (objc_opt_class(),
                                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                                    {
                                                                                      v486 = 0;
                                                                                      goto LABEL_195;
                                                                                    }
                                                                                    objc_opt_class();
                                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                    {
                                                                                      v486 = v485;
LABEL_195:
                                                                                      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clipScore"));
                                                                                      v625 = v49;
                                                                                      v484 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      if (!v484
                                                                                        || (objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                                      {
                                                                                        v483 = 0;
                                                                                        goto LABEL_198;
                                                                                      }
                                                                                      v395 = self;
                                                                                      objc_opt_class();
                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                      {
                                                                                        v483 = v484;
LABEL_198:
                                                                                        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clicked"));
                                                                                        v482 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        if (!v482
                                                                                          || (objc_opt_class(),
                                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                                        {
                                                                                          v481 = 0;
                                                                                          goto LABEL_201;
                                                                                        }
                                                                                        v395 = self;
                                                                                        objc_opt_class();
                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                        {
                                                                                          v481 = v482;
LABEL_201:
                                                                                          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clickOrder"));
                                                                                          v176 = objc_claimAutoreleasedReturnValue();
                                                                                          v552 = v48;
                                                                                          v479 = (void *)v176;
                                                                                          if (!v176
                                                                                            || (v177 = (void *)v176,
                                                                                                objc_opt_class(),
                                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                                          {
                                                                                            v480 = 0;
                                                                                            v178 = v610;
                                                                                            v179 = v562;
                                                                                            goto LABEL_204;
                                                                                          }
                                                                                          v179 = v562;
                                                                                          objc_opt_class();
                                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                          {
                                                                                            v480 = v177;
                                                                                            v178 = v610;
LABEL_204:
                                                                                            v610 = v178;
                                                                                            objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("itemPosition"));
                                                                                            v562 = v179;
                                                                                            v477 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                            if (!v477
                                                                                              || (objc_opt_class(),
                                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                                            {
                                                                                              v478 = 0;
                                                                                              v180 = v613;
                                                                                              v181 = v31;
                                                                                              goto LABEL_207;
                                                                                            }
                                                                                            objc_opt_class();
                                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                            {
                                                                                              v478 = v477;
                                                                                              v181 = v31;
                                                                                              v180 = v613;
LABEL_207:
                                                                                              v31 = v181;
                                                                                              objc_msgSend(v181, "objectForKeyedSubscript:", CFSTR("L2ModelScore"));
                                                                                              v582 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              if (v582)
                                                                                              {
                                                                                                v182 = v7;
                                                                                                v183 = self;
                                                                                                objc_opt_class();
                                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                {
                                                                                                  objc_opt_class();
                                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                  {
                                                                                                    v617 = v582;
                                                                                                    goto LABEL_400;
                                                                                                  }
                                                                                                  if (v552)
                                                                                                  {
                                                                                                    v424 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                    v425 = *MEMORY[0x1E0D025B8];
                                                                                                    v639 = *MEMORY[0x1E0CB2D50];
                                                                                                    v475 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("L2ModelScore"));
                                                                                                    v640 = v475;
                                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v640, &v639, 1);
                                                                                                    v476 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    v18 = 0;
                                                                                                    v617 = 0;
                                                                                                    *v552 = (id)objc_msgSend(v424, "initWithDomain:code:userInfo:", v425, 2);
                                                                                                    goto LABEL_453;
                                                                                                  }
                                                                                                  v617 = 0;
                                                                                                  v18 = 0;
                                                                                                  v49 = v625;
LABEL_451:
                                                                                                  v65 = v629;
                                                                                                  v212 = v546;
                                                                                                  v48 = (id *)v544;
                                                                                                  v359 = v520;
LABEL_457:

                                                                                                  goto LABEL_458;
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                v182 = v7;
                                                                                                v183 = self;
                                                                                              }
                                                                                              v617 = 0;
LABEL_400:
                                                                                              objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("isDuplicate"));
                                                                                              v476 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              if (!v476
                                                                                                || (objc_opt_class(),
                                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                                              {
                                                                                                v408 = 0;
LABEL_403:
                                                                                                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("isCompleteMatch"));
                                                                                                v409 = (id)objc_claimAutoreleasedReturnValue();
                                                                                                v475 = v408;
                                                                                                if (!v409)
                                                                                                {
                                                                                                  v410 = 0;
                                                                                                  goto LABEL_424;
                                                                                                }
                                                                                                objc_opt_class();
                                                                                                v410 = v409;
                                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                {
                                                                                                  v409 = 0;
LABEL_424:
                                                                                                  v419 = objc_msgSend(v180, "intValue");
                                                                                                  v48 = (id *)v544;
                                                                                                  self = -[BMAeroMLPhotosSearchLabeledData initWithSearchSessionUUID:uiSurface:matchedPeopleRatio:matchedLocationRatio:matchedSceneRatio:matchedSceneConfidence:matchedSceneBoundingBox:matchedOCRCharacterRatio:matchedOCRImportance:matchedFieldsCount:L1Score:freshness:favorited:aestheticScore:curationScore:hasEverClickInLastWeek:hasEverClickInLastMonth:hasEverShareInLastWeek:hasEverShareInLastMonth:clickCountInLastWeekNormalizedAcrossItems:clickCountInLastMonthNormalizedAcrossItems:shareCountInLastWeekNormalizedAcrossItems:shareCountInLastMonthNormalizedAcrossItems:clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:clickCountGivenLocationInLastWeekNormalizedAcrossItems:clickCountGivenLocationInLastMonthNormalizedAcrossItems:clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:shareCountGivenLocationInLastWeekNormalizedAcrossItems:shareCountGivenLocationInLastMonthNormalizedAcrossItems:shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:clipScore:clicked:clickOrder:itemPosition:L2ModelScore:isDuplicate:isCompleteMatch:](v183, "initWithSearchSessionUUID:uiSurface:matchedPeopleRatio:matchedLocationRatio:matchedSceneRatio:matchedSceneConfidence:matchedSceneBoundingBox:matchedOCRCharacterRatio:matchedOCRImportance:matchedFieldsCount:L1Score:freshness:favorited:aestheticScore:curationScore:hasEverClickInLastWeek:hasEverClickInLastMonth:hasEverShareInLastWeek:hasEverShareInLastMonth:clickCountInLastWeekNormalizedAcrossItems:clickCountInLastMonthNormalizedAcrossItems:shareCountInLastWeekNormalizedAcrossItems:shareCountInLastMonthNormalizedAcrossItems:clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:clickCountGivenLocationInLastWeekNormalizedAcrossItems:clickCountGivenLocationInLastMonthNormalizedAcrossItems:clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:shareCountGivenLocationInLastWeekNormalizedAcrossItems:shareCountGivenLocationInLastMonthNormalizedAcrossItems:shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:clipScore:clicked:clickOrder:itemPosition:L2ModelScore:isDuplicate:isCompleteMatch:", v634, v419, v632, v561, v630, v549, v610, v574, v575, v571, v568, v565, v562, v558, v559, v547, v544, v542, v539, v540, v537, v535, v533, v531, v529, v527, v525, v523, v521, v520, v517, v515, v513, v511, v509, v508, v506, v503, v501, v499, v497, v496, v494, v491, v489, v487, v486, v483, v481, v480, v478, v617, v408, v409);
                                                                                                  v18 = self;
                                                                                                  v7 = v182;
                                                                                                  v49 = v625;
                                                                                                  v212 = v546;
LABEL_455:

                                                                                                  v65 = v629;
                                                                                                  goto LABEL_456;
                                                                                                }
                                                                                                objc_opt_class();
                                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                {
                                                                                                  v410 = v409;
                                                                                                  v409 = v409;
                                                                                                  goto LABEL_424;
                                                                                                }
                                                                                                if (!v552)
                                                                                                {
                                                                                                  v18 = 0;
                                                                                                  self = v183;
                                                                                                  v49 = v625;
                                                                                                  v7 = v182;
                                                                                                  v212 = v546;
                                                                                                  v48 = (id *)v544;
                                                                                                  v410 = v409;
                                                                                                  v409 = 0;
                                                                                                  goto LABEL_455;
                                                                                                }
                                                                                                v431 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                v432 = *MEMORY[0x1E0D025B8];
                                                                                                v635 = *MEMORY[0x1E0CB2D50];
                                                                                                v433 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isCompleteMatch"));
                                                                                                v636 = v433;
                                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v636, &v635, 1);
                                                                                                v434 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                v435 = v432;
                                                                                                v410 = v409;
                                                                                                *v552 = (id)objc_msgSend(v431, "initWithDomain:code:userInfo:", v435, 2, v434);

                                                                                                v409 = 0;
                                                                                                v18 = 0;
                                                                                                self = v183;
                                                                                                v49 = v625;
                                                                                                v7 = v182;
LABEL_443:
                                                                                                v212 = v546;
                                                                                                v48 = (id *)v544;
                                                                                                goto LABEL_455;
                                                                                              }
                                                                                              objc_opt_class();
                                                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                              {
                                                                                                v408 = v476;
                                                                                                goto LABEL_403;
                                                                                              }
                                                                                              if (v552)
                                                                                              {
                                                                                                v426 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                v427 = *MEMORY[0x1E0D025B8];
                                                                                                v637 = *MEMORY[0x1E0CB2D50];
                                                                                                v428 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isDuplicate"));
                                                                                                v638 = v428;
                                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v638, &v637, 1);
                                                                                                v429 = objc_claimAutoreleasedReturnValue();
                                                                                                v430 = v427;
                                                                                                v410 = (void *)v429;
                                                                                                v18 = 0;
                                                                                                v475 = 0;
                                                                                                *v552 = (id)objc_msgSend(v426, "initWithDomain:code:userInfo:", v430, 2, v429);
                                                                                                self = v183;
                                                                                                v49 = v625;
                                                                                                v7 = v182;
                                                                                                v409 = (id)v428;
                                                                                                goto LABEL_443;
                                                                                              }
                                                                                              v475 = 0;
                                                                                              v18 = 0;
LABEL_453:
                                                                                              self = v183;
                                                                                              v49 = v625;
                                                                                              v7 = v182;
                                                                                              v65 = v629;
                                                                                              v212 = v546;
                                                                                              v48 = (id *)v544;
LABEL_456:
                                                                                              v359 = v520;

                                                                                              goto LABEL_457;
                                                                                            }
                                                                                            if (v552)
                                                                                            {
                                                                                              v422 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                              v423 = *MEMORY[0x1E0D025B8];
                                                                                              v641 = *MEMORY[0x1E0CB2D50];
                                                                                              v617 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("itemPosition"));
                                                                                              v642 = v617;
                                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v642, &v641, 1);
                                                                                              v582 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              v18 = 0;
                                                                                              v478 = 0;
                                                                                              *v552 = (id)objc_msgSend(v422, "initWithDomain:code:userInfo:", v423, 2);
                                                                                              goto LABEL_451;
                                                                                            }
                                                                                            v478 = 0;
                                                                                            v18 = 0;
LABEL_449:
                                                                                            v65 = v629;
                                                                                            v212 = v546;
                                                                                            v48 = (id *)v544;
                                                                                            v359 = v520;
LABEL_458:

                                                                                            goto LABEL_459;
                                                                                          }
                                                                                          v620 = v31;
                                                                                          v609 = v7;
                                                                                          if (v552)
                                                                                          {
                                                                                            v420 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                            v421 = *MEMORY[0x1E0D025B8];
                                                                                            v643 = *MEMORY[0x1E0CB2D50];
                                                                                            v478 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clickOrder"));
                                                                                            v644 = v478;
                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v644, &v643, 1);
                                                                                            v477 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                            v18 = 0;
                                                                                            v480 = 0;
                                                                                            *v552 = (id)objc_msgSend(v420, "initWithDomain:code:userInfo:", v421, 2);
                                                                                            v7 = v609;
                                                                                            goto LABEL_449;
                                                                                          }
                                                                                          v480 = 0;
                                                                                          v18 = 0;
LABEL_447:
                                                                                          v7 = v609;
                                                                                          v31 = v620;
                                                                                          v65 = v629;
                                                                                          v212 = v546;
                                                                                          v48 = (id *)v544;
                                                                                          v359 = v520;
LABEL_459:

                                                                                          goto LABEL_460;
                                                                                        }
                                                                                        v620 = v31;
                                                                                        v609 = v7;
                                                                                        if (v48)
                                                                                        {
                                                                                          v417 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                          v418 = *MEMORY[0x1E0D025B8];
                                                                                          v645 = *MEMORY[0x1E0CB2D50];
                                                                                          v480 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clicked"));
                                                                                          v646 = v480;
                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v646, &v645, 1);
                                                                                          v479 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                          v18 = 0;
                                                                                          v481 = 0;
                                                                                          *v48 = (id)objc_msgSend(v417, "initWithDomain:code:userInfo:", v418, 2);
                                                                                          goto LABEL_447;
                                                                                        }
                                                                                        v481 = 0;
                                                                                        v18 = 0;
LABEL_445:
                                                                                        self = v395;
                                                                                        v7 = v609;
                                                                                        v31 = v620;
                                                                                        v65 = v629;
                                                                                        v212 = v546;
                                                                                        v48 = (id *)v544;
                                                                                        v359 = v520;
LABEL_460:

                                                                                        goto LABEL_461;
                                                                                      }
                                                                                      v620 = v31;
                                                                                      v609 = v7;
                                                                                      if (v48)
                                                                                      {
                                                                                        v415 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                        v416 = *MEMORY[0x1E0D025B8];
                                                                                        v647 = *MEMORY[0x1E0CB2D50];
                                                                                        v481 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clipScore"));
                                                                                        v648 = v481;
                                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v648, &v647, 1);
                                                                                        v482 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        v18 = 0;
                                                                                        v483 = 0;
                                                                                        *v48 = (id)objc_msgSend(v415, "initWithDomain:code:userInfo:", v416, 2);
                                                                                        goto LABEL_445;
                                                                                      }
                                                                                      v483 = 0;
                                                                                      v18 = 0;
                                                                                      v65 = v629;
                                                                                      v212 = v546;
                                                                                      v48 = (id *)v544;
LABEL_440:
                                                                                      v359 = v520;
LABEL_461:

                                                                                      goto LABEL_462;
                                                                                    }
                                                                                    v386 = v49;
                                                                                    v387 = self;
                                                                                    if (v48)
                                                                                    {
                                                                                      v411 = v48;
                                                                                      v412 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                      v413 = *MEMORY[0x1E0D025B8];
                                                                                      v649 = *MEMORY[0x1E0CB2D50];
                                                                                      v483 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"));
                                                                                      v650 = v483;
                                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v650, &v649, 1);
                                                                                      v484 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      v414 = (id)objc_msgSend(v412, "initWithDomain:code:userInfo:", v413, 2);
                                                                                      v18 = 0;
                                                                                      v486 = 0;
                                                                                      *v411 = v414;
                                                                                      v65 = v629;
                                                                                      v212 = v546;
                                                                                      v48 = (id *)v544;
                                                                                      v49 = v386;
                                                                                      goto LABEL_440;
                                                                                    }
                                                                                    v486 = 0;
                                                                                    v18 = 0;
LABEL_436:
                                                                                    self = v387;
                                                                                    v65 = v629;
                                                                                    v212 = v546;
                                                                                    v48 = (id *)v544;
                                                                                    v49 = v386;
                                                                                    v359 = v520;
LABEL_462:

                                                                                    goto LABEL_463;
                                                                                  }
                                                                                  v386 = v49;
                                                                                  v387 = self;
                                                                                  if (v48)
                                                                                  {
                                                                                    v404 = v48;
                                                                                    v405 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                    v406 = *MEMORY[0x1E0D025B8];
                                                                                    v651 = *MEMORY[0x1E0CB2D50];
                                                                                    v486 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"));
                                                                                    v652 = v486;
                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v652, &v651, 1);
                                                                                    v485 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    v407 = (id)objc_msgSend(v405, "initWithDomain:code:userInfo:", v406, 2);
                                                                                    v18 = 0;
                                                                                    v487 = 0;
                                                                                    *v404 = v407;
                                                                                    goto LABEL_436;
                                                                                  }
                                                                                  v487 = 0;
                                                                                  v18 = 0;
LABEL_432:
                                                                                  self = v387;
                                                                                  v65 = v629;
                                                                                  v212 = v546;
                                                                                  v48 = (id *)v544;
                                                                                  v49 = v386;
                                                                                  v359 = v520;
LABEL_463:

                                                                                  goto LABEL_464;
                                                                                }
                                                                                v386 = v49;
                                                                                v387 = self;
                                                                                if (v48)
                                                                                {
                                                                                  v400 = v48;
                                                                                  v401 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                  v402 = *MEMORY[0x1E0D025B8];
                                                                                  v653 = *MEMORY[0x1E0CB2D50];
                                                                                  v487 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"));
                                                                                  v654 = v487;
                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v654, &v653, 1);
                                                                                  v488 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  v403 = (id)objc_msgSend(v401, "initWithDomain:code:userInfo:", v402, 2);
                                                                                  v18 = 0;
                                                                                  v489 = 0;
                                                                                  *v400 = v403;
                                                                                  goto LABEL_432;
                                                                                }
                                                                                v489 = 0;
                                                                                v18 = 0;
LABEL_428:
                                                                                self = v387;
                                                                                v65 = v629;
                                                                                v212 = v546;
                                                                                v48 = (id *)v544;
                                                                                v49 = v386;
                                                                                v359 = v520;
LABEL_464:

                                                                                goto LABEL_465;
                                                                              }
                                                                              v386 = v49;
                                                                              v387 = self;
                                                                              if (v48)
                                                                              {
                                                                                v396 = v48;
                                                                                v397 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                v398 = *MEMORY[0x1E0D025B8];
                                                                                v655 = *MEMORY[0x1E0CB2D50];
                                                                                v489 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"));
                                                                                v656 = v489;
                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v656, &v655, 1);
                                                                                v490 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                v399 = (id)objc_msgSend(v397, "initWithDomain:code:userInfo:", v398, 2);
                                                                                v18 = 0;
                                                                                v491 = 0;
                                                                                *v396 = v399;
                                                                                goto LABEL_428;
                                                                              }
                                                                              v491 = 0;
                                                                              v18 = 0;
LABEL_421:
                                                                              self = v387;
                                                                              v65 = v629;
                                                                              v212 = v546;
                                                                              v48 = (id *)v544;
                                                                              v49 = v386;
                                                                              v359 = v520;
LABEL_465:

                                                                              goto LABEL_466;
                                                                            }
                                                                            v386 = v49;
                                                                            v387 = self;
                                                                            if (v48)
                                                                            {
                                                                              v391 = v48;
                                                                              v392 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                              v393 = *MEMORY[0x1E0D025B8];
                                                                              v657 = *MEMORY[0x1E0CB2D50];
                                                                              v491 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"));
                                                                              v658 = v491;
                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v658, &v657, 1);
                                                                              v492 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              v394 = (id)objc_msgSend(v392, "initWithDomain:code:userInfo:", v393, 2);
                                                                              v18 = 0;
                                                                              v494 = 0;
                                                                              *v391 = v394;
                                                                              goto LABEL_421;
                                                                            }
                                                                            v494 = 0;
                                                                            v18 = 0;
LABEL_414:
                                                                            self = v387;
                                                                            v65 = v629;
                                                                            v212 = v546;
                                                                            v48 = (id *)v544;
                                                                            v49 = v386;
                                                                            v359 = v520;
LABEL_466:

                                                                            goto LABEL_467;
                                                                          }
                                                                          v386 = v49;
                                                                          v387 = self;
                                                                          if (v48)
                                                                          {
                                                                            v388 = v48;
                                                                            v389 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                            v390 = *MEMORY[0x1E0D025B8];
                                                                            v659 = *MEMORY[0x1E0CB2D50];
                                                                            v494 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"));
                                                                            v660 = v494;
                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v660, &v659, 1);
                                                                            v493 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            v18 = 0;
                                                                            v496 = 0;
                                                                            *v388 = (id)objc_msgSend(v389, "initWithDomain:code:userInfo:", v390, 2);
                                                                            goto LABEL_414;
                                                                          }
                                                                          v496 = 0;
                                                                          v18 = 0;
                                                                          v65 = v629;
                                                                          v212 = v546;
                                                                          v48 = (id *)v544;
                                                                          v359 = v520;
LABEL_467:

                                                                          goto LABEL_468;
                                                                        }
                                                                        if (v48)
                                                                        {
                                                                          v380 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                          v608 = v7;
                                                                          v381 = *MEMORY[0x1E0D025B8];
                                                                          v661 = *MEMORY[0x1E0CB2D50];
                                                                          v382 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                          v474 = objc_opt_class();
                                                                          v383 = v382;
                                                                          self = v633;
                                                                          v359 = v520;
                                                                          v496 = (id)objc_msgSend(v383, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v474, CFSTR("shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"));
                                                                          v662 = v496;
                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v662, &v661, 1);
                                                                          v384 = objc_claimAutoreleasedReturnValue();
                                                                          v385 = v381;
                                                                          v7 = v608;
                                                                          v495 = (void *)v384;
                                                                          v18 = 0;
                                                                          v497 = 0;
                                                                          *v48 = (id)objc_msgSend(v380, "initWithDomain:code:userInfo:", v385, 2);
                                                                          v65 = v629;
                                                                          v212 = v546;
                                                                          v48 = (id *)v544;
                                                                          goto LABEL_467;
                                                                        }
                                                                        v497 = 0;
                                                                        v18 = 0;
                                                                        v65 = v629;
                                                                        v212 = v546;
                                                                        v48 = (id *)v544;
                                                                        v359 = v520;
LABEL_468:

                                                                        goto LABEL_469;
                                                                      }
                                                                      if (v48)
                                                                      {
                                                                        v374 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                        v607 = v7;
                                                                        v375 = *MEMORY[0x1E0D025B8];
                                                                        v663 = *MEMORY[0x1E0CB2D50];
                                                                        v376 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                        v473 = objc_opt_class();
                                                                        v377 = v376;
                                                                        self = v633;
                                                                        v359 = v520;
                                                                        v497 = (id)objc_msgSend(v377, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v473, CFSTR("shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"));
                                                                        v664 = v497;
                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v664, &v663, 1);
                                                                        v378 = objc_claimAutoreleasedReturnValue();
                                                                        v379 = v375;
                                                                        v7 = v607;
                                                                        v498 = (void *)v378;
                                                                        v18 = 0;
                                                                        v499 = 0;
                                                                        *v48 = (id)objc_msgSend(v374, "initWithDomain:code:userInfo:", v379, 2);
                                                                        v65 = v629;
                                                                        v212 = v546;
                                                                        v48 = (id *)v544;
                                                                        goto LABEL_468;
                                                                      }
                                                                      v499 = 0;
                                                                      v18 = 0;
                                                                      v65 = v629;
                                                                      v212 = v546;
                                                                      v48 = (id *)v544;
                                                                      v359 = v520;
LABEL_469:

                                                                      goto LABEL_470;
                                                                    }
                                                                    if (v48)
                                                                    {
                                                                      v368 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                      v606 = v7;
                                                                      v369 = *MEMORY[0x1E0D025B8];
                                                                      v665 = *MEMORY[0x1E0CB2D50];
                                                                      v370 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                      v472 = objc_opt_class();
                                                                      v371 = v370;
                                                                      self = v633;
                                                                      v359 = v520;
                                                                      v499 = (id)objc_msgSend(v371, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v472, CFSTR("shareCountGivenLocationInLastMonthNormalizedAcrossItems"));
                                                                      v666 = v499;
                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v666, &v665, 1);
                                                                      v372 = objc_claimAutoreleasedReturnValue();
                                                                      v373 = v369;
                                                                      v7 = v606;
                                                                      v500 = (void *)v372;
                                                                      v18 = 0;
                                                                      v501 = 0;
                                                                      *v48 = (id)objc_msgSend(v368, "initWithDomain:code:userInfo:", v373, 2);
                                                                      v65 = v629;
                                                                      v212 = v546;
                                                                      v48 = (id *)v544;
                                                                      goto LABEL_469;
                                                                    }
                                                                    v501 = 0;
                                                                    v18 = 0;
                                                                    v65 = v629;
                                                                    v212 = v546;
                                                                    v48 = (id *)v544;
                                                                    v359 = v520;
LABEL_470:

                                                                    goto LABEL_471;
                                                                  }
                                                                  if (v48)
                                                                  {
                                                                    v362 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                    v605 = v7;
                                                                    v363 = *MEMORY[0x1E0D025B8];
                                                                    v667 = *MEMORY[0x1E0CB2D50];
                                                                    v364 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                    v471 = objc_opt_class();
                                                                    v365 = v364;
                                                                    self = v633;
                                                                    v359 = v520;
                                                                    v501 = (id)objc_msgSend(v365, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v471, CFSTR("shareCountGivenLocationInLastWeekNormalizedAcrossItems"));
                                                                    v668 = v501;
                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v668, &v667, 1);
                                                                    v366 = objc_claimAutoreleasedReturnValue();
                                                                    v367 = v363;
                                                                    v7 = v605;
                                                                    v502 = (void *)v366;
                                                                    v18 = 0;
                                                                    v503 = 0;
                                                                    *v48 = (id)objc_msgSend(v362, "initWithDomain:code:userInfo:", v367, 2);
                                                                    v65 = v629;
                                                                    v212 = v546;
                                                                    v48 = (id *)v544;
                                                                    goto LABEL_470;
                                                                  }
                                                                  v503 = 0;
                                                                  v18 = 0;
                                                                  v65 = v629;
                                                                  v212 = v546;
                                                                  v48 = (id *)v544;
                                                                  v359 = v520;
LABEL_471:
                                                                  v520 = v359;

                                                                  v163 = v504;
                                                                  goto LABEL_472;
                                                                }
                                                                if (v48)
                                                                {
                                                                  v355 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                  v604 = v7;
                                                                  v356 = *MEMORY[0x1E0D025B8];
                                                                  v669 = *MEMORY[0x1E0CB2D50];
                                                                  v357 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                  v470 = objc_opt_class();
                                                                  v358 = v357;
                                                                  self = v633;
                                                                  v359 = v520;
                                                                  v503 = (id)objc_msgSend(v358, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v470, CFSTR("shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"));
                                                                  v670 = v503;
                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v670, &v669, 1);
                                                                  v360 = objc_claimAutoreleasedReturnValue();
                                                                  v361 = v356;
                                                                  v7 = v604;
                                                                  v505 = (void *)v360;
                                                                  v18 = 0;
                                                                  v506 = 0;
                                                                  *v48 = (id)objc_msgSend(v355, "initWithDomain:code:userInfo:", v361, 2);
                                                                  v65 = v629;
                                                                  v212 = v546;
                                                                  v48 = (id *)v544;
                                                                  goto LABEL_471;
                                                                }
                                                                v506 = 0;
                                                                v18 = 0;
LABEL_377:
                                                                v65 = v629;
                                                                v212 = v546;
                                                                v48 = (id *)v544;
LABEL_472:

                                                                goto LABEL_473;
                                                              }
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                              {
                                                                v511 = v157;
                                                                goto LABEL_156;
                                                              }
                                                              if (v48)
                                                              {
                                                                v338 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                v601 = v7;
                                                                v339 = *MEMORY[0x1E0D025B8];
                                                                v675 = *MEMORY[0x1E0CB2D50];
                                                                v340 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                v467 = objc_opt_class();
                                                                v341 = v340;
                                                                self = v633;
                                                                v310 = v520;
                                                                v509 = (id)objc_msgSend(v341, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v467, CFSTR("clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"));
                                                                v676 = v509;
                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v676, &v675, 1);
                                                                v342 = objc_claimAutoreleasedReturnValue();
                                                                v343 = v339;
                                                                v7 = v601;
                                                                v510 = (void *)v342;
                                                                v18 = 0;
                                                                v511 = 0;
                                                                *v48 = (id)objc_msgSend(v338, "initWithDomain:code:userInfo:", v343, 2);
                                                                v65 = v629;
                                                                v212 = v546;
                                                                v48 = (id *)v544;
LABEL_476:

                                                                goto LABEL_477;
                                                              }
                                                              v511 = 0;
                                                              v18 = 0;
                                                              v65 = v629;
                                                              v212 = v546;
                                                              v48 = (id *)v544;
                                                              v310 = v520;
LABEL_477:

                                                              goto LABEL_478;
                                                            }
                                                            if (v48)
                                                            {
                                                              v332 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                              v600 = v7;
                                                              v333 = *MEMORY[0x1E0D025B8];
                                                              v677 = *MEMORY[0x1E0CB2D50];
                                                              v334 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                              v466 = objc_opt_class();
                                                              v335 = v334;
                                                              self = v633;
                                                              v310 = v520;
                                                              v511 = (id)objc_msgSend(v335, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v466, CFSTR("clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"));
                                                              v678 = v511;
                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v678, &v677, 1);
                                                              v336 = objc_claimAutoreleasedReturnValue();
                                                              v337 = v333;
                                                              v7 = v600;
                                                              v512 = (void *)v336;
                                                              v18 = 0;
                                                              v513 = 0;
                                                              *v48 = (id)objc_msgSend(v332, "initWithDomain:code:userInfo:", v337, 2);
                                                              v65 = v629;
                                                              v212 = v546;
                                                              v48 = (id *)v544;
                                                              goto LABEL_477;
                                                            }
                                                            v513 = 0;
                                                            v18 = 0;
                                                            v65 = v629;
                                                            v212 = v546;
                                                            v48 = (id *)v544;
                                                            v310 = v520;
LABEL_478:

                                                            goto LABEL_479;
                                                          }
                                                          if (v48)
                                                          {
                                                            v326 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v599 = v7;
                                                            v327 = *MEMORY[0x1E0D025B8];
                                                            v679 = *MEMORY[0x1E0CB2D50];
                                                            v328 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                            v465 = objc_opt_class();
                                                            v329 = v328;
                                                            self = v633;
                                                            v310 = v520;
                                                            v513 = (id)objc_msgSend(v329, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v465, CFSTR("clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"));
                                                            v680 = v513;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v680, &v679, 1);
                                                            v330 = objc_claimAutoreleasedReturnValue();
                                                            v331 = v327;
                                                            v7 = v599;
                                                            v514 = (void *)v330;
                                                            v18 = 0;
                                                            v515 = 0;
                                                            *v48 = (id)objc_msgSend(v326, "initWithDomain:code:userInfo:", v331, 2);
                                                            v65 = v629;
                                                            v212 = v546;
                                                            v48 = (id *)v544;
                                                            goto LABEL_478;
                                                          }
                                                          v515 = 0;
                                                          v18 = 0;
                                                          v65 = v629;
                                                          v212 = v546;
                                                          v48 = (id *)v544;
                                                          v310 = v520;
LABEL_479:

                                                          goto LABEL_480;
                                                        }
                                                        if (v48)
                                                        {
                                                          v320 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                          v598 = v7;
                                                          v321 = *MEMORY[0x1E0D025B8];
                                                          v681 = *MEMORY[0x1E0CB2D50];
                                                          v322 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                          v464 = objc_opt_class();
                                                          v323 = v322;
                                                          self = v633;
                                                          v310 = v520;
                                                          v515 = (id)objc_msgSend(v323, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v464, CFSTR("clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"));
                                                          v682 = v515;
                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v682, &v681, 1);
                                                          v324 = objc_claimAutoreleasedReturnValue();
                                                          v325 = v321;
                                                          v7 = v598;
                                                          v516 = (void *)v324;
                                                          v18 = 0;
                                                          v517 = 0;
                                                          *v48 = (id)objc_msgSend(v320, "initWithDomain:code:userInfo:", v325, 2);
                                                          v65 = v629;
                                                          v212 = v546;
                                                          v48 = (id *)v544;
                                                          goto LABEL_479;
                                                        }
                                                        v517 = 0;
                                                        v18 = 0;
                                                        v65 = v629;
                                                        v212 = v546;
                                                        v48 = (id *)v544;
                                                        v310 = v520;
LABEL_480:

                                                        goto LABEL_481;
                                                      }
                                                      if (v48)
                                                      {
                                                        v313 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                        v597 = v7;
                                                        v314 = *MEMORY[0x1E0D025B8];
                                                        v683 = *MEMORY[0x1E0CB2D50];
                                                        v315 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                        v463 = objc_opt_class();
                                                        v316 = v315;
                                                        self = v633;
                                                        v517 = (id)objc_msgSend(v316, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v463, CFSTR("clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"));
                                                        v684 = v517;
                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v684, &v683, 1);
                                                        v317 = objc_claimAutoreleasedReturnValue();
                                                        v318 = v314;
                                                        v7 = v597;
                                                        v518 = (void *)v317;
                                                        v319 = (id)objc_msgSend(v313, "initWithDomain:code:userInfo:", v318, 2);
                                                        v18 = 0;
                                                        v310 = 0;
                                                        *v48 = v319;
                                                        v65 = v629;
                                                        v212 = v546;
                                                        v48 = (id *)v544;
                                                        goto LABEL_480;
                                                      }
                                                      v310 = 0;
                                                      v18 = 0;
LABEL_341:
                                                      v65 = v629;
                                                      v212 = v546;
                                                      v48 = (id *)v544;
LABEL_481:

                                                      goto LABEL_482;
                                                    }
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v523 = v145;
                                                      goto LABEL_138;
                                                    }
                                                    if (v48)
                                                    {
                                                      v300 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                      v595 = v7;
                                                      v301 = *MEMORY[0x1E0D025B8];
                                                      v687 = *MEMORY[0x1E0CB2D50];
                                                      v302 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                      v461 = objc_opt_class();
                                                      v303 = v302;
                                                      self = v633;
                                                      v242 = v539;
                                                      v521 = (id)objc_msgSend(v303, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v461, CFSTR("clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"));
                                                      v688 = v521;
                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v688, &v687, 1);
                                                      v304 = objc_claimAutoreleasedReturnValue();
                                                      v305 = v301;
                                                      v7 = v595;
                                                      v522 = (void *)v304;
                                                      v18 = 0;
                                                      v523 = 0;
                                                      *v48 = (id)objc_msgSend(v300, "initWithDomain:code:userInfo:", v305, 2);
                                                      v65 = v629;
                                                      v212 = v546;
                                                      v48 = (id *)v544;
LABEL_483:

                                                      goto LABEL_484;
                                                    }
                                                    v523 = 0;
                                                    v18 = 0;
                                                    v65 = v629;
                                                    v212 = v546;
                                                    v48 = (id *)v544;
                                                    v242 = v539;
LABEL_484:

                                                    goto LABEL_485;
                                                  }
                                                  if (v48)
                                                  {
                                                    v294 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                    v594 = v7;
                                                    v295 = *MEMORY[0x1E0D025B8];
                                                    v689 = *MEMORY[0x1E0CB2D50];
                                                    v296 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                    v460 = objc_opt_class();
                                                    v297 = v296;
                                                    self = v633;
                                                    v242 = v539;
                                                    v523 = (id)objc_msgSend(v297, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v460, CFSTR("clickCountGivenLocationInLastMonthNormalizedAcrossItems"));
                                                    v690 = v523;
                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v690, &v689, 1);
                                                    v298 = objc_claimAutoreleasedReturnValue();
                                                    v299 = v295;
                                                    v7 = v594;
                                                    v524 = (void *)v298;
                                                    v18 = 0;
                                                    v525 = 0;
                                                    *v48 = (id)objc_msgSend(v294, "initWithDomain:code:userInfo:", v299, 2);
                                                    v65 = v629;
                                                    v212 = v546;
                                                    v48 = (id *)v544;
                                                    goto LABEL_484;
                                                  }
                                                  v525 = 0;
                                                  v18 = 0;
                                                  v65 = v629;
                                                  v212 = v546;
                                                  v48 = (id *)v544;
                                                  v242 = v539;
LABEL_485:

                                                  goto LABEL_486;
                                                }
                                                if (v48)
                                                {
                                                  v288 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v593 = v7;
                                                  v289 = *MEMORY[0x1E0D025B8];
                                                  v691 = *MEMORY[0x1E0CB2D50];
                                                  v290 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                  v459 = objc_opt_class();
                                                  v291 = v290;
                                                  self = v633;
                                                  v242 = v539;
                                                  v525 = (id)objc_msgSend(v291, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v459, CFSTR("clickCountGivenLocationInLastWeekNormalizedAcrossItems"));
                                                  v692 = v525;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v692, &v691, 1);
                                                  v292 = objc_claimAutoreleasedReturnValue();
                                                  v293 = v289;
                                                  v7 = v593;
                                                  v526 = (void *)v292;
                                                  v18 = 0;
                                                  v527 = 0;
                                                  *v48 = (id)objc_msgSend(v288, "initWithDomain:code:userInfo:", v293, 2);
                                                  v65 = v629;
                                                  v212 = v546;
                                                  v48 = (id *)v544;
                                                  goto LABEL_485;
                                                }
                                                v527 = 0;
                                                v18 = 0;
                                                v65 = v629;
                                                v212 = v546;
                                                v48 = (id *)v544;
                                                v242 = v539;
LABEL_486:

                                                goto LABEL_487;
                                              }
                                              if (v48)
                                              {
                                                v282 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v592 = v7;
                                                v283 = *MEMORY[0x1E0D025B8];
                                                v693 = *MEMORY[0x1E0CB2D50];
                                                v284 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                v458 = objc_opt_class();
                                                v285 = v284;
                                                self = v633;
                                                v242 = v539;
                                                v527 = (id)objc_msgSend(v285, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v458, CFSTR("clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"));
                                                v694 = v527;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v694, &v693, 1);
                                                v286 = objc_claimAutoreleasedReturnValue();
                                                v287 = v283;
                                                v7 = v592;
                                                v528 = (void *)v286;
                                                v18 = 0;
                                                v529 = 0;
                                                *v48 = (id)objc_msgSend(v282, "initWithDomain:code:userInfo:", v287, 2);
                                                v65 = v629;
                                                v212 = v546;
                                                v48 = (id *)v544;
                                                goto LABEL_486;
                                              }
                                              v529 = 0;
                                              v18 = 0;
                                              v65 = v629;
                                              v212 = v546;
                                              v48 = (id *)v544;
                                              v242 = v539;
LABEL_487:

                                              goto LABEL_488;
                                            }
                                            if (v48)
                                            {
                                              v276 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v591 = v7;
                                              v277 = *MEMORY[0x1E0D025B8];
                                              v695 = *MEMORY[0x1E0CB2D50];
                                              v278 = objc_alloc(MEMORY[0x1E0CB3940]);
                                              v457 = objc_opt_class();
                                              v279 = v278;
                                              self = v633;
                                              v242 = v539;
                                              v529 = (id)objc_msgSend(v279, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v457, CFSTR("clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"));
                                              v696 = v529;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v696, &v695, 1);
                                              v280 = objc_claimAutoreleasedReturnValue();
                                              v281 = v277;
                                              v7 = v591;
                                              v530 = (void *)v280;
                                              v18 = 0;
                                              v531 = 0;
                                              *v48 = (id)objc_msgSend(v276, "initWithDomain:code:userInfo:", v281, 2);
                                              v65 = v629;
                                              v212 = v546;
                                              v48 = (id *)v544;
                                              goto LABEL_487;
                                            }
                                            v531 = 0;
                                            v18 = 0;
                                            v65 = v629;
                                            v212 = v546;
                                            v48 = (id *)v544;
                                            v242 = v539;
LABEL_488:

                                            goto LABEL_489;
                                          }
                                          if (v48)
                                          {
                                            v270 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v271 = *MEMORY[0x1E0D025B8];
                                            v697 = *MEMORY[0x1E0CB2D50];
                                            v272 = objc_alloc(MEMORY[0x1E0CB3940]);
                                            v456 = objc_opt_class();
                                            v273 = v272;
                                            self = v633;
                                            v242 = v539;
                                            v531 = (id)objc_msgSend(v273, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v456, CFSTR("shareCountInLastMonthNormalizedAcrossItems"));
                                            v698 = v531;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v698, &v697, 1);
                                            v274 = objc_claimAutoreleasedReturnValue();
                                            v275 = v271;
                                            v7 = v51;
                                            v532 = (void *)v274;
                                            v18 = 0;
                                            v533 = 0;
                                            *v48 = (id)objc_msgSend(v270, "initWithDomain:code:userInfo:", v275, 2);
                                            v65 = v629;
                                            v212 = v546;
                                            v48 = (id *)v544;
                                            goto LABEL_488;
                                          }
                                          v533 = 0;
                                          v18 = 0;
                                          v65 = v629;
                                          v212 = v546;
                                          v48 = (id *)v544;
                                          v242 = v539;
LABEL_489:

                                          goto LABEL_490;
                                        }
                                        if (v48)
                                        {
                                          v264 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v265 = *MEMORY[0x1E0D025B8];
                                          v699 = *MEMORY[0x1E0CB2D50];
                                          v266 = objc_alloc(MEMORY[0x1E0CB3940]);
                                          v455 = objc_opt_class();
                                          v267 = v266;
                                          self = v633;
                                          v242 = v539;
                                          v533 = (void *)objc_msgSend(v267, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v455, CFSTR("shareCountInLastWeekNormalizedAcrossItems"));
                                          v700 = v533;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v700, &v699, 1);
                                          v268 = objc_claimAutoreleasedReturnValue();
                                          v269 = v265;
                                          v7 = v51;
                                          v534 = (void *)v268;
                                          v18 = 0;
                                          v535 = 0;
                                          *v48 = (id)objc_msgSend(v264, "initWithDomain:code:userInfo:", v269, 2);
                                          v65 = v629;
                                          v212 = v546;
                                          v48 = (id *)v544;
                                          goto LABEL_489;
                                        }
                                        v535 = 0;
                                        v18 = 0;
                                        v65 = v629;
                                        v212 = v546;
                                        v48 = (id *)v544;
                                        v242 = v539;
LABEL_490:

                                        goto LABEL_491;
                                      }
                                      if (v48)
                                      {
                                        v258 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v259 = *MEMORY[0x1E0D025B8];
                                        v701 = *MEMORY[0x1E0CB2D50];
                                        v260 = objc_alloc(MEMORY[0x1E0CB3940]);
                                        v454 = objc_opt_class();
                                        v261 = v260;
                                        self = v633;
                                        v242 = v539;
                                        v535 = (id)objc_msgSend(v261, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v454, CFSTR("clickCountInLastMonthNormalizedAcrossItems"));
                                        v702 = v535;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v702, &v701, 1);
                                        v262 = objc_claimAutoreleasedReturnValue();
                                        v263 = v259;
                                        v7 = v51;
                                        v536 = (void *)v262;
                                        v18 = 0;
                                        v537 = 0;
                                        *v48 = (id)objc_msgSend(v258, "initWithDomain:code:userInfo:", v263, 2);
                                        v65 = v629;
                                        v212 = v546;
                                        v48 = (id *)v544;
                                        goto LABEL_490;
                                      }
                                      v537 = 0;
                                      v18 = 0;
                                      v65 = v629;
                                      v212 = v546;
                                      v48 = (id *)v544;
                                      v242 = v539;
LABEL_491:

                                      goto LABEL_492;
                                    }
                                    if (v48)
                                    {
                                      v252 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v253 = *MEMORY[0x1E0D025B8];
                                      v703 = *MEMORY[0x1E0CB2D50];
                                      v254 = objc_alloc(MEMORY[0x1E0CB3940]);
                                      v453 = objc_opt_class();
                                      v255 = v254;
                                      self = v633;
                                      v242 = v539;
                                      v537 = (id)objc_msgSend(v255, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v453, CFSTR("clickCountInLastWeekNormalizedAcrossItems"));
                                      v704 = v537;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v704, &v703, 1);
                                      v256 = objc_claimAutoreleasedReturnValue();
                                      v257 = v253;
                                      v7 = v51;
                                      v538 = (void *)v256;
                                      v18 = 0;
                                      v540 = 0;
                                      *v48 = (id)objc_msgSend(v252, "initWithDomain:code:userInfo:", v257, 2);
                                      v65 = v629;
                                      v212 = v546;
                                      v48 = (id *)v544;
                                      goto LABEL_491;
                                    }
                                    v540 = 0;
                                    v18 = 0;
                                    v65 = v629;
                                    v212 = v546;
                                    v48 = (id *)v544;
                                    v242 = v539;
LABEL_492:

                                    goto LABEL_493;
                                  }
                                  if (v48)
                                  {
                                    v245 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v246 = *MEMORY[0x1E0D025B8];
                                    v705 = *MEMORY[0x1E0CB2D50];
                                    v247 = objc_alloc(MEMORY[0x1E0CB3940]);
                                    v452 = objc_opt_class();
                                    v248 = v247;
                                    self = v633;
                                    v540 = (id)objc_msgSend(v248, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v452, CFSTR("hasEverShareInLastMonth"));
                                    v706 = v540;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v706, &v705, 1);
                                    v249 = objc_claimAutoreleasedReturnValue();
                                    v250 = v246;
                                    v7 = v51;
                                    v541 = (void *)v249;
                                    v251 = (id)objc_msgSend(v245, "initWithDomain:code:userInfo:", v250, 2);
                                    v18 = 0;
                                    v242 = 0;
                                    *v48 = v251;
                                    v65 = v629;
                                    v212 = v546;
                                    v48 = (id *)v544;
                                    goto LABEL_492;
                                  }
                                  v242 = 0;
                                  v18 = 0;
LABEL_285:
                                  v65 = v629;
                                  v212 = v546;
                                  v48 = (id *)v544;
LABEL_493:

                                  v234 = v542;
                                  goto LABEL_494;
                                }
                                if (v48)
                                {
                                  v238 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v626 = v25;
                                  v239 = *MEMORY[0x1E0D025B8];
                                  v707 = *MEMORY[0x1E0CB2D50];
                                  v240 = objc_alloc(MEMORY[0x1E0CB3940]);
                                  v451 = objc_opt_class();
                                  v241 = v240;
                                  self = v633;
                                  v242 = (void *)objc_msgSend(v241, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v451, CFSTR("hasEverShareInLastWeek"));
                                  v708 = v242;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v708, &v707, 1);
                                  v243 = objc_claimAutoreleasedReturnValue();
                                  v244 = v239;
                                  v7 = v51;
                                  v49 = v626;
                                  v543 = (void *)v243;
                                  v18 = 0;
                                  v542 = 0;
                                  *v48 = (id)objc_msgSend(v238, "initWithDomain:code:userInfo:", v244, 2);
                                  goto LABEL_285;
                                }
                                v234 = 0;
                                v18 = 0;
                                v65 = v629;
                                v212 = v546;
                                v48 = (id *)v544;
LABEL_494:

                                goto LABEL_495;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v547 = v122;
                                goto LABEL_102;
                              }
                              v7 = v51;
                              if (v48)
                              {
                                v222 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v589 = v51;
                                v223 = *MEMORY[0x1E0D025B8];
                                v711 = *MEMORY[0x1E0CB2D50];
                                v224 = v48;
                                v225 = objc_alloc(MEMORY[0x1E0CB3940]);
                                v449 = objc_opt_class();
                                v226 = v225;
                                self = v633;
                                v32 = v549;
                                v48 = (id *)objc_msgSend(v226, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v449, CFSTR("hasEverClickInLastWeek"));
                                v712 = v48;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v712, &v711, 1);
                                v227 = objc_claimAutoreleasedReturnValue();
                                v228 = v223;
                                v7 = v589;
                                v49 = v25;
                                v545 = (void *)v227;
                                v18 = 0;
                                v547 = 0;
                                *v224 = (id)objc_msgSend(v222, "initWithDomain:code:userInfo:", v228, 2);
                                v65 = v629;
                                v212 = v546;
LABEL_496:

                                v9 = v613;
                                goto LABEL_497;
                              }
                              v547 = 0;
                              v18 = 0;
                              v65 = v629;
                              v212 = v546;
                              v9 = v613;
                              v32 = v549;
LABEL_497:

                              goto LABEL_498;
                            }
                            v212 = v120;
                            if (v48)
                            {
                              v214 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v618 = v31;
                              v588 = v51;
                              v215 = *MEMORY[0x1E0D025B8];
                              v713 = *MEMORY[0x1E0CB2D50];
                              v216 = v48;
                              v217 = objc_alloc(MEMORY[0x1E0CB3940]);
                              v448 = objc_opt_class();
                              v218 = v217;
                              self = v633;
                              v32 = v549;
                              v547 = (id)objc_msgSend(v218, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v448, CFSTR("curationScore"));
                              v714 = v547;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v714, &v713, 1);
                              v219 = objc_claimAutoreleasedReturnValue();
                              v220 = v214;
                              v221 = v215;
                              v9 = v613;
                              v7 = v588;
                              v49 = v25;
                              v31 = v618;
                              v548 = (void *)v219;
                              v18 = 0;
                              v559 = 0;
                              *v216 = (id)objc_msgSend(v220, "initWithDomain:code:userInfo:", v221, 2);
                              v65 = v629;
                              goto LABEL_497;
                            }
                            v559 = 0;
                            v18 = 0;
                            v65 = v629;
                            v7 = v51;
                            v9 = v613;
                            v32 = v549;
LABEL_498:
                            v25 = v49;

                            v50 = v560;
                            v205 = v558;
                            goto LABEL_499;
                          }
                          if (v48)
                          {
                            v208 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v587 = v7;
                            v209 = *MEMORY[0x1E0D025B8];
                            v715 = *MEMORY[0x1E0CB2D50];
                            v557 = v48;
                            v210 = objc_alloc(MEMORY[0x1E0CB3940]);
                            v447 = objc_opt_class();
                            v211 = v210;
                            self = v633;
                            v559 = (id)objc_msgSend(v211, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v447, CFSTR("aestheticScore"));
                            v716 = v559;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v716, &v715, 1);
                            v212 = (void *)objc_claimAutoreleasedReturnValue();
                            v213 = v209;
                            v9 = v613;
                            v7 = v587;
                            v18 = 0;
                            v558 = 0;
                            *v557 = (id)objc_msgSend(v208, "initWithDomain:code:userInfo:", v213, 2, v212);
                            v65 = v629;
                            goto LABEL_498;
                          }
                          v205 = 0;
                          v18 = 0;
                          v65 = v629;
                          v9 = v613;
LABEL_499:

                          v26 = v561;
                          goto LABEL_500;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v565 = v44;
                          goto LABEL_46;
                        }
                        if (v22)
                        {
                          v566 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v585 = v7;
                          v196 = *MEMORY[0x1E0D025B8];
                          v719 = *MEMORY[0x1E0CB2D50];
                          v555 = v22;
                          v197 = objc_alloc(MEMORY[0x1E0CB3940]);
                          v445 = objc_opt_class();
                          v198 = v197;
                          self = v633;
                          v103 = v574;
                          v562 = (id)objc_msgSend(v198, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v445, CFSTR("freshness"));
                          v720 = v562;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v720, &v719, 1);
                          v199 = objc_claimAutoreleasedReturnValue();
                          v200 = v196;
                          v7 = v585;
                          v564 = (void *)v199;
                          v201 = (id)objc_msgSend(v566, "initWithDomain:code:userInfo:", v200, 2);
                          v18 = 0;
                          v565 = 0;
                          *v555 = v201;
                          v65 = v629;
LABEL_501:

                          goto LABEL_502;
                        }
                        v565 = 0;
                        v18 = 0;
                        v65 = v629;
                        self = v633;
                        v103 = v574;
LABEL_502:

                        goto LABEL_503;
                      }
                      if (v22)
                      {
                        v569 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v584 = v7;
                        v190 = *MEMORY[0x1E0D025B8];
                        v721 = *MEMORY[0x1E0CB2D50];
                        v554 = v22;
                        v191 = objc_alloc(MEMORY[0x1E0CB3940]);
                        v444 = objc_opt_class();
                        v192 = v191;
                        self = v633;
                        v103 = v574;
                        v565 = (id)objc_msgSend(v192, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v444, CFSTR("L1Score"));
                        v722 = v565;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v722, &v721, 1);
                        v193 = objc_claimAutoreleasedReturnValue();
                        v194 = v190;
                        v7 = v584;
                        v567 = (void *)v193;
                        v195 = (id)objc_msgSend(v569, "initWithDomain:code:userInfo:", v194, 2);
                        v18 = 0;
                        v568 = 0;
                        *v554 = v195;
                        v65 = v629;
                        goto LABEL_502;
                      }
                      v568 = 0;
                      v18 = 0;
                      v65 = v629;
                      self = v633;
                      v103 = v574;
LABEL_503:

                      goto LABEL_504;
                    }
                    if (v22)
                    {
                      v572 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v583 = v7;
                      v184 = *MEMORY[0x1E0D025B8];
                      v723 = *MEMORY[0x1E0CB2D50];
                      v553 = v22;
                      v185 = objc_alloc(MEMORY[0x1E0CB3940]);
                      v443 = objc_opt_class();
                      v186 = v185;
                      self = v633;
                      v103 = v574;
                      v568 = (id)objc_msgSend(v186, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v443, CFSTR("matchedFieldsCount"));
                      v724 = v568;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v724, &v723, 1);
                      v187 = objc_claimAutoreleasedReturnValue();
                      v188 = v184;
                      v7 = v583;
                      v570 = (void *)v187;
                      v189 = (id)objc_msgSend(v572, "initWithDomain:code:userInfo:", v188, 2);
                      v18 = 0;
                      v571 = 0;
                      *v553 = v189;
                      v65 = v629;
                      goto LABEL_503;
                    }
                    v571 = 0;
                    v18 = 0;
                    v65 = v629;
                    self = v633;
                    v103 = v574;
LABEL_504:

                    goto LABEL_505;
                  }
                  if (v22)
                  {
                    v576 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v113 = v32;
                    v114 = *MEMORY[0x1E0D025B8];
                    v725 = *MEMORY[0x1E0CB2D50];
                    v551 = v22;
                    v115 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v442 = objc_opt_class();
                    v116 = v115;
                    self = v633;
                    v103 = v574;
                    v571 = (id)objc_msgSend(v116, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v442, CFSTR("matchedOCRImportance"));
                    v726 = v571;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v726, &v725, 1);
                    v117 = objc_claimAutoreleasedReturnValue();
                    v118 = v114;
                    v32 = v113;
                    v573 = (void *)v117;
                    v119 = (id)objc_msgSend(v576, "initWithDomain:code:userInfo:", v118, 2);
                    v18 = 0;
                    v575 = 0;
                    *v551 = v119;
                    v65 = v629;
                    goto LABEL_504;
                  }
                  v575 = 0;
                  v18 = 0;
                  v65 = v629;
                  self = v633;
                  v103 = v574;
LABEL_505:

                  goto LABEL_506;
                }
                if (v22)
                {
                  v578 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v105 = v32;
                  v106 = *MEMORY[0x1E0D025B8];
                  v727 = *MEMORY[0x1E0CB2D50];
                  v107 = v22;
                  v108 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v441 = objc_opt_class();
                  v109 = v108;
                  self = v633;
                  v575 = (id)objc_msgSend(v109, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v441, CFSTR("matchedOCRCharacterRatio"));
                  v728 = v575;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v728, &v727, 1);
                  v110 = objc_claimAutoreleasedReturnValue();
                  v111 = v578;
                  v112 = v106;
                  v32 = v105;
                  v577 = (void *)v110;
                  v18 = 0;
                  v103 = 0;
                  *v107 = (id)objc_msgSend(v111, "initWithDomain:code:userInfo:", v112, 2);
                  v65 = v629;
                  goto LABEL_505;
                }
                v103 = 0;
                v18 = 0;
                v65 = v629;
                self = v633;
LABEL_506:

                goto LABEL_507;
              }
              if (v22)
              {
                v611 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v581 = v7;
                v95 = v32;
                v96 = *MEMORY[0x1E0D025B8];
                v729 = *MEMORY[0x1E0CB2D50];
                v97 = v22;
                v98 = objc_alloc(MEMORY[0x1E0CB3940]);
                v440 = objc_opt_class();
                v99 = v98;
                self = v633;
                v100 = objc_msgSend(v99, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v440, CFSTR("matchedSceneBoundingBox"));
                v730 = v100;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v730, &v729, 1);
                v101 = objc_claimAutoreleasedReturnValue();
                v102 = v96;
                v32 = v95;
                v103 = (void *)v100;
                v7 = v581;
                v579 = (void *)v101;
                v104 = (id)objc_msgSend(v611, "initWithDomain:code:userInfo:", v102, 2);
                v18 = 0;
                v610 = 0;
                *v97 = v104;
                v65 = v629;
                goto LABEL_506;
              }
              v610 = 0;
              v18 = 0;
              v65 = v629;
              self = v633;
LABEL_507:

              goto LABEL_508;
            }
            if (v22)
            {
              v83 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v616 = v6;
              v624 = v25;
              v84 = *MEMORY[0x1E0D025B8];
              v731 = *MEMORY[0x1E0CB2D50];
              v85 = v22;
              v86 = objc_alloc(MEMORY[0x1E0CB3940]);
              v439 = objc_opt_class();
              v87 = v86;
              self = v633;
              v610 = (id)objc_msgSend(v87, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v439, CFSTR("matchedSceneConfidence"));
              v732 = v610;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v732, &v731, 1);
              v88 = objc_claimAutoreleasedReturnValue();
              v89 = v84;
              v25 = v624;
              v31 = v616;
              v612 = (void *)v88;
              v18 = 0;
              *v85 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v89, 2);
              v32 = 0;
              v65 = v629;
              goto LABEL_507;
            }
            v31 = v6;
            v32 = 0;
            v18 = 0;
            v65 = v629;
            self = v633;
LABEL_508:

            v6 = v31;
            v28 = v627;
            goto LABEL_509;
          }
          if (v22)
          {
            v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v615 = v6;
            v623 = v25;
            v75 = *MEMORY[0x1E0D025B8];
            v733 = *MEMORY[0x1E0CB2D50];
            v76 = v22;
            v77 = objc_alloc(MEMORY[0x1E0CB3940]);
            v438 = objc_opt_class();
            v78 = v77;
            self = v633;
            v79 = v26;
            v80 = objc_msgSend(v78, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v438, CFSTR("matchedSceneRatio"));
            v734 = v80;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v734, &v733, 1);
            v81 = objc_claimAutoreleasedReturnValue();
            v82 = v75;
            v25 = v623;
            v31 = v615;
            v628 = (void *)v81;
            v18 = 0;
            v630 = 0;
            *v76 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v82, 2);
            v32 = (id)v80;
            v26 = v79;
            v65 = v629;
            goto LABEL_508;
          }
          v630 = 0;
          v18 = 0;
          v65 = v629;
          self = v633;
LABEL_509:

          v21 = v631;
          goto LABEL_510;
        }
        if (v22)
        {
          v622 = v8;
          v580 = v7;
          v66 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v67 = *MEMORY[0x1E0D025B8];
          v735 = *MEMORY[0x1E0CB2D50];
          v68 = v22;
          v69 = objc_alloc(MEMORY[0x1E0CB3940]);
          v65 = v24;
          v437 = objc_opt_class();
          v70 = v69;
          self = v633;
          v630 = (id)objc_msgSend(v70, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v437, CFSTR("matchedLocationRatio"));
          v736 = v630;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v736, &v735, 1);
          v71 = objc_claimAutoreleasedReturnValue();
          v25 = v622;
          v72 = v67;
          v28 = (void *)v71;
          v73 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", v72, 2, v71);
          v18 = 0;
          v26 = 0;
          *v68 = v73;
          v7 = v580;
          goto LABEL_509;
        }
        v25 = v8;
        v26 = 0;
        v18 = 0;
        v65 = v24;
        self = v633;
LABEL_510:

        v8 = v25;
        v17 = v634;
        a4 = v632;
        goto LABEL_511;
      }
      if (a4)
      {
        v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v53 = v6;
        v54 = v21;
        v614 = v53;
        v621 = v8;
        v55 = v7;
        v56 = v52;
        v57 = self;
        v58 = *MEMORY[0x1E0D025B8];
        v737 = *MEMORY[0x1E0CB2D50];
        v59 = a4;
        v60 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("matchedPeopleRatio"));
        v738 = v60;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v738, &v737, 1);
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = v56;
        v25 = v621;
        v63 = v54;
        v6 = v614;
        v26 = (id)v60;
        v64 = v58;
        self = v57;
        v65 = (void *)v61;
        v18 = 0;
        v632 = 0;
        *v59 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v64, 2, v61);
        v7 = v55;
        v21 = v63;
        goto LABEL_510;
      }
      v18 = 0;
      v17 = v634;
LABEL_511:

      goto LABEL_512;
    }
    v19 = a4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAeroMLPhotosSearchLabeledDataUISurfaceTypeFromString(v20));
      v9 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    if (a4)
    {
      v90 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v91 = *MEMORY[0x1E0D025B8];
      v739 = *MEMORY[0x1E0CB2D50];
      a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("uiSurface"));
      v740 = a4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v740, &v739, 1);
      v92 = objc_claimAutoreleasedReturnValue();
      v93 = v90;
      v17 = v634;
      v94 = (id)objc_msgSend(v93, "initWithDomain:code:userInfo:", v91, 2, v92);
      v9 = 0;
      v18 = 0;
      *v19 = v94;
      v21 = (void *)v92;
      v6 = v10;
      goto LABEL_511;
    }
    v9 = 0;
    v18 = 0;
    v17 = v634;
LABEL_512:

    goto LABEL_513;
  }
  if (a4)
  {
    v11 = v6;
    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v13 = *MEMORY[0x1E0D025B8];
    v741 = *MEMORY[0x1E0CB2D50];
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("searchSessionUUID"));
    v742[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v742, &v741, 1);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v12;
    v6 = v11;
    v16 = v13;
    v8 = (void *)v14;
    v17 = 0;
    v18 = 0;
    *a4 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v14);
    goto LABEL_512;
  }
  v17 = 0;
  v18 = 0;
LABEL_513:

  return v18;
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
  double v98;
  void *v99;
  double v100;
  void *v101;
  double v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
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
  uint64_t v143;
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
  uint64_t v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
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
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  id v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
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
  id v243;
  id v244;
  id v245;
  id v246;
  id v247;
  id v248;
  id v249;
  id v250;
  id v251;
  id v252;
  id v253;
  id v254;
  id v255;
  id v256;
  id v257;
  id v258;
  id v259;
  id v260;
  id v261;
  id v262;
  id v263;
  _QWORD v264[54];
  _QWORD v265[56];

  v265[54] = *MEMORY[0x1E0C80C00];
  -[BMAeroMLPhotosSearchLabeledData searchSessionUUID](self, "searchSessionUUID");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAeroMLPhotosSearchLabeledData uiSurface](self, "uiSurface"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!-[BMAeroMLPhotosSearchLabeledData hasMatchedPeopleRatio](self, "hasMatchedPeopleRatio")
    || (-[BMAeroMLPhotosSearchLabeledData matchedPeopleRatio](self, "matchedPeopleRatio"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData matchedPeopleRatio](self, "matchedPeopleRatio");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData matchedPeopleRatio](self, "matchedPeopleRatio");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasMatchedLocationRatio](self, "hasMatchedLocationRatio")
    || (-[BMAeroMLPhotosSearchLabeledData matchedLocationRatio](self, "matchedLocationRatio"), fabs(v8) == INFINITY))
  {
    v10 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData matchedLocationRatio](self, "matchedLocationRatio");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData matchedLocationRatio](self, "matchedLocationRatio");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasMatchedSceneRatio](self, "hasMatchedSceneRatio")
    || (-[BMAeroMLPhotosSearchLabeledData matchedSceneRatio](self, "matchedSceneRatio"), fabs(v11) == INFINITY))
  {
    v13 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData matchedSceneRatio](self, "matchedSceneRatio");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData matchedSceneRatio](self, "matchedSceneRatio");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasMatchedSceneConfidence](self, "hasMatchedSceneConfidence")
    || (-[BMAeroMLPhotosSearchLabeledData matchedSceneConfidence](self, "matchedSceneConfidence"), fabs(v14) == INFINITY))
  {
    v16 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData matchedSceneConfidence](self, "matchedSceneConfidence");
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData matchedSceneConfidence](self, "matchedSceneConfidence");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasMatchedSceneBoundingBox](self, "hasMatchedSceneBoundingBox")
    || (-[BMAeroMLPhotosSearchLabeledData matchedSceneBoundingBox](self, "matchedSceneBoundingBox"),
        fabs(v17) == INFINITY))
  {
    v19 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData matchedSceneBoundingBox](self, "matchedSceneBoundingBox");
    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData matchedSceneBoundingBox](self, "matchedSceneBoundingBox");
    objc_msgSend(v18, "numberWithDouble:");
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasMatchedOCRCharacterRatio](self, "hasMatchedOCRCharacterRatio")
    || (-[BMAeroMLPhotosSearchLabeledData matchedOCRCharacterRatio](self, "matchedOCRCharacterRatio"),
        fabs(v20) == INFINITY))
  {
    v263 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData matchedOCRCharacterRatio](self, "matchedOCRCharacterRatio");
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData matchedOCRCharacterRatio](self, "matchedOCRCharacterRatio");
    objc_msgSend(v21, "numberWithDouble:");
    v263 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasMatchedOCRImportance](self, "hasMatchedOCRImportance")
    || (-[BMAeroMLPhotosSearchLabeledData matchedOCRImportance](self, "matchedOCRImportance"), fabs(v22) == INFINITY))
  {
    v262 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData matchedOCRImportance](self, "matchedOCRImportance");
    v23 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData matchedOCRImportance](self, "matchedOCRImportance");
    objc_msgSend(v23, "numberWithDouble:");
    v262 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMAeroMLPhotosSearchLabeledData hasMatchedFieldsCount](self, "hasMatchedFieldsCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchLabeledData matchedFieldsCount](self, "matchedFieldsCount"));
    v261 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v261 = 0;
  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasL1Score](self, "hasL1Score")
    || (-[BMAeroMLPhotosSearchLabeledData L1Score](self, "L1Score"), fabs(v24) == INFINITY))
  {
    v260 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData L1Score](self, "L1Score");
    v25 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData L1Score](self, "L1Score");
    objc_msgSend(v25, "numberWithDouble:");
    v260 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasFreshness](self, "hasFreshness")
    || (-[BMAeroMLPhotosSearchLabeledData freshness](self, "freshness"), fabs(v26) == INFINITY))
  {
    v259 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData freshness](self, "freshness");
    v27 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData freshness](self, "freshness");
    objc_msgSend(v27, "numberWithDouble:");
    v259 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMAeroMLPhotosSearchLabeledData hasFavorited](self, "hasFavorited"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchLabeledData favorited](self, "favorited"));
    v258 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v258 = 0;
  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasAestheticScore](self, "hasAestheticScore")
    || (-[BMAeroMLPhotosSearchLabeledData aestheticScore](self, "aestheticScore"), fabs(v28) == INFINITY))
  {
    v257 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData aestheticScore](self, "aestheticScore");
    v29 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData aestheticScore](self, "aestheticScore");
    objc_msgSend(v29, "numberWithDouble:");
    v257 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasCurationScore](self, "hasCurationScore")
    || (-[BMAeroMLPhotosSearchLabeledData curationScore](self, "curationScore"), fabs(v30) == INFINITY))
  {
    v256 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData curationScore](self, "curationScore");
    v31 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData curationScore](self, "curationScore");
    objc_msgSend(v31, "numberWithDouble:");
    v256 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasHasEverClickInLastWeek](self, "hasHasEverClickInLastWeek")
    || (-[BMAeroMLPhotosSearchLabeledData hasEverClickInLastWeek](self, "hasEverClickInLastWeek"), fabs(v32) == INFINITY))
  {
    v255 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData hasEverClickInLastWeek](self, "hasEverClickInLastWeek");
    v33 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData hasEverClickInLastWeek](self, "hasEverClickInLastWeek");
    objc_msgSend(v33, "numberWithDouble:");
    v255 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasHasEverClickInLastMonth](self, "hasHasEverClickInLastMonth")
    || (-[BMAeroMLPhotosSearchLabeledData hasEverClickInLastMonth](self, "hasEverClickInLastMonth"),
        fabs(v34) == INFINITY))
  {
    v254 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData hasEverClickInLastMonth](self, "hasEverClickInLastMonth");
    v35 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData hasEverClickInLastMonth](self, "hasEverClickInLastMonth");
    objc_msgSend(v35, "numberWithDouble:");
    v254 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasHasEverShareInLastWeek](self, "hasHasEverShareInLastWeek")
    || (-[BMAeroMLPhotosSearchLabeledData hasEverShareInLastWeek](self, "hasEverShareInLastWeek"), fabs(v36) == INFINITY))
  {
    v253 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData hasEverShareInLastWeek](self, "hasEverShareInLastWeek");
    v37 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData hasEverShareInLastWeek](self, "hasEverShareInLastWeek");
    objc_msgSend(v37, "numberWithDouble:");
    v253 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasHasEverShareInLastMonth](self, "hasHasEverShareInLastMonth")
    || (-[BMAeroMLPhotosSearchLabeledData hasEverShareInLastMonth](self, "hasEverShareInLastMonth"),
        fabs(v38) == INFINITY))
  {
    v252 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData hasEverShareInLastMonth](self, "hasEverShareInLastMonth");
    v39 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData hasEverShareInLastMonth](self, "hasEverShareInLastMonth");
    objc_msgSend(v39, "numberWithDouble:");
    v252 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountInLastWeekNormalizedAcrossItems](self, "hasClickCountInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData clickCountInLastWeekNormalizedAcrossItems](self, "clickCountInLastWeekNormalizedAcrossItems"), fabs(v40) == INFINITY))
  {
    v251 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData clickCountInLastWeekNormalizedAcrossItems](self, "clickCountInLastWeekNormalizedAcrossItems");
    v41 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData clickCountInLastWeekNormalizedAcrossItems](self, "clickCountInLastWeekNormalizedAcrossItems");
    objc_msgSend(v41, "numberWithDouble:");
    v251 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountInLastMonthNormalizedAcrossItems](self, "hasClickCountInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData clickCountInLastMonthNormalizedAcrossItems](self, "clickCountInLastMonthNormalizedAcrossItems"), fabs(v42) == INFINITY))
  {
    v250 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData clickCountInLastMonthNormalizedAcrossItems](self, "clickCountInLastMonthNormalizedAcrossItems");
    v43 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData clickCountInLastMonthNormalizedAcrossItems](self, "clickCountInLastMonthNormalizedAcrossItems");
    objc_msgSend(v43, "numberWithDouble:");
    v250 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountInLastWeekNormalizedAcrossItems](self, "hasShareCountInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData shareCountInLastWeekNormalizedAcrossItems](self, "shareCountInLastWeekNormalizedAcrossItems"), fabs(v44) == INFINITY))
  {
    v249 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData shareCountInLastWeekNormalizedAcrossItems](self, "shareCountInLastWeekNormalizedAcrossItems");
    v45 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData shareCountInLastWeekNormalizedAcrossItems](self, "shareCountInLastWeekNormalizedAcrossItems");
    objc_msgSend(v45, "numberWithDouble:");
    v249 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountInLastMonthNormalizedAcrossItems](self, "hasShareCountInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData shareCountInLastMonthNormalizedAcrossItems](self, "shareCountInLastMonthNormalizedAcrossItems"), fabs(v46) == INFINITY))
  {
    v248 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData shareCountInLastMonthNormalizedAcrossItems](self, "shareCountInLastMonthNormalizedAcrossItems");
    v47 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData shareCountInLastMonthNormalizedAcrossItems](self, "shareCountInLastMonthNormalizedAcrossItems");
    objc_msgSend(v47, "numberWithDouble:");
    v248 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), fabs(v48) == INFINITY))
  {
    v247 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems");
    v49 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems");
    objc_msgSend(v49, "numberWithDouble:");
    v247 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), fabs(v50) == INFINITY))
  {
    v246 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems");
    v51 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems");
    objc_msgSend(v51, "numberWithDouble:");
    v246 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData clickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "clickCountGivenLocationInLastWeekNormalizedAcrossItems"), fabs(v52) == INFINITY))
  {
    v245 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "clickCountGivenLocationInLastWeekNormalizedAcrossItems");
    v53 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "clickCountGivenLocationInLastWeekNormalizedAcrossItems");
    objc_msgSend(v53, "numberWithDouble:");
    v245 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData clickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "clickCountGivenLocationInLastMonthNormalizedAcrossItems"), fabs(v54) == INFINITY))
  {
    v244 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "clickCountGivenLocationInLastMonthNormalizedAcrossItems");
    v55 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "clickCountGivenLocationInLastMonthNormalizedAcrossItems");
    objc_msgSend(v55, "numberWithDouble:");
    v244 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), fabs(v56) == INFINITY))
  {
    v243 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems");
    v57 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems");
    objc_msgSend(v57, "numberWithDouble:");
    v243 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), fabs(v58) == INFINITY))
  {
    v242 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems");
    v59 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems");
    objc_msgSend(v59, "numberWithDouble:");
    v242 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), fabs(v60) == INFINITY))
  {
    v241 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems");
    v61 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems");
    objc_msgSend(v61, "numberWithDouble:");
    v241 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), fabs(v62) == INFINITY))
  {
    v240 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems");
    v63 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems");
    objc_msgSend(v63, "numberWithDouble:");
    v240 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), fabs(v64) == INFINITY))
  {
    v239 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems");
    v65 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems");
    objc_msgSend(v65, "numberWithDouble:");
    v239 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), fabs(v66) == INFINITY))
  {
    v238 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems");
    v67 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems");
    objc_msgSend(v67, "numberWithDouble:");
    v238 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), fabs(v68) == INFINITY))
  {
    v237 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems");
    v69 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems");
    objc_msgSend(v69, "numberWithDouble:");
    v237 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), fabs(v70) == INFINITY))
  {
    v236 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems");
    v71 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems");
    objc_msgSend(v71, "numberWithDouble:");
    v236 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), fabs(v72) == INFINITY))
  {
    v235 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems");
    v73 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems");
    objc_msgSend(v73, "numberWithDouble:");
    v235 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), fabs(v74) == INFINITY))
  {
    v234 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems");
    v75 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems");
    objc_msgSend(v75, "numberWithDouble:");
    v234 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData shareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "shareCountGivenLocationInLastWeekNormalizedAcrossItems"), fabs(v76) == INFINITY))
  {
    v233 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "shareCountGivenLocationInLastWeekNormalizedAcrossItems");
    v77 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "shareCountGivenLocationInLastWeekNormalizedAcrossItems");
    objc_msgSend(v77, "numberWithDouble:");
    v233 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData shareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "shareCountGivenLocationInLastMonthNormalizedAcrossItems"), fabs(v78) == INFINITY))
  {
    v232 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "shareCountGivenLocationInLastMonthNormalizedAcrossItems");
    v79 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "shareCountGivenLocationInLastMonthNormalizedAcrossItems");
    objc_msgSend(v79, "numberWithDouble:");
    v232 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), fabs(v80) == INFINITY))
  {
    v231 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems");
    v81 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems");
    objc_msgSend(v81, "numberWithDouble:");
    v231 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), fabs(v82) == INFINITY))
  {
    v230 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems");
    v83 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems");
    objc_msgSend(v83, "numberWithDouble:");
    v230 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), fabs(v84) == INFINITY))
  {
    v229 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems");
    v85 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems");
    objc_msgSend(v85, "numberWithDouble:");
    v229 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), fabs(v86) == INFINITY))
  {
    v228 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems");
    v87 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems");
    objc_msgSend(v87, "numberWithDouble:");
    v228 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), fabs(v88) == INFINITY))
  {
    v227 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems");
    v89 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems");
    objc_msgSend(v89, "numberWithDouble:");
    v227 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), fabs(v90) == INFINITY))
  {
    v226 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems");
    v91 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems");
    objc_msgSend(v91, "numberWithDouble:");
    v226 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), fabs(v92) == INFINITY))
  {
    v225 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems");
    v93 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems");
    objc_msgSend(v93, "numberWithDouble:");
    v225 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")|| (-[BMAeroMLPhotosSearchLabeledData shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), fabs(v94) == INFINITY))
  {
    v224 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems");
    v95 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems");
    objc_msgSend(v95, "numberWithDouble:");
    v224 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasClipScore](self, "hasClipScore")
    || (-[BMAeroMLPhotosSearchLabeledData clipScore](self, "clipScore"), fabs(v96) == INFINITY))
  {
    v223 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData clipScore](self, "clipScore");
    v97 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData clipScore](self, "clipScore");
    objc_msgSend(v97, "numberWithDouble:");
    v223 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMAeroMLPhotosSearchLabeledData hasClicked](self, "hasClicked"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAeroMLPhotosSearchLabeledData clicked](self, "clicked"));
    v222 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v222 = 0;
  }
  if (-[BMAeroMLPhotosSearchLabeledData hasClickOrder](self, "hasClickOrder"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchLabeledData clickOrder](self, "clickOrder"));
    v221 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v221 = 0;
  }
  if (-[BMAeroMLPhotosSearchLabeledData hasItemPosition](self, "hasItemPosition"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchLabeledData itemPosition](self, "itemPosition"));
    v220 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v220 = 0;
  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasL2ModelScore](self, "hasL2ModelScore")
    || (-[BMAeroMLPhotosSearchLabeledData L2ModelScore](self, "L2ModelScore"), fabs(v98) == INFINITY))
  {
    v219 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData L2ModelScore](self, "L2ModelScore");
    v99 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData L2ModelScore](self, "L2ModelScore");
    objc_msgSend(v99, "numberWithDouble:");
    v219 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasIsDuplicate](self, "hasIsDuplicate")
    || (-[BMAeroMLPhotosSearchLabeledData isDuplicate](self, "isDuplicate"), fabs(v100) == INFINITY))
  {
    v218 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData isDuplicate](self, "isDuplicate");
    v101 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData isDuplicate](self, "isDuplicate");
    objc_msgSend(v101, "numberWithDouble:");
    v218 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMAeroMLPhotosSearchLabeledData hasIsCompleteMatch](self, "hasIsCompleteMatch")
    || (-[BMAeroMLPhotosSearchLabeledData isCompleteMatch](self, "isCompleteMatch"), fabs(v102) == INFINITY))
  {
    v217 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchLabeledData isCompleteMatch](self, "isCompleteMatch");
    v103 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchLabeledData isCompleteMatch](self, "isCompleteMatch");
    objc_msgSend(v103, "numberWithDouble:");
    v217 = (id)objc_claimAutoreleasedReturnValue();

  }
  v264[0] = CFSTR("searchSessionUUID");
  v104 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v104 = objc_claimAutoreleasedReturnValue();
  }
  v211 = (void *)v104;
  v265[0] = v104;
  v264[1] = CFSTR("uiSurface");
  v105 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v105 = objc_claimAutoreleasedReturnValue();
  }
  v210 = (void *)v105;
  v265[1] = v105;
  v264[2] = CFSTR("matchedPeopleRatio");
  v106 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v106 = objc_claimAutoreleasedReturnValue();
  }
  v209 = (void *)v106;
  v265[2] = v106;
  v264[3] = CFSTR("matchedLocationRatio");
  v107 = (uint64_t)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v107 = objc_claimAutoreleasedReturnValue();
  }
  v208 = (void *)v107;
  v265[3] = v107;
  v264[4] = CFSTR("matchedSceneRatio");
  v108 = (uint64_t)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v108 = objc_claimAutoreleasedReturnValue();
  }
  v207 = (void *)v108;
  v265[4] = v108;
  v264[5] = CFSTR("matchedSceneConfidence");
  v109 = (uint64_t)v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v109 = objc_claimAutoreleasedReturnValue();
  }
  v206 = (void *)v109;
  v265[5] = v109;
  v264[6] = CFSTR("matchedSceneBoundingBox");
  v110 = (uint64_t)v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v110 = objc_claimAutoreleasedReturnValue();
  }
  v205 = (void *)v110;
  v265[6] = v110;
  v264[7] = CFSTR("matchedOCRCharacterRatio");
  v111 = (uint64_t)v263;
  if (!v263)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v111 = objc_claimAutoreleasedReturnValue();
  }
  v265[7] = v111;
  v264[8] = CFSTR("matchedOCRImportance");
  v112 = (uint64_t)v262;
  if (!v262)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v112 = objc_claimAutoreleasedReturnValue();
  }
  v213 = v19;
  v265[8] = v112;
  v264[9] = CFSTR("matchedFieldsCount");
  v113 = (uint64_t)v261;
  if (!v261)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v113 = objc_claimAutoreleasedReturnValue();
  }
  v114 = v13;
  v265[9] = v113;
  v264[10] = CFSTR("L1Score");
  v115 = (uint64_t)v260;
  if (!v260)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v115 = objc_claimAutoreleasedReturnValue();
  }
  v116 = v10;
  v201 = (void *)v115;
  v265[10] = v115;
  v264[11] = CFSTR("freshness");
  v117 = (uint64_t)v259;
  if (!v259)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v117 = objc_claimAutoreleasedReturnValue();
  }
  v118 = (void *)v3;
  v214 = (void *)v117;
  v265[11] = v117;
  v264[12] = CFSTR("favorited");
  v119 = (uint64_t)v258;
  if (!v258)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v119 = objc_claimAutoreleasedReturnValue();
  }
  v120 = (void *)v119;
  v265[12] = v119;
  v264[13] = CFSTR("aestheticScore");
  v121 = (uint64_t)v257;
  if (!v257)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v121 = objc_claimAutoreleasedReturnValue();
  }
  v200 = (void *)v121;
  v265[13] = v121;
  v264[14] = CFSTR("curationScore");
  v122 = (uint64_t)v256;
  if (!v256)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v122 = objc_claimAutoreleasedReturnValue();
  }
  v199 = (void *)v122;
  v265[14] = v122;
  v264[15] = CFSTR("hasEverClickInLastWeek");
  v123 = (uint64_t)v255;
  if (!v255)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v123 = objc_claimAutoreleasedReturnValue();
  }
  v198 = (void *)v123;
  v265[15] = v123;
  v264[16] = CFSTR("hasEverClickInLastMonth");
  v124 = (uint64_t)v254;
  if (!v254)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v124 = objc_claimAutoreleasedReturnValue();
  }
  v197 = (void *)v124;
  v265[16] = v124;
  v264[17] = CFSTR("hasEverShareInLastWeek");
  v125 = (uint64_t)v253;
  if (!v253)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v125 = objc_claimAutoreleasedReturnValue();
  }
  v196 = (void *)v125;
  v265[17] = v125;
  v264[18] = CFSTR("hasEverShareInLastMonth");
  v126 = (uint64_t)v252;
  if (!v252)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v126 = objc_claimAutoreleasedReturnValue();
  }
  v195 = (void *)v126;
  v265[18] = v126;
  v264[19] = CFSTR("clickCountInLastWeekNormalizedAcrossItems");
  v127 = (uint64_t)v251;
  if (!v251)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v127 = objc_claimAutoreleasedReturnValue();
  }
  v194 = (void *)v127;
  v265[19] = v127;
  v264[20] = CFSTR("clickCountInLastMonthNormalizedAcrossItems");
  v128 = (uint64_t)v250;
  if (!v250)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v128 = objc_claimAutoreleasedReturnValue();
  }
  v193 = (void *)v128;
  v265[20] = v128;
  v264[21] = CFSTR("shareCountInLastWeekNormalizedAcrossItems");
  v129 = (uint64_t)v249;
  if (!v249)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v129 = objc_claimAutoreleasedReturnValue();
  }
  v192 = (void *)v129;
  v265[21] = v129;
  v264[22] = CFSTR("shareCountInLastMonthNormalizedAcrossItems");
  v130 = (uint64_t)v248;
  if (!v248)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v130 = objc_claimAutoreleasedReturnValue();
  }
  v191 = (void *)v130;
  v265[22] = v130;
  v264[23] = CFSTR("clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems");
  v131 = (uint64_t)v247;
  if (!v247)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v131 = objc_claimAutoreleasedReturnValue();
  }
  v190 = (void *)v131;
  v265[23] = v131;
  v264[24] = CFSTR("clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems");
  v132 = (uint64_t)v246;
  if (!v246)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v132 = objc_claimAutoreleasedReturnValue();
  }
  v189 = (void *)v132;
  v265[24] = v132;
  v264[25] = CFSTR("clickCountGivenLocationInLastWeekNormalizedAcrossItems");
  v133 = (uint64_t)v245;
  if (!v245)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v133 = objc_claimAutoreleasedReturnValue();
  }
  v188 = (void *)v133;
  v265[25] = v133;
  v264[26] = CFSTR("clickCountGivenLocationInLastMonthNormalizedAcrossItems");
  v134 = (uint64_t)v244;
  if (!v244)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v134 = objc_claimAutoreleasedReturnValue();
  }
  v187 = (void *)v134;
  v265[26] = v134;
  v264[27] = CFSTR("clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems");
  v135 = (uint64_t)v243;
  if (!v243)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v135 = objc_claimAutoreleasedReturnValue();
  }
  v186 = (void *)v135;
  v265[27] = v135;
  v264[28] = CFSTR("clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems");
  v136 = (uint64_t)v242;
  if (!v242)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v136 = objc_claimAutoreleasedReturnValue();
  }
  v185 = (void *)v136;
  v265[28] = v136;
  v264[29] = CFSTR("clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems");
  v137 = (uint64_t)v241;
  if (!v241)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v137 = objc_claimAutoreleasedReturnValue();
  }
  v184 = (void *)v137;
  v265[29] = v137;
  v264[30] = CFSTR("clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems");
  v138 = (uint64_t)v240;
  if (!v240)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v138 = objc_claimAutoreleasedReturnValue();
  }
  v183 = (void *)v138;
  v265[30] = v138;
  v264[31] = CFSTR("clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems");
  v139 = (uint64_t)v239;
  if (!v239)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v139 = objc_claimAutoreleasedReturnValue();
  }
  v182 = (void *)v139;
  v265[31] = v139;
  v264[32] = CFSTR("clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems");
  v140 = (uint64_t)v238;
  if (!v238)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v140 = objc_claimAutoreleasedReturnValue();
  }
  v181 = (void *)v140;
  v265[32] = v140;
  v264[33] = CFSTR("clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems");
  v141 = (uint64_t)v237;
  if (!v237)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v141 = objc_claimAutoreleasedReturnValue();
  }
  v180 = (void *)v141;
  v265[33] = v141;
  v264[34] = CFSTR("clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems");
  v142 = (uint64_t)v236;
  if (!v236)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v142 = objc_claimAutoreleasedReturnValue();
  }
  v179 = (void *)v142;
  v265[34] = v142;
  v264[35] = CFSTR("shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems");
  v143 = (uint64_t)v235;
  if (!v235)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v143 = objc_claimAutoreleasedReturnValue();
  }
  v178 = (void *)v143;
  v265[35] = v143;
  v264[36] = CFSTR("shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems");
  v144 = (uint64_t)v234;
  if (!v234)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v144 = objc_claimAutoreleasedReturnValue();
  }
  v177 = (void *)v144;
  v265[36] = v144;
  v264[37] = CFSTR("shareCountGivenLocationInLastWeekNormalizedAcrossItems");
  v145 = (uint64_t)v233;
  if (!v233)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v145 = objc_claimAutoreleasedReturnValue();
  }
  v176 = (void *)v145;
  v265[37] = v145;
  v264[38] = CFSTR("shareCountGivenLocationInLastMonthNormalizedAcrossItems");
  v146 = (uint64_t)v232;
  if (!v232)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v146 = objc_claimAutoreleasedReturnValue();
  }
  v175 = (void *)v146;
  v265[38] = v146;
  v264[39] = CFSTR("shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems");
  v147 = (uint64_t)v231;
  if (!v231)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v147 = objc_claimAutoreleasedReturnValue();
  }
  v174 = (void *)v147;
  v265[39] = v147;
  v264[40] = CFSTR("shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems");
  v148 = (uint64_t)v230;
  if (!v230)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v148 = objc_claimAutoreleasedReturnValue();
  }
  v173 = (void *)v148;
  v265[40] = v148;
  v264[41] = CFSTR("shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems");
  v149 = (uint64_t)v229;
  if (!v229)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v149 = objc_claimAutoreleasedReturnValue();
  }
  v172 = (void *)v149;
  v265[41] = v149;
  v264[42] = CFSTR("shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems");
  v150 = (uint64_t)v228;
  if (!v228)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v150 = objc_claimAutoreleasedReturnValue();
  }
  v171 = (void *)v150;
  v265[42] = v150;
  v264[43] = CFSTR("shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems");
  v151 = (uint64_t)v227;
  if (!v227)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v151 = objc_claimAutoreleasedReturnValue();
  }
  v170 = (void *)v151;
  v265[43] = v151;
  v264[44] = CFSTR("shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems");
  v152 = (uint64_t)v226;
  if (!v226)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v152 = objc_claimAutoreleasedReturnValue();
  }
  v169 = (void *)v152;
  v265[44] = v152;
  v264[45] = CFSTR("shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems");
  v153 = (uint64_t)v225;
  if (!v225)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v153 = objc_claimAutoreleasedReturnValue();
  }
  v168 = (void *)v153;
  v265[45] = v153;
  v264[46] = CFSTR("shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems");
  v154 = (uint64_t)v224;
  if (!v224)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v154 = objc_claimAutoreleasedReturnValue();
  }
  v216 = (void *)v4;
  v167 = (void *)v154;
  v265[46] = v154;
  v264[47] = CFSTR("clipScore");
  v155 = (uint64_t)v223;
  if (!v223)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v155 = objc_claimAutoreleasedReturnValue();
  }
  v203 = (void *)v112;
  v166 = (void *)v155;
  v265[47] = v155;
  v264[48] = CFSTR("clicked");
  v156 = (uint64_t)v222;
  if (!v222)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v156 = objc_claimAutoreleasedReturnValue();
  }
  v215 = v7;
  v165 = (void *)v156;
  v265[48] = v156;
  v264[49] = CFSTR("clickOrder");
  v157 = v221;
  if (!v221)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v202 = (void *)v113;
  v265[49] = v157;
  v264[50] = CFSTR("itemPosition");
  v158 = v220;
  if (!v220)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v159 = v114;
  v265[50] = v158;
  v264[51] = CFSTR("L2ModelScore");
  v160 = v219;
  if (!v219)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v204 = (void *)v111;
  v265[51] = v160;
  v264[52] = CFSTR("isDuplicate");
  v161 = v218;
  if (!v218)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v265[52] = v161;
  v264[53] = CFSTR("isCompleteMatch");
  v162 = v217;
  if (!v217)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v265[53] = v162;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v265, v264, 54);
  v212 = (id)objc_claimAutoreleasedReturnValue();
  if (!v217)

  v163 = v120;
  if (!v218)
  {

    v163 = v120;
  }
  if (!v219)
  {

    v163 = v120;
  }
  if (!v220)
  {

    v163 = v120;
  }
  if (!v221)
  {

    v163 = v120;
  }
  if (!v222)
  {

    v163 = v120;
  }
  if (!v223)
  {

    v163 = v120;
  }
  if (!v224)
  {

    v163 = v120;
  }
  if (!v225)
  {

    v163 = v120;
  }
  if (!v226)
  {

    v163 = v120;
  }
  if (!v227)
  {

    v163 = v120;
  }
  if (!v228)
  {

    v163 = v120;
  }
  if (!v229)
  {

    v163 = v120;
  }
  if (!v230)
  {

    v163 = v120;
  }
  if (!v231)
  {

    v163 = v120;
  }
  if (!v232)
  {

    v163 = v120;
  }
  if (!v233)
  {

    v163 = v120;
  }
  if (!v234)
  {

    v163 = v120;
  }
  if (!v235)
  {

    v163 = v120;
  }
  if (!v236)
  {

    v163 = v120;
  }
  if (!v237)
  {

    v163 = v120;
  }
  if (!v238)
  {

    v163 = v120;
  }
  if (!v239)
  {

    v163 = v120;
  }
  if (!v240)
  {

    v163 = v120;
  }
  if (!v241)
  {

    v163 = v120;
  }
  if (!v242)
  {

    v163 = v120;
  }
  if (!v243)
  {

    v163 = v120;
  }
  if (!v244)
  {

    v163 = v120;
  }
  if (!v245)
  {

    v163 = v120;
  }
  if (!v246)
  {

    v163 = v120;
  }
  if (!v247)
  {

    v163 = v120;
  }
  if (!v248)
  {

    v163 = v120;
  }
  if (!v249)
  {

    v163 = v120;
  }
  if (!v250)
  {

    v163 = v120;
  }
  if (!v251)
  {

    v163 = v120;
  }
  if (!v252)
  {

    v163 = v120;
  }
  if (!v253)
  {

    v163 = v120;
  }
  if (!v254)
  {

    v163 = v120;
  }
  if (!v255)
  {

    v163 = v120;
  }
  if (!v256)
  {

    v163 = v120;
  }
  if (!v257)
  {

    v163 = v120;
  }
  if (!v258)

  if (!v259)
  if (!v260)

  if (!v261)
  if (!v262)

  if (v263)
  {
    if (v213)
      goto LABEL_406;
  }
  else
  {

    if (v213)
    {
LABEL_406:
      if (v16)
        goto LABEL_407;
      goto LABEL_415;
    }
  }

  if (v16)
  {
LABEL_407:
    if (v159)
      goto LABEL_408;
    goto LABEL_416;
  }
LABEL_415:

  if (v159)
  {
LABEL_408:
    if (v116)
      goto LABEL_409;
    goto LABEL_417;
  }
LABEL_416:

  if (v116)
  {
LABEL_409:
    if (v215)
      goto LABEL_410;
    goto LABEL_418;
  }
LABEL_417:

  if (v215)
  {
LABEL_410:
    if (v216)
      goto LABEL_411;
LABEL_419:

    if (v118)
      goto LABEL_412;
LABEL_420:

    goto LABEL_412;
  }
LABEL_418:

  if (!v216)
    goto LABEL_419;
LABEL_411:
  if (!v118)
    goto LABEL_420;
LABEL_412:

  return v212;
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
  int v148;
  unsigned int v149;
  unsigned int v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAeroMLPhotosSearchLabeledData searchSessionUUID](self, "searchSessionUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchSessionUUID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAeroMLPhotosSearchLabeledData searchSessionUUID](self, "searchSessionUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "searchSessionUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_268;
    }
    v13 = -[BMAeroMLPhotosSearchLabeledData uiSurface](self, "uiSurface");
    if (v13 == objc_msgSend(v5, "uiSurface"))
    {
      if (!-[BMAeroMLPhotosSearchLabeledData hasMatchedPeopleRatio](self, "hasMatchedPeopleRatio")
        && !objc_msgSend(v5, "hasMatchedPeopleRatio")
        || -[BMAeroMLPhotosSearchLabeledData hasMatchedPeopleRatio](self, "hasMatchedPeopleRatio")
        && objc_msgSend(v5, "hasMatchedPeopleRatio")
        && (-[BMAeroMLPhotosSearchLabeledData matchedPeopleRatio](self, "matchedPeopleRatio"),
            v15 = v14,
            objc_msgSend(v5, "matchedPeopleRatio"),
            v15 == v16))
      {
        if (!-[BMAeroMLPhotosSearchLabeledData hasMatchedLocationRatio](self, "hasMatchedLocationRatio")
          && !objc_msgSend(v5, "hasMatchedLocationRatio")
          || -[BMAeroMLPhotosSearchLabeledData hasMatchedLocationRatio](self, "hasMatchedLocationRatio")
          && objc_msgSend(v5, "hasMatchedLocationRatio")
          && (-[BMAeroMLPhotosSearchLabeledData matchedLocationRatio](self, "matchedLocationRatio"),
              v18 = v17,
              objc_msgSend(v5, "matchedLocationRatio"),
              v18 == v19))
        {
          if (!-[BMAeroMLPhotosSearchLabeledData hasMatchedSceneRatio](self, "hasMatchedSceneRatio")
            && !objc_msgSend(v5, "hasMatchedSceneRatio")
            || -[BMAeroMLPhotosSearchLabeledData hasMatchedSceneRatio](self, "hasMatchedSceneRatio")
            && objc_msgSend(v5, "hasMatchedSceneRatio")
            && (-[BMAeroMLPhotosSearchLabeledData matchedSceneRatio](self, "matchedSceneRatio"),
                v21 = v20,
                objc_msgSend(v5, "matchedSceneRatio"),
                v21 == v22))
          {
            if (!-[BMAeroMLPhotosSearchLabeledData hasMatchedSceneConfidence](self, "hasMatchedSceneConfidence")
              && !objc_msgSend(v5, "hasMatchedSceneConfidence")
              || -[BMAeroMLPhotosSearchLabeledData hasMatchedSceneConfidence](self, "hasMatchedSceneConfidence")
              && objc_msgSend(v5, "hasMatchedSceneConfidence")
              && (-[BMAeroMLPhotosSearchLabeledData matchedSceneConfidence](self, "matchedSceneConfidence"),
                  v24 = v23,
                  objc_msgSend(v5, "matchedSceneConfidence"),
                  v24 == v25))
            {
              if (!-[BMAeroMLPhotosSearchLabeledData hasMatchedSceneBoundingBox](self, "hasMatchedSceneBoundingBox")
                && !objc_msgSend(v5, "hasMatchedSceneBoundingBox")
                || -[BMAeroMLPhotosSearchLabeledData hasMatchedSceneBoundingBox](self, "hasMatchedSceneBoundingBox")
                && objc_msgSend(v5, "hasMatchedSceneBoundingBox")
                && (-[BMAeroMLPhotosSearchLabeledData matchedSceneBoundingBox](self, "matchedSceneBoundingBox"),
                    v27 = v26,
                    objc_msgSend(v5, "matchedSceneBoundingBox"),
                    v27 == v28))
              {
                if (!-[BMAeroMLPhotosSearchLabeledData hasMatchedOCRCharacterRatio](self, "hasMatchedOCRCharacterRatio")&& !objc_msgSend(v5, "hasMatchedOCRCharacterRatio")|| -[BMAeroMLPhotosSearchLabeledData hasMatchedOCRCharacterRatio](self, "hasMatchedOCRCharacterRatio")&& objc_msgSend(v5, "hasMatchedOCRCharacterRatio")&& (-[BMAeroMLPhotosSearchLabeledData matchedOCRCharacterRatio](self, "matchedOCRCharacterRatio"), v30 = v29, objc_msgSend(v5, "matchedOCRCharacterRatio"), v30 == v31))
                {
                  if (!-[BMAeroMLPhotosSearchLabeledData hasMatchedOCRImportance](self, "hasMatchedOCRImportance")
                    && !objc_msgSend(v5, "hasMatchedOCRImportance")
                    || -[BMAeroMLPhotosSearchLabeledData hasMatchedOCRImportance](self, "hasMatchedOCRImportance")
                    && objc_msgSend(v5, "hasMatchedOCRImportance")
                    && (-[BMAeroMLPhotosSearchLabeledData matchedOCRImportance](self, "matchedOCRImportance"),
                        v33 = v32,
                        objc_msgSend(v5, "matchedOCRImportance"),
                        v33 == v34))
                  {
                    if (!-[BMAeroMLPhotosSearchLabeledData hasMatchedFieldsCount](self, "hasMatchedFieldsCount")
                      && !objc_msgSend(v5, "hasMatchedFieldsCount")
                      || -[BMAeroMLPhotosSearchLabeledData hasMatchedFieldsCount](self, "hasMatchedFieldsCount")
                      && objc_msgSend(v5, "hasMatchedFieldsCount")
                      && (v35 = -[BMAeroMLPhotosSearchLabeledData matchedFieldsCount](self, "matchedFieldsCount"),
                          v35 == objc_msgSend(v5, "matchedFieldsCount")))
                    {
                      if (!-[BMAeroMLPhotosSearchLabeledData hasL1Score](self, "hasL1Score")
                        && !objc_msgSend(v5, "hasL1Score")
                        || -[BMAeroMLPhotosSearchLabeledData hasL1Score](self, "hasL1Score")
                        && objc_msgSend(v5, "hasL1Score")
                        && (-[BMAeroMLPhotosSearchLabeledData L1Score](self, "L1Score"),
                            v37 = v36,
                            objc_msgSend(v5, "L1Score"),
                            v37 == v38))
                      {
                        if (!-[BMAeroMLPhotosSearchLabeledData hasFreshness](self, "hasFreshness")
                          && !objc_msgSend(v5, "hasFreshness")
                          || -[BMAeroMLPhotosSearchLabeledData hasFreshness](self, "hasFreshness")
                          && objc_msgSend(v5, "hasFreshness")
                          && (-[BMAeroMLPhotosSearchLabeledData freshness](self, "freshness"),
                              v40 = v39,
                              objc_msgSend(v5, "freshness"),
                              v40 == v41))
                        {
                          if (!-[BMAeroMLPhotosSearchLabeledData hasFavorited](self, "hasFavorited")
                            && !objc_msgSend(v5, "hasFavorited")
                            || -[BMAeroMLPhotosSearchLabeledData hasFavorited](self, "hasFavorited")
                            && objc_msgSend(v5, "hasFavorited")
                            && (v42 = -[BMAeroMLPhotosSearchLabeledData favorited](self, "favorited"),
                                v42 == objc_msgSend(v5, "favorited")))
                          {
                            if (!-[BMAeroMLPhotosSearchLabeledData hasAestheticScore](self, "hasAestheticScore")
                              && !objc_msgSend(v5, "hasAestheticScore")
                              || -[BMAeroMLPhotosSearchLabeledData hasAestheticScore](self, "hasAestheticScore")
                              && objc_msgSend(v5, "hasAestheticScore")
                              && (-[BMAeroMLPhotosSearchLabeledData aestheticScore](self, "aestheticScore"),
                                  v44 = v43,
                                  objc_msgSend(v5, "aestheticScore"),
                                  v44 == v45))
                            {
                              if (!-[BMAeroMLPhotosSearchLabeledData hasCurationScore](self, "hasCurationScore")
                                && !objc_msgSend(v5, "hasCurationScore")
                                || -[BMAeroMLPhotosSearchLabeledData hasCurationScore](self, "hasCurationScore")
                                && objc_msgSend(v5, "hasCurationScore")
                                && (-[BMAeroMLPhotosSearchLabeledData curationScore](self, "curationScore"),
                                    v47 = v46,
                                    objc_msgSend(v5, "curationScore"),
                                    v47 == v48))
                              {
                                if (!-[BMAeroMLPhotosSearchLabeledData hasHasEverClickInLastWeek](self, "hasHasEverClickInLastWeek")&& !objc_msgSend(v5, "hasHasEverClickInLastWeek")|| -[BMAeroMLPhotosSearchLabeledData hasHasEverClickInLastWeek](self, "hasHasEverClickInLastWeek")&& objc_msgSend(v5, "hasHasEverClickInLastWeek")&& (-[BMAeroMLPhotosSearchLabeledData hasEverClickInLastWeek](self, "hasEverClickInLastWeek"), v50 = v49, objc_msgSend(v5, "hasEverClickInLastWeek"), v50 == v51))
                                {
                                  if (!-[BMAeroMLPhotosSearchLabeledData hasHasEverClickInLastMonth](self, "hasHasEverClickInLastMonth")&& !objc_msgSend(v5, "hasHasEverClickInLastMonth")|| -[BMAeroMLPhotosSearchLabeledData hasHasEverClickInLastMonth](self, "hasHasEverClickInLastMonth")&& objc_msgSend(v5, "hasHasEverClickInLastMonth")&& (-[BMAeroMLPhotosSearchLabeledData hasEverClickInLastMonth](self, "hasEverClickInLastMonth"), v53 = v52, objc_msgSend(v5, "hasEverClickInLastMonth"), v53 == v54))
                                  {
                                    if (!-[BMAeroMLPhotosSearchLabeledData hasHasEverShareInLastWeek](self, "hasHasEverShareInLastWeek")&& !objc_msgSend(v5, "hasHasEverShareInLastWeek")|| -[BMAeroMLPhotosSearchLabeledData hasHasEverShareInLastWeek](self, "hasHasEverShareInLastWeek")&& objc_msgSend(v5, "hasHasEverShareInLastWeek")&& (-[BMAeroMLPhotosSearchLabeledData hasEverShareInLastWeek](self, "hasEverShareInLastWeek"), v56 = v55, objc_msgSend(v5, "hasEverShareInLastWeek"), v56 == v57))
                                    {
                                      if (!-[BMAeroMLPhotosSearchLabeledData hasHasEverShareInLastMonth](self, "hasHasEverShareInLastMonth")&& !objc_msgSend(v5, "hasHasEverShareInLastMonth")|| -[BMAeroMLPhotosSearchLabeledData hasHasEverShareInLastMonth](self, "hasHasEverShareInLastMonth")&& objc_msgSend(v5, "hasHasEverShareInLastMonth")&& (-[BMAeroMLPhotosSearchLabeledData hasEverShareInLastMonth](self, "hasEverShareInLastMonth"), v59 = v58, objc_msgSend(v5, "hasEverShareInLastMonth"), v59 == v60))
                                      {
                                        if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountInLastWeekNormalizedAcrossItems](self, "hasClickCountInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasClickCountInLastWeekNormalizedAcrossItems](self, "hasClickCountInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountInLastWeekNormalizedAcrossItems](self, "clickCountInLastWeekNormalizedAcrossItems"), v62 = v61, objc_msgSend(v5, "clickCountInLastWeekNormalizedAcrossItems"), v62 == v63))
                                        {
                                          if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountInLastMonthNormalizedAcrossItems](self, "hasClickCountInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasClickCountInLastMonthNormalizedAcrossItems](self, "hasClickCountInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountInLastMonthNormalizedAcrossItems](self, "clickCountInLastMonthNormalizedAcrossItems"), v65 = v64, objc_msgSend(v5, "clickCountInLastMonthNormalizedAcrossItems"), v65 == v66))
                                          {
                                            if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountInLastWeekNormalizedAcrossItems](self, "hasShareCountInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasShareCountInLastWeekNormalizedAcrossItems](self, "hasShareCountInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountInLastWeekNormalizedAcrossItems](self, "shareCountInLastWeekNormalizedAcrossItems"), v68 = v67, objc_msgSend(v5, "shareCountInLastWeekNormalizedAcrossItems"), v68 == v69))
                                            {
                                              if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountInLastMonthNormalizedAcrossItems](self, "hasShareCountInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasShareCountInLastMonthNormalizedAcrossItems](self, "hasShareCountInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountInLastMonthNormalizedAcrossItems](self, "shareCountInLastMonthNormalizedAcrossItems"), v71 = v70, objc_msgSend(v5, "shareCountInLastMonthNormalizedAcrossItems"), v71 == v72))
                                              {
                                                if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), v74 = v73, objc_msgSend(v5, "clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), v74 == v75))
                                                {
                                                  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), v77 = v76, objc_msgSend(v5, "clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), v77 == v78))
                                                  {
                                                    if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenLocationInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenLocationInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "clickCountGivenLocationInLastWeekNormalizedAcrossItems"), v80 = v79, objc_msgSend(v5, "clickCountGivenLocationInLastWeekNormalizedAcrossItems"), v80 == v81))
                                                    {
                                                      if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenLocationInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenLocationInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "clickCountGivenLocationInLastMonthNormalizedAcrossItems"), v83 = v82, objc_msgSend(v5, "clickCountGivenLocationInLastMonthNormalizedAcrossItems"), v83 == v84))
                                                      {
                                                        if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), v86 = v85, objc_msgSend(v5,
                                                                "clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"),
                                                              v86 == v87))
                                                        {
                                                          if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), v89 = v88, objc_msgSend(v5,
                                                                  "clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"),
                                                                v89 == v90))
                                                          {
                                                            if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), v92 = v91, objc_msgSend(v5,
                                                                    "clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"),
                                                                  v92 == v93))
                                                            {
                                                              if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), v95 = v94, objc_msgSend(v5,
                                                                      "clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"),
                                                                    v95 == v96))
                                                              {
                                                                if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), v98 = v97, objc_msgSend(v5,
                                                                        "clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"),
                                                                      v98 == v99))
                                                                {
                                                                  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), v101 = v100,
                                                                        objc_msgSend(v5, "clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), v101 == v102))
                                                                  {
                                                                    if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"),
                                                                          v104 = v103,
                                                                          objc_msgSend(v5, "clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), v104 == v105))
                                                                    {
                                                                      if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"),
                                                                            v107 = v106,
                                                                            objc_msgSend(v5, "clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), v107 == v108))
                                                                      {
                                                                        if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), v110 = v109,
                                                                              objc_msgSend(v5, "shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), v110 == v111))
                                                                        {
                                                                          if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"),
                                                                                v113 = v112,
                                                                                objc_msgSend(v5, "shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), v113 == v114))
                                                                          {
                                                                            if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenLocationInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenLocationInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "shareCountGivenLocationInLastWeekNormalizedAcrossItems"),
                                                                                  v116 = v115,
                                                                                  objc_msgSend(v5, "shareCountGivenLocationInLastWeekNormalizedAcrossItems"), v116 == v117))
                                                                            {
                                                                              if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenLocationInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenLocationInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "shareCountGivenLocationInLastMonthNormalizedAcrossItems"),
                                                                                    v119 = v118,
                                                                                    objc_msgSend(v5, "shareCountGivenLocationInLastMonthNormalizedAcrossItems"), v119 == v120))
                                                                              {
                                                                                if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), v122 = v121, objc_msgSend(v5, "shareCountGivenDayCategoryInLast"
                                                                                        "WeekNormalizedAcrossItems"),
                                                                                      v122 == v123))
                                                                                {
                                                                                  if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), v125 = v124, objc_msgSend(v5, "shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), v125 == v126))
                                                                                  {
                                                                                    if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), v128 = v127, objc_msgSend(v5, "shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), v128 == v129))
                                                                                    {
                                                                                      if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), v131 = v130, objc_msgSend(v5, "shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), v131 == v132))
                                                                                      {
                                                                                        if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), v134 = v133, objc_msgSend(v5, "shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), v134 == v135))
                                                                                        {
                                                                                          if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), v137 = v136, objc_msgSend(v5,
                                                                                                  "shareCountGivenSceneCa"
                                                                                                  "tegoryInLastMonthNorma"
                                                                                                  "lizedAcrossItems"),
                                                                                                v137 == v138))
                                                                                          {
                                                                                            if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& !objc_msgSend(v5, "hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), v140 = v139, objc_msgSend(v5, "shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), v140 == v141))
                                                                                            {
                                                                                              if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")
                                                                                                && !objc_msgSend(v5, "hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")
                                                                                                || -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), v143 = v142, objc_msgSend(v5, "shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), v143 == v144))
                                                                                              {
                                                                                                if (!-[BMAeroMLPhotosSearchLabeledData hasClipScore](self, "hasClipScore") && !objc_msgSend(v5, "hasClipScore") || -[BMAeroMLPhotosSearchLabeledData hasClipScore](self, "hasClipScore") && objc_msgSend(v5, "hasClipScore") && (-[BMAeroMLPhotosSearchLabeledData clipScore](self, "clipScore"), v146 = v145, objc_msgSend(v5, "clipScore"), v146 == v147))
                                                                                                {
                                                                                                  if (!-[BMAeroMLPhotosSearchLabeledData hasClicked](self, "hasClicked") && !objc_msgSend(v5, "hasClicked") || -[BMAeroMLPhotosSearchLabeledData hasClicked](self, "hasClicked") && objc_msgSend(v5, "hasClicked") && (v148 = -[BMAeroMLPhotosSearchLabeledData clicked](self, "clicked"), v148 == objc_msgSend(v5, "clicked")))
                                                                                                  {
                                                                                                    if (!-[BMAeroMLPhotosSearchLabeledData hasClickOrder](self, "hasClickOrder") && !objc_msgSend(v5, "hasClickOrder") || -[BMAeroMLPhotosSearchLabeledData hasClickOrder](self, "hasClickOrder") && objc_msgSend(v5, "hasClickOrder") && (v149 = -[BMAeroMLPhotosSearchLabeledData clickOrder](self, "clickOrder"), v149 == objc_msgSend(v5, "clickOrder")))
                                                                                                    {
                                                                                                      if (!-[BMAeroMLPhotosSearchLabeledData hasItemPosition](self, "hasItemPosition") && !objc_msgSend(v5, "hasItemPosition") || -[BMAeroMLPhotosSearchLabeledData hasItemPosition](self, "hasItemPosition") && objc_msgSend(v5, "hasItemPosition") && (v150 = -[BMAeroMLPhotosSearchLabeledData itemPosition](self, "itemPosition"), v150 == objc_msgSend(v5, "itemPosition")))
                                                                                                      {
                                                                                                        if (!-[BMAeroMLPhotosSearchLabeledData hasL2ModelScore](self, "hasL2ModelScore") && !objc_msgSend(v5, "hasL2ModelScore") || -[BMAeroMLPhotosSearchLabeledData hasL2ModelScore](self, "hasL2ModelScore") && objc_msgSend(v5, "hasL2ModelScore") && (-[BMAeroMLPhotosSearchLabeledData L2ModelScore](self, "L2ModelScore"), v152 = v151, objc_msgSend(v5, "L2ModelScore"), v152 == v153))
                                                                                                        {
                                                                                                          if (!-[BMAeroMLPhotosSearchLabeledData hasIsDuplicate](self, "hasIsDuplicate") && !objc_msgSend(v5, "hasIsDuplicate") || -[BMAeroMLPhotosSearchLabeledData hasIsDuplicate](self, "hasIsDuplicate") && objc_msgSend(v5, "hasIsDuplicate") && (-[BMAeroMLPhotosSearchLabeledData isDuplicate](self, "isDuplicate"), v155 = v154, objc_msgSend(v5, "isDuplicate"), v155 == v156))
                                                                                                          {
                                                                                                            if (!-[BMAeroMLPhotosSearchLabeledData hasIsCompleteMatch](self, "hasIsCompleteMatch") && !objc_msgSend(v5, "hasIsCompleteMatch"))
                                                                                                            {
                                                                                                              v12 = 1;
                                                                                                              goto LABEL_269;
                                                                                                            }
                                                                                                            if (-[BMAeroMLPhotosSearchLabeledData hasIsCompleteMatch](self, "hasIsCompleteMatch") && objc_msgSend(v5, "hasIsCompleteMatch"))
                                                                                                            {
                                                                                                              -[BMAeroMLPhotosSearchLabeledData isCompleteMatch](self, "isCompleteMatch");
                                                                                                              v158 = v157;
                                                                                                              objc_msgSend(v5, "isCompleteMatch");
                                                                                                              v12 = v158 == v159;
LABEL_269:

                                                                                                              goto LABEL_270;
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
          }
        }
      }
    }
LABEL_268:
    v12 = 0;
    goto LABEL_269;
  }
  v12 = 0;
LABEL_270:

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

- (BOOL)clicked
{
  return self->_clicked;
}

- (BOOL)hasClicked
{
  return self->_hasClicked;
}

- (void)setHasClicked:(BOOL)a3
{
  self->_hasClicked = a3;
}

- (unsigned)clickOrder
{
  return self->_clickOrder;
}

- (BOOL)hasClickOrder
{
  return self->_hasClickOrder;
}

- (void)setHasClickOrder:(BOOL)a3
{
  self->_hasClickOrder = a3;
}

- (unsigned)itemPosition
{
  return self->_itemPosition;
}

- (BOOL)hasItemPosition
{
  return self->_hasItemPosition;
}

- (void)setHasItemPosition:(BOOL)a3
{
  self->_hasItemPosition = a3;
}

- (double)L2ModelScore
{
  return self->_L2ModelScore;
}

- (BOOL)hasL2ModelScore
{
  return self->_hasL2ModelScore;
}

- (void)setHasL2ModelScore:(BOOL)a3
{
  self->_hasL2ModelScore = a3;
}

- (double)isDuplicate
{
  return self->_isDuplicate;
}

- (BOOL)hasIsDuplicate
{
  return self->_hasIsDuplicate;
}

- (void)setHasIsDuplicate:(BOOL)a3
{
  self->_hasIsDuplicate = a3;
}

- (double)isCompleteMatch
{
  return self->_isCompleteMatch;
}

- (BOOL)hasIsCompleteMatch
{
  return self->_hasIsCompleteMatch;
}

- (void)setHasIsCompleteMatch:(BOOL)a3
{
  self->_hasIsCompleteMatch = a3;
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

    v4 = -[BMAeroMLPhotosSearchLabeledData initByReadFrom:]([BMAeroMLPhotosSearchLabeledData alloc], "initByReadFrom:", v7);
    v4[18] = 0;

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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[56];

  v58[54] = *MEMORY[0x1E0C80C00];
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("searchSessionUUID"), 2, 0, 1, 13, 0);
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uiSurface"), 0, 0, 2, 4, 0);
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedPeopleRatio"), 1, 0, 3, 0, 0);
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedLocationRatio"), 1, 0, 4, 0, 0);
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedSceneRatio"), 1, 0, 5, 0, 0);
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedSceneConfidence"), 1, 0, 6, 0, 0);
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedSceneBoundingBox"), 1, 0, 7, 0, 0);
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedOCRCharacterRatio"), 1, 0, 8, 0, 0);
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedOCRImportance"), 1, 0, 9, 0, 0);
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedFieldsCount"), 0, 0, 10, 4, 0);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("L1Score"), 1, 0, 11, 0, 0);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("freshness"), 1, 0, 12, 0, 0);
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("favorited"), 0, 0, 13, 12, 0);
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("aestheticScore"), 1, 0, 14, 0, 0);
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("curationScore"), 1, 0, 15, 0, 0);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasEverClickInLastWeek"), 1, 0, 16, 0, 0);
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasEverClickInLastMonth"), 1, 0, 17, 0, 0);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasEverShareInLastWeek"), 1, 0, 18, 0, 0);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasEverShareInLastMonth"), 1, 0, 19, 0, 0);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountInLastWeekNormalizedAcrossItems"), 1, 0, 20, 0, 0);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountInLastMonthNormalizedAcrossItems"), 1, 0, 21, 0, 0);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountInLastWeekNormalizedAcrossItems"), 1, 0, 22, 0, 0);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountInLastMonthNormalizedAcrossItems"), 1, 0, 23, 0, 0);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), 1, 0, 24, 0, 0);
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), 1, 0, 25, 0, 0);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenLocationInLastWeekNormalizedAcrossItems"), 1, 0, 26, 0, 0);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenLocationInLastMonthNormalizedAcrossItems"), 1, 0, 27, 0, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), 1, 0, 28, 0, 0);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), 1, 0, 29, 0, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), 1, 0, 30, 0, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), 1, 0, 31, 0, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), 1, 0, 32, 0, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), 1, 0, 33, 0, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), 1, 0, 34, 0, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), 1, 0, 35, 0, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), 1, 0, 36, 0, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), 1, 0, 37, 0, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenLocationInLastWeekNormalizedAcrossItems"), 1, 0, 38, 0, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenLocationInLastMonthNormalizedAcrossItems"), 1, 0, 39, 0, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), 1, 0, 40, 0, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), 1, 0, 41, 0, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), 1, 0, 42, 0, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), 1, 0, 43, 0, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), 1, 0, 44, 0, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), 1, 0, 45, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), 1, 0, 46, 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), 1, 0, 47, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clipScore"), 1, 0, 48, 0, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clicked"), 0, 0, 49, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clickOrder"), 0, 0, 50, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemPosition"), 0, 0, 51, 4, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("L2ModelScore"), 1, 0, 52, 0, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isDuplicate"), 1, 0, 53, 0, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isCompleteMatch"), 1, 0, 54, 0, 0);
  v58[0] = v57;
  v58[1] = v56;
  v58[2] = v54;
  v58[3] = v55;
  v58[4] = v52;
  v58[5] = v53;
  v58[6] = v51;
  v58[7] = v50;
  v58[8] = v49;
  v58[9] = v48;
  v58[10] = v47;
  v58[11] = v46;
  v58[12] = v45;
  v58[13] = v44;
  v58[14] = v43;
  v58[15] = v42;
  v58[16] = v41;
  v58[17] = v40;
  v58[18] = v39;
  v58[19] = v38;
  v58[20] = v37;
  v58[21] = v36;
  v58[22] = v35;
  v58[23] = v34;
  v58[24] = v33;
  v58[25] = v32;
  v58[26] = v31;
  v58[27] = v30;
  v58[28] = v29;
  v58[29] = v28;
  v58[30] = v27;
  v58[31] = v26;
  v58[32] = v25;
  v58[33] = v24;
  v58[34] = v23;
  v58[35] = v22;
  v58[36] = v21;
  v58[37] = v20;
  v58[38] = v19;
  v58[39] = v18;
  v58[40] = v17;
  v58[41] = v16;
  v58[42] = v15;
  v58[43] = v14;
  v58[44] = v2;
  v58[45] = v3;
  v58[46] = v4;
  v58[47] = v5;
  v58[48] = v6;
  v58[49] = v7;
  v58[50] = v8;
  v58[51] = v13;
  v58[52] = v9;
  v58[53] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 54);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1F948;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[56];

  v58[54] = *MEMORY[0x1E0C80C00];
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("searchSessionUUID"), 1, 13, 0);
  v58[0] = v57;
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uiSurface"), 2, 4, 0);
  v58[1] = v56;
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedPeopleRatio"), 3, 0, 0);
  v58[2] = v55;
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedLocationRatio"), 4, 0, 0);
  v58[3] = v54;
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedSceneRatio"), 5, 0, 0);
  v58[4] = v53;
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedSceneConfidence"), 6, 0, 0);
  v58[5] = v52;
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedSceneBoundingBox"), 7, 0, 0);
  v58[6] = v51;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedOCRCharacterRatio"), 8, 0, 0);
  v58[7] = v50;
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedOCRImportance"), 9, 0, 0);
  v58[8] = v49;
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedFieldsCount"), 10, 4, 0);
  v58[9] = v48;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("L1Score"), 11, 0, 0);
  v58[10] = v47;
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("freshness"), 12, 0, 0);
  v58[11] = v46;
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("favorited"), 13, 12, 0);
  v58[12] = v45;
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("aestheticScore"), 14, 0, 0);
  v58[13] = v44;
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("curationScore"), 15, 0, 0);
  v58[14] = v43;
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasEverClickInLastWeek"), 16, 0, 0);
  v58[15] = v42;
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasEverClickInLastMonth"), 17, 0, 0);
  v58[16] = v41;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasEverShareInLastWeek"), 18, 0, 0);
  v58[17] = v40;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasEverShareInLastMonth"), 19, 0, 0);
  v58[18] = v39;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountInLastWeekNormalizedAcrossItems"), 20, 0, 0);
  v58[19] = v38;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountInLastMonthNormalizedAcrossItems"), 21, 0, 0);
  v58[20] = v37;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountInLastWeekNormalizedAcrossItems"), 22, 0, 0);
  v58[21] = v36;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountInLastMonthNormalizedAcrossItems"), 23, 0, 0);
  v58[22] = v35;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), 24, 0, 0);
  v58[23] = v34;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), 25, 0, 0);
  v58[24] = v33;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenLocationInLastWeekNormalizedAcrossItems"), 26, 0, 0);
  v58[25] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenLocationInLastMonthNormalizedAcrossItems"), 27, 0, 0);
  v58[26] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), 28, 0, 0);
  v58[27] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), 29, 0, 0);
  v58[28] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), 30, 0, 0);
  v58[29] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), 31, 0, 0);
  v58[30] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), 32, 0, 0);
  v58[31] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), 33, 0, 0);
  v58[32] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), 34, 0, 0);
  v58[33] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), 35, 0, 0);
  v58[34] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), 36, 0, 0);
  v58[35] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), 37, 0, 0);
  v58[36] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenLocationInLastWeekNormalizedAcrossItems"), 38, 0, 0);
  v58[37] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenLocationInLastMonthNormalizedAcrossItems"), 39, 0, 0);
  v58[38] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), 40, 0, 0);
  v58[39] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), 41, 0, 0);
  v58[40] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), 42, 0, 0);
  v58[41] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), 43, 0, 0);
  v58[42] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), 44, 0, 0);
  v58[43] = v14;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), 45, 0, 0);
  v58[44] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), 46, 0, 0);
  v58[45] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), 47, 0, 0);
  v58[46] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clipScore"), 48, 0, 0);
  v58[47] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clicked"), 49, 12, 0);
  v58[48] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clickOrder"), 50, 4, 0);
  v58[49] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemPosition"), 51, 4, 0);
  v58[50] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("L2ModelScore"), 52, 0, 0);
  v58[51] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isDuplicate"), 53, 0, 0);
  v58[52] = v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isCompleteMatch"), 54, 0, 0);
  v58[53] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 54);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
