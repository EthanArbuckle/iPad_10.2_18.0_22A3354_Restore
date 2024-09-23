@implementation CKPinnedConversationActivitySnapshot

+ (id)emptySnapshot
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithActivityItems:contactItems:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (CKPinnedConversationActivitySnapshot)initWithActivityItems:(id)a3 contactItems:(id)a4
{
  id v6;
  id v7;
  CKPinnedConversationActivitySnapshot *v8;
  uint64_t v9;
  NSArray *activityItems;
  uint64_t v11;
  NSArray *contactItems;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKPinnedConversationActivitySnapshot;
  v8 = -[CKPinnedConversationActivitySnapshot init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    activityItems = v8->_activityItems;
    v8->_activityItems = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    contactItems = v8->_contactItems;
    v8->_contactItems = (NSArray *)v11;

  }
  return v8;
}

- (CKPinnedConversationActivitySnapshot)initWithConversation:(id)a3 recentMessagesInPinnedConversations:(id)a4 previousSnapshot:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  CKPinnedConversationTypingBubbleActivityItem *v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  char v23;
  CKPinnedConversationSummaryBubbleActivityItem *v24;
  CKPinnedConversationMediaObjectActivityItem *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int64_t v32;
  void *v33;
  void *v34;
  void *v35;
  CKPinnedConversationActivitySnapshot *v36;
  void *v38;
  int v39;
  CKPinnedConversationRichLinkActivityItem *v40;
  void *v41;
  void *v42;
  void *v43;
  CKPinnedConversationTapbackBubbleActivityItem *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[4];
  CKPinnedConversationActivitySnapshot *v50;
  int64_t v51;
  double v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  uint64_t v57;

  v8 = a3;
  v48 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v8, "chat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastIncomingMessage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isGroupConversation"))
    v15 = objc_msgSend(v8, "isAdHocGroupConversation") ^ 1;
  else
    v15 = 0;
  if (objc_msgSend(v14, "isTypingMessage"))
  {
    v16 = objc_alloc_init(CKPinnedConversationTypingBubbleActivityItem);
    objc_msgSend(v10, "addObject:", v16);

    v17 = 1.0;
    goto LABEL_35;
  }
  v17 = 1.0;
  if (objc_msgSend(v8, "hasUnreadMessages"))
  {
    objc_msgSend(v13, "lastIncomingFinishedMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isRead") & 1) != 0 || (objc_msgSend(v18, "isTypingMessage") & 1) != 0)
    {
LABEL_34:

      goto LABEL_35;
    }
    objc_msgSend(v18, "sender");
    v19 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v19;
    if (!v19)
    {
      _IMWarn();
      v19 = 0;
    }
    objc_msgSend(v8, "entityMatchingHandle:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v20;
    if (v15)
    {
      +[CKPinnedConversationContactItemProvider contactItemFromEntity:](CKPinnedConversationContactItemProvider, "contactItemFromEntity:", v20);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v43);
      objc_msgSend(v43, "contactItemIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:");

    }
    else
    {
      v46 = 0;
    }
    -[CKPinnedConversationActivitySnapshot _contentScaleForMessage:amongRecentMessagesInPinnedConversations:](self, "_contentScaleForMessage:amongRecentMessagesInPinnedConversations:", v18, v48);
    v17 = v21;
    objc_msgSend(v18, "expressiveSendStyleID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v41, "isEqualToString:", *MEMORY[0x1E0D380A0]);
    if ((objc_msgSend(v18, "associatedMessageType") & 0xFFFFFFFFFFFFFFF8) == 0x7D0)
    {
      v44 = -[CKPinnedConversationTapbackBubbleActivityItem initWithMessage:contentScale:attachedContactItemIdentifier:]([CKPinnedConversationTapbackBubbleActivityItem alloc], "initWithMessage:contentScale:attachedContactItemIdentifier:", v18, v46, v17);
      objc_msgSend(v10, "addObject:", v44);
      goto LABEL_30;
    }
    if (objc_msgSend(v18, "isRichLinkMessage")
      && ((objc_msgSend(v18, "isSenderUnknown") | v39) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D358A0], "chatContextForPinnedChat:", v13);
      v44 = (CKPinnedConversationTapbackBubbleActivityItem *)objc_claimAutoreleasedReturnValue();
      v40 = -[CKPinnedConversationRichLinkActivityItem initWithMessage:chatContext:contentScale:attachedContactItemIdentifier:]([CKPinnedConversationRichLinkActivityItem alloc], "initWithMessage:chatContext:contentScale:attachedContactItemIdentifier:", v18, v44, v46, v17);
      objc_msgSend(v10, "addObject:", v40);
    }
    else
    {
      +[CKPinnedConversationMediaObjectActivityItem previewableMediaObjectFromMessage:](CKPinnedConversationMediaObjectActivityItem, "previewableMediaObjectFromMessage:", v18, v9);
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
        v23 = v39;
      else
        v23 = 1;
      v44 = (CKPinnedConversationTapbackBubbleActivityItem *)v22;
      if ((v23 & 1) == 0)
      {
        v25 = -[CKPinnedConversationMediaObjectActivityItem initWithMessage:mediaObject:contentScale:attachedContactItemIdentifier:]([CKPinnedConversationMediaObjectActivityItem alloc], "initWithMessage:mediaObject:contentScale:attachedContactItemIdentifier:", v18, v22, v46, v17);
        objc_msgSend(v10, "addObject:", v25);
        v26 = v25;
        v9 = v38;
LABEL_29:

LABEL_30:
        if (v15 && objc_msgSend(v8, "limitToLoad") >= 2)
        {
          v53[0] = MEMORY[0x1E0C809B0];
          v53[1] = 3221225472;
          v53[2] = __114__CKPinnedConversationActivitySnapshot_initWithConversation_recentMessagesInPinnedConversations_previousSnapshot___block_invoke;
          v53[3] = &unk_1E2755B28;
          v54 = v8;
          v55 = v12;
          v57 = 3;
          v56 = v11;
          objc_msgSend(v54, "enumerateMessagesWithOptions:usingBlock:", 2, v53);

        }
        goto LABEL_34;
      }
      objc_msgSend(v18, "__ck_previewTextWithChat:", v13);
      v40 = (CKPinnedConversationRichLinkActivityItem *)objc_claimAutoreleasedReturnValue();
      if (-[CKPinnedConversationRichLinkActivityItem length](v40, "length"))
      {
        v24 = -[CKPinnedConversationSummaryBubbleActivityItem initWithMessage:chat:contentScale:attachedContactItemIdentifier:]([CKPinnedConversationSummaryBubbleActivityItem alloc], "initWithMessage:chat:contentScale:attachedContactItemIdentifier:", v18, v13, v46, v17);
        objc_msgSend(v10, "addObject:", v24);

      }
      else
      {
        _IMWarn();
      }
      v9 = v38;
    }
    v26 = v40;
    goto LABEL_29;
  }
LABEL_35:
  v47 = v8;
  v27 = v10;
  v28 = v13;
  v29 = v14;
  v30 = v11;
  objc_msgSend(v11, "firstObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = -[CKPinnedConversationActivitySnapshot _firstContactItemAlignmentForContactItem:previousSnapshot:totalNumberOfContactItemIdentifiersWithUnreadMessages:](self, "_firstContactItemAlignmentForContactItem:previousSnapshot:totalNumberOfContactItemIdentifiersWithUnreadMessages:", v31, v9, objc_msgSend(v12, "count"));
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __114__CKPinnedConversationActivitySnapshot_initWithConversation_recentMessagesInPinnedConversations_previousSnapshot___block_invoke_2;
    v49[3] = &unk_1E2755B50;
    v50 = self;
    v51 = v32;
    v52 = v17;
    objc_msgSend(v30, "enumerateObjectsUsingBlock:", v49);

  }
  v33 = (void *)objc_msgSend(v27, "copy");
  v34 = v9;
  v35 = (void *)objc_msgSend(v30, "copy");
  v36 = -[CKPinnedConversationActivitySnapshot initWithActivityItems:contactItems:](self, "initWithActivityItems:contactItems:", v33, v35);

  return v36;
}

void __114__CKPinnedConversationActivitySnapshot_initWithConversation_recentMessagesInPinnedConversations_previousSnapshot___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((objc_msgSend(v9, "isFromMe") & 1) != 0 || objc_msgSend(v9, "isRead"))
  {
    *a3 = 1;
  }
  else if ((objc_msgSend(v9, "isTypingMessage") & 1) == 0)
  {
    objc_msgSend(v9, "sender");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      _IMWarn();
    objc_msgSend(*(id *)(a1 + 32), "entityMatchingHandle:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pinnedConversationContactItemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length") && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v7) & 1) == 0)
    {
      if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") < *(_QWORD *)(a1 + 56))
      {
        +[CKPinnedConversationContactItemProvider contactItemFromEntity:](CKPinnedConversationContactItemProvider, "contactItemFromEntity:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);

      }
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    }

  }
}

void __114__CKPinnedConversationActivitySnapshot_initWithConversation_recentMessagesInPinnedConversations_previousSnapshot___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = a2;
  v7 = objc_msgSend(v5, "_contactItemAlignmentForItemAtIndex:firstItemAlignment:", a3, v6);
  objc_msgSend(*(id *)(a1 + 32), "_contentScaleForContactItemAtIndex:withMessageContentScale:", a3, *(double *)(a1 + 48));
  v9 = v8;
  objc_msgSend(v10, "setContactItemAlignment:", v7);
  objc_msgSend(v10, "setContentScale:", v9);

}

- (double)_contentScaleForContactItemAtIndex:(int64_t)a3 withMessageContentScale:(double)a4
{
  uint64_t v4;

  v4 = 1;
  if (a3)
    v4 = 2;
  return pow((double)v4, -0.7892) * a4;
}

- (int64_t)_contactItemAlignmentForItemAtIndex:(int64_t)a3 firstItemAlignment:(int64_t)a4
{
  return a3 & 1 ^ (a4 != 0);
}

- (int64_t)_firstContactItemAlignmentForContactItem:(id)a3 previousSnapshot:(id)a4 totalNumberOfContactItemIdentifiersWithUnreadMessages:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  v7 = a4;
  objc_msgSend(a3, "contactItemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_contactItemMatchingIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "contactItemAlignment");
  else
    v10 = (a5 & 0x8000000000000001) != 1;

  return v10;
}

- (id)_contactItemMatchingIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_contactItems;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "contactItemIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (double)_contentScaleForMessage:(id)a3 amongRecentMessagesInPinnedConversations:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;

  v5 = a4;
  objc_msgSend(a3, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v5, "__imArrayByApplyingBlock:", &__block_literal_global_120);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObject:", v6);
    v9 = objc_msgSend(v7, "count");
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
LABEL_9:
      objc_msgSend(v10, "pinnedConversationActivitySnapshotContentScaleNonRecent");
      goto LABEL_10;
    }
    if (v8 == v9 - 1)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pinnedConversationActivitySnapshotContentScaleMostRecent");
    }
    else
    {
      v15 = v9 - 2;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v8 != v15)
        goto LABEL_9;
      objc_msgSend(v10, "pinnedConversationActivitySnapshotContentScaleSecondMostRecent");
    }
LABEL_10:
    v13 = v14;

    goto LABEL_11;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pinnedConversationActivitySnapshotContentScaleNonRecent");
  v13 = v12;
LABEL_11:

  return v13;
}

__CFString *__105__CKPinnedConversationActivitySnapshot__contentScaleForMessage_amongRecentMessagesInPinnedConversations___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a2, "guid");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E276D870;
  v4 = v2;

  return v4;
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (NSArray)contactItems
{
  return self->_contactItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactItems, 0);
  objc_storeStrong((id *)&self->_activityItems, 0);
}

@end
