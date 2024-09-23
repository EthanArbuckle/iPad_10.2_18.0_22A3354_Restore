@implementation BMSiriMusicInferenceTrainingDependentSignals

- (BMSiriMusicInferenceTrainingDependentSignals)initWithIsClientForegroundActiveBundle:(id)a3 compoundActiveBundleScore:(id)a4 compoundMediaTypeBundleScore:(id)a5 entitySearchBundleRecencyS:(id)a6 entitySearchBundleScore:(id)a7 isForegroundBundle:(id)a8 isNowPlayingBundle:(id)a9 nowPlayingBundleCount:(id)a10 nowPlayingBundleRecencyS:(id)a11 nowPlayingBundleScore:(id)a12 isNowPlayingLastBundle:(id)a13 nowPlayingUsage1Day:(id)a14 nowPlayingUsage7Days:(id)a15 nowPlayingUsage14Days:(id)a16 isRawLastNowPlayingCoreDuet:(id)a17 isRawMediaCategoryAudiobookSignal:(id)a18 isRawMediaCategoryMusicSignal:(id)a19 isRawMediaCategoryPodcastSignal:(id)a20 isRawMediaCategoryRadioSignal:(id)a21 isRawMediaCategoryVideoSignal:(id)a22 rawMediaTypeUsageSignalBook:(id)a23 rawMediaTypeUsageSignalMusic:(id)a24 rawMediaTypeUsageSignalPodcast:(id)a25 rawMediaTypeUsageSignalVideo:(id)a26 rawNowPlayingCountCoreDuet10Min:(id)a27 rawNowPlayingCountCoreDuet1Day:(id)a28 rawNowPlayingCountCoreDuet1Hr:(id)a29 rawNowPlayingCountCoreDuet28Day:(id)a30 rawNowPlayingCountCoreDuet2Min:(id)a31 rawNowPlayingCountCoreDuet6Hr:(id)a32 rawNowPlayingCountCoreDuet7Day:(id)a33 rawNowPlayingRecencyCD:(id)a34 rawEntitySearchRecency:(id)a35 usageScoreBooks:(id)a36 usageScoreMusic:(id)a37 usageScorePodcasts:(id)a38 isAppFirstParty:(id)a39 isRequestedApp:(id)a40 isNowPlayingBundlePSE1:(id)a41 isNowPlayingBundlePSE2:(id)a42 vq21Score:(id)a43 isSupportedFlag:(id)a44 isUnicornFlag:(id)a45 isSupportedUnicornMatchFlag:(id)a46 isDisambiguationSelectedApp:(id)a47 isModelPredictedApp:(id)a48 usageScoreRadio:(id)a49 usageScoreMusicWithoutRadio:(id)a50 rawMediaTypeUsageSignalRadio:(id)a51 rawMediaTypeUsageSignalMusicWithoutRadio:(id)a52
{
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  BMSiriMusicInferenceTrainingDependentSignals *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  int v70;
  double v71;
  double v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  int v95;
  int v96;
  BMSiriMusicInferenceTrainingDependentSignals *v97;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
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
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  objc_super v142;

  v141 = a3;
  v140 = a4;
  v139 = a5;
  v138 = a6;
  v137 = a7;
  v136 = a8;
  v134 = a9;
  v56 = a10;
  v133 = a11;
  v132 = a12;
  v131 = a13;
  v130 = a14;
  v129 = a15;
  v128 = a16;
  v127 = a17;
  v126 = a18;
  v125 = a19;
  v124 = a20;
  v123 = a21;
  v122 = a22;
  v121 = a23;
  v120 = a24;
  v119 = a25;
  v118 = a26;
  v117 = a27;
  v116 = a28;
  v115 = a29;
  v114 = a30;
  v113 = a31;
  v112 = a32;
  v111 = a33;
  v110 = a34;
  v109 = a35;
  v108 = a36;
  v107 = a37;
  v106 = a38;
  v105 = a39;
  v104 = a40;
  v103 = a41;
  v102 = a42;
  v101 = a43;
  v100 = a44;
  v57 = a45;
  v58 = a46;
  v59 = a47;
  v60 = a48;
  v61 = a49;
  v62 = a50;
  v63 = a51;
  v64 = a52;
  v142.receiver = self;
  v142.super_class = (Class)BMSiriMusicInferenceTrainingDependentSignals;
  v65 = -[BMEventBase init](&v142, sel_init);

  if (v65)
  {
    v65->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v141)
    {
      v65->_hasIsClientForegroundActiveBundle = 1;
      v65->_isClientForegroundActiveBundle = objc_msgSend(v141, "BOOLValue");
    }
    else
    {
      v65->_hasIsClientForegroundActiveBundle = 0;
      v65->_isClientForegroundActiveBundle = 0;
    }
    if (v140)
    {
      v65->_hasCompoundActiveBundleScore = 1;
      objc_msgSend(v140, "doubleValue");
    }
    else
    {
      v65->_hasCompoundActiveBundleScore = 0;
      v66 = -1.0;
    }
    v65->_compoundActiveBundleScore = v66;
    if (v139)
    {
      v65->_hasCompoundMediaTypeBundleScore = 1;
      objc_msgSend(v139, "doubleValue");
    }
    else
    {
      v65->_hasCompoundMediaTypeBundleScore = 0;
      v67 = -1.0;
    }
    v65->_compoundMediaTypeBundleScore = v67;
    if (v138)
    {
      v65->_hasEntitySearchBundleRecencyS = 1;
      objc_msgSend(v138, "doubleValue");
    }
    else
    {
      v65->_hasEntitySearchBundleRecencyS = 0;
      v68 = -1.0;
    }
    v65->_entitySearchBundleRecencyS = v68;
    if (v137)
    {
      v65->_hasEntitySearchBundleScore = 1;
      objc_msgSend(v137, "doubleValue");
    }
    else
    {
      v65->_hasEntitySearchBundleScore = 0;
      v69 = -1.0;
    }
    v65->_entitySearchBundleScore = v69;
    if (v136)
    {
      v65->_hasIsForegroundBundle = 1;
      v65->_isForegroundBundle = objc_msgSend(v136, "BOOLValue");
    }
    else
    {
      v65->_hasIsForegroundBundle = 0;
      v65->_isForegroundBundle = 0;
    }
    if (v134)
    {
      v65->_hasIsNowPlayingBundle = 1;
      v65->_isNowPlayingBundle = objc_msgSend(v134, "BOOLValue");
    }
    else
    {
      v65->_hasIsNowPlayingBundle = 0;
      v65->_isNowPlayingBundle = 0;
    }
    if (v56)
    {
      v65->_hasNowPlayingBundleCount = 1;
      v70 = objc_msgSend(v56, "intValue");
    }
    else
    {
      v65->_hasNowPlayingBundleCount = 0;
      v70 = -1;
    }
    v65->_nowPlayingBundleCount = v70;
    if (v133)
    {
      v65->_hasNowPlayingBundleRecencyS = 1;
      objc_msgSend(v133, "doubleValue");
    }
    else
    {
      v65->_hasNowPlayingBundleRecencyS = 0;
      v71 = -1.0;
    }
    v65->_nowPlayingBundleRecencyS = v71;
    if (v132)
    {
      v65->_hasNowPlayingBundleScore = 1;
      objc_msgSend(v132, "doubleValue");
    }
    else
    {
      v65->_hasNowPlayingBundleScore = 0;
      v72 = -1.0;
    }
    v65->_nowPlayingBundleScore = v72;
    if (v131)
    {
      v65->_hasIsNowPlayingLastBundle = 1;
      v65->_isNowPlayingLastBundle = objc_msgSend(v131, "BOOLValue");
    }
    else
    {
      v65->_hasIsNowPlayingLastBundle = 0;
      v65->_isNowPlayingLastBundle = 0;
    }
    if (v130)
    {
      v65->_hasNowPlayingUsage1Day = 1;
      v73 = objc_msgSend(v130, "intValue");
    }
    else
    {
      v65->_hasNowPlayingUsage1Day = 0;
      v73 = -1;
    }
    v65->_nowPlayingUsage1Day = v73;
    if (v129)
    {
      v65->_hasNowPlayingUsage7Days = 1;
      v74 = objc_msgSend(v129, "intValue");
    }
    else
    {
      v65->_hasNowPlayingUsage7Days = 0;
      v74 = -1;
    }
    v65->_nowPlayingUsage7Days = v74;
    if (v128)
    {
      v65->_hasNowPlayingUsage14Days = 1;
      v75 = objc_msgSend(v128, "intValue");
    }
    else
    {
      v65->_hasNowPlayingUsage14Days = 0;
      v75 = -1;
    }
    v65->_nowPlayingUsage14Days = v75;
    if (v127)
    {
      v65->_hasIsRawLastNowPlayingCoreDuet = 1;
      v65->_isRawLastNowPlayingCoreDuet = objc_msgSend(v127, "BOOLValue");
    }
    else
    {
      v65->_hasIsRawLastNowPlayingCoreDuet = 0;
      v65->_isRawLastNowPlayingCoreDuet = 0;
    }
    if (v126)
    {
      v65->_hasIsRawMediaCategoryAudiobookSignal = 1;
      v65->_isRawMediaCategoryAudiobookSignal = objc_msgSend(v126, "BOOLValue");
    }
    else
    {
      v65->_hasIsRawMediaCategoryAudiobookSignal = 0;
      v65->_isRawMediaCategoryAudiobookSignal = 0;
    }
    if (v125)
    {
      v65->_hasIsRawMediaCategoryMusicSignal = 1;
      v65->_isRawMediaCategoryMusicSignal = objc_msgSend(v125, "BOOLValue");
    }
    else
    {
      v65->_hasIsRawMediaCategoryMusicSignal = 0;
      v65->_isRawMediaCategoryMusicSignal = 0;
    }
    if (v124)
    {
      v65->_hasIsRawMediaCategoryPodcastSignal = 1;
      v65->_isRawMediaCategoryPodcastSignal = objc_msgSend(v124, "BOOLValue");
    }
    else
    {
      v65->_hasIsRawMediaCategoryPodcastSignal = 0;
      v65->_isRawMediaCategoryPodcastSignal = 0;
    }
    if (v123)
    {
      v65->_hasIsRawMediaCategoryRadioSignal = 1;
      v65->_isRawMediaCategoryRadioSignal = objc_msgSend(v123, "BOOLValue");
    }
    else
    {
      v65->_hasIsRawMediaCategoryRadioSignal = 0;
      v65->_isRawMediaCategoryRadioSignal = 0;
    }
    if (v122)
    {
      v65->_hasIsRawMediaCategoryVideoSignal = 1;
      v65->_isRawMediaCategoryVideoSignal = objc_msgSend(v122, "BOOLValue");
    }
    else
    {
      v65->_hasIsRawMediaCategoryVideoSignal = 0;
      v65->_isRawMediaCategoryVideoSignal = 0;
    }
    if (v121)
    {
      v65->_hasRawMediaTypeUsageSignalBook = 1;
      v76 = objc_msgSend(v121, "intValue");
    }
    else
    {
      v65->_hasRawMediaTypeUsageSignalBook = 0;
      v76 = -1;
    }
    v65->_rawMediaTypeUsageSignalBook = v76;
    if (v120)
    {
      v65->_hasRawMediaTypeUsageSignalMusic = 1;
      v77 = objc_msgSend(v120, "intValue");
    }
    else
    {
      v65->_hasRawMediaTypeUsageSignalMusic = 0;
      v77 = -1;
    }
    v65->_rawMediaTypeUsageSignalMusic = v77;
    if (v119)
    {
      v65->_hasRawMediaTypeUsageSignalPodcast = 1;
      v78 = objc_msgSend(v119, "intValue");
    }
    else
    {
      v65->_hasRawMediaTypeUsageSignalPodcast = 0;
      v78 = -1;
    }
    v65->_rawMediaTypeUsageSignalPodcast = v78;
    if (v118)
    {
      v65->_hasRawMediaTypeUsageSignalVideo = 1;
      v79 = objc_msgSend(v118, "intValue");
    }
    else
    {
      v65->_hasRawMediaTypeUsageSignalVideo = 0;
      v79 = -1;
    }
    v65->_rawMediaTypeUsageSignalVideo = v79;
    if (v117)
    {
      v65->_hasRawNowPlayingCountCoreDuet10Min = 1;
      v80 = objc_msgSend(v117, "intValue");
    }
    else
    {
      v65->_hasRawNowPlayingCountCoreDuet10Min = 0;
      v80 = -1;
    }
    v65->_rawNowPlayingCountCoreDuet10Min = v80;
    if (v116)
    {
      v65->_hasRawNowPlayingCountCoreDuet1Day = 1;
      v81 = objc_msgSend(v116, "intValue");
    }
    else
    {
      v65->_hasRawNowPlayingCountCoreDuet1Day = 0;
      v81 = -1;
    }
    v65->_rawNowPlayingCountCoreDuet1Day = v81;
    if (v115)
    {
      v65->_hasRawNowPlayingCountCoreDuet1Hr = 1;
      v82 = objc_msgSend(v115, "intValue");
    }
    else
    {
      v65->_hasRawNowPlayingCountCoreDuet1Hr = 0;
      v82 = -1;
    }
    v65->_rawNowPlayingCountCoreDuet1Hr = v82;
    if (v114)
    {
      v65->_hasRawNowPlayingCountCoreDuet28Day = 1;
      v83 = objc_msgSend(v114, "intValue");
    }
    else
    {
      v65->_hasRawNowPlayingCountCoreDuet28Day = 0;
      v83 = -1;
    }
    v65->_rawNowPlayingCountCoreDuet28Day = v83;
    if (v113)
    {
      v65->_hasRawNowPlayingCountCoreDuet2Min = 1;
      v84 = objc_msgSend(v113, "intValue");
    }
    else
    {
      v65->_hasRawNowPlayingCountCoreDuet2Min = 0;
      v84 = -1;
    }
    v65->_rawNowPlayingCountCoreDuet2Min = v84;
    if (v112)
    {
      v65->_hasRawNowPlayingCountCoreDuet6Hr = 1;
      v85 = objc_msgSend(v112, "intValue");
    }
    else
    {
      v65->_hasRawNowPlayingCountCoreDuet6Hr = 0;
      v85 = -1;
    }
    v65->_rawNowPlayingCountCoreDuet6Hr = v85;
    if (v111)
    {
      v65->_hasRawNowPlayingCountCoreDuet7Day = 1;
      v86 = objc_msgSend(v111, "intValue");
    }
    else
    {
      v65->_hasRawNowPlayingCountCoreDuet7Day = 0;
      v86 = -1;
    }
    v65->_rawNowPlayingCountCoreDuet7Day = v86;
    if (v110)
    {
      v65->_hasRawNowPlayingRecencyCD = 1;
      v87 = objc_msgSend(v110, "intValue");
    }
    else
    {
      v65->_hasRawNowPlayingRecencyCD = 0;
      v87 = -1;
    }
    v65->_rawNowPlayingRecencyCD = v87;
    if (v109)
    {
      v65->_hasRawEntitySearchRecency = 1;
      v88 = objc_msgSend(v109, "intValue");
    }
    else
    {
      v65->_hasRawEntitySearchRecency = 0;
      v88 = -1;
    }
    v65->_rawEntitySearchRecency = v88;
    if (v108)
    {
      v65->_hasUsageScoreBooks = 1;
      objc_msgSend(v108, "doubleValue");
    }
    else
    {
      v65->_hasUsageScoreBooks = 0;
      v89 = -1.0;
    }
    v65->_usageScoreBooks = v89;
    if (v107)
    {
      v65->_hasUsageScoreMusic = 1;
      objc_msgSend(v107, "doubleValue");
    }
    else
    {
      v65->_hasUsageScoreMusic = 0;
      v90 = -1.0;
    }
    v65->_usageScoreMusic = v90;
    if (v106)
    {
      v65->_hasUsageScorePodcasts = 1;
      objc_msgSend(v106, "doubleValue");
    }
    else
    {
      v65->_hasUsageScorePodcasts = 0;
      v91 = -1.0;
    }
    v65->_usageScorePodcasts = v91;
    if (v105)
    {
      v65->_hasIsAppFirstParty = 1;
      v65->_isAppFirstParty = objc_msgSend(v105, "BOOLValue");
    }
    else
    {
      v65->_hasIsAppFirstParty = 0;
      v65->_isAppFirstParty = 0;
    }
    if (v104)
    {
      v65->_hasIsRequestedApp = 1;
      v65->_isRequestedApp = objc_msgSend(v104, "BOOLValue");
    }
    else
    {
      v65->_hasIsRequestedApp = 0;
      v65->_isRequestedApp = 0;
    }
    if (v103)
    {
      v65->_hasIsNowPlayingBundlePSE1 = 1;
      v65->_isNowPlayingBundlePSE1 = objc_msgSend(v103, "BOOLValue");
    }
    else
    {
      v65->_hasIsNowPlayingBundlePSE1 = 0;
      v65->_isNowPlayingBundlePSE1 = 0;
    }
    if (v102)
    {
      v65->_hasIsNowPlayingBundlePSE2 = 1;
      v65->_isNowPlayingBundlePSE2 = objc_msgSend(v102, "BOOLValue");
    }
    else
    {
      v65->_hasIsNowPlayingBundlePSE2 = 0;
      v65->_isNowPlayingBundlePSE2 = 0;
    }
    if (v101)
    {
      v65->_hasVq21Score = 1;
      objc_msgSend(v101, "doubleValue");
    }
    else
    {
      v65->_hasVq21Score = 0;
      v92 = -1.0;
    }
    v65->_vq21Score = v92;
    if (v100)
    {
      v65->_hasIsSupportedFlag = 1;
      v65->_isSupportedFlag = objc_msgSend(v100, "BOOLValue");
    }
    else
    {
      v65->_hasIsSupportedFlag = 0;
      v65->_isSupportedFlag = 0;
    }
    if (v57)
    {
      v65->_hasIsUnicornFlag = 1;
      v65->_isUnicornFlag = objc_msgSend(v57, "BOOLValue");
    }
    else
    {
      v65->_hasIsUnicornFlag = 0;
      v65->_isUnicornFlag = 0;
    }
    if (v58)
    {
      v65->_hasIsSupportedUnicornMatchFlag = 1;
      v65->_isSupportedUnicornMatchFlag = objc_msgSend(v58, "BOOLValue");
    }
    else
    {
      v65->_hasIsSupportedUnicornMatchFlag = 0;
      v65->_isSupportedUnicornMatchFlag = 0;
    }
    if (v59)
    {
      v65->_hasIsDisambiguationSelectedApp = 1;
      v65->_isDisambiguationSelectedApp = objc_msgSend(v59, "BOOLValue");
    }
    else
    {
      v65->_hasIsDisambiguationSelectedApp = 0;
      v65->_isDisambiguationSelectedApp = 0;
    }
    if (v60)
    {
      v65->_hasIsModelPredictedApp = 1;
      v65->_isModelPredictedApp = objc_msgSend(v60, "BOOLValue");
    }
    else
    {
      v65->_hasIsModelPredictedApp = 0;
      v65->_isModelPredictedApp = 0;
    }
    if (v61)
    {
      v65->_hasUsageScoreRadio = 1;
      objc_msgSend(v61, "doubleValue");
    }
    else
    {
      v65->_hasUsageScoreRadio = 0;
      v93 = -1.0;
    }
    v65->_usageScoreRadio = v93;
    if (v62)
    {
      v65->_hasUsageScoreMusicWithoutRadio = 1;
      objc_msgSend(v62, "doubleValue");
    }
    else
    {
      v65->_hasUsageScoreMusicWithoutRadio = 0;
      v94 = -1.0;
    }
    v65->_usageScoreMusicWithoutRadio = v94;
    if (v63)
    {
      v65->_hasRawMediaTypeUsageSignalRadio = 1;
      v95 = objc_msgSend(v63, "intValue");
    }
    else
    {
      v65->_hasRawMediaTypeUsageSignalRadio = 0;
      v95 = -1;
    }
    v65->_rawMediaTypeUsageSignalRadio = v95;
    if (v64)
    {
      v65->_hasRawMediaTypeUsageSignalMusicWithoutRadio = 1;
      v96 = objc_msgSend(v64, "intValue");
    }
    else
    {
      v65->_hasRawMediaTypeUsageSignalMusicWithoutRadio = 0;
      v96 = -1;
    }
    v65->_rawMediaTypeUsageSignalMusicWithoutRadio = v96;
  }
  v97 = v65;

  return v97;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;

  v30 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isClientForegroundActiveBundle](self, "isClientForegroundActiveBundle"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriMusicInferenceTrainingDependentSignals compoundActiveBundleScore](self, "compoundActiveBundleScore");
  objc_msgSend(v3, "numberWithDouble:");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriMusicInferenceTrainingDependentSignals compoundMediaTypeBundleScore](self, "compoundMediaTypeBundleScore");
  objc_msgSend(v4, "numberWithDouble:");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriMusicInferenceTrainingDependentSignals entitySearchBundleRecencyS](self, "entitySearchBundleRecencyS");
  objc_msgSend(v5, "numberWithDouble:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriMusicInferenceTrainingDependentSignals entitySearchBundleScore](self, "entitySearchBundleScore");
  objc_msgSend(v6, "numberWithDouble:");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isForegroundBundle](self, "isForegroundBundle"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingBundle](self, "isNowPlayingBundle"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingBundleCount](self, "nowPlayingBundleCount"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingBundleRecencyS](self, "nowPlayingBundleRecencyS");
  objc_msgSend(v7, "numberWithDouble:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingBundleScore](self, "nowPlayingBundleScore");
  objc_msgSend(v8, "numberWithDouble:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingLastBundle](self, "isNowPlayingLastBundle"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingUsage1Day](self, "nowPlayingUsage1Day"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingUsage7Days](self, "nowPlayingUsage7Days"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingUsage14Days](self, "nowPlayingUsage14Days"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawLastNowPlayingCoreDuet](self, "isRawLastNowPlayingCoreDuet"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryAudiobookSignal](self, "isRawMediaCategoryAudiobookSignal"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryMusicSignal](self, "isRawMediaCategoryMusicSignal"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryPodcastSignal](self, "isRawMediaCategoryPodcastSignal"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryRadioSignal](self, "isRawMediaCategoryRadioSignal"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryVideoSignal](self, "isRawMediaCategoryVideoSignal"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalBook](self, "rawMediaTypeUsageSignalBook"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalMusic](self, "rawMediaTypeUsageSignalMusic"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalPodcast](self, "rawMediaTypeUsageSignalPodcast"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalVideo](self, "rawMediaTypeUsageSignalVideo"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet10Min](self, "rawNowPlayingCountCoreDuet10Min"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet1Day](self, "rawNowPlayingCountCoreDuet1Day"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet1Hr](self, "rawNowPlayingCountCoreDuet1Hr"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet28Day](self, "rawNowPlayingCountCoreDuet28Day"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet2Min](self, "rawNowPlayingCountCoreDuet2Min"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet6Hr](self, "rawNowPlayingCountCoreDuet6Hr"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet7Day](self, "rawNowPlayingCountCoreDuet7Day"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingRecencyCD](self, "rawNowPlayingRecencyCD"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawEntitySearchRecency](self, "rawEntitySearchRecency"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriMusicInferenceTrainingDependentSignals usageScoreBooks](self, "usageScoreBooks");
  objc_msgSend(v9, "numberWithDouble:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriMusicInferenceTrainingDependentSignals usageScoreMusic](self, "usageScoreMusic");
  objc_msgSend(v10, "numberWithDouble:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriMusicInferenceTrainingDependentSignals usageScorePodcasts](self, "usageScorePodcasts");
  objc_msgSend(v11, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isAppFirstParty](self, "isAppFirstParty"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRequestedApp](self, "isRequestedApp"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingBundlePSE1](self, "isNowPlayingBundlePSE1"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingBundlePSE2](self, "isNowPlayingBundlePSE2"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriMusicInferenceTrainingDependentSignals vq21Score](self, "vq21Score");
  objc_msgSend(v12, "numberWithDouble:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isSupportedFlag](self, "isSupportedFlag"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isUnicornFlag](self, "isUnicornFlag"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isSupportedUnicornMatchFlag](self, "isSupportedUnicornMatchFlag"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isDisambiguationSelectedApp](self, "isDisambiguationSelectedApp"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isModelPredictedApp](self, "isModelPredictedApp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriMusicInferenceTrainingDependentSignals usageScoreRadio](self, "usageScoreRadio");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriMusicInferenceTrainingDependentSignals usageScoreMusicWithoutRadio](self, "usageScoreMusicWithoutRadio");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalRadio](self, "rawMediaTypeUsageSignalRadio"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalMusicWithoutRadio](self, "rawMediaTypeUsageSignalMusicWithoutRadio"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (id)objc_msgSend(v30, "initWithFormat:", CFSTR("BMSiriMusicInferenceTrainingDependentSignals with isClientForegroundActiveBundle: %@, compoundActiveBundleScore: %@, compoundMediaTypeBundleScore: %@, entitySearchBundleRecencyS: %@, entitySearchBundleScore: %@, isForegroundBundle: %@, isNowPlayingBundle: %@, nowPlayingBundleCount: %@, nowPlayingBundleRecencyS: %@, nowPlayingBundleScore: %@, isNowPlayingLastBundle: %@, nowPlayingUsage1Day: %@, nowPlayingUsage7Days: %@, nowPlayingUsage14Days: %@, isRawLastNowPlayingCoreDuet: %@, isRawMediaCategoryAudiobookSignal: %@, isRawMediaCategoryMusicSignal: %@, isRawMediaCategoryPodcastSignal: %@, isRawMediaCategoryRadioSignal: %@, isRawMediaCategoryVideoSignal: %@, rawMediaTypeUsageSignalBook: %@, rawMediaTypeUsageSignalMusic: %@, rawMediaTypeUsageSignalPodcast: %@, rawMediaTypeUsageSignalVideo: %@, rawNowPlayingCountCoreDuet10Min: %@, rawNowPlayingCountCoreDuet1Day: %@, rawNowPlayingCountCoreDuet1Hr: %@, rawNowPlayingCountCoreDuet28Day: %@, rawNowPlayingCountCoreDuet2Min: %@, rawNowPlayingCountCoreDuet6Hr: %@, rawNowPlayingCountCoreDuet7Day: %@, rawNowPlayingRecencyCD: %@, rawEntitySearchRecency: %@, usageScoreBooks: %@, usageScoreMusic: %@, usageScorePodcasts: %@, isAppFirstParty: %@, isRequestedApp: %@, isNowPlayingBundlePSE1: %@, isNowPlayingBundlePSE2: %@, vq21Score: %@, isSupportedFlag: %@, isUnicornFlag: %@, isSupportedUnicornMatchFlag: %@, isDisambiguationSelectedApp: %@, isModelPredictedApp: %@, usageScoreRadio: %@, usageScoreMusicWithoutRadio: %@, rawMediaTypeUsageSignalRadio: %@, rawMediaTypeUsageSignalMusicWithoutRadio: %@"), v64, v67, v66, v65, v61, v63, v62, v60, v57, v59, v56, v58, v53, v55, v52, v50,
              v54,
              v51,
              v47,
              v49,
              v46,
              v44,
              v48,
              v43,
              v45,
              v42,
              v41,
              v40,
              v38,
              v29,
              v39,
              v28,
              v37,
              v36,
              v35,
              v27,
              v34,
              v26,
              v33,
              v25,
              v32,
              v24,
              v23,
              v22,
              v21,
              v13,
              v15,
              v17,
              v18,
              v19);

  return (NSString *)v31;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriMusicInferenceTrainingDependentSignals *v5;
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  objc_class *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  char v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  char v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  char v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  char v93;
  unsigned int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char v99;
  char v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  char v106;
  char v107;
  unsigned int v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char v113;
  char v114;
  unsigned int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  char v120;
  char v121;
  unsigned int v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  char v127;
  char v128;
  unsigned int v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  char v133;
  char v134;
  unsigned int v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  char v139;
  char v140;
  unsigned int v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  char v145;
  char v146;
  unsigned int v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  char v151;
  char v152;
  unsigned int v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  char v157;
  char v158;
  unsigned int v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  char v163;
  char v164;
  unsigned int v165;
  uint64_t v166;
  uint64_t v167;
  unint64_t v168;
  char v169;
  char v170;
  unsigned int v171;
  uint64_t v172;
  uint64_t v173;
  unint64_t v174;
  char v175;
  char v176;
  unsigned int v177;
  uint64_t v178;
  uint64_t v179;
  unint64_t v180;
  char v181;
  char v182;
  unsigned int v183;
  uint64_t v184;
  uint64_t v185;
  unint64_t v186;
  char v187;
  char v188;
  unsigned int v189;
  uint64_t v190;
  uint64_t v191;
  unint64_t v192;
  char v193;
  char v194;
  unsigned int v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  char v199;
  char v200;
  unsigned int v201;
  uint64_t v202;
  uint64_t v203;
  unint64_t v204;
  char v205;
  uint64_t v206;
  unint64_t v207;
  uint64_t v208;
  unint64_t v209;
  uint64_t v210;
  unint64_t v211;
  char v212;
  unsigned int v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  unint64_t v217;
  char v218;
  char v219;
  unsigned int v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  unint64_t v224;
  char v225;
  char v226;
  unsigned int v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  unint64_t v231;
  char v232;
  char v233;
  unsigned int v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  unint64_t v238;
  char v239;
  uint64_t v240;
  unint64_t v241;
  char v242;
  unsigned int v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  unint64_t v247;
  char v248;
  char v249;
  unsigned int v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  unint64_t v254;
  char v255;
  char v256;
  unsigned int v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  unint64_t v261;
  char v262;
  char v263;
  unsigned int v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  unint64_t v268;
  char v269;
  char v270;
  unsigned int v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  unint64_t v275;
  char v276;
  uint64_t v277;
  unint64_t v278;
  uint64_t v279;
  unint64_t v280;
  char v281;
  unsigned int v282;
  uint64_t v283;
  uint64_t v284;
  unint64_t v285;
  char v286;
  char v287;
  unsigned int v288;
  uint64_t v289;
  uint64_t v290;
  unint64_t v291;
  char v292;
  BOOL v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  BMSiriMusicInferenceTrainingDependentSignals *v297;
  objc_super v299;

  v4 = a3;
  v299.receiver = self;
  v299.super_class = (Class)BMSiriMusicInferenceTrainingDependentSignals;
  v5 = -[BMEventBase init](&v299, sel_init);
  if (!v5)
    goto LABEL_506;
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
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v5->_hasIsClientForegroundActiveBundle = 1;
          while (1)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v4[v23];
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
              break;
            v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0)
              goto LABEL_325;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              v22 = 0;
              goto LABEL_327;
            }
          }
          v4[*v8] = 1;
LABEL_325:
          if (v4[*v8])
            v22 = 0;
LABEL_327:
          v293 = v22 != 0;
          v294 = 16;
          goto LABEL_468;
        case 2u:
          v5->_hasCompoundActiveBundleScore = 1;
          v27 = *v6;
          v28 = *(_QWORD *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v28);
            *(_QWORD *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v296 = 168;
          goto LABEL_502;
        case 3u:
          v5->_hasCompoundMediaTypeBundleScore = 1;
          v30 = *v6;
          v31 = *(_QWORD *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v31);
            *(_QWORD *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v296 = 176;
          goto LABEL_502;
        case 4u:
          v5->_hasEntitySearchBundleRecencyS = 1;
          v32 = *v6;
          v33 = *(_QWORD *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v33);
            *(_QWORD *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v296 = 184;
          goto LABEL_502;
        case 5u:
          v5->_hasEntitySearchBundleScore = 1;
          v34 = *v6;
          v35 = *(_QWORD *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v35);
            *(_QWORD *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v296 = 192;
          goto LABEL_502;
        case 6u:
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v5->_hasIsForegroundBundle = 1;
          while (2)
          {
            v39 = *v6;
            v40 = *(_QWORD *)&v4[v39];
            v41 = v40 + 1;
            if (v40 == -1 || v41 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v40);
              *(_QWORD *)&v4[v39] = v41;
              v38 |= (unint64_t)(v42 & 0x7F) << v36;
              if (v42 < 0)
              {
                v36 += 7;
                v17 = v37++ >= 9;
                if (v17)
                {
                  v38 = 0;
                  goto LABEL_331;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v38 = 0;
LABEL_331:
          v293 = v38 != 0;
          v294 = 22;
          goto LABEL_468;
        case 7u:
          v43 = 0;
          v44 = 0;
          v45 = 0;
          v5->_hasIsNowPlayingBundle = 1;
          while (2)
          {
            v46 = *v6;
            v47 = *(_QWORD *)&v4[v46];
            v48 = v47 + 1;
            if (v47 == -1 || v48 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v47);
              *(_QWORD *)&v4[v46] = v48;
              v45 |= (unint64_t)(v49 & 0x7F) << v43;
              if (v49 < 0)
              {
                v43 += 7;
                v17 = v44++ >= 9;
                if (v17)
                {
                  v45 = 0;
                  goto LABEL_335;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v45 = 0;
LABEL_335:
          v293 = v45 != 0;
          v294 = 24;
          goto LABEL_468;
        case 8u:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          v5->_hasNowPlayingBundleCount = 1;
          while (2)
          {
            v53 = *v6;
            v54 = *(_QWORD *)&v4[v53];
            v55 = v54 + 1;
            if (v54 == -1 || v55 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v56 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v54);
              *(_QWORD *)&v4[v53] = v55;
              v52 |= (unint64_t)(v56 & 0x7F) << v50;
              if (v56 < 0)
              {
                v50 += 7;
                v17 = v51++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_339;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_339:
          v295 = 92;
          goto LABEL_477;
        case 9u:
          v5->_hasNowPlayingBundleRecencyS = 1;
          v57 = *v6;
          v58 = *(_QWORD *)&v4[v57];
          if (v58 <= 0xFFFFFFFFFFFFFFF7 && v58 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v58);
            *(_QWORD *)&v4[v57] = v58 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v296 = 200;
          goto LABEL_502;
        case 0xAu:
          v5->_hasNowPlayingBundleScore = 1;
          v59 = *v6;
          v60 = *(_QWORD *)&v4[v59];
          if (v60 <= 0xFFFFFFFFFFFFFFF7 && v60 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v60);
            *(_QWORD *)&v4[v59] = v60 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v296 = 208;
          goto LABEL_502;
        case 0xBu:
          v61 = 0;
          v62 = 0;
          v63 = 0;
          v5->_hasIsNowPlayingLastBundle = 1;
          while (2)
          {
            v64 = *v6;
            v65 = *(_QWORD *)&v4[v64];
            v66 = v65 + 1;
            if (v65 == -1 || v66 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v67 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v65);
              *(_QWORD *)&v4[v64] = v66;
              v63 |= (unint64_t)(v67 & 0x7F) << v61;
              if (v67 < 0)
              {
                v61 += 7;
                v17 = v62++ >= 9;
                if (v17)
                {
                  v63 = 0;
                  goto LABEL_343;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v63 = 0;
LABEL_343:
          v293 = v63 != 0;
          v294 = 29;
          goto LABEL_468;
        case 0xCu:
          v68 = 0;
          v69 = 0;
          v52 = 0;
          v5->_hasNowPlayingUsage1Day = 1;
          while (2)
          {
            v70 = *v6;
            v71 = *(_QWORD *)&v4[v70];
            v72 = v71 + 1;
            if (v71 == -1 || v72 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v73 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v71);
              *(_QWORD *)&v4[v70] = v72;
              v52 |= (unint64_t)(v73 & 0x7F) << v68;
              if (v73 < 0)
              {
                v68 += 7;
                v17 = v69++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_347;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_347:
          v295 = 96;
          goto LABEL_477;
        case 0xDu:
          v74 = 0;
          v75 = 0;
          v52 = 0;
          v5->_hasNowPlayingUsage7Days = 1;
          while (2)
          {
            v76 = *v6;
            v77 = *(_QWORD *)&v4[v76];
            v78 = v77 + 1;
            if (v77 == -1 || v78 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v79 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v77);
              *(_QWORD *)&v4[v76] = v78;
              v52 |= (unint64_t)(v79 & 0x7F) << v74;
              if (v79 < 0)
              {
                v74 += 7;
                v17 = v75++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_351;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_351:
          v295 = 100;
          goto LABEL_477;
        case 0xEu:
          v80 = 0;
          v81 = 0;
          v52 = 0;
          v5->_hasNowPlayingUsage14Days = 1;
          while (2)
          {
            v82 = *v6;
            v83 = *(_QWORD *)&v4[v82];
            v84 = v83 + 1;
            if (v83 == -1 || v84 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v85 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v83);
              *(_QWORD *)&v4[v82] = v84;
              v52 |= (unint64_t)(v85 & 0x7F) << v80;
              if (v85 < 0)
              {
                v80 += 7;
                v17 = v81++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_355;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_355:
          v295 = 104;
          goto LABEL_477;
        case 0xFu:
          v86 = 0;
          v87 = 0;
          v88 = 0;
          v5->_hasIsRawLastNowPlayingCoreDuet = 1;
          while (2)
          {
            v89 = *v6;
            v90 = *(_QWORD *)&v4[v89];
            v91 = v90 + 1;
            if (v90 == -1 || v91 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v92 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v90);
              *(_QWORD *)&v4[v89] = v91;
              v88 |= (unint64_t)(v92 & 0x7F) << v86;
              if (v92 < 0)
              {
                v86 += 7;
                v17 = v87++ >= 9;
                if (v17)
                {
                  v88 = 0;
                  goto LABEL_359;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v88 = 0;
LABEL_359:
          v293 = v88 != 0;
          v294 = 34;
          goto LABEL_468;
        case 0x10u:
          v93 = 0;
          v94 = 0;
          v95 = 0;
          v5->_hasIsRawMediaCategoryAudiobookSignal = 1;
          while (2)
          {
            v96 = *v6;
            v97 = *(_QWORD *)&v4[v96];
            v98 = v97 + 1;
            if (v97 == -1 || v98 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v99 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v97);
              *(_QWORD *)&v4[v96] = v98;
              v95 |= (unint64_t)(v99 & 0x7F) << v93;
              if (v99 < 0)
              {
                v93 += 7;
                v17 = v94++ >= 9;
                if (v17)
                {
                  v95 = 0;
                  goto LABEL_363;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v95 = 0;
LABEL_363:
          v293 = v95 != 0;
          v294 = 36;
          goto LABEL_468;
        case 0x11u:
          v100 = 0;
          v101 = 0;
          v102 = 0;
          v5->_hasIsRawMediaCategoryMusicSignal = 1;
          while (2)
          {
            v103 = *v6;
            v104 = *(_QWORD *)&v4[v103];
            v105 = v104 + 1;
            if (v104 == -1 || v105 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v106 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v104);
              *(_QWORD *)&v4[v103] = v105;
              v102 |= (unint64_t)(v106 & 0x7F) << v100;
              if (v106 < 0)
              {
                v100 += 7;
                v17 = v101++ >= 9;
                if (v17)
                {
                  v102 = 0;
                  goto LABEL_367;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v102 = 0;
LABEL_367:
          v293 = v102 != 0;
          v294 = 38;
          goto LABEL_468;
        case 0x12u:
          v107 = 0;
          v108 = 0;
          v109 = 0;
          v5->_hasIsRawMediaCategoryPodcastSignal = 1;
          while (2)
          {
            v110 = *v6;
            v111 = *(_QWORD *)&v4[v110];
            v112 = v111 + 1;
            if (v111 == -1 || v112 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v113 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v111);
              *(_QWORD *)&v4[v110] = v112;
              v109 |= (unint64_t)(v113 & 0x7F) << v107;
              if (v113 < 0)
              {
                v107 += 7;
                v17 = v108++ >= 9;
                if (v17)
                {
                  v109 = 0;
                  goto LABEL_371;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v109 = 0;
LABEL_371:
          v293 = v109 != 0;
          v294 = 40;
          goto LABEL_468;
        case 0x13u:
          v114 = 0;
          v115 = 0;
          v116 = 0;
          v5->_hasIsRawMediaCategoryRadioSignal = 1;
          while (2)
          {
            v117 = *v6;
            v118 = *(_QWORD *)&v4[v117];
            v119 = v118 + 1;
            if (v118 == -1 || v119 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v120 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v118);
              *(_QWORD *)&v4[v117] = v119;
              v116 |= (unint64_t)(v120 & 0x7F) << v114;
              if (v120 < 0)
              {
                v114 += 7;
                v17 = v115++ >= 9;
                if (v17)
                {
                  v116 = 0;
                  goto LABEL_375;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v116 = 0;
LABEL_375:
          v293 = v116 != 0;
          v294 = 42;
          goto LABEL_468;
        case 0x14u:
          v121 = 0;
          v122 = 0;
          v123 = 0;
          v5->_hasIsRawMediaCategoryVideoSignal = 1;
          while (2)
          {
            v124 = *v6;
            v125 = *(_QWORD *)&v4[v124];
            v126 = v125 + 1;
            if (v125 == -1 || v126 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v127 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v125);
              *(_QWORD *)&v4[v124] = v126;
              v123 |= (unint64_t)(v127 & 0x7F) << v121;
              if (v127 < 0)
              {
                v121 += 7;
                v17 = v122++ >= 9;
                if (v17)
                {
                  v123 = 0;
                  goto LABEL_379;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v123 = 0;
LABEL_379:
          v293 = v123 != 0;
          v294 = 44;
          goto LABEL_468;
        case 0x15u:
          v128 = 0;
          v129 = 0;
          v52 = 0;
          v5->_hasRawMediaTypeUsageSignalBook = 1;
          while (2)
          {
            v130 = *v6;
            v131 = *(_QWORD *)&v4[v130];
            v132 = v131 + 1;
            if (v131 == -1 || v132 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v133 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v131);
              *(_QWORD *)&v4[v130] = v132;
              v52 |= (unint64_t)(v133 & 0x7F) << v128;
              if (v133 < 0)
              {
                v128 += 7;
                v17 = v129++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_383;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_383:
          v295 = 108;
          goto LABEL_477;
        case 0x16u:
          v134 = 0;
          v135 = 0;
          v52 = 0;
          v5->_hasRawMediaTypeUsageSignalMusic = 1;
          while (2)
          {
            v136 = *v6;
            v137 = *(_QWORD *)&v4[v136];
            v138 = v137 + 1;
            if (v137 == -1 || v138 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v139 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v137);
              *(_QWORD *)&v4[v136] = v138;
              v52 |= (unint64_t)(v139 & 0x7F) << v134;
              if (v139 < 0)
              {
                v134 += 7;
                v17 = v135++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_387;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_387:
          v295 = 112;
          goto LABEL_477;
        case 0x17u:
          v140 = 0;
          v141 = 0;
          v52 = 0;
          v5->_hasRawMediaTypeUsageSignalPodcast = 1;
          while (2)
          {
            v142 = *v6;
            v143 = *(_QWORD *)&v4[v142];
            v144 = v143 + 1;
            if (v143 == -1 || v144 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v145 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v143);
              *(_QWORD *)&v4[v142] = v144;
              v52 |= (unint64_t)(v145 & 0x7F) << v140;
              if (v145 < 0)
              {
                v140 += 7;
                v17 = v141++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_391;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_391:
          v295 = 116;
          goto LABEL_477;
        case 0x18u:
          v146 = 0;
          v147 = 0;
          v52 = 0;
          v5->_hasRawMediaTypeUsageSignalVideo = 1;
          while (2)
          {
            v148 = *v6;
            v149 = *(_QWORD *)&v4[v148];
            v150 = v149 + 1;
            if (v149 == -1 || v150 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v151 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v149);
              *(_QWORD *)&v4[v148] = v150;
              v52 |= (unint64_t)(v151 & 0x7F) << v146;
              if (v151 < 0)
              {
                v146 += 7;
                v17 = v147++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_395;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_395:
          v295 = 120;
          goto LABEL_477;
        case 0x19u:
          v152 = 0;
          v153 = 0;
          v52 = 0;
          v5->_hasRawNowPlayingCountCoreDuet10Min = 1;
          while (2)
          {
            v154 = *v6;
            v155 = *(_QWORD *)&v4[v154];
            v156 = v155 + 1;
            if (v155 == -1 || v156 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v157 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v155);
              *(_QWORD *)&v4[v154] = v156;
              v52 |= (unint64_t)(v157 & 0x7F) << v152;
              if (v157 < 0)
              {
                v152 += 7;
                v17 = v153++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_399;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_399:
          v295 = 124;
          goto LABEL_477;
        case 0x1Au:
          v158 = 0;
          v159 = 0;
          v52 = 0;
          v5->_hasRawNowPlayingCountCoreDuet1Day = 1;
          while (2)
          {
            v160 = *v6;
            v161 = *(_QWORD *)&v4[v160];
            v162 = v161 + 1;
            if (v161 == -1 || v162 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v163 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v161);
              *(_QWORD *)&v4[v160] = v162;
              v52 |= (unint64_t)(v163 & 0x7F) << v158;
              if (v163 < 0)
              {
                v158 += 7;
                v17 = v159++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_403;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_403:
          v295 = 128;
          goto LABEL_477;
        case 0x1Bu:
          v164 = 0;
          v165 = 0;
          v52 = 0;
          v5->_hasRawNowPlayingCountCoreDuet1Hr = 1;
          while (2)
          {
            v166 = *v6;
            v167 = *(_QWORD *)&v4[v166];
            v168 = v167 + 1;
            if (v167 == -1 || v168 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v169 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v167);
              *(_QWORD *)&v4[v166] = v168;
              v52 |= (unint64_t)(v169 & 0x7F) << v164;
              if (v169 < 0)
              {
                v164 += 7;
                v17 = v165++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_407;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_407:
          v295 = 132;
          goto LABEL_477;
        case 0x1Cu:
          v170 = 0;
          v171 = 0;
          v52 = 0;
          v5->_hasRawNowPlayingCountCoreDuet28Day = 1;
          while (2)
          {
            v172 = *v6;
            v173 = *(_QWORD *)&v4[v172];
            v174 = v173 + 1;
            if (v173 == -1 || v174 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v175 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v173);
              *(_QWORD *)&v4[v172] = v174;
              v52 |= (unint64_t)(v175 & 0x7F) << v170;
              if (v175 < 0)
              {
                v170 += 7;
                v17 = v171++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_411;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_411:
          v295 = 136;
          goto LABEL_477;
        case 0x1Du:
          v176 = 0;
          v177 = 0;
          v52 = 0;
          v5->_hasRawNowPlayingCountCoreDuet2Min = 1;
          while (2)
          {
            v178 = *v6;
            v179 = *(_QWORD *)&v4[v178];
            v180 = v179 + 1;
            if (v179 == -1 || v180 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v181 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v179);
              *(_QWORD *)&v4[v178] = v180;
              v52 |= (unint64_t)(v181 & 0x7F) << v176;
              if (v181 < 0)
              {
                v176 += 7;
                v17 = v177++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_415;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_415:
          v295 = 140;
          goto LABEL_477;
        case 0x1Eu:
          v182 = 0;
          v183 = 0;
          v52 = 0;
          v5->_hasRawNowPlayingCountCoreDuet6Hr = 1;
          while (2)
          {
            v184 = *v6;
            v185 = *(_QWORD *)&v4[v184];
            v186 = v185 + 1;
            if (v185 == -1 || v186 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v187 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v185);
              *(_QWORD *)&v4[v184] = v186;
              v52 |= (unint64_t)(v187 & 0x7F) << v182;
              if (v187 < 0)
              {
                v182 += 7;
                v17 = v183++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_419;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_419:
          v295 = 144;
          goto LABEL_477;
        case 0x1Fu:
          v188 = 0;
          v189 = 0;
          v52 = 0;
          v5->_hasRawNowPlayingCountCoreDuet7Day = 1;
          while (2)
          {
            v190 = *v6;
            v191 = *(_QWORD *)&v4[v190];
            v192 = v191 + 1;
            if (v191 == -1 || v192 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v193 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v191);
              *(_QWORD *)&v4[v190] = v192;
              v52 |= (unint64_t)(v193 & 0x7F) << v188;
              if (v193 < 0)
              {
                v188 += 7;
                v17 = v189++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_423;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_423:
          v295 = 148;
          goto LABEL_477;
        case 0x20u:
          v194 = 0;
          v195 = 0;
          v52 = 0;
          v5->_hasRawNowPlayingRecencyCD = 1;
          while (2)
          {
            v196 = *v6;
            v197 = *(_QWORD *)&v4[v196];
            v198 = v197 + 1;
            if (v197 == -1 || v198 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v199 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v197);
              *(_QWORD *)&v4[v196] = v198;
              v52 |= (unint64_t)(v199 & 0x7F) << v194;
              if (v199 < 0)
              {
                v194 += 7;
                v17 = v195++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_427;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_427:
          v295 = 152;
          goto LABEL_477;
        case 0x21u:
          v200 = 0;
          v201 = 0;
          v52 = 0;
          v5->_hasRawEntitySearchRecency = 1;
          while (2)
          {
            v202 = *v6;
            v203 = *(_QWORD *)&v4[v202];
            v204 = v203 + 1;
            if (v203 == -1 || v204 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v205 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v203);
              *(_QWORD *)&v4[v202] = v204;
              v52 |= (unint64_t)(v205 & 0x7F) << v200;
              if (v205 < 0)
              {
                v200 += 7;
                v17 = v201++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_431;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_431:
          v295 = 156;
          goto LABEL_477;
        case 0x22u:
          v5->_hasUsageScoreBooks = 1;
          v206 = *v6;
          v207 = *(_QWORD *)&v4[v206];
          if (v207 <= 0xFFFFFFFFFFFFFFF7 && v207 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v207);
            *(_QWORD *)&v4[v206] = v207 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v296 = 216;
          goto LABEL_502;
        case 0x23u:
          v5->_hasUsageScoreMusic = 1;
          v208 = *v6;
          v209 = *(_QWORD *)&v4[v208];
          if (v209 <= 0xFFFFFFFFFFFFFFF7 && v209 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v209);
            *(_QWORD *)&v4[v208] = v209 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v296 = 224;
          goto LABEL_502;
        case 0x24u:
          v5->_hasUsageScorePodcasts = 1;
          v210 = *v6;
          v211 = *(_QWORD *)&v4[v210];
          if (v211 <= 0xFFFFFFFFFFFFFFF7 && v211 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v211);
            *(_QWORD *)&v4[v210] = v211 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v296 = 232;
          goto LABEL_502;
        case 0x25u:
          v212 = 0;
          v213 = 0;
          v214 = 0;
          v5->_hasIsAppFirstParty = 1;
          while (2)
          {
            v215 = *v6;
            v216 = *(_QWORD *)&v4[v215];
            v217 = v216 + 1;
            if (v216 == -1 || v217 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v218 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v216);
              *(_QWORD *)&v4[v215] = v217;
              v214 |= (unint64_t)(v218 & 0x7F) << v212;
              if (v218 < 0)
              {
                v212 += 7;
                v17 = v213++ >= 9;
                if (v17)
                {
                  v214 = 0;
                  goto LABEL_435;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v214 = 0;
LABEL_435:
          v293 = v214 != 0;
          v294 = 62;
          goto LABEL_468;
        case 0x26u:
          v219 = 0;
          v220 = 0;
          v221 = 0;
          v5->_hasIsRequestedApp = 1;
          while (2)
          {
            v222 = *v6;
            v223 = *(_QWORD *)&v4[v222];
            v224 = v223 + 1;
            if (v223 == -1 || v224 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v225 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v223);
              *(_QWORD *)&v4[v222] = v224;
              v221 |= (unint64_t)(v225 & 0x7F) << v219;
              if (v225 < 0)
              {
                v219 += 7;
                v17 = v220++ >= 9;
                if (v17)
                {
                  v221 = 0;
                  goto LABEL_439;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v221 = 0;
LABEL_439:
          v293 = v221 != 0;
          v294 = 64;
          goto LABEL_468;
        case 0x27u:
          v226 = 0;
          v227 = 0;
          v228 = 0;
          v5->_hasIsNowPlayingBundlePSE1 = 1;
          while (2)
          {
            v229 = *v6;
            v230 = *(_QWORD *)&v4[v229];
            v231 = v230 + 1;
            if (v230 == -1 || v231 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v232 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v230);
              *(_QWORD *)&v4[v229] = v231;
              v228 |= (unint64_t)(v232 & 0x7F) << v226;
              if (v232 < 0)
              {
                v226 += 7;
                v17 = v227++ >= 9;
                if (v17)
                {
                  v228 = 0;
                  goto LABEL_443;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v228 = 0;
LABEL_443:
          v293 = v228 != 0;
          v294 = 66;
          goto LABEL_468;
        case 0x28u:
          v233 = 0;
          v234 = 0;
          v235 = 0;
          v5->_hasIsNowPlayingBundlePSE2 = 1;
          while (2)
          {
            v236 = *v6;
            v237 = *(_QWORD *)&v4[v236];
            v238 = v237 + 1;
            if (v237 == -1 || v238 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v239 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v237);
              *(_QWORD *)&v4[v236] = v238;
              v235 |= (unint64_t)(v239 & 0x7F) << v233;
              if (v239 < 0)
              {
                v233 += 7;
                v17 = v234++ >= 9;
                if (v17)
                {
                  v235 = 0;
                  goto LABEL_447;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v235 = 0;
LABEL_447:
          v293 = v235 != 0;
          v294 = 68;
          goto LABEL_468;
        case 0x29u:
          v5->_hasVq21Score = 1;
          v240 = *v6;
          v241 = *(_QWORD *)&v4[v240];
          if (v241 <= 0xFFFFFFFFFFFFFFF7 && v241 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v241);
            *(_QWORD *)&v4[v240] = v241 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v296 = 240;
          goto LABEL_502;
        case 0x2Au:
          v242 = 0;
          v243 = 0;
          v244 = 0;
          v5->_hasIsSupportedFlag = 1;
          while (2)
          {
            v245 = *v6;
            v246 = *(_QWORD *)&v4[v245];
            v247 = v246 + 1;
            if (v246 == -1 || v247 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v248 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v246);
              *(_QWORD *)&v4[v245] = v247;
              v244 |= (unint64_t)(v248 & 0x7F) << v242;
              if (v248 < 0)
              {
                v242 += 7;
                v17 = v243++ >= 9;
                if (v17)
                {
                  v244 = 0;
                  goto LABEL_451;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v244 = 0;
LABEL_451:
          v293 = v244 != 0;
          v294 = 71;
          goto LABEL_468;
        case 0x2Bu:
          v249 = 0;
          v250 = 0;
          v251 = 0;
          v5->_hasIsUnicornFlag = 1;
          while (2)
          {
            v252 = *v6;
            v253 = *(_QWORD *)&v4[v252];
            v254 = v253 + 1;
            if (v253 == -1 || v254 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v255 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v253);
              *(_QWORD *)&v4[v252] = v254;
              v251 |= (unint64_t)(v255 & 0x7F) << v249;
              if (v255 < 0)
              {
                v249 += 7;
                v17 = v250++ >= 9;
                if (v17)
                {
                  v251 = 0;
                  goto LABEL_455;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v251 = 0;
LABEL_455:
          v293 = v251 != 0;
          v294 = 73;
          goto LABEL_468;
        case 0x2Cu:
          v256 = 0;
          v257 = 0;
          v258 = 0;
          v5->_hasIsSupportedUnicornMatchFlag = 1;
          while (2)
          {
            v259 = *v6;
            v260 = *(_QWORD *)&v4[v259];
            v261 = v260 + 1;
            if (v260 == -1 || v261 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v262 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v260);
              *(_QWORD *)&v4[v259] = v261;
              v258 |= (unint64_t)(v262 & 0x7F) << v256;
              if (v262 < 0)
              {
                v256 += 7;
                v17 = v257++ >= 9;
                if (v17)
                {
                  v258 = 0;
                  goto LABEL_459;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v258 = 0;
LABEL_459:
          v293 = v258 != 0;
          v294 = 75;
          goto LABEL_468;
        case 0x2Du:
          v263 = 0;
          v264 = 0;
          v265 = 0;
          v5->_hasIsDisambiguationSelectedApp = 1;
          while (2)
          {
            v266 = *v6;
            v267 = *(_QWORD *)&v4[v266];
            v268 = v267 + 1;
            if (v267 == -1 || v268 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v269 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v267);
              *(_QWORD *)&v4[v266] = v268;
              v265 |= (unint64_t)(v269 & 0x7F) << v263;
              if (v269 < 0)
              {
                v263 += 7;
                v17 = v264++ >= 9;
                if (v17)
                {
                  v265 = 0;
                  goto LABEL_463;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v265 = 0;
LABEL_463:
          v293 = v265 != 0;
          v294 = 77;
          goto LABEL_468;
        case 0x2Eu:
          v270 = 0;
          v271 = 0;
          v272 = 0;
          v5->_hasIsModelPredictedApp = 1;
          while (2)
          {
            v273 = *v6;
            v274 = *(_QWORD *)&v4[v273];
            v275 = v274 + 1;
            if (v274 == -1 || v275 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v276 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v274);
              *(_QWORD *)&v4[v273] = v275;
              v272 |= (unint64_t)(v276 & 0x7F) << v270;
              if (v276 < 0)
              {
                v270 += 7;
                v17 = v271++ >= 9;
                if (v17)
                {
                  v272 = 0;
                  goto LABEL_467;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v272 = 0;
LABEL_467:
          v293 = v272 != 0;
          v294 = 79;
LABEL_468:
          *((_BYTE *)&v5->super.super.isa + v294) = v293;
          continue;
        case 0x2Fu:
          v5->_hasUsageScoreRadio = 1;
          v277 = *v6;
          v278 = *(_QWORD *)&v4[v277];
          if (v278 <= 0xFFFFFFFFFFFFFFF7 && v278 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v278);
            *(_QWORD *)&v4[v277] = v278 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v296 = 248;
          goto LABEL_502;
        case 0x30u:
          v5->_hasUsageScoreMusicWithoutRadio = 1;
          v279 = *v6;
          v280 = *(_QWORD *)&v4[v279];
          if (v280 <= 0xFFFFFFFFFFFFFFF7 && v280 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v280);
            *(_QWORD *)&v4[v279] = v280 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v296 = 256;
LABEL_502:
          *(Class *)((char *)&v5->super.super.isa + v296) = v29;
          continue;
        case 0x31u:
          v281 = 0;
          v282 = 0;
          v52 = 0;
          v5->_hasRawMediaTypeUsageSignalRadio = 1;
          while (2)
          {
            v283 = *v6;
            v284 = *(_QWORD *)&v4[v283];
            v285 = v284 + 1;
            if (v284 == -1 || v285 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v286 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v284);
              *(_QWORD *)&v4[v283] = v285;
              v52 |= (unint64_t)(v286 & 0x7F) << v281;
              if (v286 < 0)
              {
                v281 += 7;
                v17 = v282++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_472;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v52) = 0;
LABEL_472:
          v295 = 160;
          goto LABEL_477;
        case 0x32u:
          v287 = 0;
          v288 = 0;
          v52 = 0;
          v5->_hasRawMediaTypeUsageSignalMusicWithoutRadio = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_505;
          continue;
      }
      while (1)
      {
        v289 = *v6;
        v290 = *(_QWORD *)&v4[v289];
        v291 = v290 + 1;
        if (v290 == -1 || v291 > *(_QWORD *)&v4[*v7])
          break;
        v292 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v290);
        *(_QWORD *)&v4[v289] = v291;
        v52 |= (unint64_t)(v292 & 0x7F) << v287;
        if ((v292 & 0x80) == 0)
          goto LABEL_474;
        v287 += 7;
        v17 = v288++ >= 9;
        if (v17)
        {
          LODWORD(v52) = 0;
          goto LABEL_476;
        }
      }
      v4[*v8] = 1;
LABEL_474:
      if (v4[*v8])
        LODWORD(v52) = 0;
LABEL_476:
      v295 = 164;
LABEL_477:
      *(_DWORD *)((char *)&v5->super.super.isa + v295) = v52;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_505:
    v297 = 0;
  else
LABEL_506:
    v297 = v5;

  return v297;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasIsClientForegroundActiveBundle)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasCompoundActiveBundleScore)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasCompoundMediaTypeBundleScore)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasEntitySearchBundleRecencyS)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasEntitySearchBundleScore)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasIsForegroundBundle)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsNowPlayingBundle)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasNowPlayingBundleCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasNowPlayingBundleRecencyS)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasNowPlayingBundleScore)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasIsNowPlayingLastBundle)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasNowPlayingUsage1Day)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasNowPlayingUsage7Days)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasNowPlayingUsage14Days)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasIsRawLastNowPlayingCoreDuet)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsRawMediaCategoryAudiobookSignal)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsRawMediaCategoryMusicSignal)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsRawMediaCategoryPodcastSignal)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsRawMediaCategoryRadioSignal)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsRawMediaCategoryVideoSignal)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasRawMediaTypeUsageSignalBook)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRawMediaTypeUsageSignalMusic)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRawMediaTypeUsageSignalPodcast)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRawMediaTypeUsageSignalVideo)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRawNowPlayingCountCoreDuet10Min)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRawNowPlayingCountCoreDuet1Day)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRawNowPlayingCountCoreDuet1Hr)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRawNowPlayingCountCoreDuet28Day)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRawNowPlayingCountCoreDuet2Min)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRawNowPlayingCountCoreDuet6Hr)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRawNowPlayingCountCoreDuet7Day)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRawNowPlayingRecencyCD)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRawEntitySearchRecency)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasUsageScoreBooks)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasUsageScoreMusic)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasUsageScorePodcasts)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasIsAppFirstParty)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsRequestedApp)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsNowPlayingBundlePSE1)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsNowPlayingBundlePSE2)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasVq21Score)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasIsSupportedFlag)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsUnicornFlag)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsSupportedUnicornMatchFlag)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsDisambiguationSelectedApp)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsModelPredictedApp)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasUsageScoreRadio)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasUsageScoreMusicWithoutRadio)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasRawMediaTypeUsageSignalRadio)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRawMediaTypeUsageSignalMusicWithoutRadio)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriMusicInferenceTrainingDependentSignals writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriMusicInferenceTrainingDependentSignals)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  _QWORD *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  BMSiriMusicInferenceTrainingDependentSignals *v38;
  id v39;
  uint64_t v40;
  void *v41;
  BMSiriMusicInferenceTrainingDependentSignals *v42;
  id v43;
  id *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  id *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id *v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  id *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  id *v67;
  id v68;
  uint64_t v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id *v75;
  uint64_t v76;
  id v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id *v82;
  uint64_t v83;
  id v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
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
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  id v150;
  id v151;
  id v152;
  id *v153;
  uint64_t v154;
  id v155;
  void *v156;
  void *v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  id *v161;
  id v162;
  uint64_t v163;
  id v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  id v168;
  id *v169;
  uint64_t v170;
  id v171;
  void *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  id v176;
  _QWORD *v177;
  uint64_t v178;
  id v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  uint64_t v184;
  id v185;
  uint64_t v186;
  id v187;
  void *v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  id *v192;
  id v193;
  uint64_t v194;
  id v195;
  void *v196;
  void *v197;
  uint64_t v198;
  uint64_t v199;
  id *v200;
  id v201;
  uint64_t v202;
  id v203;
  void *v204;
  uint64_t v205;
  uint64_t v206;
  id *v207;
  id v208;
  uint64_t v209;
  id v210;
  void *v211;
  uint64_t v212;
  uint64_t v213;
  id *v214;
  id v215;
  uint64_t v216;
  id v217;
  void *v218;
  void *v219;
  uint64_t v220;
  uint64_t v221;
  id *v222;
  id v223;
  uint64_t v224;
  id v225;
  void *v226;
  uint64_t v227;
  uint64_t v228;
  id *v229;
  id v230;
  uint64_t v231;
  id v232;
  void *v233;
  uint64_t v234;
  uint64_t v235;
  id *v236;
  id v237;
  uint64_t v238;
  id v239;
  void *v240;
  uint64_t v241;
  uint64_t v242;
  id *v243;
  id v244;
  uint64_t v245;
  id v246;
  void *v247;
  uint64_t v248;
  uint64_t v249;
  id *v250;
  id v251;
  uint64_t v252;
  id v253;
  void *v254;
  uint64_t v255;
  uint64_t v256;
  id *v257;
  id v258;
  uint64_t v259;
  id v260;
  void *v261;
  void *v262;
  uint64_t v263;
  uint64_t v264;
  id *v265;
  id v266;
  uint64_t v267;
  id v268;
  void *v269;
  uint64_t v270;
  uint64_t v271;
  id *v272;
  id v273;
  uint64_t v274;
  id v275;
  void *v276;
  void *v277;
  uint64_t v278;
  uint64_t v279;
  id *v280;
  id v281;
  uint64_t v282;
  id v283;
  void *v284;
  uint64_t v285;
  uint64_t v286;
  id *v287;
  id v288;
  uint64_t v289;
  id v290;
  void *v291;
  id v292;
  uint64_t v293;
  uint64_t v294;
  id v295;
  id *v296;
  id v297;
  uint64_t v298;
  id v299;
  void *v300;
  uint64_t v301;
  uint64_t v302;
  id *v303;
  id v304;
  uint64_t v305;
  id v306;
  void *v307;
  uint64_t v308;
  uint64_t v309;
  id *v310;
  id v311;
  uint64_t v312;
  id v313;
  void *v314;
  uint64_t v315;
  uint64_t v316;
  id *v317;
  id v318;
  uint64_t v319;
  id v320;
  void *v321;
  uint64_t v322;
  uint64_t v323;
  id *v324;
  id v325;
  uint64_t v326;
  id v327;
  void *v328;
  uint64_t v329;
  uint64_t v330;
  id *v331;
  id v332;
  uint64_t v333;
  id v334;
  void *v335;
  uint64_t v336;
  uint64_t v337;
  id *v338;
  id v339;
  uint64_t v340;
  id v341;
  void *v342;
  void *v343;
  uint64_t v344;
  id *v345;
  id v346;
  uint64_t v347;
  id v348;
  void *v349;
  void *v350;
  uint64_t v351;
  id *v352;
  id v353;
  uint64_t v354;
  id v355;
  void *v356;
  id v357;
  uint64_t v358;
  uint64_t v359;
  id *v360;
  id v361;
  uint64_t v362;
  id v363;
  void *v364;
  uint64_t v365;
  uint64_t v366;
  id *v367;
  id v368;
  uint64_t v369;
  id v370;
  void *v371;
  uint64_t v372;
  uint64_t v373;
  id *v374;
  id v375;
  uint64_t v376;
  id v377;
  void *v378;
  uint64_t v379;
  uint64_t v380;
  id *v381;
  id v382;
  uint64_t v383;
  id v384;
  void *v385;
  uint64_t v386;
  uint64_t v387;
  id *v388;
  id v389;
  uint64_t v390;
  id v391;
  void *v392;
  uint64_t v393;
  uint64_t v394;
  BMSiriMusicInferenceTrainingDependentSignals *v395;
  id v396;
  uint64_t v397;
  id v398;
  uint64_t v399;
  id v400;
  uint64_t v401;
  id v402;
  id v403;
  BMSiriMusicInferenceTrainingDependentSignals *v404;
  id v405;
  uint64_t v406;
  id v407;
  BMSiriMusicInferenceTrainingDependentSignals *v408;
  void *v409;
  id v410;
  uint64_t v411;
  id v412;
  id v413;
  uint64_t v414;
  id v415;
  void *v416;
  id v417;
  uint64_t v418;
  id v419;
  id v420;
  uint64_t v421;
  id v422;
  id v423;
  void *v424;
  void *v425;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
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
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  id v470;
  void *v471;
  id v472;
  void *v473;
  id v474;
  void *v475;
  id v476;
  void *v477;
  id v478;
  void *v479;
  void *v480;
  void *v481;
  id v482;
  id v483;
  void *v484;
  void *v485;
  id v486;
  id v487;
  void *v488;
  id v489;
  id v490;
  void *v491;
  void *v492;
  id v493;
  void *v494;
  id v495;
  id v496;
  void *v497;
  id v498;
  void *v499;
  id v500;
  void *v501;
  id v502;
  void *v503;
  id v504;
  void *v505;
  id v506;
  void *v507;
  id v508;
  void *v509;
  id v510;
  id v511;
  void *v512;
  void *v513;
  id v514;
  void *v515;
  void *v516;
  id v517;
  void *v518;
  id v519;
  id v520;
  void *v521;
  id v522;
  void *v523;
  id v524;
  void *v525;
  id v526;
  id v527;
  void *v528;
  void *v529;
  id v530;
  void *v531;
  id v532;
  id v533;
  void *v534;
  id v535;
  void *v536;
  _QWORD *v537;
  void *v538;
  _QWORD *v539;
  id v540;
  void *v541;
  id v542;
  void *v543;
  id v544;
  id v545;
  id v546;
  void *v547;
  id v548;
  void *v549;
  id v550;
  void *v551;
  id v552;
  id v553;
  id v554;
  id v555;
  void *v556;
  id v557;
  id v558;
  id v559;
  id v560;
  id v561;
  id v562;
  id v563;
  id v564;
  id v565;
  id v566;
  id v567;
  id v568;
  id v569;
  id v570;
  id v571;
  id v572;
  id v573;
  id v574;
  id v575;
  id v576;
  id v577;
  id v578;
  id v579;
  id v580;
  id v581;
  id v582;
  id v583;
  id v584;
  id v585;
  id v586;
  id v587;
  id v588;
  id v589;
  id v590;
  id v591;
  id v592;
  id v593;
  id v594;
  id v595;
  uint64_t v596;
  id v597;
  id v598;
  void *v599;
  void *v600;
  void *v601;
  id v602;
  id v603;
  void *v604;
  id v605;
  uint64_t v606;
  id v607;
  id v608;
  id v609;
  id v610;
  void *v611;
  uint64_t v612;
  void *v613;
  uint64_t v614;
  void *v615;
  uint64_t v616;
  void *v617;
  uint64_t v618;
  id v619;
  uint64_t v620;
  id v621;
  uint64_t v622;
  id v623;
  uint64_t v624;
  id v625;
  uint64_t v626;
  id v627;
  uint64_t v628;
  id v629;
  uint64_t v630;
  id v631;
  uint64_t v632;
  id v633;
  uint64_t v634;
  id v635;
  uint64_t v636;
  void *v637;
  uint64_t v638;
  id v639;
  uint64_t v640;
  id v641;
  uint64_t v642;
  id v643;
  uint64_t v644;
  id v645;
  uint64_t v646;
  id v647;
  uint64_t v648;
  id v649;
  uint64_t v650;
  id v651;
  uint64_t v652;
  id v653;
  uint64_t v654;
  id v655;
  uint64_t v656;
  id v657;
  uint64_t v658;
  id v659;
  uint64_t v660;
  id v661;
  uint64_t v662;
  void *v663;
  uint64_t v664;
  id v665;
  uint64_t v666;
  void *v667;
  uint64_t v668;
  id v669;
  uint64_t v670;
  id v671;
  uint64_t v672;
  id v673;
  uint64_t v674;
  id v675;
  uint64_t v676;
  id v677;
  uint64_t v678;
  void *v679;
  uint64_t v680;
  id v681;
  uint64_t v682;
  id v683;
  uint64_t v684;
  void *v685;
  uint64_t v686;
  void *v687;
  uint64_t v688;
  uint64_t v689;
  uint64_t v690;
  uint64_t v691;
  uint64_t v692;
  id v693;
  uint64_t v694;
  void *v695;
  uint64_t v696;
  id v697;
  uint64_t v698;
  id v699;
  uint64_t v700;
  id v701;
  uint64_t v702;
  void *v703;
  uint64_t v704;
  id v705;
  uint64_t v706;
  id v707;
  uint64_t v708;
  uint64_t v709;
  uint64_t v710;
  _QWORD v711[3];

  v711[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isClientForegroundActiveBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("compoundActiveBundleScore"));
    v611 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v611 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v610 = v8;
      v9 = a4;
      v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v610 = v8;
      v9 = a4;
      v10 = v611;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("compoundMediaTypeBundleScore"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v607 = v10;
        v12 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v607 = v10;
        v12 = v11;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entitySearchBundleRecencyS"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v601 = v13;
          v608 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v601 = v13;
          v608 = v13;
LABEL_13:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entitySearchBundleScore"));
          v14 = objc_claimAutoreleasedReturnValue();
          v604 = (void *)v14;
          if (!v14 || (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v602 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v602 = v15;
LABEL_16:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isForegroundBundle"));
            v16 = objc_claimAutoreleasedReturnValue();
            v600 = (void *)v16;
            if (!v16 || (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v557 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v557 = v17;
LABEL_19:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isNowPlayingBundle"));
              v18 = objc_claimAutoreleasedReturnValue();
              v599 = (void *)v18;
              if (!v18 || (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v597 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v597 = v19;
LABEL_22:
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nowPlayingBundleCount"));
                v20 = objc_claimAutoreleasedReturnValue();
                v556 = (void *)v20;
                if (!v20 || (v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v552 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v552 = v21;
LABEL_25:
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nowPlayingBundleRecencyS"));
                  v22 = objc_claimAutoreleasedReturnValue();
                  v551 = (void *)v22;
                  if (!v22 || (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v24 = 0;
                    goto LABEL_28;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v24 = v23;
LABEL_28:
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nowPlayingBundleScore"));
                    v25 = objc_claimAutoreleasedReturnValue();
                    v549 = (void *)v25;
                    if (!v25 || (v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v544 = 0;
LABEL_31:
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isNowPlayingLastBundle"));
                      v27 = objc_claimAutoreleasedReturnValue();
                      v547 = (void *)v27;
                      if (v27 && (v28 = (void *)v27, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (!v9)
                          {
                            v545 = 0;
                            v38 = 0;
                            v48 = v601;
                            v8 = v610;
LABEL_455:
                            v157 = v544;
                            goto LABEL_456;
                          }
                          v169 = v9;
                          v546 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v564 = v12;
                          v170 = *MEMORY[0x1E0D025B8];
                          v690 = *MEMORY[0x1E0CB2D50];
                          v171 = objc_alloc(MEMORY[0x1E0CB3940]);
                          v434 = objc_opt_class();
                          v172 = v171;
                          v8 = v610;
                          v173 = objc_msgSend(v172, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v434, CFSTR("isNowPlayingLastBundle"));
                          v691 = v173;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v691, &v690, 1);
                          v174 = objc_claimAutoreleasedReturnValue();
                          v175 = v170;
                          v12 = v564;
                          v543 = (void *)v174;
                          v176 = (id)objc_msgSend(v546, "initWithDomain:code:userInfo:", v175, 2);
                          v38 = 0;
                          v545 = 0;
                          *v169 = v176;
                          v177 = (_QWORD *)v173;
                          v48 = v601;
                          goto LABEL_454;
                        }
                        v545 = v28;
                      }
                      else
                      {
                        v545 = 0;
                      }
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nowPlayingUsage1Day"));
                      v29 = objc_claimAutoreleasedReturnValue();
                      v540 = v24;
                      v543 = (void *)v29;
                      if (!v29 || (v30 = (void *)v29, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v31 = 0;
LABEL_37:
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nowPlayingUsage7Days"));
                        v32 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                        v539 = v31;
                        v541 = v32;
                        if (!v32)
                          goto LABEL_85;
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v32 = 0;
                          goto LABEL_85;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v32 = v32;
LABEL_85:
                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nowPlayingUsage14Days"));
                          v89 = objc_claimAutoreleasedReturnValue();
                          v537 = v32;
                          v538 = (void *)v89;
                          if (!v89 || (v90 = (void *)v89, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v535 = 0;
                            goto LABEL_88;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v535 = v90;
LABEL_88:
                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRawLastNowPlayingCoreDuet"));
                            v91 = objc_claimAutoreleasedReturnValue();
                            v536 = (void *)v91;
                            if (!v91 || (v92 = (void *)v91, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v533 = 0;
                              goto LABEL_91;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v533 = v92;
LABEL_91:
                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRawMediaCategoryAudiobookSignal"));
                              v93 = objc_claimAutoreleasedReturnValue();
                              v534 = (void *)v93;
                              if (!v93 || (v94 = (void *)v93, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v532 = 0;
LABEL_94:
                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRawMediaCategoryMusicSignal"));
                                v95 = objc_claimAutoreleasedReturnValue();
                                v531 = (void *)v95;
                                if (v95 && (v96 = (void *)v95, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (!v9)
                                    {
                                      v530 = 0;
                                      v38 = 0;
                                      v48 = v601;
                                      v8 = v610;
LABEL_448:
                                      v197 = v533;
                                      goto LABEL_449;
                                    }
                                    v214 = v9;
                                    v215 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v570 = v12;
                                    v216 = *MEMORY[0x1E0D025B8];
                                    v678 = *MEMORY[0x1E0CB2D50];
                                    v217 = objc_alloc(MEMORY[0x1E0CB3940]);
                                    v440 = objc_opt_class();
                                    v218 = v217;
                                    v8 = v610;
                                    v219 = (void *)objc_msgSend(v218, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v440, CFSTR("isRawMediaCategoryMusicSignal"));
                                    v679 = v219;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v679, &v678, 1);
                                    v220 = objc_claimAutoreleasedReturnValue();
                                    v221 = v216;
                                    v12 = v570;
                                    v529 = (void *)v220;
                                    v38 = 0;
                                    v530 = 0;
                                    *v214 = (id)objc_msgSend(v215, "initWithDomain:code:userInfo:", v221, 2);
                                    v48 = v601;
                                    goto LABEL_267;
                                  }
                                  v530 = v96;
                                }
                                else
                                {
                                  v530 = 0;
                                }
                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRawMediaCategoryPodcastSignal"));
                                v97 = objc_claimAutoreleasedReturnValue();
                                v529 = (void *)v97;
                                if (!v97 || (v98 = (void *)v97, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v526 = 0;
                                  goto LABEL_100;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v526 = v98;
LABEL_100:
                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRawMediaCategoryRadioSignal"));
                                  v99 = objc_claimAutoreleasedReturnValue();
                                  v528 = (void *)v99;
                                  if (!v99
                                    || (v100 = (void *)v99, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v527 = 0;
                                    goto LABEL_103;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v527 = v100;
LABEL_103:
                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRawMediaCategoryVideoSignal"));
                                    v101 = objc_claimAutoreleasedReturnValue();
                                    v525 = (void *)v101;
                                    if (!v101
                                      || (v102 = (void *)v101, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v524 = 0;
                                      goto LABEL_106;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v524 = v102;
LABEL_106:
                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawMediaTypeUsageSignalBook"));
                                      v103 = objc_claimAutoreleasedReturnValue();
                                      v523 = (void *)v103;
                                      if (!v103
                                        || (v104 = (void *)v103, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v522 = 0;
                                        goto LABEL_109;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v522 = v104;
LABEL_109:
                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawMediaTypeUsageSignalMusic"));
                                        v105 = objc_claimAutoreleasedReturnValue();
                                        v521 = (void *)v105;
                                        if (!v105
                                          || (v106 = (void *)v105, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v520 = 0;
LABEL_112:
                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawMediaTypeUsageSignalPodcast"));
                                          v107 = objc_claimAutoreleasedReturnValue();
                                          v518 = (void *)v107;
                                          if (v107
                                            && (v108 = (void *)v107,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) == 0))
                                          {
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                            {
                                              if (!v9)
                                              {
                                                v517 = 0;
                                                v38 = 0;
                                                v48 = v601;
                                                v8 = v610;
LABEL_441:
                                                v219 = v526;
                                                goto LABEL_442;
                                              }
                                              v257 = v9;
                                              v258 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v576 = v12;
                                              v259 = *MEMORY[0x1E0D025B8];
                                              v666 = *MEMORY[0x1E0CB2D50];
                                              v260 = objc_alloc(MEMORY[0x1E0CB3940]);
                                              v446 = objc_opt_class();
                                              v261 = v260;
                                              v8 = v610;
                                              v262 = (void *)objc_msgSend(v261, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v446, CFSTR("rawMediaTypeUsageSignalPodcast"));
                                              v667 = v262;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v667, &v666, 1);
                                              v263 = objc_claimAutoreleasedReturnValue();
                                              v264 = v259;
                                              v12 = v576;
                                              v516 = (void *)v263;
                                              v38 = 0;
                                              v517 = 0;
                                              *v257 = (id)objc_msgSend(v258, "initWithDomain:code:userInfo:", v264, 2);
                                              v48 = v601;
                                              goto LABEL_298;
                                            }
                                            v517 = v108;
                                          }
                                          else
                                          {
                                            v517 = 0;
                                          }
                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawMediaTypeUsageSignalVideo"));
                                          v109 = objc_claimAutoreleasedReturnValue();
                                          v516 = (void *)v109;
                                          if (!v109
                                            || (v110 = (void *)v109,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            v519 = 0;
LABEL_118:
                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawNowPlayingCountCoreDuet10Min"));
                                            v111 = objc_claimAutoreleasedReturnValue();
                                            v515 = (void *)v111;
                                            if (v111
                                              && (v112 = (void *)v111,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                            {
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                              {
                                                if (!v9)
                                                {
                                                  v514 = 0;
                                                  v38 = 0;
                                                  v48 = v601;
                                                  v8 = v610;
LABEL_438:
                                                  v262 = v519;
                                                  goto LABEL_439;
                                                }
                                                v272 = v9;
                                                v273 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v578 = v12;
                                                v274 = *MEMORY[0x1E0D025B8];
                                                v662 = *MEMORY[0x1E0CB2D50];
                                                v275 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                v448 = objc_opt_class();
                                                v276 = v275;
                                                v8 = v610;
                                                v277 = (void *)objc_msgSend(v276, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v448, CFSTR("rawNowPlayingCountCoreDuet10Min"));
                                                v663 = v277;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v663, &v662, 1);
                                                v278 = objc_claimAutoreleasedReturnValue();
                                                v279 = v274;
                                                v12 = v578;
                                                v513 = (void *)v278;
                                                v38 = 0;
                                                v514 = 0;
                                                *v272 = (id)objc_msgSend(v273, "initWithDomain:code:userInfo:", v279, 2);
                                                v48 = v601;
                                                goto LABEL_309;
                                              }
                                              v514 = v112;
                                            }
                                            else
                                            {
                                              v514 = 0;
                                            }
                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawNowPlayingCountCoreDuet1Day"));
                                            v113 = objc_claimAutoreleasedReturnValue();
                                            v513 = (void *)v113;
                                            if (!v113
                                              || (v114 = (void *)v113,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              v510 = 0;
LABEL_124:
                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawNowPlayingCountCoreDuet1Hr"));
                                              v115 = objc_claimAutoreleasedReturnValue();
                                              v512 = (void *)v115;
                                              if (v115
                                                && (v116 = (void *)v115,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                              {
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                {
                                                  if (!v9)
                                                  {
                                                    v511 = 0;
                                                    v38 = 0;
                                                    v48 = v601;
                                                    v8 = v610;
LABEL_435:
                                                    v277 = v510;
                                                    goto LABEL_436;
                                                  }
                                                  v287 = v9;
                                                  v288 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v580 = v12;
                                                  v289 = *MEMORY[0x1E0D025B8];
                                                  v658 = *MEMORY[0x1E0CB2D50];
                                                  v290 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                  v450 = objc_opt_class();
                                                  v291 = v290;
                                                  v8 = v610;
                                                  v292 = v533;
                                                  v508 = (id)objc_msgSend(v291, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v450, CFSTR("rawNowPlayingCountCoreDuet1Hr"));
                                                  v659 = v508;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v659, &v658, 1);
                                                  v293 = objc_claimAutoreleasedReturnValue();
                                                  v294 = v289;
                                                  v12 = v580;
                                                  v509 = (void *)v293;
                                                  v38 = 0;
                                                  v511 = 0;
                                                  *v287 = (id)objc_msgSend(v288, "initWithDomain:code:userInfo:", v294, 2);
                                                  v48 = v601;
                                                  v32 = v537;
LABEL_434:
                                                  v533 = v292;

                                                  goto LABEL_435;
                                                }
                                                v511 = v116;
                                              }
                                              else
                                              {
                                                v511 = 0;
                                              }
                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawNowPlayingCountCoreDuet28Day"));
                                              v117 = objc_claimAutoreleasedReturnValue();
                                              v509 = (void *)v117;
                                              if (v117
                                                && (v118 = (void *)v117,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                              {
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                {
                                                  v295 = v519;
                                                  if (!v9)
                                                  {
                                                    v508 = 0;
                                                    v38 = 0;
                                                    v48 = v601;
                                                    v8 = v610;
LABEL_433:
                                                    v292 = v533;
                                                    goto LABEL_434;
                                                  }
                                                  v296 = v9;
                                                  v297 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v581 = v12;
                                                  v298 = *MEMORY[0x1E0D025B8];
                                                  v656 = *MEMORY[0x1E0CB2D50];
                                                  v299 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                  v451 = objc_opt_class();
                                                  v300 = v299;
                                                  v8 = v610;
                                                  v506 = (id)objc_msgSend(v300, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v451, CFSTR("rawNowPlayingCountCoreDuet28Day"));
                                                  v657 = v506;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v657, &v656, 1);
                                                  v301 = objc_claimAutoreleasedReturnValue();
                                                  v302 = v298;
                                                  v12 = v581;
                                                  v507 = (void *)v301;
                                                  v38 = 0;
                                                  v508 = 0;
                                                  *v296 = (id)objc_msgSend(v297, "initWithDomain:code:userInfo:", v302, 2);
                                                  v48 = v601;
                                                  v32 = v537;
                                                  goto LABEL_432;
                                                }
                                                v508 = v118;
                                              }
                                              else
                                              {
                                                v508 = 0;
                                              }
                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawNowPlayingCountCoreDuet2Min"));
                                              v119 = objc_claimAutoreleasedReturnValue();
                                              v507 = (void *)v119;
                                              if (!v119
                                                || (v120 = (void *)v119,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                v506 = 0;
                                                goto LABEL_133;
                                              }
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v506 = v120;
LABEL_133:
                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawNowPlayingCountCoreDuet6Hr"));
                                                v121 = objc_claimAutoreleasedReturnValue();
                                                v505 = (void *)v121;
                                                if (!v121
                                                  || (v122 = (void *)v121,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  v504 = 0;
                                                  goto LABEL_136;
                                                }
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  v504 = v122;
LABEL_136:
                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawNowPlayingCountCoreDuet7Day"));
                                                  v123 = objc_claimAutoreleasedReturnValue();
                                                  v503 = (void *)v123;
                                                  if (!v123
                                                    || (v124 = (void *)v123,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    v502 = 0;
                                                    goto LABEL_139;
                                                  }
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    v502 = v124;
LABEL_139:
                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawNowPlayingRecencyCD"));
                                                    v125 = objc_claimAutoreleasedReturnValue();
                                                    v501 = (void *)v125;
                                                    if (!v125
                                                      || (v126 = (void *)v125,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      v500 = 0;
                                                      goto LABEL_142;
                                                    }
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v500 = v126;
LABEL_142:
                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawEntitySearchRecency"));
                                                      v127 = objc_claimAutoreleasedReturnValue();
                                                      v499 = (void *)v127;
                                                      if (!v127
                                                        || (v128 = (void *)v127,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        v498 = 0;
LABEL_145:
                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("usageScoreBooks"));
                                                        v129 = objc_claimAutoreleasedReturnValue();
                                                        v497 = (void *)v129;
                                                        if (v129
                                                          && (v130 = (void *)v129,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                        {
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                          {
                                                            if (!v9)
                                                            {
                                                              v496 = 0;
                                                              v38 = 0;
                                                              v48 = v601;
                                                              v8 = v610;
LABEL_426:
                                                              v295 = v519;
                                                              goto LABEL_427;
                                                            }
                                                            v338 = v9;
                                                            v339 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v587 = v12;
                                                            v340 = *MEMORY[0x1E0D025B8];
                                                            v644 = *MEMORY[0x1E0CB2D50];
                                                            v341 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                            v457 = objc_opt_class();
                                                            v342 = v341;
                                                            v8 = v610;
                                                            v495 = (id)objc_msgSend(v342, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v457, CFSTR("usageScoreBooks"));
                                                            v645 = v495;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v645, &v644, 1);
                                                            v343 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v344 = v340;
                                                            v12 = v587;
                                                            v38 = 0;
                                                            v496 = 0;
                                                            *v338 = (id)objc_msgSend(v339, "initWithDomain:code:userInfo:", v344, 2, v343);
                                                            v48 = v601;
                                                            v32 = v537;
LABEL_425:

                                                            goto LABEL_426;
                                                          }
                                                          v496 = v130;
                                                        }
                                                        else
                                                        {
                                                          v496 = 0;
                                                        }
                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("usageScoreMusic"));
                                                        v131 = objc_claimAutoreleasedReturnValue();
                                                        v494 = (void *)v131;
                                                        if (v131
                                                          && (v132 = (void *)v131,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                        {
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                          {
                                                            if (!v9)
                                                            {
                                                              v495 = 0;
                                                              v38 = 0;
                                                              v48 = v601;
                                                              v8 = v610;
LABEL_424:
                                                              v343 = v494;
                                                              goto LABEL_425;
                                                            }
                                                            v345 = v9;
                                                            v346 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v588 = v12;
                                                            v347 = *MEMORY[0x1E0D025B8];
                                                            v642 = *MEMORY[0x1E0CB2D50];
                                                            v348 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                            v458 = objc_opt_class();
                                                            v349 = v348;
                                                            v8 = v610;
                                                            v493 = (id)objc_msgSend(v349, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v458, CFSTR("usageScoreMusic"));
                                                            v643 = v493;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v643, &v642, 1);
                                                            v350 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v351 = v347;
                                                            v12 = v588;
                                                            v38 = 0;
                                                            v495 = 0;
                                                            *v345 = (id)objc_msgSend(v346, "initWithDomain:code:userInfo:", v351, 2, v350);
                                                            v48 = v601;
                                                            v32 = v537;
LABEL_423:

                                                            goto LABEL_424;
                                                          }
                                                          v495 = v132;
                                                        }
                                                        else
                                                        {
                                                          v495 = 0;
                                                        }
                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("usageScorePodcasts"));
                                                        v133 = objc_claimAutoreleasedReturnValue();
                                                        v492 = (void *)v133;
                                                        if (v133
                                                          && (v134 = (void *)v133,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                        {
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                          {
                                                            if (!v9)
                                                            {
                                                              v493 = 0;
                                                              v38 = 0;
                                                              v48 = v601;
                                                              v8 = v610;
LABEL_422:
                                                              v350 = v492;
                                                              goto LABEL_423;
                                                            }
                                                            v352 = v9;
                                                            v353 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v589 = v12;
                                                            v354 = *MEMORY[0x1E0D025B8];
                                                            v640 = *MEMORY[0x1E0CB2D50];
                                                            v355 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                            v459 = objc_opt_class();
                                                            v356 = v355;
                                                            v8 = v610;
                                                            v357 = v519;
                                                            v490 = (id)objc_msgSend(v356, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v459, CFSTR("usageScorePodcasts"));
                                                            v641 = v490;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v641, &v640, 1);
                                                            v358 = objc_claimAutoreleasedReturnValue();
                                                            v359 = v354;
                                                            v12 = v589;
                                                            v491 = (void *)v358;
                                                            v38 = 0;
                                                            v493 = 0;
                                                            *v352 = (id)objc_msgSend(v353, "initWithDomain:code:userInfo:", v359, 2);
                                                            v48 = v601;
                                                            goto LABEL_365;
                                                          }
                                                          v493 = v134;
                                                        }
                                                        else
                                                        {
                                                          v493 = 0;
                                                        }
                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isAppFirstParty"));
                                                        v135 = objc_claimAutoreleasedReturnValue();
                                                        v491 = (void *)v135;
                                                        if (!v135
                                                          || (v136 = (void *)v135,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          v490 = 0;
LABEL_157:
                                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRequestedApp"));
                                                          v137 = objc_claimAutoreleasedReturnValue();
                                                          v488 = (void *)v137;
                                                          if (v137
                                                            && (v138 = (void *)v137,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) == 0))
                                                          {
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                            {
                                                              if (!v9)
                                                              {
                                                                v489 = 0;
                                                                v38 = 0;
                                                                v48 = v601;
                                                                v8 = v610;
LABEL_419:
                                                                v357 = v519;
                                                                goto LABEL_420;
                                                              }
                                                              v367 = v9;
                                                              v368 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                              v591 = v12;
                                                              v369 = *MEMORY[0x1E0D025B8];
                                                              v636 = *MEMORY[0x1E0CB2D50];
                                                              v370 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                              v461 = objc_opt_class();
                                                              v371 = v370;
                                                              v8 = v610;
                                                              v149 = (void *)objc_msgSend(v371, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v461, CFSTR("isRequestedApp"));
                                                              v637 = v149;
                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v637, &v636, 1);
                                                              v372 = objc_claimAutoreleasedReturnValue();
                                                              v373 = v369;
                                                              v12 = v591;
                                                              v485 = (void *)v372;
                                                              v38 = 0;
                                                              v489 = 0;
                                                              *v367 = (id)objc_msgSend(v368, "initWithDomain:code:userInfo:", v373, 2);
                                                              v48 = v601;
                                                              goto LABEL_376;
                                                            }
                                                            v489 = v138;
                                                          }
                                                          else
                                                          {
                                                            v489 = 0;
                                                          }
                                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isNowPlayingBundlePSE1"));
                                                          v139 = objc_claimAutoreleasedReturnValue();
                                                          v485 = (void *)v139;
                                                          if (!v139
                                                            || (v140 = (void *)v139,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            v486 = 0;
                                                            goto LABEL_163;
                                                          }
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                          {
                                                            v486 = v140;
LABEL_163:
                                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isNowPlayingBundlePSE2"));
                                                            v141 = objc_claimAutoreleasedReturnValue();
                                                            v484 = (void *)v141;
                                                            if (!v141
                                                              || (v142 = (void *)v141,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              v487 = 0;
                                                              goto LABEL_166;
                                                            }
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                            {
                                                              v487 = v142;
LABEL_166:
                                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("vq21Score"));
                                                              v143 = objc_claimAutoreleasedReturnValue();
                                                              v481 = (void *)v143;
                                                              if (!v143
                                                                || (v144 = (void *)v143,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                v482 = 0;
                                                                goto LABEL_169;
                                                              }
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                              {
                                                                v482 = v144;
LABEL_169:
                                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSupportedFlag"));
                                                                v145 = objc_claimAutoreleasedReturnValue();
                                                                v480 = (void *)v145;
                                                                if (!v145
                                                                  || (v146 = (void *)v145,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  v483 = 0;
                                                                  goto LABEL_172;
                                                                }
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                {
                                                                  v483 = v146;
LABEL_172:
                                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isUnicornFlag"));
                                                                  v147 = objc_claimAutoreleasedReturnValue();
                                                                  v479 = (void *)v147;
                                                                  if (!v147
                                                                    || (v148 = (void *)v147,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    v548 = 0;
                                                                    goto LABEL_175;
                                                                  }
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                  {
                                                                    v548 = v148;
LABEL_175:
                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSupportedUnicornMatchFlag"));
                                                                    v477 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    if (!v477
                                                                      || (objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      v478 = 0;
LABEL_178:
                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isDisambiguationSelectedApp"));
                                                                      v149 = v486;
                                                                      v475 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      if (v475
                                                                        && (objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                        {
                                                                          v404 = self;
                                                                          if (!v9)
                                                                          {
                                                                            v476 = 0;
                                                                            v38 = 0;
                                                                            v48 = v601;
                                                                            v8 = v610;
                                                                            goto LABEL_412;
                                                                          }
                                                                          v405 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                          v406 = *MEMORY[0x1E0D025B8];
                                                                          v622 = *MEMORY[0x1E0CB2D50];
                                                                          v474 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isDisambiguationSelectedApp"));
                                                                          v623 = v474;
                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v623, &v622, 1);
                                                                          v473 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          v407 = (id)objc_msgSend(v405, "initWithDomain:code:userInfo:", v406, 2);
                                                                          v38 = 0;
                                                                          v476 = 0;
                                                                          *v9 = v407;
                                                                          self = v404;
                                                                          v48 = v601;
                                                                          v8 = v610;
                                                                          goto LABEL_411;
                                                                        }
                                                                        v476 = v475;
                                                                      }
                                                                      else
                                                                      {
                                                                        v476 = 0;
                                                                      }
                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isModelPredictedApp"));
                                                                      v473 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      if (v473
                                                                        && (objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                        {
                                                                          v409 = v11;
                                                                          if (!v9)
                                                                          {
                                                                            v474 = 0;
                                                                            v38 = 0;
                                                                            v48 = v601;
                                                                            v8 = v610;
                                                                            v149 = v486;
                                                                            goto LABEL_411;
                                                                          }
                                                                          v410 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                          v411 = *MEMORY[0x1E0D025B8];
                                                                          v620 = *MEMORY[0x1E0CB2D50];
                                                                          v472 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isModelPredictedApp"));
                                                                          v621 = v472;
                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v621, &v620, 1);
                                                                          v471 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          v412 = (id)objc_msgSend(v410, "initWithDomain:code:userInfo:", v411, 2);
                                                                          v38 = 0;
                                                                          v474 = 0;
                                                                          *v9 = v412;
                                                                          goto LABEL_470;
                                                                        }
                                                                        v474 = v473;
                                                                      }
                                                                      else
                                                                      {
                                                                        v474 = 0;
                                                                      }
                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("usageScoreRadio"));
                                                                      v471 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      if (!v471
                                                                        || (objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        v472 = 0;
                                                                        goto LABEL_187;
                                                                      }
                                                                      objc_opt_class();
                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                      {
                                                                        v472 = v471;
LABEL_187:
                                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("usageScoreMusicWithoutRadio"));
                                                                        v469 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        if (!v469
                                                                          || (objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                        {
                                                                          v470 = 0;
                                                                          v150 = v487;
                                                                          v151 = v489;
LABEL_190:
                                                                          v487 = v150;
                                                                          v486 = v149;
                                                                          v489 = v151;
                                                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawMediaTypeUsageSignalRadio"));
                                                                          v152 = (id)objc_claimAutoreleasedReturnValue();
                                                                          v468 = v152;
                                                                          if (!v152)
                                                                          {
LABEL_379:
                                                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawMediaTypeUsageSignalMusicWithoutRadio"));
                                                                            v402 = (id)objc_claimAutoreleasedReturnValue();
                                                                            v466 = v402;
                                                                            v467 = v152;
                                                                            if (!v402)
                                                                            {
LABEL_382:
                                                                              v48 = v601;
                                                                              v8 = v610;
                                                                              v403 = v533;
LABEL_383:
                                                                              v465 = v402;
                                                                              v533 = v403;
                                                                              self = objc_retain(-[BMSiriMusicInferenceTrainingDependentSignals initWithIsClientForegroundActiveBundle:compoundActiveBundleScore:compoundMediaTypeBundleScore:entitySearchBundleRecencyS:entitySearchBundleScore:isForegroundBundle:isNowPlayingBundle:nowPlayingBundleCount:nowPlayingBundleRecencyS:nowPlayingBundleScore:isNowPlayingLastBundle:nowPlayingUsage1Day:nowPlayingUsage7Days:nowPlayingUsage14Days:isRawLastNowPlayingCoreDuet:isRawMediaCategoryAudiobookSignal:isRawMediaCategoryMusicSignal:isRawMediaCategoryPodcastSignal:isRawMediaCategoryRadioSignal:isRawMediaCategoryVideoSignal:rawMediaTypeUsageSignalBook:rawMediaTypeUsageSignalMusic:rawMediaTypeUsageSignalPodcast:rawMediaTypeUsageSignalVideo:rawNowPlayingCountCoreDuet10Min:rawNowPlayingCountCoreDuet1Day:rawNowPlayingCountCoreDuet1Hr:rawNowPlayingCountCoreDuet28Day:rawNowPlayingCountCoreDuet2Min:rawNowPlayingCountCoreDuet6Hr:rawNowPlayingCountCoreDuet7Day:rawNowPlayingRecencyCD:rawEntitySearchRecency:usageScoreBooks:usageScoreMusic:usageScorePodcasts:isAppFirstParty:isRequestedApp:isNowPlayingBundlePSE1:isNowPlayingBundlePSE2:vq21Score:isSupportedFlag:isUnicornFlag:isSupportedUnicornMatchFlag:isDisambiguationSelectedApp:isModelPredictedApp:usageScoreRadio:usageScoreMusicWithoutRadio:rawMediaTypeUsageSignalRadio:rawMediaTypeUsageSignalMusicWithoutRadio:](self, "initWithIsClientForegroundActiveBundle:compoundActiveBundleScore:compoundMediaTypeBundleScore:entitySearchBundleRecencyS:entitySearchBundleScore:isForegroundBundle:isNowPlayingBundle:nowPlayingBundleCount:nowPlayingBundleRecencyS:nowPlayingBundleScore:isNowPlayingLastBundle:nowPlayingUsage1Day:nowPlayingUsage7Days:nowPlayingUsage14Days:isRawLastNowPlayingCoreDuet:isRawMediaCategoryAudiobookSignal:isRawMediaCategoryMusicSignal:isRawMediaCategoryPodcastSignal:isRawMediaCategoryRadioSignal:isRawMediaCategoryVideoSignal:rawMe"
                                                                                         "diaTypeUsageSignalBook:rawMedia"
                                                                                         "TypeUsageSignalMusic:rawMediaTy"
                                                                                         "peUsageSignalPodcast:rawMediaTy"
                                                                                         "peUsageSignalVideo:rawNowPlayin"
                                                                                         "gCountCoreDuet10Min:rawNowPlayi"
                                                                                         "ngCountCoreDuet1Day:rawNowPlayi"
                                                                                         "ngCountCoreDuet1Hr:rawNowPlayin"
                                                                                         "gCountCoreDuet28Day:rawNowPlayi"
                                                                                         "ngCountCoreDuet2Min:rawNowPlayi"
                                                                                         "ngCountCoreDuet6Hr:rawNowPlayin"
                                                                                         "gCountCoreDuet7Day:rawNowPlayin"
                                                                                         "gRecencyCD:rawEntitySearchRecen"
                                                                                         "cy:usageScoreBooks:usageScoreMu"
                                                                                         "sic:usageScorePodcasts:isAppFir"
                                                                                         "stParty:isRequestedApp:isNowPla"
                                                                                         "yingBundlePSE1:isNowPlayingBund"
                                                                                         "lePSE2:vq21Score:isSupportedFla"
                                                                                         "g:isUnicornFlag:isSupportedUnic"
                                                                                         "ornMatchFlag:isDisambiguationSe"
                                                                                         "lectedApp:isModelPredictedApp:u"
                                                                                         "sageScoreRadio:usageScoreMusicW"
                                                                                         "ithoutRadio:rawMediaTypeUsageSi"
                                                                                         "gnalRadio:rawMediaTypeUsageSign"
                                                                                         "alMusicWithoutRadio:",
                                                                                         v8,
                                                                                         v607,
                                                                                         v12,
                                                                                         v608,
                                                                                         v602,
                                                                                         v557,
                                                                                         v597,
                                                                                         v552,
                                                                                         v540,
                                                                                         v544,
                                                                                         v545,
                                                                                         v539,
                                                                                         v32,
                                                                                         v535,
                                                                                         v403,
                                                                                         v532,
                                                                                         v530,
                                                                                         v526,
                                                                                         v527,
                                                                                         v524,
                                                                                         v522,
                                                                                         v520,
                                                                                         v517,
                                                                                         v519,
                                                                                         v514,
                                                                                         v510,
                                                                                         v511,
                                                                                         v508,
                                                                                         v506,
                                                                                         v504,
                                                                                         v502,
                                                                                         v500,
                                                                                         v498,
                                                                                         v496,
                                                                                         v495,
                                                                                         v493,
                                                                                         v490,
                                                                                         v489,
                                                                                         v486,
                                                                                         v487,
                                                                                         v482,
                                                                                         v483,
                                                                                         v548,
                                                                                         v478,
                                                                                         v476,
                                                                                         v474,
                                                                                         v472,
                                                                                         v470,
                                                                                         v152,
                                                                                         v402));
                                                                              v38 = self;
LABEL_407:

LABEL_408:
                                                                              v149 = v486;

LABEL_409:
LABEL_410:

LABEL_411:
                                                                              goto LABEL_412;
                                                                            }
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                            {
                                                                              v402 = 0;
                                                                              goto LABEL_382;
                                                                            }
                                                                            v408 = self;
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                            {
                                                                              v402 = v466;
                                                                              v8 = v610;
                                                                              v48 = v601;
                                                                              v403 = v533;
                                                                              goto LABEL_383;
                                                                            }
                                                                            if (v9)
                                                                            {
                                                                              v423 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                              v596 = *MEMORY[0x1E0D025B8];
                                                                              v612 = *MEMORY[0x1E0CB2D50];
                                                                              v424 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("rawMediaTypeUsageSignalMusicWithoutRadio"));
                                                                              v613 = v424;
                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v613, &v612, 1);
                                                                              v425 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              *v9 = (id)objc_msgSend(v423, "initWithDomain:code:userInfo:", v596, 2, v425);

                                                                            }
                                                                            v465 = 0;
                                                                            v38 = 0;
                                                                            self = v408;
                                                                            v8 = v610;
LABEL_406:
                                                                            v48 = v601;
                                                                            v32 = v537;
                                                                            goto LABEL_407;
                                                                          }
                                                                          objc_opt_class();
                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                          {
                                                                            v152 = 0;
                                                                            goto LABEL_379;
                                                                          }
                                                                          objc_opt_class();
                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                          {
                                                                            v152 = v152;
                                                                            goto LABEL_379;
                                                                          }
                                                                          v595 = v12;
                                                                          v555 = v6;
                                                                          v416 = v610;
                                                                          if (v9)
                                                                          {
                                                                            v420 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                            v421 = *MEMORY[0x1E0D025B8];
                                                                            v614 = *MEMORY[0x1E0CB2D50];
                                                                            v465 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("rawMediaTypeUsageSignalRadio"));
                                                                            v615 = v465;
                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v615, &v614, 1);
                                                                            v466 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            v422 = (id)objc_msgSend(v420, "initWithDomain:code:userInfo:", v421, 2);
                                                                            v38 = 0;
                                                                            v467 = 0;
                                                                            *v9 = v422;
                                                                            v8 = v610;
                                                                            v6 = v555;
                                                                            goto LABEL_406;
                                                                          }
                                                                          v467 = 0;
                                                                          v38 = 0;
LABEL_474:
                                                                          v8 = v416;
                                                                          v6 = v555;
                                                                          v12 = v595;
                                                                          v48 = v601;
                                                                          goto LABEL_408;
                                                                        }
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                        {
                                                                          v470 = v469;
                                                                          v151 = v489;
                                                                          v149 = v486;
                                                                          v150 = v487;
                                                                          goto LABEL_190;
                                                                        }
                                                                        v595 = v12;
                                                                        v555 = v6;
                                                                        v416 = v610;
                                                                        if (v9)
                                                                        {
                                                                          v417 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                          v418 = *MEMORY[0x1E0D025B8];
                                                                          v616 = *MEMORY[0x1E0CB2D50];
                                                                          v467 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("usageScoreMusicWithoutRadio"));
                                                                          v617 = v467;
                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v617, &v616, 1);
                                                                          v468 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          v419 = (id)objc_msgSend(v417, "initWithDomain:code:userInfo:", v418, 2);
                                                                          v38 = 0;
                                                                          v470 = 0;
                                                                          *v9 = v419;
                                                                          goto LABEL_474;
                                                                        }
                                                                        v470 = 0;
                                                                        v38 = 0;
                                                                        v8 = v610;
                                                                        v6 = v555;
                                                                        v48 = v601;
LABEL_472:
                                                                        v32 = v537;
                                                                        v149 = v486;
                                                                        goto LABEL_409;
                                                                      }
                                                                      v409 = v11;
                                                                      if (v9)
                                                                      {
                                                                        v413 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                        v414 = *MEMORY[0x1E0D025B8];
                                                                        v618 = *MEMORY[0x1E0CB2D50];
                                                                        v470 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("usageScoreRadio"));
                                                                        v619 = v470;
                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v619, &v618, 1);
                                                                        v469 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        v415 = (id)objc_msgSend(v413, "initWithDomain:code:userInfo:", v414, 2);
                                                                        v38 = 0;
                                                                        v472 = 0;
                                                                        *v9 = v415;
                                                                        v48 = v601;
                                                                        v8 = v610;
                                                                        goto LABEL_472;
                                                                      }
                                                                      v472 = 0;
                                                                      v38 = 0;
LABEL_470:
                                                                      v48 = v601;
                                                                      v8 = v610;
                                                                      v11 = v409;
                                                                      v32 = v537;
                                                                      v149 = v486;
                                                                      goto LABEL_410;
                                                                    }
                                                                    objc_opt_class();
                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                    {
                                                                      v478 = v477;
                                                                      goto LABEL_178;
                                                                    }
                                                                    v395 = self;
                                                                    if (v9)
                                                                    {
                                                                      v400 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                      v401 = *MEMORY[0x1E0D025B8];
                                                                      v624 = *MEMORY[0x1E0CB2D50];
                                                                      v476 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isSupportedUnicornMatchFlag"));
                                                                      v625 = v476;
                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v625, &v624, 1);
                                                                      v475 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      v38 = 0;
                                                                      v478 = 0;
                                                                      *v9 = (id)objc_msgSend(v400, "initWithDomain:code:userInfo:", v401, 2);
                                                                      self = v395;
                                                                      v48 = v601;
                                                                      v8 = v610;
                                                                      v149 = v486;
LABEL_412:

                                                                      goto LABEL_413;
                                                                    }
                                                                    v478 = 0;
                                                                    v38 = 0;
LABEL_402:
                                                                    self = v395;
                                                                    v48 = v601;
                                                                    v8 = v610;
                                                                    v149 = v486;
LABEL_413:

                                                                    goto LABEL_414;
                                                                  }
                                                                  v395 = self;
                                                                  if (v9)
                                                                  {
                                                                    v398 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                    v399 = *MEMORY[0x1E0D025B8];
                                                                    v626 = *MEMORY[0x1E0CB2D50];
                                                                    v478 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isUnicornFlag"));
                                                                    v627 = v478;
                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v627, &v626, 1);
                                                                    v477 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v38 = 0;
                                                                    v548 = 0;
                                                                    *v9 = (id)objc_msgSend(v398, "initWithDomain:code:userInfo:", v399, 2);
                                                                    goto LABEL_402;
                                                                  }
                                                                  v548 = 0;
                                                                  v38 = 0;
LABEL_398:
                                                                  self = v395;
                                                                  v48 = v601;
                                                                  v8 = v610;
                                                                  v149 = v486;
LABEL_414:

                                                                  goto LABEL_415;
                                                                }
                                                                v395 = self;
                                                                if (v9)
                                                                {
                                                                  v396 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                  v397 = *MEMORY[0x1E0D025B8];
                                                                  v628 = *MEMORY[0x1E0CB2D50];
                                                                  v548 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isSupportedFlag"));
                                                                  v629 = v548;
                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v629, &v628, 1);
                                                                  v479 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  v38 = 0;
                                                                  v483 = 0;
                                                                  *v9 = (id)objc_msgSend(v396, "initWithDomain:code:userInfo:", v397, 2);
                                                                  goto LABEL_398;
                                                                }
                                                                v483 = 0;
                                                                v38 = 0;
                                                                v48 = v601;
                                                                v8 = v610;
                                                                v149 = v486;
LABEL_415:

                                                                goto LABEL_416;
                                                              }
                                                              if (v9)
                                                              {
                                                                v388 = v9;
                                                                v389 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                v594 = v12;
                                                                v390 = *MEMORY[0x1E0D025B8];
                                                                v630 = *MEMORY[0x1E0CB2D50];
                                                                v391 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                v464 = objc_opt_class();
                                                                v392 = v391;
                                                                v8 = v610;
                                                                v149 = v486;
                                                                v483 = (id)objc_msgSend(v392, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v464, CFSTR("vq21Score"));
                                                                v631 = v483;
                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v631, &v630, 1);
                                                                v393 = objc_claimAutoreleasedReturnValue();
                                                                v394 = v390;
                                                                v12 = v594;
                                                                v480 = (void *)v393;
                                                                v38 = 0;
                                                                v482 = 0;
                                                                *v388 = (id)objc_msgSend(v389, "initWithDomain:code:userInfo:", v394, 2);
                                                                v48 = v601;
                                                                v32 = v537;
                                                                goto LABEL_415;
                                                              }
                                                              v482 = 0;
                                                              v38 = 0;
                                                              v48 = v601;
                                                              v8 = v610;
                                                              v149 = v486;
LABEL_416:

                                                              goto LABEL_417;
                                                            }
                                                            if (v9)
                                                            {
                                                              v381 = v9;
                                                              v382 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                              v593 = v12;
                                                              v383 = *MEMORY[0x1E0D025B8];
                                                              v632 = *MEMORY[0x1E0CB2D50];
                                                              v384 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                              v463 = objc_opt_class();
                                                              v385 = v384;
                                                              v8 = v610;
                                                              v149 = v486;
                                                              v482 = (id)objc_msgSend(v385, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v463, CFSTR("isNowPlayingBundlePSE2"));
                                                              v633 = v482;
                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v633, &v632, 1);
                                                              v386 = objc_claimAutoreleasedReturnValue();
                                                              v387 = v383;
                                                              v12 = v593;
                                                              v481 = (void *)v386;
                                                              v38 = 0;
                                                              v487 = 0;
                                                              *v381 = (id)objc_msgSend(v382, "initWithDomain:code:userInfo:", v387, 2);
                                                              v48 = v601;
                                                              v32 = v537;
                                                              goto LABEL_416;
                                                            }
                                                            v487 = 0;
                                                            v38 = 0;
                                                            v48 = v601;
                                                            v8 = v610;
                                                            v149 = v486;
LABEL_417:

                                                            goto LABEL_418;
                                                          }
                                                          if (v9)
                                                          {
                                                            v374 = v9;
                                                            v375 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v592 = v12;
                                                            v376 = *MEMORY[0x1E0D025B8];
                                                            v634 = *MEMORY[0x1E0CB2D50];
                                                            v377 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                            v462 = objc_opt_class();
                                                            v378 = v377;
                                                            v8 = v610;
                                                            v487 = (id)objc_msgSend(v378, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v462, CFSTR("isNowPlayingBundlePSE1"));
                                                            v635 = v487;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v635, &v634, 1);
                                                            v379 = objc_claimAutoreleasedReturnValue();
                                                            v380 = v376;
                                                            v12 = v592;
                                                            v484 = (void *)v379;
                                                            v38 = 0;
                                                            v149 = 0;
                                                            *v374 = (id)objc_msgSend(v375, "initWithDomain:code:userInfo:", v380, 2);
                                                            v48 = v601;
                                                            v32 = v537;
                                                            goto LABEL_417;
                                                          }
                                                          v149 = 0;
                                                          v38 = 0;
                                                          v48 = v601;
                                                          v8 = v610;
LABEL_376:
                                                          v32 = v537;
LABEL_418:

                                                          goto LABEL_419;
                                                        }
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                        {
                                                          v490 = v136;
                                                          goto LABEL_157;
                                                        }
                                                        v357 = v519;
                                                        if (v9)
                                                        {
                                                          v360 = v9;
                                                          v361 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                          v590 = v12;
                                                          v362 = *MEMORY[0x1E0D025B8];
                                                          v638 = *MEMORY[0x1E0CB2D50];
                                                          v363 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                          v460 = objc_opt_class();
                                                          v364 = v363;
                                                          v8 = v610;
                                                          v489 = (id)objc_msgSend(v364, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v460, CFSTR("isAppFirstParty"));
                                                          v639 = v489;
                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v639, &v638, 1);
                                                          v365 = objc_claimAutoreleasedReturnValue();
                                                          v366 = v362;
                                                          v12 = v590;
                                                          v488 = (void *)v365;
                                                          v38 = 0;
                                                          v490 = 0;
                                                          *v360 = (id)objc_msgSend(v361, "initWithDomain:code:userInfo:", v366, 2);
                                                          v48 = v601;
                                                          v32 = v537;
LABEL_420:

                                                          goto LABEL_421;
                                                        }
                                                        v490 = 0;
                                                        v38 = 0;
                                                        v48 = v601;
                                                        v8 = v610;
LABEL_365:
                                                        v32 = v537;
LABEL_421:
                                                        v519 = v357;

                                                        goto LABEL_422;
                                                      }
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v498 = v128;
                                                        goto LABEL_145;
                                                      }
                                                      if (v9)
                                                      {
                                                        v331 = v9;
                                                        v332 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                        v586 = v12;
                                                        v333 = *MEMORY[0x1E0D025B8];
                                                        v646 = *MEMORY[0x1E0CB2D50];
                                                        v334 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                        v456 = objc_opt_class();
                                                        v335 = v334;
                                                        v8 = v610;
                                                        v295 = v519;
                                                        v496 = (id)objc_msgSend(v335, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v456, CFSTR("rawEntitySearchRecency"));
                                                        v647 = v496;
                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v647, &v646, 1);
                                                        v336 = objc_claimAutoreleasedReturnValue();
                                                        v337 = v333;
                                                        v12 = v586;
                                                        v497 = (void *)v336;
                                                        v38 = 0;
                                                        v498 = 0;
                                                        *v331 = (id)objc_msgSend(v332, "initWithDomain:code:userInfo:", v337, 2);
                                                        v48 = v601;
                                                        v32 = v537;
LABEL_427:

                                                        goto LABEL_428;
                                                      }
                                                      v498 = 0;
                                                      v38 = 0;
                                                      v48 = v601;
                                                      v8 = v610;
                                                      v295 = v519;
LABEL_428:

                                                      goto LABEL_429;
                                                    }
                                                    if (v9)
                                                    {
                                                      v324 = v9;
                                                      v325 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                      v585 = v12;
                                                      v326 = *MEMORY[0x1E0D025B8];
                                                      v648 = *MEMORY[0x1E0CB2D50];
                                                      v327 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                      v455 = objc_opt_class();
                                                      v328 = v327;
                                                      v8 = v610;
                                                      v295 = v519;
                                                      v498 = (id)objc_msgSend(v328, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v455, CFSTR("rawNowPlayingRecencyCD"));
                                                      v649 = v498;
                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v649, &v648, 1);
                                                      v329 = objc_claimAutoreleasedReturnValue();
                                                      v330 = v326;
                                                      v12 = v585;
                                                      v499 = (void *)v329;
                                                      v38 = 0;
                                                      v500 = 0;
                                                      *v324 = (id)objc_msgSend(v325, "initWithDomain:code:userInfo:", v330, 2);
                                                      v48 = v601;
                                                      v32 = v537;
                                                      goto LABEL_428;
                                                    }
                                                    v500 = 0;
                                                    v38 = 0;
                                                    v48 = v601;
                                                    v8 = v610;
                                                    v295 = v519;
LABEL_429:

                                                    goto LABEL_430;
                                                  }
                                                  if (v9)
                                                  {
                                                    v317 = v9;
                                                    v318 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                    v584 = v12;
                                                    v319 = *MEMORY[0x1E0D025B8];
                                                    v650 = *MEMORY[0x1E0CB2D50];
                                                    v320 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                    v454 = objc_opt_class();
                                                    v321 = v320;
                                                    v8 = v610;
                                                    v295 = v519;
                                                    v500 = (id)objc_msgSend(v321, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v454, CFSTR("rawNowPlayingCountCoreDuet7Day"));
                                                    v651 = v500;
                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v651, &v650, 1);
                                                    v322 = objc_claimAutoreleasedReturnValue();
                                                    v323 = v319;
                                                    v12 = v584;
                                                    v501 = (void *)v322;
                                                    v38 = 0;
                                                    v502 = 0;
                                                    *v317 = (id)objc_msgSend(v318, "initWithDomain:code:userInfo:", v323, 2);
                                                    v48 = v601;
                                                    v32 = v537;
                                                    goto LABEL_429;
                                                  }
                                                  v502 = 0;
                                                  v38 = 0;
                                                  v48 = v601;
                                                  v8 = v610;
                                                  v295 = v519;
LABEL_430:

                                                  goto LABEL_431;
                                                }
                                                if (v9)
                                                {
                                                  v310 = v9;
                                                  v311 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v583 = v12;
                                                  v312 = *MEMORY[0x1E0D025B8];
                                                  v652 = *MEMORY[0x1E0CB2D50];
                                                  v313 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                  v453 = objc_opt_class();
                                                  v314 = v313;
                                                  v8 = v610;
                                                  v295 = v519;
                                                  v502 = (id)objc_msgSend(v314, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v453, CFSTR("rawNowPlayingCountCoreDuet6Hr"));
                                                  v653 = v502;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v653, &v652, 1);
                                                  v315 = objc_claimAutoreleasedReturnValue();
                                                  v316 = v312;
                                                  v12 = v583;
                                                  v503 = (void *)v315;
                                                  v38 = 0;
                                                  v504 = 0;
                                                  *v310 = (id)objc_msgSend(v311, "initWithDomain:code:userInfo:", v316, 2);
                                                  v48 = v601;
                                                  v32 = v537;
                                                  goto LABEL_430;
                                                }
                                                v504 = 0;
                                                v38 = 0;
                                                v48 = v601;
                                                v8 = v610;
                                                v295 = v519;
LABEL_431:

                                                goto LABEL_432;
                                              }
                                              if (v9)
                                              {
                                                v303 = v9;
                                                v304 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v582 = v12;
                                                v305 = *MEMORY[0x1E0D025B8];
                                                v654 = *MEMORY[0x1E0CB2D50];
                                                v306 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                v452 = objc_opt_class();
                                                v307 = v306;
                                                v8 = v610;
                                                v295 = v519;
                                                v504 = (id)objc_msgSend(v307, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v452, CFSTR("rawNowPlayingCountCoreDuet2Min"));
                                                v655 = v504;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v655, &v654, 1);
                                                v308 = objc_claimAutoreleasedReturnValue();
                                                v309 = v305;
                                                v12 = v582;
                                                v505 = (void *)v308;
                                                v38 = 0;
                                                v506 = 0;
                                                *v303 = (id)objc_msgSend(v304, "initWithDomain:code:userInfo:", v309, 2);
                                                v48 = v601;
                                                v32 = v537;
                                                goto LABEL_431;
                                              }
                                              v506 = 0;
                                              v38 = 0;
                                              v48 = v601;
                                              v8 = v610;
                                              v295 = v519;
LABEL_432:
                                              v519 = v295;

                                              goto LABEL_433;
                                            }
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v510 = v114;
                                              goto LABEL_124;
                                            }
                                            if (v9)
                                            {
                                              v280 = v9;
                                              v281 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v579 = v12;
                                              v282 = *MEMORY[0x1E0D025B8];
                                              v660 = *MEMORY[0x1E0CB2D50];
                                              v283 = objc_alloc(MEMORY[0x1E0CB3940]);
                                              v449 = objc_opt_class();
                                              v284 = v283;
                                              v8 = v610;
                                              v511 = (id)objc_msgSend(v284, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v449, CFSTR("rawNowPlayingCountCoreDuet1Day"));
                                              v661 = v511;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v661, &v660, 1);
                                              v285 = objc_claimAutoreleasedReturnValue();
                                              v286 = v282;
                                              v12 = v579;
                                              v512 = (void *)v285;
                                              v38 = 0;
                                              v277 = 0;
                                              *v280 = (id)objc_msgSend(v281, "initWithDomain:code:userInfo:", v286, 2);
                                              v48 = v601;
                                              v32 = v537;
LABEL_436:

                                              goto LABEL_437;
                                            }
                                            v277 = 0;
                                            v38 = 0;
                                            v48 = v601;
                                            v8 = v610;
LABEL_309:
                                            v32 = v537;
LABEL_437:

                                            goto LABEL_438;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v519 = v110;
                                            goto LABEL_118;
                                          }
                                          if (v9)
                                          {
                                            v265 = v9;
                                            v266 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v577 = v12;
                                            v267 = *MEMORY[0x1E0D025B8];
                                            v664 = *MEMORY[0x1E0CB2D50];
                                            v268 = objc_alloc(MEMORY[0x1E0CB3940]);
                                            v447 = objc_opt_class();
                                            v269 = v268;
                                            v8 = v610;
                                            v514 = (id)objc_msgSend(v269, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v447, CFSTR("rawMediaTypeUsageSignalVideo"));
                                            v665 = v514;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v665, &v664, 1);
                                            v270 = objc_claimAutoreleasedReturnValue();
                                            v271 = v267;
                                            v12 = v577;
                                            v515 = (void *)v270;
                                            v38 = 0;
                                            v262 = 0;
                                            *v265 = (id)objc_msgSend(v266, "initWithDomain:code:userInfo:", v271, 2);
                                            v48 = v601;
                                            v32 = v537;
LABEL_439:

                                            goto LABEL_440;
                                          }
                                          v262 = 0;
                                          v38 = 0;
                                          v48 = v601;
                                          v8 = v610;
LABEL_298:
                                          v32 = v537;
LABEL_440:

                                          goto LABEL_441;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v520 = v106;
                                          goto LABEL_112;
                                        }
                                        if (v9)
                                        {
                                          v250 = v9;
                                          v251 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v575 = v12;
                                          v252 = *MEMORY[0x1E0D025B8];
                                          v668 = *MEMORY[0x1E0CB2D50];
                                          v253 = objc_alloc(MEMORY[0x1E0CB3940]);
                                          v445 = objc_opt_class();
                                          v254 = v253;
                                          v8 = v610;
                                          v219 = v526;
                                          v517 = (id)objc_msgSend(v254, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v445, CFSTR("rawMediaTypeUsageSignalMusic"));
                                          v669 = v517;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v669, &v668, 1);
                                          v255 = objc_claimAutoreleasedReturnValue();
                                          v256 = v252;
                                          v12 = v575;
                                          v518 = (void *)v255;
                                          v38 = 0;
                                          v520 = 0;
                                          *v250 = (id)objc_msgSend(v251, "initWithDomain:code:userInfo:", v256, 2);
                                          v48 = v601;
                                          v32 = v537;
LABEL_442:

                                          goto LABEL_443;
                                        }
                                        v520 = 0;
                                        v38 = 0;
                                        v48 = v601;
                                        v8 = v610;
                                        v219 = v526;
LABEL_443:

                                        goto LABEL_444;
                                      }
                                      if (v9)
                                      {
                                        v243 = v9;
                                        v244 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v574 = v12;
                                        v245 = *MEMORY[0x1E0D025B8];
                                        v670 = *MEMORY[0x1E0CB2D50];
                                        v246 = objc_alloc(MEMORY[0x1E0CB3940]);
                                        v444 = objc_opt_class();
                                        v247 = v246;
                                        v8 = v610;
                                        v219 = v526;
                                        v520 = (id)objc_msgSend(v247, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v444, CFSTR("rawMediaTypeUsageSignalBook"));
                                        v671 = v520;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v671, &v670, 1);
                                        v248 = objc_claimAutoreleasedReturnValue();
                                        v249 = v245;
                                        v12 = v574;
                                        v521 = (void *)v248;
                                        v38 = 0;
                                        v522 = 0;
                                        *v243 = (id)objc_msgSend(v244, "initWithDomain:code:userInfo:", v249, 2);
                                        v48 = v601;
                                        v32 = v537;
                                        goto LABEL_443;
                                      }
                                      v522 = 0;
                                      v38 = 0;
                                      v48 = v601;
                                      v8 = v610;
                                      v219 = v526;
LABEL_444:

                                      goto LABEL_445;
                                    }
                                    if (v9)
                                    {
                                      v236 = v9;
                                      v237 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v573 = v12;
                                      v238 = *MEMORY[0x1E0D025B8];
                                      v672 = *MEMORY[0x1E0CB2D50];
                                      v239 = objc_alloc(MEMORY[0x1E0CB3940]);
                                      v443 = objc_opt_class();
                                      v240 = v239;
                                      v8 = v610;
                                      v219 = v526;
                                      v522 = (id)objc_msgSend(v240, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v443, CFSTR("isRawMediaCategoryVideoSignal"));
                                      v673 = v522;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v673, &v672, 1);
                                      v241 = objc_claimAutoreleasedReturnValue();
                                      v242 = v238;
                                      v12 = v573;
                                      v523 = (void *)v241;
                                      v38 = 0;
                                      v524 = 0;
                                      *v236 = (id)objc_msgSend(v237, "initWithDomain:code:userInfo:", v242, 2);
                                      v48 = v601;
                                      v32 = v537;
                                      goto LABEL_444;
                                    }
                                    v524 = 0;
                                    v38 = 0;
                                    v48 = v601;
                                    v8 = v610;
                                    v219 = v526;
LABEL_445:

                                    goto LABEL_446;
                                  }
                                  if (v9)
                                  {
                                    v229 = v9;
                                    v230 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v572 = v12;
                                    v231 = *MEMORY[0x1E0D025B8];
                                    v674 = *MEMORY[0x1E0CB2D50];
                                    v232 = objc_alloc(MEMORY[0x1E0CB3940]);
                                    v442 = objc_opt_class();
                                    v233 = v232;
                                    v8 = v610;
                                    v219 = v526;
                                    v524 = (id)objc_msgSend(v233, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v442, CFSTR("isRawMediaCategoryRadioSignal"));
                                    v675 = v524;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v675, &v674, 1);
                                    v234 = objc_claimAutoreleasedReturnValue();
                                    v235 = v231;
                                    v12 = v572;
                                    v525 = (void *)v234;
                                    v38 = 0;
                                    v527 = 0;
                                    *v229 = (id)objc_msgSend(v230, "initWithDomain:code:userInfo:", v235, 2);
                                    v48 = v601;
                                    v32 = v537;
                                    goto LABEL_445;
                                  }
                                  v527 = 0;
                                  v38 = 0;
                                  v48 = v601;
                                  v8 = v610;
                                  v219 = v526;
LABEL_446:

                                  goto LABEL_447;
                                }
                                if (v9)
                                {
                                  v222 = v9;
                                  v223 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v571 = v12;
                                  v224 = *MEMORY[0x1E0D025B8];
                                  v676 = *MEMORY[0x1E0CB2D50];
                                  v225 = objc_alloc(MEMORY[0x1E0CB3940]);
                                  v441 = objc_opt_class();
                                  v226 = v225;
                                  v8 = v610;
                                  v527 = (id)objc_msgSend(v226, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v441, CFSTR("isRawMediaCategoryPodcastSignal"));
                                  v677 = v527;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v677, &v676, 1);
                                  v227 = objc_claimAutoreleasedReturnValue();
                                  v228 = v224;
                                  v12 = v571;
                                  v528 = (void *)v227;
                                  v38 = 0;
                                  v219 = 0;
                                  *v222 = (id)objc_msgSend(v223, "initWithDomain:code:userInfo:", v228, 2);
                                  v48 = v601;
                                  v32 = v537;
                                  goto LABEL_446;
                                }
                                v219 = 0;
                                v38 = 0;
                                v48 = v601;
                                v8 = v610;
LABEL_267:
                                v32 = v537;
LABEL_447:

                                goto LABEL_448;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v532 = v94;
                                goto LABEL_94;
                              }
                              if (v9)
                              {
                                v207 = v9;
                                v208 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v569 = v12;
                                v209 = *MEMORY[0x1E0D025B8];
                                v680 = *MEMORY[0x1E0CB2D50];
                                v210 = objc_alloc(MEMORY[0x1E0CB3940]);
                                v439 = objc_opt_class();
                                v211 = v210;
                                v8 = v610;
                                v197 = v533;
                                v530 = (id)objc_msgSend(v211, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v439, CFSTR("isRawMediaCategoryAudiobookSignal"));
                                v681 = v530;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v681, &v680, 1);
                                v212 = objc_claimAutoreleasedReturnValue();
                                v213 = v209;
                                v12 = v569;
                                v531 = (void *)v212;
                                v38 = 0;
                                v532 = 0;
                                *v207 = (id)objc_msgSend(v208, "initWithDomain:code:userInfo:", v213, 2);
                                v48 = v601;
                                v32 = v537;
LABEL_449:

                                goto LABEL_450;
                              }
                              v532 = 0;
                              v38 = 0;
                              v48 = v601;
                              v8 = v610;
                              v197 = v533;
LABEL_450:

                              goto LABEL_451;
                            }
                            if (v9)
                            {
                              v200 = v9;
                              v201 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v568 = v12;
                              v202 = *MEMORY[0x1E0D025B8];
                              v682 = *MEMORY[0x1E0CB2D50];
                              v203 = objc_alloc(MEMORY[0x1E0CB3940]);
                              v438 = objc_opt_class();
                              v204 = v203;
                              v8 = v610;
                              v532 = (id)objc_msgSend(v204, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v438, CFSTR("isRawLastNowPlayingCoreDuet"));
                              v683 = v532;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v683, &v682, 1);
                              v205 = objc_claimAutoreleasedReturnValue();
                              v206 = v202;
                              v12 = v568;
                              v534 = (void *)v205;
                              v38 = 0;
                              v197 = 0;
                              *v200 = (id)objc_msgSend(v201, "initWithDomain:code:userInfo:", v206, 2);
                              v48 = v601;
                              v32 = v537;
                              goto LABEL_450;
                            }
                            v197 = 0;
                            v38 = 0;
                            v48 = v601;
                            v8 = v610;
LABEL_251:
                            v32 = v537;
LABEL_451:

                            v189 = v535;
                            goto LABEL_452;
                          }
                          if (v9)
                          {
                            v192 = v9;
                            v193 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v567 = v12;
                            v194 = *MEMORY[0x1E0D025B8];
                            v684 = *MEMORY[0x1E0CB2D50];
                            v195 = objc_alloc(MEMORY[0x1E0CB3940]);
                            v437 = objc_opt_class();
                            v196 = v195;
                            v8 = v610;
                            v197 = (void *)objc_msgSend(v196, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v437, CFSTR("nowPlayingUsage14Days"));
                            v685 = v197;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v685, &v684, 1);
                            v198 = objc_claimAutoreleasedReturnValue();
                            v199 = v194;
                            v12 = v567;
                            v536 = (void *)v198;
                            v38 = 0;
                            v535 = 0;
                            *v192 = (id)objc_msgSend(v193, "initWithDomain:code:userInfo:", v199, 2);
                            v48 = v601;
                            goto LABEL_251;
                          }
                          v189 = 0;
                          v38 = 0;
                          v48 = v601;
                          v8 = v610;
LABEL_452:

                          goto LABEL_453;
                        }
                        v32 = v9;
                        if (v9)
                        {
                          v185 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v566 = v12;
                          v186 = *MEMORY[0x1E0D025B8];
                          v686 = *MEMORY[0x1E0CB2D50];
                          v187 = objc_alloc(MEMORY[0x1E0CB3940]);
                          v436 = objc_opt_class();
                          v188 = v187;
                          v8 = v610;
                          v189 = (void *)objc_msgSend(v188, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v436, CFSTR("nowPlayingUsage7Days"));
                          v687 = v189;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v687, &v686, 1);
                          v190 = objc_claimAutoreleasedReturnValue();
                          v191 = v186;
                          v12 = v566;
                          v538 = (void *)v190;
                          v38 = 0;
                          *v32 = (id)objc_msgSend(v185, "initWithDomain:code:userInfo:", v191, 2);
                          v32 = 0;
                          v48 = v601;
                          goto LABEL_452;
                        }
                        v38 = 0;
                        v48 = v601;
                        v8 = v610;
LABEL_453:

                        v24 = v540;
                        v177 = v539;
                        goto LABEL_454;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v31 = v30;
                        goto LABEL_37;
                      }
                      v177 = v9;
                      if (v9)
                      {
                        v542 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v565 = v12;
                        v178 = *MEMORY[0x1E0D025B8];
                        v688 = *MEMORY[0x1E0CB2D50];
                        v179 = objc_alloc(MEMORY[0x1E0CB3940]);
                        v435 = objc_opt_class();
                        v180 = v179;
                        v8 = v610;
                        v181 = objc_msgSend(v180, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v435, CFSTR("nowPlayingUsage1Day"));
                        v689 = v181;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v689, &v688, 1);
                        v182 = objc_claimAutoreleasedReturnValue();
                        v183 = v542;
                        v184 = v178;
                        v12 = v565;
                        v541 = (void *)v182;
                        v38 = 0;
                        v539 = 0;
                        *v177 = (id)objc_msgSend(v183, "initWithDomain:code:userInfo:", v184, 2);
                        v32 = (_QWORD *)v181;
                        v48 = v601;
                        goto LABEL_453;
                      }
                      v38 = 0;
                      v48 = v601;
                      v8 = v610;
LABEL_454:

                      goto LABEL_455;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v544 = v26;
                      goto LABEL_31;
                    }
                    if (v9)
                    {
                      v161 = v9;
                      v162 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v563 = v12;
                      v163 = *MEMORY[0x1E0D025B8];
                      v692 = *MEMORY[0x1E0CB2D50];
                      v164 = objc_alloc(MEMORY[0x1E0CB3940]);
                      v433 = objc_opt_class();
                      v165 = v164;
                      v8 = v610;
                      v545 = (id)objc_msgSend(v165, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v433, CFSTR("nowPlayingBundleScore"));
                      v693 = v545;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v693, &v692, 1);
                      v166 = objc_claimAutoreleasedReturnValue();
                      v167 = v163;
                      v12 = v563;
                      v547 = (void *)v166;
                      v168 = (id)objc_msgSend(v162, "initWithDomain:code:userInfo:", v167, 2);
                      v38 = 0;
                      v157 = 0;
                      *v161 = v168;
                      v48 = v601;
LABEL_456:

                      goto LABEL_457;
                    }
                    v157 = 0;
                    v38 = 0;
                    v48 = v601;
                    v8 = v610;
LABEL_457:

                    v63 = v557;
                    goto LABEL_458;
                  }
                  if (v9)
                  {
                    v153 = v9;
                    v550 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v562 = v12;
                    v154 = *MEMORY[0x1E0D025B8];
                    v694 = *MEMORY[0x1E0CB2D50];
                    v155 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v432 = objc_opt_class();
                    v156 = v155;
                    v8 = v610;
                    v157 = (void *)objc_msgSend(v156, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v432, CFSTR("nowPlayingBundleRecencyS"));
                    v695 = v157;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v695, &v694, 1);
                    v158 = objc_claimAutoreleasedReturnValue();
                    v159 = v550;
                    v160 = v154;
                    v12 = v562;
                    v549 = (void *)v158;
                    v38 = 0;
                    v24 = 0;
                    *v153 = (id)objc_msgSend(v159, "initWithDomain:code:userInfo:", v160, 2);
                    v48 = v601;
                    goto LABEL_457;
                  }
                  v24 = 0;
                  v38 = 0;
                  v48 = v601;
                  v63 = v557;
                  v8 = v610;
LABEL_458:

                  goto LABEL_459;
                }
                if (v9)
                {
                  v82 = v9;
                  v553 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v561 = v12;
                  v83 = *MEMORY[0x1E0D025B8];
                  v696 = *MEMORY[0x1E0CB2D50];
                  v84 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v431 = objc_opt_class();
                  v85 = v84;
                  v8 = v610;
                  v63 = v557;
                  v24 = (id)objc_msgSend(v85, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v431, CFSTR("nowPlayingBundleCount"));
                  v697 = v24;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v697, &v696, 1);
                  v86 = objc_claimAutoreleasedReturnValue();
                  v87 = v83;
                  v12 = v561;
                  v551 = (void *)v86;
                  v88 = (id)objc_msgSend(v553, "initWithDomain:code:userInfo:", v87, 2);
                  v38 = 0;
                  v552 = 0;
                  *v82 = v88;
                  v48 = v601;
                  goto LABEL_458;
                }
                v552 = 0;
                v38 = 0;
                v48 = v601;
                v63 = v557;
                v8 = v610;
LABEL_459:

                goto LABEL_460;
              }
              if (v9)
              {
                v75 = v9;
                v598 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v560 = v12;
                v76 = *MEMORY[0x1E0D025B8];
                v698 = *MEMORY[0x1E0CB2D50];
                v77 = objc_alloc(MEMORY[0x1E0CB3940]);
                v430 = objc_opt_class();
                v78 = v77;
                v8 = v610;
                v63 = v557;
                v552 = (id)objc_msgSend(v78, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v430, CFSTR("isNowPlayingBundle"));
                v699 = v552;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v699, &v698, 1);
                v79 = objc_claimAutoreleasedReturnValue();
                v80 = v76;
                v12 = v560;
                v556 = (void *)v79;
                v81 = (id)objc_msgSend(v598, "initWithDomain:code:userInfo:", v80, 2);
                v38 = 0;
                v597 = 0;
                *v75 = v81;
                v48 = v601;
                goto LABEL_459;
              }
              v597 = 0;
              v38 = 0;
              v48 = v601;
              v63 = v557;
              v8 = v610;
LABEL_460:

              goto LABEL_461;
            }
            if (v9)
            {
              v67 = v9;
              v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v559 = v12;
              v69 = *MEMORY[0x1E0D025B8];
              v700 = *MEMORY[0x1E0CB2D50];
              v70 = objc_alloc(MEMORY[0x1E0CB3940]);
              v429 = objc_opt_class();
              v71 = v70;
              v8 = v610;
              v597 = (id)objc_msgSend(v71, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v429, CFSTR("isForegroundBundle"));
              v701 = v597;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v701, &v700, 1);
              v72 = objc_claimAutoreleasedReturnValue();
              v73 = v69;
              v12 = v559;
              v599 = (void *)v72;
              v74 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v73, 2);
              v38 = 0;
              v63 = 0;
              *v67 = v74;
              v48 = v601;
              goto LABEL_460;
            }
            v63 = 0;
            v38 = 0;
            v48 = v601;
            v8 = v610;
LABEL_461:

            v10 = v607;
            goto LABEL_462;
          }
          if (v9)
          {
            v57 = v9;
            v603 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v558 = v12;
            v58 = *MEMORY[0x1E0D025B8];
            v702 = *MEMORY[0x1E0CB2D50];
            v59 = objc_alloc(MEMORY[0x1E0CB3940]);
            v428 = objc_opt_class();
            v60 = v59;
            v8 = v610;
            v61 = v11;
            v62 = v57;
            v63 = (void *)objc_msgSend(v60, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v428, CFSTR("entitySearchBundleScore"));
            v703 = v63;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v703, &v702, 1);
            v64 = objc_claimAutoreleasedReturnValue();
            v65 = v58;
            v12 = v558;
            v600 = (void *)v64;
            v66 = (id)objc_msgSend(v603, "initWithDomain:code:userInfo:", v65, 2);
            v38 = 0;
            v602 = 0;
            *v62 = v66;
            v11 = v61;
            v48 = v601;
            goto LABEL_461;
          }
          v602 = 0;
          v38 = 0;
          v48 = v601;
          v10 = v607;
          v8 = v610;
LABEL_462:

          goto LABEL_463;
        }
        v48 = v13;
        if (v9)
        {
          v609 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v606 = *MEMORY[0x1E0D025B8];
          v704 = *MEMORY[0x1E0CB2D50];
          v50 = v11;
          v51 = v9;
          v52 = objc_alloc(MEMORY[0x1E0CB3940]);
          v427 = objc_opt_class();
          v53 = v52;
          v8 = v610;
          v10 = v607;
          v602 = (id)objc_msgSend(v53, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v427, CFSTR("entitySearchBundleRecencyS"));
          v705 = v602;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v705, &v704, 1);
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = v606;
          v604 = (void *)v54;
          v56 = (id)objc_msgSend(v609, "initWithDomain:code:userInfo:", v55, 2);
          v38 = 0;
          v608 = 0;
          *v51 = v56;
          v11 = v50;
          goto LABEL_462;
        }
        v608 = 0;
        v38 = 0;
        v10 = v607;
        v8 = v610;
LABEL_463:

        goto LABEL_464;
      }
      if (v9)
      {
        v605 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v47 = *MEMORY[0x1E0D025B8];
        v706 = *MEMORY[0x1E0CB2D50];
        v608 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("compoundMediaTypeBundleScore"));
        v707 = v608;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v707, &v706, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (id)objc_msgSend(v605, "initWithDomain:code:userInfo:", v47, 2, v48);
        v38 = 0;
        v12 = 0;
        *v9 = v49;
        v8 = v610;
        goto LABEL_463;
      }
      v12 = 0;
      v38 = 0;
      v8 = v610;
LABEL_464:

      goto LABEL_465;
    }
    if (a4)
    {
      v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v40 = *MEMORY[0x1E0D025B8];
      v708 = *MEMORY[0x1E0CB2D50];
      v554 = v6;
      v41 = v7;
      v42 = self;
      v43 = v8;
      v44 = a4;
      v45 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("compoundActiveBundleScore"));
      v709 = v45;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v709, &v708, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v40;
      v12 = (id)v45;
      v38 = 0;
      v10 = 0;
      *v44 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v46, 2, v11);
      v8 = v43;
      self = v42;
      v7 = v41;
      v6 = v554;
      goto LABEL_464;
    }
    v10 = 0;
    v38 = 0;
LABEL_465:

    goto LABEL_466;
  }
  if (a4)
  {
    v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v34 = *MEMORY[0x1E0D025B8];
    v710 = *MEMORY[0x1E0CB2D50];
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isClientForegroundActiveBundle"));
    v711[0] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v711, &v710, 1);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v33;
    v10 = (id)v35;
    v611 = (void *)v36;
    v38 = 0;
    v8 = 0;
    *a4 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v34, 2);
    goto LABEL_465;
  }
  v38 = 0;
  v8 = 0;
LABEL_466:

  return v38;
}

- (id)jsonDictionary
{
  id v3;
  double v4;
  void *v5;
  id v6;
  double v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  id v12;
  double v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  double v18;
  void *v19;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
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
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
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
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  _QWORD v182[50];
  _QWORD v183[52];

  v183[50] = *MEMORY[0x1E0C80C00];
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsClientForegroundActiveBundle](self, "hasIsClientForegroundActiveBundle"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isClientForegroundActiveBundle](self, "isClientForegroundActiveBundle"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  if (!-[BMSiriMusicInferenceTrainingDependentSignals hasCompoundActiveBundleScore](self, "hasCompoundActiveBundleScore")|| (-[BMSiriMusicInferenceTrainingDependentSignals compoundActiveBundleScore](self, "compoundActiveBundleScore"), fabs(v4) == INFINITY))
  {
    v6 = 0;
  }
  else
  {
    -[BMSiriMusicInferenceTrainingDependentSignals compoundActiveBundleScore](self, "compoundActiveBundleScore");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriMusicInferenceTrainingDependentSignals compoundActiveBundleScore](self, "compoundActiveBundleScore");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriMusicInferenceTrainingDependentSignals hasCompoundMediaTypeBundleScore](self, "hasCompoundMediaTypeBundleScore")|| (-[BMSiriMusicInferenceTrainingDependentSignals compoundMediaTypeBundleScore](self, "compoundMediaTypeBundleScore"), fabs(v7) == INFINITY))
  {
    v9 = 0;
  }
  else
  {
    -[BMSiriMusicInferenceTrainingDependentSignals compoundMediaTypeBundleScore](self, "compoundMediaTypeBundleScore");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriMusicInferenceTrainingDependentSignals compoundMediaTypeBundleScore](self, "compoundMediaTypeBundleScore");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriMusicInferenceTrainingDependentSignals hasEntitySearchBundleRecencyS](self, "hasEntitySearchBundleRecencyS")|| (-[BMSiriMusicInferenceTrainingDependentSignals entitySearchBundleRecencyS](self, "entitySearchBundleRecencyS"), fabs(v10) == INFINITY))
  {
    v12 = 0;
  }
  else
  {
    -[BMSiriMusicInferenceTrainingDependentSignals entitySearchBundleRecencyS](self, "entitySearchBundleRecencyS");
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriMusicInferenceTrainingDependentSignals entitySearchBundleRecencyS](self, "entitySearchBundleRecencyS");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriMusicInferenceTrainingDependentSignals hasEntitySearchBundleScore](self, "hasEntitySearchBundleScore")
    || (-[BMSiriMusicInferenceTrainingDependentSignals entitySearchBundleScore](self, "entitySearchBundleScore"),
        fabs(v13) == INFINITY))
  {
    v15 = 0;
  }
  else
  {
    -[BMSiriMusicInferenceTrainingDependentSignals entitySearchBundleScore](self, "entitySearchBundleScore");
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriMusicInferenceTrainingDependentSignals entitySearchBundleScore](self, "entitySearchBundleScore");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsForegroundBundle](self, "hasIsForegroundBundle"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isForegroundBundle](self, "isForegroundBundle"));
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsNowPlayingBundle](self, "hasIsNowPlayingBundle"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingBundle](self, "isNowPlayingBundle"));
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingBundleCount](self, "hasNowPlayingBundleCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingBundleCount](self, "nowPlayingBundleCount"));
    v141 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v141 = 0;
  }
  if (!-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingBundleRecencyS](self, "hasNowPlayingBundleRecencyS")
    || (-[BMSiriMusicInferenceTrainingDependentSignals nowPlayingBundleRecencyS](self, "nowPlayingBundleRecencyS"),
        fabs(v18) == INFINITY))
  {
    v140 = 0;
  }
  else
  {
    -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingBundleRecencyS](self, "nowPlayingBundleRecencyS");
    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingBundleRecencyS](self, "nowPlayingBundleRecencyS");
    objc_msgSend(v19, "numberWithDouble:");
    v140 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingBundleScore](self, "hasNowPlayingBundleScore")
    || (-[BMSiriMusicInferenceTrainingDependentSignals nowPlayingBundleScore](self, "nowPlayingBundleScore"),
        fabs(v20) == INFINITY))
  {
    v181 = 0;
  }
  else
  {
    -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingBundleScore](self, "nowPlayingBundleScore");
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingBundleScore](self, "nowPlayingBundleScore");
    objc_msgSend(v21, "numberWithDouble:");
    v181 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsNowPlayingLastBundle](self, "hasIsNowPlayingLastBundle"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingLastBundle](self, "isNowPlayingLastBundle"));
    v180 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v180 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingUsage1Day](self, "hasNowPlayingUsage1Day"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingUsage1Day](self, "nowPlayingUsage1Day"));
    v179 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v179 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingUsage7Days](self, "hasNowPlayingUsage7Days"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingUsage7Days](self, "nowPlayingUsage7Days"));
    v178 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v178 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingUsage14Days](self, "hasNowPlayingUsage14Days"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingUsage14Days](self, "nowPlayingUsage14Days"));
    v177 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v177 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawLastNowPlayingCoreDuet](self, "hasIsRawLastNowPlayingCoreDuet"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawLastNowPlayingCoreDuet](self, "isRawLastNowPlayingCoreDuet"));
    v176 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v176 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryAudiobookSignal](self, "hasIsRawMediaCategoryAudiobookSignal"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryAudiobookSignal](self, "isRawMediaCategoryAudiobookSignal"));
    v175 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v175 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryMusicSignal](self, "hasIsRawMediaCategoryMusicSignal"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryMusicSignal](self, "isRawMediaCategoryMusicSignal"));
    v174 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v174 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryPodcastSignal](self, "hasIsRawMediaCategoryPodcastSignal"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryPodcastSignal](self, "isRawMediaCategoryPodcastSignal"));
    v173 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v173 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryRadioSignal](self, "hasIsRawMediaCategoryRadioSignal"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryRadioSignal](self, "isRawMediaCategoryRadioSignal"));
    v172 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v172 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryVideoSignal](self, "hasIsRawMediaCategoryVideoSignal"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryVideoSignal](self, "isRawMediaCategoryVideoSignal"));
    v171 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v171 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalBook](self, "hasRawMediaTypeUsageSignalBook"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalBook](self, "rawMediaTypeUsageSignalBook"));
    v170 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v170 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalMusic](self, "hasRawMediaTypeUsageSignalMusic"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalMusic](self, "rawMediaTypeUsageSignalMusic"));
    v169 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v169 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalPodcast](self, "hasRawMediaTypeUsageSignalPodcast"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalPodcast](self, "rawMediaTypeUsageSignalPodcast"));
    v168 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v168 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalVideo](self, "hasRawMediaTypeUsageSignalVideo"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalVideo](self, "rawMediaTypeUsageSignalVideo"));
    v167 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v167 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet10Min](self, "hasRawNowPlayingCountCoreDuet10Min"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet10Min](self, "rawNowPlayingCountCoreDuet10Min"));
    v166 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v166 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet1Day](self, "hasRawNowPlayingCountCoreDuet1Day"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet1Day](self, "rawNowPlayingCountCoreDuet1Day"));
    v165 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v165 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet1Hr](self, "hasRawNowPlayingCountCoreDuet1Hr"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet1Hr](self, "rawNowPlayingCountCoreDuet1Hr"));
    v164 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v164 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet28Day](self, "hasRawNowPlayingCountCoreDuet28Day"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet28Day](self, "rawNowPlayingCountCoreDuet28Day"));
    v163 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v163 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet2Min](self, "hasRawNowPlayingCountCoreDuet2Min"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet2Min](self, "rawNowPlayingCountCoreDuet2Min"));
    v162 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v162 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet6Hr](self, "hasRawNowPlayingCountCoreDuet6Hr"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet6Hr](self, "rawNowPlayingCountCoreDuet6Hr"));
    v161 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v161 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet7Day](self, "hasRawNowPlayingCountCoreDuet7Day"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet7Day](self, "rawNowPlayingCountCoreDuet7Day"));
    v160 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v160 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingRecencyCD](self, "hasRawNowPlayingRecencyCD"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingRecencyCD](self, "rawNowPlayingRecencyCD"));
    v159 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v159 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawEntitySearchRecency](self, "hasRawEntitySearchRecency"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawEntitySearchRecency](self, "rawEntitySearchRecency"));
    v158 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v158 = 0;
  }
  if (!-[BMSiriMusicInferenceTrainingDependentSignals hasUsageScoreBooks](self, "hasUsageScoreBooks")
    || (-[BMSiriMusicInferenceTrainingDependentSignals usageScoreBooks](self, "usageScoreBooks"), fabs(v22) == INFINITY))
  {
    v157 = 0;
  }
  else
  {
    -[BMSiriMusicInferenceTrainingDependentSignals usageScoreBooks](self, "usageScoreBooks");
    v23 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriMusicInferenceTrainingDependentSignals usageScoreBooks](self, "usageScoreBooks");
    objc_msgSend(v23, "numberWithDouble:");
    v157 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriMusicInferenceTrainingDependentSignals hasUsageScoreMusic](self, "hasUsageScoreMusic")
    || (-[BMSiriMusicInferenceTrainingDependentSignals usageScoreMusic](self, "usageScoreMusic"), fabs(v24) == INFINITY))
  {
    v156 = 0;
  }
  else
  {
    -[BMSiriMusicInferenceTrainingDependentSignals usageScoreMusic](self, "usageScoreMusic");
    v25 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriMusicInferenceTrainingDependentSignals usageScoreMusic](self, "usageScoreMusic");
    objc_msgSend(v25, "numberWithDouble:");
    v156 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriMusicInferenceTrainingDependentSignals hasUsageScorePodcasts](self, "hasUsageScorePodcasts")
    || (-[BMSiriMusicInferenceTrainingDependentSignals usageScorePodcasts](self, "usageScorePodcasts"),
        fabs(v26) == INFINITY))
  {
    v155 = 0;
  }
  else
  {
    -[BMSiriMusicInferenceTrainingDependentSignals usageScorePodcasts](self, "usageScorePodcasts");
    v27 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriMusicInferenceTrainingDependentSignals usageScorePodcasts](self, "usageScorePodcasts");
    objc_msgSend(v27, "numberWithDouble:");
    v155 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsAppFirstParty](self, "hasIsAppFirstParty"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isAppFirstParty](self, "isAppFirstParty"));
    v154 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v154 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRequestedApp](self, "hasIsRequestedApp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRequestedApp](self, "isRequestedApp"));
    v153 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v153 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsNowPlayingBundlePSE1](self, "hasIsNowPlayingBundlePSE1"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingBundlePSE1](self, "isNowPlayingBundlePSE1"));
    v152 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v152 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsNowPlayingBundlePSE2](self, "hasIsNowPlayingBundlePSE2"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingBundlePSE2](self, "isNowPlayingBundlePSE2"));
    v151 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v151 = 0;
  }
  if (!-[BMSiriMusicInferenceTrainingDependentSignals hasVq21Score](self, "hasVq21Score")
    || (-[BMSiriMusicInferenceTrainingDependentSignals vq21Score](self, "vq21Score"), fabs(v28) == INFINITY))
  {
    v150 = 0;
  }
  else
  {
    -[BMSiriMusicInferenceTrainingDependentSignals vq21Score](self, "vq21Score");
    v29 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriMusicInferenceTrainingDependentSignals vq21Score](self, "vq21Score");
    objc_msgSend(v29, "numberWithDouble:");
    v150 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsSupportedFlag](self, "hasIsSupportedFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isSupportedFlag](self, "isSupportedFlag"));
    v149 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v149 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsUnicornFlag](self, "hasIsUnicornFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isUnicornFlag](self, "isUnicornFlag"));
    v148 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v148 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsSupportedUnicornMatchFlag](self, "hasIsSupportedUnicornMatchFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isSupportedUnicornMatchFlag](self, "isSupportedUnicornMatchFlag"));
    v147 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v147 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsDisambiguationSelectedApp](self, "hasIsDisambiguationSelectedApp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isDisambiguationSelectedApp](self, "isDisambiguationSelectedApp"));
    v146 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v146 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsModelPredictedApp](self, "hasIsModelPredictedApp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isModelPredictedApp](self, "isModelPredictedApp"));
    v145 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v145 = 0;
  }
  if (!-[BMSiriMusicInferenceTrainingDependentSignals hasUsageScoreRadio](self, "hasUsageScoreRadio")
    || (-[BMSiriMusicInferenceTrainingDependentSignals usageScoreRadio](self, "usageScoreRadio"), fabs(v30) == INFINITY))
  {
    v144 = 0;
  }
  else
  {
    -[BMSiriMusicInferenceTrainingDependentSignals usageScoreRadio](self, "usageScoreRadio");
    v31 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriMusicInferenceTrainingDependentSignals usageScoreRadio](self, "usageScoreRadio");
    objc_msgSend(v31, "numberWithDouble:");
    v144 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriMusicInferenceTrainingDependentSignals hasUsageScoreMusicWithoutRadio](self, "hasUsageScoreMusicWithoutRadio")|| (-[BMSiriMusicInferenceTrainingDependentSignals usageScoreMusicWithoutRadio](self, "usageScoreMusicWithoutRadio"), fabs(v32) == INFINITY))
  {
    v143 = 0;
  }
  else
  {
    -[BMSiriMusicInferenceTrainingDependentSignals usageScoreMusicWithoutRadio](self, "usageScoreMusicWithoutRadio");
    v33 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriMusicInferenceTrainingDependentSignals usageScoreMusicWithoutRadio](self, "usageScoreMusicWithoutRadio");
    objc_msgSend(v33, "numberWithDouble:");
    v143 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalRadio](self, "hasRawMediaTypeUsageSignalRadio"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalRadio](self, "rawMediaTypeUsageSignalRadio"));
    v142 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v142 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalMusicWithoutRadio](self, "hasRawMediaTypeUsageSignalMusicWithoutRadio"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalMusicWithoutRadio](self, "rawMediaTypeUsageSignalMusicWithoutRadio"));
    v139 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v139 = 0;
  }
  v182[0] = CFSTR("isClientForegroundActiveBundle");
  v34 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v133 = (void *)v34;
  v183[0] = v34;
  v182[1] = CFSTR("compoundActiveBundleScore");
  v35 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v132 = (void *)v35;
  v183[1] = v35;
  v182[2] = CFSTR("compoundMediaTypeBundleScore");
  v36 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v131 = (void *)v36;
  v183[2] = v36;
  v182[3] = CFSTR("entitySearchBundleRecencyS");
  v37 = (uint64_t)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v130 = (void *)v37;
  v183[3] = v37;
  v182[4] = CFSTR("entitySearchBundleScore");
  v38 = (uint64_t)v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = objc_claimAutoreleasedReturnValue();
  }
  v129 = (void *)v38;
  v183[4] = v38;
  v182[5] = CFSTR("isForegroundBundle");
  v39 = (uint64_t)v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = objc_claimAutoreleasedReturnValue();
  }
  v128 = (void *)v39;
  v183[5] = v39;
  v182[6] = CFSTR("isNowPlayingBundle");
  v40 = (uint64_t)v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v135 = v17;
  v127 = (void *)v40;
  v183[6] = v40;
  v182[7] = CFSTR("nowPlayingBundleCount");
  v41 = (uint64_t)v141;
  if (!v141)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = objc_claimAutoreleasedReturnValue();
  }
  v42 = v15;
  v126 = (void *)v41;
  v183[7] = v41;
  v182[8] = CFSTR("nowPlayingBundleRecencyS");
  v43 = (uint64_t)v140;
  if (!v140)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  v44 = v12;
  v125 = (void *)v43;
  v183[8] = v43;
  v182[9] = CFSTR("nowPlayingBundleScore");
  v45 = v181;
  if (!v181)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v46 = v3;
  v183[9] = v45;
  v182[10] = CFSTR("isNowPlayingLastBundle");
  v47 = (uint64_t)v180;
  if (!v180)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v47 = objc_claimAutoreleasedReturnValue();
  }
  v183[10] = v47;
  v182[11] = CFSTR("nowPlayingUsage1Day");
  v48 = (uint64_t)v179;
  if (!v179)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v48 = objc_claimAutoreleasedReturnValue();
  }
  v183[11] = v48;
  v182[12] = CFSTR("nowPlayingUsage7Days");
  v49 = (uint64_t)v178;
  if (!v178)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v49 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v49;
  v183[12] = v49;
  v182[13] = CFSTR("nowPlayingUsage14Days");
  v51 = (uint64_t)v177;
  if (!v177)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v51 = objc_claimAutoreleasedReturnValue();
  }
  v122 = (void *)v51;
  v183[13] = v51;
  v182[14] = CFSTR("isRawLastNowPlayingCoreDuet");
  v52 = (uint64_t)v176;
  if (!v176)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v52 = objc_claimAutoreleasedReturnValue();
  }
  v121 = (void *)v52;
  v183[14] = v52;
  v182[15] = CFSTR("isRawMediaCategoryAudiobookSignal");
  v53 = (uint64_t)v175;
  if (!v175)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v53 = objc_claimAutoreleasedReturnValue();
  }
  v120 = (void *)v53;
  v183[15] = v53;
  v182[16] = CFSTR("isRawMediaCategoryMusicSignal");
  v54 = (uint64_t)v174;
  if (!v174)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v54 = objc_claimAutoreleasedReturnValue();
  }
  v119 = (void *)v54;
  v183[16] = v54;
  v182[17] = CFSTR("isRawMediaCategoryPodcastSignal");
  v55 = (uint64_t)v173;
  if (!v173)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v55 = objc_claimAutoreleasedReturnValue();
  }
  v118 = (void *)v55;
  v183[17] = v55;
  v182[18] = CFSTR("isRawMediaCategoryRadioSignal");
  v56 = (uint64_t)v172;
  if (!v172)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v56 = objc_claimAutoreleasedReturnValue();
  }
  v117 = (void *)v56;
  v183[18] = v56;
  v182[19] = CFSTR("isRawMediaCategoryVideoSignal");
  v57 = (uint64_t)v171;
  if (!v171)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v57 = objc_claimAutoreleasedReturnValue();
  }
  v116 = (void *)v57;
  v183[19] = v57;
  v182[20] = CFSTR("rawMediaTypeUsageSignalBook");
  v58 = (uint64_t)v170;
  if (!v170)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v58 = objc_claimAutoreleasedReturnValue();
  }
  v115 = (void *)v58;
  v183[20] = v58;
  v182[21] = CFSTR("rawMediaTypeUsageSignalMusic");
  v59 = (uint64_t)v169;
  if (!v169)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v59 = objc_claimAutoreleasedReturnValue();
  }
  v114 = (void *)v59;
  v183[21] = v59;
  v182[22] = CFSTR("rawMediaTypeUsageSignalPodcast");
  v60 = (uint64_t)v168;
  if (!v168)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v60 = objc_claimAutoreleasedReturnValue();
  }
  v113 = (void *)v60;
  v183[22] = v60;
  v182[23] = CFSTR("rawMediaTypeUsageSignalVideo");
  v61 = (uint64_t)v167;
  if (!v167)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v61 = objc_claimAutoreleasedReturnValue();
  }
  v112 = (void *)v61;
  v183[23] = v61;
  v182[24] = CFSTR("rawNowPlayingCountCoreDuet10Min");
  v62 = (uint64_t)v166;
  if (!v166)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v62 = objc_claimAutoreleasedReturnValue();
  }
  v111 = (void *)v62;
  v183[24] = v62;
  v182[25] = CFSTR("rawNowPlayingCountCoreDuet1Day");
  v63 = (uint64_t)v165;
  if (!v165)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v63 = objc_claimAutoreleasedReturnValue();
  }
  v110 = (void *)v63;
  v183[25] = v63;
  v182[26] = CFSTR("rawNowPlayingCountCoreDuet1Hr");
  v64 = (uint64_t)v164;
  if (!v164)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v64 = objc_claimAutoreleasedReturnValue();
  }
  v109 = (void *)v64;
  v183[26] = v64;
  v182[27] = CFSTR("rawNowPlayingCountCoreDuet28Day");
  v65 = (uint64_t)v163;
  if (!v163)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v65 = objc_claimAutoreleasedReturnValue();
  }
  v108 = (void *)v65;
  v183[27] = v65;
  v182[28] = CFSTR("rawNowPlayingCountCoreDuet2Min");
  v66 = (uint64_t)v162;
  if (!v162)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v66 = objc_claimAutoreleasedReturnValue();
  }
  v107 = (void *)v66;
  v183[28] = v66;
  v182[29] = CFSTR("rawNowPlayingCountCoreDuet6Hr");
  v67 = (uint64_t)v161;
  if (!v161)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v67 = objc_claimAutoreleasedReturnValue();
  }
  v106 = (void *)v67;
  v183[29] = v67;
  v182[30] = CFSTR("rawNowPlayingCountCoreDuet7Day");
  v68 = (uint64_t)v160;
  if (!v160)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v68 = objc_claimAutoreleasedReturnValue();
  }
  v105 = (void *)v68;
  v183[30] = v68;
  v182[31] = CFSTR("rawNowPlayingRecencyCD");
  v69 = (uint64_t)v159;
  if (!v159)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v69 = objc_claimAutoreleasedReturnValue();
  }
  v104 = (void *)v69;
  v183[31] = v69;
  v182[32] = CFSTR("rawEntitySearchRecency");
  v70 = (uint64_t)v158;
  if (!v158)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v70 = objc_claimAutoreleasedReturnValue();
  }
  v103 = (void *)v70;
  v183[32] = v70;
  v182[33] = CFSTR("usageScoreBooks");
  v71 = (uint64_t)v157;
  if (!v157)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v71 = objc_claimAutoreleasedReturnValue();
  }
  v102 = (void *)v71;
  v183[33] = v71;
  v182[34] = CFSTR("usageScoreMusic");
  v72 = (uint64_t)v156;
  if (!v156)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v72 = objc_claimAutoreleasedReturnValue();
  }
  v101 = (void *)v72;
  v183[34] = v72;
  v182[35] = CFSTR("usageScorePodcasts");
  v73 = (uint64_t)v155;
  if (!v155)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v73 = objc_claimAutoreleasedReturnValue();
  }
  v100 = (void *)v73;
  v183[35] = v73;
  v182[36] = CFSTR("isAppFirstParty");
  v74 = (uint64_t)v154;
  if (!v154)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v74 = objc_claimAutoreleasedReturnValue();
  }
  v99 = (void *)v74;
  v183[36] = v74;
  v182[37] = CFSTR("isRequestedApp");
  v75 = (uint64_t)v153;
  if (!v153)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v75 = objc_claimAutoreleasedReturnValue();
  }
  v98 = (void *)v75;
  v183[37] = v75;
  v182[38] = CFSTR("isNowPlayingBundlePSE1");
  v76 = (uint64_t)v152;
  if (!v152)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v76 = objc_claimAutoreleasedReturnValue();
  }
  v97 = (void *)v76;
  v183[38] = v76;
  v182[39] = CFSTR("isNowPlayingBundlePSE2");
  v77 = (uint64_t)v151;
  if (!v151)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v77 = objc_claimAutoreleasedReturnValue();
  }
  v138 = v9;
  v96 = (void *)v77;
  v183[39] = v77;
  v182[40] = CFSTR("vq21Score");
  v78 = (uint64_t)v150;
  if (!v150)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v78 = objc_claimAutoreleasedReturnValue();
  }
  v95 = (void *)v78;
  v183[40] = v78;
  v182[41] = CFSTR("isSupportedFlag");
  v79 = (uint64_t)v149;
  if (!v149)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v79 = objc_claimAutoreleasedReturnValue();
  }
  v94 = (void *)v79;
  v183[41] = v79;
  v182[42] = CFSTR("isUnicornFlag");
  v80 = (uint64_t)v148;
  if (!v148)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v80 = objc_claimAutoreleasedReturnValue();
  }
  v123 = (void *)v48;
  v93 = (void *)v80;
  v183[42] = v80;
  v182[43] = CFSTR("isSupportedUnicornMatchFlag");
  v81 = (uint64_t)v147;
  if (!v147)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v81 = objc_claimAutoreleasedReturnValue();
  }
  v137 = v16;
  v92 = (void *)v81;
  v183[43] = v81;
  v182[44] = CFSTR("isDisambiguationSelectedApp");
  v82 = (uint64_t)v146;
  v83 = v46;
  if (!v146)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v82 = objc_claimAutoreleasedReturnValue();
  }
  v124 = (void *)v47;
  v91 = (void *)v82;
  v183[44] = v82;
  v182[45] = CFSTR("isModelPredictedApp");
  v84 = v145;
  if (!v145)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v136 = v44;
  v183[45] = v84;
  v182[46] = CFSTR("usageScoreRadio");
  v85 = v144;
  if (!v144)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v183[46] = v85;
  v182[47] = CFSTR("usageScoreMusicWithoutRadio");
  v86 = v143;
  if (!v143)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v183[47] = v86;
  v182[48] = CFSTR("rawMediaTypeUsageSignalRadio");
  v87 = v142;
  if (!v142)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v183[48] = v87;
  v182[49] = CFSTR("rawMediaTypeUsageSignalMusicWithoutRadio");
  v88 = v139;
  if (!v139)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v183[49] = v88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v183, v182, 50);
  v134 = (id)objc_claimAutoreleasedReturnValue();
  if (!v139)

  v89 = v50;
  if (!v142)
  {

    v89 = v50;
  }
  if (!v143)
  {

    v89 = v50;
  }
  if (!v144)
  {

    v89 = v50;
  }
  if (!v145)
  {

    v89 = v50;
  }
  if (!v146)
  {

    v89 = v50;
  }
  if (!v147)
  {

    v89 = v50;
  }
  if (!v148)
  {

    v89 = v50;
  }
  if (!v149)
  {

    v89 = v50;
  }
  if (!v150)
  {

    v89 = v50;
  }
  if (!v151)
  {

    v89 = v50;
  }
  if (!v152)
  {

    v89 = v50;
  }
  if (!v153)
  {

    v89 = v50;
  }
  if (!v154)
  {

    v89 = v50;
  }
  if (!v155)
  {

    v89 = v50;
  }
  if (!v156)
  {

    v89 = v50;
  }
  if (!v157)
  {

    v89 = v50;
  }
  if (!v158)
  {

    v89 = v50;
  }
  if (!v159)
  {

    v89 = v50;
  }
  if (!v160)
  {

    v89 = v50;
  }
  if (!v161)
  {

    v89 = v50;
  }
  if (!v162)
  {

    v89 = v50;
  }
  if (!v163)
  {

    v89 = v50;
  }
  if (!v164)
  {

    v89 = v50;
  }
  if (!v165)
  {

    v89 = v50;
  }
  if (!v166)
  {

    v89 = v50;
  }
  if (!v167)
  {

    v89 = v50;
  }
  if (!v168)
  {

    v89 = v50;
  }
  if (!v169)
  {

    v89 = v50;
  }
  if (!v170)
  {

    v89 = v50;
  }
  if (!v171)
  {

    v89 = v50;
  }
  if (!v172)
  {

    v89 = v50;
  }
  if (!v173)
  {

    v89 = v50;
  }
  if (!v174)
  {

    v89 = v50;
  }
  if (!v175)
  {

    v89 = v50;
  }
  if (!v176)
  {

    v89 = v50;
  }
  if (!v177)
  {

    v89 = v50;
  }
  if (!v178)

  if (!v179)
  if (!v180)

  if (v181)
  {
    if (v140)
      goto LABEL_345;
  }
  else
  {

    if (v140)
    {
LABEL_345:
      if (v141)
        goto LABEL_346;
      goto LABEL_356;
    }
  }

  if (v141)
  {
LABEL_346:
    if (v135)
      goto LABEL_347;
    goto LABEL_357;
  }
LABEL_356:

  if (v135)
  {
LABEL_347:
    if (v137)
      goto LABEL_348;
    goto LABEL_358;
  }
LABEL_357:

  if (v137)
  {
LABEL_348:
    if (v42)
      goto LABEL_349;
    goto LABEL_359;
  }
LABEL_358:

  if (v42)
  {
LABEL_349:
    if (v136)
      goto LABEL_350;
    goto LABEL_360;
  }
LABEL_359:

  if (v136)
  {
LABEL_350:
    if (v138)
      goto LABEL_351;
    goto LABEL_361;
  }
LABEL_360:

  if (v138)
  {
LABEL_351:
    if (v6)
      goto LABEL_352;
LABEL_362:

    if (v83)
      goto LABEL_353;
LABEL_363:

    goto LABEL_353;
  }
LABEL_361:

  if (!v6)
    goto LABEL_362;
LABEL_352:
  if (!v83)
    goto LABEL_363;
LABEL_353:

  return v134;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  int v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  int v60;
  int v61;
  int v62;
  int v63;
  double v64;
  double v65;
  double v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  int v78;
  int v79;
  BOOL v80;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v80 = 0;
    goto LABEL_255;
  }
  v5 = v4;
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsClientForegroundActiveBundle](self, "hasIsClientForegroundActiveBundle")|| objc_msgSend(v5, "hasIsClientForegroundActiveBundle"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsClientForegroundActiveBundle](self, "hasIsClientForegroundActiveBundle"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsClientForegroundActiveBundle"))
      goto LABEL_252;
    v6 = -[BMSiriMusicInferenceTrainingDependentSignals isClientForegroundActiveBundle](self, "isClientForegroundActiveBundle");
    if (v6 != objc_msgSend(v5, "isClientForegroundActiveBundle"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasCompoundActiveBundleScore](self, "hasCompoundActiveBundleScore")|| objc_msgSend(v5, "hasCompoundActiveBundleScore"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasCompoundActiveBundleScore](self, "hasCompoundActiveBundleScore"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasCompoundActiveBundleScore"))
      goto LABEL_252;
    -[BMSiriMusicInferenceTrainingDependentSignals compoundActiveBundleScore](self, "compoundActiveBundleScore");
    v8 = v7;
    objc_msgSend(v5, "compoundActiveBundleScore");
    if (v8 != v9)
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasCompoundMediaTypeBundleScore](self, "hasCompoundMediaTypeBundleScore")|| objc_msgSend(v5, "hasCompoundMediaTypeBundleScore"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasCompoundMediaTypeBundleScore](self, "hasCompoundMediaTypeBundleScore"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasCompoundMediaTypeBundleScore"))
      goto LABEL_252;
    -[BMSiriMusicInferenceTrainingDependentSignals compoundMediaTypeBundleScore](self, "compoundMediaTypeBundleScore");
    v11 = v10;
    objc_msgSend(v5, "compoundMediaTypeBundleScore");
    if (v11 != v12)
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasEntitySearchBundleRecencyS](self, "hasEntitySearchBundleRecencyS")|| objc_msgSend(v5, "hasEntitySearchBundleRecencyS"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasEntitySearchBundleRecencyS](self, "hasEntitySearchBundleRecencyS"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasEntitySearchBundleRecencyS"))
      goto LABEL_252;
    -[BMSiriMusicInferenceTrainingDependentSignals entitySearchBundleRecencyS](self, "entitySearchBundleRecencyS");
    v14 = v13;
    objc_msgSend(v5, "entitySearchBundleRecencyS");
    if (v14 != v15)
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasEntitySearchBundleScore](self, "hasEntitySearchBundleScore")
    || objc_msgSend(v5, "hasEntitySearchBundleScore"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasEntitySearchBundleScore](self, "hasEntitySearchBundleScore"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasEntitySearchBundleScore"))
      goto LABEL_252;
    -[BMSiriMusicInferenceTrainingDependentSignals entitySearchBundleScore](self, "entitySearchBundleScore");
    v17 = v16;
    objc_msgSend(v5, "entitySearchBundleScore");
    if (v17 != v18)
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsForegroundBundle](self, "hasIsForegroundBundle")
    || objc_msgSend(v5, "hasIsForegroundBundle"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsForegroundBundle](self, "hasIsForegroundBundle"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsForegroundBundle"))
      goto LABEL_252;
    v19 = -[BMSiriMusicInferenceTrainingDependentSignals isForegroundBundle](self, "isForegroundBundle");
    if (v19 != objc_msgSend(v5, "isForegroundBundle"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsNowPlayingBundle](self, "hasIsNowPlayingBundle")
    || objc_msgSend(v5, "hasIsNowPlayingBundle"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsNowPlayingBundle](self, "hasIsNowPlayingBundle"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsNowPlayingBundle"))
      goto LABEL_252;
    v20 = -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingBundle](self, "isNowPlayingBundle");
    if (v20 != objc_msgSend(v5, "isNowPlayingBundle"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingBundleCount](self, "hasNowPlayingBundleCount")
    || objc_msgSend(v5, "hasNowPlayingBundleCount"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingBundleCount](self, "hasNowPlayingBundleCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasNowPlayingBundleCount"))
      goto LABEL_252;
    v21 = -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingBundleCount](self, "nowPlayingBundleCount");
    if (v21 != objc_msgSend(v5, "nowPlayingBundleCount"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingBundleRecencyS](self, "hasNowPlayingBundleRecencyS")
    || objc_msgSend(v5, "hasNowPlayingBundleRecencyS"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingBundleRecencyS](self, "hasNowPlayingBundleRecencyS"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasNowPlayingBundleRecencyS"))
      goto LABEL_252;
    -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingBundleRecencyS](self, "nowPlayingBundleRecencyS");
    v23 = v22;
    objc_msgSend(v5, "nowPlayingBundleRecencyS");
    if (v23 != v24)
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingBundleScore](self, "hasNowPlayingBundleScore")
    || objc_msgSend(v5, "hasNowPlayingBundleScore"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingBundleScore](self, "hasNowPlayingBundleScore"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasNowPlayingBundleScore"))
      goto LABEL_252;
    -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingBundleScore](self, "nowPlayingBundleScore");
    v26 = v25;
    objc_msgSend(v5, "nowPlayingBundleScore");
    if (v26 != v27)
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsNowPlayingLastBundle](self, "hasIsNowPlayingLastBundle")
    || objc_msgSend(v5, "hasIsNowPlayingLastBundle"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsNowPlayingLastBundle](self, "hasIsNowPlayingLastBundle"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsNowPlayingLastBundle"))
      goto LABEL_252;
    v28 = -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingLastBundle](self, "isNowPlayingLastBundle");
    if (v28 != objc_msgSend(v5, "isNowPlayingLastBundle"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingUsage1Day](self, "hasNowPlayingUsage1Day")
    || objc_msgSend(v5, "hasNowPlayingUsage1Day"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingUsage1Day](self, "hasNowPlayingUsage1Day"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasNowPlayingUsage1Day"))
      goto LABEL_252;
    v29 = -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingUsage1Day](self, "nowPlayingUsage1Day");
    if (v29 != objc_msgSend(v5, "nowPlayingUsage1Day"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingUsage7Days](self, "hasNowPlayingUsage7Days")
    || objc_msgSend(v5, "hasNowPlayingUsage7Days"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingUsage7Days](self, "hasNowPlayingUsage7Days"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasNowPlayingUsage7Days"))
      goto LABEL_252;
    v30 = -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingUsage7Days](self, "nowPlayingUsage7Days");
    if (v30 != objc_msgSend(v5, "nowPlayingUsage7Days"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingUsage14Days](self, "hasNowPlayingUsage14Days")
    || objc_msgSend(v5, "hasNowPlayingUsage14Days"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasNowPlayingUsage14Days](self, "hasNowPlayingUsage14Days"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasNowPlayingUsage14Days"))
      goto LABEL_252;
    v31 = -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingUsage14Days](self, "nowPlayingUsage14Days");
    if (v31 != objc_msgSend(v5, "nowPlayingUsage14Days"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawLastNowPlayingCoreDuet](self, "hasIsRawLastNowPlayingCoreDuet")|| objc_msgSend(v5, "hasIsRawLastNowPlayingCoreDuet"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawLastNowPlayingCoreDuet](self, "hasIsRawLastNowPlayingCoreDuet"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsRawLastNowPlayingCoreDuet"))
      goto LABEL_252;
    v32 = -[BMSiriMusicInferenceTrainingDependentSignals isRawLastNowPlayingCoreDuet](self, "isRawLastNowPlayingCoreDuet");
    if (v32 != objc_msgSend(v5, "isRawLastNowPlayingCoreDuet"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryAudiobookSignal](self, "hasIsRawMediaCategoryAudiobookSignal")|| objc_msgSend(v5, "hasIsRawMediaCategoryAudiobookSignal"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryAudiobookSignal](self, "hasIsRawMediaCategoryAudiobookSignal"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsRawMediaCategoryAudiobookSignal"))
      goto LABEL_252;
    v33 = -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryAudiobookSignal](self, "isRawMediaCategoryAudiobookSignal");
    if (v33 != objc_msgSend(v5, "isRawMediaCategoryAudiobookSignal"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryMusicSignal](self, "hasIsRawMediaCategoryMusicSignal")|| objc_msgSend(v5, "hasIsRawMediaCategoryMusicSignal"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryMusicSignal](self, "hasIsRawMediaCategoryMusicSignal"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsRawMediaCategoryMusicSignal"))
      goto LABEL_252;
    v34 = -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryMusicSignal](self, "isRawMediaCategoryMusicSignal");
    if (v34 != objc_msgSend(v5, "isRawMediaCategoryMusicSignal"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryPodcastSignal](self, "hasIsRawMediaCategoryPodcastSignal")|| objc_msgSend(v5, "hasIsRawMediaCategoryPodcastSignal"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryPodcastSignal](self, "hasIsRawMediaCategoryPodcastSignal"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsRawMediaCategoryPodcastSignal"))
      goto LABEL_252;
    v35 = -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryPodcastSignal](self, "isRawMediaCategoryPodcastSignal");
    if (v35 != objc_msgSend(v5, "isRawMediaCategoryPodcastSignal"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryRadioSignal](self, "hasIsRawMediaCategoryRadioSignal")|| objc_msgSend(v5, "hasIsRawMediaCategoryRadioSignal"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryRadioSignal](self, "hasIsRawMediaCategoryRadioSignal"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsRawMediaCategoryRadioSignal"))
      goto LABEL_252;
    v36 = -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryRadioSignal](self, "isRawMediaCategoryRadioSignal");
    if (v36 != objc_msgSend(v5, "isRawMediaCategoryRadioSignal"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryVideoSignal](self, "hasIsRawMediaCategoryVideoSignal")|| objc_msgSend(v5, "hasIsRawMediaCategoryVideoSignal"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryVideoSignal](self, "hasIsRawMediaCategoryVideoSignal"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsRawMediaCategoryVideoSignal"))
      goto LABEL_252;
    v37 = -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryVideoSignal](self, "isRawMediaCategoryVideoSignal");
    if (v37 != objc_msgSend(v5, "isRawMediaCategoryVideoSignal"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalBook](self, "hasRawMediaTypeUsageSignalBook")|| objc_msgSend(v5, "hasRawMediaTypeUsageSignalBook"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalBook](self, "hasRawMediaTypeUsageSignalBook"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasRawMediaTypeUsageSignalBook"))
      goto LABEL_252;
    v38 = -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalBook](self, "rawMediaTypeUsageSignalBook");
    if (v38 != objc_msgSend(v5, "rawMediaTypeUsageSignalBook"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalMusic](self, "hasRawMediaTypeUsageSignalMusic")|| objc_msgSend(v5, "hasRawMediaTypeUsageSignalMusic"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalMusic](self, "hasRawMediaTypeUsageSignalMusic"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasRawMediaTypeUsageSignalMusic"))
      goto LABEL_252;
    v39 = -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalMusic](self, "rawMediaTypeUsageSignalMusic");
    if (v39 != objc_msgSend(v5, "rawMediaTypeUsageSignalMusic"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalPodcast](self, "hasRawMediaTypeUsageSignalPodcast")|| objc_msgSend(v5, "hasRawMediaTypeUsageSignalPodcast"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalPodcast](self, "hasRawMediaTypeUsageSignalPodcast"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasRawMediaTypeUsageSignalPodcast"))
      goto LABEL_252;
    v40 = -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalPodcast](self, "rawMediaTypeUsageSignalPodcast");
    if (v40 != objc_msgSend(v5, "rawMediaTypeUsageSignalPodcast"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalVideo](self, "hasRawMediaTypeUsageSignalVideo")|| objc_msgSend(v5, "hasRawMediaTypeUsageSignalVideo"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalVideo](self, "hasRawMediaTypeUsageSignalVideo"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasRawMediaTypeUsageSignalVideo"))
      goto LABEL_252;
    v41 = -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalVideo](self, "rawMediaTypeUsageSignalVideo");
    if (v41 != objc_msgSend(v5, "rawMediaTypeUsageSignalVideo"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet10Min](self, "hasRawNowPlayingCountCoreDuet10Min")|| objc_msgSend(v5, "hasRawNowPlayingCountCoreDuet10Min"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet10Min](self, "hasRawNowPlayingCountCoreDuet10Min"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasRawNowPlayingCountCoreDuet10Min"))
      goto LABEL_252;
    v42 = -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet10Min](self, "rawNowPlayingCountCoreDuet10Min");
    if (v42 != objc_msgSend(v5, "rawNowPlayingCountCoreDuet10Min"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet1Day](self, "hasRawNowPlayingCountCoreDuet1Day")|| objc_msgSend(v5, "hasRawNowPlayingCountCoreDuet1Day"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet1Day](self, "hasRawNowPlayingCountCoreDuet1Day"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasRawNowPlayingCountCoreDuet1Day"))
      goto LABEL_252;
    v43 = -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet1Day](self, "rawNowPlayingCountCoreDuet1Day");
    if (v43 != objc_msgSend(v5, "rawNowPlayingCountCoreDuet1Day"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet1Hr](self, "hasRawNowPlayingCountCoreDuet1Hr")|| objc_msgSend(v5, "hasRawNowPlayingCountCoreDuet1Hr"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet1Hr](self, "hasRawNowPlayingCountCoreDuet1Hr"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasRawNowPlayingCountCoreDuet1Hr"))
      goto LABEL_252;
    v44 = -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet1Hr](self, "rawNowPlayingCountCoreDuet1Hr");
    if (v44 != objc_msgSend(v5, "rawNowPlayingCountCoreDuet1Hr"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet28Day](self, "hasRawNowPlayingCountCoreDuet28Day")|| objc_msgSend(v5, "hasRawNowPlayingCountCoreDuet28Day"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet28Day](self, "hasRawNowPlayingCountCoreDuet28Day"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasRawNowPlayingCountCoreDuet28Day"))
      goto LABEL_252;
    v45 = -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet28Day](self, "rawNowPlayingCountCoreDuet28Day");
    if (v45 != objc_msgSend(v5, "rawNowPlayingCountCoreDuet28Day"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet2Min](self, "hasRawNowPlayingCountCoreDuet2Min")|| objc_msgSend(v5, "hasRawNowPlayingCountCoreDuet2Min"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet2Min](self, "hasRawNowPlayingCountCoreDuet2Min"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasRawNowPlayingCountCoreDuet2Min"))
      goto LABEL_252;
    v46 = -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet2Min](self, "rawNowPlayingCountCoreDuet2Min");
    if (v46 != objc_msgSend(v5, "rawNowPlayingCountCoreDuet2Min"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet6Hr](self, "hasRawNowPlayingCountCoreDuet6Hr")|| objc_msgSend(v5, "hasRawNowPlayingCountCoreDuet6Hr"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet6Hr](self, "hasRawNowPlayingCountCoreDuet6Hr"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasRawNowPlayingCountCoreDuet6Hr"))
      goto LABEL_252;
    v47 = -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet6Hr](self, "rawNowPlayingCountCoreDuet6Hr");
    if (v47 != objc_msgSend(v5, "rawNowPlayingCountCoreDuet6Hr"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet7Day](self, "hasRawNowPlayingCountCoreDuet7Day")|| objc_msgSend(v5, "hasRawNowPlayingCountCoreDuet7Day"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet7Day](self, "hasRawNowPlayingCountCoreDuet7Day"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasRawNowPlayingCountCoreDuet7Day"))
      goto LABEL_252;
    v48 = -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet7Day](self, "rawNowPlayingCountCoreDuet7Day");
    if (v48 != objc_msgSend(v5, "rawNowPlayingCountCoreDuet7Day"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingRecencyCD](self, "hasRawNowPlayingRecencyCD")
    || objc_msgSend(v5, "hasRawNowPlayingRecencyCD"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingRecencyCD](self, "hasRawNowPlayingRecencyCD"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasRawNowPlayingRecencyCD"))
      goto LABEL_252;
    v49 = -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingRecencyCD](self, "rawNowPlayingRecencyCD");
    if (v49 != objc_msgSend(v5, "rawNowPlayingRecencyCD"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawEntitySearchRecency](self, "hasRawEntitySearchRecency")
    || objc_msgSend(v5, "hasRawEntitySearchRecency"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasRawEntitySearchRecency](self, "hasRawEntitySearchRecency"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasRawEntitySearchRecency"))
      goto LABEL_252;
    v50 = -[BMSiriMusicInferenceTrainingDependentSignals rawEntitySearchRecency](self, "rawEntitySearchRecency");
    if (v50 != objc_msgSend(v5, "rawEntitySearchRecency"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasUsageScoreBooks](self, "hasUsageScoreBooks")
    || objc_msgSend(v5, "hasUsageScoreBooks"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasUsageScoreBooks](self, "hasUsageScoreBooks"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasUsageScoreBooks"))
      goto LABEL_252;
    -[BMSiriMusicInferenceTrainingDependentSignals usageScoreBooks](self, "usageScoreBooks");
    v52 = v51;
    objc_msgSend(v5, "usageScoreBooks");
    if (v52 != v53)
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasUsageScoreMusic](self, "hasUsageScoreMusic")
    || objc_msgSend(v5, "hasUsageScoreMusic"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasUsageScoreMusic](self, "hasUsageScoreMusic"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasUsageScoreMusic"))
      goto LABEL_252;
    -[BMSiriMusicInferenceTrainingDependentSignals usageScoreMusic](self, "usageScoreMusic");
    v55 = v54;
    objc_msgSend(v5, "usageScoreMusic");
    if (v55 != v56)
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasUsageScorePodcasts](self, "hasUsageScorePodcasts")
    || objc_msgSend(v5, "hasUsageScorePodcasts"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasUsageScorePodcasts](self, "hasUsageScorePodcasts"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasUsageScorePodcasts"))
      goto LABEL_252;
    -[BMSiriMusicInferenceTrainingDependentSignals usageScorePodcasts](self, "usageScorePodcasts");
    v58 = v57;
    objc_msgSend(v5, "usageScorePodcasts");
    if (v58 != v59)
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsAppFirstParty](self, "hasIsAppFirstParty")
    || objc_msgSend(v5, "hasIsAppFirstParty"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsAppFirstParty](self, "hasIsAppFirstParty"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsAppFirstParty"))
      goto LABEL_252;
    v60 = -[BMSiriMusicInferenceTrainingDependentSignals isAppFirstParty](self, "isAppFirstParty");
    if (v60 != objc_msgSend(v5, "isAppFirstParty"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRequestedApp](self, "hasIsRequestedApp")
    || objc_msgSend(v5, "hasIsRequestedApp"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsRequestedApp](self, "hasIsRequestedApp"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsRequestedApp"))
      goto LABEL_252;
    v61 = -[BMSiriMusicInferenceTrainingDependentSignals isRequestedApp](self, "isRequestedApp");
    if (v61 != objc_msgSend(v5, "isRequestedApp"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsNowPlayingBundlePSE1](self, "hasIsNowPlayingBundlePSE1")
    || objc_msgSend(v5, "hasIsNowPlayingBundlePSE1"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsNowPlayingBundlePSE1](self, "hasIsNowPlayingBundlePSE1"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsNowPlayingBundlePSE1"))
      goto LABEL_252;
    v62 = -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingBundlePSE1](self, "isNowPlayingBundlePSE1");
    if (v62 != objc_msgSend(v5, "isNowPlayingBundlePSE1"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsNowPlayingBundlePSE2](self, "hasIsNowPlayingBundlePSE2")
    || objc_msgSend(v5, "hasIsNowPlayingBundlePSE2"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsNowPlayingBundlePSE2](self, "hasIsNowPlayingBundlePSE2"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsNowPlayingBundlePSE2"))
      goto LABEL_252;
    v63 = -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingBundlePSE2](self, "isNowPlayingBundlePSE2");
    if (v63 != objc_msgSend(v5, "isNowPlayingBundlePSE2"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasVq21Score](self, "hasVq21Score")
    || objc_msgSend(v5, "hasVq21Score"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasVq21Score](self, "hasVq21Score"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasVq21Score"))
      goto LABEL_252;
    -[BMSiriMusicInferenceTrainingDependentSignals vq21Score](self, "vq21Score");
    v65 = v64;
    objc_msgSend(v5, "vq21Score");
    if (v65 != v66)
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsSupportedFlag](self, "hasIsSupportedFlag")
    || objc_msgSend(v5, "hasIsSupportedFlag"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsSupportedFlag](self, "hasIsSupportedFlag"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsSupportedFlag"))
      goto LABEL_252;
    v67 = -[BMSiriMusicInferenceTrainingDependentSignals isSupportedFlag](self, "isSupportedFlag");
    if (v67 != objc_msgSend(v5, "isSupportedFlag"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsUnicornFlag](self, "hasIsUnicornFlag")
    || objc_msgSend(v5, "hasIsUnicornFlag"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsUnicornFlag](self, "hasIsUnicornFlag"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsUnicornFlag"))
      goto LABEL_252;
    v68 = -[BMSiriMusicInferenceTrainingDependentSignals isUnicornFlag](self, "isUnicornFlag");
    if (v68 != objc_msgSend(v5, "isUnicornFlag"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsSupportedUnicornMatchFlag](self, "hasIsSupportedUnicornMatchFlag")|| objc_msgSend(v5, "hasIsSupportedUnicornMatchFlag"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsSupportedUnicornMatchFlag](self, "hasIsSupportedUnicornMatchFlag"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsSupportedUnicornMatchFlag"))
      goto LABEL_252;
    v69 = -[BMSiriMusicInferenceTrainingDependentSignals isSupportedUnicornMatchFlag](self, "isSupportedUnicornMatchFlag");
    if (v69 != objc_msgSend(v5, "isSupportedUnicornMatchFlag"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsDisambiguationSelectedApp](self, "hasIsDisambiguationSelectedApp")|| objc_msgSend(v5, "hasIsDisambiguationSelectedApp"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsDisambiguationSelectedApp](self, "hasIsDisambiguationSelectedApp"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsDisambiguationSelectedApp"))
      goto LABEL_252;
    v70 = -[BMSiriMusicInferenceTrainingDependentSignals isDisambiguationSelectedApp](self, "isDisambiguationSelectedApp");
    if (v70 != objc_msgSend(v5, "isDisambiguationSelectedApp"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsModelPredictedApp](self, "hasIsModelPredictedApp")
    || objc_msgSend(v5, "hasIsModelPredictedApp"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasIsModelPredictedApp](self, "hasIsModelPredictedApp"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasIsModelPredictedApp"))
      goto LABEL_252;
    v71 = -[BMSiriMusicInferenceTrainingDependentSignals isModelPredictedApp](self, "isModelPredictedApp");
    if (v71 != objc_msgSend(v5, "isModelPredictedApp"))
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasUsageScoreRadio](self, "hasUsageScoreRadio")
    || objc_msgSend(v5, "hasUsageScoreRadio"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasUsageScoreRadio](self, "hasUsageScoreRadio"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasUsageScoreRadio"))
      goto LABEL_252;
    -[BMSiriMusicInferenceTrainingDependentSignals usageScoreRadio](self, "usageScoreRadio");
    v73 = v72;
    objc_msgSend(v5, "usageScoreRadio");
    if (v73 != v74)
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasUsageScoreMusicWithoutRadio](self, "hasUsageScoreMusicWithoutRadio")|| objc_msgSend(v5, "hasUsageScoreMusicWithoutRadio"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasUsageScoreMusicWithoutRadio](self, "hasUsageScoreMusicWithoutRadio"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasUsageScoreMusicWithoutRadio"))
      goto LABEL_252;
    -[BMSiriMusicInferenceTrainingDependentSignals usageScoreMusicWithoutRadio](self, "usageScoreMusicWithoutRadio");
    v76 = v75;
    objc_msgSend(v5, "usageScoreMusicWithoutRadio");
    if (v76 != v77)
      goto LABEL_252;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalRadio](self, "hasRawMediaTypeUsageSignalRadio")|| objc_msgSend(v5, "hasRawMediaTypeUsageSignalRadio"))
  {
    if (!-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalRadio](self, "hasRawMediaTypeUsageSignalRadio"))goto LABEL_252;
    if (!objc_msgSend(v5, "hasRawMediaTypeUsageSignalRadio"))
      goto LABEL_252;
    v78 = -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalRadio](self, "rawMediaTypeUsageSignalRadio");
    if (v78 != objc_msgSend(v5, "rawMediaTypeUsageSignalRadio"))
      goto LABEL_252;
  }
  if (!-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalMusicWithoutRadio](self, "hasRawMediaTypeUsageSignalMusicWithoutRadio")&& !objc_msgSend(v5, "hasRawMediaTypeUsageSignalMusicWithoutRadio"))
  {
    v80 = 1;
    goto LABEL_253;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalMusicWithoutRadio](self, "hasRawMediaTypeUsageSignalMusicWithoutRadio")&& objc_msgSend(v5, "hasRawMediaTypeUsageSignalMusicWithoutRadio"))
  {
    v79 = -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalMusicWithoutRadio](self, "rawMediaTypeUsageSignalMusicWithoutRadio");
    v80 = v79 == objc_msgSend(v5, "rawMediaTypeUsageSignalMusicWithoutRadio");
  }
  else
  {
LABEL_252:
    v80 = 0;
  }
LABEL_253:

LABEL_255:
  return v80;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isClientForegroundActiveBundle
{
  return self->_isClientForegroundActiveBundle;
}

- (BOOL)hasIsClientForegroundActiveBundle
{
  return self->_hasIsClientForegroundActiveBundle;
}

- (void)setHasIsClientForegroundActiveBundle:(BOOL)a3
{
  self->_hasIsClientForegroundActiveBundle = a3;
}

- (double)compoundActiveBundleScore
{
  return self->_compoundActiveBundleScore;
}

- (BOOL)hasCompoundActiveBundleScore
{
  return self->_hasCompoundActiveBundleScore;
}

- (void)setHasCompoundActiveBundleScore:(BOOL)a3
{
  self->_hasCompoundActiveBundleScore = a3;
}

- (double)compoundMediaTypeBundleScore
{
  return self->_compoundMediaTypeBundleScore;
}

- (BOOL)hasCompoundMediaTypeBundleScore
{
  return self->_hasCompoundMediaTypeBundleScore;
}

- (void)setHasCompoundMediaTypeBundleScore:(BOOL)a3
{
  self->_hasCompoundMediaTypeBundleScore = a3;
}

- (double)entitySearchBundleRecencyS
{
  return self->_entitySearchBundleRecencyS;
}

- (BOOL)hasEntitySearchBundleRecencyS
{
  return self->_hasEntitySearchBundleRecencyS;
}

- (void)setHasEntitySearchBundleRecencyS:(BOOL)a3
{
  self->_hasEntitySearchBundleRecencyS = a3;
}

- (double)entitySearchBundleScore
{
  return self->_entitySearchBundleScore;
}

- (BOOL)hasEntitySearchBundleScore
{
  return self->_hasEntitySearchBundleScore;
}

- (void)setHasEntitySearchBundleScore:(BOOL)a3
{
  self->_hasEntitySearchBundleScore = a3;
}

- (BOOL)isForegroundBundle
{
  return self->_isForegroundBundle;
}

- (BOOL)hasIsForegroundBundle
{
  return self->_hasIsForegroundBundle;
}

- (void)setHasIsForegroundBundle:(BOOL)a3
{
  self->_hasIsForegroundBundle = a3;
}

- (BOOL)isNowPlayingBundle
{
  return self->_isNowPlayingBundle;
}

- (BOOL)hasIsNowPlayingBundle
{
  return self->_hasIsNowPlayingBundle;
}

- (void)setHasIsNowPlayingBundle:(BOOL)a3
{
  self->_hasIsNowPlayingBundle = a3;
}

- (int)nowPlayingBundleCount
{
  return self->_nowPlayingBundleCount;
}

- (BOOL)hasNowPlayingBundleCount
{
  return self->_hasNowPlayingBundleCount;
}

- (void)setHasNowPlayingBundleCount:(BOOL)a3
{
  self->_hasNowPlayingBundleCount = a3;
}

- (double)nowPlayingBundleRecencyS
{
  return self->_nowPlayingBundleRecencyS;
}

- (BOOL)hasNowPlayingBundleRecencyS
{
  return self->_hasNowPlayingBundleRecencyS;
}

- (void)setHasNowPlayingBundleRecencyS:(BOOL)a3
{
  self->_hasNowPlayingBundleRecencyS = a3;
}

- (double)nowPlayingBundleScore
{
  return self->_nowPlayingBundleScore;
}

- (BOOL)hasNowPlayingBundleScore
{
  return self->_hasNowPlayingBundleScore;
}

- (void)setHasNowPlayingBundleScore:(BOOL)a3
{
  self->_hasNowPlayingBundleScore = a3;
}

- (BOOL)isNowPlayingLastBundle
{
  return self->_isNowPlayingLastBundle;
}

- (BOOL)hasIsNowPlayingLastBundle
{
  return self->_hasIsNowPlayingLastBundle;
}

- (void)setHasIsNowPlayingLastBundle:(BOOL)a3
{
  self->_hasIsNowPlayingLastBundle = a3;
}

- (int)nowPlayingUsage1Day
{
  return self->_nowPlayingUsage1Day;
}

- (BOOL)hasNowPlayingUsage1Day
{
  return self->_hasNowPlayingUsage1Day;
}

- (void)setHasNowPlayingUsage1Day:(BOOL)a3
{
  self->_hasNowPlayingUsage1Day = a3;
}

- (int)nowPlayingUsage7Days
{
  return self->_nowPlayingUsage7Days;
}

- (BOOL)hasNowPlayingUsage7Days
{
  return self->_hasNowPlayingUsage7Days;
}

- (void)setHasNowPlayingUsage7Days:(BOOL)a3
{
  self->_hasNowPlayingUsage7Days = a3;
}

- (int)nowPlayingUsage14Days
{
  return self->_nowPlayingUsage14Days;
}

- (BOOL)hasNowPlayingUsage14Days
{
  return self->_hasNowPlayingUsage14Days;
}

- (void)setHasNowPlayingUsage14Days:(BOOL)a3
{
  self->_hasNowPlayingUsage14Days = a3;
}

- (BOOL)isRawLastNowPlayingCoreDuet
{
  return self->_isRawLastNowPlayingCoreDuet;
}

- (BOOL)hasIsRawLastNowPlayingCoreDuet
{
  return self->_hasIsRawLastNowPlayingCoreDuet;
}

- (void)setHasIsRawLastNowPlayingCoreDuet:(BOOL)a3
{
  self->_hasIsRawLastNowPlayingCoreDuet = a3;
}

- (BOOL)isRawMediaCategoryAudiobookSignal
{
  return self->_isRawMediaCategoryAudiobookSignal;
}

- (BOOL)hasIsRawMediaCategoryAudiobookSignal
{
  return self->_hasIsRawMediaCategoryAudiobookSignal;
}

- (void)setHasIsRawMediaCategoryAudiobookSignal:(BOOL)a3
{
  self->_hasIsRawMediaCategoryAudiobookSignal = a3;
}

- (BOOL)isRawMediaCategoryMusicSignal
{
  return self->_isRawMediaCategoryMusicSignal;
}

- (BOOL)hasIsRawMediaCategoryMusicSignal
{
  return self->_hasIsRawMediaCategoryMusicSignal;
}

- (void)setHasIsRawMediaCategoryMusicSignal:(BOOL)a3
{
  self->_hasIsRawMediaCategoryMusicSignal = a3;
}

- (BOOL)isRawMediaCategoryPodcastSignal
{
  return self->_isRawMediaCategoryPodcastSignal;
}

- (BOOL)hasIsRawMediaCategoryPodcastSignal
{
  return self->_hasIsRawMediaCategoryPodcastSignal;
}

- (void)setHasIsRawMediaCategoryPodcastSignal:(BOOL)a3
{
  self->_hasIsRawMediaCategoryPodcastSignal = a3;
}

- (BOOL)isRawMediaCategoryRadioSignal
{
  return self->_isRawMediaCategoryRadioSignal;
}

- (BOOL)hasIsRawMediaCategoryRadioSignal
{
  return self->_hasIsRawMediaCategoryRadioSignal;
}

- (void)setHasIsRawMediaCategoryRadioSignal:(BOOL)a3
{
  self->_hasIsRawMediaCategoryRadioSignal = a3;
}

- (BOOL)isRawMediaCategoryVideoSignal
{
  return self->_isRawMediaCategoryVideoSignal;
}

- (BOOL)hasIsRawMediaCategoryVideoSignal
{
  return self->_hasIsRawMediaCategoryVideoSignal;
}

- (void)setHasIsRawMediaCategoryVideoSignal:(BOOL)a3
{
  self->_hasIsRawMediaCategoryVideoSignal = a3;
}

- (int)rawMediaTypeUsageSignalBook
{
  return self->_rawMediaTypeUsageSignalBook;
}

- (BOOL)hasRawMediaTypeUsageSignalBook
{
  return self->_hasRawMediaTypeUsageSignalBook;
}

- (void)setHasRawMediaTypeUsageSignalBook:(BOOL)a3
{
  self->_hasRawMediaTypeUsageSignalBook = a3;
}

- (int)rawMediaTypeUsageSignalMusic
{
  return self->_rawMediaTypeUsageSignalMusic;
}

- (BOOL)hasRawMediaTypeUsageSignalMusic
{
  return self->_hasRawMediaTypeUsageSignalMusic;
}

- (void)setHasRawMediaTypeUsageSignalMusic:(BOOL)a3
{
  self->_hasRawMediaTypeUsageSignalMusic = a3;
}

- (int)rawMediaTypeUsageSignalPodcast
{
  return self->_rawMediaTypeUsageSignalPodcast;
}

- (BOOL)hasRawMediaTypeUsageSignalPodcast
{
  return self->_hasRawMediaTypeUsageSignalPodcast;
}

- (void)setHasRawMediaTypeUsageSignalPodcast:(BOOL)a3
{
  self->_hasRawMediaTypeUsageSignalPodcast = a3;
}

- (int)rawMediaTypeUsageSignalVideo
{
  return self->_rawMediaTypeUsageSignalVideo;
}

- (BOOL)hasRawMediaTypeUsageSignalVideo
{
  return self->_hasRawMediaTypeUsageSignalVideo;
}

- (void)setHasRawMediaTypeUsageSignalVideo:(BOOL)a3
{
  self->_hasRawMediaTypeUsageSignalVideo = a3;
}

- (int)rawNowPlayingCountCoreDuet10Min
{
  return self->_rawNowPlayingCountCoreDuet10Min;
}

- (BOOL)hasRawNowPlayingCountCoreDuet10Min
{
  return self->_hasRawNowPlayingCountCoreDuet10Min;
}

- (void)setHasRawNowPlayingCountCoreDuet10Min:(BOOL)a3
{
  self->_hasRawNowPlayingCountCoreDuet10Min = a3;
}

- (int)rawNowPlayingCountCoreDuet1Day
{
  return self->_rawNowPlayingCountCoreDuet1Day;
}

- (BOOL)hasRawNowPlayingCountCoreDuet1Day
{
  return self->_hasRawNowPlayingCountCoreDuet1Day;
}

- (void)setHasRawNowPlayingCountCoreDuet1Day:(BOOL)a3
{
  self->_hasRawNowPlayingCountCoreDuet1Day = a3;
}

- (int)rawNowPlayingCountCoreDuet1Hr
{
  return self->_rawNowPlayingCountCoreDuet1Hr;
}

- (BOOL)hasRawNowPlayingCountCoreDuet1Hr
{
  return self->_hasRawNowPlayingCountCoreDuet1Hr;
}

- (void)setHasRawNowPlayingCountCoreDuet1Hr:(BOOL)a3
{
  self->_hasRawNowPlayingCountCoreDuet1Hr = a3;
}

- (int)rawNowPlayingCountCoreDuet28Day
{
  return self->_rawNowPlayingCountCoreDuet28Day;
}

- (BOOL)hasRawNowPlayingCountCoreDuet28Day
{
  return self->_hasRawNowPlayingCountCoreDuet28Day;
}

- (void)setHasRawNowPlayingCountCoreDuet28Day:(BOOL)a3
{
  self->_hasRawNowPlayingCountCoreDuet28Day = a3;
}

- (int)rawNowPlayingCountCoreDuet2Min
{
  return self->_rawNowPlayingCountCoreDuet2Min;
}

- (BOOL)hasRawNowPlayingCountCoreDuet2Min
{
  return self->_hasRawNowPlayingCountCoreDuet2Min;
}

- (void)setHasRawNowPlayingCountCoreDuet2Min:(BOOL)a3
{
  self->_hasRawNowPlayingCountCoreDuet2Min = a3;
}

- (int)rawNowPlayingCountCoreDuet6Hr
{
  return self->_rawNowPlayingCountCoreDuet6Hr;
}

- (BOOL)hasRawNowPlayingCountCoreDuet6Hr
{
  return self->_hasRawNowPlayingCountCoreDuet6Hr;
}

- (void)setHasRawNowPlayingCountCoreDuet6Hr:(BOOL)a3
{
  self->_hasRawNowPlayingCountCoreDuet6Hr = a3;
}

- (int)rawNowPlayingCountCoreDuet7Day
{
  return self->_rawNowPlayingCountCoreDuet7Day;
}

- (BOOL)hasRawNowPlayingCountCoreDuet7Day
{
  return self->_hasRawNowPlayingCountCoreDuet7Day;
}

- (void)setHasRawNowPlayingCountCoreDuet7Day:(BOOL)a3
{
  self->_hasRawNowPlayingCountCoreDuet7Day = a3;
}

- (int)rawNowPlayingRecencyCD
{
  return self->_rawNowPlayingRecencyCD;
}

- (BOOL)hasRawNowPlayingRecencyCD
{
  return self->_hasRawNowPlayingRecencyCD;
}

- (void)setHasRawNowPlayingRecencyCD:(BOOL)a3
{
  self->_hasRawNowPlayingRecencyCD = a3;
}

- (int)rawEntitySearchRecency
{
  return self->_rawEntitySearchRecency;
}

- (BOOL)hasRawEntitySearchRecency
{
  return self->_hasRawEntitySearchRecency;
}

- (void)setHasRawEntitySearchRecency:(BOOL)a3
{
  self->_hasRawEntitySearchRecency = a3;
}

- (double)usageScoreBooks
{
  return self->_usageScoreBooks;
}

- (BOOL)hasUsageScoreBooks
{
  return self->_hasUsageScoreBooks;
}

- (void)setHasUsageScoreBooks:(BOOL)a3
{
  self->_hasUsageScoreBooks = a3;
}

- (double)usageScoreMusic
{
  return self->_usageScoreMusic;
}

- (BOOL)hasUsageScoreMusic
{
  return self->_hasUsageScoreMusic;
}

- (void)setHasUsageScoreMusic:(BOOL)a3
{
  self->_hasUsageScoreMusic = a3;
}

- (double)usageScorePodcasts
{
  return self->_usageScorePodcasts;
}

- (BOOL)hasUsageScorePodcasts
{
  return self->_hasUsageScorePodcasts;
}

- (void)setHasUsageScorePodcasts:(BOOL)a3
{
  self->_hasUsageScorePodcasts = a3;
}

- (BOOL)isAppFirstParty
{
  return self->_isAppFirstParty;
}

- (BOOL)hasIsAppFirstParty
{
  return self->_hasIsAppFirstParty;
}

- (void)setHasIsAppFirstParty:(BOOL)a3
{
  self->_hasIsAppFirstParty = a3;
}

- (BOOL)isRequestedApp
{
  return self->_isRequestedApp;
}

- (BOOL)hasIsRequestedApp
{
  return self->_hasIsRequestedApp;
}

- (void)setHasIsRequestedApp:(BOOL)a3
{
  self->_hasIsRequestedApp = a3;
}

- (BOOL)isNowPlayingBundlePSE1
{
  return self->_isNowPlayingBundlePSE1;
}

- (BOOL)hasIsNowPlayingBundlePSE1
{
  return self->_hasIsNowPlayingBundlePSE1;
}

- (void)setHasIsNowPlayingBundlePSE1:(BOOL)a3
{
  self->_hasIsNowPlayingBundlePSE1 = a3;
}

- (BOOL)isNowPlayingBundlePSE2
{
  return self->_isNowPlayingBundlePSE2;
}

- (BOOL)hasIsNowPlayingBundlePSE2
{
  return self->_hasIsNowPlayingBundlePSE2;
}

- (void)setHasIsNowPlayingBundlePSE2:(BOOL)a3
{
  self->_hasIsNowPlayingBundlePSE2 = a3;
}

- (double)vq21Score
{
  return self->_vq21Score;
}

- (BOOL)hasVq21Score
{
  return self->_hasVq21Score;
}

- (void)setHasVq21Score:(BOOL)a3
{
  self->_hasVq21Score = a3;
}

- (BOOL)isSupportedFlag
{
  return self->_isSupportedFlag;
}

- (BOOL)hasIsSupportedFlag
{
  return self->_hasIsSupportedFlag;
}

- (void)setHasIsSupportedFlag:(BOOL)a3
{
  self->_hasIsSupportedFlag = a3;
}

- (BOOL)isUnicornFlag
{
  return self->_isUnicornFlag;
}

- (BOOL)hasIsUnicornFlag
{
  return self->_hasIsUnicornFlag;
}

- (void)setHasIsUnicornFlag:(BOOL)a3
{
  self->_hasIsUnicornFlag = a3;
}

- (BOOL)isSupportedUnicornMatchFlag
{
  return self->_isSupportedUnicornMatchFlag;
}

- (BOOL)hasIsSupportedUnicornMatchFlag
{
  return self->_hasIsSupportedUnicornMatchFlag;
}

- (void)setHasIsSupportedUnicornMatchFlag:(BOOL)a3
{
  self->_hasIsSupportedUnicornMatchFlag = a3;
}

- (BOOL)isDisambiguationSelectedApp
{
  return self->_isDisambiguationSelectedApp;
}

- (BOOL)hasIsDisambiguationSelectedApp
{
  return self->_hasIsDisambiguationSelectedApp;
}

- (void)setHasIsDisambiguationSelectedApp:(BOOL)a3
{
  self->_hasIsDisambiguationSelectedApp = a3;
}

- (BOOL)isModelPredictedApp
{
  return self->_isModelPredictedApp;
}

- (BOOL)hasIsModelPredictedApp
{
  return self->_hasIsModelPredictedApp;
}

- (void)setHasIsModelPredictedApp:(BOOL)a3
{
  self->_hasIsModelPredictedApp = a3;
}

- (double)usageScoreRadio
{
  return self->_usageScoreRadio;
}

- (BOOL)hasUsageScoreRadio
{
  return self->_hasUsageScoreRadio;
}

- (void)setHasUsageScoreRadio:(BOOL)a3
{
  self->_hasUsageScoreRadio = a3;
}

- (double)usageScoreMusicWithoutRadio
{
  return self->_usageScoreMusicWithoutRadio;
}

- (BOOL)hasUsageScoreMusicWithoutRadio
{
  return self->_hasUsageScoreMusicWithoutRadio;
}

- (void)setHasUsageScoreMusicWithoutRadio:(BOOL)a3
{
  self->_hasUsageScoreMusicWithoutRadio = a3;
}

- (int)rawMediaTypeUsageSignalRadio
{
  return self->_rawMediaTypeUsageSignalRadio;
}

- (BOOL)hasRawMediaTypeUsageSignalRadio
{
  return self->_hasRawMediaTypeUsageSignalRadio;
}

- (void)setHasRawMediaTypeUsageSignalRadio:(BOOL)a3
{
  self->_hasRawMediaTypeUsageSignalRadio = a3;
}

- (int)rawMediaTypeUsageSignalMusicWithoutRadio
{
  return self->_rawMediaTypeUsageSignalMusicWithoutRadio;
}

- (BOOL)hasRawMediaTypeUsageSignalMusicWithoutRadio
{
  return self->_hasRawMediaTypeUsageSignalMusicWithoutRadio;
}

- (void)setHasRawMediaTypeUsageSignalMusicWithoutRadio:(BOOL)a3
{
  self->_hasRawMediaTypeUsageSignalMusicWithoutRadio = a3;
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

    v4 = -[BMSiriMusicInferenceTrainingDependentSignals initByReadFrom:]([BMSiriMusicInferenceTrainingDependentSignals alloc], "initByReadFrom:", v7);
    v4[22] = 0;

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
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isClientForegroundActiveBundle"), 0, 0, 1, 12, 0);
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("compoundActiveBundleScore"), 1, 0, 2, 0, 0);
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("compoundMediaTypeBundleScore"), 1, 0, 3, 0, 0);
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("entitySearchBundleRecencyS"), 1, 0, 4, 0, 0);
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("entitySearchBundleScore"), 1, 0, 5, 0, 0);
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isForegroundBundle"), 0, 0, 6, 12, 0);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isNowPlayingBundle"), 0, 0, 7, 12, 0);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nowPlayingBundleCount"), 0, 0, 8, 2, 0);
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nowPlayingBundleRecencyS"), 1, 0, 9, 0, 0);
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nowPlayingBundleScore"), 1, 0, 10, 0, 0);
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isNowPlayingLastBundle"), 0, 0, 11, 12, 0);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nowPlayingUsage1Day"), 0, 0, 12, 2, 0);
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nowPlayingUsage7Days"), 0, 0, 13, 2, 0);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nowPlayingUsage14Days"), 0, 0, 14, 2, 0);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRawLastNowPlayingCoreDuet"), 0, 0, 15, 12, 0);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRawMediaCategoryAudiobookSignal"), 0, 0, 16, 12, 0);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRawMediaCategoryMusicSignal"), 0, 0, 17, 12, 0);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRawMediaCategoryPodcastSignal"), 0, 0, 18, 12, 0);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRawMediaCategoryRadioSignal"), 0, 0, 19, 12, 0);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRawMediaCategoryVideoSignal"), 0, 0, 20, 12, 0);
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawMediaTypeUsageSignalBook"), 0, 0, 21, 2, 0);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawMediaTypeUsageSignalMusic"), 0, 0, 22, 2, 0);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawMediaTypeUsageSignalPodcast"), 0, 0, 23, 2, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawMediaTypeUsageSignalVideo"), 0, 0, 24, 2, 0);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawNowPlayingCountCoreDuet10Min"), 0, 0, 25, 2, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawNowPlayingCountCoreDuet1Day"), 0, 0, 26, 2, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawNowPlayingCountCoreDuet1Hr"), 0, 0, 27, 2, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawNowPlayingCountCoreDuet28Day"), 0, 0, 28, 2, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawNowPlayingCountCoreDuet2Min"), 0, 0, 29, 2, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawNowPlayingCountCoreDuet6Hr"), 0, 0, 30, 2, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawNowPlayingCountCoreDuet7Day"), 0, 0, 31, 2, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawNowPlayingRecencyCD"), 0, 0, 32, 2, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawEntitySearchRecency"), 0, 0, 33, 2, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("usageScoreBooks"), 1, 0, 34, 0, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("usageScoreMusic"), 1, 0, 35, 0, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("usageScorePodcasts"), 1, 0, 36, 0, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isAppFirstParty"), 0, 0, 37, 12, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRequestedApp"), 0, 0, 38, 12, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isNowPlayingBundlePSE1"), 0, 0, 39, 12, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isNowPlayingBundlePSE2"), 0, 0, 40, 12, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("vq21Score"), 1, 0, 41, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isSupportedFlag"), 0, 0, 42, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isUnicornFlag"), 0, 0, 43, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isSupportedUnicornMatchFlag"), 0, 0, 44, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isDisambiguationSelectedApp"), 0, 0, 45, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isModelPredictedApp"), 0, 0, 46, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("usageScoreRadio"), 1, 0, 47, 0, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("usageScoreMusicWithoutRadio"), 1, 0, 48, 0, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawMediaTypeUsageSignalRadio"), 0, 0, 49, 2, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawMediaTypeUsageSignalMusicWithoutRadio"), 0, 0, 50, 2, 0);
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
  return &unk_1E5F1B8F8;
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
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isClientForegroundActiveBundle"), 1, 12, 0);
  v54[0] = v53;
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("compoundActiveBundleScore"), 2, 0, 0);
  v54[1] = v52;
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("compoundMediaTypeBundleScore"), 3, 0, 0);
  v54[2] = v51;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("entitySearchBundleRecencyS"), 4, 0, 0);
  v54[3] = v50;
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("entitySearchBundleScore"), 5, 0, 0);
  v54[4] = v49;
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isForegroundBundle"), 6, 12, 0);
  v54[5] = v48;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isNowPlayingBundle"), 7, 12, 0);
  v54[6] = v47;
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nowPlayingBundleCount"), 8, 2, 0);
  v54[7] = v46;
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nowPlayingBundleRecencyS"), 9, 0, 0);
  v54[8] = v45;
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nowPlayingBundleScore"), 10, 0, 0);
  v54[9] = v44;
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isNowPlayingLastBundle"), 11, 12, 0);
  v54[10] = v43;
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nowPlayingUsage1Day"), 12, 2, 0);
  v54[11] = v42;
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nowPlayingUsage7Days"), 13, 2, 0);
  v54[12] = v41;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nowPlayingUsage14Days"), 14, 2, 0);
  v54[13] = v40;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRawLastNowPlayingCoreDuet"), 15, 12, 0);
  v54[14] = v39;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRawMediaCategoryAudiobookSignal"), 16, 12, 0);
  v54[15] = v38;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRawMediaCategoryMusicSignal"), 17, 12, 0);
  v54[16] = v37;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRawMediaCategoryPodcastSignal"), 18, 12, 0);
  v54[17] = v36;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRawMediaCategoryRadioSignal"), 19, 12, 0);
  v54[18] = v35;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRawMediaCategoryVideoSignal"), 20, 12, 0);
  v54[19] = v34;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawMediaTypeUsageSignalBook"), 21, 2, 0);
  v54[20] = v33;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawMediaTypeUsageSignalMusic"), 22, 2, 0);
  v54[21] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawMediaTypeUsageSignalPodcast"), 23, 2, 0);
  v54[22] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawMediaTypeUsageSignalVideo"), 24, 2, 0);
  v54[23] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawNowPlayingCountCoreDuet10Min"), 25, 2, 0);
  v54[24] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawNowPlayingCountCoreDuet1Day"), 26, 2, 0);
  v54[25] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawNowPlayingCountCoreDuet1Hr"), 27, 2, 0);
  v54[26] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawNowPlayingCountCoreDuet28Day"), 28, 2, 0);
  v54[27] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawNowPlayingCountCoreDuet2Min"), 29, 2, 0);
  v54[28] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawNowPlayingCountCoreDuet6Hr"), 30, 2, 0);
  v54[29] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawNowPlayingCountCoreDuet7Day"), 31, 2, 0);
  v54[30] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawNowPlayingRecencyCD"), 32, 2, 0);
  v54[31] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawEntitySearchRecency"), 33, 2, 0);
  v54[32] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("usageScoreBooks"), 34, 0, 0);
  v54[33] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("usageScoreMusic"), 35, 0, 0);
  v54[34] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("usageScorePodcasts"), 36, 0, 0);
  v54[35] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isAppFirstParty"), 37, 12, 0);
  v54[36] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRequestedApp"), 38, 12, 0);
  v54[37] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isNowPlayingBundlePSE1"), 39, 12, 0);
  v54[38] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isNowPlayingBundlePSE2"), 40, 12, 0);
  v54[39] = v14;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("vq21Score"), 41, 0, 0);
  v54[40] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isSupportedFlag"), 42, 12, 0);
  v54[41] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isUnicornFlag"), 43, 12, 0);
  v54[42] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isSupportedUnicornMatchFlag"), 44, 12, 0);
  v54[43] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isDisambiguationSelectedApp"), 45, 12, 0);
  v54[44] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isModelPredictedApp"), 46, 12, 0);
  v54[45] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("usageScoreRadio"), 47, 0, 0);
  v54[46] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("usageScoreMusicWithoutRadio"), 48, 0, 0);
  v54[47] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawMediaTypeUsageSignalRadio"), 49, 2, 0);
  v54[48] = v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawMediaTypeUsageSignalMusicWithoutRadio"), 50, 2, 0);
  v54[49] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 50);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BMSiriMusicInferenceTrainingDependentSignals)initWithIsClientForegroundActiveBundle:(id)a3 compoundActiveBundleScore:(id)a4 compoundMediaTypeBundleScore:(id)a5 entitySearchBundleRecencyS:(id)a6 entitySearchBundleScore:(id)a7 isForegroundBundle:(id)a8 isNowPlayingBundle:(id)a9 nowPlayingBundleCount:(id)a10 nowPlayingBundleRecencyS:(id)a11 nowPlayingBundleScore:(id)a12 isNowPlayingLastBundle:(id)a13 nowPlayingUsage1Day:(id)a14 nowPlayingUsage7Days:(id)a15 nowPlayingUsage14Days:(id)a16 isRawLastNowPlayingCoreDuet:(id)a17 isRawMediaCategoryAudiobookSignal:(id)a18 isRawMediaCategoryMusicSignal:(id)a19 isRawMediaCategoryPodcastSignal:(id)a20 isRawMediaCategoryRadioSignal:(id)a21 isRawMediaCategoryVideoSignal:(id)a22 rawMediaTypeUsageSignalBook:(id)a23 rawMediaTypeUsageSignalMusic:(id)a24 rawMediaTypeUsageSignalPodcast:(id)a25 rawMediaTypeUsageSignalVideo:(id)a26 rawNowPlayingCountCoreDuet10Min:(id)a27 rawNowPlayingCountCoreDuet1Day:(id)a28 rawNowPlayingCountCoreDuet1Hr:(id)a29 rawNowPlayingCountCoreDuet28Day:(id)a30 rawNowPlayingCountCoreDuet2Min:(id)a31 rawNowPlayingCountCoreDuet6Hr:(id)a32 rawNowPlayingCountCoreDuet7Day:(id)a33 rawNowPlayingRecencyCD:(id)a34 rawEntitySearchRecency:(id)a35 usageScoreBooks:(id)a36 usageScoreMusic:(id)a37 usageScorePodcasts:(id)a38 isAppFirstParty:(id)a39 isRequestedApp:(id)a40 isNowPlayingBundlePSE1:(id)a41 isNowPlayingBundlePSE2:(id)a42 vq21Score:(id)a43 isSupportedFlag:(id)a44 isUnicornFlag:(id)a45 isSupportedUnicornMatchFlag:(id)a46 isDisambiguationSelectedApp:(id)a47 isModelPredictedApp:(id)a48
{
  return -[BMSiriMusicInferenceTrainingDependentSignals initWithIsClientForegroundActiveBundle:compoundActiveBundleScore:compoundMediaTypeBundleScore:entitySearchBundleRecencyS:entitySearchBundleScore:isForegroundBundle:isNowPlayingBundle:nowPlayingBundleCount:nowPlayingBundleRecencyS:nowPlayingBundleScore:isNowPlayingLastBundle:nowPlayingUsage1Day:nowPlayingUsage7Days:nowPlayingUsage14Days:isRawLastNowPlayingCoreDuet:isRawMediaCategoryAudiobookSignal:isRawMediaCategoryMusicSignal:isRawMediaCategoryPodcastSignal:isRawMediaCategoryRadioSignal:isRawMediaCategoryVideoSignal:rawMediaTypeUsageSignalBook:rawMediaTypeUsageSignalMusic:rawMediaTypeUsageSignalPodcast:rawMediaTypeUsageSignalVideo:rawNowPlayingCountCoreDuet10Min:rawNowPlayingCountCoreDuet1Day:rawNowPlayingCountCoreDuet1Hr:rawNowPlayingCountCoreDuet28Day:rawNowPlayingCountCoreDuet2Min:rawNowPlayingCountCoreDuet6Hr:rawNowPlayingCountCoreDuet7Day:rawNowPlayingRecencyCD:rawEntitySearchRecency:usageScoreBooks:usageScoreMusic:usageScorePodcasts:isAppFirstParty:isRequestedApp:isNowPlayingBundlePSE1:isNowPlayingBundlePSE2:vq21Score:isSupportedFlag:isUnicornFlag:isSupportedUnicornMatchFlag:isDisambiguationSelectedApp:isModelPredictedApp:usageScoreRadio:usageScoreMusicWithoutRadio:rawMediaTypeUsageSignalRadio:rawMediaTypeUsageSignalMusicWithoutRadio:](self, "initWithIsClientForegroundActiveBundle:compoundActiveBundleScore:compoundMediaTypeBundleScore:entitySearchBundleRecencyS:entitySearchBundleScore:isForegroundBundle:isNowPlayingBundle:nowPlayingBundleCount:nowPlayingBundleRecencyS:nowPlayingBundleScore:isNowPlayingLastBundle:nowPlayingUsage1Day:nowPlayingUsage7Days:nowPlayingUsage14Days:isRawLastNowPlayingCoreDuet:isRawMediaCategoryAudiobookSignal:isRawMediaCategoryMusicSignal:isRawMediaCategoryPodcastSignal:isRawMediaCategoryRadioSignal:isRawMediaCategoryVideoSignal:rawMediaTypeUsageSignalBook:rawMediaTypeUsageSignalMusic:rawMediaTypeUsageSignalPodcast:rawMediaTypeUsageSignalVideo:rawNowPlayingCountCoreDuet10Min:rawNowPlayingCountCoreDuet1Day:rawNowPlayingCountCoreDuet1Hr:rawNowPlayingCountCoreDuet28Day:rawNowPlayingCountCoreDuet2Min:rawNowPlayingCountCoreDuet6Hr:rawNowPlayingCountCoreDuet7Day:rawNowPlayingRecencyCD:rawEntitySearchRecency:usageScoreBooks:usageScoreMusic:usageScorePodcasts:isAppFirstParty:isRequestedApp:isNowPlayingBundlePSE1:isNowPlayingBundlePSE2:vq21Score:isSupportedFlag:isUnicornFlag:isSupportedUnicornMatchFlag:isDisambiguationSelectedApp:isModelPredictedApp:usageScoreRadio:usageScoreMusicWithoutRadio:rawMediaTypeUsageSignalRadio:rawMediaTypeUsageSignalMusicWithoutRadio:", a3, a4, a5, a6, a7, a8,
           a9,
           a10,
           a11,
           a12,
           a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           0,
           0,
           0,
           0);
}

@end
