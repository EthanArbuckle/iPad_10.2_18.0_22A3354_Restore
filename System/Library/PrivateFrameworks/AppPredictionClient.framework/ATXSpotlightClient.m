@implementation ATXSpotlightClient

+ (id)suggestedResultResponseWithLimit:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  int v13;
  int v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  char v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  _BOOL4 v36;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  +[ATXSpotlightZKWTrialClientWrapper sharedInstance](ATXSpotlightZKWTrialClientWrapper, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "alternateRecentsRanking");
  v7 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsSpotlightZKWRecentsEnabled"), CFSTR("com.apple.suggestions"));
  if (!v7 || (v8 = v7, v9 = objc_msgSend(v7, "BOOLValue"), v8, v9))
  {
    objc_msgSend(a1, "_fetchSpotlightRecentTopics:", 4);
    v10 = objc_claimAutoreleasedReturnValue();
    __atxlog_handle_ui();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (!v6)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] AB match: NO", buf, 2u);
      }
      goto LABEL_32;
    }
    if (v12)
    {
      *(_DWORD *)buf = 134217984;
      v39 = v6;
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] AB match: YES, Test ranking %lu", buf, 0xCu);
    }

    v13 = objc_msgSend(v5, "matchesAlternateRecentsControlCodePath");
    v14 = objc_msgSend(v5, "matchesAlternateRecentsTreatmentCodePath");
    __atxlog_handle_ui();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = &stru_1E4D5DB30;
      v17 = CFSTR("control");
      if (!v13)
        v17 = &stru_1E4D5DB30;
      *(_DWORD *)buf = 134218498;
      v39 = v6;
      v41 = v17;
      v40 = 2112;
      if (v14)
        v16 = CFSTR("treatment");
      v42 = 2112;
      v43 = v16;
      _os_log_impl(&dword_1A49EF000, v15, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] Test ranking %lu, %@%@", buf, 0x20u);
    }

    __atxlog_handle_metrics();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_signpost_id_generate(v18);

    __atxlog_handle_metrics();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A49EF000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "ATXSpotlightClient.SpotlightRecentsAlternate", " enableTelemetry=YES ", buf, 2u);
    }

    objc_msgSend(a1, "_fetchSpotlightRecentTopicsWithAlternateRanking:limit:", v6, 4);
    v11 = objc_claimAutoreleasedReturnValue();
    __atxlog_handle_metrics();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_DWORD *)buf = 134349056;
      v39 = v6;
      _os_signpost_emit_with_name_impl(&dword_1A49EF000, v23, OS_SIGNPOST_INTERVAL_END, v19, "ATXSpotlightClient.SpotlightRecentsAlternate", "alt=%{public, signpost.telemetry:number1}ld enableTelemetry=YES ", buf, 0xCu);
    }

    v24 = objc_msgSend(a1, "_isEqualRecentTopics:otherRecentTopics:", v10, v11);
    if ((v13 & v14) == 1)
    {
      __atxlog_handle_ui();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        +[ATXSpotlightClient suggestedResultResponseWithLimit:].cold.1();
    }
    else
    {
      if (v13)
      {
        if ((v24 & 1) == 0)
        {
          objc_msgSend(v5, "codePathForAlternateRecentsControl");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

          objc_msgSend(a1, "_extractTopicsFromRecentTopics:", v10);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
LABEL_32:
        v26 = 0;
        goto LABEL_33;
      }
      if (v14)
      {
        if ((v24 & 1) == 0)
        {
          objc_msgSend(v5, "codePathForAlternateRecentsTreatment");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v11;

          v10 = v11;
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      __atxlog_handle_ui();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        +[ATXSpotlightClient suggestedResultResponseWithLimit:].cold.2();
    }

    goto LABEL_32;
  }
  __atxlog_handle_ui();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: suggestedResultResponseWithLimit: Siri setting 'Show Recents' turned off. spotlightRecentTopics = @[]", buf, 2u);
  }
  v26 = 0;
  v27 = (void *)MEMORY[0x1E0C9AA60];
LABEL_34:

  __atxlog_handle_metrics();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = os_signpost_id_generate(v28);

  __atxlog_handle_metrics();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A49EF000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "ATXSpotlightClient.SuggestedActions", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(a1, "suggestedResultResponseWithLimit:andSpotlightRecentTopics:", a3, v27);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_metrics();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A49EF000, v34, OS_SIGNPOST_INTERVAL_END, v29, "ATXSpotlightClient.SuggestedActions", " enableTelemetry=YES ", buf, 2u);
  }

  __atxlog_handle_ui();
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
  if (v26)
  {
    if (v36)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v35, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] send code path trigger", buf, 2u);
    }

    objc_msgSend(v32, "addCodePathId:", v26);
  }
  else
  {
    if (v36)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v35, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] Alternate ranking did not change results", buf, 2u);
    }

  }
  return v32;
}

+ (id)suggestedResultResponseWithLimit:(int64_t)a3 andSpotlightRecentTopics:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  ATXProactiveSuggestionClient *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsSpotlightZKWEnabled"), CFSTR("com.apple.suggestions"));
  if (v7 && (v8 = v7, v9 = objc_msgSend(v7, "BOOLValue"), v8, !v9))
  {
    __atxlog_handle_ui();
    v11 = (ATXProactiveSuggestionClient *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1A49EF000, &v11->super, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: suggestedResultResponseWithLimit: Siri setting 'Show Suggestions' turned off. spotlightLayout = nil", (uint8_t *)&v16, 2u);
    }
    v12 = 0;
  }
  else
  {
    __atxlog_handle_ui();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134217984;
      v17 = a3;
      _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: suggestedResultResponseWithLimit: %ld", (uint8_t *)&v16, 0xCu);
    }

    v11 = -[ATXProactiveSuggestionClient initWithConsumerSubType:]([ATXProactiveSuggestionClient alloc], "initWithConsumerSubType:", 21);
    -[ATXProactiveSuggestionClient spotlightSuggestionLayoutFromCache](v11, "spotlightSuggestionLayoutFromCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_ui();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = (int64_t)v12;
      _os_log_impl(&dword_1A49EF000, v13, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: Blending retrieved a spotlightLayout %@.", (uint8_t *)&v16, 0xCu);
    }

  }
  objc_msgSend(a1, "_responseWithSpotlightLayout:andSpotlightRecentTopics:", v12, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_responseWithSpotlightLayout:(id)a3 andSpotlightRecentTopics:(id)a4
{
  id v6;
  id v7;
  ATXSpotlightClientResponse *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v63;
  id obj;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint8_t v97[128];
  uint8_t buf[4];
  uint64_t v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  uint64_t v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "_shouldDisplayUpcomingMediaForTesting"))
  {
    objc_msgSend(a1, "_responseWithUpcomingMedia");
    v8 = (ATXSpotlightClientResponse *)objc_claimAutoreleasedReturnValue();
    goto LABEL_64;
  }
  v63 = v7;
  objc_msgSend(v6, "uuid");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v6;
  objc_msgSend(v6, "collections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)objc_opt_new();
  v73 = (void *)objc_opt_new();
  v65 = (void *)objc_opt_new();
  v78 = (void *)objc_opt_new();
  __atxlog_handle_ui();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: Response: create sections and topics ", buf, 2u);
  }

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v9;
  v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
  if (v67)
  {
    v77 = 0;
    v66 = *(_QWORD *)v92;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v92 != v66)
          objc_enumerationMutation(obj);
        v69 = v11;
        v12 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v11);
        objc_msgSend(v12, "suggestions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uiSpecification");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "predictionReasons");

        __atxlog_handle_ui();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "contextTitle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "hash");
          objc_msgSend(v12, "suggestions");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");
          *(_DWORD *)buf = 134218496;
          v99 = v19;
          v100 = 2048;
          v101 = v16;
          v102 = 2048;
          v103 = v21;
          _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: Section.hash: %lu, type: %llu, count: %lu", buf, 0x20u);

        }
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v68 = v12;
        objc_msgSend(v12, "suggestions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
        if (v23)
        {
          v24 = v23;
          v25 = 0;
          v26 = *(_QWORD *)v88;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v88 != v26)
                objc_enumerationMutation(v22);
              v28 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
              if (objc_msgSend((id)objc_opt_class(), "_isValidSuggestion:forWorldState:", v28, v78))
              {
                objc_msgSend(a1, "_topicWithSuggestion:layoutUUID:", v28, v75);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "scores");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "objectAtIndexedSubscript:", v77 + i);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                __atxlog_handle_ui();
                v32 = objc_claimAutoreleasedReturnValue();
                v33 = v32;
                if (v29)
                {
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(a1, "_descriptionForTopic:", v29);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138740227;
                    v99 = (uint64_t)v34;
                    v100 = 2112;
                    v101 = (uint64_t)v31;
                    _os_log_impl(&dword_1A49EF000, v33, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: Topic: %{sensitive}@ Score: %@, ", buf, 0x16u);

                  }
                  ++v25;
                  objc_msgSend(v74, "addObject:", v29);
                  objc_msgSend(v73, "addObject:", v31);
                }
                else
                {
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v28, "uiSpecification");
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "title");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "executableSpecification");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "executableClassString");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v99 = (uint64_t)v72;
                    v100 = 2112;
                    v101 = (uint64_t)v35;
                    _os_log_error_impl(&dword_1A49EF000, v33, OS_LOG_TYPE_ERROR, "ATXSpotlightClient: Topic: nil: %@, type %@", buf, 0x16u);

                  }
                }

              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
            v77 += i;
          }
          while (v24);
        }
        else
        {
          v25 = 0;
        }

        objc_msgSend(v68, "contextTitle");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_opt_new();
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        objc_msgSend(v68, "suggestions");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v84;
          while (2)
          {
            for (j = 0; j != v40; ++j)
            {
              if (*(_QWORD *)v84 != v41)
                objc_enumerationMutation(v38);
              objc_msgSend(v37, "contextTitleWithSuggestion:eventTitle:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j), v36);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v43, "length"))
              {

                goto LABEL_40;
              }

            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
            if (v40)
              continue;
            break;
          }
        }
        v43 = v36;
LABEL_40:

        __atxlog_handle_ui();
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
        if (v25)
        {
          if (v45)
          {
            objc_msgSend(v68, "contextTitle");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "hash");
            *(_DWORD *)buf = 134218240;
            v99 = v47;
            v100 = 2048;
            v101 = (uint64_t)v25;
            _os_log_impl(&dword_1A49EF000, v44, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: Creating Section [%lu] with suggestions count %lu", buf, 0x16u);

          }
          objc_msgSend(v68, "sectionIdentifier");
          v44 = objc_claimAutoreleasedReturnValue();
          +[ATXSpotlightClientResponse createSectionWithTitle:sectionBundleIdentifier:resultCount:](ATXSpotlightClientResponse, "createSectionWithTitle:sectionBundleIdentifier:resultCount:", v43, v44, v25);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "addObject:", v48);
        }
        else
        {
          if (!v45)
            goto LABEL_47;
          objc_msgSend(v68, "contextTitle");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "hash");
          *(_DWORD *)buf = 134217984;
          v99 = v49;
          _os_log_impl(&dword_1A49EF000, v44, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: Skipping Section [%lu] no longer has valid suggestions", buf, 0xCu);
        }

LABEL_47:
        v11 = v69 + 1;
      }
      while (v69 + 1 != v67);
      v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
    }
    while (v67);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v7 = v63;
  v50 = v63;
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
  if (v51)
  {
    v52 = v51;
    v53 = 0;
    v54 = *(_QWORD *)v80;
    v55 = 10.0;
LABEL_51:
    v56 = 0;
    v57 = v53;
    while (1)
    {
      v58 = v56;
      if (*(_QWORD *)v80 != v54)
        objc_enumerationMutation(v50);
      objc_msgSend(v74, "addObject:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v56));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "addObject:", v59);

      if ((unint64_t)(v57 + v58 + 1) >= 4)
        break;
      v55 = v55 + -1.0;
      v56 = v58 + 1;
      if (v52 == v58 + 1)
      {
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
        v53 = v57 + v56;
        if (v52)
          goto LABEL_51;

        v6 = v76;
        v7 = v63;
        if (!(v57 + v56))
          goto LABEL_63;
LABEL_60:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v50 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("SPOTLIGHT_SECTION_RECENTS"), &stru_1E4D5DB30, 0);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXSpotlightClientResponse createSectionWithTitle:sectionBundleIdentifier:resultCount:](ATXSpotlightClientResponse, "createSectionWithTitle:sectionBundleIdentifier:resultCount:", v60, CFSTR("com.apple.spotlight.dec.zkw.recents"), v57 + v58 + 1);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "addObject:", v61);

        goto LABEL_62;
      }
    }

    v6 = v76;
    v7 = v63;
    goto LABEL_60;
  }
  v6 = v76;
LABEL_62:

LABEL_63:
  v8 = -[ATXSpotlightClientResponse initWithTopics:scores:sections:]([ATXSpotlightClientResponse alloc], "initWithTopics:scores:sections:", v74, v73, v65);

LABEL_64:
  return v8;
}

+ (BOOL)_shouldDisplayUpcomingMediaForTesting
{
  return CFPreferencesGetAppBooleanValue(CFSTR("displayUpcomingMedia"), CFSTR("com.apple.duetexpertd"), 0) != 0;
}

+ (id)_extractTopicsFromRecentTopics:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_90);
}

+ (id)_fetchSpotlightRecentTopics:(int64_t)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  int v18;
  int64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  __atxlog_handle_metrics();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  __atxlog_handle_ui();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 134217984;
    v19 = a3;
    _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "spotlight recents request: %ld", (uint8_t *)&v18, 0xCu);
  }

  __atxlog_handle_metrics();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A49EF000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ATXSpotlightClient.SpotlightRecents", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }

  v9 = (void *)MEMORY[0x1E0DA9BA8];
  v22 = *MEMORY[0x1E0DA9BB0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recentResultsWithOptions:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_metrics();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A49EF000, v14, OS_SIGNPOST_INTERVAL_END, v5, "ATXSpotlightClient.SpotlightRecents", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }

  __atxlog_handle_ui();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v12, "count");
    v18 = 134218243;
    v19 = v16;
    v20 = 2117;
    v21 = v12;
    _os_log_impl(&dword_1A49EF000, v15, OS_LOG_TYPE_DEFAULT, "spotlight recents results: %ld %{sensitive}@", (uint8_t *)&v18, 0x16u);
  }

  return v12;
}

+ (id)_descriptionForTopic:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char isKindOfClass;
  objc_class *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v34;
  objc_class *v35;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (objc_class *)MEMORY[0x1E0CB3940];
      v14 = v3;
      v15 = [v13 alloc];
      objc_msgSend(v14, "query");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("SFFlightTopic: %@, %@"), v4, v16);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v26 = (objc_class *)MEMORY[0x1E0CB3940];
        if ((isKindOfClass & 1) != 0)
        {
          v27 = v3;
          v28 = [v26 alloc];
          objc_msgSend(v27, "query");
          v4 = (id)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v27, "queryType");
          objc_msgSend(v27, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("SFQueryTopic: %@, type: %d, id: %@"), v4, v29, v30);
        }
        else
        {
          v34 = objc_alloc(MEMORY[0x1E0CB3940]);
          v35 = (objc_class *)objc_opt_class();
          NSStringFromClass(v35);
          v4 = (id)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v34, "initWithFormat:", CFSTR("unhandled of type %@"), v4);
        }
        goto LABEL_19;
      }
      v18 = (objc_class *)MEMORY[0x1E0CB3940];
      v19 = v3;
      v20 = [v18 alloc];
      objc_msgSend(v19, "query");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "location");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lat");
      v22 = v21;
      objc_msgSend(v19, "location");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "lng");
      v17 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("SFWeatherTopic: %@, lat %f, lng %f"), v4, v22, v24);

    }
    goto LABEL_19;
  }
  v4 = v3;
  objc_msgSend(v4, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v4, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inlineCard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "suggestionText");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "text");
      v32 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v32;
    }
    if (!v7)
    {
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SFLocalTopic %@, %@"), v7, v4);

LABEL_19:
  return v17;
}

+ (BOOL)_isValidSuggestion:(id)a3 forWorldState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "atxActionCriteria");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isRelevant:", v6);

  if ((v8 & 1) == 0)
  {
    __atxlog_handle_ui();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uiSpecification");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "executableSpecification");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "executableClassString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v14;
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_1A49EF000, v12, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: Not valid for device state, hiding: %@, type %@", (uint8_t *)&v18, 0x16u);

    }
    goto LABEL_8;
  }
  objc_msgSend(v5, "uiSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "predictionReasons");

  if ((v10 & 0x1000000) != 0)
  {
    __atxlog_handle_ui();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[ATXSpotlightClient _isValidSuggestion:forWorldState:].cold.1();
LABEL_8:

    v11 = 0;
    goto LABEL_9;
  }
  v11 = 1;
LABEL_9:

  return v11;
}

+ (BOOL)topic:(id)a3 isDuplicateComparingTopics:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    v20 = v6;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(MEMORY[0x1E0DA9BA8], "topic:isSameAsTopic:", v5, v10) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_19;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = v5;
            v12 = v10;
            objc_msgSend(v11, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "length"))
            {
              objc_msgSend(v12, "identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "length");

              if (v15)
              {
                objc_msgSend(v11, "identifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "identifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v16, "isEqualToString:", v17);

                if ((v18 & 1) != 0)
                {

                  LOBYTE(v7) = 1;
                  v6 = v20;
                  goto LABEL_19;
                }
              }
            }
            else
            {

            }
            v6 = v20;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_19:

  return v7;
}

+ (id)_topicWithSuggestion:(id)a3 layoutUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "executableSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "executableType");

  if (v9 == 8)
  {
    objc_msgSend(v6, "atxSpotlightActionExecutableObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topic");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_resultWithSuggestion:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    if (!v12)
    {
      v20 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (!v14)
    {
      __atxlog_handle_ui();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        +[ATXSpotlightClient _topicWithSuggestion:layoutUUID:].cold.1();

      v16 = (void *)objc_opt_new();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setIdentifier:", v17);

    }
    v18 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v10, "setProactiveSuggestion:", v18);

    v19 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v10, "setBlendingModelUICacheUpdateUUID:", v19);

    objc_msgSend(MEMORY[0x1E0DA9BA0], "proactiveTopicWithResult:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v11;
LABEL_10:

  return v20;
}

id __53__ATXSpotlightClient__extractTopicsFromRecentTopics___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  NSObject *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  int v13;
  NSObject *v14;
  __int16 v15;
  NSObject *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "topic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "topic");
    v5 = objc_claimAutoreleasedReturnValue();
    __atxlog_handle_ui();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_8;
    }
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject query](v5, "query");
    v9 = objc_claimAutoreleasedReturnValue();
    v13 = 138412803;
    v14 = v8;
    v15 = 2117;
    v16 = v9;
    v17 = 1024;
    v18 = -[NSObject queryType](v5, "queryType");
    _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "spotlight recent %@: %{sensitive}@, %d", (uint8_t *)&v13, 0x1Cu);

LABEL_6:
    goto LABEL_7;
  }
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "topic");
    v8 = objc_claimAutoreleasedReturnValue();
    v13 = 138412547;
    v14 = v6;
    v15 = 2117;
    v16 = v8;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "spotlight recent %@: %{sensitive}@", (uint8_t *)&v13, 0x16u);
    goto LABEL_6;
  }
LABEL_8:

  objc_msgSend(v2, "topic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_fetchSpotlightRecentTopicsWithAlternateRanking:(int64_t)a3 limit:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0DA9BA8];
  v12 = *MEMORY[0x1E0DA9BB0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__ATXSpotlightClient__fetchSpotlightRecentTopicsWithAlternateRanking_limit___block_invoke;
  v11[3] = &__block_descriptor_48_e26___NSArray_16__0__NSArray_8l;
  v11[4] = a1;
  v11[5] = a3;
  objc_msgSend(v6, "recentResultsWithOptions:rankAndDeduplicate:", v8, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __76__ATXSpotlightClient__fetchSpotlightRecentTopicsWithAlternateRanking_limit___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "rerankRecents:withAlternateRanking:", a2, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (v3 >= 0xA)
    v4 = 10;
  else
    v4 = v3;
  objc_msgSend(v2, "subarrayWithRange:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)rerankRecents:(id)a3 withAlternateRanking:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  char *v16;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t buf[16];

  v6 = a3;
  switch(a4)
  {
    case 0uLL:
      __atxlog_handle_ui();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] rerankRecents_Normal", buf, 2u);
      }

      goto LABEL_8;
    case 1uLL:
      __atxlog_handle_ui();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] rerankRecents_Filter UserTyped", v20, 2u);
      }

      objc_msgSend(a1, "rerankRecents_Filter:removingType:", v6, 30);
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      __atxlog_handle_ui();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] rerankRecentsLimitCount 2.5, 7.5", v19, 2u);
      }

      v12 = 2.5;
      v13 = 7.5;
      goto LABEL_18;
    case 3uLL:
      __atxlog_handle_ui();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] rerankRecentsLimitCount 7.5, 14.5", v18, 2u);
      }

      v12 = 7.5;
      v13 = 14.5;
LABEL_18:
      objc_msgSend(a1, "rerankRecents_LimitCount:oneCountDays:twoCountDays:", v6, v12, v13);
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      __atxlog_handle_ui();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        +[ATXSpotlightClient rerankRecents:withAlternateRanking:].cold.2();

LABEL_8:
      objc_msgSend(a1, "rerankRecents_Normal:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v15 = (void *)v9;
  __atxlog_handle_ui();
  v16 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
    +[ATXSpotlightClient rerankRecents:withAlternateRanking:].cold.1(v15, v16);

  return v15;
}

+ (id)rerankRecents_Normal:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  _BYTE *v32;
  id v33;
  char v34;
  _BYTE v35[7];
  char v36;
  _BYTE v37[15];
  char v38;
  _BYTE v39[7];
  _QWORD v40[5];
  uint8_t buf[16];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  objc_msgSend(v5, "dateByAddingTimeInterval:", -604800.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v8)
    goto LABEL_28;
  v9 = v8;
  v10 = *(_QWORD *)v43;
  v32 = v35;
  v33 = v5;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v43 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      if ((unint64_t)objc_msgSend(v4, "count", v32) >= 0xA)
      {
        __atxlog_handle_ui();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v30 = "[Recents]: V0 only considers first 10";
LABEL_26:
          _os_log_impl(&dword_1A49EF000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
        }
LABEL_27:
        v5 = v33;

        goto LABEL_28;
      }
      objc_msgSend(v12, "engagementTime");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceReferenceDate");
      v15 = v14;
      objc_msgSend(v6, "timeIntervalSinceReferenceDate");
      v17 = v16;

      if (v15 < v17)
      {
        __atxlog_handle_ui();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v30 = "[Recents]: V0 no need to consider more past max date";
          goto LABEL_26;
        }
        goto LABEL_27;
      }
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __43__ATXSpotlightClient_rerankRecents_Normal___block_invoke;
      v40[3] = &unk_1E4D5CDF8;
      v40[4] = v12;
      v18 = objc_msgSend(v4, "indexOfObjectPassingTest:", v40);
      __atxlog_handle_ui();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v20)
          +[ATXSpotlightClient rerankRecents_Normal:].cold.1(&v38, v39);

        objc_msgSend(v4, "addObject:", v12);
      }
      else
      {
        if (v20)
          +[ATXSpotlightClient rerankRecents_Normal:].cold.3(&v36, v37);

        objc_msgSend(v4, "objectAtIndexedSubscript:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "engagementTime");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "timeIntervalSinceReferenceDate");
        v24 = v23;
        objc_msgSend(v12, "engagementTime");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "timeIntervalSinceReferenceDate");
        v27 = v26;

        if (v24 < v27)
        {
          __atxlog_handle_ui();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            +[ATXSpotlightClient rerankRecents_Normal:].cold.2(&v34, v32);

        }
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    v5 = v33;
    if (v9)
      continue;
    break;
  }
LABEL_28:

  return v4;
}

uint64_t __43__ATXSpotlightClient_rerankRecents_Normal___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "encodedNormalizedTopic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "encodedNormalizedTopic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToData:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)rerankRecents_Filter:(id)a3 removingType:(int)a4
{
  void *v5;
  void *v6;
  _QWORD v8[4];
  int v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__ATXSpotlightClient_rerankRecents_Filter_removingType___block_invoke;
  v8[3] = &__block_descriptor_36_e27_B16__0___SFEngagedResult__8l;
  v9 = a4;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rerankRecents_Normal:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __56__ATXSpotlightClient_rerankRecents_Filter_removingType___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  int *v4;
  int v5;
  int v6;
  NSObject *v7;

  v3 = objc_msgSend(a2, "type");
  v6 = *(_DWORD *)(a1 + 32);
  v4 = (int *)(a1 + 32);
  v5 = v6;
  if (v3 == v6)
  {
    __atxlog_handle_ui();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __56__ATXSpotlightClient_rerankRecents_Filter_removingType___block_invoke_cold_1(v4, v7);

  }
  return v3 != v5;
}

+ (id)rerankRecents_LimitCount:(id)a3 oneCountDays:(double)a4 twoCountDays:(double)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  NSObject *v29;
  char *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  char *v36;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id obj;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  char v48;
  _BYTE v49[15];
  char v50;
  _BYTE v51[15];
  char v52;
  _BYTE v53[7];
  _QWORD v54[5];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  objc_msgSend(v9, "dateByAddingTimeInterval:", a4 * -86400.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v9;
  objc_msgSend(v9, "dateByAddingTimeInterval:", a5 * -86400.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v56;
    do
    {
      v14 = 0;
      v41 = v12;
      do
      {
        if (*(_QWORD *)v56 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v14);
        v54[0] = v11;
        v54[1] = 3221225472;
        v54[2] = __73__ATXSpotlightClient_rerankRecents_LimitCount_oneCountDays_twoCountDays___block_invoke;
        v54[3] = &unk_1E4D5CDF8;
        v54[4] = v15;
        v16 = objc_msgSend(v8, "indexOfObjectPassingTest:", v54, v38);
        __atxlog_handle_ui();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v18)
            +[ATXSpotlightClient rerankRecents_Normal:].cold.1(&v52, v53);

          objc_msgSend(v8, "addObject:", v15);
          objc_msgSend(v43, "addObject:", &unk_1E4DC1BC0);
        }
        else
        {
          v19 = v11;
          if (v18)
            +[ATXSpotlightClient rerankRecents_LimitCount:oneCountDays:twoCountDays:].cold.5(&v50, v51);

          objc_msgSend(v43, "objectAtIndexedSubscript:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v20, "integerValue") + 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "replaceObjectAtIndex:withObject:", v16, v21);

          objc_msgSend(v8, "objectAtIndexedSubscript:", v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "engagementTime");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "timeIntervalSinceReferenceDate");
          v25 = v24;
          objc_msgSend(v15, "engagementTime");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "timeIntervalSinceReferenceDate");
          v28 = v27;

          if (v25 < v28)
          {
            __atxlog_handle_ui();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
              +[ATXSpotlightClient rerankRecents_Normal:].cold.2(&v48, v49);

          }
          v11 = v19;
          v12 = v41;
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v12);
  }

  __atxlog_handle_ui();
  v30 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEBUG))
    +[ATXSpotlightClient rerankRecents_LimitCount:oneCountDays:twoCountDays:].cold.2(v8, v30);

  v44[0] = v11;
  v44[1] = 3221225472;
  v44[2] = __73__ATXSpotlightClient_rerankRecents_LimitCount_oneCountDays_twoCountDays___block_invoke_162;
  v44[3] = &unk_1E4D5CE40;
  v45 = v43;
  v46 = v39;
  v47 = v38;
  v31 = v38;
  v32 = v39;
  v33 = v43;
  objc_msgSend(v8, "_pas_filteredArrayWithIndexedTest:", v44);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_ui();
  v35 = v8;
  v36 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEBUG))
    +[ATXSpotlightClient rerankRecents_LimitCount:oneCountDays:twoCountDays:].cold.1(v34, v36);

  return v34;
}

uint64_t __73__ATXSpotlightClient_rerankRecents_LimitCount_oneCountDays_twoCountDays___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "encodedNormalizedTopic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "encodedNormalizedTopic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToData:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __73__ATXSpotlightClient_rerankRecents_LimitCount_oneCountDays_twoCountDays___block_invoke_162(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;

  v5 = a2;
  objc_msgSend(a1[4], "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7 == 2)
  {
    objc_msgSend(v5, "engagementTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    v16 = v15;
    objc_msgSend(a1[6], "timeIntervalSinceReferenceDate");
    v18 = v17;

    if (v16 < v18)
    {
      __atxlog_handle_ui();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __73__ATXSpotlightClient_rerankRecents_LimitCount_oneCountDays_twoCountDays___block_invoke_162_cold_2(v5);
      goto LABEL_9;
    }
LABEL_10:
    v19 = 1;
    goto LABEL_11;
  }
  if (v7 != 1)
    goto LABEL_10;
  objc_msgSend(v5, "engagementTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;
  objc_msgSend(a1[5], "timeIntervalSinceReferenceDate");
  v12 = v11;

  if (v10 >= v12)
    goto LABEL_10;
  __atxlog_handle_ui();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __73__ATXSpotlightClient_rerankRecents_LimitCount_oneCountDays_twoCountDays___block_invoke_162_cold_1(v5);
LABEL_9:

  v19 = 0;
LABEL_11:

  return v19;
}

+ (BOOL)_isEqualRecentTopics:(id)a3 otherRecentTopics:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 != objc_msgSend(v6, "count"))
  {
LABEL_10:
    v18 = 0;
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "count"))
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "engagementDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "engagementDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToDate:", v12);

      if (!v13)
        break;
      objc_msgSend(v9, "topic");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "topic");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v15, "isEqualToString:", v17);

      if ((v18 & 1) != 0 && objc_msgSend(v5, "count") > (unint64_t)++v8)
        continue;
      goto LABEL_11;
    }

    goto LABEL_10;
  }
  v18 = 1;
LABEL_11:

  return v18;
}

+ (id)_resultWithSuggestion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "executableSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "executableType");

  if (v6 == 2)
  {
    __atxlog_handle_ui();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithSuggestion is ATXSuggestionExecutableTypeAction", buf, 2u);
    }

    objc_msgSend(a1, "_resultWithActionSuggestion:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v19 = (void *)v8;
    goto LABEL_18;
  }
  objc_msgSend(v4, "executableSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "executableType");

  if (v10 == 5)
  {
    __atxlog_handle_ui();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithSuggestion is ATXSuggestionExecutableTypeAppClip", v23, 2u);
    }

    objc_msgSend(a1, "_resultWithAppClipSuggestion:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(v4, "executableSpecification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "executableType");

  if (v13 == 9)
  {
    __atxlog_handle_ui();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithSuggestion is ATXSuggestionExecutableTypeShortcutsAction", v22, 2u);
    }

    objc_msgSend(a1, "_resultWithShortcutsActionSuggestion:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(v4, "executableSpecification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "executableType");

  __atxlog_handle_ui();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16 == 10)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1A49EF000, v18, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithSuggestion is ATXSuggestionExecutableTypeLinkAction", v21, 2u);
    }

    objc_msgSend(a1, "_resultWithLinkActionSuggestion:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    +[ATXSpotlightClient _resultWithSuggestion:].cold.1(v4, v18);

  v19 = 0;
LABEL_18:

  return v19;
}

+ (id)_resultWithLinkActionSuggestion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uiSpecification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithLinkActionSuggestion %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v4, "linkActionExecutableObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "_resultWithLinkActionContainer:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_resultWithLinkActionContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
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
  void *v30;
  id v31;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_imageWithLinkImage:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v4, "bundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBundleIdentifier:", v6);
  }

  v8 = objc_alloc(MEMORY[0x1E0DC7BD0]);
  objc_msgSend(v4, "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:", v9, v10, 0, 0);

  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v31;
  if (v13)
  {
    __atxlog_handle_ui();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[ATXSpotlightClient _resultWithLinkActionContainer:].cold.1();
    v15 = 0;
  }
  else
  {
    objc_msgSend(v11, "subtitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v11, "subtitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v14 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = MEMORY[0x1E0C9AA60];
    }

    objc_msgSend(v11, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_accessoryImageWithContextualAction:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "detailedRowCardSectionWithTitle:subtitles:thumbnail:trailingImage:", v18, v14, v7, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setIsRunnableWorkflow:", 1);
    objc_msgSend(v21, "setIntentMessageData:", v12);
    objc_msgSend(v11, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setIntentMessageName:", v22);

    objc_msgSend(v20, "setCommand:", v21);
    objc_msgSend(v11, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCommandDetail:", v23);

    v15 = (void *)objc_opt_new();
    objc_msgSend(v11, "uniqueIdentifier");
    v30 = v7;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIdentifier:", v24);

    objc_msgSend(v11, "associatedAppBundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setApplicationBundleIdentifier:", v25);

    objc_msgSend(v15, "applicationBundleIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setResultBundleId:", v26);

    v27 = (void *)objc_opt_new();
    v32 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCardSections:", v28);

    objc_msgSend(v15, "setInlineCard:", v27);
    v7 = v30;

  }
  return v15;
}

+ (id)_resultWithShortcutsActionSuggestion:(id)a3
{
  id v4;
  NSObject *v5;
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
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uiSpecification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v7;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithShortcutsActionSuggestion %@", (uint8_t *)&v17, 0xCu);

  }
  objc_msgSend(v4, "atxShortcutsActionExecutableObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "contextualAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiSpecification");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiSpecification");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subtitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_resultWithContextualAction:title:subtitle:", v10, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)_resultWithContextualAction:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
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
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  uint8_t buf[16];
  id v61;
  void *v62;
  _QWORD v63[2];

  v63[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v8;
    v12 = objc_alloc_init(MEMORY[0x1E0D44140]);
    if (!objc_msgSend(a1, "_isAutoShortcutEnabledForSpotlight:", v11))
      goto LABEL_9;
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v10)
    {
LABEL_9:
      v21 = 0;
      goto LABEL_33;
    }
    v58 = v12;
    v13 = (double)objc_msgSend(v10, "integerValue");
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    v16 = v13 - v15;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alarmName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v16 <= 3600.0)
    {
      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "setUnitsStyle:", 2);
      objc_msgSend(v22, "setAllowedUnits:", 64);
      v23 = 60.0;
      if (v16 > 60.0)
        v23 = v16;
      objc_msgSend(v22, "stringFromTimeInterval:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SPOTLIGHT_TIME_TO_ALARM"), &stru_1E4D5DB30, 0);
      v56 = v17;
      v26 = v11;
      v27 = v9;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringWithFormat:", v28, v19, v24);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      v9 = v27;
      v11 = v26;
      v17 = v56;

      v10 = v22;
    }
    else
    {
      v20 = v18;
    }

    v10 = v20;
    v12 = v58;
  }
  v29 = MEMORY[0x1A85A4F90]();
  v61 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v61);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v61;
  v32 = (void *)v29;
  v33 = v31;
  objc_autoreleasePoolPop(v32);
  if (v33)
  {
    v34 = (void *)v30;
    __atxlog_handle_ui();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      +[ATXSpotlightClient _resultWithContextualAction:title:subtitle:].cold.2();
    v21 = 0;
  }
  else
  {
    objc_msgSend(v8, "icon");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v8, "icon");
      v37 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_imageWithContextualActionIcon:", v37);
      v35 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __atxlog_handle_ui();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        +[ATXSpotlightClient _resultWithContextualAction:title:subtitle:].cold.1();
      v35 = 0;
    }

    objc_msgSend(a1, "_iconForParameterizedAutoShortcutContextualAction:provider:", v11, v12);
    v38 = objc_claimAutoreleasedReturnValue();
    v59 = v12;
    if (v38)
    {
      __atxlog_handle_ui();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A49EF000, v39, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: using icon from parameterized app shortcut", buf, 2u);
      }

      objc_msgSend(a1, "_imageWithContextualActionIcon:", v38);
      v40 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "_accessoryImageWithContextualAction:", v8);
      v40 = objc_claimAutoreleasedReturnValue();
    }
    v57 = v9;
    v54 = (void *)v40;
    v55 = (void *)v38;
    if (v10)
    {
      v63[0] = v10;
      v41 = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "detailedRowCardSectionWithTitle:subtitles:thumbnail:trailingImage:", v9, v42, v35, v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(a1, "detailedRowCardSectionWithTitle:subtitles:thumbnail:trailingImage:", v9, MEMORY[0x1E0C9AA60], v35, v40);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v44 = (void *)objc_opt_new();
    objc_msgSend(v44, "setIsRunnableWorkflow:", 1);
    objc_msgSend(v44, "setIntentMessageData:", v30);
    objc_msgSend(v8, "identifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setIntentMessageName:", v45);

    objc_msgSend(v8, "settingBiomeStreamIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setBiomeStreamIdentifier:", v46);

    objc_msgSend(v43, "setCommand:", v44);
    objc_msgSend(v8, "identifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setCommandDetail:", v47);

    v34 = (void *)v30;
    v21 = (void *)objc_opt_new();
    objc_msgSend(v8, "uniqueIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setIdentifier:", v48);

    objc_msgSend(v8, "associatedAppBundleIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setApplicationBundleIdentifier:", v49);

    objc_msgSend(v21, "applicationBundleIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setResultBundleId:", v50);

    v51 = (void *)objc_opt_new();
    v62 = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setCardSections:", v52);

    objc_msgSend(v21, "setInlineCard:", v51);
    v9 = v57;
    v12 = v59;
    v33 = 0;
  }

LABEL_33:
  return v21;
}

+ (id)_accessoryImageWithContextualAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "accessoryIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "_imageWithContextualActionIcon:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(a1, "_imageWithDirectionsContextualAction:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_7:

  return v7;
}

+ (id)_imageWithLinkImage:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)getINUISearchFoundationImageAdapterClass());
  objc_msgSend(v3, "inImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithIntentsImage:", v5);
  return v6;
}

+ (id)_imageWithContextualActionIcon:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    __atxlog_handle_ui();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v5;
      _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: using contextualAction.icon.applicationBundleIdentifier %@", (uint8_t *)&v17, 0xCu);
    }

    v7 = (id)objc_opt_new();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
      objc_msgSend(v7, "setIconType:", 1);
    else
      objc_msgSend(v7, "setBundleIdentifier:", v5);
  }
  else
  {
    objc_msgSend(v4, "imageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      __atxlog_handle_ui();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: using icon.imageData ", (uint8_t *)&v17, 2u);
      }

      v7 = objc_alloc_init(MEMORY[0x1E0D8C418]);
      objc_msgSend(v4, "imageData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setImageData:", v10);

      objc_msgSend(v4, "imageScale");
      objc_msgSend(v7, "setScale:");
    }
    else
    {
      objc_msgSend(v4, "systemName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      __atxlog_handle_ui();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "systemName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412290;
          v18 = v14;
          _os_log_impl(&dword_1A49EF000, v13, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: using icon.systemName %@", (uint8_t *)&v17, 0xCu);

        }
        v7 = objc_alloc_init(MEMORY[0x1E0D8C780]);
        objc_msgSend(v4, "systemName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSymbolName:", v15);

        objc_msgSend(v7, "setIsTemplate:", 1);
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          +[ATXSpotlightClient _imageWithContextualActionIcon:].cold.1();

        v7 = 0;
      }
    }
  }
  objc_msgSend(v7, "setCornerRoundingStyle:", objc_msgSend(a1, "_imageCornerRoundingStyleForIconDisplayStyle:", objc_msgSend(v4, "displayStyle")));

  return v7;
}

+ (int)_imageCornerRoundingStyleForIconDisplayStyle:(unint64_t)a3
{
  return 4 * (a3 == 1);
}

+ (id)_imageWithDirectionsContextualAction:(id)a3
{
  unint64_t v3;
  uint64_t v4;
  id v5;

  v3 = objc_msgSend(a3, "navigationType");
  if (v3 > 3)
    v4 = 0;
  else
    v4 = (uint64_t)*(&off_1E4D5CE90 + v3);
  v5 = objc_alloc_init(MEMORY[0x1E0D8C780]);
  objc_msgSend(v5, "setSymbolName:", v4);
  objc_msgSend(v5, "setIsTemplate:", 1);
  return v5;
}

+ (id)_resultWithActionSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "executableSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executableClassString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_ui();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithActionSuggestion executableClassString:%@", (uint8_t *)&v14, 0xCu);
  }

  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqualToString:", v9);

  if (!v10)
  {
    __atxlog_handle_ui();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[ATXSpotlightClient _resultWithActionSuggestion:].cold.1();
    goto LABEL_8;
  }
  objc_msgSend(v4, "atxActionExecutableObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  objc_msgSend(a1, "_resultWithATXAction:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v12;
}

+ (id)_resultWithIntent:(id)a3 title:(id)a4 subtitle:(id)a5 bundleIdForDisplay:(id)a6 appIcon:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  objc_class *INUISearchFoundationImageAdapterClass;
  objc_class *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
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
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  id v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)MEMORY[0x1E0CB3898];
  v17 = a6;
  objc_msgSend(v16, "processInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "processName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("duetexpertd"));

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXSpotlightClient.m"), 870, CFSTR("We should not be pulling in UIKit in duetexpertd"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v15, "setBundleIdentifier:", CFSTR("com.apple.mobilephone"));
  __atxlog_handle_ui();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v52 = v13;
    v53 = 2112;
    v54 = v12;
    _os_log_impl(&dword_1A49EF000, v21, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithIntent [%@] intent:%@", buf, 0x16u);
  }

  INUISearchFoundationImageAdapterClass = (objc_class *)getINUISearchFoundationImageAdapterClass();
  if (v12 && (v23 = INUISearchFoundationImageAdapterClass, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v24 = v17;

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v12, 0);
    objc_msgSend(v25, "_keyImage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_ui();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v26, "_identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v52 = v28;
      _os_log_impl(&dword_1A49EF000, v27, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithIntent intentsImage._identifier:%@", buf, 0xCu);

    }
    if (v26)
    {
      v29 = (void *)objc_msgSend([v23 alloc], "initWithIntentsImage:", v26);
      objc_msgSend(v29, "setSize:", 32.0, 32.0);
    }
    else
    {
      v29 = 0;
    }

    v30 = (void *)MEMORY[0x1E0C9AA60];
    v17 = v24;
    objc_msgSend(a1, "detailedRowCardSectionWithTitle:subtitles:thumbnail:trailingImage:", v13, MEMORY[0x1E0C9AA60], v15, v29, 0);
  }
  else if (v14)
  {
    v50 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(a1, "detailedRowCardSectionWithTitle:subtitles:thumbnail:trailingImage:", v13, v30, v15, 0, v14);
  }
  else
  {
    v29 = 0;
    v30 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(a1, "detailedRowCardSectionWithTitle:subtitles:thumbnail:trailingImage:", v13, MEMORY[0x1E0C9AA60], v15, 0, 0);
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_opt_new();
  objc_msgSend(v12, "backingStore");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "data");
  v48 = v13;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setIntentMessageData:", v34);

  objc_msgSend(v12, "_intentInstanceDescription");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "type");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setIntentMessageName:", v36);

  objc_msgSend(v32, "setApplicationBundleIdentifier:", v17);
  objc_msgSend(v31, "setCommand:", v32);
  v37 = (void *)objc_opt_new();
  v38 = (void *)objc_opt_new();
  objc_msgSend(v38, "UUIDString");
  v39 = v15;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setIdentifier:", v40);

  objc_msgSend(v37, "setApplicationBundleIdentifier:", v17);
  objc_msgSend(v37, "applicationBundleIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setResultBundleId:", v41);

  v42 = (void *)objc_opt_new();
  v49 = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setCardSections:", v43);

  objc_msgSend(v37, "setInlineCard:", v42);
  return v37;
}

+ (id)_resultWithAppBundleId:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  ATXSuggestionSearchResult *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[ATXApplicationRecord localizedNameForBundle:](ATXApplicationRecord, "localizedNameForBundle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    __atxlog_handle_ui();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      +[ATXSpotlightClient _resultWithAppBundleId:].cold.1();

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setBundleIdentifier:", v3);
  v7 = objc_alloc_init(MEMORY[0x1E0D8C488]);
  objc_msgSend(v7, "setApplicationBundleIdentifier:", v3);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setShouldUseCompactDisplay:", 1);
  objc_msgSend(v8, "setThumbnail:", v6);
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v9);

  objc_msgSend(v8, "setCommand:", v7);
  v10 = objc_alloc_init(ATXSuggestionSearchResult);
  -[ATXSuggestionSearchResult setIdentifier:](v10, "setIdentifier:", v3);
  -[ATXSuggestionSearchResult setApplicationBundleIdentifier:](v10, "setApplicationBundleIdentifier:", v3);
  -[ATXSuggestionSearchResult applicationBundleIdentifier](v10, "applicationBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestionSearchResult setResultBundleId:](v10, "setResultBundleId:", v11);

  v12 = objc_alloc_init(MEMORY[0x1E0D8C210]);
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCardSections:", v13);

  -[ATXSuggestionSearchResult setInlineCard:](v10, "setInlineCard:", v12);
  return v10;
}

+ (id)_resultWithATXAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
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
  Boolean keyExistsAndHasValidFormat[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "actionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bundleIdForDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXSpotlightZKWTrialClientWrapper sharedInstance](ATXSpotlightZKWTrialClientWrapper, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  keyExistsAndHasValidFormat[0] = 0;
  if (!CFPreferencesGetAppBooleanValue(CFSTR("zkwShowNSUAApp"), (CFStringRef)*MEMORY[0x1E0CF9510], keyExistsAndHasValidFormat)&& !objc_msgSend(v8, "showNSUASuggestionsAsAppLaunches"))
  {
    v11 = (void *)objc_opt_new();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
    {
      objc_msgSend(v11, "setIconType:", 1);
    }
    else
    {
      objc_msgSend(v4, "userActivity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "webpageURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ATXBundleIdReplacementForBundleIdWithWebpageURLHint();
      v14 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setBundleIdentifier:", v14);
      v7 = (void *)v14;
    }
    __atxlog_handle_ui();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "bundleId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)keyExistsAndHasValidFormat = 138412546;
      v52 = v5;
      v53 = 2112;
      v54 = v16;
      _os_log_impl(&dword_1A49EF000, v15, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithATXAction [%@] action.bundleId=%@", keyExistsAndHasValidFormat, 0x16u);

    }
    objc_msgSend(v4, "intent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v4, "intent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_resultWithIntent:title:subtitle:bundleIdForDisplay:appIcon:", v18, v5, v6, v7, v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

      goto LABEL_4;
    }
    objc_msgSend(v4, "userActivity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "webpageURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "userActivity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "webpageURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "host");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("trackingshipment.apple.com"));

      if ((v24 & 1) != 0)
      {
        v25 = 0;
      }
      else
      {
        objc_msgSend(v22, "absoluteString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v22, "schemelessAbsoluteString");
          v27 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v27;
        }
        objc_msgSend(a1, "_symbolImageForName:", CFSTR("link"));
        v25 = objc_claimAutoreleasedReturnValue();
      }
      __atxlog_handle_ui();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)keyExistsAndHasValidFormat = 138412546;
        v52 = v5;
        v53 = 2112;
        v54 = v22;
        _os_log_impl(&dword_1A49EF000, v28, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithATXAction [%@] userActivity webpageURL:%@", keyExistsAndHasValidFormat, 0x16u);
      }

    }
    else
    {
      v25 = 0;
    }
    if (v6)
    {
      v50 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = MEMORY[0x1E0C9AA60];
    }
    v47 = (void *)v29;
    v48 = v11;
    v46 = (void *)v25;
    objc_msgSend(a1, "detailedRowCardSectionWithTitle:subtitles:thumbnail:trailingImage:", v5, v29, v11, v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userActivity");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "webpageURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = objc_opt_new();
      v34 = (void *)MEMORY[0x1E0D8C5E0];
      objc_msgSend(v4, "userActivity");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "webpageURL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "punchoutWithURL:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setPunchout:](v33, "setPunchout:", v37);

      objc_msgSend(v30, "setCommand:", v33);
      v38 = v30;
    }
    else
    {
      objc_msgSend(v4, "userActivity");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v39)
      {
        __atxlog_handle_ui();
        v33 = objc_claimAutoreleasedReturnValue();
        v38 = v30;
        v18 = v46;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          +[ATXSpotlightClient _resultWithATXAction:].cold.1();
        goto LABEL_30;
      }
      v33 = objc_alloc_init(MEMORY[0x1E0D8C440]);
      objc_msgSend(v4, "userActivityString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setUserActivityRequiredString:](v33, "setUserActivityRequiredString:", v40);

      -[NSObject setApplicationBundleIdentifier:](v33, "setApplicationBundleIdentifier:", v7);
      v38 = v30;
      objc_msgSend(v30, "setCommand:", v33);
    }
    v18 = v46;
LABEL_30:

    v9 = (void *)objc_opt_new();
    v41 = (void *)objc_opt_new();
    objc_msgSend(v41, "UUIDString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIdentifier:", v42);

    objc_msgSend(v9, "setApplicationBundleIdentifier:", v7);
    objc_msgSend(v9, "applicationBundleIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setResultBundleId:", v43);

    v44 = (void *)objc_opt_new();
    v49 = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setCardSections:", v45);

    objc_msgSend(v9, "setInlineCard:", v44);
    v11 = v48;
    goto LABEL_31;
  }
  objc_msgSend(a1, "_resultWithAppBundleId:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

  return v9;
}

+ (id)_symbolImageForName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setSymbolName:", v3);

  objc_msgSend(v4, "setIsTemplate:", 1);
  return v4;
}

+ (id)_resultWithAppClipSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "appClipHeroAppPredictionExecutableObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "clipMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v21 = 0;
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v4, "uiSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "localizedSubtitleForClipSuggestion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", v9))
    {
      objc_msgSend(v4, "uiSpecification");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "title");
      v12 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "uiSpecification");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "subtitle");
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v14;
      v9 = (void *)v12;
    }
    objc_msgSend(v7, "fullAppCachedIconFilePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_alloc(MEMORY[0x1E0D8C7F8]);
      v17 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v7, "fullAppCachedIconFilePath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fileURLWithPath:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v16, "initWithURL:", v19);

    }
    else
    {
      objc_msgSend(v7, "clipBusinessIconURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = objc_alloc(MEMORY[0x1E0D8C7F8]);
        objc_msgSend(v7, "clipBusinessIconURL");
        v24 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v7, "fullAppIconURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
LABEL_15:
          objc_msgSend(v20, "setCornerRoundingStyle:", 3);
          v50 = v20;
          if (v10)
          {
            v54[0] = v10;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "detailedRowCardSectionWithTitle:subtitles:thumbnail:trailingImage:", v9, v25, v20, 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(a1, "detailedRowCardSectionWithTitle:subtitles:thumbnail:trailingImage:", v9, MEMORY[0x1E0C9AA60], v20, 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v48 = v9;
          v49 = v10;
          v27 = objc_alloc_init(MEMORY[0x1E0D8C5E0]);
          objc_msgSend(v6, "clipMetadata");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "clipURL");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            objc_msgSend(v6, "clipMetadata");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "clipURL");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v31;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setUrls:", v32);

          }
          else
          {
            objc_msgSend(v27, "setUrls:", MEMORY[0x1E0C9AA60]);
          }

          objc_msgSend(v27, "setHasClip:", 1);
          v52 = v27;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setPunchoutOptions:", v33);

          objc_msgSend(v26, "setThumbnail:", v50);
          v34 = objc_alloc_init(MEMORY[0x1E0D8C178]);
          objc_msgSend(v26, "setAction:", v34);

          objc_msgSend(v7, "clipOpenButtonTitle");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "uppercaseString");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "action");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setLabel:", v36);

          v21 = (void *)objc_opt_new();
          objc_msgSend(v21, "setType:", 23);
          objc_msgSend(v21, "setApplicationBundleIdentifier:", CFSTR("com.apple.application"));
          objc_msgSend(v21, "applicationBundleIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setResultBundleId:", v38);

          v39 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v6, "clipMetadata");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "webClipID");
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = (void *)v41;
          if (v41)
            v43 = (const __CFString *)v41;
          else
            v43 = &stru_1E4D5DB30;
          objc_msgSend(v39, "stringWithFormat:", CFSTR("com.apple.appclip-%@"), v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setIdentifier:", v44);

          objc_msgSend(v21, "setNearbyBusinessesString:", &stru_1E4D5DB30);
          v45 = (void *)objc_opt_new();
          v51 = v26;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setCardSections:", v46);

          objc_msgSend(v21, "setInlineCard:", v45);
          goto LABEL_25;
        }
        v23 = objc_alloc(MEMORY[0x1E0D8C7F8]);
        objc_msgSend(v7, "fullAppIconURL");
        v24 = objc_claimAutoreleasedReturnValue();
      }
      v18 = (void *)v24;
      v20 = (void *)objc_msgSend(v23, "initWithURL:", v24);
    }

    goto LABEL_15;
  }
  v21 = 0;
LABEL_26:

  return v21;
}

+ (id)detailedRowCardSectionWithTitle:(id)a3 subtitles:(id)a4 thumbnail:(id)a5 trailingImage:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setShouldUseCompactDisplay:", 1);
  objc_msgSend(v13, "setThumbnail:", v11);
  objc_msgSend(v13, "setTrailingThumbnail:", v12);
  v23 = v9;
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v14);

  v15 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v20));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v18);
  }

  objc_msgSend(v13, "setDescriptions:", v15);
  return v13;
}

+ (BOOL)_isAutoShortcutEnabledForSpotlight:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "isAutoShortcutsEnabledForSpotlightForBundleId:", v5);

  if ((v6 & 1) == 0)
  {
    __atxlog_handle_zkw_hide();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v17;
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "ATXSFL: All auto shortcuts are disabled for app: %@", (uint8_t *)&v21, 0xCu);
LABEL_10:

    }
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v4, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phrase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "isAutoShortcutEnabledForSpotlightForBundleId:signature:", v7, v9);

  __atxlog_handle_zkw_hide();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) == 0)
  {
    if (v12)
    {
      objc_msgSend(v4, "phrase");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "signature");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v18;
      v23 = 2112;
      v24 = v19;
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "ATXSFL: Auto shortcut is hidden for shortcut with signature: %@ from app: %@", (uint8_t *)&v21, 0x16u);

      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v12)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phrase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "signature");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = v13;
    v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "ATXSFL: Can display auto shortcut for app: %@ with shortcut signature: %@", (uint8_t *)&v21, 0x16u);

  }
  v16 = 1;
LABEL_12:

  return v16;
}

+ (BOOL)isAutoShortcutsEnabledForSpotlightForBundleId:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v5 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchDisabledBundles"), CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
  objc_msgSend(v9, "removeObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));
  objc_msgSend(v9, "removeObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"));
  if (objc_msgSend(v8, "containsObject:", CFSTR("com.apple.DocumentsApp")))
  {
    objc_msgSend(v9, "addObject:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
    objc_msgSend(v9, "addObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));
    objc_msgSend(v9, "addObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"));
    objc_msgSend(v9, "addObject:", CFSTR("com.apple.FileProvider.LocalStorage"));
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v4, "initWithSet:", v10);
  if ((objc_msgSend(v11, "containsObject:", v3) & 1) != 0)
  {
    LOBYTE(v12) = 0;
  }
  else
  {
    v13 = (void *)objc_opt_new();
    v12 = objc_msgSend(v13, "autoShortcutHasBeenHiddenForIdentifier:", v3) ^ 1;

  }
  return v12;
}

+ (BOOL)isAutoShortcutEnabledForSpotlightForBundleId:(id)a3 signature:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "stringByAppendingString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "autoShortcutHasBeenHiddenForIdentifier:", v8) ^ 1;
  return (char)v6;
}

+ (id)_iconForParameterizedAutoShortcutContextualAction:(id)a3 provider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v24;
  NSObject *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "phrase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parameterIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      __atxlog_handle_blending();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "bundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "actionIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v17;
        v28 = 2112;
        v29 = v18;
        _os_log_impl(&dword_1A49EF000, v12, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [AutoShortcut] not a phrase with parameters, use contextualAction icon %@, %@", buf, 0x16u);

      }
      v14 = 0;
      goto LABEL_23;
    }
    v25 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v7, "propertiesForIdentifiers:error:", v10, &v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v24;

    if (v12)
    {
      __atxlog_handle_blending();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[ATXSpotlightClient _iconForParameterizedAutoShortcutContextualAction:provider:].cold.3(v6, (uint64_t)v12, v13);
    }
    else
    {
      if (v11)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", v9);
        v19 = objc_claimAutoreleasedReturnValue();
        v13 = v19;
        if (v19)
        {
          -[NSObject value](v19, "value");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "displayRepresentation");
          v21 = objc_claimAutoreleasedReturnValue();

          -[NSObject image](v21, "image");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_contextualActionIconFromLNImage:", v22);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          __atxlog_handle_blending();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            +[ATXSpotlightClient _iconForParameterizedAutoShortcutContextualAction:provider:].cold.2(v6);
          v14 = 0;
        }

        goto LABEL_22;
      }
      __atxlog_handle_blending();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[ATXSpotlightClient _iconForParameterizedAutoShortcutContextualAction:provider:].cold.1(v6);
    }
    v14 = 0;
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  __atxlog_handle_blending();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(0, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "actionIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [AutoShortcut] is not an Auto Shortcut, use contextualAction icon %@, %@", buf, 0x16u);

  }
  v14 = 0;
LABEL_24:

  return v14;
}

+ (id)_contextualActionIconFromLNImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  uint8_t buf[16];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("duetexpertd"));

  if (!v7)
  {
    v20 = 0;
    if (!WorkflowKitLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_1E4D5CE78;
      v22 = 0;
      WorkflowKitLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (!WorkflowKitLibraryCore_frameworkLibrary)
      +[ATXSpotlightClient _contextualActionIconFromLNImage:].cold.2(&v20);
    objc_msgSend(v3, "wf_image");
    v10 = objc_claimAutoreleasedReturnValue();
    v8 = v10;
    if (v10)
    {
      -[NSObject URL](v10, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = (void *)MEMORY[0x1E0DC7A68];
        -[NSObject URL](v8, "URL");
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "displayStyle");
        objc_msgSend(v12, "iconWithImageURL:displayStyle:", v13, WFContextualActionIconDisplayStyleForLNImageDisplayStyle());
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_18:
        v9 = (void *)v14;
        goto LABEL_19;
      }
      -[NSObject data](v8, "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = (void *)MEMORY[0x1E0DC7A68];
        -[NSObject data](v8, "data");
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "displayStyle");
        objc_msgSend(v16, "iconWithImageData:scale:displayStyle:", v13, WFContextualActionIconDisplayStyleForLNImageDisplayStyle(), 0.0);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      -[NSObject symbolName](v8, "symbolName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = (void *)MEMORY[0x1E0DC7A68];
        -[NSObject symbolName](v8, "symbolName");
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "iconWithSystemName:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      __atxlog_handle_ui();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        +[ATXSpotlightClient _contextualActionIconFromLNImage:].cold.3();
    }
    else
    {
      __atxlog_handle_blending();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A49EF000, v13, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [AutoShortcut] wfimage nil", buf, 2u);
      }
    }
    v9 = 0;
LABEL_19:

    goto LABEL_20;
  }
  __atxlog_handle_ui();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    +[ATXSpotlightClient _contextualActionIconFromLNImage:].cold.1();
  v9 = 0;
LABEL_20:

  return v9;
}

+ (id)_responseWithUpcomingMedia
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  ATXSpotlightClientResponse *v24;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[4];
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "recentUpcomingMediaActionsWithLimit:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXSpotlightClientResponse createSectionWithTitle:sectionBundleIdentifier:resultCount:](ATXSpotlightClientResponse, "createSectionWithTitle:sectionBundleIdentifier:resultCount:", 0, &stru_1E4D5DB30, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v5;
  objc_msgSend(v5, "addObject:", v7);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      v12 = 0;
      v27 = v10;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v12);
        objc_msgSend(a1, "_resultWithATXAction:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14
          && (objc_msgSend(MEMORY[0x1E0DA9BA0], "proactiveTopicWithResult:", v14),
              (v15 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v16 = v15;
          __atxlog_handle_ui();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(a1, "_descriptionForTopic:", v16);
            v18 = v11;
            v19 = a1;
            v20 = v8;
            v21 = v4;
            v22 = v3;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v35 = v23;
            _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: Topic: %@", buf, 0xCu);

            v3 = v22;
            v4 = v21;
            v8 = v20;
            a1 = v19;
            v11 = v18;
            v10 = v27;
          }

          objc_msgSend(v3, "addObject:", v16);
          objc_msgSend(v4, "addObject:", &unk_1E4DC1BD8);
        }
        else
        {
          __atxlog_handle_ui();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            +[ATXSpotlightClient _responseWithUpcomingMedia].cold.1(v32, v13, &v33, v16);
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v10);
  }

  v24 = -[ATXSpotlightClientResponse initWithTopics:scores:sections:]([ATXSpotlightClientResponse alloc], "initWithTopics:scores:sections:", v3, v4, v26);
  return v24;
}

+ (id)recentUpcomingMediaActionsWithLimit:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  ATXAction *v21;
  void *v22;
  void *v23;
  ATXAction *v24;
  NSObject *v25;
  void *v26;
  uint64_t v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  ATXAction *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
  +[ATXUpcomingMediaQuery getAllUpcomingMedia](ATXUpcomingMediaQuery, "getAllUpcomingMedia");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sortedUpcomingMedia");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "first");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    }
    while (v8);
  }

  v12 = objc_msgSend(v5, "count");
  if (v12 >= a3)
    v13 = a3;
  else
    v13 = v12;
  objc_msgSend(v5, "subarrayWithRange:", 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(v19, "launchId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v21 = [ATXAction alloc];
          v22 = (void *)objc_opt_new();
          objc_msgSend(v19, "launchId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v28) = 0;
          v24 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v21, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v19, v22, v23, 0, 0, 0, v28, 0, 0);

          if (v24)
          {
            __atxlog_handle_context_heuristic();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v40 = v24;
              _os_log_impl(&dword_1A49EF000, v25, OS_LOG_TYPE_DEFAULT, "recentUpcomingMediaActionsWithLimit action:%@", buf, 0xCu);
            }

            objc_msgSend(v30, "addObject:", v24);
          }

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    }
    while (v16);
  }
  v26 = (void *)objc_msgSend(v30, "copy");

  return v26;
}

- (ATXSpotlightClientDelegate)delegate
{
  return (ATXSpotlightClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)suggestedResultResponseWithLimit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXSpotlightClient: [Recents] alternate ranking match in both codepaths", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)suggestedResultResponseWithLimit:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXSpotlightClient: [Recents] alternate ranking without matching control or treatment codepath", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_isValidSuggestion:forWorldState:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_ERROR, "ATXSpotlightClient: Removing unexpected spotlight recent", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_topicWithSuggestion:layoutUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXSpotlightClient: _resultWithSuggestion must have an identifier to be included in Spotlight metrics", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)rerankRecents:(void *)a1 withAlternateRanking:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_16_0(a1, a2);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_4(&dword_1A49EF000, v2, v3, "[Recents]: Returning results: %lu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

+ (void)rerankRecents:withAlternateRanking:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXSpotlightClient: [Recents] unsupported alt ranking %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)rerankRecents_Normal:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_9(a1, a2);
  OUTLINED_FUNCTION_4_5(&dword_1A49EF000, v2, v3, "[Recents]: Adding", v4);
}

+ (void)rerankRecents_Normal:(_BYTE *)a1 .cold.2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_3_9(a1, a2);
  OUTLINED_FUNCTION_1_12(&dword_1A49EF000, v2, (uint64_t)v2, "[Recents]: Unexpected date out of order", v3);
}

+ (void)rerankRecents_Normal:(_BYTE *)a1 .cold.3(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_9(a1, a2);
  OUTLINED_FUNCTION_4_5(&dword_1A49EF000, v2, v3, "[Recents]: Duplicate", v4);
}

void __56__ATXSpotlightClient_rerankRecents_Filter_removingType___block_invoke_cold_1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_DEBUG, "[Recents]: Removing result with type %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)rerankRecents_LimitCount:(void *)a1 oneCountDays:(const char *)a2 twoCountDays:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_16_0(a1, a2);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_4(&dword_1A49EF000, v2, v3, "[Recents]: After removing expired: %lu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

+ (void)rerankRecents_LimitCount:(void *)a1 oneCountDays:(const char *)a2 twoCountDays:.cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_16_0(a1, a2);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_4(&dword_1A49EF000, v2, v3, "[Recents]: After removing duplicates: %lu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

+ (void)rerankRecents_LimitCount:(_BYTE *)a1 oneCountDays:(_BYTE *)a2 twoCountDays:.cold.5(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_9(a1, a2);
  OUTLINED_FUNCTION_4_5(&dword_1A49EF000, v2, v3, "[Recents]: Duplicate, incrementing", v4);
}

void __73__ATXSpotlightClient_rerankRecents_LimitCount_oneCountDays_twoCountDays___block_invoke_162_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "engagementTime");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_0_7(&dword_1A49EF000, v2, v3, "[Recents]: Remove single engagement: %lu %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_5_0();
}

void __73__ATXSpotlightClient_rerankRecents_LimitCount_oneCountDays_twoCountDays___block_invoke_162_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "engagementTime");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_0_7(&dword_1A49EF000, v2, v3, "[Recents]: Remove double engagement: %lu %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_5_0();
}

+ (void)_resultWithSuggestion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "executableSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executableClassString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, a2, v5, "ATXSpotlightClient: _resultWithSuggestion is not handled %@", v6);

  OUTLINED_FUNCTION_5_0();
}

+ (void)_resultWithLinkActionContainer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, v0, v1, "Error secure archiving of WFLinkContextualAction: %@", v2);
  OUTLINED_FUNCTION_2();
}

+ (void)_resultWithContextualAction:title:subtitle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "WFContextualAction does not have icon or related bundle identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_resultWithContextualAction:title:subtitle:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, v0, v1, "Error secure archiving of WFContextualAction: %@", v2);
  OUTLINED_FUNCTION_2();
}

+ (void)_imageWithContextualActionIcon:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXSpotlightClient: WFContextualActionIcon does not have image data, or system name", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_resultWithActionSuggestion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, v0, v1, "ATXSpotlightClient: executableClassString %@ wrong class.", v2);
  OUTLINED_FUNCTION_2();
}

+ (void)_resultWithAppBundleId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ZKW app result had no title for bundleId: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_resultWithATXAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXSpotlightClient: _resultWithActionSuggestion action %@ has no intent nor user activity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_iconForParameterizedAutoShortcutContextualAction:(void *)a1 provider:.cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v4, v5, "ATXSpotlightClient: [AutoShortcut] properties nil for %@, %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_5_0();
}

+ (void)_iconForParameterizedAutoShortcutContextualAction:(void *)a1 provider:.cold.2(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v4, v5, "ATXSpotlightClient: [AutoShortcut] property nil for %@, %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_5_0();
}

+ (void)_iconForParameterizedAutoShortcutContextualAction:(NSObject *)a3 provider:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  __int16 v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v6;
  OUTLINED_FUNCTION_8_4();
  v11 = v8;
  v12 = a2;
  _os_log_error_impl(&dword_1A49EF000, a3, OS_LOG_TYPE_ERROR, "ATXSpotlightClient: [AutoShortcut] properties lookup error for %@, %@: %@", (uint8_t *)&v9, 0x20u);

}

+ (void)_contextualActionIconFromLNImage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXSpotlightClient: should not be pulling in UIKit duetexpertd.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_contextualActionIconFromLNImage:(_QWORD *)a1 .cold.2(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *WorkflowKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ATXSpotlightClient.m"), 50, CFSTR("%s"), *a1);

  __break(1u);
}

+ (void)_contextualActionIconFromLNImage:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXSpotlightClient: WFContextualAction does not have url or data or symbolName", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_responseWithUpcomingMedia
{
  void *v7;

  objc_msgSend(a2, "actionTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1A49EF000, a4, OS_LOG_TYPE_ERROR, "ATXSpotlightClient: Topic: nil: %@", a1, 0xCu);

}

@end
