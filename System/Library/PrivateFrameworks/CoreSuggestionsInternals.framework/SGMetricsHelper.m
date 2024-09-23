@implementation SGMetricsHelper

+ (id)asyncQueue
{
  if (asyncQueue__pasOnceToken3 != -1)
    dispatch_once(&asyncQueue__pasOnceToken3, &__block_literal_global_24905);
  return (id)asyncQueue__pasExprOnceResult;
}

+ (void)_recordConversationTurnWithDetail:(id)a3 received:(BOOL)a4 throughApp:(id)a5 withStore:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  id v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v8 = a4;
  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (!v11)
  {
    +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v9, "containsString:", CFSTR("@")))
  {
    objc_msgSend(v11, "suggestContactMatchesByPhoneNumber:isMaybe:onlySignificant:", v9, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGContactPipelineHelper findContactsForDetailType:andValue:](SGContactPipelineHelper, "findContactsForDetailType:andValue:", 0, v9);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (id)*MEMORY[0x1E0C967C0];
    if (objc_msgSend(v12, "count"))
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      objc_msgSend(v12, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "contact");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "phones");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v27)
      {
        v28 = v27;
        v39 = v8;
        v40 = v10;
        v18 = 0;
        v29 = *(_QWORD *)v44;
LABEL_17:
        v30 = 0;
        v31 = v18;
        while (1)
        {
          if (*(_QWORD *)v44 != v29)
            objc_enumerationMutation(v15);
          v32 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v30);
          objc_msgSend(v32, "extractionInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "phoneNumber");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v9, "isEqualToString:", v33);

          if ((v34 & 1) != 0)
            goto LABEL_23;
          ++v30;
          v31 = v18;
          if (v28 == v30)
          {
            v28 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            if (v28)
              goto LABEL_17;
            goto LABEL_23;
          }
        }
      }
LABEL_25:
      v18 = 0;
      goto LABEL_26;
    }
LABEL_24:
    v18 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v11, "suggestContactMatchesByEmailAddress:isMaybe:onlySignificant:", v9, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGContactPipelineHelper findContactsForDetailType:andValue:](SGContactPipelineHelper, "findContactsForDetailType:andValue:", 2, v9);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (id)*MEMORY[0x1E0C966A8];
  if (!objc_msgSend(v12, "count"))
    goto LABEL_24;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "emailAddresses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (!v16)
    goto LABEL_25;
  v17 = v16;
  v39 = v8;
  v40 = v10;
  v18 = 0;
  v19 = *(_QWORD *)v48;
LABEL_7:
  v20 = 0;
  v21 = v18;
  while (1)
  {
    if (*(_QWORD *)v48 != v19)
      objc_enumerationMutation(v15);
    v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v20);
    objc_msgSend(v22, "extractionInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "emailAddress");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v9, "isEqualToString:", v23);

    if ((v24 & 1) != 0)
      break;
    ++v20;
    v21 = v18;
    if (v17 == v20)
    {
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v17)
        goto LABEL_7;
      break;
    }
  }
LABEL_23:
  v10 = v40;
  v8 = v39;
LABEL_26:

LABEL_27:
  if (objc_msgSend(v12, "count"))
  {
    v35 = (void *)MEMORY[0x1E0D198F8];
    objc_msgSend(v12, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "contact");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "realtimeContactForNewContact:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v38 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D19950], "recordConversationTurnWithContact:received:curated:throughApp:withDetailName:withDetailExtraction:", v38, v8, objc_msgSend(v42, "count") != 0, v10, v41, v18);

}

+ (void)recordConversationTurnWithDetail:(id)a3 received:(BOOL)a4 throughApp:(id)a5 withStore:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  +[SGMetricsHelper asyncQueue](SGMetricsHelper, "asyncQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__SGMetricsHelper_recordConversationTurnWithDetail_received_throughApp_withStore___block_invoke;
  v16[3] = &unk_1E7DB13E8;
  v20 = a4;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

uint64_t __82__SGMetricsHelper_recordConversationTurnWithDetail_received_throughApp_withStore___block_invoke(uint64_t a1)
{
  return +[SGMetricsHelper _recordConversationTurnWithDetail:received:throughApp:withStore:](SGMetricsHelper, "_recordConversationTurnWithDetail:received:throughApp:withStore:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __29__SGMetricsHelper_asyncQueue__block_invoke()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_BACKGROUND, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("SGMetricsHelper-asyncQueue", v2);
  v4 = (void *)asyncQueue__pasExprOnceResult;
  asyncQueue__pasExprOnceResult = (uint64_t)v3;

  objc_autoreleasePoolPop(v0);
}

@end
