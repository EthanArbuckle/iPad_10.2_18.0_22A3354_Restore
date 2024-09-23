@implementation BMPhotosUserAnalytics

- (BMPhotosUserAnalytics)initWithIdentifier:(id)a3 userEvent:(id)a4 containsVIP:(id)a5 faceCount:(id)a6 containsPets:(id)a7 capturedAtHome:(id)a8 capturedAtWork:(id)a9 capturedAtFrequentLocation:(id)a10 capturedOnTrip:(id)a11 capturedOnShortTrip:(id)a12 isDocument:(id)a13 isMeme:(id)a14 isScreenshot:(id)a15 isFavorite:(id)a16 isCapturedOnWeekend:(id)a17 isCapturedAtPrivateEvent:(id)a18 isCapturedOnHoliday:(id)a19 mediaType:(int)a20 importSource:(int)a21 assetAge:(int)a22 userLibrarySize:(int)a23 userNumTrips:(id)a24 userNumVIPPeople:(id)a25 userNumFavorites:(id)a26 userHasVIP:(id)a27 userHasHome:(id)a28 userHasPet:(id)a29 containsBaby:(id)a30 containsSocialGroup:(id)a31 containsMyPet:(id)a32 containsCoWorker:(id)a33 containsFamily:(id)a34 containsFriends:(id)a35 containsPartner:(id)a36 containsParent:(id)a37 containsSibling:(id)a38 containsChild:(id)a39 isCoupon:(id)a40 isRecipe:(id)a41 isReceipt:(id)a42 isRecentView:(id)a43 isRecentEdit:(id)a44 isRecentShare:(id)a45 isRecentFavorite:(id)a46 isContainedInSharedAlbum:(id)a47 isContainedInOnThisDay:(id)a48 capturedAtAOI:(id)a49 capturedAtPOI:(id)a50 capturedAtROI:(id)a51 capturedAtBusiness:(id)a52 isCapturedAtPublicEvent:(id)a53 isContainedInVisualTrend:(id)a54 isContainedInActivity:(id)a55 isContainedInChildActivity:(id)a56 userLibraryAgeInDays:(int)a57 userisDAU:(id)a58
{
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  BMPhotosUserAnalytics *v71;
  int v72;
  int v73;
  int v74;
  int v75;
  float v76;
  double v77;
  BMPhotosUserAnalytics *v78;
  id v81;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
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
  id v125;
  objc_super v126;

  v84 = a3;
  v81 = a4;
  v83 = a4;
  v62 = a5;
  v63 = a6;
  v64 = a7;
  v125 = a8;
  v123 = a9;
  v65 = a10;
  v66 = a11;
  v122 = a12;
  v67 = a13;
  v68 = a14;
  v69 = a15;
  v121 = a16;
  v120 = a17;
  v119 = a18;
  v118 = a19;
  v70 = a24;
  v117 = a25;
  v116 = a26;
  v115 = a27;
  v114 = a28;
  v113 = a29;
  v112 = a30;
  v111 = a31;
  v110 = a32;
  v109 = a33;
  v108 = a34;
  v107 = a35;
  v106 = a36;
  v105 = a37;
  v104 = a38;
  v103 = a39;
  v102 = a40;
  v101 = a41;
  v100 = a42;
  v99 = a43;
  v98 = a44;
  v97 = a45;
  v96 = a46;
  v95 = a47;
  v94 = a48;
  v93 = a49;
  v92 = a50;
  v91 = a51;
  v90 = a52;
  v89 = a53;
  v88 = a54;
  v87 = a55;
  v86 = a56;
  v85 = a58;
  v126.receiver = self;
  v126.super_class = (Class)BMPhotosUserAnalytics;
  v71 = -[BMEventBase init](&v126, sel_init);

  if (v71)
  {
    v71->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v71->_identifier, a3);
    objc_storeStrong((id *)&v71->_userEvent, v81);
    if (v62)
    {
      v71->_hasContainsVIP = 1;
      v71->_containsVIP = objc_msgSend(v62, "BOOLValue");
    }
    else
    {
      v71->_hasContainsVIP = 0;
      v71->_containsVIP = 0;
    }
    if (v63)
    {
      v71->_hasFaceCount = 1;
      v72 = objc_msgSend(v63, "intValue");
    }
    else
    {
      v71->_hasFaceCount = 0;
      v72 = -1;
    }
    v71->_faceCount = v72;
    if (v64)
    {
      v71->_hasContainsPets = 1;
      v71->_containsPets = objc_msgSend(v64, "BOOLValue");
    }
    else
    {
      v71->_hasContainsPets = 0;
      v71->_containsPets = 0;
    }
    if (v125)
    {
      v71->_hasCapturedAtHome = 1;
      v71->_capturedAtHome = objc_msgSend(v125, "BOOLValue");
    }
    else
    {
      v71->_hasCapturedAtHome = 0;
      v71->_capturedAtHome = 0;
    }
    if (v123)
    {
      v71->_hasCapturedAtWork = 1;
      v71->_capturedAtWork = objc_msgSend(v123, "BOOLValue");
    }
    else
    {
      v71->_hasCapturedAtWork = 0;
      v71->_capturedAtWork = 0;
    }
    if (v65)
    {
      v71->_hasCapturedAtFrequentLocation = 1;
      v71->_capturedAtFrequentLocation = objc_msgSend(v65, "BOOLValue");
    }
    else
    {
      v71->_hasCapturedAtFrequentLocation = 0;
      v71->_capturedAtFrequentLocation = 0;
    }
    if (v66)
    {
      v71->_hasCapturedOnTrip = 1;
      v71->_capturedOnTrip = objc_msgSend(v66, "BOOLValue");
    }
    else
    {
      v71->_hasCapturedOnTrip = 0;
      v71->_capturedOnTrip = 0;
    }
    if (v122)
    {
      v71->_hasCapturedOnShortTrip = 1;
      v71->_capturedOnShortTrip = objc_msgSend(v122, "BOOLValue");
    }
    else
    {
      v71->_hasCapturedOnShortTrip = 0;
      v71->_capturedOnShortTrip = 0;
    }
    if (v67)
    {
      v71->_hasIsDocument = 1;
      v71->_isDocument = objc_msgSend(v67, "BOOLValue");
    }
    else
    {
      v71->_hasIsDocument = 0;
      v71->_isDocument = 0;
    }
    if (v68)
    {
      v71->_hasIsMeme = 1;
      v71->_isMeme = objc_msgSend(v68, "BOOLValue");
    }
    else
    {
      v71->_hasIsMeme = 0;
      v71->_isMeme = 0;
    }
    if (v69)
    {
      v71->_hasIsScreenshot = 1;
      v71->_isScreenshot = objc_msgSend(v69, "BOOLValue");
    }
    else
    {
      v71->_hasIsScreenshot = 0;
      v71->_isScreenshot = 0;
    }
    if (v121)
    {
      v71->_hasIsFavorite = 1;
      v71->_isFavorite = objc_msgSend(v121, "BOOLValue");
    }
    else
    {
      v71->_hasIsFavorite = 0;
      v71->_isFavorite = 0;
    }
    if (v120)
    {
      v71->_hasIsCapturedOnWeekend = 1;
      v71->_isCapturedOnWeekend = objc_msgSend(v120, "BOOLValue");
    }
    else
    {
      v71->_hasIsCapturedOnWeekend = 0;
      v71->_isCapturedOnWeekend = 0;
    }
    if (v119)
    {
      v71->_hasIsCapturedAtPrivateEvent = 1;
      v71->_isCapturedAtPrivateEvent = objc_msgSend(v119, "BOOLValue");
    }
    else
    {
      v71->_hasIsCapturedAtPrivateEvent = 0;
      v71->_isCapturedAtPrivateEvent = 0;
    }
    if (v118)
    {
      v71->_hasIsCapturedOnHoliday = 1;
      v71->_isCapturedOnHoliday = objc_msgSend(v118, "BOOLValue");
    }
    else
    {
      v71->_hasIsCapturedOnHoliday = 0;
      v71->_isCapturedOnHoliday = 0;
    }
    v71->_mediaType = a20;
    v71->_importSource = a21;
    v71->_assetAge = a22;
    v71->_userLibrarySize = a23;
    if (v70)
    {
      v71->_hasUserNumTrips = 1;
      v73 = objc_msgSend(v70, "intValue");
    }
    else
    {
      v71->_hasUserNumTrips = 0;
      v73 = -1;
    }
    v71->_userNumTrips = v73;
    if (v117)
    {
      v71->_hasUserNumVIPPeople = 1;
      v74 = objc_msgSend(v117, "intValue");
    }
    else
    {
      v71->_hasUserNumVIPPeople = 0;
      v74 = -1;
    }
    v71->_userNumVIPPeople = v74;
    if (v116)
    {
      v71->_hasUserNumFavorites = 1;
      v75 = objc_msgSend(v116, "intValue");
    }
    else
    {
      v71->_hasUserNumFavorites = 0;
      v75 = -1;
    }
    v71->_userNumFavorites = v75;
    if (v115)
    {
      v71->_hasUserHasVIP = 1;
      v71->_userHasVIP = objc_msgSend(v115, "BOOLValue");
    }
    else
    {
      v71->_hasUserHasVIP = 0;
      v71->_userHasVIP = 0;
    }
    if (v114)
    {
      v71->_hasUserHasHome = 1;
      v71->_userHasHome = objc_msgSend(v114, "BOOLValue");
    }
    else
    {
      v71->_hasUserHasHome = 0;
      v71->_userHasHome = 0;
    }
    if (v113)
    {
      v71->_hasUserHasPet = 1;
      v71->_userHasPet = objc_msgSend(v113, "BOOLValue");
    }
    else
    {
      v71->_hasUserHasPet = 0;
      v71->_userHasPet = 0;
    }
    if (v112)
    {
      v71->_hasContainsBaby = 1;
      v71->_containsBaby = objc_msgSend(v112, "BOOLValue");
    }
    else
    {
      v71->_hasContainsBaby = 0;
      v71->_containsBaby = 0;
    }
    if (v111)
    {
      v71->_hasContainsSocialGroup = 1;
      v71->_containsSocialGroup = objc_msgSend(v111, "BOOLValue");
    }
    else
    {
      v71->_hasContainsSocialGroup = 0;
      v71->_containsSocialGroup = 0;
    }
    if (v110)
    {
      v71->_hasContainsMyPet = 1;
      v71->_containsMyPet = objc_msgSend(v110, "BOOLValue");
    }
    else
    {
      v71->_hasContainsMyPet = 0;
      v71->_containsMyPet = 0;
    }
    if (v109)
    {
      v71->_hasContainsCoWorker = 1;
      v71->_containsCoWorker = objc_msgSend(v109, "BOOLValue");
    }
    else
    {
      v71->_hasContainsCoWorker = 0;
      v71->_containsCoWorker = 0;
    }
    if (v108)
    {
      v71->_hasContainsFamily = 1;
      v71->_containsFamily = objc_msgSend(v108, "BOOLValue");
    }
    else
    {
      v71->_hasContainsFamily = 0;
      v71->_containsFamily = 0;
    }
    if (v107)
    {
      v71->_hasContainsFriends = 1;
      v71->_containsFriends = objc_msgSend(v107, "BOOLValue");
    }
    else
    {
      v71->_hasContainsFriends = 0;
      v71->_containsFriends = 0;
    }
    if (v106)
    {
      v71->_hasContainsPartner = 1;
      v71->_containsPartner = objc_msgSend(v106, "BOOLValue");
    }
    else
    {
      v71->_hasContainsPartner = 0;
      v71->_containsPartner = 0;
    }
    if (v105)
    {
      v71->_hasContainsParent = 1;
      v71->_containsParent = objc_msgSend(v105, "BOOLValue");
    }
    else
    {
      v71->_hasContainsParent = 0;
      v71->_containsParent = 0;
    }
    if (v104)
    {
      v71->_hasContainsSibling = 1;
      v71->_containsSibling = objc_msgSend(v104, "BOOLValue");
    }
    else
    {
      v71->_hasContainsSibling = 0;
      v71->_containsSibling = 0;
    }
    if (v103)
    {
      v71->_hasContainsChild = 1;
      v71->_containsChild = objc_msgSend(v103, "BOOLValue");
    }
    else
    {
      v71->_hasContainsChild = 0;
      v71->_containsChild = 0;
    }
    if (v102)
    {
      v71->_hasIsCoupon = 1;
      v71->_isCoupon = objc_msgSend(v102, "BOOLValue");
    }
    else
    {
      v71->_hasIsCoupon = 0;
      v71->_isCoupon = 0;
    }
    if (v101)
    {
      v71->_hasIsRecipe = 1;
      v71->_isRecipe = objc_msgSend(v101, "BOOLValue");
    }
    else
    {
      v71->_hasIsRecipe = 0;
      v71->_isRecipe = 0;
    }
    if (v100)
    {
      v71->_hasIsReceipt = 1;
      v71->_isReceipt = objc_msgSend(v100, "BOOLValue");
    }
    else
    {
      v71->_hasIsReceipt = 0;
      v71->_isReceipt = 0;
    }
    if (v99)
    {
      v71->_hasIsRecentView = 1;
      v71->_isRecentView = objc_msgSend(v99, "BOOLValue");
    }
    else
    {
      v71->_hasIsRecentView = 0;
      v71->_isRecentView = 0;
    }
    if (v98)
    {
      v71->_hasIsRecentEdit = 1;
      v71->_isRecentEdit = objc_msgSend(v98, "BOOLValue");
    }
    else
    {
      v71->_hasIsRecentEdit = 0;
      v71->_isRecentEdit = 0;
    }
    if (v97)
    {
      v71->_hasIsRecentShare = 1;
      v71->_isRecentShare = objc_msgSend(v97, "BOOLValue");
    }
    else
    {
      v71->_hasIsRecentShare = 0;
      v71->_isRecentShare = 0;
    }
    if (v96)
    {
      v71->_hasIsRecentFavorite = 1;
      v71->_isRecentFavorite = objc_msgSend(v96, "BOOLValue");
    }
    else
    {
      v71->_hasIsRecentFavorite = 0;
      v71->_isRecentFavorite = 0;
    }
    if (v95)
    {
      v71->_hasIsContainedInSharedAlbum = 1;
      v71->_isContainedInSharedAlbum = objc_msgSend(v95, "BOOLValue");
    }
    else
    {
      v71->_hasIsContainedInSharedAlbum = 0;
      v71->_isContainedInSharedAlbum = 0;
    }
    if (v94)
    {
      v71->_hasIsContainedInOnThisDay = 1;
      v71->_isContainedInOnThisDay = objc_msgSend(v94, "BOOLValue");
    }
    else
    {
      v71->_hasIsContainedInOnThisDay = 0;
      v71->_isContainedInOnThisDay = 0;
    }
    if (v93)
    {
      v71->_hasCapturedAtAOI = 1;
      v71->_capturedAtAOI = objc_msgSend(v93, "BOOLValue");
    }
    else
    {
      v71->_hasCapturedAtAOI = 0;
      v71->_capturedAtAOI = 0;
    }
    if (v92)
    {
      v71->_hasCapturedAtPOI = 1;
      v71->_capturedAtPOI = objc_msgSend(v92, "BOOLValue");
    }
    else
    {
      v71->_hasCapturedAtPOI = 0;
      v71->_capturedAtPOI = 0;
    }
    if (v91)
    {
      v71->_hasCapturedAtROI = 1;
      v71->_capturedAtROI = objc_msgSend(v91, "BOOLValue");
    }
    else
    {
      v71->_hasCapturedAtROI = 0;
      v71->_capturedAtROI = 0;
    }
    if (v90)
    {
      v71->_hasCapturedAtBusiness = 1;
      v71->_capturedAtBusiness = objc_msgSend(v90, "BOOLValue");
    }
    else
    {
      v71->_hasCapturedAtBusiness = 0;
      v71->_capturedAtBusiness = 0;
    }
    if (v89)
    {
      v71->_hasIsCapturedAtPublicEvent = 1;
      v71->_isCapturedAtPublicEvent = objc_msgSend(v89, "BOOLValue");
    }
    else
    {
      v71->_hasIsCapturedAtPublicEvent = 0;
      v71->_isCapturedAtPublicEvent = 0;
    }
    if (v88)
    {
      v71->_hasIsContainedInVisualTrend = 1;
      v71->_isContainedInVisualTrend = objc_msgSend(v88, "BOOLValue");
    }
    else
    {
      v71->_hasIsContainedInVisualTrend = 0;
      v71->_isContainedInVisualTrend = 0;
    }
    if (v87)
    {
      v71->_hasIsContainedInActivity = 1;
      v71->_isContainedInActivity = objc_msgSend(v87, "BOOLValue");
    }
    else
    {
      v71->_hasIsContainedInActivity = 0;
      v71->_isContainedInActivity = 0;
    }
    if (v86)
    {
      v71->_hasIsContainedInChildActivity = 1;
      v71->_isContainedInChildActivity = objc_msgSend(v86, "BOOLValue");
    }
    else
    {
      v71->_hasIsContainedInChildActivity = 0;
      v71->_isContainedInChildActivity = 0;
    }
    v71->_userLibraryAgeInDays = a57;
    if (v85)
    {
      v71->_hasUserisDAU = 1;
      objc_msgSend(v85, "floatValue");
      v77 = v76;
    }
    else
    {
      v71->_hasUserisDAU = 0;
      v77 = -1.0;
    }
    v71->_userisDAU = v77;
  }
  v78 = v71;

  return v78;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  id v20;
  id v21;
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

  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMPhotosUserAnalytics identifier](self, "identifier");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPhotosUserAnalytics userEvent](self, "userEvent");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsVIP](self, "containsVIP"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosUserAnalytics faceCount](self, "faceCount"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsPets](self, "containsPets"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedAtHome](self, "capturedAtHome"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedAtWork](self, "capturedAtWork"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedAtFrequentLocation](self, "capturedAtFrequentLocation"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedOnTrip](self, "capturedOnTrip"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedOnShortTrip](self, "capturedOnShortTrip"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isDocument](self, "isDocument"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isMeme](self, "isMeme"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isScreenshot](self, "isScreenshot"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isFavorite](self, "isFavorite"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isCapturedOnWeekend](self, "isCapturedOnWeekend"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isCapturedAtPrivateEvent](self, "isCapturedAtPrivateEvent"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isCapturedOnHoliday](self, "isCapturedOnHoliday"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  BMPhotosUserAnalyticsMediaTypeTypeAsString(-[BMPhotosUserAnalytics mediaType](self, "mediaType"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  BMPhotosUserAnalyticsImportSourceTypeAsString(-[BMPhotosUserAnalytics importSource](self, "importSource"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  BMPhotosUserAnalyticsAssetAgeTypeAsString(-[BMPhotosUserAnalytics assetAge](self, "assetAge"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  BMPhotosUserAnalyticsLibrarySizeTypeAsString(-[BMPhotosUserAnalytics userLibrarySize](self, "userLibrarySize"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosUserAnalytics userNumTrips](self, "userNumTrips"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosUserAnalytics userNumVIPPeople](self, "userNumVIPPeople"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosUserAnalytics userNumFavorites](self, "userNumFavorites"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics userHasVIP](self, "userHasVIP"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics userHasHome](self, "userHasHome"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics userHasPet](self, "userHasPet"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsBaby](self, "containsBaby"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsSocialGroup](self, "containsSocialGroup"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsMyPet](self, "containsMyPet"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsCoWorker](self, "containsCoWorker"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsFamily](self, "containsFamily"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsFriends](self, "containsFriends"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsPartner](self, "containsPartner"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsParent](self, "containsParent"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsSibling](self, "containsSibling"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsChild](self, "containsChild"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isCoupon](self, "isCoupon"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isRecipe](self, "isRecipe"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isReceipt](self, "isReceipt"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isRecentView](self, "isRecentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isRecentEdit](self, "isRecentEdit"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isRecentShare](self, "isRecentShare"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isRecentFavorite](self, "isRecentFavorite"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isContainedInSharedAlbum](self, "isContainedInSharedAlbum"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isContainedInOnThisDay](self, "isContainedInOnThisDay"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedAtAOI](self, "capturedAtAOI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedAtPOI](self, "capturedAtPOI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedAtROI](self, "capturedAtROI"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedAtBusiness](self, "capturedAtBusiness"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isCapturedAtPublicEvent](self, "isCapturedAtPublicEvent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isContainedInVisualTrend](self, "isContainedInVisualTrend"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isContainedInActivity](self, "isContainedInActivity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isContainedInChildActivity](self, "isContainedInChildActivity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMPhotosUserAnalyticsUserLibraryAgeInDaysTypeAsString(-[BMPhotosUserAnalytics userLibraryAgeInDays](self, "userLibraryAgeInDays"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMPhotosUserAnalytics userisDAU](self, "userisDAU");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "initWithFormat:", CFSTR("BMPhotosUserAnalytics with identifier: %@, userEvent: %@, containsVIP: %@, faceCount: %@, containsPets: %@, capturedAtHome: %@, capturedAtWork: %@, capturedAtFrequentLocation: %@, capturedOnTrip: %@, capturedOnShortTrip: %@, isDocument: %@, isMeme: %@, isScreenshot: %@, isFavorite: %@, isCapturedOnWeekend: %@, isCapturedAtPrivateEvent: %@, isCapturedOnHoliday: %@, mediaType: %@, importSource: %@, assetAge: %@, userLibrarySize: %@, userNumTrips: %@, userNumVIPPeople: %@, userNumFavorites: %@, userHasVIP: %@, userHasHome: %@, userHasPet: %@, containsBaby: %@, containsSocialGroup: %@, containsMyPet: %@, containsCoWorker: %@, containsFamily: %@, containsFriends: %@, containsPartner: %@, containsParent: %@, containsSibling: %@, containsChild: %@, isCoupon: %@, isRecipe: %@, isReceipt: %@, isRecentView: %@, isRecentEdit: %@, isRecentShare: %@, isRecentFavorite: %@, isContainedInSharedAlbum: %@, isContainedInOnThisDay: %@, capturedAtAOI: %@, capturedAtPOI: %@, capturedAtROI: %@, capturedAtBusiness: %@, isCapturedAtPublicEvent: %@, isContainedInVisualTrend: %@, isContainedInActivity: %@, isContainedInChildActivity: %@, userLibraryAgeInDays: %@, userisDAU: %@"), v60, v59, v62, v61, v57, v56, v58, v54, v53, v55, v51, v50, v52, v48, v47, v49,
              v45,
              v44,
              v46,
              v43,
              v42,
              v41,
              v40,
              v39,
              v38,
              v37,
              v36,
              v35,
              v34,
              v33,
              v32,
              v31,
              v30,
              v29,
              v28,
              v27,
              v26,
              v25,
              v24,
              v23,
              v22,
              v19,
              v18,
              v17,
              v16,
              v15,
              v14,
              v13,
              v12,
              v11,
              v10,
              v9,
              v8,
              v3,
              v4,
              v6);

  return (NSString *)v21;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPhotosUserAnalytics *v5;
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
  uint64_t v21;
  void *v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  char v79;
  unsigned int v80;
  uint64_t v81;
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
  uint64_t v132;
  unint64_t v133;
  char v134;
  char v135;
  unsigned int v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  char v140;
  char v141;
  unsigned int v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  char v146;
  char v147;
  unsigned int v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  char v152;
  char v153;
  unsigned int v154;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  char v158;
  char v159;
  unsigned int v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v163;
  char v164;
  char v165;
  unsigned int v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  char v170;
  char v171;
  unsigned int v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  char v177;
  char v178;
  unsigned int v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183;
  char v184;
  char v185;
  unsigned int v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  unint64_t v190;
  char v191;
  char v192;
  unsigned int v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  unint64_t v197;
  char v198;
  char v199;
  unsigned int v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  unint64_t v204;
  char v205;
  char v206;
  unsigned int v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  unint64_t v211;
  char v212;
  char v213;
  unsigned int v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  unint64_t v218;
  char v219;
  char v220;
  unsigned int v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  unint64_t v225;
  char v226;
  char v227;
  unsigned int v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  unint64_t v232;
  char v233;
  char v234;
  unsigned int v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  unint64_t v239;
  char v240;
  char v241;
  unsigned int v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  unint64_t v246;
  char v247;
  char v248;
  unsigned int v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  unint64_t v253;
  char v254;
  char v255;
  unsigned int v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  unint64_t v260;
  char v261;
  char v262;
  unsigned int v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  unint64_t v267;
  char v268;
  char v269;
  unsigned int v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  unint64_t v274;
  char v275;
  char v276;
  unsigned int v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  unint64_t v281;
  char v282;
  char v283;
  unsigned int v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  unint64_t v288;
  char v289;
  char v290;
  unsigned int v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  unint64_t v295;
  char v296;
  char v297;
  unsigned int v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  unint64_t v302;
  char v303;
  char v304;
  unsigned int v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  unint64_t v309;
  char v310;
  char v311;
  unsigned int v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  unint64_t v316;
  char v317;
  char v318;
  unsigned int v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  unint64_t v323;
  char v324;
  char v325;
  unsigned int v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  unint64_t v330;
  char v331;
  char v332;
  unsigned int v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  unint64_t v337;
  char v338;
  char v339;
  unsigned int v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  unint64_t v344;
  char v345;
  char v346;
  unsigned int v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  unint64_t v351;
  char v352;
  char v353;
  unsigned int v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  unint64_t v358;
  char v359;
  char v360;
  unsigned int v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  unint64_t v365;
  char v366;
  char v367;
  unsigned int v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  unint64_t v372;
  char v373;
  char v374;
  unsigned int v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  unint64_t v379;
  char v380;
  char v381;
  unsigned int v382;
  uint64_t v383;
  uint64_t v384;
  unint64_t v385;
  char v386;
  uint64_t v387;
  unint64_t v388;
  float v389;
  BOOL v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  BMPhotosUserAnalytics *v394;
  objc_super v396;

  v4 = a3;
  v396.receiver = self;
  v396.super_class = (Class)BMPhotosUserAnalytics;
  v5 = -[BMEventBase init](&v396, sel_init);
  if (!v5)
    goto LABEL_630;
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
          v21 = 152;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 160;
LABEL_24:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 3u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v5->_hasContainsVIP = 1;
          while (2)
          {
            v26 = *v6;
            v27 = *(_QWORD *)&v4[v26];
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v27);
              *(_QWORD *)&v4[v26] = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                v17 = v24++ >= 9;
                if (v17)
                {
                  v25 = 0;
                  goto LABEL_402;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v25 = 0;
LABEL_402:
          v390 = v25 != 0;
          v391 = 16;
          goto LABEL_616;
        case 4u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v5->_hasFaceCount = 1;
          while (2)
          {
            v33 = *v6;
            v34 = *(_QWORD *)&v4[v33];
            v35 = v34 + 1;
            if (v34 == -1 || v35 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v34);
              *(_QWORD *)&v4[v33] = v35;
              v32 |= (unint64_t)(v36 & 0x7F) << v30;
              if (v36 < 0)
              {
                v30 += 7;
                v17 = v31++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_406;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v32) = 0;
LABEL_406:
          v392 = 116;
          goto LABEL_495;
        case 5u:
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v5->_hasContainsPets = 1;
          while (2)
          {
            v40 = *v6;
            v41 = *(_QWORD *)&v4[v40];
            v42 = v41 + 1;
            if (v41 == -1 || v42 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v41);
              *(_QWORD *)&v4[v40] = v42;
              v39 |= (unint64_t)(v43 & 0x7F) << v37;
              if (v43 < 0)
              {
                v37 += 7;
                v17 = v38++ >= 9;
                if (v17)
                {
                  v39 = 0;
                  goto LABEL_410;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v39 = 0;
LABEL_410:
          v390 = v39 != 0;
          v391 = 19;
          goto LABEL_616;
        case 6u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          v5->_hasCapturedAtHome = 1;
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
                  v46 = 0;
                  goto LABEL_414;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v46 = 0;
LABEL_414:
          v390 = v46 != 0;
          v391 = 21;
          goto LABEL_616;
        case 7u:
          v51 = 0;
          v52 = 0;
          v53 = 0;
          v5->_hasCapturedAtWork = 1;
          while (2)
          {
            v54 = *v6;
            v55 = *(_QWORD *)&v4[v54];
            v56 = v55 + 1;
            if (v55 == -1 || v56 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v57 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v55);
              *(_QWORD *)&v4[v54] = v56;
              v53 |= (unint64_t)(v57 & 0x7F) << v51;
              if (v57 < 0)
              {
                v51 += 7;
                v17 = v52++ >= 9;
                if (v17)
                {
                  v53 = 0;
                  goto LABEL_418;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v53 = 0;
LABEL_418:
          v390 = v53 != 0;
          v391 = 23;
          goto LABEL_616;
        case 8u:
          v58 = 0;
          v59 = 0;
          v60 = 0;
          v5->_hasCapturedAtFrequentLocation = 1;
          while (2)
          {
            v61 = *v6;
            v62 = *(_QWORD *)&v4[v61];
            v63 = v62 + 1;
            if (v62 == -1 || v63 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v64 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v62);
              *(_QWORD *)&v4[v61] = v63;
              v60 |= (unint64_t)(v64 & 0x7F) << v58;
              if (v64 < 0)
              {
                v58 += 7;
                v17 = v59++ >= 9;
                if (v17)
                {
                  v60 = 0;
                  goto LABEL_422;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v60 = 0;
LABEL_422:
          v390 = v60 != 0;
          v391 = 25;
          goto LABEL_616;
        case 9u:
          v65 = 0;
          v66 = 0;
          v67 = 0;
          v5->_hasCapturedOnTrip = 1;
          while (2)
          {
            v68 = *v6;
            v69 = *(_QWORD *)&v4[v68];
            v70 = v69 + 1;
            if (v69 == -1 || v70 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v71 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v69);
              *(_QWORD *)&v4[v68] = v70;
              v67 |= (unint64_t)(v71 & 0x7F) << v65;
              if (v71 < 0)
              {
                v65 += 7;
                v17 = v66++ >= 9;
                if (v17)
                {
                  v67 = 0;
                  goto LABEL_426;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v67 = 0;
LABEL_426:
          v390 = v67 != 0;
          v391 = 27;
          goto LABEL_616;
        case 0xAu:
          v72 = 0;
          v73 = 0;
          v74 = 0;
          v5->_hasCapturedOnShortTrip = 1;
          while (2)
          {
            v75 = *v6;
            v76 = *(_QWORD *)&v4[v75];
            v77 = v76 + 1;
            if (v76 == -1 || v77 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v78 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v76);
              *(_QWORD *)&v4[v75] = v77;
              v74 |= (unint64_t)(v78 & 0x7F) << v72;
              if (v78 < 0)
              {
                v72 += 7;
                v17 = v73++ >= 9;
                if (v17)
                {
                  v74 = 0;
                  goto LABEL_430;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v74 = 0;
LABEL_430:
          v390 = v74 != 0;
          v391 = 29;
          goto LABEL_616;
        case 0xBu:
          v79 = 0;
          v80 = 0;
          v81 = 0;
          v5->_hasIsDocument = 1;
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
              v81 |= (unint64_t)(v85 & 0x7F) << v79;
              if (v85 < 0)
              {
                v79 += 7;
                v17 = v80++ >= 9;
                if (v17)
                {
                  v81 = 0;
                  goto LABEL_434;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v81 = 0;
LABEL_434:
          v390 = v81 != 0;
          v391 = 31;
          goto LABEL_616;
        case 0xCu:
          v86 = 0;
          v87 = 0;
          v88 = 0;
          v5->_hasIsMeme = 1;
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
                  goto LABEL_438;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v88 = 0;
LABEL_438:
          v390 = v88 != 0;
          v391 = 33;
          goto LABEL_616;
        case 0xDu:
          v93 = 0;
          v94 = 0;
          v95 = 0;
          v5->_hasIsScreenshot = 1;
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
                  goto LABEL_442;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v95 = 0;
LABEL_442:
          v390 = v95 != 0;
          v391 = 35;
          goto LABEL_616;
        case 0xEu:
          v100 = 0;
          v101 = 0;
          v102 = 0;
          v5->_hasIsFavorite = 1;
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
                  goto LABEL_446;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v102 = 0;
LABEL_446:
          v390 = v102 != 0;
          v391 = 37;
          goto LABEL_616;
        case 0xFu:
          v107 = 0;
          v108 = 0;
          v109 = 0;
          v5->_hasIsCapturedOnWeekend = 1;
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
                  goto LABEL_450;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v109 = 0;
LABEL_450:
          v390 = v109 != 0;
          v391 = 39;
          goto LABEL_616;
        case 0x10u:
          v114 = 0;
          v115 = 0;
          v116 = 0;
          v5->_hasIsCapturedAtPrivateEvent = 1;
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
                  goto LABEL_454;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v116 = 0;
LABEL_454:
          v390 = v116 != 0;
          v391 = 41;
          goto LABEL_616;
        case 0x11u:
          v121 = 0;
          v122 = 0;
          v123 = 0;
          v5->_hasIsCapturedOnHoliday = 1;
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
                  goto LABEL_458;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v123 = 0;
LABEL_458:
          v390 = v123 != 0;
          v391 = 43;
          goto LABEL_616;
        case 0x12u:
          v128 = 0;
          v129 = 0;
          v130 = 0;
          while (2)
          {
            v131 = *v6;
            v132 = *(_QWORD *)&v4[v131];
            v133 = v132 + 1;
            if (v132 == -1 || v133 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v134 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v132);
              *(_QWORD *)&v4[v131] = v133;
              v130 |= (unint64_t)(v134 & 0x7F) << v128;
              if (v134 < 0)
              {
                v128 += 7;
                v17 = v129++ >= 9;
                if (v17)
                {
                  LODWORD(v130) = 0;
                  goto LABEL_462;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v130) = 0;
LABEL_462:
          if (v130 >= 0xD)
            LODWORD(v130) = 0;
          v393 = 120;
          goto LABEL_625;
        case 0x13u:
          v135 = 0;
          v136 = 0;
          v130 = 0;
          while (2)
          {
            v137 = *v6;
            v138 = *(_QWORD *)&v4[v137];
            v139 = v138 + 1;
            if (v138 == -1 || v139 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v140 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v138);
              *(_QWORD *)&v4[v137] = v139;
              v130 |= (unint64_t)(v140 & 0x7F) << v135;
              if (v140 < 0)
              {
                v135 += 7;
                v17 = v136++ >= 9;
                if (v17)
                {
                  LODWORD(v130) = 0;
                  goto LABEL_468;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v130) = 0;
LABEL_468:
          if (v130 >= 0xD)
            LODWORD(v130) = 0;
          v393 = 124;
          goto LABEL_625;
        case 0x14u:
          v141 = 0;
          v142 = 0;
          v130 = 0;
          while (2)
          {
            v143 = *v6;
            v144 = *(_QWORD *)&v4[v143];
            v145 = v144 + 1;
            if (v144 == -1 || v145 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v146 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v144);
              *(_QWORD *)&v4[v143] = v145;
              v130 |= (unint64_t)(v146 & 0x7F) << v141;
              if (v146 < 0)
              {
                v141 += 7;
                v17 = v142++ >= 9;
                if (v17)
                {
                  LODWORD(v130) = 0;
                  goto LABEL_474;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v130) = 0;
LABEL_474:
          if (v130 >= 7)
            LODWORD(v130) = 0;
          v393 = 128;
          goto LABEL_625;
        case 0x15u:
          v147 = 0;
          v148 = 0;
          v130 = 0;
          while (2)
          {
            v149 = *v6;
            v150 = *(_QWORD *)&v4[v149];
            v151 = v150 + 1;
            if (v150 == -1 || v151 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v152 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v150);
              *(_QWORD *)&v4[v149] = v151;
              v130 |= (unint64_t)(v152 & 0x7F) << v147;
              if (v152 < 0)
              {
                v147 += 7;
                v17 = v148++ >= 9;
                if (v17)
                {
                  LODWORD(v130) = 0;
                  goto LABEL_480;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v130) = 0;
LABEL_480:
          if (v130 >= 6)
            LODWORD(v130) = 0;
          v393 = 132;
          goto LABEL_625;
        case 0x16u:
          v153 = 0;
          v154 = 0;
          v32 = 0;
          v5->_hasUserNumTrips = 1;
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
              v158 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v156);
              *(_QWORD *)&v4[v155] = v157;
              v32 |= (unint64_t)(v158 & 0x7F) << v153;
              if (v158 < 0)
              {
                v153 += 7;
                v17 = v154++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_486;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v32) = 0;
LABEL_486:
          v392 = 136;
          goto LABEL_495;
        case 0x17u:
          v159 = 0;
          v160 = 0;
          v32 = 0;
          v5->_hasUserNumVIPPeople = 1;
          while (2)
          {
            v161 = *v6;
            v162 = *(_QWORD *)&v4[v161];
            v163 = v162 + 1;
            if (v162 == -1 || v163 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v164 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v162);
              *(_QWORD *)&v4[v161] = v163;
              v32 |= (unint64_t)(v164 & 0x7F) << v159;
              if (v164 < 0)
              {
                v159 += 7;
                v17 = v160++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_490;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v32) = 0;
LABEL_490:
          v392 = 140;
          goto LABEL_495;
        case 0x18u:
          v165 = 0;
          v166 = 0;
          v32 = 0;
          v5->_hasUserNumFavorites = 1;
          while (2)
          {
            v167 = *v6;
            v168 = *(_QWORD *)&v4[v167];
            v169 = v168 + 1;
            if (v168 == -1 || v169 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v170 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v168);
              *(_QWORD *)&v4[v167] = v169;
              v32 |= (unint64_t)(v170 & 0x7F) << v165;
              if (v170 < 0)
              {
                v165 += 7;
                v17 = v166++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_494;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v32) = 0;
LABEL_494:
          v392 = 144;
LABEL_495:
          *(_DWORD *)((char *)&v5->super.super.isa + v392) = v32;
          continue;
        case 0x19u:
          v171 = 0;
          v172 = 0;
          v173 = 0;
          v5->_hasUserHasVIP = 1;
          while (2)
          {
            v174 = *v6;
            v175 = *(_QWORD *)&v4[v174];
            v176 = v175 + 1;
            if (v175 == -1 || v176 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v177 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v175);
              *(_QWORD *)&v4[v174] = v176;
              v173 |= (unint64_t)(v177 & 0x7F) << v171;
              if (v177 < 0)
              {
                v171 += 7;
                v17 = v172++ >= 9;
                if (v17)
                {
                  v173 = 0;
                  goto LABEL_499;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v173 = 0;
LABEL_499:
          v390 = v173 != 0;
          v391 = 48;
          goto LABEL_616;
        case 0x1Au:
          v178 = 0;
          v179 = 0;
          v180 = 0;
          v5->_hasUserHasHome = 1;
          while (2)
          {
            v181 = *v6;
            v182 = *(_QWORD *)&v4[v181];
            v183 = v182 + 1;
            if (v182 == -1 || v183 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v184 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v182);
              *(_QWORD *)&v4[v181] = v183;
              v180 |= (unint64_t)(v184 & 0x7F) << v178;
              if (v184 < 0)
              {
                v178 += 7;
                v17 = v179++ >= 9;
                if (v17)
                {
                  v180 = 0;
                  goto LABEL_503;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v180 = 0;
LABEL_503:
          v390 = v180 != 0;
          v391 = 50;
          goto LABEL_616;
        case 0x1Bu:
          v185 = 0;
          v186 = 0;
          v187 = 0;
          v5->_hasUserHasPet = 1;
          while (2)
          {
            v188 = *v6;
            v189 = *(_QWORD *)&v4[v188];
            v190 = v189 + 1;
            if (v189 == -1 || v190 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v191 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v189);
              *(_QWORD *)&v4[v188] = v190;
              v187 |= (unint64_t)(v191 & 0x7F) << v185;
              if (v191 < 0)
              {
                v185 += 7;
                v17 = v186++ >= 9;
                if (v17)
                {
                  v187 = 0;
                  goto LABEL_507;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v187 = 0;
LABEL_507:
          v390 = v187 != 0;
          v391 = 52;
          goto LABEL_616;
        case 0x1Cu:
          v192 = 0;
          v193 = 0;
          v194 = 0;
          v5->_hasContainsBaby = 1;
          while (2)
          {
            v195 = *v6;
            v196 = *(_QWORD *)&v4[v195];
            v197 = v196 + 1;
            if (v196 == -1 || v197 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v198 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v196);
              *(_QWORD *)&v4[v195] = v197;
              v194 |= (unint64_t)(v198 & 0x7F) << v192;
              if (v198 < 0)
              {
                v192 += 7;
                v17 = v193++ >= 9;
                if (v17)
                {
                  v194 = 0;
                  goto LABEL_511;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v194 = 0;
LABEL_511:
          v390 = v194 != 0;
          v391 = 54;
          goto LABEL_616;
        case 0x1Du:
          v199 = 0;
          v200 = 0;
          v201 = 0;
          v5->_hasContainsSocialGroup = 1;
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
              v201 |= (unint64_t)(v205 & 0x7F) << v199;
              if (v205 < 0)
              {
                v199 += 7;
                v17 = v200++ >= 9;
                if (v17)
                {
                  v201 = 0;
                  goto LABEL_515;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v201 = 0;
LABEL_515:
          v390 = v201 != 0;
          v391 = 56;
          goto LABEL_616;
        case 0x1Eu:
          v206 = 0;
          v207 = 0;
          v208 = 0;
          v5->_hasContainsMyPet = 1;
          while (2)
          {
            v209 = *v6;
            v210 = *(_QWORD *)&v4[v209];
            v211 = v210 + 1;
            if (v210 == -1 || v211 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v212 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v210);
              *(_QWORD *)&v4[v209] = v211;
              v208 |= (unint64_t)(v212 & 0x7F) << v206;
              if (v212 < 0)
              {
                v206 += 7;
                v17 = v207++ >= 9;
                if (v17)
                {
                  v208 = 0;
                  goto LABEL_519;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v208 = 0;
LABEL_519:
          v390 = v208 != 0;
          v391 = 58;
          goto LABEL_616;
        case 0x1Fu:
          v213 = 0;
          v214 = 0;
          v215 = 0;
          v5->_hasContainsCoWorker = 1;
          while (2)
          {
            v216 = *v6;
            v217 = *(_QWORD *)&v4[v216];
            v218 = v217 + 1;
            if (v217 == -1 || v218 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v219 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v217);
              *(_QWORD *)&v4[v216] = v218;
              v215 |= (unint64_t)(v219 & 0x7F) << v213;
              if (v219 < 0)
              {
                v213 += 7;
                v17 = v214++ >= 9;
                if (v17)
                {
                  v215 = 0;
                  goto LABEL_523;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v215 = 0;
LABEL_523:
          v390 = v215 != 0;
          v391 = 60;
          goto LABEL_616;
        case 0x20u:
          v220 = 0;
          v221 = 0;
          v222 = 0;
          v5->_hasContainsFamily = 1;
          while (2)
          {
            v223 = *v6;
            v224 = *(_QWORD *)&v4[v223];
            v225 = v224 + 1;
            if (v224 == -1 || v225 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v226 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v224);
              *(_QWORD *)&v4[v223] = v225;
              v222 |= (unint64_t)(v226 & 0x7F) << v220;
              if (v226 < 0)
              {
                v220 += 7;
                v17 = v221++ >= 9;
                if (v17)
                {
                  v222 = 0;
                  goto LABEL_527;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v222 = 0;
LABEL_527:
          v390 = v222 != 0;
          v391 = 62;
          goto LABEL_616;
        case 0x21u:
          v227 = 0;
          v228 = 0;
          v229 = 0;
          v5->_hasContainsFriends = 1;
          while (2)
          {
            v230 = *v6;
            v231 = *(_QWORD *)&v4[v230];
            v232 = v231 + 1;
            if (v231 == -1 || v232 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v233 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v231);
              *(_QWORD *)&v4[v230] = v232;
              v229 |= (unint64_t)(v233 & 0x7F) << v227;
              if (v233 < 0)
              {
                v227 += 7;
                v17 = v228++ >= 9;
                if (v17)
                {
                  v229 = 0;
                  goto LABEL_531;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v229 = 0;
LABEL_531:
          v390 = v229 != 0;
          v391 = 64;
          goto LABEL_616;
        case 0x22u:
          v234 = 0;
          v235 = 0;
          v236 = 0;
          v5->_hasContainsPartner = 1;
          while (2)
          {
            v237 = *v6;
            v238 = *(_QWORD *)&v4[v237];
            v239 = v238 + 1;
            if (v238 == -1 || v239 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v240 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v238);
              *(_QWORD *)&v4[v237] = v239;
              v236 |= (unint64_t)(v240 & 0x7F) << v234;
              if (v240 < 0)
              {
                v234 += 7;
                v17 = v235++ >= 9;
                if (v17)
                {
                  v236 = 0;
                  goto LABEL_535;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v236 = 0;
LABEL_535:
          v390 = v236 != 0;
          v391 = 66;
          goto LABEL_616;
        case 0x23u:
          v241 = 0;
          v242 = 0;
          v243 = 0;
          v5->_hasContainsParent = 1;
          while (2)
          {
            v244 = *v6;
            v245 = *(_QWORD *)&v4[v244];
            v246 = v245 + 1;
            if (v245 == -1 || v246 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v247 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v245);
              *(_QWORD *)&v4[v244] = v246;
              v243 |= (unint64_t)(v247 & 0x7F) << v241;
              if (v247 < 0)
              {
                v241 += 7;
                v17 = v242++ >= 9;
                if (v17)
                {
                  v243 = 0;
                  goto LABEL_539;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v243 = 0;
LABEL_539:
          v390 = v243 != 0;
          v391 = 68;
          goto LABEL_616;
        case 0x24u:
          v248 = 0;
          v249 = 0;
          v250 = 0;
          v5->_hasContainsSibling = 1;
          while (2)
          {
            v251 = *v6;
            v252 = *(_QWORD *)&v4[v251];
            v253 = v252 + 1;
            if (v252 == -1 || v253 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v254 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v252);
              *(_QWORD *)&v4[v251] = v253;
              v250 |= (unint64_t)(v254 & 0x7F) << v248;
              if (v254 < 0)
              {
                v248 += 7;
                v17 = v249++ >= 9;
                if (v17)
                {
                  v250 = 0;
                  goto LABEL_543;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v250 = 0;
LABEL_543:
          v390 = v250 != 0;
          v391 = 70;
          goto LABEL_616;
        case 0x25u:
          v255 = 0;
          v256 = 0;
          v257 = 0;
          v5->_hasContainsChild = 1;
          while (2)
          {
            v258 = *v6;
            v259 = *(_QWORD *)&v4[v258];
            v260 = v259 + 1;
            if (v259 == -1 || v260 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v261 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v259);
              *(_QWORD *)&v4[v258] = v260;
              v257 |= (unint64_t)(v261 & 0x7F) << v255;
              if (v261 < 0)
              {
                v255 += 7;
                v17 = v256++ >= 9;
                if (v17)
                {
                  v257 = 0;
                  goto LABEL_547;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v257 = 0;
LABEL_547:
          v390 = v257 != 0;
          v391 = 72;
          goto LABEL_616;
        case 0x26u:
          v262 = 0;
          v263 = 0;
          v264 = 0;
          v5->_hasIsCoupon = 1;
          while (2)
          {
            v265 = *v6;
            v266 = *(_QWORD *)&v4[v265];
            v267 = v266 + 1;
            if (v266 == -1 || v267 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v268 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v266);
              *(_QWORD *)&v4[v265] = v267;
              v264 |= (unint64_t)(v268 & 0x7F) << v262;
              if (v268 < 0)
              {
                v262 += 7;
                v17 = v263++ >= 9;
                if (v17)
                {
                  v264 = 0;
                  goto LABEL_551;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v264 = 0;
LABEL_551:
          v390 = v264 != 0;
          v391 = 74;
          goto LABEL_616;
        case 0x27u:
          v269 = 0;
          v270 = 0;
          v271 = 0;
          v5->_hasIsRecipe = 1;
          while (2)
          {
            v272 = *v6;
            v273 = *(_QWORD *)&v4[v272];
            v274 = v273 + 1;
            if (v273 == -1 || v274 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v275 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v273);
              *(_QWORD *)&v4[v272] = v274;
              v271 |= (unint64_t)(v275 & 0x7F) << v269;
              if (v275 < 0)
              {
                v269 += 7;
                v17 = v270++ >= 9;
                if (v17)
                {
                  v271 = 0;
                  goto LABEL_555;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v271 = 0;
LABEL_555:
          v390 = v271 != 0;
          v391 = 76;
          goto LABEL_616;
        case 0x28u:
          v276 = 0;
          v277 = 0;
          v278 = 0;
          v5->_hasIsReceipt = 1;
          while (2)
          {
            v279 = *v6;
            v280 = *(_QWORD *)&v4[v279];
            v281 = v280 + 1;
            if (v280 == -1 || v281 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v282 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v280);
              *(_QWORD *)&v4[v279] = v281;
              v278 |= (unint64_t)(v282 & 0x7F) << v276;
              if (v282 < 0)
              {
                v276 += 7;
                v17 = v277++ >= 9;
                if (v17)
                {
                  v278 = 0;
                  goto LABEL_559;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v278 = 0;
LABEL_559:
          v390 = v278 != 0;
          v391 = 78;
          goto LABEL_616;
        case 0x29u:
          v283 = 0;
          v284 = 0;
          v285 = 0;
          v5->_hasIsRecentView = 1;
          while (2)
          {
            v286 = *v6;
            v287 = *(_QWORD *)&v4[v286];
            v288 = v287 + 1;
            if (v287 == -1 || v288 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v289 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v287);
              *(_QWORD *)&v4[v286] = v288;
              v285 |= (unint64_t)(v289 & 0x7F) << v283;
              if (v289 < 0)
              {
                v283 += 7;
                v17 = v284++ >= 9;
                if (v17)
                {
                  v285 = 0;
                  goto LABEL_563;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v285 = 0;
LABEL_563:
          v390 = v285 != 0;
          v391 = 80;
          goto LABEL_616;
        case 0x2Au:
          v290 = 0;
          v291 = 0;
          v292 = 0;
          v5->_hasIsRecentEdit = 1;
          while (2)
          {
            v293 = *v6;
            v294 = *(_QWORD *)&v4[v293];
            v295 = v294 + 1;
            if (v294 == -1 || v295 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v296 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v294);
              *(_QWORD *)&v4[v293] = v295;
              v292 |= (unint64_t)(v296 & 0x7F) << v290;
              if (v296 < 0)
              {
                v290 += 7;
                v17 = v291++ >= 9;
                if (v17)
                {
                  v292 = 0;
                  goto LABEL_567;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v292 = 0;
LABEL_567:
          v390 = v292 != 0;
          v391 = 82;
          goto LABEL_616;
        case 0x2Bu:
          v297 = 0;
          v298 = 0;
          v299 = 0;
          v5->_hasIsRecentShare = 1;
          while (2)
          {
            v300 = *v6;
            v301 = *(_QWORD *)&v4[v300];
            v302 = v301 + 1;
            if (v301 == -1 || v302 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v303 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v301);
              *(_QWORD *)&v4[v300] = v302;
              v299 |= (unint64_t)(v303 & 0x7F) << v297;
              if (v303 < 0)
              {
                v297 += 7;
                v17 = v298++ >= 9;
                if (v17)
                {
                  v299 = 0;
                  goto LABEL_571;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v299 = 0;
LABEL_571:
          v390 = v299 != 0;
          v391 = 84;
          goto LABEL_616;
        case 0x2Cu:
          v304 = 0;
          v305 = 0;
          v306 = 0;
          v5->_hasIsRecentFavorite = 1;
          while (2)
          {
            v307 = *v6;
            v308 = *(_QWORD *)&v4[v307];
            v309 = v308 + 1;
            if (v308 == -1 || v309 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v310 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v308);
              *(_QWORD *)&v4[v307] = v309;
              v306 |= (unint64_t)(v310 & 0x7F) << v304;
              if (v310 < 0)
              {
                v304 += 7;
                v17 = v305++ >= 9;
                if (v17)
                {
                  v306 = 0;
                  goto LABEL_575;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v306 = 0;
LABEL_575:
          v390 = v306 != 0;
          v391 = 86;
          goto LABEL_616;
        case 0x2Du:
          v311 = 0;
          v312 = 0;
          v313 = 0;
          v5->_hasIsContainedInSharedAlbum = 1;
          while (2)
          {
            v314 = *v6;
            v315 = *(_QWORD *)&v4[v314];
            v316 = v315 + 1;
            if (v315 == -1 || v316 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v317 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v315);
              *(_QWORD *)&v4[v314] = v316;
              v313 |= (unint64_t)(v317 & 0x7F) << v311;
              if (v317 < 0)
              {
                v311 += 7;
                v17 = v312++ >= 9;
                if (v17)
                {
                  v313 = 0;
                  goto LABEL_579;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v313 = 0;
LABEL_579:
          v390 = v313 != 0;
          v391 = 88;
          goto LABEL_616;
        case 0x2Eu:
          v318 = 0;
          v319 = 0;
          v320 = 0;
          v5->_hasIsContainedInOnThisDay = 1;
          while (2)
          {
            v321 = *v6;
            v322 = *(_QWORD *)&v4[v321];
            v323 = v322 + 1;
            if (v322 == -1 || v323 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v324 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v322);
              *(_QWORD *)&v4[v321] = v323;
              v320 |= (unint64_t)(v324 & 0x7F) << v318;
              if (v324 < 0)
              {
                v318 += 7;
                v17 = v319++ >= 9;
                if (v17)
                {
                  v320 = 0;
                  goto LABEL_583;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v320 = 0;
LABEL_583:
          v390 = v320 != 0;
          v391 = 90;
          goto LABEL_616;
        case 0x2Fu:
          v325 = 0;
          v326 = 0;
          v327 = 0;
          v5->_hasCapturedAtAOI = 1;
          while (2)
          {
            v328 = *v6;
            v329 = *(_QWORD *)&v4[v328];
            v330 = v329 + 1;
            if (v329 == -1 || v330 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v331 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v329);
              *(_QWORD *)&v4[v328] = v330;
              v327 |= (unint64_t)(v331 & 0x7F) << v325;
              if (v331 < 0)
              {
                v325 += 7;
                v17 = v326++ >= 9;
                if (v17)
                {
                  v327 = 0;
                  goto LABEL_587;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v327 = 0;
LABEL_587:
          v390 = v327 != 0;
          v391 = 92;
          goto LABEL_616;
        case 0x30u:
          v332 = 0;
          v333 = 0;
          v334 = 0;
          v5->_hasCapturedAtPOI = 1;
          while (2)
          {
            v335 = *v6;
            v336 = *(_QWORD *)&v4[v335];
            v337 = v336 + 1;
            if (v336 == -1 || v337 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v338 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v336);
              *(_QWORD *)&v4[v335] = v337;
              v334 |= (unint64_t)(v338 & 0x7F) << v332;
              if (v338 < 0)
              {
                v332 += 7;
                v17 = v333++ >= 9;
                if (v17)
                {
                  v334 = 0;
                  goto LABEL_591;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v334 = 0;
LABEL_591:
          v390 = v334 != 0;
          v391 = 94;
          goto LABEL_616;
        case 0x31u:
          v339 = 0;
          v340 = 0;
          v341 = 0;
          v5->_hasCapturedAtROI = 1;
          while (2)
          {
            v342 = *v6;
            v343 = *(_QWORD *)&v4[v342];
            v344 = v343 + 1;
            if (v343 == -1 || v344 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v345 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v343);
              *(_QWORD *)&v4[v342] = v344;
              v341 |= (unint64_t)(v345 & 0x7F) << v339;
              if (v345 < 0)
              {
                v339 += 7;
                v17 = v340++ >= 9;
                if (v17)
                {
                  v341 = 0;
                  goto LABEL_595;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v341 = 0;
LABEL_595:
          v390 = v341 != 0;
          v391 = 96;
          goto LABEL_616;
        case 0x32u:
          v346 = 0;
          v347 = 0;
          v348 = 0;
          v5->_hasCapturedAtBusiness = 1;
          while (2)
          {
            v349 = *v6;
            v350 = *(_QWORD *)&v4[v349];
            v351 = v350 + 1;
            if (v350 == -1 || v351 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v352 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v350);
              *(_QWORD *)&v4[v349] = v351;
              v348 |= (unint64_t)(v352 & 0x7F) << v346;
              if (v352 < 0)
              {
                v346 += 7;
                v17 = v347++ >= 9;
                if (v17)
                {
                  v348 = 0;
                  goto LABEL_599;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v348 = 0;
LABEL_599:
          v390 = v348 != 0;
          v391 = 98;
          goto LABEL_616;
        case 0x33u:
          v353 = 0;
          v354 = 0;
          v355 = 0;
          v5->_hasIsCapturedAtPublicEvent = 1;
          while (2)
          {
            v356 = *v6;
            v357 = *(_QWORD *)&v4[v356];
            v358 = v357 + 1;
            if (v357 == -1 || v358 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v359 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v357);
              *(_QWORD *)&v4[v356] = v358;
              v355 |= (unint64_t)(v359 & 0x7F) << v353;
              if (v359 < 0)
              {
                v353 += 7;
                v17 = v354++ >= 9;
                if (v17)
                {
                  v355 = 0;
                  goto LABEL_603;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v355 = 0;
LABEL_603:
          v390 = v355 != 0;
          v391 = 100;
          goto LABEL_616;
        case 0x34u:
          v360 = 0;
          v361 = 0;
          v362 = 0;
          v5->_hasIsContainedInVisualTrend = 1;
          while (2)
          {
            v363 = *v6;
            v364 = *(_QWORD *)&v4[v363];
            v365 = v364 + 1;
            if (v364 == -1 || v365 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v366 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v364);
              *(_QWORD *)&v4[v363] = v365;
              v362 |= (unint64_t)(v366 & 0x7F) << v360;
              if (v366 < 0)
              {
                v360 += 7;
                v17 = v361++ >= 9;
                if (v17)
                {
                  v362 = 0;
                  goto LABEL_607;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v362 = 0;
LABEL_607:
          v390 = v362 != 0;
          v391 = 102;
          goto LABEL_616;
        case 0x35u:
          v367 = 0;
          v368 = 0;
          v369 = 0;
          v5->_hasIsContainedInActivity = 1;
          while (2)
          {
            v370 = *v6;
            v371 = *(_QWORD *)&v4[v370];
            v372 = v371 + 1;
            if (v371 == -1 || v372 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v373 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v371);
              *(_QWORD *)&v4[v370] = v372;
              v369 |= (unint64_t)(v373 & 0x7F) << v367;
              if (v373 < 0)
              {
                v367 += 7;
                v17 = v368++ >= 9;
                if (v17)
                {
                  v369 = 0;
                  goto LABEL_611;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v369 = 0;
LABEL_611:
          v390 = v369 != 0;
          v391 = 104;
          goto LABEL_616;
        case 0x36u:
          v374 = 0;
          v375 = 0;
          v376 = 0;
          v5->_hasIsContainedInChildActivity = 1;
          while (2)
          {
            v377 = *v6;
            v378 = *(_QWORD *)&v4[v377];
            v379 = v378 + 1;
            if (v378 == -1 || v379 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v380 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v378);
              *(_QWORD *)&v4[v377] = v379;
              v376 |= (unint64_t)(v380 & 0x7F) << v374;
              if (v380 < 0)
              {
                v374 += 7;
                v17 = v375++ >= 9;
                if (v17)
                {
                  v376 = 0;
                  goto LABEL_615;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v376 = 0;
LABEL_615:
          v390 = v376 != 0;
          v391 = 106;
LABEL_616:
          *((_BYTE *)&v5->super.super.isa + v391) = v390;
          continue;
        case 0x37u:
          v381 = 0;
          v382 = 0;
          v130 = 0;
          break;
        case 0x38u:
          v5->_hasUserisDAU = 1;
          v387 = *v6;
          v388 = *(_QWORD *)&v4[v387];
          if (v388 <= 0xFFFFFFFFFFFFFFFBLL && v388 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v389 = *(float *)(*(_QWORD *)&v4[*v9] + v388);
            *(_QWORD *)&v4[v387] = v388 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v389 = 0.0;
          }
          v5->_userisDAU = v389;
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_629;
          continue;
      }
      while (1)
      {
        v383 = *v6;
        v384 = *(_QWORD *)&v4[v383];
        v385 = v384 + 1;
        if (v384 == -1 || v385 > *(_QWORD *)&v4[*v7])
          break;
        v386 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v384);
        *(_QWORD *)&v4[v383] = v385;
        v130 |= (unint64_t)(v386 & 0x7F) << v381;
        if ((v386 & 0x80) == 0)
          goto LABEL_620;
        v381 += 7;
        v17 = v382++ >= 9;
        if (v17)
        {
          LODWORD(v130) = 0;
          goto LABEL_622;
        }
      }
      v4[*v8] = 1;
LABEL_620:
      if (v4[*v8])
        LODWORD(v130) = 0;
LABEL_622:
      if (v130 >= 6)
        LODWORD(v130) = 0;
      v393 = 148;
LABEL_625:
      *(_DWORD *)((char *)&v5->super.super.isa + v393) = v130;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_629:
    v394 = 0;
  else
LABEL_630:
    v394 = v5;

  return v394;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_userEvent)
    PBDataWriterWriteStringField();
  if (self->_hasContainsVIP)
    PBDataWriterWriteBOOLField();
  if (self->_hasFaceCount)
    PBDataWriterWriteInt32Field();
  if (self->_hasContainsPets)
    PBDataWriterWriteBOOLField();
  if (self->_hasCapturedAtHome)
    PBDataWriterWriteBOOLField();
  if (self->_hasCapturedAtWork)
    PBDataWriterWriteBOOLField();
  if (self->_hasCapturedAtFrequentLocation)
    PBDataWriterWriteBOOLField();
  if (self->_hasCapturedOnTrip)
    PBDataWriterWriteBOOLField();
  if (self->_hasCapturedOnShortTrip)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsDocument)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsMeme)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsScreenshot)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsFavorite)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsCapturedOnWeekend)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsCapturedAtPrivateEvent)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsCapturedOnHoliday)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasUserNumTrips)
    PBDataWriterWriteInt32Field();
  if (self->_hasUserNumVIPPeople)
    PBDataWriterWriteInt32Field();
  if (self->_hasUserNumFavorites)
    PBDataWriterWriteInt32Field();
  if (self->_hasUserHasVIP)
    PBDataWriterWriteBOOLField();
  if (self->_hasUserHasHome)
    PBDataWriterWriteBOOLField();
  if (self->_hasUserHasPet)
    PBDataWriterWriteBOOLField();
  if (self->_hasContainsBaby)
    PBDataWriterWriteBOOLField();
  if (self->_hasContainsSocialGroup)
    PBDataWriterWriteBOOLField();
  if (self->_hasContainsMyPet)
    PBDataWriterWriteBOOLField();
  if (self->_hasContainsCoWorker)
    PBDataWriterWriteBOOLField();
  if (self->_hasContainsFamily)
    PBDataWriterWriteBOOLField();
  if (self->_hasContainsFriends)
    PBDataWriterWriteBOOLField();
  if (self->_hasContainsPartner)
    PBDataWriterWriteBOOLField();
  if (self->_hasContainsParent)
    PBDataWriterWriteBOOLField();
  if (self->_hasContainsSibling)
    PBDataWriterWriteBOOLField();
  if (self->_hasContainsChild)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsCoupon)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsRecipe)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsReceipt)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsRecentView)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsRecentEdit)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsRecentShare)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsRecentFavorite)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsContainedInSharedAlbum)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsContainedInOnThisDay)
    PBDataWriterWriteBOOLField();
  if (self->_hasCapturedAtAOI)
    PBDataWriterWriteBOOLField();
  if (self->_hasCapturedAtPOI)
    PBDataWriterWriteBOOLField();
  if (self->_hasCapturedAtROI)
    PBDataWriterWriteBOOLField();
  if (self->_hasCapturedAtBusiness)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsCapturedAtPublicEvent)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsContainedInVisualTrend)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsContainedInActivity)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsContainedInChildActivity)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  if (self->_hasUserisDAU)
    PBDataWriterWriteFloatField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPhotosUserAnalytics writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPhotosUserAnalytics)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  BMPhotosUserAnalytics *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id *v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  BMPhotosUserAnalytics *v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  BMPhotosUserAnalytics *v74;
  id v75;
  void *v76;
  id *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  BMPhotosUserAnalytics *v86;
  id v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  BMPhotosUserAnalytics *v94;
  id v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  void *v101;
  BMPhotosUserAnalytics *v102;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  BMPhotosUserAnalytics *v109;
  id v110;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  id *v116;
  id v117;
  uint64_t v118;
  BMPhotosUserAnalytics *v119;
  id v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  id *v125;
  uint64_t v126;
  BMPhotosUserAnalytics *v127;
  id v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  id *v133;
  uint64_t v134;
  id v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  id v139;
  id *v140;
  uint64_t v141;
  id v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  id v146;
  id v147;
  id *v148;
  uint64_t v149;
  id v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  id v154;
  id *v155;
  uint64_t v156;
  id v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  id v161;
  id *v162;
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
  void *v173;
  uint64_t v174;
  uint64_t v175;
  id v176;
  id v177;
  uint64_t v178;
  void *v179;
  id v180;
  id v181;
  uint64_t v182;
  void *v183;
  id v184;
  id v185;
  uint64_t v186;
  void *v187;
  id v188;
  id v189;
  uint64_t v190;
  void *v191;
  uint64_t v192;
  void *v193;
  uint64_t v194;
  void *v195;
  uint64_t v196;
  void *v197;
  uint64_t v198;
  void *v199;
  uint64_t v200;
  void *v201;
  uint64_t v202;
  void *v203;
  uint64_t v204;
  void *v205;
  uint64_t v206;
  void *v207;
  uint64_t v208;
  void *v209;
  void *v210;
  uint64_t v211;
  void *v212;
  uint64_t v213;
  void *v214;
  uint64_t v215;
  void *v216;
  uint64_t v217;
  void *v218;
  uint64_t v219;
  void *v220;
  uint64_t v221;
  void *v222;
  uint64_t v223;
  void *v224;
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
  id v237;
  id *v238;
  id v239;
  uint64_t v240;
  id v241;
  void *v242;
  uint64_t v243;
  uint64_t v244;
  id *v245;
  uint64_t v246;
  id v247;
  void *v248;
  void *v249;
  uint64_t v250;
  uint64_t v251;
  id v252;
  id *v253;
  id v254;
  uint64_t v255;
  id v256;
  void *v257;
  uint64_t v258;
  uint64_t v259;
  id v260;
  id v261;
  uint64_t v262;
  id v263;
  uint64_t v264;
  id *v265;
  id v266;
  uint64_t v267;
  id v268;
  void *v269;
  uint64_t v270;
  uint64_t v271;
  id v272;
  uint64_t v273;
  id v274;
  uint64_t v275;
  id *v276;
  uint64_t v277;
  id v278;
  void *v279;
  void *v280;
  uint64_t v281;
  uint64_t v282;
  id v283;
  id *v284;
  id v285;
  uint64_t v286;
  id v287;
  void *v288;
  uint64_t v289;
  uint64_t v290;
  id v291;
  id *v292;
  id v293;
  uint64_t v294;
  id v295;
  void *v296;
  uint64_t v297;
  uint64_t v298;
  id *v299;
  id v300;
  uint64_t v301;
  id v302;
  void *v303;
  uint64_t v304;
  uint64_t v305;
  id *v306;
  id v307;
  uint64_t v308;
  id v309;
  void *v310;
  uint64_t v311;
  uint64_t v312;
  id *v313;
  id v314;
  uint64_t v315;
  id v316;
  void *v317;
  void *v318;
  uint64_t v319;
  id *v320;
  uint64_t v321;
  id v322;
  void *v323;
  uint64_t v324;
  uint64_t v325;
  id v326;
  id v327;
  uint64_t v328;
  id v329;
  void *v330;
  void *v331;
  uint64_t v332;
  uint64_t v333;
  id v334;
  uint64_t v335;
  id v336;
  void *v337;
  id v338;
  id v339;
  uint64_t v340;
  id v341;
  void *v342;
  id v343;
  uint64_t v344;
  id v345;
  void *v346;
  id *v347;
  id v348;
  uint64_t v349;
  id v350;
  void *v351;
  uint64_t v352;
  uint64_t v353;
  void *v354;
  id *v355;
  id v356;
  uint64_t v357;
  id v358;
  void *v359;
  uint64_t v360;
  uint64_t v361;
  void *v362;
  id v363;
  uint64_t v364;
  id v365;
  void *v366;
  id v367;
  uint64_t v368;
  id v369;
  void *v370;
  void *v371;
  uint64_t v372;
  uint64_t v373;
  id v374;
  uint64_t v375;
  id v376;
  void *v377;
  id v378;
  id v379;
  uint64_t v380;
  id v381;
  void *v382;
  id v383;
  id v384;
  id v385;
  id v386;
  uint64_t v387;
  id v388;
  void *v389;
  BMPhotosUserAnalytics *v390;
  id v391;
  id v392;
  id v393;
  id v394;
  void *v395;
  uint64_t v396;
  uint64_t v397;
  id v398;
  uint64_t v399;
  void *v400;
  id v401;
  BMPhotosUserAnalytics *v402;
  id v403;
  uint64_t v404;
  uint64_t v405;
  id v406;
  void *v407;
  id v408;
  id v409;
  BMPhotosUserAnalytics *v410;
  id v411;
  uint64_t v412;
  id v413;
  id v414;
  uint64_t v415;
  id v416;
  id v417;
  uint64_t v418;
  id v419;
  id v420;
  uint64_t v421;
  id v422;
  id v423;
  uint64_t v424;
  id v425;
  void *v426;
  void *v427;
  id v428;
  unsigned int v429;
  unsigned int v430;
  unsigned int v431;
  unsigned int v432;
  void *v433;
  id *v434;
  id v436;
  uint64_t v437;
  void *v438;
  void *v439;
  id v440;
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
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  unint64_t v479;
  unint64_t v480;
  uint64_t v481;
  void *v482;
  id v483;
  id v484;
  id v485;
  void *v486;
  void *v487;
  id v488;
  id v489;
  id v490;
  void *v491;
  id v492;
  void *v493;
  void *v494;
  uint64_t v495;
  id v496;
  uint64_t v497;
  id v498;
  uint64_t v499;
  void *v500;
  id v501;
  void *v502;
  uint64_t v503;
  id v504;
  id v505;
  void *v506;
  void *v507;
  void *v508;
  id v509;
  uint64_t v510;
  void *v511;
  id v512;
  id v513;
  id v514;
  void *v515;
  void *v516;
  id v517;
  void *v518;
  void *v519;
  id v520;
  void *v521;
  id v522;
  id v523;
  void *v524;
  id v525;
  void *v526;
  id v527;
  id v528;
  void *v529;
  void *v530;
  void *v531;
  id v532;
  void *v533;
  id v534;
  id v535;
  id v536;
  void *v537;
  id v538;
  void *v539;
  id v540;
  void *v541;
  id v542;
  id v543;
  void *v544;
  void *v545;
  id v546;
  id v547;
  void *v548;
  id v549;
  id v550;
  void *v551;
  void *v552;
  id v553;
  id v554;
  void *v555;
  id v556;
  void *v557;
  void *v558;
  void *v559;
  void *v560;
  void *v561;
  void *v562;
  void *v563;
  void *v564;
  void *v565;
  id v566;
  id v567;
  void *v568;
  id v569;
  id v570;
  void *v571;
  id v572;
  id v573;
  void *v574;
  id v575;
  id v576;
  void *v577;
  id v578;
  id v579;
  void *v580;
  void *v581;
  void *v582;
  void *v583;
  void *v584;
  id v585;
  id v586;
  void *v587;
  void *v588;
  void *v589;
  id v590;
  id v591;
  id v592;
  BMPhotosUserAnalytics *v593;
  BMPhotosUserAnalytics *v594;
  void *v595;
  void *v596;
  void *v597;
  void *v598;
  id v599;
  id v600;
  uint64_t v601;
  id v602;
  id v603;
  void *v604;
  id v605;
  id v606;
  void *v607;
  id *v608;
  id v609;
  id v610;
  void *v611;
  void *v612;
  void *v613;
  id v614;
  id v615;
  id v616;
  void *v617;
  id *v618;
  uint64_t v619;
  id v620;
  id v621;
  id v622;
  id v623;
  uint64_t v624;
  void *v625;
  uint64_t v626;
  void *v627;
  uint64_t v628;
  id v629;
  uint64_t v630;
  id v631;
  uint64_t v632;
  id v633;
  uint64_t v634;
  id v635;
  uint64_t v636;
  id v637;
  uint64_t v638;
  id v639;
  uint64_t v640;
  id v641;
  uint64_t v642;
  id v643;
  uint64_t v644;
  void *v645;
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
  void *v657;
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
  void *v671;
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
  void *v685;
  uint64_t v686;
  id v687;
  uint64_t v688;
  id v689;
  uint64_t v690;
  void *v691;
  uint64_t v692;
  id v693;
  uint64_t v694;
  id v695;
  uint64_t v696;
  void *v697;
  uint64_t v698;
  void *v699;
  uint64_t v700;
  void *v701;
  uint64_t v702;
  void *v703;
  uint64_t v704;
  id v705;
  uint64_t v706;
  id v707;
  uint64_t v708;
  id v709;
  uint64_t v710;
  id v711;
  uint64_t v712;
  id v713;
  uint64_t v714;
  id v715;
  uint64_t v716;
  id v717;
  uint64_t v718;
  void *v719;
  uint64_t v720;
  id v721;
  uint64_t v722;
  id v723;
  uint64_t v724;
  id v725;
  uint64_t v726;
  id *v727;
  uint64_t v728;
  id v729;
  uint64_t v730;
  id v731;
  uint64_t v732;
  uint64_t v733;
  uint64_t v734;
  _QWORD v735[3];

  v735[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v623 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v623 = v7;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userEvent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsVIP"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v620 = v9;
        v11 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v620 = v9;
        v11 = v10;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("faceCount"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v614 = v11;
        if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v613 = v12;
          v621 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v613 = v12;
          v621 = v12;
LABEL_13:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsPets"));
          v13 = objc_claimAutoreleasedReturnValue();
          v617 = (void *)v13;
          if (!v13 || (v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v615 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v615 = v14;
LABEL_16:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("capturedAtHome"));
            v15 = objc_claimAutoreleasedReturnValue();
            v612 = (void *)v15;
            if (!v15 || (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v608 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v608 = v16;
LABEL_19:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("capturedAtWork"));
              v17 = objc_claimAutoreleasedReturnValue();
              v611 = (void *)v17;
              if (!v17 || (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v609 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v609 = v18;
LABEL_22:
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("capturedAtFrequentLocation"));
                v19 = objc_claimAutoreleasedReturnValue();
                v607 = (void *)v19;
                if (!v19 || (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v605 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v605 = v20;
LABEL_25:
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("capturedOnTrip"));
                  v21 = objc_claimAutoreleasedReturnValue();
                  v604 = (void *)v21;
                  if (!v21 || (v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v602 = 0;
                    goto LABEL_28;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v602 = v22;
LABEL_28:
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("capturedOnShortTrip"));
                    v23 = objc_claimAutoreleasedReturnValue();
                    v598 = (void *)v23;
                    if (!v23 || (v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v590 = 0;
                      goto LABEL_31;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v590 = v24;
LABEL_31:
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isDocument"));
                      v25 = objc_claimAutoreleasedReturnValue();
                      v595 = (void *)v25;
                      if (!v25 || (v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v591 = 0;
                        goto LABEL_34;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v591 = v26;
LABEL_34:
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isMeme"));
                        v27 = objc_claimAutoreleasedReturnValue();
                        v593 = self;
                        v587 = (void *)v27;
                        if (!v27 || (v28 = (void *)v27, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v585 = 0;
                          goto LABEL_37;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v585 = v28;
LABEL_37:
                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isScreenshot"));
                          v29 = objc_claimAutoreleasedReturnValue();
                          v584 = (void *)v29;
                          if (!v29 || (v30 = (void *)v29, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v578 = 0;
                            goto LABEL_40;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v578 = v30;
LABEL_40:
                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isFavorite"));
                            v31 = objc_claimAutoreleasedReturnValue();
                            v577 = (void *)v31;
                            if (!v31 || (v32 = (void *)v31, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v575 = 0;
                              goto LABEL_43;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v575 = v32;
LABEL_43:
                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCapturedOnWeekend"));
                              v33 = objc_claimAutoreleasedReturnValue();
                              v574 = (void *)v33;
                              if (!v33 || (v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v572 = 0;
                                goto LABEL_46;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v572 = v34;
LABEL_46:
                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCapturedAtPrivateEvent"));
                                v35 = objc_claimAutoreleasedReturnValue();
                                v571 = (void *)v35;
                                if (!v35 || (v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v569 = 0;
LABEL_49:
                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCapturedOnHoliday"));
                                  v37 = objc_claimAutoreleasedReturnValue();
                                  v568 = (void *)v37;
                                  if (v37 && (v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (!a4)
                                      {
                                        v566 = 0;
                                        v45 = 0;
                                        v56 = v613;
                                        a4 = v608;
LABEL_512:
                                        v112 = v590;
                                        goto LABEL_513;
                                      }
                                      v169 = a4;
                                      v567 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v170 = *MEMORY[0x1E0D025B8];
                                      v702 = *MEMORY[0x1E0CB2D50];
                                      v171 = objc_alloc(MEMORY[0x1E0CB3940]);
                                      v456 = objc_opt_class();
                                      v172 = v171;
                                      self = v593;
                                      a4 = v608;
                                      v173 = (void *)objc_msgSend(v172, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v456, CFSTR("isCapturedOnHoliday"));
                                      v703 = v173;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v703, &v702, 1);
                                      v174 = objc_claimAutoreleasedReturnValue();
                                      v175 = v170;
                                      v11 = v614;
                                      v565 = (void *)v174;
                                      v176 = (id)objc_msgSend(v567, "initWithDomain:code:userInfo:", v175, 2);
                                      v566 = 0;
                                      v45 = 0;
                                      *v169 = v176;
                                      v56 = v613;
                                      goto LABEL_511;
                                    }
                                    v566 = v38;
                                  }
                                  else
                                  {
                                    v566 = 0;
                                  }
                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaType"));
                                  v39 = objc_claimAutoreleasedReturnValue();
                                  v565 = (void *)v39;
                                  if (!v39
                                    || (v40 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v562 = 0;
                                    goto LABEL_140;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v147 = v40;
LABEL_139:
                                    v562 = v147;

LABEL_140:
                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("importSource"));
                                    v178 = objc_claimAutoreleasedReturnValue();
                                    v564 = (void *)v178;
                                    if (!v178
                                      || (v179 = (void *)v178, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v563 = 0;
                                      goto LABEL_148;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v180 = v179;
LABEL_147:
                                      v563 = v180;

LABEL_148:
                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assetAge"));
                                      v182 = objc_claimAutoreleasedReturnValue();
                                      v561 = (void *)v182;
                                      if (!v182
                                        || (v183 = (void *)v182, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v560 = 0;
                                        goto LABEL_157;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v184 = v183;
LABEL_156:
                                        v560 = v184;

LABEL_157:
                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userLibrarySize"));
                                        v186 = objc_claimAutoreleasedReturnValue();
                                        v559 = (void *)v186;
                                        if (!v186
                                          || (v187 = (void *)v186, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v558 = 0;
                                          goto LABEL_165;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v188 = v187;
LABEL_164:
                                          v558 = v188;

LABEL_165:
                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userNumTrips"));
                                          v190 = objc_claimAutoreleasedReturnValue();
                                          v557 = (void *)v190;
                                          if (!v190
                                            || (v191 = (void *)v190,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            v556 = 0;
                                            goto LABEL_168;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v556 = v191;
LABEL_168:
                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userNumVIPPeople"));
                                            v192 = objc_claimAutoreleasedReturnValue();
                                            v555 = (void *)v192;
                                            if (!v192
                                              || (v193 = (void *)v192,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              v553 = 0;
                                              goto LABEL_171;
                                            }
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v553 = v193;
LABEL_171:
                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userNumFavorites"));
                                              v194 = objc_claimAutoreleasedReturnValue();
                                              v552 = (void *)v194;
                                              if (!v194
                                                || (v195 = (void *)v194,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                v549 = 0;
                                                goto LABEL_174;
                                              }
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v549 = v195;
LABEL_174:
                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userHasVIP"));
                                                v196 = objc_claimAutoreleasedReturnValue();
                                                v551 = (void *)v196;
                                                if (!v196
                                                  || (v197 = (void *)v196,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  v550 = 0;
                                                  goto LABEL_177;
                                                }
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  v550 = v197;
LABEL_177:
                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userHasHome"));
                                                  v198 = objc_claimAutoreleasedReturnValue();
                                                  v548 = (void *)v198;
                                                  if (!v198
                                                    || (v199 = (void *)v198,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    v546 = 0;
                                                    goto LABEL_180;
                                                  }
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    v546 = v199;
LABEL_180:
                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userHasPet"));
                                                    v200 = objc_claimAutoreleasedReturnValue();
                                                    v545 = (void *)v200;
                                                    if (!v200
                                                      || (v201 = (void *)v200,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      v542 = 0;
                                                      goto LABEL_183;
                                                    }
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v542 = v201;
LABEL_183:
                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsBaby"));
                                                      v202 = objc_claimAutoreleasedReturnValue();
                                                      v544 = (void *)v202;
                                                      if (!v202
                                                        || (v203 = (void *)v202,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        v543 = 0;
                                                        goto LABEL_186;
                                                      }
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v543 = v203;
LABEL_186:
                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsSocialGroup"));
                                                        v204 = objc_claimAutoreleasedReturnValue();
                                                        v541 = (void *)v204;
                                                        if (!v204
                                                          || (v205 = (void *)v204,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          v540 = 0;
                                                          goto LABEL_189;
                                                        }
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                        {
                                                          v540 = v205;
LABEL_189:
                                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsMyPet"));
                                                          v206 = objc_claimAutoreleasedReturnValue();
                                                          v539 = (void *)v206;
                                                          if (!v206
                                                            || (v207 = (void *)v206,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            v538 = 0;
                                                            goto LABEL_192;
                                                          }
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                          {
                                                            v538 = v207;
LABEL_192:
                                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsCoWorker"));
                                                            v208 = objc_claimAutoreleasedReturnValue();
                                                            v537 = (void *)v208;
                                                            if (!v208
                                                              || (v209 = (void *)v208,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              v536 = 0;
                                                              goto LABEL_195;
                                                            }
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                            {
                                                              v536 = v209;
LABEL_195:
                                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsFamily"));
                                                              v210 = (void *)objc_claimAutoreleasedReturnValue();
                                                              if (!v210
                                                                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                v531 = v210;
                                                                v534 = 0;
                                                                goto LABEL_198;
                                                              }
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                              {
                                                                v531 = v210;
                                                                v534 = v210;
LABEL_198:
                                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsFriends"));
                                                                v211 = objc_claimAutoreleasedReturnValue();
                                                                v533 = (void *)v211;
                                                                if (!v211
                                                                  || (v212 = (void *)v211,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  v532 = 0;
                                                                  goto LABEL_201;
                                                                }
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                {
                                                                  v532 = v212;
LABEL_201:
                                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsPartner"));
                                                                  v213 = objc_claimAutoreleasedReturnValue();
                                                                  v530 = (void *)v213;
                                                                  if (!v213
                                                                    || (v214 = (void *)v213,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    v527 = 0;
                                                                    goto LABEL_204;
                                                                  }
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                  {
                                                                    v527 = v214;
LABEL_204:
                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsParent"));
                                                                    v215 = objc_claimAutoreleasedReturnValue();
                                                                    v529 = (void *)v215;
                                                                    if (!v215
                                                                      || (v216 = (void *)v215,
                                                                          objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      v528 = 0;
                                                                      goto LABEL_207;
                                                                    }
                                                                    objc_opt_class();
                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                    {
                                                                      v528 = v216;
LABEL_207:
                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsSibling"));
                                                                      v217 = objc_claimAutoreleasedReturnValue();
                                                                      v526 = (void *)v217;
                                                                      if (!v217
                                                                        || (v218 = (void *)v217,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        v525 = 0;
                                                                        goto LABEL_210;
                                                                      }
                                                                      objc_opt_class();
                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                      {
                                                                        v525 = v218;
LABEL_210:
                                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsChild"));
                                                                        v219 = objc_claimAutoreleasedReturnValue();
                                                                        v524 = (void *)v219;
                                                                        if (!v219
                                                                          || (v220 = (void *)v219,
                                                                              objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                        {
                                                                          v523 = 0;
                                                                          goto LABEL_213;
                                                                        }
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                        {
                                                                          v523 = v220;
LABEL_213:
                                                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCoupon"));
                                                                          v221 = objc_claimAutoreleasedReturnValue();
                                                                          v521 = (void *)v221;
                                                                          if (!v221
                                                                            || (v222 = (void *)v221,
                                                                                objc_opt_class(),
                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                          {
                                                                            v522 = 0;
                                                                            goto LABEL_216;
                                                                          }
                                                                          objc_opt_class();
                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                          {
                                                                            v522 = v222;
LABEL_216:
                                                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRecipe"));
                                                                            v223 = objc_claimAutoreleasedReturnValue();
                                                                            v519 = (void *)v223;
                                                                            if (!v223
                                                                              || (v224 = (void *)v223,
                                                                                  objc_opt_class(),
                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                            {
                                                                              v520 = 0;
                                                                              goto LABEL_219;
                                                                            }
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                            {
                                                                              v520 = v224;
LABEL_219:
                                                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isReceipt"));
                                                                              v225 = objc_claimAutoreleasedReturnValue();
                                                                              v518 = (void *)v225;
                                                                              if (!v225
                                                                                || (v226 = (void *)v225,
                                                                                    objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                              {
                                                                                v517 = 0;
                                                                                goto LABEL_222;
                                                                              }
                                                                              objc_opt_class();
                                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                              {
                                                                                v517 = v226;
LABEL_222:
                                                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRecentView"));
                                                                                v227 = objc_claimAutoreleasedReturnValue();
                                                                                v516 = (void *)v227;
                                                                                if (!v227
                                                                                  || (v228 = (void *)v227,
                                                                                      objc_opt_class(),
                                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                                {
                                                                                  v513 = 0;
                                                                                  goto LABEL_225;
                                                                                }
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                {
                                                                                  v513 = v228;
LABEL_225:
                                                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRecentEdit"));
                                                                                  v229 = objc_claimAutoreleasedReturnValue();
                                                                                  v515 = (void *)v229;
                                                                                  if (!v229
                                                                                    || (v230 = (void *)v229,
                                                                                        objc_opt_class(),
                                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                                  {
                                                                                    v514 = 0;
                                                                                    goto LABEL_228;
                                                                                  }
                                                                                  objc_opt_class();
                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                  {
                                                                                    v514 = v230;
LABEL_228:
                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRecentShare"));
                                                                                    v231 = objc_claimAutoreleasedReturnValue();
                                                                                    v511 = (void *)v231;
                                                                                    if (!v231
                                                                                      || (v232 = (void *)v231,
                                                                                          objc_opt_class(),
                                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                                    {
                                                                                      v512 = 0;
                                                                                      goto LABEL_231;
                                                                                    }
                                                                                    objc_opt_class();
                                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                    {
                                                                                      v512 = v232;
LABEL_231:
                                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRecentFavorite"));
                                                                                      v233 = objc_claimAutoreleasedReturnValue();
                                                                                      v508 = (void *)v233;
                                                                                      if (!v233
                                                                                        || (v234 = (void *)v233,
                                                                                            objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                                      {
                                                                                        v509 = 0;
                                                                                        goto LABEL_234;
                                                                                      }
                                                                                      objc_opt_class();
                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                      {
                                                                                        v509 = v234;
LABEL_234:
                                                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isContainedInSharedAlbum"));
                                                                                        v235 = objc_claimAutoreleasedReturnValue();
                                                                                        v507 = (void *)v235;
                                                                                        if (!v235
                                                                                          || (v236 = (void *)v235,
                                                                                              objc_opt_class(),
                                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                                        {
                                                                                          v600 = 0;
                                                                                          goto LABEL_237;
                                                                                        }
                                                                                        objc_opt_class();
                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                        {
                                                                                          v600 = v236;
LABEL_237:
                                                                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isContainedInOnThisDay"));
                                                                                          v506 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                          if (!v506
                                                                                            || (objc_opt_class(),
                                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                                          {
                                                                                            v504 = 0;
LABEL_240:
                                                                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("capturedAtAOI"));
                                                                                            v237 = (id)objc_claimAutoreleasedReturnValue();
                                                                                            v502 = v237;
                                                                                            if (!v237)
                                                                                              goto LABEL_378;
                                                                                            objc_opt_class();
                                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                            {
                                                                                              v237 = 0;
                                                                                              goto LABEL_378;
                                                                                            }
                                                                                            objc_opt_class();
                                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                            {
                                                                                              v237 = v502;
LABEL_378:
                                                                                              v498 = v237;
                                                                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("capturedAtPOI"));
                                                                                              v500 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              if (!v500
                                                                                                || (objc_opt_class(),
                                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                                              {
                                                                                                v383 = 0;
                                                                                                goto LABEL_381;
                                                                                              }
                                                                                              objc_opt_class();
                                                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                              {
                                                                                                v383 = v500;
LABEL_381:
                                                                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("capturedAtROI"));
                                                                                                v494 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                if (!v494 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                {
                                                                                                  v496 = 0;
LABEL_384:
                                                                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("capturedAtBusiness"));
                                                                                                  v490 = v383;
                                                                                                  v493 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                  if (v493 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                  {
                                                                                                    objc_opt_class();
                                                                                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                    {
                                                                                                      v410 = self;
                                                                                                      if (!a4)
                                                                                                      {
                                                                                                        v492 = 0;
                                                                                                        v45 = 0;
                                                                                                        v56 = v613;
                                                                                                        goto LABEL_479;
                                                                                                      }
                                                                                                      v411 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                      v412 = *MEMORY[0x1E0D025B8];
                                                                                                      v636 = *MEMORY[0x1E0CB2D50];
                                                                                                      v489 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("capturedAtBusiness"));
                                                                                                      v637 = v489;
                                                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v637, &v636, 1);
                                                                                                      v491 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                      v413 = (id)objc_msgSend(v411, "initWithDomain:code:userInfo:", v412, 2);
                                                                                                      v492 = 0;
                                                                                                      v45 = 0;
                                                                                                      *a4 = v413;
                                                                                                      goto LABEL_537;
                                                                                                    }
                                                                                                    v492 = v493;
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    v492 = 0;
                                                                                                  }
                                                                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCapturedAtPublicEvent"));
                                                                                                  v491 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                  if (!v491 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                  {
                                                                                                    v489 = 0;
                                                                                                    goto LABEL_390;
                                                                                                  }
                                                                                                  objc_opt_class();
                                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                  {
                                                                                                    v489 = v491;
LABEL_390:
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isContainedInVisualTrend"));
                                                                                                    v487 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (!v487 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                    {
                                                                                                      v488 = 0;
                                                                                                      goto LABEL_393;
                                                                                                    }
                                                                                                    v402 = self;
                                                                                                    objc_opt_class();
                                                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                    {
                                                                                                      v488 = v487;
LABEL_393:
                                                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isContainedInActivity"));
                                                                                                      v486 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                      if (!v486 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                      {
                                                                                                        v485 = 0;
                                                                                                        v384 = v620;
                                                                                                        goto LABEL_396;
                                                                                                      }
                                                                                                      v384 = v620;
                                                                                                      v402 = self;
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v485 = v486;
LABEL_396:
                                                                                                        v589 = v8;
                                                                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isContainedInChildActivity"));
                                                                                                        v597 = v7;
                                                                                                        v583 = v10;
                                                                                                        v620 = v384;
                                                                                                        v482 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                        if (v482)
                                                                                                        {
                                                                                                          v385 = v623;
                                                                                                          objc_opt_class();
                                                                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                          {
                                                                                                            objc_opt_class();
                                                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                            {
                                                                                                              v484 = v482;
                                                                                                              goto LABEL_435;
                                                                                                            }
                                                                                                            if (a4)
                                                                                                            {
                                                                                                              v423 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                              v424 = *MEMORY[0x1E0D025B8];
                                                                                                              v628 = *MEMORY[0x1E0CB2D50];
                                                                                                              v483 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isContainedInChildActivity"));
                                                                                                              v629 = v483;
                                                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v629, &v628, 1);
                                                                                                              v407 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                              v484 = 0;
                                                                                                              v45 = 0;
                                                                                                              *a4 = (id)objc_msgSend(v423, "initWithDomain:code:userInfo:", v424, 2, v407);
                                                                                                              goto LABEL_548;
                                                                                                            }
                                                                                                            v484 = 0;
                                                                                                            v45 = 0;
                                                                                                            v7 = v597;
LABEL_546:
                                                                                                            v11 = v614;
                                                                                                            v56 = v613;
                                                                                                            v434 = v608;
                                                                                                            v383 = v490;
                                                                                                            goto LABEL_475;
                                                                                                          }
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          v385 = v623;
                                                                                                        }
                                                                                                        v484 = 0;
LABEL_435:
                                                                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userLibraryAgeInDays"));
                                                                                                        v407 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                        v623 = v385;
                                                                                                        if (!v407 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                        {
                                                                                                          v483 = 0;
                                                                                                          goto LABEL_469;
                                                                                                        }
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                        {
                                                                                                          v483 = v407;
LABEL_468:

LABEL_469:
                                                                                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userisDAU"));
                                                                                                          v426 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                          if (!v426 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                          {
                                                                                                            v427 = v426;
                                                                                                            v428 = 0;
LABEL_472:
                                                                                                            v429 = objc_msgSend(v562, "intValue");
                                                                                                            v430 = objc_msgSend(v563, "intValue");
                                                                                                            v431 = objc_msgSend(v560, "intValue");
                                                                                                            v432 = objc_msgSend(v558, "intValue");
                                                                                                            v433 = v428;
                                                                                                            LODWORD(v481) = objc_msgSend(v483, "intValue");
                                                                                                            v480 = __PAIR64__(v432, v431);
                                                                                                            v479 = __PAIR64__(v430, v429);
                                                                                                            v11 = v614;
                                                                                                            v434 = v608;
                                                                                                            self = -[BMPhotosUserAnalytics initWithIdentifier:userEvent:containsVIP:faceCount:containsPets:capturedAtHome:capturedAtWork:capturedAtFrequentLocation:capturedOnTrip:capturedOnShortTrip:isDocument:isMeme:isScreenshot:isFavorite:isCapturedOnWeekend:isCapturedAtPrivateEvent:isCapturedOnHoliday:mediaType:importSource:assetAge:userLibrarySize:userNumTrips:userNumVIPPeople:userNumFavorites:userHasVIP:userHasHome:userHasPet:containsBaby:containsSocialGroup:containsMyPet:containsCoWorker:containsFamily:containsFriends:containsPartner:containsParent:containsSibling:containsChild:isCoupon:isRecipe:isReceipt:isRecentView:isRecentEdit:isRecentShare:isRecentFavorite:isContainedInSharedAlbum:isContainedInOnThisDay:capturedAtAOI:capturedAtPOI:capturedAtROI:capturedAtBusiness:isCapturedAtPublicEvent:isContainedInVisualTrend:isContainedInActivity:isContainedInChildActivity:userLibraryAgeInDays:userisDAU:](v593, "initWithIdentifier:userEvent:containsVIP:faceCount:containsPets:capturedAtHome:capturedAtWork:capturedAtFrequentLocation:capturedOnTrip:capturedOnShortTrip:isDocument:isMeme:isScreenshot:isFavorite:isCapturedOnWeekend:isCapturedAtPrivateEvent:isCapturedOnHoliday:mediaType:importSource:assetAge:userLibrarySize:userNumTrips:userNumVIPPeople:userNumFavorites:userHasVIP:userHasHome:userHasPet:containsBaby:containsSocialGroup:containsMyPet:containsCoWorker:containsFamily:containsFriends:containsPartner:containsParent:containsSibling:containsChild:isCoupon:isRecipe:isReceipt:isRecentView:isRecentEdit:isRecentShare:isRecentFavorite:isContainedInSharedAlbum:isContainedInOnThisDay:capturedAtAOI:capturedAtPOI:capturedAtROI:capturedAtBusiness:isCapturedAtPublicEvent:isContainedInVisualTrend:isContainedInActivity:isContainedInChildActivity:userLibraryAgeInDays:userisDAU:", v385, v620, v614, v621, v615, v608, v609, v605, v602, v590, v591, v585, v578, v575, v572, v569, v566, v479, v480, v556, v553, v549, v550, v546, v542, v543, v540, v538, v536, v534, v532, v527, v528, v525, v523, v522, v520, v517, v513, v514, v512, v509, v600, v504, v498, v490, v496, v492, v489, v488, v485, v484, v481, v428);
                                                                                                            v45 = self;
                                                                                                            v7 = v597;
LABEL_473:

                                                                                                            v10 = v583;
                                                                                                            v56 = v613;
LABEL_474:
                                                                                                            v383 = v490;

                                                                                                            v8 = v589;
LABEL_475:

LABEL_476:
LABEL_477:

LABEL_478:
                                                                                                            v608 = v434;

                                                                                                            goto LABEL_479;
                                                                                                          }
                                                                                                          objc_opt_class();
                                                                                                          v427 = v426;
                                                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                          {
                                                                                                            v428 = v426;
                                                                                                            goto LABEL_472;
                                                                                                          }
                                                                                                          if (a4)
                                                                                                          {
                                                                                                            v436 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v437 = *MEMORY[0x1E0D025B8];
                                                                                                            v624 = *MEMORY[0x1E0CB2D50];
                                                                                                            v438 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("userisDAU"));
                                                                                                            v625 = v438;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v625, &v624, 1);
                                                                                                            v439 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            *a4 = (id)objc_msgSend(v436, "initWithDomain:code:userInfo:", v437, 2, v439);

                                                                                                          }
                                                                                                          v433 = 0;
                                                                                                          v45 = 0;
LABEL_544:
                                                                                                          self = v593;
                                                                                                          v7 = v597;
                                                                                                          v11 = v614;
                                                                                                          v434 = v608;
                                                                                                          goto LABEL_473;
                                                                                                        }
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                        {
                                                                                                          v425 = v407;
                                                                                                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPhotosUserAnalyticsUserLibraryAgeInDaysTypeFromString(v425));
                                                                                                          v483 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                          goto LABEL_468;
                                                                                                        }
                                                                                                        if (a4)
                                                                                                        {
                                                                                                          v440 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                          v441 = *MEMORY[0x1E0D025B8];
                                                                                                          v626 = *MEMORY[0x1E0CB2D50];
                                                                                                          v433 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userLibraryAgeInDays"));
                                                                                                          v627 = v433;
                                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v627, &v626, 1);
                                                                                                          v427 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                          v483 = 0;
                                                                                                          v45 = 0;
                                                                                                          *a4 = (id)objc_msgSend(v440, "initWithDomain:code:userInfo:", v441, 2);
                                                                                                          goto LABEL_544;
                                                                                                        }
                                                                                                        v483 = 0;
                                                                                                        v45 = 0;
LABEL_548:
                                                                                                        v7 = v597;
                                                                                                        v11 = v614;
                                                                                                        v56 = v613;
                                                                                                        v434 = v608;
                                                                                                        goto LABEL_474;
                                                                                                      }
                                                                                                      if (a4)
                                                                                                      {
                                                                                                        v420 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                        v421 = *MEMORY[0x1E0D025B8];
                                                                                                        v630 = *MEMORY[0x1E0CB2D50];
                                                                                                        v484 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isContainedInActivity"));
                                                                                                        v631 = v484;
                                                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v631, &v630, 1);
                                                                                                        v482 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                        v422 = (id)objc_msgSend(v420, "initWithDomain:code:userInfo:", v421, 2);
                                                                                                        v485 = 0;
                                                                                                        v45 = 0;
                                                                                                        *a4 = v422;
                                                                                                        goto LABEL_546;
                                                                                                      }
                                                                                                      v485 = 0;
                                                                                                      v45 = 0;
LABEL_541:
                                                                                                      self = v402;
                                                                                                      v11 = v614;
                                                                                                      v56 = v613;
                                                                                                      v434 = v608;
                                                                                                      v383 = v490;
                                                                                                      goto LABEL_476;
                                                                                                    }
                                                                                                    if (a4)
                                                                                                    {
                                                                                                      v417 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                      v418 = *MEMORY[0x1E0D025B8];
                                                                                                      v632 = *MEMORY[0x1E0CB2D50];
                                                                                                      v485 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isContainedInVisualTrend"));
                                                                                                      v633 = v485;
                                                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v633, &v632, 1);
                                                                                                      v486 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                      v419 = (id)objc_msgSend(v417, "initWithDomain:code:userInfo:", v418, 2);
                                                                                                      v488 = 0;
                                                                                                      v45 = 0;
                                                                                                      *a4 = v419;
                                                                                                      goto LABEL_541;
                                                                                                    }
                                                                                                    v488 = 0;
                                                                                                    v45 = 0;
LABEL_539:
                                                                                                    v11 = v614;
                                                                                                    v56 = v613;
                                                                                                    v434 = v608;
                                                                                                    v383 = v490;
                                                                                                    goto LABEL_477;
                                                                                                  }
                                                                                                  v410 = self;
                                                                                                  if (a4)
                                                                                                  {
                                                                                                    v414 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                    v415 = *MEMORY[0x1E0D025B8];
                                                                                                    v634 = *MEMORY[0x1E0CB2D50];
                                                                                                    v488 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isCapturedAtPublicEvent"));
                                                                                                    v635 = v488;
                                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v635, &v634, 1);
                                                                                                    v487 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    v416 = (id)objc_msgSend(v414, "initWithDomain:code:userInfo:", v415, 2);
                                                                                                    v489 = 0;
                                                                                                    v45 = 0;
                                                                                                    *a4 = v416;
                                                                                                    goto LABEL_539;
                                                                                                  }
                                                                                                  v489 = 0;
                                                                                                  v45 = 0;
LABEL_537:
                                                                                                  self = v410;
                                                                                                  v56 = v613;
                                                                                                  v434 = v608;
                                                                                                  v383 = v490;
                                                                                                  goto LABEL_478;
                                                                                                }
                                                                                                objc_opt_class();
                                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                {
                                                                                                  v496 = v494;
                                                                                                  goto LABEL_384;
                                                                                                }
                                                                                                v390 = self;
                                                                                                if (a4)
                                                                                                {
                                                                                                  v408 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                  v497 = *MEMORY[0x1E0D025B8];
                                                                                                  v638 = *MEMORY[0x1E0CB2D50];
                                                                                                  v492 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("capturedAtROI"));
                                                                                                  v639 = v492;
                                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v639, &v638, 1);
                                                                                                  v493 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                  v409 = (id)objc_msgSend(v408, "initWithDomain:code:userInfo:", v497, 2);
                                                                                                  v496 = 0;
                                                                                                  v45 = 0;
                                                                                                  *a4 = v409;
                                                                                                  v56 = v613;
LABEL_479:

                                                                                                  goto LABEL_480;
                                                                                                }
                                                                                                v496 = 0;
                                                                                                v45 = 0;
LABEL_465:
                                                                                                self = v390;
                                                                                                v56 = v613;
LABEL_480:
                                                                                                v318 = v531;

                                                                                                goto LABEL_481;
                                                                                              }
                                                                                              v390 = self;
                                                                                              if (a4)
                                                                                              {
                                                                                                v403 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                v495 = *MEMORY[0x1E0D025B8];
                                                                                                v640 = *MEMORY[0x1E0CB2D50];
                                                                                                v496 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("capturedAtPOI"));
                                                                                                v641 = v496;
                                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v641, &v640, 1);
                                                                                                v404 = objc_claimAutoreleasedReturnValue();
                                                                                                v405 = v495;
                                                                                                v494 = (void *)v404;
                                                                                                v406 = (id)objc_msgSend(v403, "initWithDomain:code:userInfo:", v405, 2);
                                                                                                v383 = 0;
                                                                                                v45 = 0;
                                                                                                *a4 = v406;
                                                                                                goto LABEL_465;
                                                                                              }
                                                                                              v383 = 0;
                                                                                              v45 = 0;
LABEL_461:
                                                                                              self = v390;
                                                                                              v56 = v613;
                                                                                              v318 = v531;
LABEL_481:

                                                                                              v395 = v498;
                                                                                              goto LABEL_482;
                                                                                            }
                                                                                            v390 = self;
                                                                                            if (a4)
                                                                                            {
                                                                                              v501 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                              v499 = *MEMORY[0x1E0D025B8];
                                                                                              v642 = *MEMORY[0x1E0CB2D50];
                                                                                              v383 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("capturedAtAOI"));
                                                                                              v643 = v383;
                                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v643, &v642, 1);
                                                                                              v399 = objc_claimAutoreleasedReturnValue();
                                                                                              v400 = v501;
                                                                                              v500 = (void *)v399;
                                                                                              v401 = (id)objc_msgSend(v400, "initWithDomain:code:userInfo:", v499, 2);
                                                                                              v498 = 0;
                                                                                              v45 = 0;
                                                                                              *a4 = v401;
                                                                                              goto LABEL_461;
                                                                                            }
                                                                                            v395 = 0;
                                                                                            v45 = 0;
LABEL_457:
                                                                                            self = v390;
                                                                                            v56 = v613;
                                                                                            v318 = v531;
LABEL_482:

                                                                                            goto LABEL_483;
                                                                                          }
                                                                                          objc_opt_class();
                                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                          {
                                                                                            v504 = v506;
                                                                                            goto LABEL_240;
                                                                                          }
                                                                                          v390 = self;
                                                                                          if (a4)
                                                                                          {
                                                                                            v505 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                            v503 = *MEMORY[0x1E0D025B8];
                                                                                            v644 = *MEMORY[0x1E0CB2D50];
                                                                                            v395 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isContainedInOnThisDay"));
                                                                                            v645 = v395;
                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v645, &v644, 1);
                                                                                            v396 = objc_claimAutoreleasedReturnValue();
                                                                                            v397 = v503;
                                                                                            v502 = (void *)v396;
                                                                                            v398 = (id)objc_msgSend(v505, "initWithDomain:code:userInfo:", v397, 2);
                                                                                            v504 = 0;
                                                                                            v45 = 0;
                                                                                            *a4 = v398;
                                                                                            goto LABEL_457;
                                                                                          }
                                                                                          v504 = 0;
                                                                                          v45 = 0;
LABEL_453:
                                                                                          self = v390;
                                                                                          v56 = v613;
                                                                                          v318 = v531;
LABEL_483:
                                                                                          v371 = v513;

                                                                                          goto LABEL_484;
                                                                                        }
                                                                                        v390 = self;
                                                                                        if (a4)
                                                                                        {
                                                                                          v393 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                          v601 = *MEMORY[0x1E0D025B8];
                                                                                          v646 = *MEMORY[0x1E0CB2D50];
                                                                                          v504 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isContainedInSharedAlbum"));
                                                                                          v647 = v504;
                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v647, &v646, 1);
                                                                                          v506 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                          v394 = (id)objc_msgSend(v393, "initWithDomain:code:userInfo:", v601, 2);
                                                                                          v600 = 0;
                                                                                          v45 = 0;
                                                                                          *a4 = v394;
                                                                                          goto LABEL_453;
                                                                                        }
                                                                                        v600 = 0;
                                                                                        v45 = 0;
LABEL_447:
                                                                                        self = v390;
                                                                                        v56 = v613;
                                                                                        v318 = v531;
                                                                                        v371 = v513;
LABEL_484:

                                                                                        goto LABEL_485;
                                                                                      }
                                                                                      v390 = self;
                                                                                      if (a4)
                                                                                      {
                                                                                        v391 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                        v510 = *MEMORY[0x1E0D025B8];
                                                                                        v648 = *MEMORY[0x1E0CB2D50];
                                                                                        v600 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isRecentFavorite"));
                                                                                        v649 = v600;
                                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v649, &v648, 1);
                                                                                        v507 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        v392 = (id)objc_msgSend(v391, "initWithDomain:code:userInfo:", v510, 2);
                                                                                        v509 = 0;
                                                                                        v45 = 0;
                                                                                        *a4 = v392;
                                                                                        goto LABEL_447;
                                                                                      }
                                                                                      v509 = 0;
                                                                                      v45 = 0;
LABEL_443:
                                                                                      v56 = v613;
                                                                                      v318 = v531;
                                                                                      v371 = v513;
LABEL_485:

                                                                                      goto LABEL_486;
                                                                                    }
                                                                                    if (a4)
                                                                                    {
                                                                                      v386 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                      v387 = *MEMORY[0x1E0D025B8];
                                                                                      v650 = *MEMORY[0x1E0CB2D50];
                                                                                      v388 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                                      v478 = objc_opt_class();
                                                                                      v389 = v388;
                                                                                      self = v593;
                                                                                      v509 = (id)objc_msgSend(v389, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v478, CFSTR("isRecentShare"));
                                                                                      v651 = v509;
                                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v651, &v650, 1);
                                                                                      v508 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      v512 = 0;
                                                                                      v45 = 0;
                                                                                      *a4 = (id)objc_msgSend(v386, "initWithDomain:code:userInfo:", v387, 2);
                                                                                      goto LABEL_443;
                                                                                    }
                                                                                    v512 = 0;
                                                                                    v45 = 0;
LABEL_432:
                                                                                    v56 = v613;
                                                                                    v318 = v531;
                                                                                    v371 = v513;
LABEL_486:

                                                                                    goto LABEL_487;
                                                                                  }
                                                                                  if (a4)
                                                                                  {
                                                                                    v379 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                    v380 = *MEMORY[0x1E0D025B8];
                                                                                    v652 = *MEMORY[0x1E0CB2D50];
                                                                                    v381 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                                    v477 = objc_opt_class();
                                                                                    v382 = v381;
                                                                                    self = v593;
                                                                                    v512 = (id)objc_msgSend(v382, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v477, CFSTR("isRecentEdit"));
                                                                                    v653 = v512;
                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v653, &v652, 1);
                                                                                    v511 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    v514 = 0;
                                                                                    v45 = 0;
                                                                                    *a4 = (id)objc_msgSend(v379, "initWithDomain:code:userInfo:", v380, 2);
                                                                                    goto LABEL_432;
                                                                                  }
                                                                                  v514 = 0;
                                                                                  v45 = 0;
                                                                                  v56 = v613;
                                                                                  v318 = v531;
                                                                                  v371 = v513;
LABEL_487:

                                                                                  goto LABEL_488;
                                                                                }
                                                                                if (a4)
                                                                                {
                                                                                  v374 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                  v375 = *MEMORY[0x1E0D025B8];
                                                                                  v654 = *MEMORY[0x1E0CB2D50];
                                                                                  v376 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                                  v476 = objc_opt_class();
                                                                                  v377 = v376;
                                                                                  self = v593;
                                                                                  v514 = (id)objc_msgSend(v377, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v476, CFSTR("isRecentView"));
                                                                                  v655 = v514;
                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v655, &v654, 1);
                                                                                  v515 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  v378 = (id)objc_msgSend(v374, "initWithDomain:code:userInfo:", v375, 2);
                                                                                  v371 = 0;
                                                                                  v45 = 0;
                                                                                  *a4 = v378;
                                                                                  v56 = v613;
                                                                                  v318 = v531;
                                                                                  goto LABEL_487;
                                                                                }
                                                                                v371 = 0;
                                                                                v45 = 0;
LABEL_421:
                                                                                v56 = v613;
                                                                                v318 = v531;
LABEL_488:

                                                                                goto LABEL_489;
                                                                              }
                                                                              if (a4)
                                                                              {
                                                                                v367 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                v368 = *MEMORY[0x1E0D025B8];
                                                                                v656 = *MEMORY[0x1E0CB2D50];
                                                                                v369 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                                v475 = objc_opt_class();
                                                                                v370 = v369;
                                                                                self = v593;
                                                                                v371 = (void *)objc_msgSend(v370, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v475, CFSTR("isReceipt"));
                                                                                v657 = v371;
                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v657, &v656, 1);
                                                                                v372 = objc_claimAutoreleasedReturnValue();
                                                                                v373 = v368;
                                                                                v11 = v614;
                                                                                v516 = (void *)v372;
                                                                                v517 = 0;
                                                                                v45 = 0;
                                                                                *a4 = (id)objc_msgSend(v367, "initWithDomain:code:userInfo:", v373, 2);
                                                                                goto LABEL_421;
                                                                              }
                                                                              v517 = 0;
                                                                              v45 = 0;
LABEL_415:
                                                                              v56 = v613;
                                                                              v318 = v531;
LABEL_489:
                                                                              v331 = v527;

                                                                              v362 = v519;
                                                                              goto LABEL_490;
                                                                            }
                                                                            if (a4)
                                                                            {
                                                                              v363 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                              v364 = *MEMORY[0x1E0D025B8];
                                                                              v658 = *MEMORY[0x1E0CB2D50];
                                                                              v365 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                              v474 = objc_opt_class();
                                                                              v366 = v365;
                                                                              self = v593;
                                                                              v517 = (id)objc_msgSend(v366, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v474, CFSTR("isRecipe"));
                                                                              v659 = v517;
                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v659, &v658, 1);
                                                                              v518 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              v520 = 0;
                                                                              v45 = 0;
                                                                              *a4 = (id)objc_msgSend(v363, "initWithDomain:code:userInfo:", v364, 2);
                                                                              goto LABEL_415;
                                                                            }
                                                                            v520 = 0;
                                                                            v45 = 0;
                                                                            v56 = v613;
                                                                            v318 = v531;
                                                                            v362 = v519;
LABEL_409:
                                                                            v331 = v527;
LABEL_490:

                                                                            v354 = v521;
                                                                            goto LABEL_491;
                                                                          }
                                                                          if (a4)
                                                                          {
                                                                            v355 = a4;
                                                                            v356 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                            v357 = *MEMORY[0x1E0D025B8];
                                                                            v660 = *MEMORY[0x1E0CB2D50];
                                                                            v358 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                            v473 = objc_opt_class();
                                                                            v359 = v358;
                                                                            self = v593;
                                                                            v520 = (id)objc_msgSend(v359, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v473, CFSTR("isCoupon"));
                                                                            v661 = v520;
                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v661, &v660, 1);
                                                                            v360 = objc_claimAutoreleasedReturnValue();
                                                                            v361 = v357;
                                                                            v11 = v614;
                                                                            v522 = 0;
                                                                            v45 = 0;
                                                                            *v355 = (id)objc_msgSend(v356, "initWithDomain:code:userInfo:", v361, 2, v360);
                                                                            v362 = (void *)v360;
                                                                            v56 = v613;
                                                                            v318 = v531;
                                                                            goto LABEL_409;
                                                                          }
                                                                          v522 = 0;
                                                                          v45 = 0;
                                                                          v56 = v613;
                                                                          v318 = v531;
                                                                          v354 = v521;
LABEL_403:
                                                                          v331 = v527;
LABEL_491:

                                                                          goto LABEL_492;
                                                                        }
                                                                        if (a4)
                                                                        {
                                                                          v347 = a4;
                                                                          v348 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                          v349 = *MEMORY[0x1E0D025B8];
                                                                          v662 = *MEMORY[0x1E0CB2D50];
                                                                          v350 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                          v472 = objc_opt_class();
                                                                          v351 = v350;
                                                                          self = v593;
                                                                          v522 = (id)objc_msgSend(v351, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v472, CFSTR("containsChild"));
                                                                          v663 = v522;
                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v663, &v662, 1);
                                                                          v352 = objc_claimAutoreleasedReturnValue();
                                                                          v353 = v349;
                                                                          v11 = v614;
                                                                          v523 = 0;
                                                                          v45 = 0;
                                                                          *v347 = (id)objc_msgSend(v348, "initWithDomain:code:userInfo:", v353, 2, v352);
                                                                          v354 = (void *)v352;
                                                                          v56 = v613;
                                                                          v318 = v531;
                                                                          goto LABEL_403;
                                                                        }
                                                                        v523 = 0;
                                                                        v45 = 0;
LABEL_375:
                                                                        v56 = v613;
                                                                        v318 = v531;
                                                                        v331 = v527;
LABEL_492:

                                                                        goto LABEL_493;
                                                                      }
                                                                      if (a4)
                                                                      {
                                                                        v343 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                        v344 = *MEMORY[0x1E0D025B8];
                                                                        v664 = *MEMORY[0x1E0CB2D50];
                                                                        v345 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                        v471 = objc_opt_class();
                                                                        v346 = v345;
                                                                        self = v593;
                                                                        v523 = (id)objc_msgSend(v346, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v471, CFSTR("containsSibling"));
                                                                        v665 = v523;
                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v665, &v664, 1);
                                                                        v524 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        v525 = 0;
                                                                        v45 = 0;
                                                                        *a4 = (id)objc_msgSend(v343, "initWithDomain:code:userInfo:", v344, 2);
                                                                        goto LABEL_375;
                                                                      }
                                                                      v525 = 0;
                                                                      v45 = 0;
LABEL_369:
                                                                      v56 = v613;
                                                                      v318 = v531;
                                                                      v331 = v527;
LABEL_493:

                                                                      goto LABEL_494;
                                                                    }
                                                                    if (a4)
                                                                    {
                                                                      v339 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                      v340 = *MEMORY[0x1E0D025B8];
                                                                      v666 = *MEMORY[0x1E0CB2D50];
                                                                      v341 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                      v470 = objc_opt_class();
                                                                      v342 = v341;
                                                                      self = v593;
                                                                      v525 = (id)objc_msgSend(v342, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v470, CFSTR("containsParent"));
                                                                      v667 = v525;
                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v667, &v666, 1);
                                                                      v526 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      v528 = 0;
                                                                      v45 = 0;
                                                                      *a4 = (id)objc_msgSend(v339, "initWithDomain:code:userInfo:", v340, 2);
                                                                      goto LABEL_369;
                                                                    }
                                                                    v528 = 0;
                                                                    v45 = 0;
                                                                    v56 = v613;
                                                                    v318 = v531;
                                                                    v331 = v527;
LABEL_494:

                                                                    goto LABEL_495;
                                                                  }
                                                                  if (a4)
                                                                  {
                                                                    v334 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                    v335 = *MEMORY[0x1E0D025B8];
                                                                    v668 = *MEMORY[0x1E0CB2D50];
                                                                    v336 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                    v469 = objc_opt_class();
                                                                    v337 = v336;
                                                                    self = v593;
                                                                    v528 = (id)objc_msgSend(v337, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v469, CFSTR("containsPartner"));
                                                                    v669 = v528;
                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v669, &v668, 1);
                                                                    v529 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v338 = (id)objc_msgSend(v334, "initWithDomain:code:userInfo:", v335, 2);
                                                                    v331 = 0;
                                                                    v45 = 0;
                                                                    *a4 = v338;
                                                                    v56 = v613;
                                                                    v318 = v531;
                                                                    goto LABEL_494;
                                                                  }
                                                                  v331 = 0;
                                                                  v45 = 0;
LABEL_358:
                                                                  v56 = v613;
                                                                  v318 = v531;
LABEL_495:

                                                                  goto LABEL_496;
                                                                }
                                                                if (a4)
                                                                {
                                                                  v327 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                  v328 = *MEMORY[0x1E0D025B8];
                                                                  v670 = *MEMORY[0x1E0CB2D50];
                                                                  v329 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                  v468 = objc_opt_class();
                                                                  v330 = v329;
                                                                  self = v593;
                                                                  v331 = (void *)objc_msgSend(v330, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v468, CFSTR("containsFriends"));
                                                                  v671 = v331;
                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v671, &v670, 1);
                                                                  v332 = objc_claimAutoreleasedReturnValue();
                                                                  v333 = v328;
                                                                  v11 = v614;
                                                                  v530 = (void *)v332;
                                                                  v532 = 0;
                                                                  v45 = 0;
                                                                  *a4 = (id)objc_msgSend(v327, "initWithDomain:code:userInfo:", v333, 2);
                                                                  goto LABEL_358;
                                                                }
                                                                v532 = 0;
                                                                v45 = 0;
                                                                v56 = v613;
                                                                v318 = v531;
LABEL_496:

                                                                goto LABEL_497;
                                                              }
                                                              if (a4)
                                                              {
                                                                v320 = a4;
                                                                v535 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                v321 = *MEMORY[0x1E0D025B8];
                                                                v672 = *MEMORY[0x1E0CB2D50];
                                                                v322 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                v318 = v210;
                                                                v467 = objc_opt_class();
                                                                v323 = v322;
                                                                self = v593;
                                                                v532 = (id)objc_msgSend(v323, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v467, CFSTR("containsFamily"));
                                                                v673 = v532;
                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v673, &v672, 1);
                                                                v324 = objc_claimAutoreleasedReturnValue();
                                                                v325 = v321;
                                                                v11 = v614;
                                                                v533 = (void *)v324;
                                                                v326 = (id)objc_msgSend(v535, "initWithDomain:code:userInfo:", v325, 2);
                                                                v534 = 0;
                                                                v45 = 0;
                                                                *v320 = v326;
                                                                v56 = v613;
                                                                goto LABEL_496;
                                                              }
                                                              v534 = 0;
                                                              v45 = 0;
                                                              v56 = v613;
                                                              v318 = v210;
LABEL_497:
                                                              v280 = v542;

                                                              a4 = v608;
                                                              goto LABEL_498;
                                                            }
                                                            if (a4)
                                                            {
                                                              v313 = a4;
                                                              v314 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                              v315 = *MEMORY[0x1E0D025B8];
                                                              v674 = *MEMORY[0x1E0CB2D50];
                                                              v316 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                              v466 = objc_opt_class();
                                                              v317 = v316;
                                                              self = v593;
                                                              v534 = (id)objc_msgSend(v317, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v466, CFSTR("containsCoWorker"));
                                                              v675 = v534;
                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v675, &v674, 1);
                                                              v318 = (void *)objc_claimAutoreleasedReturnValue();
                                                              v319 = v315;
                                                              v11 = v614;
                                                              v536 = 0;
                                                              v45 = 0;
                                                              *v313 = (id)objc_msgSend(v314, "initWithDomain:code:userInfo:", v319, 2, v318);
                                                              v56 = v613;
                                                              goto LABEL_497;
                                                            }
                                                            v536 = 0;
                                                            v45 = 0;
                                                            v56 = v613;
                                                            a4 = v608;
LABEL_342:
                                                            v280 = v542;
LABEL_498:

                                                            goto LABEL_499;
                                                          }
                                                          if (a4)
                                                          {
                                                            v306 = a4;
                                                            v307 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v308 = *MEMORY[0x1E0D025B8];
                                                            v676 = *MEMORY[0x1E0CB2D50];
                                                            v309 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                            v465 = objc_opt_class();
                                                            v310 = v309;
                                                            self = v593;
                                                            a4 = v608;
                                                            v536 = (id)objc_msgSend(v310, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v465, CFSTR("containsMyPet"));
                                                            v677 = v536;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v677, &v676, 1);
                                                            v311 = objc_claimAutoreleasedReturnValue();
                                                            v312 = v308;
                                                            v11 = v614;
                                                            v537 = (void *)v311;
                                                            v538 = 0;
                                                            v45 = 0;
                                                            *v306 = (id)objc_msgSend(v307, "initWithDomain:code:userInfo:", v312, 2);
                                                            v56 = v613;
                                                            goto LABEL_342;
                                                          }
                                                          v538 = 0;
                                                          v45 = 0;
                                                          v56 = v613;
                                                          a4 = v608;
LABEL_336:
                                                          v280 = v542;
LABEL_499:

                                                          goto LABEL_500;
                                                        }
                                                        if (a4)
                                                        {
                                                          v299 = a4;
                                                          v300 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                          v301 = *MEMORY[0x1E0D025B8];
                                                          v678 = *MEMORY[0x1E0CB2D50];
                                                          v302 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                          v464 = objc_opt_class();
                                                          v303 = v302;
                                                          self = v593;
                                                          a4 = v608;
                                                          v538 = (id)objc_msgSend(v303, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v464, CFSTR("containsSocialGroup"));
                                                          v679 = v538;
                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v679, &v678, 1);
                                                          v304 = objc_claimAutoreleasedReturnValue();
                                                          v305 = v301;
                                                          v11 = v614;
                                                          v539 = (void *)v304;
                                                          v540 = 0;
                                                          v45 = 0;
                                                          *v299 = (id)objc_msgSend(v300, "initWithDomain:code:userInfo:", v305, 2);
                                                          v56 = v613;
                                                          goto LABEL_336;
                                                        }
                                                        v540 = 0;
                                                        v45 = 0;
                                                        v56 = v613;
                                                        a4 = v608;
LABEL_330:
                                                        v280 = v542;
LABEL_500:

                                                        goto LABEL_501;
                                                      }
                                                      if (a4)
                                                      {
                                                        v292 = a4;
                                                        v293 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                        v294 = *MEMORY[0x1E0D025B8];
                                                        v680 = *MEMORY[0x1E0CB2D50];
                                                        v295 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                        v463 = objc_opt_class();
                                                        v296 = v295;
                                                        self = v593;
                                                        a4 = v608;
                                                        v540 = (id)objc_msgSend(v296, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v463, CFSTR("containsBaby"));
                                                        v681 = v540;
                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v681, &v680, 1);
                                                        v297 = objc_claimAutoreleasedReturnValue();
                                                        v298 = v294;
                                                        v11 = v614;
                                                        v541 = (void *)v297;
                                                        v543 = 0;
                                                        v45 = 0;
                                                        *v292 = (id)objc_msgSend(v293, "initWithDomain:code:userInfo:", v298, 2);
                                                        v56 = v613;
                                                        goto LABEL_330;
                                                      }
                                                      v543 = 0;
                                                      v45 = 0;
                                                      v56 = v613;
                                                      a4 = v608;
                                                      v280 = v542;
LABEL_501:

                                                      goto LABEL_502;
                                                    }
                                                    if (a4)
                                                    {
                                                      v284 = a4;
                                                      v285 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                      v286 = *MEMORY[0x1E0D025B8];
                                                      v682 = *MEMORY[0x1E0CB2D50];
                                                      v287 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                      v462 = objc_opt_class();
                                                      v288 = v287;
                                                      self = v593;
                                                      a4 = v608;
                                                      v543 = (id)objc_msgSend(v288, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v462, CFSTR("userHasPet"));
                                                      v683 = v543;
                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v683, &v682, 1);
                                                      v289 = objc_claimAutoreleasedReturnValue();
                                                      v290 = v286;
                                                      v11 = v614;
                                                      v544 = (void *)v289;
                                                      v291 = (id)objc_msgSend(v285, "initWithDomain:code:userInfo:", v290, 2);
                                                      v280 = 0;
                                                      v45 = 0;
                                                      *v284 = v291;
                                                      v56 = v613;
                                                      goto LABEL_501;
                                                    }
                                                    v280 = 0;
                                                    v45 = 0;
                                                    v56 = v613;
                                                    a4 = v608;
LABEL_502:

                                                    goto LABEL_503;
                                                  }
                                                  if (a4)
                                                  {
                                                    v276 = a4;
                                                    v547 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                    v277 = *MEMORY[0x1E0D025B8];
                                                    v684 = *MEMORY[0x1E0CB2D50];
                                                    v278 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                    v461 = objc_opt_class();
                                                    v279 = v278;
                                                    self = v593;
                                                    a4 = v608;
                                                    v280 = (void *)objc_msgSend(v279, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v461, CFSTR("userHasHome"));
                                                    v685 = v280;
                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v685, &v684, 1);
                                                    v281 = objc_claimAutoreleasedReturnValue();
                                                    v282 = v277;
                                                    v11 = v614;
                                                    v545 = (void *)v281;
                                                    v283 = (id)objc_msgSend(v547, "initWithDomain:code:userInfo:", v282, 2);
                                                    v546 = 0;
                                                    v45 = 0;
                                                    *v276 = v283;
                                                    v56 = v613;
                                                    goto LABEL_502;
                                                  }
                                                  v546 = 0;
                                                  v45 = 0;
                                                  v56 = v613;
                                                  a4 = v608;
LABEL_503:
                                                  v249 = v549;

                                                  goto LABEL_504;
                                                }
                                                if (a4)
                                                {
                                                  v265 = a4;
                                                  v266 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v267 = *MEMORY[0x1E0D025B8];
                                                  v686 = *MEMORY[0x1E0CB2D50];
                                                  v268 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                  v460 = objc_opt_class();
                                                  v269 = v268;
                                                  self = v593;
                                                  a4 = v608;
                                                  v546 = (id)objc_msgSend(v269, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v460, CFSTR("userHasVIP"));
                                                  v687 = v546;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v687, &v686, 1);
                                                  v270 = objc_claimAutoreleasedReturnValue();
                                                  v271 = v267;
                                                  v11 = v614;
                                                  v548 = (void *)v270;
                                                  v550 = 0;
                                                  v45 = 0;
                                                  *v265 = (id)objc_msgSend(v266, "initWithDomain:code:userInfo:", v271, 2);
                                                  v56 = v613;
                                                  goto LABEL_503;
                                                }
                                                v550 = 0;
                                                v45 = 0;
                                                v56 = v613;
                                                a4 = v608;
                                                v249 = v549;
LABEL_504:

                                                goto LABEL_505;
                                              }
                                              if (a4)
                                              {
                                                v253 = a4;
                                                v254 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v255 = *MEMORY[0x1E0D025B8];
                                                v688 = *MEMORY[0x1E0CB2D50];
                                                v256 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                v459 = objc_opt_class();
                                                v257 = v256;
                                                self = v593;
                                                a4 = v608;
                                                v550 = (id)objc_msgSend(v257, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v459, CFSTR("userNumFavorites"));
                                                v689 = v550;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v689, &v688, 1);
                                                v258 = objc_claimAutoreleasedReturnValue();
                                                v259 = v255;
                                                v11 = v614;
                                                v551 = (void *)v258;
                                                v260 = (id)objc_msgSend(v254, "initWithDomain:code:userInfo:", v259, 2);
                                                v249 = 0;
                                                v45 = 0;
                                                *v253 = v260;
                                                v56 = v613;
                                                goto LABEL_504;
                                              }
                                              v249 = 0;
                                              v45 = 0;
                                              v56 = v613;
                                              a4 = v608;
LABEL_505:

                                              goto LABEL_506;
                                            }
                                            if (a4)
                                            {
                                              v245 = a4;
                                              v554 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v246 = *MEMORY[0x1E0D025B8];
                                              v690 = *MEMORY[0x1E0CB2D50];
                                              v247 = objc_alloc(MEMORY[0x1E0CB3940]);
                                              v458 = objc_opt_class();
                                              v248 = v247;
                                              self = v593;
                                              a4 = v608;
                                              v249 = (void *)objc_msgSend(v248, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v458, CFSTR("userNumVIPPeople"));
                                              v691 = v249;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v691, &v690, 1);
                                              v250 = objc_claimAutoreleasedReturnValue();
                                              v251 = v246;
                                              v11 = v614;
                                              v552 = (void *)v250;
                                              v252 = (id)objc_msgSend(v554, "initWithDomain:code:userInfo:", v251, 2);
                                              v553 = 0;
                                              v45 = 0;
                                              *v245 = v252;
                                              v56 = v613;
                                              goto LABEL_505;
                                            }
                                            v553 = 0;
                                            v45 = 0;
                                            v56 = v613;
                                            a4 = v608;
LABEL_506:
                                            v173 = v562;

                                            goto LABEL_507;
                                          }
                                          if (a4)
                                          {
                                            v238 = a4;
                                            v239 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v240 = *MEMORY[0x1E0D025B8];
                                            v692 = *MEMORY[0x1E0CB2D50];
                                            v241 = objc_alloc(MEMORY[0x1E0CB3940]);
                                            v457 = objc_opt_class();
                                            v242 = v241;
                                            self = v593;
                                            a4 = v608;
                                            v553 = (id)objc_msgSend(v242, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v457, CFSTR("userNumTrips"));
                                            v693 = v553;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v693, &v692, 1);
                                            v243 = objc_claimAutoreleasedReturnValue();
                                            v244 = v240;
                                            v11 = v614;
                                            v555 = (void *)v243;
                                            v556 = 0;
                                            v45 = 0;
                                            *v238 = (id)objc_msgSend(v239, "initWithDomain:code:userInfo:", v244, 2);
                                            v56 = v613;
                                            goto LABEL_506;
                                          }
                                          v556 = 0;
                                          v45 = 0;
LABEL_288:
                                          v56 = v613;
                                          a4 = v608;
                                          v173 = v562;
LABEL_507:

                                          goto LABEL_508;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v189 = v187;
                                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPhotosUserAnalyticsLibrarySizeTypeFromString(v189));
                                          v188 = (id)objc_claimAutoreleasedReturnValue();

                                          goto LABEL_164;
                                        }
                                        if (a4)
                                        {
                                          v274 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v275 = *MEMORY[0x1E0D025B8];
                                          v694 = *MEMORY[0x1E0CB2D50];
                                          v556 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userLibrarySize"));
                                          v695 = v556;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v695, &v694, 1);
                                          v557 = (void *)objc_claimAutoreleasedReturnValue();
                                          v558 = 0;
                                          v45 = 0;
                                          *a4 = (id)objc_msgSend(v274, "initWithDomain:code:userInfo:", v275, 2);
                                          v11 = v614;
                                          goto LABEL_288;
                                        }
                                        v558 = 0;
                                        v45 = 0;
LABEL_313:
                                        v11 = v614;
                                        v56 = v613;
                                        a4 = v608;
                                        v173 = v562;
LABEL_508:

                                        goto LABEL_509;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v185 = v183;
                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPhotosUserAnalyticsAssetAgeTypeFromString(v185));
                                        v184 = (id)objc_claimAutoreleasedReturnValue();

                                        goto LABEL_156;
                                      }
                                      if (a4)
                                      {
                                        v272 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v273 = *MEMORY[0x1E0D025B8];
                                        v696 = *MEMORY[0x1E0CB2D50];
                                        v558 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("assetAge"));
                                        v697 = v558;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v697, &v696, 1);
                                        v559 = (void *)objc_claimAutoreleasedReturnValue();
                                        v560 = 0;
                                        v45 = 0;
                                        *a4 = (id)objc_msgSend(v272, "initWithDomain:code:userInfo:", v273, 2);
                                        goto LABEL_313;
                                      }
                                      v560 = 0;
                                      v45 = 0;
LABEL_307:
                                      v11 = v614;
                                      v56 = v613;
                                      a4 = v608;
                                      v173 = v562;
LABEL_509:

                                      goto LABEL_510;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v181 = v179;
                                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPhotosUserAnalyticsImportSourceTypeFromString(v181));
                                      v180 = (id)objc_claimAutoreleasedReturnValue();

                                      goto LABEL_147;
                                    }
                                    if (a4)
                                    {
                                      v263 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v264 = *MEMORY[0x1E0D025B8];
                                      v698 = *MEMORY[0x1E0CB2D50];
                                      v560 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("importSource"));
                                      v699 = v560;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v699, &v698, 1);
                                      v561 = (void *)objc_claimAutoreleasedReturnValue();
                                      v563 = 0;
                                      v45 = 0;
                                      *a4 = (id)objc_msgSend(v263, "initWithDomain:code:userInfo:", v264, 2);
                                      goto LABEL_307;
                                    }
                                    v563 = 0;
                                    v45 = 0;
                                    v56 = v613;
                                    a4 = v608;
                                    v173 = v562;
LABEL_510:

                                    goto LABEL_511;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v177 = v40;
                                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPhotosUserAnalyticsMediaTypeTypeFromString(v177));
                                    v147 = (id)objc_claimAutoreleasedReturnValue();

                                    goto LABEL_139;
                                  }
                                  if (a4)
                                  {
                                    v261 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v262 = *MEMORY[0x1E0D025B8];
                                    v700 = *MEMORY[0x1E0CB2D50];
                                    v563 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("mediaType"));
                                    v701 = v563;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v701, &v700, 1);
                                    v564 = (void *)objc_claimAutoreleasedReturnValue();
                                    v173 = 0;
                                    v45 = 0;
                                    *a4 = (id)objc_msgSend(v261, "initWithDomain:code:userInfo:", v262, 2);
                                    v11 = v614;
                                    v56 = v613;
                                    a4 = v608;
                                    goto LABEL_510;
                                  }
                                  v173 = 0;
                                  v45 = 0;
                                  v56 = v613;
                                  a4 = v608;
LABEL_511:

                                  goto LABEL_512;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v569 = v36;
                                  goto LABEL_49;
                                }
                                if (a4)
                                {
                                  v162 = a4;
                                  v570 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v163 = *MEMORY[0x1E0D025B8];
                                  v704 = *MEMORY[0x1E0CB2D50];
                                  v164 = objc_alloc(MEMORY[0x1E0CB3940]);
                                  v455 = objc_opt_class();
                                  v165 = v164;
                                  self = v593;
                                  a4 = v608;
                                  v112 = v590;
                                  v566 = (id)objc_msgSend(v165, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v455, CFSTR("isCapturedAtPrivateEvent"));
                                  v705 = v566;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v705, &v704, 1);
                                  v166 = objc_claimAutoreleasedReturnValue();
                                  v167 = v163;
                                  v11 = v614;
                                  v568 = (void *)v166;
                                  v168 = (id)objc_msgSend(v570, "initWithDomain:code:userInfo:", v167, 2);
                                  v569 = 0;
                                  v45 = 0;
                                  *v162 = v168;
                                  v56 = v613;
LABEL_513:

                                  goto LABEL_514;
                                }
                                v569 = 0;
                                v45 = 0;
                                v56 = v613;
                                a4 = v608;
                                v112 = v590;
LABEL_514:

                                goto LABEL_515;
                              }
                              if (a4)
                              {
                                v155 = a4;
                                v573 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v156 = *MEMORY[0x1E0D025B8];
                                v706 = *MEMORY[0x1E0CB2D50];
                                v157 = objc_alloc(MEMORY[0x1E0CB3940]);
                                v454 = objc_opt_class();
                                v158 = v157;
                                self = v593;
                                a4 = v608;
                                v112 = v590;
                                v569 = (id)objc_msgSend(v158, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v454, CFSTR("isCapturedOnWeekend"));
                                v707 = v569;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v707, &v706, 1);
                                v159 = objc_claimAutoreleasedReturnValue();
                                v160 = v156;
                                v11 = v614;
                                v571 = (void *)v159;
                                v161 = (id)objc_msgSend(v573, "initWithDomain:code:userInfo:", v160, 2);
                                v572 = 0;
                                v45 = 0;
                                *v155 = v161;
                                v56 = v613;
                                goto LABEL_514;
                              }
                              v572 = 0;
                              v45 = 0;
                              v56 = v613;
                              a4 = v608;
                              v112 = v590;
LABEL_515:

                              goto LABEL_516;
                            }
                            if (a4)
                            {
                              v148 = a4;
                              v576 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v149 = *MEMORY[0x1E0D025B8];
                              v708 = *MEMORY[0x1E0CB2D50];
                              v150 = objc_alloc(MEMORY[0x1E0CB3940]);
                              v453 = objc_opt_class();
                              v151 = v150;
                              self = v593;
                              a4 = v608;
                              v112 = v590;
                              v572 = (id)objc_msgSend(v151, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v453, CFSTR("isFavorite"));
                              v709 = v572;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v709, &v708, 1);
                              v152 = objc_claimAutoreleasedReturnValue();
                              v153 = v149;
                              v11 = v614;
                              v574 = (void *)v152;
                              v154 = (id)objc_msgSend(v576, "initWithDomain:code:userInfo:", v153, 2);
                              v575 = 0;
                              v45 = 0;
                              *v148 = v154;
                              v56 = v613;
                              goto LABEL_515;
                            }
                            v575 = 0;
                            v45 = 0;
                            v56 = v613;
                            a4 = v608;
                            v112 = v590;
LABEL_516:

                            goto LABEL_517;
                          }
                          if (a4)
                          {
                            v140 = a4;
                            v579 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v141 = *MEMORY[0x1E0D025B8];
                            v710 = *MEMORY[0x1E0CB2D50];
                            v142 = objc_alloc(MEMORY[0x1E0CB3940]);
                            v452 = objc_opt_class();
                            v143 = v142;
                            self = v593;
                            a4 = v608;
                            v112 = v590;
                            v575 = (id)objc_msgSend(v143, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v452, CFSTR("isScreenshot"));
                            v711 = v575;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v711, &v710, 1);
                            v144 = objc_claimAutoreleasedReturnValue();
                            v145 = v141;
                            v11 = v614;
                            v577 = (void *)v144;
                            v146 = (id)objc_msgSend(v579, "initWithDomain:code:userInfo:", v145, 2);
                            v578 = 0;
                            v45 = 0;
                            *v140 = v146;
                            v56 = v613;
                            goto LABEL_516;
                          }
                          v578 = 0;
                          v45 = 0;
                          v56 = v613;
                          a4 = v608;
                          v112 = v590;
LABEL_517:

                          goto LABEL_518;
                        }
                        if (a4)
                        {
                          v133 = a4;
                          v586 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v134 = *MEMORY[0x1E0D025B8];
                          v712 = *MEMORY[0x1E0CB2D50];
                          v135 = objc_alloc(MEMORY[0x1E0CB3940]);
                          v451 = objc_opt_class();
                          v136 = v135;
                          self = v593;
                          a4 = v608;
                          v112 = v590;
                          v578 = (id)objc_msgSend(v136, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v451, CFSTR("isMeme"));
                          v713 = v578;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v713, &v712, 1);
                          v137 = objc_claimAutoreleasedReturnValue();
                          v138 = v134;
                          v11 = v614;
                          v584 = (void *)v137;
                          v139 = (id)objc_msgSend(v586, "initWithDomain:code:userInfo:", v138, 2);
                          v585 = 0;
                          v45 = 0;
                          *v133 = v139;
                          v56 = v613;
                          goto LABEL_517;
                        }
                        v585 = 0;
                        v45 = 0;
                        v56 = v613;
                        a4 = v608;
                        v112 = v590;
LABEL_518:

                        goto LABEL_519;
                      }
                      if (a4)
                      {
                        v125 = a4;
                        v592 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v126 = *MEMORY[0x1E0D025B8];
                        v714 = *MEMORY[0x1E0CB2D50];
                        v582 = v10;
                        v127 = self;
                        v128 = objc_alloc(MEMORY[0x1E0CB3940]);
                        v450 = objc_opt_class();
                        v129 = v128;
                        self = v127;
                        a4 = v608;
                        v112 = v590;
                        v10 = v582;
                        v585 = (id)objc_msgSend(v129, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v450, CFSTR("isDocument"));
                        v715 = v585;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v715, &v714, 1);
                        v130 = objc_claimAutoreleasedReturnValue();
                        v131 = v126;
                        v11 = v614;
                        v587 = (void *)v130;
                        v132 = (id)objc_msgSend(v592, "initWithDomain:code:userInfo:", v131, 2);
                        v591 = 0;
                        v45 = 0;
                        *v125 = v132;
                        v56 = v613;
                        goto LABEL_518;
                      }
                      v591 = 0;
                      v45 = 0;
                      v56 = v613;
                      a4 = v608;
                      v112 = v590;
LABEL_519:

                      goto LABEL_520;
                    }
                    if (a4)
                    {
                      v116 = a4;
                      v117 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v118 = *MEMORY[0x1E0D025B8];
                      v716 = *MEMORY[0x1E0CB2D50];
                      v581 = v10;
                      v119 = self;
                      v120 = objc_alloc(MEMORY[0x1E0CB3940]);
                      v449 = objc_opt_class();
                      v121 = v120;
                      self = v119;
                      a4 = v608;
                      v10 = v581;
                      v591 = (id)objc_msgSend(v121, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v449, CFSTR("capturedOnShortTrip"));
                      v717 = v591;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v717, &v716, 1);
                      v122 = objc_claimAutoreleasedReturnValue();
                      v123 = v118;
                      v11 = v614;
                      v595 = (void *)v122;
                      v124 = (id)objc_msgSend(v117, "initWithDomain:code:userInfo:", v123, 2);
                      v112 = 0;
                      v45 = 0;
                      *v116 = v124;
                      v56 = v613;
                      goto LABEL_519;
                    }
                    v112 = 0;
                    v45 = 0;
                    v56 = v613;
                    a4 = v608;
LABEL_520:

                    v9 = v620;
                    goto LABEL_521;
                  }
                  if (a4)
                  {
                    v603 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v108 = *MEMORY[0x1E0D025B8];
                    v718 = *MEMORY[0x1E0CB2D50];
                    v580 = v10;
                    v109 = self;
                    v110 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v448 = objc_opt_class();
                    v111 = v110;
                    self = v109;
                    v10 = v580;
                    v112 = (void *)objc_msgSend(v111, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v448, CFSTR("capturedOnTrip"));
                    v719 = v112;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v719, &v718, 1);
                    v113 = objc_claimAutoreleasedReturnValue();
                    v114 = v108;
                    v11 = v614;
                    v598 = (void *)v113;
                    v115 = (id)objc_msgSend(v603, "initWithDomain:code:userInfo:", v114, 2);
                    v602 = 0;
                    v45 = 0;
                    *a4 = v115;
                    a4 = v608;
                    v56 = v613;
                    goto LABEL_520;
                  }
                  v602 = 0;
                  v45 = 0;
                  v56 = v613;
                  v9 = v620;
                  a4 = v608;
LABEL_521:

                  goto LABEL_522;
                }
                if (a4)
                {
                  v606 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v100 = *MEMORY[0x1E0D025B8];
                  v720 = *MEMORY[0x1E0CB2D50];
                  v588 = v8;
                  v101 = v10;
                  v102 = self;
                  v103 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v447 = objc_opt_class();
                  v104 = v103;
                  self = v102;
                  v9 = v620;
                  v10 = v101;
                  v8 = v588;
                  v602 = (id)objc_msgSend(v104, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v447, CFSTR("capturedAtFrequentLocation"));
                  v721 = v602;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v721, &v720, 1);
                  v105 = objc_claimAutoreleasedReturnValue();
                  v106 = v100;
                  v11 = v614;
                  v604 = (void *)v105;
                  v107 = (id)objc_msgSend(v606, "initWithDomain:code:userInfo:", v106, 2);
                  v605 = 0;
                  v45 = 0;
                  *a4 = v107;
                  a4 = v608;
                  v56 = v613;
                  goto LABEL_521;
                }
                v605 = 0;
                v45 = 0;
                v56 = v613;
                v9 = v620;
                a4 = v608;
LABEL_522:

                goto LABEL_523;
              }
              if (a4)
              {
                v610 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v91 = *MEMORY[0x1E0D025B8];
                v722 = *MEMORY[0x1E0CB2D50];
                v596 = v7;
                v92 = v8;
                v93 = v10;
                v94 = self;
                v95 = objc_alloc(MEMORY[0x1E0CB3940]);
                v446 = objc_opt_class();
                v96 = v95;
                self = v94;
                v9 = v620;
                v10 = v93;
                v8 = v92;
                v7 = v596;
                v605 = (id)objc_msgSend(v96, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v446, CFSTR("capturedAtWork"));
                v723 = v605;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v723, &v722, 1);
                v97 = objc_claimAutoreleasedReturnValue();
                v98 = v91;
                v11 = v614;
                v607 = (void *)v97;
                v99 = (id)objc_msgSend(v610, "initWithDomain:code:userInfo:", v98, 2);
                v609 = 0;
                v45 = 0;
                *a4 = v99;
                a4 = v608;
                v56 = v613;
                goto LABEL_522;
              }
              v609 = 0;
              v45 = 0;
              v56 = v613;
              v9 = v620;
              a4 = v608;
LABEL_523:

              goto LABEL_524;
            }
            if (a4)
            {
              v81 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v82 = *MEMORY[0x1E0D025B8];
              v724 = *MEMORY[0x1E0CB2D50];
              v599 = v6;
              v83 = v7;
              v84 = v8;
              v85 = v10;
              v86 = self;
              v87 = objc_alloc(MEMORY[0x1E0CB3940]);
              v445 = objc_opt_class();
              v88 = v87;
              self = v86;
              v9 = v620;
              v10 = v85;
              v8 = v84;
              v7 = v83;
              v6 = v599;
              v609 = (id)objc_msgSend(v88, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v445, CFSTR("capturedAtHome"));
              v725 = v609;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v725, &v724, 1);
              v89 = objc_claimAutoreleasedReturnValue();
              v90 = v82;
              v11 = v614;
              v611 = (void *)v89;
              v45 = 0;
              *a4 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v90, 2);
              a4 = 0;
              v56 = v613;
              goto LABEL_523;
            }
            v45 = 0;
            v56 = v613;
            v9 = v620;
LABEL_524:

            goto LABEL_525;
          }
          if (a4)
          {
            v616 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v69 = *MEMORY[0x1E0D025B8];
            v726 = *MEMORY[0x1E0CB2D50];
            v70 = v6;
            v71 = v7;
            v72 = v8;
            v73 = v10;
            v74 = self;
            v75 = objc_alloc(MEMORY[0x1E0CB3940]);
            v444 = objc_opt_class();
            v76 = v75;
            self = v74;
            v9 = v620;
            v10 = v73;
            v8 = v72;
            v7 = v71;
            v6 = v70;
            v77 = (id *)objc_msgSend(v76, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v444, CFSTR("containsPets"));
            v727 = v77;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v727, &v726, 1);
            v78 = objc_claimAutoreleasedReturnValue();
            v79 = v69;
            v11 = v614;
            v612 = (void *)v78;
            v80 = (id)objc_msgSend(v616, "initWithDomain:code:userInfo:", v79, 2);
            v615 = 0;
            v45 = 0;
            *a4 = v80;
            a4 = v77;
            v56 = v613;
            goto LABEL_524;
          }
          v615 = 0;
          v45 = 0;
          v56 = v613;
          v9 = v620;
LABEL_525:

          goto LABEL_526;
        }
        v56 = v12;
        if (a4)
        {
          v622 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v619 = *MEMORY[0x1E0D025B8];
          v728 = *MEMORY[0x1E0CB2D50];
          v59 = v6;
          v60 = v7;
          v61 = v8;
          v62 = v10;
          v63 = self;
          v64 = objc_alloc(MEMORY[0x1E0CB3940]);
          v443 = objc_opt_class();
          v65 = v64;
          self = v63;
          v9 = v620;
          v10 = v62;
          v8 = v61;
          v7 = v60;
          v6 = v59;
          v11 = v614;
          v615 = (id)objc_msgSend(v65, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v443, CFSTR("faceCount"));
          v729 = v615;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v729, &v728, 1);
          v66 = objc_claimAutoreleasedReturnValue();
          v67 = v619;
          v617 = (void *)v66;
          v68 = (id)objc_msgSend(v622, "initWithDomain:code:userInfo:", v67, 2);
          v621 = 0;
          v45 = 0;
          *a4 = v68;
          goto LABEL_525;
        }
        v621 = 0;
        v45 = 0;
        v9 = v620;
LABEL_526:

        goto LABEL_527;
      }
      if (a4)
      {
        v50 = a4;
        v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v594 = self;
        v52 = *MEMORY[0x1E0D025B8];
        v730 = *MEMORY[0x1E0CB2D50];
        v53 = v10;
        v618 = v50;
        v54 = objc_alloc(MEMORY[0x1E0CB3940]);
        v442 = objc_opt_class();
        v55 = v54;
        v10 = v53;
        v621 = (id)objc_msgSend(v55, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v442, CFSTR("containsVIP"));
        v731 = v621;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v731, &v730, 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v52;
        self = v594;
        v58 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v57, 2, v56);
        v11 = 0;
        v45 = 0;
        *v618 = v58;
        goto LABEL_526;
      }
      v11 = 0;
      v45 = 0;
LABEL_527:

      goto LABEL_528;
    }
    if (a4)
    {
      v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v47 = *MEMORY[0x1E0D025B8];
      v732 = *MEMORY[0x1E0CB2D50];
      v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("userEvent"));
      v733 = v48;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v733, &v732, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v47;
      v11 = (id)v48;
      v9 = 0;
      v45 = 0;
      *a4 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v49, 2, v10);
      goto LABEL_527;
    }
    v9 = 0;
    v45 = 0;
LABEL_528:

    goto LABEL_529;
  }
  if (a4)
  {
    v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v42 = *MEMORY[0x1E0D025B8];
    v734 = *MEMORY[0x1E0CB2D50];
    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
    v735[0] = v43;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v735, &v734, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v41;
    v9 = (id)v43;
    v623 = 0;
    v45 = 0;
    *a4 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v42, 2, v8);
    goto LABEL_528;
  }
  v623 = 0;
  v45 = 0;
LABEL_529:

  return v45;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
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
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
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
  id v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  void *v127;
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
  void *v161;
  void *v162;
  void *v163;
  void *v164;
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
  _QWORD v175[56];
  _QWORD v176[58];

  v176[56] = *MEMORY[0x1E0C80C00];
  -[BMPhotosUserAnalytics identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMPhotosUserAnalytics userEvent](self, "userEvent");
  v4 = objc_claimAutoreleasedReturnValue();
  if (-[BMPhotosUserAnalytics hasContainsVIP](self, "hasContainsVIP"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsVIP](self, "containsVIP"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (-[BMPhotosUserAnalytics hasFaceCount](self, "hasFaceCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosUserAnalytics faceCount](self, "faceCount"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (-[BMPhotosUserAnalytics hasContainsPets](self, "hasContainsPets"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsPets](self, "containsPets"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (-[BMPhotosUserAnalytics hasCapturedAtHome](self, "hasCapturedAtHome"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedAtHome](self, "capturedAtHome"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (-[BMPhotosUserAnalytics hasCapturedAtWork](self, "hasCapturedAtWork"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedAtWork](self, "capturedAtWork"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (-[BMPhotosUserAnalytics hasCapturedAtFrequentLocation](self, "hasCapturedAtFrequentLocation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedAtFrequentLocation](self, "capturedAtFrequentLocation"));
    v174 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v174 = 0;
  }
  if (-[BMPhotosUserAnalytics hasCapturedOnTrip](self, "hasCapturedOnTrip"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedOnTrip](self, "capturedOnTrip"));
    v173 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v173 = 0;
  }
  if (-[BMPhotosUserAnalytics hasCapturedOnShortTrip](self, "hasCapturedOnShortTrip"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedOnShortTrip](self, "capturedOnShortTrip"));
    v172 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v172 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsDocument](self, "hasIsDocument"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isDocument](self, "isDocument"));
    v171 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v171 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsMeme](self, "hasIsMeme"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isMeme](self, "isMeme"));
    v170 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v170 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsScreenshot](self, "hasIsScreenshot"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isScreenshot](self, "isScreenshot"));
    v169 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v169 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsFavorite](self, "hasIsFavorite"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isFavorite](self, "isFavorite"));
    v168 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v168 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsCapturedOnWeekend](self, "hasIsCapturedOnWeekend"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isCapturedOnWeekend](self, "isCapturedOnWeekend"));
    v167 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v167 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsCapturedAtPrivateEvent](self, "hasIsCapturedAtPrivateEvent"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isCapturedAtPrivateEvent](self, "isCapturedAtPrivateEvent"));
    v166 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v166 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsCapturedOnHoliday](self, "hasIsCapturedOnHoliday"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isCapturedOnHoliday](self, "isCapturedOnHoliday"));
    v165 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v165 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosUserAnalytics mediaType](self, "mediaType"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosUserAnalytics importSource](self, "importSource"));
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosUserAnalytics assetAge](self, "assetAge"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosUserAnalytics userLibrarySize](self, "userLibrarySize"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMPhotosUserAnalytics hasUserNumTrips](self, "hasUserNumTrips"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosUserAnalytics userNumTrips](self, "userNumTrips"));
    v160 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v160 = 0;
  }
  if (-[BMPhotosUserAnalytics hasUserNumVIPPeople](self, "hasUserNumVIPPeople"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosUserAnalytics userNumVIPPeople](self, "userNumVIPPeople"));
    v159 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v159 = 0;
  }
  if (-[BMPhotosUserAnalytics hasUserNumFavorites](self, "hasUserNumFavorites"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosUserAnalytics userNumFavorites](self, "userNumFavorites"));
    v158 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v158 = 0;
  }
  if (-[BMPhotosUserAnalytics hasUserHasVIP](self, "hasUserHasVIP"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics userHasVIP](self, "userHasVIP"));
    v157 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v157 = 0;
  }
  if (-[BMPhotosUserAnalytics hasUserHasHome](self, "hasUserHasHome"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics userHasHome](self, "userHasHome"));
    v156 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v156 = 0;
  }
  if (-[BMPhotosUserAnalytics hasUserHasPet](self, "hasUserHasPet"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics userHasPet](self, "userHasPet"));
    v155 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v155 = 0;
  }
  if (-[BMPhotosUserAnalytics hasContainsBaby](self, "hasContainsBaby"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsBaby](self, "containsBaby"));
    v154 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v154 = 0;
  }
  if (-[BMPhotosUserAnalytics hasContainsSocialGroup](self, "hasContainsSocialGroup"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsSocialGroup](self, "containsSocialGroup"));
    v153 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v153 = 0;
  }
  if (-[BMPhotosUserAnalytics hasContainsMyPet](self, "hasContainsMyPet"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsMyPet](self, "containsMyPet"));
    v152 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v152 = 0;
  }
  if (-[BMPhotosUserAnalytics hasContainsCoWorker](self, "hasContainsCoWorker"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsCoWorker](self, "containsCoWorker"));
    v151 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v151 = 0;
  }
  if (-[BMPhotosUserAnalytics hasContainsFamily](self, "hasContainsFamily"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsFamily](self, "containsFamily"));
    v150 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v150 = 0;
  }
  if (-[BMPhotosUserAnalytics hasContainsFriends](self, "hasContainsFriends"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsFriends](self, "containsFriends"));
    v149 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v149 = 0;
  }
  if (-[BMPhotosUserAnalytics hasContainsPartner](self, "hasContainsPartner"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsPartner](self, "containsPartner"));
    v148 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v148 = 0;
  }
  if (-[BMPhotosUserAnalytics hasContainsParent](self, "hasContainsParent"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsParent](self, "containsParent"));
    v147 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v147 = 0;
  }
  if (-[BMPhotosUserAnalytics hasContainsSibling](self, "hasContainsSibling"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsSibling](self, "containsSibling"));
    v146 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v146 = 0;
  }
  if (-[BMPhotosUserAnalytics hasContainsChild](self, "hasContainsChild"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics containsChild](self, "containsChild"));
    v145 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v145 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsCoupon](self, "hasIsCoupon"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isCoupon](self, "isCoupon"));
    v144 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v144 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsRecipe](self, "hasIsRecipe"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isRecipe](self, "isRecipe"));
    v143 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v143 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsReceipt](self, "hasIsReceipt"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isReceipt](self, "isReceipt"));
    v142 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v142 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsRecentView](self, "hasIsRecentView"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isRecentView](self, "isRecentView"));
    v141 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v141 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsRecentEdit](self, "hasIsRecentEdit"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isRecentEdit](self, "isRecentEdit"));
    v140 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v140 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsRecentShare](self, "hasIsRecentShare"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isRecentShare](self, "isRecentShare"));
    v139 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v139 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsRecentFavorite](self, "hasIsRecentFavorite"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isRecentFavorite](self, "isRecentFavorite"));
    v138 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v138 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsContainedInSharedAlbum](self, "hasIsContainedInSharedAlbum"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isContainedInSharedAlbum](self, "isContainedInSharedAlbum"));
    v137 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v137 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsContainedInOnThisDay](self, "hasIsContainedInOnThisDay"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isContainedInOnThisDay](self, "isContainedInOnThisDay"));
    v136 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v136 = 0;
  }
  if (-[BMPhotosUserAnalytics hasCapturedAtAOI](self, "hasCapturedAtAOI"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedAtAOI](self, "capturedAtAOI"));
    v135 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v135 = 0;
  }
  if (-[BMPhotosUserAnalytics hasCapturedAtPOI](self, "hasCapturedAtPOI"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedAtPOI](self, "capturedAtPOI"));
    v134 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v134 = 0;
  }
  if (-[BMPhotosUserAnalytics hasCapturedAtROI](self, "hasCapturedAtROI"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedAtROI](self, "capturedAtROI"));
    v133 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v133 = 0;
  }
  if (-[BMPhotosUserAnalytics hasCapturedAtBusiness](self, "hasCapturedAtBusiness"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics capturedAtBusiness](self, "capturedAtBusiness"));
    v132 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v132 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsCapturedAtPublicEvent](self, "hasIsCapturedAtPublicEvent"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isCapturedAtPublicEvent](self, "isCapturedAtPublicEvent"));
    v131 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v131 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsContainedInVisualTrend](self, "hasIsContainedInVisualTrend"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isContainedInVisualTrend](self, "isContainedInVisualTrend"));
    v130 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v130 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsContainedInActivity](self, "hasIsContainedInActivity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isContainedInActivity](self, "isContainedInActivity"));
    v129 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v129 = 0;
  }
  if (-[BMPhotosUserAnalytics hasIsContainedInChildActivity](self, "hasIsContainedInChildActivity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosUserAnalytics isContainedInChildActivity](self, "isContainedInChildActivity"));
    v128 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v128 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosUserAnalytics userLibraryAgeInDays](self, "userLibraryAgeInDays"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMPhotosUserAnalytics hasUserisDAU](self, "hasUserisDAU")
    || (-[BMPhotosUserAnalytics userisDAU](self, "userisDAU"), fabs(v10) == INFINITY))
  {
    v126 = 0;
  }
  else
  {
    -[BMPhotosUserAnalytics userisDAU](self, "userisDAU");
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[BMPhotosUserAnalytics userisDAU](self, "userisDAU");
    objc_msgSend(v11, "numberWithDouble:");
    v126 = (id)objc_claimAutoreleasedReturnValue();

  }
  v175[0] = CFSTR("identifier");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v117 = (void *)v12;
  v176[0] = v12;
  v175[1] = CFSTR("userEvent");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v116 = (void *)v13;
  v176[1] = v13;
  v175[2] = CFSTR("containsVIP");
  v14 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v115 = (void *)v14;
  v176[2] = v14;
  v175[3] = CFSTR("faceCount");
  v15 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v114 = (void *)v15;
  v176[3] = v15;
  v175[4] = CFSTR("containsPets");
  v16 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v113 = (void *)v16;
  v176[4] = v16;
  v175[5] = CFSTR("capturedAtHome");
  v17 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v112 = (void *)v17;
  v176[5] = v17;
  v175[6] = CFSTR("capturedAtWork");
  v18 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v111 = (void *)v18;
  v176[6] = v18;
  v175[7] = CFSTR("capturedAtFrequentLocation");
  v19 = (uint64_t)v174;
  if (!v174)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v176[7] = v19;
  v175[8] = CFSTR("capturedOnTrip");
  v20 = v173;
  if (!v173)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v176[8] = v20;
  v175[9] = CFSTR("capturedOnShortTrip");
  v21 = v172;
  if (!v172)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v176[9] = v21;
  v175[10] = CFSTR("isDocument");
  v22 = (uint64_t)v171;
  if (!v171)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v119 = v9;
  v109 = (void *)v22;
  v176[10] = v22;
  v175[11] = CFSTR("isMeme");
  v23 = (uint64_t)v170;
  if (!v170)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v3;
  v120 = (void *)v23;
  v176[11] = v23;
  v175[12] = CFSTR("isScreenshot");
  v25 = (uint64_t)v169;
  if (!v169)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v25;
  v176[12] = v25;
  v175[13] = CFSTR("isFavorite");
  v27 = (uint64_t)v168;
  if (!v168)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v108 = (void *)v27;
  v176[13] = v27;
  v175[14] = CFSTR("isCapturedOnWeekend");
  v28 = (uint64_t)v167;
  if (!v167)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v107 = (void *)v28;
  v176[14] = v28;
  v175[15] = CFSTR("isCapturedAtPrivateEvent");
  v29 = (uint64_t)v166;
  if (!v166)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v106 = (void *)v29;
  v176[15] = v29;
  v175[16] = CFSTR("isCapturedOnHoliday");
  v30 = (uint64_t)v165;
  if (!v165)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v105 = (void *)v30;
  v176[16] = v30;
  v175[17] = CFSTR("mediaType");
  v31 = (uint64_t)v164;
  if (!v164)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v104 = (void *)v31;
  v176[17] = v31;
  v175[18] = CFSTR("importSource");
  v32 = (uint64_t)v163;
  if (!v163)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v103 = (void *)v32;
  v176[18] = v32;
  v175[19] = CFSTR("assetAge");
  v33 = (uint64_t)v162;
  if (!v162)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v102 = (void *)v33;
  v176[19] = v33;
  v175[20] = CFSTR("userLibrarySize");
  v34 = (uint64_t)v161;
  if (!v161)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v101 = (void *)v34;
  v176[20] = v34;
  v175[21] = CFSTR("userNumTrips");
  v35 = (uint64_t)v160;
  if (!v160)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v100 = (void *)v35;
  v176[21] = v35;
  v175[22] = CFSTR("userNumVIPPeople");
  v36 = (uint64_t)v159;
  if (!v159)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v99 = (void *)v36;
  v176[22] = v36;
  v175[23] = CFSTR("userNumFavorites");
  v37 = (uint64_t)v158;
  if (!v158)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v98 = (void *)v37;
  v176[23] = v37;
  v175[24] = CFSTR("userHasVIP");
  v38 = (uint64_t)v157;
  if (!v157)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = objc_claimAutoreleasedReturnValue();
  }
  v97 = (void *)v38;
  v176[24] = v38;
  v175[25] = CFSTR("userHasHome");
  v39 = (uint64_t)v156;
  if (!v156)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = objc_claimAutoreleasedReturnValue();
  }
  v96 = (void *)v39;
  v176[25] = v39;
  v175[26] = CFSTR("userHasPet");
  v40 = (uint64_t)v155;
  if (!v155)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v95 = (void *)v40;
  v176[26] = v40;
  v175[27] = CFSTR("containsBaby");
  v41 = (uint64_t)v154;
  if (!v154)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = objc_claimAutoreleasedReturnValue();
  }
  v94 = (void *)v41;
  v176[27] = v41;
  v175[28] = CFSTR("containsSocialGroup");
  v42 = (uint64_t)v153;
  if (!v153)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v93 = (void *)v42;
  v176[28] = v42;
  v175[29] = CFSTR("containsMyPet");
  v43 = (uint64_t)v152;
  if (!v152)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  v92 = (void *)v43;
  v176[29] = v43;
  v175[30] = CFSTR("containsCoWorker");
  v44 = (uint64_t)v151;
  if (!v151)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v44 = objc_claimAutoreleasedReturnValue();
  }
  v91 = (void *)v44;
  v176[30] = v44;
  v175[31] = CFSTR("containsFamily");
  v45 = (uint64_t)v150;
  if (!v150)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v45 = objc_claimAutoreleasedReturnValue();
  }
  v90 = (void *)v45;
  v176[31] = v45;
  v175[32] = CFSTR("containsFriends");
  v46 = (uint64_t)v149;
  if (!v149)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v46 = objc_claimAutoreleasedReturnValue();
  }
  v89 = (void *)v46;
  v176[32] = v46;
  v175[33] = CFSTR("containsPartner");
  v47 = (uint64_t)v148;
  if (!v148)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v47 = objc_claimAutoreleasedReturnValue();
  }
  v88 = (void *)v47;
  v176[33] = v47;
  v175[34] = CFSTR("containsParent");
  v48 = (uint64_t)v147;
  if (!v147)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v48 = objc_claimAutoreleasedReturnValue();
  }
  v87 = (void *)v48;
  v176[34] = v48;
  v175[35] = CFSTR("containsSibling");
  v49 = (uint64_t)v146;
  if (!v146)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v49 = objc_claimAutoreleasedReturnValue();
  }
  v86 = (void *)v49;
  v176[35] = v49;
  v175[36] = CFSTR("containsChild");
  v50 = (uint64_t)v145;
  if (!v145)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v50 = objc_claimAutoreleasedReturnValue();
  }
  v85 = (void *)v50;
  v176[36] = v50;
  v175[37] = CFSTR("isCoupon");
  v51 = (uint64_t)v144;
  if (!v144)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v51 = objc_claimAutoreleasedReturnValue();
  }
  v84 = (void *)v51;
  v176[37] = v51;
  v175[38] = CFSTR("isRecipe");
  v52 = (uint64_t)v143;
  if (!v143)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v52 = objc_claimAutoreleasedReturnValue();
  }
  v83 = (void *)v52;
  v176[38] = v52;
  v175[39] = CFSTR("isReceipt");
  v53 = (uint64_t)v142;
  if (!v142)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v53 = objc_claimAutoreleasedReturnValue();
  }
  v82 = (void *)v53;
  v176[39] = v53;
  v175[40] = CFSTR("isRecentView");
  v54 = (uint64_t)v141;
  if (!v141)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v54 = objc_claimAutoreleasedReturnValue();
  }
  v81 = (void *)v54;
  v176[40] = v54;
  v175[41] = CFSTR("isRecentEdit");
  v55 = (uint64_t)v140;
  if (!v140)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v55 = objc_claimAutoreleasedReturnValue();
  }
  v80 = (void *)v55;
  v176[41] = v55;
  v175[42] = CFSTR("isRecentShare");
  v56 = (uint64_t)v139;
  if (!v139)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v56 = objc_claimAutoreleasedReturnValue();
  }
  v79 = (void *)v56;
  v176[42] = v56;
  v175[43] = CFSTR("isRecentFavorite");
  v57 = (uint64_t)v138;
  if (!v138)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v57 = objc_claimAutoreleasedReturnValue();
  }
  v78 = (void *)v57;
  v176[43] = v57;
  v175[44] = CFSTR("isContainedInSharedAlbum");
  v58 = (uint64_t)v137;
  if (!v137)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v58 = objc_claimAutoreleasedReturnValue();
  }
  v77 = (void *)v58;
  v176[44] = v58;
  v175[45] = CFSTR("isContainedInOnThisDay");
  v59 = (uint64_t)v136;
  if (!v136)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v59 = objc_claimAutoreleasedReturnValue();
  }
  v123 = v6;
  v76 = (void *)v59;
  v176[45] = v59;
  v175[46] = CFSTR("capturedAtAOI");
  v60 = (uint64_t)v135;
  if (!v135)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v60 = objc_claimAutoreleasedReturnValue();
  }
  v75 = (void *)v60;
  v176[46] = v60;
  v175[47] = CFSTR("capturedAtPOI");
  v61 = (uint64_t)v134;
  if (!v134)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v61 = objc_claimAutoreleasedReturnValue();
  }
  v125 = (void *)v4;
  v74 = (void *)v61;
  v176[47] = v61;
  v175[48] = CFSTR("capturedAtROI");
  v62 = (uint64_t)v133;
  if (!v133)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v62 = objc_claimAutoreleasedReturnValue();
  }
  v122 = v8;
  v73 = (void *)v62;
  v176[48] = v62;
  v175[49] = CFSTR("capturedAtBusiness");
  v63 = (uint64_t)v132;
  if (!v132)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v63 = objc_claimAutoreleasedReturnValue();
  }
  v124 = v5;
  v72 = (void *)v63;
  v176[49] = v63;
  v175[50] = CFSTR("isCapturedAtPublicEvent");
  v64 = v131;
  if (!v131)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v121 = v7;
  v176[50] = v64;
  v175[51] = CFSTR("isContainedInVisualTrend");
  v65 = v130;
  if (!v130)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v110 = (void *)v19;
  v176[51] = v65;
  v175[52] = CFSTR("isContainedInActivity");
  v66 = v129;
  if (!v129)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v176[52] = v66;
  v175[53] = CFSTR("isContainedInChildActivity");
  v67 = v128;
  if (!v128)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v176[53] = v67;
  v175[54] = CFSTR("userLibraryAgeInDays");
  v68 = v127;
  if (!v127)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v176[54] = v68;
  v175[55] = CFSTR("userisDAU");
  v69 = v126;
  if (!v126)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v176[55] = v69;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v176, v175, 56);
  v118 = (id)objc_claimAutoreleasedReturnValue();
  if (!v126)

  v70 = v26;
  if (!v127)
  {

    v70 = v26;
  }
  if (!v128)
  {

    v70 = v26;
  }
  if (!v129)
  {

    v70 = v26;
  }
  if (!v130)
  {

    v70 = v26;
  }
  if (!v131)
  {

    v70 = v26;
  }
  if (!v132)
  {

    v70 = v26;
  }
  if (!v133)
  {

    v70 = v26;
  }
  if (!v134)
  {

    v70 = v26;
  }
  if (!v135)
  {

    v70 = v26;
  }
  if (!v136)
  {

    v70 = v26;
  }
  if (!v137)
  {

    v70 = v26;
  }
  if (!v138)
  {

    v70 = v26;
  }
  if (!v139)
  {

    v70 = v26;
  }
  if (!v140)
  {

    v70 = v26;
  }
  if (!v141)
  {

    v70 = v26;
  }
  if (!v142)
  {

    v70 = v26;
  }
  if (!v143)
  {

    v70 = v26;
  }
  if (!v144)
  {

    v70 = v26;
  }
  if (!v145)
  {

    v70 = v26;
  }
  if (!v146)
  {

    v70 = v26;
  }
  if (!v147)
  {

    v70 = v26;
  }
  if (!v148)
  {

    v70 = v26;
  }
  if (!v149)
  {

    v70 = v26;
  }
  if (!v150)
  {

    v70 = v26;
  }
  if (!v151)
  {

    v70 = v26;
  }
  if (!v152)
  {

    v70 = v26;
  }
  if (!v153)
  {

    v70 = v26;
  }
  if (!v154)
  {

    v70 = v26;
  }
  if (!v155)
  {

    v70 = v26;
  }
  if (!v156)
  {

    v70 = v26;
  }
  if (!v157)
  {

    v70 = v26;
  }
  if (!v158)
  {

    v70 = v26;
  }
  if (!v159)
  {

    v70 = v26;
  }
  if (!v160)
  {

    v70 = v26;
  }
  if (!v161)
  {

    v70 = v26;
  }
  if (!v162)
  {

    v70 = v26;
  }
  if (!v163)
  {

    v70 = v26;
  }
  if (!v164)
  {

    v70 = v26;
  }
  if (!v165)
  {

    v70 = v26;
  }
  if (!v166)
  {

    v70 = v26;
  }
  if (!v167)
  {

    v70 = v26;
  }
  if (!v168)
  {

    v70 = v26;
  }
  if (!v169)

  if (!v170)
  if (!v171)

  if (!v172)
  if (!v173)

  if (v174)
  {
    if (v119)
      goto LABEL_359;
  }
  else
  {

    if (v119)
    {
LABEL_359:
      if (v122)
        goto LABEL_360;
      goto LABEL_368;
    }
  }

  if (v122)
  {
LABEL_360:
    if (v121)
      goto LABEL_361;
    goto LABEL_369;
  }
LABEL_368:

  if (v121)
  {
LABEL_361:
    if (v123)
      goto LABEL_362;
    goto LABEL_370;
  }
LABEL_369:

  if (v123)
  {
LABEL_362:
    if (v124)
      goto LABEL_363;
    goto LABEL_371;
  }
LABEL_370:

  if (v124)
  {
LABEL_363:
    if (v125)
      goto LABEL_364;
LABEL_372:

    if (v24)
      goto LABEL_365;
LABEL_373:

    goto LABEL_365;
  }
LABEL_371:

  if (!v125)
    goto LABEL_372;
LABEL_364:
  if (!v24)
    goto LABEL_373;
LABEL_365:

  return v118;
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
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
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
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  double v72;
  double v73;
  double v74;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMPhotosUserAnalytics identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMPhotosUserAnalytics identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_261;
    }
    -[BMPhotosUserAnalytics userEvent](self, "userEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userEvent");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMPhotosUserAnalytics userEvent](self, "userEvent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userEvent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_261;
    }
    if (!-[BMPhotosUserAnalytics hasContainsVIP](self, "hasContainsVIP")
      && !objc_msgSend(v5, "hasContainsVIP")
      || -[BMPhotosUserAnalytics hasContainsVIP](self, "hasContainsVIP")
      && objc_msgSend(v5, "hasContainsVIP")
      && (v19 = -[BMPhotosUserAnalytics containsVIP](self, "containsVIP"),
          v19 == objc_msgSend(v5, "containsVIP")))
    {
      if (!-[BMPhotosUserAnalytics hasFaceCount](self, "hasFaceCount")
        && !objc_msgSend(v5, "hasFaceCount")
        || -[BMPhotosUserAnalytics hasFaceCount](self, "hasFaceCount")
        && objc_msgSend(v5, "hasFaceCount")
        && (v20 = -[BMPhotosUserAnalytics faceCount](self, "faceCount"),
            v20 == objc_msgSend(v5, "faceCount")))
      {
        if (!-[BMPhotosUserAnalytics hasContainsPets](self, "hasContainsPets")
          && !objc_msgSend(v5, "hasContainsPets")
          || -[BMPhotosUserAnalytics hasContainsPets](self, "hasContainsPets")
          && objc_msgSend(v5, "hasContainsPets")
          && (v21 = -[BMPhotosUserAnalytics containsPets](self, "containsPets"),
              v21 == objc_msgSend(v5, "containsPets")))
        {
          if (!-[BMPhotosUserAnalytics hasCapturedAtHome](self, "hasCapturedAtHome")
            && !objc_msgSend(v5, "hasCapturedAtHome")
            || -[BMPhotosUserAnalytics hasCapturedAtHome](self, "hasCapturedAtHome")
            && objc_msgSend(v5, "hasCapturedAtHome")
            && (v22 = -[BMPhotosUserAnalytics capturedAtHome](self, "capturedAtHome"),
                v22 == objc_msgSend(v5, "capturedAtHome")))
          {
            if (!-[BMPhotosUserAnalytics hasCapturedAtWork](self, "hasCapturedAtWork")
              && !objc_msgSend(v5, "hasCapturedAtWork")
              || -[BMPhotosUserAnalytics hasCapturedAtWork](self, "hasCapturedAtWork")
              && objc_msgSend(v5, "hasCapturedAtWork")
              && (v23 = -[BMPhotosUserAnalytics capturedAtWork](self, "capturedAtWork"),
                  v23 == objc_msgSend(v5, "capturedAtWork")))
            {
              if (!-[BMPhotosUserAnalytics hasCapturedAtFrequentLocation](self, "hasCapturedAtFrequentLocation")
                && !objc_msgSend(v5, "hasCapturedAtFrequentLocation")
                || -[BMPhotosUserAnalytics hasCapturedAtFrequentLocation](self, "hasCapturedAtFrequentLocation")
                && objc_msgSend(v5, "hasCapturedAtFrequentLocation")
                && (v24 = -[BMPhotosUserAnalytics capturedAtFrequentLocation](self, "capturedAtFrequentLocation"),
                    v24 == objc_msgSend(v5, "capturedAtFrequentLocation")))
              {
                if (!-[BMPhotosUserAnalytics hasCapturedOnTrip](self, "hasCapturedOnTrip")
                  && !objc_msgSend(v5, "hasCapturedOnTrip")
                  || -[BMPhotosUserAnalytics hasCapturedOnTrip](self, "hasCapturedOnTrip")
                  && objc_msgSend(v5, "hasCapturedOnTrip")
                  && (v25 = -[BMPhotosUserAnalytics capturedOnTrip](self, "capturedOnTrip"),
                      v25 == objc_msgSend(v5, "capturedOnTrip")))
                {
                  if (!-[BMPhotosUserAnalytics hasCapturedOnShortTrip](self, "hasCapturedOnShortTrip")
                    && !objc_msgSend(v5, "hasCapturedOnShortTrip")
                    || -[BMPhotosUserAnalytics hasCapturedOnShortTrip](self, "hasCapturedOnShortTrip")
                    && objc_msgSend(v5, "hasCapturedOnShortTrip")
                    && (v26 = -[BMPhotosUserAnalytics capturedOnShortTrip](self, "capturedOnShortTrip"),
                        v26 == objc_msgSend(v5, "capturedOnShortTrip")))
                  {
                    if (!-[BMPhotosUserAnalytics hasIsDocument](self, "hasIsDocument")
                      && !objc_msgSend(v5, "hasIsDocument")
                      || -[BMPhotosUserAnalytics hasIsDocument](self, "hasIsDocument")
                      && objc_msgSend(v5, "hasIsDocument")
                      && (v27 = -[BMPhotosUserAnalytics isDocument](self, "isDocument"),
                          v27 == objc_msgSend(v5, "isDocument")))
                    {
                      if (!-[BMPhotosUserAnalytics hasIsMeme](self, "hasIsMeme")
                        && !objc_msgSend(v5, "hasIsMeme")
                        || -[BMPhotosUserAnalytics hasIsMeme](self, "hasIsMeme")
                        && objc_msgSend(v5, "hasIsMeme")
                        && (v28 = -[BMPhotosUserAnalytics isMeme](self, "isMeme"),
                            v28 == objc_msgSend(v5, "isMeme")))
                      {
                        if (!-[BMPhotosUserAnalytics hasIsScreenshot](self, "hasIsScreenshot")
                          && !objc_msgSend(v5, "hasIsScreenshot")
                          || -[BMPhotosUserAnalytics hasIsScreenshot](self, "hasIsScreenshot")
                          && objc_msgSend(v5, "hasIsScreenshot")
                          && (v29 = -[BMPhotosUserAnalytics isScreenshot](self, "isScreenshot"),
                              v29 == objc_msgSend(v5, "isScreenshot")))
                        {
                          if (!-[BMPhotosUserAnalytics hasIsFavorite](self, "hasIsFavorite")
                            && !objc_msgSend(v5, "hasIsFavorite")
                            || -[BMPhotosUserAnalytics hasIsFavorite](self, "hasIsFavorite")
                            && objc_msgSend(v5, "hasIsFavorite")
                            && (v30 = -[BMPhotosUserAnalytics isFavorite](self, "isFavorite"),
                                v30 == objc_msgSend(v5, "isFavorite")))
                          {
                            if (!-[BMPhotosUserAnalytics hasIsCapturedOnWeekend](self, "hasIsCapturedOnWeekend")
                              && !objc_msgSend(v5, "hasIsCapturedOnWeekend")
                              || -[BMPhotosUserAnalytics hasIsCapturedOnWeekend](self, "hasIsCapturedOnWeekend")
                              && objc_msgSend(v5, "hasIsCapturedOnWeekend")
                              && (v31 = -[BMPhotosUserAnalytics isCapturedOnWeekend](self, "isCapturedOnWeekend"),
                                  v31 == objc_msgSend(v5, "isCapturedOnWeekend")))
                            {
                              if (!-[BMPhotosUserAnalytics hasIsCapturedAtPrivateEvent](self, "hasIsCapturedAtPrivateEvent")&& !objc_msgSend(v5, "hasIsCapturedAtPrivateEvent")|| -[BMPhotosUserAnalytics hasIsCapturedAtPrivateEvent](self, "hasIsCapturedAtPrivateEvent")&& objc_msgSend(v5, "hasIsCapturedAtPrivateEvent")&& (v32 = -[BMPhotosUserAnalytics isCapturedAtPrivateEvent](self, "isCapturedAtPrivateEvent"), v32 == objc_msgSend(v5, "isCapturedAtPrivateEvent")))
                              {
                                if (!-[BMPhotosUserAnalytics hasIsCapturedOnHoliday](self, "hasIsCapturedOnHoliday")
                                  && !objc_msgSend(v5, "hasIsCapturedOnHoliday")
                                  || -[BMPhotosUserAnalytics hasIsCapturedOnHoliday](self, "hasIsCapturedOnHoliday")
                                  && objc_msgSend(v5, "hasIsCapturedOnHoliday")
                                  && (v33 = -[BMPhotosUserAnalytics isCapturedOnHoliday](self, "isCapturedOnHoliday"),
                                      v33 == objc_msgSend(v5, "isCapturedOnHoliday")))
                                {
                                  v34 = -[BMPhotosUserAnalytics mediaType](self, "mediaType");
                                  if (v34 == objc_msgSend(v5, "mediaType"))
                                  {
                                    v35 = -[BMPhotosUserAnalytics importSource](self, "importSource");
                                    if (v35 == objc_msgSend(v5, "importSource"))
                                    {
                                      v36 = -[BMPhotosUserAnalytics assetAge](self, "assetAge");
                                      if (v36 == objc_msgSend(v5, "assetAge"))
                                      {
                                        v37 = -[BMPhotosUserAnalytics userLibrarySize](self, "userLibrarySize");
                                        if (v37 == objc_msgSend(v5, "userLibrarySize"))
                                        {
                                          if (!-[BMPhotosUserAnalytics hasUserNumTrips](self, "hasUserNumTrips")
                                            && !objc_msgSend(v5, "hasUserNumTrips")
                                            || -[BMPhotosUserAnalytics hasUserNumTrips](self, "hasUserNumTrips")
                                            && objc_msgSend(v5, "hasUserNumTrips")
                                            && (v38 = -[BMPhotosUserAnalytics userNumTrips](self, "userNumTrips"),
                                                v38 == objc_msgSend(v5, "userNumTrips")))
                                          {
                                            if (!-[BMPhotosUserAnalytics hasUserNumVIPPeople](self, "hasUserNumVIPPeople")&& !objc_msgSend(v5, "hasUserNumVIPPeople")|| -[BMPhotosUserAnalytics hasUserNumVIPPeople](self, "hasUserNumVIPPeople")&& objc_msgSend(v5, "hasUserNumVIPPeople")&& (v39 = -[BMPhotosUserAnalytics userNumVIPPeople](self, "userNumVIPPeople"), v39 == objc_msgSend(v5, "userNumVIPPeople")))
                                            {
                                              if (!-[BMPhotosUserAnalytics hasUserNumFavorites](self, "hasUserNumFavorites")&& !objc_msgSend(v5, "hasUserNumFavorites")|| -[BMPhotosUserAnalytics hasUserNumFavorites](self, "hasUserNumFavorites")&& objc_msgSend(v5, "hasUserNumFavorites")&& (v40 = -[BMPhotosUserAnalytics userNumFavorites](self, "userNumFavorites"), v40 == objc_msgSend(v5, "userNumFavorites")))
                                              {
                                                if (!-[BMPhotosUserAnalytics hasUserHasVIP](self, "hasUserHasVIP")
                                                  && !objc_msgSend(v5, "hasUserHasVIP")
                                                  || -[BMPhotosUserAnalytics hasUserHasVIP](self, "hasUserHasVIP")
                                                  && objc_msgSend(v5, "hasUserHasVIP")
                                                  && (v41 = -[BMPhotosUserAnalytics userHasVIP](self, "userHasVIP"),
                                                      v41 == objc_msgSend(v5, "userHasVIP")))
                                                {
                                                  if (!-[BMPhotosUserAnalytics hasUserHasHome](self, "hasUserHasHome")
                                                    && !objc_msgSend(v5, "hasUserHasHome")
                                                    || -[BMPhotosUserAnalytics hasUserHasHome](self, "hasUserHasHome")
                                                    && objc_msgSend(v5, "hasUserHasHome")
                                                    && (v42 = -[BMPhotosUserAnalytics userHasHome](self, "userHasHome"),
                                                        v42 == objc_msgSend(v5, "userHasHome")))
                                                  {
                                                    if (!-[BMPhotosUserAnalytics hasUserHasPet](self, "hasUserHasPet")
                                                      && !objc_msgSend(v5, "hasUserHasPet")
                                                      || -[BMPhotosUserAnalytics hasUserHasPet](self, "hasUserHasPet")
                                                      && objc_msgSend(v5, "hasUserHasPet")
                                                      && (v43 = -[BMPhotosUserAnalytics userHasPet](self, "userHasPet"),
                                                          v43 == objc_msgSend(v5, "userHasPet")))
                                                    {
                                                      if (!-[BMPhotosUserAnalytics hasContainsBaby](self, "hasContainsBaby")&& !objc_msgSend(v5, "hasContainsBaby")|| -[BMPhotosUserAnalytics hasContainsBaby](self, "hasContainsBaby")&& objc_msgSend(v5, "hasContainsBaby")&& (v44 = -[BMPhotosUserAnalytics containsBaby](self, "containsBaby"), v44 == objc_msgSend(v5, "containsBaby")))
                                                      {
                                                        if (!-[BMPhotosUserAnalytics hasContainsSocialGroup](self, "hasContainsSocialGroup")&& !objc_msgSend(v5, "hasContainsSocialGroup")|| -[BMPhotosUserAnalytics hasContainsSocialGroup](self, "hasContainsSocialGroup")&& objc_msgSend(v5, "hasContainsSocialGroup")&& (v45 = -[BMPhotosUserAnalytics containsSocialGroup](self, "containsSocialGroup"), v45 == objc_msgSend(v5, "containsSocialGroup")))
                                                        {
                                                          if (!-[BMPhotosUserAnalytics hasContainsMyPet](self, "hasContainsMyPet")&& !objc_msgSend(v5, "hasContainsMyPet")|| -[BMPhotosUserAnalytics hasContainsMyPet](self, "hasContainsMyPet")&& objc_msgSend(v5, "hasContainsMyPet")&& (v46 = -[BMPhotosUserAnalytics containsMyPet](self, "containsMyPet"), v46 == objc_msgSend(v5, "containsMyPet")))
                                                          {
                                                            if (!-[BMPhotosUserAnalytics hasContainsCoWorker](self, "hasContainsCoWorker")&& !objc_msgSend(v5, "hasContainsCoWorker")|| -[BMPhotosUserAnalytics hasContainsCoWorker](self, "hasContainsCoWorker")&& objc_msgSend(v5, "hasContainsCoWorker")&& (v47 = -[BMPhotosUserAnalytics containsCoWorker](self, "containsCoWorker"), v47 == objc_msgSend(v5, "containsCoWorker")))
                                                            {
                                                              if (!-[BMPhotosUserAnalytics hasContainsFamily](self, "hasContainsFamily")&& !objc_msgSend(v5, "hasContainsFamily")|| -[BMPhotosUserAnalytics hasContainsFamily](self, "hasContainsFamily")&& objc_msgSend(v5, "hasContainsFamily")&& (v48 = -[BMPhotosUserAnalytics containsFamily](self, "containsFamily"), v48 == objc_msgSend(v5, "containsFamily")))
                                                              {
                                                                if (!-[BMPhotosUserAnalytics hasContainsFriends](self, "hasContainsFriends")&& !objc_msgSend(v5, "hasContainsFriends")|| -[BMPhotosUserAnalytics hasContainsFriends](self, "hasContainsFriends")&& objc_msgSend(v5, "hasContainsFriends")&& (v49 = -[BMPhotosUserAnalytics containsFriends](self, "containsFriends"), v49 == objc_msgSend(v5, "containsFriends")))
                                                                {
                                                                  if (!-[BMPhotosUserAnalytics hasContainsPartner](self, "hasContainsPartner")&& !objc_msgSend(v5, "hasContainsPartner")|| -[BMPhotosUserAnalytics hasContainsPartner](self, "hasContainsPartner")&& objc_msgSend(v5, "hasContainsPartner")&& (v50 = -[BMPhotosUserAnalytics containsPartner](self, "containsPartner"), v50 == objc_msgSend(v5, "containsPartner")))
                                                                  {
                                                                    if (!-[BMPhotosUserAnalytics hasContainsParent](self, "hasContainsParent")&& !objc_msgSend(v5, "hasContainsParent")|| -[BMPhotosUserAnalytics hasContainsParent](self, "hasContainsParent")&& objc_msgSend(v5, "hasContainsParent")&& (v51 = -[BMPhotosUserAnalytics containsParent](self, "containsParent"), v51 == objc_msgSend(v5, "containsParent")))
                                                                    {
                                                                      if (!-[BMPhotosUserAnalytics hasContainsSibling](self, "hasContainsSibling")&& !objc_msgSend(v5, "hasContainsSibling")|| -[BMPhotosUserAnalytics hasContainsSibling](self, "hasContainsSibling")&& objc_msgSend(v5, "hasContainsSibling")&& (v52 = -[BMPhotosUserAnalytics containsSibling](self, "containsSibling"), v52 == objc_msgSend(v5, "containsSibling")))
                                                                      {
                                                                        if (!-[BMPhotosUserAnalytics hasContainsChild](self, "hasContainsChild")&& !objc_msgSend(v5, "hasContainsChild")|| -[BMPhotosUserAnalytics hasContainsChild](self, "hasContainsChild")&& objc_msgSend(v5, "hasContainsChild")&& (v53 = -[BMPhotosUserAnalytics containsChild](self, "containsChild"), v53 == objc_msgSend(v5, "containsChild")))
                                                                        {
                                                                          if (!-[BMPhotosUserAnalytics hasIsCoupon](self, "hasIsCoupon")&& !objc_msgSend(v5, "hasIsCoupon")|| -[BMPhotosUserAnalytics hasIsCoupon](self, "hasIsCoupon")&& objc_msgSend(v5, "hasIsCoupon")&& (v54 = -[BMPhotosUserAnalytics isCoupon](self, "isCoupon"), v54 == objc_msgSend(v5, "isCoupon")))
                                                                          {
                                                                            if (!-[BMPhotosUserAnalytics hasIsRecipe](self, "hasIsRecipe")&& !objc_msgSend(v5, "hasIsRecipe")|| -[BMPhotosUserAnalytics hasIsRecipe](self, "hasIsRecipe")&& objc_msgSend(v5, "hasIsRecipe")&& (v55 = -[BMPhotosUserAnalytics isRecipe](self, "isRecipe"), v55 == objc_msgSend(v5, "isRecipe")))
                                                                            {
                                                                              if (!-[BMPhotosUserAnalytics hasIsReceipt](self, "hasIsReceipt")&& !objc_msgSend(v5, "hasIsReceipt")|| -[BMPhotosUserAnalytics hasIsReceipt](self, "hasIsReceipt")&& objc_msgSend(v5, "hasIsReceipt")&& (v56 = -[BMPhotosUserAnalytics isReceipt](self, "isReceipt"), v56 == objc_msgSend(v5, "isReceipt")))
                                                                              {
                                                                                if (!-[BMPhotosUserAnalytics hasIsRecentView](self, "hasIsRecentView")&& !objc_msgSend(v5, "hasIsRecentView")|| -[BMPhotosUserAnalytics hasIsRecentView](self, "hasIsRecentView")&& objc_msgSend(v5, "hasIsRecentView")&& (v57 = -[BMPhotosUserAnalytics isRecentView](self, "isRecentView"), v57 == objc_msgSend(v5, "isRecentView")))
                                                                                {
                                                                                  if (!-[BMPhotosUserAnalytics hasIsRecentEdit](self, "hasIsRecentEdit")&& !objc_msgSend(v5, "hasIsRecentEdit")|| -[BMPhotosUserAnalytics hasIsRecentEdit](self, "hasIsRecentEdit")&& objc_msgSend(v5, "hasIsRecentEdit")&& (v58 = -[BMPhotosUserAnalytics isRecentEdit](self, "isRecentEdit"), v58 == objc_msgSend(v5, "isRecentEdit")))
                                                                                  {
                                                                                    if (!-[BMPhotosUserAnalytics hasIsRecentShare](self, "hasIsRecentShare")&& !objc_msgSend(v5, "hasIsRecentShare")|| -[BMPhotosUserAnalytics hasIsRecentShare](self, "hasIsRecentShare")&& objc_msgSend(v5, "hasIsRecentShare")&& (v59 = -[BMPhotosUserAnalytics isRecentShare](self, "isRecentShare"), v59 == objc_msgSend(v5, "isRecentShare")))
                                                                                    {
                                                                                      if (!-[BMPhotosUserAnalytics hasIsRecentFavorite](self, "hasIsRecentFavorite")&& !objc_msgSend(v5, "hasIsRecentFavorite")|| -[BMPhotosUserAnalytics hasIsRecentFavorite](self, "hasIsRecentFavorite")&& objc_msgSend(v5, "hasIsRecentFavorite")&& (v60 = -[BMPhotosUserAnalytics isRecentFavorite](self, "isRecentFavorite"), v60 == objc_msgSend(v5, "isRecentFavorite")))
                                                                                      {
                                                                                        if (!-[BMPhotosUserAnalytics hasIsContainedInSharedAlbum](self, "hasIsContainedInSharedAlbum")&& !objc_msgSend(v5, "hasIsContainedInSharedAlbum")|| -[BMPhotosUserAnalytics hasIsContainedInSharedAlbum](self, "hasIsContainedInSharedAlbum")&& objc_msgSend(v5, "hasIsContainedInSharedAlbum")&& (v61 = -[BMPhotosUserAnalytics isContainedInSharedAlbum](self, "isContainedInSharedAlbum"), v61 == objc_msgSend(v5, "isContainedInSharedAlbum")))
                                                                                        {
                                                                                          if (!-[BMPhotosUserAnalytics hasIsContainedInOnThisDay](self, "hasIsContainedInOnThisDay")&& !objc_msgSend(v5, "hasIsContainedInOnThisDay")|| -[BMPhotosUserAnalytics hasIsContainedInOnThisDay](self, "hasIsContainedInOnThisDay")&& objc_msgSend(v5, "hasIsContainedInOnThisDay")&& (v62 = -[BMPhotosUserAnalytics isContainedInOnThisDay](self, "isContainedInOnThisDay"), v62 == objc_msgSend(v5, "isContainedInOnThisDay")))
                                                                                          {
                                                                                            if (!-[BMPhotosUserAnalytics hasCapturedAtAOI](self, "hasCapturedAtAOI")&& !objc_msgSend(v5, "hasCapturedAtAOI")|| -[BMPhotosUserAnalytics hasCapturedAtAOI](self, "hasCapturedAtAOI")&& objc_msgSend(v5, "hasCapturedAtAOI")&& (v63 = -[BMPhotosUserAnalytics capturedAtAOI](self, "capturedAtAOI"), v63 == objc_msgSend(v5, "capturedAtAOI")))
                                                                                            {
                                                                                              if (!-[BMPhotosUserAnalytics hasCapturedAtPOI](self, "hasCapturedAtPOI")
                                                                                                && !objc_msgSend(v5, "hasCapturedAtPOI")
                                                                                                || -[BMPhotosUserAnalytics hasCapturedAtPOI](self, "hasCapturedAtPOI")&& objc_msgSend(v5, "hasCapturedAtPOI")&& (v64 = -[BMPhotosUserAnalytics capturedAtPOI](self, "capturedAtPOI"), v64 == objc_msgSend(v5, "capturedAtPOI")))
                                                                                              {
                                                                                                if (!-[BMPhotosUserAnalytics hasCapturedAtROI](self, "hasCapturedAtROI") && !objc_msgSend(v5, "hasCapturedAtROI") || -[BMPhotosUserAnalytics hasCapturedAtROI](self, "hasCapturedAtROI") && objc_msgSend(v5, "hasCapturedAtROI") && (v65 = -[BMPhotosUserAnalytics capturedAtROI](self, "capturedAtROI"), v65 == objc_msgSend(v5, "capturedAtROI")))
                                                                                                {
                                                                                                  if (!-[BMPhotosUserAnalytics hasCapturedAtBusiness](self, "hasCapturedAtBusiness") && !objc_msgSend(v5, "hasCapturedAtBusiness") || -[BMPhotosUserAnalytics hasCapturedAtBusiness](self, "hasCapturedAtBusiness") && objc_msgSend(v5, "hasCapturedAtBusiness") && (v66 = -[BMPhotosUserAnalytics capturedAtBusiness](self, "capturedAtBusiness"), v66 == objc_msgSend(v5, "capturedAtBusiness")))
                                                                                                  {
                                                                                                    if (!-[BMPhotosUserAnalytics hasIsCapturedAtPublicEvent](self, "hasIsCapturedAtPublicEvent") && !objc_msgSend(v5, "hasIsCapturedAtPublicEvent") || -[BMPhotosUserAnalytics hasIsCapturedAtPublicEvent](self, "hasIsCapturedAtPublicEvent") && objc_msgSend(v5, "hasIsCapturedAtPublicEvent") && (v67 = -[BMPhotosUserAnalytics isCapturedAtPublicEvent](self, "isCapturedAtPublicEvent"), v67 == objc_msgSend(v5, "isCapturedAtPublicEvent")))
                                                                                                    {
                                                                                                      if (!-[BMPhotosUserAnalytics hasIsContainedInVisualTrend](self, "hasIsContainedInVisualTrend") && !objc_msgSend(v5, "hasIsContainedInVisualTrend") || -[BMPhotosUserAnalytics hasIsContainedInVisualTrend](self, "hasIsContainedInVisualTrend") && objc_msgSend(v5, "hasIsContainedInVisualTrend") && (v68 = -[BMPhotosUserAnalytics isContainedInVisualTrend](self, "isContainedInVisualTrend"), v68 == objc_msgSend(v5, "isContainedInVisualTrend")))
                                                                                                      {
                                                                                                        if (!-[BMPhotosUserAnalytics hasIsContainedInActivity](self, "hasIsContainedInActivity") && !objc_msgSend(v5, "hasIsContainedInActivity") || -[BMPhotosUserAnalytics hasIsContainedInActivity](self, "hasIsContainedInActivity") && objc_msgSend(v5, "hasIsContainedInActivity") && (v69 = -[BMPhotosUserAnalytics isContainedInActivity](self, "isContainedInActivity"), v69 == objc_msgSend(v5, "isContainedInActivity")))
                                                                                                        {
                                                                                                          if (!-[BMPhotosUserAnalytics hasIsContainedInChildActivity](self, "hasIsContainedInChildActivity") && !objc_msgSend(v5, "hasIsContainedInChildActivity") || -[BMPhotosUserAnalytics hasIsContainedInChildActivity](self, "hasIsContainedInChildActivity") && objc_msgSend(v5, "hasIsContainedInChildActivity") && (v70 = -[BMPhotosUserAnalytics isContainedInChildActivity](self, "isContainedInChildActivity"), v70 == objc_msgSend(v5, "isContainedInChildActivity")))
                                                                                                          {
                                                                                                            v71 = -[BMPhotosUserAnalytics userLibraryAgeInDays](self, "userLibraryAgeInDays");
                                                                                                            if (v71 == objc_msgSend(v5, "userLibraryAgeInDays"))
                                                                                                            {
                                                                                                              if (!-[BMPhotosUserAnalytics hasUserisDAU](self, "hasUserisDAU") && !objc_msgSend(v5, "hasUserisDAU"))
                                                                                                              {
                                                                                                                v12 = 1;
                                                                                                                goto LABEL_262;
                                                                                                              }
                                                                                                              if (-[BMPhotosUserAnalytics hasUserisDAU](self, "hasUserisDAU") && objc_msgSend(v5, "hasUserisDAU"))
                                                                                                              {
                                                                                                                -[BMPhotosUserAnalytics userisDAU](self, "userisDAU");
                                                                                                                v73 = v72;
                                                                                                                objc_msgSend(v5, "userisDAU");
                                                                                                                v12 = v73 == v74;
LABEL_262:

                                                                                                                goto LABEL_263;
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
    }
LABEL_261:
    v12 = 0;
    goto LABEL_262;
  }
  v12 = 0;
LABEL_263:

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

- (NSString)userEvent
{
  return self->_userEvent;
}

- (BOOL)containsVIP
{
  return self->_containsVIP;
}

- (BOOL)hasContainsVIP
{
  return self->_hasContainsVIP;
}

- (void)setHasContainsVIP:(BOOL)a3
{
  self->_hasContainsVIP = a3;
}

- (int)faceCount
{
  return self->_faceCount;
}

- (BOOL)hasFaceCount
{
  return self->_hasFaceCount;
}

- (void)setHasFaceCount:(BOOL)a3
{
  self->_hasFaceCount = a3;
}

- (BOOL)containsPets
{
  return self->_containsPets;
}

- (BOOL)hasContainsPets
{
  return self->_hasContainsPets;
}

- (void)setHasContainsPets:(BOOL)a3
{
  self->_hasContainsPets = a3;
}

- (BOOL)capturedAtHome
{
  return self->_capturedAtHome;
}

- (BOOL)hasCapturedAtHome
{
  return self->_hasCapturedAtHome;
}

- (void)setHasCapturedAtHome:(BOOL)a3
{
  self->_hasCapturedAtHome = a3;
}

- (BOOL)capturedAtWork
{
  return self->_capturedAtWork;
}

- (BOOL)hasCapturedAtWork
{
  return self->_hasCapturedAtWork;
}

- (void)setHasCapturedAtWork:(BOOL)a3
{
  self->_hasCapturedAtWork = a3;
}

- (BOOL)capturedAtFrequentLocation
{
  return self->_capturedAtFrequentLocation;
}

- (BOOL)hasCapturedAtFrequentLocation
{
  return self->_hasCapturedAtFrequentLocation;
}

- (void)setHasCapturedAtFrequentLocation:(BOOL)a3
{
  self->_hasCapturedAtFrequentLocation = a3;
}

- (BOOL)capturedOnTrip
{
  return self->_capturedOnTrip;
}

- (BOOL)hasCapturedOnTrip
{
  return self->_hasCapturedOnTrip;
}

- (void)setHasCapturedOnTrip:(BOOL)a3
{
  self->_hasCapturedOnTrip = a3;
}

- (BOOL)capturedOnShortTrip
{
  return self->_capturedOnShortTrip;
}

- (BOOL)hasCapturedOnShortTrip
{
  return self->_hasCapturedOnShortTrip;
}

- (void)setHasCapturedOnShortTrip:(BOOL)a3
{
  self->_hasCapturedOnShortTrip = a3;
}

- (BOOL)isDocument
{
  return self->_isDocument;
}

- (BOOL)hasIsDocument
{
  return self->_hasIsDocument;
}

- (void)setHasIsDocument:(BOOL)a3
{
  self->_hasIsDocument = a3;
}

- (BOOL)isMeme
{
  return self->_isMeme;
}

- (BOOL)hasIsMeme
{
  return self->_hasIsMeme;
}

- (void)setHasIsMeme:(BOOL)a3
{
  self->_hasIsMeme = a3;
}

- (BOOL)isScreenshot
{
  return self->_isScreenshot;
}

- (BOOL)hasIsScreenshot
{
  return self->_hasIsScreenshot;
}

- (void)setHasIsScreenshot:(BOOL)a3
{
  self->_hasIsScreenshot = a3;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (BOOL)hasIsFavorite
{
  return self->_hasIsFavorite;
}

- (void)setHasIsFavorite:(BOOL)a3
{
  self->_hasIsFavorite = a3;
}

- (BOOL)isCapturedOnWeekend
{
  return self->_isCapturedOnWeekend;
}

- (BOOL)hasIsCapturedOnWeekend
{
  return self->_hasIsCapturedOnWeekend;
}

- (void)setHasIsCapturedOnWeekend:(BOOL)a3
{
  self->_hasIsCapturedOnWeekend = a3;
}

- (BOOL)isCapturedAtPrivateEvent
{
  return self->_isCapturedAtPrivateEvent;
}

- (BOOL)hasIsCapturedAtPrivateEvent
{
  return self->_hasIsCapturedAtPrivateEvent;
}

- (void)setHasIsCapturedAtPrivateEvent:(BOOL)a3
{
  self->_hasIsCapturedAtPrivateEvent = a3;
}

- (BOOL)isCapturedOnHoliday
{
  return self->_isCapturedOnHoliday;
}

- (BOOL)hasIsCapturedOnHoliday
{
  return self->_hasIsCapturedOnHoliday;
}

- (void)setHasIsCapturedOnHoliday:(BOOL)a3
{
  self->_hasIsCapturedOnHoliday = a3;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (int)importSource
{
  return self->_importSource;
}

- (int)assetAge
{
  return self->_assetAge;
}

- (int)userLibrarySize
{
  return self->_userLibrarySize;
}

- (int)userNumTrips
{
  return self->_userNumTrips;
}

- (BOOL)hasUserNumTrips
{
  return self->_hasUserNumTrips;
}

- (void)setHasUserNumTrips:(BOOL)a3
{
  self->_hasUserNumTrips = a3;
}

- (int)userNumVIPPeople
{
  return self->_userNumVIPPeople;
}

- (BOOL)hasUserNumVIPPeople
{
  return self->_hasUserNumVIPPeople;
}

- (void)setHasUserNumVIPPeople:(BOOL)a3
{
  self->_hasUserNumVIPPeople = a3;
}

- (int)userNumFavorites
{
  return self->_userNumFavorites;
}

- (BOOL)hasUserNumFavorites
{
  return self->_hasUserNumFavorites;
}

- (void)setHasUserNumFavorites:(BOOL)a3
{
  self->_hasUserNumFavorites = a3;
}

- (BOOL)userHasVIP
{
  return self->_userHasVIP;
}

- (BOOL)hasUserHasVIP
{
  return self->_hasUserHasVIP;
}

- (void)setHasUserHasVIP:(BOOL)a3
{
  self->_hasUserHasVIP = a3;
}

- (BOOL)userHasHome
{
  return self->_userHasHome;
}

- (BOOL)hasUserHasHome
{
  return self->_hasUserHasHome;
}

- (void)setHasUserHasHome:(BOOL)a3
{
  self->_hasUserHasHome = a3;
}

- (BOOL)userHasPet
{
  return self->_userHasPet;
}

- (BOOL)hasUserHasPet
{
  return self->_hasUserHasPet;
}

- (void)setHasUserHasPet:(BOOL)a3
{
  self->_hasUserHasPet = a3;
}

- (BOOL)containsBaby
{
  return self->_containsBaby;
}

- (BOOL)hasContainsBaby
{
  return self->_hasContainsBaby;
}

- (void)setHasContainsBaby:(BOOL)a3
{
  self->_hasContainsBaby = a3;
}

- (BOOL)containsSocialGroup
{
  return self->_containsSocialGroup;
}

- (BOOL)hasContainsSocialGroup
{
  return self->_hasContainsSocialGroup;
}

- (void)setHasContainsSocialGroup:(BOOL)a3
{
  self->_hasContainsSocialGroup = a3;
}

- (BOOL)containsMyPet
{
  return self->_containsMyPet;
}

- (BOOL)hasContainsMyPet
{
  return self->_hasContainsMyPet;
}

- (void)setHasContainsMyPet:(BOOL)a3
{
  self->_hasContainsMyPet = a3;
}

- (BOOL)containsCoWorker
{
  return self->_containsCoWorker;
}

- (BOOL)hasContainsCoWorker
{
  return self->_hasContainsCoWorker;
}

- (void)setHasContainsCoWorker:(BOOL)a3
{
  self->_hasContainsCoWorker = a3;
}

- (BOOL)containsFamily
{
  return self->_containsFamily;
}

- (BOOL)hasContainsFamily
{
  return self->_hasContainsFamily;
}

- (void)setHasContainsFamily:(BOOL)a3
{
  self->_hasContainsFamily = a3;
}

- (BOOL)containsFriends
{
  return self->_containsFriends;
}

- (BOOL)hasContainsFriends
{
  return self->_hasContainsFriends;
}

- (void)setHasContainsFriends:(BOOL)a3
{
  self->_hasContainsFriends = a3;
}

- (BOOL)containsPartner
{
  return self->_containsPartner;
}

- (BOOL)hasContainsPartner
{
  return self->_hasContainsPartner;
}

- (void)setHasContainsPartner:(BOOL)a3
{
  self->_hasContainsPartner = a3;
}

- (BOOL)containsParent
{
  return self->_containsParent;
}

- (BOOL)hasContainsParent
{
  return self->_hasContainsParent;
}

- (void)setHasContainsParent:(BOOL)a3
{
  self->_hasContainsParent = a3;
}

- (BOOL)containsSibling
{
  return self->_containsSibling;
}

- (BOOL)hasContainsSibling
{
  return self->_hasContainsSibling;
}

- (void)setHasContainsSibling:(BOOL)a3
{
  self->_hasContainsSibling = a3;
}

- (BOOL)containsChild
{
  return self->_containsChild;
}

- (BOOL)hasContainsChild
{
  return self->_hasContainsChild;
}

- (void)setHasContainsChild:(BOOL)a3
{
  self->_hasContainsChild = a3;
}

- (BOOL)isCoupon
{
  return self->_isCoupon;
}

- (BOOL)hasIsCoupon
{
  return self->_hasIsCoupon;
}

- (void)setHasIsCoupon:(BOOL)a3
{
  self->_hasIsCoupon = a3;
}

- (BOOL)isRecipe
{
  return self->_isRecipe;
}

- (BOOL)hasIsRecipe
{
  return self->_hasIsRecipe;
}

- (void)setHasIsRecipe:(BOOL)a3
{
  self->_hasIsRecipe = a3;
}

- (BOOL)isReceipt
{
  return self->_isReceipt;
}

- (BOOL)hasIsReceipt
{
  return self->_hasIsReceipt;
}

- (void)setHasIsReceipt:(BOOL)a3
{
  self->_hasIsReceipt = a3;
}

- (BOOL)isRecentView
{
  return self->_isRecentView;
}

- (BOOL)hasIsRecentView
{
  return self->_hasIsRecentView;
}

- (void)setHasIsRecentView:(BOOL)a3
{
  self->_hasIsRecentView = a3;
}

- (BOOL)isRecentEdit
{
  return self->_isRecentEdit;
}

- (BOOL)hasIsRecentEdit
{
  return self->_hasIsRecentEdit;
}

- (void)setHasIsRecentEdit:(BOOL)a3
{
  self->_hasIsRecentEdit = a3;
}

- (BOOL)isRecentShare
{
  return self->_isRecentShare;
}

- (BOOL)hasIsRecentShare
{
  return self->_hasIsRecentShare;
}

- (void)setHasIsRecentShare:(BOOL)a3
{
  self->_hasIsRecentShare = a3;
}

- (BOOL)isRecentFavorite
{
  return self->_isRecentFavorite;
}

- (BOOL)hasIsRecentFavorite
{
  return self->_hasIsRecentFavorite;
}

- (void)setHasIsRecentFavorite:(BOOL)a3
{
  self->_hasIsRecentFavorite = a3;
}

- (BOOL)isContainedInSharedAlbum
{
  return self->_isContainedInSharedAlbum;
}

- (BOOL)hasIsContainedInSharedAlbum
{
  return self->_hasIsContainedInSharedAlbum;
}

- (void)setHasIsContainedInSharedAlbum:(BOOL)a3
{
  self->_hasIsContainedInSharedAlbum = a3;
}

- (BOOL)isContainedInOnThisDay
{
  return self->_isContainedInOnThisDay;
}

- (BOOL)hasIsContainedInOnThisDay
{
  return self->_hasIsContainedInOnThisDay;
}

- (void)setHasIsContainedInOnThisDay:(BOOL)a3
{
  self->_hasIsContainedInOnThisDay = a3;
}

- (BOOL)capturedAtAOI
{
  return self->_capturedAtAOI;
}

- (BOOL)hasCapturedAtAOI
{
  return self->_hasCapturedAtAOI;
}

- (void)setHasCapturedAtAOI:(BOOL)a3
{
  self->_hasCapturedAtAOI = a3;
}

- (BOOL)capturedAtPOI
{
  return self->_capturedAtPOI;
}

- (BOOL)hasCapturedAtPOI
{
  return self->_hasCapturedAtPOI;
}

- (void)setHasCapturedAtPOI:(BOOL)a3
{
  self->_hasCapturedAtPOI = a3;
}

- (BOOL)capturedAtROI
{
  return self->_capturedAtROI;
}

- (BOOL)hasCapturedAtROI
{
  return self->_hasCapturedAtROI;
}

- (void)setHasCapturedAtROI:(BOOL)a3
{
  self->_hasCapturedAtROI = a3;
}

- (BOOL)capturedAtBusiness
{
  return self->_capturedAtBusiness;
}

- (BOOL)hasCapturedAtBusiness
{
  return self->_hasCapturedAtBusiness;
}

- (void)setHasCapturedAtBusiness:(BOOL)a3
{
  self->_hasCapturedAtBusiness = a3;
}

- (BOOL)isCapturedAtPublicEvent
{
  return self->_isCapturedAtPublicEvent;
}

- (BOOL)hasIsCapturedAtPublicEvent
{
  return self->_hasIsCapturedAtPublicEvent;
}

- (void)setHasIsCapturedAtPublicEvent:(BOOL)a3
{
  self->_hasIsCapturedAtPublicEvent = a3;
}

- (BOOL)isContainedInVisualTrend
{
  return self->_isContainedInVisualTrend;
}

- (BOOL)hasIsContainedInVisualTrend
{
  return self->_hasIsContainedInVisualTrend;
}

- (void)setHasIsContainedInVisualTrend:(BOOL)a3
{
  self->_hasIsContainedInVisualTrend = a3;
}

- (BOOL)isContainedInActivity
{
  return self->_isContainedInActivity;
}

- (BOOL)hasIsContainedInActivity
{
  return self->_hasIsContainedInActivity;
}

- (void)setHasIsContainedInActivity:(BOOL)a3
{
  self->_hasIsContainedInActivity = a3;
}

- (BOOL)isContainedInChildActivity
{
  return self->_isContainedInChildActivity;
}

- (BOOL)hasIsContainedInChildActivity
{
  return self->_hasIsContainedInChildActivity;
}

- (void)setHasIsContainedInChildActivity:(BOOL)a3
{
  self->_hasIsContainedInChildActivity = a3;
}

- (int)userLibraryAgeInDays
{
  return self->_userLibraryAgeInDays;
}

- (double)userisDAU
{
  return self->_userisDAU;
}

- (BOOL)hasUserisDAU
{
  return self->_hasUserisDAU;
}

- (void)setHasUserisDAU:(BOOL)a3
{
  self->_hasUserisDAU = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userEvent, 0);
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

    v4 = -[BMPhotosUserAnalytics initByReadFrom:]([BMPhotosUserAnalytics alloc], "initByReadFrom:", v7);
    v4[28] = 0;

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
  _QWORD v60[58];

  v60[56] = *MEMORY[0x1E0C80C00];
  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 1, 13, 0);
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userEvent"), 2, 0, 2, 13, 0);
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("containsVIP"), 0, 0, 3, 12, 0);
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("faceCount"), 0, 0, 4, 2, 0);
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("containsPets"), 0, 0, 5, 12, 0);
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("capturedAtHome"), 0, 0, 6, 12, 0);
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("capturedAtWork"), 0, 0, 7, 12, 0);
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("capturedAtFrequentLocation"), 0, 0, 8, 12, 0);
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("capturedOnTrip"), 0, 0, 9, 12, 0);
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("capturedOnShortTrip"), 0, 0, 10, 12, 0);
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isDocument"), 0, 0, 11, 12, 0);
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isMeme"), 0, 0, 12, 12, 0);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isScreenshot"), 0, 0, 13, 12, 0);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isFavorite"), 0, 0, 14, 12, 0);
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isCapturedOnWeekend"), 0, 0, 15, 12, 0);
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isCapturedAtPrivateEvent"), 0, 0, 16, 12, 0);
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isCapturedOnHoliday"), 0, 0, 17, 12, 0);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaType"), 0, 0, 18, 4, 0);
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("importSource"), 0, 0, 19, 4, 0);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("assetAge"), 0, 0, 20, 4, 0);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userLibrarySize"), 0, 0, 21, 4, 0);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userNumTrips"), 0, 0, 22, 2, 0);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userNumVIPPeople"), 0, 0, 23, 2, 0);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userNumFavorites"), 0, 0, 24, 2, 0);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userHasVIP"), 0, 0, 25, 12, 0);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userHasHome"), 0, 0, 26, 12, 0);
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userHasPet"), 0, 0, 27, 12, 0);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("containsBaby"), 0, 0, 28, 12, 0);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("containsSocialGroup"), 0, 0, 29, 12, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("containsMyPet"), 0, 0, 30, 12, 0);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("containsCoWorker"), 0, 0, 31, 12, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("containsFamily"), 0, 0, 32, 12, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("containsFriends"), 0, 0, 33, 12, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("containsPartner"), 0, 0, 34, 12, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("containsParent"), 0, 0, 35, 12, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("containsSibling"), 0, 0, 36, 12, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("containsChild"), 0, 0, 37, 12, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isCoupon"), 0, 0, 38, 12, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRecipe"), 0, 0, 39, 12, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isReceipt"), 0, 0, 40, 12, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRecentView"), 0, 0, 41, 12, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRecentEdit"), 0, 0, 42, 12, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRecentShare"), 0, 0, 43, 12, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRecentFavorite"), 0, 0, 44, 12, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isContainedInSharedAlbum"), 0, 0, 45, 12, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isContainedInOnThisDay"), 0, 0, 46, 12, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("capturedAtAOI"), 0, 0, 47, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("capturedAtPOI"), 0, 0, 48, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("capturedAtROI"), 0, 0, 49, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("capturedAtBusiness"), 0, 0, 50, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isCapturedAtPublicEvent"), 0, 0, 51, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isContainedInVisualTrend"), 0, 0, 52, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isContainedInActivity"), 0, 0, 53, 12, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isContainedInChildActivity"), 0, 0, 54, 12, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userLibraryAgeInDays"), 0, 0, 55, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userisDAU"), 1, 0, 56, 1, 0);
  v60[0] = v59;
  v60[1] = v58;
  v60[2] = v57;
  v60[3] = v55;
  v60[4] = v56;
  v60[5] = v53;
  v60[6] = v54;
  v60[7] = v52;
  v60[8] = v51;
  v60[9] = v50;
  v60[10] = v49;
  v60[11] = v48;
  v60[12] = v47;
  v60[13] = v46;
  v60[14] = v45;
  v60[15] = v44;
  v60[16] = v43;
  v60[17] = v42;
  v60[18] = v41;
  v60[19] = v40;
  v60[20] = v39;
  v60[21] = v38;
  v60[22] = v37;
  v60[23] = v36;
  v60[24] = v35;
  v60[25] = v34;
  v60[26] = v33;
  v60[27] = v32;
  v60[28] = v31;
  v60[29] = v30;
  v60[30] = v29;
  v60[31] = v28;
  v60[32] = v27;
  v60[33] = v26;
  v60[34] = v25;
  v60[35] = v24;
  v60[36] = v23;
  v60[37] = v22;
  v60[38] = v21;
  v60[39] = v20;
  v60[40] = v19;
  v60[41] = v18;
  v60[42] = v17;
  v60[43] = v16;
  v60[44] = v15;
  v60[45] = v14;
  v60[46] = v2;
  v60[47] = v3;
  v60[48] = v4;
  v60[49] = v5;
  v60[50] = v6;
  v60[51] = v7;
  v60[52] = v8;
  v60[53] = v13;
  v60[54] = v12;
  v60[55] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 56);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C258;
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
  _QWORD v60[58];

  v60[56] = *MEMORY[0x1E0C80C00];
  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v60[0] = v59;
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userEvent"), 2, 13, 0);
  v60[1] = v58;
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("containsVIP"), 3, 12, 0);
  v60[2] = v57;
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("faceCount"), 4, 2, 0);
  v60[3] = v56;
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("containsPets"), 5, 12, 0);
  v60[4] = v55;
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("capturedAtHome"), 6, 12, 0);
  v60[5] = v54;
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("capturedAtWork"), 7, 12, 0);
  v60[6] = v53;
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("capturedAtFrequentLocation"), 8, 12, 0);
  v60[7] = v52;
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("capturedOnTrip"), 9, 12, 0);
  v60[8] = v51;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("capturedOnShortTrip"), 10, 12, 0);
  v60[9] = v50;
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isDocument"), 11, 12, 0);
  v60[10] = v49;
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isMeme"), 12, 12, 0);
  v60[11] = v48;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isScreenshot"), 13, 12, 0);
  v60[12] = v47;
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isFavorite"), 14, 12, 0);
  v60[13] = v46;
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isCapturedOnWeekend"), 15, 12, 0);
  v60[14] = v45;
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isCapturedAtPrivateEvent"), 16, 12, 0);
  v60[15] = v44;
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isCapturedOnHoliday"), 17, 12, 0);
  v60[16] = v43;
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaType"), 18, 4, 0);
  v60[17] = v42;
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("importSource"), 19, 4, 0);
  v60[18] = v41;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("assetAge"), 20, 4, 0);
  v60[19] = v40;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userLibrarySize"), 21, 4, 0);
  v60[20] = v39;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userNumTrips"), 22, 2, 0);
  v60[21] = v38;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userNumVIPPeople"), 23, 2, 0);
  v60[22] = v37;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userNumFavorites"), 24, 2, 0);
  v60[23] = v36;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userHasVIP"), 25, 12, 0);
  v60[24] = v35;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userHasHome"), 26, 12, 0);
  v60[25] = v34;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userHasPet"), 27, 12, 0);
  v60[26] = v33;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("containsBaby"), 28, 12, 0);
  v60[27] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("containsSocialGroup"), 29, 12, 0);
  v60[28] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("containsMyPet"), 30, 12, 0);
  v60[29] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("containsCoWorker"), 31, 12, 0);
  v60[30] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("containsFamily"), 32, 12, 0);
  v60[31] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("containsFriends"), 33, 12, 0);
  v60[32] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("containsPartner"), 34, 12, 0);
  v60[33] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("containsParent"), 35, 12, 0);
  v60[34] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("containsSibling"), 36, 12, 0);
  v60[35] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("containsChild"), 37, 12, 0);
  v60[36] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isCoupon"), 38, 12, 0);
  v60[37] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRecipe"), 39, 12, 0);
  v60[38] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isReceipt"), 40, 12, 0);
  v60[39] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRecentView"), 41, 12, 0);
  v60[40] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRecentEdit"), 42, 12, 0);
  v60[41] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRecentShare"), 43, 12, 0);
  v60[42] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRecentFavorite"), 44, 12, 0);
  v60[43] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isContainedInSharedAlbum"), 45, 12, 0);
  v60[44] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isContainedInOnThisDay"), 46, 12, 0);
  v60[45] = v14;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("capturedAtAOI"), 47, 12, 0);
  v60[46] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("capturedAtPOI"), 48, 12, 0);
  v60[47] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("capturedAtROI"), 49, 12, 0);
  v60[48] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("capturedAtBusiness"), 50, 12, 0);
  v60[49] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isCapturedAtPublicEvent"), 51, 12, 0);
  v60[50] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isContainedInVisualTrend"), 52, 12, 0);
  v60[51] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isContainedInActivity"), 53, 12, 0);
  v60[52] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isContainedInChildActivity"), 54, 12, 0);
  v60[53] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userLibraryAgeInDays"), 55, 4, 0);
  v60[54] = v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userisDAU"), 56, 1, 0);
  v60[55] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 56);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
