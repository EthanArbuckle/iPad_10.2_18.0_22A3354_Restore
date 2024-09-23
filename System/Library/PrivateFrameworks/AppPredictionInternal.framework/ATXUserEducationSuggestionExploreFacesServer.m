@implementation ATXUserEducationSuggestionExploreFacesServer

- (ATXUserEducationSuggestionExploreFacesServer)initWithConnector:(id)a3
{
  id v5;
  ATXUserEducationSuggestionExploreFacesServer *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  NSUserDefaults *defaults;
  uint64_t v11;
  ATXNotificationManagementMAConstants *constants;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXUserEducationSuggestionExploreFacesServer;
  v6 = -[ATXUserEducationSuggestionBaseServer init](&v14, sel_init);
  if (v6)
  {
    __atxlog_handle_context_user_education_suggestions();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[ATXUserEducationSuggestionExploreFacesServer initWithConnector:]";
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%s: starting server", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_connector, a3);
    v8 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v9 = objc_msgSend(v8, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    defaults = v6->_defaults;
    v6->_defaults = (NSUserDefaults *)v9;

    objc_msgSend(MEMORY[0x1E0CF8FB0], "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    constants = v6->_constants;
    v6->_constants = (ATXNotificationManagementMAConstants *)v11;

    -[ATXUserEducationSuggestionExploreFacesServer scheduleNextTry](v6, "scheduleNextTry");
    -[ATXUserEducationSuggestionExploreFacesServer startUpSubscriberToBacklightBiomeStreamIfSubscribed](v6, "startUpSubscriberToBacklightBiomeStreamIfSubscribed");
  }

  return v6;
}

- (BOOL)shouldNeverShowSuggestionAgain
{
  void *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  _BOOL4 v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[ATXUserEducationSuggestionExploreFacesServer suggestion](self, "suggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "suggestionWasAlreadyShown");

  if (v4)
  {
    __atxlog_handle_context_user_education_suggestions();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[ATXUserEducationSuggestionExploreFacesServer shouldNeverShowSuggestionAgain]";
      v6 = "%s: Will never show suggestion again because it was already shown";
LABEL_7:
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v7 = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", *MEMORY[0x1E0CF95C8]);
  if (v7)
  {
    __atxlog_handle_context_user_education_suggestions();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[ATXUserEducationSuggestionExploreFacesServer shouldNeverShowSuggestionAgain]";
      v6 = "%s: Will never show suggestion again because user has already seen gallery";
      goto LABEL_7;
    }
LABEL_8:

    LOBYTE(v7) = 1;
  }
  return v7;
}

- (id)suggestion
{
  ATXUserEducationSuggestionExploreFaces *suggestion;
  ATXUserEducationSuggestionExploreFaces *v4;
  ATXUserEducationSuggestionExploreFaces *v5;

  suggestion = self->_suggestion;
  if (!suggestion)
  {
    v4 = (ATXUserEducationSuggestionExploreFaces *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF91C0]), "initWithRandomUUID");
    v5 = self->_suggestion;
    self->_suggestion = v4;

    suggestion = self->_suggestion;
  }
  return suggestion;
}

- (void)scheduleNextTry
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __63__ATXUserEducationSuggestionExploreFacesServer_scheduleNextTry__block_invoke;
  v2[3] = &unk_1E82DAC38;
  v2[4] = self;
  -[ATXUserEducationSuggestionBaseServer performBlockOnInternalSerialQueue:](self, "performBlockOnInternalSerialQueue:", v2);
}

void __63__ATXUserEducationSuggestionExploreFacesServer_scheduleNextTry__block_invoke(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  uint32_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  void *v13;
  double v14;
  int64_t v15;
  int64_t v16;
  xpc_object_t v17;
  NSObject *v18;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "shouldNeverShowSuggestionAgain"))
  {
    __atxlog_handle_context_user_education_suggestions();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[ATXUserEducationSuggestionExploreFacesServer scheduleNextTry]_block_invoke";
      v3 = "%s: Not scheduling attempt to show suggestion because it should never be shown again.";
      v4 = v2;
      v5 = 12;
LABEL_13:
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, v3, buf, v5);
    }
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "minHour");
    v7 = objc_msgSend(*(id *)(a1 + 32), "maxHour");
    if (v6 >= v7)
    {
      __atxlog_handle_context_user_education_suggestions();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v21 = "-[ATXUserEducationSuggestionExploreFacesServer scheduleNextTry]_block_invoke";
        v22 = 2048;
        v23 = v6;
        v24 = 2048;
        v25 = v7;
        v3 = "%s: Not scheduling attempt to show suggestion because minHour (%ld) >= maxHour (%ld)";
        v4 = v2;
        v5 = 32;
        goto LABEL_13;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v2 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_opt_new();
      -[NSObject dateByAddingUnit:value:toDate:options:](v2, "dateByAddingUnit:value:toDate:options:", 128, objc_msgSend(*(id *)(a1 + 32), "tryAgainIntervalSeconds"), v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSObject component:fromDate:](v2, "component:fromDate:", 32, v9);
      if (v10 < v6 || v10 > v7)
      {
        v12 = v10;
        -[NSObject dateBySettingHour:minute:second:ofDate:options:](v2, "dateBySettingHour:minute:second:ofDate:options:", v6, 0, 0, v9, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 <= v7)
        {
          v9 = v13;
        }
        else
        {
          -[NSObject dateByAddingUnit:value:toDate:options:](v2, "dateByAddingUnit:value:toDate:options:", 16, 1, v13, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      objc_msgSend(v9, "timeIntervalSinceDate:", v8);
      v15 = (uint64_t)v14;
      v16 = objc_msgSend(*(id *)(a1 + 32), "gracePeriod");
      v17 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v17, (const char *)*MEMORY[0x1E0C808B8], 1);
      xpc_dictionary_set_BOOL(v17, (const char *)*MEMORY[0x1E0C80898], 0);
      xpc_dictionary_set_BOOL(v17, (const char *)*MEMORY[0x1E0C80738], 1);
      xpc_dictionary_set_int64(v17, (const char *)*MEMORY[0x1E0C80760], v15);
      xpc_dictionary_set_int64(v17, (const char *)*MEMORY[0x1E0C80790], v16);
      xpc_dictionary_set_string(v17, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
      __atxlog_handle_context_user_education_suggestions();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v21 = "-[ATXUserEducationSuggestionExploreFacesServer scheduleNextTry]_block_invoke";
        v22 = 2048;
        v23 = v15;
        v24 = 2048;
        v25 = v16;
        v26 = 2114;
        v27 = v9;
        _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "%s: Registering XPC activity with delay: %llds and gracePeriod: %llds. Expecting the next attempt to send the suggestion to occur at %{public}@", buf, 0x2Au);
      }

      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __63__ATXUserEducationSuggestionExploreFacesServer_scheduleNextTry__block_invoke_17;
      handler[3] = &unk_1E82DC950;
      handler[4] = *(_QWORD *)(a1 + 32);
      xpc_activity_register("com.apple.duetexpertd.ATXUserEducationSuggestionExploreFacesServer", v17, handler);

    }
  }

}

uint64_t __63__ATXUserEducationSuggestionExploreFacesServer_scheduleNextTry__block_invoke_17(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_set_state(activity, 5);
  return objc_msgSend(*(id *)(a1 + 32), "tryToSendSuggestion");
}

- (void)tryToSendSuggestion
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke;
  v2[3] = &unk_1E82DAC38;
  v2[4] = self;
  -[ATXUserEducationSuggestionBaseServer performBlockOnInternalSerialQueue:](self, "performBlockOnInternalSerialQueue:", v2);
}

void __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  char v40;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[6];
  _QWORD v51[5];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint8_t v56[128];
  uint8_t v57[4];
  const char *v58;
  _BYTE buf[24];
  double v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scheduleNextTry");
  __atxlog_handle_context_user_education_suggestions();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[ATXUserEducationSuggestionExploreFacesServer tryToSendSuggestion]_block_invoke";
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "%s: Attempting to send suggestion", buf, 0xCu);
  }

  if (!objc_msgSend(*(id *)(a1 + 32), "shouldNeverShowSuggestionAgain"))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_opt_new();
    v5 = -[NSObject component:fromDate:](v3, "component:fromDate:", 32, v4);
    if (v5 < objc_msgSend(*(id *)(a1 + 32), "minHour") || v5 > objc_msgSend(*(id *)(a1 + 32), "maxHour"))
    {
      __atxlog_handle_context_user_education_suggestions();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_msgSend(*(id *)(a1 + 32), "minHour");
        v8 = objc_msgSend(*(id *)(a1 + 32), "maxHour");
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[ATXUserEducationSuggestionExploreFacesServer tryToSendSuggestion]_block_invoke";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v5;
        *(_WORD *)&buf[22] = 2048;
        v60 = *(double *)&v7;
        v61 = 2048;
        v62 = v8;
        _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%s: Not sending suggestion because the current hour, %ld, is not between %ld to %ld.", buf, 0x2Au);
      }
      goto LABEL_41;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "doubleForKey:", *MEMORY[0x1E0CF9550]);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v9);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v6);
    v12 = v11;

    if (v12 < 172800.0)
    {
      __atxlog_handle_context_user_education_suggestions();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[ATXUserEducationSuggestionExploreFacesServer tryToSendSuggestion]_block_invoke";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2048;
        v60 = v12;
        _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "%s: Not sending suggestion since user likely upgraded less than 48 hours ago. Will be eligbile after 48 hours. Approximate date of last upgrade was %{public}@ (%f seconds ago)", buf, 0x20u);
      }

      goto LABEL_41;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v60) = 1;
    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 0;
    BiomeLibrary();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UserFocus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ComputedMode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "atx_publisherWithStartTime:endTime:maxEvents:lastN:reversed:", 0, 0, &unk_1E83CC130, &unk_1E83CC130, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_21;
    v51[3] = &unk_1E82DB658;
    v51[4] = &v52;
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_23;
    v50[3] = &unk_1E82DE238;
    v50[4] = &v52;
    v50[5] = buf;
    v18 = (id)objc_msgSend(v17, "sinkWithCompletion:receiveInput:", v51, v50);

    if (*((_BYTE *)v53 + 24))
    {
      __atxlog_handle_context_user_education_suggestions();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
      goto LABEL_40;
    }
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      __atxlog_handle_context_user_education_suggestions();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_cold_1(v19, v27, v28, v29, v30, v31, v32, v33);
      goto LABEL_40;
    }
    +[ATXPosterDescriptorCache sharedInstance](ATXPosterDescriptorCache, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "descriptors");
    v19 = objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      __atxlog_handle_context_user_education_suggestions();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v57 = 136315138;
        v58 = "-[ATXUserEducationSuggestionExploreFacesServer tryToSendSuggestion]_block_invoke";
        _os_log_impl(&dword_1C9A3B000, v43, OS_LOG_TYPE_DEFAULT, "%s: Not sending suggestion. Unable to get all descriptors from ATXPosterDescriptorCache.", v57, 0xCu);
      }
      goto LABEL_39;
    }
    -[NSObject objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"));
    v35 = objc_claimAutoreleasedReturnValue();
    v44 = v35;
    if (v35)
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      obj = v35;
      v36 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      if (v36)
      {
        v37 = *(_QWORD *)v47;
        while (2)
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v47 != v37)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "galleryOptions", v44);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "isHero");

            if ((v40 & 1) == 0)
            {

              objc_msgSend(*(id *)(a1 + 32), "sendSuggestionWithEventType:", 0);
              v43 = obj;
              goto LABEL_39;
            }
          }
          v36 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
          if (v36)
            continue;
          break;
        }
      }

      __atxlog_handle_context_user_education_suggestions();
      v41 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        goto LABEL_38;
      *(_DWORD *)v57 = 136315138;
      v58 = "-[ATXUserEducationSuggestionExploreFacesServer tryToSendSuggestion]_block_invoke";
      v42 = "%s: Not sending suggestion. Found 0 non-hero row ATXPosterDescriptors, possibly indicating that photos hasn'"
            "t finished donating their posters to us.";
    }
    else
    {
      __atxlog_handle_context_user_education_suggestions();
      v41 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
LABEL_38:

        v43 = v44;
LABEL_39:

LABEL_40:
        _Block_object_dispose(&v52, 8);
        _Block_object_dispose(buf, 8);
LABEL_41:

        goto LABEL_42;
      }
      *(_DWORD *)v57 = 136315138;
      v58 = "-[ATXUserEducationSuggestionExploreFacesServer tryToSendSuggestion]_block_invoke";
      v42 = "%s: Not sending suggestion. Unable to get list of photos descriptors from ATXPosterDescriptorCache.";
    }
    _os_log_impl(&dword_1C9A3B000, v41, OS_LOG_TYPE_DEFAULT, v42, v57, 0xCu);
    goto LABEL_38;
  }
  xpc_activity_unregister("com.apple.duetexpertd.ATXUserEducationSuggestionExploreFacesServer");
  __atxlog_handle_context_user_education_suggestions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[ATXUserEducationSuggestionExploreFacesServer tryToSendSuggestion]_block_invoke";
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%s: Not sending suggestion because we should never show it again. See logs above. Unregistered all future XPC activities to try and show the suggestion again.", buf, 0xCu);
  }
LABEL_42:

}

void __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    __atxlog_handle_context_user_education_suggestions();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_21_cold_1(v3);

  }
}

void __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "starting");

  }
  else
  {
    __atxlog_handle_context_user_education_suggestions();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_23_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

- (void)sendSuggestionWithEventType:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0CF91B8]);
  -[ATXUserEducationSuggestionExploreFacesServer suggestion](self, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUserEducationSuggestion:userEducationSuggestionEventType:", v6, a3);

  __atxlog_handle_context_user_education_suggestions();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[ATXUserEducationSuggestionExploreFacesServer sendSuggestionWithEventType:]";
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%s: Sending suggestion event: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  -[ATXUserEducationSuggestionConnector remoteObjectProxy](self->_connector, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didReceiveUserEducationSuggestionEvent:", v7);

}

- (void)setIsSubscribedForBacklightEvents:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", a3, CFSTR("DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_IsSubscribedToBackLightStream"));
}

- (BOOL)isSubscribedForBacklightEvents
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_IsSubscribedToBackLightStream"));
}

- (void)startUpSubscriberToBacklightBiomeStreamForTheFirstTime
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __102__ATXUserEducationSuggestionExploreFacesServer_startUpSubscriberToBacklightBiomeStreamForTheFirstTime__block_invoke;
  v2[3] = &unk_1E82DAC38;
  v2[4] = self;
  -[ATXUserEducationSuggestionBaseServer performBlockOnInternalSerialQueue:](self, "performBlockOnInternalSerialQueue:", v2);
}

void __102__ATXUserEducationSuggestionExploreFacesServer_startUpSubscriberToBacklightBiomeStreamForTheFirstTime__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  void *v13;

  v1 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "isSubscribedForBacklightEvents"))
  {
    __atxlog_handle_context_user_education_suggestions();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __102__ATXUserEducationSuggestionExploreFacesServer_startUpSubscriberToBacklightBiomeStreamForTheFirstTime__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  }
  else
  {
    v10 = *v1;
    if (*((_QWORD *)*v1 + 7) || v10[6])
    {
      __atxlog_handle_context_user_education_suggestions();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        __102__ATXUserEducationSuggestionExploreFacesServer_startUpSubscriberToBacklightBiomeStreamForTheFirstTime__block_invoke_cold_2((uint64_t)v1, 56, v11);

    }
    else
    {
      v12 = (void *)v10[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceReferenceDate");
      objc_msgSend(v12, "setDouble:forKey:", CFSTR("DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_TimestampFirstSubscribedToBackLightStream"));

      objc_msgSend(*v1, "setIsSubscribedForBacklightEvents:", 1);
      objc_msgSend(*v1, "startUpSubscriberToBacklightBiomeStreamIfSubscribed");
    }
  }
}

- (void)startUpSubscriberToBacklightBiomeStreamIfSubscribed
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __99__ATXUserEducationSuggestionExploreFacesServer_startUpSubscriberToBacklightBiomeStreamIfSubscribed__block_invoke;
  v2[3] = &unk_1E82DAC38;
  v2[4] = self;
  -[ATXUserEducationSuggestionBaseServer performBlockOnInternalSerialQueue:](self, "performBlockOnInternalSerialQueue:", v2);
}

void __99__ATXUserEducationSuggestionExploreFacesServer_startUpSubscriberToBacklightBiomeStreamIfSubscribed__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isSubscribedForBacklightEvents") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "suggestion");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "suggestionWasAlreadyDismissed");

    if (v3)
    {
      __atxlog_handle_context_user_education_suggestions();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315138;
        v8 = "-[ATXUserEducationSuggestionExploreFacesServer startUpSubscriberToBacklightBiomeStreamIfSubscribed]_block_invoke";
        _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%s: Suggestion has already been dismissed, no need to start the backlight subscriber.", (uint8_t *)&v7, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setIsSubscribedForBacklightEvents:", 0);
    }
    else
    {
      v6 = (id)objc_msgSend(*(id *)(a1 + 32), "backlightEventSink");
    }
  }
  else
  {
    __atxlog_handle_context_user_education_suggestions();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[ATXUserEducationSuggestionExploreFacesServer startUpSubscriberToBacklightBiomeStreamIfSubscribed]_block_invoke";
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%s: Not subscribed to the backlight stream so don't set it up.", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (id)backlightEventSink
{
  BPSSink *backlightEventSink;
  NSObject *v5;
  id v6;
  void *v7;
  BMBiomeScheduler *v8;
  BMBiomeScheduler *backlightEventScheduler;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id *p_backlightEventSink;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  backlightEventSink = self->_backlightEventSink;
  if (backlightEventSink)
    return backlightEventSink;
  __atxlog_handle_context_user_education_suggestions();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[ATXUserEducationSuggestionExploreFacesServer backlightEventSink]";
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%s: Setting up the backlight subscriber", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v6 = objc_alloc(MEMORY[0x1E0D025E0]);
  -[ATXUserEducationSuggestionBaseServer serialQueue](self, "serialQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (BMBiomeScheduler *)objc_msgSend(v6, "initWithIdentifier:targetQueue:", CFSTR("ATXUserEducationSuggestionExploreFacesServer.Backlight"), v7);
  backlightEventScheduler = self->_backlightEventScheduler;
  self->_backlightEventScheduler = v8;

  BiomeLibrary();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ScreenLocked");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "atx_DSLPublisher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filterWithKeyPath:value:", CFSTR("eventBody.starting"), MEMORY[0x1E0C9AAA0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subscribeOn:", self->_backlightEventScheduler);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__ATXUserEducationSuggestionExploreFacesServer_backlightEventSink__block_invoke_34;
  v20[3] = &unk_1E82DE280;
  objc_copyWeak(&v21, (id *)buf);
  objc_msgSend(v15, "sinkWithCompletion:receiveInput:", &__block_literal_global_52, v20);
  v16 = objc_claimAutoreleasedReturnValue();
  p_backlightEventSink = (id *)&self->_backlightEventSink;
  v18 = *p_backlightEventSink;
  *p_backlightEventSink = (id)v16;

  v19 = *p_backlightEventSink;
  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
  return v19;
}

void __66__ATXUserEducationSuggestionExploreFacesServer_backlightEventSink__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  __atxlog_handle_context_user_education_suggestions();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__ATXUserEducationSuggestionExploreFacesServer_backlightEventSink__block_invoke_cold_1(v2);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ATXUserEducationSuggestionExploreFacesServer backlightEventSink]_block_invoke";
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%s: Done listening to backlight events", (uint8_t *)&v6, 0xCu);
  }

}

void __66__ATXUserEducationSuggestionExploreFacesServer_backlightEventSink__block_invoke_34(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "backlightEventHandler:", v3);

}

- (void)backlightEventHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  NSInteger v34;
  int64_t v35;
  int64_t v36;
  NSObject *v37;
  int v38;
  const char *v39;
  __int16 v40;
  _WORD v41[17];

  *(_QWORD *)&v41[13] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ATXUserEducationSuggestionExploreFacesServer isSubscribedForBacklightEvents](self, "isSubscribedForBacklightEvents"))
  {
    objc_msgSend(v4, "eventBody");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((-[NSObject hasStarting](v5, "hasStarting") & 1) != 0)
      {
        -[NSUserDefaults doubleForKey:](self->_defaults, "doubleForKey:", CFSTR("DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_TimestampFirstSubscribedToBackLightStream"));
        v8 = v7;
        objc_msgSend(v4, "timestamp");
        if (v9 >= v8)
        {
          v32 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v4, "timestamp");
          objc_msgSend(v32, "dateWithTimeIntervalSinceReferenceDate:");
          v10 = objc_claimAutoreleasedReturnValue();
          __atxlog_handle_context_user_education_suggestions();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v38 = 136315650;
            v39 = "-[ATXUserEducationSuggestionExploreFacesServer backlightEventHandler:]";
            v40 = 1024;
            *(_DWORD *)v41 = -[NSObject starting](v6, "starting");
            v41[2] = 2114;
            *(_QWORD *)&v41[3] = v10;
            _os_log_impl(&dword_1C9A3B000, v33, OS_LOG_TYPE_DEFAULT, "%s: Backlight on: %{BOOL}d Date: %{public}@", (uint8_t *)&v38, 0x1Cu);
          }

          v34 = -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", CFSTR("DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_BacklightOffCount"))+ 1;
          -[NSUserDefaults setInteger:forKey:](self->_defaults, "setInteger:forKey:", v34, CFSTR("DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_BacklightOffCount"));
          v35 = -[ATXUserEducationSuggestionExploreFacesServer numBacklightOffEventsBeforeDismissSuggestion](self, "numBacklightOffEventsBeforeDismissSuggestion");
          v36 = v35 - v34;
          if (v35 <= v34)
          {
            -[ATXUserEducationSuggestionExploreFacesServer cancelBacklightEventSubscription](self, "cancelBacklightEventSubscription");
            -[ATXUserEducationSuggestionExploreFacesServer setIsSubscribedForBacklightEvents:](self, "setIsSubscribedForBacklightEvents:", 0);
            -[ATXUserEducationSuggestionExploreFacesServer sendSuggestionWithEventType:](self, "sendSuggestionWithEventType:", 1);
          }
          else
          {
            __atxlog_handle_context_user_education_suggestions();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v38 = 136315394;
              v39 = "-[ATXUserEducationSuggestionExploreFacesServer backlightEventHandler:]";
              v40 = 2048;
              *(_QWORD *)v41 = v36;
              _os_log_impl(&dword_1C9A3B000, v37, OS_LOG_TYPE_DEFAULT, "%s: %ld more backlight off events required before dismissing the suggestion.", (uint8_t *)&v38, 0x16u);
            }

          }
        }
        else
        {
          __atxlog_handle_context_user_education_suggestions();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            -[ATXUserEducationSuggestionExploreFacesServer backlightEventHandler:].cold.2(v10);
        }
      }
      else
      {
        __atxlog_handle_context_user_education_suggestions();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[ATXUserEducationSuggestionExploreFacesServer backlightEventHandler:].cold.3(v10, v25, v26, v27, v28, v29, v30, v31);
      }
    }
    else
    {
      __atxlog_handle_context_user_education_suggestions();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ATXUserEducationSuggestionExploreFacesServer backlightEventHandler:].cold.1(v10, v18, v19, v20, v21, v22, v23, v24);
    }

  }
  else
  {
    __atxlog_handle_context_user_education_suggestions();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ATXUserEducationSuggestionExploreFacesServer backlightEventHandler:].cold.4(v6, v11, v12, v13, v14, v15, v16, v17);
  }

}

- (void)cancelBacklightEventSubscription
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __80__ATXUserEducationSuggestionExploreFacesServer_cancelBacklightEventSubscription__block_invoke;
  v2[3] = &unk_1E82DAC38;
  v2[4] = self;
  -[ATXUserEducationSuggestionBaseServer performBlockOnInternalSerialQueue:](self, "performBlockOnInternalSerialQueue:", v2);
}

void __80__ATXUserEducationSuggestionExploreFacesServer_cancelBacklightEventSubscription__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_context_user_education_suggestions();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[ATXUserEducationSuggestionExploreFacesServer cancelBacklightEventSubscription]_block_invoke";
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "%s: Cancelling backlight biome subscription", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "backlightEventSink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (int64_t)minHour
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_minHour"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = -[ATXNotificationManagementMAConstants ATXUserEducationSuggestionExploreFacesServer_minHour](self->_constants, "ATXUserEducationSuggestionExploreFacesServer_minHour");
  v6 = v5;

  return v6;
}

- (int64_t)maxHour
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_maxHour"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = -[ATXNotificationManagementMAConstants ATXUserEducationSuggestionExploreFacesServer_maxHour](self->_constants, "ATXUserEducationSuggestionExploreFacesServer_maxHour");
  v6 = v5;

  return v6;
}

- (int64_t)tryAgainIntervalSeconds
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_tryAgainIntervalSeconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = -[ATXNotificationManagementMAConstants ATXUserEducationSuggestionExploreFacesServer_tryAgainIntervalSeconds](self->_constants, "ATXUserEducationSuggestionExploreFacesServer_tryAgainIntervalSeconds");
  v6 = v5;

  return v6;
}

- (int64_t)gracePeriod
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_gracePeriod"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = -[ATXNotificationManagementMAConstants ATXUserEducationSuggestionExploreFacesServer_gracePeriod](self->_constants, "ATXUserEducationSuggestionExploreFacesServer_gracePeriod");
  v6 = v5;

  return v6;
}

- (int64_t)numBacklightOffEventsBeforeDismissSuggestion
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("DiscoverySuggestions.ATXUserEducationSuggestionExploreFacesServer_numBacklightOffEventsBeforeDismissSuggestion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = -[ATXNotificationManagementMAConstants ATXUserEducationSuggestionExploreFacesServer_numBacklightOffEventsBeforeDismissSuggestion](self->_constants, "ATXUserEducationSuggestionExploreFacesServer_numBacklightOffEventsBeforeDismissSuggestion");
  v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlightEventSink, 0);
  objc_storeStrong((id *)&self->_backlightEventScheduler, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_connector, 0);
}

void __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%s: Not sending suggestion because user is in a mode.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%s: Not sending suggestion because there was an error while fetching the mode. See logs above.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_21_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v1, v2, "%s: error fetching latest mode change event from biome %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_4_4();
}

void __67__ATXUserEducationSuggestionExploreFacesServer_tryToSendSuggestion__block_invoke_23_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%s: Missing eventBody on biome event. Unable to determine if user is in a mode.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __102__ATXUserEducationSuggestionExploreFacesServer_startUpSubscriberToBacklightBiomeStreamForTheFirstTime__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a1, a3, "%s: Trying to start up the backlight subscriber for the first time, but found that it's already subscribed. This shouldn't happen. Returning early.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __102__ATXUserEducationSuggestionExploreFacesServer_startUpSubscriberToBacklightBiomeStreamForTheFirstTime__block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + a2);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 48);
  v5 = 136315650;
  v6 = "-[ATXUserEducationSuggestionExploreFacesServer startUpSubscriberToBacklightBiomeStreamForTheFirstTime]_block_invoke";
  v7 = 2112;
  v8 = v3;
  v9 = 2112;
  v10 = v4;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "%s: Trying to start up the backlight subscriber for the first time, but found that the internal biome objects have already been allocated and initialized. This shouldn't happen. Returning early. %@ %@", (uint8_t *)&v5, 0x20u);
  OUTLINED_FUNCTION_4_4();
}

void __66__ATXUserEducationSuggestionExploreFacesServer_backlightEventSink__block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v1, v2, "%s: Error listening to backlight events: %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_4_4();
}

- (void)backlightEventHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%s: eventBody missing from event. Returning early.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)backlightEventHandler:(os_log_t)log .cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[ATXUserEducationSuggestionExploreFacesServer backlightEventHandler:]";
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "%s: Ignoring backlight event that happened before the time that we first subscribed to the biome stream.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)backlightEventHandler:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

- (void)backlightEventHandler:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a1, a3, "%s: Not responding to backlight event. Handler called even though we're no longer subscribed to the biome stream.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
