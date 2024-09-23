@implementation ATXSuggestedPagesUtils

+ (unint64_t)modeForSuggestedPageType:(int64_t)a3
{
  NSObject *v5;

  if ((unint64_t)a3 < 0xD)
    return qword_1C9E806A0[a3];
  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    +[ATXSuggestedPagesUtils modeForSuggestedPageType:].cold.1(a3, v5);

  return 16;
}

+ (id)semanticTypeForSuggestedPageType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;

  v6 = 0;
  v7 = 0;
  switch(a3)
  {
    case 0:
    case 1:
      return v7;
    case 2:
      v6 = -1;
      goto LABEL_13;
    case 4:
      v6 = 1;
      goto LABEL_13;
    case 5:
      v6 = 2;
      goto LABEL_13;
    case 6:
      v6 = 3;
      goto LABEL_13;
    case 7:
      v6 = 4;
      goto LABEL_13;
    case 8:
      v6 = 5;
      goto LABEL_13;
    case 9:
      v6 = 6;
      goto LABEL_13;
    case 10:
      v6 = 7;
      goto LABEL_13;
    case 11:
      v6 = 8;
      goto LABEL_13;
    case 12:
      v6 = 9;
      goto LABEL_13;
    default:
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6, v3, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
  }
}

+ (id)createSmallStack
{
  return (id)objc_msgSend(a1, "_createStackOfSize:", 0);
}

+ (id)createMediumStack
{
  return (id)objc_msgSend(a1, "_createStackOfSize:", 1);
}

+ (id)createLargeStack
{
  return (id)objc_msgSend(a1, "_createStackOfSize:", 2);
}

+ (id)_createStackOfSize:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x1E0CF8E98]);
  objc_msgSend(v4, "setStackLayoutSize:", a3);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v6);

  return v4;
}

+ (id)filterWidgets:(id)a3 bySize:(unint64_t)a4 usedPersonalities:(id)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        v14 = objc_alloc(MEMORY[0x1E0CF9220]);
        objc_msgSend(v13, "extensionBundleId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "widgetKind");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v14, "initWithExtensionBundleId:kind:", v15, v16);

        if ((objc_msgSend(v7, "containsObject:", v17) & 1) == 0 && objc_msgSend(v13, "size") == a4)
          objc_msgSend(v19, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  return v19;
}

+ (void)evenlyDistributeWidgets:(id)a3 inRange:(_NSRange)a4 amongStacks:(id)a5 usedPersonalities:(id)a6 maxWidgetsInStack:(unint64_t)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  NSUInteger v19;
  NSUInteger v20;
  unint64_t v21;

  length = a4.length;
  location = a4.location;
  v12 = a5;
  v13 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __106__ATXSuggestedPagesUtils_evenlyDistributeWidgets_inRange_amongStacks_usedPersonalities_maxWidgetsInStack___block_invoke;
  v16[3] = &unk_1E82E76B0;
  v19 = location;
  v20 = length;
  v21 = a7;
  v17 = v12;
  v18 = v13;
  v14 = v13;
  v15 = v12;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v16);

}

void __106__ATXSuggestedPagesUtils_evenlyDistributeWidgets_inRange_amongStacks_usedPersonalities_maxWidgetsInStack___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = a3 >= v6;
  v7 = a3 - v6;
  v8 = !v8 || v7 >= *(_QWORD *)(a1 + 56);
  if (!v8)
  {
    v23 = v5;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 % objc_msgSend(*(id *)(a1 + 32), "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "widgets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = *(_QWORD *)(a1 + 64);

    if (v11 != v12)
    {
      objc_msgSend(v9, "widgets");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        v15 = v13;
      else
        v15 = (id)objc_opt_new();
      v16 = v15;

      objc_msgSend(v16, "arrayByAddingObject:", v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWidgets:", v17);

      v18 = *(void **)(a1 + 40);
      v19 = objc_alloc(MEMORY[0x1E0CF9220]);
      objc_msgSend(v23, "extensionBundleId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "widgetKind");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v19, "initWithExtensionBundleId:kind:", v20, v21);
      objc_msgSend(v18, "addObject:", v22);

    }
    v5 = v23;
  }

}

+ (id)sortWidgetsByDescendingScore:(id)a3 limit:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v9 = objc_msgSend(v5, "count");
    if (v9 >= a4)
      v10 = a4;
    else
      v10 = v9;
    objc_msgSend(v8, "subarrayWithRange:", 0, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v8;
  }
  v12 = v11;

  return v12;
}

+ (void)modeForSuggestedPageType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "ATXSuggestedPagesUtils: unhandled page type: %ld", (uint8_t *)&v2, 0xCu);
}

@end
