@implementation SGParsedPersonFromInteraction

- (SGParsedPersonFromInteraction)initWithPerson:(id)a3 bundleId:(id)a4 interactionIdentifier:(id)a5 groupId:(id)a6 date:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SGParsedPersonFromInteraction *v18;
  uint64_t v19;
  INPersonHandle *handle;
  void *v21;
  void *v22;
  unint64_t v23;
  SGParsedPersonFromInteraction *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *displayName;
  uint64_t v35;
  NSPersonNameComponents *nameComponents;
  uint64_t v37;
  NSString *contactIdentifier;
  void *v39;
  int v40;
  NSString *v41;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  obj = a6;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_36:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = a7;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGInteractionParser.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

    a7 = v50;
    if (v15)
      goto LABEL_4;
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v49 = a7;
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGInteractionParser.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  a7 = v49;
  if (!v14)
    goto LABEL_36;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v51 = a7;
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGInteractionParser.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactionIdentifier"));

  a7 = v51;
LABEL_4:
  v58.receiver = self;
  v58.super_class = (Class)SGParsedPersonFromInteraction;
  v18 = -[SGParsedPersonFromInteraction init](&v58, sel_init);
  if (!v18)
  {
LABEL_32:
    v24 = v18;
    goto LABEL_33;
  }
  objc_msgSend(v13, "personHandle");
  v19 = objc_claimAutoreleasedReturnValue();
  handle = v18->_handle;
  v18->_handle = (INPersonHandle *)v19;

  -[INPersonHandle value](v18->_handle, "value");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v21, "length"))
  {

    goto LABEL_10;
  }
  v48 = a7;
  v52 = v17;
  -[INPersonHandle value](v18->_handle, "value");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  if (v23 <= 0x3E8)
  {
    v46 = v16;
    v47 = v15;
    objc_msgSend(v13, "personHandle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGParsedPersonFromInteraction _harvestPerson:handle:suggestionType:bundleId:](v18, "_harvestPerson:handle:suggestionType:bundleId:", v13, v25, objc_msgSend(v13, "suggestionType"), v14);

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v13, "aliases");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v55;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v55 != v29)
            objc_enumerationMutation(v26);
          -[SGParsedPersonFromInteraction _harvestPerson:handle:suggestionType:bundleId:](v18, "_harvestPerson:handle:suggestionType:bundleId:", v13, *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v30++), objc_msgSend(v13, "suggestionType"), v14);
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v28);
    }

    if (!v18->_email && !v18->_phoneNumber && !v18->_socialProfile)
    {
      v24 = 0;
      v16 = v46;
      v15 = v47;
      goto LABEL_8;
    }
    objc_storeStrong((id *)&v18->_bundleId, a4);
    objc_storeStrong((id *)&v18->_interactionIdentifier, a5);
    objc_storeStrong((id *)&v18->_groupId, obj);
    objc_storeStrong((id *)&v18->_date, v48);
    objc_msgSend(v13, "displayName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringByTrimmingCharactersInSet:", v32);
    v33 = objc_claimAutoreleasedReturnValue();
    displayName = v18->_displayName;
    v18->_displayName = (NSString *)v33;

    objc_msgSend(v13, "nameComponents");
    v35 = objc_claimAutoreleasedReturnValue();
    nameComponents = v18->_nameComponents;
    v18->_nameComponents = (NSPersonNameComponents *)v35;

    objc_msgSend(v13, "contactIdentifier");
    v37 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v18->_contactIdentifier;
    v18->_contactIdentifier = (NSString *)v37;

    v16 = v46;
    v15 = v47;
    if (!v18->_nameComponents && !v18->_socialProfile && (v18->_email || v18->_phoneNumber || v18->_contactIdentifier))
    {
      -[INPersonHandle value](v18->_handle, "value");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "isEqualToString:", v18->_displayName))
      {

LABEL_29:
        v41 = v18->_displayName;
        v18->_displayName = 0;

        goto LABEL_30;
      }
      v40 = heuristicIdentifyHandle(v18->_displayName);

      if (v40)
        goto LABEL_29;
    }
LABEL_30:
    v17 = v52;
    if (v18->_displayName || v18->_contactIdentifier)
      goto LABEL_32;
LABEL_10:
    v24 = 0;
    goto LABEL_33;
  }
  v24 = 0;
LABEL_8:
  v17 = v52;
LABEL_33:

  return v24;
}

- (void)_harvestPerson:(id)a3 handle:(id)a4 suggestionType:(int64_t)a5 bundleId:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  id v19;

  v19 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v10, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "length"))
  {

    goto LABEL_15;
  }
  objc_msgSend(v10, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14 <= 0x3E8)
  {
    v15 = objc_msgSend(v10, "type");
    if (v15 != 2)
    {
      if (v15 == 1)
      {
LABEL_9:
        objc_msgSend(v10, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGParsedPersonFromInteraction _harvestEmail:](self, "_harvestEmail:", v18);
LABEL_12:

LABEL_13:
        if ((unint64_t)(a5 - 1) <= 1)
          goto LABEL_14;
        goto LABEL_15;
      }
      if (v15)
        goto LABEL_13;
      if ((unint64_t)(a5 - 1) < 2)
      {
LABEL_14:
        -[SGParsedPersonFromInteraction _harvestSocialProfile:handle:bundleId:](self, "_harvestSocialProfile:handle:bundleId:", v19, v10, v11);
        goto LABEL_15;
      }
      -[INPersonHandle value](self->_handle, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = heuristicIdentifyHandle(v16);

      if (v17 != 2)
      {
        if (v17 != 1)
          goto LABEL_15;
        goto LABEL_9;
      }
    }
    objc_msgSend(v10, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGParsedPersonFromInteraction _harvestPhoneNumber:](self, "_harvestPhoneNumber:", v18);
    goto LABEL_12;
  }
LABEL_15:

}

- (void)_harvestEmail:(id)a3
{
  const __CFString *v4;
  __CFString *v5;

  v4 = (const __CFString *)a3;
  v5 = (__CFString *)v4;
  if (!self->_email
    && (CFStringGetCStringPtr(v4, 0x8000100u) || -[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String")))
  {
    SGParseNamedEmailAddress();
  }

}

- (void)_harvestPhoneNumber:(id)a3
{
  NSString *v4;
  NSString *phoneNumber;

  if (!self->_phoneNumber)
  {
    SGDataDetectorsScanForPhone(a3);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    phoneNumber = self->_phoneNumber;
    self->_phoneNumber = v4;

  }
}

- (void)_harvestSocialProfile:(id)a3 handle:(id)a4 bundleId:(id)a5
{
  void *v8;
  __CFString *v9;
  id v10;
  id v11;
  __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  SGSocialProfileDetails *v26;
  SGSocialProfileDetails *socialProfile;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  SGSocialProfileDetails *v31;
  id v32;

  if (!self->_socialProfile)
  {
    v8 = (void *)MEMORY[0x1E0D198C8];
    v9 = (__CFString *)a5;
    v10 = a4;
    v11 = a3;
    objc_msgSend(v8, "originWithType:sourceKey:externalKey:bundleId:fromForwardedMessage:", 5, v9, &stru_1E7DB83A8, v9, 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v31 = [SGSocialProfileDetails alloc];
    objc_msgSend(v10, "value");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = v12;
    else
      v13 = &stru_1E7DB83A8;
    v30 = v13;
    objc_msgSend(v11, "customIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (const __CFString *)v14;
    else
      v16 = &stru_1E7DB83A8;
    if (v9)
      v17 = v9;
    else
      v17 = &stru_1E7DB83A8;
    v28 = v17;
    v29 = v16;
    objc_msgSend(v11, "displayName");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v18)
      v19 = v18;
    else
      v19 = &stru_1E7DB83A8;
    objc_msgSend(v32, "localizedApplicationName");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = (const __CFString *)v20;
    else
      v22 = &stru_1E7DB83A8;
    objc_msgSend(v32, "teamId");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v23)
      v25 = (const __CFString *)v23;
    else
      v25 = &stru_1E7DB83A8;
    v26 = -[SGSocialProfileDetails initWithUsername:userIdentifier:bundleIdentifier:displayName:service:teamIdentifier:](v31, "initWithUsername:userIdentifier:bundleIdentifier:displayName:service:teamIdentifier:", v30, v29, v28, v19, v22, v25);

    socialProfile = self->_socialProfile;
    self->_socialProfile = v26;

  }
}

- (void)grabNameIfNeededFromContactStore:(id)a3
{
  id v4;
  id v5;
  NSString *contactIdentifier;
  void *v7;
  id v8;
  void *v9;
  NSString *v10;
  NSObject *p_super;
  NSString *v12;
  id v13;
  uint8_t buf[4];
  NSString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_displayName && self->_contactIdentifier)
  {
    if (grabNameIfNeededFromContactStore___pasOnceToken3 != -1)
      dispatch_once(&grabNameIfNeededFromContactStore___pasOnceToken3, &__block_literal_global_437);
    v5 = (id)grabNameIfNeededFromContactStore___pasExprOnceResult;
    contactIdentifier = self->_contactIdentifier;
    v13 = 0;
    +[SGContactsInterface unifiedContactWithIdentifier:keysToFetch:usingContactStore:error:](SGContactsInterface, "unifiedContactWithIdentifier:keysToFetch:usingContactStore:error:", contactIdentifier, v5, v4, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    v9 = v8;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v7, 0);
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      p_super = &self->_displayName->super;
      self->_displayName = v10;
    }
    else
    {
      if (!v8)
      {
LABEL_11:

        goto LABEL_12;
      }
      sgLogHandle();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v12 = self->_contactIdentifier;
        *(_DWORD *)buf = 138412546;
        v15 = v12;
        v16 = 2112;
        v17 = v9;
        _os_log_error_impl(&dword_1C3607000, p_super, OS_LOG_TYPE_ERROR, "Error fetching contact for identifier '%@': %@", buf, 0x16u);
      }
    }

    goto LABEL_11;
  }
LABEL_12:

}

- (id)pipelineEntity
{
  NSString *displayName;
  NSString *v4;
  NSString *v5;
  void *v6;
  SGSocialProfileDetails *socialProfile;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SGSocialProfileDetails *v12;
  void *v13;
  char v14;
  char v15;
  SGPipelineEntity *v16;
  SGPseudoContactKey *v17;
  SGDuplicateKey *v18;
  void *v19;
  uint64_t v20;
  SGPipelineEnrichment *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  SGLabeledValue *v31;
  void *v32;
  char v33;
  SGLabeledValue *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *p_super;
  char v49;
  char v50;
  void *v51;
  SGPseudoContactKey *v52;
  NSString *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  displayName = self->_displayName;
  if (displayName && !heuristicIdentifyHandle(displayName))
    v4 = self->_displayName;
  else
    v4 = (NSString *)&stru_1E7DB83A8;
  v5 = v4;
  SGNormalizePhoneNumber();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  socialProfile = self->_socialProfile;
  if (socialProfile)
  {
    -[SGSocialProfileDetails serialize](self->_socialProfile, "serialize");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGIdentityKey keyForSocialProfile:](SGIdentityKey, "keyForSocialProfile:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SGSocialProfileDetails userIdentifier](self->_socialProfile, "userIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");
    v12 = self->_socialProfile;
    if (v11)
      -[SGSocialProfileDetails userIdentifier](v12, "userIdentifier");
    else
      -[SGSocialProfileDetails username](v12, "username");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 1;
    goto LABEL_12;
  }
  if (self->_phoneNumber)
  {
    +[SGIdentityKey keyForNormalizedPhone:](SGIdentityKey, "keyForNormalizedPhone:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[INPersonHandle value](self->_handle, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SGNormalizePhoneNumber();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
LABEL_12:
    v15 = 1;
    goto LABEL_13;
  }
  if (!self->_email)
  {
    v13 = 0;
    v9 = 0;
    goto LABEL_47;
  }
  +[SGIdentityKey keyForEmail:](SGIdentityKey, "keyForEmail:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPersonHandle value](self->_handle, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeEmailAddress();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v14 = 1;
LABEL_13:

  if (v9 && objc_msgSend(v13, "length"))
  {
    v49 = v14;
    v50 = v15;
    v54 = v6;
    v16 = -[SGPipelineEntity initWithIntentPersonAtDate:bundleId:handle:displayName:]([SGPipelineEntity alloc], "initWithIntentPersonAtDate:bundleId:handle:displayName:", self->_date, self->_bundleId, v13, v5);
    v55 = v9;
    v17 = -[SGPseudoContactKey initWithIdentityKey:]([SGPseudoContactKey alloc], "initWithIdentityKey:", v9);
    v18 = [SGDuplicateKey alloc];
    -[SGEntity duplicateKey](v16, "duplicateKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v17;
    v20 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:](v18, "initWithEntityKey:entityType:parentKey:", v17, 4, v19);

    v51 = (void *)v20;
    v53 = v5;
    v21 = -[SGPipelineEnrichment initWithDuplicateKey:title:parent:]([SGPipelineEnrichment alloc], "initWithDuplicateKey:title:parent:", v20, v5, v16);
    if (socialProfile)
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      -[SGSocialProfileDetails uniqueIdentifiers](self->_socialProfile, "uniqueIdentifiers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v61 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
            v28 = (void *)MEMORY[0x1E0D197F0];
            SGNormalizeSocialProfile(v27);
            objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "contactDetail:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v21, "addTag:", v29);

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
        }
        while (v24);
      }

    }
    -[SGPipelineEntity addEnrichment:](v16, "addEnrichment:", v21);
    v30 = v49 ^ 1;
    if (!self->_phoneNumber)
      v30 = 1;
    if ((v30 & 1) == 0)
    {
      v31 = -[SGLabeledValue initWithLabel:value:]([SGLabeledValue alloc], "initWithLabel:value:", 0, v54);
      objc_msgSend(MEMORY[0x1E0D19820], "extractionInfoWithExtractionType:modelVersion:confidence:", 16, 0, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGPipelineEntity addDetectedPhoneNumber:forIdentity:context:contextRangeOfInterest:extractionInfo:](v16, "addDetectedPhoneNumber:forIdentity:context:contextRangeOfInterest:extractionInfo:", v31, v55, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v32);

    }
    v33 = v50 ^ 1;
    if (!self->_email)
      v33 = 1;
    if ((v33 & 1) == 0)
    {
      v34 = -[SGLabeledValue initWithLabel:value:]([SGLabeledValue alloc], "initWithLabel:value:", 0, self->_email);
      objc_msgSend(MEMORY[0x1E0D19820], "extractionInfoWithExtractionType:modelVersion:confidence:", 16, 0, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGPipelineEntity addDetectedEmailAddress:forIdentity:context:contextRangeOfInterest:extractionInfo:](v16, "addDetectedEmailAddress:forIdentity:context:contextRangeOfInterest:extractionInfo:", v34, v55, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v35);

    }
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    -[SGPipelineEntity enrichments](v16, "enrichments");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v57 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0D197F0], "fromInteraction");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addTag:", v42);

          objc_msgSend(MEMORY[0x1E0D197F0], "interactionId:", self->_interactionIdentifier);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addTag:", v43);

          objc_msgSend(MEMORY[0x1E0D197F0], "interactionBundleId:", self->_bundleId);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addTag:", v44);

          if (self->_contactIdentifier)
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "interactionContactIdentifier:");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "addTag:", v45);

          }
          if (self->_groupId)
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "interactionGroupId:");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "addTag:", v46);

          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      }
      while (v38);
    }

    v5 = v53;
    v6 = v54;
    v9 = v55;
    p_super = &v52->super;
    goto LABEL_50;
  }
LABEL_47:
  sgLogHandle();
  p_super = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v67 = v9;
    v68 = 2112;
    v69 = v13;
    _os_log_error_impl(&dword_1C3607000, p_super, OS_LOG_TYPE_ERROR, "Interaction Person has no identity/handle: %@ / %@", buf, 0x16u);
  }
  v16 = 0;
LABEL_50:

  return v16;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)groupId
{
  return self->_groupId;
}

- (NSString)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (NSString)email
{
  return self->_email;
}

- (SGSocialProfileDetails)socialProfile
{
  return self->_socialProfile;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_socialProfile, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

void __66__SGParsedPersonFromInteraction_grabNameIfNeededFromContactStore___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)grabNameIfNeededFromContactStore___pasExprOnceResult;
  grabNameIfNeededFromContactStore___pasExprOnceResult = v2;

  objc_autoreleasePoolPop(v0);
}

void __47__SGParsedPersonFromInteraction__harvestEmail___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), obj);
}

+ (id)_peopleFromInteraction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  if (objc_msgSend(v3, "direction") != 2)
  {
    objc_msgSend(v3, "intent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "contacts");
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v4 = (void *)v6;
LABEL_10:

        goto LABEL_11;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "recipients");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    v4 = 0;
    goto LABEL_10;
  }
  v4 = 0;
LABEL_11:

  return v4;
}

+ (id)parseInteraction:(id)a3 bundleId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  SGParsedPersonFromInteraction *v18;
  void *v19;
  void *v20;
  SGParsedPersonFromInteraction *v21;
  SGParsedPersonFromInteraction *v22;
  void *v24;
  void *v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGInteractionParser.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interaction"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGInteractionParser.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

LABEL_3:
  objc_msgSend(v7, "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (id)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(a1, "_peopleFromInteraction:", v7);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        v16 = v9;
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v15);
        v18 = [SGParsedPersonFromInteraction alloc];
        objc_msgSend(v7, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "groupIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v18;
        v9 = v16;
        v22 = -[SGParsedPersonFromInteraction initWithPerson:bundleId:interactionIdentifier:groupId:date:](v21, "initWithPerson:bundleId:interactionIdentifier:groupId:date:", v17, v16, v19, v20, v11);

        if (v22)
          objc_msgSend(v27, "addObject:", v22);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }

  return v27;
}

+ (id)intentClassWhitelist
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
