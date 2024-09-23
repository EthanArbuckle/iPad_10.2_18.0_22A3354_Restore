@implementation IMInlineReplyController

- (void)dealloc
{
  objc_super v3;

  -[IMScheduledUpdater invalidate](self->_chatItemsUpdater, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)IMInlineReplyController;
  -[IMItemsController dealloc](&v3, sel_dealloc);
}

- (IMInlineReplyController)initWithChat:(id)a3 threadIdentifier:(id)a4 threadOriginator:(id)a5
{
  id v8;
  id v9;
  id v10;
  IMInlineReplyController *v11;
  IMInlineReplyController *v12;
  uint64_t v13;
  IMScheduledUpdater *chatItemsUpdater;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)IMInlineReplyController;
  v11 = -[IMItemsController init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    -[IMInlineReplyController setThreadIdentifier:](v11, "setThreadIdentifier:", v9);
    -[IMInlineReplyController setThreadOriginator:](v12, "setThreadOriginator:", v10);
    -[IMInlineReplyController setChat:](v12, "setChat:", v8);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D36AC8]), "initWithTarget:action:", v12, sel__updateChatItemsForChatItemUpdater);
    chatItemsUpdater = v12->_chatItemsUpdater;
    v12->_chatItemsUpdater = (IMScheduledUpdater *)v13;

    if (v10)
      -[IMItemsController _handleItem:forChatStyle:](v12, "_handleItem:forChatStyle:", v10, objc_msgSend(v8, "chatStyle"));
    v12->_hasEarlierMessagesToLoad = 0;
    v12->_hasRecentMessagesToLoad = 0;
  }

  return v12;
}

- (IMMessage)firstMessage
{
  void *v2;
  void *v3;

  -[IMItemsController _firstMessage](self, "_firstMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessage *)v3;
}

- (IMMessage)lastMessage
{
  void *v2;
  void *v3;

  -[IMItemsController _lastMessage](self, "_lastMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessage *)v3;
}

- (NSArray)chatItems
{
  IMChatItemRules *chatItemRules;

  chatItemRules = self->_chatItemRules;
  if (!chatItemRules)
  {
    -[IMInlineReplyController _setupChatItemRules](self, "_setupChatItemRules");
    chatItemRules = self->_chatItemRules;
  }
  return (NSArray *)-[IMChatItemRules _chatItems](chatItemRules, "_chatItems");
}

- (void)insertHistoricalMessages:(id)a3 queryID:(id)a4 hasMessagesBefore:(BOOL)a5 hasMessagesAfter:(BOOL)a6 isReplacingItems:(BOOL)a7
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  IMInlineReplyController *v24;
  _BYTE *v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;
  _BYTE buf[24];
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[IMInlineReplyController insertHistoricalMessages:queryID:hasMessagesBefore:hasMessagesAfter"
                           ":isReplacingItems:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "%s archivedMessages: %@", buf, 0x16u);

    }
  }
  self->_hasEarlierMessagesToLoad = a5;
  self->_hasRecentMessagesToLoad = a6;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v30 = sub_1A200AEF4;
  v31 = sub_1A200ACEC;
  v32 = 0;
  v16 = v12;
  v32 = v16;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = sub_1A2147894;
  v22 = &unk_1E4723058;
  v17 = v13;
  v24 = self;
  v25 = buf;
  v26 = a5;
  v27 = a6;
  v28 = a7;
  v23 = v17;
  v18 = _Block_copy(&v19);
  -[IMInlineReplyController _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("history query"), v18, v19, v20, v21, v22);

  _Block_object_dispose(buf, 8);
}

- (void)_itemsDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMInlineReplyController;
  -[IMItemsController _itemsDidChange:](&v4, sel__itemsDidChange_, a3);
  -[IMScheduledUpdater setNeedsUpdate](self->_chatItemsUpdater, "setNeedsUpdate");
}

- (void)insertItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMInlineReplyController itemMatchesThread:](self, "itemMatchesThread:", v4))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "guid");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 136315394;
        v9 = "-[IMInlineReplyController insertItem:]";
        v10 = 2112;
        v11 = v6;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "%s inserting %@, threadIdentifier matches", (uint8_t *)&v8, 0x16u);

      }
    }
    -[IMInlineReplyController chat](self, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItemsController _handleItem:forChatStyle:](self, "_handleItem:forChatStyle:", v4, objc_msgSend(v7, "chatStyle"));

  }
}

- (void)removeItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMInlineReplyController itemMatchesThread:](self, "itemMatchesThread:", v4))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "guid");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 136315394;
        v8 = "-[IMInlineReplyController removeItem:]";
        v9 = 2112;
        v10 = v6;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "%s removing %@", (uint8_t *)&v7, 0x16u);

      }
    }
    -[IMItemsController _removeItem:](self, "_removeItem:", v4);
  }

}

- (void)replaceItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[IMInlineReplyController itemsMatchingThread:guids:](self, "itemsMatchingThread:guids:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 136315394;
        v10 = "-[IMInlineReplyController replaceItems:]";
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "%s replacing items %@", (uint8_t *)&v9, 0x16u);

      }
    }
    -[IMItemsController _replaceItems:](self, "_replaceItems:", v6);
  }

}

- (BOOL)itemMatchesThread:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *AssociatedMessageGUIDFromThreadIdentifier;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  int v29;
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  NSObject *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMInlineReplyController disableItemInserts](self, "disableItemInserts"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v29 = 136315138;
        v30 = "-[IMInlineReplyController itemMatchesThread:]";
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "%s returning NO, disableItemInserts enabled", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_33;
    }
LABEL_34:
    v14 = 0;
    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_34;
  v5 = v4;
  -[NSObject threadIdentifier](v5, "threadIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    goto LABEL_10;
  }
  -[NSObject guid](v5, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMInlineReplyController threadOriginator](self, "threadOriginator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "guid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
LABEL_10:
    -[IMInlineReplyController threadIdentifier](self, "threadIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject threadIdentifier](v5, "threadIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if ((v13 & 1) != 0)
      goto LABEL_11;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        -[NSObject guid](v5, "guid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 136315394;
        v30 = "-[IMInlineReplyController itemMatchesThread:]";
        v31 = 2112;
        v32 = v16;
        _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "%s threadIdentifier does not match for item %@", (uint8_t *)&v29, 0x16u);

      }
    }
    -[NSObject threadIdentifier](v5, "threadIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    if (!v18)
      goto LABEL_33;
    -[NSObject associatedMessageGUID](v5, "associatedMessageGUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMInlineReplyController threadIdentifier](self, "threadIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    AssociatedMessageGUIDFromThreadIdentifier = (void *)IMMessageCreateAssociatedMessageGUIDFromThreadIdentifier();

    IMAssociatedMessageDecodeGUID();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      IMAssociatedMessageDecodeGUID();
      v23 = objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isEqualToString:", v23) & 1) != 0)
        goto LABEL_19;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          -[NSObject guid](v5, "guid");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 136315906;
          v30 = "-[IMInlineReplyController itemMatchesThread:]";
          v31 = 2112;
          v32 = v22;
          v33 = 2112;
          v34 = v23;
          v35 = 2112;
          v36 = v27;
          _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, "%s guidFromThreadIdentifier %@ does not match guidFromAssociateMessageGUID %@ for item %@", (uint8_t *)&v29, 0x2Au);

        }
      }
    }
    else
    {
      -[NSObject syndicationRanges](v5, "syndicationRanges");
      v23 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject count](v23, "count"))
      {
        -[NSObject guid](v5, "guid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v22, "isEqualToString:", v24);

        if (v25)
        {
          if (!IMOSLoggingEnabled())
            goto LABEL_20;
          OSLogHandleForIMFoundationCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            v29 = 136315394;
            v30 = "-[IMInlineReplyController itemMatchesThread:]";
            v31 = 2112;
            v32 = v22;
            _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "%s guidFromThreadIdentifier %@ is the same as the item given, and it has syndication ranges.", (uint8_t *)&v29, 0x16u);
          }
LABEL_19:

LABEL_20:
          goto LABEL_11;
        }
LABEL_32:

LABEL_33:
        goto LABEL_34;
      }
    }

    goto LABEL_32;
  }
LABEL_11:

  v14 = 1;
LABEL_35:

  return v14;
}

- (id)itemsMatchingThread:(id)a3 guids:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1A2148434;
  v10[3] = &unk_1E4723080;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a3, "__imArrayByApplyingBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setNeedsUpdateChatItems
{
  -[IMScheduledUpdater setNeedsUpdate](self->_chatItemsUpdater, "setNeedsUpdate");
}

- (void)updateChatItemsIfNeeded
{
  MEMORY[0x1E0DE7D20](self->_chatItemsUpdater, sel_updateIfNeeded);
}

- (void)performActionDisallowingItemInsert:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[IMInlineReplyController setDisableItemInserts:](self, "setDisableItemInserts:", 1);
  v4[2](v4);

  -[IMInlineReplyController setDisableItemInserts:](self, "setDisableItemInserts:", 0);
}

- (void)_updateChatItemsForChatItemUpdater
{
  -[IMInlineReplyController _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMInlineReplyController) Chat Items need update"), &unk_1E471DBD8);
}

- (void)_updateChatItemsWithReason:(id)a3 block:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__updateChatItemsWithReason_block_shouldPost_);
}

- (void)_updateChatItemsWithReason:(id)a3 block:(id)a4 shouldPost:(BOOL)a5
{
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  id v38;
  void *v39;
  char v40;
  NSObject *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  void (**v70)(void);
  void *v71;
  IMChatItemRules *v72;
  void *v73;
  IMInlineReplyController *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  uint8_t v83[128];
  uint8_t buf[4];
  id v85;
  __int16 v86;
  id v87;
  uint64_t v88;

  v65 = a5;
  v88 = *MEMORY[0x1E0C80C00];
  v68 = a3;
  v70 = (void (**)(void))a4;
  v7 = MEMORY[0x1E0C80D38];
  v8 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_V2(v7);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[IMInlineReplyController chat](self, "chat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "guid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v85 = v11;
      v86 = 2112;
      v87 = v68;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Update chat items (chatGUID: %@), reason: %@", buf, 0x16u);

    }
  }
  v72 = self->_chatItemRules;
  if (self->_isUpdatingChatItems)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Update already in progress, executing update block", buf, 2u);
      }

    }
    v70[2]();
  }
  else
  {
    v74 = self;
    self->_isUpdatingChatItems = 1;
    v70[2]();
    -[IMScheduledUpdater setNeedsUpdate:](self->_chatItemsUpdater, "setNeedsUpdate:", 0);
    self->_isUpdatingChatItems = 0;
    if (v72)
    {
      -[IMItemsController _items](self, "_items");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v64, "count"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v85 = v14;
          _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "\tIMItem count = %@", buf, 0xCu);

        }
      }
      -[IMChatItemRules _chatItems](v72, "_chatItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "copy");
      _IMChatItemsReplaceWithChatItemsForItems(v15, v72, v64);
      -[IMChatItemRules _didProcessChatItems:](v72, "_didProcessChatItems:", v15);
      if (v16)
      {
        v17 = v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v73 = v17;

      if (v15)
      {
        v19 = v15;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      v20 = v19;

      objc_msgSend(v20, "differenceFromArray:", v73);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = 0;
      v82 = 0;
      IMIndexesFromOrderedCollectionDifference(v63, &v82, &v81);
      v67 = v82;
      v66 = v81;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v67, "count"))
      {
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = sub_1A214922C;
        v79[3] = &unk_1E4721618;
        v80 = v62;
        objc_msgSend(v20, "enumerateObjectsAtIndexes:options:usingBlock:", v67, 0, v79);

      }
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v73, "count"));
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v20, "count"));
      objc_msgSend(v21, "removeIndexes:", v66);
      objc_msgSend(v22, "removeIndexes:", v67);
      v23 = objc_msgSend(v21, "firstIndex");
      v24 = objc_msgSend(v22, "firstIndex");
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v25 = v24;
        if (v24 != 0x7FFFFFFFFFFFFFFFLL)
        {
          do
          {
            objc_msgSend(v73, "objectAtIndex:", v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndex:", v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26 != v27)
            {
              objc_msgSend(v71, "addIndex:", v25);
              objc_msgSend(v26, "_timeAdded");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "_setTimeAdded:", v28);

            }
            if (-[IMChatItemRules _shouldReloadChatItem:oldChatItem:](self->_chatItemRules, "_shouldReloadChatItem:oldChatItem:", v27, v26))objc_msgSend(v69, "addIndex:", v25);
            v23 = objc_msgSend(v21, "indexGreaterThanIndex:", v23);
            v25 = objc_msgSend(v22, "indexGreaterThanIndex:", v25);

          }
          while (v23 != 0x7FFFFFFFFFFFFFFFLL && v25 != 0x7FFFFFFFFFFFFFFFLL);
        }
      }

      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v29 = v20;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      if (v30)
      {
        v31 = 0;
        v32 = *(_QWORD *)v76;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v76 != v32)
              objc_enumerationMutation(v29);
            objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "_timeStale");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v34;
            if (v34)
            {
              objc_msgSend(v34, "earlierDate:", v31);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = v36 == v35;

              if (v37)
              {
                v38 = v35;

                v31 = v38;
              }
            }

          }
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
        }
        while (v30);

        if (v31)
        {
          -[IMChatItemRules _nextStaleTime](v72, "_nextStaleTime");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v31, "isEqualToDate:", v39);

          if ((v40 & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v85 = v31;
                _os_log_impl(&dword_1A1FF4000, v41, OS_LOG_TYPE_INFO, "\tSchedule _replaceStaleChatItems for nextStaleTime:%@", buf, 0xCu);
              }

            }
            -[IMChatItemRules _setNextStaleTime:](v72, "_setNextStaleTime:", v31);
            objc_msgSend(v31, "timeIntervalSinceReferenceDate");
            v43 = v42;
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            v45 = v43 - v44;
            v46 = 0.0;
            if (v45 > 0.0)
            {
              objc_msgSend(v31, "timeIntervalSinceReferenceDate");
              v48 = v47;
              objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
              v46 = v48 - v49;
            }
            objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", v74, sel__replaceStaleChatItems, 0);
            -[IMInlineReplyController performSelector:withObject:afterDelay:](v74, "performSelector:withObject:afterDelay:", sel__replaceStaleChatItems, 0, v46);
          }
        }
      }
      else
      {

        v31 = 0;
      }
      if (objc_msgSend(v66, "count")
        || objc_msgSend(v67, "count")
        || objc_msgSend(v69, "count")
        || objc_msgSend(v71, "count"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            -[IMInlineReplyController chat](v74, "chat");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMInlineReplyController chat](v74, "chat");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "guid");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v85 = v51;
            v86 = 2112;
            v87 = v53;
            _os_log_impl(&dword_1A1FF4000, v50, OS_LOG_TYPE_INFO, "\tchat: %@, guid: %@", buf, 0x16u);

          }
        }
        if (objc_msgSend(v67, "count") && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v85 = v67;
            _os_log_impl(&dword_1A1FF4000, v54, OS_LOG_TYPE_INFO, "\tinserted: %@", buf, 0xCu);
          }

        }
        if (objc_msgSend(v66, "count") && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v85 = v66;
            _os_log_impl(&dword_1A1FF4000, v55, OS_LOG_TYPE_INFO, "\tremoved: %@", buf, 0xCu);
          }

        }
        if (objc_msgSend(v69, "count") && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v85 = v69;
            _os_log_impl(&dword_1A1FF4000, v56, OS_LOG_TYPE_INFO, "\treload: %@", buf, 0xCu);
          }

        }
        if (objc_msgSend(v71, "count") && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v85 = v71;
            _os_log_impl(&dword_1A1FF4000, v57, OS_LOG_TYPE_INFO, "\tregenerate: %@", buf, 0xCu);
          }

        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v73, "count"));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v85 = v59;
            v86 = 2112;
            v87 = v60;
            _os_log_impl(&dword_1A1FF4000, v58, OS_LOG_TYPE_INFO, "\toldChatItems: %@, newChatItems: %@", buf, 0x16u);

          }
        }
        if (v65)
          -[IMInlineReplyController _postIMChatItemsDidChangeNotificationWithInserted:removed:reload:regenerate:oldChatItems:newChatItems:](v74, "_postIMChatItemsDidChangeNotificationWithInserted:removed:reload:regenerate:oldChatItems:newChatItems:", v67, v66, v69, v71, v73, v29);
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v61, OS_LOG_TYPE_INFO, "\tDon't post update, no significant updates to chatItems.", buf, 2u);
        }

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "ChatItem Rules undefined, skipping update.", buf, 2u);
      }

    }
  }

}

- (void)_replaceStaleChatItems
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[16];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "(IMInlineReplyController) _replaceStaleChatItems", buf, 2u);
    }

  }
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[IMInlineReplyController chatItems](self, "chatItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v9, "_timeStale");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "timeIntervalSinceReferenceDate");
          v13 = v12;
          objc_msgSend(v10, "timeIntervalSinceReferenceDate");
          v15 = v13 < v14;

          if (!v15)
          {
            objc_msgSend(v9, "_item");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v5 == v16)
            {
              v17 = v5;
            }
            else
            {
              v17 = v16;

              v5 = (void *)objc_msgSend(v17, "_copy");
              objc_msgSend(v24, "addObject:", v5);
            }

            v5 = v17;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v6);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = v24;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v18);
        v22 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        -[IMInlineReplyController chat](self, "chat");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMItemsController _handleItem:forChatStyle:](self, "_handleItem:forChatStyle:", v22, objc_msgSend(v23, "chatStyle"));

      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v19);
  }

  -[IMChatItemRules _setNextStaleTime:](self->_chatItemRules, "_setNextStaleTime:", 0);
}

- (void)_postNotification:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFirstLoad");

  if ((v9 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Notification posted: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "__mainThreadPostNotificationName:object:userInfo:", v6, self, v7);

  }
}

- (void)_postIMChatItemsDidChangeNotificationWithInserted:(id)a3 removed:(id)a4 reload:(id)a5 regenerate:(id)a6 oldChatItems:(id)a7 newChatItems:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  _QWORD v30[6];
  _QWORD v31[7];

  v31[6] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v30[0] = CFSTR("__kIMChatItemsInserted");
  v19 = (uint64_t)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v19;
  v31[0] = v19;
  v30[1] = CFSTR("__kIMChatItemsRemoved");
  v20 = (uint64_t)v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v20;
  v31[1] = v20;
  v30[2] = CFSTR("__kIMChatItemsReload");
  v21 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = v13;
  v31[2] = v21;
  v30[3] = CFSTR("__kIMChatItemsRegenerate");
  v22 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[3] = v22;
  v30[4] = CFSTR("__kIMChatItemsOldItems");
  v23 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[4] = v23;
  v30[5] = CFSTR("__kIMChatItemsNewItems");
  v24 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[5] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v17)
      goto LABEL_15;
LABEL_21:

    if (v16)
      goto LABEL_16;
    goto LABEL_22;
  }

  if (!v17)
    goto LABEL_21;
LABEL_15:
  if (v16)
    goto LABEL_16;
LABEL_22:

LABEL_16:
  if (v15)
  {
    if (v14)
      goto LABEL_18;
LABEL_24:

    if (v29)
      goto LABEL_19;
LABEL_25:

    goto LABEL_19;
  }

  if (!v14)
    goto LABEL_24;
LABEL_18:
  if (!v29)
    goto LABEL_25;
LABEL_19:
  -[IMInlineReplyController _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMInlineReplyChatItemsDidChangeNotification"), v25);

}

- (void)_setupChatItemRules
{
  void *v3;
  IMInlineReplyChatItemRules *v4;
  void *v5;
  void *v6;
  IMChatItemRules *v7;
  IMChatItemRules **p_chatItemRules;
  IMChatItemRules *chatItemRules;
  void *v10;
  IMChatItemRules *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36AE8], "IMCoreSetupTimingCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startTimingForKey:", CFSTR("IMInlineReplySetup: Generate chat items"));
  v4 = [IMInlineReplyChatItemRules alloc];
  -[IMInlineReplyController chat](self, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMInlineReplyController threadIdentifier](self, "threadIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IMInlineReplyChatItemRules initWithChat:threadIdentifier:](v4, "initWithChat:threadIdentifier:", v5, v6);
  p_chatItemRules = &self->_chatItemRules;
  chatItemRules = self->_chatItemRules;
  self->_chatItemRules = v7;

  -[IMItemsController _items](self, "_items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *p_chatItemRules;
  -[IMChatItemRules _chatItems](v11, "_chatItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _IMChatItemsReplaceWithChatItemsForItems(v12, v11, v10);
  -[IMChatItemRules _didProcessChatItems:](v11, "_didProcessChatItems:", v12);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315394;
      v16 = "-[IMInlineReplyController _setupChatItemRules]";
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "%s Configuring chatItemRules and chatItems, count: %@", (uint8_t *)&v15, 0x16u);

    }
  }
  objc_msgSend(v3, "stopTimingForKey:", CFSTR("IMInlineReplySetup: Generate chat items"));

}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (IMChat)chat
{
  return (IMChat *)objc_loadWeakRetained((id *)&self->_chat);
}

- (void)setChat:(id)a3
{
  objc_storeWeak((id *)&self->_chat, a3);
}

- (IMMessageItem)threadOriginator
{
  return self->_threadOriginator;
}

- (void)setThreadOriginator:(id)a3
{
  objc_storeStrong((id *)&self->_threadOriginator, a3);
}

- (BOOL)hasEarlierMessagesToLoad
{
  return self->_hasEarlierMessagesToLoad;
}

- (void)setHasEarlierMessagesToLoad:(BOOL)a3
{
  self->_hasEarlierMessagesToLoad = a3;
}

- (BOOL)hasRecentMessagesToLoad
{
  return self->_hasRecentMessagesToLoad;
}

- (void)setHasRecentMessagesToLoad:(BOOL)a3
{
  self->_hasRecentMessagesToLoad = a3;
}

- (BOOL)disableItemInserts
{
  return self->_disableItemInserts;
}

- (void)setDisableItemInserts:(BOOL)a3
{
  self->_disableItemInserts = a3;
}

- (IMChatItemRules)chatItemRules
{
  return self->_chatItemRules;
}

- (void)setChatItemRules:(id)a3
{
  objc_storeStrong((id *)&self->_chatItemRules, a3);
}

- (IMScheduledUpdater)chatItemsUpdater
{
  return self->_chatItemsUpdater;
}

- (void)setChatItemsUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_chatItemsUpdater, a3);
}

- (BOOL)isUpdatingChatItems
{
  return self->_isUpdatingChatItems;
}

- (void)setIsUpdatingChatItems:(BOOL)a3
{
  self->_isUpdatingChatItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatItemsUpdater, 0);
  objc_storeStrong((id *)&self->_chatItemRules, 0);
  objc_storeStrong((id *)&self->_threadOriginator, 0);
  objc_destroyWeak((id *)&self->_chat);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
}

@end
