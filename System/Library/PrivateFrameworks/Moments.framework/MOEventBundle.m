@implementation MOEventBundle

- (MOEventBundle)initWithBundleIdentifier:(id)a3 suggestionID:(id)a4 startDate:(id)a5 endDate:(id)a6 creationDate:(id)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  MOEventBundle *v18;
  id *p_isa;
  MOEventBundle *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  SEL v26;
  MOEventBundle *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  objc_super v37;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v36 = a6;
  v17 = a7;
  if (!v14)
  {
    v21 = v17;
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = CFSTR("Invalid parameter not satisfying: bundleIdentifier");
    v26 = a2;
    v27 = self;
    v28 = 197;
    goto LABEL_21;
  }
  if (!v15)
  {
    v21 = v17;
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = CFSTR("Invalid parameter not satisfying: suggestionID");
    v26 = a2;
    v27 = self;
    v28 = 198;
    goto LABEL_21;
  }
  if (!v16)
  {
    v21 = v17;
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = CFSTR("Invalid parameter not satisfying: startDate");
    v26 = a2;
    v27 = self;
    v28 = 199;
    goto LABEL_21;
  }
  if (!v36)
  {
    v21 = v17;
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:].cold.3();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = CFSTR("Invalid parameter not satisfying: endDate");
    v26 = a2;
    v27 = self;
    v28 = 200;
LABEL_21:
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v26, v27, CFSTR("MOEventBundle.m"), v28, v25);

    v20 = 0;
    goto LABEL_22;
  }
  v35 = v17;
  if (v17)
  {
    v37.receiver = self;
    v37.super_class = (Class)MOEventBundle;
    v18 = -[MOEventBundle init](&v37, sel_init);
    p_isa = (id *)&v18->super.isa;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_bundleIdentifier, a3);
      objc_storeStrong(p_isa + 3, a4);
      objc_storeStrong(p_isa + 4, a5);
      objc_storeStrong(p_isa + 5, a6);
      objc_storeStrong(p_isa + 6, a7);
    }
    self = p_isa;
    v20 = self;
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:].cold.4();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundle.m"), 201, CFSTR("Invalid parameter not satisfying: creationDate"));

    v20 = 0;
  }
  v21 = v35;
LABEL_22:

  return v20;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 suggestionID:(id)a4 bundleType:(id)a5 creationDate:(id)a6 firstCreationDate:(id)a7 endDate:(id)a8 expirationDate:(id)a9 events:(id)a10 filtered:(BOOL)a11 interfaceType:(unint64_t)a12 photoSource:(unint64_t)a13 promptLanguage:(id)a14 source:(unint64_t)a15 startDate:(id)a16 action:(id)a17 concurrentMediaAction:(id)a18 actions:(id)a19 persons:(id)a20 place:(id)a21 predominantWeather:(id)a22 resources:(id)a23 time:(id)a24 metaDataForRank:(id)a25 suggestionEngagements:(id)a26 suggestionEngagementViewCount:(unint64_t)a27 appEntryEngagements:(id)a28 isAggregatedAndSuppressed:(BOOL)a29 summarizationGranularity:(unint64_t)a30 places:(id)a31 subBundleIDs:(id)a32 subSuggestionIDs:(id)a33 includedInSummaryBundleOnly:(BOOL)a34 bundleSubType:(unint64_t)a35 bundleSuperType:(unint64_t)a36 photoTraits:(id)a37
{
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  MOEventBundle *v46;
  MOEventBundle *v47;
  uint64_t v48;
  NSArray *events;
  uint64_t v50;
  NSArray *actions;
  uint64_t v52;
  NSArray *persons;
  uint64_t v54;
  NSArray *resources;
  uint64_t v56;
  NSDictionary *metaDataForRank;
  uint64_t v58;
  NSMutableSet *suggestionEngagementEvents;
  uint64_t v60;
  NSMutableSet *appEntryEngagementEvents;
  uint64_t v62;
  NSArray *places;
  uint64_t v64;
  NSArray *subBundleIDs;
  uint64_t v66;
  NSArray *subSuggestionIDs;
  uint64_t v68;
  NSArray *photoTraits;
  id obj;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;

  v86 = a5;
  obj = a7;
  v85 = a7;
  v84 = a9;
  v89 = a10;
  v83 = a14;
  v82 = a17;
  v81 = a18;
  v38 = a19;
  v39 = a20;
  v80 = a21;
  v79 = a22;
  v40 = a23;
  v78 = a24;
  v41 = a25;
  v42 = a26;
  v43 = a28;
  v44 = a31;
  v45 = a32;
  v88 = a33;
  v87 = a37;
  v46 = -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:](self, "initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:", a3, a4, a16, a8, a6);
  v47 = v46;
  if (v46)
  {
    objc_storeStrong((id *)&v46->_firstCreationDate, obj);
    objc_storeStrong((id *)&v47->_bundleType, a5);
    objc_storeStrong((id *)&v47->_expirationDate, a9);
    v48 = objc_msgSend(v89, "copy");
    events = v47->_events;
    v47->_events = (NSArray *)v48;

    v47->_filtered = a11;
    v47->_interfaceType = a12;
    v47->_photoSource = a13;
    objc_storeStrong((id *)&v47->_promptLanguage, a14);
    v47->_source = a15;
    objc_storeStrong((id *)&v47->_action, a17);
    objc_storeStrong((id *)&v47->_concurrentMediaAction, a18);
    v50 = objc_msgSend(v38, "copy");
    actions = v47->_actions;
    v47->_actions = (NSArray *)v50;

    v52 = objc_msgSend(v39, "copy");
    persons = v47->_persons;
    v47->_persons = (NSArray *)v52;

    objc_storeStrong((id *)&v47->_place, a21);
    objc_storeStrong((id *)&v47->_predominantWeather, a22);
    v54 = objc_msgSend(v40, "copy");
    resources = v47->_resources;
    v47->_resources = (NSArray *)v54;

    objc_storeStrong((id *)&v47->_time, a24);
    v56 = objc_msgSend(v41, "copy");
    metaDataForRank = v47->_metaDataForRank;
    v47->_metaDataForRank = (NSDictionary *)v56;

    v58 = objc_msgSend(v42, "mutableCopy");
    suggestionEngagementEvents = v47->_suggestionEngagementEvents;
    v47->_suggestionEngagementEvents = (NSMutableSet *)v58;

    v47->_suggestionEngagementViewCount = a27;
    v60 = objc_msgSend(v43, "mutableCopy");
    appEntryEngagementEvents = v47->_appEntryEngagementEvents;
    v47->_appEntryEngagementEvents = (NSMutableSet *)v60;

    v47->_isAggregatedAndSuppressed = a29;
    v47->_summarizationGranularity = a30;
    v62 = objc_msgSend(v44, "copy");
    places = v47->_places;
    v47->_places = (NSArray *)v62;

    v64 = objc_msgSend(v45, "copy");
    subBundleIDs = v47->_subBundleIDs;
    v47->_subBundleIDs = (NSArray *)v64;

    v66 = objc_msgSend(v88, "copy");
    subSuggestionIDs = v47->_subSuggestionIDs;
    v47->_subSuggestionIDs = (NSArray *)v66;

    v47->_includedInSummaryBundleOnly = a34;
    v47->_bundleSubType = a35;
    v47->_bundleSuperType = a36;
    v68 = objc_msgSend(v87, "copy");
    photoTraits = v47->_photoTraits;
    v47->_photoTraits = (NSArray *)v68;

  }
  return v47;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 usingBundle:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  id v32;
  MOEventBundle *v34;
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

  v5 = a4;
  v32 = a3;
  objc_msgSend(v5, "suggestionID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleType");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creationDate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstCreationDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expirationDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "events");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v5, "filtered");
  v30 = objc_msgSend(v5, "interfaceType");
  v29 = objc_msgSend(v5, "photoSource");
  objc_msgSend(v5, "promptLanguage");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v5, "source");
  objc_msgSend(v5, "startDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "action");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "concurrentMediaAction");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persons");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "place");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predominantWeather");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resources");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "time");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metaDataForRank");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestionEngagementEvents");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v5, "suggestionEngagementViewCount");
  objc_msgSend(v5, "appEntryEngagementEvents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v5, "isAggregatedAndSuppressed");
  v16 = objc_msgSend(v5, "summarizationGranularity");
  objc_msgSend(v5, "places");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subBundleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subSuggestionIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "includedInSummaryBundleOnly");
  v9 = objc_msgSend(v5, "bundleSubType");
  v10 = objc_msgSend(v5, "bundleSuperType");
  objc_msgSend(v5, "photoTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = v8;
  LOBYTE(v14) = v19;
  LOBYTE(v13) = v31;
  v34 = -[MOEventBundle initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:](self, "initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:", v32, v46, v45, v44, v43, v41, v42, v40, v13, v30, v29, v39, v28,
          v37,
          v38,
          v36,
          v27,
          v26,
          v25,
          v24,
          v23,
          v35,
          v20,
          v22,
          v21,
          v18,
          v14,
          v16,
          v17,
          v6,
          v7,
          v15,
          v9,
          v10,
          v11);

  return v34;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 bundleType:(id)a4 creationDate:(id)a5 endDate:(id)a6 expirationDate:(id)a7 events:(id)a8 filtered:(BOOL)a9 interfaceType:(unint64_t)a10 photoSource:(unint64_t)a11 promptLanguage:(id)a12 source:(unint64_t)a13 startDate:(id)a14 action:(id)a15 concurrentMediaAction:(id)a16 actions:(id)a17 persons:(id)a18 place:(id)a19 predominantWeather:(id)a20 resources:(id)a21 time:(id)a22 metaDataForRank:(id)a23 suggestionEngagements:(id)a24 suggestionEngagementViewCount:(unint64_t)a25 appEntryEngagements:(id)a26 isAggregatedAndSuppressed:(BOOL)a27 summarizationGranularity:(unint64_t)a28 places:(id)a29 subBundleIDs:(id)a30 subSuggestionIDs:(id)a31 includedInSummaryBundleOnly:(BOOL)a32 bundleSubType:(unint64_t)a33 bundleSuperType:(unint64_t)a34 photoTraits:(id)a35
{
  id v35;
  id v36;
  id v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v50;
  id v51;
  void *v53;
  void *v54;
  id v55;
  MOEventBundle *v57;
  id v59;
  id v61;
  id v63;
  id v64;
  id v65;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;

  v47 = (void *)MEMORY[0x1E0C99E20];
  v55 = a35;
  v51 = a31;
  v35 = a30;
  v48 = a29;
  v36 = a26;
  v37 = a23;
  v46 = a22;
  v45 = a21;
  v44 = a20;
  v43 = a19;
  v71 = a18;
  v70 = a17;
  v69 = a16;
  v68 = a15;
  v65 = a14;
  v64 = a12;
  v67 = a8;
  v63 = a7;
  v42 = a6;
  v50 = a5;
  v61 = a4;
  v59 = a3;
  objc_msgSend(v47, "setWithSet:", a24);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v36);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v41) = a32;
  LOBYTE(v40) = a27;
  LOBYTE(v39) = a9;
  v57 = -[MOEventBundle initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:](self, "initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:", v59, v59, v61, v50, 0, v42, v63, v67, v39, a10, a11, v64, a13,
          v65,
          v68,
          v69,
          v70,
          v71,
          v43,
          v44,
          v45,
          v46,
          v37,
          v54,
          a25,
          v53,
          v40,
          a28,
          v48,
          v35,
          v51,
          v41,
          a33,
          a34,
          v55);

  return v57;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 bundleType:(id)a4 creationDate:(id)a5 endDate:(id)a6 expirationDate:(id)a7 events:(id)a8 filtered:(BOOL)a9 interfaceType:(unint64_t)a10 photoSource:(unint64_t)a11 promptLanguage:(id)a12 source:(unint64_t)a13 startDate:(id)a14 action:(id)a15 concurrentMediaAction:(id)a16 actions:(id)a17 persons:(id)a18 place:(id)a19 predominantWeather:(id)a20 resources:(id)a21 time:(id)a22 metaDataForRank:(id)a23 suggestionEngagements:(id)a24 suggestionEngagementViewCount:(unint64_t)a25 appEntryEngagements:(id)a26 isAggregatedAndSuppressed:(BOOL)a27 summarizationGranularity:(unint64_t)a28 places:(id)a29 subBundleIDs:(id)a30 subSuggestionIDs:(id)a31 photoTraits:(id)a32
{
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v50;
  MOEventBundle *v52;
  id v54;
  id v55;
  id v56;
  id v58;
  id v60;
  id v62;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;

  v44 = (void *)MEMORY[0x1E0C99E20];
  v47 = a32;
  v46 = a31;
  v32 = a30;
  v45 = a29;
  v33 = a26;
  v34 = a23;
  v43 = a22;
  v42 = a21;
  v41 = a20;
  v40 = a19;
  v56 = a18;
  v55 = a17;
  v68 = a16;
  v67 = a15;
  v66 = a14;
  v65 = a12;
  v64 = a8;
  v62 = a7;
  v60 = a6;
  v58 = a5;
  v35 = a4;
  v54 = a3;
  objc_msgSend(v44, "setWithSet:", a24);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v33);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v39) = 0;
  LOBYTE(v38) = a27;
  LOBYTE(v37) = a9;
  v52 = -[MOEventBundle initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:](self, "initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:", v54, v54, v35, v58, 0, v60, v62, v64, v37, a10, a11, v65, a13,
          v66,
          v67,
          v68,
          v55,
          v56,
          v40,
          v41,
          v42,
          v43,
          v34,
          v50,
          a25,
          v48,
          v38,
          a28,
          v45,
          v32,
          v46,
          v39,
          0,
          0,
          v47);

  return v52;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 creationDate:(id)a4
{
  return -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:](self, "initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:", a3, a3, a4, a4, a4);
}

- (id)getBundleType
{
  return +[MOEventBundle getInterfaceTypeString:superType:](MOEventBundle, "getInterfaceTypeString:superType:", -[MOEventBundle interfaceType](self, "interfaceType"), -[MOEventBundle bundleSuperType](self, "bundleSuperType"));
}

+ (id)getInterfaceTypeString:(unint64_t)a3 superType:(unint64_t)a4
{
  id result;
  __CFString *v5;

  switch(a3)
  {
    case 1uLL:
      result = CFSTR("activity");
      break;
    case 2uLL:
      result = CFSTR("outing");
      break;
    case 3uLL:
      result = CFSTR("photo_moment");
      break;
    case 4uLL:
      result = CFSTR("significant_contact");
      break;
    case 5uLL:
      result = CFSTR("media");
      break;
    case 6uLL:
      result = CFSTR("shared_content");
      break;
    case 7uLL:
      result = CFSTR("time_at_home");
      break;
    case 8uLL:
      result = CFSTR("topics_of_interest");
      break;
    case 9uLL:
      if (a4)
      {
        v5 = CFSTR("workoutTrend");
        if (a4 == 3)
          v5 = CFSTR("conversationTrend");
        result = v5;
      }
      else
      {
        result = CFSTR("trend");
      }
      break;
    case 0xAuLL:
      result = CFSTR("photo_memory");
      break;
    case 0xBuLL:
      result = CFSTR("evergreen");
      break;
    case 0xCuLL:
      result = CFSTR("timeContext");
      break;
    case 0xDuLL:
      result = CFSTR("trip");
      break;
    case 0xEuLL:
      result = CFSTR("state_of_mind");
      break;
    case 0xFuLL:
      result = CFSTR("clustering");
      break;
    default:
      result = CFSTR("unknown");
      break;
  }
  return result;
}

- (id)getSuperTypeString
{
  unint64_t v2;

  v2 = -[MOEventBundle bundleSuperType](self, "bundleSuperType");
  if (v2 - 1 > 8)
    return CFSTR("unknown");
  else
    return off_1E85430B0[v2 - 1];
}

- (id)getSubTypeString
{
  uint64_t v2;
  id result;
  __CFString *v4;
  __CFString *v5;
  BOOL v6;

  v2 = -[MOEventBundle bundleSubType](self, "bundleSubType");
  result = CFSTR("unknown");
  if (v2 <= 600)
  {
    if (v2 <= 301)
    {
      switch(v2)
      {
        case 201:
          result = CFSTR("workout");
          break;
        case 202:
          result = CFSTR("workout_weekly_summary");
          break;
        case 203:
          result = CFSTR("workout_routine");
          break;
        case 204:
          result = CFSTR("motion_activity_walking");
          break;
        case 205:
          result = CFSTR("workout_transit");
          break;
        case 206:
          result = CFSTR("motion_activity_transit");
          break;
        case 207:
          result = CFSTR("motion_activity_running");
          break;
        case 208:
          result = CFSTR("motion_activity_mixed_running_walking");
          break;
        default:
          switch(v2)
          {
            case 'e':
              result = CFSTR("visit");
              break;
            case 'f':
              result = CFSTR("flight");
              break;
            case 'g':
              result = CFSTR("dining");
              break;
            case 'h':
              result = CFSTR("shopping");
              break;
            case 'i':
              result = CFSTR("trip");
              break;
            case 'j':
              result = CFSTR("pre_onboarded_visit");
              break;
            default:
              if (v2 == 301)
                result = CFSTR("contact");
              break;
          }
          break;
      }
    }
    else if (v2 > 500)
    {
      switch(v2)
      {
        case 501:
          result = CFSTR("time_at_home");
          break;
        case 502:
          result = CFSTR("photos_at_home");
          break;
        case 503:
          result = CFSTR("hosting_at_home");
          break;
        case 504:
          result = CFSTR("evergreen_at_home");
          break;
        default:
          return result;
      }
    }
    else
    {
      switch(v2)
      {
        case 401:
          result = CFSTR("song_on_repeat");
          break;
        case 402:
          result = CFSTR("played_song");
          break;
        case 403:
          result = CFSTR("played_podcast");
          break;
        case 404:
          result = CFSTR("media_on_repeat_weekly_summary");
          break;
        case 405:
          result = CFSTR("played_media_weekly_summary");
          break;
        case 406:
          result = CFSTR("media_suppressed");
          break;
        case 407:
          result = CFSTR("media_on_repeat_third_party");
          break;
        case 408:
          result = CFSTR("played_media_third_party");
          break;
        case 409:
          result = CFSTR("media_on_repeat_weekly_summary_third_party");
          break;
        case 410:
          result = CFSTR("played_media_weekly_summary_third_party");
          break;
        default:
          v4 = CFSTR("contact_weekly_summary");
          v5 = CFSTR("contact_trend");
          if (v2 != 303)
            v5 = CFSTR("unknown");
          v6 = v2 == 302;
LABEL_25:
          if (v6)
            result = v4;
          else
            result = v5;
          break;
      }
    }
  }
  else if (v2 <= 800)
  {
    switch(v2)
    {
      case 601:
        result = CFSTR("photo_memory_single_moment");
        break;
      case 602:
        result = CFSTR("photo_memory_person");
        break;
      case 603:
        result = CFSTR("photo_memory_social_group");
        break;
      case 604:
        result = CFSTR("photo_memory_last_month_at_home");
        break;
      case 605:
        result = CFSTR("photo_memory_lookbacks");
        break;
      case 606:
        result = CFSTR("photo_memory_foodie");
        break;
      case 607:
        result = CFSTR("photo_memory_pet");
        break;
      case 608:
        result = CFSTR("photo_memory_location");
        break;
      case 609:
        result = CFSTR("photo_memory_meaningful_event");
        break;
      case 610:
        result = CFSTR("photo_memory_trip");
        break;
      case 611:
        result = CFSTR("photo_memory_past_super_set");
        break;
      case 612:
        result = CFSTR("photo_memory_season");
        break;
      case 613:
        result = CFSTR("photo_memory_recent_highlights");
        break;
      case 614:
        result = CFSTR("photo_memory_family");
        break;
      case 615:
        result = CFSTR("photo_memory_exciting_moments");
        break;
      case 616:
        result = CFSTR("photo_memory_trends");
        break;
      case 617:
        result = CFSTR("photo_memory_others");
        break;
      default:
        switch(v2)
        {
          case 701:
          case 707:
            result = CFSTR("evergreen_gratitude");
            break;
          case 702:
            result = CFSTR("evergreen_wisdom");
            break;
          case 703:
            result = CFSTR("evergreen_resillience");
            break;
          case 704:
            result = CFSTR("evergreen_creativity");
            break;
          case 705:
            result = CFSTR("evergreen_kindness");
            break;
          case 706:
          case 709:
            result = CFSTR("evergreen_purpose");
            break;
          case 708:
            result = CFSTR("evergreen_resilience");
            break;
          default:
            return result;
        }
        break;
    }
  }
  else
  {
    switch(v2)
    {
      case 901:
        result = CFSTR("clustering_outing_routine");
        break;
      case 902:
        result = CFSTR("clustering_activity_routine");
        break;
      case 903:
        result = CFSTR("clustering_contact_routine");
        break;
      case 904:
        result = CFSTR("clustering_time_at_home_routine");
        break;
      case 905:
        result = CFSTR("clustering_location_grouping");
        break;
      case 906:
        result = CFSTR("clustering_activity_grouping");
        break;
      case 907:
        result = CFSTR("clustering_contact_grouping");
        break;
      case 908:
        result = CFSTR("clustering_thematic_grouping");
        break;
      case 909:
        result = CFSTR("clustering_time_at_home_grouping");
        break;
      case 910:
        result = CFSTR("clustering_unspecified_grouping");
        break;
      default:
        v4 = CFSTR("daily_mood");
        v5 = CFSTR("momentary_emotion");
        if (v2 != 802)
          v5 = CFSTR("unknown");
        v6 = v2 == 801;
        goto LABEL_25;
    }
  }
  return result;
}

- (unint64_t)getInterfaceTypeEnum:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("activity")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("outing")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("photo_moment")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("significant_contact")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("media")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("shared_content")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("time_at_home")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("evergreen")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("topics_of_interest")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("trend")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("workoutTrend")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("conversationTrend")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("photo_memory")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("timeContext")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("trip")) & 1) != 0)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("state_of_mind")))
  {
    v4 = 14;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  const __CFString *v34;
  const __CFString *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
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

  v3 = MEMORY[0x1D1798EEC](self, a2);
  v41 = (void *)MEMORY[0x1E0CB3940];
  v43 = (void *)v3;
  -[MOEventBundle bundleIdentifier](self, "bundleIdentifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle suggestionID](self, "suggestionID");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle subSuggestionIDs](self, "subSuggestionIDs");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle startDate](self, "startDate");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle endDate](self, "endDate");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle creationDate](self, "creationDate");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle expirationDate](self, "expirationDate");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle firstCreationDate](self, "firstCreationDate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle displayStartDate](self, "displayStartDate");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle displayEndDate](self, "displayEndDate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[MOEventBundle source](self, "source");
  v38 = -[MOEventBundle interfaceType](self, "interfaceType");
  v37 = -[MOEventBundle bundleSubType](self, "bundleSubType");
  v36 = -[MOEventBundle bundleSuperType](self, "bundleSuperType");
  if (-[MOEventBundle filtered](self, "filtered"))
    v4 = CFSTR("Yes");
  else
    v4 = CFSTR("No");
  v35 = v4;
  if (-[MOEventBundle isAggregatedAndSuppressed](self, "isAggregatedAndSuppressed"))
    v5 = CFSTR("Yes");
  else
    v5 = CFSTR("No");
  v34 = v5;
  v33 = -[MOEventBundle summarizationGranularity](self, "summarizationGranularity");
  if (-[MOEventBundle includedInSummaryBundleOnly](self, "includedInSummaryBundleOnly"))
    v6 = CFSTR("Yes");
  else
    v6 = CFSTR("No");
  v29 = v6;
  -[MOEventBundle promptLanguage](self, "promptLanguage");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "mask");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[MOEventBundle photoSource](self, "photoSource");
  -[MOEventBundle photoTraits](self, "photoTraits");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle action](self, "action");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle concurrentMediaAction](self, "concurrentMediaAction");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle place](self, "place");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle time](self, "time");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle predominantWeather](self, "predominantWeather");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle actions](self, "actions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle persons](self, "persons");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle places](self, "places");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle subBundleIDs](self, "subBundleIDs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle metaData](self, "metaData");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v32, "count");
  -[MOEventBundle events](self, "events");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v31, "count");
  -[MOEventBundle labels](self, "labels");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle promptLanguages](self, "promptLanguages");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle _allResourcesImpl](self, "_allResourcesImpl");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle metaData](self, "metaData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v23, "count");
  -[MOEventBundle metaData](self, "metaData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle metaDataForRank](self, "metaDataForRank");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle rankingDictionary](self, "rankingDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle suggestionEngagementEvents](self, "suggestionEngagementEvents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MOEventBundle suggestionEngagementViewCount](self, "suggestionEngagementViewCount");
  -[MOEventBundle appEntryEngagementEvents](self, "appEntryEngagementEvents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringWithFormat:", CFSTR("<MOEventBundle bundleIdentifier, %@, suggestionID, %@, sub Suggestion IDs, %@, startDate, %@, endDate, %@, creationDate, %@, expirationDate, %@, firstCreationDate, %@, displayStartDate, %@, displayEndDate, %@, source, %lu, interfaceType, %lu, bundleSubType, %lu, bundleSuperType, %lu, filtered, %@, agg./suppressed, %@, sum. granularity, %lu, includedInSummaryOnly, %@, promptLanguage, %@, photoSource, %lu, traits, %@, action, %@, concurrentMediaAction, %@, place, %@, time, %@, predominantWeather %@, actions, %@, persons, %@, places, %@, sub bundle IDs, %@, metaData.count, %lu,  events.count, %lu, labels, %@, prompts, %@, allResources, %@, meta, %lu, meta keywords, %@, metaDataForRank, %@, rankings, %@, suggestionEngagements, %@, suggestionEngagementViewCount, %lu, appEntryEngagementEvents %@>"), v58, v57, v59, v56, v55, v54, v53, v52, v50, v49, v39, v38, v37, v36, v35, v34,
    v33,
    v29,
    v51,
    v30,
    v48,
    v46,
    v47,
    v45,
    v28,
    v44,
    v27,
    v26,
    v17,
    v24,
    v19,
    v18,
    v16,
    v20,
    v15,
    v7,
    v8,
    v9,
    v10,
    v11,
    v12,
    v13);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v43);
  return v42;
}

- (MOEventBundle)initWithEventSet:(id)a3 filtered:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  MOEventBundle *v9;
  uint64_t v10;
  NSArray *events;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:](self, "initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:", v8, v8, v7, v7, v7);
  if (v9)
  {
    objc_msgSend(v6, "allObjects");
    v10 = objc_claimAutoreleasedReturnValue();
    events = v9->_events;
    v9->_events = (NSArray *)v10;

    v9->_filtered = a4;
    -[MOEventBundle setPropertiesBasedOnEvents](v9, "setPropertiesBasedOnEvents");
  }

  return v9;
}

- (NSSet)getCategories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[MOEventBundle events](self, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (void)setPropertiesBasedOnEvents
{
  NSDate *v3;
  NSDate *startDate;
  NSDate *v5;
  NSDate *endDate;
  NSDate *v7;
  NSDate *expirationDate;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSDate *v15;
  void *v16;
  void *v17;
  NSDate *v18;
  NSDate *v19;
  void *v20;
  int v21;
  void *v22;
  NSDate *v23;
  NSDate *v24;
  NSDate *v25;
  void *v26;
  void *v27;
  NSDate *v28;
  NSDate *v29;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  self->_startDate = v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  endDate = self->_endDate;
  self->_endDate = v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  expirationDate = self->_expirationDate;
  self->_expirationDate = v7;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[MOEventBundle events](self, "events", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v15 = self->_startDate;
        objc_msgSend(v14, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15) = -[NSDate isAfterDate:](v15, "isAfterDate:", v16);

        if ((_DWORD)v15)
        {
          objc_msgSend(v14, "startDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (NSDate *)objc_msgSend(v17, "copy");
          v19 = self->_startDate;
          self->_startDate = v18;

        }
        objc_msgSend(v14, "endDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isAfterDate:", self->_endDate);

        if (v21)
        {
          objc_msgSend(v14, "endDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (NSDate *)objc_msgSend(v22, "copy");
          v24 = self->_endDate;
          self->_endDate = v23;

        }
        v25 = self->_expirationDate;
        objc_msgSend(v14, "expirationDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v25) = -[NSDate isAfterDate:](v25, "isAfterDate:", v26);

        if ((_DWORD)v25)
        {
          objc_msgSend(v14, "expirationDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (NSDate *)objc_msgSend(v27, "copy");
          v29 = self->_expirationDate;
          self->_expirationDate = v28;

        }
        v30 = objc_msgSend(v14, "provider") - 1;
        if (v30 <= 0xA)
          self->_source |= qword_1CAE9D490[v30];
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }

}

- (void)addBackgroundAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[MOEventBundle backgroundActions](self, "backgroundActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v6, "addObject:", v7);
  -[MOEventBundle setBackgroundActions:](self, "setBackgroundActions:", v6);

}

- (void)addAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[MOEventBundle actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v6, "addObject:", v7);
  -[MOEventBundle setActions:](self, "setActions:", v6);

}

- (unint64_t)bundleManagementPolicy
{
  return -[MOEventBundle interfaceType](self, "interfaceType") == 13
      || -[MOEventBundle interfaceType](self, "interfaceType") == 11
      || -[MOEventBundle interfaceType](self, "interfaceType") == 10;
}

- (id)localStartDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[MOEventBundle time](self, "time");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[MOEventBundle time](self, "time");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99E80]);
    -[MOEventBundle time](self, "time");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithName:", v9);

    -[MOEventBundle startDate](self, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    -[MOEventBundle startDate](self, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (id)localEndDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[MOEventBundle time](self, "time");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[MOEventBundle time](self, "time");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99E80]);
    -[MOEventBundle time](self, "time");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithName:", v9);

    -[MOEventBundle endDate](self, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    -[MOEventBundle endDate](self, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (id)displayStartDate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  double v39;
  double v40;
  void *v41;
  id v42;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (-[MOEventBundle bundleSubType](self, "bundleSubType") == 202
    || -[MOEventBundle bundleSubType](self, "bundleSubType") == 404
    || -[MOEventBundle bundleSubType](self, "bundleSubType") == 405)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[MOEventBundle events](self, "events");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v56 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          if ((objc_msgSend(v9, "category") == 2 || objc_msgSend(v9, "category") == 4)
            && objc_msgSend(v9, "provider") != 5)
          {
            objc_msgSend(v9, "startDate");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v3, "isAfterDate:", v10);

            if (v11)
            {
              objc_msgSend(v9, "startDate");
              v12 = objc_claimAutoreleasedReturnValue();

              v3 = (void *)v12;
            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v6);
    }

    -[MOEventBundle time](self, "time");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_19;
    v14 = (void *)v13;
    -[MOEventBundle time](self, "time");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_alloc(MEMORY[0x1E0C99E80]);
      -[MOEventBundle time](self, "time");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeZone");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v17, "initWithName:", v19);

      +[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v3, v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_19:
      v21 = v3;
    }

  }
  else if (-[MOEventBundle bundleSubType](self, "bundleSubType") == 203)
  {
    -[MOEventBundle startDate](self, "startDate");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[MOEventBundle events](self, "events");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v52;
      v27 = CFSTR("kEventResourcePatternWorkoutInfoDictArray");
      v44 = *(_QWORD *)v52;
      v45 = v23;
      v43 = CFSTR("kEventResourcePatternWorkoutInfoDictArray");
      do
      {
        v28 = 0;
        v46 = v25;
        do
        {
          if (*(_QWORD *)v52 != v26)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v28);
          if (objc_msgSend(v29, "provider", v43, v44, v45) == 5 && objc_msgSend(v29, "category") == 2)
          {
            objc_msgSend(v29, "patterns");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKey:", v27);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v31)
            {
              v49 = 0u;
              v50 = 0u;
              v47 = 0u;
              v48 = 0u;
              objc_msgSend(v29, "patterns");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectForKeyedSubscript:", v27);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
              if (v34)
              {
                v35 = v34;
                v36 = *(_QWORD *)v48;
                do
                {
                  for (j = 0; j != v35; ++j)
                  {
                    if (*(_QWORD *)v48 != v36)
                      objc_enumerationMutation(v33);
                    objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("kEventResourcePatternWorkoutStartDate"));
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "doubleValue");
                    v40 = v39;

                    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v40);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v21, "isAfterDate:", v41))
                    {
                      v42 = v41;

                      v21 = v42;
                    }

                  }
                  v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
                }
                while (v35);
              }

              v26 = v44;
              v23 = v45;
              v27 = v43;
            }
            v25 = v46;
          }
          ++v28;
        }
        while (v28 != v25);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v25);
    }

  }
  else
  {
    -[MOEventBundle localStartDate](self, "localStartDate");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v21;
}

- (id)displayEndDate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  double v39;
  double v40;
  void *v41;
  id v42;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (-[MOEventBundle bundleSubType](self, "bundleSubType") == 202
    || -[MOEventBundle bundleSubType](self, "bundleSubType") == 404
    || -[MOEventBundle bundleSubType](self, "bundleSubType") == 405)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[MOEventBundle events](self, "events");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v56 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          if ((objc_msgSend(v9, "category") == 2 || objc_msgSend(v9, "category") == 4)
            && objc_msgSend(v9, "provider") != 5)
          {
            objc_msgSend(v9, "endDate");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v3, "isBeforeDate:", v10);

            if (v11)
            {
              objc_msgSend(v9, "endDate");
              v12 = objc_claimAutoreleasedReturnValue();

              v3 = (void *)v12;
            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v6);
    }

    -[MOEventBundle time](self, "time");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_19;
    v14 = (void *)v13;
    -[MOEventBundle time](self, "time");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_alloc(MEMORY[0x1E0C99E80]);
      -[MOEventBundle time](self, "time");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeZone");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v17, "initWithName:", v19);

      +[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v3, v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_19:
      v21 = v3;
    }

  }
  else if (-[MOEventBundle bundleSubType](self, "bundleSubType") == 203)
  {
    -[MOEventBundle endDate](self, "endDate");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[MOEventBundle events](self, "events");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v52;
      v27 = CFSTR("kEventResourcePatternWorkoutInfoDictArray");
      v44 = *(_QWORD *)v52;
      v45 = v23;
      v43 = CFSTR("kEventResourcePatternWorkoutInfoDictArray");
      do
      {
        v28 = 0;
        v46 = v25;
        do
        {
          if (*(_QWORD *)v52 != v26)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v28);
          if (objc_msgSend(v29, "provider", v43, v44, v45) == 5 && objc_msgSend(v29, "category") == 2)
          {
            objc_msgSend(v29, "patterns");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKey:", v27);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v31)
            {
              v49 = 0u;
              v50 = 0u;
              v47 = 0u;
              v48 = 0u;
              objc_msgSend(v29, "patterns");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectForKeyedSubscript:", v27);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
              if (v34)
              {
                v35 = v34;
                v36 = *(_QWORD *)v48;
                do
                {
                  for (j = 0; j != v35; ++j)
                  {
                    if (*(_QWORD *)v48 != v36)
                      objc_enumerationMutation(v33);
                    objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("kEventResourcePatternWorkoutEndDate"));
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "doubleValue");
                    v40 = v39;

                    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v40);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v21, "isBeforeDate:", v41))
                    {
                      v42 = v41;

                      v21 = v42;
                    }

                  }
                  v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
                }
                while (v35);
              }

              v26 = v44;
              v23 = v45;
              v27 = v43;
            }
            v25 = v46;
          }
          ++v28;
        }
        while (v28 != v25);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v25);
    }

  }
  else
  {
    -[MOEventBundle localEndDate](self, "localEndDate");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v21;
}

- (void)addPerson:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[MOEventBundle persons](self, "persons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v6, "addObject:", v7);
  -[MOEventBundle setPersons:](self, "setPersons:", v6);

}

- (void)addResource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[MOEventBundle resources](self, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v6, "addObject:", v7);
  -[MOEventBundle setResources:](self, "setResources:", v6);

}

- (void)addPhotoTraits:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[MOEventBundle photoTraits](self, "photoTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v6, "addObjectsFromArray:", v7);
  -[MOEventBundle setPhotoTraits:](self, "setPhotoTraits:", v6);

}

- (void)addResources:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[MOEventBundle resources](self, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
    objc_msgSend(v6, "addObjectsFromArray:", v7);
  -[MOEventBundle setResources:](self, "setResources:", v6);

}

- (void)addMetaDataForRankForKey:(id)a3 value:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  -[MOEventBundle metaDataForRank](self, "metaDataForRank");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithDictionary:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKey:", v7, v8);
  v10 = (void *)objc_msgSend(v11, "copy");
  -[MOEventBundle setMetaDataForRank:](self, "setMetaDataForRank:", v10);

}

- (id)_allResourcesImpl
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__MOEventBundle__allResourcesImpl__block_invoke;
  v6[3] = &unk_1E8543068;
  v4 = v3;
  v7 = v4;
  -[MOEventBundle withResourcesUsingBlock:](self, "withResourcesUsingBlock:", v6);

  return v4;
}

uint64_t __34__MOEventBundle__allResourcesImpl__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)withResourcesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  MOResource *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MOResource *v24;
  void *v25;
  MOResource *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  MOResource *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  MOResource *v42;
  void *v43;
  MOResource *v44;
  void *v45;
  void *v46;
  MOEventBundle *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v47 = self;
  -[MOEventBundle resources](self, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __41__MOEventBundle_withResourcesUsingBlock___block_invoke;
  v56[3] = &unk_1E8543090;
  v6 = v4;
  v57 = v6;
  v58 = &v59;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v56);

  if (!*((_BYTE *)v60 + 24))
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[MOEventBundle persons](v47, "persons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v53;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v53 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1D1798EEC]();
        v13 = -[MOResource initWithPerson:]([MOResource alloc], "initWithPerson:", v11);
        if (!v13)
          goto LABEL_10;
        objc_msgSend(v11, "sourceEventIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MOResource setSourceEventIdentifier:](v13, "setSourceEventIdentifier:", v14);

        (*((void (**)(id, MOResource *, uint64_t *))v6 + 2))(v6, v13, v60 + 3);
        if (*((_BYTE *)v60 + 24))
          v15 = 0;
        else
LABEL_10:
          v15 = 1;

        objc_autoreleasePoolPop(v12);
        if (!v15)
          goto LABEL_45;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

    -[MOEventBundle place](v47, "place");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_25;
    -[MOEventBundle places](v47, "places");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count") == 0;

    if (!v18)
      goto LABEL_25;
    v19 = (void *)MEMORY[0x1D1798EEC]();
    -[MOEventBundle place](v47, "place");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "startDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      -[MOEventBundle startDate](v47, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[MOEventBundle place](v47, "place");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "endDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      -[MOEventBundle endDate](v47, "endDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = [MOResource alloc];
    -[MOEventBundle place](v47, "place");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[MOResource initWithPlace:startDate:endDate:](v24, "initWithPlace:startDate:endDate:", v25, v21, v23);

    if (!v26)
      goto LABEL_23;
    -[MOEventBundle place](v47, "place");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sourceEventIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOResource setSourceEventIdentifier:](v26, "setSourceEventIdentifier:", v28);

    (*((void (**)(id, MOResource *, uint64_t *))v6 + 2))(v6, v26, v60 + 3);
    if (*((_BYTE *)v60 + 24))
      v29 = 0;
    else
LABEL_23:
      v29 = 1;

    objc_autoreleasePoolPop(v19);
    if (v29)
    {
LABEL_25:
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      -[MOEventBundle places](v47, "places");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v49;
LABEL_27:
        v32 = 0;
        while (1)
        {
          if (*(_QWORD *)v49 != v31)
            objc_enumerationMutation(v7);
          v33 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v32);
          v34 = (void *)MEMORY[0x1D1798EEC]();
          objc_msgSend(v33, "startDate");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v35)
          {
            -[MOEventBundle startDate](v47, "startDate");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v33, "endDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v36)
          {
            -[MOEventBundle endDate](v47, "endDate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v37 = -[MOResource initWithPlace:startDate:endDate:]([MOResource alloc], "initWithPlace:startDate:endDate:", v33, v35, v36);
          v39 = 1;
          if (v37)
          {
            objc_msgSend(v33, "sourceEventIdentifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[MOResource setSourceEventIdentifier:](v37, "setSourceEventIdentifier:", v38);

            (*((void (**)(id, MOResource *, uint64_t *))v6 + 2))(v6, v37, v60 + 3);
            if (*((_BYTE *)v60 + 24))
              v39 = 0;
          }

          objc_autoreleasePoolPop(v34);
          if (!v39)
            break;
          if (v30 == ++v32)
          {
            v30 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
            if (v30)
              goto LABEL_27;
            goto LABEL_41;
          }
        }
LABEL_45:

        goto LABEL_46;
      }
LABEL_41:

      -[MOEventBundle predominantWeather](v47, "predominantWeather");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        v41 = (void *)MEMORY[0x1D1798EEC]();
        v42 = [MOResource alloc];
        -[MOEventBundle predominantWeather](v47, "predominantWeather");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[MOResource initWithWeather:](v42, "initWithWeather:", v43);

        if (v44)
        {
          -[MOEventBundle predominantWeather](v47, "predominantWeather");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "sourceEventIdentifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[MOResource setSourceEventIdentifier:](v44, "setSourceEventIdentifier:", v46);

          (*((void (**)(id, MOResource *, uint64_t *))v6 + 2))(v6, v44, v60 + 3);
        }

        objc_autoreleasePoolPop(v41);
      }
    }
  }
LABEL_46:

  _Block_object_dispose(&v59, 8);
}

uint64_t __41__MOEventBundle_withResourcesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *a4;
  return result;
}

- (void)buildResources
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  uint64_t v8;
  __objc2_class **v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  void *v13;
  MOResource *v14;
  void *v15;
  double v16;
  MOEventBundle *v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  MOResource *v31;
  void *v32;
  MOResource *v33;
  void *v34;
  void *v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  double v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  BOOL v48;
  void *v49;
  void *v50;
  MOResource *v51;
  void *v52;
  double v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  void *v66;
  double v67;
  MOEventBundle *v68;
  id obj;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_new();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v68 = self;
  -[MOEventBundle persons](self, "persons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
  v9 = off_1E8541000;
  if (v8)
  {
    v10 = v8;
    v11 = 0;
    v4 = *(void **)v79;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(void **)v79 != v4)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        v14 = -[MOResource initWithPerson:]([MOResource alloc], "initWithPerson:", v13);
        v2 = v14;
        if (v14)
        {
          -[MOResource identifier](v14, "identifier");
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          if (v3)
          {
            objc_msgSend(v13, "sourceEventIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setSourceEventIdentifier:", v15);

            objc_msgSend(v2, "priorityScore");
            if (v16 <= 0.0)
              objc_msgSend(v2, "setPriorityScore:", (double)v11++ + 10000.0);
            objc_msgSend(v6, "addObject:", v2);
          }
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  v17 = v68;
  if (-[MOEventBundle interfaceType](v68, "interfaceType") != 7)
  {
    v18 = -[MOEventBundle interfaceType](v68, "interfaceType");
    if (v18 == 1)
    {
      -[MOEventBundle place](v68, "place");
      obj = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(obj, "placeUserType") == 1)
      {
LABEL_84:

        goto LABEL_85;
      }
    }
    v19 = -[MOEventBundle interfaceType](v68, "interfaceType");
    if (v19 == 1)
    {
      -[MOEventBundle place](v68, "place");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "placeUserType") == 2)
      {
        v20 = 0;
        goto LABEL_35;
      }
    }
    v4 = -[MOEventBundle interfaceType](v68, "interfaceType");
    if (v4 == (void *)12)
    {
      -[MOEventBundle place](v68, "place");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "placeUserType") == 1)
      {
        v20 = 0;
LABEL_29:

        goto LABEL_34;
      }
      if (-[MOEventBundle interfaceType](v68, "interfaceType") == 12)
      {
LABEL_27:
        -[MOEventBundle place](v68, "place");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v21, "placeUserType") != 2;

        if (v4 != (void *)12)
        {
          v17 = v68;
          if (v19 != 1)
          {
LABEL_36:
            if (v18 == 1)
            {

              if (!v20)
                goto LABEL_85;
            }
            else if (!v20)
            {
              goto LABEL_85;
            }
            -[MOEventBundle place](v17, "place");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "priorityScore");
            if (v23 < 20000.0)
            {
              -[MOEventBundle place](v17, "place");
              v24 = objc_claimAutoreleasedReturnValue();
              if (v24)
              {
                v25 = (void *)v24;
                -[MOEventBundle places](v17, "places");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "count");

                if (v27)
                {
LABEL_53:
                  v76 = 0u;
                  v77 = 0u;
                  v74 = 0u;
                  v75 = 0u;
                  -[MOEventBundle places](v17, "places");
                  obj = (id)objc_claimAutoreleasedReturnValue();
                  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
                  if (!v37)
                    goto LABEL_84;
                  v38 = v37;
                  v39 = *(_QWORD *)v75;
                  while (1)
                  {
                    for (j = 0; j != v38; ++j)
                    {
                      if (*(_QWORD *)v75 != v39)
                        objc_enumerationMutation(obj);
                      v41 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
                      objc_msgSend(v41, "priorityScore");
                      if (v42 < 20000.0)
                      {
                        v43 = -[MOEventBundle interfaceType](v17, "interfaceType");
                        if (v43 == 12)
                        {
                          -[MOEventBundle place](v17, "place");
                          v4 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v4, "placeUserType") == 1)
                          {
                            v44 = v4;
LABEL_81:

                            continue;
                          }
                          if (-[MOEventBundle interfaceType](v17, "interfaceType") == 12)
                          {
LABEL_65:
                            v45 = v4;
                            -[MOEventBundle place](v17, "place");
                            v46 = (void *)objc_claimAutoreleasedReturnValue();
                            v47 = objc_msgSend(v46, "placeUserType");

                            if (v43 == 12)
                            {

                              v48 = v47 == 2;
                              v4 = v45;
                              v17 = v68;
                              if (v48)
                                goto LABEL_70;
                            }
                            else
                            {
                              v48 = v47 == 2;
                              v17 = v68;
                              v4 = v45;
                              if (v48)
                              {
LABEL_70:
                                v9 = off_1E8541000;
                                continue;
                              }
                            }
                          }
                          else
                          {

                          }
                        }
                        else if (-[MOEventBundle interfaceType](v17, "interfaceType") == 12)
                        {
                          goto LABEL_65;
                        }
                        v49 = v4;
                        objc_msgSend(v41, "startDate");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v44)
                        {
                          -[MOEventBundle startDate](v17, "startDate");
                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                        objc_msgSend(v41, "endDate");
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v50)
                        {
                          -[MOEventBundle endDate](v17, "endDate");
                          v50 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                        v51 = -[MOResource initWithPlace:startDate:endDate:]([MOResource alloc], "initWithPlace:startDate:endDate:", v41, v44, v50);
                        if (v51)
                        {
                          objc_msgSend(v41, "sourceEventIdentifier");
                          v52 = (void *)objc_claimAutoreleasedReturnValue();
                          -[MOResource setSourceEventIdentifier:](v51, "setSourceEventIdentifier:", v52);

                          -[MOResource priorityScore](v51, "priorityScore");
                          if (v53 <= 0.0)
                            -[MOResource setPriorityScore:](v51, "setPriorityScore:", (double)v11++ + 10000.0);
                          objc_msgSend(v6, "addObject:", v51);
                        }

                        v17 = v68;
                        v4 = v49;
                        v9 = off_1E8541000;
                        goto LABEL_81;
                      }
                    }
                    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
                    if (!v38)
                      goto LABEL_84;
                  }
                }
                -[MOEventBundle place](v17, "place");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "startDate");
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v22)
                {
                  -[MOEventBundle startDate](v17, "startDate");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                }
                -[MOEventBundle place](v17, "place");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "endDate");
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v30)
                {
                  -[MOEventBundle endDate](v17, "endDate");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v31 = [MOResource alloc];
                -[MOEventBundle place](v17, "place");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = -[MOResource initWithPlace:startDate:endDate:](v31, "initWithPlace:startDate:endDate:", v32, v22, v30);

                if (v33)
                {
                  -[MOEventBundle place](v17, "place");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "sourceEventIdentifier");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MOResource setSourceEventIdentifier:](v33, "setSourceEventIdentifier:", v35);

                  -[MOResource priorityScore](v33, "priorityScore");
                  if (v36 <= 0.0)
                    -[MOResource setPriorityScore:](v33, "setPriorityScore:", (double)v11++ + 10000.0);
                  objc_msgSend(v6, "addObject:", v33);
                }

              }
            }

            goto LABEL_53;
          }
LABEL_35:

          goto LABEL_36;
        }
        v17 = v68;
        goto LABEL_29;
      }

    }
    else if (-[MOEventBundle interfaceType](v68, "interfaceType") == 12)
    {
      goto LABEL_27;
    }
    v20 = 1;
LABEL_34:
    if (v19 != 1)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_85:
  -[MOEventBundle predominantWeather](v17, "predominantWeather");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    v55 = objc_alloc(v9[10]);
    -[MOEventBundle predominantWeather](v17, "predominantWeather");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v55, "initWithWeather:", v56);

    if (v57)
    {
      -[MOEventBundle predominantWeather](v17, "predominantWeather");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "sourceEventIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setSourceEventIdentifier:", v59);

      objc_msgSend(v57, "priorityScore");
      if (v60 <= 0.0)
        objc_msgSend(v57, "setPriorityScore:", (double)v11++ + 10000.0);
      objc_msgSend(v6, "addObject:", v57);
    }

  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  -[MOEventBundle resources](v17, "resources");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v71;
    do
    {
      for (k = 0; k != v63; ++k)
      {
        if (*(_QWORD *)v71 != v64)
          objc_enumerationMutation(v61);
        v66 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
        objc_msgSend(v66, "priorityScore");
        if (v67 <= 0.0)
          objc_msgSend(v66, "setPriorityScore:", (double)v11++ + 10000.0);
        objc_msgSend(v6, "addObject:", v66);
      }
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    }
    while (v63);
  }

  -[MOEventBundle setResources:](v17, "setResources:", v6);
}

- (void)addEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[MOEventBundle events](self, "events");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0C99DE8];
      -[MOEventBundle events](self, "events");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayWithArray:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "addObject:", v4);
      v9 = (void *)objc_msgSend(v8, "copy");
      -[MOEventBundle setEvents:](self, "setEvents:", v9);

    }
    else
    {
      v10[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOEventBundle setEvents:](self, "setEvents:", v8);
    }

  }
}

- (void)addEvents:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = v4;
    v6 = objc_msgSend(v4, "count");
    v5 = v12;
    if (v6)
    {
      -[MOEventBundle events](self, "events");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = (void *)MEMORY[0x1E0C99DE8];
        -[MOEventBundle events](self, "events");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "arrayWithArray:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "count"))
          objc_msgSend(v10, "addObjectsFromArray:", v12);
        v11 = (void *)objc_msgSend(v10, "copy");
        -[MOEventBundle setEvents:](self, "setEvents:", v11);

      }
      else
      {
        -[MOEventBundle setEvents:](self, "setEvents:", v12);
      }
      v5 = v12;
    }
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOEventBundle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  MOEventBundle *v9;
  MOEventBundle *v10;
  MOEventBundle *v11;
  uint64_t v12;
  NSDate *startDate;
  uint64_t v14;
  NSDate *endDate;
  uint64_t v16;
  NSDate *firstCreationDate;
  uint64_t v18;
  NSDate *expirationDate;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *events;
  uint64_t v25;
  NSString *promptLanguage;
  uint64_t v27;
  MOAction *action;
  uint64_t v29;
  MOAction *concurrentMediaAction;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSArray *actions;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSArray *backgroundActions;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSArray *persons;
  uint64_t v46;
  MOPlace *place;
  uint64_t v48;
  MOWeather *predominantWeather;
  uint64_t v50;
  MOTime *time;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSArray *resources;
  void *v57;
  uint64_t v58;
  NSDictionary *rankingDictionary;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSArray *labels;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  NSArray *promptLanguages;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  NSMutableDictionary *metaData;
  void *v75;
  uint64_t v76;
  NSDictionary *metaDataForRank;
  uint64_t v78;
  NSUUID *suggestionID;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  NSMutableSet *suggestionEngagementEvents;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  NSArray *places;
  uint64_t v92;
  NSArray *subBundleIDs;
  uint64_t v94;
  NSArray *subSuggestionIDs;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  NSMutableSet *appEntryEngagementEvents;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  NSArray *visitEventsRejectedByWatchLocation;
  uint64_t v108;
  MOClusterMetadata *clusterMetadata;
  uint64_t v110;
  MOOutlierMetadata *outlierMetadata;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  NSArray *photoTraits;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    v10 = -[MOEventBundle initWithBundleIdentifier:creationDate:](self, "initWithBundleIdentifier:creationDate:", v5, v6);
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
      v12 = objc_claimAutoreleasedReturnValue();
      startDate = v11->_startDate;
      v11->_startDate = (NSDate *)v12;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
      v14 = objc_claimAutoreleasedReturnValue();
      endDate = v11->_endDate;
      v11->_endDate = (NSDate *)v14;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstCreationDate"));
      v16 = objc_claimAutoreleasedReturnValue();
      firstCreationDate = v11->_firstCreationDate;
      v11->_firstCreationDate = (NSDate *)v16;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
      v18 = objc_claimAutoreleasedReturnValue();
      expirationDate = v11->_expirationDate;
      v11->_expirationDate = (NSDate *)v18;

      v11->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
      v11->_interfaceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interfaceType"));
      v11->_photoSource = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("photoSource"));
      v20 = (void *)MEMORY[0x1E0C99E60];
      v21 = objc_opt_class();
      objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("events"));
      v23 = objc_claimAutoreleasedReturnValue();
      events = v11->_events;
      v11->_events = (NSArray *)v23;

      v11->_filtered = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("filtered"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("promptLanguage"));
      v25 = objc_claimAutoreleasedReturnValue();
      promptLanguage = v11->_promptLanguage;
      v11->_promptLanguage = (NSString *)v25;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
      v27 = objc_claimAutoreleasedReturnValue();
      action = v11->_action;
      v11->_action = (MOAction *)v27;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("concurrentMediaAction"));
      v29 = objc_claimAutoreleasedReturnValue();
      concurrentMediaAction = v11->_concurrentMediaAction;
      v11->_concurrentMediaAction = (MOAction *)v29;

      v31 = (void *)MEMORY[0x1E0C99E60];
      v32 = objc_opt_class();
      objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("actions"));
      v34 = objc_claimAutoreleasedReturnValue();
      actions = v11->_actions;
      v11->_actions = (NSArray *)v34;

      v36 = (void *)MEMORY[0x1E0C99E60];
      v37 = objc_opt_class();
      objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("backgroundActions"));
      v39 = objc_claimAutoreleasedReturnValue();
      backgroundActions = v11->_backgroundActions;
      v11->_backgroundActions = (NSArray *)v39;

      v41 = (void *)MEMORY[0x1E0C99E60];
      v42 = objc_opt_class();
      objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v43, CFSTR("persons"));
      v44 = objc_claimAutoreleasedReturnValue();
      persons = v11->_persons;
      v11->_persons = (NSArray *)v44;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("place"));
      v46 = objc_claimAutoreleasedReturnValue();
      place = v11->_place;
      v11->_place = (MOPlace *)v46;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weather"));
      v48 = objc_claimAutoreleasedReturnValue();
      predominantWeather = v11->_predominantWeather;
      v11->_predominantWeather = (MOWeather *)v48;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("time"));
      v50 = objc_claimAutoreleasedReturnValue();
      time = v11->_time;
      v11->_time = (MOTime *)v50;

      v52 = (void *)MEMORY[0x1E0C99E60];
      v53 = objc_opt_class();
      objc_msgSend(v52, "setWithObjects:", v53, objc_opt_class(), 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v54, CFSTR("resources"));
      v55 = objc_claimAutoreleasedReturnValue();
      resources = v11->_resources;
      v11->_resources = (NSArray *)v55;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rankingDictionary"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v57);
      v58 = objc_claimAutoreleasedReturnValue();
      rankingDictionary = v11->_rankingDictionary;
      v11->_rankingDictionary = (NSDictionary *)v58;

      v60 = (void *)MEMORY[0x1E0C99E60];
      v61 = objc_opt_class();
      objc_msgSend(v60, "setWithObjects:", v61, objc_opt_class(), 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v62, CFSTR("labels"));
      v63 = objc_claimAutoreleasedReturnValue();
      labels = v11->_labels;
      v11->_labels = (NSArray *)v63;

      v65 = (void *)MEMORY[0x1E0C99E60];
      v66 = objc_opt_class();
      objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v67, CFSTR("promptLanguages"));
      v68 = objc_claimAutoreleasedReturnValue();
      promptLanguages = v11->_promptLanguages;
      v11->_promptLanguages = (NSArray *)v68;

      v70 = objc_alloc(MEMORY[0x1E0C99E08]);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metaData"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v70, "initWithDictionary:", v72);
      metaData = v11->_metaData;
      v11->_metaData = (NSMutableDictionary *)v73;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metaDataForRank"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v75);
      v76 = objc_claimAutoreleasedReturnValue();
      metaDataForRank = v11->_metaDataForRank;
      v11->_metaDataForRank = (NSDictionary *)v76;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestionID"));
      v78 = objc_claimAutoreleasedReturnValue();
      suggestionID = v11->_suggestionID;
      v11->_suggestionID = (NSUUID *)v78;

      v80 = (void *)MEMORY[0x1E0C99E20];
      v81 = (void *)MEMORY[0x1E0C99E60];
      v82 = objc_opt_class();
      objc_msgSend(v81, "setWithObjects:", v82, objc_opt_class(), 0);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v83, CFSTR("suggestionEngagements"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "setWithArray:", v84);
      v85 = objc_claimAutoreleasedReturnValue();
      suggestionEngagementEvents = v11->_suggestionEngagementEvents;
      v11->_suggestionEngagementEvents = (NSMutableSet *)v85;

      v87 = (void *)MEMORY[0x1E0C99E60];
      v88 = objc_opt_class();
      objc_msgSend(v87, "setWithObjects:", v88, objc_opt_class(), 0);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v89, CFSTR("places"));
      v90 = objc_claimAutoreleasedReturnValue();
      places = v11->_places;
      v11->_places = (NSArray *)v90;

      v11->_isAggregatedAndSuppressed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAggregatedAndSuppressed"));
      v11->_summarizationGranularity = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("summarizationGranularity"));
      objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("subBundleIDs"));
      v92 = objc_claimAutoreleasedReturnValue();
      subBundleIDs = v11->_subBundleIDs;
      v11->_subBundleIDs = (NSArray *)v92;

      objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("subSuggestionIDs"));
      v94 = objc_claimAutoreleasedReturnValue();
      subSuggestionIDs = v11->_subSuggestionIDs;
      v11->_subSuggestionIDs = (NSArray *)v94;

      v11->_suggestionEngagementViewCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("suggestionViewCount"));
      v96 = (void *)MEMORY[0x1E0C99E20];
      v97 = (void *)MEMORY[0x1E0C99E60];
      v98 = objc_opt_class();
      objc_msgSend(v97, "setWithObjects:", v98, objc_opt_class(), 0);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v99, CFSTR("appEntryEngagements"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "setWithArray:", v100);
      v101 = objc_claimAutoreleasedReturnValue();
      appEntryEngagementEvents = v11->_appEntryEngagementEvents;
      v11->_appEntryEngagementEvents = (NSMutableSet *)v101;

      v103 = (void *)MEMORY[0x1E0C99E60];
      v104 = objc_opt_class();
      objc_msgSend(v103, "setWithObjects:", v104, objc_opt_class(), 0);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v105, CFSTR("visitEventsRejectedByWatchLocation"));
      v106 = objc_claimAutoreleasedReturnValue();
      visitEventsRejectedByWatchLocation = v11->_visitEventsRejectedByWatchLocation;
      v11->_visitEventsRejectedByWatchLocation = (NSArray *)v106;

      v11->_bundleSubType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bundleSubType"));
      v11->_bundleSuperType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bundleSuperType"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clusterMetadata"));
      v108 = objc_claimAutoreleasedReturnValue();
      clusterMetadata = v11->_clusterMetadata;
      v11->_clusterMetadata = (MOClusterMetadata *)v108;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outlierMetadata"));
      v110 = objc_claimAutoreleasedReturnValue();
      outlierMetadata = v11->_outlierMetadata;
      v11->_outlierMetadata = (MOOutlierMetadata *)v110;

      v112 = (void *)MEMORY[0x1E0C99E60];
      v113 = objc_opt_class();
      objc_msgSend(v112, "setWithObjects:", v113, objc_opt_class(), 0);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v114, CFSTR("photoTraits"));
      v115 = objc_claimAutoreleasedReturnValue();
      photoTraits = v11->_photoTraits;
      v11->_photoTraits = (NSArray *)v115;

    }
    self = v11;
    v9 = self;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *bundleIdentifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  bundleIdentifier = self->_bundleIdentifier;
  v12 = a3;
  objc_msgSend(v12, "encodeObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_firstCreationDate, CFSTR("firstCreationDate"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_interfaceType, CFSTR("interfaceType"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_photoSource, CFSTR("photoSource"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_events, CFSTR("events"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_filtered, CFSTR("filtered"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_promptLanguage, CFSTR("promptLanguage"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_action, CFSTR("action"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_concurrentMediaAction, CFSTR("concurrentMediaAction"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_actions, CFSTR("actions"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_backgroundActions, CFSTR("backgroundActions"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_persons, CFSTR("persons"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_place, CFSTR("place"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_predominantWeather, CFSTR("weather"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_time, CFSTR("time"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_resources, CFSTR("resources"));
  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_rankingDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("rankingDictionary"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_labels, CFSTR("labels"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_promptLanguages, CFSTR("promptLanguages"));
  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_metaData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("metaData"));

  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_metaDataForRank);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("metaDataForRank"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_suggestionID, CFSTR("suggestionID"));
  -[MOEventBundle suggestionEngagementEvents](self, "suggestionEngagementEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("suggestionEngagements"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_places, CFSTR("places"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_isAggregatedAndSuppressed, CFSTR("isAggregatedAndSuppressed"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_summarizationGranularity, CFSTR("summarizationGranularity"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_subBundleIDs, CFSTR("subBundleIDs"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_subSuggestionIDs, CFSTR("subSuggestionIDs"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_suggestionEngagementViewCount, CFSTR("suggestionViewCount"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_visitEventsRejectedByWatchLocation, CFSTR("visitEventsRejectedByWatchLocation"));
  -[MOEventBundle appEntryEngagementEvents](self, "appEntryEngagementEvents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("appEntryEngagements"));

  objc_msgSend(v12, "encodeInteger:forKey:", self->_bundleSubType, CFSTR("bundleSubType"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_bundleSuperType, CFSTR("bundleSuperType"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_clusterMetadata, CFSTR("clusterMetadata"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_outlierMetadata, CFSTR("outlierMetadata"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_photoTraits, CFSTR("photoTraits"));

}

- (id)dateInterval
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  -[MOEventBundle startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    goto LABEL_4;
  }
  -[MOEventBundle endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_4:
    -[MOEventBundle endDate](self, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[MOEventBundle startDate](self, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {

      if (v8)
      {
        -[MOEventBundle startDate](self, "startDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MOEventBundle endDate](self, "endDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isOnOrBefore:", v10);

        if ((v11 & 1) == 0)
        {
          _mo_log_facility_get_os_log(MOLogFacilityGeneral);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            -[MOEventBundle dateInterval].cold.1((uint64_t)self, v12);

          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundle.m"), 1434, CFSTR("startDate is NOT earlier than endDate, bundle, %@ (in %s:%d)"), self, "-[MOEventBundle dateInterval]", 1434);

        }
        -[MOEventBundle startDate](self, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MOEventBundle endDate](self, "endDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isBeforeDate:", v15);

        if ((v16 & 1) == 0)
          goto LABEL_11;
LABEL_15:
        v18 = objc_alloc(MEMORY[0x1E0CB3588]);
        -[MOEventBundle startDate](self, "startDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MOEventBundle endDate](self, "endDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v18, "initWithStartDate:endDate:", v19, v20);

        return v17;
      }
      -[MOEventBundle endDate](self, "endDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOEventBundle setStartDate:](self, "setStartDate:", v8);
    }
    else
    {
      -[MOEventBundle setEndDate:](self, "setEndDate:", v7);
    }

    goto LABEL_15;
  }
LABEL_11:
  v17 = 0;
  return v17;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MOEventBundle bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqualToEventBundle:(id)a3
{
  MOEventBundle *v4;
  void *v5;
  void *v6;
  char v7;
  int v8;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  unint64_t v17;
  const __CFString *v18;
  MOEventBundle *v19;
  MOEventBundle *v20;
  MOEventBundle *v21;
  double v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t m;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t j;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
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
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v4 = (MOEventBundle *)a3;
  if (self == v4)
    goto LABEL_3;
  -[MOEventBundle bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle bundleIdentifier](v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) != 0)
    goto LABEL_3;
  -[MOEventBundle suggestionID](self, "suggestionID");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[MOEventBundle suggestionID](v4, "suggestionID");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      -[MOEventBundle suggestionID](self, "suggestionID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOEventBundle suggestionID](v4, "suggestionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if ((v16 & 1) != 0)
      {
LABEL_3:
        LOBYTE(v8) = 1;
        goto LABEL_4;
      }
    }
    else
    {

    }
  }
  v17 = -[MOEventBundle interfaceType](self, "interfaceType");
  if (v17 != -[MOEventBundle interfaceType](v4, "interfaceType"))
  {
LABEL_84:
    LOBYTE(v8) = 0;
    goto LABEL_4;
  }
  LOBYTE(v8) = 0;
  switch(-[MOEventBundle interfaceType](v4, "interfaceType"))
  {
    case 0uLL:
      if (!-[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](self, "isEqualPropertyForObject:other:propertyPath:threshold:", self, v4, CFSTR("startDate"), 60.0))goto LABEL_84;
      v18 = CFSTR("endDate");
      v22 = 60.0;
      goto LABEL_32;
    case 1uLL:
    case 2uLL:
      if (!-[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](self, "isEqualPropertyForObject:other:propertyPath:threshold:", self, v4, CFSTR("startDate"), 600.0))goto LABEL_84;
      v18 = CFSTR("endDate");
      v19 = self;
      v20 = self;
      v21 = v4;
      v22 = 600.0;
      goto LABEL_33;
    case 4uLL:
      if (!-[MOEventBundle isEqualBasicPropertiesForObject:other:](self, "isEqualBasicPropertiesForObject:other:", self, v4))goto LABEL_84;
      -[MOEventBundle startDate](self, "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOEventBundle startDate](v4, "startDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v23, "isSameDayWithDate:", v24);

      if (!v8)
        goto LABEL_4;
      v25 = -[MOEventBundle isEqualPersonsForObject:other:](self, "isEqualPersonsForObject:other:", self, v4);
      goto LABEL_34;
    case 5uLL:
      if (!-[MOEventBundle isEqualBasicPropertiesForObject:other:](self, "isEqualBasicPropertiesForObject:other:", self, v4))goto LABEL_84;
      -[MOEventBundle startDate](self, "startDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOEventBundle startDate](v4, "startDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v26, "isSameDayWithDate:", v27);

      if (!v8)
        goto LABEL_4;
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      -[MOEventBundle resources](self, "resources");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
      if (v29)
      {
        v30 = v29;
        v31 = 0;
        v32 = *(_QWORD *)v107;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v107 != v32)
              objc_enumerationMutation(v28);
            v34 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
            v35 = (void *)MEMORY[0x1D1798EEC]();
            if (objc_msgSend(v34, "type") == 3)
            {
              objc_msgSend(v34, "getDictionary");
              v36 = objc_claimAutoreleasedReturnValue();

              v31 = (void *)v36;
            }
            objc_autoreleasePoolPop(v35);
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
        }
        while (v30);
      }
      else
      {
        v31 = 0;
      }

      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      -[MOEventBundle resources](v4, "resources");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
      if (!v84)
      {
        v86 = 0;
LABEL_106:

        goto LABEL_107;
      }
      v85 = v84;
      v86 = 0;
      v87 = *(_QWORD *)v103;
      do
      {
        for (j = 0; j != v85; ++j)
        {
          if (*(_QWORD *)v103 != v87)
            objc_enumerationMutation(v83);
          v89 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
          v90 = (void *)MEMORY[0x1D1798EEC]();
          if (objc_msgSend(v89, "type") == 3)
          {
            objc_msgSend(v89, "getDictionary");
            v91 = objc_claimAutoreleasedReturnValue();

            v86 = (void *)v91;
          }
          objc_autoreleasePoolPop(v90);
        }
        v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
      }
      while (v85);

      if (v31 && v86)
      {
        objc_msgSend(v31, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID"));
        v92 = objc_claimAutoreleasedReturnValue();
        v93 = (void *)v92;
        if (v83 && v92)
          objc_msgSend(v83, "isEqualToString:", v92);

        goto LABEL_106;
      }
LABEL_107:

      goto LABEL_3;
    case 6uLL:
      v18 = CFSTR("dateInterval");
      v22 = 0.8;
LABEL_32:
      v19 = self;
      v20 = self;
      v21 = v4;
LABEL_33:
      v25 = -[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](v19, "isEqualPropertyForObject:other:propertyPath:threshold:", v20, v21, v18, v22);
      goto LABEL_34;
    case 7uLL:
      v37 = -[MOEventBundle bundleSubType](self, "bundleSubType");
      if (v37 != -[MOEventBundle bundleSubType](v4, "bundleSubType"))
        goto LABEL_84;
      goto LABEL_83;
    case 8uLL:
      if (!-[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](self, "isEqualPropertyForObject:other:propertyPath:threshold:", self, v4, CFSTR("dateInterval"), 0.8))goto LABEL_84;
      v25 = -[MOEventBundle isEqualResourcesForObject:other:resourceType:](self, "isEqualResourcesForObject:other:resourceType:", self, v4, 8);
      goto LABEL_34;
    case 10uLL:
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      -[MOEventBundle resources](self, "resources");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
      if (v39)
      {
        v40 = v39;
        v41 = 0;
        v42 = *(_QWORD *)v99;
        do
        {
          for (k = 0; k != v40; ++k)
          {
            if (*(_QWORD *)v99 != v42)
              objc_enumerationMutation(v38);
            v44 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * k);
            v45 = (void *)MEMORY[0x1D1798EEC]();
            if (objc_msgSend(v44, "type") == 15)
            {
              objc_msgSend(v44, "getDictionary");
              v46 = objc_claimAutoreleasedReturnValue();

              v41 = (void *)v46;
            }
            objc_autoreleasePoolPop(v45);
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
        }
        while (v40);
      }
      else
      {
        v41 = 0;
      }

      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      -[MOEventBundle resources](v4, "resources", 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v94, v110, 16);
      if (!v56)
      {

        v58 = 0;
LABEL_76:
        LOBYTE(v8) = -[MOEventBundle isEqualBaseActionForObject:other:](self, "isEqualBaseActionForObject:other:", self, v4);

        goto LABEL_4;
      }
      v57 = v56;
      v58 = 0;
      v59 = *(_QWORD *)v95;
      do
      {
        for (m = 0; m != v57; ++m)
        {
          if (*(_QWORD *)v95 != v59)
            objc_enumerationMutation(v55);
          v61 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * m);
          v62 = (void *)MEMORY[0x1D1798EEC]();
          if (objc_msgSend(v61, "type") == 15)
          {
            objc_msgSend(v61, "getDictionary");
            v63 = objc_claimAutoreleasedReturnValue();

            v58 = (void *)v63;
          }
          objc_autoreleasePoolPop(v62);
        }
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v94, v110, 16);
      }
      while (v57);

      if (!v41 || !v58)
        goto LABEL_76;
      objc_msgSend(v41, "objectForKey:", CFSTR("MOPHMemoryMetaDataKeyMemoryIdentifier"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectForKey:", CFSTR("MOPHMemoryMetaDataKeyMemoryIdentifier"));
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = (void *)v65;
      if (v64 && v65 && (objc_msgSend(v64, "isEqualToString:", v65) & 1) != 0)
      {

        goto LABEL_3;
      }

LABEL_88:
      v82 = objc_msgSend((id)objc_opt_class(), "castEvergreenSubType:", -[MOEventBundle bundleSubType](v4, "bundleSubType"));
      LOBYTE(v8) = v82 == objc_msgSend((id)objc_opt_class(), "castEvergreenSubType:", -[MOEventBundle bundleSubType](self, "bundleSubType"));
LABEL_4:

      return v8;
    case 11uLL:
      goto LABEL_88;
    case 12uLL:
      v47 = -[MOEventBundle summarizationGranularity](self, "summarizationGranularity");
      if (v47 != -[MOEventBundle summarizationGranularity](v4, "summarizationGranularity"))
        goto LABEL_84;
      if (-[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](self, "isEqualPropertyForObject:other:propertyPath:threshold:", self, v4, CFSTR("startDate"), 600.0))
      {
        goto LABEL_3;
      }
      -[MOEventBundle subBundleIDs](self, "subBundleIDs");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "count");

      if (v49)
      {
        if (-[MOEventBundle intersectedSubBundleIDForObject:other:](self, "intersectedSubBundleIDForObject:other:", self, v4))
        {
          goto LABEL_3;
        }
      }
      v25 = -[MOEventBundle intersectedActivityOrVisitForObject:other:](self, "intersectedActivityOrVisitForObject:other:", self, v4);
LABEL_34:
      LOBYTE(v8) = v25;
      goto LABEL_4;
    case 13uLL:
      -[MOEventBundle place](self, "place");
      v50 = objc_claimAutoreleasedReturnValue();
      if (!v50)
        goto LABEL_84;
      v51 = (void *)v50;
      -[MOEventBundle place](v4, "place");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v52)
        goto LABEL_84;
      -[MOEventBundle place](self, "place");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "placeType");
      if (v54 > 0x64
        || (-[MOEventBundle place](v4, "place"),
            v52 = (void *)objc_claimAutoreleasedReturnValue(),
            (unint64_t)objc_msgSend(v52, "placeType") > 0x64))
      {
        -[MOEventBundle place](self, "place");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "placeType");
        -[MOEventBundle place](v4, "place");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v69, "placeType");

        if (v54 <= 0x64)
        if (v68 != v70)
          goto LABEL_84;
      }
      else
      {

      }
      v71 = objc_alloc(MEMORY[0x1E0CB3588]);
      -[MOEventBundle startDate](self, "startDate");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOEventBundle endDate](self, "endDate");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = (void *)objc_msgSend(v71, "initWithStartDate:endDate:", v72, v73);

      v75 = objc_alloc(MEMORY[0x1E0CB3588]);
      -[MOEventBundle startDate](v4, "startDate");
      v76 = objc_claimAutoreleasedReturnValue();
      -[MOEventBundle endDate](v4, "endDate");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = (void *)objc_msgSend(v75, "initWithStartDate:endDate:", v76, v77);

      LOBYTE(v76) = objc_msgSend(v74, "intersectsDateInterval:", v78);
      if ((v76 & 1) != 0)
        goto LABEL_3;
LABEL_81:
      if (-[MOEventBundle bundleSubType](self, "bundleSubType") == 801
        && -[MOEventBundle bundleSubType](v4, "bundleSubType") == 801)
      {
LABEL_83:
        -[MOEventBundle startDate](self, "startDate");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[MOEventBundle startDate](v4, "startDate");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = objc_msgSend(v79, "isSameDayWithDate:", v80);

      }
      else
      {
        -[MOEventBundle startDate](self, "startDate");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[MOEventBundle startDate](v4, "startDate");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = v79 == v81;

      }
      goto LABEL_4;
    case 14uLL:
      goto LABEL_81;
    default:
      goto LABEL_4;
  }
}

+ (unint64_t)castEvergreenSubType:(unint64_t)a3
{
  unint64_t result;

  result = a3;
  if (a3 - 707 <= 2)
    return qword_1CAE9D4E8[a3 - 707];
  return result;
}

- (BOOL)intersectedSubBundleIDForObject:(id)a3 other:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a3, "subBundleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v5, "subBundleIDs", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              if ((objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j)) & 1) != 0)
              {

                v17 = 1;
                goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v14)
              continue;
            break;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v17 = 0;
    }
    while (v8);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (BOOL)intersectedActivityOrVisitForObject:(id)a3 other:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(a3, "events");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    v25 = v7;
    v26 = v6;
    v23 = *(_QWORD *)v32;
    do
    {
      v11 = 0;
      v24 = v9;
      do
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
        if (objc_msgSend(v12, "category", v23) == 1 || objc_msgSend(v12, "category") == 2)
        {
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v6, "events");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v28;
            while (2)
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v28 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
                if (objc_msgSend(v18, "category") == 1 || objc_msgSend(v18, "category") == 2)
                {
                  if ((v19 = objc_msgSend(v12, "category"), v19 == objc_msgSend(v18, "category"))
                    && objc_msgSend(v12, "category") == 1
                    && -[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](self, "isEqualPropertyForObject:other:propertyPath:threshold:", v12, v18, CFSTR("startDate"), 600.0)|| (v20 = objc_msgSend(v12, "category"), v20 == objc_msgSend(v18, "category"))&& objc_msgSend(v12, "category") == 2&& -[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](self, "isEqualPropertyForObject:other:propertyPath:threshold:", v12, v18, CFSTR("startDate"), 600.0))
                  {

                    v21 = 1;
                    v7 = v25;
                    v6 = v26;
                    goto LABEL_29;
                  }
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              if (v15)
                continue;
              break;
            }
          }

          v7 = v25;
          v6 = v26;
          v10 = v23;
          v9 = v24;
        }
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      v21 = 0;
    }
    while (v9);
  }
  else
  {
    v21 = 0;
  }
LABEL_29:

  return v21;
}

- (BOOL)isEqualBasicPropertiesForObject:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "bundleSuperType");
  if (v7 == objc_msgSend(v6, "bundleSuperType")
    && (v8 = objc_msgSend(v5, "bundleSubType"), v8 == objc_msgSend(v6, "bundleSubType"))
    && (v9 = objc_msgSend(v5, "interfaceType"), v9 == objc_msgSend(v6, "interfaceType")))
  {
    v10 = objc_msgSend(v5, "summarizationGranularity");
    v11 = v10 == objc_msgSend(v6, "summarizationGranularity");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqualPropertyForObject:(id)a3 other:(id)a4 propertyPath:(id)a5 threshold:(double)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  double v15;
  double v16;
  id v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  char v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "valueForKeyPath:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKeyPath:", v11);
  v13 = objc_claimAutoreleasedReturnValue();

  if (!(v12 | v13))
  {
    v14 = 1;
    goto LABEL_22;
  }
  v14 = 0;
  if (v12 && v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)v12, "timeIntervalSinceDate:", v13);
      v16 = fabs(v15);
LABEL_7:
      v14 = v16 < a6;
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = objc_msgSend((id)v12, "isEqualToString:", v13);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = (id)v13;
          objc_msgSend((id)v12, "doubleValue");
          v28 = v27;
          objc_msgSend(v26, "doubleValue");
          v30 = v29;

          v16 = v28 - v30;
          if (v28 - v30 < 0.0)
            v16 = -(v28 - v30);
          goto LABEL_7;
        }
        v25 = objc_msgSend(v9, "isEqual:", v10);
      }
      v14 = v25;
      goto LABEL_22;
    }
    v17 = (id)v12;
    v18 = (id)v13;
    if (!objc_msgSend(v17, "intersectsDateInterval:", v18))
      goto LABEL_14;
    objc_msgSend(v17, "intersectionWithDateInterval:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "duration");
    v21 = v20;

    objc_msgSend(v17, "unionWithDateInterval:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "duration");
    v24 = v23;

    if (v24 == 0.0)
LABEL_14:
      v14 = 0;
    else
      v14 = v21 / v24 > a6;

  }
LABEL_22:

  return v14;
}

- (BOOL)isEqualResourcesForObject:(id)a3 other:(id)a4 resourceType:(unint64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v33 = a4;
  v35 = (void *)objc_opt_new();
  v34 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v32 = v7;
  objc_msgSend(v7, "resources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (objc_msgSend(v13, "type") == a5)
        {
          v14 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v13, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "assets");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "value");
          v18 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@,%@,%f"), v15, v16, v17);

          if (v18)
            objc_msgSend(v35, "addObject:", v18);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v10);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v33, "resources");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        if (objc_msgSend(v24, "type") == a5)
        {
          v25 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v24, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "assets");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "value");
          v29 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("%@,%@,%f"), v26, v27, v28);

          if (v29)
            objc_msgSend(v34, "addObject:", v29);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v21);
  }

  v30 = objc_msgSend(v35, "isEqualToSet:", v34);
  return v30;
}

- (BOOL)isEqualPersonsForObject:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v5, "persons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v14, "contactIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "contactIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v11);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v6, "persons", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v22, "contactIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(v22, "contactIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v24);

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v19);
  }

  v25 = objc_msgSend(v7, "isEqualToSet:", v8);
  return v25;
}

- (BOOL)isEqualBaseActionForObject:(id)a3 other:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a4;
  objc_msgSend(a3, "action");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "action");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v6 | v7)
  {
    v8 = 0;
    if (v7)
      v9 = 0;
    else
      v9 = v6 != 0;
    if (v7)
      v10 = v6 == 0;
    else
      v10 = 0;
    if (!v10 && !v9)
    {
      v11 = objc_msgSend((id)v6, "actionType");
      if (v11 == objc_msgSend((id)v7, "actionType"))
      {
        objc_msgSend((id)v6, "actionName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v7, "actionName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v12, "isEqualToString:", v13);

      }
      else
      {
        v8 = 0;
      }
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOEventBundle *v5;
  MOEventBundle *v6;
  MOEventBundle *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = (MOEventBundle *)a3;
  v6 = v5;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[MOEventBundle bundleIdentifier](self, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8
          || (-[MOEventBundle bundleIdentifier](v7, "bundleIdentifier"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[MOEventBundle bundleIdentifier](self, "bundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[MOEventBundle bundleIdentifier](v7, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v11 = 1;
        }

        goto LABEL_12;
      }
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (BOOL)containTheSameEventSet:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[MOEventBundle events](self, "events");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v5, "events");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("startDate"), 1);
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingDescriptors:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingDescriptors:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v12, "isEqualToArray:", v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)shareEvents:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  uint64_t v27;
  char v28;
  void *v30;
  id v31;
  id obj;
  char v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v31 = v4;
    v5 = v4;
    v6 = (void *)objc_opt_new();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v30 = v5;
    objc_msgSend(v5, "events");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v44 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v12, "eventIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v12, "eventIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v9);
    }

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[MOEventBundle events](self, "events");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v15)
    {
      v16 = v15;
      v33 = 0;
      v34 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v40 != v34)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v19 = v6;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
          if (v20)
          {
            v21 = v20;
            v22 = v6;
            v23 = *(_QWORD *)v36;
            while (2)
            {
              for (k = 0; k != v21; ++k)
              {
                if (*(_QWORD *)v36 != v23)
                  objc_enumerationMutation(v19);
                v25 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * k);
                objc_msgSend(v18, "eventIdentifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v25, "compare:", v26);

                if (!v27)
                {
                  v33 = 1;
                  goto LABEL_27;
                }
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
              if (v21)
                continue;
              break;
            }
LABEL_27:
            v6 = v22;
          }

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v16);
    }
    else
    {
      v33 = 0;
    }

    v4 = v31;
    v28 = v33;
  }
  else
  {
    v28 = 0;
  }

  return v28 & 1;
}

- (id)getCustomLabelsForMetaData:(id)a3 templateFilePath:(id)a4
{
  id v6;
  id v7;
  MOEventBundleLabelFormatter *v8;
  MOEventBundleLabelFormatter *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  if (v6)
    v8 = -[MOEventBundleLabelFormatter initWithTemplatePath:]([MOEventBundleLabelFormatter alloc], "initWithTemplatePath:", v6);
  else
    v8 = (MOEventBundleLabelFormatter *)objc_opt_new();
  v9 = v8;
  -[MOEventBundle getCustomLabelsForMetaData:labelFormatter:](self, "getCustomLabelsForMetaData:labelFormatter:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)getCustomLabelsForMetaData:(id)a3 labelFormatter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[MOEventBundle getBundleType](self, "getBundleType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formattedBundleLabelsForMetaData:bundleType:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MOEventBundle metaData](self, "metaData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOEventBundle getBundleType](self, "getBundleType");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formattedBundleLabelsForMetaData:bundleType:", v8, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }

  return v9;
}

- (id)getCustomPromptsForMetaData:(id)a3 templateFilePath:(id)a4
{
  id v6;
  id v7;
  MOEventBundleLabelFormatter *v8;
  MOEventBundleLabelFormatter *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  if (v6)
    v8 = -[MOEventBundleLabelFormatter initWithTemplatePath:]([MOEventBundleLabelFormatter alloc], "initWithTemplatePath:", v6);
  else
    v8 = (MOEventBundleLabelFormatter *)objc_opt_new();
  v9 = v8;
  -[MOEventBundle getCustomPromptsForMetaData:labelFormatter:](self, "getCustomPromptsForMetaData:labelFormatter:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)getCustomPromptsForMetaData:(id)a3 labelFormatter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[MOEventBundle getBundleType](self, "getBundleType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formattedBundlePromptsForMetaData:bundleType:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MOEventBundle metaData](self, "metaData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOEventBundle getBundleType](self, "getBundleType");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formattedBundlePromptsForMetaData:bundleType:", v8, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }

  return v9;
}

- (BOOL)hasSuggestionEngagementEvent:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MOEventBundle suggestionEngagementEvents](self, "suggestionEngagementEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)setSuggestionEngagementEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MOEventBundle suggestionEngagementEvents](self, "suggestionEngagementEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[MOEventBundle setSuggestionEngagementEvents:](self, "setSuggestionEngagementEvents:", v5);

  }
  v6 = v8;
  if (v8)
  {
    -[MOEventBundle suggestionEngagementEvents](self, "suggestionEngagementEvents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    v6 = v8;
  }

}

- (void)clearSuggestionEngagementEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MOEventBundle suggestionEngagementEvents](self, "suggestionEngagementEvents");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (BOOL)hasAppEntryEngagementEvent:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MOEventBundle appEntryEngagementEvents](self, "appEntryEngagementEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)setAppEntryEngagementEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MOEventBundle appEntryEngagementEvents](self, "appEntryEngagementEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[MOEventBundle setAppEntryEngagementEvents:](self, "setAppEntryEngagementEvents:", v5);

  }
  v6 = v8;
  if (v8)
  {
    -[MOEventBundle appEntryEngagementEvents](self, "appEntryEngagementEvents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    v6 = v8;
  }

}

- (void)clearAppEntryEngagementEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MOEventBundle appEntryEngagementEvents](self, "appEntryEngagementEvents");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (double)duration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[MOEventBundle endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundle startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (NSUUID)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSUUID)suggestionID
{
  return self->_suggestionID;
}

- (void)setSuggestionID:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionID, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (BOOL)filtered
{
  return self->_filtered;
}

- (void)setFiltered:(BOOL)a3
{
  self->_filtered = a3;
}

- (NSString)bundleType
{
  return self->_bundleType;
}

- (void)setBundleType:(id)a3
{
  objc_storeStrong((id *)&self->_bundleType, a3);
}

- (unint64_t)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(unint64_t)a3
{
  self->_interfaceType = a3;
}

- (NSMutableDictionary)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_storeStrong((id *)&self->_labels, a3);
}

- (NSArray)promptLanguages
{
  return self->_promptLanguages;
}

- (void)setPromptLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_promptLanguages, a3);
}

- (NSString)promptLanguage
{
  return self->_promptLanguage;
}

- (void)setPromptLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_promptLanguage, a3);
}

- (NSDictionary)metaDataForRank
{
  return self->_metaDataForRank;
}

- (void)setMetaDataForRank:(id)a3
{
  objc_storeStrong((id *)&self->_metaDataForRank, a3);
}

- (unint64_t)photoSource
{
  return self->_photoSource;
}

- (void)setPhotoSource:(unint64_t)a3
{
  self->_photoSource = a3;
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (MOAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (MOAction)concurrentMediaAction
{
  return self->_concurrentMediaAction;
}

- (void)setConcurrentMediaAction:(id)a3
{
  objc_storeStrong((id *)&self->_concurrentMediaAction, a3);
}

- (NSArray)backgroundActions
{
  return self->_backgroundActions;
}

- (void)setBackgroundActions:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundActions, a3);
}

- (NSArray)persons
{
  return self->_persons;
}

- (void)setPersons:(id)a3
{
  objc_storeStrong((id *)&self->_persons, a3);
}

- (MOPlace)place
{
  return self->_place;
}

- (void)setPlace:(id)a3
{
  objc_storeStrong((id *)&self->_place, a3);
}

- (MOWeather)predominantWeather
{
  return self->_predominantWeather;
}

- (void)setPredominantWeather:(id)a3
{
  objc_storeStrong((id *)&self->_predominantWeather, a3);
}

- (NSArray)places
{
  return self->_places;
}

- (void)setPlaces:(id)a3
{
  objc_storeStrong((id *)&self->_places, a3);
}

- (MOTime)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
  objc_storeStrong((id *)&self->_resources, a3);
}

- (NSArray)photoTraits
{
  return self->_photoTraits;
}

- (void)setPhotoTraits:(id)a3
{
  objc_storeStrong((id *)&self->_photoTraits, a3);
}

- (NSDictionary)rankingDictionary
{
  return self->_rankingDictionary;
}

- (void)setRankingDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_rankingDictionary, a3);
}

- (NSMutableSet)suggestionEngagementEvents
{
  return self->_suggestionEngagementEvents;
}

- (void)setSuggestionEngagementEvents:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionEngagementEvents, a3);
}

- (unint64_t)suggestionEngagementViewCount
{
  return self->_suggestionEngagementViewCount;
}

- (void)setSuggestionEngagementViewCount:(unint64_t)a3
{
  self->_suggestionEngagementViewCount = a3;
}

- (NSMutableSet)appEntryEngagementEvents
{
  return self->_appEntryEngagementEvents;
}

- (void)setAppEntryEngagementEvents:(id)a3
{
  objc_storeStrong((id *)&self->_appEntryEngagementEvents, a3);
}

- (BOOL)isAggregatedAndSuppressed
{
  return self->_isAggregatedAndSuppressed;
}

- (void)setIsAggregatedAndSuppressed:(BOOL)a3
{
  self->_isAggregatedAndSuppressed = a3;
}

- (unint64_t)summarizationGranularity
{
  return self->_summarizationGranularity;
}

- (void)setSummarizationGranularity:(unint64_t)a3
{
  self->_summarizationGranularity = a3;
}

- (NSArray)subBundleIDs
{
  return self->_subBundleIDs;
}

- (void)setSubBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_subBundleIDs, a3);
}

- (NSArray)subSuggestionIDs
{
  return self->_subSuggestionIDs;
}

- (void)setSubSuggestionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_subSuggestionIDs, a3);
}

- (unint64_t)timeAtHomeSubType
{
  return self->_timeAtHomeSubType;
}

- (void)setTimeAtHomeSubType:(unint64_t)a3
{
  self->_timeAtHomeSubType = a3;
}

- (BOOL)includedInSummaryBundleOnly
{
  return self->_includedInSummaryBundleOnly;
}

- (void)setIncludedInSummaryBundleOnly:(BOOL)a3
{
  self->_includedInSummaryBundleOnly = a3;
}

- (NSArray)visitEventsRejectedByWatchLocation
{
  return self->_visitEventsRejectedByWatchLocation;
}

- (void)setVisitEventsRejectedByWatchLocation:(id)a3
{
  objc_storeStrong((id *)&self->_visitEventsRejectedByWatchLocation, a3);
}

- (unint64_t)bundleSubType
{
  return self->_bundleSubType;
}

- (void)setBundleSubType:(unint64_t)a3
{
  self->_bundleSubType = a3;
}

- (unint64_t)bundleSuperType
{
  return self->_bundleSuperType;
}

- (void)setBundleSuperType:(unint64_t)a3
{
  self->_bundleSuperType = a3;
}

- (NSDate)firstCreationDate
{
  return self->_firstCreationDate;
}

- (void)setFirstCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_firstCreationDate, a3);
}

- (MOClusterMetadata)clusterMetadata
{
  return self->_clusterMetadata;
}

- (void)setClusterMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_clusterMetadata, a3);
}

- (MOOutlierMetadata)outlierMetadata
{
  return self->_outlierMetadata;
}

- (void)setOutlierMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_outlierMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outlierMetadata, 0);
  objc_storeStrong((id *)&self->_clusterMetadata, 0);
  objc_storeStrong((id *)&self->_firstCreationDate, 0);
  objc_storeStrong((id *)&self->_visitEventsRejectedByWatchLocation, 0);
  objc_storeStrong((id *)&self->_subSuggestionIDs, 0);
  objc_storeStrong((id *)&self->_subBundleIDs, 0);
  objc_storeStrong((id *)&self->_appEntryEngagementEvents, 0);
  objc_storeStrong((id *)&self->_suggestionEngagementEvents, 0);
  objc_storeStrong((id *)&self->_rankingDictionary, 0);
  objc_storeStrong((id *)&self->_photoTraits, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_places, 0);
  objc_storeStrong((id *)&self->_predominantWeather, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_backgroundActions, 0);
  objc_storeStrong((id *)&self->_concurrentMediaAction, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_metaDataForRank, 0);
  objc_storeStrong((id *)&self->_promptLanguage, 0);
  objc_storeStrong((id *)&self->_promptLanguages, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_bundleType, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_suggestionID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (id)primarySourceTypes
{
  unint64_t v3;
  void *v4;
  void *v5;
  __CFString **v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  __CFString *v11;
  __CFString *v12;
  _QWORD v13[2];
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  _QWORD v24[2];
  __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = -[MOEventBundle interfaceType](self, "interfaceType");
  v4 = (void *)MEMORY[0x1E0C9AA60];
  switch(v3)
  {
    case 1uLL:
      v26[0] = MOEventBundleSourceTypeActivity;
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = (__CFString **)v26;
      goto LABEL_30;
    case 2uLL:
    case 0xDuLL:
      v25 = MOEventBundleSourceTypeVisitLocation;
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v25;
      goto LABEL_30;
    case 3uLL:
    case 0xAuLL:
      v23 = MOEventBundleSourceTypePhoto;
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v23;
      goto LABEL_30;
    case 4uLL:
      v22 = MOEventBundleSourceTypeContact;
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v22;
      goto LABEL_30;
    case 5uLL:
      v21 = MOEventBundleSourceTypeMedia;
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v21;
      goto LABEL_30;
    case 7uLL:
      v24[0] = MOEventBundleSourceTypeVisitLocation;
      v24[1] = MOEventBundleSourceTypePhoto;
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = (__CFString **)v24;
      goto LABEL_8;
    case 9uLL:
      v8 = -[MOEventBundle bundleSubType](self, "bundleSubType");
      switch(v8)
      {
        case 0x268uLL:
          v16 = MOEventBundleSourceTypePhoto;
          v5 = (void *)MEMORY[0x1E0C99D20];
          v6 = &v16;
          goto LABEL_30;
        case 0x12FuLL:
          v17 = MOEventBundleSourceTypeContact;
          v5 = (void *)MEMORY[0x1E0C99D20];
          v6 = &v17;
          goto LABEL_30;
        case 0xCBuLL:
          v18 = MOEventBundleSourceTypeActivity;
          v5 = (void *)MEMORY[0x1E0C99D20];
          v6 = &v18;
          goto LABEL_30;
      }
      return MEMORY[0x1E0C9AA60];
    case 0xBuLL:
      v20 = MOEventBundleSourceTypeReflectionPrompt;
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v20;
      goto LABEL_30;
    case 0xCuLL:
      v9 = -[MOEventBundle bundleSubType](self, "bundleSubType");
      v4 = (void *)MEMORY[0x1E0C9AA60];
      if (v9 <= 204)
      {
        if ((unint64_t)(v9 - 101) >= 5)
        {
          if ((unint64_t)(v9 - 201) >= 4)
            return v4;
          v14 = MOEventBundleSourceTypeActivity;
          v5 = (void *)MEMORY[0x1E0C99D20];
          v6 = &v14;
        }
        else
        {
          v15 = MOEventBundleSourceTypeVisitLocation;
          v5 = (void *)MEMORY[0x1E0C99D20];
          v6 = &v15;
        }
        goto LABEL_30;
      }
      if ((unint64_t)(v9 - 401) <= 4 && ((1 << (v9 + 111)) & 0x19) != 0)
      {
        v11 = MOEventBundleSourceTypeMedia;
        v5 = (void *)MEMORY[0x1E0C99D20];
        v6 = &v11;
LABEL_30:
        v7 = 1;
        goto LABEL_31;
      }
      if ((unint64_t)(v9 - 205) >= 2)
      {
        if (v9 != 302)
          return v4;
        v12 = MOEventBundleSourceTypeContact;
        v5 = (void *)MEMORY[0x1E0C99D20];
        v6 = &v12;
        goto LABEL_30;
      }
      v13[0] = MOEventBundleSourceTypeActivity;
      v13[1] = MOEventBundleSourceTypeVisitLocation;
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = (__CFString **)v13;
LABEL_8:
      v7 = 2;
LABEL_31:
      objc_msgSend(v5, "arrayWithObjects:count:", v6, v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 0xEuLL:
      v19 = MOEventBundleSourceTypeStateOfMind;
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v19;
      goto LABEL_30;
    default:
      return v4;
  }
}

- (void)initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "Invalid parameter not satisfying: bundleIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "Invalid parameter not satisfying: suggestionID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)dateInterval
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 138412802;
  v3 = a1;
  v4 = 2080;
  v5 = "-[MOEventBundle dateInterval]";
  v6 = 1024;
  v7 = 1434;
  _os_log_error_impl(&dword_1CAE42000, a2, OS_LOG_TYPE_ERROR, "startDate is NOT earlier than endDate, bundle, %@ (in %s:%d)", (uint8_t *)&v2, 0x1Cu);
}

@end
