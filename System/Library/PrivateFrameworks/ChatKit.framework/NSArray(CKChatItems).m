@implementation NSArray(CKChatItems)

- (uint64_t)__ck_indexOfMediaObject:()CKChatItems
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__NSArray_CKChatItems____ck_indexOfMediaObject___block_invoke;
  v8[3] = &unk_1E274C218;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (uint64_t)__ck_indexOfTransfer:()CKChatItems
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(v4, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(v5, "length"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__NSArray_CKChatItems____ck_indexOfTransfer___block_invoke;
    v8[3] = &unk_1E274C218;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);
    v6 = v12[3];

    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

- (void)__ck_unloadSizesAtIndexes:()CKChatItems
{
  id v1;

  objc_msgSend(a1, "objectsAtIndexes:");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[CKChatItem unloadSizesOfChatItems:](CKChatItem, "unloadSizesOfChatItems:", v1);

}

- (void)__ck_unloadTranscriptTextAtIndexes:()CKChatItems
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    objc_msgSend(a1, "enumerateObjectsAtIndexes:options:usingBlock:", v4, 0, &__block_literal_global_83);

}

- (id)__ck_indexesOfUnplayedAudioMessages
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__NSArray_CKChatItems____ck_indexesOfUnplayedAudioMessages__block_invoke;
  v5[3] = &unk_1E27500C0;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v5);

  return v3;
}

- (id)__ck_IMChatItemsAtIndexes:()CKChatItems
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__NSArray_CKChatItems____ck_IMChatItemsAtIndexes___block_invoke;
    v8[3] = &unk_1E27500C0;
    v6 = v5;
    v9 = v6;
    objc_msgSend(a1, "enumerateObjectsAtIndexes:options:usingBlock:", v4, 0, v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)__ck_messageForChatItemAtIndex:()CKChatItems
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "message");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)__ck_failedMessagesForChatItemsWithConversationID:()CKChatItems
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__32;
  v14[4] = __Block_byref_object_dispose__32;
  v15 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__NSArray_CKChatItems____ck_failedMessagesForChatItemsWithConversationID___block_invoke;
  v10[3] = &unk_1E27505C0;
  v12 = v14;
  v13 = a3;
  v6 = v5;
  v11 = v6;
  objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:", 2, v10);
  v7 = v11;
  v8 = v6;

  _Block_object_dispose(v14, 8);
  return v8;
}

- (uint64_t)__ck_catchUpScrollTargetForMessageGUID:()CKChatItems
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  _QWORD v17[3];
  char v18;

  v4 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3010000000;
  v15 = &unk_18E8EEE6F;
  v16 = xmmword_18E7CAB50;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__NSArray_CKChatItems____ck_catchUpScrollTargetForMessageGUID___block_invoke;
  v8[3] = &unk_1E27505E8;
  v5 = v4;
  v9 = v5;
  v10 = v17;
  v11 = &v12;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);
  v6 = v13[4];
  if (v13[5] == 0x7FFFFFFFFFFFFFFFLL)
    v13[5] = v6;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v17, 8);

  return v6;
}

- (id)__ck_indexesOfPartsOfMessageWithGUID:()CKChatItems
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__NSArray_CKChatItems____ck_indexesOfPartsOfMessageWithGUID___block_invoke;
  v11[3] = &unk_1E274D860;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:", 2, v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (uint64_t)__ck_indexOfPartOfMessageGUID:()CKChatItems withMessagePartIndex:
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__NSArray_CKChatItems____ck_indexOfPartOfMessageGUID_withMessagePartIndex___block_invoke;
  v10[3] = &unk_1E2750610;
  v7 = v6;
  v12 = &v14;
  v13 = a4;
  v11 = v7;
  objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:", 2, v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (uint64_t)__ck_indexOfPartOfMessage:()CKChatItems withMessagePartIndex:
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a3, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "__ck_indexOfPartOfMessageGUID:withMessagePartIndex:", v6, a4);

  return v7;
}

- (id)__ck_indexesOfPartsOfNonAttachmentMessages:()CKChatItems
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11), "guid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__NSArray_CKChatItems____ck_indexesOfPartsOfNonAttachmentMessages___block_invoke;
  v18[3] = &unk_1E274D860;
  v19 = v6;
  v13 = v5;
  v20 = v13;
  v14 = v6;
  objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:", 2, v18);
  v15 = v20;
  v16 = v13;

  return v16;
}

- (id)__ck_indexesOfPartsOfMessages:()CKChatItems
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11), "guid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __54__NSArray_CKChatItems____ck_indexesOfPartsOfMessages___block_invoke;
  v18[3] = &unk_1E274D860;
  v19 = v6;
  v13 = v5;
  v20 = v13;
  v14 = v6;
  objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:", 2, v18);
  v15 = v20;
  v16 = v13;

  return v16;
}

- (uint64_t)__ck_indexOfChatItemWithGUID:()CKChatItems
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "IMChatItem", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "guid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if ((v14 & 1) != 0)
        {
          v15 = v8 + v10;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v15;
}

- (id)__ck_chatItemWithGUID:()CKChatItems
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "__ck_indexOfChatItemWithGUID:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (uint64_t)__ck_indexOfParentChatItemWithMesssageGUID:()CKChatItems associatedMessageRange:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = a1;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v25;
      do
      {
        v11 = 0;
        v21 = v9;
        v22 = v9 + v8;
        do
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "IMChatItem");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "guid");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "containsString:", v5)
              && !objc_msgSend(v12, "itemIsReplyContextPreview"))
            {
              v15 = objc_msgSend(v12, "isEditedMessageHistory");

              if ((v15 & 1) == 0)
              {
                v16 = objc_msgSend(v12, "messagePartRange");
                if (a4 >= v16 && a4 - v16 < v17)
                {
                  v19 = v21 + v11;
                  goto LABEL_20;
                }
              }
            }
            else
            {

            }
          }
          ++v11;
        }
        while (v8 != v11);
        v18 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        v8 = v18;
        v9 = v22;
      }
      while (v18);
    }
    v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_20:

  }
  else
  {
    v19 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v19;
}

- (id)__ck_parentChatItemWithMesssageGUID:()CKChatItems associatedMessageRange:
{
  unint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "__ck_indexOfParentChatItemWithMesssageGUID:associatedMessageRange:");
  if (v2 >= objc_msgSend(a1, "count"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndex:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
