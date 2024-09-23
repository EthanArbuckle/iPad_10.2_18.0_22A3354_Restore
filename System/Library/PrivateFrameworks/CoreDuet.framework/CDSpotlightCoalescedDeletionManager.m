@implementation CDSpotlightCoalescedDeletionManager

id __60___CDSpotlightCoalescedDeletionManager_setupCoalescingTimer__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  int v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;
  if (v7)
  {
    *a4 = objc_msgSend(v8, "addDeletion:", v7);
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("YES");
      if (!*a4)
        v11 = CFSTR("NO");
      v13 = 138412546;
      v14 = v7;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_INFO, "_CDSpotlightCoalescedDeletionManager coalescing new deletion operation: %@, change was consequential: %@", (uint8_t *)&v13, 0x16u);
    }

  }
  return v9;
}

void __60___CDSpotlightCoalescedDeletionManager_setupCoalescingTimer__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_DEFAULT, "_CDSpotlightCoalescedDeletionManager running coalesced delete operation: %@", buf, 0xCu);
  }

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60___CDSpotlightCoalescedDeletionManager_setupCoalescingTimer__block_invoke_10;
  v5[3] = &unk_1E26E6AA8;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "enumerateDeletionPredicatesAndCompletionsWithBlock:", v5);

}

void __60___CDSpotlightCoalescedDeletionManager_setupCoalescingTimer__block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60___CDSpotlightCoalescedDeletionManager_setupCoalescingTimer__block_invoke_2;
  v8[3] = &unk_1E26E66F8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "deleteKnowledgeEventsMatchingPredicate:withCompletion:", a2, v8);

}

void __60___CDSpotlightCoalescedDeletionManager_setupCoalescingTimer__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x193FEE914](v7);
        (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v8 = v7;
    }
    while (v7);
  }

}

@end
