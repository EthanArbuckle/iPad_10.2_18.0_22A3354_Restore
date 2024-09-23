@implementation SAUISnippet

- (id)_callHistoryRowsForCalls:(id)a3 callOperation:(id)a4
{
  id v5;
  void (**v6)(id, void *, id);
  id v7;
  void *i;
  void *v9;
  id v10;
  void *v11;
  __CFString *v12;
  id v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  id obj;
  uint64_t v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];

  v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  v28 = objc_alloc_init((Class)NSMutableArray);
  v7 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v7, "setFormattingContext:", 3);
  objc_msgSend(v7, "setDateStyle:", 1);
  v25 = v7;
  objc_msgSend(v7, "setTimeStyle:", 0);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v29)
  {
    v27 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v27)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v10 = objc_alloc_init((Class)SFRowCardSection);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "callTime"));
        if (objc_msgSend(v11, "_isToday"))
        {
          v12 = CFSTR("TODAY");
        }
        else
        {
          if (!objc_msgSend(v11, "_isYesterday"))
          {
            if (objc_msgSend(v11, "_isWithinTheLastTimePeriodInDays:", 7))
            {
              v15 = v25;
              v16 = CFSTR("EEEE");
            }
            else
            {
              v15 = v25;
              v16 = 0;
            }
            objc_msgSend(v15, "setDateFormat:", v16);
            v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringFromDate:", v11));
            goto LABEL_15;
          }
          v12 = CFSTR("YESTERDAY");
        }
        v13 = sub_10005B08C(v12);
        v14 = objc_claimAutoreleasedReturnValue(v13);
LABEL_15:
        v17 = (void *)v14;
        v18 = objc_alloc_init((Class)SFRichText);
        v19 = objc_alloc_init((Class)SFFormattedText);
        objc_msgSend(v19, "setText:", v17);
        objc_msgSend(v19, "setTextColor:", 0);
        v34 = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
        objc_msgSend(v18, "setFormattedTextPieces:", v20);

        objc_msgSend(v10, "setTrailingText:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
        objc_msgSend(v10, "setCardSectionId:", v22);

        if (v6)
          v6[2](v6, v9, v10);
        objc_msgSend(v28, "addObject:", v10);

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v29);
  }

  v23 = objc_msgSend(v28, "copy");
  return v23;
}

- (id)_searchCallHistoryIntentForVoicemail:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = a3;
  v4 = objc_alloc((Class)INSearchCallHistoryIntent);
  if (v3)
    v5 = 16;
  else
    v5 = 15;
  v6 = objc_msgSend(v4, "initWithDateCreated:recipient:callCapabilities:callTypes:unseen:", 0, 0, 3, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backingStore"));
  objc_opt_class(v7, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    v10 = v7;
    v11 = objc_alloc_init((Class)_INPBIntentMetadata);
    objc_msgSend(v11, "setLaunchId:", CFSTR("com.apple.mobilephone"));
    objc_msgSend(v10, "setIntentMetadata:", v11);
    objc_msgSend(v6, "setBackingStore:", v10);

  }
  return v6;
}

- (id)_searchCallHistoryIntentResponseForCallRecords:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)INSearchCallHistoryIntentResponse), "initWithCode:userActivity:", 7, 0);
  objc_msgSend(v4, "setCallRecords:", v3);

  return v4;
}

- (void)sr_applySnippetProperties:(id)a3
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
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aceId"));
  -[SAUISnippet setAceId:](self, "setAceId:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "refId"));
  -[SAUISnippet setRefId:](self, "setRefId:", v6);

  -[SAUISnippet setCanBeRefreshed:](self, "setCanBeRefreshed:", objc_msgSend(v4, "canBeRefreshed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "speakableContextInfo"));
  -[SAUISnippet setSpeakableContextInfo:](self, "setSpeakableContextInfo:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
  -[SAUISnippet setContext:](self, "setContext:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deferredRendering"));
  -[SAUISnippet setDeferredRendering:](self, "setDeferredRendering:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "listenAfterSpeaking"));
  -[SAUISnippet setListenAfterSpeaking:](self, "setListenAfterSpeaking:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "speakableText"));
  -[SAUISnippet setSpeakableText:](self, "setSpeakableText:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewId"));
  -[SAUISnippet setViewId:](self, "setViewId:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "confirmationOptions"));
  -[SAUISnippet setConfirmationOptions:](self, "setConfirmationOptions:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  -[SAUISnippet setTitle:](self, "setTitle:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subtitle"));
  -[SAUISnippet setSubtitle:](self, "setSubtitle:", v15);

  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "summaryTitle"));
  -[SAUISnippet setSummaryTitle:](self, "setSummaryTitle:", v16);

}

@end
