@implementation APUIActionContextMenu

+ (id)actionProviderForSearchResult:(id)a3 dismissSearchResultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  char isKindOfClass;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = MEMORY[0x24BDAC760];
  if ((isKindOfClass & 1) == 0)
    goto LABEL_5;
  if (objc_msgSend(v6, "type") != 23)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Suggest Shortcut Less"), &stru_24F87CEF8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("hand.thumbsdown"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDF67B8];
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __82__APUIActionContextMenu_actionProviderForSearchResult_dismissSearchResultHandler___block_invoke;
    v20[3] = &unk_24F87CE90;
    v23 = a1;
    v21 = v6;
    v22 = v7;
    objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v13, v14, 0, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v16);

LABEL_5:
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __82__APUIActionContextMenu_actionProviderForSearchResult_dismissSearchResultHandler___block_invoke_3;
    v18[3] = &unk_24F87CEB8;
    v19 = v8;
    v11 = (void *)MEMORY[0x22E310BCC](v18);

    goto LABEL_6;
  }
  v11 = 0;
LABEL_6:

  return v11;
}

void __82__APUIActionContextMenu_actionProviderForSearchResult_dismissSearchResultHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  dispatch_get_global_queue(9, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__APUIActionContextMenu_actionProviderForSearchResult_dismissSearchResultHandler___block_invoke_2;
  v7[3] = &unk_24F87CE68;
  v9 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 32);
  dispatch_async(v2, v7);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v3, v4, v5);

}

uint64_t __82__APUIActionContextMenu_actionProviderForSearchResult_dismissSearchResultHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_handleSuggestionDismissedWithATXActionSearchResult:", *(_QWORD *)(a1 + 32));
}

uint64_t __82__APUIActionContextMenu_actionProviderForSearchResult_dismissSearchResultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDF6BA8], "menuWithTitle:children:", &stru_24F87CEF8, *(_QWORD *)(a1 + 32));
}

+ (void)_handleSuggestionDismissedWithATXActionSearchResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
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
  uint64_t v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "actionResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blendingModelUICacheUpdateUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "proactiveSuggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v9 = (void *)MEMORY[0x24BE041E0];
      objc_msgSend(v7, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_opt_new();
      objc_msgSend(v9, "actionSuggestionContextMenuDismissOnceEventWithSuggestionId:actionBlendingCacheId:date:", v11, v6, v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x24BE04210], "uiEventWithSpotlightEvent:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "donateGenericUIEvent:", v15);

      objc_msgSend(MEMORY[0x24BE04130], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addHiddenSuggestion:duration:engagementRecordType:", v8, 120, *MEMORY[0x24BE04220]);

      v17 = (void *)objc_opt_new();
      objc_msgSend(v17, "removeActionPredictionNotificationsMatchingSuggestion:reply:", v8, 0);

      v18 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x24BE04128], "logContextMenuFeedbackForDismissOnceWithSuggestion:consumerSubType:tracker:", v8, 21, v18);
      objc_msgSend(MEMORY[0x24BE04178], "logUserInteractionFeedbackWithEngagementType:consumerSubType:tracker:", 1, 21, v18);
      __atxlog_handle_feedback();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "uuid");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "UUIDString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "executableSpecification");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "executableDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "executableSpecification");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v38 = v20;
        v39 = 2112;
        v40 = v21;
        v41 = 2048;
        v42 = objc_msgSend(v22, "executableType");
        _os_log_impl(&dword_22D2AC000, v19, OS_LOG_TYPE_DEFAULT, "handled dismiss once in zkw actions for suggestion with uuid: %@ executable description: %@ executable type: %ld", buf, 0x20u);

      }
    }
    else
    {
      __atxlog_handle_feedback();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[APUIActionContextMenu _handleSuggestionDismissedWithATXActionSearchResult:].cold.2((uint64_t)v3, v13, v29, v30, v31, v32, v33, v34);
    }
  }
  else
  {
    __atxlog_handle_feedback();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[APUIActionContextMenu _handleSuggestionDismissedWithATXActionSearchResult:].cold.1((uint64_t)v3, v13, v23, v24, v25, v26, v27, v28);
  }

}

+ (void)_handleSuggestionDismissedWithATXActionSearchResult:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D2AC000, a2, a3, "could not find dismissed proactive suggestion for action search result: %@", a5, a6, a7, a8, 2u);
}

+ (void)_handleSuggestionDismissedWithATXActionSearchResult:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D2AC000, a2, a3, "could not find blending cache id for action search result: %@", a5, a6, a7, a8, 2u);
}

@end
