@implementation ATXHeuristicContactPhoneNumber

- (id)permanentRefreshTriggers
{
  ATXInformationHeuristicRefreshNotitifcationTrigger *v2;
  void *v3;
  void *v4;

  v2 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:]([ATXInformationHeuristicRefreshNotitifcationTrigger alloc], "initWithNotification:type:", CFSTR("ATXLocalPasteboardDidChangeNotification"), 0);
  v3 = (void *)MEMORY[0x1CAA46CBC]();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v2, 0);
  objc_autoreleasePoolPop(v3);

  return v4;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  id v4;
  ATXHeuristicClipboardUtilities *v5;
  void *v6;
  ATXHeuristicClipboardUtilities *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[2];
  uint8_t buf[4];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [ATXHeuristicClipboardUtilities alloc];
  objc_msgSend(v4, "heuristicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ATXHeuristicClipboardUtilities initWithDevice:](v5, "initWithDevice:", v6);
  -[ATXHeuristicClipboardUtilities fetchContents](v7, "fetchContents");
  -[ATXHeuristicClipboardUtilities dataDetectors](v7, "dataDetectors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  if ((objc_msgSend(v9, "telephonyCapability") & 1) != 0)
  {
    -[ATXHeuristicContactPhoneNumber phonesFromDataDetectorResults:](self, "phonesFromDataDetectorResults:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_context_heuristic();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = (uint64_t)v10;
      _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: phones:%@", buf, 0xCu);
    }

    if (objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(v10, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v8;
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = v13;
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CALL_CLIPBOARD_NUMBER_TITLE"), &stru_1E82C5A18, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringWithFormat:", v16, v12);
      v35 = v10;
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0CB3940];
      v19 = v15;
      v34 = v15;
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MESSAGE_CLIPBOARD_NUMBER_TITLE"), &stru_1E82C5A18, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringWithFormat:", v20, v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CLIPBOARD_NUMBER_SUBTITLE"), &stru_1E82C5A18, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXHeuristicClipboardUtilities appName](v7, "appName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringWithFormat:", v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CF8C20], "atx_startAudioCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:", v17, v25, 0, v12, CFSTR("phone"), 0, 0, CFSTR("contactPhoneNumber"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CF8C20], "atx_sendMessageActionWithTitle:subtitle:recipientName:recipientHandle:text:contactIdentifier:conversationIdentifier:eventIdentifier:heuristicName:", v21, v25, 0, v12, 0, 0, 0, 0, CFSTR("contactPhoneNumber"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v26;
      v37[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXHeuristicClipboardUtilities resultWithActions:predictionReasons:](v7, "resultWithActions:predictionReasons:", v28, 0x10000000);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v36;
      v10 = v35;

    }
    else
    {
      __atxlog_handle_context_heuristic();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 134217984;
        v39 = v32;
        _os_log_impl(&dword_1C99DF000, v31, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: Required exactly 1 phone number, but found %lu numbers.", buf, 0xCu);
      }

      v29 = (void *)objc_opt_new();
    }

  }
  else
  {
    __atxlog_handle_context_heuristic();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v30, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: Suppressing prediction to contact copied phone number because device does not support telephony.", buf, 2u);
    }

    v29 = (void *)objc_opt_new();
  }

  return v29;
}

- (id)phonesFromDataDetectorResults:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = (id)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("value"), v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("type"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("PhoneNumber")))
        {
          v12 = -[ATXHeuristicContactPhoneNumber _containsPhonePunctuation:](self, "_containsPhonePunctuation:", v10);

          if (v12)
            objc_msgSend(v14, "addObject:", v10);
        }
        else
        {

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v14;
}

- (BOOL)_containsPhonePunctuation:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "characterSetWithCharactersInString:", CFSTR(" (),-."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  return v7 > 2;
}

@end
