@implementation PHAssetChangeRequest

- (PHAssetChangeRequest)init
{
  -[PHAssetChangeRequest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return -[PHAssetChangeRequest initWithHelper:](self, "initWithHelper:", 0);
}

- (PHAssetChangeRequest)initWithHelper:(id)a3
{
  id v6;
  PHAssetChangeRequest *v7;
  PHAssetChangeRequest *v8;
  PHRelationshipChangeRequestHelper *v9;
  PHRelationshipChangeRequestHelper *facesHelper;
  PHRelationshipChangeRequestHelper *v11;
  PHRelationshipChangeRequestHelper *temporalFacesHelper;
  PHRelationshipChangeRequestHelper *v13;
  PHRelationshipChangeRequestHelper *keywordsHelper;
  PHRelationshipChangeRequestHelper *v15;
  PHRelationshipChangeRequestHelper *commentsHelper;
  PHRelationshipChangeRequestHelper *v17;
  PHRelationshipChangeRequestHelper *likesHelper;
  void *v19;
  void *v21;
  objc_super v22;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 443, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("helper"));

  }
  v22.receiver = self;
  v22.super_class = (Class)PHAssetChangeRequest;
  v7 = -[PHChangeRequest init](&v22, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->super._helper, a3);
    v9 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("detectedFaces"), v8->super._helper);
    facesHelper = v8->_facesHelper;
    v8->_facesHelper = v9;

    v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("temporalDetectedFaces"), v8->super._helper);
    temporalFacesHelper = v8->_temporalFacesHelper;
    v8->_temporalFacesHelper = v11;

    v13 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("keywords"), v8->super._helper);
    keywordsHelper = v8->_keywordsHelper;
    v8->_keywordsHelper = v13;

    v15 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("cloudComments"), v8->super._helper);
    commentsHelper = v8->_commentsHelper;
    v8->_commentsHelper = v15;

    v17 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("likeComments"), v8->super._helper);
    likesHelper = v8->_likesHelper;
    v8->_likesHelper = v17;

    objc_msgSend((id)objc_opt_class(), "_allAssetEditOperations");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetChangeRequest setSupportedEditOperations:](v8, "setSupportedEditOperations:", v19);

  }
  return v8;
}

- (PHAssetChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHChangeRequestHelper *v8;
  PHAssetChangeRequest *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v7, v6, self);

  v9 = -[PHAssetChangeRequest initWithHelper:](self, "initWithHelper:", v8);
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "_allAssetEditOperations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetChangeRequest setSupportedEditOperations:](v9, "setSupportedEditOperations:", v10);

  }
  return v9;
}

- (PHAssetChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHChangeRequestHelper *v11;
  PHRelationshipChangeRequestHelper *v12;
  PHRelationshipChangeRequestHelper *facesHelper;
  PHRelationshipChangeRequestHelper *v14;
  PHRelationshipChangeRequestHelper *temporalFacesHelper;
  PHRelationshipChangeRequestHelper *v16;
  PHRelationshipChangeRequestHelper *keywordsHelper;
  PHRelationshipChangeRequestHelper *v18;
  PHRelationshipChangeRequestHelper *commentsHelper;
  PHRelationshipChangeRequestHelper *v20;
  PHRelationshipChangeRequestHelper *likesHelper;
  PHAssetChangeRequest *v22;
  void (**v23)(_QWORD);
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  NSURL *editorBundleURL;
  void *v30;
  uint64_t v31;
  NSString *editorBundleID;
  uint64_t v33;
  NSString *v34;
  uint64_t v35;
  NSString *v36;
  _BOOL4 v37;
  _BOOL4 v38;
  _BOOL4 v39;
  _BOOL4 v40;
  _BOOL4 v41;
  _BOOL4 v42;
  _BOOL4 v43;
  _BOOL4 v44;
  _BOOL4 v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  CLLocation *updatedLocation;
  NSObject *v54;
  uint64_t v55;
  NSString *assetDescription;
  uint64_t v57;
  NSString *accessibilityDescription;
  _BOOL4 v59;
  uint64_t v60;
  NSString *title;
  _BOOL4 v62;
  void *v63;
  uint64_t v64;
  NSSet *keywordTitles;
  uint64_t v66;
  NSURL *videoURLForUpdate;
  uint64_t v68;
  NSString *pairingIdentifier;
  const __CFDictionary *v70;
  $95D729B680665BEAEFA1D6FCA8238556 *p_videoDuration;
  __int128 v72;
  uint64_t v73;
  const __CFDictionary *v74;
  $95D729B680665BEAEFA1D6FCA8238556 *p_imageDisplayTime;
  __int128 v76;
  uint64_t v77;
  _BOOL4 v78;
  void *v79;
  void *v80;
  uint64_t v81;
  NSMutableDictionary *sceneClassificationDictionariesByType;
  _BOOL4 v83;
  _BOOL4 v84;
  int64_t date;
  uint64_t v86;
  NSDate *lastSharedDate;
  _BOOL4 v88;
  int v89;
  void *v90;
  void *v91;
  _BOOL4 v92;
  void *v93;
  uint64_t v94;
  NSDictionary *pathsToNewAssetResourcesByAssetResourceType;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  NSSet *assetResourceTypesToDelete;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  NSSet *libraryScopeOriginatorUUIDs;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  NSMutableDictionary *computedAttributeMutations;
  _BOOL4 v113;
  NSDate *wallpaperPropertiesTimestamp;
  NSData *wallpaperPropertiesData;
  void *v116;
  uint64_t v117;
  NSDate *v118;
  void *v119;
  const void *data;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  NSDate *mediaAnalysisTimeStamp;
  void *v125;
  void *v126;
  const __CFDictionary *v127;
  __int128 v128;
  _BOOL4 v129;
  void *v130;
  void *v131;
  const __CFDictionary *v132;
  __int128 v133;
  __int128 v134;
  const __CFDictionary *v135;
  __int128 v136;
  __int128 v137;
  void *v138;
  float value;
  void *v140;
  float v141;
  void *v142;
  float v143;
  void *v144;
  float v145;
  void *v146;
  float v147;
  void *v148;
  float v149;
  void *v150;
  float v151;
  void *v152;
  float v153;
  void *v154;
  float v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  float v160;
  void *v161;
  uint64_t v162;
  NSData *colorNormalizationData;
  uint64_t v164;
  void *v165;
  void *v166;
  uint64_t v167;
  NSData *characterRecognitionData;
  void *v169;
  uint64_t v170;
  NSData *machineReadableCodeData;
  void *v172;
  void *v173;
  void *v174;
  uint64_t v175;
  NSDate *characterRecognitionAdjustmentVersion;
  uint64_t v177;
  void *v178;
  void *v179;
  uint64_t v180;
  NSData *visualSearchData;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  float v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  uint64_t v194;
  NSDate *visualSearchAdjustmentVersion;
  void *v196;
  uint64_t v197;
  NSData *sceneprintData;
  void *v199;
  uint64_t v200;
  NSData *duplicateMatchingData;
  NSData *v202;
  uint64_t v203;
  NSData *duplicateMatchingAlternateData;
  NSData *v205;
  void *v206;
  uint64_t v207;
  NSData *reverseLocationData;
  void *v209;
  uint64_t v210;
  NSData *objectSaliencyRectsData;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  uint64_t v217;
  void *v218;
  uint64_t v219;
  id v220;
  CLLocation *shiftedLocation;
  CLLocation *v222;
  NSObject *v223;
  void *v224;
  uint64_t v225;
  NSString *timeZoneName;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  uint64_t v231;
  NSString *syndicationIdentifier;
  void *v233;
  void *v234;
  void *v235;
  _BOOL4 v236;
  void *v237;
  uint64_t v238;
  NSMutableDictionary *generatedAssetDescriptionDictionaries;
  void *v240;
  void *v241;
  PHAssetChangeRequest *v242;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  PHChangeRequestHelper *v248;
  id v249;
  char v250;
  id v251;
  id v252;
  id v253;
  _QWORD aBlock[4];
  PHAssetChangeRequest *v255;
  id v256;
  CMTimeRange buf;
  uint64_t v258;

  v258 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, self, v9, v10);
  if (!v11
    || (self = -[PHAssetChangeRequest initWithHelper:](self, "initWithHelper:", v11),
        self,
        !self))
  {

    v22 = 0;
    goto LABEL_213;
  }
  v248 = v11;
  v12 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("detectedFaces"), v8, self->super._helper);
  facesHelper = self->_facesHelper;
  self->_facesHelper = v12;

  v14 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("temporalDetectedFaces"), v8, self->super._helper);
  temporalFacesHelper = self->_temporalFacesHelper;
  self->_temporalFacesHelper = v14;

  v16 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("keywords"), v8, self->super._helper);
  keywordsHelper = self->_keywordsHelper;
  self->_keywordsHelper = v16;

  v18 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("cloudComments"), v8, self->super._helper);
  commentsHelper = self->_commentsHelper;
  self->_commentsHelper = v18;

  v20 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("likeComments"), v8, self->super._helper);
  likesHelper = self->_likesHelper;
  self->_likesHelper = v20;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PHAssetChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke;
  aBlock[3] = &unk_1E35DF9E8;
  v22 = self;
  v255 = v22;
  v249 = v9;
  v256 = v9;
  v23 = (void (**)(_QWORD))_Block_copy(aBlock);
  v22->_clientProcessIdentifier = objc_msgSend(v10, "clientProcessIdentifier");
  v250 = objc_msgSend(v10, "photoKitEntitled");
  if (xpc_dictionary_get_BOOL(v8, "didChangeAdjustments"))
  {
    -[PHAssetChangeRequest markDidChangeAdjustments](v22, "markDidChangeAdjustments");
    PLDataFromXPCDictionary();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v253 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v24, &v253);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v253;
      if (!v25)
      {
        PLPhotoKitGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v26;
          _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_DEFAULT, "Failed to unarchive contentEditingOutputData, error: %@", (uint8_t *)&buf, 0xCu);
        }

      }
    }
    else
    {
      v25 = 0;
    }
    -[PHAssetChangeRequest setContentEditingOutput:](v22, "setContentEditingOutput:", v25);
    if ((v250 & 1) != 0)
    {
      PLURLFromXPCDictionary();
      v28 = objc_claimAutoreleasedReturnValue();
      editorBundleURL = v22->_editorBundleURL;
      v22->_editorBundleURL = (NSURL *)v28;

      if (v22->_editorBundleURL)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "bundleIdentifier");
        v31 = objc_claimAutoreleasedReturnValue();
        editorBundleID = v22->_editorBundleID;
        v22->_editorBundleID = (NSString *)v31;

      }
      if (!v22->_editorBundleID)
      {
        PLStringFromXPCDictionary();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v22->_editorBundleID;
        v22->_editorBundleID = (NSString *)v33;

      }
    }
    if (!v22->_editorBundleID)
    {
      objc_msgSend(v10, "trustedCallerBundleID");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v22->_editorBundleID;
      v22->_editorBundleID = (NSString *)v35;

    }
  }
  if (-[PHAssetChangeRequest didChangeAdjustments](v22, "didChangeAdjustments"))
    v23[2](v23);
  v22->_originalResourceChoice = xpc_dictionary_get_uint64(v8, "originalResourceChoice");
  v37 = xpc_dictionary_get_BOOL(v8, "didSetOriginalResourceChoice");
  v22->_didSetOriginalResourceChoice = v37;
  if (v37)
    v23[2](v23);
  v38 = xpc_dictionary_get_BOOL(v8, "didRevertLocationToOriginal");
  v22->_didRevertLocationToOriginal = v38;
  if (v38)
    v23[2](v23);
  v39 = xpc_dictionary_get_BOOL(v8, "didUpdateExtendedAttributesUsingOriginalMediaMetadata");
  v22->_didUpdateExtendedAttributesUsingOriginalMediaMetadata = v39;
  if (v39)
    v23[2](v23);
  v40 = xpc_dictionary_get_BOOL(v8, "didExpungeAllSpatialOverCaptureResources");
  v22->_didExpungeAllSpatialOverCaptureResources = v40;
  if (v40)
    v23[2](v23);
  v41 = xpc_dictionary_get_BOOL(v8, "didTrashAllSpatialOverCaptureResources");
  v22->_didTrashAllSpatialOverCaptureResources = v41;
  if (v41)
    v23[2](v23);
  v42 = xpc_dictionary_get_BOOL(v8, "didUntrashAllSpatialOverCaptureResources");
  v22->_didUntrashAllSpatialOverCaptureResources = v42;
  if (v42)
    v23[2](v23);
  v43 = xpc_dictionary_get_BOOL(v8, "didExpungeTrashedSpatialOverCaptureResources");
  v22->_didExpungeTrashedSpatialOverCaptureResources = v43;
  if (v43)
    v23[2](v23);
  v44 = xpc_dictionary_get_BOOL(v8, "didPromoteToGuestAsset");
  v22->_didPromoteToGuestAsset = v44;
  if (v44)
    v23[2](v23);
  v45 = xpc_dictionary_get_BOOL(v8, "didResetGuestAssetPromotion");
  v22->_didResetGuestAssetPromotion = v45;
  if (v45)
    v23[2](v23);
  PLDataFromXPCDictionary();
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)MEMORY[0x1E0CB3710];
    v48 = (void *)MEMORY[0x1E0C99E60];
    v49 = objc_opt_class();
    objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v252 = 0;
    objc_msgSend(v47, "unarchivedObjectOfClasses:fromData:error:", v50, v46, &v252);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = v252;
    updatedLocation = v22->_updatedLocation;
    v22->_updatedLocation = (CLLocation *)v51;

    if (v22->_updatedLocation)
    {
      v23[2](v23);
    }
    else
    {
      PLPhotoKitGetLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.start.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v52;
        _os_log_impl(&dword_1991EC000, v54, OS_LOG_TYPE_DEFAULT, "Failed to unarchive locationData, error: %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  PLStringFromXPCDictionary();
  v55 = objc_claimAutoreleasedReturnValue();
  assetDescription = v22->_assetDescription;
  v22->_assetDescription = (NSString *)v55;

  if (v22->_assetDescription)
    v23[2](v23);
  PLStringFromXPCDictionary();
  v57 = objc_claimAutoreleasedReturnValue();
  accessibilityDescription = v22->_accessibilityDescription;
  v22->_accessibilityDescription = (NSString *)v57;

  if (v22->_accessibilityDescription)
    v23[2](v23);
  v59 = xpc_dictionary_get_BOOL(v8, "didSetTitle");
  v22->_didSetTitle = v59;
  if (v59)
  {
    PLStringFromXPCDictionary();
    v60 = objc_claimAutoreleasedReturnValue();
    title = v22->_title;
    v22->_title = (NSString *)v60;

    v23[2](v23);
  }
  v62 = xpc_dictionary_get_BOOL(v8, "didSetKeywordTitles");
  v22->_didSetKeywordTitles = v62;
  if (v62)
  {
    PLArrayFromXPCDictionary();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v63);
    v64 = objc_claimAutoreleasedReturnValue();
    keywordTitles = v22->_keywordTitles;
    v22->_keywordTitles = (NSSet *)v64;

    v23[2](v23);
  }
  PLURLFromXPCDictionary();
  v66 = objc_claimAutoreleasedReturnValue();
  videoURLForUpdate = v22->_videoURLForUpdate;
  v22->_videoURLForUpdate = (NSURL *)v66;

  PLStringFromXPCDictionary();
  v68 = objc_claimAutoreleasedReturnValue();
  pairingIdentifier = v22->_pairingIdentifier;
  v22->_pairingIdentifier = (NSString *)v68;

  v70 = (const __CFDictionary *)PLDictionaryFromXPCDictionary();
  p_videoDuration = &v22->_videoDuration;
  if (v70)
  {
    CMTimeMakeFromDictionary(&buf.start, v70);
    v72 = *(_OWORD *)&buf.start.value;
    v22->_videoDuration.epoch = buf.start.epoch;
    *(_OWORD *)&p_videoDuration->value = v72;
  }
  else
  {
    v73 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&p_videoDuration->value = *MEMORY[0x1E0CA2E18];
    v22->_videoDuration.epoch = *(_QWORD *)(v73 + 16);
  }
  v74 = (const __CFDictionary *)PLDictionaryFromXPCDictionary();
  p_imageDisplayTime = &v22->_imageDisplayTime;
  if (v74)
  {
    CMTimeMakeFromDictionary(&buf.start, v74);
    v76 = *(_OWORD *)&buf.start.value;
    v22->_imageDisplayTime.epoch = buf.start.epoch;
    *(_OWORD *)&p_imageDisplayTime->value = v76;
  }
  else
  {
    v77 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&p_imageDisplayTime->value = *MEMORY[0x1E0CA2E18];
    v22->_imageDisplayTime.epoch = *(_QWORD *)(v77 + 16);
  }
  if (v22->_videoURLForUpdate && v22->_pairingIdentifier)
    v23[2](v23);
  v22->_photoIrisVisibilityState = xpc_dictionary_get_uint64(v8, "photoIrisVisibilityState");
  v78 = xpc_dictionary_get_BOOL(v8, "didSetVisibilityState");
  v22->_didSetVisibilityState = v78;
  if (v78)
    v23[2](v23);
  PLDictionaryFromXPCDictionary();
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v79;
  if (v79)
  {
    v81 = objc_msgSend(v79, "mutableCopy");
    sceneClassificationDictionariesByType = v22->_sceneClassificationDictionariesByType;
    v22->_sceneClassificationDictionariesByType = (NSMutableDictionary *)v81;

    v22->_didSetSceneClassifications = 1;
    v23[2](v23);
  }
  v83 = xpc_dictionary_get_BOOL(v8, "didSetImageEmbeddingVersionKey");
  v22->_didSetImageEmbeddingVersion = v83;
  if (v83)
  {
    v22->_imageEmbeddingVersion = xpc_dictionary_get_int64(v8, "imageEmbeddingVersion");
    v23[2](v23);
  }
  v246 = v80;
  v84 = xpc_dictionary_get_BOOL(v8, "didSetVideoEmbeddingVersionKey");
  v22->_didSetVideoEmbeddingVersion = v84;
  if (v84)
  {
    v22->_videoEmbeddingVersion = xpc_dictionary_get_int64(v8, "videoEmbeddingVersion");
    v23[2](v23);
  }
  v22->_incrementPlayCount = xpc_dictionary_get_BOOL(v8, "incrementPlayCount");
  v22->_incrementShareCount = xpc_dictionary_get_BOOL(v8, "incrementShareCount");
  date = xpc_dictionary_get_date(v8, "lastSharedDate");
  if (date)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)date);
    v86 = objc_claimAutoreleasedReturnValue();
    lastSharedDate = v22->_lastSharedDate;
    v22->_lastSharedDate = (NSDate *)v86;

  }
  v88 = xpc_dictionary_get_BOOL(v8, "incrementViewCount");
  v22->_incrementViewCount = v88;
  if (v22->_incrementPlayCount || (v22->_incrementShareCount ? (v89 = 1) : (v89 = v88), v89 == 1))
    v23[2](v23);
  xpc_dictionary_get_value(v8, "variationSuggestionStates");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v90;
  if (v90)
  {
    v22->_didSetVariationSuggestionStates = 1;
    v22->_variationSuggestionStates = xpc_uint64_get_value(v90);
    v22->_variationSuggestionStatesMask = xpc_dictionary_get_uint64(v8, "variationSuggestionStatesMask");
    v23[2](v23);
  }
  v92 = xpc_dictionary_get_BOOL(v8, "toRetryUpload");
  v22->_toRetryUpload = v92;
  if (v92)
    v23[2](v23);
  xpc_dictionary_get_value(v8, "pathsToNewAssetResourcesByAssetResourceType");
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  if (v93)
  {
    PLDictionaryFromXPCObject();
    v94 = objc_claimAutoreleasedReturnValue();
    pathsToNewAssetResourcesByAssetResourceType = v22->_pathsToNewAssetResourcesByAssetResourceType;
    v22->_pathsToNewAssetResourcesByAssetResourceType = (NSDictionary *)v94;

    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "assetResourceTypesToDelete");
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  if (v96)
  {
    v97 = (void *)MEMORY[0x1E0C99E60];
    PLArrayFromXPCObject();
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setWithArray:", v98);
    v99 = objc_claimAutoreleasedReturnValue();
    assetResourceTypesToDelete = v22->_assetResourceTypesToDelete;
    v22->_assetResourceTypesToDelete = (NSSet *)v99;

    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "libraryScopeOriginatorUUIDs");
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  if (v101)
  {
    v102 = (void *)MEMORY[0x1E0C99E60];
    PLArrayFromXPCObject();
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setWithArray:", v103);
    v104 = objc_claimAutoreleasedReturnValue();
    libraryScopeOriginatorUUIDs = v22->_libraryScopeOriginatorUUIDs;
    v22->_libraryScopeOriginatorUUIDs = (NSSet *)v104;

    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "packedPreferredCropRect");
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (v106)
  {
    v22->_didSetPackedPreferredCropRect = 1;
    v22->_packedPreferredCropRect = xpc_int64_get_value(v106);
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "packedAcceptableCropRect");
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  if (v107)
  {
    v22->_didSetPackedAcceptableCropRect = 1;
    v22->_packedAcceptableCropRect = xpc_int64_get_value(v107);
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "packedBestPlaybackRect");
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  if (v108)
  {
    v22->_didSetPackedBestPlaybackRect = 1;
    v22->_packedBestPlaybackRect = xpc_int64_get_value(v108);
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "computedAttributeMutations");
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  if (v109)
  {
    v22->_didModifyComputedAttributes = 1;
    PLDictionaryFromXPCObject();
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend(v110, "mutableCopy");
    computedAttributeMutations = v22->_computedAttributeMutations;
    v22->_computedAttributeMutations = (NSMutableDictionary *)v111;

    v23[2](v23);
  }
  v113 = xpc_dictionary_get_BOOL(v8, "resetWallpaperProperties");
  v22->_resetWallpaperProperties = v113;
  if (v113)
  {
    v22->_didSetWallpaperPropertiesTimestamp = 1;
    wallpaperPropertiesTimestamp = v22->_wallpaperPropertiesTimestamp;
    v22->_wallpaperPropertiesTimestamp = 0;

    v22->_didSetWallpaperPropertiesVersion = 1;
    v22->_wallpaperPropertiesVersion = 0;
    v22->_didSetWallpaperPropertiesData = 1;
    wallpaperPropertiesData = v22->_wallpaperPropertiesData;
    v22->_wallpaperPropertiesData = 0;
LABEL_107:

    v23[2](v23);
    goto LABEL_108;
  }
  xpc_dictionary_get_value(v8, "photoAnalysisWallpaperPropertiesTimeStamp");
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  if (v116)
  {
    v22->_didSetWallpaperPropertiesTimestamp = 1;
    PLDateFromXPCObject();
    v117 = objc_claimAutoreleasedReturnValue();
    v118 = v22->_wallpaperPropertiesTimestamp;
    v22->_wallpaperPropertiesTimestamp = (NSDate *)v117;

    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "photoAnalysisWallpaperPropertiesVersion");
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  if (v119)
  {
    v22->_didSetWallpaperPropertiesVersion = 1;
    v22->_wallpaperPropertiesVersion = xpc_uint64_get_value(v119);
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "photoAnalysisWallpaperProperties");
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  if (v109)
  {
    v22->_didSetWallpaperPropertiesData = 1;
    buf.start.value = 0;
    data = xpc_dictionary_get_data(v8, "photoAnalysisWallpaperProperties", (size_t *)&buf);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, buf.start.value);
    v121 = objc_claimAutoreleasedReturnValue();
    wallpaperPropertiesData = v22->_wallpaperPropertiesData;
    v22->_wallpaperPropertiesData = (NSData *)v121;
    goto LABEL_107;
  }
LABEL_108:
  xpc_dictionary_get_value(v8, "mediaAnalysisTimeStamp");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  if (v122)
  {
    v22->_didSetMediaAnalysisTimeStamp = 1;
    PLDateFromXPCObject();
    v123 = objc_claimAutoreleasedReturnValue();
    mediaAnalysisTimeStamp = v22->_mediaAnalysisTimeStamp;
    v22->_mediaAnalysisTimeStamp = (NSDate *)v123;

    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "mediaAnalysisVersion");
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  if (v125)
  {
    v22->_didSetMediaAnalysisVersion = 1;
    v22->_mediaAnalysisVersion = xpc_uint64_get_value(v125);
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "mediaAnalysisImageVersion");
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  if (v126)
  {
    v22->_didSetMediaAnalysisImageVersion = 1;
    v22->_mediaAnalysisImageVersion = xpc_int64_get_value(v126);
    v23[2](v23);
  }
  v127 = (const __CFDictionary *)PLDictionaryFromXPCDictionary();
  if (v127)
  {
    CMTimeMakeFromDictionary(&buf.start, v127);
    v128 = *(_OWORD *)&buf.start.value;
    v22->_bestKeyFrameTime.epoch = buf.start.epoch;
    *(_OWORD *)&v22->_bestKeyFrameTime.value = v128;
    v23[2](v23);
  }
  v129 = xpc_dictionary_get_BOOL(v8, "unsetBestKeyFrameTime");
  v22->_didUnsetBestKeyFrameTime = v129;
  if (v129)
    v23[2](v23);
  PLDataFromXPCDictionary();
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  if (v130)
  {
    objc_storeStrong((id *)&v22->_bestKeyFrameJPEGData, v130);
    v23[2](v23);
  }
  PLDataFromXPCDictionary();
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  if (v131)
  {
    objc_storeStrong((id *)&v22->_computeSyncMediaAnalysisPayload, v131);
    v23[2](v23);
  }
  v132 = (const __CFDictionary *)PLDictionaryFromXPCDictionary();
  if (v132)
  {
    CMTimeRangeMakeFromDictionary(&buf, v132);
    v133 = *(_OWORD *)&buf.start.value;
    v134 = *(_OWORD *)&buf.duration.timescale;
    *(_OWORD *)&v22->_bestVideoTimeRange.start.epoch = *(_OWORD *)&buf.start.epoch;
    *(_OWORD *)&v22->_bestVideoTimeRange.duration.timescale = v134;
    *(_OWORD *)&v22->_bestVideoTimeRange.start.value = v133;
    v23[2](v23);
  }
  v244 = v131;
  v245 = v130;
  v135 = (const __CFDictionary *)PLDictionaryFromXPCDictionary();
  if (v135)
  {
    CMTimeRangeMakeFromDictionary(&buf, v135);
    v136 = *(_OWORD *)&buf.start.value;
    v137 = *(_OWORD *)&buf.duration.timescale;
    *(_OWORD *)&v22->_animatedStickerTimeRange.start.epoch = *(_OWORD *)&buf.start.epoch;
    *(_OWORD *)&v22->_animatedStickerTimeRange.duration.timescale = v137;
    *(_OWORD *)&v22->_animatedStickerTimeRange.start.value = v136;
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "blurrinessScore");
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  if (v138)
  {
    v22->_didSetBlurrinessScore = 1;
    value = xpc_double_get_value(v138);
    v22->_blurrinessScore = value;
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "exposureScore");
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  if (v140)
  {
    v22->_didSetExposureScore = 1;
    v141 = xpc_double_get_value(v140);
    v22->_exposureScore = v141;
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "audioScore");
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  if (v142)
  {
    v22->_didSetAudioScore = 1;
    v143 = xpc_double_get_value(v142);
    v22->_audioScore = v143;
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "settlingEffectScore");
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  if (v144)
  {
    v22->_didSetSettlingEffectScore = 1;
    v145 = xpc_double_get_value(v144);
    v22->_settlingEffectScore = v145;
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "wallpaperScore");
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  if (v146)
  {
    v22->_didSetWallpaperScore = 1;
    v147 = xpc_double_get_value(v146);
    v22->_wallpaperScore = v147;
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "autoplaySuggestionScore");
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  if (v148)
  {
    v22->_didSetAutoplaySuggestionScore = 1;
    v149 = xpc_double_get_value(v148);
    v22->_autoplaySuggestionScore = v149;
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "videoStickerSuggestionScore");
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  if (v150)
  {
    v22->_didSetVideoStickerSuggestionScore = 1;
    v151 = xpc_double_get_value(v150);
    v22->_videoStickerSuggestionScore = v151;
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "videoScore");
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  if (v152)
  {
    v22->_didSetVideoScore = 1;
    v153 = xpc_double_get_value(v152);
    v22->_videoScore = v153;
    v23[2](v23);
  }
  v247 = (void *)v46;
  xpc_dictionary_get_value(v8, "activityScore");
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  if (v154)
  {
    v22->_didSetActivityScore = 1;
    v155 = xpc_double_get_value(v154);
    v22->_activityScore = v155;
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "faceCount");
  v156 = (void *)objc_claimAutoreleasedReturnValue();

  if (v156)
  {
    v22->_didSetFaceCount = 1;
    v22->_faceCount = xpc_uint64_get_value(v156);
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "audioClassification");
  v157 = (void *)objc_claimAutoreleasedReturnValue();

  if (v157)
  {
    v22->_didSetAudioClassification = 1;
    v22->_audioClassification = xpc_int64_get_value(v157);
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "probableRotationDirection");
  v158 = (void *)objc_claimAutoreleasedReturnValue();

  if (v158)
  {
    v22->_probableRotationDirection = xpc_int64_get_value(v158);
    v22->_didSetProbableRotationDirection = 1;
  }
  xpc_dictionary_get_value(v8, "probableRotationDirectionConfidence");
  v159 = (void *)objc_claimAutoreleasedReturnValue();

  if (v159)
  {
    v160 = xpc_double_get_value(v159);
    v22->_probableRotationDirectionConfidence = v160;
    v22->_didSetProbableRotationDirectionConfidence = 1;
  }
  xpc_dictionary_get_value(v8, "colorNormalizationData");
  v161 = (void *)objc_claimAutoreleasedReturnValue();

  if (v161)
  {
    PLDataFromXPCDataObject();
    v162 = objc_claimAutoreleasedReturnValue();
    colorNormalizationData = v22->_colorNormalizationData;
    v22->_colorNormalizationData = (NSData *)v162;

  }
  if (xpc_dictionary_get_BOOL(v8, "resetCharacterRecognitionProperties"))
  {
    v22->_resetCharacterRecognitionProperties = 1;
    v23[2](v23);
  }
  else
  {
    xpc_dictionary_get_value(v8, "characterRecognitionProperties");
    v164 = objc_claimAutoreleasedReturnValue();

    if (v164)
    {
      v22->_didSetCharacterRecognitionData = 1;
      PLDictionaryFromXPCObject();
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "characterRecognitionData");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "objectForKeyedSubscript:", v166);
      v167 = objc_claimAutoreleasedReturnValue();
      characterRecognitionData = v22->_characterRecognitionData;
      v22->_characterRecognitionData = (NSData *)v167;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "machineReadableCodeData");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "objectForKeyedSubscript:", v169);
      v170 = objc_claimAutoreleasedReturnValue();
      machineReadableCodeData = v22->_machineReadableCodeData;
      v22->_machineReadableCodeData = (NSData *)v170;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "characterRecognitionAlgorithmVersion");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "objectForKeyedSubscript:", v172);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      v22->_characterRecognitionAlgorithmVersion = objc_msgSend(v173, "integerValue");

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "characterRecognitionAdjustmentVersion");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "objectForKeyedSubscript:", v174);
      v175 = objc_claimAutoreleasedReturnValue();
      characterRecognitionAdjustmentVersion = v22->_characterRecognitionAdjustmentVersion;
      v22->_characterRecognitionAdjustmentVersion = (NSDate *)v175;

      v23[2](v23);
      v161 = (void *)v164;
    }
    else
    {
      v161 = 0;
    }
  }
  if (xpc_dictionary_get_BOOL(v8, "resetVisualSearchProperties"))
  {
    v22->_resetVisualSearchProperties = 1;
    v23[2](v23);
  }
  else
  {
    xpc_dictionary_get_value(v8, "visualSearchProperties");
    v177 = objc_claimAutoreleasedReturnValue();

    if (!v177)
      goto LABEL_164;
    v22->_didSetVisualSearchProperties = 1;
    PLDictionaryFromXPCObject();
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "visualSearchData");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "objectForKeyedSubscript:", v179);
    v180 = objc_claimAutoreleasedReturnValue();
    visualSearchData = v22->_visualSearchData;
    v22->_visualSearchData = (NSData *)v180;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetVisualSearchData");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "objectForKeyedSubscript:", v182);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    v22->_didSetVisualSearchData = objc_msgSend(v183, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetStickerConfidenceScore");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "objectForKeyedSubscript:", v184);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v22->_didSetStickerConfidenceScore = objc_msgSend(v185, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "stickerConfidenceScore");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "objectForKeyedSubscript:", v186);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "floatValue");
    v22->_stickerConfidenceScore = v188;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "visualSearchAlgorithmVersion");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "objectForKeyedSubscript:", v189);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v22->_visualSearchAlgorithmVersion = objc_msgSend(v190, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "stickerConfidenceScoreAlgorithmVersion");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "objectForKeyedSubscript:", v191);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v22->_stickerConfidenceScoreAlgorithmVersion = objc_msgSend(v192, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "visualSearchAdjustmentVersion");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "objectForKeyedSubscript:", v193);
    v194 = objc_claimAutoreleasedReturnValue();
    visualSearchAdjustmentVersion = v22->_visualSearchAdjustmentVersion;
    v22->_visualSearchAdjustmentVersion = (NSDate *)v194;

    v23[2](v23);
    v161 = (void *)v177;
  }

LABEL_164:
  xpc_dictionary_get_value(v8, "sceneprintData");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  if (v196)
  {
    v22->_didSetSceneprintData = 1;
    PLDataFromXPCDataObject();
    v197 = objc_claimAutoreleasedReturnValue();
    sceneprintData = v22->_sceneprintData;
    v22->_sceneprintData = (NSData *)v197;

    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "duplicateMatchingData");
  v199 = (void *)objc_claimAutoreleasedReturnValue();

  if (v199)
  {
    v22->_didSetDuplicateMatchingData = 1;
    PLDataFromXPCDictionary();
    v200 = objc_claimAutoreleasedReturnValue();
    duplicateMatchingData = v22->_duplicateMatchingData;
    v22->_duplicateMatchingData = (NSData *)v200;

    if (!-[NSData length](v22->_duplicateMatchingData, "length"))
    {
      v202 = v22->_duplicateMatchingData;
      v22->_duplicateMatchingData = 0;

    }
    PLDataFromXPCDictionary();
    v203 = objc_claimAutoreleasedReturnValue();
    duplicateMatchingAlternateData = v22->_duplicateMatchingAlternateData;
    v22->_duplicateMatchingAlternateData = (NSData *)v203;

    if (!-[NSData length](v22->_duplicateMatchingAlternateData, "length"))
    {
      v205 = v22->_duplicateMatchingAlternateData;
      v22->_duplicateMatchingAlternateData = 0;

    }
    v22->_duplicateProcessingSucceeded = xpc_dictionary_get_BOOL(v8, "duplicateProcessingSucceeded");
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "reverseLocationData");
  v206 = (void *)objc_claimAutoreleasedReturnValue();

  if (v206)
  {
    v22->_didSetReverseLocationData = 1;
    PLDataFromXPCDataObject();
    v207 = objc_claimAutoreleasedReturnValue();
    reverseLocationData = v22->_reverseLocationData;
    v22->_reverseLocationData = (NSData *)v207;

    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "objectSaliencyRectsData");
  v209 = (void *)objc_claimAutoreleasedReturnValue();

  if (v209)
  {
    v22->_didSetObjectSaliencyRectsData = 1;
    PLDataFromXPCDataObject();
    v210 = objc_claimAutoreleasedReturnValue();
    objectSaliencyRectsData = v22->_objectSaliencyRectsData;
    v22->_objectSaliencyRectsData = (NSData *)v210;

    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "reverseLocationDataIsValid");
  v212 = (void *)objc_claimAutoreleasedReturnValue();

  if (v212)
  {
    v22->_didSetReverseLocationDataIsValid = 1;
    v22->_reverseLocationDataIsValid = xpc_BOOL_get_value(v212);
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "shiftedLocation");
  v213 = (void *)objc_claimAutoreleasedReturnValue();

  if (v213)
  {
    PLDataFromXPCDataObject();
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    if (v214)
    {
      v215 = (void *)MEMORY[0x1E0CB3710];
      v216 = (void *)MEMORY[0x1E0C99E60];
      v217 = objc_opt_class();
      objc_msgSend(v216, "setWithObjects:", v217, objc_opt_class(), 0, v244, v130, v246);
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      v251 = 0;
      objc_msgSend(v215, "unarchivedObjectOfClasses:fromData:error:", v218, v214, &v251);
      v219 = objc_claimAutoreleasedReturnValue();
      v220 = v251;
      shiftedLocation = v22->_shiftedLocation;
      v22->_shiftedLocation = (CLLocation *)v219;

      if (v22->_shiftedLocation)
      {
        v22->_didSetShiftedLocation = 1;
        v23[2](v23);
      }
      else
      {
        PLPhotoKitGetLog();
        v223 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v220;
          _os_log_impl(&dword_1991EC000, v223, OS_LOG_TYPE_DEFAULT, "Failed to unarchive locationData, error: %@", (uint8_t *)&buf, 0xCu);
        }

      }
    }
    else
    {
      v22->_didSetShiftedLocation = 1;
      v222 = v22->_shiftedLocation;
      v22->_shiftedLocation = 0;

      v23[2](v23);
    }

  }
  xpc_dictionary_get_value(v8, "timeZoneName");
  v224 = (void *)objc_claimAutoreleasedReturnValue();

  if (v224)
  {
    v22->_didSetTimeZone = 1;
    PLStringFromXPCDictionary();
    v225 = objc_claimAutoreleasedReturnValue();
    timeZoneName = v22->_timeZoneName;
    v22->_timeZoneName = (NSString *)v225;

    v22->_timeZoneOffsetValue = xpc_dictionary_get_int64(v8, "timeZoneOffsetValue");
    v23[2](v23);
  }
  v22->_clientEntitled = v250;
  v22->_gpsHorizontalAccuracy = xpc_dictionary_get_double(v8, "gpsHorizontalAccuracy");
  v22->_didSetGpsHorizontalAccuracy = 1;
  v23[2](v23);
  xpc_dictionary_get_value(v8, "screenTimeDeviceImageSensitivity");
  v227 = (void *)objc_claimAutoreleasedReturnValue();

  if (v227)
  {
    v22->_didSetScreenTimeDeviceImageSensitivity = 1;
    v22->_screenTimeDeviceImageSensitivity = xpc_int64_get_value(v227);
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "syndicationProcessingValue");
  v228 = (void *)objc_claimAutoreleasedReturnValue();

  if (v228)
  {
    v22->_syndicationProcessingValue = xpc_uint64_get_value(v228);
    v22->_didSetSyndicationProcessingValue = 1;
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "syndicationProcessingVersion");
  v229 = (void *)objc_claimAutoreleasedReturnValue();

  if (v229)
  {
    v22->_syndicationProcessingVersion = xpc_uint64_get_value(v229);
    v22->_didSetSyndicationProcessingVersion = 1;
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "syndicationIdentifier");
  v230 = (void *)objc_claimAutoreleasedReturnValue();

  if (v230)
  {
    PLStringFromXPCDictionary();
    v231 = objc_claimAutoreleasedReturnValue();
    syndicationIdentifier = v22->_syndicationIdentifier;
    v22->_syndicationIdentifier = (NSString *)v231;

    v22->_didSetSyndicationIdentifier = 1;
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "faceAnalysisVersion");
  v233 = (void *)objc_claimAutoreleasedReturnValue();

  if (v233)
  {
    v22->_didSetFaceAnalysisVersion = 1;
    v22->_faceAnalysisVersion = xpc_int64_get_value(v233);
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "localAnalysisStage");
  v234 = (void *)objc_claimAutoreleasedReturnValue();

  if (v234)
  {
    v22->_didSetLocalAnalysisStage = 1;
    v22->_localAnalysisStage = xpc_int64_get_value(v234);
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "viewPresentation");
  v235 = (void *)objc_claimAutoreleasedReturnValue();

  if (v235)
  {
    v22->_didSetViewPresentation = 1;
    v22->_viewPresentation = xpc_int64_get_value(v235);
    v23[2](v23);
  }
  v22->_resetGeneratedAssetDescriptionProperties = xpc_dictionary_get_BOOL(v8, "ResetGeneratedAssetDescriptionKey");
  v236 = xpc_dictionary_get_BOOL(v8, "DidSetGeneratedAssetDescriptionKey");
  v22->_didSetGeneratedAssetDescriptionProperties = v236;
  if (v22->_resetGeneratedAssetDescriptionProperties)
    goto LABEL_207;
  if (v236)
  {
    PLDictionaryFromXPCDictionary();
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    v238 = objc_msgSend(v237, "mutableCopy");
    generatedAssetDescriptionDictionaries = v22->_generatedAssetDescriptionDictionaries;
    v22->_generatedAssetDescriptionDictionaries = (NSMutableDictionary *)v238;

LABEL_207:
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "PtpTrashedStateKey");
  v240 = (void *)objc_claimAutoreleasedReturnValue();

  if (v240)
  {
    v22->_ptpTrashedState = xpc_int64_get_value(v240);
    v22->_didSetPtpTrashedState = 1;
    v23[2](v23);
  }
  xpc_dictionary_get_value(v8, "savedAssetType");
  v241 = (void *)objc_claimAutoreleasedReturnValue();

  if (v241)
  {
    v22->_didSetSavedAssetType = 1;
    v22->_savedAssetType = xpc_int64_get_value(v241);
    v23[2](v23);
  }

  v11 = v248;
  v9 = v249;
LABEL_213:
  v242 = v22;

  return v242;
}

- (PHObjectPlaceholder)placeholderForCreatedAsset
{
  return 0;
}

- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "type") && objc_msgSend(v5, "type") != 1)
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0CB2D50];
      v10[0] = CFSTR("Change must be performed within the sharedPhotoLibrary or sharedMomentSharePhotoLibrary");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (NSDate)creationDate
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("dateCreated"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setCreationDate:(NSDate *)creationDate
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSDate *v10;

  v10 = creationDate;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("dateCreated"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("dateCreated"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("dateCreated"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("dateCreated"));
  }

}

- (NSDate)modificationDate
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("modificationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setModificationDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("modificationDate"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("modificationDate"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("modificationDate"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("modificationDate"));
  }

}

- (NSDate)addedDate
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("addedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setAddedDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("addedDate"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("addedDate"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("addedDate"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("addedDate"));
  }

}

- (BOOL)isFavorite
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("favorite"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setFavorite:(BOOL)favorite
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = favorite;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("favorite"));

}

- (BOOL)isHidden
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("hidden"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setHidden:(BOOL)hidden
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = hidden;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("hidden"));

}

- (double)curationScore
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("curationScore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setCurationScore:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("curationScore"));

}

- (double)highlightVisibilityScore
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("highlightVisibilityScore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setHighlightVisibilityScore:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("highlightVisibilityScore"));

}

- (double)highlightPromotionScore
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("highlightPromotionScore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setHighlightPromotionScore:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("highlightPromotionScore"));

}

- (float)overallAestheticScore
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("overallAestheticScore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "floatValue");
  v7 = v6;

  return v7;
}

- (void)setOverallAestheticScore:(float)a3
{
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  *(float *)&v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mutations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("overallAestheticScore"));

}

- (double)iconicScore
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("iconicScore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setIconicScore:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("iconicScore"));

}

- (signed)generativeMemoryCreationEligibilityState
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("generativeMemoryCreationEligibilityState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (__int16)v3;
}

- (void)setGenerativeMemoryCreationEligibilityState:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("generativeMemoryCreationEligibilityState"));

}

- (CLLocation)location
{
  CLLocation *v3;
  void *v4;
  int v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  v3 = self->_updatedLocation;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CLLocation isEqual:](v3, "isEqual:", v4);

  if (v5)
  {

    v3 = 0;
  }
  return v3;
}

- (void)setLocation:(CLLocation *)location
{
  void *v4;
  CLLocation *v5;
  CLLocation *obj;

  obj = location;
  -[PHChangeRequest didMutate](self, "didMutate");
  v4 = obj;
  if (!obj)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_updatedLocation, v4);
  v5 = obj;
  if (!obj)
  {

    v5 = 0;
  }

}

- (void)setGpsHorizontalAccuracy:(double)a3
{
  self->_gpsHorizontalAccuracy = a3;
  self->_didSetGpsHorizontalAccuracy = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (NSString)assetDescription
{
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  return self->_assetDescription;
}

- (NSString)accessibilityDescription
{
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  return self->_accessibilityDescription;
}

- (NSString)title
{
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  return self->_title;
}

- (int64_t)ptpTrashedState
{
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  return self->_ptpTrashedState;
}

- (void)setPtpTrashedState:(int64_t)a3
{
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_ptpTrashedState = a3;
  self->_didSetPtpTrashedState = 1;
}

- (float)wellFramedSubjectScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("wellFramedSubjectScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setWellFramedSubjectScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("wellFramedSubjectScore"));

}

- (float)wellChosenSubjectScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("wellChosenSubjectScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setWellChosenSubjectScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("wellChosenSubjectScore"));

}

- (float)tastefullyBlurredScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("tastefullyBlurredScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setTastefullyBlurredScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("tastefullyBlurredScore"));

}

- (float)sharplyFocusedSubjectScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("sharplyFocusedSubjectScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setSharplyFocusedSubjectScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("sharplyFocusedSubjectScore"));

}

- (float)wellTimedShotScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("wellTimedShotScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setWellTimedShotScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("wellTimedShotScore"));

}

- (float)pleasantLightingScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("pleasantLightingScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setPleasantLightingScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("pleasantLightingScore"));

}

- (float)pleasantReflectionsScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("pleasantReflectionsScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setPleasantReflectionsScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("pleasantReflectionsScore"));

}

- (float)harmoniousColorScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("harmoniousColorScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setHarmoniousColorScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("harmoniousColorScore"));

}

- (float)livelyColorScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("livelyColorScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setLivelyColorScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("livelyColorScore"));

}

- (float)pleasantSymmetryScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("pleasantSymmetryScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setPleasantSymmetryScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("pleasantSymmetryScore"));

}

- (float)pleasantPatternScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("pleasantPatternScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setPleasantPatternScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("pleasantPatternScore"));

}

- (float)immersivenessScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("immersivenessScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setImmersivenessScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("immersivenessScore"));

}

- (float)pleasantPerspectiveScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("pleasantPerspectiveScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setPleasantPerspectiveScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("pleasantPerspectiveScore"));

}

- (float)pleasantPostProcessingScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("pleasantPostProcessingScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setPleasantPostProcessingScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("pleasantPostProcessingScore"));

}

- (float)noiseScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("noiseScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setNoiseScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("noiseScore"));

}

- (float)failureScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("failureScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setFailureScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("failureScore"));

}

- (float)pleasantCompositionScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("pleasantCompositionScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setPleasantCompositionScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("pleasantCompositionScore"));

}

- (float)interestingSubjectScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("interestingSubjectScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setInterestingSubjectScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("interestingSubjectScore"));

}

- (float)intrusiveObjectPresenceScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("intrusiveObjectPresenceScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setIntrusiveObjectPresenceScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("intrusiveObjectPresenceScore"));

}

- (float)pleasantCameraTiltScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("pleasantCameraTiltScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setPleasantCameraTiltScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("pleasantCameraTiltScore"));

}

- (float)lowLight
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("lowLight"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setLowLight:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("lowLight"));

}

- (float)behavioralScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("behavioralScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setBehavioralScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("behavioralScore"));

}

- (float)interactionScore
{
  void *v3;
  float v4;
  float v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[NSMutableDictionary objectForKey:](self->_computedAttributeMutations, "objectForKey:", CFSTR("interactionScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setInteractionScore:(float)a3
{
  double v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *computedAttributeMutations;
  id v8;

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;

  }
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computedAttributeMutations, "setObject:forKeyedSubscript:", v8, CFSTR("interactionScore"));

}

- (void)setAssetDescription:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  NSString *v6;
  NSString *assetDescription;

  v4 = (__CFString *)a3;
  -[PHChangeRequest didMutate](self, "didMutate");
  if (v4)
    v5 = v4;
  else
    v5 = &stru_1E35DFFF8;
  v6 = (NSString *)-[__CFString copy](v5, "copy");

  assetDescription = self->_assetDescription;
  self->_assetDescription = v6;

}

- (void)setAccessibilityDescription:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  NSString *v6;
  NSString *accessibilityDescription;

  v4 = (__CFString *)a3;
  -[PHChangeRequest didMutate](self, "didMutate");
  if (v4)
    v5 = v4;
  else
    v5 = &stru_1E35DFFF8;
  v6 = (NSString *)-[__CFString copy](v5, "copy");

  accessibilityDescription = self->_accessibilityDescription;
  self->_accessibilityDescription = v6;

}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;

  v4 = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didSetTitle = 1;
  v5 = (NSString *)objc_msgSend(v4, "copy");

  title = self->_title;
  self->_title = v5;

}

- (void)_setSceneClassifications:(id)a3 ofType:(int64_t)a4 timestamp:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *sceneClassificationDictionariesByType;
  uint64_t v18;
  PHAssetChangeRequest *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("adjustmentVersion must be a valid NSDate on iOS"), 0);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v32);
    }
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v15, "classificationType") != a4)
        {
          v28 = (void *)MEMORY[0x1E0C99DA0];
          v29 = *MEMORY[0x1E0C99768];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Classification type (%ld) does not match expected type (%ld). PHSceneClassification.type should equal expected type in 'ofType' parameter."), "-[PHAssetChangeRequest _setSceneClassifications:ofType:timestamp:]", objc_msgSend(v15, "classificationType"), a4);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, v30, 0);
          v31 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v31);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v12);
  }

  if (!self->_sceneClassificationDictionariesByType)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    sceneClassificationDictionariesByType = self->_sceneClassificationDictionariesByType;
    self->_sceneClassificationDictionariesByType = v16;

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sceneClassifications");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v33;
  v18 = objc_msgSend(v10, "count");
  v19 = self;
  if (v18)
  {
    objc_msgSend(v10, "valueForKey:", CFSTR("dictionaryRepresentation"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0C9AA60];
  }
  v43[0] = v20;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sceneAnalysisTimestamp");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v21;
  v22 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v19->_sceneClassificationDictionariesByType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v23, v25);

  if (!v9)
  if (v18)

  v19->_didSetSceneClassifications = 1;
  PLAssetAnalysisGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    -[PHChangeRequest uuid](v19, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v39 = v27;
    v40 = 2112;
    v41 = v9;
    _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_DEBUG, "Set scene classifications - uuid: %@, adjustment timestamp: %@", buf, 0x16u);

  }
}

- (void)_addVersion:(signed __int16)a3 withKey:(id)a4 andType:(int64_t)a5 toDictionary:(id)a6
{
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a6;
  v11 = a4;
  objc_msgSend(v9, "numberWithInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v15);

}

- (void)setLocationBasedSceneClassifications:(id)a3 ofType:(int64_t)a4 version:(signed __int16)a5 timestamp:(id)a6
{
  id v9;
  id v10;
  NSMutableDictionary *sceneClassificationDictionariesByType;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned int v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v21 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  sceneClassificationDictionariesByType = self->_sceneClassificationDictionariesByType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sceneClassificationDictionariesByType, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sceneAnalysisVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 1246, CFSTR("Attempting to set normal and location analysis scene classifications in same change request."));

  }
  -[PHAssetChangeRequest _setSceneClassifications:ofType:timestamp:](self, "_setSceneClassifications:ofType:timestamp:", v9, a4, v10, a2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sceneAnalysisLocationVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetChangeRequest _addVersion:withKey:andType:toDictionary:](self, "_addVersion:withKey:andType:toDictionary:", v21, v16, a4, self->_sceneClassificationDictionariesByType);

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didSetSceneClassifications = 1;
  PLAssetAnalysisGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    -[PHChangeRequest uuid](self, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v18;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEBUG, "Set scene classifications - uuid: %@, adjustment timestamp: %@", buf, 0x16u);

  }
}

- (void)setSceneClassifications:(id)a3 ofType:(int64_t)a4 version:(signed __int16)a5 timestamp:(id)a6
{
  id v9;
  id v10;
  NSMutableDictionary *sceneClassificationDictionariesByType;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned int v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v21 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  sceneClassificationDictionariesByType = self->_sceneClassificationDictionariesByType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sceneClassificationDictionariesByType, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sceneAnalysisLocationVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 1255, CFSTR("Attempting to set normal and location analysis scene classifications in same change request."));

  }
  -[PHAssetChangeRequest _setSceneClassifications:ofType:timestamp:](self, "_setSceneClassifications:ofType:timestamp:", v9, a4, v10, a2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sceneAnalysisVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetChangeRequest _addVersion:withKey:andType:toDictionary:](self, "_addVersion:withKey:andType:toDictionary:", v21, v16, a4, self->_sceneClassificationDictionariesByType);

  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didSetSceneClassifications = 1;
  PLAssetAnalysisGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    -[PHChangeRequest uuid](self, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v18;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEBUG, "Set scene classifications - uuid: %@, adjustment timestamp: %@", buf, 0x16u);

  }
}

- (void)setImageEmbeddingVersion:(signed __int16)a3
{
  int v3;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  self->_imageEmbeddingVersion = a3;
  self->_didSetImageEmbeddingVersion = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
  PLAssetAnalysisGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[PHChangeRequest uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "Set image embedding version - uuid: %@, version: %d", (uint8_t *)&v7, 0x12u);

  }
}

- (void)setVideoEmbeddingVersion:(signed __int16)a3
{
  int v3;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  self->_videoEmbeddingVersion = a3;
  self->_didSetVideoEmbeddingVersion = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
  PLAssetAnalysisGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[PHChangeRequest uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "Set video embedding version - uuid: %@, version: %d", (uint8_t *)&v7, 0x12u);

  }
}

- (void)setPhotoIrisVisibilityState:(unsigned __int16)a3
{
  self->_photoIrisVisibilityState = a3;
  self->_didSetVisibilityState = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setPreferredCropRectWithNormalizedRect:(CGRect)a3
{
  BOOL v4;
  int64_t v5;

  v5 = 0;
  v4 = 0;
  -[PHAssetChangeRequest setRectWithNormalizedRect:forPackedRect:forSetFlag:](self, "setRectWithNormalizedRect:forPackedRect:forSetFlag:", &v5, &v4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  self->_packedPreferredCropRect = v5;
  self->_didSetPackedPreferredCropRect = v4;
}

- (void)setAcceptableCropRectWithNormalizedRect:(CGRect)a3
{
  BOOL v4;
  int64_t v5;

  v5 = 0;
  v4 = 0;
  -[PHAssetChangeRequest setRectWithNormalizedRect:forPackedRect:forSetFlag:](self, "setRectWithNormalizedRect:forPackedRect:forSetFlag:", &v5, &v4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  self->_packedAcceptableCropRect = v5;
  self->_didSetPackedAcceptableCropRect = v4;
}

- (void)setRectWithNormalizedRect:(CGRect)a3 forPackedRect:(int64_t *)a4 forSetFlag:(BOOL *)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsNull(a3))
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  if (!PLCGRectIsNormalized())
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Invalid CGRect passed to %@, rect must be non-zero normalized or CGRectNull"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v18);
  }
  *a4 = MEMORY[0x19AEBE1A0](x, y, width, height);
  *a5 = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setSceneprintData:(id)a3
{
  NSData *v4;
  NSData *sceneprintData;

  v4 = (NSData *)a3;
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didSetSceneprintData = 1;
  sceneprintData = self->_sceneprintData;
  self->_sceneprintData = v4;

}

- (void)setDuplicateMatchingData:(id)a3 duplicateMatchingAlternateData:(id)a4
{
  -[PHAssetChangeRequest setDuplicateMatchingData:duplicateMatchingAlternateData:processingSucceeded:](self, "setDuplicateMatchingData:duplicateMatchingAlternateData:processingSucceeded:", a3, a4, 1);
}

- (void)setDuplicateMatchingData:(id)a3 duplicateMatchingAlternateData:(id)a4 processingSucceeded:(BOOL)a5
{
  NSData *v8;
  NSData *v9;
  NSData *duplicateMatchingData;
  NSData *v11;
  NSData *duplicateMatchingAlternateData;

  v8 = (NSData *)a3;
  v9 = (NSData *)a4;
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didSetDuplicateMatchingData = 1;
  duplicateMatchingData = self->_duplicateMatchingData;
  self->_duplicateMatchingData = v8;
  v11 = v8;

  duplicateMatchingAlternateData = self->_duplicateMatchingAlternateData;
  self->_duplicateMatchingAlternateData = v9;

  self->_duplicateProcessingSucceeded = a5;
}

- (void)setReverseLocationData:(id)a3
{
  NSData *v4;
  NSData *reverseLocationData;

  v4 = (NSData *)a3;
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didSetReverseLocationData = 1;
  reverseLocationData = self->_reverseLocationData;
  self->_reverseLocationData = v4;

}

- (void)setReverseLocationDataIsValid:(BOOL)a3
{
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didSetReverseLocationDataIsValid = 1;
  self->_reverseLocationDataIsValid = a3;
}

- (void)setShiftedLocation:(id)a3
{
  CLLocation *v4;
  CLLocation *shiftedLocation;

  v4 = (CLLocation *)a3;
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didSetShiftedLocation = 1;
  shiftedLocation = self->_shiftedLocation;
  self->_shiftedLocation = v4;

}

- (void)setObjectSaliencyRects:(id)a3
{
  id v6;
  NSData *v7;
  id v8;
  NSData *objectSaliencyRectsData;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didSetObjectSaliencyRectsData = 1;
  if ((unint64_t)objc_msgSend(v6, "count") <= 3 && objc_msgSend(v6, "count"))
  {
    -[PHAssetChangeRequest _validateObjectSaliencyRects:](self, "_validateObjectSaliencyRects:", v6);
    objc_storeStrong((id *)&self->_objectSaliencyRects, a3);
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v17);
    v7 = (NSData *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    objectSaliencyRectsData = self->_objectSaliencyRectsData;
    self->_objectSaliencyRectsData = v7;

    if (!self->_objectSaliencyRectsData)
    {
      PLPhotoKitGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v8;
        _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "Failed to archive objectSaliencyRects, error: %@", buf, 0xCu);
      }

    }
  }
  else if ((unint64_t)objc_msgSend(v6, "count") >= 4)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Invalid CGRect passed to %@, rect must be non-zero normalized or CGRectNull"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v16);
  }

}

- (void)_validateObjectSaliencyRects:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        MEMORY[0x19AEBD9FC](*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        if ((PLCGRectIsNormalized() & 1) == 0)
        {
          v9 = (void *)MEMORY[0x1E0C99DA0];
          v10 = *MEMORY[0x1E0C99778];
          v11 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromSelector(a2);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("Invalid CGRect passed to %@, rect must be non-zero normalized or CGRectNull"), v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v13, 0);
          v14 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v14);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (void)setAlternateImportImageDate:(id)a3
{
  NSDate *v4;
  NSDate *alternateImportImageDate;

  v4 = (NSDate *)a3;
  -[PHChangeRequest didMutate](self, "didMutate");
  alternateImportImageDate = self->_alternateImportImageDate;
  self->_alternateImportImageDate = v4;

}

- (void)setGeneratedAssetDescription:(id)a3 analysisVersion:(int64_t)a4 sourceType:(int64_t)a5
{
  id v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *generatedAssetDescriptionDictionaries;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 1387, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("description"));

  }
  if (a4 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 1388, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("version > 0"));

  }
  if ((unint64_t)a5 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 1389, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceType >= 0 && sourceType <= PHGeneratedAssetDescriptionSourceTypeMovie"));

  }
  if (self->_resetGeneratedAssetDescriptionProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 1390, CFSTR("Attempting to set and reset generated asset description in same change request."));

  }
  -[PHChangeRequest didMutate](self, "didMutate");
  if (!self->_generatedAssetDescriptionDictionaries)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    generatedAssetDescriptionDictionaries = self->_generatedAssetDescriptionDictionaries;
    self->_generatedAssetDescriptionDictionaries = v10;

  }
  v20[0] = CFSTR("descriptionText");
  v20[1] = CFSTR("analysisVersion");
  v21[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self->_generatedAssetDescriptionDictionaries;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

  self->_didSetGeneratedAssetDescriptionProperties = 1;
}

- (void)resetGeneratedAssetDescriptions
{
  void *v4;

  -[PHChangeRequest didMutate](self, "didMutate");
  if (self->_didSetGeneratedAssetDescriptionProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 1403, CFSTR("Attempting to set and reset generated asset description in same change request."));

  }
  self->_resetGeneratedAssetDescriptionProperties = 1;
}

- (void)_setSavedAssetType:(signed __int16)a3
{
  self->_didSetSavedAssetType = 1;
  self->_savedAssetType = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)addFaces:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHAssetChangeRequest _mutableFaceObjectIDsAndUUIDs](self, "_mutableFaceObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
}

- (void)removeFaces:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHAssetChangeRequest _mutableFaceObjectIDsAndUUIDs](self, "_mutableFaceObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsInArray:", v5);

  }
}

- (void)setTemporalFaces:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  PHRelationshipChangeRequestHelper *temporalFacesHelper;
  void *v8;
  id v9;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mutableCopy");

  if (v5)
    v6 = (void *)v5;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v9 = v6;
  -[PHChangeRequest didMutate](self, "didMutate");
  -[PHAssetChangeRequest _prepareExistingIDsForTemporalFacesIfNeeded](self, "_prepareExistingIDsForTemporalFacesIfNeeded");
  temporalFacesHelper = self->_temporalFacesHelper;
  v8 = (void *)objc_msgSend(v9, "mutableCopy");
  -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](temporalFacesHelper, "setMutableObjectIDsAndUUIDs:", v8);

}

- (id)faceAdjustmentVersion
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("faceAdjustmentVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setFaceAdjustmentVersion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("faceAdjustmentVersion"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("faceAdjustmentVersion"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("faceAdjustmentVersion"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("faceAdjustmentVersion"));
  }

}

- (void)incrementPlayCount
{
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_incrementPlayCount = 1;
}

- (void)incrementShareCount
{
  NSDate *v3;
  NSDate *lastSharedDate;

  -[PHChangeRequest didMutate](self, "didMutate");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastSharedDate = self->_lastSharedDate;
  self->_lastSharedDate = v3;

  self->_incrementShareCount = 1;
}

- (void)incrementViewCount
{
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_incrementViewCount = 1;
}

- (void)setVariationSuggestionStates:(unint64_t)a3 forVariationType:(unint64_t)a4
{
  char v5;
  char v7;
  unint64_t v8;
  uint64_t v9;

  v5 = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didSetVariationSuggestionStates = 1;
  v7 = 6 * a4 - 6;
  v8 = (unint64_t)(v5 & 0x3F) << v7;
  if (!a4)
    v8 = 0;
  v9 = 63 << v7;
  if (!a4)
    v9 = 0;
  self->_variationSuggestionStates |= v8;
  self->_variationSuggestionStatesMask |= v9;
}

- (void)setKeywordTitles:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *keywordTitles;

  v4 = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didSetKeywordTitles = 1;
  v5 = (NSSet *)objc_msgSend(v4, "copy");

  keywordTitles = self->_keywordTitles;
  self->_keywordTitles = v5;

}

- (void)_setOriginalAsset:(id)a3
{
  objc_storeStrong((id *)&self->_originalAsset, a3);
}

- (void)addKeywords:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHAssetChangeRequest _mutableKeywordObjectIDsAndUUIDs](self, "_mutableKeywordObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
}

- (void)removeKeywords:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHAssetChangeRequest _mutableKeywordObjectIDsAndUUIDs](self, "_mutableKeywordObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsInArray:", v5);

  }
}

- (id)_mutableKeywordObjectIDsAndUUIDs
{
  PHRelationshipChangeRequestHelper *keywordsHelper;
  void *v4;

  keywordsHelper = self->_keywordsHelper;
  -[PHAssetChangeRequest _existentKeywordObjectIDs](self, "_existentKeywordObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHRelationshipChangeRequestHelper prepareIfNeededWithExistentObjectIDs:](keywordsHelper, "prepareIfNeededWithExistentObjectIDs:", v4);

  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_keywordsHelper, "mutableObjectIDsAndUUIDs");
}

- (id)_existentKeywordObjectIDs
{
  void *originalAsset;
  void *v3;
  void *v4;
  void *v5;

  originalAsset = self->_originalAsset;
  if (originalAsset)
  {
    -[PHChangeRequest photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "librarySpecificFetchOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForKeywordsForAsset:options:](PHQuery, "queryForKeywordsForAsset:options:", originalAsset, v4);
    originalAsset = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:](PHRelationshipChangeRequestHelper, "existentObjectIDsUsingQuery:", originalAsset);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_prepareFacesHelperWithFetchResult:(id)a3
{
  void *v4;
  PHRelationshipChangeRequestHelper *facesHelper;
  void *v6;
  id v7;

  v7 = a3;
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_facesHelper, "originalObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    facesHelper = self->_facesHelper;
    objc_msgSend(v7, "fetchedObjectIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](facesHelper, "setOriginalObjectIDs:", v6);

  }
}

- (void)_prepareFaceIDsIfNeeded
{
  void *v3;
  PHAsset *originalAsset;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PHRelationshipChangeRequestHelper *facesHelper;
  void *v10;
  id v11;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_facesHelper, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    originalAsset = self->_originalAsset;
    if (originalAsset)
    {
      +[PHQuery queryForFacesInAsset:options:](PHQuery, "queryForFacesInAsset:options:", originalAsset, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "executeQuery");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetChangeRequest _prepareFacesHelperWithFetchResult:](self, "_prepareFacesHelperWithFetchResult:", v6);

    }
    -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_facesHelper, "originalObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_facesHelper, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  }
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_facesHelper, "mutableObjectIDsAndUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    facesHelper = self->_facesHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](facesHelper, "originalObjectIDs");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](facesHelper, "setMutableObjectIDsAndUUIDs:", v10);

  }
}

- (id)_mutableFaceObjectIDsAndUUIDs
{
  -[PHAssetChangeRequest _prepareFaceIDsIfNeeded](self, "_prepareFaceIDsIfNeeded");
  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_facesHelper, "mutableObjectIDsAndUUIDs");
}

- (void)_prepareExistingIDsForTemporalFacesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PHRelationshipChangeRequestHelper *temporalFacesHelper;
  void *v9;
  void *v10;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_temporalFacesHelper, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (self->_originalAsset)
    {
      -[PHChangeRequest photoLibrary](self, "photoLibrary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", v4, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setIncludeMediaAnalysisProcessingRangeTypes:", 2);
      +[PHQuery queryForFacesInAsset:options:](PHQuery, "queryForFacesInAsset:options:", self->_originalAsset, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "executeQuery");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      temporalFacesHelper = self->_temporalFacesHelper;
      objc_msgSend(v7, "fetchedObjectIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](temporalFacesHelper, "setOriginalObjectIDs:", v9);

    }
    -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_temporalFacesHelper, "originalObjectIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_temporalFacesHelper, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  }
}

- (void)setAdjustmentData:(id)a3 withRenderedJPEGData:(id)a4 orRenderedContentURL:(id)a5 penultimateRenderedJPEGData:(id)a6 isSubstandardRender:(BOOL)a7 fullSizeRenderSize:(CGSize)a8 renderedVideoComplementURL:(id)a9 penultimateRenderedVideoComplementURL:(id)a10
{
  -[PHAssetChangeRequest setAdjustmentData:withRenderedJPEGData:orRenderedContentURL:penultimateRenderedJPEGData:isSubstandardRender:fullSizeRenderSize:renderedVideoComplementURL:penultimateRenderedVideoComplementURL:optionalOriginalResourceChoice:](self, "setAdjustmentData:withRenderedJPEGData:orRenderedContentURL:penultimateRenderedJPEGData:isSubstandardRender:fullSizeRenderSize:renderedVideoComplementURL:penultimateRenderedVideoComplementURL:optionalOriginalResourceChoice:", a3, a4, a5, a6, a7, a9, a8.width, a8.height, a10, 0);
}

- (void)setAdjustmentData:(id)a3 withRenderedJPEGData:(id)a4 orRenderedContentURL:(id)a5 penultimateRenderedJPEGData:(id)a6 isSubstandardRender:(BOOL)a7 fullSizeRenderSize:(CGSize)a8 renderedVideoComplementURL:(id)a9 penultimateRenderedVideoComplementURL:(id)a10 optionalOriginalResourceChoice:(id)a11
{
  double height;
  double width;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  PHAsset *originalAsset;
  id v24;
  id v25;
  uint64_t v26;
  PHContentEditingOutput *v27;
  void *v28;
  void *v29;
  PHContentEditingOutput *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  height = a8.height;
  width = a8.width;
  v37 = a7;
  v42 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v39 = a9;
  v38 = a10;
  v22 = a11;
  originalAsset = self->_originalAsset;
  v24 = v21;
  v25 = v19;
  if (originalAsset)
    v26 = -[PHAsset mediaType](originalAsset, "mediaType");
  else
    v26 = 1;
  v27 = [PHContentEditingOutput alloc];
  -[PHChangeRequest photoLibrary](self, "photoLibrary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "photoLibraryURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[PHContentEditingOutput initWithAdjustmentBaseVersion:mediaType:appropriateForURL:](v27, "initWithAdjustmentBaseVersion:mediaType:appropriateForURL:", 0, v26, v29);

  -[PHContentEditingOutput setBaseVersion:](v30, "setBaseVersion:", objc_msgSend(v18, "baseVersion"));
  -[PHContentEditingOutput setAdjustmentData:](v30, "setAdjustmentData:", v18);
  v31 = v20;
  if (v20)
  {
    -[PHContentEditingOutput setRenderedContentURL:](v30, "setRenderedContentURL:", v20);
    v32 = v25;
    v33 = v24;
LABEL_8:
    v34 = v38;
    v35 = v39;
    goto LABEL_9;
  }
  v32 = v25;
  v33 = v24;
  if (v25)
  {
    -[PHContentEditingOutput setRenderedJPEGData:](v30, "setRenderedJPEGData:", v25);
    goto LABEL_8;
  }
  PLPhotoKitGetLog();
  v36 = objc_claimAutoreleasedReturnValue();
  v34 = v38;
  v35 = v39;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v18;
    _os_log_impl(&dword_1991EC000, v36, OS_LOG_TYPE_ERROR, "No rendered content provided for %@", buf, 0xCu);
  }

LABEL_9:
  -[PHContentEditingOutput setPenultimateRenderedJPEGData:](v30, "setPenultimateRenderedJPEGData:", v33);
  -[PHContentEditingOutput setIsSubstandardRender:](v30, "setIsSubstandardRender:", v37);
  -[PHContentEditingOutput setFullSizeRenderWidth:](v30, "setFullSizeRenderWidth:", (uint64_t)width);
  -[PHContentEditingOutput setFullSizeRenderHeight:](v30, "setFullSizeRenderHeight:", (uint64_t)height);
  -[PHContentEditingOutput setRenderedVideoComplementContentURL:](v30, "setRenderedVideoComplementContentURL:", v35);
  -[PHContentEditingOutput setPenultimateRenderedVideoComplementContentURL:](v30, "setPenultimateRenderedVideoComplementContentURL:", v34);
  if (v22)
    -[PHContentEditingOutput setOriginalResourceChoice:](v30, "setOriginalResourceChoice:", v22);
  -[PHAssetChangeRequest setContentEditingOutput:](self, "setContentEditingOutput:", v30);

}

- (void)setContentEditingOutput:(PHContentEditingOutput *)contentEditingOutput
{
  void *v6;
  char v7;
  NSURL *v8;
  NSURL *editorBundleURL;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  PHContentEditingOutput *v16;

  v16 = contentEditingOutput;
  -[PHAssetChangeRequest supportedEditOperations](self, "supportedEditOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsIndex:", 2);

  if ((v7 & 1) != 0)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHAssetChangeRequest markDidChangeAdjustments](self, "markDidChangeAdjustments");
    objc_storeStrong((id *)&self->_contentEditingOutput, contentEditingOutput);
    -[PHContentEditingOutput editorBundleURL](v16, "editorBundleURL");
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    editorBundleURL = self->_editorBundleURL;
    self->_editorBundleURL = v8;

  }
  else if ((PLIsAssetsd() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ cannot be used on a non-editable asset"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }

}

- (void)setOriginalResourceChoice:(unint64_t)a3
{
  self->_originalResourceChoice = a3;
  self->_didSetOriginalResourceChoice = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)revertLocationToOriginal
{
  if (PLPlatformExtendedAttributesSupported())
  {
    self->_didRevertLocationToOriginal = 1;
    -[PHChangeRequest didMutate](self, "didMutate");
  }
}

- (void)updateExtendedAttributesUsingOriginalMediaMetadata
{
  if (PLPlatformExtendedAttributesSupported())
  {
    self->_didUpdateExtendedAttributesUsingOriginalMediaMetadata = 1;
    -[PHChangeRequest didMutate](self, "didMutate");
  }
}

- (BOOL)addAssetResourceWithType:(int64_t)a3 fromFileAtURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSSet *assetResourceTypesToDelete;
  void *v25;
  NSSet *v26;
  void *v27;
  NSSet *v28;
  id v30;
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3 == 20 || a3 == 114 || a3 == 109)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHChangeRequest photoLibrary](self, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v10, "externalDirectoryWithSubType:createIfNeeded:error:", 3, 1, &v33);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v33;

    if (v11)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("ResourceType-%@-%@"), v14, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject stringByAppendingPathComponent:](v11, "stringByAppendingPathComponent:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0D73208];
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v19 = objc_msgSend(v17, "copyItemAtURL:toURL:error:", v6, v18, &v32);
      v20 = v32;

      if (v19)
      {
        v30 = v20;
        v31 = v8;
        v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v22 = v21;
        if (self->_pathsToNewAssetResourcesByAssetResourceType)
          objc_msgSend(v21, "addEntriesFromDictionary:");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, v23);

        objc_storeStrong((id *)&self->_pathsToNewAssetResourcesByAssetResourceType, v22);
        -[PHChangeRequest didMutate](self, "didMutate");
        assetResourceTypesToDelete = self->_assetResourceTypesToDelete;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(assetResourceTypesToDelete) = -[NSSet containsObject:](assetResourceTypesToDelete, "containsObject:", v25);

        if ((_DWORD)assetResourceTypesToDelete)
        {
          v26 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", self->_assetResourceTypesToDelete);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSSet removeObject:](v26, "removeObject:", v27);

          v28 = self->_assetResourceTypesToDelete;
          self->_assetResourceTypesToDelete = v26;

        }
        v8 = v31;
        v20 = v30;
      }

    }
    else
    {
      PLPhotoKitGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v12;
        _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "Unable to get external add resources directory; %@",
          buf,
          0xCu);
      }
      LOBYTE(v19) = 0;
    }

  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (BOOL)deleteAssetResourceWithType:(int64_t)a3
{
  id v5;
  void *v6;
  NSDictionary *pathsToNewAssetResourcesByAssetResourceType;
  void *v8;
  void *v9;
  NSDictionary *v10;
  void *v11;
  NSDictionary *v12;

  if (a3 != 20 && a3 != 114 && a3 != 109)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (-[NSSet count](self->_assetResourceTypesToDelete, "count"))
    objc_msgSend(v5, "unionSet:", self->_assetResourceTypesToDelete);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_storeStrong((id *)&self->_assetResourceTypesToDelete, v5);
  -[PHChangeRequest didMutate](self, "didMutate");
  pathsToNewAssetResourcesByAssetResourceType = self->_pathsToNewAssetResourcesByAssetResourceType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](pathsToNewAssetResourcesByAssetResourceType, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (NSDictionary *)-[NSDictionary mutableCopy](self->_pathsToNewAssetResourcesByAssetResourceType, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", 0, v11);

    v12 = self->_pathsToNewAssetResourcesByAssetResourceType;
    self->_pathsToNewAssetResourcesByAssetResourceType = v10;

  }
  return 1;
}

- (void)addComments:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHAssetChangeRequest _mutableCommentObjectIDsAndUUIDs](self, "_mutableCommentObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

    -[PHChangeRequest didMutate](self, "didMutate");
  }
  -[PHChangeRequest didMutate](self, "didMutate");

}

- (void)removeComments:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHAssetChangeRequest _mutableCommentObjectIDsAndUUIDs](self, "_mutableCommentObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsInArray:", v5);

    -[PHChangeRequest didMutate](self, "didMutate");
  }

}

- (id)_mutableCommentObjectIDsAndUUIDs
{
  PHRelationshipChangeRequestHelper *commentsHelper;
  void *v4;

  commentsHelper = self->_commentsHelper;
  -[PHAssetChangeRequest _existentCommentObjectIDs](self, "_existentCommentObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHRelationshipChangeRequestHelper prepareIfNeededWithExistentObjectIDs:](commentsHelper, "prepareIfNeededWithExistentObjectIDs:", v4);

  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_commentsHelper, "mutableObjectIDsAndUUIDs");
}

- (id)_existentCommentObjectIDs
{
  void *originalAsset;
  void *v3;
  void *v4;
  void *v5;

  originalAsset = self->_originalAsset;
  if (originalAsset)
  {
    -[PHChangeRequest photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "librarySpecificFetchOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForCommentsForAsset:options:](PHQuery, "queryForCommentsForAsset:options:", originalAsset, v4);
    originalAsset = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:](PHRelationshipChangeRequestHelper, "existentObjectIDsUsingQuery:", originalAsset);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addLike:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PHAssetChangeRequest _mutableLikeObjectIDsAndUUIDs](self, "_mutableLikeObjectIDsAndUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v7);

    -[PHChangeRequest didMutate](self, "didMutate");
  }
  -[PHChangeRequest didMutate](self, "didMutate");

}

- (void)removeLike:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PHAssetChangeRequest _mutableLikeObjectIDsAndUUIDs](self, "_mutableLikeObjectIDsAndUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectsInArray:", v7);

    -[PHChangeRequest didMutate](self, "didMutate");
  }

}

- (id)_mutableLikeObjectIDsAndUUIDs
{
  PHRelationshipChangeRequestHelper *likesHelper;
  void *v4;

  likesHelper = self->_likesHelper;
  -[PHAssetChangeRequest _existentLikeObjectIDs](self, "_existentLikeObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHRelationshipChangeRequestHelper prepareIfNeededWithExistentObjectIDs:](likesHelper, "prepareIfNeededWithExistentObjectIDs:", v4);

  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_likesHelper, "mutableObjectIDsAndUUIDs");
}

- (id)_existentLikeObjectIDs
{
  void *originalAsset;
  void *v3;
  void *v4;
  void *v5;

  originalAsset = self->_originalAsset;
  if (originalAsset)
  {
    -[PHChangeRequest photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "librarySpecificFetchOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForLikesForAsset:options:](PHQuery, "queryForLikesForAsset:options:", originalAsset, v4);
    originalAsset = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:](PHRelationshipChangeRequestHelper, "existentObjectIDsUsingQuery:", originalAsset);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)promoteToGuestAsset
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLSyndicationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[PHObject uuid](self->_originalAsset, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_INFO, "promote to guest asset: %{public}@", (uint8_t *)&v5, 0xCu);

  }
  self->_didResetGuestAssetPromotion = 0;
  self->_didPromoteToGuestAsset = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)resetGuestAssetPromotion
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLSyndicationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[PHObject uuid](self->_originalAsset, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_INFO, "reset guest asset promotion on %{public}@", (uint8_t *)&v5, 0xCu);

  }
  self->_didPromoteToGuestAsset = 0;
  self->_didResetGuestAssetPromotion = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)trashAllSpatialOverCaptureResources
{
  self->_didTrashAllSpatialOverCaptureResources = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)untrashAllSpatialOverCaptureResources
{
  self->_didUntrashAllSpatialOverCaptureResources = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)expungeAllSpatialOverCaptureResources
{
  self->_didExpungeAllSpatialOverCaptureResources = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)expungeTrashedSpatialOverCaptureResources
{
  self->_didExpungeTrashedSpatialOverCaptureResources = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)retryUpload
{
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_toRetryUpload = 1;
}

- (void)revertAssetContentToOriginal
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLPhotoKitGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PHChangeRequest uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEFAULT, "Reverting content to original for asset %{public}@", (uint8_t *)&v5, 0xCu);

  }
  -[PHAssetChangeRequest setContentEditingOutput:](self, "setContentEditingOutput:", 0);
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  CLLocation *updatedLocation;
  void *v13;
  id v14;
  NSObject *v15;
  NSSet *keywordTitles;
  void *v17;
  CFDictionaryRef v18;
  CFDictionaryRef v19;
  CFDictionaryRef v20;
  CFDictionaryRef v21;
  NSDate *lastSharedDate;
  double v23;
  xpc_object_t v24;
  void *v25;
  void *v26;
  CFDictionaryRef v27;
  CFDictionaryRef v28;
  void *v29;
  void *v30;
  void *v31;
  NSDate *characterRecognitionAdjustmentVersion;
  void *v33;
  NSData *characterRecognitionData;
  void *v35;
  NSData *machineReadableCodeData;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSDate *visualSearchAdjustmentVersion;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSData *visualSearchData;
  void *v51;
  void *v52;
  void *v53;
  xpc_object_t v54;
  xpc_object_t v55;
  xpc_object_t v56;
  xpc_object_t v57;
  CLLocation *shiftedLocation;
  void *v59;
  xpc_object_t v60;
  NSObject *v61;
  xpc_object_t v62;
  __int128 v63;
  CFDictionaryRef v64;
  CFDictionaryRef v65;
  __int128 v66;
  CFDictionaryRef v67;
  CFDictionaryRef v68;
  id v69;
  id v70;
  id v71;
  CMTimeRange buf;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeToXPCDict:", v4);

  -[PHAssetChangeRequest facesHelper](self, "facesHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeToXPCDict:", v4);

  -[PHAssetChangeRequest temporalFacesHelper](self, "temporalFacesHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeToXPCDict:", v4);

  -[PHRelationshipChangeRequestHelper encodeToXPCDict:](self->_keywordsHelper, "encodeToXPCDict:", v4);
  -[PHRelationshipChangeRequestHelper encodeToXPCDict:](self->_commentsHelper, "encodeToXPCDict:", v4);
  -[PHRelationshipChangeRequestHelper encodeToXPCDict:](self->_likesHelper, "encodeToXPCDict:", v4);
  if (-[PHAssetChangeRequest didChangeAdjustments](self, "didChangeAdjustments"))
  {
    -[PHAssetChangeRequest contentEditingOutput](self, "contentEditingOutput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v71 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v71);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v71;
      if (!v9)
      {
        PLPhotoKitGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v10;
          _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEFAULT, "Failed to archive contentEditingOutput, error: %@", (uint8_t *)&buf, 0xCu);
        }

      }
    }
    else
    {
      v9 = 0;
    }
    xpc_dictionary_set_BOOL(v4, "didChangeAdjustments", 1);
    PLXPCDictionarySetData();
    PLXPCDictionarySetString();
    PLXPCDictionarySetURL();

  }
  xpc_dictionary_set_BOOL(v4, "didSetOriginalResourceChoice", self->_didSetOriginalResourceChoice);
  xpc_dictionary_set_BOOL(v4, "didRevertLocationToOriginal", self->_didRevertLocationToOriginal);
  xpc_dictionary_set_uint64(v4, "originalResourceChoice", self->_originalResourceChoice);
  xpc_dictionary_set_BOOL(v4, "didUpdateExtendedAttributesUsingOriginalMediaMetadata", self->_didUpdateExtendedAttributesUsingOriginalMediaMetadata);
  xpc_dictionary_set_BOOL(v4, "didExpungeAllSpatialOverCaptureResources", self->_didExpungeAllSpatialOverCaptureResources);
  xpc_dictionary_set_BOOL(v4, "didTrashAllSpatialOverCaptureResources", self->_didTrashAllSpatialOverCaptureResources);
  xpc_dictionary_set_BOOL(v4, "didUntrashAllSpatialOverCaptureResources", self->_didUntrashAllSpatialOverCaptureResources);
  xpc_dictionary_set_BOOL(v4, "didExpungeTrashedSpatialOverCaptureResources", self->_didExpungeTrashedSpatialOverCaptureResources);
  if (self->_didPromoteToGuestAsset)
    xpc_dictionary_set_BOOL(v4, "didPromoteToGuestAsset", 1);
  if (self->_didResetGuestAssetPromotion)
    xpc_dictionary_set_BOOL(v4, "didResetGuestAssetPromotion", 1);
  updatedLocation = self->_updatedLocation;
  if (updatedLocation)
  {
    v70 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", updatedLocation, 1, &v70);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v70;
    if (v13)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      PLPhotoKitGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.start.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v14;
        _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEFAULT, "Failed to archive updatedLocation, error: %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  if (self->_assetDescription)
    PLXPCDictionarySetString();
  if (self->_accessibilityDescription)
    PLXPCDictionarySetString();
  if (self->_didSetTitle)
  {
    xpc_dictionary_set_BOOL(v4, "didSetTitle", 1);
    if (self->_title)
      PLXPCDictionarySetString();
  }
  if (self->_didSetKeywordTitles)
  {
    xpc_dictionary_set_BOOL(v4, "didSetKeywordTitles", 1);
    keywordTitles = self->_keywordTitles;
    if (keywordTitles)
    {
      -[NSSet allObjects](keywordTitles, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PLXPCDictionarySetArray();

    }
  }
  if (self->_videoURLForUpdate)
    PLXPCDictionarySetURL();
  if (self->_pairingIdentifier)
    PLXPCDictionarySetString();
  if ((self->_videoDuration.flags & 1) != 0)
  {
    *(_OWORD *)&buf.start.value = *(_OWORD *)&self->_videoDuration.value;
    buf.start.epoch = self->_videoDuration.epoch;
    v18 = CMTimeCopyAsDictionary(&buf.start, 0);
    if (v18)
    {
      v19 = v18;
      PLXPCDictionarySetDictionary();
      CFRelease(v19);
    }
  }
  if ((self->_imageDisplayTime.flags & 1) != 0)
  {
    *(_OWORD *)&buf.start.value = *(_OWORD *)&self->_imageDisplayTime.value;
    buf.start.epoch = self->_imageDisplayTime.epoch;
    v20 = CMTimeCopyAsDictionary(&buf.start, 0);
    if (v20)
    {
      v21 = v20;
      PLXPCDictionarySetDictionary();
      CFRelease(v21);
    }
  }
  xpc_dictionary_set_BOOL(v4, "didSetVisibilityState", self->_didSetVisibilityState);
  xpc_dictionary_set_uint64(v4, "photoIrisVisibilityState", self->_photoIrisVisibilityState);
  if (self->_didSetSceneClassifications)
    PLXPCDictionarySetDictionary();
  if (self->_didSetImageEmbeddingVersion)
  {
    xpc_dictionary_set_BOOL(v4, "didSetImageEmbeddingVersionKey", 1);
    xpc_dictionary_set_int64(v4, "imageEmbeddingVersion", self->_imageEmbeddingVersion);
  }
  if (self->_didSetVideoEmbeddingVersion)
  {
    xpc_dictionary_set_BOOL(v4, "didSetVideoEmbeddingVersionKey", 1);
    xpc_dictionary_set_int64(v4, "videoEmbeddingVersion", self->_videoEmbeddingVersion);
  }
  if (self->_incrementPlayCount)
    xpc_dictionary_set_BOOL(v4, "incrementPlayCount", 1);
  if (self->_incrementShareCount)
    xpc_dictionary_set_BOOL(v4, "incrementShareCount", 1);
  lastSharedDate = self->_lastSharedDate;
  if (lastSharedDate)
  {
    -[NSDate timeIntervalSinceReferenceDate](lastSharedDate, "timeIntervalSinceReferenceDate");
    xpc_dictionary_set_date(v4, "lastSharedDate", (uint64_t)v23);
  }
  if (self->_incrementViewCount)
    xpc_dictionary_set_BOOL(v4, "incrementViewCount", 1);
  if (self->_didSetVariationSuggestionStates)
  {
    xpc_dictionary_set_uint64(v4, "variationSuggestionStates", self->_variationSuggestionStates);
    xpc_dictionary_set_uint64(v4, "variationSuggestionStatesMask", self->_variationSuggestionStatesMask);
  }
  if (self->_toRetryUpload)
    xpc_dictionary_set_BOOL(v4, "toRetryUpload", 1);
  if (self->_didSetPackedPreferredCropRect)
    xpc_dictionary_set_int64(v4, "packedPreferredCropRect", self->_packedPreferredCropRect);
  if (self->_didSetPackedAcceptableCropRect)
    xpc_dictionary_set_int64(v4, "packedAcceptableCropRect", self->_packedAcceptableCropRect);
  if (self->_didSetPackedBestPlaybackRect)
    xpc_dictionary_set_int64(v4, "packedBestPlaybackRect", self->_packedBestPlaybackRect);
  if (self->_didModifyComputedAttributes)
  {
    if (self->_computedAttributeMutations)
    {
      PLXPCDictionarySetDictionary();
    }
    else
    {
      v24 = xpc_null_create();
      xpc_dictionary_set_value(v4, "computedAttributeMutations", v24);

    }
  }
  if (-[NSDictionary count](self->_pathsToNewAssetResourcesByAssetResourceType, "count"))
    PLXPCDictionarySetDictionary();
  if (-[NSSet count](self->_assetResourceTypesToDelete, "count"))
  {
    -[NSSet allObjects](self->_assetResourceTypesToDelete, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PLXPCDictionarySetArray();

  }
  if (-[NSSet count](self->_libraryScopeOriginatorUUIDs, "count"))
  {
    -[NSSet allObjects](self->_libraryScopeOriginatorUUIDs, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PLXPCDictionarySetArray();

  }
  if (self->_resetWallpaperProperties)
  {
    xpc_dictionary_set_BOOL(v4, "resetWallpaperProperties", 1);
  }
  else
  {
    if (self->_didSetWallpaperPropertiesTimestamp)
      PLXPCDictionarySetDate();
    if (self->_didSetWallpaperPropertiesVersion)
      xpc_dictionary_set_uint64(v4, "photoAnalysisWallpaperPropertiesVersion", self->_wallpaperPropertiesVersion);
    if (self->_didSetWallpaperPropertiesData)
      PLXPCDictionarySetData();
  }
  if (self->_didSetMediaAnalysisTimeStamp)
    PLXPCDictionarySetDate();
  if (self->_didSetMediaAnalysisVersion)
    xpc_dictionary_set_uint64(v4, "mediaAnalysisVersion", self->_mediaAnalysisVersion);
  if (self->_didSetMediaAnalysisImageVersion)
    xpc_dictionary_set_int64(v4, "mediaAnalysisImageVersion", self->_mediaAnalysisImageVersion);
  if ((self->_bestVideoTimeRange.start.flags & 1) != 0
    && (self->_bestVideoTimeRange.duration.flags & 1) != 0
    && !self->_bestVideoTimeRange.duration.epoch
    && (self->_bestVideoTimeRange.duration.value & 0x8000000000000000) == 0)
  {
    v63 = *(_OWORD *)&self->_bestVideoTimeRange.start.epoch;
    *(_OWORD *)&buf.start.value = *(_OWORD *)&self->_bestVideoTimeRange.start.value;
    *(_OWORD *)&buf.start.epoch = v63;
    *(_OWORD *)&buf.duration.timescale = *(_OWORD *)&self->_bestVideoTimeRange.duration.timescale;
    v64 = CMTimeRangeCopyAsDictionary(&buf, 0);
    if (v64)
    {
      v65 = v64;
      PLXPCDictionarySetDictionary();
      CFRelease(v65);
    }
  }
  if ((self->_animatedStickerTimeRange.start.flags & 1) != 0
    && (self->_animatedStickerTimeRange.duration.flags & 1) != 0
    && !self->_animatedStickerTimeRange.duration.epoch
    && (self->_animatedStickerTimeRange.duration.value & 0x8000000000000000) == 0)
  {
    v66 = *(_OWORD *)&self->_animatedStickerTimeRange.start.epoch;
    *(_OWORD *)&buf.start.value = *(_OWORD *)&self->_animatedStickerTimeRange.start.value;
    *(_OWORD *)&buf.start.epoch = v66;
    *(_OWORD *)&buf.duration.timescale = *(_OWORD *)&self->_animatedStickerTimeRange.duration.timescale;
    v67 = CMTimeRangeCopyAsDictionary(&buf, 0);
    if (v67)
    {
      v68 = v67;
      PLXPCDictionarySetDictionary();
      CFRelease(v68);
    }
  }
  if ((self->_bestKeyFrameTime.flags & 1) != 0)
  {
    *(_OWORD *)&buf.start.value = *(_OWORD *)&self->_bestKeyFrameTime.value;
    buf.start.epoch = self->_bestKeyFrameTime.epoch;
    v27 = CMTimeCopyAsDictionary(&buf.start, 0);
    if (v27)
    {
      v28 = v27;
      PLXPCDictionarySetDictionary();
      CFRelease(v28);
    }
  }
  xpc_dictionary_set_BOOL(v4, "unsetBestKeyFrameTime", self->_didUnsetBestKeyFrameTime);
  if (self->_bestKeyFrameJPEGData)
    PLXPCDictionarySetData();
  if (self->_computeSyncMediaAnalysisPayload)
    PLXPCDictionarySetData();
  if (self->_didSetBlurrinessScore)
    xpc_dictionary_set_double(v4, "blurrinessScore", self->_blurrinessScore);
  if (self->_didSetExposureScore)
    xpc_dictionary_set_double(v4, "exposureScore", self->_exposureScore);
  if (self->_didSetAudioScore)
    xpc_dictionary_set_double(v4, "audioScore", self->_audioScore);
  if (self->_didSetSettlingEffectScore)
    xpc_dictionary_set_double(v4, "settlingEffectScore", self->_settlingEffectScore);
  if (self->_didSetWallpaperScore)
    xpc_dictionary_set_double(v4, "wallpaperScore", self->_wallpaperScore);
  if (self->_didSetAutoplaySuggestionScore)
    xpc_dictionary_set_double(v4, "autoplaySuggestionScore", self->_autoplaySuggestionScore);
  if (self->_didSetVideoStickerSuggestionScore)
    xpc_dictionary_set_double(v4, "videoStickerSuggestionScore", self->_videoStickerSuggestionScore);
  if (self->_didSetVideoScore)
    xpc_dictionary_set_double(v4, "videoScore", self->_videoScore);
  if (self->_didSetActivityScore)
    xpc_dictionary_set_double(v4, "activityScore", self->_activityScore);
  if (self->_didSetFaceCount)
    xpc_dictionary_set_uint64(v4, "faceCount", self->_faceCount);
  if (self->_didSetAudioClassification)
    xpc_dictionary_set_int64(v4, "audioClassification", self->_audioClassification);
  if (self->_didSetProbableRotationDirection)
    xpc_dictionary_set_int64(v4, "probableRotationDirection", self->_probableRotationDirection);
  if (self->_didSetProbableRotationDirectionConfidence)
    xpc_dictionary_set_double(v4, "probableRotationDirectionConfidence", self->_probableRotationDirectionConfidence);
  if (self->_colorNormalizationData)
    PLXPCDictionarySetData();
  if (self->_resetCharacterRecognitionProperties)
    xpc_dictionary_set_BOOL(v4, "resetCharacterRecognitionProperties", 1);
  if (self->_didSetCharacterRecognitionData)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_characterRecognitionAlgorithmVersion);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "characterRecognitionAlgorithmVersion");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, v31);

    characterRecognitionAdjustmentVersion = self->_characterRecognitionAdjustmentVersion;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "characterRecognitionAdjustmentVersion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", characterRecognitionAdjustmentVersion, v33);

    characterRecognitionData = self->_characterRecognitionData;
    if (characterRecognitionData)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "characterRecognitionData");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", characterRecognitionData, v35);

    }
    machineReadableCodeData = self->_machineReadableCodeData;
    if (machineReadableCodeData)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "machineReadableCodeData");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", machineReadableCodeData, v37);

    }
    PLXPCDictionarySetDictionary();

  }
  if (self->_resetVisualSearchProperties)
    xpc_dictionary_set_BOOL(v4, "resetVisualSearchProperties", 1);
  if (self->_didSetVisualSearchProperties)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_visualSearchAlgorithmVersion);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "visualSearchAlgorithmVersion");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v39, v40);

    visualSearchAdjustmentVersion = self->_visualSearchAdjustmentVersion;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "visualSearchAdjustmentVersion");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", visualSearchAdjustmentVersion, v42);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didSetStickerConfidenceScore);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetStickerConfidenceScore");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v43, v44);

    *(float *)&v45 = self->_stickerConfidenceScore;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "stickerConfidenceScore");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v46, v47);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_stickerConfidenceScoreAlgorithmVersion);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "stickerConfidenceScoreAlgorithmVersion");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v48, v49);

    visualSearchData = self->_visualSearchData;
    if (visualSearchData)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "visualSearchData");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKeyedSubscript:", visualSearchData, v51);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didSetVisualSearchData);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetVisualSearchData");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v52, v53);

    PLXPCDictionarySetDictionary();
  }
  if (self->_didSetSceneprintData)
  {
    if (self->_sceneprintData)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      v54 = xpc_null_create();
      xpc_dictionary_set_value(v4, "sceneprintData", v54);

    }
  }
  if (self->_didSetDuplicateMatchingData)
  {
    if (self->_duplicateMatchingData)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      v55 = xpc_null_create();
      xpc_dictionary_set_value(v4, "duplicateMatchingData", v55);

    }
    if (self->_duplicateMatchingAlternateData)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      v56 = xpc_null_create();
      xpc_dictionary_set_value(v4, "duplicateMatchingAlternateData", v56);

    }
    xpc_dictionary_set_BOOL(v4, "duplicateProcessingSucceeded", self->_duplicateProcessingSucceeded);
  }
  if (self->_didSetReverseLocationData)
  {
    if (self->_reverseLocationData)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      v57 = xpc_null_create();
      xpc_dictionary_set_value(v4, "reverseLocationData", v57);

    }
  }
  if (self->_didSetReverseLocationDataIsValid)
    xpc_dictionary_set_BOOL(v4, "reverseLocationDataIsValid", self->_reverseLocationDataIsValid);
  if (self->_didSetShiftedLocation)
  {
    shiftedLocation = self->_shiftedLocation;
    if (shiftedLocation)
    {
      v69 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", shiftedLocation, 1, &v69);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v69;
      if (v59)
      {
        PLXPCDictionarySetData();
      }
      else
      {
        PLPhotoKitGetLog();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v60;
          _os_log_impl(&dword_1991EC000, v61, OS_LOG_TYPE_DEFAULT, "Failed to archive shiftedLocation, error: %@", (uint8_t *)&buf, 0xCu);
        }

      }
    }
    else
    {
      v60 = xpc_null_create();
      xpc_dictionary_set_value(v4, "shiftedLocation", v60);
    }

  }
  if (self->_didSetObjectSaliencyRectsData)
  {
    if (self->_objectSaliencyRectsData)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      v62 = xpc_null_create();
      xpc_dictionary_set_value(v4, "objectSaliencyRectsData", v62);

    }
  }
  if (self->_didSetTimeZone)
  {
    PLXPCDictionarySetString();
    xpc_dictionary_set_int64(v4, "timeZoneOffsetValue", self->_timeZoneOffsetValue);
  }
  if (self->_didSetGpsHorizontalAccuracy)
    xpc_dictionary_set_double(v4, "gpsHorizontalAccuracy", self->_gpsHorizontalAccuracy);
  if (self->_didSetScreenTimeDeviceImageSensitivity)
    xpc_dictionary_set_int64(v4, "screenTimeDeviceImageSensitivity", self->_screenTimeDeviceImageSensitivity);
  if (self->_didSetSyndicationProcessingValue)
    xpc_dictionary_set_uint64(v4, "syndicationProcessingValue", self->_syndicationProcessingValue);
  if (self->_didSetSyndicationProcessingVersion)
    xpc_dictionary_set_uint64(v4, "syndicationProcessingVersion", self->_syndicationProcessingVersion);
  if (self->_didSetSyndicationIdentifier)
    PLXPCDictionarySetString();
  if (self->_didSetFaceAnalysisVersion)
    xpc_dictionary_set_int64(v4, "faceAnalysisVersion", self->_faceAnalysisVersion);
  if (self->_didSetLocalAnalysisStage)
    xpc_dictionary_set_int64(v4, "localAnalysisStage", self->_localAnalysisStage);
  if (self->_didSetViewPresentation)
    xpc_dictionary_set_int64(v4, "viewPresentation", self->_viewPresentation);
  if (self->_resetGeneratedAssetDescriptionProperties)
  {
    xpc_dictionary_set_BOOL(v4, "ResetGeneratedAssetDescriptionKey", 1);
  }
  else if (self->_didSetGeneratedAssetDescriptionProperties)
  {
    xpc_dictionary_set_BOOL(v4, "DidSetGeneratedAssetDescriptionKey", 1);
    PLXPCDictionarySetDictionary();
  }
  if (self->_didSetPtpTrashedState)
    xpc_dictionary_set_int64(v4, "PtpTrashedStateKey", self->_ptpTrashedState);
  if (self->_didSetSavedAssetType)
    xpc_dictionary_set_int64(v4, "savedAssetType", self->_savedAssetType);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  PHRelationshipChangeRequestHelper *facesHelper;
  void *v6;
  PHRelationshipChangeRequestHelper *temporalFacesHelper;
  void *v8;
  PHRelationshipChangeRequestHelper *keywordsHelper;
  void *v10;
  PHRelationshipChangeRequestHelper *commentsHelper;
  void *v12;
  PHRelationshipChangeRequestHelper *likesHelper;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *editorBundleID;
  void *v19;
  NSURL *editorBundleURL;
  void *v21;
  _BOOL8 didSetOriginalResourceChoice;
  void *v23;
  _BOOL8 didRevertLocationToOriginal;
  void *v25;
  unint64_t originalResourceChoice;
  void *v27;
  _BOOL8 didUpdateExtendedAttributesUsingOriginalMediaMetadata;
  void *v29;
  _BOOL8 didExpungeAllSpatialOverCaptureResources;
  void *v31;
  _BOOL8 didTrashAllSpatialOverCaptureResources;
  void *v33;
  _BOOL8 didUntrashAllSpatialOverCaptureResources;
  void *v35;
  _BOOL8 didExpungeTrashedSpatialOverCaptureResources;
  void *v37;
  _BOOL8 didPromoteToGuestAsset;
  void *v39;
  _BOOL8 didResetGuestAssetPromotion;
  void *v41;
  CLLocation *updatedLocation;
  void *v43;
  NSString *assetDescription;
  void *v45;
  NSString *accessibilityDescription;
  void *v47;
  _BOOL8 didSetTitle;
  void *v49;
  NSString *title;
  void *v51;
  _BOOL8 didSetKeywordTitles;
  void *v53;
  NSSet *keywordTitles;
  void *v55;
  NSURL *videoURLForUpdate;
  void *v57;
  NSString *pairingIdentifier;
  void *v59;
  CFDictionaryRef v60;
  CFDictionaryRef v61;
  void *v62;
  CFDictionaryRef v63;
  CFDictionaryRef v64;
  void *v65;
  _BOOL8 didSetVisibilityState;
  void *v67;
  uint64_t photoIrisVisibilityState;
  void *v69;
  NSMutableDictionary *sceneClassificationDictionariesByType;
  void *v71;
  uint64_t imageEmbeddingVersion;
  void *v73;
  void *v74;
  uint64_t videoEmbeddingVersion;
  void *v76;
  void *v77;
  _BOOL8 incrementPlayCount;
  void *v79;
  _BOOL8 incrementShareCount;
  void *v81;
  NSDate *lastSharedDate;
  void *v83;
  _BOOL8 incrementViewCount;
  void *v85;
  unint64_t variationSuggestionStates;
  void *v87;
  unint64_t variationSuggestionStatesMask;
  void *v89;
  _BOOL8 toRetryUpload;
  void *v91;
  int64_t packedPreferredCropRect;
  void *v93;
  int64_t packedAcceptableCropRect;
  void *v95;
  int64_t packedBestPlaybackRect;
  void *v97;
  NSMutableDictionary *computedAttributeMutations;
  void *v99;
  void *v100;
  NSDictionary *pathsToNewAssetResourcesByAssetResourceType;
  void *v102;
  NSSet *assetResourceTypesToDelete;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  NSDate *wallpaperPropertiesTimestamp;
  void *v109;
  unint64_t wallpaperPropertiesVersion;
  void *v111;
  NSData *wallpaperPropertiesData;
  NSDate *mediaAnalysisTimeStamp;
  void *v114;
  unint64_t mediaAnalysisVersion;
  void *v116;
  uint64_t mediaAnalysisImageVersion;
  void *v118;
  __int128 v119;
  CFDictionaryRef v120;
  CFDictionaryRef v121;
  void *v122;
  __int128 v123;
  CFDictionaryRef v124;
  CFDictionaryRef v125;
  void *v126;
  CFDictionaryRef v127;
  CFDictionaryRef v128;
  void *v129;
  _BOOL8 didUnsetBestKeyFrameTime;
  void *v131;
  NSData *bestKeyFrameJPEGData;
  void *v133;
  NSData *computeSyncMediaAnalysisPayload;
  void *v135;
  float blurrinessScore;
  void *v137;
  double v138;
  float exposureScore;
  void *v140;
  double v141;
  float audioScore;
  void *v143;
  double v144;
  float settlingEffectScore;
  void *v146;
  double v147;
  float wallpaperScore;
  void *v149;
  double v150;
  float autoplaySuggestionScore;
  void *v152;
  double v153;
  float videoStickerSuggestionScore;
  void *v155;
  double v156;
  float videoScore;
  void *v158;
  double v159;
  float activityScore;
  void *v161;
  double v162;
  unint64_t faceCount;
  void *v164;
  uint64_t audioClassification;
  void *v166;
  uint64_t probableRotationDirection;
  void *v168;
  float probableRotationDirectionConfidence;
  void *v170;
  double v171;
  NSData *colorNormalizationData;
  void *v173;
  _BOOL8 resetCharacterRecognitionProperties;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  NSDate *characterRecognitionAdjustmentVersion;
  void *v180;
  NSData *characterRecognitionData;
  void *v182;
  NSData *machineReadableCodeData;
  void *v184;
  void *v185;
  _BOOL8 resetVisualSearchProperties;
  void *v187;
  id v188;
  void *v189;
  void *v190;
  NSDate *visualSearchAdjustmentVersion;
  void *v192;
  void *v193;
  void *v194;
  double v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  NSData *visualSearchData;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  NSData *sceneprintData;
  void *v206;
  void *v207;
  NSData *duplicateMatchingData;
  void *v209;
  void *v210;
  NSData *duplicateMatchingAlternateData;
  void *v212;
  void *v213;
  _BOOL8 duplicateProcessingSucceeded;
  void *v215;
  NSData *reverseLocationData;
  void *v217;
  void *v218;
  _BOOL8 reverseLocationDataIsValid;
  void *v220;
  CLLocation *shiftedLocation;
  void *v222;
  void *v223;
  NSData *objectSaliencyRectsData;
  void *v225;
  void *v226;
  NSString *timeZoneName;
  void *v228;
  uint64_t timeZoneOffsetValue;
  void *v230;
  double gpsHorizontalAccuracy;
  void *v232;
  uint64_t screenTimeDeviceImageSensitivity;
  void *v234;
  uint64_t syndicationProcessingValue;
  void *v236;
  unint64_t syndicationProcessingVersion;
  void *v238;
  NSString *syndicationIdentifier;
  void *v240;
  uint64_t faceAnalysisVersion;
  void *v242;
  uint64_t localAnalysisStage;
  void *v244;
  uint64_t viewPresentation;
  void *v246;
  void *v247;
  void *v248;
  NSMutableDictionary *generatedAssetDescriptionDictionaries;
  int64_t ptpTrashedState;
  void *v251;
  uint64_t savedAssetType;
  void *v253;
  CMTimeRange v254;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->super._helper, CFSTR("helper"));
  facesHelper = self->_facesHelper;
  -[PHRelationshipChangeRequestHelper relationshipName](facesHelper, "relationshipName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", facesHelper, v6);

  temporalFacesHelper = self->_temporalFacesHelper;
  -[PHRelationshipChangeRequestHelper relationshipName](temporalFacesHelper, "relationshipName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", temporalFacesHelper, v8);

  keywordsHelper = self->_keywordsHelper;
  -[PHRelationshipChangeRequestHelper relationshipName](keywordsHelper, "relationshipName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", keywordsHelper, v10);

  commentsHelper = self->_commentsHelper;
  -[PHRelationshipChangeRequestHelper relationshipName](commentsHelper, "relationshipName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", commentsHelper, v12);

  likesHelper = self->_likesHelper;
  -[PHRelationshipChangeRequestHelper relationshipName](likesHelper, "relationshipName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", likesHelper, v14);

  if (self->_didChangeAdjustments)
  {
    -[PHAssetChangeRequest contentEditingOutput](self, "contentEditingOutput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didChangeAdjustments");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeBool:forKey:", 1, v16);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "contentEditingOutput");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v15, v17);

      editorBundleID = self->_editorBundleID;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "editorBundleID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", editorBundleID, v19);

      editorBundleURL = self->_editorBundleURL;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "editorBundleURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", editorBundleURL, v21);

    }
  }
  didSetOriginalResourceChoice = self->_didSetOriginalResourceChoice;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetOriginalResourceChoice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", didSetOriginalResourceChoice, v23);

  didRevertLocationToOriginal = self->_didRevertLocationToOriginal;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didRevertLocationToOriginal");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", didRevertLocationToOriginal, v25);

  originalResourceChoice = self->_originalResourceChoice;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "originalResourceChoice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", originalResourceChoice, v27);

  didUpdateExtendedAttributesUsingOriginalMediaMetadata = self->_didUpdateExtendedAttributesUsingOriginalMediaMetadata;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didUpdateExtendedAttributesUsingOriginalMediaMetadata");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", didUpdateExtendedAttributesUsingOriginalMediaMetadata, v29);

  didExpungeAllSpatialOverCaptureResources = self->_didExpungeAllSpatialOverCaptureResources;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didExpungeAllSpatialOverCaptureResources");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", didExpungeAllSpatialOverCaptureResources, v31);

  didTrashAllSpatialOverCaptureResources = self->_didTrashAllSpatialOverCaptureResources;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didTrashAllSpatialOverCaptureResources");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", didTrashAllSpatialOverCaptureResources, v33);

  didUntrashAllSpatialOverCaptureResources = self->_didUntrashAllSpatialOverCaptureResources;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didUntrashAllSpatialOverCaptureResources");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", didUntrashAllSpatialOverCaptureResources, v35);

  didExpungeTrashedSpatialOverCaptureResources = self->_didExpungeTrashedSpatialOverCaptureResources;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didExpungeTrashedSpatialOverCaptureResources");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", didExpungeTrashedSpatialOverCaptureResources, v37);

  didPromoteToGuestAsset = self->_didPromoteToGuestAsset;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didPromoteToGuestAsset");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", didPromoteToGuestAsset, v39);

  didResetGuestAssetPromotion = self->_didResetGuestAssetPromotion;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didResetGuestAssetPromotion");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", didResetGuestAssetPromotion, v41);

  updatedLocation = self->_updatedLocation;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "updatedLocation");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", updatedLocation, v43);

  assetDescription = self->_assetDescription;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "assetDescription");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", assetDescription, v45);

  accessibilityDescription = self->_accessibilityDescription;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "accessibilityDescription");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", accessibilityDescription, v47);

  didSetTitle = self->_didSetTitle;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetTitle");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", didSetTitle, v49);

  title = self->_title;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "title");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", title, v51);

  didSetKeywordTitles = self->_didSetKeywordTitles;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetKeywordTitles");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", didSetKeywordTitles, v53);

  keywordTitles = self->_keywordTitles;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "keywordTitles");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", keywordTitles, v55);

  videoURLForUpdate = self->_videoURLForUpdate;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "videoURLForUpdate");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", videoURLForUpdate, v57);

  pairingIdentifier = self->_pairingIdentifier;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "pairingIdentifier");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", pairingIdentifier, v59);

  if ((self->_videoDuration.flags & 1) != 0)
  {
    *(_OWORD *)&v254.start.value = *(_OWORD *)&self->_videoDuration.value;
    v254.start.epoch = self->_videoDuration.epoch;
    v60 = CMTimeCopyAsDictionary(&v254.start, 0);
    if (v60)
    {
      v61 = v60;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "videoDuration");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v61, v62);

      CFRelease(v61);
    }
  }
  if ((self->_imageDisplayTime.flags & 1) != 0)
  {
    *(_OWORD *)&v254.start.value = *(_OWORD *)&self->_imageDisplayTime.value;
    v254.start.epoch = self->_imageDisplayTime.epoch;
    v63 = CMTimeCopyAsDictionary(&v254.start, 0);
    if (v63)
    {
      v64 = v63;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "imageDisplayTime");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v64, v65);

      CFRelease(v64);
    }
  }
  didSetVisibilityState = self->_didSetVisibilityState;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetVisibilityState");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", didSetVisibilityState, v67);

  photoIrisVisibilityState = self->_photoIrisVisibilityState;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "photoIrisVisibilityState");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", photoIrisVisibilityState, v69);

  if (self->_didSetSceneClassifications)
  {
    sceneClassificationDictionariesByType = self->_sceneClassificationDictionariesByType;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sceneClassificationsByType");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", sceneClassificationDictionariesByType, v71);

  }
  if (self->_didSetImageEmbeddingVersion)
  {
    imageEmbeddingVersion = self->_imageEmbeddingVersion;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "imageEmbeddingVersion");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInteger:forKey:", imageEmbeddingVersion, v73);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetImageEmbeddingVersionKey");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeBool:forKey:", 1, v74);

  }
  if (self->_didSetVideoEmbeddingVersion)
  {
    videoEmbeddingVersion = self->_videoEmbeddingVersion;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "videoEmbeddingVersion");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInteger:forKey:", videoEmbeddingVersion, v76);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetVideoEmbeddingVersionKey");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeBool:forKey:", 1, v77);

  }
  incrementPlayCount = self->_incrementPlayCount;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "incrementPlayCount");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", incrementPlayCount, v79);

  incrementShareCount = self->_incrementShareCount;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "incrementShareCount");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", incrementShareCount, v81);

  lastSharedDate = self->_lastSharedDate;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lastSharedDate");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", lastSharedDate, v83);

  incrementViewCount = self->_incrementViewCount;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "incrementViewCount");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", incrementViewCount, v85);

  if (self->_didSetVariationSuggestionStates)
  {
    variationSuggestionStates = self->_variationSuggestionStates;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "variationSuggestionStates");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInt64:forKey:", variationSuggestionStates, v87);

    variationSuggestionStatesMask = self->_variationSuggestionStatesMask;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "variationSuggestionStatesMask");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInt64:forKey:", variationSuggestionStatesMask, v89);

  }
  toRetryUpload = self->_toRetryUpload;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "toRetryUpload");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", toRetryUpload, v91);

  if (self->_didSetPackedPreferredCropRect)
  {
    packedPreferredCropRect = self->_packedPreferredCropRect;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "packedPreferredCropRect");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInt64:forKey:", packedPreferredCropRect, v93);

  }
  if (self->_didSetPackedAcceptableCropRect)
  {
    packedAcceptableCropRect = self->_packedAcceptableCropRect;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "packedAcceptableCropRect");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInt64:forKey:", packedAcceptableCropRect, v95);

  }
  if (self->_didSetPackedBestPlaybackRect)
  {
    packedBestPlaybackRect = self->_packedBestPlaybackRect;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "packedBestPlaybackRect");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInt64:forKey:", packedBestPlaybackRect, v97);

  }
  if (self->_didModifyComputedAttributes)
  {
    computedAttributeMutations = self->_computedAttributeMutations;
    v99 = computedAttributeMutations;
    if (!computedAttributeMutations)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "computedAttributeMutations");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v99, v100);

    if (!computedAttributeMutations)
  }
  if (-[NSDictionary count](self->_pathsToNewAssetResourcesByAssetResourceType, "count"))
  {
    pathsToNewAssetResourcesByAssetResourceType = self->_pathsToNewAssetResourcesByAssetResourceType;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "pathsToNewAssetResourcesByAssetResourceType");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", pathsToNewAssetResourcesByAssetResourceType, v102);

  }
  if (-[NSSet count](self->_assetResourceTypesToDelete, "count"))
  {
    assetResourceTypesToDelete = self->_assetResourceTypesToDelete;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "assetResourceTypesToDelete");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", assetResourceTypesToDelete, v104);

  }
  if (-[NSSet count](self->_libraryScopeOriginatorUUIDs, "count"))
  {
    -[NSSet allObjects](self->_libraryScopeOriginatorUUIDs, "allObjects");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "libraryScopeOriginatorUUIDs");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v105, v106);

  }
  if (self->_resetWallpaperProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "resetWallpaperProperties");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeBool:forKey:", 1, v107);
LABEL_44:

    goto LABEL_45;
  }
  if (self->_didSetWallpaperPropertiesTimestamp)
  {
    wallpaperPropertiesTimestamp = self->_wallpaperPropertiesTimestamp;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "photoAnalysisWallpaperPropertiesTimeStamp");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", wallpaperPropertiesTimestamp, v109);

  }
  if (self->_didSetWallpaperPropertiesVersion)
  {
    wallpaperPropertiesVersion = self->_wallpaperPropertiesVersion;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "photoAnalysisWallpaperPropertiesVersion");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInt64:forKey:", wallpaperPropertiesVersion, v111);

  }
  if (self->_didSetWallpaperPropertiesData)
  {
    wallpaperPropertiesData = self->_wallpaperPropertiesData;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "photoAnalysisWallpaperProperties");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", wallpaperPropertiesData, v107);
    goto LABEL_44;
  }
LABEL_45:
  mediaAnalysisTimeStamp = self->_mediaAnalysisTimeStamp;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "mediaAnalysisTimeStamp");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", mediaAnalysisTimeStamp, v114);

  if (self->_didSetMediaAnalysisVersion)
  {
    mediaAnalysisVersion = self->_mediaAnalysisVersion;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "mediaAnalysisVersion");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInt64:forKey:", mediaAnalysisVersion, v116);

  }
  if (self->_didSetMediaAnalysisImageVersion)
  {
    mediaAnalysisImageVersion = self->_mediaAnalysisImageVersion;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "mediaAnalysisImageVersion");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInt64:forKey:", mediaAnalysisImageVersion, v118);

  }
  if ((self->_bestVideoTimeRange.start.flags & 1) != 0
    && (self->_bestVideoTimeRange.duration.flags & 1) != 0
    && !self->_bestVideoTimeRange.duration.epoch
    && (self->_bestVideoTimeRange.duration.value & 0x8000000000000000) == 0)
  {
    v119 = *(_OWORD *)&self->_bestVideoTimeRange.start.epoch;
    *(_OWORD *)&v254.start.value = *(_OWORD *)&self->_bestVideoTimeRange.start.value;
    *(_OWORD *)&v254.start.epoch = v119;
    *(_OWORD *)&v254.duration.timescale = *(_OWORD *)&self->_bestVideoTimeRange.duration.timescale;
    v120 = CMTimeRangeCopyAsDictionary(&v254, 0);
    if (v120)
    {
      v121 = v120;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bestVideoTimeRange");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v121, v122);

      CFRelease(v121);
    }
  }
  if ((self->_animatedStickerTimeRange.start.flags & 1) != 0
    && (self->_animatedStickerTimeRange.duration.flags & 1) != 0
    && !self->_animatedStickerTimeRange.duration.epoch
    && (self->_animatedStickerTimeRange.duration.value & 0x8000000000000000) == 0)
  {
    v123 = *(_OWORD *)&self->_animatedStickerTimeRange.start.epoch;
    *(_OWORD *)&v254.start.value = *(_OWORD *)&self->_animatedStickerTimeRange.start.value;
    *(_OWORD *)&v254.start.epoch = v123;
    *(_OWORD *)&v254.duration.timescale = *(_OWORD *)&self->_animatedStickerTimeRange.duration.timescale;
    v124 = CMTimeRangeCopyAsDictionary(&v254, 0);
    if (v124)
    {
      v125 = v124;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "animatedStickerTimeRange");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v125, v126);

      CFRelease(v125);
    }
  }
  if ((self->_bestKeyFrameTime.flags & 1) != 0)
  {
    *(_OWORD *)&v254.start.value = *(_OWORD *)&self->_bestKeyFrameTime.value;
    v254.start.epoch = self->_bestKeyFrameTime.epoch;
    v127 = CMTimeCopyAsDictionary(&v254.start, 0);
    if (v127)
    {
      v128 = v127;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bestKeyFrameTime");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v128, v129);

      CFRelease(v128);
    }
  }
  didUnsetBestKeyFrameTime = self->_didUnsetBestKeyFrameTime;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "unsetBestKeyFrameTime");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", didUnsetBestKeyFrameTime, v131);

  bestKeyFrameJPEGData = self->_bestKeyFrameJPEGData;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bestKeyFrameJPEGData");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", bestKeyFrameJPEGData, v133);

  computeSyncMediaAnalysisPayload = self->_computeSyncMediaAnalysisPayload;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "computeSyncMediaAnalysisPayload");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", computeSyncMediaAnalysisPayload, v135);

  if (self->_didSetBlurrinessScore)
  {
    blurrinessScore = self->_blurrinessScore;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "blurrinessScore");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v138 = blurrinessScore;
    objc_msgSend(v4, "encodeFloat:forKey:", v137, v138);

  }
  if (self->_didSetExposureScore)
  {
    exposureScore = self->_exposureScore;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "exposureScore");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v141 = exposureScore;
    objc_msgSend(v4, "encodeFloat:forKey:", v140, v141);

  }
  if (self->_didSetAudioScore)
  {
    audioScore = self->_audioScore;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "audioScore");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v144 = audioScore;
    objc_msgSend(v4, "encodeFloat:forKey:", v143, v144);

  }
  if (self->_didSetSettlingEffectScore)
  {
    settlingEffectScore = self->_settlingEffectScore;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "settlingEffectScore");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v147 = settlingEffectScore;
    objc_msgSend(v4, "encodeFloat:forKey:", v146, v147);

  }
  if (self->_didSetWallpaperScore)
  {
    wallpaperScore = self->_wallpaperScore;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "wallpaperScore");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v150 = wallpaperScore;
    objc_msgSend(v4, "encodeFloat:forKey:", v149, v150);

  }
  if (self->_didSetAutoplaySuggestionScore)
  {
    autoplaySuggestionScore = self->_autoplaySuggestionScore;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "autoplaySuggestionScore");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v153 = autoplaySuggestionScore;
    objc_msgSend(v4, "encodeFloat:forKey:", v152, v153);

  }
  if (self->_didSetVideoStickerSuggestionScore)
  {
    videoStickerSuggestionScore = self->_videoStickerSuggestionScore;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "videoStickerSuggestionScore");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v156 = videoStickerSuggestionScore;
    objc_msgSend(v4, "encodeFloat:forKey:", v155, v156);

  }
  if (self->_didSetVideoScore)
  {
    videoScore = self->_videoScore;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "videoScore");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v159 = videoScore;
    objc_msgSend(v4, "encodeFloat:forKey:", v158, v159);

  }
  if (self->_didSetActivityScore)
  {
    activityScore = self->_activityScore;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "activityScore");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v162 = activityScore;
    objc_msgSend(v4, "encodeFloat:forKey:", v161, v162);

  }
  if (self->_didSetFaceCount)
  {
    faceCount = self->_faceCount;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "faceCount");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInt64:forKey:", faceCount, v164);

  }
  if (self->_didSetAudioClassification)
  {
    audioClassification = self->_audioClassification;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "audioClassification");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInteger:forKey:", audioClassification, v166);

  }
  if (self->_didSetProbableRotationDirection)
  {
    probableRotationDirection = self->_probableRotationDirection;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "probableRotationDirection");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInteger:forKey:", probableRotationDirection, v168);

  }
  if (self->_didSetProbableRotationDirectionConfidence)
  {
    probableRotationDirectionConfidence = self->_probableRotationDirectionConfidence;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "probableRotationDirectionConfidence");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v171 = probableRotationDirectionConfidence;
    objc_msgSend(v4, "encodeFloat:forKey:", v170, v171);

  }
  colorNormalizationData = self->_colorNormalizationData;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "colorNormalizationData");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", colorNormalizationData, v173);

  resetCharacterRecognitionProperties = self->_resetCharacterRecognitionProperties;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "resetCharacterRecognitionProperties");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", resetCharacterRecognitionProperties, v175);

  if (self->_didSetCharacterRecognitionData)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_characterRecognitionAlgorithmVersion);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "characterRecognitionAlgorithmVersion");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "setObject:forKeyedSubscript:", v177, v178);

    characterRecognitionAdjustmentVersion = self->_characterRecognitionAdjustmentVersion;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "characterRecognitionAdjustmentVersion");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "setObject:forKeyedSubscript:", characterRecognitionAdjustmentVersion, v180);

    characterRecognitionData = self->_characterRecognitionData;
    if (characterRecognitionData)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "characterRecognitionData");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "setObject:forKeyedSubscript:", characterRecognitionData, v182);

    }
    machineReadableCodeData = self->_machineReadableCodeData;
    if (machineReadableCodeData)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "machineReadableCodeData");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "setObject:forKeyedSubscript:", machineReadableCodeData, v184);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "characterRecognitionProperties");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v176, v185);

  }
  resetVisualSearchProperties = self->_resetVisualSearchProperties;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "resetVisualSearchProperties");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", resetVisualSearchProperties, v187);

  if (self->_didSetVisualSearchProperties)
  {
    v188 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_visualSearchAlgorithmVersion);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "visualSearchAlgorithmVersion");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "setObject:forKeyedSubscript:", v189, v190);

    visualSearchAdjustmentVersion = self->_visualSearchAdjustmentVersion;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "visualSearchAdjustmentVersion");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "setObject:forKeyedSubscript:", visualSearchAdjustmentVersion, v192);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didSetStickerConfidenceScore);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetStickerConfidenceScore");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "setObject:forKeyedSubscript:", v193, v194);

    *(float *)&v195 = self->_stickerConfidenceScore;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v195);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "stickerConfidenceScore");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "setObject:forKeyedSubscript:", v196, v197);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_stickerConfidenceScoreAlgorithmVersion);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "stickerConfidenceScoreAlgorithmVersion");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "setObject:forKeyedSubscript:", v198, v199);

    visualSearchData = self->_visualSearchData;
    if (visualSearchData)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "visualSearchData");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v188, "setObject:forKeyedSubscript:", visualSearchData, v201);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didSetVisualSearchData);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetVisualSearchData");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "setObject:forKeyedSubscript:", v202, v203);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "visualSearchProperties");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v188, v204);

  }
  if (self->_didSetSceneprintData)
  {
    sceneprintData = self->_sceneprintData;
    v206 = sceneprintData;
    if (!sceneprintData)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sceneprintData");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v206, v207);

    if (!sceneprintData)
  }
  if (self->_didSetDuplicateMatchingData)
  {
    duplicateMatchingData = self->_duplicateMatchingData;
    v209 = duplicateMatchingData;
    if (!duplicateMatchingData)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "duplicateMatchingData");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v209, v210);

    if (!duplicateMatchingData)
    duplicateMatchingAlternateData = self->_duplicateMatchingAlternateData;
    v212 = duplicateMatchingAlternateData;
    if (!duplicateMatchingAlternateData)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "duplicateMatchingAlternateData");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v212, v213);

    if (!duplicateMatchingAlternateData)
    duplicateProcessingSucceeded = self->_duplicateProcessingSucceeded;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "duplicateProcessingSucceeded");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeBool:forKey:", duplicateProcessingSucceeded, v215);

  }
  if (self->_didSetReverseLocationData)
  {
    reverseLocationData = self->_reverseLocationData;
    v217 = reverseLocationData;
    if (!reverseLocationData)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "reverseLocationData");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v217, v218);

    if (!reverseLocationData)
  }
  if (self->_didSetReverseLocationDataIsValid)
  {
    reverseLocationDataIsValid = self->_reverseLocationDataIsValid;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "reverseLocationDataIsValid");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeBool:forKey:", reverseLocationDataIsValid, v220);

  }
  if (self->_didSetShiftedLocation)
  {
    shiftedLocation = self->_shiftedLocation;
    v222 = shiftedLocation;
    if (!shiftedLocation)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v222 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shiftedLocation");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v222, v223);

    if (!shiftedLocation)
  }
  if (self->_didSetObjectSaliencyRectsData)
  {
    objectSaliencyRectsData = self->_objectSaliencyRectsData;
    v225 = objectSaliencyRectsData;
    if (!objectSaliencyRectsData)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "objectSaliencyRectsData");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v225, v226);

    if (!objectSaliencyRectsData)
  }
  if (self->_didSetTimeZone)
  {
    timeZoneName = self->_timeZoneName;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "timeZoneName");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", timeZoneName, v228);

    timeZoneOffsetValue = self->_timeZoneOffsetValue;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "timeZoneOffsetValue");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInt32:forKey:", timeZoneOffsetValue, v230);

  }
  if (self->_didSetGpsHorizontalAccuracy)
  {
    gpsHorizontalAccuracy = self->_gpsHorizontalAccuracy;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "gpsHorizontalAccuracy");
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeDouble:forKey:", v232, gpsHorizontalAccuracy);

  }
  if (self->_didSetScreenTimeDeviceImageSensitivity)
  {
    screenTimeDeviceImageSensitivity = self->_screenTimeDeviceImageSensitivity;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "screenTimeDeviceImageSensitivity");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInteger:forKey:", screenTimeDeviceImageSensitivity, v234);

  }
  if (self->_didSetSyndicationProcessingValue)
  {
    syndicationProcessingValue = self->_syndicationProcessingValue;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "syndicationProcessingValue");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInteger:forKey:", syndicationProcessingValue, v236);

  }
  if (self->_didSetSyndicationProcessingVersion)
  {
    syndicationProcessingVersion = self->_syndicationProcessingVersion;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "syndicationProcessingVersion");
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInt64:forKey:", syndicationProcessingVersion, v238);

  }
  if (self->_didSetSyndicationIdentifier)
  {
    syndicationIdentifier = self->_syndicationIdentifier;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "syndicationIdentifier");
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", syndicationIdentifier, v240);

  }
  if (self->_didSetFaceAnalysisVersion)
  {
    faceAnalysisVersion = self->_faceAnalysisVersion;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "faceAnalysisVersion");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInteger:forKey:", faceAnalysisVersion, v242);

  }
  if (self->_didSetLocalAnalysisStage)
  {
    localAnalysisStage = self->_localAnalysisStage;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "localAnalysisStage");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInteger:forKey:", localAnalysisStage, v244);

  }
  if (self->_didSetViewPresentation)
  {
    viewPresentation = self->_viewPresentation;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "viewPresentation");
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInteger:forKey:", viewPresentation, v246);

  }
  if (self->_resetGeneratedAssetDescriptionProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ResetGeneratedAssetDescriptionKey");
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeBool:forKey:", 1, v247);
  }
  else
  {
    if (!self->_didSetGeneratedAssetDescriptionProperties)
      goto LABEL_155;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DidSetGeneratedAssetDescriptionKey");
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeBool:forKey:", 1, v248);

    generatedAssetDescriptionDictionaries = self->_generatedAssetDescriptionDictionaries;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "GeneratedAssetDescriptionPropertiesKey");
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", generatedAssetDescriptionDictionaries, v247);
  }

LABEL_155:
  if (self->_didSetPtpTrashedState)
  {
    ptpTrashedState = self->_ptpTrashedState;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PtpTrashedStateKey");
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInt64:forKey:", ptpTrashedState, v251);

  }
  if (self->_didSetSavedAssetType)
  {
    savedAssetType = self->_savedAssetType;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "savedAssetType");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInteger:forKey:", savedAssetType, v253);

  }
}

- (PHAssetChangeRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  PHAssetChangeRequest *v7;
  uint64_t v8;
  PHRelationshipChangeRequestHelper *facesHelper;
  uint64_t v10;
  PHRelationshipChangeRequestHelper *temporalFacesHelper;
  uint64_t v12;
  PHRelationshipChangeRequestHelper *keywordsHelper;
  uint64_t v14;
  PHRelationshipChangeRequestHelper *commentsHelper;
  uint64_t v16;
  PHRelationshipChangeRequestHelper *likesHelper;
  int v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSURL *editorBundleURL;
  void *v28;
  uint64_t v29;
  NSString *editorBundleID;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSString *v34;
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
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  CLLocation *updatedLocation;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSString *assetDescription;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSString *accessibilityDescription;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  NSString *title;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NSSet *keywordTitles;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  NSURL *videoURLForUpdate;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  NSString *pairingIdentifier;
  uint64_t v79;
  void *v80;
  const __CFDictionary *v81;
  $95D729B680665BEAEFA1D6FCA8238556 *p_videoDuration;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const __CFDictionary *v87;
  $95D729B680665BEAEFA1D6FCA8238556 *p_imageDisplayTime;
  __int128 v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  NSMutableDictionary *sceneClassificationDictionariesByType;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  NSDate *lastSharedDate;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  NSDictionary *pathsToNewAssetResourcesByAssetResourceType;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  uint64_t v125;
  NSSet *assetResourceTypesToDelete;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  NSSet *libraryScopeOriginatorUUIDs;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  NSMutableDictionary *computedAttributeMutations;
  void *v141;
  int v142;
  NSDate *wallpaperPropertiesTimestamp;
  NSData *wallpaperPropertiesData;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  NSDate *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  NSData *v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  NSDate *mediaAnalysisTimeStamp;
  void *v158;
  void *v159;
  uint64_t v160;
  void *v161;
  const __CFDictionary *v162;
  __int128 v163;
  void *v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  NSData *bestKeyFrameJPEGData;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  NSData *computeSyncMediaAnalysisPayload;
  uint64_t v173;
  void *v174;
  const __CFDictionary *v175;
  __int128 v176;
  __int128 v177;
  uint64_t v178;
  void *v179;
  const __CFDictionary *v180;
  __int128 v181;
  __int128 v182;
  void *v183;
  float v184;
  void *v185;
  float v186;
  void *v187;
  float v188;
  void *v189;
  float v190;
  void *v191;
  float v192;
  void *v193;
  float v194;
  void *v195;
  float v196;
  void *v197;
  float v198;
  void *v199;
  float v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  float v205;
  uint64_t v206;
  void *v207;
  uint64_t v208;
  NSData *colorNormalizationData;
  void *v210;
  void *v211;
  uint64_t v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  uint64_t v217;
  NSData *characterRecognitionData;
  void *v219;
  uint64_t v220;
  NSData *machineReadableCodeData;
  void *v222;
  void *v223;
  void *v224;
  uint64_t v225;
  NSDate *characterRecognitionAdjustmentVersion;
  void *v227;
  void *v228;
  uint64_t v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  uint64_t v234;
  NSData *visualSearchData;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  float v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  uint64_t v248;
  NSDate *visualSearchAdjustmentVersion;
  uint64_t v250;
  void *v251;
  uint64_t v252;
  NSData *sceneprintData;
  uint64_t v254;
  void *v255;
  uint64_t v256;
  NSData *duplicateMatchingData;
  uint64_t v258;
  void *v259;
  uint64_t v260;
  NSData *duplicateMatchingAlternateData;
  NSData *v262;
  NSData *v263;
  void *v264;
  uint64_t v265;
  void *v266;
  uint64_t v267;
  NSData *reverseLocationData;
  void *v269;
  uint64_t v270;
  void *v271;
  uint64_t v272;
  NSData *objectSaliencyRectsData;
  void *v274;
  uint64_t v275;
  void *v276;
  void *v277;
  uint64_t v278;
  CLLocation *shiftedLocation;
  CLLocation *v280;
  CLLocation *v281;
  uint64_t v282;
  void *v283;
  uint64_t v284;
  NSString *timeZoneName;
  void *v286;
  void *v287;
  double v288;
  void *v289;
  void *v290;
  void *v291;
  uint64_t v292;
  void *v293;
  uint64_t v294;
  NSString *syndicationIdentifier;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  uint64_t v302;
  NSMutableDictionary *generatedAssetDescriptionDictionaries;
  void *v304;
  void *v305;
  void *v306;
  PHAssetChangeRequest *v307;
  void *v309;
  const __CFDictionary *v310;
  const __CFDictionary *v311;
  void *v312;
  CMTimeRange v313;
  _QWORD v314[7];

  v314[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("helper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setChangeRequest:", self);
  objc_msgSend(v5, "setMutated:", 1);
  v6 = objc_alloc_init(MEMORY[0x1E0D715A8]);
  v7 = -[PHAssetChangeRequest initWithHelper:](self, "initWithHelper:", v5);

  if (v7)
  {
    v312 = v5;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detectedFaces"));
    v8 = objc_claimAutoreleasedReturnValue();
    facesHelper = v7->_facesHelper;
    v7->_facesHelper = (PHRelationshipChangeRequestHelper *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("temporalDetectedFaces"));
    v10 = objc_claimAutoreleasedReturnValue();
    temporalFacesHelper = v7->_temporalFacesHelper;
    v7->_temporalFacesHelper = (PHRelationshipChangeRequestHelper *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keywords"));
    v12 = objc_claimAutoreleasedReturnValue();
    keywordsHelper = v7->_keywordsHelper;
    v7->_keywordsHelper = (PHRelationshipChangeRequestHelper *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloudComments"));
    v14 = objc_claimAutoreleasedReturnValue();
    commentsHelper = v7->_commentsHelper;
    v7->_commentsHelper = (PHRelationshipChangeRequestHelper *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("likeComments"));
    v16 = objc_claimAutoreleasedReturnValue();
    likesHelper = v7->_likesHelper;
    v7->_likesHelper = (PHRelationshipChangeRequestHelper *)v16;

    v7->_clientProcessIdentifier = objc_msgSend(v6, "clientProcessIdentifier");
    v18 = objc_msgSend(v6, "photoKitEntitled");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didChangeAdjustments");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v4, "decodeBoolForKey:", v19);

    if (v20)
    {
      -[PHAssetChangeRequest markDidChangeAdjustments](v7, "markDidChangeAdjustments");
      v21 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "contentEditingOutput");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[PHAssetChangeRequest setContentEditingOutput:](v7, "setContentEditingOutput:", v23);
      if (v18)
      {
        v24 = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "editorBundleURL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v24, v25);
        v26 = objc_claimAutoreleasedReturnValue();
        editorBundleURL = v7->_editorBundleURL;
        v7->_editorBundleURL = (NSURL *)v26;

        if (v7->_editorBundleURL)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "bundleIdentifier");
          v29 = objc_claimAutoreleasedReturnValue();
          editorBundleID = v7->_editorBundleID;
          v7->_editorBundleID = (NSString *)v29;

        }
        if (!v7->_editorBundleID)
        {
          v31 = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "editorBundleID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", v31, v32);
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = v7->_editorBundleID;
          v7->_editorBundleID = (NSString *)v33;

        }
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "originalResourceChoice");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_originalResourceChoice = objc_msgSend(v4, "decodeIntegerForKey:", v35);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetOriginalResourceChoice");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_didSetOriginalResourceChoice = objc_msgSend(v4, "decodeBoolForKey:", v36);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didRevertLocationToOriginal");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_didRevertLocationToOriginal = objc_msgSend(v4, "decodeBoolForKey:", v37);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didUpdateExtendedAttributesUsingOriginalMediaMetadata");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_didUpdateExtendedAttributesUsingOriginalMediaMetadata = objc_msgSend(v4, "decodeBoolForKey:", v38);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didExpungeAllSpatialOverCaptureResources");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_didExpungeAllSpatialOverCaptureResources = objc_msgSend(v4, "decodeBoolForKey:", v39);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didTrashAllSpatialOverCaptureResources");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_didTrashAllSpatialOverCaptureResources = objc_msgSend(v4, "decodeBoolForKey:", v40);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didUntrashAllSpatialOverCaptureResources");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_didUntrashAllSpatialOverCaptureResources = objc_msgSend(v4, "decodeBoolForKey:", v41);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didExpungeTrashedSpatialOverCaptureResources");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_didExpungeTrashedSpatialOverCaptureResources = objc_msgSend(v4, "decodeBoolForKey:", v42);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didPromoteToGuestAsset");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_didPromoteToGuestAsset = objc_msgSend(v4, "decodeBoolForKey:", v43);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didResetGuestAssetPromotion");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_didResetGuestAssetPromotion = objc_msgSend(v4, "decodeBoolForKey:", v44);

    v45 = (void *)MEMORY[0x1E0C99E60];
    v46 = objc_opt_class();
    objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "updatedLocation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, v48);
    v49 = objc_claimAutoreleasedReturnValue();
    updatedLocation = v7->_updatedLocation;
    v7->_updatedLocation = (CLLocation *)v49;

    v51 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "assetDescription");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v51, v52);
    v53 = objc_claimAutoreleasedReturnValue();
    assetDescription = v7->_assetDescription;
    v7->_assetDescription = (NSString *)v53;

    v55 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "accessibilityDescription");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v55, v56);
    v57 = objc_claimAutoreleasedReturnValue();
    accessibilityDescription = v7->_accessibilityDescription;
    v7->_accessibilityDescription = (NSString *)v57;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetTitle");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_didSetTitle = objc_msgSend(v4, "decodeBoolForKey:", v59);

    if (v7->_didSetTitle)
    {
      v60 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "title");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v60, v61);
      v62 = objc_claimAutoreleasedReturnValue();
      title = v7->_title;
      v7->_title = (NSString *)v62;

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetKeywordTitles");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_didSetKeywordTitles = objc_msgSend(v4, "decodeBoolForKey:", v64);

    if (v7->_didSetKeywordTitles)
    {
      v65 = (void *)MEMORY[0x1E0C99E60];
      v66 = objc_opt_class();
      objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "keywordTitles");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v67, v68);
      v69 = objc_claimAutoreleasedReturnValue();
      keywordTitles = v7->_keywordTitles;
      v7->_keywordTitles = (NSSet *)v69;

    }
    v71 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "videoURLForUpdate");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v71, v72);
    v73 = objc_claimAutoreleasedReturnValue();
    videoURLForUpdate = v7->_videoURLForUpdate;
    v7->_videoURLForUpdate = (NSURL *)v73;

    v75 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "pairingIdentifier");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v75, v76);
    v77 = objc_claimAutoreleasedReturnValue();
    pairingIdentifier = v7->_pairingIdentifier;
    v7->_pairingIdentifier = (NSString *)v77;

    v79 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "videoDuration");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v79, v80);
    v81 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    p_videoDuration = &v7->_videoDuration;
    v311 = v81;
    if (v81)
    {
      CMTimeMakeFromDictionary(&v313.start, v81);
      v83 = *(_OWORD *)&v313.start.value;
      v7->_videoDuration.epoch = v313.start.epoch;
      *(_OWORD *)&p_videoDuration->value = v83;
    }
    else
    {
      v84 = MEMORY[0x1E0CA2E18];
      *(_OWORD *)&p_videoDuration->value = *MEMORY[0x1E0CA2E18];
      v7->_videoDuration.epoch = *(_QWORD *)(v84 + 16);
    }
    v85 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "imageDisplayTime");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v85, v86);
    v87 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    p_imageDisplayTime = &v7->_imageDisplayTime;
    v310 = v87;
    if (v87)
    {
      CMTimeMakeFromDictionary(&v313.start, v87);
      v89 = *(_OWORD *)&v313.start.value;
      v7->_imageDisplayTime.epoch = v313.start.epoch;
      *(_OWORD *)&p_imageDisplayTime->value = v89;
    }
    else
    {
      v90 = MEMORY[0x1E0CA2E18];
      *(_OWORD *)&p_imageDisplayTime->value = *MEMORY[0x1E0CA2E18];
      v7->_imageDisplayTime.epoch = *(_QWORD *)(v90 + 16);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "photoIrisVisibilityState");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_photoIrisVisibilityState = objc_msgSend(v4, "decodeIntegerForKey:", v91);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetVisibilityState");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_didSetVisibilityState = objc_msgSend(v4, "decodeBoolForKey:", v92);

    v93 = (void *)MEMORY[0x1E0C99E60];
    v314[0] = objc_opt_class();
    v314[1] = objc_opt_class();
    v314[2] = objc_opt_class();
    v314[3] = objc_opt_class();
    v314[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v314, 5);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setWithArray:", v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sceneClassificationsByType");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v95, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    if (v97)
    {
      v98 = objc_msgSend(v97, "mutableCopy");
      sceneClassificationDictionariesByType = v7->_sceneClassificationDictionariesByType;
      v7->_sceneClassificationDictionariesByType = (NSMutableDictionary *)v98;

      v7->_didSetSceneClassifications = 1;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetImageEmbeddingVersionKey");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_didSetImageEmbeddingVersion = objc_msgSend(v4, "decodeBoolForKey:", v100);

    if (v7->_didSetImageEmbeddingVersion)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "imageEmbeddingVersion");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_imageEmbeddingVersion = objc_msgSend(v4, "decodeIntegerForKey:", v101);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetVideoEmbeddingVersionKey");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_didSetVideoEmbeddingVersion = objc_msgSend(v4, "decodeBoolForKey:", v102);

    if (v7->_didSetVideoEmbeddingVersion)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "videoEmbeddingVersion");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_videoEmbeddingVersion = objc_msgSend(v4, "decodeIntegerForKey:", v103);

    }
    v309 = v97;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "incrementPlayCount");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_incrementPlayCount = objc_msgSend(v4, "decodeBoolForKey:", v104);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "incrementShareCount");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_incrementShareCount = objc_msgSend(v4, "decodeBoolForKey:", v105);

    v106 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lastSharedDate");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v106, v107);
    v108 = objc_claimAutoreleasedReturnValue();
    lastSharedDate = v7->_lastSharedDate;
    v7->_lastSharedDate = (NSDate *)v108;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "incrementViewCount");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_incrementViewCount = objc_msgSend(v4, "decodeBoolForKey:", v110);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "variationSuggestionStates");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_variationSuggestionStates = objc_msgSend(v4, "decodeInt64ForKey:", v111);

    if (v7->_variationSuggestionStates)
    {
      v7->_didSetVariationSuggestionStates = 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "variationSuggestionStatesMask");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_variationSuggestionStatesMask = objc_msgSend(v4, "decodeInt64ForKey:", v112);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "toRetryUpload");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_toRetryUpload = objc_msgSend(v4, "decodeBoolForKey:", v113);

    v114 = (void *)MEMORY[0x1E0C99E60];
    v115 = objc_opt_class();
    v116 = objc_opt_class();
    objc_msgSend(v114, "setWithObjects:", v115, v116, objc_opt_class(), 0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "pathsToNewAssetResourcesByAssetResourceType");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v117, v118);
    v119 = objc_claimAutoreleasedReturnValue();
    pathsToNewAssetResourcesByAssetResourceType = v7->_pathsToNewAssetResourcesByAssetResourceType;
    v7->_pathsToNewAssetResourcesByAssetResourceType = (NSDictionary *)v119;

    v121 = (void *)MEMORY[0x1E0C99E60];
    v122 = objc_opt_class();
    objc_msgSend(v121, "setWithObjects:", v122, objc_opt_class(), 0);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "assetResourceTypesToDelete");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v123, v124);
    v125 = objc_claimAutoreleasedReturnValue();
    assetResourceTypesToDelete = v7->_assetResourceTypesToDelete;
    v7->_assetResourceTypesToDelete = (NSSet *)v125;

    v127 = (void *)MEMORY[0x1E0C99E60];
    v128 = objc_opt_class();
    objc_msgSend(v127, "setWithObjects:", v128, objc_opt_class(), 0);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "libraryScopeOriginatorUUIDs");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v129, v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "setWithArray:", v131);
    v132 = objc_claimAutoreleasedReturnValue();
    libraryScopeOriginatorUUIDs = v7->_libraryScopeOriginatorUUIDs;
    v7->_libraryScopeOriginatorUUIDs = (NSSet *)v132;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "packedPreferredCropRect");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_packedPreferredCropRect = objc_msgSend(v4, "decodeIntegerForKey:", v134);

    if (v7->_packedPreferredCropRect)
      v7->_didSetPackedPreferredCropRect = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "packedAcceptableCropRect");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_packedAcceptableCropRect = objc_msgSend(v4, "decodeIntegerForKey:", v135);

    if (v7->_packedAcceptableCropRect)
      v7->_didSetPackedAcceptableCropRect = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "packedBestPlaybackRect");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_packedBestPlaybackRect = objc_msgSend(v4, "decodeIntegerForKey:", v136);

    if (v7->_packedBestPlaybackRect)
      v7->_didSetPackedBestPlaybackRect = 1;
    v137 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "computedAttributeMutations");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v137, v138);
    v139 = objc_claimAutoreleasedReturnValue();
    computedAttributeMutations = v7->_computedAttributeMutations;
    v7->_computedAttributeMutations = (NSMutableDictionary *)v139;

    if (v7->_computedAttributeMutations)
      v7->_didModifyComputedAttributes = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "resetWallpaperProperties");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_msgSend(v4, "decodeBoolForKey:", v141);

    if (v142)
    {
      v7->_didSetWallpaperPropertiesTimestamp = 1;
      wallpaperPropertiesTimestamp = v7->_wallpaperPropertiesTimestamp;
      v7->_wallpaperPropertiesTimestamp = 0;

      v7->_didSetWallpaperPropertiesVersion = 1;
      v7->_wallpaperPropertiesVersion = 0;
      v7->_didSetWallpaperPropertiesData = 1;
      wallpaperPropertiesData = v7->_wallpaperPropertiesData;
      v7->_wallpaperPropertiesData = 0;

    }
    else
    {
      v145 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "photoAnalysisWallpaperPropertiesTimeStamp");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v145, v146);
      v147 = objc_claimAutoreleasedReturnValue();
      v148 = v7->_wallpaperPropertiesTimestamp;
      v7->_wallpaperPropertiesTimestamp = (NSDate *)v147;

      if (v7->_wallpaperPropertiesTimestamp)
        v7->_didSetWallpaperPropertiesTimestamp = 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "photoAnalysisWallpaperPropertiesVersion");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_wallpaperPropertiesVersion = objc_msgSend(v4, "decodeIntegerForKey:", v149);

      if (v7->_wallpaperPropertiesVersion)
        v7->_didSetWallpaperPropertiesVersion = 1;
      v150 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "photoAnalysisWallpaperProperties");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v150, v151);
      v152 = objc_claimAutoreleasedReturnValue();
      v153 = v7->_wallpaperPropertiesData;
      v7->_wallpaperPropertiesData = (NSData *)v152;

      if (v7->_wallpaperPropertiesData)
        v7->_didSetWallpaperPropertiesData = 1;
    }
    v154 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "mediaAnalysisTimeStamp");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v154, v155);
    v156 = objc_claimAutoreleasedReturnValue();
    mediaAnalysisTimeStamp = v7->_mediaAnalysisTimeStamp;
    v7->_mediaAnalysisTimeStamp = (NSDate *)v156;

    if (v7->_mediaAnalysisTimeStamp)
      v7->_didSetMediaAnalysisTimeStamp = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "mediaAnalysisVersion");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_mediaAnalysisVersion = objc_msgSend(v4, "decodeIntegerForKey:", v158);

    if (v7->_mediaAnalysisVersion)
      v7->_didSetMediaAnalysisVersion = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "mediaAnalysisImageVersion");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_mediaAnalysisImageVersion = objc_msgSend(v4, "decodeIntegerForKey:", v159);

    if (v7->_mediaAnalysisImageVersion)
      v7->_didSetMediaAnalysisImageVersion = 1;
    v160 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bestKeyFrameTime");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v160, v161);
    v162 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    if (v162)
    {
      CMTimeMakeFromDictionary(&v313.start, v162);
      v163 = *(_OWORD *)&v313.start.value;
      v7->_bestKeyFrameTime.epoch = v313.start.epoch;
      *(_OWORD *)&v7->_bestKeyFrameTime.value = v163;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "unsetBestKeyFrameTime");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_didUnsetBestKeyFrameTime = objc_msgSend(v4, "decodeBoolForKey:", v164);

    v165 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bestKeyFrameJPEGData");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v165, v166);
    v167 = objc_claimAutoreleasedReturnValue();
    bestKeyFrameJPEGData = v7->_bestKeyFrameJPEGData;
    v7->_bestKeyFrameJPEGData = (NSData *)v167;

    v169 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "computeSyncMediaAnalysisPayload");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v169, v170);
    v171 = objc_claimAutoreleasedReturnValue();
    computeSyncMediaAnalysisPayload = v7->_computeSyncMediaAnalysisPayload;
    v7->_computeSyncMediaAnalysisPayload = (NSData *)v171;

    v173 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bestVideoTimeRange");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v173, v174);
    v175 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    if (v175)
    {
      CMTimeRangeMakeFromDictionary(&v313, v175);
      v176 = *(_OWORD *)&v313.start.value;
      v177 = *(_OWORD *)&v313.duration.timescale;
      *(_OWORD *)&v7->_bestVideoTimeRange.start.epoch = *(_OWORD *)&v313.start.epoch;
      *(_OWORD *)&v7->_bestVideoTimeRange.duration.timescale = v177;
      *(_OWORD *)&v7->_bestVideoTimeRange.start.value = v176;
    }
    v178 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "animatedStickerTimeRange");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v178, v179);
    v180 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    if (v180)
    {
      CMTimeRangeMakeFromDictionary(&v313, v180);
      v181 = *(_OWORD *)&v313.start.value;
      v182 = *(_OWORD *)&v313.duration.timescale;
      *(_OWORD *)&v7->_animatedStickerTimeRange.start.epoch = *(_OWORD *)&v313.start.epoch;
      *(_OWORD *)&v7->_animatedStickerTimeRange.duration.timescale = v182;
      *(_OWORD *)&v7->_animatedStickerTimeRange.start.value = v181;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "blurrinessScore");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeFloatForKey:", v183);
    v7->_blurrinessScore = v184;

    if (v7->_blurrinessScore != 0.0)
      v7->_didSetBlurrinessScore = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "exposureScore");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeFloatForKey:", v185);
    v7->_exposureScore = v186;

    if (v7->_exposureScore != 0.0)
      v7->_didSetExposureScore = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "audioScore");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeFloatForKey:", v187);
    v7->_audioScore = v188;

    if (v7->_audioScore != 0.0)
      v7->_didSetAudioScore = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "settlingEffectScore");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeFloatForKey:", v189);
    v7->_settlingEffectScore = v190;

    if (v7->_settlingEffectScore != 0.0)
      v7->_didSetSettlingEffectScore = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "wallpaperScore");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeFloatForKey:", v191);
    v7->_wallpaperScore = v192;

    if (v7->_wallpaperScore != 0.0)
      v7->_didSetWallpaperScore = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "autoplaySuggestionScore");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeFloatForKey:", v193);
    v7->_autoplaySuggestionScore = v194;

    if (v7->_autoplaySuggestionScore != 0.0)
      v7->_didSetAutoplaySuggestionScore = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "videoStickerSuggestionScore");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeFloatForKey:", v195);
    v7->_videoStickerSuggestionScore = v196;

    if (v7->_videoStickerSuggestionScore != 0.0)
      v7->_didSetVideoStickerSuggestionScore = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "videoScore");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeFloatForKey:", v197);
    v7->_videoScore = v198;

    if (v7->_videoScore != 0.0)
      v7->_didSetVideoScore = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "activityScore");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeFloatForKey:", v199);
    v7->_activityScore = v200;

    if (v7->_activityScore != 0.0)
      v7->_didSetActivityScore = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "faceCount");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_faceCount = objc_msgSend(v4, "decodeInt64ForKey:", v201);

    if (v7->_faceCount)
      v7->_didSetFaceCount = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "audioClassification");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_audioClassification = objc_msgSend(v4, "decodeIntegerForKey:", v202);

    if (v7->_audioClassification)
      v7->_didSetAudioClassification = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "probableRotationDirection");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_probableRotationDirection = objc_msgSend(v4, "decodeIntegerForKey:", v203);

    if (v7->_probableRotationDirection)
      v7->_didSetProbableRotationDirection = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "probableRotationDirectionConfidence");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeFloatForKey:", v204);
    v7->_probableRotationDirectionConfidence = v205;

    if (v7->_probableRotationDirectionConfidence != 0.0)
      v7->_didSetProbableRotationDirectionConfidence = 1;
    v206 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "colorNormalizationData");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v206, v207);
    v208 = objc_claimAutoreleasedReturnValue();
    colorNormalizationData = v7->_colorNormalizationData;
    v7->_colorNormalizationData = (NSData *)v208;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "resetCharacterRecognitionProperties");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_resetCharacterRecognitionProperties = objc_msgSend(v4, "decodeBoolForKey:", v210);

    if (!v7->_resetCharacterRecognitionProperties)
    {
      v211 = (void *)MEMORY[0x1E0C99E60];
      v212 = objc_opt_class();
      objc_msgSend(v211, "setWithObjects:", v212, objc_opt_class(), 0);
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "characterRecognitionProperties");
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v213, v214);
      v215 = (void *)objc_claimAutoreleasedReturnValue();

      if (v215)
      {
        v7->_didSetCharacterRecognitionData = 1;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "characterRecognitionData");
        v216 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v215, "objectForKeyedSubscript:", v216);
        v217 = objc_claimAutoreleasedReturnValue();
        characterRecognitionData = v7->_characterRecognitionData;
        v7->_characterRecognitionData = (NSData *)v217;

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "machineReadableCodeData");
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v215, "objectForKeyedSubscript:", v219);
        v220 = objc_claimAutoreleasedReturnValue();
        machineReadableCodeData = v7->_machineReadableCodeData;
        v7->_machineReadableCodeData = (NSData *)v220;

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "characterRecognitionAlgorithmVersion");
        v222 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v215, "objectForKeyedSubscript:", v222);
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        v7->_characterRecognitionAlgorithmVersion = objc_msgSend(v223, "integerValue");

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "characterRecognitionAdjustmentVersion");
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v215, "objectForKeyedSubscript:", v224);
        v225 = objc_claimAutoreleasedReturnValue();
        characterRecognitionAdjustmentVersion = v7->_characterRecognitionAdjustmentVersion;
        v7->_characterRecognitionAdjustmentVersion = (NSDate *)v225;

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "resetVisualSearchProperties");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_resetVisualSearchProperties = objc_msgSend(v4, "decodeBoolForKey:", v227);

    if (!v7->_resetVisualSearchProperties)
    {
      v228 = (void *)MEMORY[0x1E0C99E60];
      v229 = objc_opt_class();
      objc_msgSend(v228, "setWithObjects:", v229, objc_opt_class(), 0);
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "visualSearchProperties");
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v230, v231);
      v232 = (void *)objc_claimAutoreleasedReturnValue();

      if (v232)
      {
        v7->_didSetVisualSearchProperties = 1;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "visualSearchData");
        v233 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v232, "objectForKeyedSubscript:", v233);
        v234 = objc_claimAutoreleasedReturnValue();
        visualSearchData = v7->_visualSearchData;
        v7->_visualSearchData = (NSData *)v234;

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetStickerConfidenceScore");
        v236 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v232, "objectForKeyedSubscript:", v236);
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        v7->_didSetStickerConfidenceScore = objc_msgSend(v237, "BOOLValue");

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didSetVisualSearchData");
        v238 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v232, "objectForKeyedSubscript:", v238);
        v239 = (void *)objc_claimAutoreleasedReturnValue();
        v7->_didSetVisualSearchData = objc_msgSend(v239, "BOOLValue");

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "stickerConfidenceScore");
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v232, "objectForKeyedSubscript:", v240);
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v241, "floatValue");
        v7->_stickerConfidenceScore = v242;

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "stickerConfidenceScoreAlgorithmVersion");
        v243 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v232, "objectForKeyedSubscript:", v243);
        v244 = (void *)objc_claimAutoreleasedReturnValue();
        v7->_stickerConfidenceScoreAlgorithmVersion = objc_msgSend(v244, "integerValue");

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "visualSearchAlgorithmVersion");
        v245 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v232, "objectForKeyedSubscript:", v245);
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        v7->_visualSearchAlgorithmVersion = objc_msgSend(v246, "integerValue");

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "visualSearchAdjustmentVersion");
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v232, "objectForKeyedSubscript:", v247);
        v248 = objc_claimAutoreleasedReturnValue();
        visualSearchAdjustmentVersion = v7->_visualSearchAdjustmentVersion;
        v7->_visualSearchAdjustmentVersion = (NSDate *)v248;

      }
    }
    v250 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sceneprintData");
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v250, v251);
    v252 = objc_claimAutoreleasedReturnValue();
    sceneprintData = v7->_sceneprintData;
    v7->_sceneprintData = (NSData *)v252;

    if (v7->_sceneprintData)
      v7->_didSetSceneprintData = 1;
    v254 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "duplicateMatchingData");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v254, v255);
    v256 = objc_claimAutoreleasedReturnValue();
    duplicateMatchingData = v7->_duplicateMatchingData;
    v7->_duplicateMatchingData = (NSData *)v256;

    if (v7->_duplicateMatchingData)
    {
      v7->_didSetDuplicateMatchingData = 1;
      v258 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "duplicateMatchingAlternateData");
      v259 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v258, v259);
      v260 = objc_claimAutoreleasedReturnValue();
      duplicateMatchingAlternateData = v7->_duplicateMatchingAlternateData;
      v7->_duplicateMatchingAlternateData = (NSData *)v260;

      if (!-[NSData length](v7->_duplicateMatchingData, "length"))
      {
        v262 = v7->_duplicateMatchingData;
        v7->_duplicateMatchingData = 0;

      }
      if (!-[NSData length](v7->_duplicateMatchingAlternateData, "length"))
      {
        v263 = v7->_duplicateMatchingAlternateData;
        v7->_duplicateMatchingAlternateData = 0;

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "duplicateProcessingSucceeded");
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_duplicateProcessingSucceeded = objc_msgSend(v4, "decodeBoolForKey:", v264);

    }
    v265 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "reverseLocationData");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v265, v266);
    v267 = objc_claimAutoreleasedReturnValue();
    reverseLocationData = v7->_reverseLocationData;
    v7->_reverseLocationData = (NSData *)v267;

    if (v7->_reverseLocationData)
      v7->_didSetReverseLocationData = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "reverseLocationDataIsValid");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_reverseLocationDataIsValid = objc_msgSend(v4, "decodeBoolForKey:", v269);

    if (v7->_reverseLocationDataIsValid)
      v7->_didSetReverseLocationDataIsValid = 1;
    v270 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "objectSaliencyRectsData");
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v270, v271);
    v272 = objc_claimAutoreleasedReturnValue();
    objectSaliencyRectsData = v7->_objectSaliencyRectsData;
    v7->_objectSaliencyRectsData = (NSData *)v272;

    if (v7->_objectSaliencyRectsData)
      v7->_didSetObjectSaliencyRectsData = 1;
    v274 = (void *)MEMORY[0x1E0C99E60];
    v275 = objc_opt_class();
    objc_msgSend(v274, "setWithObjects:", v275, objc_opt_class(), 0);
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shiftedLocation");
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v276, v277);
    v278 = objc_claimAutoreleasedReturnValue();
    shiftedLocation = v7->_shiftedLocation;
    v7->_shiftedLocation = (CLLocation *)v278;

    v280 = v7->_shiftedLocation;
    v7->_didSetShiftedLocation = 1;
    if (!v280)
    {
      v281 = v7->_shiftedLocation;
      v7->_shiftedLocation = 0;

    }
    v282 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "timeZoneName");
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v282, v283);
    v284 = objc_claimAutoreleasedReturnValue();
    timeZoneName = v7->_timeZoneName;
    v7->_timeZoneName = (NSString *)v284;

    if (v7->_timeZoneName)
    {
      v7->_didSetTimeZone = 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "timeZoneOffsetValue");
      v286 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_timeZoneOffsetValue = objc_msgSend(v4, "decodeInt32ForKey:", v286);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "gpsHorizontalAccuracy");
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v287);
    v7->_gpsHorizontalAccuracy = v288;

    if (v7->_gpsHorizontalAccuracy != 0.0)
      v7->_didSetGpsHorizontalAccuracy = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "screenTimeDeviceImageSensitivity");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_screenTimeDeviceImageSensitivity = objc_msgSend(v4, "decodeIntegerForKey:", v289);

    if (v7->_screenTimeDeviceImageSensitivity)
      v7->_didSetScreenTimeDeviceImageSensitivity = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "syndicationProcessingValue");
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_syndicationProcessingValue = objc_msgSend(v4, "decodeIntegerForKey:", v290);

    if (v7->_syndicationProcessingValue)
      v7->_didSetSyndicationProcessingValue = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "syndicationProcessingVersion");
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_syndicationProcessingVersion = objc_msgSend(v4, "decodeInt64ForKey:", v291);

    if (v7->_syndicationProcessingVersion)
      v7->_didSetSyndicationProcessingVersion = 1;
    v292 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "syndicationIdentifier");
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v292, v293);
    v294 = objc_claimAutoreleasedReturnValue();
    syndicationIdentifier = v7->_syndicationIdentifier;
    v7->_syndicationIdentifier = (NSString *)v294;

    if (v7->_syndicationIdentifier)
      v7->_didSetSyndicationIdentifier = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "faceAnalysisVersion");
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_faceAnalysisVersion = objc_msgSend(v4, "decodeIntegerForKey:", v296);

    if (v7->_faceAnalysisVersion)
      v7->_didSetFaceAnalysisVersion = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "localAnalysisStage");
    v297 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_localAnalysisStage = objc_msgSend(v4, "decodeIntegerForKey:", v297);

    if (v7->_localAnalysisStage)
      v7->_didSetLocalAnalysisStage = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "viewPresentation");
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_viewPresentation = objc_msgSend(v4, "decodeIntegerForKey:", v298);

    if (v7->_viewPresentation)
      v7->_didSetViewPresentation = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ResetGeneratedAssetDescriptionKey");
    v299 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_resetGeneratedAssetDescriptionProperties = objc_msgSend(v4, "decodeBoolForKey:", v299);

    if (!v7->_resetGeneratedAssetDescriptionProperties)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DidSetGeneratedAssetDescriptionKey");
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_didSetGeneratedAssetDescriptionProperties = objc_msgSend(v4, "decodeBoolForKey:", v300);

      if (v7->_didSetGeneratedAssetDescriptionProperties)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "GeneratedAssetDescriptionPropertiesKey");
        v301 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectForKey:", v301);
        v302 = objc_claimAutoreleasedReturnValue();
        generatedAssetDescriptionDictionaries = v7->_generatedAssetDescriptionDictionaries;
        v7->_generatedAssetDescriptionDictionaries = (NSMutableDictionary *)v302;

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PtpTrashedStateKey");
    v304 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v304);
    v305 = (void *)objc_claimAutoreleasedReturnValue();

    if (v305)
    {
      v7->_ptpTrashedState = objc_msgSend(v305, "integerValue");
      v7->_didSetPtpTrashedState = 1;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "savedAssetType");
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_savedAssetType = objc_msgSend(v4, "decodeIntegerForKey:", v306);

    if (v7->_savedAssetType)
      v7->_didSetSavedAssetType = 1;

    v5 = v312;
  }
  v307 = v7;

  return v307;
}

- (void)setWallpaperPropertiesTimestamp:(id)a3
{
  NSDate *v5;
  NSDate *wallpaperPropertiesTimestamp;
  void *v7;

  v5 = (NSDate *)a3;
  if (self->_resetWallpaperProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 2924, CFSTR("A change request should be resetting wallpaper properties timestamp set if it is setting new timestamp."));

  }
  self->_didSetWallpaperPropertiesTimestamp = 1;
  wallpaperPropertiesTimestamp = self->_wallpaperPropertiesTimestamp;
  self->_wallpaperPropertiesTimestamp = v5;

  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setWallpaperPropertiesVersion:(unint64_t)a3
{
  void *v6;

  if (self->_resetWallpaperProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 2931, CFSTR("A change request should be resetting wallpaper properties version set if it is setting new version."));

  }
  self->_didSetWallpaperPropertiesVersion = 1;
  self->_wallpaperPropertiesVersion = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setWallpaperPropertiesData:(id)a3
{
  NSData *v5;
  NSData *wallpaperPropertiesData;
  void *v7;

  v5 = (NSData *)a3;
  if (self->_resetWallpaperProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 2938, CFSTR("A change request should be resetting wallpaper properties data set if it is setting new data."));

  }
  self->_didSetWallpaperPropertiesData = 1;
  wallpaperPropertiesData = self->_wallpaperPropertiesData;
  self->_wallpaperPropertiesData = v5;

  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setBestVideoTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->var0.var3;
  v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_bestVideoTimeRange.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_bestVideoTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_bestVideoTimeRange.duration.timescale = v3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setAnimatedStickerTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->var0.var3;
  v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_animatedStickerTimeRange.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_animatedStickerTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_animatedStickerTimeRange.duration.timescale = v3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setBestKeyFrame:(CGImage *)a3 time:(id *)a4
{
  _BOOL4 v7;
  __CFData *v8;
  __CFString *v9;
  CGImageDestination *v10;
  NSData *bestKeyFrameJPEGData;
  NSObject *v12;
  void *v13;
  int64_t var3;
  NSUInteger v15;
  void *v16;
  $95D729B680665BEAEFA1D6FCA8238556 bestKeyFrameTime;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = -[PHAsset isVideo](self->_originalAsset, "isVideo");
  if (a3 && v7)
  {
    v8 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = CGImageDestinationCreateWithData(v8, v9, 1uLL, 0);

    if (v10)
    {
      CGImageDestinationAddImage(v10, a3, 0);
      CGImageDestinationFinalize(v10);
      CFRelease(v10);
    }
    bestKeyFrameJPEGData = self->_bestKeyFrameJPEGData;
    self->_bestKeyFrameJPEGData = (NSData *)v8;

  }
  if ((a4->var2 & 1) != 0)
  {
    var3 = a4->var3;
    *(_OWORD *)&self->_bestKeyFrameTime.value = *(_OWORD *)&a4->var0;
    self->_bestKeyFrameTime.epoch = var3;
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      bestKeyFrameTime = self->_bestKeyFrameTime;
      v13 = (void *)CMTimeCopyDescription(0, (CMTime *)&bestKeyFrameTime);
      v15 = -[NSData length](self->_bestKeyFrameJPEGData, "length");
      -[PHChangeRequest uuid](self, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(bestKeyFrameTime.value) = 138412802;
      *(int64_t *)((char *)&bestKeyFrameTime.value + 4) = (int64_t)v13;
      LOWORD(bestKeyFrameTime.flags) = 2048;
      *(_QWORD *)((char *)&bestKeyFrameTime.flags + 2) = v15;
      HIWORD(bestKeyFrameTime.epoch) = 2112;
      v18 = v16;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEBUG, "Client setting best key frame time: %@ key frame image length: %lu for asset: %@", (uint8_t *)&bestKeyFrameTime, 0x20u);

      goto LABEL_11;
    }
  }
  else
  {
    self->_didUnsetBestKeyFrameTime = 1;
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[PHChangeRequest uuid](self, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(bestKeyFrameTime.value) = 138412290;
      *(int64_t *)((char *)&bestKeyFrameTime.value + 4) = (int64_t)v13;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEBUG, "Client unsetting best key frame time for asset: %@", (uint8_t *)&bestKeyFrameTime, 0xCu);
LABEL_11:

    }
  }

  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setBestPlaybackRectWithNormalizedRect:(CGRect)a3
{
  BOOL v4;
  int64_t v5;

  v5 = 0;
  v4 = 0;
  -[PHAssetChangeRequest setRectWithNormalizedRect:forPackedRect:forSetFlag:](self, "setRectWithNormalizedRect:forPackedRect:forSetFlag:", &v5, &v4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  self->_packedBestPlaybackRect = v5;
  self->_didSetPackedBestPlaybackRect = v4;
}

- (void)setComputeSyncMediaAnalysisPayload:(id)a3
{
  objc_storeStrong((id *)&self->_computeSyncMediaAnalysisPayload, a3);
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setMediaAnalysisVersion:(unint64_t)a3
{
  self->_didSetMediaAnalysisVersion = 1;
  self->_mediaAnalysisVersion = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setMediaAnalysisImageVersion:(signed __int16)a3
{
  self->_didSetMediaAnalysisImageVersion = 1;
  self->_mediaAnalysisImageVersion = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setMediaAnalysisTimeStamp:(id)a3
{
  self->_didSetMediaAnalysisTimeStamp = 1;
  objc_storeStrong((id *)&self->_mediaAnalysisTimeStamp, a3);
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setBlurrinessScore:(float)a3
{
  self->_didSetBlurrinessScore = 1;
  self->_blurrinessScore = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setExposureScore:(float)a3
{
  self->_didSetExposureScore = 1;
  self->_exposureScore = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setWallpaperScore:(float)a3
{
  self->_didSetWallpaperScore = 1;
  self->_wallpaperScore = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setAutoplaySuggestionScore:(float)a3
{
  self->_didSetAutoplaySuggestionScore = 1;
  self->_autoplaySuggestionScore = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setVideoStickerSuggestionScore:(float)a3
{
  self->_didSetVideoStickerSuggestionScore = 1;
  self->_videoStickerSuggestionScore = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setVideoScore:(float)a3
{
  self->_didSetVideoScore = 1;
  self->_videoScore = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setActivityScore:(float)a3
{
  self->_didSetActivityScore = 1;
  self->_activityScore = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setAudioScore:(float)a3
{
  self->_didSetAudioScore = 1;
  self->_audioScore = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setSettlingEffectScore:(float)a3
{
  self->_didSetSettlingEffectScore = 1;
  self->_settlingEffectScore = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setFaceCount:(unint64_t)a3
{
  self->_didSetFaceCount = 1;
  self->_faceCount = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setAudioClassification:(signed __int16)a3
{
  self->_didSetAudioClassification = 1;
  self->_audioClassification = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setProbableRotationDirection:(signed __int16)a3
{
  self->_didSetProbableRotationDirection = 1;
  self->_probableRotationDirection = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setProbableRotationDirectionConfidence:(float)a3
{
  self->_didSetProbableRotationDirectionConfidence = 1;
  self->_probableRotationDirectionConfidence = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setColorNormalizationData:(id)a3
{
  NSData *v4;
  NSData *colorNormalizationData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  colorNormalizationData = self->_colorNormalizationData;
  self->_colorNormalizationData = v4;

  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setCharacterRecognitionData:(id)a3 algorithmVersion:(int64_t)a4 adjustmentVersion:(id)a5
{
  -[PHAssetChangeRequest setCharacterRecognitionData:machineReadableCodeData:algorithmVersion:adjustmentVersion:](self, "setCharacterRecognitionData:machineReadableCodeData:algorithmVersion:adjustmentVersion:", a3, 0, a4, a5);
}

- (void)setCharacterRecognitionData:(id)a3 machineReadableCodeData:(id)a4 algorithmVersion:(int64_t)a5 adjustmentVersion:(id)a6
{
  NSData *v11;
  NSData *v12;
  NSDate *v13;
  NSData *characterRecognitionData;
  NSData *v15;
  NSData *machineReadableCodeData;
  NSData *v17;
  NSDate *characterRecognitionAdjustmentVersion;
  void *v19;
  void *v20;
  void *v21;

  v11 = (NSData *)a3;
  v12 = (NSData *)a4;
  v13 = (NSDate *)a6;
  self->_didSetCharacterRecognitionData = 1;
  if (self->_resetCharacterRecognitionProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 3101, CFSTR("A change request should not be resetting OCR data set if it is setting new data."));

  }
  if (a5 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 3103, CFSTR("Cannot set a zero algorithm version"));

    if (v13)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 3104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adjustmentVersion"));

    goto LABEL_5;
  }
  if (!v13)
    goto LABEL_7;
LABEL_5:
  characterRecognitionData = self->_characterRecognitionData;
  self->_characterRecognitionData = v11;
  v15 = v11;

  machineReadableCodeData = self->_machineReadableCodeData;
  self->_machineReadableCodeData = v12;
  v17 = v12;

  self->_characterRecognitionAlgorithmVersion = a5;
  characterRecognitionAdjustmentVersion = self->_characterRecognitionAdjustmentVersion;
  self->_characterRecognitionAdjustmentVersion = v13;

  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)resetCharacterRecognitionAttributes
{
  void *v4;

  self->_resetCharacterRecognitionProperties = 1;
  if (self->_didSetCharacterRecognitionData)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 3114, CFSTR("A change request should not have OCR data set if it is being reset."));

  }
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setVisualSearchData:(id)a3 algorithmVersion:(int64_t)a4 adjustmentVersion:(id)a5
{
  NSData *v9;
  NSDate *v10;
  NSData *visualSearchData;
  NSData *v12;
  NSDate *visualSearchAdjustmentVersion;
  void *v14;
  void *v15;
  void *v16;

  v9 = (NSData *)a3;
  v10 = (NSDate *)a5;
  self->_didSetVisualSearchProperties = 1;
  self->_didSetVisualSearchData = 1;
  if (self->_resetVisualSearchProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 3121, CFSTR("A change request should be resetting VisualSearch data set if it is setting new data."));

  }
  if (a4 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 3123, CFSTR("Cannot set a zero algorithm version"));

    if (v10)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 3124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adjustmentVersion"));

    goto LABEL_5;
  }
  if (!v10)
    goto LABEL_7;
LABEL_5:
  visualSearchData = self->_visualSearchData;
  self->_visualSearchData = v9;
  v12 = v9;

  self->_visualSearchAlgorithmVersion = a4;
  visualSearchAdjustmentVersion = self->_visualSearchAdjustmentVersion;
  self->_visualSearchAdjustmentVersion = v10;

  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setVisualSearchData:(id)a3 stickerConfidenceScore:(float)a4 algorithmVersion:(int64_t)a5 adjustmentVersion:(id)a6
{
  NSData *v11;
  NSDate *v12;
  NSData *visualSearchData;
  NSData *v14;
  NSDate *visualSearchAdjustmentVersion;
  void *v16;
  void *v17;
  void *v18;

  v11 = (NSData *)a3;
  v12 = (NSDate *)a6;
  self->_didSetVisualSearchProperties = 1;
  self->_didSetStickerConfidenceScore = 1;
  self->_didSetVisualSearchData = 1;
  if (self->_resetVisualSearchProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 3135, CFSTR("A change request should be resetting VisualSearch data set if it is setting new data."));

  }
  if (a5 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 3137, CFSTR("Cannot set a zero algorithm version"));

    if (v12)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 3138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adjustmentVersion"));

    goto LABEL_5;
  }
  if (!v12)
    goto LABEL_7;
LABEL_5:
  visualSearchData = self->_visualSearchData;
  self->_visualSearchData = v11;
  v14 = v11;

  self->_stickerConfidenceScore = a4;
  self->_stickerConfidenceScoreAlgorithmVersion = a5;
  self->_visualSearchAlgorithmVersion = a5;
  visualSearchAdjustmentVersion = self->_visualSearchAdjustmentVersion;
  self->_visualSearchAdjustmentVersion = v12;

  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setStickerConfidenceScore:(float)a3 stickerAlgorithmVersion:(int64_t)a4
{
  self->_didSetVisualSearchProperties = 1;
  self->_didSetStickerConfidenceScore = 1;
  self->_stickerConfidenceScore = a3;
  self->_stickerConfidenceScoreAlgorithmVersion = a4;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)resetVisualSearchAttributes
{
  void *v4;

  self->_resetVisualSearchProperties = 1;
  if (self->_didSetVisualSearchProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 3157, CFSTR("A change request should not have VisualSearch data set if it is being reset."));

  }
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)resetWallpaperProperties
{
  void *v4;

  self->_resetWallpaperProperties = 1;
  if (self->_didSetWallpaperPropertiesData)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetChangeRequest.m"), 3163, CFSTR("A change request should not have wallpaper proeprties data set if it is being reset."));

  }
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setTimeZone:(id)a3 withDate:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *timeZoneName;
  int v10;

  self->_didSetTimeZone = 1;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "name");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  timeZoneName = self->_timeZoneName;
  self->_timeZoneName = v8;

  v10 = objc_msgSend(v7, "secondsFromGMTForDate:", v6);
  self->_timeZoneOffsetValue = v10;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setLibraryScopeContributors:(id)a3
{
  void *v4;
  void *v5;
  NSSet *v6;
  NSSet *libraryScopeOriginatorUUIDs;

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "valueForKey:", CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
  libraryScopeOriginatorUUIDs = self->_libraryScopeOriginatorUUIDs;
  self->_libraryScopeOriginatorUUIDs = v6;

  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setScreenTimeDeviceImageSensitivity:(signed __int16)a3
{
  self->_didSetScreenTimeDeviceImageSensitivity = 1;
  self->_screenTimeDeviceImageSensitivity = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setSyndicationProcessingValue:(unsigned __int16)a3
{
  self->_didSetSyndicationProcessingValue = 1;
  self->_syndicationProcessingValue = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setSyndicationProcessingVersion:(unint64_t)a3
{
  self->_didSetSyndicationProcessingVersion = 1;
  self->_syndicationProcessingVersion = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setSyndicationIdentifierOnMomentSharedAsset:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PHAsset sourceType](self->_originalAsset, "sourceType") == 8)
  {
    -[PHAssetChangeRequest _setSyndicationIdentifier:](self, "_setSyndicationIdentifier:", v4);
  }
  else
  {
    PLPhotoKitGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      -[PHObject uuid](self->_originalAsset, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_FAULT, "syndicationIdentifier can only be set on PHAssetSourceTypeMomentShared assets: %@", (uint8_t *)&v7, 0xCu);

    }
  }

}

- (void)_setSyndicationIdentifier:(id)a3
{
  self->_didSetSyndicationIdentifier = 1;
  objc_storeStrong((id *)&self->_syndicationIdentifier, a3);
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setFaceAnalysisVersion:(signed __int16)a3
{
  self->_faceAnalysisVersion = a3;
  self->_didSetFaceAnalysisVersion = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (signed)assetAnalysisStage
{
  return self->_localAnalysisStage;
}

- (void)setLocalAnalysisStage:(signed __int16)a3
{
  self->_localAnalysisStage = a3;
  self->_didSetLocalAnalysisStage = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setViewPresentation:(signed __int16)a3
{
  self->_viewPresentation = a3;
  self->_didSetViewPresentation = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (BOOL)_validateAndGenerateStillImageForLoopingLivePhotoWithContentEditingOutput:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGImage *v15;
  const __CFURL *v16;
  __CFString *v17;
  CGImageDestination *v18;
  BOOL v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "renderedContentURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3C0]), "initWithURL:options:", v7, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithAVAsset:timeZoneLookup:", v8, 0);
  if ((objc_msgSend(v9, "isLoopingVideo") & 1) != 0)
  {
    v10 = objc_msgSend(v6, "shouldPreferHEICForRenderedImages");
    v11 = (void *)objc_opt_class();
    -[PHChangeRequest photoLibrary](self, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "photoLibraryURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageRenderURLUsingHEICFormat:appropriateForURL:", v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setRenderedContentURL:", v14);
    objc_msgSend(v6, "setRenderedVideoComplementContentURL:", v7);
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFC8]), "initWithAsset:", v8);
    v15 = (CGImage *)objc_msgSend(MEMORY[0x1E0D75130], "copyCGImageFromImageGenerator:atTime:actualTime:error:");
    v32 = 0;
    if (v15)
    {
      objc_msgSend(v6, "renderedContentURL");
      v16 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v18 = CGImageDestinationCreateWithURL(v16, v17, 1uLL, 0);

      if (v18)
      {
        CGImageDestinationAddImage(v18, v15, MEMORY[0x1E0C9AA70]);
        v19 = CGImageDestinationFinalize(v18);
        if (!v19)
        {
          v31 = (void *)MEMORY[0x1E0CB35C8];
          v38 = *MEMORY[0x1E0CB2D50];
          v39 = CFSTR("Failed to write still image");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v20);
          v21 = (id)objc_claimAutoreleasedReturnValue();
          if (a4)
            *a4 = v21;

        }
        CFRelease(v18);
      }
      else
      {
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v36 = *MEMORY[0x1E0CB2D50];
        v37 = CFSTR("Failed to create still image");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v28);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        if (a4)
          *a4 = v29;

        v19 = 0;
      }
      CFRelease(v15);
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v34 = *MEMORY[0x1E0CB2D50];
      v35 = CFSTR("Failed to generate still image from rendered content");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (a4)
        *a4 = v26;

      v19 = 0;
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0CB2D50];
    v41[0] = CFSTR("Looping video files must have loop metadata preserved on plugin save");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3302, v14);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    if (a4)
      *a4 = v23;
  }

  return v19;
}

- (BOOL)_validateImageURLForAssetMutation:(id)a3 error:(id *)a4
{
  const __CFURL *v6;
  CGImageSource *v7;
  CGImageSource *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
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
  char v25;
  void *v26;
  void *v27;
  const __CFString **v28;
  uint64_t *v29;
  void *v30;
  id v31;
  BOOL v32;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  CFDictionaryRef v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x1E0C80C00];
  v6 = (const __CFURL *)a3;
  v7 = CGImageSourceCreateWithURL(v6, 0);
  if (!v7)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v60 = *MEMORY[0x1E0CB2938];
    v61[0] = CFSTR("Cannot create image source from given URL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
LABEL_15:
    v31 = v22;
    goto LABEL_16;
  }
  v8 = v7;
  CGImageSourceGetType(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_12;
  if ((objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC530]) & 1) != 0
    || objc_msgSend(v11, "conformsToType:", *MEMORY[0x1E0CEC508]))
  {

    goto LABEL_6;
  }
  v25 = objc_msgSend(v11, "conformsToType:", *MEMORY[0x1E0CEC510]);

  if ((v25 & 1) == 0)
  {
LABEL_12:
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v58 = *MEMORY[0x1E0CB2938];
    v59 = CFSTR("Image is not JPEG or HEIF");
    v27 = (void *)MEMORY[0x1E0C99D80];
    v28 = &v59;
    v29 = &v58;
LABEL_13:
    objc_msgSend(v27, "dictionaryWithObjects:forKeys:count:", v28, v29, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3302, v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
LABEL_6:

  -[PHChangeRequest helper](self, "helper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clientLinkedAgainst");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "clientLinkedOnOrAfterFall2023OSVersions");

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CEC3F8];
    -[__CFURL pathExtension](v6, "pathExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "typeWithFilenameExtension:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9
      || (objc_msgSend(v9, "isDynamic") & 1) != 0
      || (objc_msgSend(v11, "isEqual:", v9) & 1) == 0
      && (!objc_msgSend(v11, "isEqual:", *MEMORY[0x1E0CEC510])
       || (v49 = *MEMORY[0x1E0CEC698], !objc_msgSend(v11, "conformsToType:", *MEMORY[0x1E0CEC698]))
       || !objc_msgSend(v9, "conformsToType:", v49)))
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v56 = *MEMORY[0x1E0CB2938];
      v18 = (void *)MEMORY[0x1E0CB3940];
      -[__CFURL path](v6, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Invalid image type (%@) for specified path: (%@)"), v11, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3302, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
      CFRelease(v8);
      goto LABEL_15;
    }

  }
  v9 = CGImageSourceCopyProperties(v8, 0);
  v34 = *MEMORY[0x1E0CBCFF0];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = v35;
    v37 = objc_msgSend(v35, "intValue");

    if (v37 != 1)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v54 = *MEMORY[0x1E0CB2938];
      v55 = CFSTR("Image is not in up (1) orientation");
      v27 = (void *)MEMORY[0x1E0C99D80];
      v28 = &v55;
      v29 = &v54;
      goto LABEL_13;
    }
  }

  if (!CGImageSourceGetCount(v8))
  {
    v45 = (void *)MEMORY[0x1E0CB35C8];
    v52 = *MEMORY[0x1E0CB2938];
    v53 = CFSTR("Empty image source");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3302, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v38 = CGImageSourceCopyPropertiesAtIndex(v8, 0, 0);
  -[__CFDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", v34);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39 && objc_msgSend(v39, "intValue") != 1)
  {

    goto LABEL_33;
  }
  -[__CFDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD090]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", v34);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (!v42)
  {

    goto LABEL_39;
  }
  v44 = objc_msgSend(v42, "intValue");

  if (v44 != 1)
  {
LABEL_33:
    v46 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2938];
    v51 = CFSTR("Image is not in up (1) orientation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3302, v47);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = 0;
    goto LABEL_40;
  }
  v43 = 0;
LABEL_39:
  v48 = 1;
LABEL_40:

  CFRelease(v8);
  v31 = v43;
  if ((v48 & 1) != 0)
  {
    v32 = 1;
    goto LABEL_19;
  }
LABEL_16:
  if (a4)
  {
    v31 = objc_retainAutorelease(v31);
    v32 = 0;
    *a4 = v31;
  }
  else
  {
    v32 = 0;
  }
LABEL_19:

  return v32;
}

- (BOOL)validateVideoURLForAssetMutation:(id)a3 error:(id *)a4
{
  id v5;
  PHValidator *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(PHValidator);
    LOBYTE(a4) = -[PHValidator validateURL:withOptions:error:](v6, "validateURL:withOptions:error:", v5, 32, a4);

  }
  else if (a4)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = CFSTR("failed to validate with nil url");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (BOOL)validateAdjustmentDataForAssetMutation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  const __CFString **v16;
  uint64_t *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  BOOL v23;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "formatIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple."));

  if (!v9
    || self->_clientEntitled
    || (-[NSString lowercaseString](self->_editorBundleID, "lowercaseString"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("com.apple.")),
        v10,
        (v11 & 1) != 0))
  {
    objc_msgSend(v6, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "length"))
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D50];
      v28 = CFSTR("Adjustment data is missing");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v18;
      v21 = 3303;
      goto LABEL_11;
    }
    v13 = objc_msgSend(v12, "length");
    if (v13 <= +[PHContentEditingOutput maximumAdjustmentDataLength](PHContentEditingOutput, "maximumAdjustmentDataLength"))
    {

      v22 = 0;
      v23 = 1;
      goto LABEL_14;
    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("Adjustment data too large");
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v26;
    v17 = &v25;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid format identifier %@"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v12;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = (const __CFString **)v30;
    v17 = &v29;
  }
  objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v14;
  v21 = 3302;
LABEL_11:
  objc_msgSend(v20, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), v21, v19);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v22 = objc_retainAutorelease(v22);
    v23 = 0;
    *a4 = v22;
  }
  else
  {
    v23 = 0;
  }
LABEL_14:

  return v23;
}

- (BOOL)validateAssetDescription:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6
    || -[PHChangeRequest isClientEntitled](self, "isClientEntitled")
    || -[PHAssetChangeRequest duplicateAllowsPrivateMetadata](self, "duplicateAllowsPrivateMetadata"))
  {
    v7 = 0;
    v8 = 1;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("Updating asset description is not allowed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 5101, v11);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      v7 = objc_retainAutorelease(v7);
      v8 = 0;
      *a4 = v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)validateAccessibilityDescription:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6
    || -[PHChangeRequest isClientEntitled](self, "isClientEntitled")
    || -[PHAssetChangeRequest duplicateAllowsPrivateMetadata](self, "duplicateAllowsPrivateMetadata"))
  {
    v7 = 0;
    v8 = 1;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("Updating accessibility description is not allowed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 5101, v11);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      v7 = objc_retainAutorelease(v7);
      v8 = 0;
      *a4 = v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_validateAsyncContentEditingOutputPreviewRenderURLs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v14;
  id v15;

  v6 = a3;
  if (objc_msgSend(v6, "mediaType") == 2)
  {
    objc_msgSend(v6, "renderedVideoPosterURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v8 = -[PHAssetChangeRequest _validateImageURLForAssetMutation:error:](self, "_validateImageURLForAssetMutation:error:", v7, &v15);
    v9 = v15;

    if (v8)
    {
      v10 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    v9 = 0;
  }
  v11 = v9;
  objc_msgSend(v6, "renderedPreviewContentURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  v10 = -[PHAssetChangeRequest _validateImageURLForAssetMutation:error:](self, "_validateImageURLForAssetMutation:error:", v12, &v14);
  v9 = v14;

  if (a4 && !v10)
  {
    v9 = objc_retainAutorelease(v9);
    v10 = 0;
    *a4 = v9;
  }
LABEL_8:

  return v10;
}

- (NSString)managedEntityName
{
  return (NSString *)CFSTR("Asset");
}

- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  const __CFString **v21;
  uint64_t *v22;
  char v23;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  BOOL v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  const __CFString *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  const __CFString *v87;
  uint64_t v88;
  _QWORD v89[3];

  v89[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PHChangeRequest helper](self, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0;
  v8 = objc_msgSend(v7, "validateMutationsToManagedObject:error:", v6, &v77);
  v9 = v77;

  if (!v8)
    goto LABEL_8;
  -[PHAssetChangeRequest assetDescription](self, "assetDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v9;
  v11 = -[PHAssetChangeRequest validateAssetDescription:error:](self, "validateAssetDescription:error:", v10, &v76);
  v12 = v76;

  if (!v11)
  {
    v9 = v12;
LABEL_8:
    -[PHAssetChangeRequest contentEditingOutput](self, "contentEditingOutput");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[PHAssetChangeRequest accessibilityDescription](self, "accessibilityDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v12;
  v14 = -[PHAssetChangeRequest validateAccessibilityDescription:error:](self, "validateAccessibilityDescription:error:", v13, &v75);
  v9 = v75;

  -[PHAssetChangeRequest contentEditingOutput](self, "contentEditingOutput");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v14)
    goto LABEL_9;
  if (objc_msgSend(v15, "isOnlyChangingOriginalChoice"))
  {
    objc_msgSend(v16, "originalResourceChoice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "integerValue");

    if (v18 >= 2)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v88 = *MEMORY[0x1E0CB2D50];
      v89[0] = CFSTR("Invalid original choice, only valid values are Original or OriginalAlt");
      v20 = (void *)MEMORY[0x1E0C99D80];
      v21 = (const __CFString **)v89;
      v22 = &v88;
LABEL_34:
      objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 1);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v37);
      v54 = objc_claimAutoreleasedReturnValue();

      goto LABEL_35;
    }
    if ((objc_msgSend(v6, "isRAWPlusJPEG") & 1) == 0)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v86 = *MEMORY[0x1E0CB2D50];
      v87 = CFSTR("Can only swap original choice of R+J asset");
      v20 = (void *)MEMORY[0x1E0C99D80];
      v21 = &v87;
      v22 = &v86;
      goto LABEL_34;
    }
  }
  if (!-[PHAssetChangeRequest didChangeAdjustments](self, "didChangeAdjustments"))
    goto LABEL_24;
  if (v16 && (objc_msgSend(v16, "isOnlyChangingOriginalChoice") & 1) == 0)
  {
    v74 = v9;
    v55 = -[PHAssetChangeRequest validateContentEditingOutput:error:](self, "validateContentEditingOutput:error:", v16, &v74);
    v56 = v74;

    objc_msgSend(v16, "originalResourceChoice");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v57)
    {
      if (v55)
      {
        v9 = v56;
        goto LABEL_24;
      }
      goto LABEL_45;
    }
    objc_msgSend(v16, "originalResourceChoice");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "integerValue");

    v60 = v6;
    objc_msgSend(v60, "pathForOriginalFile");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "pathExtension");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D71880], "uniformTypeIdentifierFromPathExtension:assetType:", v62, objc_msgSend(v60, "kind"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v63);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v73, "conformsToType:", *MEMORY[0x1E0CEC5B8]) && (unint64_t)(v59 - 1) < 2
      || objc_msgSend(v60, "isRAWPlusJPEG") && (v59 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v71 = (void *)MEMORY[0x1E0CB35C8];
      v84 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid original resource choice: %ld"), v59);
      v72 = v63;
      v64 = v56;
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v65;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
      v66 = v60;
      v67 = v62;
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v68);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v63 = v72;
      v62 = v67;
      v60 = v66;

      v55 = 0;
    }
    else
    {
      v9 = v56;
    }

    if (v55)
      goto LABEL_24;
LABEL_9:
    v23 = 0;
    goto LABEL_10;
  }
  -[PHChangeRequest photoLibrary](self, "photoLibrary");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v25, "isCloudPhotoLibraryEnabled"))
    goto LABEL_23;
  objc_msgSend(v6, "entity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(v6, "managedObjectContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "entityInManagedObjectContext:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v26, "isKindOfEntity:", v29);

  if (v30)
  {
    v25 = v6;
    objc_msgSend(v25, "master");
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = (void *)v31;
      objc_msgSend(v25, "additionalAttributes");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "originalResourceChoice");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "integerValue") == 1;

      objc_msgSend(v25, "uuid");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v34) = objc_msgSend(v32, "allOriginalsAreLocallyAvailableForAssetUuid:useOriginalAltInsteadOfOriginal:", v36, v35);

      if ((_DWORD)v34)
      {

        goto LABEL_23;
      }
      v69 = (void *)MEMORY[0x1E0CB35C8];
      v82 = *MEMORY[0x1E0CB2D50];
      v83 = CFSTR("Missing original resources");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v70);
      v56 = (id)objc_claimAutoreleasedReturnValue();

LABEL_45:
      v23 = 0;
      v9 = v56;
      goto LABEL_10;
    }
LABEL_23:

  }
LABEL_24:
  if (self->_didPromoteToGuestAsset)
  {
    v37 = v6;
    objc_msgSend(MEMORY[0x1E0D73310], "maskForAllowedToPromoteToGuestAsset");
    objc_msgSend(v37, "savedAssetType");
    if (!PLValidatedSavedAssetTypeApplies())
    {
      v47 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v37, "uuid");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v37, "savedAssetType");
      objc_msgSend(v37, "savedAssetType");
      PLValidatedSavedAssetTypeDescription();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringWithFormat:", CFSTR("Not allowed to promote asset %@ savedAssetType %hd(%@) to Guest"), v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = (void *)MEMORY[0x1E0CB35C8];
      v80 = *MEMORY[0x1E0CB2938];
      v81 = v51;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v53);
      v54 = objc_claimAutoreleasedReturnValue();

LABEL_35:
      v23 = 0;
      v9 = (id)v54;
      goto LABEL_10;
    }

  }
  if (!self->_didResetGuestAssetPromotion)
  {
    v23 = 1;
    goto LABEL_13;
  }
  v38 = v6;
  objc_msgSend(MEMORY[0x1E0D73310], "maskForAllowedToPromoteToGuestAsset");
  objc_msgSend(v38, "savedAssetType");
  v23 = PLValidatedSavedAssetTypeApplies();
  if ((v23 & 1) == 0)
  {
    v39 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v38, "uuid");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v38, "savedAssetType");
    objc_msgSend(v38, "savedAssetType");
    PLValidatedSavedAssetTypeDescription();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("Not allowed to reset promote asset %@ savedAssetType %hd(%@) to Guest"), v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = (void *)MEMORY[0x1E0CB35C8];
    v78 = *MEMORY[0x1E0CB2938];
    v79 = v43;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v45);
    v46 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v46;
  }

LABEL_10:
  if (a4 && (v23 & 1) == 0)
  {
    v9 = objc_retainAutorelease(v9);
    v23 = 0;
    *a4 = v9;
  }
LABEL_13:

  return v23;
}

- (BOOL)validateContentEditingOutput:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  id v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "adjustmentData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v42 = 0;
    v8 = -[PHAssetChangeRequest validateAdjustmentDataForAssetMutation:error:](self, "validateAdjustmentDataForAssetMutation:error:", v7, &v42);
    v9 = v42;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D50];
    v48[0] = CFSTR("Missing adjustment data");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 0;
  }
  objc_msgSend(v6, "renderedContentURL");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v8 && v12)
  {
    v41 = v9;
    v14 = -[PHAssetChangeRequest validateWriteAccessForContentURL:error:](self, "validateWriteAccessForContentURL:error:", v12, &v41);
    v15 = v41;

    if (!v14)
      goto LABEL_30;
    v9 = v15;
  }
  else if (!v8)
  {
    v16 = 0;
    v15 = v9;
    if (!a4)
      goto LABEL_33;
    goto LABEL_31;
  }
  if (objc_msgSend(v6, "isAsyncAdjustment"))
  {
    v40 = v9;
    v16 = -[PHAssetChangeRequest _validateAsyncContentEditingOutputPreviewRenderURLs:error:](self, "_validateAsyncContentEditingOutputPreviewRenderURLs:error:", v6, &v40);
    v17 = v40;
LABEL_11:
    v15 = v17;
    goto LABEL_12;
  }
  if ((objc_msgSend(v6, "isAsyncAdjustment") & 1) == 0)
  {
    v18 = objc_msgSend(v6, "mediaType");
    if (v18 == 2)
    {
      if (v13)
      {
        v37 = v9;
        v19 = -[PHAssetChangeRequest validateVideoURLForAssetMutation:error:](self, "validateVideoURLForAssetMutation:error:", v13, &v37);
        v20 = v37;
        goto LABEL_24;
      }
      v28 = objc_alloc(MEMORY[0x1E0D75308]);
      objc_msgSend(v7, "formatIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "formatVersion");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "data");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v28, "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v29, v30, v31, 0, 0, 0);

      if (objc_msgSend(v32, "isRecognizedFormat"))
      {

LABEL_26:
        if (objc_msgSend(v6, "isLoopingLivePhoto"))
        {
          v36 = v9;
          v16 = -[PHAssetChangeRequest _validateAndGenerateStillImageForLoopingLivePhotoWithContentEditingOutput:error:](self, "_validateAndGenerateStillImageForLoopingLivePhotoWithContentEditingOutput:error:", v6, &v36);
          v17 = v36;
          goto LABEL_11;
        }
        goto LABEL_17;
      }
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v45 = *MEMORY[0x1E0CB2D50];
      v46 = CFSTR("Missing rendered video content");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v34);
      v35 = v32;
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v16 = 0;
      v9 = v35;
    }
    else
    {
      if (v18 == 1)
      {
        if (!objc_msgSend(v6, "isLoopingLivePhoto"))
        {
          v38 = v9;
          v26 = -[PHAssetChangeRequest _validateImageURLForAssetMutation:error:](self, "_validateImageURLForAssetMutation:error:", v13, &v38);
          v15 = v38;

          if (v26)
            goto LABEL_25;
          goto LABEL_30;
        }
        v39 = v9;
        v19 = -[PHAssetChangeRequest validateVideoURLForAssetMutation:error:](self, "validateVideoURLForAssetMutation:error:", v13, &v39);
        v20 = v39;
LABEL_24:
        v15 = v20;

        if (v19)
        {
LABEL_25:
          v9 = v15;
          goto LABEL_26;
        }
LABEL_30:
        v16 = 0;
        if (!a4)
          goto LABEL_33;
        goto LABEL_31;
      }
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v43 = *MEMORY[0x1E0CB2D50];
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("Cannot modify content type %@"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v25);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v16 = 0;
      v9 = (id)v23;
    }
LABEL_12:

    if (!a4)
      goto LABEL_33;
LABEL_31:
    if (!v16)
    {
      v9 = objc_retainAutorelease(v15);
      v16 = 0;
      *a4 = v9;
      goto LABEL_34;
    }
LABEL_33:
    v9 = v15;
    goto LABEL_34;
  }
LABEL_17:
  v16 = 1;
LABEL_34:

  return v16;
}

- (BOOL)validateWriteAccessForContentURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(v6, "isFileURL") & 1) != 0)
  {
    if (!PLIsAssetsd() || -[PHChangeRequest isClientEntitled](self, "isClientEntitled"))
      goto LABEL_6;
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D732C8], "processWithID:canWriteSandboxForPath:", self->_clientProcessIdentifier, v7))
    {

LABEL_6:
      v8 = 0;
      v9 = 1;
      goto LABEL_11;
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid URL %@"), v6, *MEMORY[0x1E0CB2D50]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v14);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid URL %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (a4)
  {
    v8 = objc_retainAutorelease(v8);
    v9 = 0;
    *a4 = v8;
  }
  else
  {
    v9 = 0;
  }
LABEL_11:

  return v9;
}

- (id)getMediaAnalysisAttributesForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "mediaAnalysisAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "mediaAnalysisAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D718C0], "entityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v3, "setMediaAnalysisAttributes:", v5);

  }
  return v5;
}

- (id)getPhotoAnalysisAttributesForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "photoAnalysisAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "photoAnalysisAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71948], "entityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v3, "setPhotoAnalysisAttributes:", v5);

  }
  return v5;
}

- (BOOL)validateReadAccessForContentURL:(id)a3 assetResource:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "isFileURL") & 1) != 0)
  {
    if (!PLIsAssetsd()
      || -[PHChangeRequest isClientEntitled](self, "isClientEntitled")
      || (objc_msgSend(v9, "duplicateAllowsReadAccess") & 1) != 0)
    {
      goto LABEL_7;
    }
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D732C8], "processWithID:canReadSandboxForPath:", self->_clientProcessIdentifier, v10))
    {

LABEL_7:
      v11 = 0;
      v12 = 1;
      goto LABEL_12;
    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid URL %@"), v8, *MEMORY[0x1E0CB2D50]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v17);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid URL %@"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v14);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (a5)
  {
    v11 = objc_retainAutorelease(v11);
    v12 = 0;
    *a5 = v11;
  }
  else
  {
    v12 = 0;
  }
LABEL_12:

  return v12;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
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
  CLLocation *v23;
  void *v24;
  int v25;
  void *v26;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  BOOL v30;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  PHSceneClassification *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t j;
  void *v69;
  void *v70;
  uint64_t v71;
  double v72;
  double v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  unint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t k;
  void *v117;
  PHRelationshipChangeRequestHelper *keywordsHelper;
  void *v119;
  void *v120;
  PHRelationshipChangeRequestHelper *v121;
  id v122;
  void *v123;
  NSObject *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  NSObject *v129;
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
  uint64_t v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  char v146;
  void *v147;
  void *v148;
  void *v149;
  int v150;
  void *v151;
  void *v152;
  void *v153;
  unint64_t v154;
  void *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  NSObject *v160;
  __CFString *v161;
  void *v162;
  void *v163;
  unint64_t v164;
  void *v165;
  void *v166;
  uint64_t v167;
  NSObject *v168;
  __CFString *v169;
  unint64_t originalResourceChoice;
  void *v171;
  void *v172;
  uint64_t v173;
  BOOL v174;
  NSObject *v175;
  unint64_t v176;
  __CFString *v177;
  __CFString *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  id v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t m;
  void *v191;
  int v192;
  id v193;
  NSObject *v194;
  void *v195;
  void *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t n;
  void *v201;
  void *v202;
  void *v203;
  __CFString *v204;
  void *v205;
  unint64_t v206;
  __CFString *v207;
  void *v208;
  void *v209;
  uint64_t v210;
  void *v211;
  void *v212;
  id v213;
  void *v214;
  double v215;
  double v216;
  void *v217;
  double v218;
  void *v219;
  id v220;
  id v221;
  void *v222;
  int v223;
  void *v224;
  int v225;
  void *v226;
  void *v227;
  void *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t ii;
  void *v233;
  void *v234;
  uint64_t v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  id v240;
  NSMutableDictionary *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t jj;
  uint64_t v246;
  void *v247;
  void *v248;
  void *v249;
  _BOOL4 didSetMediaAnalysisVersion;
  void *v251;
  void *v252;
  void *v253;
  __int128 v254;
  void *v255;
  __int128 v256;
  $95D729B680665BEAEFA1D6FCA8238556 *p_bestKeyFrameTime;
  NSObject *v258;
  __CFString *v259;
  NSUInteger v260;
  void *v261;
  CGImageSourceRef v262;
  CGImageSourceRef v263;
  NSObject *v264;
  void *v265;
  NSObject *v266;
  id v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  char v273;
  id v274;
  NSObject *v275;
  void *v276;
  int v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  double v283;
  void *v284;
  double v285;
  void *v286;
  double v287;
  void *v288;
  double v289;
  void *v290;
  double v291;
  void *v292;
  double v293;
  void *v294;
  double v295;
  void *v296;
  double v297;
  void *v298;
  double v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  double v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  double v309;
  void *v310;
  void *v311;
  _BOOL4 resetWallpaperProperties;
  void *v313;
  void *v314;
  unint64_t wallpaperPropertiesVersion;
  void *v316;
  void *v317;
  void *v318;
  NSString *syndicationIdentifier;
  void *v320;
  uint64_t faceAnalysisVersion;
  void *v322;
  int v323;
  int localAnalysisStage;
  void *v325;
  int v326;
  NSObject *v327;
  void *v328;
  int v329;
  int v330;
  void *v331;
  uint64_t viewPresentation;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  uint64_t v348;
  void *v349;
  NSDictionary *pathsToNewAssetResourcesByAssetResourceType;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t kk;
  void *v355;
  uint64_t v356;
  void *v357;
  uint64_t v358;
  char v359;
  void *v360;
  void *v361;
  void *v362;
  id v363;
  id v364;
  uint64_t v365;
  void *v366;
  void *v367;
  NSSet *assetResourceTypesToDelete;
  NSSet *v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t mm;
  void *v374;
  uint64_t v375;
  uint64_t v376;
  void *v377;
  void *v378;
  char v379;
  id v380;
  uint64_t v381;
  void *v382;
  void *v383;
  uint64_t v384;
  void *v385;
  void *v386;
  _BOOL4 v387;
  void *v388;
  id v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  int v395;
  void *v396;
  void *v397;
  id v398;
  int v400;
  NSString *v401;
  NSString *v402;
  CLLocation *v403;
  void *v404;
  void *v405;
  id *v406;
  _BOOL4 didSetSceneClassifications;
  NSMutableDictionary *obj;
  id obja;
  uint64_t v410;
  void *v411;
  void *v412;
  uint64_t v413;
  void *v414;
  uint64_t v415;
  void *v416;
  uint64_t v417;
  id v418;
  PHAssetChangeRequest *v419;
  void *v420;
  void *v421;
  uint64_t v422;
  void *v423;
  char v424;
  id v425;
  void *v426;
  id v427;
  id v428;
  id v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  void *v434;
  void *v435;
  void *v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  id v441;
  id v442;
  id v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  uint64_t v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  id v453;
  id v454;
  id v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  id v460;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  id v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  id v470;
  id v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  uint64_t v485;
  __int128 v486;
  uint64_t v487;
  __int128 v488;
  uint64_t v489;
  id v490;
  uint64_t v491;
  id v492;
  _BYTE v493[128];
  uint64_t v494;
  void *v495;
  uint64_t v496;
  void *v497;
  _BYTE v498[128];
  uint64_t v499;
  const __CFString *v500;
  _BYTE buf[32];
  __int128 v502;
  _BYTE v503[128];
  _BYTE v504[128];
  _BYTE v505[128];
  _BYTE v506[128];
  _BYTE v507[128];
  _BYTE v508[128];
  _BYTE v509[128];
  _BYTE v510[128];
  uint64_t v511;

  v511 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v425 = a4;
  -[PHChangeRequest helper](self, "helper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v490 = 0;
  v10 = objc_msgSend(v9, "applyMutationsToManagedObject:error:", v8, &v490);
  v418 = v490;

  if (!v10)
  {
    v30 = 0;
    goto LABEL_476;
  }
  v406 = a5;
  -[PHChangeRequest helper](self, "helper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mutations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("dateCreated"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v8, "didSetCustomDateCreated");
  if (objc_msgSend(v8, "isAvalancheStackPhoto"))
  {
    -[PHChangeRequest helper](self, "helper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mutations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("hidden"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_alloc(MEMORY[0x1E0D715B8]);
      objc_msgSend(v8, "avalancheUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithUUID:photoLibrary:", v18, v425);

      -[PHChangeRequest helper](self, "helper");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "mutations");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", CFSTR("hidden"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setHidden:", objc_msgSend(v22, "BOOLValue"));

    }
  }
  v23 = self->_updatedLocation;
  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[CLLocation isEqual:](v23, "isEqual:", v24);

    if (v25)
    {

      v23 = 0;
    }
    objc_msgSend(v8, "setLocation:", v23);
    objc_msgSend(v8, "didSetCustomLocation");
  }
  if (self->_didSetGpsHorizontalAccuracy)
  {
    objc_msgSend(v8, "additionalAttributes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setGpsHorizontalAccuracy:", self->_gpsHorizontalAccuracy);

  }
  v27 = self->_assetDescription;
  if (v27)
  {
    v28 = v27;
    if (-[NSString isEqualToString:](v27, "isEqualToString:", &stru_1E35DFFF8))
    {

      v29 = 0;
    }
    else
    {
      v29 = v28;
    }
    v402 = v29;
    objc_msgSend(v8, "setLongDescription:");
  }
  else
  {
    v402 = 0;
  }
  v31 = self->_accessibilityDescription;
  if (v31)
  {
    v32 = v31;
    if (-[NSString isEqualToString:](v31, "isEqualToString:", &stru_1E35DFFF8))
    {

      v33 = 0;
    }
    else
    {
      v33 = v32;
    }
    v401 = v33;
    objc_msgSend(v8, "setAccessibilityDescription:");
  }
  else
  {
    v401 = 0;
  }
  if (self->_didSetTitle)
  {
    objc_msgSend(v8, "additionalAttributes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTitle:", self->_title);

  }
  -[PHAssetChangeRequest videoURLForUpdate](self, "videoURLForUpdate");
  v35 = objc_claimAutoreleasedReturnValue();
  -[PHAssetChangeRequest pairingIdentifier](self, "pairingIdentifier");
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = 1;
  v404 = (void *)v36;
  v405 = (void *)v35;
  if (v35 && v36)
  {
    memset(buf, 0, 24);
    -[PHAssetChangeRequest videoDuration](self, "videoDuration");
    v488 = 0uLL;
    v489 = 0;
    -[PHAssetChangeRequest imageDisplayTime](self, "imageDisplayTime");
    v486 = *(_OWORD *)buf;
    v487 = *(_QWORD *)&buf[16];
    v484 = v488;
    v485 = v489;
    v37 = objc_msgSend(v8, "becomePhotoIrisWithMediaGroupUUID:mainFileMetadata:videoURL:videoDuration:stillDisplayTime:options:", v404, 0, v35, &v486, &v484, 0);
  }
  if (self->_didSetVisibilityState && objc_msgSend(v8, "isPhotoIris"))
  {
    objc_msgSend(v8, "setVideoCpVisibilityState:", self->_photoIrisVisibilityState);
    objc_msgSend(v8, "updatePlaybackStyleWithLivePhotoPlayability:", objc_msgSend(v8, "canPlayPhotoIris"));
  }
  didSetSceneClassifications = self->_didSetSceneClassifications;
  v426 = v8;
  v419 = self;
  v403 = v23;
  if (self->_didSetSceneClassifications)
  {
    v400 = v37;
    v482 = 0u;
    v483 = 0u;
    v480 = 0u;
    v481 = 0u;
    obj = self->_sceneClassificationDictionariesByType;
    v413 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v480, v510, 16);
    if (!v413)
      goto LABEL_71;
    v410 = *(_QWORD *)v481;
    v38 = 0x1E0CB3000uLL;
    while (1)
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v481 != v410)
          objc_enumerationMutation(obj);
        v415 = v39;
        v40 = *(void **)(*((_QWORD *)&v480 + 1) + 8 * v39);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_sceneClassificationDictionariesByType, "objectForKeyedSubscript:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v38 + 2368), "stringWithUTF8String:", "sceneAnalysisVersion");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", v42);
        v420 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKeyedSubscript:](self->_sceneClassificationDictionariesByType, "objectForKeyedSubscript:", v40);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v38 + 2368), "stringWithUTF8String:", "sceneAnalysisTimestamp");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", v44);
        v423 = (void *)objc_claimAutoreleasedReturnValue();

        PLAssetAnalysisGetLog();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          -[PHChangeRequest uuid](self, "uuid");
          v46 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v46;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v423;
          _os_log_impl(&dword_1991EC000, v45, OS_LOG_TYPE_DEBUG, "Applying scene classifications to managed object - uuid: %@, adjustment timestamp: %@", buf, 0x16u);

        }
        -[NSMutableDictionary objectForKeyedSubscript:](self->_sceneClassificationDictionariesByType, "objectForKeyedSubscript:", v40);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v38 + 2368), "stringWithUTF8String:", "sceneClassifications");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectForKeyedSubscript:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v476 = 0u;
        v477 = 0u;
        v478 = 0u;
        v479 = 0u;
        v51 = v49;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v476, v509, 16);
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v477;
          do
          {
            for (i = 0; i != v53; ++i)
            {
              if (*(_QWORD *)v477 != v54)
                objc_enumerationMutation(v51);
              v56 = -[PHSceneClassification initWithDictionaryRepresentation:]([PHSceneClassification alloc], "initWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v476 + 1) + 8 * i));
              objc_msgSend(v50, "addObject:", v56);

            }
            v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v476, v509, 16);
          }
          while (v53);
        }

        v57 = objc_msgSend(v40, "integerValue");
        if ((unint64_t)(v57 - 4) < 4)
        {
          objc_msgSend(v426, "removeSceneClassificationsOfType:", v57);
          -[NSMutableDictionary objectForKeyedSubscript:](v419->_sceneClassificationDictionariesByType, "objectForKeyedSubscript:", v40);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v38 + 2368), "stringWithUTF8String:", "sceneAnalysisLocationVersion");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "objectForKeyedSubscript:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](v419, "getMediaAnalysisAttributesForAsset:", v426);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (v420)
          {
            objc_msgSend(v61, "setVaAnalysisVersion:", (__int16)objc_msgSend(v420, "integerValue"));
            goto LABEL_59;
          }
          if (v60)
          {
            objc_msgSend(v61, "setVaLocationAnalysisVersion:", (__int16)objc_msgSend(v60, "integerValue"));
LABEL_59:
            objc_msgSend(v61, "setVaAnalysisTimestamp:", v423);
          }

          goto LABEL_61;
        }
        if ((unint64_t)(v57 - 2) >= 2)
        {
          if (v57)
            goto LABEL_62;
          objc_msgSend(v426, "removeSceneClassificationsOfType:");
          objc_msgSend(v426, "additionalAttributes");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v420, "shortValue");
        }
        else
        {
          objc_msgSend(v426, "removeTemporalSceneClassificationsOfType:", v57);
          objc_msgSend(v426, "additionalAttributes");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (__int16)objc_msgSend(v420, "integerValue");
        }
        objc_msgSend(v62, "setSceneAnalysisVersion:", v63);

        objc_msgSend(v426, "additionalAttributes");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setSceneAnalysisTimestamp:", v423);
LABEL_61:

LABEL_62:
        v474 = 0u;
        v475 = 0u;
        v472 = 0u;
        v473 = 0u;
        v64 = v50;
        v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v472, v508, 16);
        if (v65)
        {
          v66 = v65;
          v67 = *(_QWORD *)v473;
          do
          {
            for (j = 0; j != v66; ++j)
            {
              if (*(_QWORD *)v473 != v67)
                objc_enumerationMutation(v64);
              v69 = *(void **)(*((_QWORD *)&v472 + 1) + 8 * j);
              v70 = (void *)MEMORY[0x1E0D71AB0];
              v71 = objc_msgSend(v69, "extendedSceneIdentifier");
              objc_msgSend(v69, "confidence");
              v73 = v72;
              v74 = objc_msgSend(v69, "packedBoundingBoxRect");
              objc_msgSend(v69, "startTime");
              v76 = v75;
              objc_msgSend(v69, "duration");
              v78 = (id)objc_msgSend(v70, "insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:", v425, v426, v71, v74, objc_msgSend(v69, "classificationType"), v73, v76, v77);
            }
            v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v472, v508, 16);
          }
          while (v66);
        }

        v39 = v415 + 1;
        v8 = v426;
        self = v419;
        v38 = 0x1E0CB3000;
      }
      while (v415 + 1 != v413);
      v413 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v480, v510, 16);
      if (!v413)
      {
LABEL_71:

        *(_QWORD *)buf = 0;
        *(_QWORD *)&v488 = 0;
        objc_msgSend(v8, "uuid");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        PLStringUUIDComponents();

        kdebug_trace();
        v37 = v400;
        break;
      }
    }
  }
  if (self->_didSetImageEmbeddingVersion)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v8);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setImageEmbeddingVersion:", self->_imageEmbeddingVersion);

  }
  if (self->_didSetVideoEmbeddingVersion)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v8);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setVideoEmbeddingVersion:", self->_videoEmbeddingVersion);

  }
  if (self->_incrementPlayCount)
  {
    objc_msgSend(v8, "additionalAttributes");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "pendingPlayCount");

    objc_msgSend(v8, "additionalAttributes");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setPendingPlayCount:", v83 + 1);

  }
  if (self->_incrementShareCount)
  {
    objc_msgSend(v8, "additionalAttributes");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v85, "pendingShareCount");

    objc_msgSend(v8, "additionalAttributes");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setPendingShareCount:", v86 + 1);

  }
  if (self->_lastSharedDate)
    objc_msgSend(v8, "setLastSharedDate:");
  if (self->_incrementViewCount)
  {
    objc_msgSend(v8, "additionalAttributes");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v88, "pendingViewCount");

    objc_msgSend(v8, "additionalAttributes");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setLastViewedDate:", v91);

    objc_msgSend(v8, "additionalAttributes");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setPendingViewCount:", v89 + 1);

  }
  if (self->_didSetVariationSuggestionStates)
  {
    objc_msgSend(v8, "additionalAttributes");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v93, "variationSuggestionStates");

    v95 = self->_variationSuggestionStates | v94 & ~self->_variationSuggestionStatesMask;
    objc_msgSend(v8, "additionalAttributes");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setVariationSuggestionStates:", v95);

  }
  if (self->_didSetTimeZone)
  {
    objc_msgSend(v8, "additionalAttributes");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setTimeZoneName:", self->_timeZoneName);

    objc_msgSend(v8, "additionalAttributes");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_timeZoneOffsetValue);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setTimeZoneOffset:", v99);

  }
  v100 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PHAssetChangeRequest facesHelper](self, "facesHelper");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "mutableObjectIDsAndUUIDs");
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  v412 = v101;
  if (v102)
  {
    objc_msgSend(v101, "setAllowsInsert:", 1);
    objc_msgSend(v101, "setAllowsMove:", 0);
    objc_msgSend(v101, "setAllowsRemove:", 1);
    objc_msgSend(v101, "setDestinationEntityName:", CFSTR("DetectedFace"));
    objc_msgSend(v8, "mutableDetectedFaces");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v471 = v418;
    v37 = objc_msgSend(v101, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v8, v103, &v471);
    v104 = v471;

    if (v37)
    {
      objc_msgSend(v103, "allObjects");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "addObjectsFromArray:", v105);

    }
    v418 = v104;
  }
  -[PHAssetChangeRequest temporalFacesHelper](self, "temporalFacesHelper");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "mutableObjectIDsAndUUIDs");
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  v414 = v100;
  v411 = v106;
  if (v107)
  {
    objc_msgSend(v106, "setAllowsInsert:", 1);
    objc_msgSend(v106, "setAllowsMove:", 0);
    objc_msgSend(v106, "setAllowsRemove:", 1);
    objc_msgSend(MEMORY[0x1E0D716C8], "entityName");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setDestinationEntityName:", v108);

    objc_msgSend(v8, "mutableTemporalDetectedFaces");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v470 = v418;
    LODWORD(v108) = objc_msgSend(v106, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v8, v109, &v470);
    v110 = v470;

    v424 = 0;
    if (!(_DWORD)v108)
    {
LABEL_108:

      v418 = v110;
      goto LABEL_111;
    }
    objc_msgSend(v109, "allObjects");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v414, "addObjectsFromArray:", v111);

    v100 = v414;
  }
  else
  {
    if (!v37)
    {
      v424 = 0;
      goto LABEL_111;
    }
    v110 = v418;
  }
  if (objc_msgSend(v100, "count"))
  {
    v468 = 0u;
    v469 = 0u;
    v466 = 0u;
    v467 = 0u;
    v112 = v100;
    v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v466, v507, 16);
    if (v113)
    {
      v114 = v113;
      v115 = *(_QWORD *)v467;
      do
      {
        for (k = 0; k != v114; ++k)
        {
          if (*(_QWORD *)v467 != v115)
            objc_enumerationMutation(v112);
          objc_msgSend(*(id *)(*((_QWORD *)&v466 + 1) + 8 * k), "fixAssetRelationshipsForFaceTorsoOrTemporal");
        }
        v114 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v466, v507, 16);
      }
      while (v114);
    }

  }
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_keywordsHelper, "mutableObjectIDsAndUUIDs");
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  if (v117)
  {
    -[PHRelationshipChangeRequestHelper setAllowsInsert:](self->_keywordsHelper, "setAllowsInsert:", 1);
    -[PHRelationshipChangeRequestHelper setAllowsMove:](self->_keywordsHelper, "setAllowsMove:", 0);
    keywordsHelper = self->_keywordsHelper;
    objc_msgSend(MEMORY[0x1E0D718A0], "entityName");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHRelationshipChangeRequestHelper setDestinationEntityName:](keywordsHelper, "setDestinationEntityName:", v119);

    objc_msgSend(v426, "additionalAttributes");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "mutableSetValueForKey:", CFSTR("keywords"));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = self->_keywordsHelper;
    v8 = v426;
    v465 = v110;
    v424 = -[PHRelationshipChangeRequestHelper applyMutationsToManagedObject:unorderedMutableChildren:error:](v121, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v109, v120, &v465);
    v122 = v465;

    v110 = v122;
    goto LABEL_108;
  }
  v424 = 1;
  v418 = v110;
  v8 = v426;
LABEL_111:
  if (!-[PHAssetChangeRequest didChangeAdjustments](self, "didChangeAdjustments"))
    goto LABEL_145;
  -[PHAssetChangeRequest contentEditingOutput](self, "contentEditingOutput");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoEditGetLog();
  v124 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v123, "debugDescription");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v125;
    _os_log_impl(&dword_1991EC000, v124, OS_LOG_TYPE_DEFAULT, "Asset change request applying content editing output:\n%@", buf, 0xCu);

  }
  if ((objc_msgSend(v123, "isOnlyChangingOriginalChoice") & 1) != 0)
  {
    if (objc_msgSend(v8, "hasAdjustments"))
    {
      objc_msgSend(MEMORY[0x1E0D71578], "assetAdjustmentOptionsForRevertingToOriginal");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAdjustments:options:", 0, v126);

    }
    goto LABEL_144;
  }
  v127 = objc_msgSend(v8, "cameraProcessingAdjustmentState");
  if (objc_msgSend(v8, "cameraProcessingAdjustmentState") != (_DWORD)v127)
    objc_msgSend(v8, "setCameraProcessingAdjustmentState:", v127);
  if (!objc_msgSend(v123, "isAsyncAdjustment"))
  {
    v136 = (void *)MEMORY[0x1E0D752F0];
    objc_msgSend(v8, "originalUniformTypeIdentifier");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "typeWithIdentifier:", v137);
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v128, "conformsToType:", *MEMORY[0x1E0CEC5B8]))
    {
      if (-[PHAssetChangeRequest isRevertingContentToOriginal](self, "isRevertingContentToOriginal"))
      {
        objc_msgSend(v8, "additionalAttributes");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "originalResourceChoice");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        v140 = objc_msgSend(v139, "integerValue");

        if (v140 == 3)
        {
          objc_msgSend(v8, "additionalAttributes");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "setOriginalResourceChoice:", &unk_1E36554C8);

        }
      }
    }
    if (self->_didSetVisibilityState || !objc_msgSend(v8, "isPhotoIris"))
      goto LABEL_138;
    if (-[PHAssetChangeRequest isRevertingContentToOriginal](self, "isRevertingContentToOriginal"))
    {
      v142 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "renderedVideoComplementContentURL");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "path");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = objc_msgSend(v143, "fileExistsAtPath:", v145);

      if ((v146 & 1) != 0)
      {
LABEL_138:
        objc_msgSend(v123, "assetAdjustmentsWithEditorBundleID:", self->_editorBundleID);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[PHAssetChangeRequest isRevertingContentToOriginal](self, "isRevertingContentToOriginal"))
          objc_msgSend(MEMORY[0x1E0D71578], "assetAdjustmentOptionsForRevertingToOriginal");
        else
          objc_msgSend(v123, "setAdjustmentsOptions");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAdjustments:options:", v135, v147);

        goto LABEL_142;
      }
      v142 = objc_msgSend(v8, "videoCpVisibilityState") & 0xFFF4 | 1;
    }
    objc_msgSend(v8, "setVideoCpVisibilityState:", v142);
    goto LABEL_138;
  }
  objc_msgSend(v123, "assetAdjustmentsWithEditorBundleID:", self->_editorBundleID);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoEditGetLog();
  v129 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v128, "debugDescription");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v130;
    _os_log_impl(&dword_1991EC000, v129, OS_LOG_TYPE_DEBUG, "Asset change request applying async adjustments:\n%@", buf, 0xCu);

  }
  objc_msgSend(v123, "setAdjustmentsOptions");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAdjustments:options:", v128, v131);

  objc_msgSend(v123, "playbackVariation");
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  if (v132)
  {
    objc_msgSend(v123, "playbackVariation");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlaybackVariation:", (unsigned __int16)objc_msgSend(v133, "integerValue"));

  }
  objc_msgSend(v123, "videoDuration");
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v134 || !objc_msgSend(v8, "isVideo"))
    goto LABEL_143;
  objc_msgSend(v123, "videoDuration");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "doubleValue");
  objc_msgSend(v8, "setDuration:");
LABEL_142:

LABEL_143:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&v488 = 0;
  objc_msgSend(v8, "uuid");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  PLStringUUIDComponents();

  kdebug_trace();
LABEL_144:

LABEL_145:
  -[PHAssetChangeRequest contentEditingOutput](self, "contentEditingOutput");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = objc_msgSend(v149, "isOnlyChangingOriginalChoice");

  -[PHAssetChangeRequest contentEditingOutput](self, "contentEditingOutput");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "originalResourceChoice");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = v152;
  if (!v150)
  {

    if (v153)
    {
      -[PHAssetChangeRequest contentEditingOutput](self, "contentEditingOutput");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "originalResourceChoice");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v164 = objc_msgSend(v163, "integerValue");

      objc_msgSend(v8, "additionalAttributes");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "originalResourceChoice");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = objc_msgSend(v166, "integerValue");

      if (v164 == v167)
        goto LABEL_205;
      PLPhotoEditGetLog();
      v168 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v168, OS_LOG_TYPE_DEBUG))
      {
        if (v164 > 3)
          v169 = 0;
        else
          v169 = off_1E35DA698[v164];
        v204 = v169;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v204;
        _os_log_impl(&dword_1991EC000, v168, OS_LOG_TYPE_DEBUG, "Applying content editing output also changing original resource choice to %@", buf, 0xCu);

      }
      v205 = (void *)MEMORY[0x1E0CB37E8];
      v206 = v164;
    }
    else
    {
      if (!self->_didSetOriginalResourceChoice)
        goto LABEL_205;
      originalResourceChoice = self->_originalResourceChoice;
      objc_msgSend(v426, "additionalAttributes");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "originalResourceChoice");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      v173 = objc_msgSend(v172, "integerValue");

      v174 = originalResourceChoice == v173;
      v8 = v426;
      if (v174)
        goto LABEL_205;
      PLPhotoEditGetLog();
      v175 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v175, OS_LOG_TYPE_DEBUG))
      {
        v176 = self->_originalResourceChoice;
        if (v176 > 3)
          v177 = 0;
        else
          v177 = off_1E35DA698[v176];
        v207 = v177;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v207;
        _os_log_impl(&dword_1991EC000, v175, OS_LOG_TYPE_DEBUG, "Setting original resource choice to %@", buf, 0xCu);

      }
      v205 = (void *)MEMORY[0x1E0CB37E8];
      v206 = self->_originalResourceChoice;
    }
    objc_msgSend(v205, "numberWithUnsignedInteger:", v206);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "additionalAttributes");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "setOriginalResourceChoice:", v202);
LABEL_204:

    goto LABEL_205;
  }
  v154 = objc_msgSend(v152, "integerValue");

  objc_msgSend(v8, "additionalAttributes");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "originalResourceChoice");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = objc_msgSend(v156, "integerValue");

  if (v154 != v157)
  {
    -[PHAssetChangeRequest contentEditingOutput](self, "contentEditingOutput");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "renderedPreviewContentURL");
    v159 = objc_claimAutoreleasedReturnValue();

    PLPhotoEditGetLog();
    v160 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
    {
      if (v154 > 3)
        v161 = 0;
      else
        v161 = off_1E35DA698[v154];
      v178 = v161;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v178;
      _os_log_impl(&dword_1991EC000, v160, OS_LOG_TYPE_DEBUG, "Setting original choice to %@ and mark asset for deferred rendering", buf, 0xCu);

    }
    v416 = (void *)v159;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v154);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "additionalAttributes");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "setOriginalResourceChoice:", v179);

    objc_msgSend(v8, "setDeferredProcessingNeeded:", 4);
    objc_msgSend(v8, "photoLibrary");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "libraryServicesManager");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "backgroundJobService");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photoLibrary");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "signalBackgroundProcessingNeededOnLibrary:", v184);

    objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unadjustedDerivativeImageURLs");
    v461 = 0u;
    v462 = 0u;
    v463 = 0u;
    v464 = 0u;
    v186 = (id)objc_claimAutoreleasedReturnValue();
    v187 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v461, v506, 16);
    if (v187)
    {
      v188 = v187;
      v189 = *(_QWORD *)v462;
      do
      {
        for (m = 0; m != v188; ++m)
        {
          if (*(_QWORD *)v462 != v189)
            objc_enumerationMutation(v186);
          v191 = *(void **)(*((_QWORD *)&v461 + 1) + 8 * m);
          v460 = 0;
          v192 = objc_msgSend(v185, "removeItemAtURL:error:", v191, &v460);
          v193 = v460;
          if (v192)
          {
            PLPhotoEditGetLog();
            v194 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v194, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v191, "path");
              v195 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v195;
              _os_log_impl(&dword_1991EC000, v194, OS_LOG_TYPE_DEBUG, "Changing original choice, removed unadjusted derivative file at path: %@", buf, 0xCu);

            }
          }
          else
          {
            if ((PLIsErrorFileNotFound() & 1) != 0)
              goto LABEL_174;
            PLPhotoEditGetLog();
            v194 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v194, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v193;
              _os_log_impl(&dword_1991EC000, v194, OS_LOG_TYPE_ERROR, "Error removing unadjusted derivative due to changing R+J original choice: %@", buf, 0xCu);
            }
          }

LABEL_174:
        }
        v188 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v461, v506, 16);
      }
      while (v188);
    }

    objc_msgSend(v8, "setEffectiveThumbnailIndex:", 0x7FFFFFFFFFFFFFFFLL);
    v458 = 0u;
    v459 = 0u;
    v456 = 0u;
    v457 = 0u;
    objc_msgSend(v8, "modernResources");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    v197 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v456, v505, 16);
    if (v197)
    {
      v198 = v197;
      v199 = *(_QWORD *)v457;
      do
      {
        for (n = 0; n != v198; ++n)
        {
          if (*(_QWORD *)v457 != v199)
            objc_enumerationMutation(v196);
          v201 = *(void **)(*((_QWORD *)&v456 + 1) + 8 * n);
          if ((objc_msgSend(v201, "cplType") == 5
             || objc_msgSend(v201, "cplType") == 4
             || objc_msgSend(v201, "cplType") == 3
             || objc_msgSend(v201, "cplType") == 2)
            && !objc_msgSend(v201, "version")
            || objc_msgSend(v201, "recipeID") == 65747)
          {
            objc_msgSend(v201, "markAsNotLocallyAvailable");
            if (objc_msgSend(v201, "cplType") == 2 || objc_msgSend(v201, "recipeID") == 65747)
              objc_msgSend(v201, "setLocalAvailabilityTarget:", 1);
          }
        }
        v198 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v456, v505, 16);
      }
      while (v198);
    }

    self = v419;
    v202 = v416;
    if (v416)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v416);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      if (v203)
        objc_msgSend(v8, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, 0, v203, 0);

    }
    goto LABEL_204;
  }
LABEL_205:
  if (self->_didRevertLocationToOriginal && PLPlatformExtendedAttributesSupported())
  {
    objc_msgSend(v8, "extendedAttributes");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    v209 = v208;
    if (v208)
    {
      objc_msgSend(v208, "latitude");
      v210 = objc_claimAutoreleasedReturnValue();
      if (v210)
      {
        v211 = (void *)v210;
        objc_msgSend(v209, "longitude");
        v212 = (void *)objc_claimAutoreleasedReturnValue();

        if (v212)
        {
          v213 = objc_alloc(MEMORY[0x1E0C9E3B8]);
          objc_msgSend(v209, "latitude");
          v214 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v214, "doubleValue");
          v216 = v215;
          objc_msgSend(v209, "longitude");
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v217, "doubleValue");
          v219 = (void *)objc_msgSend(v213, "initWithLatitude:longitude:", v216, v218);

          objc_msgSend(v8, "setLocation:", v219);
          objc_msgSend(v8, "didSetCustomLocation");

        }
      }
    }

  }
  if (self->_didUpdateExtendedAttributesUsingOriginalMediaMetadata
    && PLPlatformExtendedAttributesSupported())
  {
    v455 = v418;
    v424 = objc_msgSend(v8, "updateExtendedAttributesWithError:", &v455);
    v220 = v455;

    v418 = v220;
  }
  if (self->_didTrashAllSpatialOverCaptureResources)
    objc_msgSend(v8, "setTrashedStateOnSpatialOverCaptureResources:", 1);
  if (self->_didUntrashAllSpatialOverCaptureResources)
    objc_msgSend(v8, "setTrashedStateOnSpatialOverCaptureResources:", 0);
  if (self->_didExpungeAllSpatialOverCaptureResources)
    objc_msgSend(v8, "setTrashedStateOnSpatialOverCaptureResources:", 2);
  if (self->_didExpungeTrashedSpatialOverCaptureResources)
    objc_msgSend(v8, "expungeTrashedSpatialOverCaptureResources");
  if (self->_didPromoteToGuestAsset)
  {
    v454 = v418;
    v424 = objc_msgSend(v8, "promoteToGuestAsset:", &v454);
    v221 = v454;

  }
  else
  {
    v221 = v418;
  }
  if (self->_didResetGuestAssetPromotion)
  {
    v453 = v221;
    v222 = v221;
    v424 = objc_msgSend(v8, "resetGuestAssetPromotion:", &v453);
    v221 = v453;

  }
  v418 = v221;
  v223 = didSetSceneClassifications;
  if (self->_toRetryUpload)
  {
    objc_msgSend(v8, "photoLibrary");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    v225 = objc_msgSend(v224, "isCloudPhotoLibraryEnabled");

    if (v225)
    {
      objc_msgSend(v8, "master");
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      v227 = v226;
      if (v226)
      {
        v451 = 0u;
        v452 = 0u;
        v449 = 0u;
        v450 = 0u;
        objc_msgSend(v226, "assets");
        v228 = (void *)objc_claimAutoreleasedReturnValue();
        v229 = objc_msgSend(v228, "countByEnumeratingWithState:objects:count:", &v449, v504, 16);
        if (v229)
        {
          v230 = v229;
          v231 = *(_QWORD *)v450;
          do
          {
            for (ii = 0; ii != v230; ++ii)
            {
              if (*(_QWORD *)v450 != v231)
                objc_enumerationMutation(v228);
              v233 = *(void **)(*((_QWORD *)&v449 + 1) + 8 * ii);
              if (objc_msgSend(v233, "cloudLocalState"))
                objc_msgSend(v233, "setCloudLocalState:", 0);
            }
            v230 = objc_msgSend(v228, "countByEnumeratingWithState:objects:count:", &v449, v504, 16);
          }
          while (v230);
        }

        v8 = v426;
        v223 = didSetSceneClassifications;
        if (!objc_msgSend(v227, "cloudLocalState"))
          goto LABEL_245;
        v234 = v227;
      }
      else
      {
        if (!objc_msgSend(v8, "cloudLocalState"))
        {
LABEL_245:

          goto LABEL_246;
        }
        v234 = v8;
      }
      objc_msgSend(v234, "setCloudLocalState:", 0);
      goto LABEL_245;
    }
  }
LABEL_246:
  -[PHAssetChangeRequest modificationDate](self, "modificationDate");
  v235 = objc_claimAutoreleasedReturnValue();
  if (v235)
    objc_msgSend(v8, "setModificationDate:", v235);
  obja = (id)v235;
  if (self->_didModifyComputedAttributes)
  {
    objc_msgSend(v8, "computedAttributes");
    v236 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v236)
    {
      objc_msgSend(v8, "managedObjectContext");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D71670], "entityName");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      v448 = 0;
      PLSafeInsertNewObjectForEntityForNameInManagedObjectContext();
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      v240 = 0;

      if (!v239)
      {
        a5 = v406;
        if (v406)
          *v406 = objc_retainAutorelease(v240);

        v395 = 0;
        goto LABEL_472;
      }
      objc_msgSend(v8, "setComputedAttributes:", v239);

    }
    v446 = 0u;
    v447 = 0u;
    v444 = 0u;
    v445 = 0u;
    v241 = self->_computedAttributeMutations;
    v242 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v241, "countByEnumeratingWithState:objects:count:", &v444, v503, 16);
    if (v242)
    {
      v243 = v242;
      v244 = *(_QWORD *)v445;
      do
      {
        for (jj = 0; jj != v243; ++jj)
        {
          if (*(_QWORD *)v445 != v244)
            objc_enumerationMutation(v241);
          v246 = *(_QWORD *)(*((_QWORD *)&v444 + 1) + 8 * jj);
          objc_msgSend(v426, "computedAttributes");
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_computedAttributeMutations, "objectForKeyedSubscript:", v246);
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v247, "setValue:forKey:", v248, v246);

        }
        v243 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v241, "countByEnumeratingWithState:objects:count:", &v444, v503, 16);
      }
      while (v243);
    }

    v223 = 1;
  }
  if (self->_mediaAnalysisTimeStamp)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v249, "setMediaAnalysisTimeStamp:", self->_mediaAnalysisTimeStamp);

    v223 = 1;
  }
  didSetMediaAnalysisVersion = self->_didSetMediaAnalysisVersion;
  if (self->_didSetMediaAnalysisVersion)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v251, "setMediaAnalysisVersion:", self->_mediaAnalysisVersion);

    v223 = 1;
  }
  if (self->_didSetMediaAnalysisImageVersion)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v252, "setMediaAnalysisImageVersion:", self->_mediaAnalysisImageVersion);

    didSetMediaAnalysisVersion = 1;
    v223 = 1;
  }
  if ((self->_bestVideoTimeRange.start.flags & 1) != 0
    && (self->_bestVideoTimeRange.duration.flags & 1) != 0
    && !self->_bestVideoTimeRange.duration.epoch
    && (self->_bestVideoTimeRange.duration.value & 0x8000000000000000) == 0)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    v254 = *(_OWORD *)&self->_bestVideoTimeRange.start.epoch;
    *(_OWORD *)buf = *(_OWORD *)&self->_bestVideoTimeRange.start.value;
    *(_OWORD *)&buf[16] = v254;
    v502 = *(_OWORD *)&self->_bestVideoTimeRange.duration.timescale;
    objc_msgSend(v253, "setBestVideoTimeRange:", buf);

  }
  if ((self->_animatedStickerTimeRange.start.flags & 1) != 0
    && (self->_animatedStickerTimeRange.duration.flags & 1) != 0
    && !self->_animatedStickerTimeRange.duration.epoch
    && (self->_animatedStickerTimeRange.duration.value & 0x8000000000000000) == 0)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    v256 = *(_OWORD *)&self->_animatedStickerTimeRange.start.epoch;
    *(_OWORD *)buf = *(_OWORD *)&self->_animatedStickerTimeRange.start.value;
    *(_OWORD *)&buf[16] = v256;
    v502 = *(_OWORD *)&self->_animatedStickerTimeRange.duration.timescale;
    objc_msgSend(v255, "setAnimatedStickerTimeRange:", buf);

  }
  p_bestKeyFrameTime = &self->_bestKeyFrameTime;
  if ((self->_bestKeyFrameTime.flags & 1) != 0)
  {
    PLPhotoKitGetLog();
    v258 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v258, OS_LOG_TYPE_DEBUG))
    {
      *(_OWORD *)buf = *(_OWORD *)&p_bestKeyFrameTime->value;
      *(_QWORD *)&buf[16] = self->_bestKeyFrameTime.epoch;
      v259 = (id)CMTimeCopyDescription(0, (CMTime *)buf);
      v260 = -[NSData length](self->_bestKeyFrameJPEGData, "length");
      objc_msgSend(v426, "uuid");
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v259;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v260;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v261;
      _os_log_impl(&dword_1991EC000, v258, OS_LOG_TYPE_DEBUG, "Setting best key frame time: %@ key frame image length: %lu for asset: %@", buf, 0x20u);

    }
    *(_OWORD *)buf = *(_OWORD *)&p_bestKeyFrameTime->value;
    *(_QWORD *)&buf[16] = self->_bestKeyFrameTime.epoch;
    objc_msgSend(v426, "setVideoKeyFrameTime:", buf);
  }
  if (self->_didUnsetBestKeyFrameTime)
  {
    *(_OWORD *)buf = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    objc_msgSend(v426, "setVideoKeyFrameTime:", buf);
  }
  if (self->_bestKeyFrameJPEGData)
  {
    if (objc_msgSend(v426, "isLocalVideoKeyFrameValid"))
    {
      v262 = CGImageSourceCreateWithData((CFDataRef)self->_bestKeyFrameJPEGData, 0);
      if (!v262)
        goto LABEL_292;
      v263 = v262;
      PLPhotoKitGetLog();
      v264 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v264, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v426, "uuid");
        v265 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v265;
        _os_log_impl(&dword_1991EC000, v264, OS_LOG_TYPE_DEBUG, "Regenerating thumbs for new best key frame for asset: %@", buf, 0xCu);

      }
      v442 = 0;
      v443 = 0;
      objc_msgSend(MEMORY[0x1E0D71880], "createThumbnailImage:previewImage:withToBeReleasedImageSource:", &v443, &v442, v263);
      v266 = v443;
      v267 = v442;
      objc_msgSend(v426, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", v267, v266, 0, 0, 0);
    }
    else
    {
      PLThumbnailsGetLog();
      v266 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v266, OS_LOG_TYPE_DEBUG))
      {
LABEL_291:

        goto LABEL_292;
      }
      objc_msgSend(v426, "uuid");
      v267 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v267;
      _os_log_impl(&dword_1991EC000, v266, OS_LOG_TYPE_DEBUG, "Video key frame incompatible with asset: %{public}@, skipping thumbnail update", buf, 0xCu);
    }

    goto LABEL_291;
  }
LABEL_292:
  if (self->_computeSyncMediaAnalysisPayload)
  {
    v268 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v426, "pathForComputeSyncMediaAnalysisPayloadFile");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v268, "fileURLWithPath:", v269);
    v270 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v270, "URLByDeletingLastPathComponent");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    v441 = 0;
    v273 = objc_msgSend(v271, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v272, 1, 0, &v441);
    v274 = v441;

    if ((v273 & 1) == 0)
    {
      PLPhotoKitGetLog();
      v275 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v275, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v426, "uuid");
        v276 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v276;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v274;
        _os_log_impl(&dword_1991EC000, v275, OS_LOG_TYPE_ERROR, "Failed to create pathForMediaAnalysisComputeSyncSidecarPayload for asset %@ error: %@", buf, 0x16u);

      }
    }
    -[NSData writeToURL:atomically:](self->_computeSyncMediaAnalysisPayload, "writeToURL:atomically:", v270, 1);

  }
  if (self->_didSetPackedPreferredCropRect)
    objc_msgSend(v426, "setPackedPreferredCropRect:", self->_packedPreferredCropRect);
  v277 = v223;
  if (self->_didSetPackedAcceptableCropRect)
    objc_msgSend(v426, "setPackedAcceptableCropRect:", self->_packedAcceptableCropRect);
  if (self->_didSetPackedBestPlaybackRect)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v278, "setPackedBestPlaybackRect:", self->_packedBestPlaybackRect);

  }
  if (self->_didSetWallpaperPropertiesVersion)
  {
    -[PHAssetChangeRequest getPhotoAnalysisAttributesForAsset:](self, "getPhotoAnalysisAttributesForAsset:", v426);
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v279, "setWallpaperPropertiesVersion:", self->_wallpaperPropertiesVersion);

    v277 = 1;
  }
  if (self->_didSetWallpaperPropertiesTimestamp)
  {
    -[PHAssetChangeRequest getPhotoAnalysisAttributesForAsset:](self, "getPhotoAnalysisAttributesForAsset:", v426);
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v280, "setWallpaperPropertiesTimestamp:", self->_wallpaperPropertiesTimestamp);

  }
  if (self->_didSetWallpaperPropertiesData)
  {
    -[PHAssetChangeRequest getPhotoAnalysisAttributesForAsset:](self, "getPhotoAnalysisAttributesForAsset:", v426);
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v281, "setWallpaperPropertiesData:", self->_wallpaperPropertiesData);

  }
  if (self->_didSetBlurrinessScore)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v283 = self->_blurrinessScore;
    objc_msgSend(v282, "setBlurrinessScore:", v283);

  }
  if (self->_didSetExposureScore)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v285 = self->_exposureScore;
    objc_msgSend(v284, "setExposureScore:", v285);

  }
  if (self->_didSetWallpaperScore)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v287 = self->_wallpaperScore;
    objc_msgSend(v286, "setWallpaperScore:", v287);

  }
  if (self->_didSetAutoplaySuggestionScore)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v289 = self->_autoplaySuggestionScore;
    objc_msgSend(v288, "setAutoplaySuggestionScore:", v289);

  }
  if (self->_didSetVideoStickerSuggestionScore)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v291 = self->_videoStickerSuggestionScore;
    objc_msgSend(v290, "setVideoStickerSuggestionScore:", v291);

  }
  if (self->_didSetVideoScore)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v292 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v293 = self->_videoScore;
    objc_msgSend(v292, "setVideoScore:", v293);

  }
  if (self->_didSetActivityScore)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v295 = self->_activityScore;
    objc_msgSend(v294, "setActivityScore:", v295);

  }
  if (self->_didSetAudioScore)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v297 = self->_audioScore;
    objc_msgSend(v296, "setAudioScore:", v297);

  }
  if (self->_didSetSettlingEffectScore)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v299 = self->_settlingEffectScore;
    objc_msgSend(v298, "setSettlingEffectScore:", v299);

  }
  if (self->_didSetFaceCount)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v300 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v300, "setFaceCount:", self->_faceCount);

  }
  if (self->_didSetAudioClassification)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v301 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v301, "setAudioClassification:", self->_audioClassification);

    v277 = 1;
  }
  if (self->_didSetProbableRotationDirection)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v302, "setProbableRotationDirection:", self->_probableRotationDirection);

  }
  if (self->_didSetProbableRotationDirectionConfidence)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v304 = self->_probableRotationDirectionConfidence;
    objc_msgSend(v303, "setProbableRotationDirectionConfidence:", v304);

  }
  if (self->_colorNormalizationData)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v305, "setColorNormalizationData:", self->_colorNormalizationData);

  }
  if (self->_resetCharacterRecognitionProperties)
  {
    v306 = v426;
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v307, "resetCharacterRecognitionAttributes");
  }
  else
  {
    v306 = v426;
    if (!self->_didSetCharacterRecognitionData)
      goto LABEL_343;
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v307, "setCharacterRecognitionData:machineReadableCodeData:algorithmVersion:adjustmentVersion:", self->_characterRecognitionData, self->_machineReadableCodeData, SLOWORD(self->_characterRecognitionAlgorithmVersion), self->_characterRecognitionAdjustmentVersion);
    v277 = 1;
  }

LABEL_343:
  if (self->_resetGeneratedAssetDescriptionProperties)
  {
    objc_msgSend(MEMORY[0x1E0D71770], "resetGeneratedAssetDescriptionsForAsset:", v306);
  }
  else if (self->_didSetGeneratedAssetDescriptionProperties)
  {
    objc_msgSend(MEMORY[0x1E0D71770], "setGeneratedAssetDescriptionForAsset:fromDictionaries:", v306, self->_generatedAssetDescriptionDictionaries);
    v277 = 1;
  }
  if (self->_resetVisualSearchProperties)
  {
    PLResetMediaProcessingStateOnAsset();
  }
  else if (self->_didSetVisualSearchProperties)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v306);
    v308 = (void *)objc_claimAutoreleasedReturnValue();
    v310 = v308;
    if (self->_didSetStickerConfidenceScore)
    {
      *(float *)&v309 = self->_stickerConfidenceScore;
      objc_msgSend(v308, "setStickerConfidenceScore:stickerAlgorithmVersion:", SLOWORD(self->_stickerConfidenceScoreAlgorithmVersion), v309);
    }
    if (self->_didSetVisualSearchData)
      objc_msgSend(v310, "setVisualSearchData:algorithmVersion:adjustmentVersion:", self->_visualSearchData, SLOWORD(self->_visualSearchAlgorithmVersion), self->_visualSearchAdjustmentVersion);

    v277 = 1;
  }
  v311 = v306;
  resetWallpaperProperties = self->_resetWallpaperProperties;
  -[PHAssetChangeRequest getPhotoAnalysisAttributesForAsset:](self, "getPhotoAnalysisAttributesForAsset:", v311);
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  v314 = v313;
  if (resetWallpaperProperties)
  {
    objc_msgSend(v313, "setWallpaperPropertiesTimestamp:", 0);
    objc_msgSend(v314, "setWallpaperPropertiesData:", 0);
    wallpaperPropertiesVersion = 0;
    v316 = v426;
    a5 = v406;
LABEL_363:
    objc_msgSend(v314, "setWallpaperPropertiesVersion:", wallpaperPropertiesVersion);
    goto LABEL_364;
  }
  if (self->_didSetWallpaperPropertiesTimestamp)
    objc_msgSend(v313, "setWallpaperPropertiesTimestamp:", self->_wallpaperPropertiesTimestamp);
  v316 = v426;
  a5 = v406;
  if (self->_didSetWallpaperPropertiesData)
    objc_msgSend(v314, "setWallpaperPropertiesData:", self->_wallpaperPropertiesData);
  if (self->_didSetWallpaperPropertiesVersion)
  {
    wallpaperPropertiesVersion = self->_wallpaperPropertiesVersion;
    v277 = 1;
    goto LABEL_363;
  }
LABEL_364:

  if (self->_didSetSyndicationProcessingValue)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v316);
    v317 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v317, "setSyndicationProcessingValue:", self->_syndicationProcessingValue);

  }
  if (self->_didSetSyndicationProcessingVersion)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v316);
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v318, "setSyndicationProcessingVersion:", self->_syndicationProcessingVersion);

  }
  if (self->_didSetSyndicationIdentifier)
  {
    syndicationIdentifier = self->_syndicationIdentifier;
    objc_msgSend(v316, "additionalAttributes");
    v320 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v320, "setSyndicationIdentifier:", syndicationIdentifier);

  }
  if (self->_didSetFaceAnalysisVersion)
  {
    faceAnalysisVersion = self->_faceAnalysisVersion;
    objc_msgSend(v316, "additionalAttributes");
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v322, "setFaceAnalysisVersion:", faceAnalysisVersion);

    v277 = 1;
  }
  if (self->_didSetLocalAnalysisStage)
  {
    v323 = v277;
    localAnalysisStage = self->_localAnalysisStage;
    objc_msgSend(v316, "computeSyncAttributes");
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    v326 = objc_msgSend(v325, "localAnalysisStage");

    if (localAnalysisStage <= v326)
    {
      PLBackendGetLog();
      v327 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v327, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v426, "computeSyncAttributes");
        v328 = (void *)objc_claimAutoreleasedReturnValue();
        v329 = objc_msgSend(v328, "localAnalysisStage");
        v330 = self->_localAnalysisStage;
        -[PHChangeRequest clientBundleID](self, "clientBundleID");
        v331 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = v329;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v330;
        *(_WORD *)&buf[14] = 2114;
        *(_QWORD *)&buf[16] = v331;
        _os_log_impl(&dword_1991EC000, v327, OS_LOG_TYPE_ERROR, "[CCSS] Quietly dropping attempt to downgrade analysis stage from %d to %d by client: %{public}@", buf, 0x18u);

        a5 = v406;
      }

      v316 = v426;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D71668], "updateLocalComputeSyncStageAfterProcessingForAsset:stage:", v316, self->_localAnalysisStage);
    }
    v277 = v323;
  }
  if (self->_didSetViewPresentation)
  {
    viewPresentation = self->_viewPresentation;
    objc_msgSend(v316, "additionalAttributes");
    v333 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v333, "setViewPresentation:", viewPresentation);

  }
  if (self->_didSetSceneprintData)
  {
    objc_msgSend(v316, "additionalAttributes");
    v334 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v334, "setSceneprintWithData:", self->_sceneprintData);

  }
  if (self->_didSetDuplicateMatchingData)
  {
    objc_msgSend(v316, "additionalAttributes");
    v335 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v335, "setDuplicateMatchingData:duplicateMatchingAlternateData:processingSucceeded:", self->_duplicateMatchingData, self->_duplicateMatchingAlternateData, self->_duplicateProcessingSucceeded);

    v277 = 1;
  }
  if (self->_didSetReverseLocationData)
  {
    objc_msgSend(v316, "additionalAttributes");
    v336 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v336, "setReverseLocationData:", self->_reverseLocationData);

  }
  if (self->_didSetReverseLocationDataIsValid)
  {
    objc_msgSend(v316, "additionalAttributes");
    v337 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_reverseLocationDataIsValid);
    v338 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v337, "setReverseLocationDataIsValid:", v338);

  }
  if (self->_didSetShiftedLocation)
  {
    objc_msgSend(v316, "additionalAttributes");
    v339 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v339, "setShiftedLocation:", self->_shiftedLocation);

    objc_msgSend(v316, "additionalAttributes");
    v340 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v340, "setShiftedLocationIsValid:", 1);

  }
  if (self->_didSetObjectSaliencyRectsData)
  {
    objc_msgSend(v316, "additionalAttributes");
    v341 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v341, "setObjectSaliencyRectsData:", self->_objectSaliencyRectsData);

  }
  if (self->_alternateImportImageDate)
  {
    objc_msgSend(v426, "additionalAttributes");
    v342 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v342, "setAlternateImportImageDate:", self->_alternateImportImageDate);

  }
  if (self->_didSetSavedAssetType)
    objc_msgSend(v426, "setSavedAssetType:", self->_savedAssetType);
  if (v277)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v343 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v426, "setAnalysisStateModificationDate:", v343);

  }
  if (didSetMediaAnalysisVersion)
  {
    objc_msgSend(v426, "photoLibrary");
    v344 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v344, "signalBackgroundProcessingNeeded");

  }
  if (self->_didSetKeywordTitles)
  {
    objc_msgSend(v425, "keywordManager");
    v345 = (void *)objc_claimAutoreleasedReturnValue();
    v424 = objc_msgSend(v345, "setKeywords:forAsset:", self->_keywordTitles, v426);
    if ((v424 & 1) == 0)
    {
      v346 = (void *)MEMORY[0x1E0CB35C8];
      v499 = *MEMORY[0x1E0CB2D50];
      v500 = CFSTR("Setting keywords failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v500, &v499, 1);
      v347 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v346, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v347);
      v348 = objc_claimAutoreleasedReturnValue();

      v418 = (id)v348;
    }

  }
  if (self->_didSetScreenTimeDeviceImageSensitivity)
  {
    -[PHAssetChangeRequest getMediaAnalysisAttributesForAsset:](self, "getMediaAnalysisAttributesForAsset:", v426);
    v349 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v349, "setScreenTimeDeviceImageSensitivity:", (unsigned __int16)self->_screenTimeDeviceImageSensitivity);

  }
  pathsToNewAssetResourcesByAssetResourceType = self->_pathsToNewAssetResourcesByAssetResourceType;
  if (pathsToNewAssetResourcesByAssetResourceType)
  {
    v439 = 0u;
    v440 = 0u;
    v438 = 0u;
    v437 = 0u;
    -[NSDictionary allKeys](pathsToNewAssetResourcesByAssetResourceType, "allKeys");
    v421 = (void *)objc_claimAutoreleasedReturnValue();
    v351 = objc_msgSend(v421, "countByEnumeratingWithState:objects:count:", &v437, v498, 16);
    if (!v351)
      goto LABEL_430;
    v352 = v351;
    v353 = *(_QWORD *)v438;
    v417 = *MEMORY[0x1E0CB2938];
    while (1)
    {
      for (kk = 0; kk != v352; ++kk)
      {
        if (*(_QWORD *)v438 != v353)
          objc_enumerationMutation(v421);
        v355 = *(void **)(*((_QWORD *)&v437 + 1) + 8 * kk);
        v356 = objc_msgSend(v355, "integerValue");
        if (v356 == 20 || v356 == 114 || v356 == 109)
        {
          -[NSDictionary objectForKeyedSubscript:](v419->_pathsToNewAssetResourcesByAssetResourceType, "objectForKeyedSubscript:", v355);
          v357 = (void *)objc_claimAutoreleasedReturnValue();
          v358 = objc_msgSend(v355, "integerValue");
          switch(v358)
          {
            case 20:
              v435 = 0;
              v359 = objc_msgSend(v426, "installExistingAlchemistImageAtPath:error:", v357, &v435);
              v360 = v435;
              break;
            case 114:
              v434 = 0;
              v359 = objc_msgSend(v426, "installExistingGenerativePlaygroundFaceResourcesFileAtPath:error:", v357, &v434);
              v360 = v434;
              break;
            case 109:
              v436 = 0;
              v359 = objc_msgSend(v426, "installExistingWallpaperComputeResourcesFileAtPath:error:", v357, &v436);
              v360 = v436;
              break;
            default:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("adding asset resource type %@ is allowed but not currently suppported"), v355);
              v362 = (void *)objc_claimAutoreleasedReturnValue();
              v367 = (void *)MEMORY[0x1E0CB35C8];
              v496 = v417;
              v497 = v362;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v497, &v496, 1);
              v366 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v367, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3111, v366);
              v365 = objc_claimAutoreleasedReturnValue();

              goto LABEL_427;
          }
          v364 = v360;
          v362 = v364;
          if ((v359 & 1) != 0)
            goto LABEL_428;
          v363 = v364;
          v362 = v363;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("adding asset resource of type %@ is not allowed"), v355);
          v357 = (void *)objc_claimAutoreleasedReturnValue();
          v361 = (void *)MEMORY[0x1E0CB35C8];
          v494 = v417;
          v495 = v357;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v495, &v494, 1);
          v362 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v361, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3111, v362);
          v363 = (id)objc_claimAutoreleasedReturnValue();
        }
        v365 = (uint64_t)v363;
        v366 = v418;
LABEL_427:

        v424 = 0;
        v418 = (id)v365;
LABEL_428:

      }
      v352 = objc_msgSend(v421, "countByEnumeratingWithState:objects:count:", &v437, v498, 16);
      if (!v352)
      {
LABEL_430:

        a5 = v406;
        self = v419;
        break;
      }
    }
  }
  assetResourceTypesToDelete = self->_assetResourceTypesToDelete;
  if (assetResourceTypesToDelete)
  {
    v432 = 0u;
    v433 = 0u;
    v430 = 0u;
    v431 = 0u;
    v369 = assetResourceTypesToDelete;
    v370 = -[NSSet countByEnumeratingWithState:objects:count:](v369, "countByEnumeratingWithState:objects:count:", &v430, v493, 16);
    if (v370)
    {
      v371 = v370;
      v372 = *(_QWORD *)v431;
      v422 = *MEMORY[0x1E0CB2938];
      do
      {
        for (mm = 0; mm != v371; ++mm)
        {
          if (*(_QWORD *)v431 != v372)
            objc_enumerationMutation(v369);
          v374 = *(void **)(*((_QWORD *)&v430 + 1) + 8 * mm);
          v375 = objc_msgSend(v374, "integerValue");
          v376 = v375;
          if (v375 == 20 || v375 == 114 || v375 == 109)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v377 = (void *)objc_claimAutoreleasedReturnValue();
            PathForDeletableAssetResourceType(v426, v376);
            v378 = (void *)objc_claimAutoreleasedReturnValue();
            v429 = 0;
            v379 = objc_msgSend(v377, "removeItemAtPath:error:", v378, &v429);
            v380 = v429;

            if ((v379 & 1) != 0 || (PLIsErrorFileNotFound() & 1) != 0)
            {
              if ((v424 & 1) != 0)
              {
                switch(v376)
                {
                  case 20:
                    v381 = 66137;
                    break;
                  case 114:
                    v381 = 327693;
                    break;
                  case 109:
                    v381 = 327687;
                    break;
                  default:
                    v381 = 0;
                    break;
                }
                objc_msgSend(v426, "deleteResourcesWithRecipeID:andVersion:", v381, 3);
              }
            }
            else
            {
              v380 = v380;

              v424 = 0;
              v418 = v380;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deleting asset resource of type %@ is not allowed"), v374);
            v380 = (id)objc_claimAutoreleasedReturnValue();
            v382 = (void *)MEMORY[0x1E0CB35C8];
            v491 = v422;
            v492 = v380;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v492, &v491, 1);
            v383 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v382, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3111, v383);
            v384 = objc_claimAutoreleasedReturnValue();

            v424 = 0;
            v418 = (id)v384;
          }

        }
        v371 = -[NSSet countByEnumeratingWithState:objects:count:](v369, "countByEnumeratingWithState:objects:count:", &v430, v493, 16);
      }
      while (v371);
    }

    v385 = v418;
    self = v419;
    a5 = v406;
  }
  else
  {
    v385 = v418;
  }
  if ((v424 & 1) != 0)
  {
    -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_commentsHelper, "mutableObjectIDsAndUUIDs");
    v386 = (void *)objc_claimAutoreleasedReturnValue();

    if (v386)
    {
      v428 = v385;
      v387 = -[PHAssetChangeRequest applyMutationsToAssetRelationshipWithKey:asset:error:](self, "applyMutationsToAssetRelationshipWithKey:asset:error:", CFSTR("cloudComments"), v426, &v428);
      v418 = v428;

      if (!v387)
      {
        v424 = 0;
        goto LABEL_466;
      }
      v424 = 1;
    }
    else
    {
      v418 = v385;
    }
    -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_likesHelper, "mutableObjectIDsAndUUIDs");
    v388 = (void *)objc_claimAutoreleasedReturnValue();

    if (v388)
    {
      v427 = v418;
      v424 = -[PHAssetChangeRequest applyMutationsToAssetRelationshipWithKey:asset:error:](self, "applyMutationsToAssetRelationshipWithKey:asset:error:", CFSTR("likeComments"), v426, &v427);
      v389 = v427;

      v418 = v389;
    }
    goto LABEL_466;
  }
  v418 = v385;
LABEL_466:
  if (self->_libraryScopeOriginatorUUIDs)
  {
    objc_msgSend(v426, "libraryScope");
    v390 = (void *)objc_claimAutoreleasedReturnValue();
    if (v390)
    {
      v391 = (void *)MEMORY[0x1E0D71B08];
      -[NSSet allObjects](self->_libraryScopeOriginatorUUIDs, "allObjects");
      v392 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v391, "participantsWithUUIDs:inPhotoLibrary:", v392, v425);
      v393 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v393);
      v394 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v426, "setLibraryScope:withContributors:", v390, v394);

    }
  }
  if (!self->_didSetPtpTrashedState)
  {
    v395 = 1;
    v397 = v411;
    v396 = v412;
    goto LABEL_474;
  }
  objc_msgSend(v426, "additionalAttributes");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v237, "setPtpTrashedState:", self->_ptpTrashedState);
  v395 = 1;
LABEL_472:
  v397 = v411;
  v396 = v412;

LABEL_474:
  if (!v395)
  {
    v30 = 0;
    v8 = v426;
    v398 = v418;
    goto LABEL_480;
  }
  v30 = v424 & 1;
  v8 = v426;
LABEL_476:
  v398 = v418;
  if (a5 && !v30)
  {
    v398 = objc_retainAutorelease(v418);
    v30 = 0;
    *a5 = v398;
  }
LABEL_480:

  return v30;
}

- (BOOL)isHiding
{
  void *v2;
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mutations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("hidden"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "BOOLValue");
  return (char)v2;
}

- (BOOL)isRevertingContentToOriginal
{
  void *v3;
  BOOL v4;

  if (!-[PHAssetChangeRequest didChangeAdjustments](self, "didChangeAdjustments"))
    return 0;
  -[PHAssetChangeRequest contentEditingOutput](self, "contentEditingOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)markDidChangeAdjustments
{
  self->_didChangeAdjustments = 1;
}

- (BOOL)applyMutationsToAssetRelationshipWithKey:(id)a3 asset:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  id v36;
  void *v37;
  BOOL v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  id v50;
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("cloudComments")) & 1) != 0)
  {
    v10 = &OBJC_IVAR___PHAssetChangeRequest__commentsHelper;
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("likeComments")))
    {
      v12 = 0;
LABEL_23:
      v33 = 0;
      v34 = 0;
      if (!a5)
        goto LABEL_26;
      goto LABEL_24;
    }
    v10 = &OBJC_IVAR___PHAssetChangeRequest__likesHelper;
  }
  v11 = *(id *)((char *)&self->super.super.isa + *v10);
  v12 = v11;
  if (!v11)
    goto LABEL_23;
  objc_msgSend(v11, "setAllowsInsert:", 1);
  objc_msgSend(v12, "setAllowsRemove:", 1);
  objc_msgSend(MEMORY[0x1E0D71638], "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDestinationEntityName:", v13);

  objc_msgSend(v12, "setDestinationUUIDKeyPath:", CFSTR("cloudGUID"));
  v14 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v15 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v40 = v8;
  objc_msgSend(v9, "mutableSetValueForKey:", v8);
  v50 = v15;
  v51 = v14;
  v49 = 0;
  v39 = v12;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v12, "applyMutationsToManagedObject:unorderedMutableChildren:inserts:deletes:error:", v9);
  v17 = v51;

  v18 = v50;
  v36 = v49;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v46 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v9, "addComment:", v24, v36);
        objc_msgSend(MEMORY[0x1E0D719E0], "publishCloudSharedCommentToServer:", v24);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v21);
  }
  v38 = v16;

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v25 = v18;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        v31 = (void *)MEMORY[0x1E0D719E0];
        objc_msgSend(v30, "cloudGUID", v36);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "deleteCommentWithGUIDFromServer:", v32);

        objc_msgSend(v9, "deleteAssetComment:", v30);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    }
    while (v27);
  }

  v8 = v40;
  v12 = v39;
  v33 = v38;
  v34 = v36;
  if (a5)
  {
LABEL_24:
    if (!v33)
      *a5 = objc_retainAutorelease(v34);
  }
LABEL_26:

  return v33;
}

- (unsigned)photoIrisVisibilityState
{
  return self->_photoIrisVisibilityState;
}

- (unint64_t)originalResourceChoice
{
  return self->_originalResourceChoice;
}

- (PHContentEditingOutput)contentEditingOutput
{
  return self->_contentEditingOutput;
}

- (BOOL)didChangeAdjustments
{
  return self->_didChangeAdjustments;
}

- (NSString)editorBundleID
{
  return self->_editorBundleID;
}

- (NSIndexSet)supportedEditOperations
{
  return self->_supportedEditOperations;
}

- (void)setSupportedEditOperations:(id)a3
{
  objc_storeStrong((id *)&self->_supportedEditOperations, a3);
}

- (NSURL)videoURLForUpdate
{
  return self->_videoURLForUpdate;
}

- (void)setVideoURLForUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_videoURLForUpdate, a3);
}

- (NSString)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (void)setPairingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pairingIdentifier, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 808);
  return self;
}

- (void)setVideoDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_videoDuration.value = *(_OWORD *)&a3->var0;
  self->_videoDuration.epoch = var3;
}

- (PHRelationshipChangeRequestHelper)facesHelper
{
  return self->_facesHelper;
}

- (PHRelationshipChangeRequestHelper)temporalFacesHelper
{
  return self->_temporalFacesHelper;
}

- (BOOL)duplicateAllowsPrivateMetadata
{
  return self->_duplicateAllowsPrivateMetadata;
}

- (NSDate)alternateImportImageDate
{
  return self->_alternateImportImageDate;
}

- (signed)faceAnalysisVersion
{
  return self->_faceAnalysisVersion;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)imageDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 832);
  return self;
}

- (void)setImageDisplayTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_imageDisplayTime.value = *(_OWORD *)&a3->var0;
  self->_imageDisplayTime.epoch = var3;
}

- (float)testScore
{
  return self->_testScore;
}

- (void)setTestScore:(float)a3
{
  self->_testScore = a3;
}

- (double)gpsHorizontalAccuracy
{
  return self->_gpsHorizontalAccuracy;
}

- (NSArray)objectSaliencyRects
{
  return self->_objectSaliencyRects;
}

- (unint64_t)wallpaperPropertiesVersion
{
  return self->_wallpaperPropertiesVersion;
}

- (NSDate)wallpaperPropertiesTimestamp
{
  return self->_wallpaperPropertiesTimestamp;
}

- (NSData)wallpaperPropertiesData
{
  return self->_wallpaperPropertiesData;
}

- (NSDate)mediaAnalysisTimeStamp
{
  return self->_mediaAnalysisTimeStamp;
}

- (unint64_t)mediaAnalysisVersion
{
  return self->_mediaAnalysisVersion;
}

- (signed)mediaAnalysisImageVersion
{
  return self->_mediaAnalysisImageVersion;
}

- ($C628252E21E0084D991546AFB91829E6)bestVideoTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[18].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[17].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[18].var1.var0;
  return self;
}

- ($C628252E21E0084D991546AFB91829E6)animatedStickerTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[19].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[18].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[19].var1.var0;
  return self;
}

- (float)blurrinessScore
{
  return self->_blurrinessScore;
}

- (float)exposureScore
{
  return self->_exposureScore;
}

- (float)wallpaperScore
{
  return self->_wallpaperScore;
}

- (float)autoplaySuggestionScore
{
  return self->_autoplaySuggestionScore;
}

- (float)videoStickerSuggestionScore
{
  return self->_videoStickerSuggestionScore;
}

- (float)videoScore
{
  return self->_videoScore;
}

- (float)activityScore
{
  return self->_activityScore;
}

- (float)audioScore
{
  return self->_audioScore;
}

- (float)settlingEffectScore
{
  return self->_settlingEffectScore;
}

- (unint64_t)faceCount
{
  return self->_faceCount;
}

- (signed)audioClassification
{
  return self->_audioClassification;
}

- (signed)probableRotationDirection
{
  return self->_probableRotationDirection;
}

- (float)probableRotationDirectionConfidence
{
  return self->_probableRotationDirectionConfidence;
}

- (NSData)colorNormalizationData
{
  return self->_colorNormalizationData;
}

- (NSData)reverseLocationData
{
  return self->_reverseLocationData;
}

- (BOOL)reverseLocationDataIsValid
{
  return self->_reverseLocationDataIsValid;
}

- (CLLocation)shiftedLocation
{
  return self->_shiftedLocation;
}

- (signed)screenTimeDeviceImageSensitivity
{
  return self->_screenTimeDeviceImageSensitivity;
}

- (signed)localAnalysisStage
{
  return self->_localAnalysisStage;
}

- (NSData)computeSyncMediaAnalysisPayload
{
  return self->_computeSyncMediaAnalysisPayload;
}

- (signed)viewPresentation
{
  return self->_viewPresentation;
}

- (NSSet)keywordTitles
{
  return self->_keywordTitles;
}

- (NSData)sceneprintData
{
  return self->_sceneprintData;
}

- (unsigned)syndicationProcessingValue
{
  return self->_syndicationProcessingValue;
}

- (unint64_t)syndicationProcessingVersion
{
  return self->_syndicationProcessingVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneprintData, 0);
  objc_storeStrong((id *)&self->_shiftedLocation, 0);
  objc_storeStrong((id *)&self->_reverseLocationData, 0);
  objc_storeStrong((id *)&self->_colorNormalizationData, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisTimeStamp, 0);
  objc_storeStrong((id *)&self->_wallpaperPropertiesData, 0);
  objc_storeStrong((id *)&self->_wallpaperPropertiesTimestamp, 0);
  objc_storeStrong((id *)&self->_objectSaliencyRects, 0);
  objc_storeStrong((id *)&self->_alternateImportImageDate, 0);
  objc_storeStrong((id *)&self->_temporalFacesHelper, 0);
  objc_storeStrong((id *)&self->_facesHelper, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
  objc_storeStrong((id *)&self->_videoURLForUpdate, 0);
  objc_storeStrong((id *)&self->_supportedEditOperations, 0);
  objc_storeStrong((id *)&self->_editorBundleID, 0);
  objc_storeStrong((id *)&self->_contentEditingOutput, 0);
  objc_storeStrong((id *)&self->_generatedAssetDescriptionDictionaries, 0);
  objc_storeStrong((id *)&self->_generatedAssetDescriptionTimestamp, 0);
  objc_storeStrong((id *)&self->_generatedAssetDescription, 0);
  objc_storeStrong((id *)&self->_libraryScopeOriginatorUUIDs, 0);
  objc_storeStrong((id *)&self->_likesHelper, 0);
  objc_storeStrong((id *)&self->_commentsHelper, 0);
  objc_storeStrong((id *)&self->_assetResourceTypesToDelete, 0);
  objc_storeStrong((id *)&self->_pathsToNewAssetResourcesByAssetResourceType, 0);
  objc_storeStrong((id *)&self->_duplicateMatchingAlternateData, 0);
  objc_storeStrong((id *)&self->_duplicateMatchingData, 0);
  objc_storeStrong((id *)&self->_syndicationIdentifier, 0);
  objc_storeStrong((id *)&self->_keywordsHelper, 0);
  objc_storeStrong((id *)&self->_keywordTitles, 0);
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_objectSaliencyRectsData, 0);
  objc_storeStrong((id *)&self->_computedAttributeMutations, 0);
  objc_storeStrong((id *)&self->_lastSharedDate, 0);
  objc_storeStrong((id *)&self->_visualSearchAdjustmentVersion, 0);
  objc_storeStrong((id *)&self->_visualSearchData, 0);
  objc_storeStrong((id *)&self->_characterRecognitionAdjustmentVersion, 0);
  objc_storeStrong((id *)&self->_machineReadableCodeData, 0);
  objc_storeStrong((id *)&self->_characterRecognitionData, 0);
  objc_storeStrong((id *)&self->_sceneClassificationDictionariesByType, 0);
  objc_storeStrong((id *)&self->_computeSyncMediaAnalysisPayload, 0);
  objc_storeStrong((id *)&self->_bestKeyFrameJPEGData, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_assetDescription, 0);
  objc_storeStrong((id *)&self->_updatedLocation, 0);
  objc_storeStrong((id *)&self->_editorBundleURL, 0);
  objc_storeStrong((id *)&self->_originalAsset, 0);
}

uint64_t __68__PHAssetChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setMutated:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "recordUpdateRequest:", *(_QWORD *)(a1 + 32));
}

+ (id)_allAssetEditOperations
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 1, 3);
}

+ (PHAssetChangeRequest)creationRequestForAssetFromImage:(UIImage *)image
{
  return (PHAssetChangeRequest *)+[PHAssetCreationRequest creationRequestForAssetFromImage:](PHAssetCreationRequest, "creationRequestForAssetFromImage:", image);
}

+ (PHAssetChangeRequest)creationRequestForAssetFromImageAtFileURL:(NSURL *)fileURL
{
  return (PHAssetChangeRequest *)+[PHAssetCreationRequest creationRequestForAssetFromImageAtFileURL:](PHAssetCreationRequest, "creationRequestForAssetFromImageAtFileURL:", fileURL);
}

+ (PHAssetChangeRequest)creationRequestForAssetFromVideoAtFileURL:(NSURL *)fileURL
{
  return (PHAssetChangeRequest *)+[PHAssetCreationRequest creationRequestForAssetFromVideoAtFileURL:](PHAssetCreationRequest, "creationRequestForAssetFromVideoAtFileURL:", fileURL);
}

+ (id)changeRequestForAssetFromVideoFileURL:(id)a3 imageAsset:(id)a4 displayTime:(double)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  CMTime v20;
  CMTime v21;
  CMTime v22;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAssetChangeRequest.m"), 408, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("videoFileURL"));

  }
  if ((objc_msgSend(v10, "isPhoto") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAssetChangeRequest.m"), 409, CFSTR("require photo when updating to iris"));

  }
  objc_msgSend(a1, "changeRequestForAsset:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PFVideoComplementMetadataForVideoAtPath();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "pairingIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v22, 0, sizeof(v22));
  if (objc_msgSend(v13, "hasValidImageDisplayTime"))
  {
    if (v13)
      objc_msgSend(v13, "imageDisplayTime");
    else
      memset(&v22, 0, sizeof(v22));
  }
  else
  {
    CMTimeMakeWithSeconds(&v22, a5, 60000);
  }
  memset(&v21, 0, sizeof(v21));
  if (objc_msgSend(v13, "hasValidVideoDuration"))
  {
    if (!v13)
    {
      memset(&v21, 0, sizeof(v21));
      if (v14)
        goto LABEL_16;
      goto LABEL_15;
    }
    objc_msgSend(v13, "videoDuration");
    if (!v14)
    {
LABEL_15:
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v21 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    if (!v14)
      goto LABEL_15;
  }
LABEL_16:
  objc_msgSend(v11, "setVideoURLForUpdate:", v9);
  v20 = v21;
  objc_msgSend(v11, "setVideoDuration:", &v20);
  v20 = v22;
  objc_msgSend(v11, "setImageDisplayTime:", &v20);
  objc_msgSend(v11, "setPairingIdentifier:", v14);
  objc_msgSend((id)objc_opt_class(), "_allAssetEditOperations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSupportedEditOperations:", v16);

  objc_msgSend(v11, "didMutate");
  return v11;
}

+ (id)creationRequestForAssetFromVideoComplementBundle:(id)a3
{
  return +[PHAssetCreationRequest creationRequestForAssetFromVideoComplementBundle:](PHAssetCreationRequest, "creationRequestForAssetFromVideoComplementBundle:", a3);
}

+ (PHAssetChangeRequest)changeRequestForAsset:(PHAsset *)asset
{
  PHAsset *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  if (!asset)
    return (PHAssetChangeRequest *)0;
  v3 = asset;
  +[PHChangeRequestHelper changeRequestForObject:](PHChangeRequestHelper, "changeRequestForObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setOriginalAsset:", v3);

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_allAssetEditOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__PHAssetChangeRequest_changeRequestForAsset___block_invoke;
  v10[3] = &unk_1E35D91E0;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v10);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexSet:", v7);
  objc_msgSend(v4, "setSupportedEditOperations:", v8);

  return (PHAssetChangeRequest *)v4;
}

+ (void)deleteAssets:(id)assets
{
  objc_msgSend(a1, "_deleteAssets:withOperation:topLevelSelector:deleteOptions:", assets, 0, a2, 0);
}

+ (void)expungeAssets:(id)a3
{
  objc_msgSend(a1, "_deleteAssets:withOperation:topLevelSelector:deleteOptions:", a3, 1, a2, 0);
}

+ (void)expungeAssets:(id)a3 deleteOptions:(id)a4
{
  objc_msgSend(a1, "_deleteAssets:withOperation:topLevelSelector:deleteOptions:", a3, 1, a2, a4);
}

+ (void)internalExpungeAssets:(id)a3 deleteOptions:(id)a4
{
  objc_msgSend(a1, "_deleteAssets:withOperation:topLevelSelector:deleteOptions:", a3, 1, a2, a4);
}

+ (void)undeleteAssets:(id)a3
{
  objc_msgSend(a1, "_deleteAssets:withOperation:topLevelSelector:deleteOptions:", a3, 2, a2, 0);
}

+ (void)_deleteAssets:(id)a3 withOperation:(int64_t)a4 topLevelSelector:(SEL)a5 deleteOptions:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  +[PHObject assertAllObjects:forSelector:areOfType:](PHObject, "assertAllObjects:forSelector:areOfType:", v9, a5, objc_opt_class());
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
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
        +[PHTrashableObjectDeleteRequest deleteRequestForObject:operation:](PHAssetDeleteRequest, "deleteRequestForObject:operation:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15), a4, (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setDeleteOptions:", v10);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

+ (void)performBatchExpungeWithAssets:(id)a3 deleteOptions:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  +[PHBatchAssetExpunger batchAssetExpungerWithAssets:deleteOptions:library:topLevelSelector:](PHBatchAssetExpunger, "batchAssetExpungerWithAssets:deleteOptions:library:topLevelSelector:", a3, a4, a5, a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performChangesWithCompletionHandler:", v10);

}

+ (BOOL)performBatchExpungeAndWaitWithAssets:(id)a3 deleteOptions:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  void *v7;

  +[PHBatchAssetExpunger batchAssetExpungerWithAssets:deleteOptions:library:topLevelSelector:](PHBatchAssetExpunger, "batchAssetExpungerWithAssets:deleteOptions:library:topLevelSelector:", a3, a4, a5, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v7, "performChangesAndWait:", a6);

  return (char)a6;
}

+ (void)recoverAssets:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PHObject assertAllObjects:forSelector:areOfType:](PHObject, "assertAllObjects:forSelector:areOfType:", v4, a2, objc_opt_class());
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  if (recoverAssets__s_onceToken != -1)
    dispatch_once(&recoverAssets__s_onceToken, &__block_literal_global_276);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v11 = objc_msgSend(MEMORY[0x1E0D73310], "defaultSavedAssetTypeForUnknownFilesystemImportAssets");
        objc_msgSend(v10, "photoLibrary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "pathManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isDCIM");

        if (v14)
        {
          objc_msgSend(v10, "pathForOriginalFile");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "length"))
          {
            v16 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v15, "stringByDeletingLastPathComponent");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "fileURLWithPath:isDirectory:", v17, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = 0;
            if (v18
              && objc_msgSend(MEMORY[0x1E0D718E0], "shouldImportAssetsFromDCIMSubDirectoryAtURL:assetsKind:", v18, &v23)&& v23 <= 7)
            {
              if (((1 << v23) & 0x8D) != 0)
              {
                objc_msgSend(v10, "directory");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "hasPrefix:", recoverAssets__s_cplAssetDirectoryPrefix);

                if (v20)
                  v21 = objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForAssetsInCPLAssetsDirectory");
                else
                  v21 = objc_msgSend(MEMORY[0x1E0D73310], "defaultSavedAssetTypeForUnknownFilesystemImportAssets");
LABEL_22:
                v11 = v21;
              }
              else
              {
                if (v23 == 1)
                {
                  v21 = objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForImportedByCameraConnectionKit");
                  goto LABEL_22;
                }
                if (v23 == 4)
                {
                  v21 = objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForFinderSyncedAsset");
                  goto LABEL_22;
                }
              }
            }
          }
          else
          {
            v18 = 0;
          }

        }
        +[PHAssetChangeRequest changeRequestForAsset:](PHAssetChangeRequest, "changeRequestForAsset:", v10);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_setSavedAssetType:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __38__PHAssetChangeRequest_recoverAssets___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("PhotoData"), CFSTR("CPLAssets"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)recoverAssets__s_cplAssetDirectoryPrefix;
  recoverAssets__s_cplAssetDirectoryPrefix = v0;

}

uint64_t __46__PHAssetChangeRequest_changeRequestForAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
}

@end
