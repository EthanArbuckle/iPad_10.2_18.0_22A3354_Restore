@implementation CDInteraction

void __29___CDInteraction__internPool__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x193FEE914]();
  v1 = objc_opt_new();
  v2 = (void *)_internPool__pasExprOnceResult;
  _internPool__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

uint64_t __67___CDInteraction_generateConversationIdFromObjectsWithIdentifiers___block_invoke(uint64_t a1, void **a2, id *a3)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = *a2;
  v4 = *a3;
  v5 = v3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "compare:options:", v7, 3);
  return v8;
}

void __67___CDInteraction_recipientIdentifiersFromMobileMailConversationId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "rangeOfString:options:", CFSTR("%"), 2) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  }
  else
  {
    v3 = (void *)MEMORY[0x193FEE914]();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v8, "stringByRemovingPercentEncoding");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (const __CFString *)v5;
    else
      v7 = &stru_1E26E9728;
    objc_msgSend(v4, "addObject:", v7);

    objc_autoreleasePoolPop(v3);
  }

}

void __78___CDInteraction_fetchAndAddShareSheetContentToInteractionWithKnowledgeStore___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (objc_msgSend(v2, "state") == 1)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __78___CDInteraction_fetchAndAddShareSheetContentToInteractionWithKnowledgeStore___block_invoke_cold_1(v2, v3);

  }
}

void __78___CDInteraction_fetchAndAddShareSheetContentToInteractionWithKnowledgeStore___block_invoke_506(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _DKSource *v17;
  void *v18;
  _DKSource *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  objc_msgSend(v22, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "targetBundleID");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "targetBundleID");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(*(id *)(a1 + 32), "allObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "targetBundleID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "containsObject:", v10);

        if (!v11)
          goto LABEL_8;
      }
      else
      {

      }
      objc_msgSend(*(id *)(a1 + 40), "metadataFromFeedbackEvent:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v22, "timestamp");
      objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v22, "timestamp");
      objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = [_DKSource alloc];
      objc_msgSend(v4, "sourceBundleID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[_DKSource initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:](v17, "initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:", CFSTR("sharesheet"), v18, 0, 0, 0, 0);

      +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/dummyStream/tempStream"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKEvent eventWithStream:source:startDate:endDate:identifierStringValue:metadata:](_DKEvent, "eventWithStream:source:startDate:endDate:identifierStringValue:metadata:", v20, v19, v14, v16, 0, v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v21);
    }
LABEL_8:

  }
}

void __78___CDInteraction_fetchAndAddShareSheetContentToInteractionWithKnowledgeStore___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_ERROR, "Finalizing local events failed: %@", v4, 0xCu);

}

@end
