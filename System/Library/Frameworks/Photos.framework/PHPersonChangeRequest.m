@implementation PHPersonChangeRequest

- (id)initForNewObject
{
  PHPersonChangeRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v5;
  PHRelationshipChangeRequestHelper *detectedFacesHelper;
  PHRelationshipChangeRequestHelper *v7;
  PHRelationshipChangeRequestHelper *temporalFacesHelper;
  PHRelationshipChangeRequestHelper *v9;
  PHRelationshipChangeRequestHelper *keyFaceHelper;
  PHRelationshipChangeRequestHelper *v11;
  PHRelationshipChangeRequestHelper *rejectedFacesHelper;
  PHRelationshipChangeRequestHelper *v13;
  PHRelationshipChangeRequestHelper *mergeCandidatesHelper;
  PHRelationshipChangeRequestHelper *v15;
  PHRelationshipChangeRequestHelper *mergeCandidatesWithConfidenceHelper;
  PHRelationshipChangeRequestHelper *v17;
  PHRelationshipChangeRequestHelper *invalidMergeCandidatesHelper;
  uint64_t v19;
  NSMutableArray *searchEntityRelationsToSet;
  uint64_t v21;
  NSMutableArray *searchEntityRelationsToRemove;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PHPersonChangeRequest;
  v2 = -[PHChangeRequest init](&v24, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

    v5 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("detectedFaces"), v2->super._helper);
    detectedFacesHelper = v2->_detectedFacesHelper;
    v2->_detectedFacesHelper = v5;

    v7 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("temporalDetectedFaces"), v2->super._helper);
    temporalFacesHelper = v2->_temporalFacesHelper;
    v2->_temporalFacesHelper = v7;

    v9 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("keyFace"), v2->super._helper);
    keyFaceHelper = v2->_keyFaceHelper;
    v2->_keyFaceHelper = v9;

    v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("rejectedFaces"), v2->super._helper);
    rejectedFacesHelper = v2->_rejectedFacesHelper;
    v2->_rejectedFacesHelper = v11;

    v13 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("mergeCandidates"), v2->super._helper);
    mergeCandidatesHelper = v2->_mergeCandidatesHelper;
    v2->_mergeCandidatesHelper = v13;

    v15 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("mergeCandidatesWithConfidence"), v2->super._helper);
    mergeCandidatesWithConfidenceHelper = v2->_mergeCandidatesWithConfidenceHelper;
    v2->_mergeCandidatesWithConfidenceHelper = v15;

    v17 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("invalidMergeCandidates"), v2->super._helper);
    invalidMergeCandidatesHelper = v2->_invalidMergeCandidatesHelper;
    v2->_invalidMergeCandidatesHelper = v17;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    searchEntityRelationsToSet = v2->_searchEntityRelationsToSet;
    v2->_searchEntityRelationsToSet = (NSMutableArray *)v19;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    searchEntityRelationsToRemove = v2->_searchEntityRelationsToRemove;
    v2->_searchEntityRelationsToRemove = (NSMutableArray *)v21;

  }
  return v2;
}

- (PHPersonChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHPersonChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v11;
  PHRelationshipChangeRequestHelper *detectedFacesHelper;
  PHRelationshipChangeRequestHelper *v13;
  PHRelationshipChangeRequestHelper *temporalFacesHelper;
  PHRelationshipChangeRequestHelper *v15;
  PHRelationshipChangeRequestHelper *keyFaceHelper;
  PHRelationshipChangeRequestHelper *v17;
  PHRelationshipChangeRequestHelper *rejectedFacesHelper;
  PHRelationshipChangeRequestHelper *v19;
  PHRelationshipChangeRequestHelper *mergeCandidatesHelper;
  PHRelationshipChangeRequestHelper *v21;
  PHRelationshipChangeRequestHelper *mergeCandidatesWithConfidenceHelper;
  PHRelationshipChangeRequestHelper *v23;
  PHRelationshipChangeRequestHelper *invalidMergeCandidatesHelper;
  uint64_t v25;
  NSMutableArray *searchEntityRelationsToSet;
  uint64_t v27;
  NSMutableArray *searchEntityRelationsToRemove;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PHPersonChangeRequest;
  v8 = -[PHChangeRequest init](&v30, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

    v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("detectedFaces"), v8->super._helper);
    detectedFacesHelper = v8->_detectedFacesHelper;
    v8->_detectedFacesHelper = v11;

    v13 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("temporalDetectedFaces"), v8->super._helper);
    temporalFacesHelper = v8->_temporalFacesHelper;
    v8->_temporalFacesHelper = v13;

    v15 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("keyFace"), v8->super._helper);
    keyFaceHelper = v8->_keyFaceHelper;
    v8->_keyFaceHelper = v15;

    v17 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("rejectedFaces"), v8->super._helper);
    rejectedFacesHelper = v8->_rejectedFacesHelper;
    v8->_rejectedFacesHelper = v17;

    v19 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("mergeCandidates"), v8->super._helper);
    mergeCandidatesHelper = v8->_mergeCandidatesHelper;
    v8->_mergeCandidatesHelper = v19;

    v21 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("mergeCandidatesWithConfidence"), v8->super._helper);
    mergeCandidatesWithConfidenceHelper = v8->_mergeCandidatesWithConfidenceHelper;
    v8->_mergeCandidatesWithConfidenceHelper = v21;

    v23 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("invalidMergeCandidates"), v8->super._helper);
    invalidMergeCandidatesHelper = v8->_invalidMergeCandidatesHelper;
    v8->_invalidMergeCandidatesHelper = v23;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = objc_claimAutoreleasedReturnValue();
    searchEntityRelationsToSet = v8->_searchEntityRelationsToSet;
    v8->_searchEntityRelationsToSet = (NSMutableArray *)v25;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = objc_claimAutoreleasedReturnValue();
    searchEntityRelationsToRemove = v8->_searchEntityRelationsToRemove;
    v8->_searchEntityRelationsToRemove = (NSMutableArray *)v27;

  }
  return v8;
}

- (PHPersonChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHPersonChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v14;
  PHRelationshipChangeRequestHelper *detectedFacesHelper;
  PHRelationshipChangeRequestHelper *v16;
  PHRelationshipChangeRequestHelper *temporalFacesHelper;
  PHRelationshipChangeRequestHelper *v18;
  PHRelationshipChangeRequestHelper *keyFaceHelper;
  PHRelationshipChangeRequestHelper *v20;
  PHRelationshipChangeRequestHelper *rejectedFacesHelper;
  PHRelationshipChangeRequestHelper *v22;
  PHRelationshipChangeRequestHelper *mergeCandidatesHelper;
  PHRelationshipChangeRequestHelper *v24;
  PHRelationshipChangeRequestHelper *mergeCandidatesWithConfidenceHelper;
  PHRelationshipChangeRequestHelper *v26;
  PHRelationshipChangeRequestHelper *invalidMergeCandidatesHelper;
  void *v28;
  uint64_t v29;
  NSMutableArray *personUUIDsToMerge;
  void *v31;
  void *v32;
  uint64_t v33;
  NSMutableSet *faceUUIDsRequiringFaceCropGeneration;
  void *v35;
  void *v36;
  uint64_t v37;
  NSMutableSet *faceUUIDsRequiringNewUnverifiedPerson;
  uint64_t v39;
  NSString *nominalMergeTargetUUID;
  void *v41;
  void *v42;
  uint64_t v43;
  NSMutableSet *rejectedMergeCandidatePersonUUIDs;
  void *v45;
  void *v46;
  uint64_t v47;
  NSMutableSet *graphDedupePersonUUIDs;
  PHPersonChangeRequest *v49;
  void (**v50)(_QWORD);
  void *v51;
  uint64_t v52;
  id v53;
  PHUserFeedback *userFeedback;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  id v62;
  NSSet *autonamingUserFeedbacks;
  NSObject *v64;
  _BOOL4 v65;
  _BOOL4 v66;
  void *v67;
  uint64_t v68;
  NSMutableArray *searchEntityRelationsToSet;
  void *v70;
  void *v71;
  uint64_t v72;
  NSMutableArray *searchEntityRelationsToRemove;
  id v75;
  id v76;
  id v77;
  _QWORD aBlock[4];
  PHPersonChangeRequest *v79;
  id v80;
  objc_super v81;
  uint8_t buf[4];
  id v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v81.receiver = self;
  v81.super_class = (Class)PHPersonChangeRequest;
  v11 = -[PHChangeRequest init](&v81, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      v75 = v10;
      v14 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("detectedFaces"), v8, v11->super._helper);
      detectedFacesHelper = v11->_detectedFacesHelper;
      v11->_detectedFacesHelper = v14;

      v16 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("temporalDetectedFaces"), v8, v11->super._helper);
      temporalFacesHelper = v11->_temporalFacesHelper;
      v11->_temporalFacesHelper = v16;

      v18 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("keyFace"), v8, v11->super._helper);
      keyFaceHelper = v11->_keyFaceHelper;
      v11->_keyFaceHelper = v18;

      v20 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("rejectedFaces"), v8, v11->super._helper);
      rejectedFacesHelper = v11->_rejectedFacesHelper;
      v11->_rejectedFacesHelper = v20;

      v22 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("mergeCandidates"), v8, v11->super._helper);
      mergeCandidatesHelper = v11->_mergeCandidatesHelper;
      v11->_mergeCandidatesHelper = v22;

      v24 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("mergeCandidatesWithConfidence"), v8, v11->super._helper);
      mergeCandidatesWithConfidenceHelper = v11->_mergeCandidatesWithConfidenceHelper;
      v11->_mergeCandidatesWithConfidenceHelper = v24;

      v26 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("invalidMergeCandidates"), v8, v11->super._helper);
      invalidMergeCandidatesHelper = v11->_invalidMergeCandidatesHelper;
      v11->_invalidMergeCandidatesHelper = v26;

      PLArrayFromXPCDictionary();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "mutableCopy");
      personUUIDsToMerge = v11->_personUUIDsToMerge;
      v11->_personUUIDsToMerge = (NSMutableArray *)v29;

      v31 = (void *)MEMORY[0x1E0C99E20];
      PLArrayFromXPCDictionary();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setWithArray:", v32);
      v33 = objc_claimAutoreleasedReturnValue();
      faceUUIDsRequiringFaceCropGeneration = v11->_faceUUIDsRequiringFaceCropGeneration;
      v11->_faceUUIDsRequiringFaceCropGeneration = (NSMutableSet *)v33;

      v35 = (void *)MEMORY[0x1E0C99E20];
      PLArrayFromXPCDictionary();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setWithArray:", v36);
      v37 = objc_claimAutoreleasedReturnValue();
      faceUUIDsRequiringNewUnverifiedPerson = v11->_faceUUIDsRequiringNewUnverifiedPerson;
      v11->_faceUUIDsRequiringNewUnverifiedPerson = (NSMutableSet *)v37;

      PLStringFromXPCDictionary();
      v39 = objc_claimAutoreleasedReturnValue();
      nominalMergeTargetUUID = v11->_nominalMergeTargetUUID;
      v11->_nominalMergeTargetUUID = (NSString *)v39;

      v41 = (void *)MEMORY[0x1E0C99E20];
      PLArrayFromXPCDictionary();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setWithArray:", v42);
      v43 = objc_claimAutoreleasedReturnValue();
      rejectedMergeCandidatePersonUUIDs = v11->_rejectedMergeCandidatePersonUUIDs;
      v11->_rejectedMergeCandidatePersonUUIDs = (NSMutableSet *)v43;

      v45 = (void *)MEMORY[0x1E0C99E20];
      PLArrayFromXPCDictionary();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setWithArray:", v46);
      v47 = objc_claimAutoreleasedReturnValue();
      graphDedupePersonUUIDs = v11->_graphDedupePersonUUIDs;
      v11->_graphDedupePersonUUIDs = (NSMutableSet *)v47;

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__PHPersonChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke;
      aBlock[3] = &unk_1E35DF9E8;
      v49 = v11;
      v79 = v49;
      v80 = v9;
      v50 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (-[NSMutableArray count](v11->_personUUIDsToMerge, "count")
        || -[NSMutableSet count](v11->_rejectedMergeCandidatePersonUUIDs, "count")
        || -[NSMutableSet count](v11->_graphDedupePersonUUIDs, "count"))
      {
        v50[2](v50);
      }
      PLDataFromXPCDictionary();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        v77 = 0;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v51, &v77);
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = v77;
        userFeedback = v49->_userFeedback;
        v49->_userFeedback = (PHUserFeedback *)v52;

        if (v49->_userFeedback)
        {
          v50[2](v50);
        }
        else
        {
          PLPhotoKitGetLog();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v83 = v53;
            _os_log_impl(&dword_1991EC000, v55, OS_LOG_TYPE_DEFAULT, "Failed to decode userFeedback object: %@", buf, 0xCu);
          }

        }
      }
      PLDataFromXPCDictionary();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (v56)
      {
        v57 = (void *)MEMORY[0x1E0CB3710];
        v58 = (void *)MEMORY[0x1E0C99E60];
        v59 = objc_opt_class();
        objc_msgSend(v58, "setWithObjects:", v59, objc_opt_class(), 0);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = 0;
        objc_msgSend(v57, "unarchivedObjectOfClasses:fromData:error:", v60, v56, &v76);
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = v76;
        autonamingUserFeedbacks = v49->_autonamingUserFeedbacks;
        v49->_autonamingUserFeedbacks = (NSSet *)v61;

        if (v49->_autonamingUserFeedbacks)
        {
          v50[2](v50);
        }
        else
        {
          PLPhotoKitGetLog();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v83 = v62;
            _os_log_impl(&dword_1991EC000, v64, OS_LOG_TYPE_DEFAULT, "Failed to decode autonamingUserFeedback object: %@", buf, 0xCu);
          }

        }
      }
      v65 = xpc_dictionary_get_BOOL(v8, "userFeedbackDataUnsetKey");
      v49->_didUnsetUserFeedback = v65;
      if (v65)
        v50[2](v50);
      v66 = xpc_dictionary_get_BOOL(v8, "autonamingUserFeedbackDataUnsetKey");
      v49->_didUnsetAutonamingUserFeedbacks = v66;
      if (v66)
        v50[2](v50);
      PLArrayFromXPCDictionary();
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v67, "count"))
      {
        v68 = objc_msgSend(v67, "mutableCopy");
        searchEntityRelationsToSet = v49->_searchEntityRelationsToSet;
        v49->_searchEntityRelationsToSet = (NSMutableArray *)v68;

        v50[2](v50);
      }
      PLArrayFromXPCDictionary();
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = (void *)objc_msgSend(v70, "mutableCopy");

      if (objc_msgSend(v71, "count"))
      {
        v72 = objc_msgSend(v71, "mutableCopy");
        searchEntityRelationsToRemove = v49->_searchEntityRelationsToRemove;
        v49->_searchEntityRelationsToRemove = (NSMutableArray *)v72;

        v50[2](v50);
      }

      v10 = v75;
    }
  }

  return v11;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
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
  PHUserFeedback *userFeedback;
  void *v18;
  id v19;
  NSObject *v20;
  NSSet *autonamingUserFeedbacks;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeToXPCDict:", v4);

  -[PHPersonChangeRequest detectedFacesHelper](self, "detectedFacesHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeToXPCDict:", v4);

  -[PHPersonChangeRequest temporalFacesHelper](self, "temporalFacesHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeToXPCDict:", v4);

  -[PHPersonChangeRequest keyFaceHelper](self, "keyFaceHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeToXPCDict:", v4);

  -[PHPersonChangeRequest rejectedFacesHelper](self, "rejectedFacesHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeToXPCDict:", v4);

  -[PHPersonChangeRequest mergeCandidatesHelper](self, "mergeCandidatesHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeToXPCDict:", v4);

  -[PHPersonChangeRequest mergeCandidatesWithConfidenceHelper](self, "mergeCandidatesWithConfidenceHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeToXPCDict:", v4);

  -[PHPersonChangeRequest invalidMergeCandidatesHelper](self, "invalidMergeCandidatesHelper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeToXPCDict:", v4);

  PLXPCDictionarySetArray();
  -[NSMutableSet allObjects](self->_faceUUIDsRequiringFaceCropGeneration, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetArray();

  -[NSMutableSet allObjects](self->_faceUUIDsRequiringNewUnverifiedPerson, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetArray();

  PLXPCDictionarySetString();
  -[NSMutableSet allObjects](self->_rejectedMergeCandidatePersonUUIDs, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetArray();

  -[NSMutableSet allObjects](self->_graphDedupePersonUUIDs, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetArray();

  userFeedback = self->_userFeedback;
  if (userFeedback)
  {
    v26 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", userFeedback, 1, &v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v26;
    if (v18)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      PLPhotoKitGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v19;
        _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_DEFAULT, "Failed to encode userFeedback object: %@", buf, 0xCu);
      }

    }
  }
  autonamingUserFeedbacks = self->_autonamingUserFeedbacks;
  if (autonamingUserFeedbacks)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", autonamingUserFeedbacks, 1, &v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v25;
    if (v22)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      PLPhotoKitGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v23;
        _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_DEFAULT, "Failed to encode userFeedback object: %@", buf, 0xCu);
      }

    }
  }
  xpc_dictionary_set_BOOL(v4, "userFeedbackDataUnsetKey", self->_didUnsetUserFeedback);
  xpc_dictionary_set_BOOL(v4, "autonamingUserFeedbackDataUnsetKey", self->_didUnsetAutonamingUserFeedbacks);
  if (self->_searchEntityRelationsToSet)
    PLXPCDictionarySetArray();
  if (self->_searchEntityRelationsToRemove)
    PLXPCDictionarySetArray();

}

- (PHObjectPlaceholder)placeholderForCreatedPerson
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHObjectPlaceholder *)v4;
}

- (int64_t)type
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("type"));

}

- (unint64_t)manualOrder
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("manualOrder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  return v6;
}

- (void)setManualOrder:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("manualOrder"));

}

- (double)mergeCandidateConfidence
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
  objc_msgSend(v4, "objectForKey:", CFSTR("mergeCandidateConfidence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setMergeCandidateConfidence:(double)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("mergeCandidateConfidence"));

}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("fullName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setName:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("fullName"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("fullName"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("fullName"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("fullName"));
  }

}

- (NSString)displayName
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("displayName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setDisplayName:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("displayName"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("displayName"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("displayName"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("displayName"));
  }

}

- (id)personUUID
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("personUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setPersonUUID:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("personUUID"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("personUUID"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("personUUID"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("personUUID"));
  }

}

- (NSString)personUri
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("personUri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setPersonUri:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("personUri"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("personUri"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("personUri"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("personUri"));
  }

}

- (BOOL)isInPersonNamingModel
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("inPersonNamingModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setInPersonNamingModel:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("inPersonNamingModel"));

}

- (int64_t)verifiedType
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("verifiedType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setVerifiedType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("verifiedType"));

}

- (unsigned)questionType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("questionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setQuestionType:(unsigned __int16)a3
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

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("questionType"));

}

- (unsigned)ageType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ageType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setAgeType:(unsigned __int16)a3
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

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("ageType"));

}

- (unsigned)genderType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("genderType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setGenderType:(unsigned __int16)a3
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

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("genderType"));

}

- (NSDictionary)contactMatchingDictionary
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("contactMatchingDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (void)setContactMatchingDictionary:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("contactMatchingDictionary"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("contactMatchingDictionary"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("contactMatchingDictionary"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("contactMatchingDictionary"));
  }

}

- (signed)keyFacePickSource
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("keyFacePickSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (__int16)v3;
}

- (void)setKeyFacePickSource:(signed __int16)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("keyFacePickSource"));

}

- (unsigned)suggestedForClientType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("suggestedForClientType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setSuggestedForClientType:(unsigned __int16)a3
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

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("suggestedForClientType"));

}

- (signed)detectionType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("detectionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (__int16)v3;
}

- (void)setDetectionType:(signed __int16)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("detectionType"));

}

- (NSString)mdID
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("mdID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setMdID:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("mdID"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("mdID"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("mdID"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("mdID"));
  }

}

- (int64_t)assetSortOrder
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("assetSortOrder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setAssetSortOrder:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("assetSortOrder"));

}

- (void)setManualOrder:(unint64_t)a3 verified:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[PHPersonChangeRequest setManualOrder:](self, "setManualOrder:", a3);
  if (v4)
    -[PHPersonChangeRequest setVerified:](self, "setVerified:", 1);
}

- (unsigned)sexType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("genderType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setSexType:(unsigned __int16)a3
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

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("genderType"));

}

- (void)setVerified:(BOOL)a3
{
  -[PHPersonChangeRequest setVerifiedType:](self, "setVerifiedType:", a3);
}

- (BOOL)isVerified
{
  return -[PHPersonChangeRequest verifiedType](self, "verifiedType") == 1;
}

- (void)setUserFeedback:(id)a3
{
  PHUserFeedback *v5;
  void *v6;
  PHUserFeedback *userFeedback;
  void *v8;

  v5 = (PHUserFeedback *)a3;
  if (-[PHUserFeedback feature](v5, "feature"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPersonChangeRequest.m"), 333, CFSTR("-setUserFeedback should only be used for PHUserFeedbacks with feature set to PHUserFeedbackPersonFeatureNone"));

  }
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didMutate");

  userFeedback = self->_userFeedback;
  self->_userFeedback = v5;

  if (!v5)
    self->_didUnsetUserFeedback = 1;
}

- (void)setAutonamingUserFeedbacks:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSSet *v13;
  NSSet *autonamingUserFeedbacks;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "feature") != 1 && objc_msgSend(v10, "feature") != 2)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPersonChangeRequest.m"), 343, CFSTR("-setAutonamingUserFeedbacks should only be used for PHUserFeedbacks with feature set to PHUserFeedbackPersonFeatureAutonamingSuggestionWithName or PHUserFeedbackPersonFeatureAutonamingSuggestionWithContactID"));

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  -[PHChangeRequest helper](self, "helper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "didMutate");

  v13 = (NSSet *)objc_msgSend(v5, "copy");
  autonamingUserFeedbacks = self->_autonamingUserFeedbacks;
  self->_autonamingUserFeedbacks = v13;

  if (!objc_msgSend(v5, "count"))
    self->_didUnsetAutonamingUserFeedbacks = 1;

}

- (NSString)managedEntityName
{
  return (NSString *)CFSTR("Person");
}

- (BOOL)_containsUserMutations
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("fullName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("personUri"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("type"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("displayName"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v6 = 1;
        }
        else
        {
          -[PHPersonChangeRequest rejectedFacesHelper](self, "rejectedFacesHelper");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "mutableObjectIDsAndUUIDs");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v11, "count") != 0;

        }
      }

    }
  }

  return v6;
}

- (BOOL)_hasMutationForVerifiedType:(int *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mutations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("verifiedType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v6)
    *a3 = objc_msgSend(v6, "intValue");

  return v6 != 0;
}

- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  const __CFString **v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  NSMutableArray *personUUIDsToMerge;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PHChangeRequest helper](self, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v8 = objc_msgSend(v7, "validateMutationsToManagedObject:error:", v6, &v42);
  v9 = v42;

  if (!v8)
  {
    LOBYTE(v10) = 0;
    if (!a4)
      goto LABEL_31;
    goto LABEL_27;
  }
  *(_DWORD *)buf = 0;
  if (-[PHPersonChangeRequest _hasMutationForVerifiedType:](self, "_hasMutationForVerifiedType:", buf))
  {
    if (-[PHPersonChangeRequest _containsUserMutations](self, "_containsUserMutations") && *(_DWORD *)buf != 1)
    {
      v10 = MEMORY[0x1E0CB35C8];
      v51 = *MEMORY[0x1E0CB2938];
      v52[0] = CFSTR("Persons with user mutations cannot be set to a type other than PLPersonVerifiedTypeUser");
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = (const __CFString **)v52;
      v13 = &v51;
LABEL_11:
      objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v14);
      v15 = objc_claimAutoreleasedReturnValue();

      LOBYTE(v10) = 0;
      goto LABEL_26;
    }
    if (objc_msgSend(v6, "verifiedType") == 1 && *(_DWORD *)buf != 1)
    {
      v10 = MEMORY[0x1E0CB35C8];
      v49 = *MEMORY[0x1E0CB2938];
      v50 = CFSTR("Persons with type PLPersonVerifiedTypeUser cannot be changed");
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = &v50;
      v13 = &v49;
      goto LABEL_11;
    }
  }
  -[PHChangeRequest helper](self, "helper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mutations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("detectionType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqual:", &unk_1E3655AB0);

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2938];
    v48 = CFSTR("PHDetectionTypePet is not a valid value to assign to Person.detectionType");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3111, v10);
    v21 = objc_claimAutoreleasedReturnValue();

    LOBYTE(v10) = 0;
    v9 = (id)v21;
    if (!a4)
      goto LABEL_31;
LABEL_27:
    if ((v10 & 1) == 0)
    {
      PLPhotoKitGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "userInfo");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2938]);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v44 = v39;
        _os_log_impl(&dword_1991EC000, v37, OS_LOG_TYPE_ERROR, "Person change request validation failed: %{public}@", buf, 0xCu);

      }
      v9 = objc_retainAutorelease(v9);
      LOBYTE(v10) = 0;
      *a4 = v9;
    }
    goto LABEL_31;
  }
  if (-[NSMutableArray count](self->_personUUIDsToMerge, "count"))
  {
    personUUIDsToMerge = self->_personUUIDsToMerge;
    v41 = 0;
    LODWORD(v10) = -[PHPersonChangeRequest _validateMergePerson:withPersonUUIDs:error:](self, "_validateMergePerson:withPersonUUIDs:error:", v6, personUUIDsToMerge, &v41);
    v23 = v41;
    v15 = (uint64_t)v23;
    if (!(_DWORD)v10)
    {

LABEL_26:
      v9 = (id)v15;
      if (!a4)
        goto LABEL_31;
      goto LABEL_27;
    }

  }
  if (objc_msgSend(v6, "keyFacePickSource") != 1)
  {
    LOBYTE(v10) = 1;
    goto LABEL_31;
  }
  -[PHChangeRequest helper](self, "helper");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "mutations");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", CFSTR("keyFacePickSource"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
    goto LABEL_32;
  if (objc_msgSend(v26, "shortValue") == 1)
    goto LABEL_32;
  objc_msgSend(v6, "keyFace");
  v27 = objc_claimAutoreleasedReturnValue();
  if (!v27)
    goto LABEL_32;
  v28 = (void *)v27;
  objc_msgSend(v6, "keyFace");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "assetVisible");

  if (v30)
  {
    v10 = MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0D74498];
    v45 = *MEMORY[0x1E0CB2938];
    v32 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "personUUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("Attempt to change user-picked keyFacePickSource on person %@"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "errorWithDomain:code:userInfo:", v31, 41005, v35);
    v36 = objc_claimAutoreleasedReturnValue();

    LOBYTE(v10) = 0;
    v9 = (id)v36;
  }
  else
  {
LABEL_32:
    LOBYTE(v10) = 1;
  }

  if (a4)
    goto LABEL_27;
LABEL_31:

  return v10;
}

- (BOOL)_validateMergePerson:(id)a3 withPersonUUIDs:(id)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  void *v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!objc_msgSend(a4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPersonChangeRequest.m"), 442, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUUIDs.count > 0"));

  }
  v10 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71940], "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("personUUID"), self->_personUUIDsToMerge);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v13);

  v22[0] = CFSTR("detectionType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPropertiesToFetch:", v14);

  objc_msgSend(v9, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v15, "executeFetchRequest:error:", v12, &v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v21;

  if (v16)
  {
    v18 = objc_msgSend(v9, "validateDetectionTypesForMergingWithPersons:error:", v16, a5);
  }
  else
  {
    v18 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v17);
  }

  return v18;
}

- (BOOL)_shouldPromotePerson:(id)a3 toVerifiedType:(int *)a4
{
  id v6;
  int v7;
  int v8;
  BOOL v9;
  BOOL v10;
  int v12;

  v6 = a3;
  if (objc_msgSend(v6, "verifiedType") == 1)
    goto LABEL_9;
  v12 = 0;
  if (!-[PHPersonChangeRequest _containsUserMutations](self, "_containsUserMutations"))
  {
    if (-[PHPersonChangeRequest _hasMutationForVerifiedType:](self, "_hasMutationForVerifiedType:", &v12))
    {
      v7 = v12;
      goto LABEL_6;
    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v7 = 1;
  v12 = 1;
LABEL_6:
  v8 = objc_msgSend(v6, "verifiedType");
  v9 = v7 == v8;
  v10 = v7 != v8;
  if (a4 && !v9)
  {
    *a4 = v12;
    v10 = 1;
  }
LABEL_10:

  return v10;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  NSMutableArray *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  uint64_t v34;
  NSMutableArray *v35;
  void *v36;
  void *v37;
  char v38;
  NSObject *v39;
  NSMutableArray *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
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
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t n;
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
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t ii;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t jj;
  void *v97;
  void *v98;
  NSMutableArray *searchEntityRelationsToSet;
  NSMutableArray *searchEntityRelationsToRemove;
  BOOL v101;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  NSMutableArray *v113;
  void *v114;
  void *v115;
  int v116;
  NSObject *v117;
  NSMutableArray *v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t i;
  void *v124;
  void *v125;
  void *v126;
  int v127;
  void *v128;
  void *v129;
  int v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  char v138;
  void *v139;
  void *v140;
  void *v141;
  int v142;
  id v143;
  void *v144;
  void *v145;
  void *v146;
  int v147;
  id v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t j;
  void *v153;
  void *v154;
  void *v155;
  NSObject *v156;
  NSMutableArray *personUUIDsToMerge;
  NSString *nominalMergeTargetUUID;
  id v159;
  NSMutableArray *v160;
  uint64_t v161;
  NSMutableArray *k;
  void *v163;
  void *v164;
  int v165;
  void *v166;
  int v167;
  NSMutableArray *v168;
  NSObject *v169;
  NSObject *v170;
  NSString *v171;
  void *v172;
  NSString *v173;
  NSObject *v174;
  int v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  int v181;
  BOOL v182;
  void *v183;
  NSMutableArray *v184;
  NSObject *v185;
  void *v186;
  char v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  unsigned int v192;
  int v193;
  _BOOL4 v194;
  id v195;
  void *v196;
  void *v197;
  void *v198;
  id v199;
  id v200;
  void *v201;
  id *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  id obj;
  NSSet *obja;
  PHPersonChangeRequest *v209;
  NSMutableArray *v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  id v227;
  id v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  id v237;
  id v238;
  id v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  id v244;
  id v245;
  id v246;
  id v247;
  id v248;
  unsigned int v249;
  _BYTE v250[128];
  _BYTE v251[128];
  _BYTE v252[128];
  _BYTE v253[128];
  uint8_t v254[128];
  uint8_t buf[4];
  NSMutableArray *v256;
  __int16 v257;
  NSString *v258;
  _BYTE v259[128];
  _BYTE v260[128];
  uint64_t v261;

  v261 = *MEMORY[0x1E0C80C00];
  v8 = (NSMutableArray *)a3;
  v9 = a4;
  -[NSMutableArray photoLibrary](v8, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[NSMutableArray verifiedType](v8, "verifiedType");
  v249 = 0;
  v13 = -[PHPersonChangeRequest _shouldPromotePerson:toVerifiedType:](self, "_shouldPromotePerson:toVerifiedType:", v8, &v249);
  if (v13)
    -[NSMutableArray setEffectiveVerifiedType:](v8, "setEffectiveVerifiedType:", v249);
  -[PHChangeRequest helper](self, "helper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v248 = 0;
  v15 = objc_msgSend(v14, "applyMutationsToManagedObject:error:", v8, &v248);
  v16 = v248;

  if (!v15)
    goto LABEL_77;
  v194 = v13;
  v192 = v12;
  -[NSMutableArray keyFace](v8, "keyFace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPersonChangeRequest keyFaceHelper](self, "keyFaceHelper");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "mutableObjectIDsAndUUIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v18, "setAllowsInsert:", 1);
    objc_msgSend(MEMORY[0x1E0D716C8], "entityName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDestinationEntityName:", v20);

    v247 = v16;
    v21 = v18;
    v22 = objc_msgSend(v18, "applyMutationsToManagedObjectToOneRelationship:error:", v8, &v247);
    v23 = v247;

    v193 = v22;
    v24 = v22;
    v25 = v23;
  }
  else
  {
    v21 = v18;
    v25 = v16;
    v193 = 0;
    v24 = 1;
  }
  obj = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PHPersonChangeRequest detectedFacesHelper](self, "detectedFacesHelper");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v209 = self;
  v210 = v8;
  v202 = a5;
  v205 = v26;
  v206 = v21;
  if ((v24 & 1) == 0)
  {
    -[PHPersonChangeRequest temporalFacesHelper](self, "temporalFacesHelper");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v25;
    goto LABEL_21;
  }
  v27 = v26;
  objc_msgSend(v26, "mutableObjectIDsAndUUIDs");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v201 = v17;
  if (!v28)
  {
    -[PHPersonChangeRequest temporalFacesHelper](self, "temporalFacesHelper");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v25;
    goto LABEL_82;
  }
  objc_msgSend(v27, "setAllowsInsert:", 1);
  objc_msgSend(v27, "setAllowsMove:", 0);
  objc_msgSend(v27, "setAllowsRemove:", 1);
  objc_msgSend(MEMORY[0x1E0D716C8], "entityName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDestinationEntityName:", v29);

  -[NSMutableArray mutableFaces](v8, "mutableFaces");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v246 = v25;
  v31 = objc_msgSend(v27, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v8, v30, &v246);
  v32 = v246;

  if (v31)
  {
    objc_msgSend(v30, "allObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "addObjectsFromArray:", v33);

  }
  -[NSMutableArray keyFace](v8, "keyFace");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v8;
  if (v34)
  {
    v36 = (void *)v34;
    -[NSMutableArray keyFace](v8, "keyFace");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v30, "containsObject:", v37);

    if ((v38 & 1) == 0)
    {
      if (-[NSMutableArray keyFacePickSource](v35, "keyFacePickSource") == 1)
      {
        PLPhotoKitGetLog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          -[NSMutableArray personUUID](v35, "personUUID");
          v40 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v256 = v40;
          _os_log_impl(&dword_1991EC000, v39, OS_LOG_TYPE_ERROR, "Resetting user-picked keyFace on person %{public}@ because it's not in the list of faces", buf, 0xCu);

        }
      }
      -[NSMutableArray setKeyFace:pickSource:](v35, "setKeyFace:pickSource:", 0, 0);
    }
  }

  self = v209;
  -[PHPersonChangeRequest temporalFacesHelper](v209, "temporalFacesHelper");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v35;
  v42 = v32;
  v17 = v201;
  if ((v31 & 1) == 0)
  {
LABEL_21:
    v204 = v41;
    -[PHPersonChangeRequest rejectedFacesHelper](self, "rejectedFacesHelper");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v42;
    goto LABEL_22;
  }
LABEL_82:
  v103 = v41;
  objc_msgSend(v41, "mutableObjectIDsAndUUIDs");
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  v204 = v103;
  if (v104)
  {
    objc_msgSend(v103, "setAllowsInsert:", 1);
    objc_msgSend(v103, "setAllowsMove:", 0);
    objc_msgSend(v103, "setAllowsRemove:", 1);
    objc_msgSend(MEMORY[0x1E0D716C8], "entityName");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "setDestinationEntityName:", v105);

    -[NSMutableArray mutableTemporalFaces](v8, "mutableTemporalFaces");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v245 = v42;
    v107 = objc_msgSend(v103, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v8, v106, &v245);
    v44 = v245;

    if (v107)
    {
      objc_msgSend(v106, "allObjects");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "addObjectsFromArray:", v108);

      self = v209;
    }

    -[PHPersonChangeRequest rejectedFacesHelper](self, "rejectedFacesHelper");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v107 & 1) != 0)
    {
      v42 = v44;
      v17 = v201;
      goto LABEL_88;
    }
    v17 = v201;
LABEL_22:
    v203 = v43;
    -[PHPersonChangeRequest mergeCandidatesHelper](self, "mergeCandidatesHelper");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  -[PHPersonChangeRequest rejectedFacesHelper](self, "rejectedFacesHelper");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_88:
  objc_msgSend(v43, "mutableObjectIDsAndUUIDs");
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  v200 = v9;
  v203 = v43;
  if (v109)
  {
    v190 = v11;
    objc_msgSend(v43, "setAllowsInsert:", 1);
    objc_msgSend(v43, "setAllowsMove:", 0);
    objc_msgSend(v43, "setAllowsRemove:", 1);
    objc_msgSend(MEMORY[0x1E0D716C8], "entityName");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setDestinationEntityName:", v110);

    -[NSMutableArray mutableRejectedFaces](v8, "mutableRejectedFaces");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v244 = v42;
    v187 = objc_msgSend(v43, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v8, v111, &v244);
    v44 = v244;

    -[NSMutableArray keyFace](v8, "keyFace");
    v112 = objc_claimAutoreleasedReturnValue();
    v113 = v8;
    if (v112)
    {
      v114 = (void *)v112;
      -[NSMutableArray keyFace](v8, "keyFace");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = objc_msgSend(v111, "containsObject:", v115);

      if (v116)
      {
        if (-[NSMutableArray keyFacePickSource](v113, "keyFacePickSource") == 1)
        {
          PLPhotoKitGetLog();
          v117 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
          {
            -[NSMutableArray personUUID](v113, "personUUID");
            v118 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v256 = v118;
            _os_log_impl(&dword_1991EC000, v117, OS_LOG_TYPE_ERROR, "Resetting user-picked keyFace on person %{public}@ because it's in the list of rejected faces", buf, 0xCu);

          }
        }
        -[NSMutableArray setKeyFace:pickSource:](v113, "setKeyFace:pickSource:", 0, 0);
      }
    }
    v196 = v111;
    v242 = 0u;
    v243 = 0u;
    v240 = 0u;
    v241 = 0u;
    -[NSMutableArray rejectedFaces](v113, "rejectedFaces");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v240, v260, 16);
    if (v120)
    {
      v121 = v120;
      v122 = *(_QWORD *)v241;
      do
      {
        for (i = 0; i != v121; ++i)
        {
          if (*(_QWORD *)v241 != v122)
            objc_enumerationMutation(v119);
          v124 = *(void **)(*((_QWORD *)&v240 + 1) + 8 * i);
          -[PHPersonChangeRequest _mutableRequiringFaceCropGenerationFacesUUIDs](v209, "_mutableRequiringFaceCropGenerationFacesUUIDs");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "uuid");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          v127 = objc_msgSend(v125, "containsObject:", v126);

          if (v127)
          {
            objc_msgSend(v124, "addRejectedPersonNeedingFaceCrops:", v210);
            objc_msgSend(v124, "addClusterRejectedPerson:", v210);
          }
          -[PHPersonChangeRequest _mutableRejectedFacesObjectIDsAndUUIDs](v209, "_mutableRejectedFacesObjectIDsAndUUIDs");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "uuid");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = objc_msgSend(v128, "containsObject:", v129);

          if (v130)
          {
            objc_msgSend(v124, "associatedAssetForFaceOrTorso:orTemporal:", 0, 0);
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "setModificationDate:", v132);

          }
        }
        v121 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v240, v260, 16);
      }
      while (v121);
    }

    self = v209;
    -[PHPersonChangeRequest mergeCandidatesHelper](v209, "mergeCandidatesHelper");
    v133 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v133;
    if ((v187 & 1) != 0)
    {
      v42 = v44;
      v8 = v210;
      v9 = v200;
      v17 = v201;
      v11 = v190;
      v134 = (void *)v133;
      goto LABEL_111;
    }
    v9 = v200;
    v17 = v201;
    v11 = v190;
LABEL_23:
    -[PHPersonChangeRequest mergeCandidatesWithConfidenceHelper](self, "mergeCandidatesWithConfidenceHelper");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  -[PHPersonChangeRequest mergeCandidatesHelper](self, "mergeCandidatesHelper");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_111:
  objc_msgSend(v134, "mutableObjectIDsAndUUIDs");
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  if (v135)
  {
    objc_msgSend(v134, "setAllowsInsert:", 1);
    objc_msgSend(v134, "setAllowsMove:", 0);
    objc_msgSend(v134, "setAllowsRemove:", 1);
    objc_msgSend(MEMORY[0x1E0D71940], "entityName");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "setDestinationEntityName:", v136);

    -[NSMutableArray mutableMergeCandidates](v8, "mutableMergeCandidates");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v239 = v42;
    v45 = v134;
    v138 = objc_msgSend(v134, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v8, v137, &v239);
    v44 = v239;

    -[PHPersonChangeRequest mergeCandidatesWithConfidenceHelper](self, "mergeCandidatesWithConfidenceHelper");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v138 & 1) != 0)
    {
      v42 = v44;
      goto LABEL_116;
    }
LABEL_24:
    -[PHPersonChangeRequest invalidMergeCandidatesHelper](self, "invalidMergeCandidatesHelper");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v48) = 0;
    v16 = v44;
    goto LABEL_25;
  }
  v45 = v134;
  -[PHPersonChangeRequest mergeCandidatesWithConfidenceHelper](self, "mergeCandidatesWithConfidenceHelper");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_116:
  objc_msgSend(v46, "mutableObjectIDsAndUUIDs");
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  if (v139)
  {
    objc_msgSend(v46, "setAllowsInsert:", 1);
    objc_msgSend(v46, "setAllowsMove:", 0);
    objc_msgSend(v46, "setAllowsRemove:", 1);
    objc_msgSend(MEMORY[0x1E0D71940], "entityName");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setDestinationEntityName:", v140);

    -[NSMutableArray mutableMergeCandidatesWithConfidence](v8, "mutableMergeCandidatesWithConfidence");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v238 = v42;
    v142 = objc_msgSend(v46, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v8, v141, &v238);
    v143 = v238;

    -[PHPersonChangeRequest invalidMergeCandidatesHelper](self, "invalidMergeCandidatesHelper");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v142)
    {
      LODWORD(v48) = 0;
      v16 = v143;
      v9 = v200;
      goto LABEL_25;
    }
  }
  else
  {
    -[PHPersonChangeRequest invalidMergeCandidatesHelper](self, "invalidMergeCandidatesHelper");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = v42;
  }
  objc_msgSend(v47, "mutableObjectIDsAndUUIDs");
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  if (v144)
  {
    objc_msgSend(v47, "setAllowsInsert:", 1);
    objc_msgSend(v47, "setAllowsMove:", 0);
    objc_msgSend(v47, "setAllowsRemove:", 1);
    objc_msgSend(MEMORY[0x1E0D71940], "entityName");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setDestinationEntityName:", v145);

    -[NSMutableArray mutableInvalidMergeCandidates](v210, "mutableInvalidMergeCandidates");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v237 = v143;
    v147 = objc_msgSend(v47, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v210, v146, &v237);
    v16 = v237;

    if (!v147)
    {
LABEL_181:
      LODWORD(v48) = 0;
      v9 = v200;
      v17 = v201;
      self = v209;
      goto LABEL_25;
    }
  }
  else
  {
    v16 = v143;
  }
  v197 = v16;
  self = v209;
  if (-[NSMutableSet count](v209->_rejectedMergeCandidatePersonUUIDs, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D71940], "personsWithUUIDs:inManagedObjectContext:", v209->_rejectedMergeCandidatePersonUUIDs, v11);
    v233 = 0u;
    v234 = 0u;
    v235 = 0u;
    v236 = 0u;
    v148 = (id)objc_claimAutoreleasedReturnValue();
    v149 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v233, v259, 16);
    if (v149)
    {
      v150 = v149;
      v151 = *(_QWORD *)v234;
      do
      {
        for (j = 0; j != v150; ++j)
        {
          if (*(_QWORD *)v234 != v151)
            objc_enumerationMutation(v148);
          v153 = *(void **)(*((_QWORD *)&v233 + 1) + 8 * j);
          objc_msgSend(v153, "keyFace");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray rejectFaceIfPossible:shouldCreateFaceCrop:](v210, "rejectFaceIfPossible:shouldCreateFaceCrop:", v154, 1);

          -[NSMutableArray keyFace](v210, "keyFace");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "rejectFaceIfPossible:shouldCreateFaceCrop:", v155, 1);

        }
        v150 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v233, v259, 16);
      }
      while (v150);
    }

    self = v209;
  }
  v9 = v200;
  v188 = v45;
  if (-[NSMutableArray count](self->_personUUIDsToMerge, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D71940], "personsWithUUIDs:inManagedObjectContext:", self->_personUUIDsToMerge, v11);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v48)
    {
      v16 = v197;
      v17 = v201;
      goto LABEL_25;
    }
    PLPhotoKitGetLog();
    v156 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
    {
      personUUIDsToMerge = self->_personUUIDsToMerge;
      nominalMergeTargetUUID = self->_nominalMergeTargetUUID;
      *(_DWORD *)buf = 138412546;
      v256 = personUUIDsToMerge;
      v257 = 2112;
      v258 = nominalMergeTargetUUID;
      _os_log_impl(&dword_1991EC000, v156, OS_LOG_TYPE_DEFAULT, "Merging persons with UUIDs %@ and nominalMergeTargetUUID %@", buf, 0x16u);
    }

    v186 = v48;
    if (self->_nominalMergeTargetUUID)
    {
      v231 = 0u;
      v232 = 0u;
      v229 = 0u;
      v230 = 0u;
      v159 = v48;
      v160 = (NSMutableArray *)objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v229, v254, 16);
      if (v160)
      {
        v191 = v11;
        v161 = *(_QWORD *)v230;
        while (2)
        {
          for (k = 0; k != v160; k = (NSMutableArray *)((char *)k + 1))
          {
            if (*(_QWORD *)v230 != v161)
              objc_enumerationMutation(v159);
            v163 = *(void **)(*((_QWORD *)&v229 + 1) + 8 * (_QWORD)k);
            objc_msgSend(v163, "personUUID");
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            v165 = objc_msgSend(v164, "isEqualToString:", v209->_nominalMergeTargetUUID);

            if (v165)
            {
              v160 = v163;
              goto LABEL_149;
            }
          }
          v160 = (NSMutableArray *)objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v229, v254, 16);
          if (v160)
            continue;
          break;
        }
LABEL_149:
        v9 = v200;
        v11 = v191;
      }

      -[NSMutableArray personUUID](v210, "personUUID");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = objc_msgSend(v166, "isEqualToString:", v209->_nominalMergeTargetUUID);

      if (v167)
      {
        v168 = v210;

        v160 = v168;
      }
      PLPhotoKitGetLog();
      v169 = objc_claimAutoreleasedReturnValue();
      v170 = v169;
      self = v209;
      if (v160)
      {
        if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v256 = v160;
          _os_log_impl(&dword_1991EC000, v170, OS_LOG_TYPE_DEFAULT, "Found nominal target %@ for merging", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
        {
          v171 = v209->_nominalMergeTargetUUID;
          *(_DWORD *)buf = 138412290;
          v256 = (NSMutableArray *)v171;
          _os_log_impl(&dword_1991EC000, v170, OS_LOG_TYPE_ERROR, "Attempting to merge persons with a nominal target identifier (%@) that does not match any of the persons being merged", buf, 0xCu);
        }
        v160 = 0;
      }

    }
    else
    {
      v160 = 0;
    }
    v45 = v188;
    -[NSMutableArray prepareForUserInitiatedMergeWithPersons:](v210, "prepareForUserInitiatedMergeWithPersons:", v186);
    -[NSMutableArray pickOptimalStateForUserInitiatedMergeWithPersons:nominalTarget:](v210, "pickOptimalStateForUserInitiatedMergeWithPersons:nominalTarget:", v186, v160);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray mergePersons:withOptimalState:](v210, "mergePersons:withOptimalState:", v186, v172);

  }
  if (-[NSMutableSet count](self->_graphDedupePersonUUIDs, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D71940], "personsWithUUIDs:inManagedObjectContext:", self->_graphDedupePersonUUIDs, v11);
    v173 = (NSString *)objc_claimAutoreleasedReturnValue();
    PLPhotoKitGetLog();
    v174 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v256 = v210;
      v257 = 2112;
      v258 = v173;
      _os_log_impl(&dword_1991EC000, v174, OS_LOG_TYPE_DEFAULT, "Deduping graph persons with target %@, dedupe persons %@", buf, 0x16u);
    }

    v228 = 0;
    v175 = -[NSMutableArray dedupeGraphPersons:error:](v210, "dedupeGraphPersons:error:", v173, &v228);
    v176 = v228;
    v177 = v176;
    if (!v175)
    {
      objc_msgSend(v176, "localizedDescription");
      v184 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("%@"), v184);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      PLPhotoKitGetLog();
      v185 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v256 = v184;
        _os_log_impl(&dword_1991EC000, v185, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      goto LABEL_181;
    }

  }
  -[NSMutableArray createUnverifiedPersonForRejectedFaceUUIDs:inManagedObjectContext:](v210, "createUnverifiedPersonForRejectedFaceUUIDs:inManagedObjectContext:", self->_faceUUIDsRequiringNewUnverifiedPerson, v11);
  if (v194)
  {
    v227 = v197;
    LODWORD(v48) = -[PHPersonChangeRequest _ensureModelConsistencyForVerifiedTypePromotion:originalVerifiedType:error:](self, "_ensureModelConsistencyForVerifiedTypePromotion:originalVerifiedType:error:", v210, v192, &v227);
    v16 = v227;

  }
  else
  {
    LODWORD(v48) = 1;
    v16 = v197;
  }
  v17 = v201;
  if ((v48 & v193) == 1)
  {
    -[NSMutableArray keyFace](v210, "keyFace");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPersonChangeRequest _mutableRequiringFaceCropGenerationFacesUUIDs](self, "_mutableRequiringFaceCropGenerationFacesUUIDs");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    v198 = v178;
    objc_msgSend(v178, "uuid");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v179, "containsObject:", v180))
    {
      v181 = -[NSMutableArray verifiedType](v210, "verifiedType");

      v182 = v181 == 1;
      v9 = v200;
      v17 = v201;
      v45 = v188;
      v183 = v198;
      if (v182)
      {
        -[NSMutableArray setKeyFacePickSource:](v210, "setKeyFacePickSource:", 1);
        if (objc_msgSend(v198, "nameSource") != 1)
        {
          objc_msgSend(v198, "setEffectiveNameSource:", 1);
          objc_msgSend(v198, "setConfirmedFaceCropGenerationState:", 1);
        }
        if (objc_msgSend(v201, "nameSource") != 1)
        {
          objc_msgSend(v201, "setEffectiveNameSource:", 1);
          objc_msgSend(v201, "setConfirmedFaceCropGenerationState:", 1);
        }
      }
    }
    else
    {

      v183 = v198;
      v9 = v200;
      v45 = v188;
    }

    LODWORD(v48) = 1;
  }
  else
  {
    v45 = v188;
  }
LABEL_25:

  if (!(_DWORD)v48)
  {
    v8 = v210;
    a5 = v202;
LABEL_77:
    if (a5)
    {
      v16 = objc_retainAutorelease(v16);
      v101 = 0;
      *a5 = v16;
    }
    else
    {
      v101 = 0;
    }
    goto LABEL_80;
  }
  v195 = v16;
  v8 = v210;
  if (self->_userFeedback)
  {
    -[NSMutableArray userFeedbacks](v210, "userFeedbacks");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "_pl_filter:", &__block_literal_global_21747);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D71BB0], "newestUserFeedbackInSet:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v51)
    {
      v52 = (void *)MEMORY[0x1E0D71BB0];
      -[NSMutableArray photoLibrary](v210, "photoLibrary");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "managedObjectContext");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHUserFeedback uuid](self->_userFeedback, "uuid");
      v55 = v11;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "insertIntoManagedObjectContext:withUUID:", v54, v56);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v55;
      objc_msgSend(v51, "setPerson:", v210);
    }
    objc_msgSend(v51, "setType:", (__int16)-[PHUserFeedback type](self->_userFeedback, "type"));
    objc_msgSend(v51, "setFeature:", (__int16)-[PHUserFeedback feature](self->_userFeedback, "feature"));
    -[PHUserFeedback context](self->_userFeedback, "context");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setContext:", v57);

    -[PHUserFeedback lastModifiedDate](self->_userFeedback, "lastModifiedDate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setLastModifiedDate:", v58);

  }
  if (self->_didUnsetUserFeedback)
  {
    v225 = 0u;
    v226 = 0u;
    v223 = 0u;
    v224 = 0u;
    -[NSMutableArray userFeedbacks](v210, "userFeedbacks");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v223, v253, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v224;
      do
      {
        for (m = 0; m != v61; ++m)
        {
          if (*(_QWORD *)v224 != v62)
            objc_enumerationMutation(v59);
          v64 = *(void **)(*((_QWORD *)&v223 + 1) + 8 * m);
          if (!objc_msgSend(v64, "feature"))
          {
            -[NSMutableArray managedObjectContext](v210, "managedObjectContext");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "deleteObject:", v64);

          }
        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v223, v253, 16);
      }
      while (v61);
    }

  }
  if (self->_autonamingUserFeedbacks)
  {
    v189 = v11;
    v199 = v9;
    -[NSMutableArray userFeedbacks](v210, "userFeedbacks");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "_pl_filter:", &__block_literal_global_117);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void *)objc_msgSend(v67, "mutableCopy");

    v221 = 0u;
    v222 = 0u;
    v219 = 0u;
    v220 = 0u;
    obja = self->_autonamingUserFeedbacks;
    v69 = -[NSSet countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v219, v252, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v220;
      do
      {
        for (n = 0; n != v70; ++n)
        {
          if (*(_QWORD *)v220 != v71)
            objc_enumerationMutation(obja);
          v73 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * n);
          v74 = (void *)MEMORY[0x1E0D71BB0];
          objc_msgSend(v73, "uuid");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray photoLibrary](v8, "photoLibrary");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "managedObjectContext");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "userFeedbackWithUUID:inManagedObjectContext:", v75, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          v8 = v210;
          if (!v78)
          {
            v79 = (void *)MEMORY[0x1E0D71BB0];
            -[NSMutableArray photoLibrary](v210, "photoLibrary");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "managedObjectContext");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "uuid");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "insertIntoManagedObjectContext:withUUID:", v81, v82);
            v78 = (void *)objc_claimAutoreleasedReturnValue();

            v8 = v210;
            objc_msgSend(v78, "setPerson:", v210);
          }
          objc_msgSend(v78, "setType:", (__int16)objc_msgSend(v73, "type"));
          objc_msgSend(v78, "setFeature:", (__int16)objc_msgSend(v73, "feature"));
          objc_msgSend(v73, "context");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setContext:", v83);

          objc_msgSend(v73, "lastModifiedDate");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setLastModifiedDate:", v84);

          objc_msgSend(v68, "removeObject:", v78);
        }
        v70 = -[NSSet countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v219, v252, 16);
      }
      while (v70);
    }

    v217 = 0u;
    v218 = 0u;
    v215 = 0u;
    v216 = 0u;
    v85 = v68;
    v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v215, v251, 16);
    v9 = v199;
    v11 = v189;
    if (v86)
    {
      v87 = v86;
      v88 = *(_QWORD *)v216;
      do
      {
        for (ii = 0; ii != v87; ++ii)
        {
          if (*(_QWORD *)v216 != v88)
            objc_enumerationMutation(v85);
          v90 = *(_QWORD *)(*((_QWORD *)&v215 + 1) + 8 * ii);
          -[NSMutableArray managedObjectContext](v8, "managedObjectContext");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "deleteObject:", v90);

        }
        v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v215, v251, 16);
      }
      while (v87);
    }

    self = v209;
  }
  if (self->_didUnsetAutonamingUserFeedbacks)
  {
    v213 = 0u;
    v214 = 0u;
    v211 = 0u;
    v212 = 0u;
    -[NSMutableArray userFeedbacks](v8, "userFeedbacks");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v211, v250, 16);
    if (v93)
    {
      v94 = v93;
      v95 = *(_QWORD *)v212;
      do
      {
        for (jj = 0; jj != v94; ++jj)
        {
          if (*(_QWORD *)v212 != v95)
            objc_enumerationMutation(v92);
          v97 = *(void **)(*((_QWORD *)&v211 + 1) + 8 * jj);
          if (objc_msgSend(v97, "feature") == 1 || objc_msgSend(v97, "feature") == 2)
          {
            -[NSMutableArray managedObjectContext](v8, "managedObjectContext");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "deleteObject:", v97);

          }
        }
        v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v211, v250, 16);
      }
      while (v94);
    }

    self = v209;
  }
  searchEntityRelationsToSet = self->_searchEntityRelationsToSet;
  if (searchEntityRelationsToSet)
    objc_msgSend(MEMORY[0x1E0D71AC0], "setPersonRelationsFromDictionaries:onPerson:", searchEntityRelationsToSet, v8);
  searchEntityRelationsToRemove = self->_searchEntityRelationsToRemove;
  if (searchEntityRelationsToRemove)
    objc_msgSend(MEMORY[0x1E0D71AC0], "removePersonRelationsMatchingDictionaries:onPerson:", searchEntityRelationsToRemove, v8);
  v101 = 1;
  v16 = v195;
LABEL_80:

  return v101;
}

- (BOOL)_ensureModelConsistencyForVerifiedTypePromotion:(id)a3 originalVerifiedType:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v6 = *(_QWORD *)&a4;
  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "keyFace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (!(_DWORD)v6)
      objc_msgSend(v7, "disconnectFaceGroup");
    if (objc_msgSend(v7, "verifiedType") == 2)
    {
      objc_msgSend(v8, "setEffectiveNameSource:", 5);
      objc_msgSend(v8, "setConfirmedFaceCropGenerationState:", 1);
    }
    else if (objc_msgSend(v7, "verifiedType") == 1)
    {
      objc_msgSend(v7, "setKeyFacePickSource:", 1);
      if (objc_msgSend(v8, "nameSource") != 1)
      {
        objc_msgSend(v8, "setEffectiveNameSource:", 1);
        objc_msgSend(v8, "setConfirmedFaceCropGenerationState:", 1);
      }
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v7, "detectedFaces");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v38 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            if (objc_msgSend(v24, "nameSource") == 5)
              objc_msgSend(v24, "setEffectiveNameSource:", 0);
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v21);
      }

      objc_msgSend(v7, "managedObjectContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v7, "faceCrops");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v34 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
            if (objc_msgSend(v31, "type") == 5)
              objc_msgSend(v25, "deleteObject:", v31);
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v28);
      }

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "personUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("keyFace is nil for person %@ being promoted from %d to %d. Unable to request face crop generation."), v10, v6, objc_msgSend(v7, "verifiedType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v46 = v11;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D74498];
    v43 = *MEMORY[0x1E0CB2938];
    v44 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 73001, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    PHErrorFromPLError(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a5)
      *a5 = objc_retainAutorelease(v17);

  }
  return v8 != 0;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  int v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = -[PHPersonChangeRequest detectionType](self, "detectionType", a3);
  v6 = v5;
  if (a4 && v5 == 2)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2938];
    v11[0] = CFSTR("PHDetectionTypePet is not a valid value to assign to PHPerson.detectionType");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3111, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6 != 2;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
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
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PHChangeRequest helper](self, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mutations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("verifiedType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "intValue");
  else
    v10 = 0;
  v11 = (void *)MEMORY[0x1E0D71940];
  objc_msgSend(v6, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest uuid](self, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertIntoManagedObjectContext:withPersonUUID:fullName:verifiedType:", v12, v13, &stru_1E35DFFF8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v14)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create person"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)_existentFaceObjectIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PHPersonChangeRequest targetPerson](self, "targetPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PHChangeRequest photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setIsExclusivePredicate:", 1);
    objc_msgSend(v5, "setIncludeTorsoAndFaceDetectionData:", 1);
    -[PHPersonChangeRequest targetPerson](self, "targetPerson");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForFacesForPerson:options:](PHQuery, "queryForFacesForPerson:options:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:](PHRelationshipChangeRequestHelper, "existentObjectIDsUsingQuery:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_existentTemporalFaceObjectIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PHPersonChangeRequest targetPerson](self, "targetPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PHChangeRequest photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setIsExclusivePredicate:", 1);
    objc_msgSend(v5, "setIncludeMediaAnalysisProcessingRangeTypes:", 2);
    objc_msgSend(v5, "setIncludeTorsoAndFaceDetectionData:", 1);
    -[PHPersonChangeRequest targetPerson](self, "targetPerson");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForFacesForPerson:options:](PHQuery, "queryForFacesForPerson:options:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:](PHRelationshipChangeRequestHelper, "existentObjectIDsUsingQuery:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_existentRejectedFaceObjectIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PHPersonChangeRequest targetPerson](self, "targetPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PHChangeRequest photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setIsExclusivePredicate:", 1);
    objc_msgSend(v5, "setIncludeTorsoAndFaceDetectionData:", 1);
    -[PHPersonChangeRequest targetPerson](self, "targetPerson");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForRejectedFacesOnPerson:options:](PHQuery, "queryForRejectedFacesOnPerson:options:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:](PHRelationshipChangeRequestHelper, "existentObjectIDsUsingQuery:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_noLimitsPersonFetchOptions
{
  void *v2;
  void *v3;

  -[PHChangeRequest photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setMinimumUnverifiedFaceCount:", 0);
  objc_msgSend(v3, "setMinimumVerifiedFaceCount:", 0);
  objc_msgSend(v3, "setIncludedDetectionTypes:", &unk_1E3657390);
  return v3;
}

- (id)_existentMergeCandidateObjectIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PHPersonChangeRequest targetPerson](self, "targetPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PHPersonChangeRequest targetPerson](self, "targetPerson");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPersonChangeRequest _noLimitsPersonFetchOptions](self, "_noLimitsPersonFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForMergeCandidatePersonsForPerson:options:](PHQuery, "queryForMergeCandidatePersonsForPerson:options:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:](PHRelationshipChangeRequestHelper, "existentObjectIDsUsingQuery:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_existentMergeCandidateWithConfidenceObjectIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PHPersonChangeRequest targetPerson](self, "targetPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PHPersonChangeRequest targetPerson](self, "targetPerson");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPersonChangeRequest _noLimitsPersonFetchOptions](self, "_noLimitsPersonFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForMergeCandidateWithConfidencePersonsForPerson:options:](PHQuery, "queryForMergeCandidateWithConfidencePersonsForPerson:options:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:](PHRelationshipChangeRequestHelper, "existentObjectIDsUsingQuery:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_existentInvalidMergeCandidateObjectIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PHPersonChangeRequest targetPerson](self, "targetPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PHPersonChangeRequest targetPerson](self, "targetPerson");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPersonChangeRequest _noLimitsPersonFetchOptions](self, "_noLimitsPersonFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForInvalidMergeCandidatePersonsForPerson:options:](PHQuery, "queryForInvalidMergeCandidatePersonsForPerson:options:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:](PHRelationshipChangeRequestHelper, "existentObjectIDsUsingQuery:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_prepareKeyFaceHelperIfNeeded
{
  void *v3;
  void *v4;
  PHRelationshipChangeRequestHelper *keyFaceHelper;
  void *v6;
  id v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_keyFaceHelper, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_keyFaceHelper, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_keyFaceHelper, "mutableObjectIDsAndUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    keyFaceHelper = self->_keyFaceHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](keyFaceHelper, "originalObjectIDs");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](keyFaceHelper, "setMutableObjectIDsAndUUIDs:", v6);

  }
}

- (id)_mutableFaceObjectIDsAndUUIDs
{
  PHRelationshipChangeRequestHelper *detectedFacesHelper;
  void *v4;

  detectedFacesHelper = self->_detectedFacesHelper;
  -[PHPersonChangeRequest _existentFaceObjectIDs](self, "_existentFaceObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHRelationshipChangeRequestHelper prepareIfNeededWithExistentObjectIDs:](detectedFacesHelper, "prepareIfNeededWithExistentObjectIDs:", v4);

  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_detectedFacesHelper, "mutableObjectIDsAndUUIDs");
}

- (id)_mutableTemporalFaceObjectIDsAndUUIDs
{
  PHRelationshipChangeRequestHelper *temporalFacesHelper;
  void *v4;

  temporalFacesHelper = self->_temporalFacesHelper;
  -[PHPersonChangeRequest _existentTemporalFaceObjectIDs](self, "_existentTemporalFaceObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHRelationshipChangeRequestHelper prepareIfNeededWithExistentObjectIDs:](temporalFacesHelper, "prepareIfNeededWithExistentObjectIDs:", v4);

  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_temporalFacesHelper, "mutableObjectIDsAndUUIDs");
}

- (id)_mutableKeyFaceObjectIDsAndUUIDs
{
  -[PHPersonChangeRequest _prepareKeyFaceHelperIfNeeded](self, "_prepareKeyFaceHelperIfNeeded");
  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_keyFaceHelper, "mutableObjectIDsAndUUIDs");
}

- (id)_mutableRejectedFacesObjectIDsAndUUIDs
{
  PHRelationshipChangeRequestHelper *rejectedFacesHelper;
  void *v4;

  rejectedFacesHelper = self->_rejectedFacesHelper;
  -[PHPersonChangeRequest _existentRejectedFaceObjectIDs](self, "_existentRejectedFaceObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHRelationshipChangeRequestHelper prepareIfNeededWithExistentObjectIDs:](rejectedFacesHelper, "prepareIfNeededWithExistentObjectIDs:", v4);

  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_rejectedFacesHelper, "mutableObjectIDsAndUUIDs");
}

- (id)_mutableMergeCandidateObjectIDsAndUUIDs
{
  PHRelationshipChangeRequestHelper *mergeCandidatesHelper;
  void *v4;

  mergeCandidatesHelper = self->_mergeCandidatesHelper;
  -[PHPersonChangeRequest _existentMergeCandidateObjectIDs](self, "_existentMergeCandidateObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHRelationshipChangeRequestHelper prepareIfNeededWithExistentObjectIDs:](mergeCandidatesHelper, "prepareIfNeededWithExistentObjectIDs:", v4);

  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_mergeCandidatesHelper, "mutableObjectIDsAndUUIDs");
}

- (id)_mutableMergeCandidateWithConfidenceObjectIDsAndUUIDs
{
  PHRelationshipChangeRequestHelper *mergeCandidatesWithConfidenceHelper;
  void *v4;

  mergeCandidatesWithConfidenceHelper = self->_mergeCandidatesWithConfidenceHelper;
  -[PHPersonChangeRequest _existentMergeCandidateWithConfidenceObjectIDs](self, "_existentMergeCandidateWithConfidenceObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHRelationshipChangeRequestHelper prepareIfNeededWithExistentObjectIDs:](mergeCandidatesWithConfidenceHelper, "prepareIfNeededWithExistentObjectIDs:", v4);

  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_mergeCandidatesWithConfidenceHelper, "mutableObjectIDsAndUUIDs");
}

- (id)_mutableInvalidMergeCandidateObjectIDsAndUUIDs
{
  PHRelationshipChangeRequestHelper *invalidMergeCandidatesHelper;
  void *v4;

  invalidMergeCandidatesHelper = self->_invalidMergeCandidatesHelper;
  -[PHPersonChangeRequest _existentInvalidMergeCandidateObjectIDs](self, "_existentInvalidMergeCandidateObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHRelationshipChangeRequestHelper prepareIfNeededWithExistentObjectIDs:](invalidMergeCandidatesHelper, "prepareIfNeededWithExistentObjectIDs:", v4);

  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_invalidMergeCandidatesHelper, "mutableObjectIDsAndUUIDs");
}

- (id)_mutableRequiringFaceCropGenerationFacesUUIDs
{
  NSMutableSet *faceUUIDsRequiringFaceCropGeneration;
  NSMutableSet *v4;
  NSMutableSet *v5;

  faceUUIDsRequiringFaceCropGeneration = self->_faceUUIDsRequiringFaceCropGeneration;
  if (!faceUUIDsRequiringFaceCropGeneration)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = self->_faceUUIDsRequiringFaceCropGeneration;
    self->_faceUUIDsRequiringFaceCropGeneration = v4;

    faceUUIDsRequiringFaceCropGeneration = self->_faceUUIDsRequiringFaceCropGeneration;
  }
  return faceUUIDsRequiringFaceCropGeneration;
}

- (id)_mutableRequiringNewUnverifiedPersonFacesUUIDs
{
  NSMutableSet *faceUUIDsRequiringNewUnverifiedPerson;
  NSMutableSet *v4;
  NSMutableSet *v5;

  faceUUIDsRequiringNewUnverifiedPerson = self->_faceUUIDsRequiringNewUnverifiedPerson;
  if (!faceUUIDsRequiringNewUnverifiedPerson)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = self->_faceUUIDsRequiringNewUnverifiedPerson;
    self->_faceUUIDsRequiringNewUnverifiedPerson = v4;

    faceUUIDsRequiringNewUnverifiedPerson = self->_faceUUIDsRequiringNewUnverifiedPerson;
  }
  return faceUUIDsRequiringNewUnverifiedPerson;
}

- (void)_addObjectIDsOfFaces:(id)a3 toFaceIDs:(id)a4 temporalIDs:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v23;
    *(_QWORD *)&v11 = 138543362;
    v21 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        PLObjectIDOrUUIDFromPHObject(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "duration");
          if (v17 <= 0.0)
            v18 = v8;
          else
            v18 = v9;
        }
        else
        {
          PLPhotoKitGetLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v16, "description");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v21;
            v27 = v20;
            _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_DEFAULT, "PHPersonChangeRequest assuming object is a normal face: %{public}@", buf, 0xCu);

          }
          v18 = v8;
        }
        objc_msgSend(v18, "addObject:", v16, v21);

      }
      v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v12);
  }

}

- (void)addFaces:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v9 = objc_alloc_init(v4);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PHPersonChangeRequest _addObjectIDsOfFaces:toFaceIDs:temporalIDs:](self, "_addObjectIDsOfFaces:toFaceIDs:temporalIDs:", v5, v9, v6);

  if (objc_msgSend(v9, "count"))
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHPersonChangeRequest _mutableFaceObjectIDsAndUUIDs](self, "_mutableFaceObjectIDsAndUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v9);

  }
  if (objc_msgSend(v6, "count"))
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHPersonChangeRequest _mutableTemporalFaceObjectIDsAndUUIDs](self, "_mutableTemporalFaceObjectIDsAndUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v6);

  }
}

- (BOOL)_removeObjects:(id)a3 fromArray:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count")
    && (v8 = objc_msgSend(v7, "count"), objc_msgSend(v7, "removeObjectsInArray:", v6), objc_msgSend(v7, "count") < v8))
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)removeFaces:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint8_t v13[16];

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PHPersonChangeRequest _addObjectIDsOfFaces:toFaceIDs:temporalIDs:](self, "_addObjectIDsOfFaces:toFaceIDs:temporalIDs:", v5, v6, v7);

  if (objc_msgSend(v6, "count"))
  {
    -[PHPersonChangeRequest _mutableFaceObjectIDsAndUUIDs](self, "_mutableFaceObjectIDsAndUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PHPersonChangeRequest _removeObjects:fromArray:](self, "_removeObjects:fromArray:", v6, v8);

  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(v7, "count"))
  {
    -[PHPersonChangeRequest _mutableTemporalFaceObjectIDsAndUUIDs](self, "_mutableTemporalFaceObjectIDsAndUUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PHPersonChangeRequest _removeObjects:fromArray:](self, "_removeObjects:fromArray:", v7, v10);

  }
  else
  {
    v11 = 0;
  }
  if (!v9 && !v11)
  {
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "PHPersonChangeRequest removeFaces: nothing removed", v13, 2u);
    }

  }
}

- (void)addTemporalFaces:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHPersonChangeRequest _mutableTemporalFaceObjectIDsAndUUIDs](self, "_mutableTemporalFaceObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
}

- (void)removeTemporalFaces:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHPersonChangeRequest _mutableTemporalFaceObjectIDsAndUUIDs](self, "_mutableTemporalFaceObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsInArray:", v5);

  }
}

- (void)setTemporalFaces:(id)a3
{
  uint64_t v4;
  PHRelationshipChangeRequestHelper *temporalFacesHelper;
  void *v6;
  PHRelationshipChangeRequestHelper *v7;
  void *v8;
  id v9;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = MEMORY[0x1E0C9AA60];
  v9 = (id)v4;
  -[PHChangeRequest didMutate](self, "didMutate");
  temporalFacesHelper = self->_temporalFacesHelper;
  -[PHPersonChangeRequest _existentTemporalFaceObjectIDs](self, "_existentTemporalFaceObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHRelationshipChangeRequestHelper prepareIfNeededWithExistentObjectIDs:](temporalFacesHelper, "prepareIfNeededWithExistentObjectIDs:", v6);

  v7 = self->_temporalFacesHelper;
  v8 = (void *)objc_msgSend(v9, "mutableCopy");
  -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](v7, "setMutableObjectIDsAndUUIDs:", v8);

}

- (void)_setKeyFace:(id)a3 forCluster:(BOOL)a4 pickSource:(signed __int16)a5
{
  uint64_t v5;
  _BOOL4 v6;
  id v9;
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
  _QWORD v22[2];

  v5 = a5;
  v6 = a4;
  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (!v9)
      goto LABEL_10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPersonChangeRequest.m"), 1075, CFSTR("keyFace has incorrect class: %@"), v9);

    if (!v9)
      goto LABEL_10;
  }
  -[PHChangeRequest didMutate](self, "didMutate");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLObjectIDOrUUIDFromPHObject(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);
  v12 = (void *)MEMORY[0x1E0C99E20];
  -[PHPersonChangeRequest _existentFaceObjectIDs](self, "_existentFaceObjectIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_detectedFacesHelper, "mutableObjectIDsAndUUIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unionSet:", v16);

  }
  if ((objc_msgSend(v14, "containsObject:", v11) & 1) == 0)
  {
    v22[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPersonChangeRequest addFaces:](self, "addFaces:", v17);

  }
  if (v10)
  {
    -[PHPersonChangeRequest _mutableKeyFaceObjectIDsAndUUIDs](self, "_mutableKeyFaceObjectIDsAndUUIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObjectsFromArray:", v10);

  }
LABEL_10:
  if (v6)
  {
    -[PHPersonChangeRequest _mutableRequiringFaceCropGenerationFacesUUIDs](self, "_mutableRequiringFaceCropGenerationFacesUUIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v20);

  }
  -[PHPersonChangeRequest setKeyFacePickSource:](self, "setKeyFacePickSource:", v5);

}

- (void)setKeyFaceForUserPick:(id)a3
{
  -[PHPersonChangeRequest setKeyFaceForUserPick:forCluster:](self, "setKeyFaceForUserPick:forCluster:", a3, 1);
}

- (void)setKeyFaceForUserPick:(id)a3 forCluster:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[PHPersonChangeRequest setVerifiedType:](self, "setVerifiedType:", 1);
  -[PHPersonChangeRequest _setKeyFace:forCluster:pickSource:](self, "_setKeyFace:forCluster:pickSource:", v6, v4, 1);

}

- (void)setKeyFace:(id)a3 forCluster:(BOOL)a4
{
  -[PHPersonChangeRequest _setKeyFace:forCluster:pickSource:](self, "_setKeyFace:forCluster:pickSource:", a3, a4, 0);
}

- (void)addRejectedFaces:(id)a3 forCluster:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  PHPersonChangeRequest *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v4 = a4;
  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHPersonChangeRequest _mutableRejectedFacesObjectIDsAndUUIDs](self, "_mutableRejectedFacesObjectIDsAndUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v7);

  }
  v32 = (void *)v7;
  -[PHPersonChangeRequest removeFaces:](self, "removeFaces:", v6);
  if (v4)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          -[PHPersonChangeRequest _mutableRequiringFaceCropGenerationFacesUUIDs](self, "_mutableRequiringFaceCropGenerationFacesUUIDs");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v16);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
      }
      while (v11);
    }

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v36;
    v33 = v17;
    v34 = self;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = v22;
          if (objc_msgSend(v23, "isTorsoOnly"))
          {
            PLPhotoKitGetLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v23, "uuid");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[PHPersonChangeRequest targetPerson](v34, "targetPerson");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "uuid");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
              v28 = v20;
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v44 = v25;
              v45 = 2114;
              v46 = v27;
              v47 = 2112;
              v48 = v29;
              _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_ERROR, "Warning: rejecting torso-only face %{public}@ for person %{public}@ is not cloud-syncable. Call stack: %@", buf, 0x20u);

              v20 = v28;
              v17 = v33;
              self = v34;
            }

          }
        }
        -[PHPersonChangeRequest _mutableRequiringNewUnverifiedPersonFacesUUIDs](self, "_mutableRequiringNewUnverifiedPersonFacesUUIDs");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "uuid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v31);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    }
    while (v19);
  }

}

- (void)addRejectedFaces:(id)a3
{
  -[PHPersonChangeRequest addRejectedFaces:forCluster:](self, "addRejectedFaces:forCluster:", a3, 1);
}

- (void)removeRejectedFaces:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHPersonChangeRequest _mutableRejectedFacesObjectIDsAndUUIDs](self, "_mutableRejectedFacesObjectIDsAndUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectsInArray:", v5);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        -[PHPersonChangeRequest _mutableRequiringFaceCropGenerationFacesUUIDs](self, "_mutableRequiringFaceCropGenerationFacesUUIDs", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObject:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)persistSuggestionForClient:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (a3 != 1)
  {
    if (a3 - 2 < 4)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid PHPeopleSuggestionClient enum chosen to persist"), 0, v3, v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v5);
    }
    a3 = 0;
  }
  -[PHPersonChangeRequest setSuggestedForClientType:](self, "setSuggestedForClientType:", a3);
}

- (void)_setNominalMergeTargetUUID:(id)a3
{
  objc_storeStrong((id *)&self->_nominalMergeTargetUUID, a3);
}

- (void)mergePersons:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *personUUIDsToMerge;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_personUUIDsToMerge)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    personUUIDsToMerge = self->_personUUIDsToMerge;
    self->_personUUIDsToMerge = v5;

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = self->_personUUIDsToMerge;
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "uuid", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v12, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[PHPersonChangeRequest setVerified:](self, "setVerified:", 1);
  -[PHChangeRequest didMutate](self, "didMutate");

}

- (void)addMergeCandidatePersons:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHPersonChangeRequest _mutableMergeCandidateObjectIDsAndUUIDs](self, "_mutableMergeCandidateObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
}

- (void)removeMergeCandidatePersons:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHPersonChangeRequest _mutableMergeCandidateObjectIDsAndUUIDs](self, "_mutableMergeCandidateObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsInArray:", v5);

  }
}

- (void)rejectMergeCandidatePersons:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *rejectedMergeCandidatePersonUUIDs;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableSet *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHPersonChangeRequest addInvalidMergeCandidatePersons:](self, "addInvalidMergeCandidatePersons:", v4);
  if (!self->_rejectedMergeCandidatePersonUUIDs)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    rejectedMergeCandidatePersonUUIDs = self->_rejectedMergeCandidatePersonUUIDs;
    self->_rejectedMergeCandidatePersonUUIDs = v5;

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = self->_rejectedMergeCandidatePersonUUIDs;
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "uuid", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](v12, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)addMergeCandidateWithConfidencePersons:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHPersonChangeRequest _mutableMergeCandidateWithConfidenceObjectIDsAndUUIDs](self, "_mutableMergeCandidateWithConfidenceObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
}

- (void)removeMergeCandidateWithConfidencePersons:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHPersonChangeRequest _mutableMergeCandidateWithConfidenceObjectIDsAndUUIDs](self, "_mutableMergeCandidateWithConfidenceObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsInArray:", v5);

  }
}

- (void)addInvalidMergeCandidatePersons:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PHPersonChangeRequest removeMergeCandidatePersons:](self, "removeMergeCandidatePersons:", v4);
  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHPersonChangeRequest _mutableInvalidMergeCandidateObjectIDsAndUUIDs](self, "_mutableInvalidMergeCandidateObjectIDsAndUUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

  }
}

- (void)_setGraphDedupePersons:(id)a3
{
  id v4;
  NSMutableSet *graphDedupePersonUUIDs;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableSet *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  graphDedupePersonUUIDs = self->_graphDedupePersonUUIDs;
  if (!graphDedupePersonUUIDs)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_graphDedupePersonUUIDs;
    self->_graphDedupePersonUUIDs = v6;

    graphDedupePersonUUIDs = self->_graphDedupePersonUUIDs;
  }
  -[NSMutableSet removeAllObjects](graphDedupePersonUUIDs, "removeAllObjects");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = self->_graphDedupePersonUUIDs;
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "uuid", (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](v13, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if (-[NSMutableSet count](self->_graphDedupePersonUUIDs, "count"))
    -[PHChangeRequest didMutate](self, "didMutate");

}

- (void)addSearchEntityPersonRelationWithType:(signed __int16)a3 label:(id)a4 confidence:(double)a5 toPerson:(id)a6
{
  uint64_t v8;
  PHPersonChangeRequest *v11;
  void *v12;
  PHPersonChangeRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v8 = a3;
  v19 = a4;
  v11 = (PHPersonChangeRequest *)a6;
  if (a5 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPersonChangeRequest.m"), 1402, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("confidence"));

    if ((_DWORD)v8)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPersonChangeRequest.m"), 1403, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relationType"));

    goto LABEL_3;
  }
  if (!(_DWORD)v8)
    goto LABEL_8;
LABEL_3:
  if ((unsigned __int16)(v8 - 3) <= 0xFFFDu && !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPersonChangeRequest.m"), 1404, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relatedPerson || (relationType == PLSearchEntityPersonRelationTypeMe || relationType == PLSearchEntityPersonRelationTypeSelf)"));

    v12 = (void *)MEMORY[0x1E0D71AC0];
    goto LABEL_10;
  }
  v12 = (void *)MEMORY[0x1E0D71AC0];
  if (!v11)
  {
LABEL_10:
    v13 = self;
    goto LABEL_11;
  }
  v13 = v11;
LABEL_11:
  -[PHChangeRequest uuid](v13, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personRelationDictionaryForRelationWithType:label:confidence:relatedPersonUUID:", v8, v19, v17, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_searchEntityRelationsToSet, "addObject:", v18);
  -[PHChangeRequest didMutate](self, "didMutate");

}

- (void)removeSearchEntityPersonRelationType:(signed __int16)a3 toPerson:(id)a4
{
  uint64_t v4;
  PHPersonChangeRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PHPersonChangeRequest *v13;

  v4 = a3;
  v7 = (PHPersonChangeRequest *)a4;
  v13 = v7;
  if ((_DWORD)v4)
  {
    if (v7)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPersonChangeRequest.m"), 1411, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relationType"));

    v7 = v13;
    if (v13)
      goto LABEL_4;
  }
  if ((unsigned __int16)(v4 - 3) <= 0xFFFDu)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPersonChangeRequest.m"), 1412, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relatedPerson || (relationType == PLSearchEntityPersonRelationTypeMe || relationType == PLSearchEntityPersonRelationTypeSelf)"));

    v8 = (void *)MEMORY[0x1E0D71AC0];
    goto LABEL_5;
  }
LABEL_4:
  v8 = (void *)MEMORY[0x1E0D71AC0];
  if (!v7)
LABEL_5:
    v7 = self;
  -[PHChangeRequest uuid](v7, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personRelationDictionaryForRelationWithType:label:confidence:relatedPersonUUID:", v4, 0, v9, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_searchEntityRelationsToRemove, "addObject:", v10);
  -[PHChangeRequest didMutate](self, "didMutate");

}

- (PHPerson)targetPerson
{
  return self->_targetPerson;
}

- (void)setTargetPerson:(id)a3
{
  objc_storeStrong((id *)&self->_targetPerson, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (PHUserFeedback)userFeedback
{
  return self->_userFeedback;
}

- (NSSet)autonamingUserFeedbacks
{
  return self->_autonamingUserFeedbacks;
}

- (PHRelationshipChangeRequestHelper)detectedFacesHelper
{
  return self->_detectedFacesHelper;
}

- (PHRelationshipChangeRequestHelper)temporalFacesHelper
{
  return self->_temporalFacesHelper;
}

- (PHRelationshipChangeRequestHelper)keyFaceHelper
{
  return self->_keyFaceHelper;
}

- (PHRelationshipChangeRequestHelper)rejectedFacesHelper
{
  return self->_rejectedFacesHelper;
}

- (PHRelationshipChangeRequestHelper)mergeCandidatesHelper
{
  return self->_mergeCandidatesHelper;
}

- (PHRelationshipChangeRequestHelper)mergeCandidatesWithConfidenceHelper
{
  return self->_mergeCandidatesWithConfidenceHelper;
}

- (PHRelationshipChangeRequestHelper)invalidMergeCandidatesHelper
{
  return self->_invalidMergeCandidatesHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidMergeCandidatesHelper, 0);
  objc_storeStrong((id *)&self->_mergeCandidatesWithConfidenceHelper, 0);
  objc_storeStrong((id *)&self->_mergeCandidatesHelper, 0);
  objc_storeStrong((id *)&self->_rejectedFacesHelper, 0);
  objc_storeStrong((id *)&self->_keyFaceHelper, 0);
  objc_storeStrong((id *)&self->_temporalFacesHelper, 0);
  objc_storeStrong((id *)&self->_detectedFacesHelper, 0);
  objc_storeStrong((id *)&self->_autonamingUserFeedbacks, 0);
  objc_storeStrong((id *)&self->_userFeedback, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_targetPerson, 0);
  objc_storeStrong((id *)&self->_searchEntityRelationsToRemove, 0);
  objc_storeStrong((id *)&self->_searchEntityRelationsToSet, 0);
  objc_storeStrong((id *)&self->_faceUUIDsRequiringNewUnverifiedPerson, 0);
  objc_storeStrong((id *)&self->_graphDedupePersonUUIDs, 0);
  objc_storeStrong((id *)&self->_rejectedMergeCandidatePersonUUIDs, 0);
  objc_storeStrong((id *)&self->_faceUUIDsRequiringFaceCropGeneration, 0);
  objc_storeStrong((id *)&self->_nominalMergeTargetUUID, 0);
  objc_storeStrong((id *)&self->_personUUIDsToMerge, 0);
}

BOOL __74__PHPersonChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "feature") == 1 || objc_msgSend(v2, "feature") == 2;

  return v3;
}

BOOL __74__PHPersonChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "feature") == 0;
}

uint64_t __69__PHPersonChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setMutated:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "recordUpdateRequest:", *(_QWORD *)(a1 + 32));
}

+ (id)creationRequestForPerson
{
  return -[PHPersonChangeRequest initForNewObject]([PHPersonChangeRequest alloc], "initForNewObject");
}

+ (id)changeRequestForPerson:(id)a3
{
  id v3;
  void *v4;

  if (a3)
  {
    v3 = a3;
    +[PHChangeRequestHelper changeRequestForObject:](PHChangeRequestHelper, "changeRequestForObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTargetPerson:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (void)deletePersons:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:ofType:forSelector:](PHPersonDeleteRequest, "deleteRequestsForObjects:ofType:forSelector:", v5, objc_opt_class(), a2);

}

+ (id)changeRequestForMergingPersons:(id)a3
{
  return (id)objc_msgSend(a1, "changeRequestForMergingPersons:nominalTargetIdentifier:", a3, 0);
}

+ (id)changeRequestForMergingPersons:(id)a3 nominalTargetIdentifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v25;
  id v26;
  id obj;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v25 = a1;
  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[PHPerson personToKeepForCloudConsistencyFromPersons:](PHPerson, "personToKeepForCloudConsistencyFromPersons:", v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v12, "localIdentifier", v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v6;
        v15 = objc_msgSend(v13, "isEqualToString:", v6);

        objc_msgSend(v12, "localIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if ((v18 & 1) == 0)
          objc_msgSend(v26, "addObject:", v12);
        v9 |= v15;
        v6 = v14;
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (v6 && (v9 & 1) == 0)
  {
    PLPhotoKitGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v6;
      _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Attempting to merge persons with a nominal target identifier (%@) that does not match any of the persons being merged", buf, 0xCu);
    }

  }
  if (v28 && objc_msgSend(v26, "count"))
  {
    objc_msgSend(v25, "changeRequestForPerson:", v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v6)
    {
      +[PHObject uuidFromLocalIdentifier:](PHPerson, "uuidFromLocalIdentifier:", v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_setNominalMergeTargetUUID:", v22);

    }
    else
    {
      objc_msgSend(v20, "_setNominalMergeTargetUUID:", 0);
    }
    objc_msgSend(v21, "mergePersons:", v26, v25);
  }
  else
  {
    PLPhotoKitGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = obj;
      _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "Merging persons requires a valid merge target and at least 1 person to merge: %@", buf, 0xCu);
    }

    v21 = 0;
  }

  return v21;
}

+ (id)changeRequestsForMergeCandidatePersons:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
        +[PHPersonChangeRequest changeRequestForPerson:](PHPersonChangeRequest, "changeRequestForPerson:", v16, (_QWORD)v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v11, "mutableCopy");
        objc_msgSend(v18, "removeObject:", v16);
        objc_msgSend(v17, "addMergeCandidatePersons:", v18);
        objc_msgSend(v4, "addObject:", v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v4, "count"))
    v19 = v4;
  else
    v19 = (void *)MEMORY[0x1E0C9AA60];
  v20 = v19;

  return v20;
}

+ (id)changeRequestForDedupingGraphPersons:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "_allPersonsAreGraphPersons:", v4))
  {
    +[PHPerson personToKeepForCloudConsistencyFromPersons:](PHPerson, "personToKeepForCloudConsistencyFromPersons:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          if (v5 != *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11))
            objc_msgSend(v6, "addObject:", (_QWORD)v14);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(a1, "changeRequestForPerson:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setGraphDedupePersons:", v6);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)changeRequestForDedupingGraphPersons:(id)a3 withUserVerifiedPerson:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(a1, "_allPersonsAreGraphPersons:", v6))
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "verifiedType") != 1)
  {
    PLPhotoKitGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2048;
      v15 = objc_msgSend(v7, "verifiedType");
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Expected user-verified person for deduping but got person %{public}@ verifiedType %td", (uint8_t *)&v12, 0x16u);

    }
    goto LABEL_7;
  }
  objc_msgSend(a1, "changeRequestForPerson:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setGraphDedupePersons:", v6);
LABEL_8:

  return v8;
}

+ (BOOL)_allPersonsAreGraphPersons:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (!v4)
  {
    v9 = 1;
    goto LABEL_17;
  }
  v5 = v4;
  v6 = *(_QWORD *)v14;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        PLPhotoKitGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "found non-PHPerson in collection", buf, 2u);
        }
        goto LABEL_16;
      }
      if (objc_msgSend(v8, "verifiedType", (_QWORD)v13) != 2)
      {
        PLPhotoKitGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "uuid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v18 = v11;
          _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "found non-graph-verified PHPerson %{public}@ in collection", buf, 0xCu);

        }
LABEL_16:

        v9 = 0;
        goto LABEL_17;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    v9 = 1;
    if (v5)
      continue;
    break;
  }
LABEL_17:

  return v9;
}

@end
