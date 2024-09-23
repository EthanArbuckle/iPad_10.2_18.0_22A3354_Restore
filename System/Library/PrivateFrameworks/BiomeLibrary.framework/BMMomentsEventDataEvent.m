@implementation BMMomentsEventDataEvent

- (BMMomentsEventDataEvent)initWithEventIdentifier:(void *)a3 startDate:(void *)a4 endDate:(void *)a5 creationDate:(void *)a6 sourceCreationDate:(void *)a7 expirationDate:(void *)a8 provider:(int)a9 category:(int)a10 placeUserType:(int)a11 poiCategory:(int)a12 placeDiscovery:(int)a13 locationMode:(int)a14 workoutType:(int)a15 workoutBundleID:(id)a16 mediaGenre:(int)a17 mediaType:(int)a18 mediaRepetitions:(id)a19 mediaSumTimePlayed:(id)a20 sourceParty:(int)a21 mediaPlayerBundleID:(id)a22 numAudioMediaPlaySessionsPerDay:(id)a23 durationAudioMediaPlaySessionsPerDay:(id)a24 numVideoMediaPlaySessionsPerDay:(id)a25 durationVideoMediaPlaySessionsPerDay:(id)a26 numFirstPartyMediaPlaySessionsPerDay:(id)a27 numThirdPartyMediaPlaySessionsPerDay:(id)a28 numContacts:(id)a29 contactIDsInConversation:(id)a30 contactIDMostSignificantInConversation:(id)a31 interactionContactScore:(id)a32 textLikeMechanismIncluded:(id)a33 callLikeMechanismIncluded:(id)a34 numTextLikeInteractions:(id)a35 numAudioLikeInteractions:(id)a36 numVideoLikeInteractions:(id)a37 totalDurationOfCallLikeInteractions:(id)a38 minDurationOfCallLikeInteractions:(id)a39 maxDurationOfCallLikeInteractions:(id)a40 photoMomentSource:(int)a41 photoMomentInferences:(id)a42 photoMomentHolidays:(id)a43 numPhotoMomentHolidays:(id)a44 numPhotoMomentInferences:(id)a45 numPhotoMomentPublicEvents:(id)a46 numPhotoMomentPersons:(id)a47 isFamilyInPhotoMoment:(id)a48 momentIncludesFavoritedAsset:(id)a49 momentIncludesVideo:(id)a50 momentIncludesPhoto:(id)a51 suggestedEventCategory:(int)a52 numAttendees:(id)a53 numtripParts:(id)a54 tripMode:(int)a55 numScoredTopics:(id)a56 numItemAuthors:(id)a57 numItemRecipients:(id)a58 isGatheringComplete:(id)a59 gaPR:(id)a60 pCount:(id)a61 mapItemSource:(int)a62 placeType:(int)a63 placeLabelGranularity:
{
  int a64;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  BMMomentsEventDataEvent *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  int v82;
  int v83;
  int v84;
  double v85;
  int v86;
  double v87;
  int v88;
  int v89;
  int v90;
  double v91;
  int v92;
  int v93;
  int v94;
  double v95;
  double v96;
  double v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  BMMomentsEventDataEvent *v108;
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
  id v150;
  objc_super v151;

  v118 = a3;
  v68 = a4;
  v69 = a5;
  v70 = a6;
  v71 = a7;
  v150 = a8;
  v72 = a16;
  v148 = a19;
  v73 = a20;
  v117 = a22;
  v74 = a23;
  v147 = a24;
  v75 = a25;
  v146 = a26;
  v145 = a27;
  v144 = a28;
  v143 = a29;
  v116 = a30;
  v115 = a31;
  v142 = a32;
  v141 = a33;
  v140 = a34;
  v139 = a35;
  v138 = a36;
  v137 = a37;
  v136 = a38;
  v135 = a39;
  v134 = a40;
  v114 = a42;
  v113 = a43;
  v133 = a44;
  v132 = a45;
  v131 = a46;
  v130 = a47;
  v129 = a48;
  v128 = a49;
  v127 = a50;
  v126 = a51;
  v125 = a53;
  v124 = a54;
  v123 = a56;
  v122 = a57;
  v121 = a58;
  v120 = a59;
  v112 = a60;
  v119 = a61;
  v151.receiver = a1;
  v151.super_class = (Class)BMMomentsEventDataEvent;
  v76 = -[BMEventBase init](&v151, sel_init);

  if (v76)
  {
    v76->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v76->_eventIdentifier, a3);
    if (v68)
    {
      v76->_hasRaw_startDate = 1;
      objc_msgSend(v68, "timeIntervalSince1970");
    }
    else
    {
      v76->_hasRaw_startDate = 0;
      v77 = -1.0;
    }
    v76->_raw_startDate = v77;
    if (v69)
    {
      v76->_hasRaw_endDate = 1;
      objc_msgSend(v69, "timeIntervalSince1970");
    }
    else
    {
      v76->_hasRaw_endDate = 0;
      v78 = -1.0;
    }
    v76->_raw_endDate = v78;
    if (v70)
    {
      v76->_hasRaw_creationDate = 1;
      objc_msgSend(v70, "timeIntervalSince1970");
    }
    else
    {
      v76->_hasRaw_creationDate = 0;
      v79 = -1.0;
    }
    v76->_raw_creationDate = v79;
    if (v71)
    {
      v76->_hasRaw_sourceCreationDate = 1;
      objc_msgSend(v71, "timeIntervalSince1970");
    }
    else
    {
      v76->_hasRaw_sourceCreationDate = 0;
      v80 = -1.0;
    }
    v76->_raw_sourceCreationDate = v80;
    if (v150)
    {
      v76->_hasRaw_expirationDate = 1;
      objc_msgSend(v150, "timeIntervalSince1970");
    }
    else
    {
      v76->_hasRaw_expirationDate = 0;
      v81 = -1.0;
    }
    v76->_raw_expirationDate = v81;
    v76->_provider = a9;
    v76->_category = a10;
    v76->_placeUserType = a11;
    v76->_poiCategory = a12;
    v76->_placeDiscovery = a13;
    v76->_locationMode = a14;
    v76->_workoutType = a15;
    objc_storeStrong((id *)&v76->_workoutBundleID, a16);
    v76->_mediaGenre = a17;
    v76->_mediaType = a18;
    if (v148)
    {
      v76->_hasMediaRepetitions = 1;
      v82 = objc_msgSend(v148, "intValue");
    }
    else
    {
      v76->_hasMediaRepetitions = 0;
      v82 = -1;
    }
    v76->_mediaRepetitions = v82;
    if (v73)
    {
      v76->_hasMediaSumTimePlayed = 1;
      v83 = objc_msgSend(v73, "intValue");
    }
    else
    {
      v76->_hasMediaSumTimePlayed = 0;
      v83 = -1;
    }
    v76->_mediaSumTimePlayed = v83;
    v76->_sourceParty = a21;
    objc_storeStrong((id *)&v76->_mediaPlayerBundleID, a22);
    if (v74)
    {
      v76->_hasNumAudioMediaPlaySessionsPerDay = 1;
      v84 = objc_msgSend(v74, "intValue");
    }
    else
    {
      v76->_hasNumAudioMediaPlaySessionsPerDay = 0;
      v84 = -1;
    }
    v76->_numAudioMediaPlaySessionsPerDay = v84;
    if (v147)
    {
      v76->_hasDurationAudioMediaPlaySessionsPerDay = 1;
      objc_msgSend(v147, "doubleValue");
    }
    else
    {
      v76->_hasDurationAudioMediaPlaySessionsPerDay = 0;
      v85 = -1.0;
    }
    v76->_durationAudioMediaPlaySessionsPerDay = v85;
    if (v75)
    {
      v76->_hasNumVideoMediaPlaySessionsPerDay = 1;
      v86 = objc_msgSend(v75, "intValue");
    }
    else
    {
      v76->_hasNumVideoMediaPlaySessionsPerDay = 0;
      v86 = -1;
    }
    v76->_numVideoMediaPlaySessionsPerDay = v86;
    if (v146)
    {
      v76->_hasDurationVideoMediaPlaySessionsPerDay = 1;
      objc_msgSend(v146, "doubleValue");
    }
    else
    {
      v76->_hasDurationVideoMediaPlaySessionsPerDay = 0;
      v87 = -1.0;
    }
    v76->_durationVideoMediaPlaySessionsPerDay = v87;
    if (v145)
    {
      v76->_hasNumFirstPartyMediaPlaySessionsPerDay = 1;
      v88 = objc_msgSend(v145, "intValue");
    }
    else
    {
      v76->_hasNumFirstPartyMediaPlaySessionsPerDay = 0;
      v88 = -1;
    }
    v76->_numFirstPartyMediaPlaySessionsPerDay = v88;
    if (v144)
    {
      v76->_hasNumThirdPartyMediaPlaySessionsPerDay = 1;
      v89 = objc_msgSend(v144, "intValue");
    }
    else
    {
      v76->_hasNumThirdPartyMediaPlaySessionsPerDay = 0;
      v89 = -1;
    }
    v76->_numThirdPartyMediaPlaySessionsPerDay = v89;
    if (v143)
    {
      v76->_hasNumContacts = 1;
      v90 = objc_msgSend(v143, "intValue");
    }
    else
    {
      v76->_hasNumContacts = 0;
      v90 = -1;
    }
    v76->_numContacts = v90;
    objc_storeStrong((id *)&v76->_contactIDsInConversation, a30);
    objc_storeStrong((id *)&v76->_contactIDMostSignificantInConversation, a31);
    if (v142)
    {
      v76->_hasInteractionContactScore = 1;
      objc_msgSend(v142, "doubleValue");
    }
    else
    {
      v76->_hasInteractionContactScore = 0;
      v91 = -1.0;
    }
    v76->_interactionContactScore = v91;
    if (v141)
    {
      v76->_hasTextLikeMechanismIncluded = 1;
      v76->_textLikeMechanismIncluded = objc_msgSend(v141, "BOOLValue");
    }
    else
    {
      v76->_hasTextLikeMechanismIncluded = 0;
      v76->_textLikeMechanismIncluded = 0;
    }
    if (v140)
    {
      v76->_hasCallLikeMechanismIncluded = 1;
      v76->_callLikeMechanismIncluded = objc_msgSend(v140, "BOOLValue");
    }
    else
    {
      v76->_hasCallLikeMechanismIncluded = 0;
      v76->_callLikeMechanismIncluded = 0;
    }
    if (v139)
    {
      v76->_hasNumTextLikeInteractions = 1;
      v92 = objc_msgSend(v139, "intValue");
    }
    else
    {
      v76->_hasNumTextLikeInteractions = 0;
      v92 = -1;
    }
    v76->_numTextLikeInteractions = v92;
    if (v138)
    {
      v76->_hasNumAudioLikeInteractions = 1;
      v93 = objc_msgSend(v138, "intValue");
    }
    else
    {
      v76->_hasNumAudioLikeInteractions = 0;
      v93 = -1;
    }
    v76->_numAudioLikeInteractions = v93;
    if (v137)
    {
      v76->_hasNumVideoLikeInteractions = 1;
      v94 = objc_msgSend(v137, "intValue");
    }
    else
    {
      v76->_hasNumVideoLikeInteractions = 0;
      v94 = -1;
    }
    v76->_numVideoLikeInteractions = v94;
    if (v136)
    {
      v76->_hasTotalDurationOfCallLikeInteractions = 1;
      objc_msgSend(v136, "doubleValue");
    }
    else
    {
      v76->_hasTotalDurationOfCallLikeInteractions = 0;
      v95 = -1.0;
    }
    v76->_totalDurationOfCallLikeInteractions = v95;
    if (v135)
    {
      v76->_hasMinDurationOfCallLikeInteractions = 1;
      objc_msgSend(v135, "doubleValue");
    }
    else
    {
      v76->_hasMinDurationOfCallLikeInteractions = 0;
      v96 = -1.0;
    }
    v76->_minDurationOfCallLikeInteractions = v96;
    if (v134)
    {
      v76->_hasMaxDurationOfCallLikeInteractions = 1;
      objc_msgSend(v134, "doubleValue");
    }
    else
    {
      v76->_hasMaxDurationOfCallLikeInteractions = 0;
      v97 = -1.0;
    }
    v76->_maxDurationOfCallLikeInteractions = v97;
    v76->_photoMomentSource = a41;
    objc_storeStrong((id *)&v76->_photoMomentInferences, a42);
    objc_storeStrong((id *)&v76->_photoMomentHolidays, a43);
    if (v133)
    {
      v76->_hasNumPhotoMomentHolidays = 1;
      v98 = objc_msgSend(v133, "intValue");
    }
    else
    {
      v76->_hasNumPhotoMomentHolidays = 0;
      v98 = -1;
    }
    v76->_numPhotoMomentHolidays = v98;
    if (v132)
    {
      v76->_hasNumPhotoMomentInferences = 1;
      v99 = objc_msgSend(v132, "intValue");
    }
    else
    {
      v76->_hasNumPhotoMomentInferences = 0;
      v99 = -1;
    }
    v76->_numPhotoMomentInferences = v99;
    if (v131)
    {
      v76->_hasNumPhotoMomentPublicEvents = 1;
      v100 = objc_msgSend(v131, "intValue");
    }
    else
    {
      v76->_hasNumPhotoMomentPublicEvents = 0;
      v100 = -1;
    }
    v76->_numPhotoMomentPublicEvents = v100;
    if (v130)
    {
      v76->_hasNumPhotoMomentPersons = 1;
      v101 = objc_msgSend(v130, "intValue");
    }
    else
    {
      v76->_hasNumPhotoMomentPersons = 0;
      v101 = -1;
    }
    v76->_numPhotoMomentPersons = v101;
    if (v129)
    {
      v76->_hasIsFamilyInPhotoMoment = 1;
      v76->_isFamilyInPhotoMoment = objc_msgSend(v129, "BOOLValue");
    }
    else
    {
      v76->_hasIsFamilyInPhotoMoment = 0;
      v76->_isFamilyInPhotoMoment = 0;
    }
    if (v128)
    {
      v76->_hasMomentIncludesFavoritedAsset = 1;
      v76->_momentIncludesFavoritedAsset = objc_msgSend(v128, "BOOLValue");
    }
    else
    {
      v76->_hasMomentIncludesFavoritedAsset = 0;
      v76->_momentIncludesFavoritedAsset = 0;
    }
    if (v127)
    {
      v76->_hasMomentIncludesVideo = 1;
      v76->_momentIncludesVideo = objc_msgSend(v127, "BOOLValue");
    }
    else
    {
      v76->_hasMomentIncludesVideo = 0;
      v76->_momentIncludesVideo = 0;
    }
    if (v126)
    {
      v76->_hasMomentIncludesPhoto = 1;
      v76->_momentIncludesPhoto = objc_msgSend(v126, "BOOLValue");
    }
    else
    {
      v76->_hasMomentIncludesPhoto = 0;
      v76->_momentIncludesPhoto = 0;
    }
    v76->_suggestedEventCategory = a52;
    if (v125)
    {
      v76->_hasNumAttendees = 1;
      v102 = objc_msgSend(v125, "intValue");
    }
    else
    {
      v76->_hasNumAttendees = 0;
      v102 = -1;
    }
    v76->_numAttendees = v102;
    if (v124)
    {
      v76->_hasNumtripParts = 1;
      v103 = objc_msgSend(v124, "intValue");
    }
    else
    {
      v76->_hasNumtripParts = 0;
      v103 = -1;
    }
    v76->_numtripParts = v103;
    v76->_tripMode = a55;
    if (v123)
    {
      v76->_hasNumScoredTopics = 1;
      v104 = objc_msgSend(v123, "intValue");
    }
    else
    {
      v76->_hasNumScoredTopics = 0;
      v104 = -1;
    }
    v76->_numScoredTopics = v104;
    if (v122)
    {
      v76->_hasNumItemAuthors = 1;
      v105 = objc_msgSend(v122, "intValue");
    }
    else
    {
      v76->_hasNumItemAuthors = 0;
      v105 = -1;
    }
    v76->_numItemAuthors = v105;
    if (v121)
    {
      v76->_hasNumItemRecipients = 1;
      v106 = objc_msgSend(v121, "intValue");
    }
    else
    {
      v76->_hasNumItemRecipients = 0;
      v106 = -1;
    }
    v76->_numItemRecipients = v106;
    if (v120)
    {
      v76->_hasIsGatheringComplete = 1;
      v76->_isGatheringComplete = objc_msgSend(v120, "BOOLValue");
    }
    else
    {
      v76->_hasIsGatheringComplete = 0;
      v76->_isGatheringComplete = 0;
    }
    objc_storeStrong((id *)&v76->_gaPR, a60);
    if (v119)
    {
      v76->_hasPCount = 1;
      v107 = objc_msgSend(v119, "intValue");
    }
    else
    {
      v76->_hasPCount = 0;
      v107 = -1;
    }
    v76->_pCount = v107;
    v76->_mapItemSource = a62;
    v76->_placeType = a63;
    v76->_placeLabelGranularity = a64;
  }
  v108 = v76;

  return v108;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
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
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;

  v24 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMomentsEventDataEvent eventIdentifier](self, "eventIdentifier");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent startDate](self, "startDate");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent endDate](self, "endDate");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent creationDate](self, "creationDate");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent sourceCreationDate](self, "sourceCreationDate");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent expirationDate](self, "expirationDate");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataEventProviderTypeAsString(-[BMMomentsEventDataEvent provider](self, "provider"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataEventCategoryTypeAsString(-[BMMomentsEventDataEvent category](self, "category"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeAsString(-[BMMomentsEventDataEvent placeUserType](self, "placeUserType"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataGeoPOICategoryTypeAsString(-[BMMomentsEventDataEvent poiCategory](self, "poiCategory"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataPlaceDiscoveryTypeAsString(-[BMMomentsEventDataEvent placeDiscovery](self, "placeDiscovery"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataLocationModeTypeAsString(-[BMMomentsEventDataEvent locationMode](self, "locationMode"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataWorkoutActivityTypeAsString(-[BMMomentsEventDataEvent workoutType](self, "workoutType"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent workoutBundleID](self, "workoutBundleID");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataGenreTypeAsString(-[BMMomentsEventDataEvent mediaGenre](self, "mediaGenre"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataMediaTypeAsString(-[BMMomentsEventDataEvent mediaType](self, "mediaType"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent mediaRepetitions](self, "mediaRepetitions"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent mediaSumTimePlayed](self, "mediaSumTimePlayed"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataSourceAppTypeAsString(-[BMMomentsEventDataEvent sourceParty](self, "sourceParty"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent mediaPlayerBundleID](self, "mediaPlayerBundleID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numAudioMediaPlaySessionsPerDay](self, "numAudioMediaPlaySessionsPerDay"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEvent durationAudioMediaPlaySessionsPerDay](self, "durationAudioMediaPlaySessionsPerDay");
  objc_msgSend(v3, "numberWithDouble:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numVideoMediaPlaySessionsPerDay](self, "numVideoMediaPlaySessionsPerDay"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEvent durationVideoMediaPlaySessionsPerDay](self, "durationVideoMediaPlaySessionsPerDay");
  objc_msgSend(v4, "numberWithDouble:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numFirstPartyMediaPlaySessionsPerDay](self, "numFirstPartyMediaPlaySessionsPerDay"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numThirdPartyMediaPlaySessionsPerDay](self, "numThirdPartyMediaPlaySessionsPerDay"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numContacts](self, "numContacts"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent contactIDsInConversation](self, "contactIDsInConversation");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent contactIDMostSignificantInConversation](self, "contactIDMostSignificantInConversation");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEvent interactionContactScore](self, "interactionContactScore");
  objc_msgSend(v5, "numberWithDouble:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEvent textLikeMechanismIncluded](self, "textLikeMechanismIncluded"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEvent callLikeMechanismIncluded](self, "callLikeMechanismIncluded"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numTextLikeInteractions](self, "numTextLikeInteractions"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numAudioLikeInteractions](self, "numAudioLikeInteractions"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numVideoLikeInteractions](self, "numVideoLikeInteractions"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEvent totalDurationOfCallLikeInteractions](self, "totalDurationOfCallLikeInteractions");
  objc_msgSend(v6, "numberWithDouble:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEvent minDurationOfCallLikeInteractions](self, "minDurationOfCallLikeInteractions");
  objc_msgSend(v7, "numberWithDouble:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEvent maxDurationOfCallLikeInteractions](self, "maxDurationOfCallLikeInteractions");
  objc_msgSend(v8, "numberWithDouble:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataPhotoMomentSourceTypeAsString(-[BMMomentsEventDataEvent photoMomentSource](self, "photoMomentSource"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent photoMomentInferences](self, "photoMomentInferences");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent photoMomentHolidays](self, "photoMomentHolidays");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numPhotoMomentHolidays](self, "numPhotoMomentHolidays"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numPhotoMomentInferences](self, "numPhotoMomentInferences"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numPhotoMomentPublicEvents](self, "numPhotoMomentPublicEvents"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numPhotoMomentPersons](self, "numPhotoMomentPersons"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEvent isFamilyInPhotoMoment](self, "isFamilyInPhotoMoment"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEvent momentIncludesFavoritedAsset](self, "momentIncludesFavoritedAsset"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEvent momentIncludesVideo](self, "momentIncludesVideo"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEvent momentIncludesPhoto](self, "momentIncludesPhoto"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataSuggestedEventCategoryTypeAsString(-[BMMomentsEventDataEvent suggestedEventCategory](self, "suggestedEventCategory"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numAttendees](self, "numAttendees"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numtripParts](self, "numtripParts"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataTripModeTypeAsString(-[BMMomentsEventDataEvent tripMode](self, "tripMode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numScoredTopics](self, "numScoredTopics"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numItemAuthors](self, "numItemAuthors"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numItemRecipients](self, "numItemRecipients"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEvent isGatheringComplete](self, "isGatheringComplete"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent gaPR](self, "gaPR");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent pCount](self, "pCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataMapItemSourceTypeAsString(-[BMMomentsEventDataEvent mapItemSource](self, "mapItemSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataVisitPlaceTypesAsString(-[BMMomentsEventDataEvent placeType](self, "placeType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataPlaceInferenceGranularityTypeAsString(-[BMMomentsEventDataEvent placeLabelGranularity](self, "placeLabelGranularity"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v24, "initWithFormat:", CFSTR("BMMomentsEventDataEvent with eventIdentifier: %@, startDate: %@, endDate: %@, creationDate: %@, sourceCreationDate: %@, expirationDate: %@, provider: %@, category: %@, placeUserType: %@, poiCategory: %@, placeDiscovery: %@, locationMode: %@, workoutType: %@, workoutBundleID: %@, mediaGenre: %@, mediaType: %@, mediaRepetitions: %@, mediaSumTimePlayed: %@, sourceParty: %@, mediaPlayerBundleID: %@, numAudioMediaPlaySessionsPerDay: %@, durationAudioMediaPlaySessionsPerDay: %@, numVideoMediaPlaySessionsPerDay: %@, durationVideoMediaPlaySessionsPerDay: %@, numFirstPartyMediaPlaySessionsPerDay: %@, numThirdPartyMediaPlaySessionsPerDay: %@, numContacts: %@, contactIDsInConversation: %@, contactIDMostSignificantInConversation: %@, interactionContactScore: %@, textLikeMechanismIncluded: %@, callLikeMechanismIncluded: %@, numTextLikeInteractions: %@, numAudioLikeInteractions: %@, numVideoLikeInteractions: %@, totalDurationOfCallLikeInteractions: %@, minDurationOfCallLikeInteractions: %@, maxDurationOfCallLikeInteractions: %@, photoMomentSource: %@, photoMomentInferences: %@, photoMomentHolidays: %@, numPhotoMomentHolidays: %@, numPhotoMomentInferences: %@, numPhotoMomentPublicEvents: %@, numPhotoMomentPersons: %@, isFamilyInPhotoMoment: %@, momentIncludesFavoritedAsset: %@, momentIncludesVideo: %@, momentIncludesPhoto: %@, suggestedEventCategory: %@, numAttendees: %@, numtripParts: %@, tripMode: %@, numScoredTopics: %@, numItemAuthors: %@, numItemRecipients: %@, isGatheringComplete: %@, gaPR: %@, pCount: %@, mapItemSource: %@, placeType: %@, placeLabelGranularity: %@"), v73, v72, v71, v70, v69, v68, v67, v66, v65, v64, v63, v62, v61, v60, v59, v58,
              v57,
              v56,
              v55,
              v51,
              v53,
              v54,
              v52,
              v48,
              v50,
              v46,
              v49,
              v47,
              v41,
              v45,
              v39,
              v44,
              v37,
              v43,
              v42,
              v40,
              v38,
              v34,
              v36,
              v23,
              v35,
              v22,
              v33,
              v21,
              v32,
              v31,
              v30,
              v29,
              v20,
              v28,
              v27,
              v26,
              v19,
              v18,
              v17,
              v16,
              v9,
              v10,
              v11,
              v12);

  return (NSString *)v25;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMomentsEventDataEvent *v5;
  void *v6;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  objc_class *v27;
  uint64_t v28;
  unint64_t v29;
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
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  uint64_t v56;
  char v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  char v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  char v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  char v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  uint64_t v82;
  char v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char v88;
  char v89;
  unsigned int v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char v94;
  char v95;
  unsigned int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  char v101;
  char v102;
  unsigned int v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  char v107;
  char v108;
  unsigned int v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char v114;
  unsigned int v116;
  char v117;
  unsigned int v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  char v122;
  uint64_t v123;
  unint64_t v124;
  char v125;
  unsigned int v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  char v130;
  uint64_t v131;
  unint64_t v132;
  char v133;
  unsigned int v134;
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
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  unint64_t v156;
  char v157;
  unsigned int v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  char v163;
  char v164;
  unsigned int v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  char v170;
  char v171;
  unsigned int v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  char v176;
  char v177;
  unsigned int v178;
  uint64_t v179;
  uint64_t v180;
  unint64_t v181;
  char v182;
  char v183;
  unsigned int v184;
  uint64_t v185;
  uint64_t v186;
  unint64_t v187;
  char v188;
  uint64_t v189;
  unint64_t v190;
  uint64_t v191;
  unint64_t v192;
  uint64_t v193;
  unint64_t v194;
  char v195;
  unsigned int v196;
  uint64_t v197;
  uint64_t v198;
  unint64_t v199;
  char v200;
  id v201;
  void *v202;
  uint64_t v203;
  char v204;
  unsigned int v205;
  uint64_t v206;
  uint64_t v207;
  unint64_t v208;
  char v209;
  char v210;
  unsigned int v211;
  uint64_t v212;
  uint64_t v213;
  unint64_t v214;
  char v215;
  char v216;
  unsigned int v217;
  uint64_t v218;
  uint64_t v219;
  unint64_t v220;
  char v221;
  char v222;
  unsigned int v223;
  uint64_t v224;
  uint64_t v225;
  unint64_t v226;
  char v227;
  char v228;
  unsigned int v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  unint64_t v233;
  char v234;
  char v235;
  unsigned int v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  unint64_t v240;
  char v241;
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
  unint64_t v260;
  char v261;
  char v262;
  unsigned int v263;
  uint64_t v264;
  uint64_t v265;
  unint64_t v266;
  char v267;
  char v268;
  unsigned int v269;
  uint64_t v270;
  uint64_t v271;
  unint64_t v272;
  char v273;
  char v274;
  unsigned int v275;
  uint64_t v276;
  uint64_t v277;
  unint64_t v278;
  char v279;
  char v280;
  unsigned int v281;
  uint64_t v282;
  uint64_t v283;
  unint64_t v284;
  char v285;
  char v286;
  unsigned int v287;
  uint64_t v288;
  uint64_t v289;
  unint64_t v290;
  char v291;
  char v292;
  unsigned int v293;
  uint64_t v294;
  uint64_t v295;
  unint64_t v296;
  char v297;
  char v298;
  unsigned int v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  unint64_t v303;
  char v304;
  BMMomentsEventDataPR *v305;
  BMMomentsEventDataPR *gaPR;
  char v307;
  unsigned int v308;
  uint64_t v309;
  uint64_t v310;
  unint64_t v311;
  char v312;
  char v313;
  unsigned int v314;
  uint64_t v315;
  uint64_t v316;
  unint64_t v317;
  char v318;
  char v319;
  unsigned int v320;
  uint64_t v321;
  uint64_t v322;
  unint64_t v323;
  char v324;
  char v325;
  unsigned int v326;
  uint64_t v327;
  uint64_t v328;
  unint64_t v329;
  char v330;
  uint64_t v331;
  int v332;
  uint64_t v333;
  uint64_t v334;
  BOOL v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  NSArray *contactIDsInConversation;
  uint64_t v340;
  NSArray *photoMomentInferences;
  uint64_t v342;
  NSArray *photoMomentHolidays;
  int v344;
  BMMomentsEventDataEvent *v345;
  objc_super v347;
  uint64_t v348;
  uint64_t v349;

  v4 = a3;
  v347.receiver = self;
  v347.super_class = (Class)BMMomentsEventDataEvent;
  v5 = -[BMEventBase init](&v347, sel_init);
  if (!v5)
    goto LABEL_604;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (int *)MEMORY[0x1E0D82BF0];
  v10 = (int *)MEMORY[0x1E0D82BD8];
  v11 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v12 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v11])
        break;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v9;
        v17 = *(_QWORD *)&v4[v16];
        v18 = v17 + 1;
        if (v17 == -1 || v18 > *(_QWORD *)&v4[*v10])
          break;
        v19 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v17);
        *(_QWORD *)&v4[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0)
          goto LABEL_13;
        v13 += 7;
        v20 = v14++ >= 9;
        if (v20)
        {
          v15 = 0;
          v21 = v4[*v11];
          goto LABEL_15;
        }
      }
      v4[*v11] = 1;
LABEL_13:
      v21 = v4[*v11];
      if (v4[*v11])
        v15 = 0;
LABEL_15:
      if (v21 || (v15 & 7) == 4)
        break;
      switch((v15 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 288;
          goto LABEL_168;
        case 2u:
          v5->_hasRaw_startDate = 1;
          v25 = *v9;
          v26 = *(_QWORD *)&v4[v25];
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v27 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v26);
            *(_QWORD *)&v4[v25] = v26 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v27 = 0;
          }
          v337 = 24;
          goto LABEL_600;
        case 3u:
          v5->_hasRaw_endDate = 1;
          v28 = *v9;
          v29 = *(_QWORD *)&v4[v28];
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v27 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v29);
            *(_QWORD *)&v4[v28] = v29 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v27 = 0;
          }
          v337 = 40;
          goto LABEL_600;
        case 4u:
          v5->_hasRaw_creationDate = 1;
          v30 = *v9;
          v31 = *(_QWORD *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v27 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v31);
            *(_QWORD *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v27 = 0;
          }
          v337 = 56;
          goto LABEL_600;
        case 5u:
          v5->_hasRaw_sourceCreationDate = 1;
          v32 = *v9;
          v33 = *(_QWORD *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v27 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v33);
            *(_QWORD *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v27 = 0;
          }
          v337 = 72;
          goto LABEL_600;
        case 6u:
          v5->_hasRaw_expirationDate = 1;
          v34 = *v9;
          v35 = *(_QWORD *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v27 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v35);
            *(_QWORD *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v27 = 0;
          }
          v337 = 88;
          goto LABEL_600;
        case 7u:
          v36 = 0;
          v37 = 0;
          v38 = 0;
          while (2)
          {
            v39 = *v9;
            v40 = *(_QWORD *)&v4[v39];
            v41 = v40 + 1;
            if (v40 == -1 || v41 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v40);
              *(_QWORD *)&v4[v39] = v41;
              v38 |= (unint64_t)(v42 & 0x7F) << v36;
              if (v42 < 0)
              {
                v36 += 7;
                v20 = v37++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_375;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v38) = 0;
LABEL_375:
          if (v38 >= 0xC)
            LODWORD(v38) = 0;
          v331 = 140;
          goto LABEL_577;
        case 8u:
          v43 = 0;
          v44 = 0;
          v38 = 0;
          while (2)
          {
            v45 = *v9;
            v46 = *(_QWORD *)&v4[v45];
            v47 = v46 + 1;
            if (v46 == -1 || v47 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v46);
              *(_QWORD *)&v4[v45] = v47;
              v38 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                v20 = v44++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_381;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v38) = 0;
LABEL_381:
          if (v38 >= 0x19)
            LODWORD(v38) = 0;
          v331 = 144;
          goto LABEL_577;
        case 9u:
          v49 = 0;
          v50 = 0;
          v51 = 0;
          while (2)
          {
            v52 = *v9;
            v53 = *(_QWORD *)&v4[v52];
            v54 = v53 + 1;
            if (v53 == -1 || v54 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v55 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v53);
              *(_QWORD *)&v4[v52] = v54;
              v51 |= (unint64_t)(v55 & 0x7F) << v49;
              if (v55 < 0)
              {
                v49 += 7;
                v20 = v50++ >= 9;
                if (v20)
                {
                  v56 = 0;
                  goto LABEL_388;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v56 = 0;
          else
            v56 = v51;
LABEL_388:
          v332 = BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeDecode(v56);
          v333 = 148;
          goto LABEL_412;
        case 0xAu:
          v57 = 0;
          v58 = 0;
          v38 = 0;
          while (2)
          {
            v59 = *v9;
            v60 = *(_QWORD *)&v4[v59];
            v61 = v60 + 1;
            if (v60 == -1 || v61 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v62 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v60);
              *(_QWORD *)&v4[v59] = v61;
              v38 |= (unint64_t)(v62 & 0x7F) << v57;
              if (v62 < 0)
              {
                v57 += 7;
                v20 = v58++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_392;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v38) = 0;
LABEL_392:
          if (v38 >= 0x4E)
            LODWORD(v38) = 0;
          v331 = 152;
          goto LABEL_577;
        case 0xBu:
          v63 = 0;
          v64 = 0;
          v38 = 0;
          while (2)
          {
            v65 = *v9;
            v66 = *(_QWORD *)&v4[v65];
            v67 = v66 + 1;
            if (v66 == -1 || v67 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v68 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v66);
              *(_QWORD *)&v4[v65] = v67;
              v38 |= (unint64_t)(v68 & 0x7F) << v63;
              if (v68 < 0)
              {
                v63 += 7;
                v20 = v64++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_398;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v38) = 0;
LABEL_398:
          if (v38 >= 3)
            LODWORD(v38) = 0;
          v331 = 156;
          goto LABEL_577;
        case 0xCu:
          v69 = 0;
          v70 = 0;
          v38 = 0;
          while (2)
          {
            v71 = *v9;
            v72 = *(_QWORD *)&v4[v71];
            v73 = v72 + 1;
            if (v72 == -1 || v73 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v74 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v72);
              *(_QWORD *)&v4[v71] = v73;
              v38 |= (unint64_t)(v74 & 0x7F) << v69;
              if (v74 < 0)
              {
                v69 += 7;
                v20 = v70++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_404;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v38) = 0;
LABEL_404:
          if (v38 >= 3)
            LODWORD(v38) = 0;
          v331 = 160;
          goto LABEL_577;
        case 0xDu:
          v75 = 0;
          v76 = 0;
          v77 = 0;
          while (2)
          {
            v78 = *v9;
            v79 = *(_QWORD *)&v4[v78];
            v80 = v79 + 1;
            if (v79 == -1 || v80 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v81 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v79);
              *(_QWORD *)&v4[v78] = v80;
              v77 |= (unint64_t)(v81 & 0x7F) << v75;
              if (v81 < 0)
              {
                v75 += 7;
                v20 = v76++ >= 9;
                if (v20)
                {
                  v82 = 0;
                  goto LABEL_411;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v82 = 0;
          else
            v82 = v77;
LABEL_411:
          v332 = BMMomentsEventDataWorkoutActivityTypeDecode(v82);
          v333 = 164;
LABEL_412:
          *(_DWORD *)((char *)&v5->super.super.isa + v333) = v332;
          continue;
        case 0xEu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 296;
          goto LABEL_168;
        case 0xFu:
          v83 = 0;
          v84 = 0;
          v38 = 0;
          while (2)
          {
            v85 = *v9;
            v86 = *(_QWORD *)&v4[v85];
            v87 = v86 + 1;
            if (v86 == -1 || v87 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v88 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v86);
              *(_QWORD *)&v4[v85] = v87;
              v38 |= (unint64_t)(v88 & 0x7F) << v83;
              if (v88 < 0)
              {
                v83 += 7;
                v20 = v84++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_416;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v38) = 0;
LABEL_416:
          if (v38 >= 0x1D)
            LODWORD(v38) = 0;
          v331 = 168;
          goto LABEL_577;
        case 0x10u:
          v89 = 0;
          v90 = 0;
          v38 = 0;
          while (2)
          {
            v91 = *v9;
            v92 = *(_QWORD *)&v4[v91];
            v93 = v92 + 1;
            if (v92 == -1 || v93 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v94 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v92);
              *(_QWORD *)&v4[v91] = v93;
              v38 |= (unint64_t)(v94 & 0x7F) << v89;
              if (v94 < 0)
              {
                v89 += 7;
                v20 = v90++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_422;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v38) = 0;
LABEL_422:
          if (v38 >= 9)
            LODWORD(v38) = 0;
          v331 = 172;
          goto LABEL_577;
        case 0x11u:
          v95 = 0;
          v96 = 0;
          v97 = 0;
          v5->_hasMediaRepetitions = 1;
          while (2)
          {
            v98 = *v9;
            v99 = *(_QWORD *)&v4[v98];
            v100 = v99 + 1;
            if (v99 == -1 || v100 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v101 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v99);
              *(_QWORD *)&v4[v98] = v100;
              v97 |= (unint64_t)(v101 & 0x7F) << v95;
              if (v101 < 0)
              {
                v95 += 7;
                v20 = v96++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_428;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_428:
          v334 = 176;
          goto LABEL_558;
        case 0x12u:
          v102 = 0;
          v103 = 0;
          v97 = 0;
          v5->_hasMediaSumTimePlayed = 1;
          while (2)
          {
            v104 = *v9;
            v105 = *(_QWORD *)&v4[v104];
            v106 = v105 + 1;
            if (v105 == -1 || v106 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v107 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v105);
              *(_QWORD *)&v4[v104] = v106;
              v97 |= (unint64_t)(v107 & 0x7F) << v102;
              if (v107 < 0)
              {
                v102 += 7;
                v20 = v103++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_432;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_432:
          v334 = 180;
          goto LABEL_558;
        case 0x13u:
          v108 = 0;
          v109 = 0;
          v110 = 0;
          while (2)
          {
            v111 = *v9;
            v112 = *(_QWORD *)&v4[v111];
            v113 = v112 + 1;
            if (v112 == -1 || v113 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v114 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v112);
              *(_QWORD *)&v4[v111] = v113;
              v110 |= (unint64_t)(v114 & 0x7F) << v108;
              if (v114 < 0)
              {
                v108 += 7;
                if (v109++ > 8)
                {
                  v116 = 0;
                  goto LABEL_438;
                }
                continue;
              }
            }
            break;
          }
          v116 = 0;
          if (v4[*v11])
            LODWORD(v110) = 0;
          if (v110 <= 4)
            v116 = dword_1AEFE26C0[v110];
LABEL_438:
          v5->_sourceParty = v116;
          continue;
        case 0x14u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 304;
          goto LABEL_168;
        case 0x15u:
          v117 = 0;
          v118 = 0;
          v97 = 0;
          v5->_hasNumAudioMediaPlaySessionsPerDay = 1;
          while (2)
          {
            v119 = *v9;
            v120 = *(_QWORD *)&v4[v119];
            v121 = v120 + 1;
            if (v120 == -1 || v121 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v122 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v120);
              *(_QWORD *)&v4[v119] = v121;
              v97 |= (unint64_t)(v122 & 0x7F) << v117;
              if (v122 < 0)
              {
                v117 += 7;
                v20 = v118++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_442;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_442:
          v334 = 188;
          goto LABEL_558;
        case 0x16u:
          v5->_hasDurationAudioMediaPlaySessionsPerDay = 1;
          v123 = *v9;
          v124 = *(_QWORD *)&v4[v123];
          if (v124 <= 0xFFFFFFFFFFFFFFF7 && v124 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v27 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v124);
            *(_QWORD *)&v4[v123] = v124 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v27 = 0;
          }
          v337 = 312;
          goto LABEL_600;
        case 0x17u:
          v125 = 0;
          v126 = 0;
          v97 = 0;
          v5->_hasNumVideoMediaPlaySessionsPerDay = 1;
          while (2)
          {
            v127 = *v9;
            v128 = *(_QWORD *)&v4[v127];
            v129 = v128 + 1;
            if (v128 == -1 || v129 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v130 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v128);
              *(_QWORD *)&v4[v127] = v129;
              v97 |= (unint64_t)(v130 & 0x7F) << v125;
              if (v130 < 0)
              {
                v125 += 7;
                v20 = v126++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_446;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_446:
          v334 = 192;
          goto LABEL_558;
        case 0x18u:
          v5->_hasDurationVideoMediaPlaySessionsPerDay = 1;
          v131 = *v9;
          v132 = *(_QWORD *)&v4[v131];
          if (v132 <= 0xFFFFFFFFFFFFFFF7 && v132 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v27 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v132);
            *(_QWORD *)&v4[v131] = v132 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v27 = 0;
          }
          v337 = 320;
          goto LABEL_600;
        case 0x19u:
          v133 = 0;
          v134 = 0;
          v97 = 0;
          v5->_hasNumFirstPartyMediaPlaySessionsPerDay = 1;
          while (2)
          {
            v135 = *v9;
            v136 = *(_QWORD *)&v4[v135];
            v137 = v136 + 1;
            if (v136 == -1 || v137 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v138 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v136);
              *(_QWORD *)&v4[v135] = v137;
              v97 |= (unint64_t)(v138 & 0x7F) << v133;
              if (v138 < 0)
              {
                v133 += 7;
                v20 = v134++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_450;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_450:
          v334 = 196;
          goto LABEL_558;
        case 0x1Au:
          v139 = 0;
          v140 = 0;
          v97 = 0;
          v5->_hasNumThirdPartyMediaPlaySessionsPerDay = 1;
          while (2)
          {
            v141 = *v9;
            v142 = *(_QWORD *)&v4[v141];
            v143 = v142 + 1;
            if (v142 == -1 || v143 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v144 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v142);
              *(_QWORD *)&v4[v141] = v143;
              v97 |= (unint64_t)(v144 & 0x7F) << v139;
              if (v144 < 0)
              {
                v139 += 7;
                v20 = v140++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_454;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_454:
          v334 = 200;
          goto LABEL_558;
        case 0x1Bu:
          v145 = 0;
          v146 = 0;
          v97 = 0;
          v5->_hasNumContacts = 1;
          while (2)
          {
            v147 = *v9;
            v148 = *(_QWORD *)&v4[v147];
            v149 = v148 + 1;
            if (v148 == -1 || v149 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v150 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v148);
              *(_QWORD *)&v4[v147] = v149;
              v97 |= (unint64_t)(v150 & 0x7F) << v145;
              if (v150 < 0)
              {
                v145 += 7;
                v20 = v146++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_458;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_458:
          v334 = 204;
          goto LABEL_558;
        case 0x1Cu:
          PBReaderReadString();
          v151 = objc_claimAutoreleasedReturnValue();
          if (!v151)
            goto LABEL_606;
          v152 = (void *)v151;
          v153 = v6;
          goto LABEL_228;
        case 0x1Du:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 336;
LABEL_168:
          v154 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        case 0x1Eu:
          v5->_hasInteractionContactScore = 1;
          v155 = *v9;
          v156 = *(_QWORD *)&v4[v155];
          if (v156 <= 0xFFFFFFFFFFFFFFF7 && v156 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v27 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v156);
            *(_QWORD *)&v4[v155] = v156 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v27 = 0;
          }
          v337 = 344;
          goto LABEL_600;
        case 0x1Fu:
          v157 = 0;
          v158 = 0;
          v159 = 0;
          v5->_hasTextLikeMechanismIncluded = 1;
          while (2)
          {
            v160 = *v9;
            v161 = *(_QWORD *)&v4[v160];
            v162 = v161 + 1;
            if (v161 == -1 || v162 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v163 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v161);
              *(_QWORD *)&v4[v160] = v162;
              v159 |= (unint64_t)(v163 & 0x7F) << v157;
              if (v163 < 0)
              {
                v157 += 7;
                v20 = v158++ >= 9;
                if (v20)
                {
                  v159 = 0;
                  goto LABEL_462;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v159 = 0;
LABEL_462:
          v335 = v159 != 0;
          v336 = 106;
          goto LABEL_553;
        case 0x20u:
          v164 = 0;
          v165 = 0;
          v166 = 0;
          v5->_hasCallLikeMechanismIncluded = 1;
          while (2)
          {
            v167 = *v9;
            v168 = *(_QWORD *)&v4[v167];
            v169 = v168 + 1;
            if (v168 == -1 || v169 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v170 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v168);
              *(_QWORD *)&v4[v167] = v169;
              v166 |= (unint64_t)(v170 & 0x7F) << v164;
              if (v170 < 0)
              {
                v164 += 7;
                v20 = v165++ >= 9;
                if (v20)
                {
                  v166 = 0;
                  goto LABEL_466;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v166 = 0;
LABEL_466:
          v335 = v166 != 0;
          v336 = 108;
          goto LABEL_553;
        case 0x21u:
          v171 = 0;
          v172 = 0;
          v97 = 0;
          v5->_hasNumTextLikeInteractions = 1;
          while (2)
          {
            v173 = *v9;
            v174 = *(_QWORD *)&v4[v173];
            v175 = v174 + 1;
            if (v174 == -1 || v175 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v176 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v174);
              *(_QWORD *)&v4[v173] = v175;
              v97 |= (unint64_t)(v176 & 0x7F) << v171;
              if (v176 < 0)
              {
                v171 += 7;
                v20 = v172++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_470;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_470:
          v334 = 208;
          goto LABEL_558;
        case 0x22u:
          v177 = 0;
          v178 = 0;
          v97 = 0;
          v5->_hasNumAudioLikeInteractions = 1;
          while (2)
          {
            v179 = *v9;
            v180 = *(_QWORD *)&v4[v179];
            v181 = v180 + 1;
            if (v180 == -1 || v181 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v182 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v180);
              *(_QWORD *)&v4[v179] = v181;
              v97 |= (unint64_t)(v182 & 0x7F) << v177;
              if (v182 < 0)
              {
                v177 += 7;
                v20 = v178++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_474;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_474:
          v334 = 212;
          goto LABEL_558;
        case 0x23u:
          v183 = 0;
          v184 = 0;
          v97 = 0;
          v5->_hasNumVideoLikeInteractions = 1;
          while (2)
          {
            v185 = *v9;
            v186 = *(_QWORD *)&v4[v185];
            v187 = v186 + 1;
            if (v186 == -1 || v187 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v188 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v186);
              *(_QWORD *)&v4[v185] = v187;
              v97 |= (unint64_t)(v188 & 0x7F) << v183;
              if (v188 < 0)
              {
                v183 += 7;
                v20 = v184++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_478;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_478:
          v334 = 216;
          goto LABEL_558;
        case 0x24u:
          v5->_hasTotalDurationOfCallLikeInteractions = 1;
          v189 = *v9;
          v190 = *(_QWORD *)&v4[v189];
          if (v190 <= 0xFFFFFFFFFFFFFFF7 && v190 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v27 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v190);
            *(_QWORD *)&v4[v189] = v190 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v27 = 0;
          }
          v337 = 352;
          goto LABEL_600;
        case 0x25u:
          v5->_hasMinDurationOfCallLikeInteractions = 1;
          v191 = *v9;
          v192 = *(_QWORD *)&v4[v191];
          if (v192 <= 0xFFFFFFFFFFFFFFF7 && v192 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v27 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v192);
            *(_QWORD *)&v4[v191] = v192 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v27 = 0;
          }
          v337 = 360;
          goto LABEL_600;
        case 0x26u:
          v5->_hasMaxDurationOfCallLikeInteractions = 1;
          v193 = *v9;
          v194 = *(_QWORD *)&v4[v193];
          if (v194 <= 0xFFFFFFFFFFFFFFF7 && v194 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v27 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v194);
            *(_QWORD *)&v4[v193] = v194 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v27 = 0;
          }
          v337 = 368;
LABEL_600:
          *(Class *)((char *)&v5->super.super.isa + v337) = v27;
          continue;
        case 0x27u:
          v195 = 0;
          v196 = 0;
          v38 = 0;
          while (2)
          {
            v197 = *v9;
            v198 = *(_QWORD *)&v4[v197];
            v199 = v198 + 1;
            if (v198 == -1 || v199 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v200 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v198);
              *(_QWORD *)&v4[v197] = v199;
              v38 |= (unint64_t)(v200 & 0x7F) << v195;
              if (v200 < 0)
              {
                v195 += 7;
                v20 = v196++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_482;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v38) = 0;
LABEL_482:
          if (v38 >= 3)
            LODWORD(v38) = 0;
          v331 = 264;
          goto LABEL_577;
        case 0x28u:
          v348 = 0;
          v349 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_606;
          v201 = -[BMMomentsEventDataPhotoMomentInference initByReadFrom:]([BMMomentsEventDataPhotoMomentInference alloc], "initByReadFrom:", v4);
          if (!v201)
            goto LABEL_606;
          v202 = v201;
          objc_msgSend(v7, "addObject:", v201);
          PBReaderRecallMark();

          continue;
        case 0x29u:
          PBReaderReadString();
          v203 = objc_claimAutoreleasedReturnValue();
          if (!v203)
            goto LABEL_606;
          v152 = (void *)v203;
          v153 = v8;
LABEL_228:
          objc_msgSend(v153, "addObject:", v152);

          continue;
        case 0x2Au:
          v204 = 0;
          v205 = 0;
          v97 = 0;
          v5->_hasNumPhotoMomentHolidays = 1;
          while (2)
          {
            v206 = *v9;
            v207 = *(_QWORD *)&v4[v206];
            v208 = v207 + 1;
            if (v207 == -1 || v208 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v209 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v207);
              *(_QWORD *)&v4[v206] = v208;
              v97 |= (unint64_t)(v209 & 0x7F) << v204;
              if (v209 < 0)
              {
                v204 += 7;
                v20 = v205++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_488;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_488:
          v334 = 268;
          goto LABEL_558;
        case 0x2Bu:
          v210 = 0;
          v211 = 0;
          v97 = 0;
          v5->_hasNumPhotoMomentInferences = 1;
          while (2)
          {
            v212 = *v9;
            v213 = *(_QWORD *)&v4[v212];
            v214 = v213 + 1;
            if (v213 == -1 || v214 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v215 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v213);
              *(_QWORD *)&v4[v212] = v214;
              v97 |= (unint64_t)(v215 & 0x7F) << v210;
              if (v215 < 0)
              {
                v210 += 7;
                v20 = v211++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_492;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_492:
          v334 = 272;
          goto LABEL_558;
        case 0x2Cu:
          v216 = 0;
          v217 = 0;
          v97 = 0;
          v5->_hasNumPhotoMomentPublicEvents = 1;
          while (2)
          {
            v218 = *v9;
            v219 = *(_QWORD *)&v4[v218];
            v220 = v219 + 1;
            if (v219 == -1 || v220 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v221 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v219);
              *(_QWORD *)&v4[v218] = v220;
              v97 |= (unint64_t)(v221 & 0x7F) << v216;
              if (v221 < 0)
              {
                v216 += 7;
                v20 = v217++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_496;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_496:
          v334 = 276;
          goto LABEL_558;
        case 0x2Du:
          v222 = 0;
          v223 = 0;
          v97 = 0;
          v5->_hasNumPhotoMomentPersons = 1;
          while (2)
          {
            v224 = *v9;
            v225 = *(_QWORD *)&v4[v224];
            v226 = v225 + 1;
            if (v225 == -1 || v226 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v227 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v225);
              *(_QWORD *)&v4[v224] = v226;
              v97 |= (unint64_t)(v227 & 0x7F) << v222;
              if (v227 < 0)
              {
                v222 += 7;
                v20 = v223++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_500;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_500:
          v334 = 280;
          goto LABEL_558;
        case 0x2Eu:
          v228 = 0;
          v229 = 0;
          v230 = 0;
          v5->_hasIsFamilyInPhotoMoment = 1;
          while (2)
          {
            v231 = *v9;
            v232 = *(_QWORD *)&v4[v231];
            v233 = v232 + 1;
            if (v232 == -1 || v233 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v234 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v232);
              *(_QWORD *)&v4[v231] = v233;
              v230 |= (unint64_t)(v234 & 0x7F) << v228;
              if (v234 < 0)
              {
                v228 += 7;
                v20 = v229++ >= 9;
                if (v20)
                {
                  v230 = 0;
                  goto LABEL_504;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v230 = 0;
LABEL_504:
          v335 = v230 != 0;
          v336 = 128;
          goto LABEL_553;
        case 0x2Fu:
          v235 = 0;
          v236 = 0;
          v237 = 0;
          v5->_hasMomentIncludesFavoritedAsset = 1;
          while (2)
          {
            v238 = *v9;
            v239 = *(_QWORD *)&v4[v238];
            v240 = v239 + 1;
            if (v239 == -1 || v240 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v241 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v239);
              *(_QWORD *)&v4[v238] = v240;
              v237 |= (unint64_t)(v241 & 0x7F) << v235;
              if (v241 < 0)
              {
                v235 += 7;
                v20 = v236++ >= 9;
                if (v20)
                {
                  v237 = 0;
                  goto LABEL_508;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v237 = 0;
LABEL_508:
          v335 = v237 != 0;
          v336 = 130;
          goto LABEL_553;
        case 0x30u:
          v242 = 0;
          v243 = 0;
          v244 = 0;
          v5->_hasMomentIncludesVideo = 1;
          while (2)
          {
            v245 = *v9;
            v246 = *(_QWORD *)&v4[v245];
            v247 = v246 + 1;
            if (v246 == -1 || v247 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v248 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v246);
              *(_QWORD *)&v4[v245] = v247;
              v244 |= (unint64_t)(v248 & 0x7F) << v242;
              if (v248 < 0)
              {
                v242 += 7;
                v20 = v243++ >= 9;
                if (v20)
                {
                  v244 = 0;
                  goto LABEL_512;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v244 = 0;
LABEL_512:
          v335 = v244 != 0;
          v336 = 132;
          goto LABEL_553;
        case 0x31u:
          v249 = 0;
          v250 = 0;
          v251 = 0;
          v5->_hasMomentIncludesPhoto = 1;
          while (2)
          {
            v252 = *v9;
            v253 = *(_QWORD *)&v4[v252];
            v254 = v253 + 1;
            if (v253 == -1 || v254 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v255 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v253);
              *(_QWORD *)&v4[v252] = v254;
              v251 |= (unint64_t)(v255 & 0x7F) << v249;
              if (v255 < 0)
              {
                v249 += 7;
                v20 = v250++ >= 9;
                if (v20)
                {
                  v251 = 0;
                  goto LABEL_516;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v251 = 0;
LABEL_516:
          v335 = v251 != 0;
          v336 = 134;
          goto LABEL_553;
        case 0x32u:
          v256 = 0;
          v257 = 0;
          v38 = 0;
          while (2)
          {
            v258 = *v9;
            v259 = *(_QWORD *)&v4[v258];
            v260 = v259 + 1;
            if (v259 == -1 || v260 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v261 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v259);
              *(_QWORD *)&v4[v258] = v260;
              v38 |= (unint64_t)(v261 & 0x7F) << v256;
              if (v261 < 0)
              {
                v256 += 7;
                v20 = v257++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_520;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v38) = 0;
LABEL_520:
          if (v38 >= 0xD)
            LODWORD(v38) = 0;
          v331 = 220;
          goto LABEL_577;
        case 0x33u:
          v262 = 0;
          v263 = 0;
          v97 = 0;
          v5->_hasNumAttendees = 1;
          while (2)
          {
            v264 = *v9;
            v265 = *(_QWORD *)&v4[v264];
            v266 = v265 + 1;
            if (v265 == -1 || v266 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v267 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v265);
              *(_QWORD *)&v4[v264] = v266;
              v97 |= (unint64_t)(v267 & 0x7F) << v262;
              if (v267 < 0)
              {
                v262 += 7;
                v20 = v263++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_526;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_526:
          v334 = 224;
          goto LABEL_558;
        case 0x34u:
          v268 = 0;
          v269 = 0;
          v97 = 0;
          v5->_hasNumtripParts = 1;
          while (2)
          {
            v270 = *v9;
            v271 = *(_QWORD *)&v4[v270];
            v272 = v271 + 1;
            if (v271 == -1 || v272 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v273 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v271);
              *(_QWORD *)&v4[v270] = v272;
              v97 |= (unint64_t)(v273 & 0x7F) << v268;
              if (v273 < 0)
              {
                v268 += 7;
                v20 = v269++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_530;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_530:
          v334 = 228;
          goto LABEL_558;
        case 0x35u:
          v274 = 0;
          v275 = 0;
          v38 = 0;
          while (2)
          {
            v276 = *v9;
            v277 = *(_QWORD *)&v4[v276];
            v278 = v277 + 1;
            if (v277 == -1 || v278 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v279 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v277);
              *(_QWORD *)&v4[v276] = v278;
              v38 |= (unint64_t)(v279 & 0x7F) << v274;
              if (v279 < 0)
              {
                v274 += 7;
                v20 = v275++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_534;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v38) = 0;
LABEL_534:
          if (v38 >= 3)
            LODWORD(v38) = 0;
          v331 = 232;
          goto LABEL_577;
        case 0x36u:
          v280 = 0;
          v281 = 0;
          v97 = 0;
          v5->_hasNumScoredTopics = 1;
          while (2)
          {
            v282 = *v9;
            v283 = *(_QWORD *)&v4[v282];
            v284 = v283 + 1;
            if (v283 == -1 || v284 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v285 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v283);
              *(_QWORD *)&v4[v282] = v284;
              v97 |= (unint64_t)(v285 & 0x7F) << v280;
              if (v285 < 0)
              {
                v280 += 7;
                v20 = v281++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_540;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_540:
          v334 = 236;
          goto LABEL_558;
        case 0x37u:
          v286 = 0;
          v287 = 0;
          v97 = 0;
          v5->_hasNumItemAuthors = 1;
          while (2)
          {
            v288 = *v9;
            v289 = *(_QWORD *)&v4[v288];
            v290 = v289 + 1;
            if (v289 == -1 || v290 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v291 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v289);
              *(_QWORD *)&v4[v288] = v290;
              v97 |= (unint64_t)(v291 & 0x7F) << v286;
              if (v291 < 0)
              {
                v286 += 7;
                v20 = v287++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_544;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_544:
          v334 = 240;
          goto LABEL_558;
        case 0x38u:
          v292 = 0;
          v293 = 0;
          v97 = 0;
          v5->_hasNumItemRecipients = 1;
          while (2)
          {
            v294 = *v9;
            v295 = *(_QWORD *)&v4[v294];
            v296 = v295 + 1;
            if (v295 == -1 || v296 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v297 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v295);
              *(_QWORD *)&v4[v294] = v296;
              v97 |= (unint64_t)(v297 & 0x7F) << v292;
              if (v297 < 0)
              {
                v292 += 7;
                v20 = v293++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_548;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_548:
          v334 = 244;
          goto LABEL_558;
        case 0x39u:
          v298 = 0;
          v299 = 0;
          v300 = 0;
          v5->_hasIsGatheringComplete = 1;
          while (2)
          {
            v301 = *v9;
            v302 = *(_QWORD *)&v4[v301];
            v303 = v302 + 1;
            if (v302 == -1 || v303 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v304 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v302);
              *(_QWORD *)&v4[v301] = v303;
              v300 |= (unint64_t)(v304 & 0x7F) << v298;
              if (v304 < 0)
              {
                v298 += 7;
                v20 = v299++ >= 9;
                if (v20)
                {
                  v300 = 0;
                  goto LABEL_552;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v300 = 0;
LABEL_552:
          v335 = v300 != 0;
          v336 = 121;
LABEL_553:
          *((_BYTE *)&v5->super.super.isa + v336) = v335;
          continue;
        case 0x3Au:
          v348 = 0;
          v349 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_606;
          v305 = -[BMMomentsEventDataPR initByReadFrom:]([BMMomentsEventDataPR alloc], "initByReadFrom:", v4);
          if (!v305)
            goto LABEL_606;
          gaPR = v5->_gaPR;
          v5->_gaPR = v305;

          PBReaderRecallMark();
          continue;
        case 0x3Bu:
          v307 = 0;
          v308 = 0;
          v97 = 0;
          v5->_hasPCount = 1;
          while (2)
          {
            v309 = *v9;
            v310 = *(_QWORD *)&v4[v309];
            v311 = v310 + 1;
            if (v310 == -1 || v311 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v312 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v310);
              *(_QWORD *)&v4[v309] = v311;
              v97 |= (unint64_t)(v312 & 0x7F) << v307;
              if (v312 < 0)
              {
                v307 += 7;
                v20 = v308++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_557;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v97) = 0;
LABEL_557:
          v334 = 248;
LABEL_558:
          *(_DWORD *)((char *)&v5->super.super.isa + v334) = v97;
          continue;
        case 0x3Cu:
          v313 = 0;
          v314 = 0;
          v38 = 0;
          while (2)
          {
            v315 = *v9;
            v316 = *(_QWORD *)&v4[v315];
            v317 = v316 + 1;
            if (v316 == -1 || v317 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v318 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v316);
              *(_QWORD *)&v4[v315] = v317;
              v38 |= (unint64_t)(v318 & 0x7F) << v313;
              if (v318 < 0)
              {
                v313 += 7;
                v20 = v314++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_562;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v38) = 0;
LABEL_562:
          if (v38 >= 0x12)
            LODWORD(v38) = 0;
          v331 = 252;
          goto LABEL_577;
        case 0x3Du:
          v319 = 0;
          v320 = 0;
          v38 = 0;
          while (2)
          {
            v321 = *v9;
            v322 = *(_QWORD *)&v4[v321];
            v323 = v322 + 1;
            if (v322 == -1 || v323 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v324 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v322);
              *(_QWORD *)&v4[v321] = v323;
              v38 |= (unint64_t)(v324 & 0x7F) << v319;
              if (v324 < 0)
              {
                v319 += 7;
                v20 = v320++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_568;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v38) = 0;
LABEL_568:
          if (v38 >= 4)
            LODWORD(v38) = 0;
          v331 = 256;
          goto LABEL_577;
        case 0x3Eu:
          v325 = 0;
          v326 = 0;
          v38 = 0;
          break;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_606:

          goto LABEL_603;
      }
      while (1)
      {
        v327 = *v9;
        v328 = *(_QWORD *)&v4[v327];
        v329 = v328 + 1;
        if (v328 == -1 || v329 > *(_QWORD *)&v4[*v10])
          break;
        v330 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v328);
        *(_QWORD *)&v4[v327] = v329;
        v38 |= (unint64_t)(v330 & 0x7F) << v325;
        if ((v330 & 0x80) == 0)
          goto LABEL_572;
        v325 += 7;
        v20 = v326++ >= 9;
        if (v20)
        {
          LODWORD(v38) = 0;
          goto LABEL_574;
        }
      }
      v4[*v11] = 1;
LABEL_572:
      if (v4[*v11])
        LODWORD(v38) = 0;
LABEL_574:
      if (v38 >= 6)
        LODWORD(v38) = 0;
      v331 = 260;
LABEL_577:
      *(_DWORD *)((char *)&v5->super.super.isa + v331) = v38;
    }
    while (*(_QWORD *)&v4[*v9] < *(_QWORD *)&v4[*v10]);
  }
  v338 = objc_msgSend(v6, "copy");
  contactIDsInConversation = v5->_contactIDsInConversation;
  v5->_contactIDsInConversation = (NSArray *)v338;

  v340 = objc_msgSend(v7, "copy");
  photoMomentInferences = v5->_photoMomentInferences;
  v5->_photoMomentInferences = (NSArray *)v340;

  v342 = objc_msgSend(v8, "copy");
  photoMomentHolidays = v5->_photoMomentHolidays;
  v5->_photoMomentHolidays = (NSArray *)v342;

  v344 = v4[*v11];
  if (v344)
LABEL_603:
    v345 = 0;
  else
LABEL_604:
    v345 = v5;

  return v345;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_eventIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_startDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_endDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_creationDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_sourceCreationDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_expirationDate)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_workoutBundleID)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasMediaRepetitions)
    PBDataWriterWriteInt32Field();
  if (self->_hasMediaSumTimePlayed)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  if (self->_mediaPlayerBundleID)
    PBDataWriterWriteStringField();
  if (self->_hasNumAudioMediaPlaySessionsPerDay)
    PBDataWriterWriteInt32Field();
  if (self->_hasDurationAudioMediaPlaySessionsPerDay)
    PBDataWriterWriteDoubleField();
  if (self->_hasNumVideoMediaPlaySessionsPerDay)
    PBDataWriterWriteInt32Field();
  if (self->_hasDurationVideoMediaPlaySessionsPerDay)
    PBDataWriterWriteDoubleField();
  if (self->_hasNumFirstPartyMediaPlaySessionsPerDay)
    PBDataWriterWriteInt32Field();
  if (self->_hasNumThirdPartyMediaPlaySessionsPerDay)
    PBDataWriterWriteInt32Field();
  if (self->_hasNumContacts)
    PBDataWriterWriteInt32Field();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_contactIDsInConversation;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v7);
  }

  if (self->_contactIDMostSignificantInConversation)
    PBDataWriterWriteStringField();
  if (self->_hasInteractionContactScore)
    PBDataWriterWriteDoubleField();
  if (self->_hasTextLikeMechanismIncluded)
    PBDataWriterWriteBOOLField();
  if (self->_hasCallLikeMechanismIncluded)
    PBDataWriterWriteBOOLField();
  if (self->_hasNumTextLikeInteractions)
    PBDataWriterWriteInt32Field();
  if (self->_hasNumAudioLikeInteractions)
    PBDataWriterWriteInt32Field();
  if (self->_hasNumVideoLikeInteractions)
    PBDataWriterWriteInt32Field();
  if (self->_hasTotalDurationOfCallLikeInteractions)
    PBDataWriterWriteDoubleField();
  if (self->_hasMinDurationOfCallLikeInteractions)
    PBDataWriterWriteDoubleField();
  if (self->_hasMaxDurationOfCallLikeInteractions)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = self->_photoMomentInferences;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v14);
        v25 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v15, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v12);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_photoMomentHolidays;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteStringField();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
    }
    while (v18);
  }

  if (self->_hasNumPhotoMomentHolidays)
    PBDataWriterWriteInt32Field();
  if (self->_hasNumPhotoMomentInferences)
    PBDataWriterWriteInt32Field();
  if (self->_hasNumPhotoMomentPublicEvents)
    PBDataWriterWriteInt32Field();
  if (self->_hasNumPhotoMomentPersons)
    PBDataWriterWriteInt32Field();
  if (self->_hasIsFamilyInPhotoMoment)
    PBDataWriterWriteBOOLField();
  if (self->_hasMomentIncludesFavoritedAsset)
    PBDataWriterWriteBOOLField();
  if (self->_hasMomentIncludesVideo)
    PBDataWriterWriteBOOLField();
  if (self->_hasMomentIncludesPhoto)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  if (self->_hasNumAttendees)
    PBDataWriterWriteInt32Field();
  if (self->_hasNumtripParts)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasNumScoredTopics)
    PBDataWriterWriteInt32Field();
  if (self->_hasNumItemAuthors)
    PBDataWriterWriteInt32Field();
  if (self->_hasNumItemRecipients)
    PBDataWriterWriteInt32Field();
  if (self->_hasIsGatheringComplete)
    PBDataWriterWriteBOOLField();
  if (self->_gaPR)
  {
    v25 = 0;
    PBDataWriterPlaceMark();
    -[BMMomentsEventDataPR writeTo:](self->_gaPR, "writeTo:", v4, v21);
    PBDataWriterRecallMark();
  }
  if (self->_hasPCount)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMomentsEventDataEvent writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEventDataEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  BMMomentsEventDataEvent *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id *v72;
  id v73;
  uint64_t v74;
  id v75;
  id v76;
  uint64_t v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  id v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  id v125;
  id v126;
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
  void *v143;
  void *v144;
  int v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  id v150;
  id v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  id v155;
  id v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  id v160;
  uint64_t v161;
  id v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  id v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  id v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  void *v184;
  id v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  id v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  id v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  id v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  id v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  uint64_t v205;
  id v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  id v210;
  uint64_t v211;
  id v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  id v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  id v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  uint64_t v227;
  void *v228;
  uint64_t v229;
  void *v230;
  uint64_t v231;
  void *v232;
  uint64_t v233;
  void *v234;
  uint64_t v235;
  void *v236;
  uint64_t v237;
  void *v238;
  uint64_t v239;
  void *v240;
  uint64_t v241;
  void *v242;
  id v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  id v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  id v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  id v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  id v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  id v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  id v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  id v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  id v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  id v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  id v283;
  void *v284;
  void *v285;
  int v286;
  uint64_t v287;
  uint64_t v288;
  id v289;
  uint64_t i;
  void *v291;
  id v292;
  BMMomentsEventDataPhotoMomentInference *v293;
  BMMomentsEventDataPhotoMomentInference *v294;
  id v295;
  void *v296;
  void *v297;
  int v298;
  id *v299;
  id v300;
  uint64_t v301;
  uint64_t v302;
  void *v303;
  id v304;
  uint64_t v305;
  void *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  void *v311;
  id v312;
  uint64_t v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  id v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  id v322;
  uint64_t v323;
  uint64_t v324;
  void *v325;
  uint64_t v326;
  id v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  id v331;
  uint64_t v332;
  id v333;
  uint64_t v334;
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
  void *v346;
  uint64_t v347;
  void *v348;
  void *v349;
  id v350;
  uint64_t v351;
  void *v352;
  id v353;
  uint64_t v354;
  id v355;
  uint64_t v356;
  id v357;
  id v358;
  uint64_t v359;
  id v360;
  uint64_t v361;
  id v362;
  id v363;
  BMMomentsEventDataPR *v364;
  id v365;
  void *v366;
  id v367;
  uint64_t v368;
  id v369;
  uint64_t v370;
  id v371;
  uint64_t v372;
  id v373;
  uint64_t v374;
  id v375;
  uint64_t v376;
  id v377;
  uint64_t v378;
  uint64_t v379;
  void *v380;
  id v381;
  uint64_t v382;
  id v383;
  id v384;
  id v385;
  id v386;
  int v387;
  int v388;
  unsigned int v389;
  unsigned int v390;
  id v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  void *v396;
  id v397;
  uint64_t v398;
  void *v399;
  void *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  int v407;
  int v408;
  unsigned int v409;
  unsigned int v410;
  int v411;
  unsigned int v412;
  unsigned int v413;
  unsigned int v414;
  unsigned int v415;
  unsigned int v416;
  id v417;
  id v418;
  void *v419;
  id v420;
  id v421;
  void *v422;
  void *v423;
  void *v424;
  id v425;
  BMMomentsEventDataPR *v426;
  id v427;
  id v428;
  void *v429;
  id v430;
  id v431;
  void *v432;
  void *v433;
  id v434;
  void *v435;
  id v436;
  void *v437;
  id v438;
  id v439;
  void *v440;
  void *v441;
  id v442;
  id v443;
  void *v444;
  id v445;
  void *v446;
  void *v447;
  id v448;
  void *v449;
  id v450;
  void *v451;
  id v452;
  void *v453;
  void *v454;
  id v455;
  void *v456;
  void *v457;
  id v458;
  id v459;
  void *v460;
  id v461;
  void *v462;
  id v463;
  void *v464;
  id v465;
  void *v466;
  id v467;
  void *v468;
  id v469;
  void *v470;
  id v471;
  void *v472;
  id v473;
  id v474;
  void *v475;
  void *v476;
  void *v477;
  id v478;
  void *v479;
  id v480;
  void *v481;
  void *v482;
  void *v483;
  id v484;
  void *v485;
  id v486;
  void *v487;
  id v488;
  uint64_t v489;
  id v490;
  void *v491;
  id v492;
  id v493;
  void *v494;
  id v495;
  void *v496;
  id v497;
  void *v498;
  id v499;
  void *v500;
  id v501;
  void *v502;
  void *v503;
  id v504;
  id obj;
  void *v506;
  id v507;
  void *v508;
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
  id v519;
  void *v520;
  id v521;
  void *v522;
  id v523;
  void *v524;
  void *v525;
  id v526;
  void *v527;
  id v528;
  void *v529;
  id v530;
  void *v531;
  id v532;
  void *v533;
  void *v534;
  id v535;
  void *v536;
  id v537;
  void *v538;
  id *v539;
  id v540;
  void *v541;
  id v542;
  id v543;
  void *v544;
  BMMomentsEventDataEvent *v545;
  unsigned int v547;
  void *v548;
  id v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  id v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  __int128 v561;
  __int128 v562;
  uint64_t v563;
  void *v564;
  uint64_t v565;
  id v566;
  uint64_t v567;
  id v568;
  uint64_t v569;
  id v570;
  uint64_t v571;
  BMMomentsEventDataPR *v572;
  uint64_t v573;
  id v574;
  uint64_t v575;
  id v576;
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
  id v590;
  uint64_t v591;
  id v592;
  uint64_t v593;
  void *v594;
  uint64_t v595;
  void *v596;
  uint64_t v597;
  id v598;
  uint64_t v599;
  id v600;
  uint64_t v601;
  id v602;
  uint64_t v603;
  id v604;
  uint64_t v605;
  void *v606;
  uint64_t v607;
  void *v608;
  _BYTE v609[128];
  uint64_t v610;
  void *v611;
  uint64_t v612;
  void *v613;
  uint64_t v614;
  void *v615;
  _BYTE v616[128];
  uint64_t v617;
  void *v618;
  uint64_t v619;
  id v620;
  uint64_t v621;
  id v622;
  uint64_t v623;
  id v624;
  uint64_t v625;
  id v626;
  uint64_t v627;
  id v628;
  uint64_t v629;
  id v630;
  uint64_t v631;
  id v632;
  uint64_t v633;
  id v634;
  uint64_t v635;
  id v636;
  uint64_t v637;
  id v638;
  uint64_t v639;
  id v640;
  uint64_t v641;
  void *v642;
  uint64_t v643;
  void *v644;
  _BYTE v645[128];
  uint64_t v646;
  void *v647;
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
  id v663;
  uint64_t v664;
  id v665;
  uint64_t v666;
  id v667;
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
  id v679;
  uint64_t v680;
  id v681;
  uint64_t v682;
  id v683;
  uint64_t v684;
  id v685;
  uint64_t v686;
  id v687;
  uint64_t v688;
  id v689;
  uint64_t v690;
  id v691;
  uint64_t v692;
  id v693;
  uint64_t v694;
  id v695;
  uint64_t v696;
  id *v697;
  uint64_t v698;
  void *v699;
  uint64_t v700;
  _QWORD v701[4];

  v701[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eventIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v545 = self;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("startDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v543 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      v10 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v9, "doubleValue");
      v543 = (id)objc_msgSend(v10, "initWithTimeIntervalSince1970:");
LABEL_15:

      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
      v16 = v8;
      objc_msgSend(v9, "dateFromString:", v16);
      v543 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v543 = v8;
LABEL_16:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("endDate"));
      v17 = objc_claimAutoreleasedReturnValue();
      v544 = (void *)v17;
      if (!v17 || (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v542 = 0;
        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v18;
        v20 = objc_alloc(MEMORY[0x1E0C99D68]);
        objc_msgSend(v19, "doubleValue");
        v542 = (id)objc_msgSend(v20, "initWithTimeIntervalSince1970:");
LABEL_23:

        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        v21 = v18;
        objc_msgSend(v19, "dateFromString:", v21);
        v542 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v542 = v18;
LABEL_24:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("creationDate"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v548 = v22;
        if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v539 = 0;
          goto LABEL_32;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = v22;
          v24 = objc_alloc(MEMORY[0x1E0C99D68]);
          objc_msgSend(v23, "doubleValue");
          v25 = v24;
          v22 = v548;
          v539 = (id *)objc_msgSend(v25, "initWithTimeIntervalSince1970:");
LABEL_31:

          goto LABEL_32;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          v26 = v22;
          objc_msgSend(v23, "dateFromString:", v26);
          v539 = (id *)objc_claimAutoreleasedReturnValue();

          v22 = v548;
          goto LABEL_31;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v539 = v22;
LABEL_32:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sourceCreationDate"));
          v27 = objc_claimAutoreleasedReturnValue();
          v541 = (void *)v27;
          if (!v27 || (v28 = (void *)v27, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v540 = 0;
            goto LABEL_40;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v29 = v28;
            v30 = objc_alloc(MEMORY[0x1E0C99D68]);
            objc_msgSend(v29, "doubleValue");
            v540 = (id)objc_msgSend(v30, "initWithTimeIntervalSince1970:");
LABEL_39:

            goto LABEL_40;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v29 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
            v31 = v28;
            objc_msgSend(v29, "dateFromString:", v31);
            v540 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_39;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v540 = v28;
LABEL_40:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("expirationDate"));
            v32 = objc_claimAutoreleasedReturnValue();
            v538 = (void *)v32;
            if (!v32 || (v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v537 = 0;
              goto LABEL_48;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v34 = v33;
              v35 = objc_alloc(MEMORY[0x1E0C99D68]);
              objc_msgSend(v34, "doubleValue");
              v537 = (id)objc_msgSend(v35, "initWithTimeIntervalSince1970:");
LABEL_47:

              goto LABEL_48;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v34 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
              v36 = v33;
              objc_msgSend(v34, "dateFromString:", v36);
              v537 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_47;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v537 = v33;
LABEL_48:
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("provider"));
              v37 = objc_claimAutoreleasedReturnValue();
              v536 = (void *)v37;
              if (!v37 || (v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v535 = 0;
                v22 = v548;
                goto LABEL_56;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v535 = v38;
LABEL_55:
                v22 = v548;

LABEL_56:
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("category"));
                v40 = objc_claimAutoreleasedReturnValue();
                v534 = (void *)v40;
                if (!v40 || (v41 = (void *)v40, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v42 = 0;
                  goto LABEL_64;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v42 = v41;
LABEL_63:

LABEL_64:
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("placeUserType"));
                  v44 = objc_claimAutoreleasedReturnValue();
                  v533 = (void *)v44;
                  if (!v44 || (v45 = (void *)v44, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v532 = 0;
                    goto LABEL_72;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v532 = v45;
LABEL_71:

LABEL_72:
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("poiCategory"));
                    v51 = objc_claimAutoreleasedReturnValue();
                    v531 = (void *)v51;
                    if (!v51 || (v52 = (void *)v51, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v530 = 0;
                      goto LABEL_80;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v530 = v52;
LABEL_79:

LABEL_80:
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("placeDiscovery"));
                      v54 = objc_claimAutoreleasedReturnValue();
                      v529 = (void *)v54;
                      if (!v54 || (v55 = (void *)v54, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v528 = 0;
                        goto LABEL_88;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v528 = v55;
LABEL_87:

LABEL_88:
                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("locationMode"));
                        v57 = objc_claimAutoreleasedReturnValue();
                        v527 = (void *)v57;
                        if (!v57 || (v58 = (void *)v57, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v526 = 0;
                          goto LABEL_96;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v526 = v58;
LABEL_95:

LABEL_96:
                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("workoutType"));
                          v60 = objc_claimAutoreleasedReturnValue();
                          v522 = (void *)v60;
                          if (!v60 || (v61 = (void *)v60, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v521 = 0;
                            goto LABEL_104;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v521 = v61;
LABEL_103:

LABEL_104:
                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("workoutBundleID"));
                            v63 = objc_claimAutoreleasedReturnValue();
                            v520 = (void *)v63;
                            if (!v63 || (v64 = (void *)v63, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v519 = 0;
                              goto LABEL_107;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v519 = v64;
LABEL_107:
                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mediaGenre"));
                              v65 = objc_claimAutoreleasedReturnValue();
                              v518 = (void *)v65;
                              if (!v65 || (v66 = (void *)v65, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v517 = 0;
                                goto LABEL_132;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v517 = v66;
LABEL_131:

LABEL_132:
                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mediaType"));
                                v77 = objc_claimAutoreleasedReturnValue();
                                v516 = (void *)v77;
                                if (!v77 || (v78 = (void *)v77, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v515 = 0;
                                  goto LABEL_142;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v515 = v78;
LABEL_141:

LABEL_142:
                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mediaRepetitions"));
                                  v84 = objc_claimAutoreleasedReturnValue();
                                  v514 = (void *)v84;
                                  if (!v84
                                    || (v85 = (void *)v84, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v513 = 0;
                                    goto LABEL_145;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v513 = v85;
LABEL_145:
                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mediaSumTimePlayed"));
                                    v86 = objc_claimAutoreleasedReturnValue();
                                    v512 = (void *)v86;
                                    if (!v86
                                      || (v87 = (void *)v86, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v511 = 0;
                                      goto LABEL_148;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v511 = v87;
LABEL_148:
                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sourceParty"));
                                      v88 = objc_claimAutoreleasedReturnValue();
                                      v510 = (void *)v88;
                                      if (!v88
                                        || (v89 = (void *)v88, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v509 = 0;
                                        goto LABEL_178;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v509 = v89;
LABEL_177:

LABEL_178:
                                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mediaPlayerBundleID"));
                                        v127 = objc_claimAutoreleasedReturnValue();
                                        v508 = (void *)v127;
                                        if (!v127
                                          || (v128 = (void *)v127, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v503 = v42;
                                          v507 = 0;
                                          goto LABEL_181;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v503 = v42;
                                          v507 = v128;
LABEL_181:
                                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numAudioMediaPlaySessionsPerDay"));
                                          v129 = objc_claimAutoreleasedReturnValue();
                                          v506 = (void *)v129;
                                          if (!v129
                                            || (v130 = (void *)v129,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            v504 = 0;
                                            goto LABEL_184;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v504 = v130;
LABEL_184:
                                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("durationAudioMediaPlaySessionsPerDay"));
                                            v131 = objc_claimAutoreleasedReturnValue();
                                            v502 = (void *)v131;
                                            if (!v131
                                              || (v132 = (void *)v131,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              v501 = 0;
                                              goto LABEL_187;
                                            }
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v501 = v132;
LABEL_187:
                                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numVideoMediaPlaySessionsPerDay"));
                                              v133 = objc_claimAutoreleasedReturnValue();
                                              v500 = (void *)v133;
                                              if (!v133
                                                || (v134 = (void *)v133,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                v499 = 0;
                                                goto LABEL_190;
                                              }
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v499 = v134;
LABEL_190:
                                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("durationVideoMediaPlaySessionsPerDay"));
                                                v135 = objc_claimAutoreleasedReturnValue();
                                                v498 = (void *)v135;
                                                if (!v135
                                                  || (v136 = (void *)v135,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  v497 = 0;
                                                  goto LABEL_193;
                                                }
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  v497 = v136;
LABEL_193:
                                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numFirstPartyMediaPlaySessionsPerDay"));
                                                  v137 = objc_claimAutoreleasedReturnValue();
                                                  v496 = (void *)v137;
                                                  if (!v137
                                                    || (v138 = (void *)v137,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    v495 = 0;
                                                    goto LABEL_196;
                                                  }
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    v495 = v138;
LABEL_196:
                                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numThirdPartyMediaPlaySessionsPerDay"));
                                                    v139 = objc_claimAutoreleasedReturnValue();
                                                    v494 = (void *)v139;
                                                    if (!v139
                                                      || (v140 = (void *)v139,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      v493 = 0;
                                                      goto LABEL_199;
                                                    }
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v493 = v140;
LABEL_199:
                                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numContacts"));
                                                      v141 = objc_claimAutoreleasedReturnValue();
                                                      v491 = (void *)v141;
                                                      if (!v141
                                                        || (v142 = (void *)v141,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        v492 = 0;
LABEL_202:
                                                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contactIDsInConversation"));
                                                        v143 = (void *)objc_claimAutoreleasedReturnValue();
                                                        objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                                        v144 = (void *)objc_claimAutoreleasedReturnValue();
                                                        v145 = objc_msgSend(v143, "isEqual:", v144);

                                                        if (v145)
                                                        {
                                                          v488 = v7;

                                                          v143 = 0;
                                                          v22 = v548;
                                                          goto LABEL_233;
                                                        }
                                                        v22 = v548;
                                                        if (!v143
                                                          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          v488 = v7;
LABEL_233:
                                                          v524 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v143, "count"));
                                                          v559 = 0u;
                                                          v560 = 0u;
                                                          v561 = 0u;
                                                          v562 = 0u;
                                                          obj = v143;
                                                          v175 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v559, v645, 16);
                                                          if (v175)
                                                          {
                                                            v176 = v175;
                                                            v177 = *(_QWORD *)v560;
LABEL_235:
                                                            v178 = 0;
                                                            while (1)
                                                            {
                                                              if (*(_QWORD *)v560 != v177)
                                                                objc_enumerationMutation(obj);
                                                              v179 = *(void **)(*((_QWORD *)&v559 + 1) + 8 * v178);
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                break;
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                              {
                                                                if (a4)
                                                                {
                                                                  v210 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                  v211 = *MEMORY[0x1E0D025B8];
                                                                  v641 = *MEMORY[0x1E0CB2D50];
                                                                  v487 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contactIDsInConversation"));
                                                                  v642 = v487;
                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v642, &v641, 1);
                                                                  v203 = objc_claimAutoreleasedReturnValue();
                                                                  v204 = v210;
                                                                  v205 = v211;
                                                                  goto LABEL_284;
                                                                }
                                                                goto LABEL_294;
                                                              }
                                                              v180 = v179;
                                                              objc_msgSend(v524, "addObject:", v180);

                                                              if (v176 == ++v178)
                                                              {
                                                                v176 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v559, v645, 16);
                                                                v22 = v548;
                                                                if (!v176)
                                                                  goto LABEL_242;
                                                                goto LABEL_235;
                                                              }
                                                            }
                                                            if (a4)
                                                            {
                                                              v201 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                              v202 = *MEMORY[0x1E0D025B8];
                                                              v643 = *MEMORY[0x1E0CB2D50];
                                                              v487 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("contactIDsInConversation"));
                                                              v644 = v487;
                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v644, &v643, 1);
                                                              v203 = objc_claimAutoreleasedReturnValue();
                                                              v204 = v201;
                                                              v205 = v202;
LABEL_284:
                                                              v485 = (void *)v203;
                                                              v13 = v543;
                                                              v71 = v542;
                                                              v72 = v539;
                                                              v42 = v503;
                                                              v15 = 0;
                                                              *a4 = (id)objc_msgSend(v204, "initWithDomain:code:userInfo:", v205, 2);
                                                              v486 = obj;
                                                              v7 = v488;
                                                              v22 = v548;

                                                              goto LABEL_677;
                                                            }
LABEL_294:
                                                            v15 = 0;
                                                            v216 = obj;
                                                            v7 = v488;
                                                            v13 = v543;
                                                            v71 = v542;
                                                            v22 = v548;
                                                            goto LABEL_303;
                                                          }
LABEL_242:

                                                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contactIDMostSignificantInConversation"));
                                                          v181 = objc_claimAutoreleasedReturnValue();
                                                          v487 = (void *)v181;
                                                          if (v181
                                                            && (v182 = (void *)v181,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) == 0))
                                                          {
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                            {
                                                              v7 = v488;
                                                              v42 = v503;
                                                              if (a4)
                                                              {
                                                                v243 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                v244 = *MEMORY[0x1E0D025B8];
                                                                v639 = *MEMORY[0x1E0CB2D50];
                                                                v484 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contactIDMostSignificantInConversation"));
                                                                v640 = v484;
                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v640, &v639, 1);
                                                                v245 = objc_claimAutoreleasedReturnValue();
                                                                v246 = v244;
                                                                v22 = v548;
                                                                v483 = (void *)v245;
                                                                v486 = 0;
                                                                v15 = 0;
                                                                *a4 = (id)objc_msgSend(v243, "initWithDomain:code:userInfo:", v246, 2);
                                                                v13 = v543;
                                                                v71 = v542;
                                                                v72 = v539;

                                                                goto LABEL_676;
                                                              }
                                                              v486 = 0;
                                                              v15 = 0;
                                                              v13 = v543;
                                                              v71 = v542;
                                                              v72 = v539;
LABEL_677:

                                                              v216 = v486;
                                                              goto LABEL_678;
                                                            }
                                                            v486 = v182;
                                                          }
                                                          else
                                                          {
                                                            v486 = 0;
                                                          }
                                                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("interactionContactScore"));
                                                          v183 = objc_claimAutoreleasedReturnValue();
                                                          v482 = (void *)v183;
                                                          if (v183)
                                                          {
                                                            v184 = (void *)v183;
                                                            objc_opt_class();
                                                            v7 = v488;
                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                            {
                                                              v484 = 0;
                                                            }
                                                            else
                                                            {
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                              {
                                                                if (!a4)
                                                                {
                                                                  v484 = 0;
                                                                  v15 = 0;
                                                                  v13 = v543;
                                                                  v71 = v542;
                                                                  v72 = v539;
                                                                  v42 = v503;
                                                                  goto LABEL_675;
                                                                }
                                                                v247 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                v248 = *MEMORY[0x1E0D025B8];
                                                                v637 = *MEMORY[0x1E0CB2D50];
                                                                v480 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("interactionContactScore"));
                                                                v638 = v480;
                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v638, &v637, 1);
                                                                v249 = objc_claimAutoreleasedReturnValue();
                                                                v250 = v248;
                                                                v22 = v548;
                                                                v481 = (void *)v249;
                                                                v484 = 0;
                                                                v15 = 0;
                                                                *a4 = (id)objc_msgSend(v247, "initWithDomain:code:userInfo:", v250, 2);
                                                                goto LABEL_385;
                                                              }
                                                              v484 = v184;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v484 = 0;
                                                            v7 = v488;
                                                          }
                                                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("textLikeMechanismIncluded"));
                                                          v225 = objc_claimAutoreleasedReturnValue();
                                                          v481 = (void *)v225;
                                                          if (!v225
                                                            || (v226 = (void *)v225,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            v480 = 0;
LABEL_319:
                                                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("callLikeMechanismIncluded"));
                                                            v227 = objc_claimAutoreleasedReturnValue();
                                                            v42 = v503;
                                                            v479 = (void *)v227;
                                                            if (v227
                                                              && (v228 = (void *)v227,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                                            {
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                              {
                                                                if (!a4)
                                                                {
                                                                  v478 = 0;
                                                                  v15 = 0;
                                                                  v13 = v543;
                                                                  v71 = v542;
                                                                  v72 = v539;
                                                                  goto LABEL_673;
                                                                }
                                                                v255 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                v256 = *MEMORY[0x1E0D025B8];
                                                                v633 = *MEMORY[0x1E0CB2D50];
                                                                v474 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("callLikeMechanismIncluded"));
                                                                v634 = v474;
                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v634, &v633, 1);
                                                                v257 = objc_claimAutoreleasedReturnValue();
                                                                v258 = v256;
                                                                v22 = v548;
                                                                v475 = (void *)v257;
                                                                v478 = 0;
                                                                v15 = 0;
                                                                *a4 = (id)objc_msgSend(v255, "initWithDomain:code:userInfo:", v258, 2);
                                                                goto LABEL_392;
                                                              }
                                                              v478 = v228;
                                                            }
                                                            else
                                                            {
                                                              v478 = 0;
                                                            }
                                                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numTextLikeInteractions"));
                                                            v229 = objc_claimAutoreleasedReturnValue();
                                                            v475 = (void *)v229;
                                                            if (!v229
                                                              || (v230 = (void *)v229,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              v474 = 0;
                                                              goto LABEL_325;
                                                            }
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                            {
                                                              v474 = v230;
LABEL_325:
                                                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numAudioLikeInteractions"));
                                                              v231 = objc_claimAutoreleasedReturnValue();
                                                              v472 = (void *)v231;
                                                              if (!v231
                                                                || (v232 = (void *)v231,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                v471 = 0;
                                                                goto LABEL_328;
                                                              }
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                              {
                                                                v471 = v232;
LABEL_328:
                                                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numVideoLikeInteractions"));
                                                                v233 = objc_claimAutoreleasedReturnValue();
                                                                v470 = (void *)v233;
                                                                if (!v233
                                                                  || (v234 = (void *)v233,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  v469 = 0;
                                                                  goto LABEL_331;
                                                                }
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                {
                                                                  v469 = v234;
LABEL_331:
                                                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("totalDurationOfCallLikeInteractions"));
                                                                  v235 = objc_claimAutoreleasedReturnValue();
                                                                  v468 = (void *)v235;
                                                                  if (!v235
                                                                    || (v236 = (void *)v235,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    v467 = 0;
                                                                    goto LABEL_334;
                                                                  }
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                  {
                                                                    v467 = v236;
LABEL_334:
                                                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("minDurationOfCallLikeInteractions"));
                                                                    v237 = objc_claimAutoreleasedReturnValue();
                                                                    v464 = (void *)v237;
                                                                    if (!v237
                                                                      || (v238 = (void *)v237,
                                                                          objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      v463 = 0;
                                                                      goto LABEL_337;
                                                                    }
                                                                    objc_opt_class();
                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                    {
                                                                      v463 = v238;
LABEL_337:
                                                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maxDurationOfCallLikeInteractions"));
                                                                      v239 = objc_claimAutoreleasedReturnValue();
                                                                      v462 = (void *)v239;
                                                                      if (!v239
                                                                        || (v240 = (void *)v239,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        v461 = 0;
LABEL_340:
                                                                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("photoMomentSource"));
                                                                        v241 = objc_claimAutoreleasedReturnValue();
                                                                        v460 = (void *)v241;
                                                                        if (v241
                                                                          && (v242 = (void *)v241,
                                                                              objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                                        {
                                                                          objc_opt_class();
                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                          {
                                                                            v459 = v242;
                                                                          }
                                                                          else
                                                                          {
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                            {
                                                                              if (a4)
                                                                              {
                                                                                v327 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                v328 = *MEMORY[0x1E0D025B8];
                                                                                v619 = *MEMORY[0x1E0CB2D50];
                                                                                v473 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("photoMomentSource"));
                                                                                v620 = v473;
                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v620, &v619, 1);
                                                                                v329 = objc_claimAutoreleasedReturnValue();
                                                                                v330 = v328;
                                                                                v22 = v548;
                                                                                v477 = (void *)v329;
                                                                                v459 = 0;
                                                                                v15 = 0;
                                                                                *a4 = (id)objc_msgSend(v327, "initWithDomain:code:userInfo:", v330, 2);
                                                                                v13 = v543;
                                                                                v71 = v542;
                                                                                v72 = v539;
                                                                                v42 = v503;

                                                                                goto LABEL_665;
                                                                              }
                                                                              v459 = 0;
                                                                              v15 = 0;
                                                                              v13 = v543;
                                                                              v71 = v542;
                                                                              v72 = v539;
                                                                              v42 = v503;
                                                                              goto LABEL_666;
                                                                            }
                                                                            v283 = v242;
                                                                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataPhotoMomentSourceTypeFromString(v283));
                                                                            v459 = (id)objc_claimAutoreleasedReturnValue();

                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          v459 = 0;
                                                                        }
                                                                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("photoMomentInferences"));
                                                                        v284 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                                                        v285 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        v286 = objc_msgSend(v284, "isEqual:", v285);

                                                                        if (v286)
                                                                        {

                                                                          v284 = 0;
                                                                          v22 = v548;
                                                                        }
                                                                        else
                                                                        {
                                                                          v22 = v548;
                                                                          if (v284)
                                                                          {
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                            {
                                                                              v473 = v284;
                                                                              if (!a4)
                                                                              {
                                                                                v15 = 0;
                                                                                v13 = v543;
                                                                                v71 = v542;
                                                                                v72 = v539;
                                                                                goto LABEL_665;
                                                                              }
                                                                              v318 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                              v319 = *MEMORY[0x1E0D025B8];
                                                                              v617 = *MEMORY[0x1E0CB2D50];
                                                                              v476 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("photoMomentInferences"));
                                                                              v618 = v476;
                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v618, &v617, 1);
                                                                              v320 = objc_claimAutoreleasedReturnValue();
                                                                              v321 = v319;
                                                                              v22 = v548;
                                                                              v465 = (id)v320;
                                                                              v15 = 0;
                                                                              *a4 = (id)objc_msgSend(v318, "initWithDomain:code:userInfo:", v321, 2);
                                                                              goto LABEL_465;
                                                                            }
                                                                          }
                                                                        }
                                                                        v476 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v284, "count"));
                                                                        v555 = 0u;
                                                                        v556 = 0u;
                                                                        v557 = 0u;
                                                                        v558 = 0u;
                                                                        v473 = v284;
                                                                        v287 = objc_msgSend(v473, "countByEnumeratingWithState:objects:count:", &v555, v616, 16);
                                                                        if (!v287)
                                                                          goto LABEL_410;
                                                                        v288 = v287;
                                                                        v489 = *(_QWORD *)v556;
                                                                        while (1)
                                                                        {
                                                                          v289 = v7;
                                                                          for (i = 0; i != v288; ++i)
                                                                          {
                                                                            if (*(_QWORD *)v556 != v489)
                                                                              objc_enumerationMutation(v473);
                                                                            v291 = *(void **)(*((_QWORD *)&v555 + 1)
                                                                                            + 8 * i);
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                            {
                                                                              v299 = a4;
                                                                              if (a4)
                                                                              {
                                                                                v300 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                v301 = *MEMORY[0x1E0D025B8];
                                                                                v614 = *MEMORY[0x1E0CB2D50];
                                                                                v466 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("photoMomentInferences"));
                                                                                v615 = v466;
                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v615, &v614, 1);
                                                                                v302 = objc_claimAutoreleasedReturnValue();
                                                                                v303 = v300;
LABEL_416:
                                                                                v305 = v301;
                                                                                v22 = v548;
                                                                                v15 = 0;
                                                                                *v299 = (id)objc_msgSend(v303, "initWithDomain:code:userInfo:", v305, 2, v302);
                                                                                v306 = (void *)v302;
                                                                                v465 = v473;
                                                                                v7 = v289;
                                                                                v13 = v543;
                                                                                v71 = v542;
LABEL_417:
                                                                                v72 = v539;
                                                                                goto LABEL_662;
                                                                              }
LABEL_464:
                                                                              v15 = 0;
                                                                              v465 = v473;
                                                                              v7 = v289;
LABEL_465:
                                                                              v13 = v543;
                                                                              v71 = v542;
                                                                              goto LABEL_466;
                                                                            }
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                            {
                                                                              v299 = a4;
                                                                              if (a4)
                                                                              {
                                                                                v304 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                v301 = *MEMORY[0x1E0D025B8];
                                                                                v612 = *MEMORY[0x1E0CB2D50];
                                                                                v466 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("photoMomentInferences"));
                                                                                v613 = v466;
                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v613, &v612, 1);
                                                                                v302 = objc_claimAutoreleasedReturnValue();
                                                                                v303 = v304;
                                                                                goto LABEL_416;
                                                                              }
                                                                              goto LABEL_464;
                                                                            }
                                                                            v292 = v291;
                                                                            v293 = [BMMomentsEventDataPhotoMomentInference alloc];
                                                                            v554 = 0;
                                                                            v294 = -[BMMomentsEventDataPhotoMomentInference initWithJSONDictionary:error:](v293, "initWithJSONDictionary:error:", v292, &v554);
                                                                            v295 = v554;
                                                                            if (v295)
                                                                            {
                                                                              v458 = v295;
                                                                              v466 = v292;
                                                                              v7 = v289;
                                                                              if (a4)
                                                                                *a4 = objc_retainAutorelease(v295);

                                                                              v15 = 0;
                                                                              v465 = v473;
                                                                              v13 = v543;
                                                                              v71 = v542;
                                                                              v22 = v548;
                                                                              v72 = v539;
                                                                              goto LABEL_661;
                                                                            }
                                                                            objc_msgSend(v476, "addObject:", v294);

                                                                            v22 = v548;
                                                                          }
                                                                          v7 = v289;
                                                                          v288 = objc_msgSend(v473, "countByEnumeratingWithState:objects:count:", &v555, v616, 16);
                                                                          if (!v288)
                                                                          {
LABEL_410:

                                                                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("photoMomentHolidays"));
                                                                            v296 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                                                            v297 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            v298 = objc_msgSend(v296, "isEqual:", v297);

                                                                            if (v298)
                                                                            {
                                                                              v490 = v7;

                                                                              v296 = 0;
LABEL_424:
                                                                              v466 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v296, "count"));
                                                                              v550 = 0u;
                                                                              v551 = 0u;
                                                                              v552 = 0u;
                                                                              v553 = 0u;
                                                                              v465 = v296;
                                                                              v307 = objc_msgSend(v465, "countByEnumeratingWithState:objects:count:", &v550, v609, 16);
                                                                              if (!v307)
                                                                                goto LABEL_433;
                                                                              v308 = v307;
                                                                              v309 = *(_QWORD *)v551;
LABEL_426:
                                                                              v310 = 0;
                                                                              while (1)
                                                                              {
                                                                                if (*(_QWORD *)v551 != v309)
                                                                                  objc_enumerationMutation(v465);
                                                                                v311 = *(void **)(*((_QWORD *)&v550 + 1)
                                                                                                + 8 * v310);
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                  break;
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (a4)
                                                                                  {
                                                                                    v331 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                    v332 = *MEMORY[0x1E0D025B8];
                                                                                    v605 = *MEMORY[0x1E0CB2D50];
                                                                                    v457 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("photoMomentHolidays"));
                                                                                    v606 = v457;
                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v606, &v605, 1);
                                                                                    v324 = objc_claimAutoreleasedReturnValue();
                                                                                    v325 = v331;
                                                                                    v326 = v332;
                                                                                    goto LABEL_479;
                                                                                  }
                                                                                  goto LABEL_482;
                                                                                }
                                                                                v312 = v311;
                                                                                objc_msgSend(v466, "addObject:", v312);

                                                                                if (v308 == ++v310)
                                                                                {
                                                                                  v308 = objc_msgSend(v465, "countByEnumeratingWithState:objects:count:", &v550, v609, 16);
                                                                                  if (v308)
                                                                                    goto LABEL_426;
LABEL_433:

                                                                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numPhotoMomentHolidays"));
                                                                                  v313 = objc_claimAutoreleasedReturnValue();
                                                                                  v457 = (void *)v313;
                                                                                  if (v313
                                                                                    && (v314 = (void *)v313,
                                                                                        objc_opt_class(),
                                                                                        (objc_opt_isKindOfClass() & 1) == 0))
                                                                                  {
                                                                                    objc_opt_class();
                                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                    {
                                                                                      v458 = v314;
                                                                                      goto LABEL_436;
                                                                                    }
                                                                                    if (!a4)
                                                                                    {
                                                                                      v458 = 0;
                                                                                      v15 = 0;
                                                                                      v7 = v490;
                                                                                      v13 = v543;
                                                                                      v71 = v542;
                                                                                      v22 = v548;
                                                                                      v72 = v539;
                                                                                      v42 = v503;
                                                                                      goto LABEL_660;
                                                                                    }
                                                                                    v336 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                    v337 = *MEMORY[0x1E0D025B8];
                                                                                    v603 = *MEMORY[0x1E0CB2D50];
                                                                                    v455 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numPhotoMomentHolidays"));
                                                                                    v604 = v455;
                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v604, &v603, 1);
                                                                                    v454 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    v458 = 0;
                                                                                    v15 = 0;
                                                                                    *a4 = (id)objc_msgSend(v336, "initWithDomain:code:userInfo:", v337, 2);
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    v458 = 0;
LABEL_436:
                                                                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numPhotoMomentInferences"));
                                                                                    v454 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    if (!v454
                                                                                      || (objc_opt_class(),
                                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                                    {
                                                                                      v455 = 0;
LABEL_439:
                                                                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numPhotoMomentPublicEvents"));
                                                                                      v453 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      if (!v453
                                                                                        || (objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                                      {
                                                                                        v452 = 0;
LABEL_442:
                                                                                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numPhotoMomentPersons"));
                                                                                        v451 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        if (!v451
                                                                                          || (objc_opt_class(),
                                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                                        {
                                                                                          v450 = 0;
LABEL_445:
                                                                                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isFamilyInPhotoMoment"));
                                                                                          v449 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                          if (!v449
                                                                                            || (objc_opt_class(),
                                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                                          {
                                                                                            v448 = 0;
LABEL_448:
                                                                                            v315 = v5;
                                                                                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("momentIncludesFavoritedAsset"));
                                                                                            v447 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                            if (v447
                                                                                              && (objc_opt_class(),
                                                                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                                                                            {
                                                                                              objc_opt_class();
                                                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                              {
                                                                                                v445 = v447;
                                                                                                goto LABEL_451;
                                                                                              }
                                                                                              if (a4)
                                                                                              {
                                                                                                v350 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                v351 = *MEMORY[0x1E0D025B8];
                                                                                                v593 = *MEMORY[0x1E0CB2D50];
                                                                                                v352 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("momentIncludesFavoritedAsset"));
                                                                                                v594 = v352;
                                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v594, &v593, 1);
                                                                                                v316 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                v445 = 0;
                                                                                                v15 = 0;
                                                                                                *a4 = (id)objc_msgSend(v350, "initWithDomain:code:userInfo:", v351, 2, v316);
                                                                                                goto LABEL_653;
                                                                                              }
                                                                                              v346 = 0;
                                                                                              v15 = 0;
                                                                                              v7 = v490;
                                                                                              v42 = v503;
                                                                                              v349 = v447;
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              v445 = 0;
LABEL_451:
                                                                                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("momentIncludesVideo"));
                                                                                              v316 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              if (v316
                                                                                                && (objc_opt_class(),
                                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                                              {
                                                                                                objc_opt_class();
                                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                {
                                                                                                  v443 = v316;
                                                                                                  goto LABEL_454;
                                                                                                }
                                                                                                if (a4)
                                                                                                {
                                                                                                  v353 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                  v354 = *MEMORY[0x1E0D025B8];
                                                                                                  v591 = *MEMORY[0x1E0CB2D50];
                                                                                                  v442 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("momentIncludesVideo"));
                                                                                                  v592 = v442;
                                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v592, &v591, 1);
                                                                                                  v446 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                  v443 = 0;
                                                                                                  v15 = 0;
                                                                                                  *a4 = (id)objc_msgSend(v353, "initWithDomain:code:userInfo:", v354, 2);
                                                                                                  goto LABEL_652;
                                                                                                }
                                                                                                v352 = 0;
                                                                                                v15 = 0;
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                v443 = 0;
LABEL_454:
                                                                                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("momentIncludesPhoto"));
                                                                                                v446 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                if (v446 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                {
                                                                                                  objc_opt_class();
                                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                  {
                                                                                                    v442 = v446;
                                                                                                    goto LABEL_457;
                                                                                                  }
                                                                                                  if (a4)
                                                                                                  {
                                                                                                    v355 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                    v356 = *MEMORY[0x1E0D025B8];
                                                                                                    v589 = *MEMORY[0x1E0CB2D50];
                                                                                                    v439 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("momentIncludesPhoto"));
                                                                                                    v590 = v439;
                                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v590, &v589, 1);
                                                                                                    v317 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    v442 = 0;
                                                                                                    v15 = 0;
                                                                                                    *a4 = (id)objc_msgSend(v355, "initWithDomain:code:userInfo:", v356, 2);
                                                                                                    goto LABEL_651;
                                                                                                  }
                                                                                                  v442 = 0;
                                                                                                  v15 = 0;
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  v442 = 0;
LABEL_457:
                                                                                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suggestedEventCategory"));
                                                                                                  v317 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                  if (!v317 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                  {
                                                                                                    v439 = 0;
LABEL_530:
                                                                                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numAttendees"));
                                                                                                    v444 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v444 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v438 = v444;
                                                                                                        goto LABEL_533;
                                                                                                      }
                                                                                                      if (a4)
                                                                                                      {
                                                                                                        v358 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                        v359 = *MEMORY[0x1E0D025B8];
                                                                                                        v585 = *MEMORY[0x1E0CB2D50];
                                                                                                        v436 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numAttendees"));
                                                                                                        v586 = v436;
                                                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v586, &v585, 1);
                                                                                                        v441 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                        v438 = 0;
                                                                                                        v15 = 0;
                                                                                                        *a4 = (id)objc_msgSend(v358, "initWithDomain:code:userInfo:", v359, 2);
                                                                                                        goto LABEL_649;
                                                                                                      }
                                                                                                      v438 = 0;
                                                                                                      v15 = 0;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v438 = 0;
LABEL_533:
                                                                                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numtripParts"));
                                                                                                      v441 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                      if (v441 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                        {
                                                                                                          v436 = v441;
                                                                                                          goto LABEL_536;
                                                                                                        }
                                                                                                        if (a4)
                                                                                                        {
                                                                                                          v360 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                          v361 = *MEMORY[0x1E0D025B8];
                                                                                                          v583 = *MEMORY[0x1E0CB2D50];
                                                                                                          v434 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numtripParts"));
                                                                                                          v584 = v434;
                                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v584, &v583, 1);
                                                                                                          v440 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                          v436 = 0;
                                                                                                          v15 = 0;
                                                                                                          *a4 = (id)objc_msgSend(v360, "initWithDomain:code:userInfo:", v361, 2);
                                                                                                          goto LABEL_648;
                                                                                                        }
                                                                                                        v436 = 0;
                                                                                                        v15 = 0;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v436 = 0;
LABEL_536:
                                                                                                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tripMode"));
                                                                                                        v440 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                        if (!v440 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                        {
                                                                                                          v434 = 0;
LABEL_556:
                                                                                                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numScoredTopics"));
                                                                                                          v437 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                          if (v437 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                          {
                                                                                                            objc_opt_class();
                                                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                            {
                                                                                                              v431 = v437;
                                                                                                              goto LABEL_559;
                                                                                                            }
                                                                                                            if (a4)
                                                                                                            {
                                                                                                              v367 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                              v368 = *MEMORY[0x1E0D025B8];
                                                                                                              v579 = *MEMORY[0x1E0CB2D50];
                                                                                                              v430 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numScoredTopics"));
                                                                                                              v580 = v430;
                                                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v580, &v579, 1);
                                                                                                              v435 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                              v431 = 0;
                                                                                                              v15 = 0;
                                                                                                              *a4 = (id)objc_msgSend(v367, "initWithDomain:code:userInfo:", v368, 2);
                                                                                                              goto LABEL_646;
                                                                                                            }
                                                                                                            v431 = 0;
                                                                                                            v15 = 0;
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            v431 = 0;
LABEL_559:
                                                                                                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numItemAuthors"));
                                                                                                            v435 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            if (v435 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                            {
                                                                                                              objc_opt_class();
                                                                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                              {
                                                                                                                v430 = v435;
                                                                                                                goto LABEL_562;
                                                                                                              }
                                                                                                              if (a4)
                                                                                                              {
                                                                                                                v369 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                v370 = *MEMORY[0x1E0D025B8];
                                                                                                                v577 = *MEMORY[0x1E0CB2D50];
                                                                                                                v428 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numItemAuthors"));
                                                                                                                v578 = v428;
                                                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v578, &v577, 1);
                                                                                                                v432 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                v430 = 0;
                                                                                                                v15 = 0;
                                                                                                                *a4 = (id)objc_msgSend(v369, "initWithDomain:code:userInfo:", v370, 2);
                                                                                                                goto LABEL_645;
                                                                                                              }
                                                                                                              v430 = 0;
                                                                                                              v15 = 0;
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              v430 = 0;
LABEL_562:
                                                                                                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numItemRecipients"));
                                                                                                              v432 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                              if (v432 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                              {
                                                                                                                objc_opt_class();
                                                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                {
                                                                                                                  v428 = v432;
                                                                                                                  goto LABEL_565;
                                                                                                                }
                                                                                                                if (a4)
                                                                                                                {
                                                                                                                  v373 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                  v374 = *MEMORY[0x1E0D025B8];
                                                                                                                  v575 = *MEMORY[0x1E0CB2D50];
                                                                                                                  v427 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numItemRecipients"));
                                                                                                                  v576 = v427;
                                                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v576, &v575, 1);
                                                                                                                  v429 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                  v428 = 0;
                                                                                                                  v15 = 0;
                                                                                                                  *a4 = (id)objc_msgSend(v373, "initWithDomain:code:userInfo:", v374, 2);
                                                                                                                  goto LABEL_644;
                                                                                                                }
                                                                                                                v428 = 0;
                                                                                                                v15 = 0;
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                v428 = 0;
LABEL_565:
                                                                                                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isGatheringComplete"));
                                                                                                                v429 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                if (v429 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                {
                                                                                                                  objc_opt_class();
                                                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                  {
                                                                                                                    v427 = v429;
                                                                                                                    goto LABEL_568;
                                                                                                                  }
                                                                                                                  if (a4)
                                                                                                                  {
                                                                                                                    v375 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                    v376 = *MEMORY[0x1E0D025B8];
                                                                                                                    v573 = *MEMORY[0x1E0CB2D50];
                                                                                                                    v363 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isGatheringComplete"));
                                                                                                                    v574 = v363;
                                                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v574, &v573, 1);
                                                                                                                    v426 = (BMMomentsEventDataPR *)objc_claimAutoreleasedReturnValue();
                                                                                                                    v427 = 0;
                                                                                                                    v15 = 0;
                                                                                                                    *a4 = (id)objc_msgSend(v375, "initWithDomain:code:userInfo:", v376, 2);
                                                                                                                    goto LABEL_642;
                                                                                                                  }
                                                                                                                  v427 = 0;
                                                                                                                  v15 = 0;
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  v427 = 0;
LABEL_568:
                                                                                                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gaPR"));
                                                                                                                  v433 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                  if (v433 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                  {
                                                                                                                    objc_opt_class();
                                                                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                    {
                                                                                                                      v363 = v433;
                                                                                                                      v364 = [BMMomentsEventDataPR alloc];
                                                                                                                      v549 = 0;
                                                                                                                      v426 = -[BMMomentsEventDataPR initWithJSONDictionary:error:](v364, "initWithJSONDictionary:error:", v363, &v549);
                                                                                                                      v365 = v549;
                                                                                                                      if (!v365)
                                                                                                                      {

                                                                                                                        goto LABEL_571;
                                                                                                                      }
                                                                                                                      v366 = v365;
                                                                                                                      if (a4)
                                                                                                                        *a4 = objc_retainAutorelease(v365);

                                                                                                                      v15 = 0;
                                                                                                                      goto LABEL_642;
                                                                                                                    }
                                                                                                                    if (a4)
                                                                                                                    {
                                                                                                                      v425 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                      v379 = *MEMORY[0x1E0D025B8];
                                                                                                                      v571 = *MEMORY[0x1E0CB2D50];
                                                                                                                      v426 = (BMMomentsEventDataPR *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("gaPR"));
                                                                                                                      v572 = v426;
                                                                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v572, &v571, 1);
                                                                                                                      v380 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                      *a4 = (id)objc_msgSend(v425, "initWithDomain:code:userInfo:", v379, 2, v380);

                                                                                                                      v15 = 0;
                                                                                                                      v363 = v433;
                                                                                                                      goto LABEL_642;
                                                                                                                    }
                                                                                                                    v15 = 0;
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    v426 = 0;
LABEL_571:
                                                                                                                    objc_msgSend(v315, "objectForKeyedSubscript:", CFSTR("pCount"));
                                                                                                                    v423 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                    if (v423 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                    {
                                                                                                                      objc_opt_class();
                                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                      {
                                                                                                                        v421 = v423;
                                                                                                                        goto LABEL_574;
                                                                                                                      }
                                                                                                                      if (a4)
                                                                                                                      {
                                                                                                                        v381 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                        v382 = *MEMORY[0x1E0D025B8];
                                                                                                                        v569 = *MEMORY[0x1E0CB2D50];
                                                                                                                        v418 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("pCount"));
                                                                                                                        v570 = v418;
                                                                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v570, &v569, 1);
                                                                                                                        v424 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                        v421 = 0;
                                                                                                                        v15 = 0;
                                                                                                                        *a4 = (id)objc_msgSend(v381, "initWithDomain:code:userInfo:", v382, 2);
                                                                                                                        goto LABEL_640;
                                                                                                                      }
                                                                                                                      v421 = 0;
                                                                                                                      v15 = 0;
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      v421 = 0;
LABEL_574:
                                                                                                                      objc_msgSend(v315, "objectForKeyedSubscript:", CFSTR("mapItemSource"));
                                                                                                                      v424 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                      if (v424)
                                                                                                                      {
                                                                                                                        objc_opt_class();
                                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                                        {
                                                                                                                          objc_opt_class();
                                                                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                          {
                                                                                                                            v418 = v424;
                                                                                                                          }
                                                                                                                          else
                                                                                                                          {
                                                                                                                            objc_opt_class();
                                                                                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                                            {
                                                                                                                              if (a4)
                                                                                                                              {
                                                                                                                                v392 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                                v393 = *MEMORY[0x1E0D025B8];
                                                                                                                                v567 = *MEMORY[0x1E0CB2D50];
                                                                                                                                v417 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("mapItemSource"));
                                                                                                                                v568 = v417;
                                                                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v568, &v567, 1);
                                                                                                                                v422 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                v418 = 0;
                                                                                                                                v15 = 0;
                                                                                                                                *a4 = (id)objc_msgSend(v392, "initWithDomain:code:userInfo:", v393, 2);
                                                                                                                                goto LABEL_639;
                                                                                                                              }
                                                                                                                              v418 = 0;
                                                                                                                              v15 = 0;
                                                                                                                              goto LABEL_640;
                                                                                                                            }
                                                                                                                            v383 = v424;
                                                                                                                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataMapItemSourceTypeFromString(v383));
                                                                                                                            v418 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                                          }
                                                                                                                          goto LABEL_619;
                                                                                                                        }
                                                                                                                      }
                                                                                                                      v418 = 0;
LABEL_619:
                                                                                                                      objc_msgSend(v315, "objectForKeyedSubscript:", CFSTR("placeType"));
                                                                                                                      v422 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                      if (!v422 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                                      {
                                                                                                                        v417 = 0;
LABEL_629:
                                                                                                                        objc_msgSend(v315, "objectForKeyedSubscript:", CFSTR("placeLabelGranularity"));
                                                                                                                        v419 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                        if (!v419 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                                        {
                                                                                                                          v385 = 0;
                                                                                                                          goto LABEL_637;
                                                                                                                        }
                                                                                                                        objc_opt_class();
                                                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                        {
                                                                                                                          v385 = v419;
LABEL_636:

LABEL_637:
                                                                                                                          v547 = objc_msgSend(v535, "intValue");
                                                                                                                          v416 = objc_msgSend(v503, "intValue");
                                                                                                                          v415 = objc_msgSend(v532, "intValue");
                                                                                                                          v414 = objc_msgSend(v530, "intValue");
                                                                                                                          v413 = objc_msgSend(v528, "intValue");
                                                                                                                          v412 = objc_msgSend(v526, "intValue");
                                                                                                                          v411 = objc_msgSend(v521, "intValue");
                                                                                                                          v410 = objc_msgSend(v517, "intValue");
                                                                                                                          v409 = objc_msgSend(v515, "intValue");
                                                                                                                          v408 = objc_msgSend(v509, "intValue");
                                                                                                                          v407 = objc_msgSend(v459, "intValue");
                                                                                                                          v387 = objc_msgSend(v439, "intValue");
                                                                                                                          v388 = objc_msgSend(v434, "intValue");
                                                                                                                          v389 = objc_msgSend(v418, "intValue");
                                                                                                                          v390 = objc_msgSend(v417, "intValue");
                                                                                                                          LODWORD(v406) = objc_msgSend(v385, "intValue");
                                                                                                                          LODWORD(v405) = v388;
                                                                                                                          LODWORD(v404) = v387;
                                                                                                                          LODWORD(v403) = v407;
                                                                                                                          LODWORD(v402) = v408;
                                                                                                                          LODWORD(v401) = v411;
                                                                                                                          v15 = -[BMMomentsEventDataEvent initWithEventIdentifier:startDate:endDate:creationDate:sourceCreationDate:expirationDate:provider:category:placeUserType:poiCategory:placeDiscovery:locationMode:workoutType:workoutBundleID:mediaGenre:mediaType:mediaRepetitions:mediaSumTimePlayed:sourceParty:mediaPlayerBundleID:numAudioMediaPlaySessionsPerDay:durationAudioMediaPlaySessionsPerDay:numVideoMediaPlaySessionsPerDay:durationVideoMediaPlaySessionsPerDay:numFirstPartyMediaPlaySessionsPerDay:numThirdPartyMediaPlaySessionsPerDay:numContacts:contactIDsInConversation:contactIDMostSignificantInConversation:interactionContactScore:textLikeMechanismIncluded:callLikeMechanismIncluded:numTextLikeInteractions:numAudioLikeInteractions:numVideoLikeInteractions:totalDurationOfCallLikeInteractions:minDurationOfCallLikeInteractions:maxDurationOfCallLikeInteractions:photoMomentSource:photoMomentInferences:photoMomentHolidays:numPhotoMomentHolidays:numPhotoMomentInferences:numPhotoMomentPublicEvents:numPhotoMomentPersons:isFamilyInPhotoMoment:momentIncludesFavoritedAsset:momentIncludesVideo:momentIncludesPhoto:suggestedEventCategory:numAttendees:numtripParts:tripMode:numScoredTopics:numItemAuthors:numItemRecipients:isGatheringComplete:gaPR:pCount:mapItemSource:placeType:placeLabelGranularity:](v545, "initWithEventIdentifier:startDate:endDate:creationDate:sourceCreationDate:expirationDate:provider:category:placeUserType:poiCategory:placeDiscovery:locationMode:workoutType:workoutBundleID:mediaGenre:mediaType:mediaRepetitions:mediaSumTimePlayed:sourceParty:mediaPlayerBundleID:numAudioMediaPlaySessionsPerDay:durationAudioMediaPlaySessionsPerDay:numVideoMediaPlaySessionsPerDay:durationVideoMediaPlaySessionsPerDay:numFirstPartyMediaPlaySessionsPerDay:numThirdPartyMediaPlaySessionsPerDay:numContacts:contactIDsInConversation:contactIDMostSignificantInConversation:interactionContactScore:textLikeMechanismIncluded:callLikeMechanismIncluded:numTextLikeInteractions:numAudioLikeInteractions:numVideoLikeInteractions:totalDurationOfCallLikeInteractions:minDurationOfCallLikeInteractions:maxDurationOfCallLikeInteractions:photoMomentSource:photoMomentInferences:photoMomentHolidays:numPhotoMomentHolidays:numPhotoMomentInferences:numPhotoMomentPublicEvents:numPhotoMomentPersons:isFamilyInPhotoMoment:momentIncludesFavoritedAsset:momentIncludesVideo:momentIncludesPhoto:suggestedEventCategory:numAttendees:numtripParts:tripMode:numScoredTopics:numItemAuthors:numItemRecipients:isGatheringComplete:gaPR:pCount:mapItemSource:placeType:placeLabelGranularity:", v490, v543, v542, v539, v540, v537, __PAIR64__(v416, v547), __PAIR64__(v414, v415), __PAIR64__(v412, v413), v401, v519, __PAIR64__(v409, v410), v513, v511, v402, v507, v504, v501, v499, v497, v495, v493, v492, v524, v486, v484, v480, v478, v474, v471, v469, v467, v463, v461, v403, v476, v466, v458, v455, v452, v450, v448, v445, v443, v442, v404, v438, v436, v405, v431, v430, v428, v427, v426, v421, __PAIR64__(v390, v389), v406);
                                                                                                                          v545 = v15;
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          objc_opt_class();
                                                                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                          {
                                                                                                                            v386 = v419;
                                                                                                                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataPlaceInferenceGranularityTypeFromString(v386));
                                                                                                                            v385 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                                            goto LABEL_636;
                                                                                                                          }
                                                                                                                          if (a4)
                                                                                                                          {
                                                                                                                            v397 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                            v398 = *MEMORY[0x1E0D025B8];
                                                                                                                            v563 = *MEMORY[0x1E0CB2D50];
                                                                                                                            v399 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("placeLabelGranularity"));
                                                                                                                            v564 = v399;
                                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v564, &v563, 1);
                                                                                                                            v400 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                            *a4 = (id)objc_msgSend(v397, "initWithDomain:code:userInfo:", v398, 2, v400);

                                                                                                                          }
                                                                                                                          v385 = 0;
                                                                                                                          v15 = 0;
                                                                                                                        }
LABEL_638:

                                                                                                                        goto LABEL_639;
                                                                                                                      }
                                                                                                                      objc_opt_class();
                                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                      {
                                                                                                                        v417 = v422;
LABEL_628:

                                                                                                                        goto LABEL_629;
                                                                                                                      }
                                                                                                                      objc_opt_class();
                                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                      {
                                                                                                                        v384 = v422;
                                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataVisitPlaceTypesFromString(v384));
                                                                                                                        v417 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                                        goto LABEL_628;
                                                                                                                      }
                                                                                                                      if (a4)
                                                                                                                      {
                                                                                                                        v420 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                        v394 = *MEMORY[0x1E0D025B8];
                                                                                                                        v565 = *MEMORY[0x1E0CB2D50];
                                                                                                                        v385 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("placeType"));
                                                                                                                        v566 = v385;
                                                                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v566, &v565, 1);
                                                                                                                        v395 = objc_claimAutoreleasedReturnValue();
                                                                                                                        v396 = v420;
                                                                                                                        v419 = (void *)v395;
                                                                                                                        v417 = 0;
                                                                                                                        v15 = 0;
                                                                                                                        *a4 = (id)objc_msgSend(v396, "initWithDomain:code:userInfo:", v394, 2);
                                                                                                                        goto LABEL_638;
                                                                                                                      }
                                                                                                                      v417 = 0;
                                                                                                                      v15 = 0;
LABEL_639:

LABEL_640:
                                                                                                                    }

                                                                                                                    v363 = v433;
LABEL_642:

                                                                                                                    v433 = v363;
                                                                                                                  }

                                                                                                                }
LABEL_644:

                                                                                                              }
LABEL_645:

                                                                                                            }
LABEL_646:

                                                                                                          }
LABEL_647:

                                                                                                          goto LABEL_648;
                                                                                                        }
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                        {
                                                                                                          v434 = v440;
LABEL_555:

                                                                                                          goto LABEL_556;
                                                                                                        }
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                        {
                                                                                                          v362 = v440;
                                                                                                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataTripModeTypeFromString(v362));
                                                                                                          v434 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                          goto LABEL_555;
                                                                                                        }
                                                                                                        if (a4)
                                                                                                        {
                                                                                                          v377 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                          v378 = *MEMORY[0x1E0D025B8];
                                                                                                          v581 = *MEMORY[0x1E0CB2D50];
                                                                                                          v431 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("tripMode"));
                                                                                                          v582 = v431;
                                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v582, &v581, 1);
                                                                                                          v437 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                          v434 = 0;
                                                                                                          v15 = 0;
                                                                                                          *a4 = (id)objc_msgSend(v377, "initWithDomain:code:userInfo:", v378, 2);
                                                                                                          goto LABEL_647;
                                                                                                        }
                                                                                                        v434 = 0;
                                                                                                        v15 = 0;
LABEL_648:

                                                                                                      }
LABEL_649:

                                                                                                    }
LABEL_650:

                                                                                                    goto LABEL_651;
                                                                                                  }
                                                                                                  objc_opt_class();
                                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                  {
                                                                                                    v439 = v317;
LABEL_529:

                                                                                                    goto LABEL_530;
                                                                                                  }
                                                                                                  objc_opt_class();
                                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                  {
                                                                                                    v357 = v317;
                                                                                                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataSuggestedEventCategoryTypeFromString(v357));
                                                                                                    v439 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                    goto LABEL_529;
                                                                                                  }
                                                                                                  if (a4)
                                                                                                  {
                                                                                                    v371 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                    v372 = *MEMORY[0x1E0D025B8];
                                                                                                    v587 = *MEMORY[0x1E0CB2D50];
                                                                                                    v438 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("suggestedEventCategory"));
                                                                                                    v588 = v438;
                                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v588, &v587, 1);
                                                                                                    v444 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    v439 = 0;
                                                                                                    v15 = 0;
                                                                                                    *a4 = (id)objc_msgSend(v371, "initWithDomain:code:userInfo:", v372, 2);
                                                                                                    goto LABEL_650;
                                                                                                  }
                                                                                                  v439 = 0;
                                                                                                  v15 = 0;
LABEL_651:

                                                                                                }
LABEL_652:

                                                                                                v352 = v443;
                                                                                              }
LABEL_653:

                                                                                              v7 = v490;
                                                                                              v42 = v503;
                                                                                              v5 = v315;
                                                                                              v349 = v447;
                                                                                              v346 = v445;
                                                                                            }
LABEL_654:

                                                                                            v13 = v543;
                                                                                            v71 = v542;
                                                                                            v22 = v548;
                                                                                            v72 = v539;
LABEL_655:

LABEL_656:
LABEL_657:

LABEL_658:
LABEL_660:

LABEL_661:
                                                                                            v306 = v458;
LABEL_662:

LABEL_663:
LABEL_665:

LABEL_666:
LABEL_667:

LABEL_668:
LABEL_669:

LABEL_670:
LABEL_671:

LABEL_672:
LABEL_673:

LABEL_674:
LABEL_675:

LABEL_676:
                                                                                            goto LABEL_677;
                                                                                          }
                                                                                          objc_opt_class();
                                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                          {
                                                                                            v448 = v449;
                                                                                            goto LABEL_448;
                                                                                          }
                                                                                          if (a4)
                                                                                          {
                                                                                            v344 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                            v345 = *MEMORY[0x1E0D025B8];
                                                                                            v595 = *MEMORY[0x1E0CB2D50];
                                                                                            v346 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isFamilyInPhotoMoment"));
                                                                                            v596 = v346;
                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v596, &v595, 1);
                                                                                            v347 = objc_claimAutoreleasedReturnValue();
                                                                                            v348 = v344;
                                                                                            v349 = (void *)v347;
                                                                                            v448 = 0;
                                                                                            v15 = 0;
                                                                                            *a4 = (id)objc_msgSend(v348, "initWithDomain:code:userInfo:", v345, 2, v347);
                                                                                            v7 = v490;
                                                                                            v42 = v503;
                                                                                            goto LABEL_654;
                                                                                          }
                                                                                          v448 = 0;
                                                                                          v15 = 0;
LABEL_552:
                                                                                          v7 = v490;
                                                                                          v13 = v543;
                                                                                          v71 = v542;
                                                                                          v22 = v548;
                                                                                          v72 = v539;
                                                                                          v42 = v503;
                                                                                          goto LABEL_655;
                                                                                        }
                                                                                        objc_opt_class();
                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                        {
                                                                                          v450 = v451;
                                                                                          goto LABEL_445;
                                                                                        }
                                                                                        if (a4)
                                                                                        {
                                                                                          v342 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                          v343 = *MEMORY[0x1E0D025B8];
                                                                                          v597 = *MEMORY[0x1E0CB2D50];
                                                                                          v448 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numPhotoMomentPersons"));
                                                                                          v598 = v448;
                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v598, &v597, 1);
                                                                                          v449 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                          v450 = 0;
                                                                                          v15 = 0;
                                                                                          *a4 = (id)objc_msgSend(v342, "initWithDomain:code:userInfo:", v343, 2);
                                                                                          goto LABEL_552;
                                                                                        }
                                                                                        v450 = 0;
                                                                                        v15 = 0;
LABEL_548:
                                                                                        v7 = v490;
                                                                                        v13 = v543;
                                                                                        v71 = v542;
                                                                                        v22 = v548;
                                                                                        v72 = v539;
                                                                                        v42 = v503;
                                                                                        goto LABEL_656;
                                                                                      }
                                                                                      objc_opt_class();
                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                      {
                                                                                        v452 = v453;
                                                                                        goto LABEL_442;
                                                                                      }
                                                                                      if (a4)
                                                                                      {
                                                                                        v340 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                        v341 = *MEMORY[0x1E0D025B8];
                                                                                        v599 = *MEMORY[0x1E0CB2D50];
                                                                                        v450 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numPhotoMomentPublicEvents"));
                                                                                        v600 = v450;
                                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v600, &v599, 1);
                                                                                        v451 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        v452 = 0;
                                                                                        v15 = 0;
                                                                                        *a4 = (id)objc_msgSend(v340, "initWithDomain:code:userInfo:", v341, 2);
                                                                                        goto LABEL_548;
                                                                                      }
                                                                                      v452 = 0;
                                                                                      v15 = 0;
LABEL_526:
                                                                                      v7 = v490;
                                                                                      v13 = v543;
                                                                                      v71 = v542;
                                                                                      v22 = v548;
                                                                                      v72 = v539;
                                                                                      v42 = v503;
                                                                                      goto LABEL_657;
                                                                                    }
                                                                                    objc_opt_class();
                                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                    {
                                                                                      v455 = v454;
                                                                                      goto LABEL_439;
                                                                                    }
                                                                                    if (a4)
                                                                                    {
                                                                                      v338 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                      v339 = *MEMORY[0x1E0D025B8];
                                                                                      v601 = *MEMORY[0x1E0CB2D50];
                                                                                      v452 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numPhotoMomentInferences"));
                                                                                      v602 = v452;
                                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v602, &v601, 1);
                                                                                      v453 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      v455 = 0;
                                                                                      v15 = 0;
                                                                                      *a4 = (id)objc_msgSend(v338, "initWithDomain:code:userInfo:", v339, 2);
                                                                                      goto LABEL_526;
                                                                                    }
                                                                                    v455 = 0;
                                                                                    v15 = 0;
                                                                                  }
                                                                                  v7 = v490;
                                                                                  v13 = v543;
                                                                                  v71 = v542;
                                                                                  v22 = v548;
                                                                                  v72 = v539;
                                                                                  v42 = v503;
                                                                                  goto LABEL_658;
                                                                                }
                                                                              }
                                                                              if (a4)
                                                                              {
                                                                                v322 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                v323 = *MEMORY[0x1E0D025B8];
                                                                                v607 = *MEMORY[0x1E0CB2D50];
                                                                                v457 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("photoMomentHolidays"));
                                                                                v608 = v457;
                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v608, &v607, 1);
                                                                                v324 = objc_claimAutoreleasedReturnValue();
                                                                                v325 = v322;
                                                                                v326 = v323;
LABEL_479:
                                                                                v456 = (void *)v324;
                                                                                v13 = v543;
                                                                                v71 = v542;
                                                                                v72 = v539;
                                                                                v42 = v503;
                                                                                v15 = 0;
                                                                                *a4 = (id)objc_msgSend(v325, "initWithDomain:code:userInfo:", v326, 2);
                                                                                v458 = v465;
                                                                                v7 = v490;
                                                                                v22 = v548;

                                                                                goto LABEL_660;
                                                                              }
LABEL_482:
                                                                              v15 = 0;
                                                                              v306 = v465;
                                                                              v7 = v490;
                                                                              v13 = v543;
                                                                              v71 = v542;
                                                                              v22 = v548;
                                                                              v72 = v539;
                                                                              v42 = v503;
                                                                              goto LABEL_662;
                                                                            }
                                                                            if (!v296
                                                                              || (objc_opt_class(),
                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                            {
                                                                              v490 = v7;
                                                                              goto LABEL_424;
                                                                            }
                                                                            v465 = v296;
                                                                            if (a4)
                                                                            {
                                                                              v333 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                              v334 = *MEMORY[0x1E0D025B8];
                                                                              v610 = *MEMORY[0x1E0CB2D50];
                                                                              v466 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("photoMomentHolidays"));
                                                                              v611 = v466;
                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v611, &v610, 1);
                                                                              v335 = objc_claimAutoreleasedReturnValue();
                                                                              v15 = 0;
                                                                              *a4 = (id)objc_msgSend(v333, "initWithDomain:code:userInfo:", v334, 2, v335);
                                                                              v306 = (void *)v335;
                                                                              v13 = v543;
                                                                              v71 = v542;
                                                                              v22 = v548;
                                                                              goto LABEL_417;
                                                                            }
                                                                            v15 = 0;
                                                                            v13 = v543;
                                                                            v71 = v542;
                                                                            v22 = v548;
LABEL_466:
                                                                            v72 = v539;
                                                                            goto LABEL_663;
                                                                          }
                                                                        }
                                                                      }
                                                                      objc_opt_class();
                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                      {
                                                                        v461 = v240;
                                                                        goto LABEL_340;
                                                                      }
                                                                      if (a4)
                                                                      {
                                                                        v279 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                        v280 = *MEMORY[0x1E0D025B8];
                                                                        v621 = *MEMORY[0x1E0CB2D50];
                                                                        v459 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("maxDurationOfCallLikeInteractions"));
                                                                        v622 = v459;
                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v622, &v621, 1);
                                                                        v281 = objc_claimAutoreleasedReturnValue();
                                                                        v282 = v280;
                                                                        v22 = v548;
                                                                        v460 = (void *)v281;
                                                                        v461 = 0;
                                                                        v15 = 0;
                                                                        *a4 = (id)objc_msgSend(v279, "initWithDomain:code:userInfo:", v282, 2);
                                                                        v13 = v543;
                                                                        v71 = v542;
                                                                        v72 = v539;
                                                                        goto LABEL_666;
                                                                      }
                                                                      v461 = 0;
                                                                      v15 = 0;
LABEL_481:
                                                                      v13 = v543;
                                                                      v71 = v542;
                                                                      v72 = v539;
                                                                      goto LABEL_667;
                                                                    }
                                                                    if (a4)
                                                                    {
                                                                      v275 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                      v276 = *MEMORY[0x1E0D025B8];
                                                                      v623 = *MEMORY[0x1E0CB2D50];
                                                                      v461 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("minDurationOfCallLikeInteractions"));
                                                                      v624 = v461;
                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v624, &v623, 1);
                                                                      v277 = objc_claimAutoreleasedReturnValue();
                                                                      v278 = v276;
                                                                      v22 = v548;
                                                                      v462 = (void *)v277;
                                                                      v463 = 0;
                                                                      v15 = 0;
                                                                      *a4 = (id)objc_msgSend(v275, "initWithDomain:code:userInfo:", v278, 2);
                                                                      goto LABEL_481;
                                                                    }
                                                                    v463 = 0;
                                                                    v15 = 0;
LABEL_472:
                                                                    v13 = v543;
                                                                    v71 = v542;
                                                                    v72 = v539;
                                                                    goto LABEL_668;
                                                                  }
                                                                  if (a4)
                                                                  {
                                                                    v271 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                    v272 = *MEMORY[0x1E0D025B8];
                                                                    v625 = *MEMORY[0x1E0CB2D50];
                                                                    v463 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("totalDurationOfCallLikeInteractions"));
                                                                    v626 = v463;
                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v626, &v625, 1);
                                                                    v273 = objc_claimAutoreleasedReturnValue();
                                                                    v274 = v272;
                                                                    v22 = v548;
                                                                    v464 = (void *)v273;
                                                                    v467 = 0;
                                                                    v15 = 0;
                                                                    *a4 = (id)objc_msgSend(v271, "initWithDomain:code:userInfo:", v274, 2);
                                                                    goto LABEL_472;
                                                                  }
                                                                  v467 = 0;
                                                                  v15 = 0;
LABEL_470:
                                                                  v13 = v543;
                                                                  v71 = v542;
                                                                  v72 = v539;
                                                                  goto LABEL_669;
                                                                }
                                                                if (a4)
                                                                {
                                                                  v267 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                  v268 = *MEMORY[0x1E0D025B8];
                                                                  v627 = *MEMORY[0x1E0CB2D50];
                                                                  v467 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numVideoLikeInteractions"));
                                                                  v628 = v467;
                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v628, &v627, 1);
                                                                  v269 = objc_claimAutoreleasedReturnValue();
                                                                  v270 = v268;
                                                                  v22 = v548;
                                                                  v468 = (void *)v269;
                                                                  v469 = 0;
                                                                  v15 = 0;
                                                                  *a4 = (id)objc_msgSend(v267, "initWithDomain:code:userInfo:", v270, 2);
                                                                  goto LABEL_470;
                                                                }
                                                                v469 = 0;
                                                                v15 = 0;
LABEL_468:
                                                                v13 = v543;
                                                                v71 = v542;
                                                                v72 = v539;
                                                                goto LABEL_670;
                                                              }
                                                              if (a4)
                                                              {
                                                                v263 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                v264 = *MEMORY[0x1E0D025B8];
                                                                v629 = *MEMORY[0x1E0CB2D50];
                                                                v469 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numAudioLikeInteractions"));
                                                                v630 = v469;
                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v630, &v629, 1);
                                                                v265 = objc_claimAutoreleasedReturnValue();
                                                                v266 = v264;
                                                                v22 = v548;
                                                                v470 = (void *)v265;
                                                                v471 = 0;
                                                                v15 = 0;
                                                                *a4 = (id)objc_msgSend(v263, "initWithDomain:code:userInfo:", v266, 2);
                                                                goto LABEL_468;
                                                              }
                                                              v471 = 0;
                                                              v15 = 0;
LABEL_463:
                                                              v13 = v543;
                                                              v71 = v542;
                                                              v72 = v539;
                                                              goto LABEL_671;
                                                            }
                                                            if (a4)
                                                            {
                                                              v259 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                              v260 = *MEMORY[0x1E0D025B8];
                                                              v631 = *MEMORY[0x1E0CB2D50];
                                                              v471 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numTextLikeInteractions"));
                                                              v632 = v471;
                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v632, &v631, 1);
                                                              v261 = objc_claimAutoreleasedReturnValue();
                                                              v262 = v260;
                                                              v22 = v548;
                                                              v472 = (void *)v261;
                                                              v474 = 0;
                                                              v15 = 0;
                                                              *a4 = (id)objc_msgSend(v259, "initWithDomain:code:userInfo:", v262, 2);
                                                              goto LABEL_463;
                                                            }
                                                            v474 = 0;
                                                            v15 = 0;
LABEL_392:
                                                            v13 = v543;
                                                            v71 = v542;
                                                            v72 = v539;
                                                            goto LABEL_672;
                                                          }
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                          {
                                                            v480 = v226;
                                                            goto LABEL_319;
                                                          }
                                                          if (a4)
                                                          {
                                                            v251 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v252 = *MEMORY[0x1E0D025B8];
                                                            v635 = *MEMORY[0x1E0CB2D50];
                                                            v478 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("textLikeMechanismIncluded"));
                                                            v636 = v478;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v636, &v635, 1);
                                                            v253 = objc_claimAutoreleasedReturnValue();
                                                            v254 = v252;
                                                            v22 = v548;
                                                            v479 = (void *)v253;
                                                            v480 = 0;
                                                            v15 = 0;
                                                            *a4 = (id)objc_msgSend(v251, "initWithDomain:code:userInfo:", v254, 2);
                                                            v13 = v543;
                                                            v71 = v542;
                                                            v72 = v539;
                                                            v42 = v503;
                                                            goto LABEL_673;
                                                          }
                                                          v480 = 0;
                                                          v15 = 0;
LABEL_385:
                                                          v13 = v543;
                                                          v71 = v542;
                                                          v72 = v539;
                                                          v42 = v503;
                                                          goto LABEL_674;
                                                        }
                                                        obj = v143;
                                                        if (a4)
                                                        {
                                                          v221 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                          v222 = *MEMORY[0x1E0D025B8];
                                                          v646 = *MEMORY[0x1E0CB2D50];
                                                          v524 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("contactIDsInConversation"));
                                                          v647 = v524;
                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v647, &v646, 1);
                                                          v223 = objc_claimAutoreleasedReturnValue();
                                                          v224 = v222;
                                                          v22 = v548;
                                                          v15 = 0;
                                                          *a4 = (id)objc_msgSend(v221, "initWithDomain:code:userInfo:", v224, 2, v223);
                                                          v216 = (void *)v223;
                                                          v13 = v543;
                                                          v71 = v542;
LABEL_303:
                                                          v72 = v539;
                                                          v42 = v503;
LABEL_678:

                                                          goto LABEL_680;
                                                        }
                                                        v15 = 0;
                                                        v13 = v543;
                                                        v71 = v542;
                                                        v72 = v539;
                                                        v42 = v503;
LABEL_680:

                                                        goto LABEL_681;
                                                      }
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v492 = v142;
                                                        goto LABEL_202;
                                                      }
                                                      if (a4)
                                                      {
                                                        v217 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                        v218 = *MEMORY[0x1E0D025B8];
                                                        v648 = *MEMORY[0x1E0CB2D50];
                                                        obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numContacts"));
                                                        v649 = obj;
                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v649, &v648, 1);
                                                        v219 = objc_claimAutoreleasedReturnValue();
                                                        v220 = v218;
                                                        v22 = v548;
                                                        v525 = (void *)v219;
                                                        v492 = 0;
                                                        v15 = 0;
                                                        *a4 = (id)objc_msgSend(v217, "initWithDomain:code:userInfo:", v220, 2);
                                                        v13 = v543;
                                                        v71 = v542;
                                                        v72 = v539;
                                                        v42 = v503;

                                                        goto LABEL_680;
                                                      }
                                                      v492 = 0;
                                                      v15 = 0;
LABEL_348:
                                                      v13 = v543;
                                                      v71 = v542;
                                                      v72 = v539;
                                                      v42 = v503;
LABEL_681:

                                                      goto LABEL_682;
                                                    }
                                                    if (a4)
                                                    {
                                                      v212 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                      v213 = *MEMORY[0x1E0D025B8];
                                                      v650 = *MEMORY[0x1E0CB2D50];
                                                      v492 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numThirdPartyMediaPlaySessionsPerDay"));
                                                      v651 = v492;
                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v651, &v650, 1);
                                                      v214 = objc_claimAutoreleasedReturnValue();
                                                      v215 = v213;
                                                      v22 = v548;
                                                      v491 = (void *)v214;
                                                      v493 = 0;
                                                      v15 = 0;
                                                      *a4 = (id)objc_msgSend(v212, "initWithDomain:code:userInfo:", v215, 2);
                                                      goto LABEL_348;
                                                    }
                                                    v493 = 0;
                                                    v15 = 0;
LABEL_344:
                                                    v13 = v543;
                                                    v71 = v542;
                                                    v72 = v539;
                                                    v42 = v503;
LABEL_682:

                                                    goto LABEL_683;
                                                  }
                                                  if (a4)
                                                  {
                                                    v206 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                    v207 = *MEMORY[0x1E0D025B8];
                                                    v652 = *MEMORY[0x1E0CB2D50];
                                                    v493 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numFirstPartyMediaPlaySessionsPerDay"));
                                                    v653 = v493;
                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v653, &v652, 1);
                                                    v208 = objc_claimAutoreleasedReturnValue();
                                                    v209 = v207;
                                                    v22 = v548;
                                                    v494 = (void *)v208;
                                                    v495 = 0;
                                                    v15 = 0;
                                                    *a4 = (id)objc_msgSend(v206, "initWithDomain:code:userInfo:", v209, 2);
                                                    goto LABEL_344;
                                                  }
                                                  v495 = 0;
                                                  v15 = 0;
LABEL_313:
                                                  v13 = v543;
                                                  v71 = v542;
                                                  v72 = v539;
                                                  v42 = v503;
LABEL_683:

                                                  goto LABEL_684;
                                                }
                                                if (a4)
                                                {
                                                  v197 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v198 = *MEMORY[0x1E0D025B8];
                                                  v654 = *MEMORY[0x1E0CB2D50];
                                                  v495 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("durationVideoMediaPlaySessionsPerDay"));
                                                  v655 = v495;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v655, &v654, 1);
                                                  v199 = objc_claimAutoreleasedReturnValue();
                                                  v200 = v198;
                                                  v22 = v548;
                                                  v496 = (void *)v199;
                                                  v497 = 0;
                                                  v15 = 0;
                                                  *a4 = (id)objc_msgSend(v197, "initWithDomain:code:userInfo:", v200, 2);
                                                  goto LABEL_313;
                                                }
                                                v497 = 0;
                                                v15 = 0;
LABEL_308:
                                                v13 = v543;
                                                v71 = v542;
                                                v72 = v539;
                                                v42 = v503;
LABEL_684:

                                                goto LABEL_685;
                                              }
                                              if (a4)
                                              {
                                                v189 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v190 = *MEMORY[0x1E0D025B8];
                                                v656 = *MEMORY[0x1E0CB2D50];
                                                v497 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numVideoMediaPlaySessionsPerDay"));
                                                v657 = v497;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v657, &v656, 1);
                                                v191 = objc_claimAutoreleasedReturnValue();
                                                v192 = v190;
                                                v22 = v548;
                                                v498 = (void *)v191;
                                                v499 = 0;
                                                v15 = 0;
                                                *a4 = (id)objc_msgSend(v189, "initWithDomain:code:userInfo:", v192, 2);
                                                goto LABEL_308;
                                              }
                                              v499 = 0;
                                              v15 = 0;
LABEL_305:
                                              v13 = v543;
                                              v71 = v542;
                                              v72 = v539;
                                              v42 = v503;
LABEL_685:

                                              goto LABEL_686;
                                            }
                                            if (a4)
                                            {
                                              v185 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v186 = *MEMORY[0x1E0D025B8];
                                              v658 = *MEMORY[0x1E0CB2D50];
                                              v499 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("durationAudioMediaPlaySessionsPerDay"));
                                              v659 = v499;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v659, &v658, 1);
                                              v187 = objc_claimAutoreleasedReturnValue();
                                              v188 = v186;
                                              v22 = v548;
                                              v500 = (void *)v187;
                                              v501 = 0;
                                              v15 = 0;
                                              *a4 = (id)objc_msgSend(v185, "initWithDomain:code:userInfo:", v188, 2);
                                              goto LABEL_305;
                                            }
                                            v501 = 0;
                                            v15 = 0;
LABEL_300:
                                            v13 = v543;
                                            v71 = v542;
                                            v72 = v539;
                                            v42 = v503;
LABEL_686:

                                            goto LABEL_687;
                                          }
                                          if (a4)
                                          {
                                            v167 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v168 = *MEMORY[0x1E0D025B8];
                                            v660 = *MEMORY[0x1E0CB2D50];
                                            v501 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numAudioMediaPlaySessionsPerDay"));
                                            v661 = v501;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v661, &v660, 1);
                                            v169 = objc_claimAutoreleasedReturnValue();
                                            v170 = v168;
                                            v22 = v548;
                                            v502 = (void *)v169;
                                            v504 = 0;
                                            v15 = 0;
                                            *a4 = (id)objc_msgSend(v167, "initWithDomain:code:userInfo:", v170, 2);
                                            goto LABEL_300;
                                          }
                                          v504 = 0;
                                          v15 = 0;
                                          v13 = v543;
                                          v71 = v542;
                                          v72 = v539;
                                          v42 = v503;
LABEL_687:

                                          goto LABEL_688;
                                        }
                                        if (a4)
                                        {
                                          v156 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v157 = *MEMORY[0x1E0D025B8];
                                          v662 = *MEMORY[0x1E0CB2D50];
                                          v504 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("mediaPlayerBundleID"));
                                          v663 = v504;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v663, &v662, 1);
                                          v158 = objc_claimAutoreleasedReturnValue();
                                          v159 = v157;
                                          v22 = v548;
                                          v506 = (void *)v158;
                                          v507 = 0;
                                          v15 = 0;
                                          *a4 = (id)objc_msgSend(v156, "initWithDomain:code:userInfo:", v159, 2);
                                          v13 = v543;
                                          v71 = v542;
                                          v72 = v539;
                                          goto LABEL_687;
                                        }
                                        v507 = 0;
                                        v15 = 0;
                                        v13 = v543;
                                        v71 = v542;
                                        v72 = v539;
LABEL_688:

                                        goto LABEL_689;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v126 = v89;
                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataSourceAppTypeFromString(v126));
                                        v509 = (id)objc_claimAutoreleasedReturnValue();

                                        goto LABEL_177;
                                      }
                                      if (a4)
                                      {
                                        v193 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v194 = *MEMORY[0x1E0D025B8];
                                        v664 = *MEMORY[0x1E0CB2D50];
                                        v507 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("sourceParty"));
                                        v665 = v507;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v665, &v664, 1);
                                        v195 = objc_claimAutoreleasedReturnValue();
                                        v196 = v194;
                                        v22 = v548;
                                        v508 = (void *)v195;
                                        v509 = 0;
                                        v15 = 0;
                                        *a4 = (id)objc_msgSend(v193, "initWithDomain:code:userInfo:", v196, 2);
                                        v13 = v543;
                                        v71 = v542;
                                        v72 = v539;
                                        goto LABEL_688;
                                      }
                                      v509 = 0;
                                      v15 = 0;
                                      v13 = v543;
                                      v71 = v542;
                                      v72 = v539;
LABEL_689:

                                      goto LABEL_690;
                                    }
                                    if (a4)
                                    {
                                      v106 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v107 = *MEMORY[0x1E0D025B8];
                                      v666 = *MEMORY[0x1E0CB2D50];
                                      v509 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("mediaSumTimePlayed"));
                                      v667 = v509;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v667, &v666, 1);
                                      v108 = objc_claimAutoreleasedReturnValue();
                                      v109 = v107;
                                      v22 = v548;
                                      v510 = (void *)v108;
                                      v511 = 0;
                                      v15 = 0;
                                      *a4 = (id)objc_msgSend(v106, "initWithDomain:code:userInfo:", v109, 2);
                                      v13 = v543;
                                      v71 = v542;
                                      v72 = v539;
                                      goto LABEL_689;
                                    }
                                    v511 = 0;
                                    v15 = 0;
LABEL_272:
                                    v13 = v543;
                                    v71 = v542;
                                    v72 = v539;
LABEL_690:

                                    goto LABEL_691;
                                  }
                                  if (a4)
                                  {
                                    v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v95 = *MEMORY[0x1E0D025B8];
                                    v668 = *MEMORY[0x1E0CB2D50];
                                    v511 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("mediaRepetitions"));
                                    v669 = v511;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v669, &v668, 1);
                                    v96 = objc_claimAutoreleasedReturnValue();
                                    v97 = v95;
                                    v22 = v548;
                                    v512 = (void *)v96;
                                    v513 = 0;
                                    v15 = 0;
                                    *a4 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v97, 2);
                                    goto LABEL_272;
                                  }
                                  v513 = 0;
                                  v15 = 0;
                                  v13 = v543;
                                  v71 = v542;
                                  v72 = v539;
LABEL_691:

                                  goto LABEL_692;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v83 = v78;
                                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataMediaTypeFromString(v83));
                                  v515 = (id)objc_claimAutoreleasedReturnValue();

                                  goto LABEL_141;
                                }
                                if (a4)
                                {
                                  v171 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v172 = *MEMORY[0x1E0D025B8];
                                  v670 = *MEMORY[0x1E0CB2D50];
                                  v513 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("mediaType"));
                                  v671 = v513;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v671, &v670, 1);
                                  v173 = objc_claimAutoreleasedReturnValue();
                                  v174 = v172;
                                  v22 = v548;
                                  v514 = (void *)v173;
                                  v515 = 0;
                                  v15 = 0;
                                  *a4 = (id)objc_msgSend(v171, "initWithDomain:code:userInfo:", v174, 2);
                                  v13 = v543;
                                  v71 = v542;
                                  v72 = v539;
                                  goto LABEL_691;
                                }
                                v515 = 0;
                                v15 = 0;
                                v13 = v543;
                                v71 = v542;
                                v72 = v539;
LABEL_692:

                                goto LABEL_693;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v76 = v66;
                                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataGenreTypeFromString(v76));
                                v517 = (id)objc_claimAutoreleasedReturnValue();

                                goto LABEL_131;
                              }
                              if (a4)
                              {
                                v163 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v164 = *MEMORY[0x1E0D025B8];
                                v672 = *MEMORY[0x1E0CB2D50];
                                v515 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("mediaGenre"));
                                v673 = v515;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v673, &v672, 1);
                                v165 = objc_claimAutoreleasedReturnValue();
                                v166 = v164;
                                v22 = v548;
                                v516 = (void *)v165;
                                v517 = 0;
                                v15 = 0;
                                *a4 = (id)objc_msgSend(v163, "initWithDomain:code:userInfo:", v166, 2);
                                v13 = v543;
                                v71 = v542;
                                v72 = v539;
                                goto LABEL_692;
                              }
                              v517 = 0;
                              v15 = 0;
                              v13 = v543;
                              v71 = v542;
                              v72 = v539;
LABEL_693:

                              goto LABEL_694;
                            }
                            if (a4)
                            {
                              v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v68 = *MEMORY[0x1E0D025B8];
                              v674 = *MEMORY[0x1E0CB2D50];
                              v517 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("workoutBundleID"));
                              v675 = v517;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v675, &v674, 1);
                              v69 = objc_claimAutoreleasedReturnValue();
                              v70 = v68;
                              v22 = v548;
                              v518 = (void *)v69;
                              v519 = 0;
                              v15 = 0;
                              *a4 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v70, 2);
                              v13 = v543;
                              v71 = v542;
                              v72 = v539;
                              goto LABEL_693;
                            }
                            v519 = 0;
                            v15 = 0;
                            v13 = v543;
                            v71 = v542;
                            v72 = v539;
LABEL_694:

                            goto LABEL_695;
                          }
                          v523 = v5;
                          v46 = v6;
                          v47 = v8;
                          v48 = v7;
                          v49 = v42;
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v62 = v61;
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataWorkoutActivityTypeFromString(v62));
                            v521 = (id)objc_claimAutoreleasedReturnValue();

                            v7 = v48;
                            v8 = v47;
                            v6 = v46;
                            v5 = v523;
                            goto LABEL_103;
                          }
                          if (a4)
                          {
                            v114 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v115 = *MEMORY[0x1E0D025B8];
                            v676 = *MEMORY[0x1E0CB2D50];
                            v519 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("workoutType"));
                            v677 = v519;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v677, &v676, 1);
                            v116 = objc_claimAutoreleasedReturnValue();
                            v117 = v115;
                            v22 = v548;
                            v520 = (void *)v116;
                            v521 = 0;
                            v15 = 0;
                            *a4 = (id)objc_msgSend(v114, "initWithDomain:code:userInfo:", v117, 2);
                            v13 = v543;
                            v71 = v542;
                            v72 = v539;
                            v7 = v48;
                            v8 = v47;
                            v6 = v46;
                            v5 = v523;
                            goto LABEL_694;
                          }
                          v521 = 0;
                          v15 = 0;
LABEL_278:
                          v13 = v543;
                          v71 = v542;
                          v72 = v539;
                          v42 = v49;
                          v7 = v48;
                          v8 = v47;
                          v6 = v46;
                          v5 = v523;
LABEL_695:

                          goto LABEL_696;
                        }
                        v523 = v5;
                        v46 = v6;
                        v47 = v8;
                        v48 = v7;
                        v49 = v42;
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v59 = v58;
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataLocationModeTypeFromString(v59));
                          v526 = (id)objc_claimAutoreleasedReturnValue();

                          v7 = v48;
                          v8 = v47;
                          v6 = v46;
                          v5 = v523;
                          goto LABEL_95;
                        }
                        if (a4)
                        {
                          v110 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v111 = *MEMORY[0x1E0D025B8];
                          v678 = *MEMORY[0x1E0CB2D50];
                          v521 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("locationMode"));
                          v679 = v521;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v679, &v678, 1);
                          v112 = objc_claimAutoreleasedReturnValue();
                          v113 = v111;
                          v22 = v548;
                          v522 = (void *)v112;
                          v526 = 0;
                          v15 = 0;
                          *a4 = (id)objc_msgSend(v110, "initWithDomain:code:userInfo:", v113, 2);
                          goto LABEL_278;
                        }
                        v526 = 0;
                        v15 = 0;
LABEL_274:
                        v13 = v543;
                        v71 = v542;
                        v72 = v539;
                        v42 = v49;
                        v7 = v48;
                        v8 = v47;
                        v6 = v46;
                        v5 = v523;
LABEL_696:

                        goto LABEL_697;
                      }
                      v523 = v5;
                      v46 = v6;
                      v47 = v8;
                      v48 = v7;
                      v49 = v42;
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v56 = v55;
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataPlaceDiscoveryTypeFromString(v56));
                        v528 = (id)objc_claimAutoreleasedReturnValue();

                        v7 = v48;
                        v8 = v47;
                        v6 = v46;
                        v5 = v523;
                        goto LABEL_87;
                      }
                      if (a4)
                      {
                        v102 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v103 = *MEMORY[0x1E0D025B8];
                        v680 = *MEMORY[0x1E0CB2D50];
                        v526 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("placeDiscovery"));
                        v681 = v526;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v681, &v680, 1);
                        v104 = objc_claimAutoreleasedReturnValue();
                        v105 = v103;
                        v22 = v548;
                        v527 = (void *)v104;
                        v528 = 0;
                        v15 = 0;
                        *a4 = (id)objc_msgSend(v102, "initWithDomain:code:userInfo:", v105, 2);
                        goto LABEL_274;
                      }
                      v528 = 0;
                      v15 = 0;
LABEL_268:
                      v13 = v543;
                      v71 = v542;
                      v72 = v539;
                      v42 = v49;
                      v7 = v48;
                      v8 = v47;
                      v6 = v46;
                      v5 = v523;
LABEL_697:

                      goto LABEL_698;
                    }
                    v523 = v5;
                    v46 = v6;
                    v47 = v8;
                    v48 = v7;
                    v49 = v42;
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v53 = v52;
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataGeoPOICategoryTypeFromString(v53));
                      v530 = (id)objc_claimAutoreleasedReturnValue();

                      v7 = v48;
                      v8 = v47;
                      v6 = v46;
                      v5 = v523;
                      goto LABEL_79;
                    }
                    if (a4)
                    {
                      v98 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v99 = *MEMORY[0x1E0D025B8];
                      v682 = *MEMORY[0x1E0CB2D50];
                      v528 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("poiCategory"));
                      v683 = v528;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v683, &v682, 1);
                      v100 = objc_claimAutoreleasedReturnValue();
                      v101 = v99;
                      v22 = v548;
                      v529 = (void *)v100;
                      v530 = 0;
                      v15 = 0;
                      *a4 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v101, 2);
                      goto LABEL_268;
                    }
                    v530 = 0;
                    v15 = 0;
LABEL_264:
                    v13 = v543;
                    v71 = v542;
                    v72 = v539;
                    v42 = v49;
                    v7 = v48;
                    v8 = v47;
                    v6 = v46;
                    v5 = v523;
LABEL_698:

                    goto LABEL_699;
                  }
                  v523 = v5;
                  v46 = v6;
                  v47 = v8;
                  v48 = v7;
                  v49 = v42;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v50 = v45;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeFromString(v50));
                    v532 = (id)objc_claimAutoreleasedReturnValue();

                    v7 = v48;
                    v8 = v47;
                    v6 = v46;
                    v5 = v523;
                    goto LABEL_71;
                  }
                  if (a4)
                  {
                    v90 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v91 = *MEMORY[0x1E0D025B8];
                    v684 = *MEMORY[0x1E0CB2D50];
                    v530 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("placeUserType"));
                    v685 = v530;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v685, &v684, 1);
                    v92 = objc_claimAutoreleasedReturnValue();
                    v93 = v91;
                    v22 = v548;
                    v531 = (void *)v92;
                    v532 = 0;
                    v15 = 0;
                    *a4 = (id)objc_msgSend(v90, "initWithDomain:code:userInfo:", v93, 2);
                    goto LABEL_264;
                  }
                  v532 = 0;
                  v15 = 0;
                  v13 = v543;
                  v71 = v542;
                  v72 = v539;
                  v7 = v48;
                  v8 = v47;
                  v6 = v46;
                  v5 = v523;
LABEL_699:

                  goto LABEL_700;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v43 = v41;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataEventCategoryTypeFromString(v43));
                  v42 = (id)objc_claimAutoreleasedReturnValue();

                  goto LABEL_63;
                }
                if (a4)
                {
                  v79 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v80 = *MEMORY[0x1E0D025B8];
                  v686 = *MEMORY[0x1E0CB2D50];
                  v532 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("category"));
                  v687 = v532;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v687, &v686, 1);
                  v81 = objc_claimAutoreleasedReturnValue();
                  v82 = v80;
                  v22 = v548;
                  v533 = (void *)v81;
                  v42 = 0;
                  v15 = 0;
                  *a4 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v82, 2);
                  v13 = v543;
                  v71 = v542;
                  v72 = v539;
                  goto LABEL_699;
                }
                v42 = 0;
                v15 = 0;
                v13 = v543;
                v71 = v542;
LABEL_256:
                v72 = v539;
LABEL_700:

                goto LABEL_701;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v39 = v38;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataEventProviderTypeFromString(v39));
                v535 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_55;
              }
              if (a4)
              {
                v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v74 = *MEMORY[0x1E0D025B8];
                v688 = *MEMORY[0x1E0CB2D50];
                v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("provider"));
                v689 = v42;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v689, &v688, 1);
                v534 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v74, 2);
                v535 = 0;
                v15 = 0;
                *a4 = v75;
                v13 = v543;
                v71 = v542;
                v22 = v548;
                goto LABEL_256;
              }
              v535 = 0;
              v15 = 0;
LABEL_254:
              v13 = v543;
              v71 = v542;
              v22 = v548;
              v72 = v539;
LABEL_701:

              goto LABEL_702;
            }
            if (a4)
            {
              v160 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v161 = *MEMORY[0x1E0D025B8];
              v690 = *MEMORY[0x1E0CB2D50];
              v535 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("expirationDate"));
              v691 = v535;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v691, &v690, 1);
              v536 = (void *)objc_claimAutoreleasedReturnValue();
              v162 = (id)objc_msgSend(v160, "initWithDomain:code:userInfo:", v161, 2);
              v537 = 0;
              v15 = 0;
              *a4 = v162;
              goto LABEL_254;
            }
            v537 = 0;
            v15 = 0;
            v13 = v543;
            v71 = v542;
            v22 = v548;
LABEL_290:
            v72 = v539;
LABEL_702:

            goto LABEL_703;
          }
          if (a4)
          {
            v151 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v152 = *MEMORY[0x1E0D025B8];
            v692 = *MEMORY[0x1E0CB2D50];
            v537 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("sourceCreationDate"));
            v693 = v537;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v693, &v692, 1);
            v153 = objc_claimAutoreleasedReturnValue();
            v154 = v151;
            v22 = v548;
            v538 = (void *)v153;
            v155 = (id)objc_msgSend(v154, "initWithDomain:code:userInfo:", v152, 2);
            v540 = 0;
            v15 = 0;
            *a4 = v155;
            v13 = v543;
            v71 = v542;
            goto LABEL_290;
          }
          v540 = 0;
          v15 = 0;
          v13 = v543;
          v71 = v542;
          v72 = v539;
LABEL_703:

          goto LABEL_704;
        }
        v72 = a4;
        if (a4)
        {
          v146 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v147 = *MEMORY[0x1E0D025B8];
          v694 = *MEMORY[0x1E0CB2D50];
          v540 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("creationDate"));
          v695 = v540;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v695, &v694, 1);
          v148 = objc_claimAutoreleasedReturnValue();
          v149 = v146;
          v22 = v548;
          v541 = (void *)v148;
          v150 = (id)objc_msgSend(v149, "initWithDomain:code:userInfo:", v147, 2);
          v72 = 0;
          v15 = 0;
          *a4 = v150;
          v13 = v543;
          v71 = v542;
          goto LABEL_703;
        }
        v15 = 0;
        v13 = v543;
        v71 = v542;
LABEL_704:

        goto LABEL_705;
      }
      if (a4)
      {
        v121 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v122 = *MEMORY[0x1E0D025B8];
        v696 = *MEMORY[0x1E0CB2D50];
        v72 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("endDate"));
        v697 = v72;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v697, &v696, 1);
        v123 = objc_claimAutoreleasedReturnValue();
        v124 = v121;
        v22 = (void *)v123;
        v125 = (id)objc_msgSend(v124, "initWithDomain:code:userInfo:", v122, 2, v123);
        v71 = 0;
        v15 = 0;
        *a4 = v125;
        v13 = v543;
        goto LABEL_704;
      }
      v71 = 0;
      v15 = 0;
      v13 = v543;
LABEL_705:

      goto LABEL_706;
    }
    if (a4)
    {
      v118 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v119 = *MEMORY[0x1E0D025B8];
      v698 = *MEMORY[0x1E0CB2D50];
      v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("startDate"));
      v699 = v71;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v699, &v698, 1);
      v544 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = (id)objc_msgSend(v118, "initWithDomain:code:userInfo:", v119, 2);
      v13 = 0;
      v15 = 0;
      *a4 = v120;
      goto LABEL_705;
    }
    v13 = 0;
    v15 = 0;
LABEL_706:

    goto LABEL_707;
  }
  if (a4)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v12 = *MEMORY[0x1E0D025B8];
    v700 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("eventIdentifier"));
    v701[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v701, &v700, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 2, v8);
    v7 = 0;
    v15 = 0;
    *a4 = v14;
    goto LABEL_706;
  }
  v7 = 0;
  v15 = 0;
LABEL_707:

  return v15;
}

- (id)_contactIDsInConversationJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMMomentsEventDataEvent contactIDsInConversation](self, "contactIDsInConversation", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_photoMomentInferencesJSONArray
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
  -[BMMomentsEventDataEvent photoMomentInferences](self, "photoMomentInferences", 0);
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

- (id)_photoMomentHolidaysJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMMomentsEventDataEvent photoMomentHolidays](self, "photoMomentHolidays", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
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
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
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
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v110;
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
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
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
  id v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  id v171;
  void *v172;
  void *v173;
  id v174;
  void *v175;
  id v176;
  id v177;
  id v178;
  id v179;
  void *v180;
  id v181;
  id v182;
  void *v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  void *v192;
  void *v193;
  void *v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  id v202;
  id v203;
  void *v204;
  void *v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  id v212;
  void *v213;
  void *v214;
  id v215;
  id v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  _QWORD v226[62];
  _QWORD v227[64];

  v227[62] = *MEMORY[0x1E0C80C00];
  -[BMMomentsEventDataEvent eventIdentifier](self, "eventIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEvent startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  -[BMMomentsEventDataEvent endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEvent endDate](self, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    objc_msgSend(v9, "numberWithDouble:");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  -[BMMomentsEventDataEvent creationDate](self, "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEvent creationDate](self, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSince1970");
    objc_msgSend(v13, "numberWithDouble:");
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  -[BMMomentsEventDataEvent sourceCreationDate](self, "sourceCreationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEvent sourceCreationDate](self, "sourceCreationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSince1970");
    objc_msgSend(v17, "numberWithDouble:");
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  -[BMMomentsEventDataEvent expirationDate](self, "expirationDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEvent expirationDate](self, "expirationDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSince1970");
    objc_msgSend(v21, "numberWithDouble:");
    v171 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v171 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent provider](self, "provider"));
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent category](self, "category"));
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent placeUserType](self, "placeUserType"));
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent poiCategory](self, "poiCategory"));
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent placeDiscovery](self, "placeDiscovery"));
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent locationMode](self, "locationMode"));
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent workoutType](self, "workoutType"));
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent workoutBundleID](self, "workoutBundleID");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent mediaGenre](self, "mediaGenre"));
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent mediaType](self, "mediaType"));
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEvent hasMediaRepetitions](self, "hasMediaRepetitions"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent mediaRepetitions](self, "mediaRepetitions"));
    v216 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v216 = 0;
  }
  if (-[BMMomentsEventDataEvent hasMediaSumTimePlayed](self, "hasMediaSumTimePlayed"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent mediaSumTimePlayed](self, "mediaSumTimePlayed"));
    v215 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v215 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent sourceParty](self, "sourceParty"));
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent mediaPlayerBundleID](self, "mediaPlayerBundleID");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEvent hasNumAudioMediaPlaySessionsPerDay](self, "hasNumAudioMediaPlaySessionsPerDay"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numAudioMediaPlaySessionsPerDay](self, "numAudioMediaPlaySessionsPerDay"));
    v212 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v212 = 0;
  }
  if (!-[BMMomentsEventDataEvent hasDurationAudioMediaPlaySessionsPerDay](self, "hasDurationAudioMediaPlaySessionsPerDay")|| (-[BMMomentsEventDataEvent durationAudioMediaPlaySessionsPerDay](self, "durationAudioMediaPlaySessionsPerDay"), fabs(v24) == INFINITY))
  {
    v211 = 0;
  }
  else
  {
    -[BMMomentsEventDataEvent durationAudioMediaPlaySessionsPerDay](self, "durationAudioMediaPlaySessionsPerDay");
    v25 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEvent durationAudioMediaPlaySessionsPerDay](self, "durationAudioMediaPlaySessionsPerDay");
    objc_msgSend(v25, "numberWithDouble:");
    v211 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMMomentsEventDataEvent hasNumVideoMediaPlaySessionsPerDay](self, "hasNumVideoMediaPlaySessionsPerDay"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numVideoMediaPlaySessionsPerDay](self, "numVideoMediaPlaySessionsPerDay"));
    v210 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v210 = 0;
  }
  if (!-[BMMomentsEventDataEvent hasDurationVideoMediaPlaySessionsPerDay](self, "hasDurationVideoMediaPlaySessionsPerDay")|| (-[BMMomentsEventDataEvent durationVideoMediaPlaySessionsPerDay](self, "durationVideoMediaPlaySessionsPerDay"), fabs(v26) == INFINITY))
  {
    v209 = 0;
  }
  else
  {
    -[BMMomentsEventDataEvent durationVideoMediaPlaySessionsPerDay](self, "durationVideoMediaPlaySessionsPerDay");
    v27 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEvent durationVideoMediaPlaySessionsPerDay](self, "durationVideoMediaPlaySessionsPerDay");
    objc_msgSend(v27, "numberWithDouble:");
    v209 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMMomentsEventDataEvent hasNumFirstPartyMediaPlaySessionsPerDay](self, "hasNumFirstPartyMediaPlaySessionsPerDay"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numFirstPartyMediaPlaySessionsPerDay](self, "numFirstPartyMediaPlaySessionsPerDay"));
    v208 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v208 = 0;
  }
  if (-[BMMomentsEventDataEvent hasNumThirdPartyMediaPlaySessionsPerDay](self, "hasNumThirdPartyMediaPlaySessionsPerDay"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numThirdPartyMediaPlaySessionsPerDay](self, "numThirdPartyMediaPlaySessionsPerDay"));
    v207 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v207 = 0;
  }
  if (-[BMMomentsEventDataEvent hasNumContacts](self, "hasNumContacts"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numContacts](self, "numContacts"));
    v206 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v206 = 0;
  }
  -[BMMomentsEventDataEvent _contactIDsInConversationJSONArray](self, "_contactIDsInConversationJSONArray");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent contactIDMostSignificantInConversation](self, "contactIDMostSignificantInConversation");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMMomentsEventDataEvent hasInteractionContactScore](self, "hasInteractionContactScore")
    || (-[BMMomentsEventDataEvent interactionContactScore](self, "interactionContactScore"), fabs(v28) == INFINITY))
  {
    v203 = 0;
  }
  else
  {
    -[BMMomentsEventDataEvent interactionContactScore](self, "interactionContactScore");
    v29 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEvent interactionContactScore](self, "interactionContactScore");
    objc_msgSend(v29, "numberWithDouble:");
    v203 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMMomentsEventDataEvent hasTextLikeMechanismIncluded](self, "hasTextLikeMechanismIncluded"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEvent textLikeMechanismIncluded](self, "textLikeMechanismIncluded"));
    v202 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v202 = 0;
  }
  if (-[BMMomentsEventDataEvent hasCallLikeMechanismIncluded](self, "hasCallLikeMechanismIncluded"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEvent callLikeMechanismIncluded](self, "callLikeMechanismIncluded"));
    v201 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v201 = 0;
  }
  if (-[BMMomentsEventDataEvent hasNumTextLikeInteractions](self, "hasNumTextLikeInteractions"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numTextLikeInteractions](self, "numTextLikeInteractions"));
    v200 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v200 = 0;
  }
  if (-[BMMomentsEventDataEvent hasNumAudioLikeInteractions](self, "hasNumAudioLikeInteractions"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numAudioLikeInteractions](self, "numAudioLikeInteractions"));
    v199 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v199 = 0;
  }
  if (-[BMMomentsEventDataEvent hasNumVideoLikeInteractions](self, "hasNumVideoLikeInteractions"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numVideoLikeInteractions](self, "numVideoLikeInteractions"));
    v198 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v198 = 0;
  }
  if (!-[BMMomentsEventDataEvent hasTotalDurationOfCallLikeInteractions](self, "hasTotalDurationOfCallLikeInteractions")|| (-[BMMomentsEventDataEvent totalDurationOfCallLikeInteractions](self, "totalDurationOfCallLikeInteractions"), fabs(v30) == INFINITY))
  {
    v197 = 0;
  }
  else
  {
    -[BMMomentsEventDataEvent totalDurationOfCallLikeInteractions](self, "totalDurationOfCallLikeInteractions");
    v31 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEvent totalDurationOfCallLikeInteractions](self, "totalDurationOfCallLikeInteractions");
    objc_msgSend(v31, "numberWithDouble:");
    v197 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEvent hasMinDurationOfCallLikeInteractions](self, "hasMinDurationOfCallLikeInteractions")
    || (-[BMMomentsEventDataEvent minDurationOfCallLikeInteractions](self, "minDurationOfCallLikeInteractions"),
        fabs(v32) == INFINITY))
  {
    v196 = 0;
  }
  else
  {
    -[BMMomentsEventDataEvent minDurationOfCallLikeInteractions](self, "minDurationOfCallLikeInteractions");
    v33 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEvent minDurationOfCallLikeInteractions](self, "minDurationOfCallLikeInteractions");
    objc_msgSend(v33, "numberWithDouble:");
    v196 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEvent hasMaxDurationOfCallLikeInteractions](self, "hasMaxDurationOfCallLikeInteractions")
    || (-[BMMomentsEventDataEvent maxDurationOfCallLikeInteractions](self, "maxDurationOfCallLikeInteractions"),
        fabs(v34) == INFINITY))
  {
    v195 = 0;
  }
  else
  {
    -[BMMomentsEventDataEvent maxDurationOfCallLikeInteractions](self, "maxDurationOfCallLikeInteractions");
    v35 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEvent maxDurationOfCallLikeInteractions](self, "maxDurationOfCallLikeInteractions");
    objc_msgSend(v35, "numberWithDouble:");
    v195 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent photoMomentSource](self, "photoMomentSource"));
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent _photoMomentInferencesJSONArray](self, "_photoMomentInferencesJSONArray");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEvent _photoMomentHolidaysJSONArray](self, "_photoMomentHolidaysJSONArray");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEvent hasNumPhotoMomentHolidays](self, "hasNumPhotoMomentHolidays"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numPhotoMomentHolidays](self, "numPhotoMomentHolidays"));
    v191 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v191 = 0;
  }
  if (-[BMMomentsEventDataEvent hasNumPhotoMomentInferences](self, "hasNumPhotoMomentInferences"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numPhotoMomentInferences](self, "numPhotoMomentInferences"));
    v190 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v190 = 0;
  }
  if (-[BMMomentsEventDataEvent hasNumPhotoMomentPublicEvents](self, "hasNumPhotoMomentPublicEvents"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numPhotoMomentPublicEvents](self, "numPhotoMomentPublicEvents"));
    v189 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v189 = 0;
  }
  if (-[BMMomentsEventDataEvent hasNumPhotoMomentPersons](self, "hasNumPhotoMomentPersons"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numPhotoMomentPersons](self, "numPhotoMomentPersons"));
    v188 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v188 = 0;
  }
  if (-[BMMomentsEventDataEvent hasIsFamilyInPhotoMoment](self, "hasIsFamilyInPhotoMoment"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEvent isFamilyInPhotoMoment](self, "isFamilyInPhotoMoment"));
    v187 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v187 = 0;
  }
  if (-[BMMomentsEventDataEvent hasMomentIncludesFavoritedAsset](self, "hasMomentIncludesFavoritedAsset"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEvent momentIncludesFavoritedAsset](self, "momentIncludesFavoritedAsset"));
    v186 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v186 = 0;
  }
  if (-[BMMomentsEventDataEvent hasMomentIncludesVideo](self, "hasMomentIncludesVideo"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEvent momentIncludesVideo](self, "momentIncludesVideo"));
    v185 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v185 = 0;
  }
  if (-[BMMomentsEventDataEvent hasMomentIncludesPhoto](self, "hasMomentIncludesPhoto"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEvent momentIncludesPhoto](self, "momentIncludesPhoto"));
    v184 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v184 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent suggestedEventCategory](self, "suggestedEventCategory"));
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEvent hasNumAttendees](self, "hasNumAttendees"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numAttendees](self, "numAttendees"));
    v182 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v182 = 0;
  }
  if (-[BMMomentsEventDataEvent hasNumtripParts](self, "hasNumtripParts"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numtripParts](self, "numtripParts"));
    v181 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v181 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent tripMode](self, "tripMode"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEvent hasNumScoredTopics](self, "hasNumScoredTopics"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numScoredTopics](self, "numScoredTopics"));
    v179 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v179 = 0;
  }
  if (-[BMMomentsEventDataEvent hasNumItemAuthors](self, "hasNumItemAuthors"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numItemAuthors](self, "numItemAuthors"));
    v178 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v178 = 0;
  }
  if (-[BMMomentsEventDataEvent hasNumItemRecipients](self, "hasNumItemRecipients"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent numItemRecipients](self, "numItemRecipients"));
    v177 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v177 = 0;
  }
  if (-[BMMomentsEventDataEvent hasIsGatheringComplete](self, "hasIsGatheringComplete"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEvent isGatheringComplete](self, "isGatheringComplete"));
    v176 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v176 = 0;
  }
  -[BMMomentsEventDataEvent gaPR](self, "gaPR");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "jsonDictionary");
  v175 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BMMomentsEventDataEvent hasPCount](self, "hasPCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent pCount](self, "pCount"));
    v174 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v174 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent mapItemSource](self, "mapItemSource"));
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent placeType](self, "placeType"));
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEvent placeLabelGranularity](self, "placeLabelGranularity"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v226[0] = CFSTR("eventIdentifier");
  v37 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v163 = (void *)v37;
  v227[0] = v37;
  v226[1] = CFSTR("startDate");
  v38 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = objc_claimAutoreleasedReturnValue();
  }
  v162 = (void *)v38;
  v227[1] = v38;
  v226[2] = CFSTR("endDate");
  v39 = (uint64_t)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = objc_claimAutoreleasedReturnValue();
  }
  v161 = (void *)v39;
  v227[2] = v39;
  v226[3] = CFSTR("creationDate");
  v40 = (uint64_t)v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v160 = (void *)v40;
  v227[3] = v40;
  v226[4] = CFSTR("sourceCreationDate");
  v41 = (uint64_t)v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = objc_claimAutoreleasedReturnValue();
  }
  v159 = (void *)v41;
  v227[4] = v41;
  v226[5] = CFSTR("expirationDate");
  v42 = (uint64_t)v171;
  if (!v171)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v158 = (void *)v42;
  v227[5] = v42;
  v226[6] = CFSTR("provider");
  v43 = v23;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  v157 = (void *)v43;
  v227[6] = v43;
  v226[7] = CFSTR("category");
  v44 = (uint64_t)v225;
  if (!v225)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v44 = objc_claimAutoreleasedReturnValue();
  }
  v45 = v19;
  v227[7] = v44;
  v226[8] = CFSTR("placeUserType");
  v46 = (uint64_t)v224;
  if (!v224)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v46 = objc_claimAutoreleasedReturnValue();
  }
  v47 = v11;
  v227[8] = v46;
  v226[9] = CFSTR("poiCategory");
  v48 = (uint64_t)v223;
  if (!v223)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v48 = objc_claimAutoreleasedReturnValue();
  }
  v49 = v15;
  v227[9] = v48;
  v226[10] = CFSTR("placeDiscovery");
  v50 = (uint64_t)v222;
  if (!v222)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v50 = objc_claimAutoreleasedReturnValue();
  }
  v51 = v7;
  v166 = (void *)v50;
  v227[10] = v50;
  v226[11] = CFSTR("locationMode");
  v52 = (uint64_t)v221;
  if (!v221)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v52 = objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v23;
  v165 = (void *)v52;
  v227[11] = v52;
  v226[12] = CFSTR("workoutType");
  v54 = (uint64_t)v220;
  if (!v220)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v54 = objc_claimAutoreleasedReturnValue();
  }
  v55 = (void *)v3;
  v153 = (void *)v54;
  v227[12] = v54;
  v226[13] = CFSTR("workoutBundleID");
  v56 = (uint64_t)v219;
  if (!v219)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v56 = objc_claimAutoreleasedReturnValue();
  }
  v57 = (void *)v56;
  v227[13] = v56;
  v226[14] = CFSTR("mediaGenre");
  v58 = (uint64_t)v218;
  if (!v218)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v58 = objc_claimAutoreleasedReturnValue();
  }
  v152 = (void *)v58;
  v227[14] = v58;
  v226[15] = CFSTR("mediaType");
  v59 = (uint64_t)v217;
  if (!v217)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v59 = objc_claimAutoreleasedReturnValue();
  }
  v151 = (void *)v59;
  v227[15] = v59;
  v226[16] = CFSTR("mediaRepetitions");
  v60 = (uint64_t)v216;
  if (!v216)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v60 = objc_claimAutoreleasedReturnValue();
  }
  v150 = (void *)v60;
  v227[16] = v60;
  v226[17] = CFSTR("mediaSumTimePlayed");
  v61 = (uint64_t)v215;
  if (!v215)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v61 = objc_claimAutoreleasedReturnValue();
  }
  v149 = (void *)v61;
  v227[17] = v61;
  v226[18] = CFSTR("sourceParty");
  v62 = (uint64_t)v214;
  if (!v214)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v62 = objc_claimAutoreleasedReturnValue();
  }
  v148 = (void *)v62;
  v227[18] = v62;
  v226[19] = CFSTR("mediaPlayerBundleID");
  v63 = (uint64_t)v213;
  if (!v213)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v63 = objc_claimAutoreleasedReturnValue();
  }
  v147 = (void *)v63;
  v227[19] = v63;
  v226[20] = CFSTR("numAudioMediaPlaySessionsPerDay");
  v64 = (uint64_t)v212;
  if (!v212)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v64 = objc_claimAutoreleasedReturnValue();
  }
  v146 = (void *)v64;
  v227[20] = v64;
  v226[21] = CFSTR("durationAudioMediaPlaySessionsPerDay");
  v65 = (uint64_t)v211;
  if (!v211)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v65 = objc_claimAutoreleasedReturnValue();
  }
  v145 = (void *)v65;
  v227[21] = v65;
  v226[22] = CFSTR("numVideoMediaPlaySessionsPerDay");
  v66 = (uint64_t)v210;
  if (!v210)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v66 = objc_claimAutoreleasedReturnValue();
  }
  v144 = (void *)v66;
  v227[22] = v66;
  v226[23] = CFSTR("durationVideoMediaPlaySessionsPerDay");
  v67 = (uint64_t)v209;
  if (!v209)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v67 = objc_claimAutoreleasedReturnValue();
  }
  v143 = (void *)v67;
  v227[23] = v67;
  v226[24] = CFSTR("numFirstPartyMediaPlaySessionsPerDay");
  v68 = (uint64_t)v208;
  if (!v208)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v68 = objc_claimAutoreleasedReturnValue();
  }
  v142 = (void *)v68;
  v227[24] = v68;
  v226[25] = CFSTR("numThirdPartyMediaPlaySessionsPerDay");
  v69 = (uint64_t)v207;
  if (!v207)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v69 = objc_claimAutoreleasedReturnValue();
  }
  v141 = (void *)v69;
  v227[25] = v69;
  v226[26] = CFSTR("numContacts");
  v70 = (uint64_t)v206;
  if (!v206)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v70 = objc_claimAutoreleasedReturnValue();
  }
  v140 = (void *)v70;
  v227[26] = v70;
  v226[27] = CFSTR("contactIDsInConversation");
  v71 = (uint64_t)v205;
  if (!v205)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v71 = objc_claimAutoreleasedReturnValue();
  }
  v139 = (void *)v71;
  v227[27] = v71;
  v226[28] = CFSTR("contactIDMostSignificantInConversation");
  v72 = (uint64_t)v204;
  if (!v204)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v72 = objc_claimAutoreleasedReturnValue();
  }
  v138 = (void *)v72;
  v227[28] = v72;
  v226[29] = CFSTR("interactionContactScore");
  v73 = (uint64_t)v203;
  if (!v203)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v73 = objc_claimAutoreleasedReturnValue();
  }
  v137 = (void *)v73;
  v227[29] = v73;
  v226[30] = CFSTR("textLikeMechanismIncluded");
  v74 = (uint64_t)v202;
  if (!v202)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v74 = objc_claimAutoreleasedReturnValue();
  }
  v136 = (void *)v74;
  v227[30] = v74;
  v226[31] = CFSTR("callLikeMechanismIncluded");
  v75 = (uint64_t)v201;
  if (!v201)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v75 = objc_claimAutoreleasedReturnValue();
  }
  v135 = (void *)v75;
  v227[31] = v75;
  v226[32] = CFSTR("numTextLikeInteractions");
  v76 = (uint64_t)v200;
  if (!v200)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v76 = objc_claimAutoreleasedReturnValue();
  }
  v134 = (void *)v76;
  v227[32] = v76;
  v226[33] = CFSTR("numAudioLikeInteractions");
  v77 = (uint64_t)v199;
  if (!v199)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v77 = objc_claimAutoreleasedReturnValue();
  }
  v133 = (void *)v77;
  v227[33] = v77;
  v226[34] = CFSTR("numVideoLikeInteractions");
  v78 = (uint64_t)v198;
  if (!v198)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v78 = objc_claimAutoreleasedReturnValue();
  }
  v132 = (void *)v78;
  v227[34] = v78;
  v226[35] = CFSTR("totalDurationOfCallLikeInteractions");
  v79 = (uint64_t)v197;
  if (!v197)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v79 = objc_claimAutoreleasedReturnValue();
  }
  v131 = (void *)v79;
  v227[35] = v79;
  v226[36] = CFSTR("minDurationOfCallLikeInteractions");
  v80 = (uint64_t)v196;
  if (!v196)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v80 = objc_claimAutoreleasedReturnValue();
  }
  v130 = (void *)v80;
  v227[36] = v80;
  v226[37] = CFSTR("maxDurationOfCallLikeInteractions");
  v81 = (uint64_t)v195;
  if (!v195)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v81 = objc_claimAutoreleasedReturnValue();
  }
  v129 = (void *)v81;
  v227[37] = v81;
  v226[38] = CFSTR("photoMomentSource");
  v82 = (uint64_t)v194;
  if (!v194)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v82 = objc_claimAutoreleasedReturnValue();
  }
  v128 = (void *)v82;
  v227[38] = v82;
  v226[39] = CFSTR("photoMomentInferences");
  v83 = (uint64_t)v193;
  if (!v193)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v83 = objc_claimAutoreleasedReturnValue();
  }
  v127 = (void *)v83;
  v227[39] = v83;
  v226[40] = CFSTR("photoMomentHolidays");
  v84 = (uint64_t)v192;
  if (!v192)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v84 = objc_claimAutoreleasedReturnValue();
  }
  v126 = (void *)v84;
  v227[40] = v84;
  v226[41] = CFSTR("numPhotoMomentHolidays");
  v85 = (uint64_t)v191;
  if (!v191)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v85 = objc_claimAutoreleasedReturnValue();
  }
  v125 = (void *)v85;
  v227[41] = v85;
  v226[42] = CFSTR("numPhotoMomentInferences");
  v86 = (uint64_t)v190;
  if (!v190)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v86 = objc_claimAutoreleasedReturnValue();
  }
  v124 = (void *)v86;
  v227[42] = v86;
  v226[43] = CFSTR("numPhotoMomentPublicEvents");
  v87 = (uint64_t)v189;
  if (!v189)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v87 = objc_claimAutoreleasedReturnValue();
  }
  v123 = (void *)v87;
  v227[43] = v87;
  v226[44] = CFSTR("numPhotoMomentPersons");
  v88 = (uint64_t)v188;
  if (!v188)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v88 = objc_claimAutoreleasedReturnValue();
  }
  v122 = (void *)v88;
  v227[44] = v88;
  v226[45] = CFSTR("isFamilyInPhotoMoment");
  v89 = (uint64_t)v187;
  if (!v187)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v89 = objc_claimAutoreleasedReturnValue();
  }
  v121 = (void *)v89;
  v227[45] = v89;
  v226[46] = CFSTR("momentIncludesFavoritedAsset");
  v90 = (uint64_t)v186;
  if (!v186)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v90 = objc_claimAutoreleasedReturnValue();
  }
  v120 = (void *)v90;
  v227[46] = v90;
  v226[47] = CFSTR("momentIncludesVideo");
  v91 = (uint64_t)v185;
  if (!v185)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v91 = objc_claimAutoreleasedReturnValue();
  }
  v119 = (void *)v91;
  v227[47] = v91;
  v226[48] = CFSTR("momentIncludesPhoto");
  v92 = (uint64_t)v184;
  if (!v184)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v92 = objc_claimAutoreleasedReturnValue();
  }
  v118 = (void *)v92;
  v227[48] = v92;
  v226[49] = CFSTR("suggestedEventCategory");
  v93 = (uint64_t)v183;
  if (!v183)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v93 = objc_claimAutoreleasedReturnValue();
  }
  v117 = (void *)v93;
  v227[49] = v93;
  v226[50] = CFSTR("numAttendees");
  v94 = (uint64_t)v182;
  if (!v182)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v94 = objc_claimAutoreleasedReturnValue();
  }
  v116 = (void *)v94;
  v227[50] = v94;
  v226[51] = CFSTR("numtripParts");
  v95 = (uint64_t)v181;
  if (!v181)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v95 = objc_claimAutoreleasedReturnValue();
  }
  v115 = (void *)v95;
  v227[51] = v95;
  v226[52] = CFSTR("tripMode");
  v96 = (uint64_t)v180;
  if (!v180)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v96 = objc_claimAutoreleasedReturnValue();
  }
  v114 = (void *)v96;
  v227[52] = v96;
  v226[53] = CFSTR("numScoredTopics");
  v97 = (uint64_t)v179;
  if (!v179)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v97 = objc_claimAutoreleasedReturnValue();
  }
  v169 = v55;
  v113 = (void *)v97;
  v227[53] = v97;
  v226[54] = CFSTR("numItemAuthors");
  v98 = (uint64_t)v178;
  if (!v178)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v98 = objc_claimAutoreleasedReturnValue();
  }
  v155 = (void *)v46;
  v112 = (void *)v98;
  v227[54] = v98;
  v226[55] = CFSTR("numItemRecipients");
  v99 = (uint64_t)v177;
  if (!v177)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v99 = objc_claimAutoreleasedReturnValue();
  }
  v168 = v53;
  v110 = v99;
  v227[55] = v99;
  v226[56] = CFSTR("isGatheringComplete");
  v100 = v176;
  if (!v176)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v99, v112, v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127,
      v128,
      v129,
      v130,
      v131,
      v132,
      v133,
      v134,
      v135,
      v136,
      v137,
      v138,
      v139,
      v140,
      v141,
      v142,
      v143,
      v144,
      v145,
      v146,
      v147,
      v148,
      v149,
      v150,
      v151,
      v152,
      v153);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v167 = v47;
  v227[56] = v100;
  v226[57] = CFSTR("gaPR");
  v101 = v175;
  v102 = v49;
  if (!v175)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v156 = (void *)v44;
  v227[57] = v101;
  v226[58] = CFSTR("pCount");
  v103 = v174;
  if (!v174)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v154 = (void *)v48;
  v104 = v45;
  v227[58] = v103;
  v226[59] = CFSTR("mapItemSource");
  v105 = v173;
  if (!v173)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v227[59] = v105;
  v226[60] = CFSTR("placeType");
  v106 = v172;
  if (!v172)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v227[60] = v106;
  v226[61] = CFSTR("placeLabelGranularity");
  v107 = v170;
  if (!v170)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v227[61] = v107;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v227, v226, 62, v110);
  v164 = (id)objc_claimAutoreleasedReturnValue();
  if (!v170)

  v108 = v57;
  if (!v172)
  {

    v108 = v57;
  }
  if (!v173)
  {

    v108 = v57;
  }
  if (!v174)
  {

    v108 = v57;
  }
  if (!v175)
  {

    v108 = v57;
  }
  if (!v176)
  {

    v108 = v57;
  }
  if (!v177)
  {

    v108 = v57;
  }
  if (!v178)
  {

    v108 = v57;
  }
  if (!v179)
  {

    v108 = v57;
  }
  if (!v180)
  {

    v108 = v57;
  }
  if (!v181)
  {

    v108 = v57;
  }
  if (!v182)
  {

    v108 = v57;
  }
  if (!v183)
  {

    v108 = v57;
  }
  if (!v184)
  {

    v108 = v57;
  }
  if (!v185)
  {

    v108 = v57;
  }
  if (!v186)
  {

    v108 = v57;
  }
  if (!v187)
  {

    v108 = v57;
  }
  if (!v188)
  {

    v108 = v57;
  }
  if (!v189)
  {

    v108 = v57;
  }
  if (!v190)
  {

    v108 = v57;
  }
  if (!v191)
  {

    v108 = v57;
  }
  if (!v192)
  {

    v108 = v57;
  }
  if (!v193)
  {

    v108 = v57;
  }
  if (!v194)
  {

    v108 = v57;
  }
  if (!v195)
  {

    v108 = v57;
  }
  if (!v196)
  {

    v108 = v57;
  }
  if (!v197)
  {

    v108 = v57;
  }
  if (!v198)
  {

    v108 = v57;
  }
  if (!v199)
  {

    v108 = v57;
  }
  if (!v200)
  {

    v108 = v57;
  }
  if (!v201)
  {

    v108 = v57;
  }
  if (!v202)
  {

    v108 = v57;
  }
  if (!v203)
  {

    v108 = v57;
  }
  if (!v204)
  {

    v108 = v57;
  }
  if (!v205)
  {

    v108 = v57;
  }
  if (!v206)
  {

    v108 = v57;
  }
  if (!v207)
  {

    v108 = v57;
  }
  if (!v208)
  {

    v108 = v57;
  }
  if (!v209)
  {

    v108 = v57;
  }
  if (!v210)
  {

    v108 = v57;
  }
  if (!v211)
  {

    v108 = v57;
  }
  if (!v212)
  {

    v108 = v57;
  }
  if (!v213)
  {

    v108 = v57;
  }
  if (!v214)
  {

    v108 = v57;
  }
  if (!v215)
  {

    v108 = v57;
  }
  if (!v216)
  {

    v108 = v57;
  }
  if (!v217)
  {

    v108 = v57;
  }
  if (!v218)
  {

    v108 = v57;
  }
  if (!v219)

  if (!v220)
  if (!v221)

  if (!v222)
  if (!v223)

  if (!v224)
  if (v225)
  {
    if (v168)
      goto LABEL_355;
  }
  else
  {

    if (v168)
    {
LABEL_355:
      if (v171)
        goto LABEL_356;
      goto LABEL_364;
    }
  }

  if (v171)
  {
LABEL_356:
    if (v104)
      goto LABEL_357;
    goto LABEL_365;
  }
LABEL_364:

  if (v104)
  {
LABEL_357:
    if (v102)
      goto LABEL_358;
    goto LABEL_366;
  }
LABEL_365:

  if (v102)
  {
LABEL_358:
    if (v167)
      goto LABEL_359;
    goto LABEL_367;
  }
LABEL_366:

  if (v167)
  {
LABEL_359:
    if (v51)
      goto LABEL_360;
LABEL_368:

    if (v169)
      goto LABEL_361;
LABEL_369:

    goto LABEL_361;
  }
LABEL_367:

  if (!v51)
    goto LABEL_368;
LABEL_360:
  if (!v169)
    goto LABEL_369;
LABEL_361:

  return v164;
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

- (NSDate)creationDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_creationDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_creationDate);
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

- (NSDate)sourceCreationDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_sourceCreationDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_sourceCreationDate);
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

- (NSDate)expirationDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_expirationDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_expirationDate);
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
  BOOL v12;
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
  int v46;
  int v47;
  int v48;
  int v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  int v67;
  double v68;
  double v69;
  double v70;
  int v71;
  double v72;
  double v73;
  double v74;
  int v75;
  int v76;
  int v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  double v90;
  double v91;
  double v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  int v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  int v141;
  int v142;
  int v143;
  int v144;
  int v145;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMomentsEventDataEvent eventIdentifier](self, "eventIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMomentsEventDataEvent eventIdentifier](self, "eventIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_236;
    }
    -[BMMomentsEventDataEvent startDate](self, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMomentsEventDataEvent startDate](self, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_236;
    }
    -[BMMomentsEventDataEvent endDate](self, "endDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMMomentsEventDataEvent endDate](self, "endDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_236;
    }
    -[BMMomentsEventDataEvent creationDate](self, "creationDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "creationDate");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMMomentsEventDataEvent creationDate](self, "creationDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "creationDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_236;
    }
    -[BMMomentsEventDataEvent sourceCreationDate](self, "sourceCreationDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceCreationDate");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMMomentsEventDataEvent sourceCreationDate](self, "sourceCreationDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceCreationDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_236;
    }
    -[BMMomentsEventDataEvent expirationDate](self, "expirationDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expirationDate");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMMomentsEventDataEvent expirationDate](self, "expirationDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "expirationDate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_236;
    }
    v43 = -[BMMomentsEventDataEvent provider](self, "provider");
    if (v43 != objc_msgSend(v5, "provider"))
      goto LABEL_236;
    v44 = -[BMMomentsEventDataEvent category](self, "category");
    if (v44 != objc_msgSend(v5, "category"))
      goto LABEL_236;
    v45 = -[BMMomentsEventDataEvent placeUserType](self, "placeUserType");
    if (v45 != objc_msgSend(v5, "placeUserType"))
      goto LABEL_236;
    v46 = -[BMMomentsEventDataEvent poiCategory](self, "poiCategory");
    if (v46 != objc_msgSend(v5, "poiCategory"))
      goto LABEL_236;
    v47 = -[BMMomentsEventDataEvent placeDiscovery](self, "placeDiscovery");
    if (v47 != objc_msgSend(v5, "placeDiscovery"))
      goto LABEL_236;
    v48 = -[BMMomentsEventDataEvent locationMode](self, "locationMode");
    if (v48 != objc_msgSend(v5, "locationMode"))
      goto LABEL_236;
    v49 = -[BMMomentsEventDataEvent workoutType](self, "workoutType");
    if (v49 != objc_msgSend(v5, "workoutType"))
      goto LABEL_236;
    -[BMMomentsEventDataEvent workoutBundleID](self, "workoutBundleID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workoutBundleID");
    v51 = objc_claimAutoreleasedReturnValue();
    if (v50 == (void *)v51)
    {

    }
    else
    {
      v52 = (void *)v51;
      -[BMMomentsEventDataEvent workoutBundleID](self, "workoutBundleID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "workoutBundleID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v53, "isEqual:", v54);

      if (!v55)
        goto LABEL_236;
    }
    v56 = -[BMMomentsEventDataEvent mediaGenre](self, "mediaGenre");
    if (v56 != objc_msgSend(v5, "mediaGenre"))
      goto LABEL_236;
    v57 = -[BMMomentsEventDataEvent mediaType](self, "mediaType");
    if (v57 != objc_msgSend(v5, "mediaType"))
      goto LABEL_236;
    if (-[BMMomentsEventDataEvent hasMediaRepetitions](self, "hasMediaRepetitions")
      || objc_msgSend(v5, "hasMediaRepetitions"))
    {
      if (!-[BMMomentsEventDataEvent hasMediaRepetitions](self, "hasMediaRepetitions"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasMediaRepetitions"))
        goto LABEL_236;
      v58 = -[BMMomentsEventDataEvent mediaRepetitions](self, "mediaRepetitions");
      if (v58 != objc_msgSend(v5, "mediaRepetitions"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasMediaSumTimePlayed](self, "hasMediaSumTimePlayed")
      || objc_msgSend(v5, "hasMediaSumTimePlayed"))
    {
      if (!-[BMMomentsEventDataEvent hasMediaSumTimePlayed](self, "hasMediaSumTimePlayed"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasMediaSumTimePlayed"))
        goto LABEL_236;
      v59 = -[BMMomentsEventDataEvent mediaSumTimePlayed](self, "mediaSumTimePlayed");
      if (v59 != objc_msgSend(v5, "mediaSumTimePlayed"))
        goto LABEL_236;
    }
    v60 = -[BMMomentsEventDataEvent sourceParty](self, "sourceParty");
    if (v60 != objc_msgSend(v5, "sourceParty"))
      goto LABEL_236;
    -[BMMomentsEventDataEvent mediaPlayerBundleID](self, "mediaPlayerBundleID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaPlayerBundleID");
    v62 = objc_claimAutoreleasedReturnValue();
    if (v61 == (void *)v62)
    {

    }
    else
    {
      v63 = (void *)v62;
      -[BMMomentsEventDataEvent mediaPlayerBundleID](self, "mediaPlayerBundleID");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaPlayerBundleID");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v64, "isEqual:", v65);

      if (!v66)
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasNumAudioMediaPlaySessionsPerDay](self, "hasNumAudioMediaPlaySessionsPerDay")
      || objc_msgSend(v5, "hasNumAudioMediaPlaySessionsPerDay"))
    {
      if (!-[BMMomentsEventDataEvent hasNumAudioMediaPlaySessionsPerDay](self, "hasNumAudioMediaPlaySessionsPerDay"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumAudioMediaPlaySessionsPerDay"))
        goto LABEL_236;
      v67 = -[BMMomentsEventDataEvent numAudioMediaPlaySessionsPerDay](self, "numAudioMediaPlaySessionsPerDay");
      if (v67 != objc_msgSend(v5, "numAudioMediaPlaySessionsPerDay"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasDurationAudioMediaPlaySessionsPerDay](self, "hasDurationAudioMediaPlaySessionsPerDay")|| objc_msgSend(v5, "hasDurationAudioMediaPlaySessionsPerDay"))
    {
      if (!-[BMMomentsEventDataEvent hasDurationAudioMediaPlaySessionsPerDay](self, "hasDurationAudioMediaPlaySessionsPerDay"))goto LABEL_236;
      if (!objc_msgSend(v5, "hasDurationAudioMediaPlaySessionsPerDay"))
        goto LABEL_236;
      -[BMMomentsEventDataEvent durationAudioMediaPlaySessionsPerDay](self, "durationAudioMediaPlaySessionsPerDay");
      v69 = v68;
      objc_msgSend(v5, "durationAudioMediaPlaySessionsPerDay");
      if (v69 != v70)
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasNumVideoMediaPlaySessionsPerDay](self, "hasNumVideoMediaPlaySessionsPerDay")
      || objc_msgSend(v5, "hasNumVideoMediaPlaySessionsPerDay"))
    {
      if (!-[BMMomentsEventDataEvent hasNumVideoMediaPlaySessionsPerDay](self, "hasNumVideoMediaPlaySessionsPerDay"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumVideoMediaPlaySessionsPerDay"))
        goto LABEL_236;
      v71 = -[BMMomentsEventDataEvent numVideoMediaPlaySessionsPerDay](self, "numVideoMediaPlaySessionsPerDay");
      if (v71 != objc_msgSend(v5, "numVideoMediaPlaySessionsPerDay"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasDurationVideoMediaPlaySessionsPerDay](self, "hasDurationVideoMediaPlaySessionsPerDay")|| objc_msgSend(v5, "hasDurationVideoMediaPlaySessionsPerDay"))
    {
      if (!-[BMMomentsEventDataEvent hasDurationVideoMediaPlaySessionsPerDay](self, "hasDurationVideoMediaPlaySessionsPerDay"))goto LABEL_236;
      if (!objc_msgSend(v5, "hasDurationVideoMediaPlaySessionsPerDay"))
        goto LABEL_236;
      -[BMMomentsEventDataEvent durationVideoMediaPlaySessionsPerDay](self, "durationVideoMediaPlaySessionsPerDay");
      v73 = v72;
      objc_msgSend(v5, "durationVideoMediaPlaySessionsPerDay");
      if (v73 != v74)
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasNumFirstPartyMediaPlaySessionsPerDay](self, "hasNumFirstPartyMediaPlaySessionsPerDay")|| objc_msgSend(v5, "hasNumFirstPartyMediaPlaySessionsPerDay"))
    {
      if (!-[BMMomentsEventDataEvent hasNumFirstPartyMediaPlaySessionsPerDay](self, "hasNumFirstPartyMediaPlaySessionsPerDay"))goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumFirstPartyMediaPlaySessionsPerDay"))
        goto LABEL_236;
      v75 = -[BMMomentsEventDataEvent numFirstPartyMediaPlaySessionsPerDay](self, "numFirstPartyMediaPlaySessionsPerDay");
      if (v75 != objc_msgSend(v5, "numFirstPartyMediaPlaySessionsPerDay"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasNumThirdPartyMediaPlaySessionsPerDay](self, "hasNumThirdPartyMediaPlaySessionsPerDay")|| objc_msgSend(v5, "hasNumThirdPartyMediaPlaySessionsPerDay"))
    {
      if (!-[BMMomentsEventDataEvent hasNumThirdPartyMediaPlaySessionsPerDay](self, "hasNumThirdPartyMediaPlaySessionsPerDay"))goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumThirdPartyMediaPlaySessionsPerDay"))
        goto LABEL_236;
      v76 = -[BMMomentsEventDataEvent numThirdPartyMediaPlaySessionsPerDay](self, "numThirdPartyMediaPlaySessionsPerDay");
      if (v76 != objc_msgSend(v5, "numThirdPartyMediaPlaySessionsPerDay"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasNumContacts](self, "hasNumContacts")
      || objc_msgSend(v5, "hasNumContacts"))
    {
      if (!-[BMMomentsEventDataEvent hasNumContacts](self, "hasNumContacts"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumContacts"))
        goto LABEL_236;
      v77 = -[BMMomentsEventDataEvent numContacts](self, "numContacts");
      if (v77 != objc_msgSend(v5, "numContacts"))
        goto LABEL_236;
    }
    -[BMMomentsEventDataEvent contactIDsInConversation](self, "contactIDsInConversation");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactIDsInConversation");
    v79 = objc_claimAutoreleasedReturnValue();
    if (v78 == (void *)v79)
    {

    }
    else
    {
      v80 = (void *)v79;
      -[BMMomentsEventDataEvent contactIDsInConversation](self, "contactIDsInConversation");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contactIDsInConversation");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v81, "isEqual:", v82);

      if (!v83)
        goto LABEL_236;
    }
    -[BMMomentsEventDataEvent contactIDMostSignificantInConversation](self, "contactIDMostSignificantInConversation");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactIDMostSignificantInConversation");
    v85 = objc_claimAutoreleasedReturnValue();
    if (v84 == (void *)v85)
    {

    }
    else
    {
      v86 = (void *)v85;
      -[BMMomentsEventDataEvent contactIDMostSignificantInConversation](self, "contactIDMostSignificantInConversation");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contactIDMostSignificantInConversation");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v87, "isEqual:", v88);

      if (!v89)
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasInteractionContactScore](self, "hasInteractionContactScore")
      || objc_msgSend(v5, "hasInteractionContactScore"))
    {
      if (!-[BMMomentsEventDataEvent hasInteractionContactScore](self, "hasInteractionContactScore"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasInteractionContactScore"))
        goto LABEL_236;
      -[BMMomentsEventDataEvent interactionContactScore](self, "interactionContactScore");
      v91 = v90;
      objc_msgSend(v5, "interactionContactScore");
      if (v91 != v92)
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasTextLikeMechanismIncluded](self, "hasTextLikeMechanismIncluded")
      || objc_msgSend(v5, "hasTextLikeMechanismIncluded"))
    {
      if (!-[BMMomentsEventDataEvent hasTextLikeMechanismIncluded](self, "hasTextLikeMechanismIncluded"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasTextLikeMechanismIncluded"))
        goto LABEL_236;
      v93 = -[BMMomentsEventDataEvent textLikeMechanismIncluded](self, "textLikeMechanismIncluded");
      if (v93 != objc_msgSend(v5, "textLikeMechanismIncluded"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasCallLikeMechanismIncluded](self, "hasCallLikeMechanismIncluded")
      || objc_msgSend(v5, "hasCallLikeMechanismIncluded"))
    {
      if (!-[BMMomentsEventDataEvent hasCallLikeMechanismIncluded](self, "hasCallLikeMechanismIncluded"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasCallLikeMechanismIncluded"))
        goto LABEL_236;
      v94 = -[BMMomentsEventDataEvent callLikeMechanismIncluded](self, "callLikeMechanismIncluded");
      if (v94 != objc_msgSend(v5, "callLikeMechanismIncluded"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasNumTextLikeInteractions](self, "hasNumTextLikeInteractions")
      || objc_msgSend(v5, "hasNumTextLikeInteractions"))
    {
      if (!-[BMMomentsEventDataEvent hasNumTextLikeInteractions](self, "hasNumTextLikeInteractions"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumTextLikeInteractions"))
        goto LABEL_236;
      v95 = -[BMMomentsEventDataEvent numTextLikeInteractions](self, "numTextLikeInteractions");
      if (v95 != objc_msgSend(v5, "numTextLikeInteractions"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasNumAudioLikeInteractions](self, "hasNumAudioLikeInteractions")
      || objc_msgSend(v5, "hasNumAudioLikeInteractions"))
    {
      if (!-[BMMomentsEventDataEvent hasNumAudioLikeInteractions](self, "hasNumAudioLikeInteractions"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumAudioLikeInteractions"))
        goto LABEL_236;
      v96 = -[BMMomentsEventDataEvent numAudioLikeInteractions](self, "numAudioLikeInteractions");
      if (v96 != objc_msgSend(v5, "numAudioLikeInteractions"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasNumVideoLikeInteractions](self, "hasNumVideoLikeInteractions")
      || objc_msgSend(v5, "hasNumVideoLikeInteractions"))
    {
      if (!-[BMMomentsEventDataEvent hasNumVideoLikeInteractions](self, "hasNumVideoLikeInteractions"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumVideoLikeInteractions"))
        goto LABEL_236;
      v97 = -[BMMomentsEventDataEvent numVideoLikeInteractions](self, "numVideoLikeInteractions");
      if (v97 != objc_msgSend(v5, "numVideoLikeInteractions"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasTotalDurationOfCallLikeInteractions](self, "hasTotalDurationOfCallLikeInteractions")|| objc_msgSend(v5, "hasTotalDurationOfCallLikeInteractions"))
    {
      if (!-[BMMomentsEventDataEvent hasTotalDurationOfCallLikeInteractions](self, "hasTotalDurationOfCallLikeInteractions"))goto LABEL_236;
      if (!objc_msgSend(v5, "hasTotalDurationOfCallLikeInteractions"))
        goto LABEL_236;
      -[BMMomentsEventDataEvent totalDurationOfCallLikeInteractions](self, "totalDurationOfCallLikeInteractions");
      v99 = v98;
      objc_msgSend(v5, "totalDurationOfCallLikeInteractions");
      if (v99 != v100)
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasMinDurationOfCallLikeInteractions](self, "hasMinDurationOfCallLikeInteractions")
      || objc_msgSend(v5, "hasMinDurationOfCallLikeInteractions"))
    {
      if (!-[BMMomentsEventDataEvent hasMinDurationOfCallLikeInteractions](self, "hasMinDurationOfCallLikeInteractions"))goto LABEL_236;
      if (!objc_msgSend(v5, "hasMinDurationOfCallLikeInteractions"))
        goto LABEL_236;
      -[BMMomentsEventDataEvent minDurationOfCallLikeInteractions](self, "minDurationOfCallLikeInteractions");
      v102 = v101;
      objc_msgSend(v5, "minDurationOfCallLikeInteractions");
      if (v102 != v103)
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasMaxDurationOfCallLikeInteractions](self, "hasMaxDurationOfCallLikeInteractions")
      || objc_msgSend(v5, "hasMaxDurationOfCallLikeInteractions"))
    {
      if (!-[BMMomentsEventDataEvent hasMaxDurationOfCallLikeInteractions](self, "hasMaxDurationOfCallLikeInteractions"))goto LABEL_236;
      if (!objc_msgSend(v5, "hasMaxDurationOfCallLikeInteractions"))
        goto LABEL_236;
      -[BMMomentsEventDataEvent maxDurationOfCallLikeInteractions](self, "maxDurationOfCallLikeInteractions");
      v105 = v104;
      objc_msgSend(v5, "maxDurationOfCallLikeInteractions");
      if (v105 != v106)
        goto LABEL_236;
    }
    v107 = -[BMMomentsEventDataEvent photoMomentSource](self, "photoMomentSource");
    if (v107 != objc_msgSend(v5, "photoMomentSource"))
      goto LABEL_236;
    -[BMMomentsEventDataEvent photoMomentInferences](self, "photoMomentInferences");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoMomentInferences");
    v109 = objc_claimAutoreleasedReturnValue();
    if (v108 == (void *)v109)
    {

    }
    else
    {
      v110 = (void *)v109;
      -[BMMomentsEventDataEvent photoMomentInferences](self, "photoMomentInferences");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "photoMomentInferences");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = objc_msgSend(v111, "isEqual:", v112);

      if (!v113)
        goto LABEL_236;
    }
    -[BMMomentsEventDataEvent photoMomentHolidays](self, "photoMomentHolidays");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoMomentHolidays");
    v115 = objc_claimAutoreleasedReturnValue();
    if (v114 == (void *)v115)
    {

    }
    else
    {
      v116 = (void *)v115;
      -[BMMomentsEventDataEvent photoMomentHolidays](self, "photoMomentHolidays");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "photoMomentHolidays");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend(v117, "isEqual:", v118);

      if (!v119)
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasNumPhotoMomentHolidays](self, "hasNumPhotoMomentHolidays")
      || objc_msgSend(v5, "hasNumPhotoMomentHolidays"))
    {
      if (!-[BMMomentsEventDataEvent hasNumPhotoMomentHolidays](self, "hasNumPhotoMomentHolidays"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumPhotoMomentHolidays"))
        goto LABEL_236;
      v120 = -[BMMomentsEventDataEvent numPhotoMomentHolidays](self, "numPhotoMomentHolidays");
      if (v120 != objc_msgSend(v5, "numPhotoMomentHolidays"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasNumPhotoMomentInferences](self, "hasNumPhotoMomentInferences")
      || objc_msgSend(v5, "hasNumPhotoMomentInferences"))
    {
      if (!-[BMMomentsEventDataEvent hasNumPhotoMomentInferences](self, "hasNumPhotoMomentInferences"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumPhotoMomentInferences"))
        goto LABEL_236;
      v121 = -[BMMomentsEventDataEvent numPhotoMomentInferences](self, "numPhotoMomentInferences");
      if (v121 != objc_msgSend(v5, "numPhotoMomentInferences"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasNumPhotoMomentPublicEvents](self, "hasNumPhotoMomentPublicEvents")
      || objc_msgSend(v5, "hasNumPhotoMomentPublicEvents"))
    {
      if (!-[BMMomentsEventDataEvent hasNumPhotoMomentPublicEvents](self, "hasNumPhotoMomentPublicEvents"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumPhotoMomentPublicEvents"))
        goto LABEL_236;
      v122 = -[BMMomentsEventDataEvent numPhotoMomentPublicEvents](self, "numPhotoMomentPublicEvents");
      if (v122 != objc_msgSend(v5, "numPhotoMomentPublicEvents"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasNumPhotoMomentPersons](self, "hasNumPhotoMomentPersons")
      || objc_msgSend(v5, "hasNumPhotoMomentPersons"))
    {
      if (!-[BMMomentsEventDataEvent hasNumPhotoMomentPersons](self, "hasNumPhotoMomentPersons"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumPhotoMomentPersons"))
        goto LABEL_236;
      v123 = -[BMMomentsEventDataEvent numPhotoMomentPersons](self, "numPhotoMomentPersons");
      if (v123 != objc_msgSend(v5, "numPhotoMomentPersons"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasIsFamilyInPhotoMoment](self, "hasIsFamilyInPhotoMoment")
      || objc_msgSend(v5, "hasIsFamilyInPhotoMoment"))
    {
      if (!-[BMMomentsEventDataEvent hasIsFamilyInPhotoMoment](self, "hasIsFamilyInPhotoMoment"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasIsFamilyInPhotoMoment"))
        goto LABEL_236;
      v124 = -[BMMomentsEventDataEvent isFamilyInPhotoMoment](self, "isFamilyInPhotoMoment");
      if (v124 != objc_msgSend(v5, "isFamilyInPhotoMoment"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasMomentIncludesFavoritedAsset](self, "hasMomentIncludesFavoritedAsset")
      || objc_msgSend(v5, "hasMomentIncludesFavoritedAsset"))
    {
      if (!-[BMMomentsEventDataEvent hasMomentIncludesFavoritedAsset](self, "hasMomentIncludesFavoritedAsset"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasMomentIncludesFavoritedAsset"))
        goto LABEL_236;
      v125 = -[BMMomentsEventDataEvent momentIncludesFavoritedAsset](self, "momentIncludesFavoritedAsset");
      if (v125 != objc_msgSend(v5, "momentIncludesFavoritedAsset"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasMomentIncludesVideo](self, "hasMomentIncludesVideo")
      || objc_msgSend(v5, "hasMomentIncludesVideo"))
    {
      if (!-[BMMomentsEventDataEvent hasMomentIncludesVideo](self, "hasMomentIncludesVideo"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasMomentIncludesVideo"))
        goto LABEL_236;
      v126 = -[BMMomentsEventDataEvent momentIncludesVideo](self, "momentIncludesVideo");
      if (v126 != objc_msgSend(v5, "momentIncludesVideo"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasMomentIncludesPhoto](self, "hasMomentIncludesPhoto")
      || objc_msgSend(v5, "hasMomentIncludesPhoto"))
    {
      if (!-[BMMomentsEventDataEvent hasMomentIncludesPhoto](self, "hasMomentIncludesPhoto"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasMomentIncludesPhoto"))
        goto LABEL_236;
      v127 = -[BMMomentsEventDataEvent momentIncludesPhoto](self, "momentIncludesPhoto");
      if (v127 != objc_msgSend(v5, "momentIncludesPhoto"))
        goto LABEL_236;
    }
    v128 = -[BMMomentsEventDataEvent suggestedEventCategory](self, "suggestedEventCategory");
    if (v128 != objc_msgSend(v5, "suggestedEventCategory"))
      goto LABEL_236;
    if (-[BMMomentsEventDataEvent hasNumAttendees](self, "hasNumAttendees")
      || objc_msgSend(v5, "hasNumAttendees"))
    {
      if (!-[BMMomentsEventDataEvent hasNumAttendees](self, "hasNumAttendees"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumAttendees"))
        goto LABEL_236;
      v129 = -[BMMomentsEventDataEvent numAttendees](self, "numAttendees");
      if (v129 != objc_msgSend(v5, "numAttendees"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasNumtripParts](self, "hasNumtripParts")
      || objc_msgSend(v5, "hasNumtripParts"))
    {
      if (!-[BMMomentsEventDataEvent hasNumtripParts](self, "hasNumtripParts"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumtripParts"))
        goto LABEL_236;
      v130 = -[BMMomentsEventDataEvent numtripParts](self, "numtripParts");
      if (v130 != objc_msgSend(v5, "numtripParts"))
        goto LABEL_236;
    }
    v131 = -[BMMomentsEventDataEvent tripMode](self, "tripMode");
    if (v131 != objc_msgSend(v5, "tripMode"))
      goto LABEL_236;
    if (-[BMMomentsEventDataEvent hasNumScoredTopics](self, "hasNumScoredTopics")
      || objc_msgSend(v5, "hasNumScoredTopics"))
    {
      if (!-[BMMomentsEventDataEvent hasNumScoredTopics](self, "hasNumScoredTopics"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumScoredTopics"))
        goto LABEL_236;
      v132 = -[BMMomentsEventDataEvent numScoredTopics](self, "numScoredTopics");
      if (v132 != objc_msgSend(v5, "numScoredTopics"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasNumItemAuthors](self, "hasNumItemAuthors")
      || objc_msgSend(v5, "hasNumItemAuthors"))
    {
      if (!-[BMMomentsEventDataEvent hasNumItemAuthors](self, "hasNumItemAuthors"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumItemAuthors"))
        goto LABEL_236;
      v133 = -[BMMomentsEventDataEvent numItemAuthors](self, "numItemAuthors");
      if (v133 != objc_msgSend(v5, "numItemAuthors"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasNumItemRecipients](self, "hasNumItemRecipients")
      || objc_msgSend(v5, "hasNumItemRecipients"))
    {
      if (!-[BMMomentsEventDataEvent hasNumItemRecipients](self, "hasNumItemRecipients"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasNumItemRecipients"))
        goto LABEL_236;
      v134 = -[BMMomentsEventDataEvent numItemRecipients](self, "numItemRecipients");
      if (v134 != objc_msgSend(v5, "numItemRecipients"))
        goto LABEL_236;
    }
    if (-[BMMomentsEventDataEvent hasIsGatheringComplete](self, "hasIsGatheringComplete")
      || objc_msgSend(v5, "hasIsGatheringComplete"))
    {
      if (!-[BMMomentsEventDataEvent hasIsGatheringComplete](self, "hasIsGatheringComplete"))
        goto LABEL_236;
      if (!objc_msgSend(v5, "hasIsGatheringComplete"))
        goto LABEL_236;
      v135 = -[BMMomentsEventDataEvent isGatheringComplete](self, "isGatheringComplete");
      if (v135 != objc_msgSend(v5, "isGatheringComplete"))
        goto LABEL_236;
    }
    -[BMMomentsEventDataEvent gaPR](self, "gaPR");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gaPR");
    v137 = objc_claimAutoreleasedReturnValue();
    if (v136 == (void *)v137)
    {

    }
    else
    {
      v138 = (void *)v137;
      -[BMMomentsEventDataEvent gaPR](self, "gaPR");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "gaPR");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = objc_msgSend(v139, "isEqual:", v140);

      if (!v141)
        goto LABEL_236;
    }
    if (!-[BMMomentsEventDataEvent hasPCount](self, "hasPCount") && !objc_msgSend(v5, "hasPCount")
      || -[BMMomentsEventDataEvent hasPCount](self, "hasPCount")
      && objc_msgSend(v5, "hasPCount")
      && (v142 = -[BMMomentsEventDataEvent pCount](self, "pCount"), v142 == objc_msgSend(v5, "pCount")))
    {
      v143 = -[BMMomentsEventDataEvent mapItemSource](self, "mapItemSource");
      if (v143 == objc_msgSend(v5, "mapItemSource"))
      {
        v144 = -[BMMomentsEventDataEvent placeType](self, "placeType");
        if (v144 == objc_msgSend(v5, "placeType"))
        {
          v145 = -[BMMomentsEventDataEvent placeLabelGranularity](self, "placeLabelGranularity");
          v12 = v145 == objc_msgSend(v5, "placeLabelGranularity");
LABEL_237:

          goto LABEL_238;
        }
      }
    }
LABEL_236:
    v12 = 0;
    goto LABEL_237;
  }
  v12 = 0;
LABEL_238:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (int)provider
{
  return self->_provider;
}

- (int)category
{
  return self->_category;
}

- (int)placeUserType
{
  return self->_placeUserType;
}

- (int)poiCategory
{
  return self->_poiCategory;
}

- (int)placeDiscovery
{
  return self->_placeDiscovery;
}

- (int)locationMode
{
  return self->_locationMode;
}

- (int)workoutType
{
  return self->_workoutType;
}

- (NSString)workoutBundleID
{
  return self->_workoutBundleID;
}

- (int)mediaGenre
{
  return self->_mediaGenre;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (int)mediaRepetitions
{
  return self->_mediaRepetitions;
}

- (BOOL)hasMediaRepetitions
{
  return self->_hasMediaRepetitions;
}

- (void)setHasMediaRepetitions:(BOOL)a3
{
  self->_hasMediaRepetitions = a3;
}

- (int)mediaSumTimePlayed
{
  return self->_mediaSumTimePlayed;
}

- (BOOL)hasMediaSumTimePlayed
{
  return self->_hasMediaSumTimePlayed;
}

- (void)setHasMediaSumTimePlayed:(BOOL)a3
{
  self->_hasMediaSumTimePlayed = a3;
}

- (int)sourceParty
{
  return self->_sourceParty;
}

- (NSString)mediaPlayerBundleID
{
  return self->_mediaPlayerBundleID;
}

- (int)numAudioMediaPlaySessionsPerDay
{
  return self->_numAudioMediaPlaySessionsPerDay;
}

- (BOOL)hasNumAudioMediaPlaySessionsPerDay
{
  return self->_hasNumAudioMediaPlaySessionsPerDay;
}

- (void)setHasNumAudioMediaPlaySessionsPerDay:(BOOL)a3
{
  self->_hasNumAudioMediaPlaySessionsPerDay = a3;
}

- (double)durationAudioMediaPlaySessionsPerDay
{
  return self->_durationAudioMediaPlaySessionsPerDay;
}

- (BOOL)hasDurationAudioMediaPlaySessionsPerDay
{
  return self->_hasDurationAudioMediaPlaySessionsPerDay;
}

- (void)setHasDurationAudioMediaPlaySessionsPerDay:(BOOL)a3
{
  self->_hasDurationAudioMediaPlaySessionsPerDay = a3;
}

- (int)numVideoMediaPlaySessionsPerDay
{
  return self->_numVideoMediaPlaySessionsPerDay;
}

- (BOOL)hasNumVideoMediaPlaySessionsPerDay
{
  return self->_hasNumVideoMediaPlaySessionsPerDay;
}

- (void)setHasNumVideoMediaPlaySessionsPerDay:(BOOL)a3
{
  self->_hasNumVideoMediaPlaySessionsPerDay = a3;
}

- (double)durationVideoMediaPlaySessionsPerDay
{
  return self->_durationVideoMediaPlaySessionsPerDay;
}

- (BOOL)hasDurationVideoMediaPlaySessionsPerDay
{
  return self->_hasDurationVideoMediaPlaySessionsPerDay;
}

- (void)setHasDurationVideoMediaPlaySessionsPerDay:(BOOL)a3
{
  self->_hasDurationVideoMediaPlaySessionsPerDay = a3;
}

- (int)numFirstPartyMediaPlaySessionsPerDay
{
  return self->_numFirstPartyMediaPlaySessionsPerDay;
}

- (BOOL)hasNumFirstPartyMediaPlaySessionsPerDay
{
  return self->_hasNumFirstPartyMediaPlaySessionsPerDay;
}

- (void)setHasNumFirstPartyMediaPlaySessionsPerDay:(BOOL)a3
{
  self->_hasNumFirstPartyMediaPlaySessionsPerDay = a3;
}

- (int)numThirdPartyMediaPlaySessionsPerDay
{
  return self->_numThirdPartyMediaPlaySessionsPerDay;
}

- (BOOL)hasNumThirdPartyMediaPlaySessionsPerDay
{
  return self->_hasNumThirdPartyMediaPlaySessionsPerDay;
}

- (void)setHasNumThirdPartyMediaPlaySessionsPerDay:(BOOL)a3
{
  self->_hasNumThirdPartyMediaPlaySessionsPerDay = a3;
}

- (int)numContacts
{
  return self->_numContacts;
}

- (BOOL)hasNumContacts
{
  return self->_hasNumContacts;
}

- (void)setHasNumContacts:(BOOL)a3
{
  self->_hasNumContacts = a3;
}

- (NSArray)contactIDsInConversation
{
  return self->_contactIDsInConversation;
}

- (NSString)contactIDMostSignificantInConversation
{
  return self->_contactIDMostSignificantInConversation;
}

- (double)interactionContactScore
{
  return self->_interactionContactScore;
}

- (BOOL)hasInteractionContactScore
{
  return self->_hasInteractionContactScore;
}

- (void)setHasInteractionContactScore:(BOOL)a3
{
  self->_hasInteractionContactScore = a3;
}

- (BOOL)textLikeMechanismIncluded
{
  return self->_textLikeMechanismIncluded;
}

- (BOOL)hasTextLikeMechanismIncluded
{
  return self->_hasTextLikeMechanismIncluded;
}

- (void)setHasTextLikeMechanismIncluded:(BOOL)a3
{
  self->_hasTextLikeMechanismIncluded = a3;
}

- (BOOL)callLikeMechanismIncluded
{
  return self->_callLikeMechanismIncluded;
}

- (BOOL)hasCallLikeMechanismIncluded
{
  return self->_hasCallLikeMechanismIncluded;
}

- (void)setHasCallLikeMechanismIncluded:(BOOL)a3
{
  self->_hasCallLikeMechanismIncluded = a3;
}

- (int)numTextLikeInteractions
{
  return self->_numTextLikeInteractions;
}

- (BOOL)hasNumTextLikeInteractions
{
  return self->_hasNumTextLikeInteractions;
}

- (void)setHasNumTextLikeInteractions:(BOOL)a3
{
  self->_hasNumTextLikeInteractions = a3;
}

- (int)numAudioLikeInteractions
{
  return self->_numAudioLikeInteractions;
}

- (BOOL)hasNumAudioLikeInteractions
{
  return self->_hasNumAudioLikeInteractions;
}

- (void)setHasNumAudioLikeInteractions:(BOOL)a3
{
  self->_hasNumAudioLikeInteractions = a3;
}

- (int)numVideoLikeInteractions
{
  return self->_numVideoLikeInteractions;
}

- (BOOL)hasNumVideoLikeInteractions
{
  return self->_hasNumVideoLikeInteractions;
}

- (void)setHasNumVideoLikeInteractions:(BOOL)a3
{
  self->_hasNumVideoLikeInteractions = a3;
}

- (double)totalDurationOfCallLikeInteractions
{
  return self->_totalDurationOfCallLikeInteractions;
}

- (BOOL)hasTotalDurationOfCallLikeInteractions
{
  return self->_hasTotalDurationOfCallLikeInteractions;
}

- (void)setHasTotalDurationOfCallLikeInteractions:(BOOL)a3
{
  self->_hasTotalDurationOfCallLikeInteractions = a3;
}

- (double)minDurationOfCallLikeInteractions
{
  return self->_minDurationOfCallLikeInteractions;
}

- (BOOL)hasMinDurationOfCallLikeInteractions
{
  return self->_hasMinDurationOfCallLikeInteractions;
}

- (void)setHasMinDurationOfCallLikeInteractions:(BOOL)a3
{
  self->_hasMinDurationOfCallLikeInteractions = a3;
}

- (double)maxDurationOfCallLikeInteractions
{
  return self->_maxDurationOfCallLikeInteractions;
}

- (BOOL)hasMaxDurationOfCallLikeInteractions
{
  return self->_hasMaxDurationOfCallLikeInteractions;
}

- (void)setHasMaxDurationOfCallLikeInteractions:(BOOL)a3
{
  self->_hasMaxDurationOfCallLikeInteractions = a3;
}

- (int)suggestedEventCategory
{
  return self->_suggestedEventCategory;
}

- (int)numAttendees
{
  return self->_numAttendees;
}

- (BOOL)hasNumAttendees
{
  return self->_hasNumAttendees;
}

- (void)setHasNumAttendees:(BOOL)a3
{
  self->_hasNumAttendees = a3;
}

- (int)numtripParts
{
  return self->_numtripParts;
}

- (BOOL)hasNumtripParts
{
  return self->_hasNumtripParts;
}

- (void)setHasNumtripParts:(BOOL)a3
{
  self->_hasNumtripParts = a3;
}

- (int)tripMode
{
  return self->_tripMode;
}

- (int)numScoredTopics
{
  return self->_numScoredTopics;
}

- (BOOL)hasNumScoredTopics
{
  return self->_hasNumScoredTopics;
}

- (void)setHasNumScoredTopics:(BOOL)a3
{
  self->_hasNumScoredTopics = a3;
}

- (int)numItemAuthors
{
  return self->_numItemAuthors;
}

- (BOOL)hasNumItemAuthors
{
  return self->_hasNumItemAuthors;
}

- (void)setHasNumItemAuthors:(BOOL)a3
{
  self->_hasNumItemAuthors = a3;
}

- (int)numItemRecipients
{
  return self->_numItemRecipients;
}

- (BOOL)hasNumItemRecipients
{
  return self->_hasNumItemRecipients;
}

- (void)setHasNumItemRecipients:(BOOL)a3
{
  self->_hasNumItemRecipients = a3;
}

- (BOOL)isGatheringComplete
{
  return self->_isGatheringComplete;
}

- (BOOL)hasIsGatheringComplete
{
  return self->_hasIsGatheringComplete;
}

- (void)setHasIsGatheringComplete:(BOOL)a3
{
  self->_hasIsGatheringComplete = a3;
}

- (BMMomentsEventDataPR)gaPR
{
  return self->_gaPR;
}

- (int)pCount
{
  return self->_pCount;
}

- (BOOL)hasPCount
{
  return self->_hasPCount;
}

- (void)setHasPCount:(BOOL)a3
{
  self->_hasPCount = a3;
}

- (int)mapItemSource
{
  return self->_mapItemSource;
}

- (int)placeType
{
  return self->_placeType;
}

- (int)placeLabelGranularity
{
  return self->_placeLabelGranularity;
}

- (int)photoMomentSource
{
  return self->_photoMomentSource;
}

- (NSArray)photoMomentInferences
{
  return self->_photoMomentInferences;
}

- (NSArray)photoMomentHolidays
{
  return self->_photoMomentHolidays;
}

- (int)numPhotoMomentHolidays
{
  return self->_numPhotoMomentHolidays;
}

- (BOOL)hasNumPhotoMomentHolidays
{
  return self->_hasNumPhotoMomentHolidays;
}

- (void)setHasNumPhotoMomentHolidays:(BOOL)a3
{
  self->_hasNumPhotoMomentHolidays = a3;
}

- (int)numPhotoMomentInferences
{
  return self->_numPhotoMomentInferences;
}

- (BOOL)hasNumPhotoMomentInferences
{
  return self->_hasNumPhotoMomentInferences;
}

- (void)setHasNumPhotoMomentInferences:(BOOL)a3
{
  self->_hasNumPhotoMomentInferences = a3;
}

- (int)numPhotoMomentPublicEvents
{
  return self->_numPhotoMomentPublicEvents;
}

- (BOOL)hasNumPhotoMomentPublicEvents
{
  return self->_hasNumPhotoMomentPublicEvents;
}

- (void)setHasNumPhotoMomentPublicEvents:(BOOL)a3
{
  self->_hasNumPhotoMomentPublicEvents = a3;
}

- (int)numPhotoMomentPersons
{
  return self->_numPhotoMomentPersons;
}

- (BOOL)hasNumPhotoMomentPersons
{
  return self->_hasNumPhotoMomentPersons;
}

- (void)setHasNumPhotoMomentPersons:(BOOL)a3
{
  self->_hasNumPhotoMomentPersons = a3;
}

- (BOOL)isFamilyInPhotoMoment
{
  return self->_isFamilyInPhotoMoment;
}

- (BOOL)hasIsFamilyInPhotoMoment
{
  return self->_hasIsFamilyInPhotoMoment;
}

- (void)setHasIsFamilyInPhotoMoment:(BOOL)a3
{
  self->_hasIsFamilyInPhotoMoment = a3;
}

- (BOOL)momentIncludesFavoritedAsset
{
  return self->_momentIncludesFavoritedAsset;
}

- (BOOL)hasMomentIncludesFavoritedAsset
{
  return self->_hasMomentIncludesFavoritedAsset;
}

- (void)setHasMomentIncludesFavoritedAsset:(BOOL)a3
{
  self->_hasMomentIncludesFavoritedAsset = a3;
}

- (BOOL)momentIncludesVideo
{
  return self->_momentIncludesVideo;
}

- (BOOL)hasMomentIncludesVideo
{
  return self->_hasMomentIncludesVideo;
}

- (void)setHasMomentIncludesVideo:(BOOL)a3
{
  self->_hasMomentIncludesVideo = a3;
}

- (BOOL)momentIncludesPhoto
{
  return self->_momentIncludesPhoto;
}

- (BOOL)hasMomentIncludesPhoto
{
  return self->_hasMomentIncludesPhoto;
}

- (void)setHasMomentIncludesPhoto:(BOOL)a3
{
  self->_hasMomentIncludesPhoto = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoMomentHolidays, 0);
  objc_storeStrong((id *)&self->_photoMomentInferences, 0);
  objc_storeStrong((id *)&self->_gaPR, 0);
  objc_storeStrong((id *)&self->_contactIDMostSignificantInConversation, 0);
  objc_storeStrong((id *)&self->_contactIDsInConversation, 0);
  objc_storeStrong((id *)&self->_mediaPlayerBundleID, 0);
  objc_storeStrong((id *)&self->_workoutBundleID, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
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

    v4 = -[BMMomentsEventDataEvent initByReadFrom:]([BMMomentsEventDataEvent alloc], "initByReadFrom:", v7);
    v4[34] = 0;

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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[64];

  v66[62] = *MEMORY[0x1E0C80C00];
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventIdentifier"), 2, 0, 1, 13, 0);
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startDate"), 3, 0, 2, 0, 2);
  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("endDate"), 3, 0, 3, 0, 2);
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("creationDate"), 3, 0, 4, 0, 2);
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceCreationDate"), 3, 0, 5, 0, 2);
  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("expirationDate"), 3, 0, 6, 0, 2);
  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("provider"), 0, 0, 7, 4, 0);
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("category"), 0, 0, 8, 4, 0);
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("placeUserType"), 0, 0, 9, 4, 0);
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("poiCategory"), 0, 0, 10, 4, 0);
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("placeDiscovery"), 0, 0, 11, 4, 0);
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("locationMode"), 0, 0, 12, 4, 0);
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("workoutType"), 0, 0, 13, 4, 0);
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("workoutBundleID"), 2, 0, 14, 13, 0);
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaGenre"), 0, 0, 15, 4, 0);
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaType"), 0, 0, 16, 4, 0);
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaRepetitions"), 0, 0, 17, 2, 0);
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaSumTimePlayed"), 0, 0, 18, 2, 0);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceParty"), 0, 0, 19, 4, 0);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaPlayerBundleID"), 2, 0, 20, 13, 0);
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numAudioMediaPlaySessionsPerDay"), 0, 0, 21, 2, 0);
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("durationAudioMediaPlaySessionsPerDay"), 1, 0, 22, 0, 0);
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numVideoMediaPlaySessionsPerDay"), 0, 0, 23, 2, 0);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("durationVideoMediaPlaySessionsPerDay"), 1, 0, 24, 0, 0);
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numFirstPartyMediaPlaySessionsPerDay"), 0, 0, 25, 2, 0);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numThirdPartyMediaPlaySessionsPerDay"), 0, 0, 26, 2, 0);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numContacts"), 0, 0, 27, 2, 0);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("contactIDsInConversation_json"), 5, 1, &__block_literal_global_1505);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contactIDMostSignificantInConversation"), 2, 0, 29, 13, 0);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("interactionContactScore"), 1, 0, 30, 0, 0);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("textLikeMechanismIncluded"), 0, 0, 31, 12, 0);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("callLikeMechanismIncluded"), 0, 0, 32, 12, 0);
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numTextLikeInteractions"), 0, 0, 33, 2, 0);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numAudioLikeInteractions"), 0, 0, 34, 2, 0);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numVideoLikeInteractions"), 0, 0, 35, 2, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("totalDurationOfCallLikeInteractions"), 1, 0, 36, 0, 0);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("minDurationOfCallLikeInteractions"), 1, 0, 37, 0, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("maxDurationOfCallLikeInteractions"), 1, 0, 38, 0, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("photoMomentSource"), 0, 0, 39, 4, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("photoMomentInferences_json"), 5, 1, &__block_literal_global_1506);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("photoMomentHolidays_json"), 5, 1, &__block_literal_global_1507);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numPhotoMomentHolidays"), 0, 0, 42, 2, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numPhotoMomentInferences"), 0, 0, 43, 2, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numPhotoMomentPublicEvents"), 0, 0, 44, 2, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numPhotoMomentPersons"), 0, 0, 45, 2, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isFamilyInPhotoMoment"), 0, 0, 46, 12, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("momentIncludesFavoritedAsset"), 0, 0, 47, 12, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("momentIncludesVideo"), 0, 0, 48, 12, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("momentIncludesPhoto"), 0, 0, 49, 12, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("suggestedEventCategory"), 0, 0, 50, 4, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numAttendees"), 0, 0, 51, 2, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numtripParts"), 0, 0, 52, 2, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tripMode"), 0, 0, 53, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numScoredTopics"), 0, 0, 54, 2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numItemAuthors"), 0, 0, 55, 2, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numItemRecipients"), 0, 0, 56, 2, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isGatheringComplete"), 0, 0, 57, 12, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("gaPR_json"), 5, 1, &__block_literal_global_1508);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("pCount"), 0, 0, 59, 2, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mapItemSource"), 0, 0, 60, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("placeType"), 0, 0, 61, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("placeLabelGranularity"), 0, 0, 62, 4, 0);
  v66[0] = v65;
  v66[1] = v64;
  v66[2] = v63;
  v66[3] = v62;
  v66[4] = v61;
  v66[5] = v60;
  v66[6] = v59;
  v66[7] = v58;
  v66[8] = v57;
  v66[9] = v55;
  v66[10] = v56;
  v66[11] = v53;
  v66[12] = v54;
  v66[13] = v52;
  v66[14] = v51;
  v66[15] = v50;
  v66[16] = v49;
  v66[17] = v48;
  v66[18] = v47;
  v66[19] = v46;
  v66[20] = v45;
  v66[21] = v44;
  v66[22] = v43;
  v66[23] = v42;
  v66[24] = v41;
  v66[25] = v40;
  v66[26] = v39;
  v66[27] = v38;
  v66[28] = v37;
  v66[29] = v36;
  v66[30] = v35;
  v66[31] = v34;
  v66[32] = v33;
  v66[33] = v32;
  v66[34] = v31;
  v66[35] = v30;
  v66[36] = v29;
  v66[37] = v28;
  v66[38] = v27;
  v66[39] = v26;
  v66[40] = v25;
  v66[41] = v24;
  v66[42] = v23;
  v66[43] = v22;
  v66[44] = v21;
  v66[45] = v20;
  v66[46] = v19;
  v66[47] = v18;
  v66[48] = v17;
  v66[49] = v16;
  v66[50] = v15;
  v66[51] = v14;
  v66[52] = v2;
  v66[53] = v3;
  v66[54] = v4;
  v66[55] = v13;
  v66[56] = v5;
  v66[57] = v12;
  v66[58] = v6;
  v66[59] = v11;
  v66[60] = v7;
  v66[61] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 62);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1A6C8;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[64];

  v66[62] = *MEMORY[0x1E0C80C00];
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventIdentifier"), 1, 13, 0);
  v66[0] = v65;
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startDate"), 2, 0, 0);
  v66[1] = v64;
  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("endDate"), 3, 0, 0);
  v66[2] = v63;
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("creationDate"), 4, 0, 0);
  v66[3] = v62;
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceCreationDate"), 5, 0, 0);
  v66[4] = v61;
  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("expirationDate"), 6, 0, 0);
  v66[5] = v60;
  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("provider"), 7, 4, 0);
  v66[6] = v59;
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("category"), 8, 4, 0);
  v66[7] = v58;
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("placeUserType"), 9, 4, 0);
  v66[8] = v57;
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("poiCategory"), 10, 4, 0);
  v66[9] = v56;
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("placeDiscovery"), 11, 4, 0);
  v66[10] = v55;
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("locationMode"), 12, 4, 0);
  v66[11] = v54;
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("workoutType"), 13, 4, 0);
  v66[12] = v53;
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("workoutBundleID"), 14, 13, 0);
  v66[13] = v52;
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaGenre"), 15, 4, 0);
  v66[14] = v51;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaType"), 16, 4, 0);
  v66[15] = v50;
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaRepetitions"), 17, 2, 0);
  v66[16] = v49;
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaSumTimePlayed"), 18, 2, 0);
  v66[17] = v48;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceParty"), 19, 4, 0);
  v66[18] = v47;
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaPlayerBundleID"), 20, 13, 0);
  v66[19] = v46;
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numAudioMediaPlaySessionsPerDay"), 21, 2, 0);
  v66[20] = v45;
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("durationAudioMediaPlaySessionsPerDay"), 22, 0, 0);
  v66[21] = v44;
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numVideoMediaPlaySessionsPerDay"), 23, 2, 0);
  v66[22] = v43;
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("durationVideoMediaPlaySessionsPerDay"), 24, 0, 0);
  v66[23] = v42;
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numFirstPartyMediaPlaySessionsPerDay"), 25, 2, 0);
  v66[24] = v41;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numThirdPartyMediaPlaySessionsPerDay"), 26, 2, 0);
  v66[25] = v40;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numContacts"), 27, 2, 0);
  v66[26] = v39;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contactIDsInConversation"), 28, 13, 0);
  v66[27] = v38;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contactIDMostSignificantInConversation"), 29, 13, 0);
  v66[28] = v37;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("interactionContactScore"), 30, 0, 0);
  v66[29] = v36;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("textLikeMechanismIncluded"), 31, 12, 0);
  v66[30] = v35;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("callLikeMechanismIncluded"), 32, 12, 0);
  v66[31] = v34;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numTextLikeInteractions"), 33, 2, 0);
  v66[32] = v33;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numAudioLikeInteractions"), 34, 2, 0);
  v66[33] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numVideoLikeInteractions"), 35, 2, 0);
  v66[34] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("totalDurationOfCallLikeInteractions"), 36, 0, 0);
  v66[35] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("minDurationOfCallLikeInteractions"), 37, 0, 0);
  v66[36] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("maxDurationOfCallLikeInteractions"), 38, 0, 0);
  v66[37] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("photoMomentSource"), 39, 4, 0);
  v66[38] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("photoMomentInferences"), 40, 14, objc_opt_class());
  v66[39] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("photoMomentHolidays"), 41, 13, 0);
  v66[40] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numPhotoMomentHolidays"), 42, 2, 0);
  v66[41] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numPhotoMomentInferences"), 43, 2, 0);
  v66[42] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numPhotoMomentPublicEvents"), 44, 2, 0);
  v66[43] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numPhotoMomentPersons"), 45, 2, 0);
  v66[44] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isFamilyInPhotoMoment"), 46, 12, 0);
  v66[45] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("momentIncludesFavoritedAsset"), 47, 12, 0);
  v66[46] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("momentIncludesVideo"), 48, 12, 0);
  v66[47] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("momentIncludesPhoto"), 49, 12, 0);
  v66[48] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestedEventCategory"), 50, 4, 0);
  v66[49] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numAttendees"), 51, 2, 0);
  v66[50] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numtripParts"), 52, 2, 0);
  v66[51] = v14;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tripMode"), 53, 4, 0);
  v66[52] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numScoredTopics"), 54, 2, 0);
  v66[53] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numItemAuthors"), 55, 2, 0);
  v66[54] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numItemRecipients"), 56, 2, 0);
  v66[55] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isGatheringComplete"), 57, 12, 0);
  v66[56] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("gaPR"), 58, 14, objc_opt_class());
  v66[57] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("pCount"), 59, 2, 0);
  v66[58] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mapItemSource"), 60, 4, 0);
  v66[59] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("placeType"), 61, 4, 0);
  v66[60] = v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("placeLabelGranularity"), 62, 4, 0);
  v66[61] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 62);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __34__BMMomentsEventDataEvent_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gaPR");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __34__BMMomentsEventDataEvent_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_photoMomentHolidaysJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __34__BMMomentsEventDataEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_photoMomentInferencesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __34__BMMomentsEventDataEvent_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_contactIDsInConversationJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEventDataEvent)initWithEventIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 creationDate:(id)a6 sourceCreationDate:(id)a7 expirationDate:(id)a8 provider:(int)a9 category:(int)a10 placeUserType:(int)a11 poiCategory:(int)a12 placeDiscovery:(int)a13 locationMode:(int)a14 workoutType:(int)a15 workoutBundleID:(id)a16 mediaGenre:(int)a17 mediaType:(int)a18 mediaRepetitions:(id)a19 mediaSumTimePlayed:(id)a20 sourceParty:(int)a21 mediaPlayerBundleID:(id)a22 numAudioMediaPlaySessionsPerDay:(id)a23 durationAudioMediaPlaySessionsPerDay:(id)a24 numVideoMediaPlaySessionsPerDay:(id)a25 durationVideoMediaPlaySessionsPerDay:(id)a26 numFirstPartyMediaPlaySessionsPerDay:(id)a27 numThirdPartyMediaPlaySessionsPerDay:(id)a28 numContacts:(id)a29 contactIDsInConversation:(id)a30 contactIDMostSignificantInConversation:(id)a31 interactionContactScore:(id)a32 textLikeMechanismIncluded:(id)a33 callLikeMechanismIncluded:(id)a34 numTextLikeInteractions:(id)a35 numAudioLikeInteractions:(id)a36 numVideoLikeInteractions:(id)a37 totalDurationOfCallLikeInteractions:(id)a38 minDurationOfCallLikeInteractions:(id)a39 maxDurationOfCallLikeInteractions:(id)a40 photoMomentSource:(int)a41 photoMomentInferences:(id)a42 photoMomentHolidays:(id)a43 numPhotoMomentHolidays:(id)a44 numPhotoMomentInferences:(id)a45 numPhotoMomentPublicEvents:(id)a46 numPhotoMomentPersons:(id)a47 isFamilyInPhotoMoment:(id)a48 momentIncludesFavoritedAsset:(id)a49 momentIncludesVideo:(id)a50 momentIncludesPhoto:(id)a51 suggestedEventCategory:(int)a52 numAttendees:(id)a53 numtripParts:(id)a54 tripMode:(int)a55 numScoredTopics:(id)a56 numItemAuthors:(id)a57 numItemRecipients:(id)a58
{
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  LODWORD(v64) = 0;
  LODWORD(v63) = a55;
  LODWORD(v62) = a52;
  LODWORD(v61) = a41;
  LODWORD(v60) = a21;
  LODWORD(v59) = a15;
  return -[BMMomentsEventDataEvent initWithEventIdentifier:startDate:endDate:creationDate:sourceCreationDate:expirationDate:provider:category:placeUserType:poiCategory:placeDiscovery:locationMode:workoutType:workoutBundleID:mediaGenre:mediaType:mediaRepetitions:mediaSumTimePlayed:sourceParty:mediaPlayerBundleID:numAudioMediaPlaySessionsPerDay:durationAudioMediaPlaySessionsPerDay:numVideoMediaPlaySessionsPerDay:durationVideoMediaPlaySessionsPerDay:numFirstPartyMediaPlaySessionsPerDay:numThirdPartyMediaPlaySessionsPerDay:numContacts:contactIDsInConversation:contactIDMostSignificantInConversation:interactionContactScore:textLikeMechanismIncluded:callLikeMechanismIncluded:numTextLikeInteractions:numAudioLikeInteractions:numVideoLikeInteractions:totalDurationOfCallLikeInteractions:minDurationOfCallLikeInteractions:maxDurationOfCallLikeInteractions:photoMomentSource:photoMomentInferences:photoMomentHolidays:numPhotoMomentHolidays:numPhotoMomentInferences:numPhotoMomentPublicEvents:numPhotoMomentPersons:isFamilyInPhotoMoment:momentIncludesFavoritedAsset:momentIncludesVideo:momentIncludesPhoto:suggestedEventCategory:numAttendees:numtripParts:tripMode:numScoredTopics:numItemAuthors:numItemRecipients:isGatheringComplete:gaPR:pCount:mapItemSource:placeType:placeLabelGranularity:](self, "initWithEventIdentifier:startDate:endDate:creationDate:sourceCreationDate:expirationDate:provider:category:placeUserType:poiCategory:placeDiscovery:locationMode:workoutType:workoutBundleID:mediaGenre:mediaType:mediaRepetitions:mediaSumTimePlayed:sourceParty:mediaPlayerBundleID:numAudioMediaPlaySessionsPerDay:durationAudioMediaPlaySessionsPerDay:numVideoMediaPlaySessionsPerDay:durationVideoMediaPlaySessionsPerDay:numFirstPartyMediaPlaySessionsPerDay:numThirdPartyMediaPlaySessionsPerDay:numContacts:contactIDsInConversation:contactIDMostSignificantInConversation:interactionContactScore:textLikeMechanismIncluded:callLikeMechanismIncluded:numTextLikeInteractions:numAudioLikeInteractions:numVideoLikeInteractions:totalDurationOfCallLikeInteractions:minDurationOfCallLikeInteractions:maxDurationOfCallLikeInteractions:photoMomentSource:photoMomentInferences:photoMomentHolidays:numPhotoMomentHolidays:numPhotoMomentInferences:numPhotoMomentPublicEvents:numPhotoMomentPersons:isFamilyInPhotoMoment:momentIncludesFavoritedAsset:momentIncludesVideo:momentIncludesPhoto:suggestedEventCategory:numAttendees:numtripParts:tripMode:numScoredTopics:numItemAuthors:numItemRecipients:isGatheringComplete:gaPR:pCount:mapItemSource:placeType:placeLabelGranularity:", a3, a4, a5, a6, a7, a8,
           *(_QWORD *)&a9,
           *(_QWORD *)&a11,
           *(_QWORD *)&a13,
           v59,
           a16,
           __PAIR64__(a18, a17),
           a19,
           a20,
           v60,
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
           v61,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           v62,
           a53,
           a54,
           v63,
           a56,
           a57,
           a58,
           0,
           0,
           0,
           0,
           v64);
}

@end
