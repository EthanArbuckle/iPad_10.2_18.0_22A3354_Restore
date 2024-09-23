@implementation BMSiriMusicInferenceTrainingIndependentSignals

- (BMSiriMusicInferenceTrainingIndependentSignals)initWithClientDayOfWeek:(id)a3 rawClientHourOfDay:(id)a4 isMediaAlbumPresent:(id)a5 isMediaArtistPresent:(id)a6 isMediaGenrePresent:(id)a7 isMediaMoodPresent:(id)a8 isMediaNamePresent:(id)a9 isMediaReleaseDatePresent:(id)a10 nowPlayingLastBundleRecencyS:(id)a11 rawLanguage:(id)a12 rawLocale:(id)a13 rawRegion:(id)a14 isClientDaylight:(id)a15 isClientNavigating:(id)a16 isClientWorkout:(id)a17 mediaType:(id)a18 nowPlayingState:(id)a19 isPireneRequest:(id)a20 foregroundBundleRecencyS:(id)a21 mediaParsecCategory:(id)a22 sirikitResponseCode:(id)a23 appSelectionUses:(id)a24 modelVersion:(id)a25 resolutionType:(int)a26
{
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  BMSiriMusicInferenceTrainingIndependentSignals *v41;
  int v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  double v50;
  int v51;
  int v52;
  int v53;
  unsigned int v54;
  id v57;
  id v58;
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
  id v70;
  objc_super v71;

  v70 = a3;
  v69 = a4;
  v31 = a5;
  v68 = a6;
  v67 = a7;
  v66 = a8;
  v65 = a9;
  v64 = a10;
  v32 = a11;
  v33 = v31;
  v63 = a12;
  v62 = a13;
  v61 = a14;
  v60 = a15;
  v59 = a16;
  v58 = a17;
  v57 = a18;
  v34 = a19;
  v35 = a20;
  v36 = a21;
  v37 = a22;
  v38 = a23;
  v39 = a24;
  v40 = a25;
  v71.receiver = self;
  v71.super_class = (Class)BMSiriMusicInferenceTrainingIndependentSignals;
  v41 = -[BMEventBase init](&v71, sel_init);
  if (v41)
  {
    v41->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v70)
    {
      v41->_hasClientDayOfWeek = 1;
      v42 = objc_msgSend(v70, "intValue");
    }
    else
    {
      v41->_hasClientDayOfWeek = 0;
      v42 = -1;
    }
    v41->_clientDayOfWeek = v42;
    if (v69)
    {
      v41->_hasRawClientHourOfDay = 1;
      v43 = objc_msgSend(v69, "intValue");
    }
    else
    {
      v41->_hasRawClientHourOfDay = 0;
      v43 = -1;
    }
    v41->_rawClientHourOfDay = v43;
    if (v33)
    {
      v41->_hasIsMediaAlbumPresent = 1;
      v41->_isMediaAlbumPresent = objc_msgSend(v33, "BOOLValue");
    }
    else
    {
      v41->_hasIsMediaAlbumPresent = 0;
      v41->_isMediaAlbumPresent = 0;
    }
    if (v68)
    {
      v41->_hasIsMediaArtistPresent = 1;
      v41->_isMediaArtistPresent = objc_msgSend(v68, "BOOLValue");
    }
    else
    {
      v41->_hasIsMediaArtistPresent = 0;
      v41->_isMediaArtistPresent = 0;
    }
    if (v67)
    {
      v41->_hasIsMediaGenrePresent = 1;
      v41->_isMediaGenrePresent = objc_msgSend(v67, "BOOLValue");
    }
    else
    {
      v41->_hasIsMediaGenrePresent = 0;
      v41->_isMediaGenrePresent = 0;
    }
    if (v66)
    {
      v41->_hasIsMediaMoodPresent = 1;
      v41->_isMediaMoodPresent = objc_msgSend(v66, "BOOLValue");
    }
    else
    {
      v41->_hasIsMediaMoodPresent = 0;
      v41->_isMediaMoodPresent = 0;
    }
    if (v65)
    {
      v41->_hasIsMediaNamePresent = 1;
      v41->_isMediaNamePresent = objc_msgSend(v65, "BOOLValue");
    }
    else
    {
      v41->_hasIsMediaNamePresent = 0;
      v41->_isMediaNamePresent = 0;
    }
    if (v64)
    {
      v41->_hasIsMediaReleaseDatePresent = 1;
      v41->_isMediaReleaseDatePresent = objc_msgSend(v64, "BOOLValue");
    }
    else
    {
      v41->_hasIsMediaReleaseDatePresent = 0;
      v41->_isMediaReleaseDatePresent = 0;
    }
    if (v32)
    {
      v41->_hasNowPlayingLastBundleRecencyS = 1;
      v44 = objc_msgSend(v32, "intValue");
    }
    else
    {
      v41->_hasNowPlayingLastBundleRecencyS = 0;
      v44 = -1;
    }
    v41->_nowPlayingLastBundleRecencyS = v44;
    if (v63)
    {
      v41->_hasRawLanguage = 1;
      v45 = objc_msgSend(v63, "longLongValue");
    }
    else
    {
      v41->_hasRawLanguage = 0;
      v45 = -1;
    }
    v41->_rawLanguage = v45;
    if (v62)
    {
      v41->_hasRawLocale = 1;
      v46 = objc_msgSend(v62, "longLongValue");
    }
    else
    {
      v41->_hasRawLocale = 0;
      v46 = -1;
    }
    v41->_rawLocale = v46;
    if (v61)
    {
      v41->_hasRawRegion = 1;
      v47 = objc_msgSend(v61, "longLongValue");
    }
    else
    {
      v41->_hasRawRegion = 0;
      v47 = -1;
    }
    v41->_rawRegion = v47;
    if (v60)
    {
      v41->_hasIsClientDaylight = 1;
      v41->_isClientDaylight = objc_msgSend(v60, "BOOLValue");
    }
    else
    {
      v41->_hasIsClientDaylight = 0;
      v41->_isClientDaylight = 0;
    }
    if (v59)
    {
      v41->_hasIsClientNavigating = 1;
      v41->_isClientNavigating = objc_msgSend(v59, "BOOLValue");
    }
    else
    {
      v41->_hasIsClientNavigating = 0;
      v41->_isClientNavigating = 0;
    }
    if (v58)
    {
      v41->_hasIsClientWorkout = 1;
      v41->_isClientWorkout = objc_msgSend(v58, "BOOLValue");
    }
    else
    {
      v41->_hasIsClientWorkout = 0;
      v41->_isClientWorkout = 0;
    }
    if (v57)
    {
      v41->_hasMediaType = 1;
      v48 = objc_msgSend(v57, "intValue");
    }
    else
    {
      v41->_hasMediaType = 0;
      v48 = -1;
    }
    v41->_mediaType = v48;
    if (v34)
    {
      v41->_hasNowPlayingState = 1;
      v49 = objc_msgSend(v34, "intValue");
    }
    else
    {
      v41->_hasNowPlayingState = 0;
      v49 = -1;
    }
    v41->_nowPlayingState = v49;
    if (v35)
    {
      v41->_hasIsPireneRequest = 1;
      v41->_isPireneRequest = objc_msgSend(v35, "BOOLValue");
    }
    else
    {
      v41->_hasIsPireneRequest = 0;
      v41->_isPireneRequest = 0;
    }
    if (v36)
    {
      v41->_hasForegroundBundleRecencyS = 1;
      objc_msgSend(v36, "doubleValue");
    }
    else
    {
      v41->_hasForegroundBundleRecencyS = 0;
      v50 = -1.0;
    }
    v41->_foregroundBundleRecencyS = v50;
    if (v37)
    {
      v41->_hasMediaParsecCategory = 1;
      v51 = objc_msgSend(v37, "intValue");
    }
    else
    {
      v41->_hasMediaParsecCategory = 0;
      v51 = -1;
    }
    v41->_mediaParsecCategory = v51;
    if (v38)
    {
      v41->_hasSirikitResponseCode = 1;
      v52 = objc_msgSend(v38, "intValue");
    }
    else
    {
      v41->_hasSirikitResponseCode = 0;
      v52 = -1;
    }
    v41->_sirikitResponseCode = v52;
    if (v39)
    {
      v41->_hasAppSelectionUses = 1;
      v53 = objc_msgSend(v39, "intValue");
    }
    else
    {
      v41->_hasAppSelectionUses = 0;
      v53 = -1;
    }
    v41->_appSelectionUses = v53;
    if (v40)
    {
      v41->_hasModelVersion = 1;
      v54 = objc_msgSend(v40, "unsignedIntValue");
    }
    else
    {
      v54 = 0;
      v41->_hasModelVersion = 0;
    }
    v41->_modelVersion = v54;
    v41->_resolutionType = a26;
  }

  return v41;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  id v20;
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

  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals clientDayOfWeek](self, "clientDayOfWeek"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals rawClientHourOfDay](self, "rawClientHourOfDay"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaAlbumPresent](self, "isMediaAlbumPresent"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaArtistPresent](self, "isMediaArtistPresent"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaGenrePresent](self, "isMediaGenrePresent"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaMoodPresent](self, "isMediaMoodPresent"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaNamePresent](self, "isMediaNamePresent"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaReleaseDatePresent](self, "isMediaReleaseDatePresent"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals nowPlayingLastBundleRecencyS](self, "nowPlayingLastBundleRecencyS"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSiriMusicInferenceTrainingIndependentSignals rawLanguage](self, "rawLanguage"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSiriMusicInferenceTrainingIndependentSignals rawLocale](self, "rawLocale"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSiriMusicInferenceTrainingIndependentSignals rawRegion](self, "rawRegion"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isClientDaylight](self, "isClientDaylight"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isClientNavigating](self, "isClientNavigating"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isClientWorkout](self, "isClientWorkout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals mediaType](self, "mediaType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals nowPlayingState](self, "nowPlayingState"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isPireneRequest](self, "isPireneRequest"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriMusicInferenceTrainingIndependentSignals foregroundBundleRecencyS](self, "foregroundBundleRecencyS");
  objc_msgSend(v3, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals mediaParsecCategory](self, "mediaParsecCategory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals sirikitResponseCode](self, "sirikitResponseCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals appSelectionUses](self, "appSelectionUses"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriMusicInferenceTrainingIndependentSignals modelVersion](self, "modelVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMSiriMusicInferenceTrainingIndependentSignalsInferenceAppResolutionTypeAsString(-[BMSiriMusicInferenceTrainingIndependentSignals resolutionType](self, "resolutionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("BMSiriMusicInferenceTrainingIndependentSignals with clientDayOfWeek: %@, rawClientHourOfDay: %@, isMediaAlbumPresent: %@, isMediaArtistPresent: %@, isMediaGenrePresent: %@, isMediaMoodPresent: %@, isMediaNamePresent: %@, isMediaReleaseDatePresent: %@, nowPlayingLastBundleRecencyS: %@, rawLanguage: %@, rawLocale: %@, rawRegion: %@, isClientDaylight: %@, isClientNavigating: %@, isClientWorkout: %@, mediaType: %@, nowPlayingState: %@, isPireneRequest: %@, foregroundBundleRecencyS: %@, mediaParsecCategory: %@, sirikitResponseCode: %@, appSelectionUses: %@, modelVersion: %@, resolutionType: %@"), v30, v28, v29, v27, v25, v26, v24, v19, v18, v23, v17, v16, v15, v22, v13, v12,
                  v14,
                  v11,
                  v10,
                  v9,
                  v4,
                  v5,
                  v6,
                  v7);

  return (NSString *)v21;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriMusicInferenceTrainingIndependentSignals *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  int *v13;
  int *v14;
  int *v15;
  int *v16;
  int *v17;
  int *v18;
  int *v19;
  int *v20;
  int *v21;
  char v22;
  unsigned int v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  BOOL v29;
  int v30;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  int *v39;
  int *v40;
  int *v41;
  int *v42;
  int *v43;
  int *v44;
  int v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  char v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  char v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  char v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  char v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char v93;
  char v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char v99;
  char v100;
  unsigned int v101;
  objc_class *v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  char v106;
  char v107;
  unsigned int v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  char v112;
  char v113;
  unsigned int v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char v118;
  char v119;
  unsigned int v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  char v125;
  char v126;
  unsigned int v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  char v132;
  char v133;
  unsigned int v134;
  uint64_t v135;
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
  uint64_t v156;
  unint64_t v157;
  char v158;
  uint64_t v159;
  unint64_t v160;
  double v161;
  char v162;
  unsigned int v163;
  uint64_t v164;
  uint64_t v165;
  unint64_t v166;
  char v167;
  char v168;
  unsigned int v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  char v173;
  char v174;
  unsigned int v175;
  uint64_t v176;
  uint64_t v177;
  unint64_t v178;
  char v179;
  char v180;
  unsigned int v181;
  uint64_t v182;
  uint64_t v183;
  unint64_t v184;
  char v185;
  char v186;
  unsigned int v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  unint64_t v191;
  char v192;
  uint64_t v193;
  BOOL v194;
  uint64_t v195;
  uint64_t v196;
  BMSiriMusicInferenceTrainingIndependentSignals *v197;
  BMSiriMusicInferenceTrainingIndependentSignals *v199;
  objc_super v200;

  v4 = a3;
  v200.receiver = self;
  v200.super_class = (Class)BMSiriMusicInferenceTrainingIndependentSignals;
  v5 = -[BMEventBase init](&v200, sel_init);
  if (!v5)
    goto LABEL_289;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v10 = (int *)MEMORY[0x1E0D82BB8];
    v11 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v12 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v13 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v14 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v15 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v16 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v17 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v18 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v19 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v20 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v21 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    do
    {
      if (v4[*v8])
        break;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      while (1)
      {
        v25 = *v6;
        v26 = *(_QWORD *)&v4[v25];
        v27 = v26 + 1;
        if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
          break;
        v28 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v26);
        *(_QWORD *)&v4[v25] = v27;
        v24 |= (unint64_t)(v28 & 0x7F) << v22;
        if ((v28 & 0x80) == 0)
          goto LABEL_13;
        v22 += 7;
        v29 = v23++ >= 9;
        if (v29)
        {
          v24 = 0;
          v30 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v30 = v4[*v8];
      if (v4[*v8])
        v24 = 0;
LABEL_15:
      if (v30 || (v24 & 7) == 4)
        break;
      switch((v24 >> 3))
      {
        case 1u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *((_BYTE *)&v5->super.super.isa + v9[808]) = 1;
          while (1)
          {
            v35 = *v6;
            v36 = *(_QWORD *)&v4[v35];
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)&v4[*v7])
              break;
            v38 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v36);
            *(_QWORD *)&v4[v35] = v37;
            v34 |= (unint64_t)(v38 & 0x7F) << v32;
            if ((v38 & 0x80) == 0)
              goto LABEL_187;
            v32 += 7;
            v29 = v33++ >= 9;
            if (v29)
            {
              LODWORD(v34) = 0;
              goto LABEL_189;
            }
          }
          v4[*v8] = 1;
LABEL_187:
          if (v4[*v8])
            LODWORD(v34) = 0;
LABEL_189:
          v193 = v11[809];
          goto LABEL_276;
        case 2u:
          v46 = 0;
          v47 = 0;
          v34 = 0;
          *((_BYTE *)&v5->super.super.isa + v12[810]) = 1;
          while (2)
          {
            v48 = *v6;
            v49 = *(_QWORD *)&v4[v48];
            v50 = v49 + 1;
            if (v49 == -1 || v50 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v51 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v49);
              *(_QWORD *)&v4[v48] = v50;
              v34 |= (unint64_t)(v51 & 0x7F) << v46;
              if (v51 < 0)
              {
                v46 += 7;
                v29 = v47++ >= 9;
                if (v29)
                {
                  LODWORD(v34) = 0;
                  goto LABEL_193;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v34) = 0;
LABEL_193:
          v193 = v13[811];
          goto LABEL_276;
        case 3u:
          v52 = 0;
          v53 = 0;
          v54 = 0;
          *((_BYTE *)&v5->super.super.isa + v14[812]) = 1;
          while (2)
          {
            v55 = *v6;
            v56 = *(_QWORD *)&v4[v55];
            v57 = v56 + 1;
            if (v56 == -1 || v57 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v58 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v56);
              *(_QWORD *)&v4[v55] = v57;
              v54 |= (unint64_t)(v58 & 0x7F) << v52;
              if (v58 < 0)
              {
                v52 += 7;
                v29 = v53++ >= 9;
                if (v29)
                {
                  v54 = 0;
                  goto LABEL_197;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v54 = 0;
LABEL_197:
          v194 = v54 != 0;
          v195 = v15[813];
          goto LABEL_259;
        case 4u:
          v59 = 0;
          v60 = 0;
          v61 = 0;
          *((_BYTE *)&v5->super.super.isa + v16[814]) = 1;
          while (2)
          {
            v62 = *v6;
            v63 = *(_QWORD *)&v4[v62];
            v64 = v63 + 1;
            if (v63 == -1 || v64 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v65 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v63);
              *(_QWORD *)&v4[v62] = v64;
              v61 |= (unint64_t)(v65 & 0x7F) << v59;
              if (v65 < 0)
              {
                v59 += 7;
                v29 = v60++ >= 9;
                if (v29)
                {
                  v61 = 0;
                  goto LABEL_201;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v61 = 0;
LABEL_201:
          v194 = v61 != 0;
          v195 = v17[815];
          goto LABEL_259;
        case 5u:
          v66 = 0;
          v67 = 0;
          v68 = 0;
          *((_BYTE *)&v5->super.super.isa + v18[816]) = 1;
          while (2)
          {
            v69 = *v6;
            v70 = *(_QWORD *)&v4[v69];
            v71 = v70 + 1;
            if (v70 == -1 || v71 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v72 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v70);
              *(_QWORD *)&v4[v69] = v71;
              v68 |= (unint64_t)(v72 & 0x7F) << v66;
              if (v72 < 0)
              {
                v66 += 7;
                v29 = v67++ >= 9;
                if (v29)
                {
                  v68 = 0;
                  goto LABEL_205;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v68 = 0;
LABEL_205:
          v194 = v68 != 0;
          v195 = v19[817];
          goto LABEL_259;
        case 6u:
          v73 = 0;
          v74 = 0;
          v75 = 0;
          *((_BYTE *)&v5->super.super.isa + v20[818]) = 1;
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
              v79 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v77);
              *(_QWORD *)&v4[v76] = v78;
              v75 |= (unint64_t)(v79 & 0x7F) << v73;
              if (v79 < 0)
              {
                v73 += 7;
                v29 = v74++ >= 9;
                if (v29)
                {
                  v75 = 0;
                  goto LABEL_209;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v75 = 0;
LABEL_209:
          v194 = v75 != 0;
          v195 = v21[819];
          goto LABEL_259;
        case 7u:
          v80 = 0;
          v81 = 0;
          v82 = 0;
          v5->_hasIsMediaNamePresent = 1;
          while (2)
          {
            v83 = *v6;
            v84 = *(_QWORD *)&v4[v83];
            v85 = v84 + 1;
            if (v84 == -1 || v85 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v86 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v84);
              *(_QWORD *)&v4[v83] = v85;
              v82 |= (unint64_t)(v86 & 0x7F) << v80;
              if (v86 < 0)
              {
                v80 += 7;
                v29 = v81++ >= 9;
                if (v29)
                {
                  v82 = 0;
                  goto LABEL_213;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v82 = 0;
LABEL_213:
          v194 = v82 != 0;
          v195 = 26;
          goto LABEL_259;
        case 8u:
          v87 = 0;
          v88 = 0;
          v89 = 0;
          v5->_hasIsMediaReleaseDatePresent = 1;
          while (2)
          {
            v90 = *v6;
            v91 = *(_QWORD *)&v4[v90];
            v92 = v91 + 1;
            if (v91 == -1 || v92 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v93 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v91);
              *(_QWORD *)&v4[v90] = v92;
              v89 |= (unint64_t)(v93 & 0x7F) << v87;
              if (v93 < 0)
              {
                v87 += 7;
                v29 = v88++ >= 9;
                if (v29)
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
          v194 = v89 != 0;
          v195 = 28;
          goto LABEL_259;
        case 9u:
          v94 = 0;
          v95 = 0;
          v34 = 0;
          v5->_hasNowPlayingLastBundleRecencyS = 1;
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
              v99 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v97);
              *(_QWORD *)&v4[v96] = v98;
              v34 |= (unint64_t)(v99 & 0x7F) << v94;
              if (v99 < 0)
              {
                v94 += 7;
                v29 = v95++ >= 9;
                if (v29)
                {
                  LODWORD(v34) = 0;
                  goto LABEL_221;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v34) = 0;
LABEL_221:
          v193 = 64;
          goto LABEL_276;
        case 0xAu:
          v100 = 0;
          v101 = 0;
          v102 = 0;
          v5->_hasRawLanguage = 1;
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
              v106 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v104);
              *(_QWORD *)&v4[v103] = v105;
              v102 = (objc_class *)(((unint64_t)(v106 & 0x7F) << v100) | (unint64_t)v102);
              if (v106 < 0)
              {
                v100 += 7;
                v29 = v101++ >= 9;
                if (v29)
                {
                  v102 = 0;
                  goto LABEL_225;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v102 = 0;
LABEL_225:
          v196 = 96;
          goto LABEL_234;
        case 0xBu:
          v107 = 0;
          v108 = 0;
          v102 = 0;
          v5->_hasRawLocale = 1;
          while (2)
          {
            v109 = *v6;
            v110 = *(_QWORD *)&v4[v109];
            v111 = v110 + 1;
            if (v110 == -1 || v111 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v112 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v110);
              *(_QWORD *)&v4[v109] = v111;
              v102 = (objc_class *)(((unint64_t)(v112 & 0x7F) << v107) | (unint64_t)v102);
              if (v112 < 0)
              {
                v107 += 7;
                v29 = v108++ >= 9;
                if (v29)
                {
                  v102 = 0;
                  goto LABEL_229;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v102 = 0;
LABEL_229:
          v196 = 104;
          goto LABEL_234;
        case 0xCu:
          v113 = 0;
          v114 = 0;
          v102 = 0;
          v5->_hasRawRegion = 1;
          while (2)
          {
            v115 = *v6;
            v116 = *(_QWORD *)&v4[v115];
            v117 = v116 + 1;
            if (v116 == -1 || v117 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v118 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v116);
              *(_QWORD *)&v4[v115] = v117;
              v102 = (objc_class *)(((unint64_t)(v118 & 0x7F) << v113) | (unint64_t)v102);
              if (v118 < 0)
              {
                v113 += 7;
                v29 = v114++ >= 9;
                if (v29)
                {
                  v102 = 0;
                  goto LABEL_233;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v102 = 0;
LABEL_233:
          v196 = 112;
LABEL_234:
          *(Class *)((char *)&v5->super.super.isa + v196) = v102;
          continue;
        case 0xDu:
          v119 = 0;
          v120 = 0;
          v121 = 0;
          v5->_hasIsClientDaylight = 1;
          while (2)
          {
            v122 = *v6;
            v123 = *(_QWORD *)&v4[v122];
            v124 = v123 + 1;
            if (v123 == -1 || v124 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v125 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v123);
              *(_QWORD *)&v4[v122] = v124;
              v121 |= (unint64_t)(v125 & 0x7F) << v119;
              if (v125 < 0)
              {
                v119 += 7;
                v29 = v120++ >= 9;
                if (v29)
                {
                  v121 = 0;
                  goto LABEL_238;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v121 = 0;
LABEL_238:
          v194 = v121 != 0;
          v195 = 34;
          goto LABEL_259;
        case 0xEu:
          v126 = 0;
          v127 = 0;
          v128 = 0;
          v5->_hasIsClientNavigating = 1;
          while (2)
          {
            v129 = *v6;
            v130 = *(_QWORD *)&v4[v129];
            v131 = v130 + 1;
            if (v130 == -1 || v131 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v132 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v130);
              *(_QWORD *)&v4[v129] = v131;
              v128 |= (unint64_t)(v132 & 0x7F) << v126;
              if (v132 < 0)
              {
                v126 += 7;
                v29 = v127++ >= 9;
                if (v29)
                {
                  v128 = 0;
                  goto LABEL_242;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v128 = 0;
LABEL_242:
          v194 = v128 != 0;
          v195 = 36;
          goto LABEL_259;
        case 0xFu:
          v133 = 0;
          v134 = 0;
          v135 = 0;
          v5->_hasIsClientWorkout = 1;
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
              v139 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v137);
              *(_QWORD *)&v4[v136] = v138;
              v135 |= (unint64_t)(v139 & 0x7F) << v133;
              if (v139 < 0)
              {
                v133 += 7;
                v29 = v134++ >= 9;
                if (v29)
                {
                  v135 = 0;
                  goto LABEL_246;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v135 = 0;
LABEL_246:
          v194 = v135 != 0;
          v195 = 38;
          goto LABEL_259;
        case 0x10u:
          v140 = 0;
          v141 = 0;
          v34 = 0;
          v5->_hasMediaType = 1;
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
              v145 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v143);
              *(_QWORD *)&v4[v142] = v144;
              v34 |= (unint64_t)(v145 & 0x7F) << v140;
              if (v145 < 0)
              {
                v140 += 7;
                v29 = v141++ >= 9;
                if (v29)
                {
                  LODWORD(v34) = 0;
                  goto LABEL_250;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v34) = 0;
LABEL_250:
          v193 = 68;
          goto LABEL_276;
        case 0x11u:
          v146 = 0;
          v147 = 0;
          v34 = 0;
          v5->_hasNowPlayingState = 1;
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
              v151 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v149);
              *(_QWORD *)&v4[v148] = v150;
              v34 |= (unint64_t)(v151 & 0x7F) << v146;
              if (v151 < 0)
              {
                v146 += 7;
                v29 = v147++ >= 9;
                if (v29)
                {
                  LODWORD(v34) = 0;
                  goto LABEL_254;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v34) = 0;
LABEL_254:
          v193 = 72;
          goto LABEL_276;
        case 0x12u:
          v152 = 0;
          v153 = 0;
          v154 = 0;
          v5->_hasIsPireneRequest = 1;
          while (2)
          {
            v155 = *v6;
            v156 = *(_QWORD *)&v4[v155];
            v157 = v156 + 1;
            if (v156 == -1 || v157 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v158 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v156);
              *(_QWORD *)&v4[v155] = v157;
              v154 |= (unint64_t)(v158 & 0x7F) << v152;
              if (v158 < 0)
              {
                v152 += 7;
                v29 = v153++ >= 9;
                if (v29)
                {
                  v154 = 0;
                  goto LABEL_258;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v154 = 0;
LABEL_258:
          v194 = v154 != 0;
          v195 = 42;
LABEL_259:
          *((_BYTE *)&v5->super.super.isa + v195) = v194;
          continue;
        case 0x13u:
          v5->_hasForegroundBundleRecencyS = 1;
          v159 = *v6;
          v160 = *(_QWORD *)&v4[v159];
          if (v160 <= 0xFFFFFFFFFFFFFFF7 && v160 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v161 = *(double *)(*(_QWORD *)&v4[*v10] + v160);
            *(_QWORD *)&v4[v159] = v160 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v161 = 0.0;
          }
          v5->_foregroundBundleRecencyS = v161;
          continue;
        case 0x14u:
          v162 = 0;
          v163 = 0;
          v34 = 0;
          v5->_hasMediaParsecCategory = 1;
          while (2)
          {
            v164 = *v6;
            v165 = *(_QWORD *)&v4[v164];
            v166 = v165 + 1;
            if (v165 == -1 || v166 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v167 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v165);
              *(_QWORD *)&v4[v164] = v166;
              v34 |= (unint64_t)(v167 & 0x7F) << v162;
              if (v167 < 0)
              {
                v162 += 7;
                v29 = v163++ >= 9;
                if (v29)
                {
                  LODWORD(v34) = 0;
                  goto LABEL_263;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v34) = 0;
LABEL_263:
          v193 = 76;
          goto LABEL_276;
        case 0x15u:
          v168 = 0;
          v169 = 0;
          v34 = 0;
          v5->_hasSirikitResponseCode = 1;
          while (2)
          {
            v170 = *v6;
            v171 = *(_QWORD *)&v4[v170];
            v172 = v171 + 1;
            if (v171 == -1 || v172 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v173 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v171);
              *(_QWORD *)&v4[v170] = v172;
              v34 |= (unint64_t)(v173 & 0x7F) << v168;
              if (v173 < 0)
              {
                v168 += 7;
                v29 = v169++ >= 9;
                if (v29)
                {
                  LODWORD(v34) = 0;
                  goto LABEL_267;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v34) = 0;
LABEL_267:
          v193 = 80;
          goto LABEL_276;
        case 0x16u:
          v174 = 0;
          v175 = 0;
          v34 = 0;
          v5->_hasAppSelectionUses = 1;
          while (2)
          {
            v176 = *v6;
            v177 = *(_QWORD *)&v4[v176];
            v178 = v177 + 1;
            if (v177 == -1 || v178 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v179 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v177);
              *(_QWORD *)&v4[v176] = v178;
              v34 |= (unint64_t)(v179 & 0x7F) << v174;
              if (v179 < 0)
              {
                v174 += 7;
                v29 = v175++ >= 9;
                if (v29)
                {
                  LODWORD(v34) = 0;
                  goto LABEL_271;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v34) = 0;
LABEL_271:
          v193 = 84;
          goto LABEL_276;
        case 0x17u:
          v180 = 0;
          v181 = 0;
          v34 = 0;
          v5->_hasModelVersion = 1;
          while (2)
          {
            v182 = *v6;
            v183 = *(_QWORD *)&v4[v182];
            v184 = v183 + 1;
            if (v183 == -1 || v184 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v185 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v183);
              *(_QWORD *)&v4[v182] = v184;
              v34 |= (unint64_t)(v185 & 0x7F) << v180;
              if (v185 < 0)
              {
                v180 += 7;
                v29 = v181++ >= 9;
                if (v29)
                {
                  LODWORD(v34) = 0;
                  goto LABEL_275;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v34) = 0;
LABEL_275:
          v193 = 88;
LABEL_276:
          *(_DWORD *)((char *)&v5->super.super.isa + v193) = v34;
          continue;
        case 0x18u:
          v186 = 0;
          v187 = 0;
          v188 = 0;
          break;
        default:
          v39 = v9;
          v40 = v11;
          v41 = v12;
          v42 = v13;
          v43 = v14;
          v199 = v5;
          v44 = v15;
          v45 = PBReaderSkipValueWithTag();
          v21 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
          v15 = v44;
          v8 = (int *)MEMORY[0x1E0D82BC8];
          v5 = v199;
          v14 = v43;
          v16 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
          v13 = v42;
          v17 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
          v12 = v41;
          v20 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
          v11 = v40;
          v19 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
          v9 = v39;
          v18 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
          if (!v45)
            goto LABEL_288;
          continue;
      }
      while (1)
      {
        v189 = *v6;
        v190 = *(_QWORD *)&v4[v189];
        v191 = v190 + 1;
        if (v190 == -1 || v191 > *(_QWORD *)&v4[*v7])
          break;
        v192 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v190);
        *(_QWORD *)&v4[v189] = v191;
        v188 |= (unint64_t)(v192 & 0x7F) << v186;
        if ((v192 & 0x80) == 0)
          goto LABEL_280;
        v186 += 7;
        v29 = v187++ >= 9;
        if (v29)
        {
          LODWORD(v188) = 0;
          goto LABEL_282;
        }
      }
      v4[*v8] = 1;
LABEL_280:
      if (v4[*v8])
        LODWORD(v188) = 0;
LABEL_282:
      if (v188 >= 0xB)
        LODWORD(v188) = 0;
      v5->_resolutionType = v188;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_288:
    v197 = 0;
  else
LABEL_289:
    v197 = v5;

  return v197;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasClientDayOfWeek)
    PBDataWriterWriteInt32Field();
  if (self->_hasRawClientHourOfDay)
    PBDataWriterWriteInt32Field();
  if (self->_hasIsMediaAlbumPresent)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsMediaArtistPresent)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsMediaGenrePresent)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsMediaMoodPresent)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsMediaNamePresent)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsMediaReleaseDatePresent)
    PBDataWriterWriteBOOLField();
  if (self->_hasNowPlayingLastBundleRecencyS)
    PBDataWriterWriteInt32Field();
  if (self->_hasRawLanguage)
    PBDataWriterWriteInt64Field();
  if (self->_hasRawLocale)
    PBDataWriterWriteInt64Field();
  if (self->_hasRawRegion)
    PBDataWriterWriteInt64Field();
  if (self->_hasIsClientDaylight)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsClientNavigating)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsClientWorkout)
    PBDataWriterWriteBOOLField();
  if (self->_hasMediaType)
    PBDataWriterWriteInt32Field();
  if (self->_hasNowPlayingState)
    PBDataWriterWriteInt32Field();
  if (self->_hasIsPireneRequest)
    PBDataWriterWriteBOOLField();
  if (self->_hasForegroundBundleRecencyS)
    PBDataWriterWriteDoubleField();
  if (self->_hasMediaParsecCategory)
    PBDataWriterWriteInt32Field();
  if (self->_hasSirikitResponseCode)
    PBDataWriterWriteInt32Field();
  if (self->_hasAppSelectionUses)
    PBDataWriterWriteInt32Field();
  if (self->_hasModelVersion)
    PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriMusicInferenceTrainingIndependentSignals writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriMusicInferenceTrainingIndependentSignals)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
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
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  id v55;
  BMSiriMusicInferenceTrainingIndependentSignals *v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  void *v69;
  id v70;
  id v71;
  BMSiriMusicInferenceTrainingIndependentSignals *v72;
  id v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  uint64_t v79;
  void *v80;
  id v81;
  id v82;
  BMSiriMusicInferenceTrainingIndependentSignals *v83;
  id v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  void *v90;
  id v91;
  id v92;
  BMSiriMusicInferenceTrainingIndependentSignals *v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  BMSiriMusicInferenceTrainingIndependentSignals *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  void *v106;
  id v107;
  id v108;
  BMSiriMusicInferenceTrainingIndependentSignals *v109;
  id v110;
  void *v111;
  id v112;
  uint64_t v113;
  void *v114;
  id v115;
  id v116;
  BMSiriMusicInferenceTrainingIndependentSignals *v117;
  id v118;
  void *v119;
  id v120;
  uint64_t v121;
  void *v122;
  id v123;
  id v124;
  BMSiriMusicInferenceTrainingIndependentSignals *v125;
  id v126;
  void *v127;
  id v128;
  uint64_t v129;
  void *v130;
  id v131;
  id v132;
  BMSiriMusicInferenceTrainingIndependentSignals *v133;
  id v134;
  void *v135;
  id v136;
  uint64_t v137;
  void *v138;
  id v139;
  id v140;
  BMSiriMusicInferenceTrainingIndependentSignals *v141;
  id v142;
  void *v143;
  id v144;
  uint64_t v145;
  void *v146;
  id v147;
  id v148;
  BMSiriMusicInferenceTrainingIndependentSignals *v149;
  id v150;
  void *v151;
  id v152;
  uint64_t v153;
  void *v154;
  id v155;
  id v156;
  BMSiriMusicInferenceTrainingIndependentSignals *v157;
  id v158;
  void *v159;
  id v160;
  uint64_t v161;
  void *v162;
  id v163;
  id v164;
  BMSiriMusicInferenceTrainingIndependentSignals *v165;
  id v166;
  void *v167;
  id v168;
  uint64_t v169;
  void *v170;
  id v171;
  id v172;
  BMSiriMusicInferenceTrainingIndependentSignals *v173;
  id v174;
  void *v175;
  id v176;
  uint64_t v177;
  void *v178;
  id v179;
  id v180;
  BMSiriMusicInferenceTrainingIndependentSignals *v181;
  id v182;
  void *v183;
  id v184;
  uint64_t v185;
  void *v186;
  id v187;
  id v188;
  BMSiriMusicInferenceTrainingIndependentSignals *v189;
  id v190;
  void *v191;
  id v192;
  uint64_t v193;
  void *v194;
  id v195;
  id v196;
  BMSiriMusicInferenceTrainingIndependentSignals *v197;
  id v198;
  void *v199;
  id v200;
  uint64_t v201;
  void *v202;
  id v203;
  id v204;
  BMSiriMusicInferenceTrainingIndependentSignals *v205;
  id v206;
  void *v207;
  id v208;
  uint64_t v209;
  void *v210;
  id v211;
  id v212;
  BMSiriMusicInferenceTrainingIndependentSignals *v213;
  id v214;
  void *v215;
  id v216;
  uint64_t v217;
  void *v218;
  id v219;
  id v220;
  BMSiriMusicInferenceTrainingIndependentSignals *v221;
  id v222;
  void *v223;
  void *v224;
  id v225;
  uint64_t v226;
  void *v227;
  id v228;
  id v229;
  BMSiriMusicInferenceTrainingIndependentSignals *v230;
  id v231;
  void *v232;
  void *v233;
  BMSiriMusicInferenceTrainingIndependentSignals *v234;
  id v235;
  id v237;
  uint64_t v238;
  void *v239;
  void *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  void *v263;
  id v264;
  void *v265;
  void *v266;
  id v267;
  void *v268;
  id v269;
  id v270;
  void *v271;
  id v272;
  void *v273;
  id v274;
  void *v275;
  id v276;
  void *v277;
  id v278;
  void *v279;
  id v280;
  void *v281;
  id v282;
  void *v283;
  id v284;
  void *v285;
  id v286;
  void *v287;
  id v288;
  id v289;
  void *v290;
  id v291;
  void *v292;
  void *v293;
  id v294;
  void *v295;
  void *v296;
  void *v297;
  id v298;
  void *v299;
  id *v300;
  id v301;
  id v302;
  id v303;
  id v304;
  void *v305;
  id v306;
  void *v307;
  void *v308;
  uint64_t v309;
  void *v310;
  uint64_t v311;
  void *v312;
  uint64_t v313;
  void *v314;
  uint64_t v315;
  id v316;
  uint64_t v317;
  id v318;
  uint64_t v319;
  id v320;
  uint64_t v321;
  id v322;
  uint64_t v323;
  id v324;
  uint64_t v325;
  id v326;
  uint64_t v327;
  id v328;
  uint64_t v329;
  id v330;
  uint64_t v331;
  id v332;
  uint64_t v333;
  id v334;
  uint64_t v335;
  id v336;
  uint64_t v337;
  id v338;
  uint64_t v339;
  id v340;
  uint64_t v341;
  id v342;
  uint64_t v343;
  id v344;
  uint64_t v345;
  id v346;
  uint64_t v347;
  id v348;
  uint64_t v349;
  id v350;
  uint64_t v351;
  void *v352;
  uint64_t v353;
  id v354;
  uint64_t v355;
  _QWORD v356[3];

  v356[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientDayOfWeek"));
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v308 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v308;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawClientHourOfDay"));
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v307 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v307;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isMediaAlbumPresent"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v306 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v306 = v9;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isMediaArtistPresent"));
        v10 = objc_claimAutoreleasedReturnValue();
        v305 = (void *)v10;
        if (!v10 || (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v303 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v303 = v11;
LABEL_13:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isMediaGenrePresent"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v300 = a4;
          if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v299 = v12;
            v304 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v299 = v12;
            v304 = v12;
LABEL_16:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isMediaMoodPresent"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v296 = v13;
              v301 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v296 = v13;
              v301 = v13;
LABEL_19:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isMediaNamePresent"));
              v14 = objc_claimAutoreleasedReturnValue();
              v297 = (void *)v14;
              if (!v14 || (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v298 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v298 = v15;
LABEL_22:
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isMediaReleaseDatePresent"));
                v16 = objc_claimAutoreleasedReturnValue();
                v295 = (void *)v16;
                if (!v16 || (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v294 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v294 = v17;
LABEL_25:
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nowPlayingLastBundleRecencyS"));
                  v18 = objc_claimAutoreleasedReturnValue();
                  v292 = (void *)v18;
                  if (!v18 || (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v291 = 0;
                    goto LABEL_28;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v291 = v19;
LABEL_28:
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawLanguage"));
                    v20 = objc_claimAutoreleasedReturnValue();
                    v290 = (void *)v20;
                    if (!v20 || (v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v289 = 0;
                      goto LABEL_31;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v289 = v21;
LABEL_31:
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawLocale"));
                      v22 = objc_claimAutoreleasedReturnValue();
                      v287 = (void *)v22;
                      if (!v22 || (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v288 = 0;
                        goto LABEL_34;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v288 = v23;
LABEL_34:
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawRegion"));
                        v24 = objc_claimAutoreleasedReturnValue();
                        v285 = (void *)v24;
                        if (!v24 || (v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v286 = 0;
                          goto LABEL_37;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v286 = v25;
LABEL_37:
                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isClientDaylight"));
                          v26 = objc_claimAutoreleasedReturnValue();
                          v283 = (void *)v26;
                          if (!v26 || (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v284 = 0;
                            goto LABEL_40;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v284 = v27;
LABEL_40:
                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isClientNavigating"));
                            v28 = objc_claimAutoreleasedReturnValue();
                            v281 = (void *)v28;
                            if (!v28 || (v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v282 = 0;
                              goto LABEL_43;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v282 = v29;
LABEL_43:
                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isClientWorkout"));
                              v30 = objc_claimAutoreleasedReturnValue();
                              v279 = (void *)v30;
                              if (!v30 || (v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v280 = 0;
                                goto LABEL_46;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v280 = v31;
LABEL_46:
                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaType"));
                                v32 = objc_claimAutoreleasedReturnValue();
                                v277 = (void *)v32;
                                if (!v32 || (v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v278 = 0;
                                  goto LABEL_49;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v278 = v33;
LABEL_49:
                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nowPlayingState"));
                                  v34 = objc_claimAutoreleasedReturnValue();
                                  v275 = (void *)v34;
                                  if (!v34
                                    || (v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v276 = 0;
                                    goto LABEL_52;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v276 = v35;
LABEL_52:
                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isPireneRequest"));
                                    v36 = objc_claimAutoreleasedReturnValue();
                                    v273 = (void *)v36;
                                    if (!v36
                                      || (v37 = (void *)v36, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v274 = 0;
                                      goto LABEL_55;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v274 = v37;
LABEL_55:
                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("foregroundBundleRecencyS"));
                                      v38 = objc_claimAutoreleasedReturnValue();
                                      v271 = (void *)v38;
                                      if (!v38
                                        || (v39 = (void *)v38, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v272 = 0;
                                        goto LABEL_58;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v272 = v39;
LABEL_58:
                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaParsecCategory"));
                                        v40 = objc_claimAutoreleasedReturnValue();
                                        v268 = (void *)v40;
                                        if (!v40
                                          || (v41 = (void *)v40, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v270 = 0;
                                          goto LABEL_61;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v270 = v41;
LABEL_61:
                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sirikitResponseCode"));
                                          v42 = objc_claimAutoreleasedReturnValue();
                                          v266 = (void *)v42;
                                          if (!v42
                                            || (v43 = (void *)v42, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            v269 = 0;
                                            goto LABEL_64;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v269 = v43;
LABEL_64:
                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appSelectionUses"));
                                            v44 = objc_claimAutoreleasedReturnValue();
                                            v265 = (void *)v44;
                                            if (!v44
                                              || (v45 = (void *)v44,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              v267 = 0;
                                              goto LABEL_67;
                                            }
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v267 = v45;
LABEL_67:
                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modelVersion"));
                                              v46 = objc_claimAutoreleasedReturnValue();
                                              v263 = (void *)v46;
                                              if (!v46
                                                || (v47 = (void *)v46,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                v264 = 0;
                                                goto LABEL_70;
                                              }
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v264 = v47;
LABEL_70:
                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("resolutionType"));
                                                v48 = objc_claimAutoreleasedReturnValue();
                                                v262 = (void *)v48;
                                                if (!v48
                                                  || (v49 = (void *)v48,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  v50 = 0;
                                                  v51 = v303;
                                                  v52 = v299;
LABEL_199:
                                                  v13 = v296;
                                                  LODWORD(v261) = objc_msgSend(v50, "intValue");
                                                  self = objc_retain(-[BMSiriMusicInferenceTrainingIndependentSignals initWithClientDayOfWeek:rawClientHourOfDay:isMediaAlbumPresent:isMediaArtistPresent:isMediaGenrePresent:isMediaMoodPresent:isMediaNamePresent:isMediaReleaseDatePresent:nowPlayingLastBundleRecencyS:rawLanguage:rawLocale:rawRegion:isClientDaylight:isClientNavigating:isClientWorkout:mediaType:nowPlayingState:isPireneRequest:foregroundBundleRecencyS:mediaParsecCategory:sirikitResponseCode:appSelectionUses:modelVersion:resolutionType:](self, "initWithClientDayOfWeek:rawClientHourOfDay:isMediaAlbumPresent:isMediaArtistPresent:isMediaGenrePresent:isMediaMoodPresent:isMediaNamePresent:isMediaReleaseDatePresent:nowPlayingLastBundleRecencyS:rawLanguage:rawLocale:rawRegion:isClientDaylight:isClientNavigating:isClientWorkout:mediaType:nowPlayingState:isPireneRequest:foregroundBundleRecencyS:mediaParsecCategory:sirikitResponseCode:appSelectionUses:modelVersion:resolutionType:", v7, v8, v306, v51, v304, v301, v298, v294, v291,
                                                             v289,
                                                             v288,
                                                             v286,
                                                             v284,
                                                             v282,
                                                             v280,
                                                             v278,
                                                             v276,
                                                             v274,
                                                             v272,
                                                             v270,
                                                             v269,
                                                             v267,
                                                             v264,
                                                             v261));
                                                  v233 = v50;
                                                  v56 = self;
LABEL_200:

                                                  v224 = v264;
LABEL_201:

LABEL_202:
LABEL_203:

LABEL_204:
LABEL_205:

                                                  goto LABEL_206;
                                                }
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  v50 = v49;
LABEL_198:
                                                  v51 = v303;
                                                  v52 = v299;

                                                  goto LABEL_199;
                                                }
                                                v234 = self;
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  v235 = v49;
                                                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriMusicInferenceTrainingIndependentSignalsInferenceAppResolutionTypeFromString(v235));
                                                  v50 = (id)objc_claimAutoreleasedReturnValue();

                                                  goto LABEL_198;
                                                }
                                                if (v300)
                                                {
                                                  v237 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v238 = *MEMORY[0x1E0D025B8];
                                                  v309 = *MEMORY[0x1E0CB2D50];
                                                  v239 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("resolutionType"));
                                                  v310 = v239;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v310, &v309, 1);
                                                  v240 = (void *)objc_claimAutoreleasedReturnValue();
                                                  *v300 = (id)objc_msgSend(v237, "initWithDomain:code:userInfo:", v238, 2, v240);

                                                }
                                                v233 = 0;
                                                v56 = 0;
                                                self = v234;
LABEL_235:
                                                v51 = v303;
                                                v52 = v299;
                                                v13 = v296;
                                                goto LABEL_200;
                                              }
                                              if (v300)
                                              {
                                                v225 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v226 = *MEMORY[0x1E0D025B8];
                                                v311 = *MEMORY[0x1E0CB2D50];
                                                v227 = v9;
                                                v228 = v8;
                                                v229 = v7;
                                                v230 = self;
                                                v231 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                v260 = objc_opt_class();
                                                v232 = v231;
                                                self = v230;
                                                v7 = v229;
                                                v8 = v228;
                                                v9 = v227;
                                                v233 = (void *)objc_msgSend(v232, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v260, CFSTR("modelVersion"));
                                                v312 = v233;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v312, &v311, 1);
                                                v262 = (void *)objc_claimAutoreleasedReturnValue();
                                                v264 = 0;
                                                v56 = 0;
                                                *v300 = (id)objc_msgSend(v225, "initWithDomain:code:userInfo:", v226, 2);
                                                goto LABEL_235;
                                              }
                                              v224 = 0;
                                              v56 = 0;
LABEL_237:
                                              v51 = v303;
                                              v52 = v299;
                                              v13 = v296;
                                              goto LABEL_201;
                                            }
                                            if (v300)
                                            {
                                              v216 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v217 = *MEMORY[0x1E0D025B8];
                                              v313 = *MEMORY[0x1E0CB2D50];
                                              v218 = v9;
                                              v219 = v8;
                                              v220 = v7;
                                              v221 = self;
                                              v222 = objc_alloc(MEMORY[0x1E0CB3940]);
                                              v259 = objc_opt_class();
                                              v223 = v222;
                                              self = v221;
                                              v7 = v220;
                                              v8 = v219;
                                              v9 = v218;
                                              v224 = (void *)objc_msgSend(v223, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v259, CFSTR("appSelectionUses"));
                                              v314 = v224;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v314, &v313, 1);
                                              v263 = (void *)objc_claimAutoreleasedReturnValue();
                                              v267 = 0;
                                              v56 = 0;
                                              *v300 = (id)objc_msgSend(v216, "initWithDomain:code:userInfo:", v217, 2);
                                              goto LABEL_237;
                                            }
                                            v267 = 0;
                                            v56 = 0;
LABEL_231:
                                            v51 = v303;
                                            v52 = v299;
                                            v13 = v296;
                                            goto LABEL_202;
                                          }
                                          if (v300)
                                          {
                                            v208 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v209 = *MEMORY[0x1E0D025B8];
                                            v315 = *MEMORY[0x1E0CB2D50];
                                            v210 = v9;
                                            v211 = v8;
                                            v212 = v7;
                                            v213 = self;
                                            v214 = objc_alloc(MEMORY[0x1E0CB3940]);
                                            v258 = objc_opt_class();
                                            v215 = v214;
                                            self = v213;
                                            v7 = v212;
                                            v8 = v211;
                                            v9 = v210;
                                            v267 = (id)objc_msgSend(v215, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v258, CFSTR("sirikitResponseCode"));
                                            v316 = v267;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v316, &v315, 1);
                                            v265 = (void *)objc_claimAutoreleasedReturnValue();
                                            v269 = 0;
                                            v56 = 0;
                                            *v300 = (id)objc_msgSend(v208, "initWithDomain:code:userInfo:", v209, 2);
                                            goto LABEL_231;
                                          }
                                          v269 = 0;
                                          v56 = 0;
LABEL_229:
                                          v51 = v303;
                                          v52 = v299;
                                          v13 = v296;
                                          goto LABEL_203;
                                        }
                                        if (v300)
                                        {
                                          v200 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v201 = *MEMORY[0x1E0D025B8];
                                          v317 = *MEMORY[0x1E0CB2D50];
                                          v202 = v9;
                                          v203 = v8;
                                          v204 = v7;
                                          v205 = self;
                                          v206 = objc_alloc(MEMORY[0x1E0CB3940]);
                                          v257 = objc_opt_class();
                                          v207 = v206;
                                          self = v205;
                                          v7 = v204;
                                          v8 = v203;
                                          v9 = v202;
                                          v269 = (id)objc_msgSend(v207, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v257, CFSTR("mediaParsecCategory"));
                                          v318 = v269;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v318, &v317, 1);
                                          v266 = (void *)objc_claimAutoreleasedReturnValue();
                                          v270 = 0;
                                          v56 = 0;
                                          *v300 = (id)objc_msgSend(v200, "initWithDomain:code:userInfo:", v201, 2);
                                          goto LABEL_229;
                                        }
                                        v270 = 0;
                                        v56 = 0;
LABEL_227:
                                        v51 = v303;
                                        v52 = v299;
                                        v13 = v296;
                                        goto LABEL_204;
                                      }
                                      if (v300)
                                      {
                                        v192 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v193 = *MEMORY[0x1E0D025B8];
                                        v319 = *MEMORY[0x1E0CB2D50];
                                        v194 = v9;
                                        v195 = v8;
                                        v196 = v7;
                                        v197 = self;
                                        v198 = objc_alloc(MEMORY[0x1E0CB3940]);
                                        v256 = objc_opt_class();
                                        v199 = v198;
                                        self = v197;
                                        v7 = v196;
                                        v8 = v195;
                                        v9 = v194;
                                        v270 = (id)objc_msgSend(v199, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v256, CFSTR("foregroundBundleRecencyS"));
                                        v320 = v270;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v320, &v319, 1);
                                        v268 = (void *)objc_claimAutoreleasedReturnValue();
                                        v272 = 0;
                                        v56 = 0;
                                        *v300 = (id)objc_msgSend(v192, "initWithDomain:code:userInfo:", v193, 2);
                                        goto LABEL_227;
                                      }
                                      v272 = 0;
                                      v56 = 0;
LABEL_225:
                                      v51 = v303;
                                      v52 = v299;
                                      v13 = v296;
                                      goto LABEL_205;
                                    }
                                    if (v300)
                                    {
                                      v184 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v185 = *MEMORY[0x1E0D025B8];
                                      v321 = *MEMORY[0x1E0CB2D50];
                                      v186 = v9;
                                      v187 = v8;
                                      v188 = v7;
                                      v189 = self;
                                      v190 = objc_alloc(MEMORY[0x1E0CB3940]);
                                      v255 = objc_opt_class();
                                      v191 = v190;
                                      self = v189;
                                      v7 = v188;
                                      v8 = v187;
                                      v9 = v186;
                                      v272 = (id)objc_msgSend(v191, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v255, CFSTR("isPireneRequest"));
                                      v322 = v272;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v322, &v321, 1);
                                      v271 = (void *)objc_claimAutoreleasedReturnValue();
                                      v274 = 0;
                                      v56 = 0;
                                      *v300 = (id)objc_msgSend(v184, "initWithDomain:code:userInfo:", v185, 2);
                                      goto LABEL_225;
                                    }
                                    v274 = 0;
                                    v56 = 0;
LABEL_195:
                                    v51 = v303;
                                    v52 = v299;
                                    v13 = v296;
LABEL_206:

                                    goto LABEL_207;
                                  }
                                  if (v300)
                                  {
                                    v176 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v177 = *MEMORY[0x1E0D025B8];
                                    v323 = *MEMORY[0x1E0CB2D50];
                                    v178 = v9;
                                    v179 = v8;
                                    v180 = v7;
                                    v181 = self;
                                    v182 = objc_alloc(MEMORY[0x1E0CB3940]);
                                    v254 = objc_opt_class();
                                    v183 = v182;
                                    self = v181;
                                    v7 = v180;
                                    v8 = v179;
                                    v9 = v178;
                                    v274 = (id)objc_msgSend(v183, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v254, CFSTR("nowPlayingState"));
                                    v324 = v274;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v324, &v323, 1);
                                    v273 = (void *)objc_claimAutoreleasedReturnValue();
                                    v276 = 0;
                                    v56 = 0;
                                    *v300 = (id)objc_msgSend(v176, "initWithDomain:code:userInfo:", v177, 2);
                                    goto LABEL_195;
                                  }
                                  v276 = 0;
                                  v56 = 0;
LABEL_191:
                                  v51 = v303;
                                  v52 = v299;
                                  v13 = v296;
LABEL_207:

                                  goto LABEL_208;
                                }
                                if (v300)
                                {
                                  v168 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v169 = *MEMORY[0x1E0D025B8];
                                  v325 = *MEMORY[0x1E0CB2D50];
                                  v170 = v9;
                                  v171 = v8;
                                  v172 = v7;
                                  v173 = self;
                                  v174 = objc_alloc(MEMORY[0x1E0CB3940]);
                                  v253 = objc_opt_class();
                                  v175 = v174;
                                  self = v173;
                                  v7 = v172;
                                  v8 = v171;
                                  v9 = v170;
                                  v276 = (id)objc_msgSend(v175, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v253, CFSTR("mediaType"));
                                  v326 = v276;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v326, &v325, 1);
                                  v275 = (void *)objc_claimAutoreleasedReturnValue();
                                  v278 = 0;
                                  v56 = 0;
                                  *v300 = (id)objc_msgSend(v168, "initWithDomain:code:userInfo:", v169, 2);
                                  goto LABEL_191;
                                }
                                v278 = 0;
                                v56 = 0;
LABEL_187:
                                v51 = v303;
                                v52 = v299;
                                v13 = v296;
LABEL_208:

                                goto LABEL_209;
                              }
                              if (v300)
                              {
                                v160 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v161 = *MEMORY[0x1E0D025B8];
                                v327 = *MEMORY[0x1E0CB2D50];
                                v162 = v9;
                                v163 = v8;
                                v164 = v7;
                                v165 = self;
                                v166 = objc_alloc(MEMORY[0x1E0CB3940]);
                                v252 = objc_opt_class();
                                v167 = v166;
                                self = v165;
                                v7 = v164;
                                v8 = v163;
                                v9 = v162;
                                v278 = (id)objc_msgSend(v167, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v252, CFSTR("isClientWorkout"));
                                v328 = v278;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v328, &v327, 1);
                                v277 = (void *)objc_claimAutoreleasedReturnValue();
                                v280 = 0;
                                v56 = 0;
                                *v300 = (id)objc_msgSend(v160, "initWithDomain:code:userInfo:", v161, 2);
                                goto LABEL_187;
                              }
                              v280 = 0;
                              v56 = 0;
LABEL_183:
                              v51 = v303;
                              v52 = v299;
                              v13 = v296;
LABEL_209:

                              goto LABEL_210;
                            }
                            if (v300)
                            {
                              v152 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v153 = *MEMORY[0x1E0D025B8];
                              v329 = *MEMORY[0x1E0CB2D50];
                              v154 = v9;
                              v155 = v8;
                              v156 = v7;
                              v157 = self;
                              v158 = objc_alloc(MEMORY[0x1E0CB3940]);
                              v251 = objc_opt_class();
                              v159 = v158;
                              self = v157;
                              v7 = v156;
                              v8 = v155;
                              v9 = v154;
                              v280 = (id)objc_msgSend(v159, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v251, CFSTR("isClientNavigating"));
                              v330 = v280;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v330, &v329, 1);
                              v279 = (void *)objc_claimAutoreleasedReturnValue();
                              v282 = 0;
                              v56 = 0;
                              *v300 = (id)objc_msgSend(v152, "initWithDomain:code:userInfo:", v153, 2);
                              goto LABEL_183;
                            }
                            v282 = 0;
                            v56 = 0;
LABEL_177:
                            v51 = v303;
                            v52 = v299;
                            v13 = v296;
LABEL_210:

                            goto LABEL_211;
                          }
                          if (v300)
                          {
                            v144 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v145 = *MEMORY[0x1E0D025B8];
                            v331 = *MEMORY[0x1E0CB2D50];
                            v146 = v9;
                            v147 = v8;
                            v148 = v7;
                            v149 = self;
                            v150 = objc_alloc(MEMORY[0x1E0CB3940]);
                            v250 = objc_opt_class();
                            v151 = v150;
                            self = v149;
                            v7 = v148;
                            v8 = v147;
                            v9 = v146;
                            v282 = (id)objc_msgSend(v151, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v250, CFSTR("isClientDaylight"));
                            v332 = v282;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v332, &v331, 1);
                            v281 = (void *)objc_claimAutoreleasedReturnValue();
                            v284 = 0;
                            v56 = 0;
                            *v300 = (id)objc_msgSend(v144, "initWithDomain:code:userInfo:", v145, 2);
                            goto LABEL_177;
                          }
                          v284 = 0;
                          v56 = 0;
LABEL_171:
                          v51 = v303;
                          v52 = v299;
                          v13 = v296;
LABEL_211:

                          goto LABEL_212;
                        }
                        if (v300)
                        {
                          v136 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v137 = *MEMORY[0x1E0D025B8];
                          v333 = *MEMORY[0x1E0CB2D50];
                          v138 = v9;
                          v139 = v8;
                          v140 = v7;
                          v141 = self;
                          v142 = objc_alloc(MEMORY[0x1E0CB3940]);
                          v249 = objc_opt_class();
                          v143 = v142;
                          self = v141;
                          v7 = v140;
                          v8 = v139;
                          v9 = v138;
                          v284 = (id)objc_msgSend(v143, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v249, CFSTR("rawRegion"));
                          v334 = v284;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v334, &v333, 1);
                          v283 = (void *)objc_claimAutoreleasedReturnValue();
                          v286 = 0;
                          v56 = 0;
                          *v300 = (id)objc_msgSend(v136, "initWithDomain:code:userInfo:", v137, 2);
                          goto LABEL_171;
                        }
                        v286 = 0;
                        v56 = 0;
LABEL_165:
                        v51 = v303;
                        v52 = v299;
                        v13 = v296;
LABEL_212:

                        goto LABEL_213;
                      }
                      if (v300)
                      {
                        v128 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v129 = *MEMORY[0x1E0D025B8];
                        v335 = *MEMORY[0x1E0CB2D50];
                        v130 = v9;
                        v131 = v8;
                        v132 = v7;
                        v133 = self;
                        v134 = objc_alloc(MEMORY[0x1E0CB3940]);
                        v248 = objc_opt_class();
                        v135 = v134;
                        self = v133;
                        v7 = v132;
                        v8 = v131;
                        v9 = v130;
                        v286 = (id)objc_msgSend(v135, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v248, CFSTR("rawLocale"));
                        v336 = v286;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v336, &v335, 1);
                        v285 = (void *)objc_claimAutoreleasedReturnValue();
                        v288 = 0;
                        v56 = 0;
                        *v300 = (id)objc_msgSend(v128, "initWithDomain:code:userInfo:", v129, 2);
                        goto LABEL_165;
                      }
                      v288 = 0;
                      v56 = 0;
LABEL_159:
                      v51 = v303;
                      v52 = v299;
                      v13 = v296;
LABEL_213:

                      goto LABEL_214;
                    }
                    if (v300)
                    {
                      v120 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v121 = *MEMORY[0x1E0D025B8];
                      v337 = *MEMORY[0x1E0CB2D50];
                      v122 = v9;
                      v123 = v8;
                      v124 = v7;
                      v125 = self;
                      v126 = objc_alloc(MEMORY[0x1E0CB3940]);
                      v247 = objc_opt_class();
                      v127 = v126;
                      self = v125;
                      v7 = v124;
                      v8 = v123;
                      v9 = v122;
                      v288 = (id)objc_msgSend(v127, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v247, CFSTR("rawLanguage"));
                      v338 = v288;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v338, &v337, 1);
                      v287 = (void *)objc_claimAutoreleasedReturnValue();
                      v289 = 0;
                      v56 = 0;
                      *v300 = (id)objc_msgSend(v120, "initWithDomain:code:userInfo:", v121, 2);
                      goto LABEL_159;
                    }
                    v289 = 0;
                    v56 = 0;
LABEL_153:
                    v51 = v303;
                    v52 = v299;
                    v13 = v296;
LABEL_214:

                    goto LABEL_215;
                  }
                  if (v300)
                  {
                    v112 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v113 = *MEMORY[0x1E0D025B8];
                    v339 = *MEMORY[0x1E0CB2D50];
                    v114 = v9;
                    v115 = v8;
                    v116 = v7;
                    v117 = self;
                    v118 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v246 = objc_opt_class();
                    v119 = v118;
                    self = v117;
                    v7 = v116;
                    v8 = v115;
                    v9 = v114;
                    v289 = (id)objc_msgSend(v119, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v246, CFSTR("nowPlayingLastBundleRecencyS"));
                    v340 = v289;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v340, &v339, 1);
                    v290 = (void *)objc_claimAutoreleasedReturnValue();
                    v291 = 0;
                    v56 = 0;
                    *v300 = (id)objc_msgSend(v112, "initWithDomain:code:userInfo:", v113, 2);
                    goto LABEL_153;
                  }
                  v291 = 0;
                  v56 = 0;
LABEL_147:
                  v51 = v303;
                  v52 = v299;
                  v13 = v296;
LABEL_215:

                  goto LABEL_216;
                }
                if (v300)
                {
                  v104 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v105 = *MEMORY[0x1E0D025B8];
                  v341 = *MEMORY[0x1E0CB2D50];
                  v106 = v9;
                  v107 = v8;
                  v108 = v7;
                  v109 = self;
                  v110 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v245 = objc_opt_class();
                  v111 = v110;
                  self = v109;
                  v7 = v108;
                  v8 = v107;
                  v9 = v106;
                  v291 = (id)objc_msgSend(v111, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v245, CFSTR("isMediaReleaseDatePresent"));
                  v342 = v291;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v342, &v341, 1);
                  v292 = (void *)objc_claimAutoreleasedReturnValue();
                  v294 = 0;
                  v56 = 0;
                  *v300 = (id)objc_msgSend(v104, "initWithDomain:code:userInfo:", v105, 2);
                  goto LABEL_147;
                }
                v294 = 0;
                v56 = 0;
LABEL_141:
                v51 = v303;
                v52 = v299;
                v13 = v296;
LABEL_216:

                goto LABEL_217;
              }
              if (v300)
              {
                v97 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v293 = v9;
                v98 = v8;
                v99 = v7;
                v100 = self;
                v101 = *MEMORY[0x1E0D025B8];
                v343 = *MEMORY[0x1E0CB2D50];
                v294 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isMediaNamePresent"));
                v344 = v294;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v344, &v343, 1);
                v102 = objc_claimAutoreleasedReturnValue();
                v103 = v101;
                self = v100;
                v7 = v99;
                v8 = v98;
                v9 = v293;
                v295 = (void *)v102;
                v298 = 0;
                v56 = 0;
                *v300 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v103, 2);
                goto LABEL_141;
              }
              v298 = 0;
              v56 = 0;
              v51 = v303;
              v52 = v299;
              v13 = v296;
LABEL_217:

              goto LABEL_218;
            }
            if (v300)
            {
              v302 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v89 = *MEMORY[0x1E0D025B8];
              v345 = *MEMORY[0x1E0CB2D50];
              v90 = v9;
              v91 = v8;
              v92 = v7;
              v93 = self;
              v94 = objc_alloc(MEMORY[0x1E0CB3940]);
              v244 = objc_opt_class();
              v95 = v94;
              self = v93;
              v7 = v92;
              v8 = v91;
              v9 = v90;
              v298 = (id)objc_msgSend(v95, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v244, CFSTR("isMediaMoodPresent"));
              v346 = v298;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v346, &v345, 1);
              v297 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = (id)objc_msgSend(v302, "initWithDomain:code:userInfo:", v89, 2);
              v301 = 0;
              v56 = 0;
              *v300 = v96;
              v51 = v303;
              v52 = v299;
              goto LABEL_217;
            }
            v301 = 0;
            v56 = 0;
            v51 = v303;
            v52 = v299;
LABEL_218:

            goto LABEL_219;
          }
          v52 = v12;
          if (a4)
          {
            v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v79 = *MEMORY[0x1E0D025B8];
            v347 = *MEMORY[0x1E0CB2D50];
            v80 = v9;
            v81 = v8;
            v82 = v7;
            v83 = self;
            v84 = objc_alloc(MEMORY[0x1E0CB3940]);
            v243 = objc_opt_class();
            v85 = v84;
            self = v83;
            v7 = v82;
            v8 = v81;
            v9 = v80;
            v301 = (id)objc_msgSend(v85, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v243, CFSTR("isMediaGenrePresent"));
            v348 = v301;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v348, &v347, 1);
            v86 = objc_claimAutoreleasedReturnValue();
            v87 = v79;
            v13 = (void *)v86;
            v88 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v87, 2, v86);
            v304 = 0;
            v56 = 0;
            *v300 = v88;
            v51 = v303;
            goto LABEL_218;
          }
          v304 = 0;
          v56 = 0;
          v51 = v303;
LABEL_219:

          goto LABEL_220;
        }
        if (a4)
        {
          v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v68 = *MEMORY[0x1E0D025B8];
          v349 = *MEMORY[0x1E0CB2D50];
          v69 = v9;
          v70 = v8;
          v71 = v7;
          v72 = self;
          v73 = objc_alloc(MEMORY[0x1E0CB3940]);
          v242 = objc_opt_class();
          v74 = v73;
          self = v72;
          v7 = v71;
          v8 = v70;
          v9 = v69;
          v304 = (id)objc_msgSend(v74, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v242, CFSTR("isMediaArtistPresent"));
          v350 = v304;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v350, &v349, 1);
          v75 = objc_claimAutoreleasedReturnValue();
          v76 = v68;
          v52 = (void *)v75;
          v77 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v76, 2, v75);
          v51 = 0;
          v56 = 0;
          *a4 = v77;
          goto LABEL_219;
        }
        v51 = 0;
        v56 = 0;
LABEL_220:

        goto LABEL_221;
      }
      if (a4)
      {
        v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v61 = *MEMORY[0x1E0D025B8];
        v351 = *MEMORY[0x1E0CB2D50];
        v62 = v8;
        v63 = v7;
        v64 = objc_alloc(MEMORY[0x1E0CB3940]);
        v241 = objc_opt_class();
        v65 = v64;
        v7 = v63;
        v8 = v62;
        v51 = (void *)objc_msgSend(v65, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v241, CFSTR("isMediaAlbumPresent"));
        v352 = v51;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v352, &v351, 1);
        v305 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v61, 2);
        v306 = 0;
        v56 = 0;
        *a4 = v66;
        goto LABEL_220;
      }
      v306 = 0;
      v56 = 0;
LABEL_221:

      goto LABEL_222;
    }
    if (a4)
    {
      v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v58 = *MEMORY[0x1E0D025B8];
      v353 = *MEMORY[0x1E0CB2D50];
      v306 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("rawClientHourOfDay"));
      v354 = v306;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v354, &v353, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v58, 2, v9);
      v8 = 0;
      v56 = 0;
      *a4 = v59;
      goto LABEL_221;
    }
    v8 = 0;
    v56 = 0;
LABEL_222:

    goto LABEL_223;
  }
  if (a4)
  {
    v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v54 = *MEMORY[0x1E0D025B8];
    v355 = *MEMORY[0x1E0CB2D50];
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("clientDayOfWeek"));
    v356[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v356, &v355, 1);
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2);
    v7 = 0;
    v56 = 0;
    *a4 = v55;
    goto LABEL_222;
  }
  v7 = 0;
  v56 = 0;
LABEL_223:

  return v56;
}

- (id)jsonDictionary
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
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
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  _QWORD v83[24];
  _QWORD v84[26];

  v84[24] = *MEMORY[0x1E0C80C00];
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasClientDayOfWeek](self, "hasClientDayOfWeek"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals clientDayOfWeek](self, "clientDayOfWeek"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasRawClientHourOfDay](self, "hasRawClientHourOfDay"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals rawClientHourOfDay](self, "rawClientHourOfDay"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaAlbumPresent](self, "hasIsMediaAlbumPresent"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaAlbumPresent](self, "isMediaAlbumPresent"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaArtistPresent](self, "hasIsMediaArtistPresent"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaArtistPresent](self, "isMediaArtistPresent"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaGenrePresent](self, "hasIsMediaGenrePresent"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaGenrePresent](self, "isMediaGenrePresent"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaMoodPresent](self, "hasIsMediaMoodPresent"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaMoodPresent](self, "isMediaMoodPresent"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaNamePresent](self, "hasIsMediaNamePresent"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaNamePresent](self, "isMediaNamePresent"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaReleaseDatePresent](self, "hasIsMediaReleaseDatePresent"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaReleaseDatePresent](self, "isMediaReleaseDatePresent"));
    v82 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v82 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasNowPlayingLastBundleRecencyS](self, "hasNowPlayingLastBundleRecencyS"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals nowPlayingLastBundleRecencyS](self, "nowPlayingLastBundleRecencyS"));
    v81 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v81 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasRawLanguage](self, "hasRawLanguage"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSiriMusicInferenceTrainingIndependentSignals rawLanguage](self, "rawLanguage"));
    v80 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v80 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasRawLocale](self, "hasRawLocale"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSiriMusicInferenceTrainingIndependentSignals rawLocale](self, "rawLocale"));
    v79 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v79 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasRawRegion](self, "hasRawRegion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSiriMusicInferenceTrainingIndependentSignals rawRegion](self, "rawRegion"));
    v78 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v78 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsClientDaylight](self, "hasIsClientDaylight"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isClientDaylight](self, "isClientDaylight"));
    v77 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v77 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsClientNavigating](self, "hasIsClientNavigating"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isClientNavigating](self, "isClientNavigating"));
    v76 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v76 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsClientWorkout](self, "hasIsClientWorkout"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isClientWorkout](self, "isClientWorkout"));
    v75 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v75 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasMediaType](self, "hasMediaType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals mediaType](self, "mediaType"));
    v74 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v74 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasNowPlayingState](self, "hasNowPlayingState"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals nowPlayingState](self, "nowPlayingState"));
    v73 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v73 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsPireneRequest](self, "hasIsPireneRequest"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isPireneRequest](self, "isPireneRequest"));
    v72 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v72 = 0;
  }
  if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasForegroundBundleRecencyS](self, "hasForegroundBundleRecencyS")|| (-[BMSiriMusicInferenceTrainingIndependentSignals foregroundBundleRecencyS](self, "foregroundBundleRecencyS"), fabs(v10) == INFINITY))
  {
    v71 = 0;
  }
  else
  {
    -[BMSiriMusicInferenceTrainingIndependentSignals foregroundBundleRecencyS](self, "foregroundBundleRecencyS");
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriMusicInferenceTrainingIndependentSignals foregroundBundleRecencyS](self, "foregroundBundleRecencyS");
    objc_msgSend(v11, "numberWithDouble:");
    v71 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasMediaParsecCategory](self, "hasMediaParsecCategory"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals mediaParsecCategory](self, "mediaParsecCategory"));
    v70 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v70 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasSirikitResponseCode](self, "hasSirikitResponseCode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals sirikitResponseCode](self, "sirikitResponseCode"));
    v69 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v69 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasAppSelectionUses](self, "hasAppSelectionUses"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals appSelectionUses](self, "appSelectionUses"));
    v68 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v68 = 0;
  }
  if (-[BMSiriMusicInferenceTrainingIndependentSignals hasModelVersion](self, "hasModelVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriMusicInferenceTrainingIndependentSignals modelVersion](self, "modelVersion"));
    v67 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v67 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals resolutionType](self, "resolutionType"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = CFSTR("clientDayOfWeek");
  v12 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v58 = (void *)v12;
  v84[0] = v12;
  v83[1] = CFSTR("rawClientHourOfDay");
  v13 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v57 = (void *)v13;
  v84[1] = v13;
  v83[2] = CFSTR("isMediaAlbumPresent");
  v14 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v14;
  v84[2] = v14;
  v83[3] = CFSTR("isMediaArtistPresent");
  v15 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v55 = (void *)v15;
  v84[3] = v15;
  v83[4] = CFSTR("isMediaGenrePresent");
  v16 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v54 = (void *)v16;
  v84[4] = v16;
  v83[5] = CFSTR("isMediaMoodPresent");
  v17 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v17;
  v84[5] = v17;
  v83[6] = CFSTR("isMediaNamePresent");
  v18 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = v9;
  v52 = (void *)v18;
  v84[6] = v18;
  v83[7] = CFSTR("isMediaReleaseDatePresent");
  v20 = (uint64_t)v82;
  if (!v82)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = v6;
  v84[7] = v20;
  v83[8] = CFSTR("nowPlayingLastBundleRecencyS");
  v22 = v81;
  if (!v81)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = v4;
  v84[8] = v22;
  v83[9] = CFSTR("rawLanguage");
  v24 = (uint64_t)v80;
  if (!v80)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v25 = v3;
  v60 = (void *)v24;
  v84[9] = v24;
  v83[10] = CFSTR("rawLocale");
  v26 = (uint64_t)v79;
  if (!v79)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v26;
  v84[10] = v26;
  v83[11] = CFSTR("rawRegion");
  v28 = (uint64_t)v78;
  if (!v78)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v28;
  v84[11] = v28;
  v83[12] = CFSTR("isClientDaylight");
  v29 = (uint64_t)v77;
  if (!v77)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v29;
  v84[12] = v29;
  v83[13] = CFSTR("isClientNavigating");
  v30 = (uint64_t)v76;
  if (!v76)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v49 = (void *)v30;
  v84[13] = v30;
  v83[14] = CFSTR("isClientWorkout");
  v31 = (uint64_t)v75;
  if (!v75)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v65 = v5;
  v48 = (void *)v31;
  v84[14] = v31;
  v83[15] = CFSTR("mediaType");
  v32 = (uint64_t)v74;
  if (!v74)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v32;
  v84[15] = v32;
  v83[16] = CFSTR("nowPlayingState");
  v33 = (uint64_t)v73;
  if (!v73)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v33;
  v84[16] = v33;
  v83[17] = CFSTR("isPireneRequest");
  v34 = (uint64_t)v72;
  if (!v72)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v63 = v8;
  v45 = (void *)v34;
  v84[17] = v34;
  v83[18] = CFSTR("foregroundBundleRecencyS");
  v35 = (uint64_t)v71;
  if (!v71)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v64 = v7;
  v62 = v25;
  v44 = (void *)v35;
  v84[18] = v35;
  v83[19] = CFSTR("mediaParsecCategory");
  v36 = v70;
  if (!v70)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v61 = v23;
  v84[19] = v36;
  v83[20] = CFSTR("sirikitResponseCode");
  v37 = v69;
  if (!v69)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v84[20] = v37;
  v83[21] = CFSTR("appSelectionUses");
  v38 = v68;
  if (!v68)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v20;
  v84[21] = v38;
  v83[22] = CFSTR("modelVersion");
  v40 = v67;
  if (!v67)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v84[22] = v40;
  v83[23] = CFSTR("resolutionType");
  v41 = v66;
  if (!v66)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v84[23] = v41;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 24);
  v59 = (id)objc_claimAutoreleasedReturnValue();
  if (!v66)

  v42 = v27;
  if (!v67)
  {

    v42 = v27;
  }
  if (!v68)
  {

    v42 = v27;
  }
  if (!v69)
  {

    v42 = v27;
  }
  if (!v70)
  {

    v42 = v27;
  }
  if (!v71)
  {

    v42 = v27;
  }
  if (!v72)
  {

    v42 = v27;
  }
  if (!v73)
  {

    v42 = v27;
  }
  if (!v74)
  {

    v42 = v27;
  }
  if (!v75)
  {

    v42 = v27;
  }
  if (!v76)
  {

    v42 = v27;
  }
  if (!v77)
  {

    v42 = v27;
  }
  if (!v78)
  {

    v42 = v27;
  }
  if (!v79)

  if (!v80)
  if (!v81)

  if (v82)
  {
    if (v19)
      goto LABEL_153;
  }
  else
  {

    if (v19)
    {
LABEL_153:
      if (v63)
        goto LABEL_154;
      goto LABEL_162;
    }
  }

  if (v63)
  {
LABEL_154:
    if (v64)
      goto LABEL_155;
    goto LABEL_163;
  }
LABEL_162:

  if (v64)
  {
LABEL_155:
    if (v21)
      goto LABEL_156;
    goto LABEL_164;
  }
LABEL_163:

  if (v21)
  {
LABEL_156:
    if (v65)
      goto LABEL_157;
    goto LABEL_165;
  }
LABEL_164:

  if (v65)
  {
LABEL_157:
    if (v61)
      goto LABEL_158;
LABEL_166:

    if (v62)
      goto LABEL_159;
LABEL_167:

    goto LABEL_159;
  }
LABEL_165:

  if (!v61)
    goto LABEL_166;
LABEL_158:
  if (!v62)
    goto LABEL_167;
LABEL_159:

  return v59;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  double v24;
  double v25;
  double v26;
  int v27;
  int v28;
  int v29;
  unsigned int v30;
  int v31;
  BOOL v32;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasClientDayOfWeek](self, "hasClientDayOfWeek")
      || objc_msgSend(v5, "hasClientDayOfWeek"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasClientDayOfWeek](self, "hasClientDayOfWeek"))
        goto LABEL_119;
      if (!objc_msgSend(v5, "hasClientDayOfWeek"))
        goto LABEL_119;
      v6 = -[BMSiriMusicInferenceTrainingIndependentSignals clientDayOfWeek](self, "clientDayOfWeek");
      if (v6 != objc_msgSend(v5, "clientDayOfWeek"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasRawClientHourOfDay](self, "hasRawClientHourOfDay")
      || objc_msgSend(v5, "hasRawClientHourOfDay"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasRawClientHourOfDay](self, "hasRawClientHourOfDay"))
        goto LABEL_119;
      if (!objc_msgSend(v5, "hasRawClientHourOfDay"))
        goto LABEL_119;
      v7 = -[BMSiriMusicInferenceTrainingIndependentSignals rawClientHourOfDay](self, "rawClientHourOfDay");
      if (v7 != objc_msgSend(v5, "rawClientHourOfDay"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaAlbumPresent](self, "hasIsMediaAlbumPresent")
      || objc_msgSend(v5, "hasIsMediaAlbumPresent"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaAlbumPresent](self, "hasIsMediaAlbumPresent"))
        goto LABEL_119;
      if (!objc_msgSend(v5, "hasIsMediaAlbumPresent"))
        goto LABEL_119;
      v8 = -[BMSiriMusicInferenceTrainingIndependentSignals isMediaAlbumPresent](self, "isMediaAlbumPresent");
      if (v8 != objc_msgSend(v5, "isMediaAlbumPresent"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaArtistPresent](self, "hasIsMediaArtistPresent")
      || objc_msgSend(v5, "hasIsMediaArtistPresent"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaArtistPresent](self, "hasIsMediaArtistPresent"))
        goto LABEL_119;
      if (!objc_msgSend(v5, "hasIsMediaArtistPresent"))
        goto LABEL_119;
      v9 = -[BMSiriMusicInferenceTrainingIndependentSignals isMediaArtistPresent](self, "isMediaArtistPresent");
      if (v9 != objc_msgSend(v5, "isMediaArtistPresent"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaGenrePresent](self, "hasIsMediaGenrePresent")
      || objc_msgSend(v5, "hasIsMediaGenrePresent"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaGenrePresent](self, "hasIsMediaGenrePresent"))
        goto LABEL_119;
      if (!objc_msgSend(v5, "hasIsMediaGenrePresent"))
        goto LABEL_119;
      v10 = -[BMSiriMusicInferenceTrainingIndependentSignals isMediaGenrePresent](self, "isMediaGenrePresent");
      if (v10 != objc_msgSend(v5, "isMediaGenrePresent"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaMoodPresent](self, "hasIsMediaMoodPresent")
      || objc_msgSend(v5, "hasIsMediaMoodPresent"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaMoodPresent](self, "hasIsMediaMoodPresent"))
        goto LABEL_119;
      if (!objc_msgSend(v5, "hasIsMediaMoodPresent"))
        goto LABEL_119;
      v11 = -[BMSiriMusicInferenceTrainingIndependentSignals isMediaMoodPresent](self, "isMediaMoodPresent");
      if (v11 != objc_msgSend(v5, "isMediaMoodPresent"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaNamePresent](self, "hasIsMediaNamePresent")
      || objc_msgSend(v5, "hasIsMediaNamePresent"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaNamePresent](self, "hasIsMediaNamePresent"))
        goto LABEL_119;
      if (!objc_msgSend(v5, "hasIsMediaNamePresent"))
        goto LABEL_119;
      v12 = -[BMSiriMusicInferenceTrainingIndependentSignals isMediaNamePresent](self, "isMediaNamePresent");
      if (v12 != objc_msgSend(v5, "isMediaNamePresent"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaReleaseDatePresent](self, "hasIsMediaReleaseDatePresent")|| objc_msgSend(v5, "hasIsMediaReleaseDatePresent"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaReleaseDatePresent](self, "hasIsMediaReleaseDatePresent"))goto LABEL_119;
      if (!objc_msgSend(v5, "hasIsMediaReleaseDatePresent"))
        goto LABEL_119;
      v13 = -[BMSiriMusicInferenceTrainingIndependentSignals isMediaReleaseDatePresent](self, "isMediaReleaseDatePresent");
      if (v13 != objc_msgSend(v5, "isMediaReleaseDatePresent"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasNowPlayingLastBundleRecencyS](self, "hasNowPlayingLastBundleRecencyS")|| objc_msgSend(v5, "hasNowPlayingLastBundleRecencyS"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasNowPlayingLastBundleRecencyS](self, "hasNowPlayingLastBundleRecencyS"))goto LABEL_119;
      if (!objc_msgSend(v5, "hasNowPlayingLastBundleRecencyS"))
        goto LABEL_119;
      v14 = -[BMSiriMusicInferenceTrainingIndependentSignals nowPlayingLastBundleRecencyS](self, "nowPlayingLastBundleRecencyS");
      if (v14 != objc_msgSend(v5, "nowPlayingLastBundleRecencyS"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasRawLanguage](self, "hasRawLanguage")
      || objc_msgSend(v5, "hasRawLanguage"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasRawLanguage](self, "hasRawLanguage"))
        goto LABEL_119;
      if (!objc_msgSend(v5, "hasRawLanguage"))
        goto LABEL_119;
      v15 = -[BMSiriMusicInferenceTrainingIndependentSignals rawLanguage](self, "rawLanguage");
      if (v15 != objc_msgSend(v5, "rawLanguage"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasRawLocale](self, "hasRawLocale")
      || objc_msgSend(v5, "hasRawLocale"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasRawLocale](self, "hasRawLocale"))
        goto LABEL_119;
      if (!objc_msgSend(v5, "hasRawLocale"))
        goto LABEL_119;
      v16 = -[BMSiriMusicInferenceTrainingIndependentSignals rawLocale](self, "rawLocale");
      if (v16 != objc_msgSend(v5, "rawLocale"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasRawRegion](self, "hasRawRegion")
      || objc_msgSend(v5, "hasRawRegion"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasRawRegion](self, "hasRawRegion"))
        goto LABEL_119;
      if (!objc_msgSend(v5, "hasRawRegion"))
        goto LABEL_119;
      v17 = -[BMSiriMusicInferenceTrainingIndependentSignals rawRegion](self, "rawRegion");
      if (v17 != objc_msgSend(v5, "rawRegion"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsClientDaylight](self, "hasIsClientDaylight")
      || objc_msgSend(v5, "hasIsClientDaylight"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasIsClientDaylight](self, "hasIsClientDaylight"))
        goto LABEL_119;
      if (!objc_msgSend(v5, "hasIsClientDaylight"))
        goto LABEL_119;
      v18 = -[BMSiriMusicInferenceTrainingIndependentSignals isClientDaylight](self, "isClientDaylight");
      if (v18 != objc_msgSend(v5, "isClientDaylight"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsClientNavigating](self, "hasIsClientNavigating")
      || objc_msgSend(v5, "hasIsClientNavigating"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasIsClientNavigating](self, "hasIsClientNavigating"))
        goto LABEL_119;
      if (!objc_msgSend(v5, "hasIsClientNavigating"))
        goto LABEL_119;
      v19 = -[BMSiriMusicInferenceTrainingIndependentSignals isClientNavigating](self, "isClientNavigating");
      if (v19 != objc_msgSend(v5, "isClientNavigating"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsClientWorkout](self, "hasIsClientWorkout")
      || objc_msgSend(v5, "hasIsClientWorkout"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasIsClientWorkout](self, "hasIsClientWorkout"))
        goto LABEL_119;
      if (!objc_msgSend(v5, "hasIsClientWorkout"))
        goto LABEL_119;
      v20 = -[BMSiriMusicInferenceTrainingIndependentSignals isClientWorkout](self, "isClientWorkout");
      if (v20 != objc_msgSend(v5, "isClientWorkout"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasMediaType](self, "hasMediaType")
      || objc_msgSend(v5, "hasMediaType"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasMediaType](self, "hasMediaType"))
        goto LABEL_119;
      if (!objc_msgSend(v5, "hasMediaType"))
        goto LABEL_119;
      v21 = -[BMSiriMusicInferenceTrainingIndependentSignals mediaType](self, "mediaType");
      if (v21 != objc_msgSend(v5, "mediaType"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasNowPlayingState](self, "hasNowPlayingState")
      || objc_msgSend(v5, "hasNowPlayingState"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasNowPlayingState](self, "hasNowPlayingState"))
        goto LABEL_119;
      if (!objc_msgSend(v5, "hasNowPlayingState"))
        goto LABEL_119;
      v22 = -[BMSiriMusicInferenceTrainingIndependentSignals nowPlayingState](self, "nowPlayingState");
      if (v22 != objc_msgSend(v5, "nowPlayingState"))
        goto LABEL_119;
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsPireneRequest](self, "hasIsPireneRequest")
      || objc_msgSend(v5, "hasIsPireneRequest"))
    {
      if (!-[BMSiriMusicInferenceTrainingIndependentSignals hasIsPireneRequest](self, "hasIsPireneRequest"))
        goto LABEL_119;
      if (!objc_msgSend(v5, "hasIsPireneRequest"))
        goto LABEL_119;
      v23 = -[BMSiriMusicInferenceTrainingIndependentSignals isPireneRequest](self, "isPireneRequest");
      if (v23 != objc_msgSend(v5, "isPireneRequest"))
        goto LABEL_119;
    }
    if ((!-[BMSiriMusicInferenceTrainingIndependentSignals hasForegroundBundleRecencyS](self, "hasForegroundBundleRecencyS")&& !objc_msgSend(v5, "hasForegroundBundleRecencyS")|| -[BMSiriMusicInferenceTrainingIndependentSignals hasForegroundBundleRecencyS](self, "hasForegroundBundleRecencyS")&& objc_msgSend(v5, "hasForegroundBundleRecencyS")&& (-[BMSiriMusicInferenceTrainingIndependentSignals foregroundBundleRecencyS](self, "foregroundBundleRecencyS"), v25 = v24, objc_msgSend(v5, "foregroundBundleRecencyS"), v25 == v26))&& (!-[BMSiriMusicInferenceTrainingIndependentSignals hasMediaParsecCategory](self, "hasMediaParsecCategory")&& !objc_msgSend(v5, "hasMediaParsecCategory")|| -[BMSiriMusicInferenceTrainingIndependentSignals hasMediaParsecCategory](self, "hasMediaParsecCategory")&& objc_msgSend(v5, "hasMediaParsecCategory")&& (v27 = -[BMSiriMusicInferenceTrainingIndependentSignals mediaParsecCategory](self, "mediaParsecCategory"), v27 == objc_msgSend(v5, "mediaParsecCategory")))&& (!-[BMSiriMusicInferenceTrainingIndependentSignals hasSirikitResponseCode](self, "hasSirikitResponseCode")&& !objc_msgSend(v5, "hasSirikitResponseCode")
       || -[BMSiriMusicInferenceTrainingIndependentSignals hasSirikitResponseCode](self, "hasSirikitResponseCode")
       && objc_msgSend(v5, "hasSirikitResponseCode")
       && (v28 = -[BMSiriMusicInferenceTrainingIndependentSignals sirikitResponseCode](self, "sirikitResponseCode"),
           v28 == objc_msgSend(v5, "sirikitResponseCode")))
      && (!-[BMSiriMusicInferenceTrainingIndependentSignals hasAppSelectionUses](self, "hasAppSelectionUses")
       && !objc_msgSend(v5, "hasAppSelectionUses")
       || -[BMSiriMusicInferenceTrainingIndependentSignals hasAppSelectionUses](self, "hasAppSelectionUses")
       && objc_msgSend(v5, "hasAppSelectionUses")
       && (v29 = -[BMSiriMusicInferenceTrainingIndependentSignals appSelectionUses](self, "appSelectionUses"),
           v29 == objc_msgSend(v5, "appSelectionUses")))
      && (!-[BMSiriMusicInferenceTrainingIndependentSignals hasModelVersion](self, "hasModelVersion")
       && !objc_msgSend(v5, "hasModelVersion")
       || -[BMSiriMusicInferenceTrainingIndependentSignals hasModelVersion](self, "hasModelVersion")
       && objc_msgSend(v5, "hasModelVersion")
       && (v30 = -[BMSiriMusicInferenceTrainingIndependentSignals modelVersion](self, "modelVersion"),
           v30 == objc_msgSend(v5, "modelVersion"))))
    {
      v31 = -[BMSiriMusicInferenceTrainingIndependentSignals resolutionType](self, "resolutionType");
      v32 = v31 == objc_msgSend(v5, "resolutionType");
    }
    else
    {
LABEL_119:
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)clientDayOfWeek
{
  return self->_clientDayOfWeek;
}

- (BOOL)hasClientDayOfWeek
{
  return self->_hasClientDayOfWeek;
}

- (void)setHasClientDayOfWeek:(BOOL)a3
{
  self->_hasClientDayOfWeek = a3;
}

- (int)rawClientHourOfDay
{
  return self->_rawClientHourOfDay;
}

- (BOOL)hasRawClientHourOfDay
{
  return self->_hasRawClientHourOfDay;
}

- (void)setHasRawClientHourOfDay:(BOOL)a3
{
  self->_hasRawClientHourOfDay = a3;
}

- (BOOL)isMediaAlbumPresent
{
  return self->_isMediaAlbumPresent;
}

- (BOOL)hasIsMediaAlbumPresent
{
  return self->_hasIsMediaAlbumPresent;
}

- (void)setHasIsMediaAlbumPresent:(BOOL)a3
{
  self->_hasIsMediaAlbumPresent = a3;
}

- (BOOL)isMediaArtistPresent
{
  return self->_isMediaArtistPresent;
}

- (BOOL)hasIsMediaArtistPresent
{
  return self->_hasIsMediaArtistPresent;
}

- (void)setHasIsMediaArtistPresent:(BOOL)a3
{
  self->_hasIsMediaArtistPresent = a3;
}

- (BOOL)isMediaGenrePresent
{
  return self->_isMediaGenrePresent;
}

- (BOOL)hasIsMediaGenrePresent
{
  return self->_hasIsMediaGenrePresent;
}

- (void)setHasIsMediaGenrePresent:(BOOL)a3
{
  self->_hasIsMediaGenrePresent = a3;
}

- (BOOL)isMediaMoodPresent
{
  return self->_isMediaMoodPresent;
}

- (BOOL)hasIsMediaMoodPresent
{
  return self->_hasIsMediaMoodPresent;
}

- (void)setHasIsMediaMoodPresent:(BOOL)a3
{
  self->_hasIsMediaMoodPresent = a3;
}

- (BOOL)isMediaNamePresent
{
  return self->_isMediaNamePresent;
}

- (BOOL)hasIsMediaNamePresent
{
  return self->_hasIsMediaNamePresent;
}

- (void)setHasIsMediaNamePresent:(BOOL)a3
{
  self->_hasIsMediaNamePresent = a3;
}

- (BOOL)isMediaReleaseDatePresent
{
  return self->_isMediaReleaseDatePresent;
}

- (BOOL)hasIsMediaReleaseDatePresent
{
  return self->_hasIsMediaReleaseDatePresent;
}

- (void)setHasIsMediaReleaseDatePresent:(BOOL)a3
{
  self->_hasIsMediaReleaseDatePresent = a3;
}

- (int)nowPlayingLastBundleRecencyS
{
  return self->_nowPlayingLastBundleRecencyS;
}

- (BOOL)hasNowPlayingLastBundleRecencyS
{
  return self->_hasNowPlayingLastBundleRecencyS;
}

- (void)setHasNowPlayingLastBundleRecencyS:(BOOL)a3
{
  self->_hasNowPlayingLastBundleRecencyS = a3;
}

- (int64_t)rawLanguage
{
  return self->_rawLanguage;
}

- (BOOL)hasRawLanguage
{
  return self->_hasRawLanguage;
}

- (void)setHasRawLanguage:(BOOL)a3
{
  self->_hasRawLanguage = a3;
}

- (int64_t)rawLocale
{
  return self->_rawLocale;
}

- (BOOL)hasRawLocale
{
  return self->_hasRawLocale;
}

- (void)setHasRawLocale:(BOOL)a3
{
  self->_hasRawLocale = a3;
}

- (int64_t)rawRegion
{
  return self->_rawRegion;
}

- (BOOL)hasRawRegion
{
  return self->_hasRawRegion;
}

- (void)setHasRawRegion:(BOOL)a3
{
  self->_hasRawRegion = a3;
}

- (BOOL)isClientDaylight
{
  return self->_isClientDaylight;
}

- (BOOL)hasIsClientDaylight
{
  return self->_hasIsClientDaylight;
}

- (void)setHasIsClientDaylight:(BOOL)a3
{
  self->_hasIsClientDaylight = a3;
}

- (BOOL)isClientNavigating
{
  return self->_isClientNavigating;
}

- (BOOL)hasIsClientNavigating
{
  return self->_hasIsClientNavigating;
}

- (void)setHasIsClientNavigating:(BOOL)a3
{
  self->_hasIsClientNavigating = a3;
}

- (BOOL)isClientWorkout
{
  return self->_isClientWorkout;
}

- (BOOL)hasIsClientWorkout
{
  return self->_hasIsClientWorkout;
}

- (void)setHasIsClientWorkout:(BOOL)a3
{
  self->_hasIsClientWorkout = a3;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (BOOL)hasMediaType
{
  return self->_hasMediaType;
}

- (void)setHasMediaType:(BOOL)a3
{
  self->_hasMediaType = a3;
}

- (int)nowPlayingState
{
  return self->_nowPlayingState;
}

- (BOOL)hasNowPlayingState
{
  return self->_hasNowPlayingState;
}

- (void)setHasNowPlayingState:(BOOL)a3
{
  self->_hasNowPlayingState = a3;
}

- (BOOL)isPireneRequest
{
  return self->_isPireneRequest;
}

- (BOOL)hasIsPireneRequest
{
  return self->_hasIsPireneRequest;
}

- (void)setHasIsPireneRequest:(BOOL)a3
{
  self->_hasIsPireneRequest = a3;
}

- (double)foregroundBundleRecencyS
{
  return self->_foregroundBundleRecencyS;
}

- (BOOL)hasForegroundBundleRecencyS
{
  return self->_hasForegroundBundleRecencyS;
}

- (void)setHasForegroundBundleRecencyS:(BOOL)a3
{
  self->_hasForegroundBundleRecencyS = a3;
}

- (int)mediaParsecCategory
{
  return self->_mediaParsecCategory;
}

- (BOOL)hasMediaParsecCategory
{
  return self->_hasMediaParsecCategory;
}

- (void)setHasMediaParsecCategory:(BOOL)a3
{
  self->_hasMediaParsecCategory = a3;
}

- (int)sirikitResponseCode
{
  return self->_sirikitResponseCode;
}

- (BOOL)hasSirikitResponseCode
{
  return self->_hasSirikitResponseCode;
}

- (void)setHasSirikitResponseCode:(BOOL)a3
{
  self->_hasSirikitResponseCode = a3;
}

- (int)appSelectionUses
{
  return self->_appSelectionUses;
}

- (BOOL)hasAppSelectionUses
{
  return self->_hasAppSelectionUses;
}

- (void)setHasAppSelectionUses:(BOOL)a3
{
  self->_hasAppSelectionUses = a3;
}

- (unsigned)modelVersion
{
  return self->_modelVersion;
}

- (BOOL)hasModelVersion
{
  return self->_hasModelVersion;
}

- (void)setHasModelVersion:(BOOL)a3
{
  self->_hasModelVersion = a3;
}

- (int)resolutionType
{
  return self->_resolutionType;
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

    v4 = -[BMSiriMusicInferenceTrainingIndependentSignals initByReadFrom:]([BMSiriMusicInferenceTrainingIndependentSignals alloc], "initByReadFrom:", v7);
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
  id v10;
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
  _QWORD v28[26];

  v28[24] = *MEMORY[0x1E0C80C00];
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientDayOfWeek"), 0, 0, 1, 2, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawClientHourOfDay"), 0, 0, 2, 2, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isMediaAlbumPresent"), 0, 0, 3, 12, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isMediaArtistPresent"), 0, 0, 4, 12, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isMediaGenrePresent"), 0, 0, 5, 12, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isMediaMoodPresent"), 0, 0, 6, 12, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isMediaNamePresent"), 0, 0, 7, 12, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isMediaReleaseDatePresent"), 0, 0, 8, 12, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nowPlayingLastBundleRecencyS"), 0, 0, 9, 2, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawLanguage"), 0, 0, 10, 3, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawLocale"), 0, 0, 11, 3, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawRegion"), 0, 0, 12, 3, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isClientDaylight"), 0, 0, 13, 12, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isClientNavigating"), 0, 0, 14, 12, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isClientWorkout"), 0, 0, 15, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaType"), 0, 0, 16, 2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nowPlayingState"), 0, 0, 17, 2, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isPireneRequest"), 0, 0, 18, 12, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("foregroundBundleRecencyS"), 1, 0, 19, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaParsecCategory"), 0, 0, 20, 2, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sirikitResponseCode"), 0, 0, 21, 2, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appSelectionUses"), 0, 0, 22, 2, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("modelVersion"), 0, 0, 23, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("resolutionType"), 0, 0, 24, 4, 0);
  v28[0] = v27;
  v28[1] = v26;
  v28[2] = v25;
  v28[3] = v24;
  v28[4] = v23;
  v28[5] = v22;
  v28[6] = v21;
  v28[7] = v20;
  v28[8] = v19;
  v28[9] = v18;
  v28[10] = v17;
  v28[11] = v16;
  v28[12] = v15;
  v28[13] = v14;
  v28[14] = v2;
  v28[15] = v3;
  v28[16] = v4;
  v28[17] = v13;
  v28[18] = v12;
  v28[19] = v5;
  v28[20] = v6;
  v28[21] = v11;
  v28[22] = v7;
  v28[23] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 24);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B8E0;
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
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[26];

  v28[24] = *MEMORY[0x1E0C80C00];
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientDayOfWeek"), 1, 2, 0);
  v28[0] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawClientHourOfDay"), 2, 2, 0);
  v28[1] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isMediaAlbumPresent"), 3, 12, 0);
  v28[2] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isMediaArtistPresent"), 4, 12, 0);
  v28[3] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isMediaGenrePresent"), 5, 12, 0);
  v28[4] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isMediaMoodPresent"), 6, 12, 0);
  v28[5] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isMediaNamePresent"), 7, 12, 0);
  v28[6] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isMediaReleaseDatePresent"), 8, 12, 0);
  v28[7] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nowPlayingLastBundleRecencyS"), 9, 2, 0);
  v28[8] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawLanguage"), 10, 3, 0);
  v28[9] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawLocale"), 11, 3, 0);
  v28[10] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawRegion"), 12, 3, 0);
  v28[11] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isClientDaylight"), 13, 12, 0);
  v28[12] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isClientNavigating"), 14, 12, 0);
  v28[13] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isClientWorkout"), 15, 12, 0);
  v28[14] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaType"), 16, 2, 0);
  v28[15] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nowPlayingState"), 17, 2, 0);
  v28[16] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isPireneRequest"), 18, 12, 0);
  v28[17] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("foregroundBundleRecencyS"), 19, 0, 0);
  v28[18] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaParsecCategory"), 20, 2, 0);
  v28[19] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sirikitResponseCode"), 21, 2, 0);
  v28[20] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appSelectionUses"), 22, 2, 0);
  v28[21] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("modelVersion"), 23, 4, 0);
  v28[22] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("resolutionType"), 24, 4, 0);
  v28[23] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
