@implementation ATXAppIntentMonitor

- (void)updateActionPredictionPipelineForAppSession:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)os_transaction_create();
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ATXAppIntentMonitor _isAllowedDaemonDonationBundleId:](self, "_isAllowedDaemonDonationBundleId:", v8);
  __atxlog_handle_default();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "Donation Processing - Skipping back-query for %@ app session because it was an allowed app.", (uint8_t *)&v16, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_INFO, "Donation Processing - %@ is not an allowed bundle. Continuing with processing steps...", (uint8_t *)&v16, 0xCu);
    }

    -[ATXAppIntentMonitor processIntentDonationsDuringAppSessionForBundleId:startDate:endDate:globals:](self, "processIntentDonationsDuringAppSessionForBundleId:startDate:endDate:globals:", v8, v9, v10, v12);
    -[ATXAppIntentMonitor processNSUADonationsDuringAppSessionForBundleId:startDate:endDate:globals:](self, "processNSUADonationsDuringAppSessionForBundleId:startDate:endDate:globals:", v8, v9, v10, v12);
  }

}

- (void)processNSUADonationsDuringAppSessionForBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5 globals:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  NSObject *v36;
  uint64_t v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  id v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *obj;
  id v49;
  uint64_t v50;
  ATXAppIntentMonitor *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v53 = a6;
  if (-[ATXAppIntentMonitor shouldProcessNSUADonationsForSessionStartDate:](self, "shouldProcessNSUADonationsForSessionStartDate:", v11))
  {
    -[ATXAppIntentMonitor fetchNSUAEventsForAppSessionWithBundleId:startDate:endDate:](self, "fetchNSUAEventsForAppSessionWithBundleId:startDate:endDate:", v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = -[NSObject count](v13, "count");
    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      v51 = self;
      v52 = v10;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[ATXAppIntentMonitor processNSUADonationsDuringAppSessionForBundleId:startDate:endDate:globals:].cold.2(v13, v16);

      v50 = -[NSObject count](v13, "count");
      v56 = objc_opt_new();
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v47 = v13;
      v17 = v13;
      v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v62 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "action");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "userActivityString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              v24 = (void *)MEMORY[0x1E0CB37E8];
              -[NSObject objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "unsignedIntegerValue") + 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v26, v23);

            }
          }
          v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
        }
        while (v19);
      }

      __atxlog_handle_default();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[ATXAppIntentMonitor processIntentDonationsDuringAppSessionForBundleId:startDate:endDate:globals:].cold.1();

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      obj = v17;
      v55 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
      if (v55)
      {
        v54 = *(_QWORD *)v58;
        v49 = v12;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v58 != v54)
              objc_enumerationMutation(obj);
            v29 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v28);
            if (v29)
            {
              v30 = v11;
              objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * v28), "action");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "userActivityString");
              v32 = objc_claimAutoreleasedReturnValue();
              v33 = (void *)v32;
              v34 = &stru_1E82FDC98;
              if (v32)
                v34 = (__CFString *)v32;
              v35 = v34;

              __atxlog_handle_default();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v29, "intentType");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "startDate");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v66 = v45;
                v67 = 2112;
                v68 = v46;
                _os_log_debug_impl(&dword_1C9A3B000, v36, OS_LOG_TYPE_DEBUG, "Donation Processing - NSUA Event: %@ at Date: %@", buf, 0x16u);

              }
              v37 = (int)objc_msgSend(v53, "donationWeighingScheme");
              objc_msgSend(v53, "donationWeighingStrength");
              v39 = v38;
              -[NSObject objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", v35);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              +[_ATXActionUtils calculateWeightWith:strength:termFreq:docFreq:docLength:](_ATXActionUtils, "calculateWeightWith:strength:termFreq:docFreq:docLength:", v37, objc_msgSend(v40, "unsignedIntegerValue"), -[_ATXDuetHelper getDocFreqFor:contentKey:](v51->_duetHelper, "getDocFreqFor:contentKey:", v52, v35), v50, v39);
              *(float *)&v39 = v41;

              objc_msgSend(v53, "nsuaDonationWeight");
              v43 = v42 * *(float *)&v39;
              *(float *)&v43 = v43;
              v11 = v30;
              v44 = v30;
              v12 = v49;
              -[ATXAppIntentMonitor updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:](v51, "updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:", v29, v44, v49, v43);

            }
            ++v28;
          }
          while (v55 != v28);
          v55 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
        }
        while (v55);
      }

      v10 = v52;
      v13 = v47;
      v16 = v56;
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_INFO, "Donation Processing - Didn't find any NSUA events for query.", buf, 2u);
    }

  }
  else
  {
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v66 = v10;
      _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_INFO, "Donation Processing - == Don't need to process NSUA donations for %@ since no NSUAs were received recently. == ", buf, 0xCu);
    }
  }

}

- (void)processIntentDonationsDuringAppSessionForBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5 globals:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t j;
  void *v32;
  void *v33;
  NSObject *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  _ATXDuetHelper *duetHelper;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  NSObject *v46;
  ATXAppIntentMonitor *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSObject *obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v51 = a6;
  if (-[ATXAppIntentMonitor shouldProcessIntentDonationsForSessionStartDate:](self, "shouldProcessIntentDonationsForSessionStartDate:", v11))
  {
    -[ATXAppIntentMonitor fetchIntentEventsForAppSessionWithBundleId:startDate:endDate:](self, "fetchIntentEventsForAppSessionWithBundleId:startDate:endDate:", v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = -[NSObject count](v13, "count");
    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      v47 = self;
      v48 = v12;
      v49 = v11;
      v50 = v10;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[ATXAppIntentMonitor processIntentDonationsDuringAppSessionForBundleId:startDate:endDate:globals:].cold.2(v13, v16);

      v17 = -[NSObject count](v13, "count");
      v16 = objc_opt_new();
      v54 = v17;
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v17);
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v46 = v13;
      obj = v13;
      v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v57 != v21)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "intent");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (v23)
            {
              objc_msgSend(v23, "atx_hashApproximately");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "base64EncodedStringWithOptions:", 0);
              v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v26 = &stru_1E82FDC98;
            }
            objc_msgSend(v18, "addObject:", v26);
            v27 = (void *)MEMORY[0x1E0CB37E8];
            -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "unsignedIntegerValue") + 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v29, v26);

          }
          v20 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
        }
        while (v20);
      }

      __atxlog_handle_default();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[ATXAppIntentMonitor processIntentDonationsDuringAppSessionForBundleId:startDate:endDate:globals:].cold.1();

      v12 = v48;
      v11 = v49;
      if (v54)
      {
        for (j = 0; j != v54; ++j)
        {
          v32 = (void *)MEMORY[0x1CAA48B6C]();
          -[NSObject objectAtIndexedSubscript:](obj, "objectAtIndexedSubscript:", j);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            v53 = v32;
            __atxlog_handle_default();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v33, "intentType");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "startDate");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v61 = v44;
              v62 = 2112;
              v63 = v45;
              _os_log_debug_impl(&dword_1C9A3B000, v34, OS_LOG_TYPE_DEBUG, "Donation Processing - Intent Event: %@ at Date:%@", buf, 0x16u);

            }
            v52 = (int)objc_msgSend(v51, "donationWeighingScheme");
            objc_msgSend(v51, "donationWeighingStrength");
            v36 = v35;
            objc_msgSend(v18, "objectAtIndexedSubscript:", j);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "unsignedIntegerValue");
            duetHelper = v47->_duetHelper;
            objc_msgSend(v18, "objectAtIndexedSubscript:", j);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            +[_ATXActionUtils calculateWeightWith:strength:termFreq:docFreq:docLength:](_ATXActionUtils, "calculateWeightWith:strength:termFreq:docFreq:docLength:", v52, v39, -[_ATXDuetHelper getDocFreqFor:contentKey:](duetHelper, "getDocFreqFor:contentKey:", v50, v41), v54, v36);
            *(float *)&v36 = v42;

            LODWORD(v43) = LODWORD(v36);
            v12 = v48;
            v11 = v49;
            -[ATXAppIntentMonitor updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:](v47, "updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:", v33, v49, v48, v43);
            v32 = v53;
          }

          objc_autoreleasePoolPop(v32);
        }
      }

      v13 = v46;
      v10 = v50;
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_INFO, "Donation Processing - Didn't find any Intent events for query.", buf, 2u);
    }

  }
  else
  {
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v10;
      _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_INFO, "Donation Processing - == Don't need to process intent donations for %@ since no intents were received recently. ==", buf, 0xCu);
    }
  }

}

- (BOOL)shouldProcessIntentDonationsForSessionStartDate:(id)a3
{
  id v4;
  _CDLocalContext *context;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  context = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForIntentsDataDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDLocalContext lastModifiedDateForContextualKeyPath:](context, "lastModifiedDateForContextualKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ATXAppIntentMonitor adjustedStartDateForOneSecondFlooringWithAppSessionStartDate:](self, "adjustedStartDateForOneSecondFlooringWithAppSessionStartDate:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ATXAppIntentMonitor sessionStartedBeforeDonationForStartDate:latestDonationDate:](self, "sessionStartedBeforeDonationForStartDate:latestDonationDate:", v8, v7);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)fetchIntentEventsForAppSessionWithBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  ATXIntentStream *intentStream;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = (__CFString *)a3;
  v9 = a5;
  -[ATXAppIntentMonitor adjustedStartDateForOneSecondFlooringWithAppSessionStartDate:](self, "adjustedStartDateForOneSecondFlooringWithAppSessionStartDate:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppIntentMonitor adjustedEndDateForOneSecondFlooringWithAppSessionEndDate:](self, "adjustedEndDateForOneSecondFlooringWithAppSessionEndDate:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_default();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ATXAppIntentMonitor fetchIntentEventsForAppSessionWithBundleId:startDate:endDate:].cold.2();

  __atxlog_handle_default();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ATXAppIntentMonitor fetchIntentEventsForAppSessionWithBundleId:startDate:endDate:].cold.1();

  if ((-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("com.apple.mobilephone")) & 1) != 0
    || -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("com.apple.facetime")))
  {
    intentStream = self->_intentStream;
    v15 = CFSTR("com.apple.InCallService");
    v16 = v10;
    v17 = v11;
  }
  else
  {
    intentStream = self->_intentStream;
    v16 = v10;
    v17 = v11;
    v15 = v8;
  }
  -[ATXIntentStream getIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:](intentStream, "getIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:", v16, v17, 1, v15, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)shouldProcessNSUADonationsForSessionStartDate:(id)a3
{
  id v4;
  _CDLocalContext *context;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  context = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForUserActivityDataDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDLocalContext lastModifiedDateForContextualKeyPath:](context, "lastModifiedDateForContextualKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ATXAppIntentMonitor adjustedStartDateForOneSecondFlooringWithAppSessionStartDate:](self, "adjustedStartDateForOneSecondFlooringWithAppSessionStartDate:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ATXAppIntentMonitor sessionStartedBeforeDonationForStartDate:latestDonationDate:](self, "sessionStartedBeforeDonationForStartDate:latestDonationDate:", v8, v7);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)adjustedStartDateForOneSecondFlooringWithAppSessionStartDate:(id)a3
{
  return (id)objc_msgSend(a3, "dateByAddingTimeInterval:", -2.0);
}

- (BOOL)sessionStartedBeforeDonationForStartDate:(id)a3 latestDonationDate:(id)a4
{
  return objc_msgSend(a3, "atx_isBeforeDate:", a4);
}

- (id)adjustedEndDateForOneSecondFlooringWithAppSessionEndDate:(id)a3
{
  return (id)objc_msgSend(a3, "dateByAddingTimeInterval:", 2.0);
}

void __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke_cold_1(v2);

  }
}

- (ATXAppIntentMonitor)initWithAppLaunchHistogramManager:(id)a3 appInfoManager:(id)a4 appActionLaunchSequenceManager:(id)a5 dataStore:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  ATXAppIntentMonitor *v18;
  void *v20;
  id v21;

  v9 = a6;
  v21 = a5;
  v10 = a4;
  v11 = a3;
  v20 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  +[ATXPredictionContextBuilder sharedInstance](ATXPredictionContextBuilder, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v16 = (void *)objc_msgSend(v15, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v17 = (void *)objc_opt_new();
  v18 = -[ATXAppIntentMonitor initWithAppLaunchHistogramManager:appInfoManager:appActionLaunchSequenceManager:duetHelper:intentStream:activityStream:dataStore:predictionContextBuilder:userDefaults:safariIntentFilter:](self, "initWithAppLaunchHistogramManager:appInfoManager:appActionLaunchSequenceManager:duetHelper:intentStream:activityStream:dataStore:predictionContextBuilder:userDefaults:safariIntentFilter:", v11, v10, v21, v20, v12, v13, v9, v14, v16, v17);

  return v18;
}

- (ATXAppIntentMonitor)initWithAppLaunchHistogramManager:(id)a3 appInfoManager:(id)a4 appActionLaunchSequenceManager:(id)a5 duetHelper:(id)a6 intentStream:(id)a7 activityStream:(id)a8 dataStore:(id)a9 predictionContextBuilder:(id)a10 userDefaults:(id)a11 safariIntentFilter:(id)a12
{
  ATXAppIntentMonitor *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *appIntentHistoryQueue;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  ATXInternalAppRegistrationNotification *appRegistrationListener;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *donationQueue;
  void *v29;
  uint64_t v30;
  _PASSimpleCoalescingTimer *coalescedIntentOrActivityDeletion;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  PETScalarEventTracker *donatedActionsTracker;
  id v40;
  void *v41;
  uint64_t v42;
  PETDistributionEventTracker *donatedActionInCacheTracker;
  uint64_t v44;
  NSObject *v45;
  id v47;
  NSObject *v48;
  id obja;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  _QWORD block[4];
  ATXAppIntentMonitor *v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD aBlock[4];
  id v68;
  id location;
  objc_super v70;
  _QWORD v71[3];
  _QWORD v72[4];

  v72[2] = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v51 = a4;
  v52 = a5;
  v53 = a6;
  v54 = a7;
  v55 = a8;
  v56 = a9;
  v57 = a10;
  v58 = a11;
  v59 = a12;
  v70.receiver = self;
  v70.super_class = (Class)ATXAppIntentMonitor;
  v18 = -[ATXAppIntentMonitor init](&v70, sel_init);
  if (v18)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.duetexpertcenter.AppPredictionExpert.AppIntentHistory", v19);
    appIntentHistoryQueue = v18->_appIntentHistoryQueue;
    v18->_appIntentHistoryQueue = (OS_dispatch_queue *)v20;

    if (!v60)
    {
      __atxlog_handle_default();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[ATXAppIntentMonitor initWithAppLaunchHistogramManager:appInfoManager:appActionLaunchSequenceManager:duetHelper:intentStream:activityStream:dataStore:predictionContextBuilder:userDefaults:safariIntentFilter:].cold.1();

    }
    objc_storeStrong((id *)&v18->_appLaunchHistogramManager, a3);
    objc_storeStrong((id *)&v18->_dataStore, a9);
    objc_storeStrong((id *)&v18->_duetHelper, a6);
    objc_storeStrong((id *)&v18->_intentStream, a7);
    objc_storeStrong((id *)&v18->_activityStream, a8);
    objc_storeStrong((id *)&v18->_appInfoManager, a4);
    objc_storeStrong((id *)&v18->_appActionLaunchSequenceManager, a5);
    objc_storeStrong((id *)&v18->_predictionContextBuilder, a10);
    objc_storeStrong((id *)&v18->_userDefaults, a11);
    objc_initWeak(&location, v18);
    v23 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __209__ATXAppIntentMonitor_initWithAppLaunchHistogramManager_appInfoManager_appActionLaunchSequenceManager_duetHelper_intentStream_activityStream_dataStore_predictionContextBuilder_userDefaults_safariIntentFilter___block_invoke;
    aBlock[3] = &unk_1E82DAE70;
    objc_copyWeak(&v68, &location);
    obja = _Block_copy(aBlock);
    v24 = objc_opt_new();
    appRegistrationListener = v18->_appRegistrationListener;
    v18->_appRegistrationListener = (ATXInternalAppRegistrationNotification *)v24;

    -[ATXInternalAppRegistrationNotification registerForNotificationsWithRegisterBlock:](v18->_appRegistrationListener, "registerForNotificationsWithRegisterBlock:", obja);
    objc_storeStrong((id *)&v18->_safariIntentQualityFilter, a12);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v26, QOS_CLASS_BACKGROUND, -1);
    v48 = objc_claimAutoreleasedReturnValue();

    v27 = dispatch_queue_create("com.apple.duetexpertcenter.AppPredictionExpert.AppIntentDonations", v48);
    donationQueue = v18->_donationQueue;
    v18->_donationQueue = (OS_dispatch_queue *)v27;

    v65[0] = v23;
    v65[1] = 3221225472;
    v65[2] = __209__ATXAppIntentMonitor_initWithAppLaunchHistogramManager_appInfoManager_appActionLaunchSequenceManager_duetHelper_intentStream_activityStream_dataStore_predictionContextBuilder_userDefaults_safariIntentFilter___block_invoke_2;
    v65[3] = &unk_1E82DB988;
    objc_copyWeak(&v66, &location);
    v47 = _Block_copy(v65);
    v18->deletionHandlerToken = -[_ATXDuetHelper registerDeletionHandler:queue:](v18->_duetHelper, "registerDeletionHandler:queue:", v47, v18->_appIntentHistoryQueue);
    v63[0] = v23;
    v63[1] = 3221225472;
    v63[2] = __209__ATXAppIntentMonitor_initWithAppLaunchHistogramManager_appInfoManager_appActionLaunchSequenceManager_duetHelper_intentStream_activityStream_dataStore_predictionContextBuilder_userDefaults_safariIntentFilter___block_invoke_3;
    v63[3] = &unk_1E82DB988;
    objc_copyWeak(&v64, &location);
    v29 = _Block_copy(v63);
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81618]), "initWithQueue:leewaySeconds:operation:", v18->_appIntentHistoryQueue, v29, 5.0);
    coalescedIntentOrActivityDeletion = v18->_coalescedIntentOrActivityDeletion;
    v18->_coalescedIntentOrActivityDeletion = (_PASSimpleCoalescingTimer *)v30;

    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("category"), &unk_1E83CF9F8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("ab"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("bundleId"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("activityType"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_alloc(MEMORY[0x1E0D80F38]);
    v72[0] = v32;
    v72[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "initWithFeatureId:event:registerProperties:", CFSTR("ActionPredictions"), CFSTR("action_donated"), v37);
    donatedActionsTracker = v18->_donatedActionsTracker;
    v18->_donatedActionsTracker = (PETScalarEventTracker *)v38;

    v40 = objc_alloc(MEMORY[0x1E0D80F18]);
    v71[0] = v34;
    v71[1] = v35;
    v71[2] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "initWithFeatureId:event:registerProperties:", CFSTR("ActionPredictions"), CFSTR("donation_in_cache"), v41);
    donatedActionInCacheTracker = v18->_donatedActionInCacheTracker;
    v18->_donatedActionInCacheTracker = (PETDistributionEventTracker *)v42;

    v44 = MEMORY[0x1E0C809B0];
    v45 = v18->_appIntentHistoryQueue;
    block[0] = v44;
    block[1] = 3221225472;
    block[2] = __209__ATXAppIntentMonitor_initWithAppLaunchHistogramManager_appInfoManager_appActionLaunchSequenceManager_duetHelper_intentStream_activityStream_dataStore_predictionContextBuilder_userDefaults_safariIntentFilter___block_invoke_4;
    block[3] = &unk_1E82DAC38;
    v62 = v18;
    dispatch_async(v45, block);

    objc_destroyWeak(&v64);
    objc_destroyWeak(&v66);

    objc_destroyWeak(&v68);
    objc_destroyWeak(&location);
  }

  return v18;
}

void __209__ATXAppIntentMonitor_initWithAppLaunchHistogramManager_appInfoManager_appActionLaunchSequenceManager_duetHelper_intentStream_activityStream_dataStore_predictionContextBuilder_userDefaults_safariIntentFilter___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleAppRegistrationForBundleIds:", v3);

}

void __209__ATXAppIntentMonitor_initWithAppLaunchHistogramManager_appInfoManager_appActionLaunchSequenceManager_duetHelper_intentStream_activityStream_dataStore_predictionContextBuilder_userDefaults_safariIntentFilter___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "coalescedHandleIntentOrActivityDeletion");

}

void __209__ATXAppIntentMonitor_initWithAppLaunchHistogramManager_appInfoManager_appActionLaunchSequenceManager_duetHelper_intentStream_activityStream_dataStore_predictionContextBuilder_userDefaults_safariIntentFilter___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleIntentOrActivityDeletion");

}

uint64_t __209__ATXAppIntentMonitor_initWithAppLaunchHistogramManager_appInfoManager_appActionLaunchSequenceManager_duetHelper_intentStream_activityStream_dataStore_predictionContextBuilder_userDefaults_safariIntentFilter___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleIntentOrActivityDeletion");
}

- (void)dealloc
{
  objc_super v3;

  -[ATXAppIntentMonitor stop](self, "stop");
  if (self->deletionHandlerToken)
    -[_ATXDuetHelper deregisterDeletionHandlerWithToken:](self->_duetHelper, "deregisterDeletionHandlerWithToken:");
  v3.receiver = self;
  v3.super_class = (Class)ATXAppIntentMonitor;
  -[ATXAppIntentMonitor dealloc](&v3, sel_dealloc);
}

- (void)handleAppRegistrationForBundleIds:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[_ATXDataStore regenerateSlotSetKeyForBundleId:](self->_dataStore, "regenerateSlotSetKeyForBundleId:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_listenToActivityStream
{
  BMBiomeScheduler *v3;
  BMBiomeScheduler *nsuaScheduler;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BPSSink *v9;
  BPSSink *nsuaSink;
  id v11;

  v3 = (BMBiomeScheduler *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("ATXAppIntentMonitor.NSUA"), self->_donationQueue);
  nsuaScheduler = self->_nsuaScheduler;
  self->_nsuaScheduler = v3;

  BiomeLibrary();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "App");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "atx_DSLPublisher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subscribeOn:", self->_nsuaScheduler);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sinkWithCompletion:receiveInput:", &__block_literal_global_98, &__block_literal_global_62_0);
  v9 = (BPSSink *)objc_claimAutoreleasedReturnValue();
  nsuaSink = self->_nsuaSink;
  self->_nsuaSink = v9;

}

void __46__ATXAppIntentMonitor__listenToActivityStream__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __46__ATXAppIntentMonitor__listenToActivityStream__block_invoke_cold_1(v2);

  }
}

void __46__ATXAppIntentMonitor__listenToActivityStream__block_invoke_60()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEFAULT, "Donation Processing - NSUA Received. No further processing until the end of the current app session.", v1, 2u);
  }

}

- (void)_listenToIntentStream
{
  BMBiomeScheduler *v3;
  BMBiomeScheduler *intentScheduler;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BPSSink *v10;
  BPSSink *intentSink;
  _QWORD v12[4];
  id v13;
  id location;

  objc_initWeak(&location, self);
  v3 = (BMBiomeScheduler *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("ATXAppIntentMonitor.Intent"), self->_donationQueue);
  intentScheduler = self->_intentScheduler;
  self->_intentScheduler = v3;

  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "App");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "atx_DSLPublisher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeOn:", self->_intentScheduler);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke_66;
  v12[3] = &unk_1E82DE280;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "sinkWithCompletion:receiveInput:", &__block_literal_global_65, v12);
  v10 = (BPSSink *)objc_claimAutoreleasedReturnValue();
  intentSink = self->_intentSink;
  self->_intentSink = v10;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)os_transaction_create();
      __atxlog_handle_default();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "bundleID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v16 = v8;
        v17 = 2048;
        v18 = 0x4014000000000000;
        _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Donation Processing - Intent received for %@. Waiting %.02f seconds before responding.", buf, 0x16u);

      }
      v9 = (void *)MEMORY[0x1E0D81598];
      v10 = WeakRetained[11];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke_69;
      v12[3] = &unk_1E82DB9D8;
      v12[4] = WeakRetained;
      v13 = v5;
      v14 = v6;
      v11 = v6;
      objc_msgSend(v9, "runAsyncOnQueue:afterDelaySeconds:block:", v10, v12, 5.0);

    }
    else
    {
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke_66_cold_1();
    }

  }
}

id __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke_69(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_respondToIntentStreamChangingWithIntent:", *(_QWORD *)(a1 + 40));
  return (id)objc_opt_self();
}

- (void)_listenToLinkActionStream
{
  BMBiomeScheduler *v3;
  BMBiomeScheduler *linkActionScheduler;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BPSSink *v11;
  BPSSink *linkActionSink;
  _QWORD v13[4];
  id v14;
  id location;

  objc_initWeak(&location, self);
  v3 = (BMBiomeScheduler *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("ATXAppIntentMonitor.Link"), self->_donationQueue);
  linkActionScheduler = self->_linkActionScheduler;
  self->_linkActionScheduler = v3;

  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "App");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Intents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "Transcript");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "atx_DSLPublisher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subscribeOn:", self->_linkActionScheduler);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke_73;
  v13[3] = &unk_1E82DE280;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v10, "sinkWithCompletion:receiveInput:", &__block_literal_global_72_1, v13);
  v11 = (BPSSink *)objc_claimAutoreleasedReturnValue();
  linkActionSink = self->_linkActionSink;
  self->_linkActionSink = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke_cold_1(v2);

  }
}

void __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke_73(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "executionUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "predictions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (!v8)
      {
LABEL_10:

        goto LABEL_11;
      }
      v9 = (void *)os_transaction_create();
      __atxlog_handle_default();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "bundleID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = v11;
        v20 = 2048;
        v21 = 0x4014000000000000;
        _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "Donation Processing - Link action received for %@. Waiting %.02f seconds before responding.", buf, 0x16u);

      }
      v12 = (void *)MEMORY[0x1E0D81598];
      v13 = WeakRetained[11];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke_75;
      v15[3] = &unk_1E82DB9D8;
      v15[4] = WeakRetained;
      v16 = v5;
      v17 = v9;
      v14 = v9;
      objc_msgSend(v12, "runAsyncOnQueue:afterDelaySeconds:block:", v13, v15, 5.0);

    }
    else
    {
      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke_73_cold_1();
    }

    goto LABEL_10;
  }
LABEL_11:

}

id __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke_75(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_respondToLinkActionStreamChangingWithInvocation:", *(_QWORD *)(a1 + 40));
  return (id)objc_opt_self();
}

- (void)_handleDonationImmediatelyForBundleId:(id)a3 sourceItemID:(id)a4 completedSuccessfully:(BOOL)a5 isDonatedBySiri:(BOOL)a6 isAllowedDaemonDonationBundleId:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v11 = a4;
  if (v9 && v8 || v7)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_INFO, "Donation Processing - Received either a completed Siri intent, or a donation from an allowed daemon donation.", v13, 2u);
    }

    if (v11)
      -[ATXAppIntentMonitor _handleCompletedIntentForForSourceItemID:atxIntentSource:](self, "_handleCompletedIntentForForSourceItemID:atxIntentSource:", v11, !v8);
  }

}

- (void)_respondToIntentStreamChangingWithIntent:(id)a3
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  _BOOL8 v9;
  _BOOL8 v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "bundleID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E82FDC98;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  v8 = objc_msgSend(v12, "donatedBySiri");
  v9 = -[ATXAppIntentMonitor _isAllowedDaemonDonationBundleId:](self, "_isAllowedDaemonDonationBundleId:", v7);
  v10 = v9;
  if ((v8 & 1) != 0 || v9)
  {
    objc_msgSend(v12, "itemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAppIntentMonitor _handleDonationImmediatelyForBundleId:sourceItemID:completedSuccessfully:isDonatedBySiri:isAllowedDaemonDonationBundleId:](self, "_handleDonationImmediatelyForBundleId:sourceItemID:completedSuccessfully:isDonatedBySiri:isAllowedDaemonDonationBundleId:", v7, v11, objc_msgSend(v12, "handlingStatus") == 4, v8, v10);

  }
}

- (void)_respondToLinkActionStreamChangingWithInvocation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  _BOOL8 v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint8_t v19[16];

  v4 = a3;
  objc_msgSend(v4, "bundleID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E82FDC98;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  v9 = objc_msgSend(v4, "source");
  v10 = -[ATXAppIntentMonitor _isAllowedDaemonDonationBundleId:](self, "_isAllowedDaemonDonationBundleId:", v8);
  v11 = v10;
  if (v9 == 3 || v10)
  {
    objc_msgSend(v4, "executionUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAppIntentMonitor _handleDonationImmediatelyForBundleId:sourceItemID:completedSuccessfully:isDonatedBySiri:isAllowedDaemonDonationBundleId:](self, "_handleDonationImmediatelyForBundleId:sourceItemID:completedSuccessfully:isDonatedBySiri:isAllowedDaemonDonationBundleId:", v8, v13, 1, v9 == 3, v11);

  }
  v14 = (void *)MEMORY[0x1E0CF9098];
  objc_msgSend(v4, "action");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v14, "isActionEligibleForSettingsSuggestionsWithBundleIdentifier:actionIdentifier:", v8, v16);

  if ((_DWORD)v14)
  {
    __atxlog_handle_settings_actions();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "Posting distributed notification about settings action recents refresh", v19, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:", *MEMORY[0x1E0CF8AF0], 0);

  }
}

- (void)_handleCompletedIntentForForSourceItemID:(id)a3 atxIntentSource:(int64_t)a4
{
  void *v5;
  double v6;
  void *v7;

  -[ATXIntentStream getIntentEventForSourceItemID:forSource:](self->_intentStream, "getIntentEventForSourceItemID:forSource:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    LODWORD(v6) = 1.0;
    v7 = v5;
    -[ATXAppIntentMonitor updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:](self, "updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:", v5, 0, 0, v6);
    v5 = v7;
  }

}

- (BOOL)_isAllowedDaemonDonationBundleId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "whitelistedDonationDaemonBundleIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  return v6;
}

- (void)_displayDonationOnLockscreenWithAction:(id)a3
{
  id v3;
  const __CFString *v4;
  int AppBooleanValue;
  int v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[14];
  Boolean keyExistsAndHasValidFormat;
  Boolean v12;

  v3 = a3;
  keyExistsAndHasValidFormat = 0;
  v4 = (const __CFString *)*MEMORY[0x1E0CF9510];
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("displayDonationsOnLockscreen"), (CFStringRef)*MEMORY[0x1E0CF9510], &keyExistsAndHasValidFormat);
  v12 = 0;
  v6 = CFPreferencesGetAppBooleanValue(CFSTR("displayLastDonationOnCoverSheet"), v4, &v12);
  if (AppBooleanValue)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (v7)
  {
    +[ATXActionNotificationServer sharedInstance](ATXActionNotificationServer, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAllActionPredictionNotificationsAndTrackEvent:recordFeedback:", 1, 0);
    objc_msgSend(v8, "postDemoOrDebugNotificationForATXAction:", v3);
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Posting notification for DEVELOPER switch", v10, 2u);
    }

  }
}

- (void)removeDonationFromLockscreenForAction:(id)a3
{
  id v3;
  const __CFString *v4;
  int AppBooleanValue;
  void *v6;
  Boolean keyExistsAndHasValidFormat;
  Boolean v8;

  v3 = a3;
  keyExistsAndHasValidFormat = 0;
  v4 = (const __CFString *)*MEMORY[0x1E0CF9510];
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("displayDonationsOnLockscreen"), (CFStringRef)*MEMORY[0x1E0CF9510], &keyExistsAndHasValidFormat);
  v8 = 0;
  if (!(AppBooleanValue | CFPreferencesGetAppBooleanValue(CFSTR("displayLastDonationOnCoverSheet"), v4, &v8)))
  {
    +[ATXActionNotificationServer sharedInstance](ATXActionNotificationServer, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeActionPredictionNotificationsMatchingAction:", v3);

  }
}

- (id)fetchNSUAEventsForAppSessionWithBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;

  v8 = a5;
  v9 = a3;
  -[ATXAppIntentMonitor adjustedStartDateForOneSecondFlooringWithAppSessionStartDate:](self, "adjustedStartDateForOneSecondFlooringWithAppSessionStartDate:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppIntentMonitor adjustedEndDateForOneSecondFlooringWithAppSessionEndDate:](self, "adjustedEndDateForOneSecondFlooringWithAppSessionEndDate:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_default();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ATXAppIntentMonitor fetchNSUAEventsForAppSessionWithBundleId:startDate:endDate:].cold.2();

  __atxlog_handle_default();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ATXAppIntentMonitor fetchNSUAEventsForAppSessionWithBundleId:startDate:endDate:].cold.1();

  -[ATXUserActivityStream getActivityIntentEventsBetweenStartDate:endDate:bundleIdFilter:](self->_activityStream, "getActivityIntentEventsBetweenStartDate:endDate:bundleIdFilter:", v10, v11, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)shouldAcceptMessageDonation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  _ATXDataStore *dataStore;
  void *v16;
  NSObject *v17;

  v4 = a3;
  objc_msgSend(v4, "intentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("INSendMessageIntent"));

  if (v6)
  {
    objc_msgSend(v4, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_15;
    objc_msgSend(v4, "action");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "intent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[_ATXActionUtils recipientFromMessageIntent:](_ATXActionUtils, "recipientFromMessageIntent:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 != 0;
      if (!v10)
      {
        __atxlog_handle_default();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[ATXAppIntentMonitor shouldAcceptMessageDonation:].cold.2();
        goto LABEL_11;
      }
      -[_ATXDataStore lastMessageToRecipient:](self->_dataStore, "lastMessageToRecipient:", v10);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = +[_ATXActionUtils shouldPredictRecipient:withDate:andRecipientDate:](_ATXActionUtils, "shouldPredictRecipient:withDate:andRecipientDate:", v10, v13, v12);

      if (v14)
      {
        dataStore = self->_dataStore;
        objc_msgSend(v4, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ATXDataStore updateOrInsertMessageRecipient:dateMessaged:](dataStore, "updateOrInsertMessageRecipient:dateMessaged:", v10, v16);

LABEL_11:
        goto LABEL_16;
      }
      __atxlog_handle_default();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[ATXAppIntentMonitor shouldAcceptMessageDonation:].cold.1();

LABEL_15:
      v11 = 0;
      goto LABEL_16;
    }

  }
  v11 = 1;
LABEL_16:

  return v11;
}

- (void)updateActionPredictionPipelineForIntentEvent:(id)a3 weight:(float)a4 appSessionStartDate:(id)a5 appSessionEndDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  NSObject *v15;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[ATXPredictionContextBuilderProtocol predictionContextForCurrentContext](self->_predictionContextBuilder, "predictionContextForCurrentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    *(float *)&v14 = a4;
    -[ATXAppIntentMonitor updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:context:](self, "updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:context:", v10, v11, v12, v13, v14);
  }
  else
  {
    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ATXAppIntentMonitor updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:].cold.1();

  }
}

- (void)updateActionPredictionPipelineForIntentEvent:(id)a3 weight:(float)a4 appSessionStartDate:(id)a5 appSessionEndDate:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _ATXDataStore *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  _ATXDataStore *dataStore;
  void *v25;
  double v26;
  _ATXDataStore *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  double v40;
  void *v41;
  void *v42;
  __CFString *v43;
  uint64_t v44;
  PETScalarEventTracker *donatedActionsTracker;
  const __CFString **v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  __CFString *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  int v60;
  NSObject *v61;
  const __CFString *v62;
  const __CFString *v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  NSObject *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v12, "action");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXSafariIntentEventQualityFilter shouldAcceptSafariDonation:](self->_safariIntentQualityFilter, "shouldAcceptSafariDonation:", v12))
  {
    if (v16)
    {
      -[ATXAppIntentMonitor _displayDonationOnLockscreenWithAction:](self, "_displayDonationOnLockscreenWithAction:", v16);
      -[ATXAppIntentMonitor removeDonationFromLockscreenForAction:](self, "removeDonationFromLockscreenForAction:", v16);
      if (!-[ATXAppIntentMonitor shouldAcceptMessageDonation:](self, "shouldAcceptMessageDonation:", v12)
        || !+[_ATXActionUtils shouldAcceptAudioOrVideoCallIntent:](_ATXActionUtils, "shouldAcceptAudioOrVideoCallIntent:", v16))
      {
        goto LABEL_27;
      }
    }
    else if (!-[ATXAppIntentMonitor shouldAcceptMessageDonation:](self, "shouldAcceptMessageDonation:", v12))
    {
      goto LABEL_27;
    }
    objc_msgSend(v16, "actionUUID");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17
      && (v18 = (void *)v17,
          v19 = self->_dataStore,
          objc_msgSend(v16, "actionUUID"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v19) = -[_ATXDataStore alogContainsActionUUID:](v19, "alogContainsActionUUID:", v20),
          v20,
          v18,
          (_DWORD)v19))
    {
      objc_msgSend(v16, "intent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(v16, "intent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "intentDescription");
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v16, "userActivityString");
        v49 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v49;
        v50 = &stru_1E82FDC98;
        if (v49)
          v50 = (__CFString *)v49;
        v23 = v50;
      }
      v48 = v23;

      __atxlog_handle_default();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "bundleId");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "actionUUID");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "description");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412803;
        v65 = v52;
        v66 = 2117;
        v67 = v48;
        v68 = 2112;
        v69 = v54;
        _os_log_impl(&dword_1C9A3B000, v51, OS_LOG_TYPE_DEFAULT, "Donation Processing - Tried to add duplicate entry to alog table for BundleId: %@ of Action Type: %{sensitive}@ with UUID: %@", buf, 0x20u);

      }
    }
    else
    {
      dataStore = self->_dataStore;
      objc_msgSend(v12, "intentType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[_ATXDataStore containsActionType:](dataStore, "containsActionType:", v25))
      {

      }
      else
      {
        v27 = self->_dataStore;
        objc_msgSend(v12, "bundleId");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ATXDataStore totalNumberOfActionTypesForBundleId:](v27, "totalNumberOfActionTypesForBundleId:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v29, "intValue");
        +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v30, "maxNumberOfActionTypesPerApp");

        if (v60 >= v58)
        {
          __atxlog_handle_default();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            -[ATXAppIntentMonitor updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:context:].cold.1(v12, v48);
          goto LABEL_26;
        }
      }
      *(float *)&v26 = a4;
      -[ATXAppIntentMonitor _updateActionPredictionHistogramsForIntentEvent:weight:context:](self, "_updateActionPredictionHistogramsForIntentEvent:weight:context:", v12, v15, v26);
      objc_msgSend(v15, "locationMotionContext");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "previousLOI");
      v32 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "locationMotionContext");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "currentLOI");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v61 = v32;
      -[NSObject uuid](v32, "uuid");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v34;
      objc_msgSend(v34, "uuid");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "locationMotionContext");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v57, "motionType");
      objc_msgSend(v15, "locationMotionContext");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "geohash");
      objc_msgSend(v15, "locationMotionContext");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "coarseGeohash");
      *(float *)&v40 = a4;
      -[ATXAppIntentMonitor updateActionPredictionSlotResolutionForIntentEvent:weight:prevLocationUUID:locationUUID:currentMotionType:appSessionStartDate:appSessionEndDate:geohash:coarseGeohash:](self, "updateActionPredictionSlotResolutionForIntentEvent:weight:prevLocationUUID:locationUUID:currentMotionType:appSessionStartDate:appSessionEndDate:geohash:coarseGeohash:", v12, v56, v35, v55, v13, v14, v40, v37, v39);

      -[ATXAppIntentMonitor _logIntentPredictionsForIntentEvent:context:](self, "_logIntentPredictionsForIntentEvent:context:", v12, v15);
      +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "abGroupIdentifiers");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectAtIndexedSubscript:", 16);
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v44 = objc_msgSend(v16, "actionType");
      donatedActionsTracker = self->_donatedActionsTracker;
      if (v44 == 1)
      {
        v63 = CFSTR("nsua");
        v46 = &v63;
      }
      else
      {
        v62 = CFSTR("intent");
        v46 = &v62;
      }
      v46[1] = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PETScalarEventTracker trackEventWithPropertyValues:](donatedActionsTracker, "trackEventWithPropertyValues:", v47);

      v48 = v61;
    }
LABEL_26:

  }
LABEL_27:

}

- (void)_updateActionPredictionHistogramsForIntentEvent:(id)a3 weight:(float)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _ATXAppLaunchSequenceManager *appActionLaunchSequenceManager;
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
  double v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  uint64_t v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  int v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  NSObject *v87;
  void *v88;
  void *v89;
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  double v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CF8C20];
  objc_msgSend(v8, "bundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intentType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getActionKeyForBundleId:actionType:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CF89E0]))
  {
    objc_msgSend(v8, "action");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userActivityString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      +[_ATXActionUtils markTodayInTitleAndUserActivityString:withActionKey:](_ATXActionUtils, "markTodayInTitleAndUserActivityString:withActionKey:", v8, v15);
      v18 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v18;
    }
  }
  objc_msgSend(v9, "userContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastAppActionLaunch");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    appActionLaunchSequenceManager = self->_appActionLaunchSequenceManager;
    objc_msgSend(v9, "userContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastAppActionLaunch");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ATXAppLaunchSequenceManager launchSequenceForAppAction:](appActionLaunchSequenceManager, "launchSequenceForAppAction:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubsequentLaunch:", v15);

  }
  objc_msgSend(v9, "userContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "secondMostRecentAppLaunch");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "userContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "secondMostRecentAppLaunch");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%@:#AppLaunched"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ATXAppLaunchSequenceManager launchSequenceForAppAction:](self->_appActionLaunchSequenceManager, "launchSequenceForAppAction:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubsequentLaunch:", v15);

  }
  -[_ATXAppInfoManager addLaunchForAppAction:date:](self->_appInfoManager, "addLaunchForAppAction:date:", v15, v11);
  -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 14);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v33 = a4;
  objc_msgSend(v32, "addLaunchWithBundleId:date:timeZone:weight:", v15, v11, 0, v33);

  -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 16);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleId");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v36 = a4;
  objc_msgSend(v34, "addLaunchWithBundleId:date:timeZone:weight:", v35, v11, 0, v36);

  -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 17);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v38 = a4;
  objc_msgSend(v37, "addLaunchWithBundleId:date:timeZone:weight:", v15, v11, 0, v38);

  -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 19);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleId");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v41 = a4;
  objc_msgSend(v39, "addLaunchWithBundleId:date:timeZone:weight:", v40, v11, 0, v41);

  -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 20);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v43 = a4;
  objc_msgSend(v42, "addLaunchWithBundleId:date:timeZone:weight:", v15, v11, 0, v43);

  -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 22);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleId");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v46 = a4;
  objc_msgSend(v44, "addLaunchWithBundleId:date:timeZone:weight:", v45, v11, 0, v46);

  objc_msgSend(v9, "userContext");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "lastUnlockDate");
  v48 = objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    objc_msgSend(v11, "timeIntervalSinceDate:", v48);
    if (v49 >= 0.0)
    {
      if (v49 >= 3600.0)
        v50 = 3599.0;
      else
        v50 = v49;
      -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 23);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v52 = a4;
      objc_msgSend(v51, "addLaunchWithBundleId:elapsedTime:weight:", v15, v50, v52);

      -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 25);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleId");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v55 = a4;
      objc_msgSend(v53, "addLaunchWithBundleId:elapsedTime:weight:", v54, v50, v55);

    }
  }
  objc_msgSend(v9, "deviceStateContext");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "inAirplaneMode");

  if (v57)
  {
    -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 26);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v59 = a4;
    objc_msgSend(v58, "addLaunchWithBundleId:date:timeZone:weight:", v15, v11, 0, v59);

    -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 28);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleId");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v62 = a4;
    objc_msgSend(v60, "addLaunchWithBundleId:date:timeZone:weight:", v61, v11, 0, v62);

  }
  v89 = (void *)v48;
  objc_msgSend(v9, "deviceStateContext");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "wifiSSID");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v64, "length"))
  {
    -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:](self->_appLaunchHistogramManager, "categoricalHistogramForLaunchType:", 29);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v66 = a4;
    objc_msgSend(v65, "addLaunchWithBundleId:date:category:weight:", v15, v11, v64, v66);

    -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:](self->_appLaunchHistogramManager, "categoricalHistogramForLaunchType:", 31);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleId");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v69 = a4;
    objc_msgSend(v67, "addLaunchWithBundleId:date:category:weight:", v68, v11, v64, v69);

  }
  v70 = (void *)MEMORY[0x1E0D80E00];
  objc_msgSend(v9, "locationMotionContext");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "getMotionStringFromMotionType:", objc_msgSend(v71, "motionType"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:](self->_appLaunchHistogramManager, "categoricalHistogramForLaunchType:", 38);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v74 = a4;
  objc_msgSend(v73, "addLaunchWithBundleId:date:category:weight:", v15, v11, v72, v74);

  -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:](self->_appLaunchHistogramManager, "categoricalHistogramForLaunchType:", 39);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleId");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v77 = a4;
  objc_msgSend(v75, "addLaunchWithBundleId:date:category:weight:", v76, v11, v72, v77);

  +[_ATXActionUtils partOfWeekStringForDate:](_ATXActionUtils, "partOfWeekStringForDate:", v11);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:](self->_appLaunchHistogramManager, "categoricalHistogramForLaunchType:", 40);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v80 = a4;
  objc_msgSend(v79, "addLaunchWithBundleId:date:category:weight:", v15, v11, v78, v80);

  objc_msgSend(v9, "ambientLightContext");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "ambientLightType");

  if ((_DWORD)v82 != 7)
  {
    -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:](self->_appLaunchHistogramManager, "categoricalHistogramForLaunchType:", 41);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v82);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "stringValue");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v86 = a4;
    objc_msgSend(v83, "addLaunchWithBundleId:date:category:weight:", v15, v11, v85, v86);

  }
  __atxlog_handle_default();
  v87 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "startDate");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v91 = v15;
    v92 = 2112;
    v93 = v88;
    v94 = 2048;
    v95 = a4;
    _os_log_debug_impl(&dword_1C9A3B000, v87, OS_LOG_TYPE_DEBUG, "Donation Processing - Finished Updating Histograms for Action Event: %@ with Date: %@ with Weight: %f", buf, 0x20u);

  }
}

- (void)updateActionPredictionSlotResolutionForIntentEvent:(id)a3 weight:(float)a4 prevLocationUUID:(id)a5 locationUUID:(id)a6 currentMotionType:(int64_t)a7 appSessionStartDate:(id)a8 appSessionEndDate:(id)a9 geohash:(int64_t)a10 coarseGeohash:(int64_t)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _ATXDataStore *dataStore;
  void *v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v22 = a9;
  objc_msgSend(v18, "action");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    +[_ATXActionUtils slotSetsForAction:](_ATXActionUtils, "slotSetsForAction:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    dataStore = self->_dataStore;
    v32 = (void *)v24;
    objc_msgSend(v18, "intentType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bundleId");
    v25 = v19;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "startDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "actionUUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ATXDataStore writeActionType:bundleId:date:action:slotSets:timeZone:prevLocationUUID:locationUUID:weight:actionUUID:motionType:appSessionStartDate:appSessionEndDate:geohash:coarseGeohash:](dataStore, "writeActionType:bundleId:date:action:slotSets:timeZone:prevLocationUUID:locationUUID:weight:actionUUID:motionType:appSessionStartDate:appSessionEndDate:geohash:coarseGeohash:", v30, v26, v27, v23, v32, 0, a4, v25, v20, v28, a7, v21, v22, a10, a11);

    __atxlog_handle_default();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v23;
      _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_DEFAULT, "Donation Processing - Finished Updating Slot Resolution Database for Action: %@", buf, 0xCu);
    }

    v19 = v25;
  }

}

- (void)_logIntentPredictionsForIntentEvent:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  unint64_t v20;
  void *v21;
  int v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  double v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PETDistributionEventTracker *donatedActionInCacheTracker;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  _BOOL4 v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  id v49;
  id v50;
  ATXAppIntentMonitor *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[8];
  _QWORD v59[3];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1CAA48B6C]();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "actionPredictionsForConsumerSubType:limit:", 17, 0x7FFFFFFFLL);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "action");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (v13)
  {
    __atxlog_handle_default();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_INFO, "Donation Processing - No response or performedAction Found", buf, 2u);
    }
  }
  else
  {
    v51 = self;
    v52 = v9;
    v53 = v8;
    objc_msgSend(MEMORY[0x1E0CF9080], "sharedInstance");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject recentActions](v14, "recentActions");
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v55;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v55 != v18)
            objc_enumerationMutation(v15);
          if (+[_ATXActionUtils isContainmentBetweenAction:other:](_ATXActionUtils, "isContainmentBetweenAction:other:", v12, *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i)))
          {
            __atxlog_handle_default();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C9A3B000, v30, OS_LOG_TYPE_INFO, "Donation Processing - Donated action corresponds to a recently engaged action. Skipping Metric Logging and Shadow Logging.", buf, 2u);
            }

            v9 = v52;
            goto LABEL_43;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
        if (v17)
          continue;
        break;
      }
    }
    v49 = v7;
    v50 = v6;

    v20 = 0;
    while (1)
    {
      +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "maximumSpotlightPredictions");

      objc_msgSend(v10, "actions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      v25 = v22;
      if (v24 < v22)
        v25 = v24;
      if (v20 >= v25)
        break;
      objc_msgSend(v10, "actions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = +[_ATXActionUtils isContainmentBetweenAction:other:](_ATXActionUtils, "isContainmentBetweenAction:other:", v12, v27);

      ++v20;
      if (v28)
      {
        v29 = (double)v20;
        goto LABEL_26;
      }
    }
    v29 = 0.0;
LABEL_26:
    objc_msgSend(v12, "_bundleIdForDisplay");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actionKey");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v12, "actionKey");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ATXActionUtils getActionTypeFromActionKey:](_ATXActionUtils, "getActionTypeFromActionKey:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v34 = 0;
    }

    +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "abGroupIdentifiers");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", 16);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31 && v34 && v37)
    {
      donatedActionInCacheTracker = v51->_donatedActionInCacheTracker;
      v59[0] = v31;
      v59[1] = v34;
      v59[2] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PETDistributionEventTracker trackEventWithPropertyValues:value:](donatedActionInCacheTracker, "trackEventWithPropertyValues:value:", v39, v29);

    }
    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "actionPredictionShadowLogSamplingRate");
    v42 = v41;

    if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    {
      +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "actionPredictionInternalBuildShadowLogSamplingRate");
      v42 = v44;

    }
    v7 = v49;
    v6 = v50;
    v9 = v52;
    v45 = +[_ATXAggregateLogger yesWithProbability:](_ATXAggregateLogger, "yesWithProbability:", v42);
    __atxlog_handle_default();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v45)
    {
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        -[ATXAppIntentMonitor _logIntentPredictionsForIntentEvent:context:].cold.1();

      v48 = (void *)objc_opt_new();
      objc_msgSend(v10, "updateConsumerSubType:engagedAction:shownActions:feedbackStage:explicitlyDismissedActions:searchedActionType:engagedAppString:uiFeedbackDate:", 17, v12, MEMORY[0x1E0C9AA60], 7, 0, 4, 0, v48);

      +[ATXActionSessionLog performSessionLoggingWithActionResponse:engagementType:context:isShadowLog:forTestingMode:](ATXActionSessionLog, "performSessionLoggingWithActionResponse:engagementType:context:isShadowLog:forTestingMode:", v10, 9, v49, 1, 0);
    }
    else
    {
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v47, OS_LOG_TYPE_INFO, "Donation Processing - Skipping Action Shadow Session Log", buf, 2u);
      }

    }
    v8 = v53;
LABEL_43:

  }
  objc_autoreleasePoolPop(v8);

}

- (void)start
{
  _CDLocalContext *v3;
  _CDLocalContext *context;

  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v3 = (_CDLocalContext *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  self->_context = v3;

  -[ATXAppIntentMonitor _listenToIntentStream](self, "_listenToIntentStream");
  -[ATXAppIntentMonitor _listenToLinkActionStream](self, "_listenToLinkActionStream");
  -[ATXAppIntentMonitor _listenToActivityStream](self, "_listenToActivityStream");
}

- (void)stop
{
  BPSSink *intentSink;
  BMBiomeScheduler *intentScheduler;
  BPSSink *linkActionSink;
  BMBiomeScheduler *linkActionScheduler;
  BPSSink *nsuaSink;
  BMBiomeScheduler *nsuaScheduler;
  _CDLocalContext *context;

  -[BPSSink cancel](self->_intentSink, "cancel");
  intentSink = self->_intentSink;
  self->_intentSink = 0;

  intentScheduler = self->_intentScheduler;
  self->_intentScheduler = 0;

  -[BPSSink cancel](self->_linkActionSink, "cancel");
  linkActionSink = self->_linkActionSink;
  self->_linkActionSink = 0;

  linkActionScheduler = self->_linkActionScheduler;
  self->_linkActionScheduler = 0;

  -[BPSSink cancel](self->_nsuaSink, "cancel");
  nsuaSink = self->_nsuaSink;
  self->_nsuaSink = 0;

  nsuaScheduler = self->_nsuaScheduler;
  self->_nsuaScheduler = 0;

  context = self->_context;
  self->_context = 0;

}

- (id)_appActionLaunchSequenceManager
{
  NSObject *appIntentHistoryQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__45;
  v10 = __Block_byref_object_dispose__45;
  v11 = 0;
  appIntentHistoryQueue = self->_appIntentHistoryQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__ATXAppIntentMonitor__appActionLaunchSequenceManager__block_invoke;
  v5[3] = &unk_1E82DC528;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(appIntentHistoryQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__ATXAppIntentMonitor__appActionLaunchSequenceManager__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)_syncForTests
{
  dispatch_sync((dispatch_queue_t)self->_appIntentHistoryQueue, &__block_literal_global_114);
}

- (void)coalescedHandleIntentOrActivityDeletion
{
  -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_coalescedIntentOrActivityDeletion, "runAfterDelaySeconds:coalescingBehavior:", 1, 5.0);
}

- (void)handleIntentOrActivityDeletion
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _ATXDuetHelper *duetHelper;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _ATXDuetHelper *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *context;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD aBlock[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  sel_getName(a2);
  v19 = (void *)os_transaction_create();
  context = (void *)MEMORY[0x1CAA48B6C]();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__ATXAppIntentMonitor_handleIntentOrActivityDeletion__block_invoke;
  aBlock[3] = &unk_1E82E2718;
  aBlock[4] = self;
  aBlock[5] = &v27;
  v5 = _Block_copy(aBlock);
  -[ATXAppIntentMonitor deletionHighWaterMarkForDefaultsKey:currentDate:](self, "deletionHighWaterMarkForDefaultsKey:currentDate:", CFSTR("intentDeletionHighWaterMark"), v3);
  v6 = objc_claimAutoreleasedReturnValue();
  -[ATXAppIntentMonitor adjustedStartDateForTombstoneStreamQuery:](self, "adjustedStartDateForTombstoneStreamQuery:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  -[ATXAppIntentMonitor adjustedEndDateForTombstoneStreamQuery:](self, "adjustedEndDateForTombstoneStreamQuery:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  duetHelper = self->_duetHelper;
  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __53__ATXAppIntentMonitor_handleIntentOrActivityDeletion__block_invoke_119;
  v24[3] = &unk_1E82E2740;
  v9 = v5;
  v25 = v9;
  -[_ATXDuetHelper enumerateBatchedIntentDeletionUUIDsAndDatesBetweenStartdate:endDate:batchSize:block:](duetHelper, "enumerateBatchedIntentDeletionUUIDsAndDatesBetweenStartdate:endDate:batchSize:block:", v7, v21, 30, v24);
  -[ATXAppIntentMonitor setDeletionHighWaterMark:defaultsKey:](self, "setDeletionHighWaterMark:defaultsKey:", v3, CFSTR("intentDeletionHighWaterMark"));
  -[ATXAppIntentMonitor deletionHighWaterMarkForDefaultsKey:currentDate:](self, "deletionHighWaterMarkForDefaultsKey:currentDate:", CFSTR("activityDeletionHighWaterMarkKey"), v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppIntentMonitor adjustedStartDateForTombstoneStreamQuery:](self, "adjustedStartDateForTombstoneStreamQuery:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppIntentMonitor adjustedEndDateForTombstoneStreamQuery:](self, "adjustedEndDateForTombstoneStreamQuery:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)v7;
  v14 = (void *)v6;
  v15 = self->_duetHelper;
  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __53__ATXAppIntentMonitor_handleIntentOrActivityDeletion__block_invoke_2_120;
  v22[3] = &unk_1E82E2740;
  v16 = v9;
  v23 = v16;
  -[_ATXDuetHelper enumerateBatchedEligibleActivityDeletionUUIDsAndDatesBetweenStartDate:endDate:batchSize:block:](v15, "enumerateBatchedEligibleActivityDeletionUUIDsAndDatesBetweenStartDate:endDate:batchSize:block:", v11, v12, 30, v22);
  -[ATXAppIntentMonitor setDeletionHighWaterMark:defaultsKey:](self, "setDeletionHighWaterMark:defaultsKey:", v3, CFSTR("activityDeletionHighWaterMarkKey"));
  __atxlog_handle_deletions();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v28[3];
    *(_DWORD *)buf = 134217984;
    v32 = v18;
    _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "Processed %lu tombstoned uuids in total", buf, 0xCu);
  }

  if (v28[3])
    ATXUpdatePredictionsImmediatelyWithReason(10);

  _Block_object_dispose(&v27, 8);
  objc_autoreleasePoolPop(context);

}

void __53__ATXAppIntentMonitor_handleIntentOrActivityDeletion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_116);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "second");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateActionPredictionHistogramsRemovingActionUUIDs:", v8);
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v8);
    objc_msgSend(v11, "removeActionDataForActionUUIDs:", v12);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v8, "count");
  }
  if (v10)
    objc_msgSend(*(id *)(a1 + 32), "setDeletionHighWaterMark:defaultsKey:", v10, v5);
  __atxlog_handle_deletions();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134218498;
    v15 = objc_msgSend(v8, "count");
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Deleted %lu tombstoned events for deletionHighWaterMarkKey: %@, ending date: %@", (uint8_t *)&v14, 0x20u);
  }

  objc_autoreleasePoolPop(v7);
}

uint64_t __53__ATXAppIntentMonitor_handleIntentOrActivityDeletion__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "first");
}

uint64_t __53__ATXAppIntentMonitor_handleIntentOrActivityDeletion__block_invoke_119(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__ATXAppIntentMonitor_handleIntentOrActivityDeletion__block_invoke_2_120(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateActionPredictionHistogramsRemovingActionUUIDs:(id)a3
{
  id v4;
  _ATXAppLaunchHistogramManager *appLaunchHistogramManager;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _ATXDataStore *dataStore;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  _BYTE v27[128];
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    appLaunchHistogramManager = self->_appLaunchHistogramManager;
    if (appLaunchHistogramManager)
    {
      -[_ATXAppLaunchHistogramManager histogramForLaunchType:](appLaunchHistogramManager, "histogramForLaunchType:", 14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v6;
      -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v7;
      -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28[2] = v8;
      -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 19);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v28[3] = v9;
      -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v28[4] = v10;
      -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28[5] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      dataStore = self->_dataStore;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __76__ATXAppIntentMonitor__updateActionPredictionHistogramsRemovingActionUUIDs___block_invoke;
      v25[3] = &unk_1E82E2768;
      v14 = v12;
      v26 = v14;
      -[_ATXDataStore enumerateActionsInUUIDSet:block:](dataStore, "enumerateActionsInUUIDSet:block:", v4, v25);
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v15 = v14;
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v22;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v22 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v19);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v20, "flush", (_QWORD)v21);
            ++v19;
          }
          while (v17 != v19);
          v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        }
        while (v17);
      }

    }
    else
    {
      __atxlog_handle_default();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[ATXAppIntentMonitor _updateActionPredictionHistogramsRemovingActionUUIDs:].cold.1();
    }

  }
}

uint64_t __76__ATXAppIntentMonitor__updateActionPredictionHistogramsRemovingActionUUIDs___block_invoke(uint64_t a1, void *a2, void *a3, double a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0CF8C20];
  objc_msgSend(a3, "bundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getActionKeyForBundleId:actionType:", v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = *(id *)(a1 + 32);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v24;
    v20 = a4;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v15);
        *(float *)&v17 = v20;
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v21++), "removeLaunchWithBundleId:date:timeZone:weight:", v14, v11, 0, v17, (_QWORD)v23);
      }
      while (v18 != v21);
      v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }

  return 1;
}

- (id)adjustedStartDateForTombstoneStreamQuery:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToDate:", v4);

  if (v5)
  {
    v6 = v3;
  }
  else
  {
    objc_msgSend(v3, "dateByAddingTimeInterval:", -2.0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)adjustedEndDateForTombstoneStreamQuery:(id)a3
{
  return (id)objc_msgSend(a3, "dateByAddingTimeInterval:", 2.0);
}

- (id)deletionHighWaterMarkForDefaultsKey:(id)a3 currentDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v12;
  uint8_t v13[16];

  v6 = a4;
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7
    || (-[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("deletionHighWaterMark")),
        (v7 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v7;
      v8 = v7;
      if (objc_msgSend(v7, "compare:", v6) == 1)
      {
        __atxlog_handle_deletions();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[ATXAppIntentMonitor deletionHighWaterMarkForDefaultsKey:currentDate:].cold.1();

        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      __atxlog_handle_deletions();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ATXAppIntentMonitor deletionHighWaterMarkForDefaultsKey:currentDate:].cold.2();

      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    __atxlog_handle_deletions();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_INFO, "Deletion high water mark not present.", v13, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)setDeletionHighWaterMark:(id)a3 defaultsKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v6, v7);
  __atxlog_handle_deletions();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Set deletion high water mark of %@ for key %@", (uint8_t *)&v9, 0x16u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nsuaSink, 0);
  objc_storeStrong((id *)&self->_nsuaScheduler, 0);
  objc_storeStrong((id *)&self->_linkActionSink, 0);
  objc_storeStrong((id *)&self->_linkActionScheduler, 0);
  objc_storeStrong((id *)&self->_intentSink, 0);
  objc_storeStrong((id *)&self->_intentScheduler, 0);
  objc_storeStrong((id *)&self->_safariIntentQualityFilter, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_coalescedIntentOrActivityDeletion, 0);
  objc_storeStrong((id *)&self->_appRegistrationListener, 0);
  objc_storeStrong((id *)&self->_donatedActionInCacheTracker, 0);
  objc_storeStrong((id *)&self->_donatedActionsTracker, 0);
  objc_storeStrong((id *)&self->_donationQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_appIntentHistoryQueue, 0);
  objc_storeStrong((id *)&self->_predictionContextBuilder, 0);
  objc_storeStrong((id *)&self->_intentStream, 0);
  objc_storeStrong((id *)&self->_activityStream, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_appActionLaunchSequenceManager, 0);
  objc_storeStrong((id *)&self->_appInfoManager, 0);
  objc_storeStrong((id *)&self->_duetHelper, 0);
  objc_storeStrong((id *)&self->_appLaunchHistogramManager, 0);
}

- (void)initWithAppLaunchHistogramManager:appInfoManager:appActionLaunchSequenceManager:duetHelper:intentStream:activityStream:dataStore:predictionContextBuilder:userDefaults:safariIntentFilter:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "nil appLaunchHistogramManager passed in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __46__ATXAppIntentMonitor__listenToActivityStream__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "Could not subscribe to activity stream: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "Could not subscribe to intent stream: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __44__ATXAppIntentMonitor__listenToIntentStream__block_invoke_66_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Donation Processing - Intent body is nil in living publisher", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "Could not subscribe to link action transcript stream: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __48__ATXAppIntentMonitor__listenToLinkActionStream__block_invoke_73_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Donation Processing - Link action body execution id is nil in living publisher", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)fetchIntentEventsForAppSessionWithBundleId:startDate:endDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, v0, v1, "Donation Processing - Intent Query End Date: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchIntentEventsForAppSessionWithBundleId:startDate:endDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, v0, v1, "Donation Processing - Intent Query Start Date: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)processIntentDonationsDuringAppSessionForBundleId:startDate:endDate:globals:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Donation Processing - Intent Events Term Frequency stats calculated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)processIntentDonationsDuringAppSessionForBundleId:(void *)a1 startDate:(NSObject *)a2 endDate:globals:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, a2, v3, "Donation Processing - Processing %lu Intent Events", v4);
  OUTLINED_FUNCTION_1();
}

- (void)fetchNSUAEventsForAppSessionWithBundleId:startDate:endDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, v0, v1, "Donation Processing - NSUA Query End Date: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchNSUAEventsForAppSessionWithBundleId:startDate:endDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, v0, v1, "Donation Processing - NSUA Query Start Date: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)processNSUADonationsDuringAppSessionForBundleId:(void *)a1 startDate:(NSObject *)a2 endDate:globals:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, a2, v3, "Donation Processing - Processing %lu NSUA Events", v4);
  OUTLINED_FUNCTION_1();
}

- (void)shouldAcceptMessageDonation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, v0, v1, "Donation Processing - Filtering INSendMessageIntent because you messaged the recipient on %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)shouldAcceptMessageDonation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Donation Processing - Filtering INSendMessageIntent because there is no recipientIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Can't update action prediction pipeline since ATXPredictionContext is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)updateActionPredictionPipelineForIntentEvent:(void *)a1 weight:(NSObject *)a2 appSessionStartDate:appSessionEndDate:context:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, a2, v4, "Donation Processing - Skipping processing this action because the upper limit for the number of actionTypes stored for %@ has been reached", v5);

  OUTLINED_FUNCTION_1();
}

- (void)_logIntentPredictionsForIntentEvent:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Donation Processing - Generating Action Shadow Session Log", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_updateActionPredictionHistogramsRemovingActionUUIDs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "Tried to delete data from histograms but histogram manager is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)deletionHighWaterMarkForDefaultsKey:currentDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Rejecting deletion high water mark from THE MYSTERIOUS FUTURE.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)deletionHighWaterMarkForDefaultsKey:currentDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Rejecting corrupt deletion high water mark.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
