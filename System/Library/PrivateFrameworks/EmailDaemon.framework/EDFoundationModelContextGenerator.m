@implementation EDFoundationModelContextGenerator

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__EDFoundationModelContextGenerator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_32 != -1)
    dispatch_once(&log_onceToken_32, block);
  return (id)log_log_32;
}

void __40__EDFoundationModelContextGenerator_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_32;
  log_log_32 = (uint64_t)v1;

}

+ (id)originalContentMessageForMessage:(id)a3 limitOfInReplyToAncestors:(unint64_t)a4 checkForForwardedMessages:(BOOL)a5 messagePersistence:(id)a6 htmlStringFromMessage:(id)a7 error:(id *)a8
{
  _BOOL4 v11;
  id v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id *v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  uint8_t v42[128];
  uint8_t buf[16];
  uint64_t v44;

  v11 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v35 = a6;
  v36 = a7;
  v34 = v14;
  if (!v14)
    goto LABEL_24;
  if (v11)
  {
    objc_msgSend(v14, "subject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hasForwardPrefix");

    if (v16)
    {
      if (a8)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Replying to forwarded message, failed to generate any original-content messages"));
        v17 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
LABEL_24:
      v17 = 0;
      goto LABEL_29;
    }
  }
  v18 = v14;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = a8;
  v20 = 0;
  v21 = objc_msgSend(v19, "count") + a4;
  do
  {
    if (objc_msgSend(v19, "count") >= v21)
      break;
    if (v20)
      break;
    v41 = 0;
    objc_msgSend(a1, "_messageInReplyToMessage:messagePersistence:error:", v18, v35, &v41);
    v22 = objc_claimAutoreleasedReturnValue();
    v20 = v41;
    objc_msgSend(v19, "ef_addOptionalObject:", v22);

    v18 = (id)v22;
  }
  while (v22);
  if (v20)
  {
    +[EDFoundationModelContextGenerator log](EDFoundationModelContextGenerator, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v20, "description");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDFoundationModelContextGenerator originalContentMessageForMessage:limitOfInReplyToAncestors:checkForForwardedMessages:messagePersistence:htmlStringFromMessage:error:].cold.1(v24, buf, v23);
    }

  }
  v25 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v26 = v19;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v38;
LABEL_16:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v28)
        objc_enumerationMutation(v26);
      objc_msgSend(a1, "originalContentMessageForPersistedMessage:htmlStringFromMessage:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v29), v36);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
        break;
      objc_msgSend(v25, "addObject:", v30);

      if (v27 == ++v29)
      {
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        if (v27)
          goto LABEL_16;
        break;
      }
    }
  }

  objc_msgSend(v25, "ef_filter:", &__block_literal_global_18);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "count"))
  {
    v17 = v31;
  }
  else if (v33)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Failed to generate any original-content messages"));
    v17 = 0;
    *v33 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

LABEL_29:
  return v17;
}

uint64_t __169__EDFoundationModelContextGenerator_originalContentMessageForMessage_limitOfInReplyToAncestors_checkForForwardedMessages_messagePersistence_htmlStringFromMessage_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "flags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "draft") ^ 1;

  return v3;
}

+ (id)originalContentMessagesForPersistedMessages:(id)a3 htmlStringFromMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(a1, "originalContentMessageForPersistedMessage:htmlStringFromMessage:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), v7, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v8, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v8;
}

+ (id)originalContentMessageForPersistedMessage:(id)a3 htmlStringFromMessage:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  (*((void (**)(id, id))a4 + 2))(a4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v20 = v6;
    objc_msgSend(MEMORY[0x1E0D1E770], "snippetFromHTMLBody:options:maxLength:preservingQuotedForwardedContent:", v6, 32, 0x7FFFFFFFFFFFFFFFLL, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0D1E2B0]);
    objc_msgSend(v5, "searchableMessageID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "subjectString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "senders");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "to");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cc");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "flags");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateReceived");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v7, "initWithSearchableMessageID:bodyText:subject:sender:toList:ccList:flags:date:", v8, v19, v17, v9, v10, v11, v12, v13);

    v6 = v20;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_messageInReplyToMessage:(id)a3 messagePersistence:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v7 = a4;
  objc_msgSend(a3, "headersIfAvailable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "firstMessageIDForKey:", *MEMORY[0x1E0D1E588]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageIDListForKey:", *MEMORY[0x1E0D1E5C0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      v13 = v10;
    }
    else
    {
      objc_msgSend(v11, "lastObject");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v14 = 0;
        goto LABEL_8;
      }
    }
    objc_msgSend(v7, "persistedMessagesForForMessageIDHeader:requireProtectedData:", v13, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    goto LABEL_9;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("No headers available"));
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
LABEL_9:

  return v14;
}

+ (void)originalContentMessageForMessage:(os_log_t)log limitOfInReplyToAncestors:checkForForwardedMessages:messagePersistence:htmlStringFromMessage:error:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Error while generating original-content messages: %@", buf, 0xCu);

}

@end
