@implementation BMDaemon

- (void)sendEventWithStreamIdentifier:(id)a3 timestamp:(id)a4 account:(id)a5 remoteName:(id)a6 storeEvent:(id)a7
{
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BMViewEventReporter *eventReporter;
  char v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  id v64;
  id v65;
  BMDaemon *v66;
  id obj;
  uint64_t v68;
  id v69;
  _QWORD v70[5];
  _QWORD v71[5];
  id v72;
  BMDaemon *v73;
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  void *v79;
  id v80;
  BMDaemon *v81;
  _QWORD v82[5];
  id v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  uint8_t v90[4];
  void *v91;
  __int16 v92;
  id v93;
  uint8_t v94[128];
  _BYTE buf[24];
  id v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  id v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v65 = a3;
  v64 = a4;
  v61 = a5;
  v62 = a6;
  v69 = a7;
  v66 = self;
  -[BMDaemon queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  -[BMDaemon _publisherServer](self, "_publisherServer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subscriptionsForStream:", v65);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  __biome_log_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    -[BMDaemon _publisherServer](self, "_publisherServer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "domain");
    BMStringForServiceDomain();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMDaemon _bookmarkStorage](v66, "_bookmarkStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "domain");
    BMStringForServiceDomain();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v20;
    *(_WORD *)&buf[22] = 2112;
    v96 = v65;
    v97 = 2112;
    v98 = v21;
    v99 = 2112;
    v100 = v69;
    _os_log_impl(&dword_18D810000, v16, OS_LOG_TYPE_INFO, "Using publisher server for domain: %@, bookmark storage domain: %@ when processing new event write for stream %@ subscription count: %@, event: %@", buf, 0x34u);

  }
  if (v61)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, v66, CFSTR("BMDaemon.m"), 457, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account == nil"));

  }
  eventReporter = v66->_eventReporter;
  v89 = 0;
  v23 = -[BMViewEventReporter streamUpdatedWithStreamIdentifier:remoteName:error:](eventReporter, "streamUpdatedWithStreamIdentifier:remoteName:error:", v65, v62, &v89);
  v24 = v89;
  if ((v23 & 1) == 0)
  {
    __biome_log_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[BMDaemon sendEventWithStreamIdentifier:timestamp:account:remoteName:storeEvent:].cold.1();

  }
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v15;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
  if (v26)
  {
    v68 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v86 != v68)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        v29 = (void *)MEMORY[0x193FECFB4]();
        objc_msgSend(v28, "subscriber");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          __biome_log_for_category();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v28;
            _os_log_fault_impl(&dword_18D810000, v31, OS_LOG_TYPE_FAULT, "Biome compute subscriptions with subscribers are no longer supported, subscription %@", buf, 0xCu);
          }
        }
        else if (v69)
        {
          __biome_log_for_category();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v28, "identifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v69;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v64;
            *(_WORD *)&buf[22] = 2112;
            v96 = v65;
            v97 = 2112;
            v98 = v33;
            _os_log_impl(&dword_18D810000, v32, OS_LOG_TYPE_INFO, "Processing local store event %@ at time %@ for %@ instead of reading from BiomeStorage for subscription %@", buf, 0x2Au);

          }
          v34 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v69, "timestamp");
          objc_msgSend(v34, "dateWithTimeIntervalSinceReferenceDate:");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setInitialBookmarkTimestamp:", v35);

          __biome_log_for_category();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v69;
            _os_log_impl(&dword_18D810000, v36, OS_LOG_TYPE_INFO, "Publishing local store events, event: %@", buf, 0xCu);
          }

          objc_msgSend(v28, "graph");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          BMDSLGetPublisherForEvent((uint64_t)v37, v69);
          v31 = objc_claimAutoreleasedReturnValue();

          v38 = MEMORY[0x1E0C809B0];
          v82[0] = MEMORY[0x1E0C809B0];
          v82[1] = 3221225472;
          v82[2] = __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke;
          v82[3] = &unk_1E2647B88;
          v82[4] = v28;
          v39 = v65;
          v83 = v39;
          v84 = v69;
          v76[0] = v38;
          v76[1] = 3221225472;
          v76[2] = __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke_38;
          v76[3] = &unk_1E2647BB0;
          v77 = v84;
          v78 = v64;
          v79 = v28;
          v80 = v39;
          v81 = v66;
          v40 = (id)-[NSObject sinkWithCompletion:receiveInput:](v31, "sinkWithCompletion:receiveInput:", v82, v76);

        }
        else
        {
          -[BMDaemon _bookmarkStorage](v66, "_bookmarkStorage");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v24;
          objc_msgSend(v28, "fetchBookmarkFromStorage:error:", v41, &v75);
          v31 = objc_claimAutoreleasedReturnValue();
          v42 = v75;

          if (v42)
          {
            __biome_log_for_category();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v28;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v65;
              _os_log_error_impl(&dword_18D810000, v43, OS_LOG_TYPE_ERROR, "Failed to fetch bookmark for subscription %@ when processing event write for %@", buf, 0x16u);
            }
          }
          else
          {
            if (!v31)
            {
              __biome_log_for_category();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v28, "identifier");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v65;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v45;
                _os_log_impl(&dword_18D810000, v44, OS_LOG_TYPE_DEFAULT, "No bookmark found for stream: %@ identifier: %@", buf, 0x16u);

              }
            }
            objc_msgSend(v28, "graph");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "bpsPublisher");
            v43 = objc_claimAutoreleasedReturnValue();

            if (BPSPipelineSupportsPullBasedPublishers())
            {
              -[NSObject validateBookmarkNode:](v43, "validateBookmarkNode:", v31);
              v63 = objc_claimAutoreleasedReturnValue();
              if (v63)
              {
                __biome_log_for_category();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v28;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v65;
                  _os_log_error_impl(&dword_18D810000, v47, OS_LOG_TYPE_ERROR, "Bookmark failed validation %@ when processing event write for %@, removing old bookmark and creating new one", buf, 0x16u);
                }

                -[BMDaemon _bookmarkStorage](v66, "_bookmarkStorage");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "identifier");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "client");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "removeBookmarkFileForSubscriptionWithIdentifier:client:", v49, v50);

                -[BMDaemon _bookmarkStorage](v66, "_bookmarkStorage");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = 0;
                objc_msgSend(v28, "fetchBookmarkFromStorage:error:", v51, &v74);
                v52 = objc_claimAutoreleasedReturnValue();
                v42 = v74;

                v31 = v52;
              }
              else
              {
                v42 = 0;
              }
              -[NSObject applyBookmarkNode:](v43, "applyBookmarkNode:", v31);
              v54 = (void *)v63;
            }
            else
            {
              -[NSObject withBookmark:](v43, "withBookmark:", v31);
              v53 = objc_claimAutoreleasedReturnValue();
              v42 = 0;
              v54 = v43;
              v43 = v53;
            }

            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            LOBYTE(v96) = 0;
            v55 = MEMORY[0x1E0C809B0];
            v71[0] = MEMORY[0x1E0C809B0];
            v71[1] = 3221225472;
            v71[2] = __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke_40;
            v71[3] = &unk_1E2647BD8;
            v71[4] = v28;
            v56 = v65;
            v72 = v56;
            v73 = v66;
            v70[0] = v55;
            v70[1] = 3221225472;
            v70[2] = __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke_42;
            v70[3] = &unk_1E2647C00;
            v70[4] = buf;
            v57 = (id)-[NSObject sinkWithBookmark:completion:receiveInput:](v43, "sinkWithBookmark:completion:receiveInput:", v31, v71, v70);
            if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
            {
              __biome_log_for_category();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v90 = 138412546;
                v91 = v28;
                v92 = 2112;
                v93 = v65;
                _os_log_impl(&dword_18D810000, v58, OS_LOG_TYPE_INFO, "Publishing downstream for subscription %@ based on new %@ event", v90, 0x16u);
              }

              -[BMDaemon _publisherServer](v66, "_publisherServer");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "receiveInputForSubscription:streamIdentifier:storeEvent:", v28, v56, 0);

            }
            _Block_object_dispose(buf, 8);
          }

          v24 = v42;
        }

        objc_autoreleasePoolPop(v29);
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
    }
    while (v26);
  }

}

- (id)_publisherServer
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  BMComputeXPCPublisherServer *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  BMComputeXPCPublisherServer *userPublisherServer;

  -[BMDaemon queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v15 = objc_msgSend((id)objc_opt_class(), "isAgent");
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[BMDaemon _publisherServer].cold.1(v15, v16, v17);

    if (!v15)
      goto LABEL_13;
LABEL_12:
    userPublisherServer = self->_userPublisherServer;
LABEL_14:
    v14 = userPublisherServer;
    goto LABEL_15;
  }
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BMDaemon _publisherServer].cold.3(v4, v6);

  objc_msgSend(v4, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMDaemon userComputeSourceServiceName](BMDaemon, "userComputeSourceServiceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
    goto LABEL_12;
  objc_msgSend(v4, "serviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMDaemon systemComputeSourceServiceName](BMDaemon, "systemComputeSourceServiceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
LABEL_13:
    userPublisherServer = self->_systemPublisherServer;
    goto LABEL_14;
  }
  __biome_log_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    -[BMDaemon _publisherServer].cold.2((uint64_t)v4, v13);

  v14 = 0;
LABEL_15:

  return v14;
}

- (id)_bookmarkStorage
{
  NSObject *v3;

  -[BMDaemon queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_userBookmarkStorage;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (id)systemComputeSourceServiceName
{
  return CFSTR("com.apple.biome.compute.source");
}

+ (id)userComputeSourceServiceName
{
  return CFSTR("com.apple.biome.compute.source.user");
}

- (void)eventsPrunedWithStreamIdentifier:(id)a3 account:(id)a4 remoteName:(id)a5 reason:(unint64_t)a6
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  BMViewEventReporter *eventReporter;
  char v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  -[BMDaemon queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  __biome_log_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v9;
    v22 = 2048;
    v23 = a6;
    _os_log_impl(&dword_18D810000, v12, OS_LOG_TYPE_INFO, "Received events pruned notification for stream %@ with reason: %lu", buf, 0x16u);
  }

  eventReporter = self->_eventReporter;
  if (a6 == 1)
  {
    v19 = 0;
    v14 = -[BMViewEventReporter streamPrunedWithStreamIdentifier:remoteName:error:](eventReporter, "streamPrunedWithStreamIdentifier:remoteName:error:", v9, v10, &v19);
    v15 = v19;
  }
  else
  {
    v18 = 0;
    v14 = -[BMViewEventReporter streamDeletionWithStreamIdentifier:remoteName:error:](eventReporter, "streamDeletionWithStreamIdentifier:remoteName:error:", v9, v10, &v18);
    v15 = v18;
  }
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    __biome_log_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[BMDaemon eventsPrunedWithStreamIdentifier:account:remoteName:reason:].cold.1();

  }
}

void __36__BMDaemon_setUpNotificationHandler__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const char *string;
  char *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (MEMORY[0x193FED9D4]() == MEMORY[0x1E0C812F8])
  {
    v3 = (void *)MEMORY[0x193FECFB4]();
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E0C81298]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)os_transaction_create();
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v5;
      _os_log_impl(&dword_18D810000, v7, OS_LOG_TYPE_INFO, "Received notifyd notification: %@", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.Preferences.ResetPrivacyWarningsNotification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "isEqualToString:", v8);

    if (v9)
    {
      +[BMLibraryStreamsPruner pruneForResetPrivacyAndLocationWarnings](BMLibraryStreamsPruner, "pruneForResetPrivacyAndLocationWarnings");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.siri.history.deletion.requested");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v5, "isEqualToString:", v10);

      if (v11)
      {
        +[BMLibraryStreamsPruner pruneSiriAndDictationHistory](BMLibraryStreamsPruner, "pruneSiriAndDictationHistory");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "AFAssistantEnablementDidChangeDarwinNotification");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v5, "isEqualToString:", v12);

        if (v13)
        {
          if (!CFPreferencesGetAppBooleanValue(CFSTR("Assistant Enabled"), CFSTR("com.apple.assistant.support"), 0))
            +[BMLibraryStreamsPruner pruneSiriDisabled](BMLibraryStreamsPruner, "pruneSiriDisabled");
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.suggestions.settingsChanged")))
        {
          if (+[BMDaemon isAgentOrEmbedded](BMDaemon, "isAgentOrEmbedded"))
          {
            v14 = (void *)CFPreferencesCopyAppValue(CFSTR("SiriCanLearnFromAppBlacklist"), CFSTR("com.apple.suggestions"));
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            +[BMLibraryStreamsPruner pruneLearnFromThisAppDisabled:](BMLibraryStreamsPruner, "pruneLearnFromThisAppDisabled:", v15);

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.TextInput.RemoveAllDynamicDictionariesNotification");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v5, "isEqualToString:", v16);

          if (v17)
            +[BMLibraryStreamsPruner pruneForResetKeyboardDictionary](BMLibraryStreamsPruner, "pruneForResetKeyboardDictionary");
        }
      }
    }
    __biome_log_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = 136315138;
      v20 = string;
      _os_log_impl(&dword_18D810000, v18, OS_LOG_TYPE_INFO, "--- handled event %s ---", (uint8_t *)&v19, 0xCu);
    }

    objc_autoreleasePoolPop(v3);
  }

}

+ (BOOL)isAgentOrEmbedded
{
  return 1;
}

+ (BMDSLGraphValidator)DSLValidator
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  void *v26;
  uint64_t v27;
  objc_class *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  BiomeLibraryAndInternalLibraryNode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValidKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01BA0], "legacyValidKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[BMDSLStreamPublisher name](BMDSLStreamPublisher, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01B98], "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01BC8], "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01BC0], "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E26D3630, &unk_1E26D3648, 0);
  v13 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0D01BA0], "legacyStreamClassMapping");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithDictionary:", v14);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  BiomeLibraryAndInternalLibraryNode();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allValidEventClasses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(v17);
        v22 = *(objc_class **)(*((_QWORD *)&v34 + 1) + 8 * i);
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v23);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v19);
  }

  v24 = objc_opt_class();
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, v26);

  v27 = objc_opt_class();
  v28 = (objc_class *)objc_opt_class();
  NSStringFromClass(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, v29);

  v30 = objc_alloc(MEMORY[0x1E0D01BA0]);
  v31 = (void *)objc_msgSend(v15, "copy");
  v32 = (void *)objc_msgSend(v30, "initWithValidKeyPaths:allowedOperations:allowedStreamTypes:eventStreamClassMapping:", v5, v11, v12, v31);

  return (BMDSLGraphValidator *)v32;
}

- (BMDaemon)initWithQueue:(id)a3 eventReporter:(id)a4
{
  NSObject *v7;
  id v8;
  BMDaemon *v9;
  BMDaemon *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *internalQueue;
  void *v14;
  void *v15;
  BMComputeXPCPublisherStorage *v16;
  uint64_t v17;
  uint64_t v18;
  BMComputeXPCPublisherStorage *userBookmarkStorage;
  BMComputeXPCPublisherStorage *v20;
  BMComputeXPCPublisherStorage *systemBookmarkStorage;
  BMComputeSubscriptionSubstreamManager *v22;
  BMComputeSubscriptionSubstreamManager *subscriptionSubstreamManager;
  BMComputeSourceServer *v24;
  void *v25;
  uint64_t v26;
  BMComputeSourceServer *userSourceServer;
  BMComputeXPCPublisherServer *v28;
  BMComputeXPCPublisherServer *userPublisherServer;
  BMComputeXPCPublisherServer **p_userPublisherServer;
  BMComputeSourceServer *v31;
  void *v32;
  uint64_t v33;
  BMComputeSourceServer *systemSourceServer;
  BMComputeXPCPublisherServer *v35;
  BMComputeXPCPublisherServer *systemPublisherServer;
  uint64_t v37;
  NSMutableDictionary *activeSystemSubscriptionIdentifiers;
  uint64_t v39;
  NSMutableDictionary *subscribedSystemStreams;
  uint64_t v41;
  uint64_t v42;
  BMDaemon *v43;
  void *v44;
  BMComputeXPCPublisherServer *v45;
  BMDaemon *v46;
  id v47;
  BMComputeXPCPublisherServer *v48;
  BMDaemon *v49;
  id v50;
  id v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t);
  void *v59;
  BMDaemon *v60;
  id v61;
  _QWORD v62[4];
  BMDaemon *v63;
  id v64;
  _QWORD aBlock[4];
  BMDaemon *v66;
  _QWORD *v67;
  _QWORD v68[4];
  objc_super v69;
  uint8_t buf[32];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2(v7);
  v69.receiver = self;
  v69.super_class = (Class)BMDaemon;
  v9 = -[BMDaemon init](&v69, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_eventReporter, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.biomed.background", v11);
    internalQueue = v10->_internalQueue;
    v10->_internalQueue = (OS_dispatch_queue *)v12;

    v14 = (void *)MEMORY[0x1E0D01BA0];
    +[BMDaemon DSLValidator](BMDaemon, "DSLValidator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCurrentProcessValidator:", v15);

    v16 = [BMComputeXPCPublisherStorage alloc];
    v17 = *MEMORY[0x1E0D01CA0];
    v18 = -[BMComputeXPCPublisherStorage initWithUseCase:domain:isClient:](v16, "initWithUseCase:domain:isClient:", *MEMORY[0x1E0D01CA0], 0, 0);
    userBookmarkStorage = v10->_userBookmarkStorage;
    v10->_userBookmarkStorage = (BMComputeXPCPublisherStorage *)v18;

    -[BMComputeXPCPublisherStorage initializeBiomeDSLDirectoryForBootSession](v10->_userBookmarkStorage, "initializeBiomeDSLDirectoryForBootSession");
    v20 = -[BMComputeXPCPublisherStorage initWithUseCase:domain:isClient:]([BMComputeXPCPublisherStorage alloc], "initWithUseCase:domain:isClient:", v17, 1, 0);
    systemBookmarkStorage = v10->_systemBookmarkStorage;
    v10->_systemBookmarkStorage = v20;

    -[BMComputeXPCPublisherStorage initializeBiomeDSLDirectoryForBootSession](v10->_systemBookmarkStorage, "initializeBiomeDSLDirectoryForBootSession");
    v22 = -[BMComputeSubscriptionSubstreamManager initWithQueue:]([BMComputeSubscriptionSubstreamManager alloc], "initWithQueue:", v10->_queue);
    subscriptionSubstreamManager = v10->_subscriptionSubstreamManager;
    v10->_subscriptionSubstreamManager = v22;

    v24 = [BMComputeSourceServer alloc];
    +[BMDaemon userComputeSourceServiceName](BMDaemon, "userComputeSourceServiceName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[BMComputeSourceServer initWithQueue:machServiceName:source:](v24, "initWithQueue:machServiceName:source:", v7, v25, v10);
    userSourceServer = v10->_userSourceServer;
    v10->_userSourceServer = (BMComputeSourceServer *)v26;

    v28 = -[BMComputeXPCPublisherServer initWithQueue:domain:delegate:]([BMComputeXPCPublisherServer alloc], "initWithQueue:domain:delegate:", v7, 0, v10);
    p_userPublisherServer = &v10->_userPublisherServer;
    userPublisherServer = v10->_userPublisherServer;
    v10->_userPublisherServer = v28;

    v31 = [BMComputeSourceServer alloc];
    +[BMDaemon systemComputeSourceServiceName](BMDaemon, "systemComputeSourceServiceName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[BMComputeSourceServer initWithQueue:machServiceName:source:](v31, "initWithQueue:machServiceName:source:", v7, v32, v10);
    systemSourceServer = v10->_systemSourceServer;
    v10->_systemSourceServer = (BMComputeSourceServer *)v33;

    v35 = -[BMComputeXPCPublisherServer initWithQueue:domain:delegate:]([BMComputeXPCPublisherServer alloc], "initWithQueue:domain:delegate:", v7, 1, v10);
    systemPublisherServer = v10->_systemPublisherServer;
    v10->_systemPublisherServer = v35;

    v37 = objc_opt_new();
    activeSystemSubscriptionIdentifiers = v10->_activeSystemSubscriptionIdentifiers;
    v10->_activeSystemSubscriptionIdentifiers = (NSMutableDictionary *)v37;

    v39 = objc_opt_new();
    subscribedSystemStreams = v10->_subscribedSystemStreams;
    v10->_subscribedSystemStreams = (NSMutableDictionary *)v39;

    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    if (v10->_systemPublisherServer)
      v41 = (*p_userPublisherServer != 0) + 1;
    else
      v41 = *p_userPublisherServer != 0;
    v42 = MEMORY[0x1E0C809B0];
    v68[3] = v41;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__BMDaemon_initWithQueue_eventReporter___block_invoke;
    aBlock[3] = &unk_1E2647B10;
    v67 = v68;
    v43 = v10;
    v66 = v43;
    v44 = _Block_copy(aBlock);
    v45 = v10->_systemPublisherServer;
    v62[0] = v42;
    v62[1] = 3221225472;
    v62[2] = __40__BMDaemon_initWithQueue_eventReporter___block_invoke_2;
    v62[3] = &unk_1E2647B38;
    v46 = v43;
    v63 = v46;
    v47 = v44;
    v64 = v47;
    -[BMComputeXPCPublisherServer activateWithCompletion:](v45, "activateWithCompletion:", v62);
    v48 = v10->_userPublisherServer;
    v56 = v42;
    v57 = 3221225472;
    v58 = __40__BMDaemon_initWithQueue_eventReporter___block_invoke_17;
    v59 = &unk_1E2647B38;
    v49 = v46;
    v60 = v49;
    v50 = v47;
    v61 = v50;
    -[BMComputeXPCPublisherServer activateWithCompletion:](v48, "activateWithCompletion:", &v56);
    if (+[BMDaemon isAgent](BMDaemon, "isAgent", v56, v57, v58, v59))
      +[BMDaemon BiomeAgentLaunchNotification](BMDaemon, "BiomeAgentLaunchNotification");
    else
      +[BMDaemon biomedLaunchNotification](BMDaemon, "biomedLaunchNotification");
    v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v52 = notify_post((const char *)objc_msgSend(v51, "UTF8String"));
    if ((_DWORD)v52)
    {
      __biome_log_for_category();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMDaemon initWithQueue:eventReporter:].cold.1((uint64_t)v51, v54, buf, v53);
      }

    }
    -[BMDaemon _subscribeStreamsForViews](v49, "_subscribeStreamsForViews");

    _Block_object_dispose(v68, 8);
  }

  return v10;
}

uint64_t __40__BMDaemon_initWithQueue_eventReporter___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v2 = *(_QWORD *)(v1 + 24) - 1;
  *(_QWORD *)(v1 + 24) = v2;
  if (!v2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 80), "initialCheckinsComplete");
  return result;
}

uint64_t __40__BMDaemon_initWithQueue_eventReporter___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __40__BMDaemon_initWithQueue_eventReporter___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "activate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __40__BMDaemon_initWithQueue_eventReporter___block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __40__BMDaemon_initWithQueue_eventReporter___block_invoke_17_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "activate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_subscribeStreamsForViews
{
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[BMDaemon queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = +[BMDaemon isAgent](BMDaemon, "isAgent");
  v5 = 48;
  if (v4)
    v5 = 40;
  objc_msgSend(*(id *)((char *)&self->super.isa + v5), "subscriptionMarkerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[BMDatabaseInitializer viewSubscribedStreams](_TtC12BiomeStreams21BMDatabaseInitializer, "viewSubscribedStreams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        __biome_log_for_category();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v12;
          _os_log_impl(&dword_18D810000, v13, OS_LOG_TYPE_INFO, "Adding subscription marker for view subscribed stream: %@", buf, 0xCu);
        }

        objc_msgSend(v6, "addSubscriptionWithStreamIdentifier:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v9);
  }

}

- (void)_subscribeSystemStream:(id)a3 subscriptionIdentifier:(id)a4 useCase:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
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
  BMComputeXPCSubscription *v20;
  void *v21;
  void *v22;
  BMComputeXPCSubscription *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v7 = a3;
  v8 = a4;
  -[BMDaemon queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDaemon subscribedSystemStreams](self, "subscribedSystemStreams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = (void *)objc_opt_new();
    -[BMDaemon subscribedSystemStreams](self, "subscribedSystemStreams");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v10);

  }
  -[BMDaemon subscribedSystemStreams](self, "subscribedSystemStreams");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v8);

  -[BMDaemon activeSystemSubscriptionIdentifiers](self, "activeSystemSubscriptionIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(v7, "DSLPublisherWithUseCase:", *MEMORY[0x1E0D01C80]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = [BMComputeXPCSubscription alloc];
    objc_msgSend(MEMORY[0x1E0D01D18], "current");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __66__BMDaemon__subscribeSystemStream_subscriptionIdentifier_useCase___block_invoke;
    v30[3] = &unk_1E2647B60;
    v30[4] = self;
    v23 = -[BMComputeXPCSubscription initWithIdentifier:client:waking:DSLGraph:block:](v20, "initWithIdentifier:client:waking:DSLGraph:block:", v10, v22, 1, v19, v30);

    -[BMDaemon systemStreamsPublisherClient](self, "systemStreamsPublisherClient");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      -[BMDaemon queue](self, "queue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[BMComputeXPCPublisherClient sharedWithQueue:domain:](BMComputeXPCPublisherClient, "sharedWithQueue:domain:", v25, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMDaemon setSystemStreamsPublisherClient:](self, "setSystemStreamsPublisherClient:", v26);

    }
    -[BMDaemon systemStreamsPublisherClient](self, "systemStreamsPublisherClient");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "subscribe:", v23);

    -[BMComputeXPCSubscription identifier](v23, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMDaemon activeSystemSubscriptionIdentifiers](self, "activeSystemSubscriptionIdentifiers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v10);

  }
}

void __66__BMDaemon__subscribeSystemStream_subscriptionIdentifier_useCase___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEventWithStreamIdentifier:timestamp:account:remoteName:storeEvent:", v8, v7, 0, 0, 0);

}

- (void)publisherServer:(id)a3 didAddSubscription:(id)a4
{
  NSObject *v5;
  id v6;

  v6 = a4;
  -[BMDaemon queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[BMComputeSubscriptionSubstreamManager addSubscription:](self->_subscriptionSubstreamManager, "addSubscription:", v6);
}

- (void)publisherServer:(id)a3 didClaimSubscription:(id)a4
{
  NSObject *v5;
  id v6;

  v6 = a4;
  -[BMDaemon queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[BMComputeSubscriptionSubstreamManager addSubscription:](self->_subscriptionSubstreamManager, "addSubscription:", v6);
}

- (void)publisherServer:(id)a3 didRemoveSubscription:(id)a4
{
  NSObject *v5;
  id v6;

  v6 = a4;
  -[BMDaemon queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[BMComputeSubscriptionSubstreamManager removeSubscription:](self->_subscriptionSubstreamManager, "removeSubscription:", v6);
}

void __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke_cold_1(a1, (uint64_t)v3, v4);

}

void __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v10 = 138413058;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_18D810000, v4, OS_LOG_TYPE_INFO, "Publishing event %@ with timestamp %@ downstream for subscription %@ based on write to %@", (uint8_t *)&v10, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 64), "_publisherServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "receiveInputForSubscription:streamIdentifier:storeEvent:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v3);

}

void __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  __biome_log_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v13 = 138413058;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_18D810000, v7, OS_LOG_TYPE_INFO, "Completed sink for subscription %@ based on new %@ event, completion: %@. Bookmark: %@", (uint8_t *)&v13, 0x2Au);
  }

  if (!objc_msgSend(v5, "state"))
  {
    objc_msgSend(*(id *)(a1 + 48), "_bookmarkStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeBookmark:forSubscriptionWithIdentifier:client:", v6, v11, v12);

  }
}

uint64_t __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke_42(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

+ (BOOL)isAgent
{
  return 0;
}

+ (id)userComputePublisherStreamName
{
  return CFSTR("com.apple.biome.compute.publisher.user");
}

+ (id)systemComputePublisherStreamName
{
  return CFSTR("com.apple.biome.compute.publisher");
}

+ (id)userComputePublisherServiceName
{
  return CFSTR("com.apple.biome.compute.publisher.service.user");
}

+ (id)systemComputePublisherServiceName
{
  return CFSTR("com.apple.biome.compute.publisher.service");
}

+ (id)biomedLaunchNotification
{
  return CFSTR("com.apple.biome.biomed.launched");
}

+ (id)BiomeAgentLaunchNotification
{
  return CFSTR("com.apple.biome.BiomeAgent.launched");
}

+ (void)registerXPCActivities
{
  xpc_activity_register("com.apple.biome.prune-expired-events", (xpc_object_t)*MEMORY[0x1E0C80748], &__block_literal_global_1);
}

void __33__BMDaemon_registerXPCActivities__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v2;
  dispatch_queue_t v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  dispatch_queue_t v8;

  v5 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v5) == 2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = dispatch_queue_create("com.apple.biome.prune-expired-events", v2);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__BMDaemon_registerXPCActivities__block_invoke_2;
    block[3] = &unk_1E2647868;
    v7 = v5;
    v8 = v3;
    v4 = v3;
    dispatch_sync(v4, block);

  }
}

void __33__BMDaemon_registerXPCActivities__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v2 = _os_activity_create(&dword_18D810000, "com.apple.biome.prune-expired-events", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  __biome_log_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D810000, v3, OS_LOG_TYPE_INFO, "running activity \"com.apple.biome.prune-expired-events\", buf, 2u);
  }

  v4 = objc_alloc(MEMORY[0x1E0D01D50]);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", "com.apple.biome.prune-expired-events");
  v7 = (void *)objc_msgSend(v4, "initWithActivity:activityName:", v5, v6);

  +[BMDaemon prunePublicStreamsWithActivity:](BMDaemon, "prunePublicStreamsWithActivity:", v7);
  if ((objc_msgSend(v7, "didDefer") & 1) == 0)
  {
    +[BMDaemon pruneRestrictedStreamsWithActivity:](BMDaemon, "pruneRestrictedStreamsWithActivity:", v7);
    if ((objc_msgSend(v7, "didDefer") & 1) == 0)
    {
      +[BMDaemon pruneTemporaryFiles](BMDaemon, "pruneTemporaryFiles");
      if ((objc_msgSend(v7, "didDefer") & 1) == 0)
      {
        +[BMDaemon pruneFeatureStoreWithActivity:](BMDaemon, "pruneFeatureStoreWithActivity:", v7);
        objc_msgSend(v7, "setContinue");
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __33__BMDaemon_registerXPCActivities__block_invoke_64;
        v8[3] = &unk_1E2647868;
        v9 = *(id *)(a1 + 40);
        v10 = v7;
        +[BMDaemon registerWithSpaceAttributionWithActivity:completion:](BMDaemon, "registerWithSpaceAttributionWithActivity:completion:", v10, v8);

      }
    }
  }

  os_activity_scope_leave(&state);
}

void __33__BMDaemon_registerXPCActivities__block_invoke_64(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__BMDaemon_registerXPCActivities__block_invoke_2_65;
  block[3] = &unk_1E2647C48;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

uint64_t __33__BMDaemon_registerXPCActivities__block_invoke_2_65(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "didDefer");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setDone");
  return result;
}

+ (void)runLaunchTasks
{
  id v2;

  if (!+[BMDaemon isAgent](BMDaemon, "isAgent"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0D01D40]);
    objc_msgSend(v2, "migrate");

  }
}

- (void)setUpNotificationHandler
{
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)self->_internalQueue, &__block_literal_global_68);
}

- (BMComputeSourceServer)userSourceServer
{
  return self->_userSourceServer;
}

- (BMComputeSourceServer)systemSourceServer
{
  return self->_systemSourceServer;
}

- (BMComputeXPCPublisherServer)userPublisherServer
{
  return self->_userPublisherServer;
}

- (BMComputeXPCPublisherServer)systemPublisherServer
{
  return self->_systemPublisherServer;
}

- (BMViewEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (BMComputeXPCPublisherStorage)systemBookmarkStorage
{
  return self->_systemBookmarkStorage;
}

- (BMComputeXPCPublisherStorage)userBookmarkStorage
{
  return self->_userBookmarkStorage;
}

- (BMComputeSubscriptionSubstreamManager)subscriptionSubstreamManager
{
  return self->_subscriptionSubstreamManager;
}

- (NSMutableDictionary)activeSystemSubscriptionIdentifiers
{
  return self->_activeSystemSubscriptionIdentifiers;
}

- (void)setActiveSystemSubscriptionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_activeSystemSubscriptionIdentifiers, a3);
}

- (NSMutableDictionary)subscribedSystemStreams
{
  return self->_subscribedSystemStreams;
}

- (void)setSubscribedSystemStreams:(id)a3
{
  objc_storeStrong((id *)&self->_subscribedSystemStreams, a3);
}

- (BMComputeXPCPublisherClient)systemStreamsPublisherClient
{
  return self->_systemStreamsPublisherClient;
}

- (void)setSystemStreamsPublisherClient:(id)a3
{
  objc_storeStrong((id *)&self->_systemStreamsPublisherClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemStreamsPublisherClient, 0);
  objc_storeStrong((id *)&self->_subscribedSystemStreams, 0);
  objc_storeStrong((id *)&self->_activeSystemSubscriptionIdentifiers, 0);
  objc_storeStrong((id *)&self->_subscriptionSubstreamManager, 0);
  objc_storeStrong((id *)&self->_userBookmarkStorage, 0);
  objc_storeStrong((id *)&self->_systemBookmarkStorage, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_systemPublisherServer, 0);
  objc_storeStrong((id *)&self->_userPublisherServer, 0);
  objc_storeStrong((id *)&self->_systemSourceServer, 0);
  objc_storeStrong((id *)&self->_userSourceServer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

+ (void)donateLaunchEventsWithQueue:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  id v9;

  v4 = a3;
  dispatch_assert_queue_V2(v4);
  v5 = (void *)MEMORY[0x1E0D81590];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__BMDaemon_LaunchDonations__donateLaunchEventsWithQueue___block_invoke;
  v7[3] = &unk_1E2648B50;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(v5, "runBlockWhenDeviceIsClassCUnlocked:", v7);

}

void __57__BMDaemon_LaunchDonations__donateLaunchEventsWithQueue___block_invoke(uint64_t a1)
{
  NSObject *v3;
  void *v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  *(_QWORD *)v8 = 0x1500000001;
  v5 = 16;
  v6 = 0;
  if (sysctl(v8, 2u, &v6, &v5, 0, 0) == -1 || v6 == 0)
  {
    __biome_log_for_category();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __57__BMDaemon_LaunchDonations__donateLaunchEventsWithQueue___block_invoke_cold_1();

  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)(int)v7 / 1000000.0 + (double)v6);
    objc_msgSend(*(id *)(a1 + 40), "_donateDeviceMetadataWithBootDate:", v4);
    objc_msgSend(*(id *)(a1 + 40), "_donateDeviceBootSessionEventsWithBootDate:queue:", v4, *(_QWORD *)(a1 + 32));

  }
}

+ (void)_donateDeviceMetadataWithBootDate:(id)a3
{
  id v3;
  NSObject *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  id v22;
  unint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 buf;
  Class (*v39)(uint64_t);
  void *v40;
  uint64_t *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18D810000, v4, OS_LOG_TYPE_DEFAULT, "Starting _donateDeviceMetadataWithBootDate, with bootDate: %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v6 = v5;
  _BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "Device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "Metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D01CF8], "osBuildVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01CF8], "osBuildSupplementalVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@-%@"), v14, v16);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringForKey:", CFSTR("LastCombinedBuild"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19 || (objc_msgSend(v17, "isEqualToString:", v19) & 1) == 0)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x2050000000;
    v20 = (void *)getBMDeviceMetadataClass_softClass;
    v37 = getBMDeviceMetadataClass_softClass;
    if (!getBMDeviceMetadataClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v39 = __getBMDeviceMetadataClass_block_invoke;
      v40 = &unk_1E2647EA8;
      v41 = &v34;
      __getBMDeviceMetadataClass_block_invoke((uint64_t)&buf);
      v20 = (void *)v35[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v34, 8);
    v22 = [v21 alloc];
    v23 = objc_msgSend(MEMORY[0x1E0D01CF8], "platform");
    if (v23 >= 9)
    {
      __biome_log_for_category();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        +[BMDaemon(LaunchDonations) _donateDeviceMetadataWithBootDate:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

      v23 = 0;
    }
    v31 = (void *)objc_msgSend(v22, "initWithName:build:platform:supplementalBuild:rapidSecurityResponsePreReboot:", 0, v10, v23, v11, 0);
    objc_msgSend(v9, "source");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sendEvent:timestamp:", v31, v6);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKey:", v17, CFSTR("LastCombinedBuild"));

  }
}

+ (void)_donateDeviceBootSessionEventsWithBootDate:(id)a3 queue:(id)a4
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  BMPublisherOptions *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  char v24;
  NSObject *v25;
  id v26;
  void *v27;
  char v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  id v38;
  NSObject *v39;
  dispatch_queue_t v40;
  NSObject *v41;
  NSObject *target;
  id v43;
  void *v44;
  _QWORD v45[4];
  NSObject *v46;
  id v47;
  id v48;
  NSObject *v49;
  id v50;
  _QWORD *v51;
  _QWORD *v52;
  __int128 *p_buf;
  _QWORD *v54;
  os_signpost_id_t v55;
  _QWORD v56[4];
  id v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  id v62;
  uint8_t v63[16];
  id location;
  _QWORD v65[3];
  char v66;
  _QWORD v67[3];
  int v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[5];
  id v72;
  _QWORD v73[5];
  _QWORD v74[5];
  _QWORD v75[5];
  uint64_t v76;
  _QWORD v77[4];
  id v78;
  _BYTE v79[24];
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  __int128 buf;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  target = a4;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v43;
    _os_log_impl(&dword_18D810000, v5, OS_LOG_TYPE_DEFAULT, "Starting _donateDeviceBootSessionEventsWithBootDate, with bootDate: %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "bm_bootSessionUUID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v44;
    _os_log_impl(&dword_18D810000, v6, OS_LOG_TYPE_DEFAULT, "Current boot session UUID found: %@", (uint8_t *)&buf, 0xCu);
  }

  _BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "Device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "BootSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[BMPublisherOptions initWithStartDate:endDate:maxEvents:lastN:reversed:]([BMPublisherOptions alloc], "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 1, 1, 0);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__3;
  v86 = __Block_byref_object_dispose__3;
  v87 = 0;
  v76 = 0;
  v77[0] = &v76;
  v77[1] = 0x3032000000;
  v77[2] = __Block_byref_object_copy__3;
  v77[3] = __Block_byref_object_dispose__3;
  v78 = 0;
  objc_msgSend(v9, "publisherWithUseCase:options:", *MEMORY[0x1E0D01C98], v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "last");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke;
  v75[3] = &unk_1E2648B78;
  v75[4] = &v76;
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_2;
  v74[3] = &unk_1E2648BA0;
  v74[4] = &buf;
  v13 = (id)objc_msgSend(v12, "sinkWithCompletion:receiveInput:", v75, v74);

  if (!*(_QWORD *)(v77[0] + 40))
  {
    objc_msgSend(v9, "source");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc((Class)getBMDeviceBootSessionClass()), "initWithBootUUID:starting:", v44, &unk_1E26D3678);
    if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      objc_msgSend(v43, "timeIntervalSinceReferenceDate");
      -[NSObject sendEvent:timestamp:](v14, "sendEvent:timestamp:", v15);
      goto LABEL_31;
    }
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "eventBody");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bootUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "timestamp");
      *(_DWORD *)v79 = 138412546;
      *(_QWORD *)&v79[4] = v18;
      *(_WORD *)&v79[12] = 2048;
      *(_QWORD *)&v79[14] = v19;
      _os_log_impl(&dword_18D810000, v16, OS_LOG_TYPE_DEFAULT, "Previously stored device boot session: %@ at time: %f, in the biome daemon launch donation", v79, 0x16u);

    }
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "eventBody");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bootUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqual:", v44);

    if (v22)
    {
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "eventBody");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "starting");

      if ((v24 & 1) == 0)
      {
        __biome_log_for_category();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          +[BMDaemon(LaunchDonations) _donateDeviceBootSessionEventsWithBootDate:queue:].cold.1();
        goto LABEL_30;
      }
LABEL_31:

      goto LABEL_32;
    }
    v26 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "timestamp");
    v25 = objc_msgSend(v26, "initWithTimeIntervalSinceReferenceDate:");
    if (objc_msgSend(v43, "compare:", v25) == -1)
    {
      __biome_log_for_category();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        +[BMDaemon(LaunchDonations) _donateDeviceBootSessionEventsWithBootDate:queue:].cold.2((uint64_t)v43, (uint64_t)v25, v29);
    }
    else
    {
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "eventBody");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "starting");

      if ((v28 & 1) == 0)
      {
        objc_msgSend(v43, "timeIntervalSinceReferenceDate");
        -[NSObject sendEvent:timestamp:](v14, "sendEvent:timestamp:", v15);
LABEL_30:

        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x1E0D44698], "localStore");
      v29 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v79 = 0;
      *(_QWORD *)&v79[8] = v79;
      *(_QWORD *)&v79[16] = 0x3032000000;
      v80 = __Block_byref_object_copy__3;
      v81 = __Block_byref_object_dispose__3;
      v82 = 0;
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_15;
      v73[3] = &unk_1E2648BC8;
      v73[4] = v79;
      -[NSObject prepareWithCompletionHandler:](v29, "prepareWithCompletionHandler:", v73);
      if (*(_QWORD *)(*(_QWORD *)&v79[8] + 40))
      {
        v30 = objc_alloc(MEMORY[0x1E0D446A0]);
        v31 = objc_msgSend(v30, "initWithSource:", *(_QWORD *)(*(_QWORD *)&v79[8] + 40));
        -[NSObject setFlags:](v31, "setFlags:", 56);
        v41 = v31;
        dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 1);
        v32 = objc_claimAutoreleasedReturnValue();
        v40 = dispatch_queue_create_with_target_V2("com.apple.BMDaemon+LaunchDonations.DeviceBootSession", v32, target);

        -[NSObject _setQueue:](v41, "_setQueue:", v40);
        v71[0] = 0;
        v71[1] = v71;
        v71[2] = 0x3032000000;
        v71[3] = __Block_byref_object_copy__3;
        v71[4] = __Block_byref_object_dispose__3;
        v72 = 0;
        v69[0] = 0;
        v69[1] = v69;
        v69[2] = 0x3032000000;
        v69[3] = __Block_byref_object_copy__3;
        v69[4] = __Block_byref_object_dispose__3;
        v70 = 0;
        v67[0] = 0;
        v67[1] = v67;
        v67[2] = 0x2020000000;
        v68 = 0;
        v65[0] = 0;
        v65[1] = v65;
        v65[2] = 0x2020000000;
        v66 = 0;
        objc_initWeak(&location, v41);
        __biome_log_for_category();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = os_signpost_id_generate(v33);

        __biome_log_for_category();
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
        {
          *(_WORD *)v63 = 0;
          _os_signpost_emit_with_name_impl(&dword_18D810000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v34, "BootSessionLogReading", ", v63, 2u);
        }

        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_19;
        v56[3] = &unk_1E2648BF0;
        v58 = v65;
        v59 = v67;
        objc_copyWeak(&v62, &location);
        v37 = v44;
        v57 = v37;
        v60 = v71;
        v61 = v69;
        -[NSObject setEventHandler:](v41, "setEventHandler:", v56);
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_21;
        v45[3] = &unk_1E2648C18;
        v54 = v69;
        v55 = v34;
        v51 = v67;
        v52 = v71;
        p_buf = &buf;
        v46 = v14;
        v38 = v43;
        v47 = v38;
        v48 = v15;
        v49 = v25;
        v50 = v37;
        -[NSObject setInvalidationHandler:](v41, "setInvalidationHandler:", v45);
        -[NSObject activateStreamFromDate:](v41, "activateStreamFromDate:", v38);

        objc_destroyWeak(&v62);
        objc_destroyWeak(&location);
        _Block_object_dispose(v65, 8);
        _Block_object_dispose(v67, 8);
        _Block_object_dispose(v69, 8);

        _Block_object_dispose(v71, 8);
        v39 = v41;
      }
      else
      {
        __biome_log_for_category();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          +[BMDaemon(LaunchDonations) _donateDeviceBootSessionEventsWithBootDate:queue:].cold.3();
      }

      _Block_object_dispose(v79, 8);
    }

    goto LABEL_30;
  }
  __biome_log_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    +[BMDaemon(LaunchDonations) _donateDeviceBootSessionEventsWithBootDate:queue:].cold.4((uint64_t)v77, v14);
LABEL_32:

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&buf, 8);

}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v7, "error");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_15_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v5;

}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id WeakRetained;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(_DWORD *)(v5 + 24);
    if (v6 < 500)
    {
      *(_DWORD *)(v5 + 24) = v6 + 1;
      objc_msgSend(v3, "bootUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412546;
        v14 = v9;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_18D810000, v11, OS_LOG_TYPE_DEFAULT, "Found log with eventBootUUID: %@, at eventDate: %@", (uint8_t *)&v13, 0x16u);
      }

      if ((objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v9);
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v10);
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
        objc_msgSend(WeakRetained, "invalidate");

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      }

    }
    else
    {
      __biome_log_for_category();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_19_cold_1(a1 + 48, v7);

      v8 = objc_loadWeakRetained((id *)(a1 + 72));
      objc_msgSend(v8, "invalidate");

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }

}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_21(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  id *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  _DWORD v29[2];
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 104);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v29[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_18D810000, v7, OS_SIGNPOST_INTERVAL_END, v8, "BootSessionLogReading", ", (uint8_t *)v29, 2u);
  }

  if ((unint64_t)(a2 - 6) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_21_cold_5((uint64_t)v5, a2, v9);

  }
  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v29[0] = 67109378;
    v29[1] = v11;
    v30 = 2112;
    v31 = v12;
    _os_log_impl(&dword_18D810000, v10, OS_LOG_TYPE_DEFAULT, "Found the previous boot session after viewing %d past logs in biome daemon launch donation, previous boot session: %@", (uint8_t *)v29, 0x12u);
  }

  v13 = objc_alloc((Class)getBMDeviceBootSessionClass());
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "eventBody");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bootUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithBootUUID:starting:", v15, &unk_1E26D3690);

  v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (!v17 || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
  {
    __biome_log_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_21_cold_1();

    goto LABEL_22;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "eventBody");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bootUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v17, "isEqual:", v19);

  if ((v20 & 1) == 0)
  {
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_21_cold_4();

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "compare:", *(_QWORD *)(a1 + 56)) == -1)
  {
    __biome_log_for_category();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_21_cold_2();

LABEL_22:
    v22 = (id *)(a1 + 40);
    goto LABEL_23;
  }
  v22 = (id *)(a1 + 40);
  if (objc_msgSend(*(id *)(a1 + 40), "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40)) == -1)
  {
    __biome_log_for_category();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_21_cold_3();

  }
  else
  {
    v22 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  }
LABEL_23:
  v24 = *(void **)(a1 + 32);
  objc_msgSend(*v22, "timeIntervalSinceReferenceDate");
  objc_msgSend(v24, "sendEvent:timestamp:", v16);
  v25 = *(_QWORD *)(a1 + 48);
  v26 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v26, "sendEvent:timestamp:", v25);

}

+ (void)prunePublicStreamsWithActivity:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01D10], "pathForStreamType:domain:", 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01D10], "pathForStreamType:domain:", 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeItemAtPath:error:", v5, 0);

}

+ (void)pruneRestrictedStreamsWithActivity:(id)a3
{
  id v4;
  NSObject *v5;
  os_activity_scope_state_s v6;

  v4 = a3;
  v5 = _os_activity_create(&dword_18D810000, "Pruning restricted streams", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v5, &v6);
  objc_msgSend(a1, "pruneRestrictedStreamsInDomain:account:activity:", 0, 0, v4);
  objc_msgSend(a1, "pruneRestrictedStreamsInDomain:account:activity:", 1, 0, v4);
  os_activity_scope_leave(&v6);

}

+ (id)loadDKStreamNameToTTL
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v18;
  uint64_t v19;
  id obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[128];
  uint8_t v35[128];
  __int128 buf;
  Class (*v37)(uint64_t);
  void *v38;
  uint64_t *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v2 = (void *)get_CDEventStreamsClass_softClass_0;
  v33 = get_CDEventStreamsClass_softClass_0;
  if (!get_CDEventStreamsClass_softClass_0)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v37 = __get_CDEventStreamsClass_block_invoke_0;
    v38 = &unk_1E2647EA8;
    v39 = &v30;
    __get_CDEventStreamsClass_block_invoke_0((uint64_t)&buf);
    v2 = (void *)v31[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v30, 8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "ephemeralitySchedule");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA70];
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v27;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v27 != v18)
        {
          v7 = v6;
          objc_enumerationMutation(obj);
          v6 = v7;
        }
        v21 = v6;
        v8 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v6);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(obj, "objectForKeyedSubscript:", v8, v18);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(v9);
              v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
              +[BMDKEventStream streamNameFromDKStreamName:](BMDKEventStream, "streamNameFromDKStreamName:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = v14;
              if (v14 && objc_msgSend(v14, "length"))
              {
                objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v15);
              }
              else
              {
                __biome_log_for_category();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(buf) = 138543362;
                  *(_QWORD *)((char *)&buf + 4) = v13;
                  _os_log_error_impl(&dword_18D810000, v16, OS_LOG_TYPE_ERROR, "Unable to convert DK stream identifier to Biome stream identifier: %{public}@", (uint8_t *)&buf, 0xCu);
                }

              }
            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
          }
          while (v10);
        }

        v6 = v21 + 1;
      }
      while (v21 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v19);
  }

  return v5;
}

+ (void)pruneRestrictedStreamsInDomain:(unint64_t)a3 account:(id)a4 activity:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  BOOL v23;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  double v47;
  void *v48;
  NSObject *v49;
  BMStreamConfiguration *v50;
  BMStream *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  NSObject *obj;
  unint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  id v73;
  unsigned __int8 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  unint64_t v80;
  __int16 v81;
  double v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  id v86;
  int v87;
  uint64_t v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v65 = a5;
  +[BMDaemon loadDKStreamNameToTTL](BMDaemon, "loadDKStreamNameToTTL");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(MEMORY[0x1E0D01D10], "pathForSharedSyncWithAccount:streamType:domain:", v7, 2, a3);
  else
    objc_msgSend(MEMORY[0x1E0D01D10], "pathForStreamType:domain:", 2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v80 = (unint64_t)v10;
    _os_log_impl(&dword_18D810000, v9, OS_LOG_TYPE_DEFAULT, "Started pruning restricted streams in directory: %{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentsOfDirectoryAtPath:error:", v8, 0);
  v12 = objc_claimAutoreleasedReturnValue();

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v60 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "bm_shuffledArrayWithArray:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v71 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
  if (v71)
  {
    v70 = *(_QWORD *)v76;
    v62 = *MEMORY[0x1E0D02500];
    v63 = v8;
    v64 = v7;
    obj = v13;
    v67 = a3;
LABEL_8:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v76 != v70)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v14);
      v16 = (void *)MEMORY[0x193FECFB4]();
      v74 = 0;
      objc_msgSend(v8, "stringByAppendingPathComponent:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "fileExistsAtPath:isDirectory:", v17, &v74);

      v20 = v74;
      __biome_log_for_category();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v19)
        v23 = v20 == 0;
      else
        v23 = 1;
      if (v23)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          +[BMDaemon(Pruning) pruneRestrictedStreamsInDomain:account:activity:].cold.1(&v87, (uint64_t)v17, &v88);

        goto LABEL_50;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v80 = (unint64_t)v15;
        _os_log_impl(&dword_18D810000, v22, OS_LOG_TYPE_INFO, "Pruning stream: %{public}@", buf, 0xCu);
      }

      BiomeLibraryNodeBridge();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = 0;
      v69 = v25;
      objc_msgSend(v25, "streamWithIdentifier:error:", v15, &v73);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v73;
      v68 = v27;
      if ((objc_msgSend(v15, "hasPrefix:", CFSTR("_DKEvent.")) & 1) != 0 || !v26 || v27)
        break;
      objc_msgSend(v26, "configuration");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "storeConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "domain");

      v23 = v30 == v67;
      a3 = v67;
      if (v23)
      {
        objc_msgSend(v26, "executePruningPolicyForAccount:", v7);
        goto LABEL_48;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0;
      objc_msgSend(v38, "removeItemAtPath:error:", v17, &v72);
      v39 = v72;

      __biome_log_for_category();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v26, "configuration");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "storeConfig");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "domain");
        BMStringForServiceDomain();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        BMStringForServiceDomain();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v80 = (unint64_t)v15;
        v81 = 2112;
        v82 = *(double *)&v53;
        v83 = 2112;
        v84 = v54;
        v85 = 2112;
        v86 = v39;
        _os_log_error_impl(&dword_18D810000, v40, OS_LOG_TYPE_ERROR, "Removing directory for stream %@ with library domain %@ found in %@ domain stream folder, remove error: %@", buf, 0x2Au);

        a3 = v67;
        v8 = v63;
        v7 = v64;
      }

      v43 = v68;
      v42 = v69;
LABEL_49:

LABEL_50:
      objc_autoreleasePoolPop(v16);
      if (v71 == ++v14)
      {
        v13 = obj;
        v71 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
        if (v71)
          goto LABEL_8;
        goto LABEL_52;
      }
    }
    v31 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newRestrictedStreamWithSegmentSize:protectionClass:domain:", v62, 3, a3);
    if (objc_msgSend(v15, "hasPrefix:", CFSTR("_DKEvent.")))
    {
      v32 = objc_opt_class();
      objc_msgSend(v61, "objectForKeyedSubscript:", v15);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (!v33 || !objc_msgSend(v33, "unsignedLongValue"))
      {
        v35 = 2419200.0;
        v37 = 52428800;
        goto LABEL_45;
      }
      v35 = (double)(unint64_t)objc_msgSend(v34, "unsignedLongValue");
      __biome_log_for_category();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        v80 = (unint64_t)v15;
        v81 = 2048;
        v82 = v35;
        _os_log_debug_impl(&dword_18D810000, v36, OS_LOG_TYPE_DEBUG, "Custom setting for shimmed stream %{public}@ ttl %f", buf, 0x16u);
      }
      v37 = 52428800;
    }
    else
    {
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024D0]), "initWithStream:permission:config:includeTombstones:", v15, 2, v31, 0);
      objc_msgSend(v34, "metadata");
      v36 = objc_claimAutoreleasedReturnValue();
      -[NSObject pruningPolicy](v36, "pruningPolicy");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "maxStreamSize");
      if (v45)
        v37 = v45;
      else
        v37 = 52428800;

      -[NSObject pruningPolicy](v36, "pruningPolicy");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "maxAge");
      if (v47 == 0.0)
        v35 = 2419200.0;
      else
        v35 = v47;

      v32 = 0;
    }

LABEL_45:
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 0, 0, v37, v35);
    objc_msgSend(v31, "setPruningPolicy:", v48);
    __biome_log_for_category();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v80 = (unint64_t)v35;
      v81 = 2048;
      v82 = *(double *)&v37;
      _os_log_impl(&dword_18D810000, v49, OS_LOG_TYPE_INFO, "Pruning policy: maxAge, %llu, maxStreamSize, %llu", buf, 0x16u);
    }

    v50 = -[BMStreamConfiguration initWithStreamIdentifier:eventClass:storeConfig:]([BMStreamConfiguration alloc], "initWithStreamIdentifier:eventClass:storeConfig:", v15, v32, v31);
    v51 = -[BMStreamBase initWithIdentifier:schema:configuration:]([BMStream alloc], "initWithIdentifier:schema:configuration:", v15, 0, v50);
    v7 = v64;
    -[BMStreamBase executePruningPolicyForAccount:](v51, "executePruningPolicyForAccount:", v64);

    v8 = v63;
    a3 = v67;
LABEL_48:
    v43 = v68;
    v42 = v69;
    if (objc_msgSend(v65, "didDefer"))
    {
      __biome_log_for_category();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18D810000, v58, OS_LOG_TYPE_DEFAULT, "Pausing pruning of restricted streams due to xpc activity deferral", buf, 2u);
      }

      objc_autoreleasePoolPop(v16);
      v57 = v60;
      v55 = obj;
      goto LABEL_58;
    }
    goto LABEL_49;
  }
LABEL_52:

  __biome_log_for_category();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v80 = (unint64_t)v56;
    _os_log_impl(&dword_18D810000, v55, OS_LOG_TYPE_DEFAULT, "Done pruning restricted streams in directory: %{public}@", buf, 0xCu);

  }
  v57 = v60;
LABEL_58:

}

+ (void)prunePrivateStreamDirectory:(id)a3 maxAge:(double)a4 maxStreamSize:(unint64_t)a5 activity:(id)a6
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  BOOL v26;
  BMStoreStream *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v34;
  id v35;
  NSObject *obj;
  unsigned __int8 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[4];
  void *v43;
  _BYTE v44[128];
  int buf;
  _QWORD v46[5];

  *(_QWORD *)((char *)&v46[2] + 4) = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35 = a6;
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    buf = 138543362;
    v46[0] = v10;
    _os_log_impl(&dword_18D810000, v9, OS_LOG_TYPE_DEFAULT, "Started pruning private streams in directory: %{public}@", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentsOfDirectoryAtPath:error:", v8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 0, 0, a5, a4);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = v12;
  v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v39;
    obj = v13;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x193FECFB4]();
        v37 = 0;
        objc_msgSend(v8, "stringByAppendingPathComponent:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "fileExistsAtPath:isDirectory:", v20, &v37);

        v23 = v37;
        __biome_log_for_category();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v22)
          v26 = v23 == 0;
        else
          v26 = 1;
        if (v26)
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            +[BMDaemon(Pruning) pruneRestrictedStreamsInDomain:account:activity:].cold.1(&buf, (uint64_t)v20, v46);
        }
        else
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v42 = 138543362;
            v43 = v18;
            _os_log_impl(&dword_18D810000, v25, OS_LOG_TYPE_INFO, "Pruning stream: %{public}@", v42, 0xCu);
          }

          v25 = objc_msgSend(MEMORY[0x1E0D024C0], "newPrivateStreamDefaultConfigurationWithStoreBasePath:", v8);
          -[NSObject setPruningPolicy:](v25, "setPruningPolicy:", v34);
          v28 = -[BMStoreStream initWithPrivateStreamIdentifier:storeConfig:eventDataClass:]([BMStoreStream alloc], "initWithPrivateStreamIdentifier:storeConfig:eventDataClass:", v18, v25, 0);
          -[BMStoreStream pruneStreamBySize:](v28, "pruneStreamBySize:", a5);
          -[BMStoreStream pruneExpiredEventsWithBlock:](v28, "pruneExpiredEventsWithBlock:", &__block_literal_global_17);
          if (objc_msgSend(v35, "didDefer"))
          {
            __biome_log_for_category();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v42 = 138543362;
              v43 = v32;
              _os_log_impl(&dword_18D810000, v31, OS_LOG_TYPE_DEFAULT, "Pausing pruning of private streams in directory: %{public}@ due to xpc activity deferral", v42, 0xCu);

            }
            objc_autoreleasePoolPop(v19);
            v13 = obj;
            v29 = obj;
            goto LABEL_26;
          }

        }
        objc_autoreleasePoolPop(v19);
      }
      v13 = obj;
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      if (v15)
        continue;
      break;
    }
  }

  __biome_log_for_category();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v42 = 138543362;
    v43 = v30;
    _os_log_impl(&dword_18D810000, v29, OS_LOG_TYPE_DEFAULT, "Done pruning private streams in directory: %{public}@", v42, 0xCu);

  }
LABEL_26:

}

+ (void)pruneFeatureStoreWithActivity:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  char v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_activity_scope_state_s v16;
  uint8_t buf[8];
  uint64_t v18;
  Class (*v19)(uint64_t);
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  v5 = _os_activity_create(&dword_18D810000, "Pruning FeatureStore", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v5, &v16);
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D810000, v6, OS_LOG_TYPE_DEFAULT, "Started pruning FeatureStore", buf, 2u);
  }

  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v7 = (void *)getFSFUtilsClass_softClass;
  v25 = getFSFUtilsClass_softClass;
  if (!getFSFUtilsClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __getFSFUtilsClass_block_invoke;
    v20 = &unk_1E2647EA8;
    v21 = &v22;
    __getFSFUtilsClass_block_invoke((uint64_t)buf);
    v7 = (void *)v23[3];
  }
  v8 = v7;
  _Block_object_dispose(&v22, 8);
  v9 = objc_opt_respondsToSelector();
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v8, "getStreamPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "getBaseLocalPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("biomeStream");
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v9 = 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "path");
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  if (v10)
  {
    objc_msgSend(a1, "prunePrivateStreamDirectory:maxAge:maxStreamSize:activity:", v10, 52428800, v4, 1209600.0);
  }
  else
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      +[BMDaemon(Pruning) pruneFeatureStoreWithActivity:].cold.1(v14);

  }
  __biome_log_for_category();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D810000, v15, OS_LOG_TYPE_DEFAULT, "Done pruning FeatureStore", buf, 2u);
  }

  os_activity_scope_leave(&v16);
}

+ (void)pruneTemporaryFiles
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  os_activity_scope_state_s state;
  _BYTE v19[128];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = _os_activity_create(&dword_18D810000, "Pruning temporary files", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D810000, v4, OS_LOG_TYPE_DEFAULT, "Started pruning temporary files", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D01D10], "biomeDirectoryForDomain:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  objc_msgSend(MEMORY[0x1E0D01D10], "biomeDirectoryForDomain:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(a1, "pruneTemporaryFilesInDirectory:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), (_QWORD)v13);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v9);
  }

  __biome_log_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D810000, v12, OS_LOG_TYPE_DEFAULT, "Done pruning temporary files", buf, 2u);
  }

  os_activity_scope_leave(&state);
}

+ (void)pruneTemporaryFilesInDirectory:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v27 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v3;
  objc_msgSend(v20, "subpathsOfDirectoryAtPath:error:", v3, &v27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v27;
  if (v4)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = v4;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v7)
    {
      v8 = v7;
      v19 = v4;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v11, "lastPathComponent");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "hasPrefix:", CFSTR(".tmp."));

          if (v13)
          {
            objc_msgSend(v21, "stringByAppendingPathComponent:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v5;
            v15 = objc_msgSend(v20, "removeItemAtPath:error:", v14, &v22);
            v16 = v22;

            if ((v15 & 1) == 0)
            {
              __biome_log_for_category();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v11);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v29 = v18;
                v30 = 2112;
                v31 = v16;
                _os_log_error_impl(&dword_18D810000, v17, OS_LOG_TYPE_ERROR, "Failed to prune temporary file: %{public}@, error: %@", buf, 0x16u);

              }
            }
            v5 = v16;
          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      }
      while (v8);
      v4 = v19;
    }
  }
  else
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[BMDaemon(Pruning) pruneTemporaryFilesInDirectory:].cold.1((uint64_t)v21, (uint64_t)v5, v6);
  }

}

+ (void)registerWithSpaceAttributionWithActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18D810000, "Register with SpaceAttribution", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__BMDaemon_Pruning__registerWithSpaceAttributionWithActivity_completion___block_invoke;
  v11[3] = &unk_1E2649540;
  v14 = a1;
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(a1, "_registerWithSpaceAttributionWithActivity:domain:completion:", v9, 0, v11);

  os_activity_scope_leave(&state);
}

uint64_t __73__BMDaemon_Pruning__registerWithSpaceAttributionWithActivity_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "_registerWithSpaceAttributionWithActivity:domain:completion:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));
}

+ (void)_registerWithSpaceAttributionWithActivity:(id)a3 domain:(unint64_t)a4 completion:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  objc_class *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void (**v31)(void);
  void *v32;
  id obj;
  uint64_t v34;
  void *v35;
  _QWORD v36[4];
  void (**v37)(void);
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t v47[128];
  _BYTE buf[24];
  void *v49;
  uint64_t *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v31 = (void (**)(void))a5;
  v32 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D01D10], "pathForStreamType:domain:", 2, a4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v35, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  v10 = v9;
  if (v9)
  {
    v34 = *(_QWORD *)v40;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v40 != v34)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x193FECFB4](v9);
        objc_msgSend(v35, "stringByAppendingPathComponent:", v12, v30);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v14, &v38);

        if (v38)
        {
          BiomeLibraryNodeBridge();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "streamWithIdentifier:error:", v12, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v17, "configuration");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "spaceAttribution");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = 0;
              v44 = &v43;
              v45 = 0x2050000000;
              v22 = (void *)getSAPathInfoClass_softClass;
              v46 = getSAPathInfoClass_softClass;
              if (!getSAPathInfoClass_softClass)
              {
                *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                *(_QWORD *)&buf[8] = 3221225472;
                *(_QWORD *)&buf[16] = __getSAPathInfoClass_block_invoke;
                v49 = &unk_1E2647EA8;
                v50 = &v43;
                __getSAPathInfoClass_block_invoke((uint64_t)buf);
                v22 = (void *)v44[3];
              }
              v23 = objc_retainAutorelease(v22);
              _Block_object_dispose(&v43, 8);
              v24 = (void *)objc_msgSend([v23 alloc], "initWithURL:", v21);
              objc_msgSend(v24, "setBundleID:", v20);
              __biome_log_for_category();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138478083;
                *(_QWORD *)&buf[4] = v14;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v20;
                _os_log_debug_impl(&dword_18D810000, v25, OS_LOG_TYPE_DEBUG, "Attributing path: %{private}@ to %@", buf, 0x16u);
              }

              objc_msgSend(v32, "addObject:", v24);
            }

          }
        }

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v10 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      v10 = v9;
    }
    while (v9);
  }

  if (objc_msgSend(v32, "count"))
  {
    v26 = (void *)MEMORY[0x193FECFB4]();
    v43 = 0;
    v44 = &v43;
    v45 = 0x2050000000;
    v27 = (void *)getSAPathManagerClass_softClass;
    v46 = getSAPathManagerClass_softClass;
    if (!getSAPathManagerClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getSAPathManagerClass_block_invoke;
      v49 = &unk_1E2647EA8;
      v50 = &v43;
      __getSAPathManagerClass_block_invoke((uint64_t)buf);
      v27 = (void *)v44[3];
    }
    v28 = objc_retainAutorelease(v27);
    _Block_object_dispose(&v43, 8);
    objc_msgSend(v28, "defaultManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __81__BMDaemon_Pruning___registerWithSpaceAttributionWithActivity_domain_completion___block_invoke;
      v36[3] = &unk_1E2649568;
      v37 = v31;
      objc_msgSend(v29, "registerPaths:completionHandler:", v32, v36);

    }
    else
    {
      v31[2]();
    }

    objc_autoreleasePoolPop(v26);
  }
  else
  {
    v31[2]();
  }

}

void __81__BMDaemon_Pruning___registerWithSpaceAttributionWithActivity_domain_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __81__BMDaemon_Pruning___registerWithSpaceAttributionWithActivity_domain_completion___block_invoke_cold_2((uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __81__BMDaemon_Pruning___registerWithSpaceAttributionWithActivity_domain_completion___block_invoke_cold_1(v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)initWithQueue:(uint8_t *)buf eventReporter:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "Notify post of %@ failed with status %@", buf, 0x16u);

}

void __40__BMDaemon_initWithQueue_eventReporter___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_18D810000, a1, a3, "System publisher server finished activating, now activating system source server", a5, a6, a7, a8, 0);
}

void __40__BMDaemon_initWithQueue_eventReporter___block_invoke_17_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_18D810000, a1, a3, "User publisher server finished activating, now activating user source server", a5, a6, a7, a8, 0);
}

- (void)_publisherServer
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_4_1(&dword_18D810000, a2, v4, "Found current connection, resolving publisher server based on service name: %@", (uint8_t *)&v5);

}

- (void)sendEventWithStreamIdentifier:timestamp:account:remoteName:storeEvent:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "Failed to report event donation to view orchestration system: %@ %@");
  OUTLINED_FUNCTION_5();
}

void __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke_cold_1(_QWORD *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = 138413058;
  v7 = v3;
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  v12 = 2112;
  v13 = a2;
  _os_log_debug_impl(&dword_18D810000, log, OS_LOG_TYPE_DEBUG, "Completed sink for subscription %@ based on new %@ event %@, completion: %@", (uint8_t *)&v6, 0x2Au);
}

- (void)eventsPrunedWithStreamIdentifier:account:remoteName:reason:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "Failed to report prune event to view orchestration system: %@ %@");
  OUTLINED_FUNCTION_5();
}

void __57__BMDaemon_LaunchDonations__donateLaunchEventsWithQueue___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_0(&dword_18D810000, v0, v1, "Failure to retrieve boot time on biome daemon launch donation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_15_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18D810000, a2, a3, "Failure to create OSLogEventSource on biome daemon launch donation with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_19_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "Failure to find the previous boot session within %d iterations.", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_2();
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_21_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "No previous boot session or boot session date found. This may have resulted in missing multiple boot sessions in biome daemon launch donation. prevBootSessionUUID: %@, prevBootSessionEndDate: %@");
  OUTLINED_FUNCTION_5();
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_21_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "The previously stored boot start boot session occurred after the its proposed end time. This should not be possible. Previously found boot session date: %@, previously stored device boot session date %@");
  OUTLINED_FUNCTION_5();
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_21_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "The previously found boot session occurred after the current boot session's start date in biome daemon launch donation. This should not be possible. Current boot session date: %@, previously found boot session date: %@");
  OUTLINED_FUNCTION_5();
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_21_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_0(&dword_18D810000, v0, v1, "The previous boot session was not the same as the previously stored boot session. This may have resulted in missing multiple boot sessions in biome daemon launch donation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_21_cold_5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_0_1(&dword_18D810000, a2, a3, "Failure to finish reading from OSLogEventStream due to %lu at position: %@ on biome daemon launch donation", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_5();
}

void __81__BMDaemon_Pruning___registerWithSpaceAttributionWithActivity_domain_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18D810000, log, OS_LOG_TYPE_DEBUG, "SpaceAttribution: Paths registered successfully", v1, 2u);
}

void __81__BMDaemon_Pruning___registerWithSpaceAttributionWithActivity_domain_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "SpaceAttribution: Failed to register paths with error %{private}@", (uint8_t *)&v2, 0xCu);
}

@end
