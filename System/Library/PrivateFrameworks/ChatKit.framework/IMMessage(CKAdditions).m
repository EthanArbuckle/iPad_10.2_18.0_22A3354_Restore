@implementation IMMessage(CKAdditions)

- (id)__ck_previewTextWithChat:()CKAdditions ignorePluginContent:
{
  return CKPreviewTextFromMessage(a1, a3, a4);
}

- (id)__ck_mediaObjects
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fileTransferGUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mediaObjectWithTransferGUID:imMessage:", v9, a1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v11);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)__ck_service
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "wasDowngraded"))
  {
    objc_msgSend(MEMORY[0x1E0D35910], "smsService");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "sender");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "service");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (CKMutableMessageContext)__ck_context
{
  CKMutableMessageContext *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "isFromMe"))
  {
    +[CKMessageContext selfContext](CKMutableMessageContext, "selfContext");
    v2 = (CKMutableMessageContext *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = objc_alloc_init(CKMutableMessageContext);
    -[CKMutableMessageContext setSenderUnknown:](v2, "setSenderUnknown:", objc_msgSend(a1, "isSenderUnknown"));
    objc_msgSend(a1, "__ck_service");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMutableMessageContext setServiceName:](v2, "setServiceName:", v4);
    if ((objc_msgSend(a1, "__ck_isiMessage") & 1) == 0)
      -[CKMutableMessageContext setSenderUnauthenticated:](v2, "setSenderUnauthenticated:", 1);

  }
  -[CKMutableMessageContext setAudioMessage:](v2, "setAudioMessage:", objc_msgSend(a1, "isAudioMessage"));
  return v2;
}

- (uint64_t)__ck_isSMS
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "__ck_service");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "__ck_isSMS");

  return v2;
}

- (BOOL)__ck_isEqualToMessageUsingGUID:()CKAdditions
{
  return a3 && objc_msgSend(a1, "compare:comparisonType:", a3, 1) == 0;
}

- (uint64_t)__ck_isiMessage
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "__ck_service");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "__ck_isiMessage");

  return v2;
}

- (uint64_t)__ck_previewTextWithChat:()CKAdditions
{
  return objc_msgSend(a1, "__ck_previewTextWithChat:ignorePluginContent:", a3, 0);
}

- (id)__ck_attachmentPreviewTextForAttachmentAtIndex:()CKAdditions
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "fileTransferGUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= a3)
    goto LABEL_4;
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaObjectWithTransferGUID:imMessage:", v7, a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    CKAttachmentSummaryForOneMediaObject(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v9 = 0;
  }

  return v9;
}

- (id)__ck_downgradedMessage
{
  return (id)objc_msgSend(a1, "_copyWithFlags:", objc_msgSend(a1, "flags") | 0x80000);
}

- (id)__ck_undowngradedMessage
{
  return (id)objc_msgSend(a1, "_copyWithFlags:", objc_msgSend(a1, "flags") & 0xFFFFFFFFFFF7FFFFLL);
}

- (id)__ck_sosMessage
{
  return (id)objc_msgSend(a1, "_copyWithFlags:", objc_msgSend(a1, "flags") | 0x8000000000);
}

- (id)__ck_criticalMessage
{
  return (id)objc_msgSend(a1, "_copyWithFlags:", objc_msgSend(a1, "flags") | 0x4000000000);
}

- (BOOL)__ck_isAcknowledgmentMessage
{
  return (unint64_t)(objc_msgSend(a1, "associatedMessageType") - 2000) < 6;
}

- (BOOL)__ck_isRemovedAcknowledgmentMessage
{
  return (unint64_t)(objc_msgSend(a1, "associatedMessageType") - 3000) < 6;
}

- (id)__ck_suggestedReplyPreviewText
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "text");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "__im_suggestedReplyPreviewText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v2);
  else
    v3 = 0;

  return v3;
}

- (id)__ck_richCardsPreviewText
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "text");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "__im_richCardsPreviewText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v2);
  else
    v3 = 0;

  return v3;
}

@end
