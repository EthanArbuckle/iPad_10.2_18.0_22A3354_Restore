@implementation ICTextController(Checklist)

+ (uint64_t)checklistAutoAlertShown
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("AutoSortChecklistAlertShown"));

  return v1;
}

+ (void)setChecklistAutoAlertShown:()Checklist
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", a3, CFSTR("AutoSortChecklistAlertShown"));

}

+ (uint64_t)checklistAutoSortEnabled
{
  return objc_msgSend(MEMORY[0x1E0D64270], "BOOLForKey:", CFSTR("ICChecklistAutoSortEnabledDefaultsKey"));
}

+ (uint64_t)setChecklistAutoSortEnabled:()Checklist
{
  return objc_msgSend(MEMORY[0x1E0D64270], "setBool:forKey:", a3, CFSTR("ICChecklistAutoSortEnabledDefaultsKey"));
}

- (void)sendTextDidChangeNotificationForTextView:()Checklist
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(v6, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textViewDidChange:", v6);

  }
}

- (void)markAllChecklistItemsCompleted:()Checklist inTextview:forSelectedRanges:
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "rangeValue");
        v16 = objc_msgSend(a1, "expandedRangeForContiguousTodosForRange:textView:", v14, v15, v8);
        v18 = v17;
        objc_msgSend(v8, "textStorage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setDone:range:inTextStorage:", a3, v16, v18, v19);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }
  objc_msgSend(a1, "sendTextDidChangeNotificationForTextView:", v8);

}

- (uint64_t)checklistItemExistsMarkedCompleted:()Checklist inTextView:forRanges:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "todoForRange:inTextStorage:", objc_msgSend(v12, "rangeValue"), 0, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_msgSend(v13, "done");
    if ((_DWORD)a3)
    {
      if ((v14 & 1) != 0)
      {
LABEL_4:
        v15 = 1;
        goto LABEL_17;
      }
    }
    else if (!v14)
    {
      goto LABEL_4;
    }
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    while (2)
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v20), "rangeValue", (_QWORD)v26);
        v23 = objc_msgSend(a1, "expandedRangeForContiguousTodosForRange:textView:", v21, v22, v8);
        if ((objc_msgSend(a1, "containsAnyTodoItemMarkedCompleted:inRange:textStorage:", a3, v23, v24, v10) & 1) != 0)
        {
          v15 = 1;
          goto LABEL_16;
        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v18)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_16:

LABEL_17:
  return v15;
}

- (uint64_t)containsOnlyChecklistItemsInTextView:()Checklist forRange:
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v8 = a3;
  objc_opt_class();
  objc_msgSend(v8, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  ICCheckedDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(a1, "containsOnlyStyle:inRange:inTextStorage:", 103, a4, a5, v10);
  return v11;
}

- (void)removeChecklistItemsMarkedCompleted:()Checklist inTextView:forRanges:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id obj;
  void *v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_opt_class();
  v50 = v7;
  objc_msgSend(v7, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v51 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v8;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v62 != v14)
          objc_enumerationMutation(obj);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "rangeValue");
        v18 = objc_msgSend(a1, "expandedRangeForContiguousTodosForRange:textView:", v16, v17, v50);
        v20 = v19;
        objc_msgSend(v51, "addIndexesInRange:", v18, v19);
        objc_msgSend(a1, "rangesForTodosInRange:markedCompleted:textStorage:", v18, v20, a3, v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v58;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v58 != v24)
                objc_enumerationMutation(v21);
              v26 = objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "rangeValue");
              objc_msgSend(v11, "addIndexesInRange:", v26, v27);
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
          }
          while (v23);
        }
        objc_msgSend(v52, "addObjectsFromArray:", v21);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    }
    while (v13);
  }

  objc_msgSend(v52, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sortedArrayUsingComparator:", &__block_literal_global_19);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v30 = v29;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v54;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v54 != v33)
          objc_enumerationMutation(v30);
        v35 = objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * k), "rangeValue");
        objc_msgSend(v10, "deleteCharactersInRange:", v35, v36);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    }
    while (v32);
  }

  if (objc_msgSend(v30, "count") && objc_msgSend(v11, "isEqualToIndexSet:", v51))
  {
    objc_msgSend(v30, "lastObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "rangeValue");

    objc_msgSend(a1, "todoForRange:inTextStorage:", v38, 0, v10);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      objc_msgSend(v10, "string");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "lineRangeForRange:", v38, 0);
      v42 = v41;

      if (v42)
        objc_msgSend(v10, "replaceCharactersInRange:withString:", v38, 0, CFSTR("\n"));
      objc_msgSend(a1, "setTextStyle:range:inTextStorage:", 103, v38, 0, v10);
    }
    objc_opt_class();
    objc_msgSend(v50, "textStorage");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "safeCharacterRangeForRange:", v38, 0);
    v47 = v46;

    objc_msgSend(v50, "setSelectedRange:", v45, v47);
  }
  objc_msgSend(a1, "sendTextDidChangeNotificationForTextView:", v50);

}

- (uint64_t)moveListItemInDirection:()Checklist inTextView:forRange:
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v32;
  uint64_t v33;
  uint64_t v34;

  v8 = a4;
  objc_msgSend(v8, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "paragraphInfoForCharacterAtIndex:includeChildren:textStorage:", a5, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "validAdjacentParagraphInfoFromParagraphInfo:inDirection:inTextView:", v10, a3, v8);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = 0;
  if (v10 && v11)
  {
    v14 = objc_msgSend(v10, "indent");
    if (v14 < objc_msgSend(v12, "indent"))
    {
      v13 = 0;
      goto LABEL_14;
    }
    v15 = objc_msgSend(v10, "rangeIncludingChildren");
    v17 = v16;
    v18 = objc_msgSend(v12, "rangeIncludingChildren");
    v13 = 0;
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = v18;
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v33 = v19;
        objc_msgSend(v8, "textStorage");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "attributedSubstringFromRange:", v15, v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "paragraphStyle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v20;
        if ((objc_msgSend(v23, "isList") & 1) == 0)
        {
          objc_msgSend(v22, "string");
          v24 = v22;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v25, "ic_isLastCharacterANewline");

          if ((v32 & 1) != 0)
          {
LABEL_11:
            v27 = v33 - v17;
            if (!a3)
              v27 = 0;
            v28 = v34 + v27;
            objc_msgSend(v8, "textStorage");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "deleteCharactersInRange:", v15, v17);

            objc_msgSend(v8, "textStorage");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "insertAttributedString:atIndex:", v24, v28);

            objc_msgSend(v8, "setSelectedRange:", v28, 0);
            objc_msgSend(a1, "sendTextDidChangeNotificationForTextView:", v8);

            v13 = 1;
            goto LABEL_14;
          }
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v24);
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
          objc_msgSend(v23, "appendAttributedString:", v26);

          v22 = (void *)objc_msgSend(v23, "copy");
        }
        v24 = v22;

        goto LABEL_11;
      }
    }
  }
LABEL_14:

  return v13;
}

- (BOOL)canMoveListItemInDirection:()Checklist inTextView:forRange:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;

  v8 = a4;
  objc_msgSend(v8, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "paragraphInfoForCharacterAtIndex:includeChildren:textStorage:", a5, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(a1, "validAdjacentParagraphInfoFromParagraphInfo:inDirection:inTextView:", v10, a3, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 != 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)expandedChecklistTrackedParagraphsInTextView:()Checklist forIndex:
{
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  objc_msgSend(v6, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8 <= a4)
  {
    v13 = 0;
  }
  else
  {
    v9 = objc_msgSend(a1, "expandedRangeForContiguousTodosForRange:textView:", a4, 0, v6);
    v11 = v10;
    objc_msgSend(v6, "textStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "trackedParagraphsForTodosInRange:textStorage:", v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v13)
    v14 = v13;
  else
    v14 = (void *)MEMORY[0x1E0C9AA60];
  v15 = v14;

  return v15;
}

- (id)adjacentTrackedParagraphFromTrackedParagraph:()Checklist inDirection:inTextView:
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a5;
  v9 = objc_msgSend(a3, "characterRange");
  if (a4)
    v11 = v10;
  else
    v11 = -1;
  v12 = v9 + v11;
  objc_msgSend(v8, "textStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "todoForRange:inTextStorage:", v12, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "trackedToDoParagraphs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ic_objectForNonNilKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)validAdjacentParagraphInfoFromParagraphInfo:()Checklist inDirection:inTextView:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v8 = a3;
  v9 = a5;
  v10 = v8;
  v11 = v10;
  do
  {
    while (1)
    {
      objc_msgSend(v10, "paragraphStyle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isList");

      if (!v13)
        break;
      v14 = objc_msgSend(v11, "characterRange");
      if (a4)
        v16 = v15;
      else
        v16 = -1;
      v17 = v14 + v16;
      objc_msgSend(v9, "textStorage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "paragraphInfoForCharacterAtIndex:includeChildren:textStorage:", v17, 0, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(v10, "style");
      if (v20 != objc_msgSend(v19, "style"))
      {
        v33 = 0;
        goto LABEL_21;
      }
      v21 = objc_msgSend(v10, "indent");
      v22 = objc_msgSend(v19, "indent");
      v23 = v21 < v22;
      if (v21 == v22)
      {
        objc_msgSend(v9, "textStorage");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "paragraphInfoForCharacterAtIndex:includeChildren:textStorage:", v17, 1, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = v35;
        goto LABEL_19;
      }
      v11 = v19;
      if (!v23)
      {
        v36 = v19;
LABEL_19:
        v19 = v36;
        v33 = v36;
        goto LABEL_21;
      }
    }
    v24 = objc_msgSend(v11, "rangeIncludingChildren");
    if (a4)
      v26 = v25;
    else
      v26 = -1;
    v27 = v24 + v26;
    objc_msgSend(v9, "textStorage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "paragraphInfoForCharacterAtIndex:includeChildren:textStorage:", v27, 0, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v28) = objc_msgSend(v29, "style");
    v11 = v29;
  }
  while (v28 > objc_msgSend(v10, "style"));
  v30 = v29;
  v19 = v30;
  if (a4 && (v31 = objc_msgSend(v30, "style"), v31 == objc_msgSend(v10, "style")))
  {
    objc_msgSend(v9, "textStorage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "paragraphInfoForCharacterAtIndex:includeChildren:textStorage:", v27, 1, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = v19;
  }
LABEL_21:

  return v33;
}

- (uint64_t)canMoveCheckedChecklistsToBottomInTextView:()Checklist forRange:
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v8 = a3;
  v9 = objc_msgSend(a1, "expandedRangeForContiguousTodosForRange:textView:", a4, a5, v8);
  v11 = v10;
  objc_msgSend(v8, "textStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "trackedParagraphsForTodosInRange:textStorage:", v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "createTreeFromTrackedParagraphs:textView:", v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "recursivlySortCheckedItemsToBottom");
  objc_msgSend(v14, "linerizedRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "isEqualToArray:", v15) ^ 1;

  return v16;
}

- (uint64_t)moveCheckedChecklistsToBottomInTextView:()Checklist forRange:
{
  return objc_msgSend(a1, "moveCheckedChecklistsToBottomInTextView:forRange:animated:", a3, a4, a5, 0);
}

- (uint64_t)moveCheckedChecklistsToBottomInTextView:()Checklist forRange:animated:
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  ICTextElementAnimator *v28;
  NSObject *v29;
  int v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  ICTextElementAnimator *v36;
  int v37;
  int v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD aBlock[5];
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t buf[4];
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(v10, "icaxClearCaches");
  objc_msgSend(v10, "TTTextStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "TTTextStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "ic_range");
  objc_msgSend(a1, "updateTrackedAttributesInTextStorage:range:changeInLength:", v11, v13, v14, 0);

  v15 = objc_msgSend(a1, "expandedRangeForContiguousTodosForRange:textView:", a4, a5, v10);
  v17 = v16;
  objc_msgSend(v10, "textStorage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "trackedParagraphsForTodosInRange:textStorage:", v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "createTreeFromTrackedParagraphs:textView:", v19, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "recursivlySortCheckedItemsToBottom");
  objc_msgSend(v20, "linerizedRepresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v19, "isEqualToArray:", v21);
  if ((v22 & 1) != 0)
    goto LABEL_20;
  v23 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v55 = objc_msgSend(v19, "count");
    _os_log_impl(&dword_1DD7B0000, v23, OS_LOG_TYPE_INFO, "Sorting a checklist with %d items", buf, 8u);
  }

  v38 = v22;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    v36 = -[ICTextElementAnimator initWithTextView:originTrackedParagraphs:destinationTrackedParagraphs:]([ICTextElementAnimator alloc], "initWithTextView:originTrackedParagraphs:destinationTrackedParagraphs:", v10, v19, v21);
    v24 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__ICTextController_Checklist__moveCheckedChecklistsToBottomInTextView_forRange_animated___block_invoke;
    aBlock[3] = &unk_1EA7E05E8;
    aBlock[4] = a1;
    v49 = v19;
    v50 = v21;
    v25 = v10;
    v51 = v25;
    v52 = v15;
    v53 = v17;
    v26 = _Block_copy(aBlock);
    v27 = v26;
    if (a6)
    {
      objc_msgSend(v25, "clampTextView");
      objc_msgSend(v25, "setIsDraggingChecklistItem:", 1);
      v45[0] = v24;
      v45[1] = 3221225472;
      v45[2] = __89__ICTextController_Checklist__moveCheckedChecklistsToBottomInTextView_forRange_animated___block_invoke_2;
      v45[3] = &unk_1EA7E07E8;
      v47 = v27;
      v46 = v25;
      v28 = v36;
      -[ICTextElementAnimator animateWithCompletion:](v36, "animateWithCompletion:", v45);

      v22 = v38;
    }
    else
    {
      (*((void (**)(void *))v26 + 2))(v26);
      v22 = v38;
      v28 = v36;
    }

    goto LABEL_20;
  }
  if (a6)
  {
    if ((unint64_t)objc_msgSend(v19, "count") < 0x1F5)
    {
      v37 = 1;
      goto LABEL_16;
    }
    v29 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = objc_msgSend(v19, "count");
      *(_DWORD *)buf = 67109120;
      v55 = v30;
      _os_log_impl(&dword_1DD7B0000, v29, OS_LOG_TYPE_INFO, "Disabling animation for checklist sort of %d items", buf, 8u);
    }

  }
  v37 = 0;
LABEL_16:
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __89__ICTextController_Checklist__moveCheckedChecklistsToBottomInTextView_forRange_animated___block_invoke_66;
  v39[3] = &unk_1EA7E05E8;
  v39[4] = a1;
  v31 = v19;
  v40 = v31;
  v41 = v21;
  v32 = v10;
  v42 = v32;
  v43 = v15;
  v44 = v17;
  v33 = _Block_copy(v39);
  v34 = v33;
  if (v37)
    objc_msgSend(a1, "performAnimatedSortForTrackedParagraphs:expandedRange:textView:sortChecklistsBlock:", v31, v15, v17, v32, v33);
  else
    (*((void (**)(void *))v33 + 2))(v33);
  v22 = v38;

LABEL_20:
  return v22 ^ 1u;
}

- (void)applySortFromOriginalParagraphs:()Checklist sortedTrackedParagraphs:forTextView:checklistRange:
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  int v22;
  int v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v34;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[5];
  _QWORD v48[4];
  uint8_t buf[4];
  int v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v34 = a4;
  v9 = a5;
  objc_msgSend(v9, "TTTextStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "undoManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "beginUndoGrouping");

  objc_msgSend(v10, "beginSkippingTimestampUpdates");
  objc_msgSend(v10, "beginEditing");
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v12 = MEMORY[0x1E0C809B0];
  v48[3] = a6;
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __114__ICTextController_Checklist__applySortFromOriginalParagraphs_sortedTrackedParagraphs_forTextView_checklistRange___block_invoke;
  v47[3] = &unk_1EA7E0810;
  v47[4] = v48;
  objc_msgSend(v34, "ic_map:", v47);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "differenceFromArray:", v36);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removals");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v14, "removals");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

  v44[0] = v12;
  v44[1] = 3221225472;
  v44[2] = __114__ICTextController_Checklist__applySortFromOriginalParagraphs_sortedTrackedParagraphs_forTextView_checklistRange___block_invoke_2;
  v44[3] = &unk_1EA7E0838;
  v19 = v10;
  v45 = v19;
  v20 = v18;
  v46 = v20;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v44);
  v21 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = objc_msgSend(v15, "count");
    v23 = objc_msgSend(v36, "count");
    *(_DWORD *)buf = 67109376;
    v50 = v22;
    v51 = 1024;
    v52 = v23;
    _os_log_impl(&dword_1DD7B0000, v21, OS_LOG_TYPE_INFO, "Beginning checklist reorder with number of changes %d for total item count %d", buf, 0xEu);
  }

  v41[0] = v12;
  v41[1] = 3221225472;
  v41[2] = __114__ICTextController_Checklist__applySortFromOriginalParagraphs_sortedTrackedParagraphs_forTextView_checklistRange___block_invoke_72;
  v41[3] = &unk_1EA7E0838;
  v24 = v20;
  v42 = v24;
  v25 = v19;
  v43 = v25;
  objc_msgSend(v15, "enumerateObjectsWithOptions:usingBlock:", 2, v41);
  objc_msgSend(v14, "insertions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v12;
  v37[1] = 3221225472;
  v37[2] = __114__ICTextController_Checklist__applySortFromOriginalParagraphs_sortedTrackedParagraphs_forTextView_checklistRange___block_invoke_2_73;
  v37[3] = &unk_1EA7E0860;
  v27 = v24;
  v38 = v27;
  v28 = v13;
  v39 = v28;
  v29 = v25;
  v40 = v29;
  objc_msgSend(v26, "enumerateObjectsUsingBlock:", v37);
  objc_msgSend(v29, "endEditing");
  objc_msgSend(v29, "endSkippingTimestampUpdates");
  objc_msgSend(v29, "undoManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "endUndoGrouping");

  objc_msgSend(a1, "sendTextDidChangeNotificationForTextView:", v9);
  objc_msgSend(v9, "textStorage");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "updateTrackedAttributesInTextStorage:range:changeInLength:", v31, a6, a7, 0);

  _Block_object_dispose(v48, 8);
}

- (ICTrackedParagraphTreeNode)createTreeFromTrackedParagraphs:()Checklist textView:
{
  id v5;
  id v6;
  ICTrackedParagraphTreeNode *v7;
  ICTrackedParagraphTreeNode *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  ICTrackedParagraphTreeNode *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  ICTrackedParagraphTreeNode *v25;
  uint64_t v26;
  ICTrackedParagraphTreeNode *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(ICTrackedParagraphTreeNode);
  -[ICTrackedParagraphTreeNode setIndent:](v7, "setIndent:", -1);
  v8 = v7;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  v28 = v8;
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v13, "paragraph", v28);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "indent");

        if (v15)
        {
          v16 = -[ICTrackedParagraphTreeNode indent](v8, "indent");
          objc_msgSend(v13, "paragraph");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "indent");

          if (v18 <= v16 + 1)
          {
            if (v18 > v16 || v16 < 1)
            {
              v20 = v8;
            }
            else
            {
              v20 = v8;
              do
              {
                v25 = v20;
                -[ICTrackedParagraphTreeNode parent](v20, "parent");
                v20 = (ICTrackedParagraphTreeNode *)objc_claimAutoreleasedReturnValue();

                v26 = -[ICTrackedParagraphTreeNode indent](v20, "indent");
              }
              while (v18 <= v26 && v26 > 0);
            }
          }
          else
          {
            do
            {
              +[ICTrackedParagraphTreeNode placeholderNodeWithIndentation:](ICTrackedParagraphTreeNode, "placeholderNodeWithIndentation:");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICTrackedParagraphTreeNode addChild:](v8, "addChild:", v19);
              v20 = v19;

              v21 = -[ICTrackedParagraphTreeNode indent](v20, "indent");
              v22 = v21 + 1;
              v8 = v20;
            }
            while (v18 > v22);
          }
          +[ICTrackedParagraphTreeNode nodeFromTrackedParagraph:textView:](ICTrackedParagraphTreeNode, "nodeFromTrackedParagraph:textView:", v13, v6);
          v8 = (ICTrackedParagraphTreeNode *)objc_claimAutoreleasedReturnValue();
          -[ICTrackedParagraphTreeNode addChild:](v20, "addChild:", v8);
        }
        else
        {
          +[ICTrackedParagraphTreeNode nodeFromTrackedParagraph:textView:](ICTrackedParagraphTreeNode, "nodeFromTrackedParagraph:textView:", v13, v6);
          v23 = objc_claimAutoreleasedReturnValue();
          -[ICTrackedParagraphTreeNode addChild:](v28, "addChild:", v23);
          v20 = v8;
          v8 = (ICTrackedParagraphTreeNode *)v23;
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v10);
  }

  return v28;
}

- (id)sortTrackedParagraphsMovingCheckedItemsToBottom:()Checklist
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "ic_objectsPassingTest:", &__block_literal_global_81);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removeObjectsInArray:", v5);
  objc_msgSend(v4, "addObjectsFromArray:", v5);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

- (uint64_t)expandedRangeForContiguousTodosForRange:()Checklist textView:
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v8 = a5;
  objc_opt_class();
  objc_msgSend(v8, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "containsOnlyStyle:inRange:inTextStorage:", 103, a3, a4, v10))
  {
    v11 = a3 + a4;
    if ((a3 & 0x8000000000000000) == 0)
    {
      v12 = (void *)MEMORY[0x1DF0DF21C]();
      objc_msgSend(a1, "rangeForChecklistItemInRange:textStorage:", a3, 0, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = a3;
        do
        {
          objc_msgSend(v13, "rangeValue");
          if (!v15)
            break;
          v16 = objc_msgSend(v13, "rangeValue");
          v14 = v16;
          if (v16 - 1 >= a3 - 1)
            --a3;
          else
            a3 = v16 - 1;

          objc_autoreleasePoolPop(v12);
          if (a3 < 0)
            goto LABEL_14;
          v12 = (void *)MEMORY[0x1DF0DF21C]();
          objc_msgSend(a1, "rangeForChecklistItemInRange:textStorage:", a3, 0, v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        while (v13);
      }
      else
      {
        v14 = a3;
      }

      objc_autoreleasePoolPop(v12);
LABEL_14:
      a3 = v14;
    }
    if (v11 < objc_msgSend(v10, "length"))
    {
      v17 = (void *)MEMORY[0x1DF0DF21C]();
      objc_msgSend(a1, "rangeForChecklistItemInRange:textStorage:", v11, 0, v10);
      for (i = (void *)objc_claimAutoreleasedReturnValue(); i; i = (void *)objc_claimAutoreleasedReturnValue())
      {
        objc_msgSend(i, "rangeValue");
        if (!v19)
          break;
        v20 = objc_msgSend(i, "rangeValue");
        if (v20 + v21 <= (uint64_t)(v11 + 1))
          ++v11;
        else
          v11 = v20 + v21;

        objc_autoreleasePoolPop(v17);
        if (v11 >= objc_msgSend(v10, "length"))
          goto LABEL_24;
        v17 = (void *)MEMORY[0x1DF0DF21C]();
        objc_msgSend(a1, "rangeForChecklistItemInRange:textStorage:", v11, 0, v10);
      }

      objc_autoreleasePoolPop(v17);
    }
  }
LABEL_24:

  return a3;
}

- (id)rangesForTodosInRange:()Checklist markedCompleted:textStorage:
{
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v13[5];
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v9 = a6;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__18;
  v19 = __Block_byref_object_dispose__18;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = *MEMORY[0x1E0D63928];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__ICTextController_Checklist__rangesForTodosInRange_markedCompleted_textStorage___block_invoke;
  v13[3] = &unk_1EA7E08C8;
  v14 = a5;
  v13[4] = &v15;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, a3, a4, 0, v13);
  v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (id)trackedParagraphsForTodosInRange:()Checklist textStorage:
{
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v8 = a5;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__18;
  v17 = __Block_byref_object_dispose__18;
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = *MEMORY[0x1E0D63928];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__ICTextController_Checklist__trackedParagraphsForTodosInRange_textStorage___block_invoke;
  v12[3] = &unk_1EA7DE008;
  v12[4] = a1;
  v12[5] = &v13;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v9, a3, a4, 0, v12);
  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (id)rangeForChecklistItemInRange:()Checklist textStorage:
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "todoForRange:inTextStorage:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "trackedToDoParagraphs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_msgSend(v6, "characterRange");
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v7, v8);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (uint64_t)containsAnyTodoItemMarkedCompleted:()Checklist inRange:textStorage:
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[5];
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v9 = a6;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v10 = *MEMORY[0x1E0D63928];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__ICTextController_Checklist__containsAnyTodoItemMarkedCompleted_inRange_textStorage___block_invoke;
  v13[3] = &unk_1EA7E08C8;
  v14 = a3;
  v13[4] = &v15;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, a4, a5, 0, v13);
  v11 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (ICParagraphInfo)paragraphInfoForCharacterAtIndex:()Checklist includeChildren:textStorage:
{
  id v7;
  void *v8;
  void *v9;
  ICParagraphInfo *v10;
  uint64_t v11;
  uint64_t v12;
  ICParagraphInfo *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  ICParagraphInfo *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  ICParagraphInfo *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[2];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v7;
  objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], a3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc_init(ICParagraphInfo);
    -[ICParagraphInfo setParagraphStyle:](v10, "setParagraphStyle:", v9);
    if (objc_msgSend(v9, "isList"))
    {
      v11 = objc_msgSend(v8, "ic_lineRangeIgnoringLineBreakCharactersForIndex:", a3);
      -[ICParagraphInfo setCharacterRange:](v10, "setCharacterRange:", v11, v12);
      v13 = v10;
      v14 = objc_msgSend(v9, "indent");
      if (v13)
      {
        v15 = v14;
        v16 = v13;
        do
        {
          v65[0] = 0;
          v65[1] = 0;
          v17 = objc_msgSend(v16, "characterRange");
          if (!a4)
          {
            v16 = v13;
            goto LABEL_29;
          }
          v19 = v17;
          v20 = v18;
          if (objc_msgSend(v9, "isList"))
          {
            v21 = v20 + v19 + 1;
            objc_msgSend(v60, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v21, v65);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "style");
            if (v23 != objc_msgSend(v9, "style") || objc_msgSend(v22, "indent") <= v15)
            {

              goto LABEL_29;
            }
            v24 = objc_alloc_init(ICParagraphInfo);
            -[ICParagraphInfo setParagraphStyle:](v24, "setParagraphStyle:", v22);
            v25 = objc_msgSend(v8, "ic_lineRangeIgnoringLineBreakCharactersForIndex:", v21);
            -[ICParagraphInfo setCharacterRange:](v24, "setCharacterRange:", v25, v26);
            -[ICParagraphInfo children](v13, "children");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v27)
            {
              v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              -[ICParagraphInfo setChildren:](v13, "setChildren:", v28);

            }
            -[ICParagraphInfo children](v13, "children");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v24);

            v16 = v24;
          }
        }
        while (v16);
      }
      v10 = v13;
    }
    else
    {
      objc_msgSend(v9, "uuid");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v31 = objc_msgSend(v8, "paragraphRangeForRange:", a3, 0);
        -[ICParagraphInfo setCharacterRange:](v10, "setCharacterRange:", v31, v32);
        if (a4)
        {
          v59 = v8;
          objc_opt_class();
          ICDynamicCast();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "outlineController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v58 = v9;
          objc_msgSend(v9, "uuid");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "descendantsForUUID:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v62;
            do
            {
              for (i = 0; i != v37; ++i)
              {
                if (*(_QWORD *)v62 != v38)
                  objc_enumerationMutation(v35);
                v40 = objc_msgSend(v16, "rangeForUUID:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i));
                v42 = v41;
                objc_msgSend(v60, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v40, 0);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = objc_alloc_init(ICParagraphInfo);
                -[ICParagraphInfo setParagraphStyle:](v44, "setParagraphStyle:", v43);
                -[ICParagraphInfo setCharacterRange:](v44, "setCharacterRange:", v40, v42);
                -[ICParagraphInfo children](v10, "children");
                v45 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v45)
                {
                  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  -[ICParagraphInfo setChildren:](v10, "setChildren:", v46);

                }
                -[ICParagraphInfo children](v10, "children");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "addObject:", v44);

              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
            }
            while (v37);
          }

          v9 = v58;
          v8 = v59;
LABEL_29:

        }
      }
    }
  }
  else
  {
    v10 = 0;
  }
  -[ICParagraphInfo children](v10, "children");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "count");

  v51 = -[ICParagraphInfo characterRange](v10, "characterRange");
  if (v49)
  {
    -[ICParagraphInfo children](v10, "children");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "lastObject");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "characterRange");
    v56 = v55;

    v50 = v56 - v51 + v54;
  }
  -[ICParagraphInfo setRangeIncludingChildren:](v10, "setRangeIncludingChildren:", v51, v50);

  return v10;
}

- (void)autoSortChecklistIfNecessaryForTrackedParagraph:()Checklist textView:analyticsHandler:
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __105__ICTextController_Checklist__autoSortChecklistIfNecessaryForTrackedParagraph_textView_analyticsHandler___block_invoke;
    v11[3] = &unk_1EA7DDBF0;
    v11[4] = a1;
    v12 = v9;
    v13 = v8;
    objc_msgSend(a1, "showFirstTimeAutoSortEnabledAlertIfNecessaryWithTextView:completionHandler:analyticsHandler:", v12, v11, a5);

  }
}

- (void)autoSortChecklistForUnitTestAtIndex:()Checklist textView:
{
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a4;
  v6 = objc_msgSend(a1, "expandedRangeForContiguousTodosForRange:textView:", a3, 0, v8);
  objc_msgSend(a1, "moveCheckedChecklistsToBottomInTextView:forRange:animated:", v8, v6, v7, 0);

}

- (void)showFirstTimeAutoSortEnabledAlertIfNecessaryWithTextView:()Checklist completionHandler:analyticsHandler:
{
  void (**v8)(_QWORD);
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend((id)objc_opt_class(), "checklistAutoAlertShown") & 1) != 0
    || objc_msgSend((id)objc_opt_class(), "checklistAutoSortEnabled"))
  {
    v8[2](v8);
  }
  else
  {
    objc_msgSend(a1, "showFirstTimeAutoSortEnabledAlertWithTextView:completionHandler:analyticsHandler:", v10, v8, v9);
  }

}

- (void)showFirstTimeAutoSortEnabledAlertWithTextView:()Checklist completionHandler:analyticsHandler:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CB34D0];
  v29 = a3;
  objc_msgSend(v10, "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Enable Automatic Sorting?"), &stru_1EA7E9860, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Would you like checked items to automatically move to the bottom of your lists? You can change this later in Notes Settings."), &stru_1EA7E9860, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v31, v30, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Not Now"), &stru_1EA7E9860, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __112__ICTextController_Checklist__showFirstTimeAutoSortEnabledAlertWithTextView_completionHandler_analyticsHandler___block_invoke;
  v35[3] = &unk_1EA7E08F0;
  v35[4] = a1;
  v18 = v9;
  v36 = v18;
  v19 = v8;
  v37 = v19;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 1, v35);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v20);

  v21 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Enable Sorting"), &stru_1EA7E9860, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v17;
  v32[1] = 3221225472;
  v32[2] = __112__ICTextController_Checklist__showFirstTimeAutoSortEnabledAlertWithTextView_completionHandler_analyticsHandler___block_invoke_2;
  v32[3] = &unk_1EA7E08F0;
  v32[4] = a1;
  v33 = v18;
  v34 = v19;
  v24 = v19;
  v25 = v18;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 0, v32);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v26);
  objc_msgSend(v13, "setPreferredAction:", v26);
  objc_opt_class();
  objc_msgSend(v29, "editorController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "presentViewController:animated:completion:", v13, 1, 0);

}

+ (uint64_t)needsToShowFirstTimeAutoSortChecklistAlert
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("AutoSortChecklistAlertShown"));

  return v1;
}

- (ICChecklistInfo)analyticsInfoForChecklistAtIndex:()Checklist textView:
{
  id v6;
  ICChecklistInfo *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;

  v6 = a4;
  v7 = objc_alloc_init(ICChecklistInfo);
  objc_msgSend(v6, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9 > a3)
  {
    objc_msgSend(v6, "TTTextStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "TTTextStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "ic_range");
    objc_msgSend(a1, "updateTrackedAttributesInTextStorage:range:changeInLength:", v10, v12, v13, 0);

    objc_msgSend(v6, "visibleBounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      objc_msgSend(v6, "icTextLayoutManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "characterRangeForBoundingRect:", v15, v17, v19, v21);
      v25 = v24;

      objc_msgSend(v6, "icTextLayoutManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "icTextLayoutManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "ic_textRangeForRange:", v23, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "ensureLayoutForRange:", v28);

    }
    else
    {
      objc_msgSend(v6, "layoutManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textContainer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "ensureLayoutForBoundingRect:inTextContainer:", v27, v15, v17, v19, v21);
    }

    v29 = objc_msgSend(a1, "expandedRangeForContiguousTodosForRange:textView:", a3, 0, v6);
    v31 = v30;
    objc_msgSend(v6, "textStorage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "trackedParagraphsForTodosInRange:textStorage:", v29, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "ic_objectsPassingTest:", &__block_literal_global_101);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICChecklistInfo setNumberOfItems:](v7, "setNumberOfItems:", objc_msgSend(v33, "count"));
    -[ICChecklistInfo setNumberOfCheckedItems:](v7, "setNumberOfCheckedItems:", objc_msgSend(v34, "count"));
    -[ICChecklistInfo setNumberOfUncheckedItems:](v7, "setNumberOfUncheckedItems:", -[ICChecklistInfo numberOfItems](v7, "numberOfItems")- -[ICChecklistInfo numberOfCheckedItems](v7, "numberOfCheckedItems"));

  }
  return v7;
}

@end
