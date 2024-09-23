@implementation CSSearchQueryContext

- (CSSearchQueryContext)initWithXPCDictionary:(id)a3
{
  id v4;
  CSSearchQueryContext *v5;
  NSString *v6;
  NSString *clientBundleID;
  void *v8;
  NSArray *v9;
  NSArray *fetchAttributes;
  const UInt8 *data;
  int64_t int64;
  void *v13;
  NSArray *v14;
  NSArray *protectionClasses;
  void *v16;
  NSArray *v17;
  NSArray *bundleIDs;
  void *v19;
  NSArray *v20;
  NSArray *additionalBundleIDs;
  void *v22;
  NSArray *v23;
  NSArray *instantAnswersBundleIDs;
  void *v25;
  NSArray *v26;
  NSArray *answerAttributes;
  void *v28;
  NSArray *v29;
  NSArray *rankingQueries;
  void *v31;
  NSArray *v32;
  NSArray *additionalQueries;
  void *v34;
  NSArray *v35;
  NSArray *instantAnswersQueries;
  void *v37;
  NSArray *v38;
  NSArray *preferredLanguages;
  void *v40;
  NSArray *v41;
  NSArray *markedTextArray;
  void *v43;
  NSArray *v44;
  NSArray *disableBundles;
  void *v46;
  NSArray *v47;
  NSArray *groupingRules;
  NSString *v49;
  NSString *userQuery;
  int uint64;
  NSObject *v52;
  NSString *v53;
  NSString *filterQuery;
  void *v55;
  NSArray *v56;
  NSArray *filterQueries;
  NSString *v58;
  NSString *keyboardLanguage;
  uint64_t v60;
  void *v61;
  NSArray *v62;
  NSArray *completionAttributes;
  void *v64;
  NSArray *v65;
  NSArray *completionWeights;
  NSString *v67;
  NSString *completionString;
  void *v69;
  NSArray *v70;
  NSArray *scopes;
  void *v72;
  NSArray *v73;
  NSArray *mountPoints;
  int64_t date;
  uint64_t v76;
  NSDate *instantAnswersOverrideDate;
  NSString *v78;
  NSString *customResourceDirectory;
  id v80;
  uint64_t v81;
  NSAttributedString *attributedUserQuery;
  void *v83;
  NSArray *v84;
  NSArray *resultMatchingAttributes;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  id v95;
  NSDictionary *queryUnderstandingOutput;
  NSObject *v97;
  NSData *v98;
  NSData *queryEmbedding;
  void *v101;
  id v102;
  size_t length;
  objc_super v104;

  v4 = a3;
  v104.receiver = self;
  v104.super_class = (Class)CSSearchQueryContext;
  v5 = -[CSSearchQueryContext init](&v104, sel_init);
  if (v5)
  {
    v6 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "cbi", v4);
    clientBundleID = v5->_clientBundleID;
    v5->_clientBundleID = v6;

    xpc_dictionary_get_value(v4, "fa");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v8);
    fetchAttributes = v5->_fetchAttributes;
    v5->_fetchAttributes = v9;

    length = 0;
    data = (const UInt8 *)xpc_dictionary_get_data(v4, "tpefa", &length);
    int64 = xpc_dictionary_get_int64(v4, "ctpefa");
    if (data && int64)
      v5->_nonTopHitFetchAttributeIndexesBits = CFBitVectorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], data, int64);
    xpc_dictionary_get_value(v4, "pcs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v13);
    protectionClasses = v5->_protectionClasses;
    v5->_protectionClasses = v14;

    xpc_dictionary_get_value(v4, "bi");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v16);
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = v17;

    xpc_dictionary_get_value(v4, "abi");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v19);
    additionalBundleIDs = v5->_additionalBundleIDs;
    v5->_additionalBundleIDs = v20;

    xpc_dictionary_get_value(v4, "iab");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v22);
    instantAnswersBundleIDs = v5->_instantAnswersBundleIDs;
    v5->_instantAnswersBundleIDs = v23;

    xpc_dictionary_get_value(v4, "aai");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v25);
    answerAttributes = v5->_answerAttributes;
    v5->_answerAttributes = v26;

    xpc_dictionary_get_value(v4, "rq");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = +[CSXPCConnection copyNSStringOrDictArrayFromXPCArray:](CSXPCConnection, "copyNSStringOrDictArrayFromXPCArray:", v28);
    rankingQueries = v5->_rankingQueries;
    v5->_rankingQueries = v29;

    xpc_dictionary_get_value(v4, "aq");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = +[CSXPCConnection copyNSStringOrDictArrayFromXPCArray:](CSXPCConnection, "copyNSStringOrDictArrayFromXPCArray:", v31);
    additionalQueries = v5->_additionalQueries;
    v5->_additionalQueries = v32;

    xpc_dictionary_get_value(v4, "iaq");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = +[CSXPCConnection copyNSStringOrDictArrayFromXPCArray:](CSXPCConnection, "copyNSStringOrDictArrayFromXPCArray:", v34);
    instantAnswersQueries = v5->_instantAnswersQueries;
    v5->_instantAnswersQueries = v35;

    xpc_dictionary_get_value(v4, "pl");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v37);
    preferredLanguages = v5->_preferredLanguages;
    v5->_preferredLanguages = v38;

    xpc_dictionary_get_value(v4, "mt");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v40);
    markedTextArray = v5->_markedTextArray;
    v5->_markedTextArray = v41;

    xpc_dictionary_get_value(v4, "db");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v43);
    disableBundles = v5->_disableBundles;
    v5->_disableBundles = v44;

    xpc_dictionary_get_value(v4, "gr");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v46);
    groupingRules = v5->_groupingRules;
    v5->_groupingRules = v47;

    v49 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "uq", v4);
    userQuery = v5->_userQuery;
    v5->_userQuery = v49;

    uint64 = xpc_dictionary_get_uint64(v4, "rt");
    v5->_rankingType = uint64;
    if (uint64 == 1)
    {
      logForCSLogCategoryQuery();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        -[CSSearchQueryContext initWithXPCDictionary:].cold.2();

    }
    v53 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "fq", v4);
    filterQuery = v5->_filterQuery;
    v5->_filterQuery = v53;

    xpc_dictionary_get_value(v4, "fqs");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v55);
    filterQueries = v5->_filterQueries;
    v5->_filterQueries = v56;

    v58 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "kl", v4);
    keyboardLanguage = v5->_keyboardLanguage;
    v5->_keyboardLanguage = v58;

    v5->_computePhotosDerivedAttributes = xpc_dictionary_get_BOOL(v4, "qdrvp");
    v5->_strongRankingQueryCount = xpc_dictionary_get_uint64(v4, "src");
    v5->_dominantRankingQueryCount = xpc_dictionary_get_uint64(v4, "drc");
    v5->_dominatedRankingQueryCount = xpc_dictionary_get_uint64(v4, "ddrc");
    v5->_shortcutBit = xpc_dictionary_get_uint64(v4, "sb");
    v5->_highMatchBit = xpc_dictionary_get_uint64(v4, "hmb");
    v5->_lowMatchBit = xpc_dictionary_get_uint64(v4, "lmb");
    v5->_highRecencyBit = xpc_dictionary_get_uint64(v4, "hrb");
    v5->_lowRecencyBit = xpc_dictionary_get_uint64(v4, "lrb");
    v5->_maxCount = xpc_dictionary_get_uint64(v4, "mxc");
    v5->_minCount = xpc_dictionary_get_uint64(v4, "mnc");
    v5->_maxRankedResultCount = xpc_dictionary_get_uint64(v4, "mrc");
    v5->_minL2Score = xpc_dictionary_get_double(v4, "ml2");
    v5->_maxAge = xpc_dictionary_get_double(v4, "mage");
    v5->_queryID = xpc_dictionary_get_uint64(v4, "qi");
    v5->_flags = xpc_dictionary_get_uint64(v4, "f");
    v5->_currentTime = xpc_dictionary_get_double(v4, "ct");
    v5->_qos = xpc_dictionary_get_uint64(v4, "qos");
    v5->_userQueryOptions = xpc_dictionary_get_uint64(v4, "uqo");
    v5->_sourceOptions = xpc_dictionary_get_uint64(v4, "so");
    v5->_maximumBatchSize = xpc_dictionary_get_uint64(v4, "batsz");
    v5->_priorityIndexQuery = xpc_dictionary_get_BOOL(v4, "piq");
    v5->_disableResultStreaming = xpc_dictionary_get_BOOL(v4, "qsd");
    v5->_advancedQuery = xpc_dictionary_get_BOOL(v4, "adv");
    v5->_hasFreeTextQuery = xpc_dictionary_get_BOOL(v4, "frex");
    v60 = xpc_dictionary_get_uint64(v4, "cc");
    v5->_completionResultCount = v60;
    if (v60)
    {
      xpc_dictionary_get_value(v4, "ca");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v61);
      completionAttributes = v5->_completionAttributes;
      v5->_completionAttributes = v62;

      xpc_dictionary_get_value(v4, "cw");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = +[CSXPCConnection copyNSNumberArrayFromXPCArray:](CSXPCConnection, "copyNSNumberArrayFromXPCArray:", v64);
      completionWeights = v5->_completionWeights;
      v5->_completionWeights = v65;

      v67 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "cs", v4);
      completionString = v5->_completionString;
      v5->_completionString = v67;

      v5->_completionOptions = xpc_dictionary_get_uint64(v4, "co");
    }
    xpc_dictionary_get_value(v4, "sp");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v69);
    scopes = v5->_scopes;
    v5->_scopes = v70;

    xpc_dictionary_get_value(v4, "mp");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v72);
    mountPoints = v5->_mountPoints;
    v5->_mountPoints = v73;

    date = xpc_dictionary_get_date(v4, "ovda");
    if (date)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)date);
      v76 = objc_claimAutoreleasedReturnValue();
      instantAnswersOverrideDate = v5->_instantAnswersOverrideDate;
      v5->_instantAnswersOverrideDate = (NSDate *)v76;

    }
    v78 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "crd", v4);
    customResourceDirectory = v5->_customResourceDirectory;
    v5->_customResourceDirectory = v78;

    v80 = +[CSXPCConnection copyNSDataForKey:fromXPCDictionary:](CSXPCConnection, "copyNSDataForKey:fromXPCDictionary:", "pes", v4);
    if (v80)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v80, 0);
      v81 = objc_claimAutoreleasedReturnValue();
      attributedUserQuery = v5->_attributedUserQuery;
      v5->_attributedUserQuery = (NSAttributedString *)v81;

    }
    xpc_dictionary_get_value(v4, "rma");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v83);
    resultMatchingAttributes = v5->_resultMatchingAttributes;
    v5->_resultMatchingAttributes = v84;

    v86 = +[CSXPCConnection copyNSDataForKey:fromXPCDictionary:](CSXPCConnection, "copyNSDataForKey:fromXPCDictionary:", "qu", v4);
    if (v86)
    {
      v101 = (void *)MEMORY[0x1E0C99E60];
      v87 = objc_opt_class();
      v88 = objc_opt_class();
      v89 = objc_opt_class();
      v90 = objc_opt_class();
      v91 = objc_opt_class();
      v92 = objc_opt_class();
      objc_msgSend(v101, "setWithObjects:", v87, v88, v89, v90, v91, v92, objc_opt_class(), 0);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v93, v86, &v102);
      v94 = objc_claimAutoreleasedReturnValue();
      v95 = v102;
      queryUnderstandingOutput = v5->_queryUnderstandingOutput;
      v5->_queryUnderstandingOutput = (NSDictionary *)v94;

      if (v95)
      {
        logForCSLogCategoryQuery();
        v97 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
          -[CSSearchQueryContext initWithXPCDictionary:].cold.1();

      }
    }
    v98 = +[CSXPCConnection copyNSDataForKey:fromXPCDictionary:](CSXPCConnection, "copyNSDataForKey:fromXPCDictionary:", "qemb", v4);
    queryEmbedding = v5->_queryEmbedding;
    v5->_queryEmbedding = v98;

  }
  return v5;
}

- (NSArray)fetchAttributes
{
  if (self->_fetchAttributes)
    return self->_fetchAttributes;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedUserQuery, 0);
  objc_storeStrong((id *)&self->_queryEmbedding, 0);
  objc_storeStrong((id *)&self->_queryUnderstandingOutput, 0);
  objc_storeStrong((id *)&self->_resultMatchingSceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_protectionClasses, 0);
  objc_storeStrong((id *)&self->_filterQueries, 0);
  objc_storeStrong((id *)&self->_customResourceDirectory, 0);
  objc_storeStrong((id *)&self->_instantAnswersOverrideDate, 0);
  objc_storeStrong((id *)&self->_customFieldSpecifications, 0);
  objc_storeStrong((id *)&self->_rewriteContext, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_mountPoints, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_completionWeights, 0);
  objc_storeStrong((id *)&self->_completionAttributes, 0);
  objc_storeStrong((id *)&self->_normalizedSearchQuery, 0);
  objc_storeStrong((id *)&self->_completionString, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_resultMatchingAttributes, 0);
  objc_storeStrong((id *)&self->_userQuery, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_filterQuery, 0);
  objc_storeStrong((id *)&self->_groupingRules, 0);
  objc_storeStrong((id *)&self->_disableBundles, 0);
  objc_storeStrong((id *)&self->_markedTextArray, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_instantAnswersQueries, 0);
  objc_storeStrong((id *)&self->_additionalQueries, 0);
  objc_storeStrong((id *)&self->_rankingQueries, 0);
  objc_storeStrong((id *)&self->_answerAttributes, 0);
  objc_storeStrong((id *)&self->_instantAnswersBundleIDs, 0);
  objc_storeStrong((id *)&self->_additionalBundleIDs, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_fetchAttributes, 0);
}

- (NSArray)completionWeights
{
  return self->_completionWeights;
}

- (NSArray)completionAttributes
{
  return self->_completionAttributes;
}

- (BOOL)internal
{
  return self->_flags & 1;
}

- (BOOL)lowPriority
{
  return (LOBYTE(self->_flags) >> 5) & 1;
}

- (NSString)completionString
{
  return self->_completionString;
}

- (int64_t)completionResultCount
{
  return self->_completionResultCount;
}

- (unsigned)completionOptions
{
  return self->_completionOptions;
}

- (BOOL)disableBlockingOnIndex
{
  return (BYTE1(self->_flags) >> 2) & 1;
}

- (BOOL)enableInstantAnswers
{
  return BYTE2(self->_flags) & 1;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (BOOL)generateSuggestions
{
  return (BYTE1(self->_flags) >> 3) & 1;
}

- (id)copyWithZone:(_NSZone *)a3
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
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

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setFlags:", -[CSSearchQueryContext flags](self, "flags"));
  -[CSSearchQueryContext fetchAttributes](self, "fetchAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchAttributes:", v5);

  -[CSSearchQueryContext protectionClasses](self, "protectionClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProtectionClasses:", v6);

  -[CSSearchQueryContext keyboardLanguage](self, "keyboardLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardLanguage:", v7);

  -[CSSearchQueryContext filterQueries](self, "filterQueries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilterQueries:", v8);

  -[CSSearchQueryContext clientBundleID](self, "clientBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientBundleID:", v9);

  -[CSSearchQueryContext bundleIDs](self, "bundleIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleIDs:", v10);

  -[CSSearchQueryContext additionalBundleIDs](self, "additionalBundleIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdditionalBundleIDs:", v11);

  -[CSSearchQueryContext instantAnswersBundleIDs](self, "instantAnswersBundleIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInstantAnswersBundleIDs:", v12);

  -[CSSearchQueryContext answerAttributes](self, "answerAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnswerAttributes:", v13);

  -[CSSearchQueryContext rankingQueries](self, "rankingQueries");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRankingQueries:", v14);

  -[CSSearchQueryContext additionalQueries](self, "additionalQueries");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdditionalQueries:", v15);

  -[CSSearchQueryContext instantAnswersQueries](self, "instantAnswersQueries");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInstantAnswersQueries:", v16);

  -[CSSearchQueryContext preferredLanguages](self, "preferredLanguages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredLanguages:", v17);

  -[CSSearchQueryContext markedTextArray](self, "markedTextArray");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMarkedTextArray:", v18);

  -[CSSearchQueryContext disableBundles](self, "disableBundles");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableBundles:", v19);

  -[CSSearchQueryContext userQuery](self, "userQuery");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserQuery:", v20);

  -[CSSearchQueryContext suggestion](self, "suggestion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuggestion:", v21);

  -[CSSearchQueryContext groupingRules](self, "groupingRules");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupingRules:", v22);

  objc_msgSend(v4, "setRankingType:", -[CSSearchQueryContext rankingType](self, "rankingType"));
  -[CSSearchQueryContext filterQuery](self, "filterQuery");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilterQuery:", v23);

  objc_msgSend(v4, "setStrongRankingQueryCount:", -[CSSearchQueryContext strongRankingQueryCount](self, "strongRankingQueryCount"));
  objc_msgSend(v4, "setDominantRankingQueryCount:", -[CSSearchQueryContext dominantRankingQueryCount](self, "dominantRankingQueryCount"));
  objc_msgSend(v4, "setDominatedRankingQueryCount:", -[CSSearchQueryContext dominatedRankingQueryCount](self, "dominatedRankingQueryCount"));
  objc_msgSend(v4, "setShortcutBit:", -[CSSearchQueryContext shortcutBit](self, "shortcutBit"));
  objc_msgSend(v4, "setHighMatchBit:", -[CSSearchQueryContext highMatchBit](self, "highMatchBit"));
  objc_msgSend(v4, "setLowMatchBit:", -[CSSearchQueryContext lowMatchBit](self, "lowMatchBit"));
  objc_msgSend(v4, "setHighRecencyBit:", -[CSSearchQueryContext highRecencyBit](self, "highRecencyBit"));
  objc_msgSend(v4, "setLowRecencyBit:", -[CSSearchQueryContext lowRecencyBit](self, "lowRecencyBit"));
  objc_msgSend(v4, "setMaxCount:", -[CSSearchQueryContext maxCount](self, "maxCount"));
  objc_msgSend(v4, "setMinCount:", -[CSSearchQueryContext minCount](self, "minCount"));
  objc_msgSend(v4, "setMaxRankedResultCount:", -[CSSearchQueryContext maxRankedResultCount](self, "maxRankedResultCount"));
  objc_msgSend(v4, "setMaxSuggestionCount:", -[CSSearchQueryContext maxSuggestionCount](self, "maxSuggestionCount"));
  objc_msgSend(v4, "setQueryID:", -[CSSearchQueryContext queryID](self, "queryID"));
  -[CSSearchQueryContext minL2Score](self, "minL2Score");
  objc_msgSend(v4, "setMinL2Score:");
  -[CSSearchQueryContext embeddingRelevanceThreshold](self, "embeddingRelevanceThreshold");
  objc_msgSend(v4, "setEmbeddingRelevanceThreshold:");
  -[CSSearchQueryContext maxAge](self, "maxAge");
  objc_msgSend(v4, "setMaxAge:");
  objc_msgSend(v4, "setEmbeddingGenerationTimeout:", -[CSSearchQueryContext embeddingGenerationTimeout](self, "embeddingGenerationTimeout"));
  objc_msgSend(v4, "setFsOnly:", -[CSSearchQueryContext fsOnly](self, "fsOnly"));
  objc_msgSend(v4, "setPlayback:", -[CSSearchQueryContext playback](self, "playback"));
  v24 = -[CSSearchQueryContext fuzzyMask](self, "fuzzyMask");
  objc_msgSend(v4, "setFuzzyMask:", v24, v25);
  v26 = -[CSSearchQueryContext fuzzyMatch](self, "fuzzyMatch");
  objc_msgSend(v4, "setFuzzyMatch:", v26, v27);
  objc_msgSend(v4, "setUserQueryOptions:", -[CSSearchQueryContext userQueryOptions](self, "userQueryOptions"));
  objc_msgSend(v4, "setQos:", -[CSSearchQueryContext qos](self, "qos"));
  -[CSSearchQueryContext currentTime](self, "currentTime");
  objc_msgSend(v4, "setCurrentTime:");
  -[CSSearchQueryContext options](self, "options");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOptions:", v28);

  -[CSSearchQueryContext scopes](self, "scopes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScopes:", v29);

  -[CSSearchQueryContext mountPoints](self, "mountPoints");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMountPoints:", v30);

  objc_msgSend(v4, "setSourceOptions:", -[CSSearchQueryContext sourceOptions](self, "sourceOptions"));
  -[CSSearchQueryContext reason](self, "reason");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReason:", v31);

  -[CSSearchQueryContext rewriteContext](self, "rewriteContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRewriteContext:", v32);

  objc_msgSend(v4, "setEnableSuggestionTokens:", -[CSSearchQueryContext enableSuggestionTokens](self, "enableSuggestionTokens"));
  objc_msgSend(v4, "setEnableRecentSuggestions:", -[CSSearchQueryContext enableRecentSuggestions](self, "enableRecentSuggestions"));
  objc_msgSend(v4, "setEnableResultCountsPerSuggestion:", -[CSSearchQueryContext enableResultCountsPerSuggestion](self, "enableResultCountsPerSuggestion"));
  objc_msgSend(v4, "setCurrentTokenScope:", -[CSSearchQueryContext currentTokenScope](self, "currentTokenScope"));
  if (self->_completionResultCount
    && -[NSString length](self->_completionString, "length")
    && -[NSArray count](self->_completionAttributes, "count"))
  {
    objc_msgSend(v4, "setCompletionOptions:", self->_completionOptions);
    objc_msgSend(v4, "setCompletionResultCount:", self->_completionResultCount);
    objc_msgSend(v4, "setCompletionString:", self->_completionString);
    objc_msgSend(v4, "setCompletionAttributes:", self->_completionAttributes);
    objc_msgSend(v4, "setCompletionWeights:", self->_completionWeights);
  }
  objc_msgSend(v4, "setEntitledAttributes:", -[CSSearchQueryContext entitledAttributes](self, "entitledAttributes"));
  -[CSSearchQueryContext rewriteContext](self, "rewriteContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRewriteContext:", v33);

  -[CSSearchQueryContext customFieldSpecifications](self, "customFieldSpecifications");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomFieldSpecifications:", v34);

  -[CSSearchQueryContext instantAnswersOverrideDate](self, "instantAnswersOverrideDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInstantAnswersOverrideDate:", v35);

  -[CSSearchQueryContext customResourceDirectory](self, "customResourceDirectory");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomResourceDirectory:", v36);

  -[CSSearchQueryContext resultMatchingAttributes](self, "resultMatchingAttributes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResultMatchingAttributes:", v37);

  -[CSSearchQueryContext queryUnderstandingOutput](self, "queryUnderstandingOutput");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryUnderstandingOutput:", v38);

  -[CSSearchQueryContext queryEmbedding](self, "queryEmbedding");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryEmbedding:", v39);

  objc_msgSend(v4, "setMaximumBatchSize:", -[CSSearchQueryContext maximumBatchSize](self, "maximumBatchSize"));
  objc_msgSend(v4, "setPriorityIndexQuery:", -[CSSearchQueryContext priorityIndexQuery](self, "priorityIndexQuery"));
  objc_msgSend(v4, "setDisableResultStreaming:", -[CSSearchQueryContext disableResultStreaming](self, "disableResultStreaming"));
  objc_msgSend(v4, "setFeedbackQueryID:", -[CSSearchQueryContext feedbackQueryID](self, "feedbackQueryID"));
  objc_msgSend(v4, "setAdvancedQuery:", -[CSSearchQueryContext advancedQuery](self, "advancedQuery"));
  objc_msgSend(v4, "setHasFreeTextQuery:", -[CSSearchQueryContext hasFreeTextQuery](self, "hasFreeTextQuery"));
  -[CSSearchQueryContext attributedUserQuery](self, "attributedUserQuery");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedUserQuery:", v40);

  objc_msgSend(v4, "setComputePhotosDerivedAttributes:", -[CSSearchQueryContext computePhotosDerivedAttributes](self, "computePhotosDerivedAttributes"));
  return v4;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (unint64_t)maximumBatchSize
{
  return self->_maximumBatchSize;
}

- (BOOL)disableResultStreaming
{
  return self->_disableResultStreaming;
}

- (_MDQueryRewriteContext)rewriteContext
{
  return self->_rewriteContext;
}

- (BOOL)priorityIndexQuery
{
  return self->_priorityIndexQuery;
}

- (void)setProtectionClasses:(id)a3
{
  objc_storeStrong((id *)&self->_protectionClasses, a3);
}

- (int)rankingType
{
  return self->_rankingType;
}

- (NSDictionary)options
{
  void *v3;
  void *v4;
  NSArray *fetchAttributes;
  NSArray *protectionClasses;
  NSArray *rankingQueries;
  NSArray *groupingRules;
  NSArray *preferredLanguages;
  NSArray *disableBundles;
  NSArray *filterQueries;
  NSString *filterQuery;
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
  NSArray *scopes;
  NSString *customResourceDirectory;
  NSArray *resultMatchingAttributes;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  fetchAttributes = self->_fetchAttributes;
  if (fetchAttributes)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", fetchAttributes, CFSTR("MDSearchQueryOptionFetchAttributes"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_fetchAttributes, CFSTR("SPQueryOptionFetchAttributes"));
  }
  protectionClasses = self->_protectionClasses;
  if (protectionClasses)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", protectionClasses, CFSTR("SPQueryOptionProtectionClasses"));
  rankingQueries = self->_rankingQueries;
  if (rankingQueries)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", rankingQueries, CFSTR("MDSearchQueryOptionRankingQueries"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_rankingQueries, CFSTR("SPQueryOptionRankingQueries"));
  }
  groupingRules = self->_groupingRules;
  if (groupingRules)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", groupingRules, CFSTR("SPQueryGroupingRules"));
  preferredLanguages = self->_preferredLanguages;
  if (preferredLanguages)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", preferredLanguages, CFSTR("SPQueryOptionPreferredLanguages"));
  disableBundles = self->_disableBundles;
  if (disableBundles)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", disableBundles, CFSTR("SPQueryOptionDisableBundles"));
  filterQueries = self->_filterQueries;
  if (filterQueries)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", filterQueries, CFSTR("SPQueryOptionFilterQueries"));
  filterQuery = self->_filterQuery;
  if (filterQuery)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", filterQuery, CFSTR("SPQueryOptionFilterQuery"));
  if (self->_dominantRankingQueryCount)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("SPQueryOptionDominantRankingQueryCount"));

  }
  if (self->_dominatedRankingQueryCount)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("SPQueryOptionDominatedRankingQueryCount"));

  }
  if (self->_shortcutBit)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("SPQueryOptionShortcutBit"));

  }
  if (self->_highMatchBit)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("SPQueryOptionHighMatchBit"));

  }
  if (self->_lowMatchBit)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("SPQueryOptionLowMatchBit"));

  }
  if (self->_highRecencyBit)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("SPQueryOptionHighRecencyBit"));

  }
  if (self->_lowRecencyBit)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("SPQueryOptionLowRecencyBit"));

  }
  if (self->_strongRankingQueryCount)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("SPQueryOptionStrongRankingQueryCount"));

  }
  if (self->_maxCount)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("MDSearchQueryOptionMaxCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxCount);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("SPQueryOptionMaxCount"));

  }
  if (self->_minCount)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("SPQueryOptionMinCount"));

  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_groupingRules, CFSTR("SPQueryGroupingRules"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minL2Score);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("SPQueryOptionMinL2Score"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxAge);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("SPQueryOptionMaxAge"));

  if (-[CSSearchQueryContext grouped](self, "grouped"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("MDSearchQueryOptionGrouped"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("SPQueryOptionGrouped"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_currentTime);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("SPQueryOptionCurrentTime"));

  scopes = self->_scopes;
  if (scopes)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", scopes, CFSTR("SPQueryOptionScopes"));
  customResourceDirectory = self->_customResourceDirectory;
  if (customResourceDirectory)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", customResourceDirectory, CFSTR("customResourceDirectory"));
  resultMatchingAttributes = self->_resultMatchingAttributes;
  if (resultMatchingAttributes)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", resultMatchingAttributes, CFSTR("SPQueryResultMatchingAttributes"));
  if (-[CSSearchQueryContext enablePhotosEntitySearch](self, "enablePhotosEntitySearch"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CSSearchQueryContext enablePhotosEntitySearch](self, "enablePhotosEntitySearch"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("SPQueryOptionEnablePhotosEntitySearch"));

  }
  if (-[CSSearchQueryContext isDateQueryContext](self, "isDateQueryContext"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CSSearchQueryContext isDateQueryContext](self, "isDateQueryContext"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("SPQueryOptionDateQueryContext"));

  }
  if (-[CSSearchQueryContext disableMetadataSearch](self, "disableMetadataSearch"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CSSearchQueryContext disableMetadataSearch](self, "disableMetadataSearch"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("SPQueryOptionDisableMetadataSearch"));

  }
  if (-[CSSearchQueryContext disableSemanticSearch](self, "disableSemanticSearch"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CSSearchQueryContext disableSemanticSearch](self, "disableSemanticSearch"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("SPQueryOptionDisableSemanticSearch"));

  }
  if (-[CSSearchQueryContext disableU2](self, "disableU2"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CSSearchQueryContext disableU2](self, "disableU2"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("SPQueryOptionDisableU2"));

  }
  if (-[CSSearchQueryContext computePhotosDerivedAttributes](self, "computePhotosDerivedAttributes"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SPQueryComputePhotosDerivedAttributes"));
  return (NSDictionary *)v4;
}

- (BOOL)grouped
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (BOOL)isDateQueryContext
{
  return (BYTE2(self->_flags) >> 2) & 1;
}

- (BOOL)enablePhotosEntitySearch
{
  return (BYTE2(self->_flags) >> 1) & 1;
}

- (NSArray)instantAnswersBundleIDs
{
  return self->_instantAnswersBundleIDs;
}

- (NSArray)additionalBundleIDs
{
  return self->_additionalBundleIDs;
}

- (void)setRewriteContext:(id)a3
{
  objc_storeStrong((id *)&self->_rewriteContext, a3);
}

- (void)setMinL2Score:(double)a3
{
  self->_minL2Score = a3;
}

- (void)setMaxAge:(double)a3
{
  self->_maxAge = a3;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (NSArray)protectionClasses
{
  return self->_protectionClasses;
}

- (void)setClientBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleID, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (int64_t)strongRankingQueryCount
{
  return self->_strongRankingQueryCount;
}

- (int64_t)shortcutBit
{
  return self->_shortcutBit;
}

- (NSArray)resultMatchingAttributes
{
  return self->_resultMatchingAttributes;
}

- (NSArray)rankingQueries
{
  return self->_rankingQueries;
}

- (NSDictionary)queryUnderstandingOutput
{
  return self->_queryUnderstandingOutput;
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (int64_t)lowRecencyBit
{
  return self->_lowRecencyBit;
}

- (int64_t)lowMatchBit
{
  return self->_lowMatchBit;
}

- (int64_t)highRecencyBit
{
  return self->_highRecencyBit;
}

- (int64_t)highMatchBit
{
  return self->_highMatchBit;
}

- (NSArray)groupingRules
{
  return self->_groupingRules;
}

- (uint64_t)fuzzyMatch
{
  return *(_QWORD *)(a1 + 368);
}

- (uint64_t)fuzzyMask
{
  return *(_QWORD *)(a1 + 352);
}

- (NSString)filterQuery
{
  return self->_filterQuery;
}

- (int)entitledAttributes
{
  return self->_entitledAttributes;
}

- (int64_t)dominatedRankingQueryCount
{
  return self->_dominatedRankingQueryCount;
}

- (int64_t)dominantRankingQueryCount
{
  return self->_dominantRankingQueryCount;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (NSArray)filterQueries
{
  return self->_filterQueries;
}

- (NSArray)instantAnswersQueries
{
  return self->_instantAnswersQueries;
}

- (NSArray)disableBundles
{
  return self->_disableBundles;
}

- (NSArray)additionalQueries
{
  return self->_additionalQueries;
}

- (void)setBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDs, a3);
}

- (void)setQueryID:(int64_t)a3
{
  self->_queryID = a3;
}

- (void)setInstantAnswersOverrideDate:(id)a3
{
  objc_storeStrong((id *)&self->_instantAnswersOverrideDate, a3);
}

- (id)instantAnswersOverrideDate
{
  return self->_instantAnswersOverrideDate;
}

- (CSSearchQueryContext)init
{
  CSSearchQueryContext *v2;
  CSSearchQueryContext *v3;
  NSArray *protectionClasses;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSSearchQueryContext;
  v2 = -[CSSearchQueryContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    protectionClasses = v2->_protectionClasses;
    v2->_protectionClasses = (NSArray *)MEMORY[0x1E0C9AA60];

    v3->_currentTime = CFAbsoluteTimeGetCurrent();
    v3->_minL2Score = -1.79769313e308;
    *(_WORD *)&v3->_enableSuggestionTokens = 0;
    v3->_enableResultCountsPerSuggestion = 0;
    v3->_maximumBatchSize = 0;
    v3->_feedbackQueryID = -2147483647;
    v3->_currentTokenScope = -1;
  }
  -[CSSearchQueryContext setFilterTopHits:](v3, "setFilterTopHits:", 1);
  return v3;
}

- (void)setQos:(unsigned int)a3
{
  self->_qos = a3;
}

- (void)setEntitledAttributes:(int)a3
{
  self->_entitledAttributes = a3;
}

- (BOOL)playback
{
  return BYTE1(self->_flags) & 1;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (void)setMaximumBatchSize:(unint64_t)a3
{
  self->_maximumBatchSize = a3;
}

- (int64_t)queryID
{
  return self->_queryID;
}

- (NSString)userQuery
{
  return self->_userQuery;
}

- (NSArray)scopes
{
  return self->_scopes;
}

- (NSArray)mountPoints
{
  return self->_mountPoints;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFilterQueries:(NSArray *)filterQueries
{
  objc_setProperty_nonatomic_copy(self, a2, filterQueries, 528);
}

- (void)setMaxCount:(int64_t)a3
{
  self->_maxCount = a3;
}

- (void)setRankingQueries:(id)a3
{
  objc_storeStrong((id *)&self->_rankingQueries, a3);
}

- (unsigned)userQueryOptions
{
  return self->_userQueryOptions;
}

- (CSSuggestion)suggestion
{
  return self->_suggestion;
}

- (CSSearchQuerySourceOptions)sourceOptions
{
  return self->_sourceOptions;
}

- (void)setUserQueryOptions:(unsigned int)a3
{
  self->_userQueryOptions = a3;
}

- (void)setUserQuery:(id)a3
{
  objc_storeStrong((id *)&self->_userQuery, a3);
}

- (void)setSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_suggestion, a3);
}

- (void)setStrongRankingQueryCount:(int64_t)a3
{
  self->_strongRankingQueryCount = a3;
}

- (void)setSourceOptions:(CSSearchQuerySourceOptions)sourceOptions
{
  self->_sourceOptions = sourceOptions;
}

- (void)setShortcutBit:(int64_t)a3
{
  self->_shortcutBit = a3;
}

- (void)setScopes:(id)a3
{
  objc_storeStrong((id *)&self->_scopes, a3);
}

- (void)setResultMatchingAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_resultMatchingAttributes, a3);
}

- (void)setRankingType:(int)a3
{
  self->_rankingType = a3;
}

- (void)setQueryUnderstandingOutput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (void)setPriorityIndexQuery:(BOOL)a3
{
  self->_priorityIndexQuery = a3;
}

- (void)setPreferredLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_preferredLanguages, a3);
}

- (void)setPlayback:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFEFF | v3;
}

- (void)setOptions:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
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
  id v34;

  v34 = a3;
  v4 = objc_msgSend(v34, "count");
  v5 = v34;
  if (v4)
  {
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("MDSearchQueryOptionFetchAttributes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      || (objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionFetchAttributes")),
          (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CSSearchQueryContext setFetchAttributes:](self, "setFetchAttributes:", v6);

    }
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("MDSearchQueryOptionRankingQueries"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      || (objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionRankingQueries")),
          (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CSSearchQueryContext setRankingQueries:](self, "setRankingQueries:", v7);

    }
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("MDSearchQueryOptionMaxCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      -[CSSearchQueryContext setMaxCount:](self, "setMaxCount:", objc_msgSend(v8, "integerValue"));
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryGroupingRules"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[CSSearchQueryContext setGroupingRules:](self, "setGroupingRules:", v10);
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionMinL2Score"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "doubleValue");
      -[CSSearchQueryContext setMinL2Score:](self, "setMinL2Score:");
    }
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionMaxAge"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "floatValue");
      -[CSSearchQueryContext setMaxAge:](self, "setMaxAge:", v13);
    }
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionMinCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      -[CSSearchQueryContext setMinCount:](self, "setMinCount:", objc_msgSend(v14, "integerValue"));
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("MDSearchQueryOptionGrouped"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      -[CSSearchQueryContext setGrouped:](self, "setGrouped:", objc_msgSend(v15, "BOOLValue"));
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionProtectionClasses"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      -[CSSearchQueryContext setProtectionClasses:](self, "setProtectionClasses:", v16);
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionStrongRankingQueryCount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      -[CSSearchQueryContext setStrongRankingQueryCount:](self, "setStrongRankingQueryCount:", objc_msgSend(v17, "integerValue"));
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionDominantRankingQueryCount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      -[CSSearchQueryContext setDominantRankingQueryCount:](self, "setDominantRankingQueryCount:", objc_msgSend(v18, "integerValue"));
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionDominatedRankingQueryCount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      -[CSSearchQueryContext setDominatedRankingQueryCount:](self, "setDominatedRankingQueryCount:", objc_msgSend(v19, "integerValue"));
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionShortcutBit"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      -[CSSearchQueryContext setShortcutBit:](self, "setShortcutBit:", objc_msgSend(v20, "integerValue"));
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionHighMatchBit"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      -[CSSearchQueryContext setHighMatchBit:](self, "setHighMatchBit:", objc_msgSend(v21, "integerValue"));
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionLowMatchBit"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      -[CSSearchQueryContext setLowMatchBit:](self, "setLowMatchBit:", objc_msgSend(v22, "integerValue"));
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionHighRecencyBit"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      -[CSSearchQueryContext setHighRecencyBit:](self, "setHighRecencyBit:", objc_msgSend(v23, "integerValue"));
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionLowRecencyBit"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      -[CSSearchQueryContext setLowRecencyBit:](self, "setLowRecencyBit:", objc_msgSend(v24, "integerValue"));
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionPreferredLanguages"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      -[CSSearchQueryContext setPreferredLanguages:](self, "setPreferredLanguages:", v25);
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionFilterQueries"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      -[CSSearchQueryContext setFilterQueries:](self, "setFilterQueries:", v26);
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionFilterQuery"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      -[CSSearchQueryContext setFilterQuery:](self, "setFilterQuery:", v27);
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionDisableBundles"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
      -[CSSearchQueryContext setDisableBundles:](self, "setDisableBundles:", v28);
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionCurrentTime"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v29, "doubleValue");
      -[CSSearchQueryContext setCurrentTime:](self, "setCurrentTime:");
    }
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryOptionScopes"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
      -[CSSearchQueryContext setScopes:](self, "setScopes:", v30);
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("customResourceDirectory"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      -[CSSearchQueryContext setCustomResourceDirectory:](self, "setCustomResourceDirectory:", v31);
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryResultMatchingAttributes"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
      -[CSSearchQueryContext setResultMatchingAttributes:](self, "setResultMatchingAttributes:", v32);
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SPQueryComputePhotosDerivedAttributes"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
      -[CSSearchQueryContext setComputePhotosDerivedAttributes:](self, "setComputePhotosDerivedAttributes:", objc_msgSend(v33, "BOOLValue"));

    v5 = v34;
  }

}

- (void)setFetchAttributes:(NSArray *)fetchAttributes
{
  objc_class *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0C99E40];
  v5 = fetchAttributes;
  v8 = (id)objc_msgSend([v4 alloc], "initWithArray:", v5);

  objc_msgSend(v8, "array");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v7 = self->_fetchAttributes;
  self->_fetchAttributes = v6;

}

- (void)setMountPoints:(id)a3
{
  objc_storeStrong((id *)&self->_mountPoints, a3);
}

- (void)setMinCount:(int64_t)a3
{
  self->_minCount = a3;
}

- (void)setMaxSuggestionCount:(int64_t)a3
{
  self->_maxSuggestionCount = a3;
}

- (void)setMarkedTextArray:(id)a3
{
  objc_storeStrong((id *)&self->_markedTextArray, a3);
}

- (void)setLowRecencyBit:(int64_t)a3
{
  self->_lowRecencyBit = a3;
}

- (void)setLowMatchBit:(int64_t)a3
{
  self->_lowMatchBit = a3;
}

- (void)setKeyboardLanguage:(NSString *)keyboardLanguage
{
  objc_storeStrong((id *)&self->_keyboardLanguage, keyboardLanguage);
}

- (void)setInstantAnswersQueries:(id)a3
{
  objc_storeStrong((id *)&self->_instantAnswersQueries, a3);
}

- (void)setInstantAnswersBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_instantAnswersBundleIDs, a3);
}

- (void)setHighRecencyBit:(int64_t)a3
{
  self->_highRecencyBit = a3;
}

- (void)setHighMatchBit:(int64_t)a3
{
  self->_highMatchBit = a3;
}

- (void)setHasFreeTextQuery:(BOOL)a3
{
  self->_hasFreeTextQuery = a3;
}

- (void)setGroupingRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setFuzzyMatch:(CSSearchQueryContext *)self
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)self->_fuzzyMatch = v2;
  *(_QWORD *)&self->_fuzzyMatch[8] = v3;
}

- (void)setFuzzyMask:(CSSearchQueryContext *)self
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)self->_fuzzyMask = v2;
  *(_QWORD *)&self->_fuzzyMask[8] = v3;
}

- (void)setFsOnly:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFF7F | v3;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void)setFilterQuery:(id)a3
{
  objc_storeStrong((id *)&self->_filterQuery, a3);
}

- (void)setFeedbackQueryID:(int64_t)a3
{
  self->_feedbackQueryID = a3;
}

- (void)setEnableSuggestionTokens:(BOOL)a3
{
  self->_enableSuggestionTokens = a3;
}

- (void)setEnableResultCountsPerSuggestion:(BOOL)a3
{
  self->_enableResultCountsPerSuggestion = a3;
}

- (void)setEnableRecentSuggestions:(BOOL)a3
{
  self->_enableRecentSuggestions = a3;
}

- (void)setDominatedRankingQueryCount:(int64_t)a3
{
  self->_dominatedRankingQueryCount = a3;
}

- (void)setDominantRankingQueryCount:(int64_t)a3
{
  self->_dominantRankingQueryCount = a3;
}

- (void)setDisableResultStreaming:(BOOL)a3
{
  self->_disableResultStreaming = a3;
}

- (void)setDisableBundles:(id)a3
{
  objc_storeStrong((id *)&self->_disableBundles, a3);
}

- (void)setCustomResourceDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_customResourceDirectory, a3);
}

- (void)setCustomFieldSpecifications:(id)a3
{
  objc_storeStrong((id *)&self->_customFieldSpecifications, a3);
}

- (void)setCurrentTokenScope:(int64_t)a3
{
  self->_currentTokenScope = a3;
}

- (void)setAdvancedQuery:(BOOL)a3
{
  self->_advancedQuery = a3;
}

- (void)setAdditionalQueries:(id)a3
{
  objc_storeStrong((id *)&self->_additionalQueries, a3);
}

- (void)setAdditionalBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_additionalBundleIDs, a3);
}

- (double)minL2Score
{
  return self->_minL2Score;
}

- (int64_t)minCount
{
  return self->_minCount;
}

- (int64_t)maxSuggestionCount
{
  return self->_maxSuggestionCount;
}

- (double)maxAge
{
  return self->_maxAge;
}

- (NSArray)markedTextArray
{
  return self->_markedTextArray;
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (BOOL)hasFreeTextQuery
{
  return self->_hasFreeTextQuery;
}

- (BOOL)fsOnly
{
  return LOBYTE(self->_flags) >> 7;
}

- (int64_t)feedbackQueryID
{
  return self->_feedbackQueryID;
}

- (BOOL)enableSuggestionTokens
{
  return self->_enableSuggestionTokens;
}

- (BOOL)enableResultCountsPerSuggestion
{
  return self->_enableResultCountsPerSuggestion;
}

- (BOOL)enableRecentSuggestions
{
  return self->_enableRecentSuggestions;
}

- (id)customResourceDirectory
{
  return self->_customResourceDirectory;
}

- (id)customFieldSpecifications
{
  return self->_customFieldSpecifications;
}

- (int64_t)currentTokenScope
{
  return self->_currentTokenScope;
}

- (BOOL)advancedQuery
{
  return self->_advancedQuery;
}

- (BOOL)live
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (unsigned)qos
{
  return self->_qos;
}

- (BOOL)counting
{
  return (LOBYTE(self->_flags) >> 3) & 1;
}

- (BOOL)attribute
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

- (id)xpc_dictionary
{
  xpc_object_t v3;
  NSString *clientBundleID;
  __CFBitVector *nonTopHitFetchAttributeIndexesBits;
  CFIndex Count;
  CFIndex v7;
  size_t v8;
  UInt8 *v9;
  UInt8 *v10;
  int64_t v11;
  const char *v12;
  uint64_t rankingType;
  NSArray *filterQueries;
  NSString *filterQuery;
  NSArray *groupingRules;
  uint64_t completionOptions;
  NSArray *completionWeights;
  uint64_t sourceOptions;
  NSDate *instantAnswersOverrideDate;
  double v21;
  NSString *customResourceDirectory;
  NSAttributedString *attributedUserQuery;
  id v24;
  NSArray *resultMatchingAttributes;
  NSDictionary *queryUnderstandingOutput;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  NSData *queryEmbedding;
  id v33;
  CFRange v34;

  v3 = xpc_dictionary_create(0, 0, 0);
  clientBundleID = self->_clientBundleID;
  if (clientBundleID)
    xpc_dictionary_set_string(v3, "cbi", -[NSString UTF8String](clientBundleID, "UTF8String"));
  +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, self->_fetchAttributes, "fa");
  nonTopHitFetchAttributeIndexesBits = self->_nonTopHitFetchAttributeIndexesBits;
  if (nonTopHitFetchAttributeIndexesBits)
  {
    Count = CFBitVectorGetCount(nonTopHitFetchAttributeIndexesBits);
    if (Count >= 1)
    {
      v7 = Count;
      v8 = (unint64_t)(Count + 7) >> 3;
      v9 = (UInt8 *)malloc_type_malloc(v8, 0x7E18BA44uLL);
      if (v9)
      {
        v10 = v9;
        v34.location = 0;
        v34.length = v7;
        CFBitVectorGetBits(self->_nonTopHitFetchAttributeIndexesBits, v34, v9);
        xpc_dictionary_set_data(v3, "tpefa", v10, v8);
        free(v10);
        v11 = CFBitVectorGetCount(self->_nonTopHitFetchAttributeIndexesBits);
        xpc_dictionary_set_int64(v3, "ctpefa", v11);
      }
    }
  }
  +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, self->_protectionClasses, "pcs");
  +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, self->_bundleIDs, "bi");
  +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, self->_additionalBundleIDs, "abi");
  +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, self->_instantAnswersBundleIDs, "iab");
  +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, self->_answerAttributes, "aai");
  +[CSXPCConnection dictionary:setStringOrDictionaryArray:forKey:](CSXPCConnection, "dictionary:setStringOrDictionaryArray:forKey:", v3, self->_rankingQueries, "rq");
  +[CSXPCConnection dictionary:setStringOrDictionaryArray:forKey:](CSXPCConnection, "dictionary:setStringOrDictionaryArray:forKey:", v3, self->_additionalQueries, "aq");
  +[CSXPCConnection dictionary:setStringOrDictionaryArray:forKey:](CSXPCConnection, "dictionary:setStringOrDictionaryArray:forKey:", v3, self->_instantAnswersQueries, "iaq");
  +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, self->_preferredLanguages, "pl");
  +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, self->_markedTextArray, "mt");
  +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, self->_disableBundles, "db");
  v12 = -[NSString UTF8String](self->_userQuery, "UTF8String");
  if (v12)
    xpc_dictionary_set_string(v3, "uq", v12);
  rankingType = self->_rankingType;
  if ((_DWORD)rankingType)
    xpc_dictionary_set_uint64(v3, "rt", rankingType);
  if (-[NSString length](self->_keyboardLanguage, "length"))
    xpc_dictionary_set_string(v3, "kl", -[NSString UTF8String](self->_keyboardLanguage, "UTF8String"));
  filterQueries = self->_filterQueries;
  if (filterQueries)
    +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, filterQueries, "fqs");
  filterQuery = self->_filterQuery;
  if (filterQuery)
    xpc_dictionary_set_string(v3, "fq", -[NSString UTF8String](filterQuery, "UTF8String"));
  groupingRules = self->_groupingRules;
  if (groupingRules)
    +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, groupingRules, "gr");
  if (self->_completionResultCount
    && -[NSString length](self->_completionString, "length")
    && -[NSString UTF8String](self->_completionString, "UTF8String")
    && -[NSArray count](self->_completionAttributes, "count"))
  {
    completionOptions = self->_completionOptions;
    if ((_DWORD)completionOptions)
      xpc_dictionary_set_uint64(v3, "co", completionOptions);
    xpc_dictionary_set_uint64(v3, "cc", self->_completionResultCount);
    xpc_dictionary_set_string(v3, "cs", -[NSString UTF8String](self->_completionString, "UTF8String"));
    +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, self->_completionAttributes, "ca");
    completionWeights = self->_completionWeights;
    if (completionWeights)
      +[CSXPCConnection dictionary:setNumberArray:forKey:](CSXPCConnection, "dictionary:setNumberArray:forKey:", v3, completionWeights, "cw");
  }
  xpc_dictionary_set_BOOL(v3, "qdrvp", self->_computePhotosDerivedAttributes);
  xpc_dictionary_set_uint64(v3, "src", self->_strongRankingQueryCount);
  xpc_dictionary_set_uint64(v3, "drc", self->_dominantRankingQueryCount);
  xpc_dictionary_set_uint64(v3, "ddrc", self->_dominatedRankingQueryCount);
  xpc_dictionary_set_uint64(v3, "sb", self->_shortcutBit);
  xpc_dictionary_set_uint64(v3, "hmb", self->_highMatchBit);
  xpc_dictionary_set_uint64(v3, "lmb", self->_lowMatchBit);
  xpc_dictionary_set_uint64(v3, "hrb", self->_highRecencyBit);
  xpc_dictionary_set_uint64(v3, "lrb", self->_lowRecencyBit);
  xpc_dictionary_set_uint64(v3, "mxc", self->_maxCount);
  xpc_dictionary_set_uint64(v3, "mnc", self->_minCount);
  xpc_dictionary_set_uint64(v3, "mrc", self->_maxRankedResultCount);
  xpc_dictionary_set_double(v3, "ml2", self->_minL2Score);
  xpc_dictionary_set_double(v3, "mage", self->_maxAge);
  xpc_dictionary_set_uint64(v3, "qi", self->_queryID);
  xpc_dictionary_set_uint64(v3, "f", self->_flags);
  xpc_dictionary_set_double(v3, "ct", self->_currentTime);
  xpc_dictionary_set_uint64(v3, "qos", self->_qos);
  xpc_dictionary_set_uint64(v3, "uqo", self->_userQueryOptions);
  xpc_dictionary_set_uint64(v3, "batsz", self->_maximumBatchSize);
  xpc_dictionary_set_BOOL(v3, "piq", self->_priorityIndexQuery);
  xpc_dictionary_set_BOOL(v3, "qsd", self->_disableResultStreaming);
  xpc_dictionary_set_BOOL(v3, "adv", self->_advancedQuery);
  xpc_dictionary_set_BOOL(v3, "frex", self->_hasFreeTextQuery);
  sourceOptions = self->_sourceOptions;
  if (sourceOptions)
    xpc_dictionary_set_uint64(v3, "so", sourceOptions);
  if (-[NSArray count](self->_scopes, "count"))
    +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, self->_scopes, "sp");
  if (-[NSArray count](self->_mountPoints, "count"))
    +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, self->_mountPoints, "mp");
  instantAnswersOverrideDate = self->_instantAnswersOverrideDate;
  if (instantAnswersOverrideDate)
  {
    -[NSDate timeIntervalSince1970](instantAnswersOverrideDate, "timeIntervalSince1970");
    xpc_dictionary_set_date(v3, "ovda", (uint64_t)v21);
  }
  customResourceDirectory = self->_customResourceDirectory;
  if (customResourceDirectory)
    xpc_dictionary_set_string(v3, "crd", -[NSString UTF8String](customResourceDirectory, "UTF8String"));
  attributedUserQuery = self->_attributedUserQuery;
  if (attributedUserQuery)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", attributedUserQuery, 1, 0);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v3, "pes", (const void *)objc_msgSend(v24, "bytes"), objc_msgSend(v24, "length"));

  }
  resultMatchingAttributes = self->_resultMatchingAttributes;
  if (resultMatchingAttributes)
    +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, resultMatchingAttributes, "rma");
  queryUnderstandingOutput = self->_queryUnderstandingOutput;
  if (queryUnderstandingOutput)
  {
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", queryUnderstandingOutput, 1, &v33);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v33;
    if (v28)
    {
      logForCSLogCategoryQuery();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[CSSearchQueryContext xpc_dictionary].cold.1();

    }
    else
    {
      v30 = objc_retainAutorelease(v27);
      xpc_dictionary_set_data(v3, "qu", (const void *)objc_msgSend(v30, "bytes"), objc_msgSend(v30, "length"));
    }

  }
  queryEmbedding = self->_queryEmbedding;
  if (queryEmbedding)
    xpc_dictionary_set_data(v3, "qemb", -[NSData bytes](queryEmbedding, "bytes"), -[NSData length](self->_queryEmbedding, "length"));
  return v3;
}

- (BOOL)includeUserActivities
{
  return (BYTE1(self->_flags) >> 1) & 1;
}

- (void)setInternal:(BOOL)a3
{
  self->_flags = self->_flags & 0xFFFFFFFE | a3;
}

- (void)setLowPriority:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFFDF | v3;
}

- (void)setDisableBlockingOnIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFBFF | v3;
}

- (void)setLive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFFFB | v3;
}

- (CSSearchQueryContext)initWithQoS:(unsigned int)a3
{
  CSSearchQueryContext *result;

  result = -[CSSearchQueryContext init](self, "init");
  if (result)
    result->_qos = a3;
  return result;
}

- (void)dealloc
{
  __CFBitVector *nonTopHitFetchAttributeIndexesBits;
  objc_super v4;

  nonTopHitFetchAttributeIndexesBits = self->_nonTopHitFetchAttributeIndexesBits;
  if (nonTopHitFetchAttributeIndexesBits)
    CFRelease(nonTopHitFetchAttributeIndexesBits);
  v4.receiver = self;
  v4.super_class = (Class)CSSearchQueryContext;
  -[CSSearchQueryContext dealloc](&v4, sel_dealloc);
}

- (void)setTopHitExtraFetchAttributeCount:(int64_t)a3
{
  self->_topHitExtraFetchAttributeCount = a3;
}

- (int64_t)topHitExtraFetchAttributeCount
{
  return self->_topHitExtraFetchAttributeCount;
}

- (__CFBitVector)nonTopHitFetchAttributeIndexesBits
{
  return self->_nonTopHitFetchAttributeIndexesBits;
}

- (void)setNonTopHitFetchAttributeIndexesBits:(__CFBitVector *)a3
{
  __CFBitVector *nonTopHitFetchAttributeIndexesBits;

  if (a3)
    CFRetain(a3);
  nonTopHitFetchAttributeIndexesBits = self->_nonTopHitFetchAttributeIndexesBits;
  if (nonTopHitFetchAttributeIndexesBits)
    CFRelease(nonTopHitFetchAttributeIndexesBits);
  self->_nonTopHitFetchAttributeIndexesBits = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setAnswerAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_answerAttributes, a3);
}

- (NSArray)answerAttributes
{
  return self->_answerAttributes;
}

- (void)setMaxItemCount:(int64_t)a3
{
  self->_maxCount = a3;
}

- (int64_t)maxItemCount
{
  return self->_maxCount;
}

- (void)setMaxRankedResultCount:(int64_t)a3
{
  self->_maxRankedResultCount = a3;
}

- (int64_t)maxRankedResultCount
{
  return self->_maxRankedResultCount;
}

- (void)setCompletionResultCount:(int64_t)a3
{
  self->_completionResultCount = a3;
}

- (void)setEmbeddingGenerationTimeout:(int64_t)a3
{
  self->_embeddingGenerationTimeout = a3;
}

- (int64_t)embeddingGenerationTimeout
{
  return self->_embeddingGenerationTimeout;
}

- (void)setEmbeddingRelevanceThreshold:(double)a3
{
  self->_embeddingRelevanceThreshold = a3;
}

- (double)embeddingRelevanceThreshold
{
  return self->_embeddingRelevanceThreshold;
}

- (void)setGrouped:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFFFD | v3;
}

- (void)setCounting:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFFF7 | v3;
}

- (void)setAttribute:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFFEF | v3;
}

- (BOOL)parseUserQuery
{
  return (LOBYTE(self->_flags) >> 6) & 1;
}

- (void)setParseUserQuery:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFFBF | v3;
}

- (BOOL)disableNLP
{
  return (BYTE1(self->_flags) >> 6) & 1;
}

- (void)setDisableNLP:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFBFFF | v3;
}

- (void)setEnableInstantAnswers:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFEFFFF | v3;
}

- (void)setGenerateSuggestions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFF7FF | v3;
}

- (BOOL)disableSemanticSearch
{
  return (BYTE2(self->_flags) >> 3) & 1;
}

- (void)setDisableSemanticSearch:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFF7FFFF | v3;
}

- (BOOL)disableSafetyCheck
{
  return BYTE2(self->_flags) >> 7;
}

- (void)setDisableSafetyCheck:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFF7FFFFF | v3;
}

- (BOOL)disableMetadataSearch
{
  return (BYTE2(self->_flags) >> 4) & 1;
}

- (void)setDisableMetadataSearch:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFEFFFFF | v3;
}

- (BOOL)disableU2
{
  return HIBYTE(self->_flags) & 1;
}

- (void)setDisableU2:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFEFFFFFF | v3;
}

- (BOOL)filterTopHits
{
  return (BYTE2(self->_flags) >> 5) & 1;
}

- (void)setFilterTopHits:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFDFFFFF | v3;
}

- (BOOL)privateQuery
{
  return (BYTE2(self->_flags) >> 6) & 1;
}

- (void)setPrivateQuery:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFBFFFFF | v3;
}

- (void)setIncludeUserActivities:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFDFF | v3;
}

- (BOOL)pommes
{
  return (BYTE1(self->_flags) >> 4) & 1;
}

- (void)setPommes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFEFFF | v3;
}

- (BOOL)pommesSuggestions
{
  return (BYTE1(self->_flags) >> 5) & 1;
}

- (void)setPommesSuggestions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFDFFF | v3;
}

- (BOOL)pommesZKW
{
  return BYTE1(self->_flags) >> 7;
}

- (void)setPommesZKW:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFF7FFF | v3;
}

- (void)setEnablePhotosEntitySearch:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFDFFFF | v3;
}

- (void)setIsDateQueryContext:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFBFFFF | v3;
}

+ (id)pommesSupportedBundleIDs
{
  if (pommesSupportedBundleIDs_onceToken != -1)
    dispatch_once(&pommesSupportedBundleIDs_onceToken, &__block_literal_global_17);
  return (id)pommesSupportedBundleIDs_pommesSupportedBundleIDs;
}

void __48__CSSearchQueryContext_pommesSupportedBundleIDs__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E242F988);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pommesSupportedBundleIDs_pommesSupportedBundleIDs;
  pommesSupportedBundleIDs_pommesSupportedBundleIDs = v0;

}

- (BOOL)isMail
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[CSSearchQueryContext bundleIDs](self, "bundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", CFSTR("com.apple.mobilemail"));

  }
  return v5;
}

- (BOOL)isPhotos
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[CSSearchQueryContext bundleIDs](self, "bundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", CFSTR("com.apple.mobileslideshow"));

  }
  return v5;
}

- (BOOL)isNotes
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[CSSearchQueryContext bundleIDs](self, "bundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", CFSTR("com.apple.mobilenotes"));

  }
  return v5;
}

- (BOOL)isMessages
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[CSSearchQueryContext bundleIDs](self, "bundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", CFSTR("com.apple.MobileSMS"));

  }
  return v5;
}

- (BOOL)isSafari
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[CSSearchQueryContext bundleIDs](self, "bundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsObject:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.argos.BlendABApp2")) & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        -[CSSearchQueryContext bundleIDs](self, "bundleIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v9, "containsObject:", CFSTR("com.argos.BlendABApp2"));

      }
    }

  }
  return v5;
}

- (BOOL)isPommesCtl
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.pommesctl")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[CSSearchQueryContext bundleIDs](self, "bundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", CFSTR("com.apple.pommesctl"));

  }
  return v5;
}

- (BOOL)isFinder
{
  return 0;
}

- (id)pommesEnabledBundleID
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0C99E20];
  -[CSSearchQueryContext bundleIDs](self, "bundleIDs");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = v3;
  else
    v5 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CSSearchQueryContext pommesSupportedBundleIDs](CSSearchQueryContext, "pommesSupportedBundleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intersectSet:", v7);

  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)setNormalizedSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_normalizedSearchQuery, a3);
}

- (id)normalizedSearchQuery
{
  return self->_normalizedSearchQuery;
}

- (void)setCompletionString:(id)a3
{
  objc_storeStrong((id *)&self->_completionString, a3);
}

- (void)setCompletionAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_completionAttributes, a3);
}

- (void)setCompletionWeights:(id)a3
{
  objc_storeStrong((id *)&self->_completionWeights, a3);
}

- (void)setCompletionOptions:(unsigned int)a3
{
  self->_completionOptions = a3;
}

- (void)encodeWithCoder:(id)a3
{
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
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v4 = (void *)MEMORY[0x18D782104]();
  -[CSSearchQueryContext fetchAttributes](self, "fetchAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v5, CFSTR("fetchAttributes"));

  -[CSSearchQueryContext protectionClasses](self, "protectionClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v6, CFSTR("protectionClasses"));

  -[CSSearchQueryContext bundleIDs](self, "bundleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v7, CFSTR("bundleIDs"));

  -[CSSearchQueryContext additionalBundleIDs](self, "additionalBundleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v8, CFSTR("additionalBundleIDs"));

  -[CSSearchQueryContext instantAnswersBundleIDs](self, "instantAnswersBundleIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v9, CFSTR("instantAnswersBundleIDs"));

  -[CSSearchQueryContext answerAttributes](self, "answerAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v10, CFSTR("answerAttributes"));

  -[CSSearchQueryContext rankingQueries](self, "rankingQueries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v11, CFSTR("rankingQueries"));

  -[CSSearchQueryContext groupingRules](self, "groupingRules");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v12, CFSTR("groupingRules"));

  -[CSSearchQueryContext additionalQueries](self, "additionalQueries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v13, CFSTR("additionalQueries"));

  -[CSSearchQueryContext instantAnswersQueries](self, "instantAnswersQueries");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v14, CFSTR("instantAnswersQueries"));

  -[CSSearchQueryContext preferredLanguages](self, "preferredLanguages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v15, CFSTR("preferredLanguages"));

  -[CSSearchQueryContext keyboardLanguage](self, "keyboardLanguage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v16, CFSTR("keyboardLanguage"));

  -[CSSearchQueryContext markedTextArray](self, "markedTextArray");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v17, CFSTR("markedTextArray"));

  -[CSSearchQueryContext disableBundles](self, "disableBundles");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v18, CFSTR("disableBundles"));

  -[CSSearchQueryContext userQuery](self, "userQuery");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v19, CFSTR("userQuery"));

  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext rankingType](self, "rankingType"), CFSTR("rankingType"));
  -[CSSearchQueryContext filterQueries](self, "filterQueries");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v20, CFSTR("filterQueries"));

  -[CSSearchQueryContext filterQuery](self, "filterQuery");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v21, CFSTR("filterQuery"));

  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext currentTokenScope](self, "currentTokenScope"), CFSTR("currentTokenScope"));
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext strongRankingQueryCount](self, "strongRankingQueryCount"), CFSTR("strongRankingQueryCount"));
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext dominantRankingQueryCount](self, "dominantRankingQueryCount"), CFSTR("dominantRankingQueryCount"));
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext dominatedRankingQueryCount](self, "dominatedRankingQueryCount"), CFSTR("dominatedRankingQueryCount"));
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext shortcutBit](self, "shortcutBit"), CFSTR("shortcutBit"));
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext highMatchBit](self, "highMatchBit"), CFSTR("highMatchBit"));
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext lowMatchBit](self, "lowMatchBit"), CFSTR("lowMatchBit"));
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext highRecencyBit](self, "highRecencyBit"), CFSTR("highRecencyBit"));
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext lowRecencyBit](self, "lowRecencyBit"), CFSTR("lowRecencyBit"));
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext maxCount](self, "maxCount"), CFSTR("maxCount"));
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext minCount](self, "minCount"), CFSTR("minCount"));
  -[CSSearchQueryContext minL2Score](self, "minL2Score");
  objc_msgSend(v28, "encodeDouble:forKey:", CFSTR("minL2Score"));
  -[CSSearchQueryContext maxAge](self, "maxAge");
  *(float *)&v22 = v22;
  objc_msgSend(v28, "encodeFloat:forKey:", CFSTR("maxAge"), v22);
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext queryID](self, "queryID"), CFSTR("queryID"));
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext flags](self, "flags"), CFSTR("flags"));
  -[CSSearchQueryContext currentTime](self, "currentTime");
  objc_msgSend(v28, "encodeDouble:forKey:", CFSTR("currentTime"));
  -[CSSearchQueryContext scopes](self, "scopes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v23, CFSTR("scopes"));

  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext qos](self, "qos"), CFSTR("qos"));
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext userQueryOptions](self, "userQueryOptions"), CFSTR("userQueryOptions"));
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext sourceOptions](self, "sourceOptions"), CFSTR("so"));
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext maximumBatchSize](self, "maximumBatchSize"), CFSTR("maximumBatchSize"));
  -[CSSearchQueryContext customFieldSpecifications](self, "customFieldSpecifications");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v24, CFSTR("customFieldSpecifications"));

  -[CSSearchQueryContext instantAnswersOverrideDate](self, "instantAnswersOverrideDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v25, CFSTR("instantAnswersOverrideDate"));

  -[CSSearchQueryContext customResourceDirectory](self, "customResourceDirectory");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v26, CFSTR("customResourceDirectory"));

  -[CSSearchQueryContext resultMatchingAttributes](self, "resultMatchingAttributes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v27, CFSTR("resultMatchingAttributes"));

  objc_msgSend(v28, "encodeBool:forKey:", -[CSSearchQueryContext computePhotosDerivedAttributes](self, "computePhotosDerivedAttributes"), CFSTR("computePhotosDerivedAttributes"));
  objc_autoreleasePoolPop(v4);

}

- (CSSearchQueryContext)initWithCoder:(id)a3
{
  id v4;
  CSSearchQueryContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *fetchAttributes;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *protectionClasses;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *bundleIDs;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *additionalBundleIDs;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSArray *instantAnswersBundleIDs;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSArray *answerAttributes;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSArray *rankingQueries;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSArray *groupingRules;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSArray *additionalQueries;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  NSArray *instantAnswersQueries;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSArray *preferredLanguages;
  uint64_t v62;
  NSString *keyboardLanguage;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSArray *markedTextArray;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  NSArray *disableBundles;
  uint64_t v74;
  NSString *userQuery;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  NSArray *filterQueries;
  uint64_t v81;
  NSString *filterQuery;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  NSArray *scopes;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  NSArray *customFieldSpecifications;
  uint64_t v94;
  NSDate *instantAnswersOverrideDate;
  uint64_t v96;
  NSString *customResourceDirectory;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  NSArray *resultMatchingAttributes;
  objc_super v104;
  _QWORD v105[2];
  _QWORD v106[2];
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[4];
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[2];
  _QWORD v120[2];
  _QWORD v121[3];

  v121[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v104.receiver = self;
  v104.super_class = (Class)CSSearchQueryContext;
  v5 = -[CSSearchQueryContext init](&v104, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D782104]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v121[0] = objc_opt_class();
    v121[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("fetchAttributes"));
    v10 = objc_claimAutoreleasedReturnValue();
    fetchAttributes = v5->_fetchAttributes;
    v5->_fetchAttributes = (NSArray *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v120[0] = objc_opt_class();
    v120[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("protectionClasses"));
    v15 = objc_claimAutoreleasedReturnValue();
    protectionClasses = v5->_protectionClasses;
    v5->_protectionClasses = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v119[0] = objc_opt_class();
    v119[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("bundleIDs"));
    v20 = objc_claimAutoreleasedReturnValue();
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v118[0] = objc_opt_class();
    v118[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("additionalBundleIDs"));
    v25 = objc_claimAutoreleasedReturnValue();
    additionalBundleIDs = v5->_additionalBundleIDs;
    v5->_additionalBundleIDs = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v117[0] = objc_opt_class();
    v117[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("instantAnswersBundleIDs"));
    v30 = objc_claimAutoreleasedReturnValue();
    instantAnswersBundleIDs = v5->_instantAnswersBundleIDs;
    v5->_instantAnswersBundleIDs = (NSArray *)v30;

    v32 = (void *)MEMORY[0x1E0C99E60];
    v116[0] = objc_opt_class();
    v116[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWithArray:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("answerAttributes"));
    v35 = objc_claimAutoreleasedReturnValue();
    answerAttributes = v5->_answerAttributes;
    v5->_answerAttributes = (NSArray *)v35;

    v37 = (void *)MEMORY[0x1E0C99E60];
    v115[0] = objc_opt_class();
    v115[1] = objc_opt_class();
    v115[2] = objc_opt_class();
    v115[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setWithArray:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("rankingQueries"));
    v40 = objc_claimAutoreleasedReturnValue();
    rankingQueries = v5->_rankingQueries;
    v5->_rankingQueries = (NSArray *)v40;

    v42 = (void *)MEMORY[0x1E0C99E60];
    v114[0] = objc_opt_class();
    v114[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setWithArray:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v44, CFSTR("groupingRules"));
    v45 = objc_claimAutoreleasedReturnValue();
    groupingRules = v5->_groupingRules;
    v5->_groupingRules = (NSArray *)v45;

    v47 = (void *)MEMORY[0x1E0C99E60];
    v113[0] = objc_opt_class();
    v113[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setWithArray:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, CFSTR("additionalQueries"));
    v50 = objc_claimAutoreleasedReturnValue();
    additionalQueries = v5->_additionalQueries;
    v5->_additionalQueries = (NSArray *)v50;

    v52 = (void *)MEMORY[0x1E0C99E60];
    v112[0] = objc_opt_class();
    v112[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setWithArray:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v54, CFSTR("instantAnswersQueries"));
    v55 = objc_claimAutoreleasedReturnValue();
    instantAnswersQueries = v5->_instantAnswersQueries;
    v5->_instantAnswersQueries = (NSArray *)v55;

    v5->_currentTokenScope = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("currentTokenScope"));
    v57 = (void *)MEMORY[0x1E0C99E60];
    v111[0] = objc_opt_class();
    v111[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setWithArray:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v59, CFSTR("preferredLanguages"));
    v60 = objc_claimAutoreleasedReturnValue();
    preferredLanguages = v5->_preferredLanguages;
    v5->_preferredLanguages = (NSArray *)v60;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardLanguage"));
    v62 = objc_claimAutoreleasedReturnValue();
    keyboardLanguage = v5->_keyboardLanguage;
    v5->_keyboardLanguage = (NSString *)v62;

    v64 = (void *)MEMORY[0x1E0C99E60];
    v110[0] = objc_opt_class();
    v110[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 2);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setWithArray:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v66, CFSTR("markedTextArray"));
    v67 = objc_claimAutoreleasedReturnValue();
    markedTextArray = v5->_markedTextArray;
    v5->_markedTextArray = (NSArray *)v67;

    v69 = (void *)MEMORY[0x1E0C99E60];
    v109[0] = objc_opt_class();
    v109[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 2);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setWithArray:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v71, CFSTR("disableBundles"));
    v72 = objc_claimAutoreleasedReturnValue();
    disableBundles = v5->_disableBundles;
    v5->_disableBundles = (NSArray *)v72;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userQuery"));
    v74 = objc_claimAutoreleasedReturnValue();
    userQuery = v5->_userQuery;
    v5->_userQuery = (NSString *)v74;

    v5->_rankingType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rankingType"));
    v76 = (void *)MEMORY[0x1E0C99E60];
    v108[0] = objc_opt_class();
    v108[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 2);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setWithArray:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v78, CFSTR("filterQueries"));
    v79 = objc_claimAutoreleasedReturnValue();
    filterQueries = v5->_filterQueries;
    v5->_filterQueries = (NSArray *)v79;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filterQuery"));
    v81 = objc_claimAutoreleasedReturnValue();
    filterQuery = v5->_filterQuery;
    v5->_filterQuery = (NSString *)v81;

    v5->_dominantRankingQueryCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dominantRankingQueryCount"));
    v5->_dominatedRankingQueryCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dominatedRankingQueryCount"));
    v5->_shortcutBit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shortcutBit"));
    v5->_highMatchBit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("highMatchBit"));
    v5->_lowMatchBit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lowMatchBit"));
    v5->_highRecencyBit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("highRecencyBit"));
    v5->_lowRecencyBit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lowRecencyBit"));
    v5->_strongRankingQueryCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("strongRankingQueryCount"));
    v5->_maxCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxCount"));
    v5->_minCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minCount"));
    v5->_minL2Score = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minL2Score"));
    v5->_maxAge = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxAge"));
    v5->_queryID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("queryID"));
    v5->_flags = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flags"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("currentTime"));
    v5->_currentTime = v83;
    v84 = (void *)MEMORY[0x1E0C99E60];
    v107[0] = objc_opt_class();
    v107[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 2);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setWithArray:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v86, CFSTR("scopes"));
    v87 = objc_claimAutoreleasedReturnValue();
    scopes = v5->_scopes;
    v5->_scopes = (NSArray *)v87;

    v5->_qos = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("qos"));
    v5->_userQueryOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("userQueryOptions"));
    v5->_sourceOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("so"));
    v5->_maximumBatchSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumBatchSize"));
    v89 = (void *)MEMORY[0x1E0C99E60];
    v106[0] = objc_opt_class();
    v106[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 2);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setWithArray:", v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v91, CFSTR("customFieldSpecifications"));
    v92 = objc_claimAutoreleasedReturnValue();
    customFieldSpecifications = v5->_customFieldSpecifications;
    v5->_customFieldSpecifications = (NSArray *)v92;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("instantAnswersOverrideDate"));
    v94 = objc_claimAutoreleasedReturnValue();
    instantAnswersOverrideDate = v5->_instantAnswersOverrideDate;
    v5->_instantAnswersOverrideDate = (NSDate *)v94;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customResourceDirectory"));
    v96 = objc_claimAutoreleasedReturnValue();
    customResourceDirectory = v5->_customResourceDirectory;
    v5->_customResourceDirectory = (NSString *)v96;

    v98 = (void *)MEMORY[0x1E0C99E60];
    v105[0] = objc_opt_class();
    v105[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setWithArray:", v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v100, CFSTR("resultMatchingAttributes"));
    v101 = objc_claimAutoreleasedReturnValue();
    resultMatchingAttributes = v5->_resultMatchingAttributes;
    v5->_resultMatchingAttributes = (NSArray *)v101;

    v5->_computePhotosDerivedAttributes = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("computePhotosDerivedAttributes"));
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@:%p qid=%ld flag=0x%4.4x>"), objc_opt_class(), self, self->_queryID, self->_flags);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *preferredLanguages;
  void *v10;
  NSArray *markedTextArray;
  void *v12;
  double minL2Score;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t i;
  void *v17;
  NSUInteger v18;
  uint64_t j;
  void *v20;
  NSUInteger v21;
  NSUInteger v22;
  uint64_t k;
  void *v24;
  NSUInteger v25;
  unint64_t v26;
  void *v27;
  void *v28;

  v3 = (void *)MEMORY[0x18D782104](self, a2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@:%p"), objc_opt_class(), self);
  v5 = v4;
  if (self->_queryID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" queryID=%ld"), self->_queryID);
  if (self->_clientBundleID)
    objc_msgSend(v5, "appendFormat:", CFSTR(" clientBundleID=%@"), self->_clientBundleID);
  if (-[NSArray count](self->_bundleIDs, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_bundleIDs, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" bundleIDs=(%@)"), v6);

  }
  if (-[NSArray count](self->_protectionClasses, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_protectionClasses, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" protectionClasses=(%@)"), v7);

  }
  if (-[NSArray count](self->_mountPoints, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_mountPoints, "componentsJoinedByString:", CFSTR(", "));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" mount=(%@)"), v8);

  }
  preferredLanguages = self->_preferredLanguages;
  if (preferredLanguages)
  {
    -[NSArray componentsJoinedByString:](preferredLanguages, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" preferredLanguages=(%@)"), v10);

  }
  if (self->_keyboardLanguage)
    objc_msgSend(v5, "appendFormat:", CFSTR(" keyboardLanguage=%@"), self->_keyboardLanguage);
  markedTextArray = self->_markedTextArray;
  if (markedTextArray)
  {
    -[NSArray componentsJoinedByString:](markedTextArray, "componentsJoinedByString:", CFSTR(", "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" markedTextArray=(%@)"), v12);

  }
  if (self->_maxCount)
    objc_msgSend(v5, "appendFormat:", CFSTR(" maxCount=%ld"), self->_maxCount);
  if (self->_minCount)
    objc_msgSend(v5, "appendFormat:", CFSTR(" minCount=%ld"), self->_minCount);
  minL2Score = self->_minL2Score;
  if (minL2Score != 0.0 && minL2Score != -1.79769313e308)
    objc_msgSend(v5, "appendFormat:", CFSTR(" minL2Score=%f"), *(_QWORD *)&self->_minL2Score);
  if (self->_maxAge != 0.0)
    objc_msgSend(v5, "appendFormat:", CFSTR(" maxAge=%f"), *(_QWORD *)&self->_maxAge);
  if (-[CSSearchQueryContext internal](self, "internal"))
    objc_msgSend(v5, "appendString:", CFSTR(" internal=true"));
  if (-[CSSearchQueryContext grouped](self, "grouped"))
    objc_msgSend(v5, "appendString:", CFSTR(" grouped=true"));
  if (-[CSSearchQueryContext disableNLP](self, "disableNLP"))
    objc_msgSend(v5, "appendString:", CFSTR(" disableNLP=true"));
  if (-[CSSearchQueryContext pommesZKW](self, "pommesZKW"))
    objc_msgSend(v5, "appendString:", CFSTR(" pommesZKW=true"));
  if (-[CSSearchQueryContext live](self, "live"))
    objc_msgSend(v5, "appendString:", CFSTR(" live=true"));
  if (-[CSSearchQueryContext counting](self, "counting"))
    objc_msgSend(v5, "appendString:", CFSTR(" counting=true"));
  if (-[CSSearchQueryContext attribute](self, "attribute"))
    objc_msgSend(v5, "appendString:", CFSTR(" attribute=true"));
  if (self->_userQuery)
    objc_msgSend(v5, "appendFormat:", CFSTR(" userQuery=%@"), self->_userQuery);
  if (self->_userQueryOptions)
    objc_msgSend(v5, "appendFormat:", CFSTR(" userQueryOptions=0x%x"), self->_userQueryOptions);
  if (self->_qos)
    objc_msgSend(v5, "appendFormat:", CFSTR(" qos=%u"), self->_qos);
  objc_msgSend(v5, "appendFormat:", CFSTR(" batchSize=%zd"), self->_maximumBatchSize);
  if (self->_sourceOptions)
    objc_msgSend(v5, "appendFormat:", CFSTR(" source=%u"), self->_sourceOptions);
  objc_msgSend(v5, "appendFormat:", CFSTR(" currentTime=%lf"), *(_QWORD *)&self->_currentTime);
  v14 = -[NSArray count](self->_rankingQueries, "count");
  if (v14)
  {
    v15 = v14;
    for (i = 0; i != v15; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_rankingQueries, "objectAtIndexedSubscript:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("\n   rankingQueries[%d]=%@"), i, v17);

    }
    objc_msgSend(v5, "appendString:", CFSTR("\n"));
  }
  v18 = -[NSArray count](self->_groupingRules, "count");
  if (-[NSArray count](self->_groupingRules, "count"))
  {
    if (v18)
    {
      for (j = 0; j != v18; ++j)
      {
        -[NSArray objectAtIndexedSubscript:](self->_groupingRules, "objectAtIndexedSubscript:", j);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("\n   groupingRules[%d]=%@"), j, v20);

      }
    }
    objc_msgSend(v5, "appendString:", CFSTR("\n"));
  }
  v21 = -[NSArray count](self->_resultMatchingAttributes, "count");
  if (v21)
  {
    v22 = v21;
    for (k = 0; k != v22; ++k)
    {
      -[NSArray objectAtIndexedSubscript:](self->_resultMatchingAttributes, "objectAtIndexedSubscript:", k);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("\n   resultMatchingAttributes[%d]=%@"), k, v24);

    }
    objc_msgSend(v5, "appendString:", CFSTR("\n"));
  }
  v25 = -[NSArray count](self->_fetchAttributes, "count");
  if (v25)
  {
    v26 = v25;
    -[NSArray componentsJoinedByString:](self->_fetchAttributes, "componentsJoinedByString:", CFSTR(", "));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" fetchAttributes=(%@)"), v27);

    if (v26 >= 6)
      objc_msgSend(v5, "appendString:", CFSTR("\n"));
  }
  if (-[NSArray count](self->_scopes, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_scopes, "componentsJoinedByString:", CFSTR(", "));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" scopes=(%@)"), v28);

  }
  objc_msgSend(v5, "appendString:", CFSTR(">"));
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (NSArray)resultMatchingSceneIdentifiers
{
  return self->_resultMatchingSceneIdentifiers;
}

- (void)setResultMatchingSceneIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_resultMatchingSceneIdentifiers, a3);
}

- (BOOL)computePhotosDerivedAttributes
{
  return self->_computePhotosDerivedAttributes;
}

- (void)setComputePhotosDerivedAttributes:(BOOL)a3
{
  self->_computePhotosDerivedAttributes = a3;
}

- (BOOL)fetchl2Signals
{
  return self->_fetchl2Signals;
}

- (void)setFetchl2Signals:(BOOL)a3
{
  self->_fetchl2Signals = a3;
}

- (NSData)queryEmbedding
{
  return self->_queryEmbedding;
}

- (void)setQueryEmbedding:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (NSAttributedString)attributedUserQuery
{
  return self->_attributedUserQuery;
}

- (void)setAttributedUserQuery:(id)a3
{
  objc_storeStrong((id *)&self->_attributedUserQuery, a3);
}

- (void)xpc_dictionary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18C42F000, v0, v1, "[Pommes] Could not archive queryUnderstandingOutput %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithXPCDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18C42F000, v0, v1, "[Pommes] Could not unarchive queryUnderstandingOutput %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithXPCDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_0(&dword_18C42F000, v0, v1, "Received top hits query for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
