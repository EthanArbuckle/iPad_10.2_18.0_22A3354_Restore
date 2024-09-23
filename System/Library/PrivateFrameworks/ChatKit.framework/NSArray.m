@implementation NSArray

uint64_t __59__NSArray_CKEntity____im_canonicalIDSAddressesFromEntities__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "IDSCanonicalAddress");
}

void __63__NSArray_CKUtilities____ck_indexSetForIndexPathRowsInSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "section") == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(v3, "row"));

}

void __64__NSArray_CKUtilities____ck_indexSetForIndexPathItemsInSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "section") == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(v3, "item"));

}

void __48__NSArray_CKChatItems____ck_indexOfMediaObject___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  char v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "mediaObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

    if ((v8 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "mediaObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 32));

    if (v10)
    {
LABEL_6:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
  }
LABEL_7:

}

void __45__NSArray_CKChatItems____ck_indexOfTransfer___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  _BYTE *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "mediaObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transfer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v10))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
  }
  else
  {
    v10 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v7, "containsTransferGUID:", *(_QWORD *)(a1 + 32)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = a4;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v7, "mediaObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "transferGUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v10);

          if (v17)
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
            *v18 = 1;
            goto LABEL_21;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_21:

  }
}

uint64_t __59__NSArray_CKChatItems____ck_unloadTranscriptTextAtIndexes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unloadTranscriptText");
}

void __59__NSArray_CKChatItems____ck_indexesOfUnplayedAudioMessages__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v5, "isFromMe") & 1) == 0
    && (objc_msgSend(v5, "isPlayed") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  }

}

void __50__NSArray_CKChatItems____ck_IMChatItemsAtIndexes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "IMChatItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __74__NSArray_CKChatItems____ck_failedMessagesForChatItemsWithConversationID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  objc_msgSend(a2, "IMChatItem");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "message");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (objc_msgSend(v12, "stewieConversationID") == *(_QWORD *)(a1 + 48))
    {
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (v9)
      {
        objc_msgSend(v9, "error");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "code");

        if (v11 == 4)
          objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
      }
    }
    else
    {
      *a4 = 1;
    }
  }

}

void __63__NSArray_CKChatItems____ck_catchUpScrollTargetForMessageGUID___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  id v15;

  objc_msgSend(a2, "IMChatItem");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isEqualToString:", a1[4]))
    {
      v9 = *(_QWORD *)(a1[5] + 8);
      if (!*(_BYTE *)(v9 + 24))
      {
        *(_BYTE *)(v9 + 24) = 1;
        *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 32) = a3;
      }
    }

    goto LABEL_8;
  }
  objc_msgSend(v15, "guid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsString:", a1[4]);

  if (v11)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = a3;
LABEL_8:
    v12 = v15;
    goto LABEL_9;
  }
  v12 = v15;
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    objc_msgSend(v15, "guid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsString:", a1[4]);

    v12 = v15;
    if ((v14 & 1) == 0)
      *a4 = 1;
  }
LABEL_9:

}

void __61__NSArray_CKChatItems____ck_indexesOfPartsOfMessageWithGUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  objc_msgSend(a2, "IMChatItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v9)
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    *a4 = 1;
  }

}

void __75__NSArray_CKChatItems____ck_indexOfPartOfMessageGUID_withMessagePartIndex___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a2, "IMChatItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = v10;
      objc_msgSend(v7, "message");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "guid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "isEqualToString:", a1[4]) && objc_msgSend(v7, "index") == a1[6])
      {
        *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
        *a4 = 1;
      }

    }
  }

}

void __67__NSArray_CKChatItems____ck_indexesOfPartsOfNonAttachmentMessages___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "IMChatItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(v9, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8))
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);

  }
  else if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    *a4 = 1;
  }

}

void __54__NSArray_CKChatItems____ck_indexesOfPartsOfMessages___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a2, "IMChatItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8))
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);

    v9 = v11;
  }
  else
  {
    v10 = objc_msgSend(*(id *)(a1 + 40), "count");
    v9 = v11;
    if (v10)
      *a4 = 1;
  }

}

void __62__NSArray__CKAppInstallation____ck_proxyWithBundleIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  int v11;
  id v12;

  v12 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = v12;
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v11)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }

    v8 = v12;
  }

}

@end
