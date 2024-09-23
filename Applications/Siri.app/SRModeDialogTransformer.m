@implementation SRModeDialogTransformer

+ (id)transformAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v4;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;

  v7 = a3;
  objc_msgSend(a1, "_logModeComputationForAceCommand:mode:", v7, a4);
  v8 = objc_msgSend(a1, "_typeOfAddViews:", v7);
  if (v8 == (id)2)
  {
    v13 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_1000A0A98(v13, v7);
    v4 = objc_msgSend(v7, "copy");
    objc_msgSend(v4, "setViews:", &__NSArray0__struct);
  }
  else
  {
    if (v8 == (id)1)
    {
      v14 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "aceId"));
        v18 = 136315394;
        v19 = "+[SRModeDialogTransformer transformAddViews:forMode:]";
        v20 = 2112;
        v21 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s #modes Found dialog AddViews (aceId = %@)", (uint8_t *)&v18, 0x16u);

      }
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_transformDialogAddViews:forMode:", v7, a4));
      goto LABEL_13;
    }
    if (!v8)
    {
      v9 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "aceId"));
        v18 = 136315394;
        v19 = "+[SRModeDialogTransformer transformAddViews:forMode:]";
        v20 = 2112;
        v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #modes Found legacy AddViews (aceId = %@)", (uint8_t *)&v18, 0x16u);

      }
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_transformLegacyAddViews:forMode:", v7, a4));
LABEL_13:
      v4 = (id)v12;
    }
  }

  return v4;
}

+ (id)transformAddDialogs:(id)a3 forMode:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  unsigned int v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];

  v6 = a3;
  objc_msgSend(a1, "_logModeComputationForAceCommand:mode:", v6, a4);
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dialogs"));
    *(_DWORD *)buf = 136315650;
    v39 = "+[SRModeDialogTransformer transformAddDialogs:forMode:]";
    v40 = 2112;
    v41 = v9;
    v42 = 2048;
    v43 = objc_msgSend(v10, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #modes AddDialogs (aceId = %@) contains %lu dialogs", buf, 0x20u);

  }
  v33 = objc_alloc_init((Class)NSMutableArray);
  v11 = objc_alloc_init((Class)NSMutableArray);
  v12 = objc_msgSend(a1, "_alwaysPrintSiriResponse");
  if (v12)
  {
    v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "+[SRModeDialogTransformer transformAddDialogs:forMode:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #modes alwaysPrintSiriResponse = YES", buf, 0xCu);
    }
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dialogs", v6));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        if ((v12 | objc_msgSend(v19, "spokenOnly") ^ 1) == 1)
        {
          v20 = v11;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_utteranceViewForDialog:mode:printedOnly:", v19, a4, 1));
          objc_msgSend(v33, "addObject:", v21);

          v11 = v20;
        }
        v22 = objc_msgSend(v19, "printedOnly");
        if (a4 <= 1 && (v22 & 1) == 0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sayItForDialog:", v19));
          objc_msgSend(v11, "addObject:", v23);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v16);
  }

  v24 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "aceId"));
    v27 = objc_msgSend(v33, "count");
    v28 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 136315906;
    v39 = "+[SRModeDialogTransformer transformAddDialogs:forMode:]";
    v40 = 2112;
    v41 = v26;
    v42 = 2048;
    v43 = v27;
    v44 = 2048;
    v45 = v28;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s #modes AddDialogs (aceId = %@) transformed into %lu utterance views and %lu sayIts.", buf, 0x2Au);

  }
  v29 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v33, "count"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_addViewsForAddDialogs:views:", v32, v33));
    objc_msgSend(v29, "addObject:", v30);

  }
  if (objc_msgSend(v11, "count"))
    objc_msgSend(v29, "addObjectsFromArray:", v11);

  return v29;
}

+ (BOOL)supportsTransformationForAceCommand:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  uint64_t v8;

  v3 = a3;
  v5 = objc_opt_class(SAUIAddViews, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    v8 = objc_opt_class(SAUIAddDialogs, v6);
    isKindOfClass = objc_opt_isKindOfClass(v3, v8);
  }

  return isKindOfClass & 1;
}

+ (unint64_t)_typeOfAddViews:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "views", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_opt_class(SAUIAssistantUtteranceView, v6);
        v8 |= objc_opt_isKindOfClass(v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dialog"));
        LODWORD(v12) = v14 != 0;

        v9 |= v12;
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);

    if ((v8 & v9 & 1) != 0)
      v15 = 2;
    else
      v15 = v9 & 1;
  }
  else
  {

    v15 = 0;
  }

  return v15;
}

+ (BOOL)_shouldTransformLegacyAddViews
{
  return 1;
}

+ (id)_transformLegacyAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v10;
  id v11;
  void *v12;
  int v13;
  const char *v14;

  v6 = a3;
  if ((objc_msgSend(a1, "_shouldTransformLegacyAddViews") & 1) == 0)
    goto LABEL_6;
  if (a4 < 2)
  {
    if (!objc_msgSend(a1, "_alwaysPrintSiriResponse"))
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_removeUtteranceViewsFromAddViews:forMode:", v6, a4));
      goto LABEL_7;
    }
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "+[SRModeDialogTransformer _transformLegacyAddViews:forMode:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #modes alwaysPrintSiriResponse = YES", (uint8_t *)&v13, 0xCu);
    }
LABEL_6:
    v8 = v6;
LABEL_7:
    a4 = (unint64_t)v8;
    goto LABEL_8;
  }
  if (a4 == 2)
  {
    if (objc_msgSend(a1, "_alwaysPrintSiriResponse"))
    {
      v10 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315138;
        v14 = "+[SRModeDialogTransformer _transformLegacyAddViews:forMode:]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #modes alwaysPrintSiriResponse = YES", (uint8_t *)&v13, 0xCu);
      }
      v11 = v6;
    }
    else
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_removeRedundantUtteranceViewsFromAddViews:forMode:", v6, 2));
    }
    v12 = v11;
    a4 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_removeSpeakableTextFromAddViews:forMode:", v11, 2));

  }
LABEL_8:

  return (id)a4;
}

+ (id)_configurationDictionary
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100071B10;
  block[3] = &unk_100123C20;
  block[4] = a1;
  if (qword_100150438 != -1)
    dispatch_once(&qword_100150438, block);
  return (id)qword_100150440;
}

+ (id)_redundantDUCIds
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100071C58;
  block[3] = &unk_100123C20;
  block[4] = a1;
  if (qword_100150448 != -1)
    dispatch_once(&qword_100150448, block);
  return (id)qword_100150450;
}

+ (BOOL)_alwaysPrintSiriResponse
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v3 = objc_msgSend(v2, "siriResponseShouldAlwaysPrint");

  return v3;
}

+ (id)_firstSnippetInViews:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_opt_class(SAUISnippet, v4);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)_removeRedundantUtteranceViewsFromAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  void *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "views"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_firstSnippetInViews:", v6));

  if (v7)
  {
    v30 = v7;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_redundantDUCIds"));
    v8 = objc_alloc_init((Class)NSMutableArray);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "views"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          objc_opt_class(SAUIAssistantUtteranceView, v11);
          if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
          {
            v17 = v15;
            v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dialogIdentifier"));
            v19 = (void *)v18;
            v20 = &stru_100125588;
            if (v18)
              v20 = (__CFString *)v18;
            v21 = v20;

            v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString lowercaseString](v21, "lowercaseString"));
            v23 = objc_msgSend(v32, "containsObject:", v22);

            if (v23)
            {
              v24 = (void *)AFSiriLogContextConnection;
              if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
              {
                v25 = v24;
                v26 = sub_100038230(a4);
                v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
                *(_DWORD *)buf = 136315650;
                v38 = "+[SRModeDialogTransformer _removeRedundantUtteranceViewsFromAddViews:forMode:]";
                v39 = 2112;
                v40 = v21;
                v41 = 2112;
                v42 = v27;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing redundant AssistantUtteranceView (%@) for current mode: %@", buf, 0x20u);

              }
            }
            else
            {
              objc_msgSend(v8, "addObject:", v17);
            }

          }
          else
          {
            objc_msgSend(v8, "addObject:", v15);
          }
        }
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      }
      while (v12);
    }

    v28 = objc_msgSend(v5, "copy");
    objc_msgSend(v28, "setViews:", v8);

    v7 = v30;
  }
  else
  {
    v28 = v5;
  }

  return v28;
}

+ (id)_removeSpeakableTextFromAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v4;
  id v5;
  uint64_t v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *i;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  id v62;
  uint64_t v63;
  id v64;
  id obj;
  void *v66;
  void *v67;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[128];
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  _BYTE v86[128];

  v62 = a3;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "views"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v74;
    v7 = NSArray_ptr;
    v63 = *(_QWORD *)v74;
    do
    {
      v8 = 0;
      v64 = v5;
      do
      {
        if (*(_QWORD *)v74 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "speakableText"));

        if (v10)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "speakableText"));
          v13 = objc_msgSend(v12, "length");

          if (v13)
          {
            v14 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              v15 = v14;
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "speakableText"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aceId"));
              v18 = sub_100038230(a4);
              v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
              *(_DWORD *)buf = 136315906;
              v79 = "+[SRModeDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              v80 = 2112;
              v81 = v16;
              v82 = 2112;
              v83 = v17;
              v84 = 2112;
              v85 = v19;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableText '%@' from view %@ for current mode: %@", buf, 0x2Au);

            }
          }
          objc_msgSend(v9, "setSpeakableText:", 0);
        }
        objc_opt_class(v7[97], v11);
        if ((objc_opt_isKindOfClass(v9, v20) & 1) != 0)
        {
          v21 = v9;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "speakableSuffix"));
          v23 = objc_msgSend(v22, "length");

          if (v23)
          {
            v24 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              v25 = v24;
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "speakableSuffix"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "aceId"));
              v28 = sub_100038230(a4);
              v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
              *(_DWORD *)buf = 136315906;
              v79 = "+[SRModeDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              v80 = 2112;
              v81 = v26;
              v82 = 2112;
              v83 = v27;
              v84 = 2112;
              v85 = v29;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableSuffix '%@' from SAUIDisambiguationList %@ for current mode: %@", buf, 0x2Au);

            }
          }
          objc_msgSend(v21, "setSpeakableSuffix:", 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "speakableDelimiter"));
          v31 = objc_msgSend(v30, "length");

          if (v31)
          {
            v32 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              v33 = v32;
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "speakableDelimiter"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "aceId"));
              v36 = sub_100038230(a4);
              v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
              *(_DWORD *)buf = 136315906;
              v79 = "+[SRModeDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              v80 = 2112;
              v81 = v34;
              v82 = 2112;
              v83 = v35;
              v84 = 2112;
              v85 = v37;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableDelimiter '%@' from SAUIDisambiguationList %@ for current mode: %@", buf, 0x2Au);

            }
          }
          v67 = v8;
          objc_msgSend(v21, "setSpeakableDelimiter:", 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "speakableFinalDelimiter"));
          v39 = objc_msgSend(v38, "length");

          if (v39)
          {
            v40 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              v41 = v40;
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "speakableFinalDelimiter"));
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "aceId"));
              v44 = sub_100038230(a4);
              v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
              *(_DWORD *)buf = 136315906;
              v79 = "+[SRModeDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              v80 = 2112;
              v81 = v42;
              v82 = 2112;
              v83 = v43;
              v84 = 2112;
              v85 = v45;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableFinalDelimiter '%@' from SAUIDisambiguationList %@ for current mode: %@", buf, 0x2Au);

            }
          }
          objc_msgSend(v21, "setSpeakableFinalDelimiter:", 0);
          v66 = v21;
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "items"));
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
          if (v47)
          {
            v48 = v47;
            v49 = *(_QWORD *)v70;
            do
            {
              for (i = 0; i != v48; i = (char *)i + 1)
              {
                if (*(_QWORD *)v70 != v49)
                  objc_enumerationMutation(v46);
                v51 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "speakableText"));
                v53 = objc_msgSend(v52, "length");

                if (v53)
                {
                  v54 = (void *)AFSiriLogContextConnection;
                  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
                  {
                    v55 = v54;
                    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "speakableText"));
                    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "aceId"));
                    v58 = sub_100038230(a4);
                    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
                    *(_DWORD *)buf = 136315906;
                    v79 = "+[SRModeDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
                    v80 = 2112;
                    v81 = v56;
                    v82 = 2112;
                    v83 = v57;
                    v84 = 2112;
                    v85 = v59;
                    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableText '%@' from SAUIListItem %@ for current mode: %@", buf, 0x2Au);

                  }
                }
                objc_msgSend(v51, "setSpeakableText:", 0);
              }
              v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
            }
            while (v48);
          }
          objc_msgSend(v66, "setItems:", v46);

          v6 = v63;
          v5 = v64;
          v7 = NSArray_ptr;
          v8 = v67;
        }
        v8 = (char *)v8 + 1;
      }
      while (v8 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
    }
    while (v5);
  }
  v60 = objc_msgSend(v62, "copy");
  objc_msgSend(v60, "setViews:", obj);

  return v60;
}

+ (id)_removeUtteranceViewsFromAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _UNKNOWN **v17;
  void *i;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "views"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_firstSnippetInViews:", v6));
  v8 = (void *)v7;
  if (v7)
  {
    v43 = a1;
    v45 = (void *)v7;
    v47 = v5;
    v9 = objc_alloc_init((Class)NSMutableArray);
    v50 = objc_alloc_init((Class)NSMutableArray);
    v10 = objc_alloc_init((Class)NSMutableArray);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v46 = v6;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    if (v12)
    {
      v14 = v12;
      v15 = *(_QWORD *)v52;
      v16 = 1;
      v17 = NSArray_ptr;
      v48 = v10;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v15)
            objc_enumerationMutation(v11);
          v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
          objc_opt_class(v17[91], v13);
          if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
          {
            v21 = v19;
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "speakableText"));

            if (v22)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "speakableText"));
              objc_msgSend(v9, "addObject:", v23);

              v16 = v16 & objc_msgSend(v21, "canUseServerTTS");
            }
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dialogIdentifier", v43));

            if (v24)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dialogIdentifier"));
              objc_msgSend(v50, "addObject:", v25);

            }
            v26 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              v27 = v26;
              v28 = v9;
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dialogIdentifier"));
              v30 = sub_100038230(a4);
              v31 = v14;
              v32 = v15;
              v33 = v16;
              v34 = v11;
              v35 = (void *)objc_claimAutoreleasedReturnValue(v30);
              *(_DWORD *)buf = 136315650;
              v56 = "+[SRModeDialogTransformer _removeUtteranceViewsFromAddViews:forMode:]";
              v57 = 2112;
              v58 = v29;
              v59 = 2112;
              v60 = v35;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing AssistantUtteranceView (%@) for current mode: %@", buf, 0x20u);

              v11 = v34;
              v16 = v33;
              v15 = v32;
              v14 = v31;

              v9 = v28;
              v10 = v48;
              v17 = NSArray_ptr;

            }
          }
          else
          {
            objc_msgSend(v10, "addObject:", v19);
          }
        }
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      }
      while (v14);
    }
    else
    {
      LOBYTE(v16) = 1;
    }

    v8 = v45;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "speakableText"));

    v5 = v47;
    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "speakableText"));
      objc_msgSend(v9, "addObject:", v38);

    }
    v6 = v46;
    if (objc_msgSend(v9, "count", v43))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n")));
      objc_msgSend(v45, "setSpeakableText:", v39);
      objc_msgSend(v45, "setCanUseServerTTS:", v16 & 1);

    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "_instrumentation"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "aceId"));
    objc_msgSend(v40, "setDialogIdentifiers:forAceViewSpeakableTextWithIdentifier:", v50, v41);

    v36 = objc_msgSend(v47, "copy");
    objc_msgSend(v36, "setViews:", v10);

  }
  else
  {
    v36 = v5;
  }

  return v36;
}

+ (id)_transformDialogAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void *v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _BYTE v49[128];

  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v34 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "views"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    v35 = v8;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dialog"));
        if (!v14)
        {
          objc_msgSend(v7, "addObject:", v13);
          goto LABEL_16;
        }
        if (objc_msgSend(a1, "_alwaysPrintSiriResponse"))
        {
          v16 = AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v44 = "+[SRModeDialogTransformer _transformDialogAddViews:forMode:]";
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s #modes alwaysPrintSiriResponse = YES", buf, 0xCu);
          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_utteranceViewForDialog:mode:printedOnly:", v14, a4, objc_msgSend(v14, "printedOnly")));
          v48[0] = v17;
          v48[1] = v13;
          v18 = v48;
          goto LABEL_15;
        }
        objc_opt_class(SAUIButton, v15);
        if ((objc_opt_isKindOfClass(v13, v19) & 1) != 0
          || (objc_opt_class(SAUIConfirmationView, v20), (objc_opt_isKindOfClass(v13, v21) & 1) != 0))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_utteranceViewForDialog:mode:printedOnly:", v14, a4, 0));
          v47[0] = v17;
          v47[1] = v13;
          v18 = v47;
LABEL_15:
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
          objc_msgSend(v7, "addObjectsFromArray:", v22);

          goto LABEL_16;
        }
        if (a4 < 2)
        {
          if (objc_msgSend(v14, "printedOnly"))
          {
            v23 = v13;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_utteranceViewForDialog:mode:printedOnly:", v14, a4, 1));
            objc_msgSend(v7, "addObject:", v24);

          }
          else
          {
            v23 = objc_msgSend(v13, "copy");
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_speakableTextForDialog:mode:", v14, a4));
            objc_msgSend(v23, "setSpeakableText:", v28);

            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_instrumentation"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dialogIdentifier"));
            v42 = v36;
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "aceId"));
            objc_msgSend(v37, "setDialogIdentifiers:forAceViewSpeakableTextWithIdentifier:", v29, v30);

            v8 = v35;
          }
          goto LABEL_30;
        }
        if (a4 == 2)
        {
          if (objc_msgSend(v14, "spokenOnly"))
          {
            v25 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              v26 = v25;
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dialogIdentifier"));
              *(_DWORD *)buf = 136315394;
              v44 = "+[SRModeDialogTransformer _transformDialogAddViews:forMode:]";
              v45 = 2112;
              v46 = v27;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s #modes IGNORING Dialog (%@) for Silent Mode since it is Spoken Only", buf, 0x16u);

              v8 = v35;
              goto LABEL_28;
            }
          }
          else
          {
            v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_utteranceViewForDialog:mode:printedOnly:", v14, 2, 0));
            objc_msgSend(v7, "addObject:", v26);
LABEL_28:

          }
          v23 = v13;
          goto LABEL_30;
        }
        v23 = 0;
LABEL_30:
        objc_msgSend(v7, "addObject:", v23);

LABEL_16:
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v31 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
      v10 = v31;
    }
    while (v31);
  }

  v32 = objc_msgSend(v34, "copy");
  objc_msgSend(v32, "setViews:", v7);

  return v32;
}

+ (id)_utteranceViewForDialog:(id)a3 mode:(unint64_t)a4 printedOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v52;
  const char *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;

  v5 = a5;
  v8 = a3;
  v9 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dialogIdentifier"));
    v12 = sub_100038230(a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v52 = 136315650;
    v53 = "+[SRModeDialogTransformer _utteranceViewForDialog:mode:printedOnly:]";
    v54 = 2112;
    v55 = v11;
    v56 = 2112;
    v57 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming Dialog (%@) into an Utterance View for current mode: %@", (uint8_t *)&v52, 0x20u);

  }
  v14 = objc_alloc_init((Class)SAUIAssistantUtteranceView);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aceId"));
  objc_msgSend(v14, "setAceId:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "refId"));
  objc_msgSend(v14, "setRefId:", v16);

  objc_msgSend(v14, "setCanUseServerTTS:", objc_msgSend(v8, "canUseServerTTS"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "context"));
  objc_msgSend(v14, "setContext:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dialogIdentifier"));
  objc_msgSend(v14, "setDialogIdentifier:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metricsContext"));
  objc_msgSend(v14, "setMetricsContext:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[AFAccessibilityObserver sharedObserver](AFAccessibilityObserver, "sharedObserver"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "state"));
  v23 = objc_msgSend(v22, "isVoiceOverTouchEnabled");

  if (a4 != 2 || v23 != (id)2)
  {
    if (v5)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
      v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "text"));

      v29 = (void *)AFSiriLogContextConnection;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
LABEL_27:
        v37 = 0;
        goto LABEL_31;
      }
      v30 = v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dialogIdentifier"));
      v52 = 136315394;
      v53 = "+[SRModeDialogTransformer _utteranceViewForDialog:mode:printedOnly:]";
      v54 = 2112;
      v55 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming Dialog (%@) when printedOnly is true", (uint8_t *)&v52, 0x16u);
LABEL_26:

      goto LABEL_27;
    }
    if (a4)
    {
      if (a4 != 1)
      {
        if (a4 != 2)
        {
          v37 = 0;
          v27 = 0;
          goto LABEL_31;
        }
        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "caption"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject text](v30, "text"));
        v31 = v32;
        if (v32)
        {
          v27 = v32;
        }
        else
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
          v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "text"));

        }
        goto LABEL_26;
      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "caption"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "text"));
      v48 = v47;
      if (v47)
      {
        v27 = v47;
      }
      else
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
        v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "text"));

      }
      v43 = a1;
      v44 = v8;
      v45 = 1;
    }
    else
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
      v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "text"));

      v43 = a1;
      v44 = v8;
      v45 = 0;
    }
    v37 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "_speakableTextForDialog:mode:", v44, v45));
    goto LABEL_31;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "caption"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "text"));
  v26 = v25;
  if (v25)
  {
    v27 = v25;
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
    v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "text"));

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "speakableTextOverride"));
  v36 = v35;
  if (v35)
  {
    v37 = v35;
  }
  else
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
    v37 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "text"));

  }
  v39 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v40 = v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dialogIdentifier"));
    v52 = 136315394;
    v53 = "+[SRModeDialogTransformer _utteranceViewForDialog:mode:printedOnly:]";
    v54 = 2112;
    v55 = v41;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming Dialog (%@) CONTENT into speakable text for Voice Over", (uint8_t *)&v52, 0x16u);

  }
LABEL_31:
  objc_msgSend(v14, "setText:", v27);
  objc_msgSend(v14, "setSpeakableText:", v37);

  return v14;
}

+ (id)_speakableTextForDialog:(id)a3 mode:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BYTE v27[24];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFAccessibilityObserver sharedObserver](AFAccessibilityObserver, "sharedObserver"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "state"));
  v8 = objc_msgSend(v7, "isVoiceOverTouchEnabled");

  switch(a4)
  {
    case 0uLL:
      v12 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dialogIdentifier"));
        *(_DWORD *)v27 = 136315394;
        *(_QWORD *)&v27[4] = "+[SRModeDialogTransformer _speakableTextForDialog:mode:]";
        *(_WORD *)&v27[12] = 2112;
        *(_QWORD *)&v27[14] = v14;
        v15 = "%s #modes Transforming Dialog (%@) CONTENT into speakable text for Voice Mode";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, v27, 0x16u);

      }
LABEL_20:
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "content", *(_OWORD *)v27, *(_QWORD *)&v27[16]));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "speakableTextOverride"));
      if (v23)
      {
LABEL_21:
        v8 = v23;
LABEL_24:

        break;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "content"));
LABEL_23:
      v25 = v24;
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "text"));

      goto LABEL_24;
    case 1uLL:
      if (v8 == (id)2)
      {
        v16 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v16;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dialogIdentifier"));
          *(_DWORD *)v27 = 136315394;
          *(_QWORD *)&v27[4] = "+[SRModeDialogTransformer _speakableTextForDialog:mode:]";
          *(_WORD *)&v27[12] = 2112;
          *(_QWORD *)&v27[14] = v14;
          v15 = "%s #modes Transforming Dialog (%@) CONTENT into speakable text for Mixed Mode with Voice Over";
          goto LABEL_19;
        }
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "caption"));

        v18 = (void *)AFSiriLogContextConnection;
        v19 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (v19)
          {
            v20 = v18;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dialogIdentifier"));
            *(_DWORD *)v27 = 136315394;
            *(_QWORD *)&v27[4] = "+[SRModeDialogTransformer _speakableTextForDialog:mode:]";
            *(_WORD *)&v27[12] = 2112;
            *(_QWORD *)&v27[14] = v21;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming Dialog (%@) CAPTION into speakable text for Mixed Mode", v27, 0x16u);

          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "caption"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "speakableTextOverride"));
          if (v23)
            goto LABEL_21;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "caption"));
          goto LABEL_23;
        }
        if (v19)
        {
          v13 = v18;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dialogIdentifier"));
          *(_DWORD *)v27 = 136315394;
          *(_QWORD *)&v27[4] = "+[SRModeDialogTransformer _speakableTextForDialog:mode:]";
          *(_WORD *)&v27[12] = 2112;
          *(_QWORD *)&v27[14] = v14;
          v15 = "%s #modes Transforming Dialog (%@) CONTENT into speakable text for Mixed Mode (Caption is nil)";
          goto LABEL_19;
        }
      }
      goto LABEL_20;
    case 2uLL:
      v9 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dialogIdentifier"));
        *(_DWORD *)v27 = 136315394;
        *(_QWORD *)&v27[4] = "+[SRModeDialogTransformer _speakableTextForDialog:mode:]";
        *(_WORD *)&v27[12] = 2112;
        *(_QWORD *)&v27[14] = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #modes IGNORING Dialog (%@) speakable text for Silent Mode", v27, 0x16u);

      }
      v8 = 0;
      break;
  }

  return v8;
}

+ (id)_sayItForDialog:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
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
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;

  v3 = a3;
  v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dialogIdentifier"));
    v23 = 136315394;
    v24 = "+[SRModeDialogTransformer _sayItForDialog:]";
    v25 = 2112;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming Dialog (%@) into a SayIt", (uint8_t *)&v23, 0x16u);

  }
  v7 = objc_alloc_init((Class)SAUISayIt);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aceId"));
  objc_msgSend(v7, "setAceId:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "refId"));
  objc_msgSend(v7, "setRefId:", v9);

  objc_msgSend(v7, "setCanUseServerTTS:", objc_msgSend(v3, "canUseServerTTS"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "context"));
  objc_msgSend(v7, "setContext:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dialogIdentifier"));
  objc_msgSend(v7, "setDialogIdentifier:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "gender"));
  objc_msgSend(v7, "setGender:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configuration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "languageCode"));
  objc_msgSend(v7, "setLanguageCode:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "content"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "speakableTextOverride"));
  if (v18)
  {
    objc_msgSend(v7, "setMessage:", v18);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "content"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "text"));
    objc_msgSend(v7, "setMessage:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metricsContext"));
  objc_msgSend(v7, "setMetricsContext:", v21);

  return v7;
}

+ (id)_addViewsForAddDialogs:(id)a3 views:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;

  v5 = a3;
  v6 = a4;
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aceId"));
    v20 = 136315394;
    v21 = "+[SRModeDialogTransformer _addViewsForAddDialogs:views:]";
    v22 = 2112;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming AddDialog (aceId = %@) into an AddViews", (uint8_t *)&v20, 0x16u);

  }
  v10 = objc_alloc_init((Class)SAUIAddViews);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aceId"));
  objc_msgSend(v10, "setAceId:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "refId"));
  objc_msgSend(v10, "setRefId:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metricsContext"));
  objc_msgSend(v10, "setMetricsContext:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "listenAfterSpeaking"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "listenAfterSpeaking"));
    objc_msgSend(v15, "setListenAfterSpeaking:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "listenAfterSpeakingBehavior"));
    objc_msgSend(v17, "setListenAfterSpeakingBehavior:", v18);

  }
  objc_msgSend(v10, "setViews:", v6);

  return v10;
}

+ (void)_logModeComputationForAceCommand:(id)a3 mode:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aceId"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aceId"));
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("aceId"));

    v9 = sub_100038794(a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("mode"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "encodedClassName"));
    objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("aceClass"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_analytics"));
    objc_msgSend(v12, "logEventWithType:context:", 5602, v7);

  }
}

+ (id)_analytics
{
  return +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
}

+ (id)_instrumentation
{
  return +[SRUIFInstrumentationManager sharedManager](SRUIFInstrumentationManager, "sharedManager");
}

@end
