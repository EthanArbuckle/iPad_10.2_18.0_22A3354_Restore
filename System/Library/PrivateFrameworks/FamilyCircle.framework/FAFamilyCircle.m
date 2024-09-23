@implementation FAFamilyCircle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMembersFooterLabel, 0);
  objc_storeStrong((id *)&self->_addMemberButtonLabel, 0);
  objc_storeStrong((id *)&self->__serverResponse, 0);
  objc_storeStrong((id *)&self->_remoteGuardianPerson, 0);
  objc_storeStrong((id *)&self->_cloudKitProperties, 0);
  objc_storeStrong((id *)&self->_eligibilityRequirements, 0);
  objc_storeStrong((id *)&self->_checklistRankingVersion, 0);
  objc_storeStrong((id *)&self->_checklistRankingBucketType, 0);
  objc_storeStrong((id *)&self->_familyID, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_invites, 0);
  objc_storeStrong((id *)&self->_pendingMembersWithAllStatues, 0);
  objc_storeStrong((id *)&self->_pendingMembers, 0);
  objc_storeStrong((id *)&self->_allowedSubscriptions, 0);
  objc_storeStrong((id *)&self->_childCutOffAge, 0);
  objc_storeStrong((id *)&self->_members, 0);
}

- (FAFamilyCircle)initWithServerResponse:(id)a3
{
  id v5;
  char *v6;
  FAFamilyCircle *v7;
  void *v8;
  uint64_t v9;
  NSString *familyID;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  FAFamilyMember *v20;
  void *v21;
  uint64_t v22;
  NSArray *members;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  FAFamilyMember *v31;
  void *v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  NSObject *v39;
  FAFamilyMember *v40;
  FAFamilyMember *remoteGuardianPerson;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  FAFamilyCloudKitProperties *v46;
  FAFamilyCloudKitProperties *cloudKitProperties;
  void *v48;
  void *v49;
  FAEligibilityRequirements *v50;
  FAEligibilityRequirements *eligibilityRequirements;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  int64_t ageCategory;
  void *v58;
  int v59;
  void *v60;
  uint64_t v61;
  NSString *childCutOffAge;
  void *v63;
  uint64_t v64;
  NSString *addMemberButtonLabel;
  uint64_t v66;
  NSString *familyMembersFooterLabel;
  void *v68;
  uint64_t v69;
  NSArray *allowedSubscriptions;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  NSString *checklistRankingBucketType;
  void *v82;
  uint64_t v83;
  NSString *checklistRankingVersion;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  objc_super v106;
  uint8_t buf[4];
  void *v108;
  __int16 v109;
  int64_t v110;
  _BYTE v111[128];
  _BYTE v112[128];
  void *v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v106.receiver = self;
  v106.super_class = (Class)FAFamilyCircle;
  v6 = -[FAFamilyCircle init](&v106, sel_init);
  v7 = (FAFamilyCircle *)v6;
  if (v6)
  {
    *(_WORD *)(v6 + 9) = 257;
    objc_storeStrong((id *)v6 + 17, a3);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("family-id"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("family-id"));
      v9 = objc_claimAutoreleasedReturnValue();
      familyID = v7->_familyID;
      v7->_familyID = (NSString *)v9;

    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("memberSortOrder"), 1);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("family-members"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && objc_msgSend(v12, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      v105 = 0u;
      v92 = v13;
      v15 = v13;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v103;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v103 != v18)
              objc_enumerationMutation(v15);
            v20 = -[FAFamilyMember initWithDictionaryRepresentation:]([FAFamilyMember alloc], "initWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i));
            objc_msgSend(v14, "addObject:", v20);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
        }
        while (v17);
      }

      v113 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sortUsingDescriptors:", v21);

      v22 = objc_msgSend(v14, "copy");
      members = v7->_members;
      v7->_members = (NSArray *)v22;

      v13 = v92;
    }
    if (_os_feature_enabled_impl())
    {
      v91 = v11;
      v93 = v13;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("person-info"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (v24 && objc_msgSend(v24, "count"))
      {
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v90 = v24;
        v26 = v24;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v99;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v99 != v29)
                objc_enumerationMutation(v26);
              v31 = -[FAFamilyMember initWithDictionaryRepresentation:]([FAFamilyMember alloc], "initWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * j));
              -[FAFamilyMember dsid](v31, "dsid");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v31, v32);

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
          }
          while (v28);
        }

        v24 = v90;
      }
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v33 = v7->_members;
      v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v95;
        do
        {
          for (k = 0; k != v35; ++k)
          {
            if (*(_QWORD *)v95 != v36)
              objc_enumerationMutation(v33);
            objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * k), "finishWith:", v25);
          }
          v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
        }
        while (v35);
      }

      v11 = v91;
      v13 = v93;
      if (!-[NSArray count](v7->_members, "count"))
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("member-guardian"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          _FALogSystem();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CAEBA000, v39, OS_LOG_TYPE_DEFAULT, "Remote guardian key found", buf, 2u);
          }

          v40 = -[FAFamilyMember initWithDictionaryRepresentation:]([FAFamilyMember alloc], "initWithDictionaryRepresentation:", v38);
          remoteGuardianPerson = v7->_remoteGuardianPerson;
          v7->_remoteGuardianPerson = v40;

          -[FAFamilyMember finishWith:](v7->_remoteGuardianPerson, "finishWith:", v25);
        }

      }
      -[FAFamilyCircle remoteGuardian](v7, "remoteGuardian");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24 && !v42)
      {
        _FALogSystem();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          -[FAFamilyCircle initWithServerResponse:].cold.1(v43);

      }
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ck-handles"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ck-handles"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = 0;
    }

    v46 = -[FAFamilyCloudKitProperties initWithDictionaryRepresentation:]([FAFamilyCloudKitProperties alloc], "initWithDictionaryRepresentation:", v45);
    cloudKitProperties = v7->_cloudKitProperties;
    v7->_cloudKitProperties = v46;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("family-recommendation-info"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("family-recommendation-info"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = 0;
    }

    v50 = -[FAEligibilityRequirements initWithDictionaryRepresentation:]([FAEligibilityRequirements alloc], "initWithDictionaryRepresentation:", v49);
    eligibilityRequirements = v7->_eligibilityRequirements;
    v7->_eligibilityRequirements = v50;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("show-location-splash-screen"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("show-location-splash-screen"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_showLocationSplashScreen = objc_msgSend(v53, "BOOLValue");

    }
    else
    {
      v7->_showLocationSplashScreen = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("age-category"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v54, "isEqualToString:", CFSTR("ADULT")))
    {
      v7->_ageCategory = 0;
    }
    else
    {
      if (objc_msgSend(v54, "isEqualToString:", CFSTR("TEEN")))
      {
        v55 = 1;
      }
      else if (objc_msgSend(v54, "isEqualToString:", CFSTR("CHILD")))
      {
        v55 = 2;
      }
      else
      {
        v55 = -1;
      }
      v7->_ageCategory = v55;
    }
    _FALogSystem();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      ageCategory = v7->_ageCategory;
      *(_DWORD *)buf = 138412546;
      v108 = v54;
      v109 = 2048;
      v110 = ageCategory;
      _os_log_impl(&dword_1CAEBA000, v56, OS_LOG_TYPE_DEFAULT, "Current user age category is %@, FAMemberType %ld", buf, 0x16u);
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("age-category-enum"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "intValue");

    v7->_ageCategoryEnum = v59;
    objc_msgSend(v5, "objectForKey:", CFSTR("family-meta-info"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("childCutOffAge"));
        v61 = objc_claimAutoreleasedReturnValue();
        childCutOffAge = v7->_childCutOffAge;
        v7->_childCutOffAge = (NSString *)v61;

        objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("add-member-enabled"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v7->_canAddMembers = objc_msgSend(v63, "BOOLValue");

        objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("add-member-label"));
        v64 = objc_claimAutoreleasedReturnValue();
        addMemberButtonLabel = v7->_addMemberButtonLabel;
        v7->_addMemberButtonLabel = (NSString *)v64;

        objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("family-members-footer"));
        v66 = objc_claimAutoreleasedReturnValue();
        familyMembersFooterLabel = v7->_familyMembersFooterLabel;
        v7->_familyMembersFooterLabel = (NSString *)v66;

        objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("allowed-apple-subscriptions"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (v68)
        {
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("allowed-apple-subscriptions"));
          v69 = objc_claimAutoreleasedReturnValue();
          allowedSubscriptions = v7->_allowedSubscriptions;
          v7->_allowedSubscriptions = (NSArray *)v69;
        }
        else
        {
          allowedSubscriptions = v7->_allowedSubscriptions;
          v7->_allowedSubscriptions = 0;
        }

        objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("show-add-member-button"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        if (v71)
        {
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("show-add-member-button"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v7->_showAddMemberButton = objc_msgSend(v72, "BOOLValue");

        }
        else
        {
          v7->_showAddMemberButton = 1;
        }
        objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("should-show-invites"));
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        if (v73)
        {
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("should-show-invites"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v7->_shouldShowInvites = objc_msgSend(v74, "BOOLValue");

        }
        else
        {
          v7->_shouldShowInvites = 0;
        }
        objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("use-rui-pages"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (v75)
        {
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("use-rui-pages"));
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v7->_showRUIPages = objc_msgSend(v76, "BOOLValue");

        }
        else
        {
          v7->_showRUIPages = 0;
        }
        objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("family-share-payment-enabled"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        if (v77)
        {
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("family-share-payment-enabled"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v7->_sharedPayementEnabled = objc_msgSend(v78, "BOOLValue");

        }
        else
        {
          v7->_sharedPayementEnabled = 0;
        }
        objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("checklist-ranking-bucket-type"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        if (v79)
        {
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("checklist-ranking-bucket-type"));
          v80 = objc_claimAutoreleasedReturnValue();
          checklistRankingBucketType = v7->_checklistRankingBucketType;
          v7->_checklistRankingBucketType = (NSString *)v80;

        }
        objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("checklist-ranking-version"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        if (v82)
        {
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("checklist-ranking-version"));
          v83 = objc_claimAutoreleasedReturnValue();
          checklistRankingVersion = v7->_checklistRankingVersion;
          v7->_checklistRankingVersion = (NSString *)v83;

        }
        v7->_shouldBadgeOrganizer = 1;
        objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("is-badging-disabled-organizer"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();

        if (v85)
        {
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("is-badging-disabled-organizer"));
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v7->_shouldBadgeOrganizer = objc_msgSend(v86, "BOOLValue") ^ 1;

        }
        v7->_shouldBadgeInvitee = 1;
        objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("is-badging-disabled-invitee"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        if (v87)
        {
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("is-badging-disabled-invitee"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v7->_shouldBadgeInvitee = objc_msgSend(v88, "BOOLValue") ^ 1;

        }
      }
    }

  }
  return v7;
}

- (FAFamilyCircle)initWithCoder:(id)a3
{
  id v4;
  FAFamilyCircle *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *members;
  uint64_t v11;
  FAFamilyCloudKitProperties *cloudKitProperties;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSDictionary *serverResponse;
  void *v21;
  void *v22;
  FAEligibilityRequirements *v23;
  FAEligibilityRequirements *eligibilityRequirements;
  uint64_t v25;
  NSString *childCutOffAge;
  uint64_t v27;
  NSString *addMemberButtonLabel;
  uint64_t v29;
  NSString *familyMembersFooterLabel;
  uint64_t v31;
  NSArray *allowedSubscriptions;
  uint64_t v33;
  NSString *familyID;
  uint64_t v35;
  NSString *checklistRankingBucketType;
  uint64_t v37;
  NSString *checklistRankingVersion;
  char v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)FAFamilyCircle;
  v5 = -[FAFamilyCircle init](&v41, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_members"));
    v9 = objc_claimAutoreleasedReturnValue();
    members = v5->_members;
    v5->_members = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_cloudKitProperties"));
    v11 = objc_claimAutoreleasedReturnValue();
    cloudKitProperties = v5->_cloudKitProperties;
    v5->_cloudKitProperties = (FAFamilyCloudKitProperties *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("__serverResponse"));
    v19 = objc_claimAutoreleasedReturnValue();
    serverResponse = v5->__serverResponse;
    v5->__serverResponse = (NSDictionary *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("family-recommendation-info"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
      v23 = v21;
    else
      v23 = objc_alloc_init(FAEligibilityRequirements);
    eligibilityRequirements = v5->_eligibilityRequirements;
    v5->_eligibilityRequirements = v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_childCutOffAge"));
    v25 = objc_claimAutoreleasedReturnValue();
    childCutOffAge = v5->_childCutOffAge;
    v5->_childCutOffAge = (NSString *)v25;

    v5->_canAddMembers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_canAddMembers"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_addMemberButtonLabel"));
    v27 = objc_claimAutoreleasedReturnValue();
    addMemberButtonLabel = v5->_addMemberButtonLabel;
    v5->_addMemberButtonLabel = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_familyMembersFooterLabel"));
    v29 = objc_claimAutoreleasedReturnValue();
    familyMembersFooterLabel = v5->_familyMembersFooterLabel;
    v5->_familyMembersFooterLabel = (NSString *)v29;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_allowedSubscriptions"));
    v31 = objc_claimAutoreleasedReturnValue();
    allowedSubscriptions = v5->_allowedSubscriptions;
    v5->_allowedSubscriptions = (NSArray *)v31;

    v5->_showAddMemberButton = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_showAddMemberButton"));
    v5->_shouldShowInvites = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldShowInvites"));
    v5->_showLocationSplashScreen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_showLocationSplashScreen"));
    v5->_showRUIPages = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_showRUIPages"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_familyID"));
    v33 = objc_claimAutoreleasedReturnValue();
    familyID = v5->_familyID;
    v5->_familyID = (NSString *)v33;

    v5->_ageCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_ageCategory"));
    v5->_sharedPayementEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_sharedPayementEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_checklistRankingBucketType"));
    v35 = objc_claimAutoreleasedReturnValue();
    checklistRankingBucketType = v5->_checklistRankingBucketType;
    v5->_checklistRankingBucketType = (NSString *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_checklistRankingVersion"));
    v37 = objc_claimAutoreleasedReturnValue();
    checklistRankingVersion = v5->_checklistRankingVersion;
    v5->_checklistRankingVersion = (NSString *)v37;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_shouldBadgeOrganizer")))
      v39 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldBadgeOrganizer"));
    else
      v39 = 1;
    v5->_shouldBadgeOrganizer = v39;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_shouldBadgeInvitee")))
      v5->_shouldBadgeInvitee = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldBadgeInvitee"));
    else
      v5->_shouldBadgeInvitee = 1;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *members;
  id v5;

  members = self->_members;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", members, CFSTR("_members"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cloudKitProperties, CFSTR("_cloudKitProperties"));
  objc_msgSend(v5, "encodeObject:forKey:", self->__serverResponse, CFSTR("__serverResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_childCutOffAge, CFSTR("_childCutOffAge"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canAddMembers, CFSTR("_canAddMembers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addMemberButtonLabel, CFSTR("_addMemberButtonLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eligibilityRequirements, CFSTR("family-recommendation-info"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_familyMembersFooterLabel, CFSTR("_familyMembersFooterLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allowedSubscriptions, CFSTR("_allowedSubscriptions"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_showAddMemberButton, CFSTR("_showAddMemberButton"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldShowInvites, CFSTR("_shouldShowInvites"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_showLocationSplashScreen, CFSTR("_showLocationSplashScreen"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_showRUIPages, CFSTR("_showRUIPages"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_familyID, CFSTR("_familyID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ageCategory, CFSTR("_ageCategory"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_sharedPayementEnabled, CFSTR("_sharedPayementEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_checklistRankingBucketType, CFSTR("_checklistRankingBucketType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_checklistRankingVersion, CFSTR("_checklistRankingVersion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldBadgeOrganizer, CFSTR("_shouldBadgeOrganizer"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldBadgeInvitee, CFSTR("_shouldBadgeInvitee"));

}

- (NSArray)members
{
  return self->_members;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)_serverResponse
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (FAFamilyMember)me
{
  FAFamilyMember *me;
  NSArray *members;
  _QWORD v6[5];

  me = self->_me;
  if (!me)
  {
    members = self->_members;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __20__FAFamilyCircle_me__block_invoke;
    v6[3] = &unk_1E8561B78;
    v6[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](members, "enumerateObjectsUsingBlock:", v6);
    me = self->_me;
  }
  return me;
}

- (FAFamilyCircle)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FAFamilyCircle;
  v2 = -[FAFamilyCircle init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    *((_QWORD *)v2 + 11) = -1;
    *((_DWORD *)v2 + 4) = 0;
    *(_WORD *)(v2 + 9) = 257;
  }
  return (FAFamilyCircle *)v2;
}

- (FAFamilyMember)remoteGuardian
{
  FAFamilyMember *remoteGuardianPerson;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  remoteGuardianPerson = self->_remoteGuardianPerson;
  if (remoteGuardianPerson)
    return remoteGuardianPerson;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_members;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isMe", (_QWORD)v13))
        {
          objc_msgSend(v9, "remoteChildren");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "count");

          if (v11)
          {
            v12 = v9;

            return (FAFamilyMember *)v12;
          }
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }

  return (FAFamilyMember *)0;
}

- (BOOL)anyChildHasRemoteGuardians
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = self->_members;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "remoteGuardians", (_QWORD)v10);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "count");

          if (v8)
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)memberForAltDSID:(id)a3
{
  id v4;
  void *v5;
  NSArray *members;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__0;
    v16 = __Block_byref_object_dispose__0;
    v17 = 0;
    members = self->_members;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __35__FAFamilyCircle_memberForAltDSID___block_invoke;
    v9[3] = &unk_1E8561B30;
    v10 = v4;
    v11 = &v12;
    -[NSArray enumerateObjectsUsingBlock:](members, "enumerateObjectsUsingBlock:", v9);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __35__FAFamilyCircle_memberForAltDSID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)memberForDSID:(id)a3
{
  id v4;
  void *v5;
  NSArray *members;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "intValue"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__0;
    v16 = __Block_byref_object_dispose__0;
    v17 = 0;
    members = self->_members;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __32__FAFamilyCircle_memberForDSID___block_invoke;
    v9[3] = &unk_1E8561B30;
    v10 = v5;
    v11 = &v12;
    -[NSArray enumerateObjectsUsingBlock:](members, "enumerateObjectsUsingBlock:", v9);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __32__FAFamilyCircle_memberForDSID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "dsid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");
  v9 = objc_msgSend(*(id *)(a1 + 32), "intValue");

  if (v8 == v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)memberForPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v4);
  objc_msgSend(v5, "fullyQualifiedDigits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[FAFamilyCircle members](self, "members");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v23)
    {
      v8 = *(_QWORD *)v30;
      v24 = v7;
      v22 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v7);
          v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v10, "memberPhoneNumbers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(","));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v13 = v12;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v26;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v26 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
                if (objc_msgSend(v18, "length"))
                {
                  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v18);
                  if ((objc_msgSend(v5, "isLikePhoneNumber:", v19) & 1) != 0)
                  {
                    v20 = v10;

                    v7 = v24;
                    goto LABEL_23;
                  }

                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              if (v15)
                continue;
              break;
            }
          }

          v7 = v24;
          v8 = v22;
        }
        v20 = 0;
        v23 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v23);
    }
    else
    {
      v20 = 0;
    }
LABEL_23:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSArray)firstNames
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[FAFamilyCircle members](self, "members");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[FAFamilyCircle members](self, "members", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (!v7)
      goto LABEL_16;
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isMe") & 1) == 0)
        {
          objc_msgSend(v11, "contact");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "givenName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "firstName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "length"))
          {
            v15 = v5;
            v16 = v13;
            goto LABEL_12;
          }
          if (v14)
          {
            v15 = v5;
            v16 = v14;
LABEL_12:
            objc_msgSend(v15, "addObject:", v16);
          }

          continue;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (!v8)
      {
LABEL_16:

        v17 = (void *)objc_msgSend(v5, "copy");
        return (NSArray *)v17;
      }
    }
  }
  return (NSArray *)0;
}

- (id)pendingInvitesOnly
{
  void *v2;
  void *v3;
  id v4;

  -[FAFamilyCircle invites](self, "invites");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  }

  return v4;
}

uint64_t __36__FAFamilyCircle_pendingInvitesOnly__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "inviteStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", CFSTR("Pending"));

  return v3;
}

- (NSArray)invites
{
  FAFamilyCircle *v2;
  NSArray *invites;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  FAFamilyInvite *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *v26;
  FAFamilyCircle *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v2 = self;
  v35 = *MEMORY[0x1E0C80C00];
  invites = self->_invites;
  if (!invites)
  {
    -[FAFamilyCircle _serverResponse](v2, "_serverResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("family-invitations"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v2;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      obj = v5;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v31 != v9)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            v12 = objc_alloc_init(FAFamilyInvite);
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("invitee-last-name"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[FAFamilyInvite setOrganizerLastName:](v12, "setOrganizerLastName:", v13);

            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("invitee-first-name"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[FAFamilyInvite setOrganizerFirstName:](v12, "setOrganizerFirstName:", v14);

            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("inviter-email"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[FAFamilyInvite setOrganizerEmail:](v12, "setOrganizerEmail:", v15);

            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("invite-code"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[FAFamilyInvite setCode:](v12, "setCode:", v16);

            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("invitee-dsid"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[FAFamilyInvite setOrganizerDSID:](v12, "setOrganizerDSID:", v17);

            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("invite-status"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[FAFamilyInvite setInviteStatus:](v12, "setInviteStatus:", v18);

            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("inviteDateEpoch"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v20 = objc_alloc(MEMORY[0x1E0C99D68]);
              objc_msgSend(v19, "doubleValue");
              v22 = objc_msgSend(v20, "initWithTimeIntervalSince1970:", v21 / 1000.0);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
              v22 = objc_claimAutoreleasedReturnValue();
            }
            v23 = (void *)v22;
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("badge-after-invite-delay"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v24)
            {
              +[FAFamilyMember defaultInvitationDelay](FAFamilyMember, "defaultInvitationDelay");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
            }
            -[FAFamilyInvite setInviteDate:](v12, "setInviteDate:", v23);
            -[FAFamilyInvite setBadgeAfter:](v12, "setBadgeAfter:", v24);
            objc_msgSend(v6, "addObject:", v12);

          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v8);
      }

      v2 = v28;
    }
    v25 = objc_msgSend(v6, "copy");
    v26 = v2->_invites;
    v2->_invites = (NSArray *)v25;

    invites = v2->_invites;
  }
  return invites;
}

- (NSArray)pendingMembers
{
  FAFamilyCircle *v2;
  NSArray *pendingMembers;
  NSArray *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  FAFamilyMember *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSArray *v17;
  void *v19;
  FAFamilyCircle *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  FAFamilyMember *v26;
  _BYTE v27[128];
  uint64_t v28;

  v2 = self;
  v28 = *MEMORY[0x1E0C80C00];
  pendingMembers = self->_pendingMembers;
  if (!pendingMembers)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[FAFamilyCircle _serverResponse](v2, "_serverResponse");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("pending-members"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v6;
      v20 = v2;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v22 != v10)
              objc_enumerationMutation(v7);
            v12 = -[FAFamilyMember initWithDictionaryRepresentation:]([FAFamilyMember alloc], "initWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
            -[FAFamilyMember inviteEmail](v12, "inviteEmail");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              -[FAFamilyMember statusString](v12, "statusString");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isEqual:", CFSTR("Pending"));

              if (v15)
                -[NSArray addObject:](v4, "addObject:", v12);
            }
            else
            {
              _FALogSystem();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v26 = v12;
                _os_log_impl(&dword_1CAEBA000, v16, OS_LOG_TYPE_DEFAULT, "No invite email, dropping %@", buf, 0xCu);
              }

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        }
        while (v9);
      }

      v6 = v19;
      v2 = v20;
    }
    v17 = v2->_pendingMembers;
    v2->_pendingMembers = v4;

    pendingMembers = v2->_pendingMembers;
  }
  return pendingMembers;
}

- (NSArray)pendingMembersWithAllStatues
{
  NSArray *pendingMembersWithAllStatues;
  NSArray *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  FAFamilyMember *v13;
  FAFamilyMember *v14;
  NSArray *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  pendingMembersWithAllStatues = self->_pendingMembersWithAllStatues;
  if (!pendingMembersWithAllStatues)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[FAFamilyCircle _serverResponse](self, "_serverResponse");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("pending-members"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
            v13 = [FAFamilyMember alloc];
            v14 = -[FAFamilyMember initWithDictionaryRepresentation:](v13, "initWithDictionaryRepresentation:", v12, (_QWORD)v17);
            -[NSArray addObject:](v4, "addObject:", v14);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v9);
      }

    }
    v15 = self->_pendingMembersWithAllStatues;
    self->_pendingMembersWithAllStatues = v4;

    pendingMembersWithAllStatues = self->_pendingMembersWithAllStatues;
  }
  return pendingMembersWithAllStatues;
}

void __20__FAFamilyCircle_me__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isMe"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), a2);
    *a4 = 1;
  }

}

- (BOOL)currentUserIsU13
{
  void *v3;
  void *v4;
  char v5;

  -[FAFamilyCircle me](self, "me");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[FAFamilyCircle me](self, "me");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isChildAccount");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)familyHasU13Member
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_members;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isChildAccount", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)childCutOffAge
{
  return self->_childCutOffAge;
}

- (NSArray)allowedSubscriptions
{
  return self->_allowedSubscriptions;
}

- (NSString)familyID
{
  return self->_familyID;
}

- (int64_t)ageCategory
{
  return self->_ageCategory;
}

- (BOOL)sharedPaymentEnabled
{
  return self->_sharedPayementEnabled;
}

- (NSString)checklistRankingBucketType
{
  return self->_checklistRankingBucketType;
}

- (NSString)checklistRankingVersion
{
  return self->_checklistRankingVersion;
}

- (BOOL)shouldBadgeOrganizer
{
  return self->_shouldBadgeOrganizer;
}

- (BOOL)shouldBadgeInvitee
{
  return self->_shouldBadgeInvitee;
}

- (FAEligibilityRequirements)eligibilityRequirements
{
  return (FAEligibilityRequirements *)objc_getProperty(self, a2, 112, 1);
}

- (FAFamilyCloudKitProperties)cloudKitProperties
{
  return (FAFamilyCloudKitProperties *)objc_getProperty(self, a2, 120, 1);
}

- (FAFamilyMember)remoteGuardianPerson
{
  return (FAFamilyMember *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRemoteGuardianPerson:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)shouldShowInvites
{
  return self->_shouldShowInvites;
}

- (BOOL)canAddMembers
{
  return self->_canAddMembers;
}

- (NSString)addMemberButtonLabel
{
  return self->_addMemberButtonLabel;
}

- (NSString)familyMembersFooterLabel
{
  return self->_familyMembersFooterLabel;
}

- (BOOL)showAddMemberButton
{
  return self->_showAddMemberButton;
}

- (BOOL)showLocationSplashScreen
{
  return self->_showLocationSplashScreen;
}

- (BOOL)showRUIPages
{
  return self->_showRUIPages;
}

- (int)ageCategoryEnum
{
  return self->_ageCategoryEnum;
}

- (void)initWithServerResponse:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CAEBA000, log, OS_LOG_TYPE_ERROR, "Failed to get a remote guardian but have DSID:Person map", v1, 2u);
}

@end
