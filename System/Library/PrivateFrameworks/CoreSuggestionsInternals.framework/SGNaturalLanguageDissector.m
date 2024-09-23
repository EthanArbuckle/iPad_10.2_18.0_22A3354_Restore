@implementation SGNaturalLanguageDissector

- (id)_init
{
  SGNaturalLanguageDissector *v2;
  SGNaturalLanguageDissector *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGNaturalLanguageDissector;
  v2 = -[SGNaturalLanguageDissector init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SGNaturalLanguageDissector clearConversations](v2, "clearConversations");
  return v3;
}

- (void)clearConversations
{
  uint64_t v2;
  NSMutableDictionary *conversations;
  SGNaturalLanguageDissector *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = objc_opt_new();
  conversations = obj->_conversations;
  obj->_conversations = (NSMutableDictionary *)v2;

  objc_sync_exit(obj);
}

- (void)addEnrichmentForEvents:(id)a3 forMessage:(id)a4 toEntity:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  BOOL v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  SGPipelineEnrichment *v41;
  void *v42;
  SGPipelineEnrichment *v43;
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
  double v56;
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
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  SGStorageLocation *v81;
  void *v82;
  void *v83;
  SGStorageLocation *v84;
  void *v85;
  BOOL v86;
  SGStorageLocation *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t j;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  double v100;
  double v101;
  void *v102;
  void *v103;
  void *v104;
  NSObject *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  id obj;
  uint64_t v112;
  void *v113;
  void *v114;
  uint64_t v115;
  id v116;
  void *context;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _QWORD v131[4];
  id v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t (*v137)(uint64_t, uint64_t);
  void (*v138)(uint64_t);
  id v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  uint8_t buf[4];
  void *v145;
  _BYTE v146[128];
  _BYTE v147[128];
  _QWORD v148[2];
  _BYTE v149[128];
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v116 = a4;
  v122 = a5;
  v109 = v7;
  if (objc_msgSend(v7, "count"))
  {
    v120 = (void *)objc_opt_new();
    v140 = 0u;
    v141 = 0u;
    v142 = 0u;
    v143 = 0u;
    objc_msgSend(v116, "recipients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v140, v149, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v141;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v141 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * i);
          objc_msgSend(v12, "handle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v12, "handle");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "addObject:", v14);

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v140, v149, 16);
      }
      while (v9);
    }

    objc_msgSend(v116, "sender");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v116, "sender");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17 == 0;

      if (!v18)
      {
        objc_msgSend(v116, "sender");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "addObject:", v20);

      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = 0;
    v135 = &v134;
    v136 = 0x3032000000;
    v137 = __Block_byref_object_copy__30047;
    v138 = __Block_byref_object_dispose__30048;
    v139 = 0;
    v22 = (void *)MEMORY[0x1E0CAA078];
    v131[0] = MEMORY[0x1E0C809B0];
    v131[1] = 3221225472;
    v131[2] = __73__SGNaturalLanguageDissector_addEnrichmentForEvents_forMessage_toEntity___block_invoke;
    v131[3] = &unk_1E7DB50F0;
    v133 = &v134;
    v23 = v21;
    v132 = v23;
    objc_msgSend(v22, "sg_usingSharedStoreForReadingOnly:", v131);
    v106 = v23;
    objc_msgSend(v23, "dateByAddingTimeInterval:", -1209600.0);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0D19A38];
    v148[0] = *MEMORY[0x1E0D19A28];
    v24 = v148[0];
    v148[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGRTCLogging launchCountsForApps:afterDate:lowerBucket:bucketSize:bucketLimit:](SGRTCLogging, "launchCountsForApps:afterDate:lowerBucket:bucketSize:bucketLimit:", v26, v107, 10, 3, 50);
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1E0D197F0];
    objc_msgSend(v108, "objectForKeyedSubscript:", v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "mailAppUsageLevel:", objc_msgSend(v28, "unsignedIntegerValue"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x1E0D197F0];
    objc_msgSend(v108, "objectForKeyedSubscript:", v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "messagesAppUsageLevel:", objc_msgSend(v30, "unsignedIntegerValue"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    obj = v109;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v147, 16);
    if (v31)
    {
      v112 = *(_QWORD *)v128;
      v110 = *MEMORY[0x1E0C996C8];
      do
      {
        v32 = 0;
        v115 = v31;
        do
        {
          if (*(_QWORD *)v128 != v112)
            objc_enumerationMutation(obj);
          v118 = v32;
          v33 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * v32);
          context = (void *)MEMORY[0x1C3BD4F6C]();
          objc_msgSend(v33, "title");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v121, "length"))
          {
            objc_msgSend(v116, "subject");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "length") == 0;

            if (!v35)
            {
              objc_msgSend(v116, "subject");
              v36 = objc_claimAutoreleasedReturnValue();

              v121 = (void *)v36;
            }
          }
          objc_msgSend(v33, "startDate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "endDate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "title");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "duplicateKey");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDuplicateKey duplicateKeyForNaturalLanguageEventWithStartDate:endDate:title:participants:parentKey:](SGDuplicateKey, "duplicateKeyForNaturalLanguageEventWithStartDate:endDate:title:participants:parentKey:", v37, v38, v39, v120, v40);
          v119 = (void *)objc_claimAutoreleasedReturnValue();

          v41 = [SGPipelineEnrichment alloc];
          objc_msgSend(v33, "title");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = -[SGPipelineEnrichment initWithDuplicateKey:title:parent:](v41, "initWithDuplicateKey:title:parent:", v119, v42, v122);

          objc_msgSend(MEMORY[0x1E0D197F0], "naturalLanguageEvent");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity addTag:](v43, "addTag:", v44);

          v45 = (void *)MEMORY[0x1E0D197F0];
          objc_msgSend(v33, "ipsos_eventClassificationType");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "identifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "naturalLanguageEventTypeIdentifier:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity addTag:](v43, "addTag:", v48);

          v49 = (void *)MEMORY[0x1E0D197F0];
          objc_msgSend(v33, "ipsos_messageUnit");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "bestLanguageID");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "naturalLanguageEventLanguageID:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity addTag:](v43, "addTag:", v52);

          objc_msgSend(MEMORY[0x1E0D197F0], "naturalLanguageEventAttributes:", objc_msgSend(v33, "ipsos_eventAttributes"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity addTag:](v43, "addTag:", v53);

          if (objc_msgSend(v116, "isSenderSignificant"))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "significantSender");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v43, "addTag:", v54);

          }
          v55 = (void *)MEMORY[0x1E0D197F0];
          objc_msgSend(v33, "ipsos_confidence");
          *(float *)&v56 = v56;
          objc_msgSend(v55, "confidenceScore:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity addTag:](v43, "addTag:", v57);

          objc_msgSend(MEMORY[0x1E0D197F0], "participantCount:", objc_msgSend(v120, "count"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity addTag:](v43, "addTag:", v58);

          if (objc_msgSend(v33, "ipsos_usedBubblesCount"))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "usedBubblesCount:", objc_msgSend(v33, "ipsos_usedBubblesCount"));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v43, "addTag:", v59);

          }
          if ((objc_msgSend(v33, "ipsos_eventAttributes") & 0x800) != 0)
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "titleGeneratedFromTemplate");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v43, "addTag:", v60);
            goto LABEL_30;
          }
          if ((objc_msgSend(v33, "ipsos_eventAttributes") & 0x400) != 0)
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "titleGeneratedFromSubject");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v43, "addTag:", v60);
LABEL_30:

          }
          -[SGEntity addTag:](v43, "addTag:", v135[5]);
          -[SGEntity addTag:](v43, "addTag:", v114);
          -[SGEntity addTag:](v43, "addTag:", v113);
          objc_msgSend(v33, "startTimeZone");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v61)
          {
            if ((objc_msgSend(v33, "isAllDay") & 1) != 0
              || (objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone"),
                  (v61 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
            {
              objc_msgSend(v33, "startDate");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "endDateUnadjustedForLegacyClients");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v33, "isAllDay"))
                goto LABEL_43;
              v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", v110);
              objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "setTimeZone:", v67);

              v68 = objc_msgSend(v66, "component:fromDate:", 32, v63);
              if (v68)
              {
                if (v68 != 24)
                {
                  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "setTimeZone:", v69);

                  v70 = objc_msgSend(v66, "component:fromDate:", 32, v63);
                  if (v70 == 24 || !v70)
                  {
                    objc_msgSend(MEMORY[0x1E0D19940], "floatingRangeWithUTCStartDate:endDate:", v63, v64);
                    v65 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v65)
                    {
LABEL_43:
                      v71 = (void *)objc_opt_new();
                      objc_msgSend(v71, "setHour:", 0);
                      v72 = (void *)MEMORY[0x1E0D19940];
                      objc_msgSend(v63, "timeIntervalSince1970");
                      objc_msgSend(v72, "toFloatingTime:withDSTAmbiguityPreferences:", v71);
                      v74 = v73;
                      v75 = (void *)MEMORY[0x1E0D19940];
                      objc_msgSend(v64, "timeIntervalSince1970");
                      objc_msgSend(v75, "toFloatingTime:withDSTAmbiguityPreferences:", v71);
                      objc_msgSend(MEMORY[0x1E0D19940], "floatingRangeWithUTCStart:end:", v74, v76);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();

                    }
                    v61 = 0;
                    goto LABEL_45;
                  }
                }
              }

              goto LABEL_43;
            }
          }
          v62 = (void *)MEMORY[0x1E0D19940];
          objc_msgSend(v33, "startDate");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "endDateUnadjustedForLegacyClients");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "rangeWithStartDate:startTimeZone:endDate:endTimeZone:", v63, v61, v64, v61);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_45:

          if (objc_msgSend(v33, "isAllDay"))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "allDay");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v43, "addTag:", v77);

            if ((objc_msgSend(v65, "isValidAllDayRange") & 1) == 0)
              __assert_rtn("-[SGNaturalLanguageDissector addEnrichmentForEvents:forMessage:toEntity:]", "SGNaturalLanguageDissector.m", 267, "[timeRange isValidAllDayRange]");
          }
          -[SGEntity setTimeRange:](v43, "setTimeRange:", v65);
          -[SGEntity setTitle:](v43, "setTitle:", v121);
          objc_msgSend(v33, "notes");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity setContent:](v43, "setContent:", v78);

          objc_msgSend(v33, "structuredLocationWithoutPrediction");
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          if (v79)
          {
            objc_msgSend(v33, "structuredLocationWithoutPrediction");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = [SGStorageLocation alloc];
            objc_msgSend(v80, "title");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "geoLocation");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "horizontalAccuracy");
            v84 = -[SGStorageLocation initWithType:label:address:airportCode:accuracy:quality:](v81, "initWithType:label:address:airportCode:accuracy:quality:", 0, v82, 0, 0);

LABEL_51:
            goto LABEL_52;
          }
          objc_msgSend(v33, "locationWithoutPrediction");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend(v85, "length") == 0;

          if (!v86)
          {
            v87 = [SGStorageLocation alloc];
            objc_msgSend(v33, "locationWithoutPrediction");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = -[SGStorageLocation initWithType:label:address:airportCode:accuracy:quality:](v87, "initWithType:label:address:airportCode:accuracy:quality:", 0, v80, 0, 0, 0.0, 0.0);
            goto LABEL_51;
          }
          v84 = 0;
LABEL_52:
          if (objc_msgSend(v33, "ipsos_eventStatus") == 3)
          {
            sgLogHandle();
            v88 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1C3607000, v88, OS_LOG_TYPE_DEBUG, "SGNaturalLanguageDissector: Event is cancelled", buf, 2u);
            }

            objc_msgSend(MEMORY[0x1E0D197F0], "extractedEventCancellation");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v43, "addTag:", v89);

          }
          if (v84)
          {
            -[SGEntity locations](v43, "locations");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "addObject:", v84);

          }
          objc_msgSend(v122, "creationTimestamp");
          -[SGPipelineEnrichment setCreationTimestamp:](v43, "setCreationTimestamp:");
          objc_msgSend(v122, "lastModifiedTimestamp");
          -[SGPipelineEnrichment setLastModifiedTimestamp:](v43, "setLastModifiedTimestamp:");
          v125 = 0u;
          v126 = 0u;
          v123 = 0u;
          v124 = 0u;
          objc_msgSend(v122, "tags");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v123, v146, 16);
          if (v92)
          {
            v93 = *(_QWORD *)v124;
            do
            {
              for (j = 0; j != v92; ++j)
              {
                if (*(_QWORD *)v124 != v93)
                  objc_enumerationMutation(v91);
                -[SGEntity addTag:](v43, "addTag:", *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * j));
              }
              v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v123, v146, 16);
            }
            while (v92);
          }

          objc_msgSend(v122, "duplicateKey");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "bundleId");
          v96 = (void *)objc_claimAutoreleasedReturnValue();

          v97 = objc_alloc(MEMORY[0x1E0D19818]);
          objc_msgSend(v33, "ipsos_eventClassificationType");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "identifier");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "ipsos_confidence");
          v101 = v100;
          objc_msgSend(v120, "allObjects");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = (void *)objc_msgSend(v97, "initWithType:categoryDescription:originBundleId:confidence:schemaOrg:participants:", 2, v99, v96, 0, v102, v101);

          objc_msgSend(v103, "toJsonString");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          if (v104)
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "eventMetadata:", v104);
            v105 = objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v43, "addTag:", v105);
          }
          else
          {
            sgLogHandle();
            v105 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v145 = v103;
              _os_log_error_impl(&dword_1C3607000, v105, OS_LOG_TYPE_ERROR, "Failed to convert object to JSON: %@", buf, 0xCu);
            }
          }

          objc_msgSend(v122, "addEnrichment:", v43);
          objc_autoreleasePoolPop(context);
          v32 = v118 + 1;
        }
        while (v118 + 1 != v115);
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v147, 16);
      }
      while (v31);
    }

    _Block_object_dispose(&v134, 8);
  }

}

- (id)conversationWithIdentifier:(id)a3
{
  id v4;
  SGNaturalLanguageDissector *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_conversations, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_conversations, "setObject:forKeyedSubscript:", v6, v4);
  }
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)_shouldProcessMessage:(id)a3 entity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[8];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!+[SGNaturalLanguageDissector allowNaturalLanguageDissector](SGNaturalLanguageDissector, "allowNaturalLanguageDissector"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v17 = "Skipping NL dissector: allowNaturalLanguageDissector is OFF";
      goto LABEL_16;
    }
LABEL_20:
    LOBYTE(v8) = 0;
LABEL_21:

    goto LABEL_22;
  }
  objc_msgSend(v5, "textContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v5, "attachments", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "isCalendarMimeType"))
          {
            sgLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1C3607000, v18, OS_LOG_TYPE_DEBUG, "Ignoring NL dissection because an iCalendar attachment exists.", buf, 2u);
            }

            goto LABEL_20;
          }
        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v11)
          continue;
        break;
      }
    }

    objc_msgSend(v6, "tags");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D197F0], "templateException");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "containsObject:", v15);

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0D197F0], "fullyDissected");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addTag:", v9);
      LOBYTE(v8) = 1;
      goto LABEL_21;
    }
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v17 = "Ignoring NL dissection because document was matched by a template";
LABEL_16:
      _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, v17, buf, 2u);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
LABEL_22:

  return v8;
}

- (void)_tagNaturalLanguageEnrichmentsForEntity:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "enrichments", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v9, "duplicateKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "entityType");
        if (SGEntityTypeIsEvent())
        {
          v12 = objc_msgSend(v9, "isNaturalLanguageEvent");

          if (v12)
            objc_msgSend(MEMORY[0x1E0D198B8], "recordInteractionForEventWithInterface:actionType:harvestedEKEvent:curatedEKEvent:", 0, 0, 0, 0);
        }
        else
        {

        }
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
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
  _QWORD v26[4];
  id v27;
  SGNaturalLanguageDissector *v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1C3BD4F6C]();
  if (!-[SGNaturalLanguageDissector _shouldProcessMessage:entity:](self, "_shouldProcessMessage:entity:", v8, v9))
    goto LABEL_4;
  objc_msgSend(v8, "htmlParser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tabularRegions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v14 = objc_msgSend(v9, "isInhuman");

    if ((v14 & 1) != 0)
    {
LABEL_4:
      objc_autoreleasePoolPop(v11);
      goto LABEL_5;
    }
  }
  else
  {

  }
  v15 = objc_msgSend(v9, "hasEventEnrichment");
  objc_autoreleasePoolPop(v11);
  if ((v15 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1C3BD4F6C](objc_msgSend(v9, "releaseDissectorLock"));
    v17 = (void *)objc_opt_class();
    objc_msgSend(v10, "serviceContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "store");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ipsosMessageWithMailMessage:store:", v8, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v16);
    v21 = (void *)MEMORY[0x1C3BD4F6C]();
    v22 = (void *)MEMORY[0x1E0D1CF30];
    objc_msgSend(v20, "messageUnits");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __64__SGNaturalLanguageDissector_dissectMailMessage_entity_context___block_invoke;
    v26[3] = &unk_1E7DB5118;
    v24 = v9;
    v27 = v24;
    v28 = self;
    v25 = v20;
    v29 = v25;
    objc_msgSend(v22, "scanEventsInMessageUnits:synchronously:completionHandler:", v23, 1, v26);

    objc_autoreleasePoolPop(v21);
    objc_msgSend(v24, "acquireDissectorLock");
    -[SGNaturalLanguageDissector _tagNaturalLanguageEnrichmentsForEntity:](self, "_tagNaturalLanguageEnrichmentsForEntity:", v24);

  }
LABEL_5:

}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(id *, void *, void *, int);
  void *v28;
  id v29;
  SGNaturalLanguageDissector *v30;
  id v31;
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1C3BD4F6C]();
  if (-[SGNaturalLanguageDissector _shouldProcessMessage:entity:](self, "_shouldProcessMessage:entity:", v8, v9))
  {
    v12 = objc_msgSend(v9, "hasEventEnrichment");
    objc_autoreleasePoolPop(v11);
    if ((v12 & 1) == 0)
    {
      v13 = (void *)MEMORY[0x1C3BD4F6C](objc_msgSend(v9, "releaseDissectorLock"));
      v14 = (void *)objc_opt_class();
      objc_msgSend(v10, "serviceContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "store");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "ipsosMessageWithTextMessage:store:", v8, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v13);
      objc_msgSend(v8, "conversationIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGNaturalLanguageDissector conversationWithIdentifier:](self, "conversationWithIdentifier:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v19;
      objc_sync_enter(v20);
      v21 = (void *)MEMORY[0x1C3BD4F6C](objc_msgSend(v20, "addMessage:", v17));
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __64__SGNaturalLanguageDissector_dissectTextMessage_entity_context___block_invoke;
      v28 = &unk_1E7DB5168;
      v22 = v9;
      v29 = v22;
      v30 = self;
      v23 = v17;
      v31 = v23;
      v24 = v20;
      v32 = v24;
      objc_msgSend(v24, "scanEventsInLastMessageOnly:synchronously:completionHandler:", 1, 1, &v25);

      objc_autoreleasePoolPop(v21);
      objc_sync_exit(v24);

      objc_msgSend(v22, "acquireDissectorLock", v25, v26, v27, v28);
      -[SGNaturalLanguageDissector _tagNaturalLanguageEnrichmentsForEntity:](self, "_tagNaturalLanguageEnrichmentsForEntity:", v22);

    }
  }
  else
  {
    objc_autoreleasePoolPop(v11);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversations, 0);
}

void __64__SGNaturalLanguageDissector_dissectTextMessage_entity_context___block_invoke(id *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(a1[4], "acquireDissectorLock");
  objc_msgSend(a1[5], "addEnrichmentForEvents:forMessage:toEntity:", v8, a1[6], a1[4]);
  if (a4)
  {
    objc_msgSend(a1[7], "allMessages");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1[6];
    sgMapAndFilter();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "setInvalidatedMessageIdentifiers:", v11);
  }
  objc_msgSend(a1[4], "releaseDissectorLock");
  objc_autoreleasePoolPop(v9);

}

id __64__SGNaturalLanguageDissector_dissectTextMessage_entity_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;

  if (*(void **)(a1 + 32) == a2)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(a2, "identifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void __64__SGNaturalLanguageDissector_dissectMailMessage_entity_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "acquireDissectorLock");
  objc_msgSend(*(id *)(a1 + 40), "addEnrichmentForEvents:forMessage:toEntity:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "releaseDissectorLock");
  objc_autoreleasePoolPop(v3);

}

void __73__SGNaturalLanguageDissector_addEnrichmentForEvents_forMessage_toEntity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D197F0];
  objc_msgSend(a2, "eventsPerWeekAroundDate:", *(_QWORD *)(a1 + 32));
  *(float *)&v4 = v4;
  objc_msgSend(v3, "calendarAppUsageLevel:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken3_30084 != -1)
    dispatch_once(&sharedInstance__pasOnceToken3_30084, &__block_literal_global_30085);
  return (id)sharedInstance__pasExprOnceResult_30086;
}

+ (BOOL)allowNaturalLanguageDissector
{
  return objc_msgSend(MEMORY[0x1E0D198F0], "detectNLEvents");
}

+ (id)_personForCSPerson:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "handles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc(MEMORY[0x1E0D1CF50]);
    objc_msgSend(v3, "handles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithHandle:handleType:fullName:", v7, v8, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)ipsosMessageWithMailMessage:(id)a3 store:(id)a4
{
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v53;
  void *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v55 = a4;
  objc_msgSend(v6, "author");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_personForCSPerson:", v7);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v53 = v6;
  objc_msgSend(v6, "allRecipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v61 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1C3BD4F6C]();
        v16 = objc_alloc(MEMORY[0x1E0D1CF50]);
        objc_msgSend(v14, "emailAddress");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v16, "initWithEmail:fullName:", v17, v18);
        objc_msgSend(v8, "addObject:", v19);

        objc_autoreleasePoolPop(v15);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    }
    while (v11);
  }

  v20 = (void *)MEMORY[0x1C3BD4F6C]();
  v21 = objc_alloc(MEMORY[0x1E0D1CF40]);
  objc_msgSend(v53, "uniqueIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "subject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v53, "date");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v21, "initWithIdentifier:subject:sender:recipients:dateSent:type:", v22, v23, v54, v24, v25, *MEMORY[0x1E0D1CF18]);

  objc_autoreleasePoolPop(v20);
  objc_msgSend(v26, "setIsSent:", objc_msgSend(v53, "isSent"));
  objc_msgSend(v53, "mailingList");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    v28 = 1;
  else
    v28 = (unint64_t)objc_msgSend(v8, "count") > 1;
  objc_msgSend(v26, "setIsGroupConversation:", v28);

  objc_msgSend(v53, "author");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setIsSenderSignificant:", objc_msgSend(v29, "sg_isSignificantWithStore:", v55));

  objc_msgSend(v53, "textContent");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_opt_new();
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v30, "length"));
  objc_msgSend(v53, "quotedRegions");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  if (v34)
  {
    objc_msgSend(v53, "quotedRegions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "removeIndexes:", v35);

  }
  objc_msgSend(v53, "htmlParser");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "tabularRegions");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count");

  if (v38)
  {
    objc_msgSend(v53, "htmlParser");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "tabularRegions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "removeIndexes:", v40);

  }
  objc_msgSend(v53, "htmlParser");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "signatureRegions");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "count");

  if (v43)
  {
    objc_msgSend(v53, "htmlParser");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "signatureRegions");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "removeIndexes:", v45);

  }
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __64__SGNaturalLanguageDissector_ipsosMessageWithMailMessage_store___block_invoke;
  v56[3] = &unk_1E7DB50A8;
  v57 = v30;
  v46 = v26;
  v58 = v46;
  v59 = v31;
  v47 = v31;
  v48 = v30;
  objc_msgSend(v32, "enumerateRangesUsingBlock:", v56);
  v49 = (void *)objc_msgSend(v47, "copy");
  objc_msgSend(v46, "setMessageUnits:", v49);

  v50 = v59;
  v51 = v46;

  return v51;
}

+ (id)ipsosMessageWithTextMessage:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_personForCSPerson:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "recipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sgMapAndFilter();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1C3BD4F6C]();
  v13 = objc_alloc(MEMORY[0x1E0D1CF40]);
  objc_msgSend(v6, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v6, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v13, "initWithIdentifier:subject:sender:recipients:dateSent:type:", v14, v15, v9, v16, v17, *MEMORY[0x1E0D1CF18]);

  objc_autoreleasePoolPop(v12);
  objc_msgSend(v18, "setIsSent:", objc_msgSend(v6, "isSent"));
  objc_msgSend(v18, "setIsGroupConversation:", (unint64_t)objc_msgSend(v11, "count") > 1);
  objc_msgSend(v6, "sender");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setIsSenderSignificant:", objc_msgSend(v19, "sg_isSignificantWithStore:", v7));

  v20 = objc_alloc(MEMORY[0x1E0D1CF48]);
  objc_msgSend(v6, "textContent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithText:originalMessage:index:", v21, v18, 0);

  v23 = (void *)MEMORY[0x1C3BD4F6C]();
  v26[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v23);
  objc_msgSend(v18, "setMessageUnits:", v24);

  return v18;
}

uint64_t __64__SGNaturalLanguageDissector_ipsosMessageWithTextMessage_store___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_personForCSPerson:", a2);
}

void __64__SGNaturalLanguageDissector_ipsosMessageWithMailMessage_store___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;

  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1CF48]), "initWithText:originalMessage:index:", v7, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "count"));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);

  objc_autoreleasePoolPop(v6);
}

void __44__SGNaturalLanguageDissector_sharedInstance__block_invoke()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = -[SGNaturalLanguageDissector _init]([SGNaturalLanguageDissector alloc], "_init");
  v2 = (void *)sharedInstance__pasExprOnceResult_30086;
  sharedInstance__pasExprOnceResult_30086 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

@end
