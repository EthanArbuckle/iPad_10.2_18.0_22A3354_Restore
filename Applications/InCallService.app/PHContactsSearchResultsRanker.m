@implementation PHContactsSearchResultsRanker

- (PHContactsSearchResultsRanker)init
{
  PHContactsSearchResultsRanker *v2;
  _PSPredictionContext *v3;
  _PSPredictionContext *context;
  uint64_t v5;
  _PSSuggesterConfiguration *configuration;
  _PSEnsembleModel *v7;
  _PSEnsembleModel *model;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHContactsSearchResultsRanker;
  v2 = -[PHContactsSearchResultsRanker init](&v10, "init");
  if (v2)
  {
    v3 = (_PSPredictionContext *)objc_alloc_init((Class)_PSPredictionContext);
    context = v2->_context;
    v2->_context = v3;

    -[_PSPredictionContext setBundleID:](v2->_context, "setBundleID:", CFSTR("com.apple.InCallService"));
    v5 = objc_claimAutoreleasedReturnValue(+[_PSSuggesterConfiguration defaultConfiguration](_PSSuggesterConfiguration, "defaultConfiguration"));
    configuration = v2->_configuration;
    v2->_configuration = (_PSSuggesterConfiguration *)v5;

    v7 = (_PSEnsembleModel *)objc_alloc_init((Class)_PSEnsembleModel);
    model = v2->_model;
    v2->_model = v7;

    if ((objc_opt_respondsToSelector(v2->_model, "supportsDirectAutocompleteModelInit") & 1) == 0)
      -[_PSEnsembleModel populateCaches](v2->_model, "populateCaches");
  }
  return v2;
}

- (id)rankContactSearchResults:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  NSObject *v34;
  id v35;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  _BYTE v58[128];

  v4 = a3;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v54 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[ContactsSearchResultsRanker] Received request to rank %lu contacts", buf, 0xCu);
  }

  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v50;
    v38 = v8;
    v39 = v7;
    v37 = *(_QWORD *)v50;
    do
    {
      v12 = 0;
      v40 = v10;
      do
      {
        if (*(_QWORD *)v50 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contact"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "preferredPhoneNumber"));
        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "preferredPhoneNumber"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsSearchResultsRanker autocompleteSuggestionForContact:phoneNumber:](self, "autocompleteSuggestionForContact:phoneNumber:", v14, v17));

          objc_msgSend(v41, "addObject:", v18);
        }
        else
        {
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "phoneNumbers"));
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
          if (v19)
          {
            v20 = v19;
            v21 = 0;
            v22 = *(_QWORD *)v46;
LABEL_12:
            v23 = 0;
            while (1)
            {
              if (*(_QWORD *)v46 != v22)
                objc_enumerationMutation(v18);
              v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsSearchResultsRanker autocompleteSuggestionForContact:phoneNumber:](self, "autocompleteSuggestionForContact:phoneNumber:", v14, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v23)));
              objc_msgSend(v41, "addObject:", v24);

              if (v21 + v23 == 4)
                break;
              if (v20 == (id)++v23)
              {
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
                v21 += v23;
                if (v20)
                  goto LABEL_12;
                break;
              }
            }
            v8 = v38;
            v7 = v39;
            v11 = v37;
            v10 = v40;
          }
        }

        v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v10);
  }

  v25 = sub_1000C5588();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = objc_msgSend(v41, "count");
    v28 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 134218240;
    v54 = v27;
    v55 = 2048;
    v56 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[ContactsSearchResultsRanker] Created %lu candidates from %lu contacts", buf, 0x16u);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsSearchResultsRanker model](self, "model"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsSearchResultsRanker context](self, "context"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "rankedAutocompleteSuggestionsFromContext:candidates:", v30, v41));

  v32 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v31, "count"))
  {
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000897E4;
    v42[3] = &unk_100286BE0;
    v43 = v7;
    v44 = v32;
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", v42);

  }
  v33 = sub_1000C5588();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = objc_msgSend(v32, "count");
    *(_DWORD *)buf = 134217984;
    v54 = v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[ContactsSearchResultsRanker] After ranking, rankedContactSearchResults = %lu", buf, 0xCu);
  }

  return v32;
}

- (id)autocompleteSuggestionForContact:(id)a3 phoneNumber:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "unformattedInternationalStringValue"));

  v8 = objc_alloc((Class)_PSAutocompleteSuggestion);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));

  v11 = objc_msgSend(v8, "initWithChatGuid:chatHandles:displayName:handle:contactIdentifier:resultSourceType:autocompleteResult:recipients:", 0, 0, v9, v7, v10, 16, 0, 0);
  return v11;
}

- (_PSPredictionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (_PSSuggesterConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (_PSEnsembleModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (BOOL)printReason
{
  return self->_printReason;
}

- (void)setPrintReason:(BOOL)a3
{
  self->_printReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
