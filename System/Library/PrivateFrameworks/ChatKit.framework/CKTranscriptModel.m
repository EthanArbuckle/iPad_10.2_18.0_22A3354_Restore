@implementation CKTranscriptModel

- (CKTranscriptModel)initWithConversation:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  CKTranscriptModel *v8;
  CKTranscriptModel *v9;
  CKTranscriptModel *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)CKTranscriptModel;
    v8 = -[CKTranscriptModel init](&v13, sel_init);
    v9 = v8;
    if (v8)
    {
      -[CKTranscriptModel setDelegate:](v8, "setDelegate:", v7);
      -[CKTranscriptModel setConversation:](v9, "setConversation:", v6);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "CKTranscriptModel - Initialized with nil conversation", buf, 2u);
      }

    }
    v10 = 0;
  }

  return v10;
}

+ (id)transcriptSectionIdentifier
{
  return CFSTR("Transcript");
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "transcriptSectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CEA210]);
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendSectionsWithIdentifiers:", v5);

  -[CKTranscriptModel chatItems](self, "chatItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__imArrayByApplyingBlock:", &__block_literal_global_112);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, v3);
  return (NSDiffableDataSourceSnapshot *)v4;
}

id __29__CKTranscriptModel_snapshot__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)reload
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CKTranscriptModel setChatItems:](self, "setChatItems:", 0);
  -[CKTranscriptModel conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatItems");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CKTranscriptModel chatItemsWithIMChatItems:](self, "chatItemsWithIMChatItems:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptModel setChatItems:](self, "setChatItems:", v5);

}

- (id)chatItemsWithIMChatItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
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
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  -[CKTranscriptModel delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollectionForModel:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[CKTranscriptModel chatItemWithIMChatItem:traitCollection:](self, "chatItemWithIMChatItem:traitCollection:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), v7, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v5;
}

- (id)chatItemWithIMChatItem:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  -[CKTranscriptModel delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemMaxWidthForModel:", self);
  v10 = v9;

  -[CKTranscriptModel delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "balloonMaxWidthForModel:", self);
  v13 = v12;

  +[CKChatItem chatItemWithIMChatItem:balloonMaxWidth:fullMaxWidth:transcriptTraitCollection:overlayLayout:](CKChatItem, "chatItemWithIMChatItem:balloonMaxWidth:fullMaxWidth:transcriptTraitCollection:overlayLayout:", v7, v6, 0, v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setChatItems:(id)a3
{
  NSArray *v5;
  void *v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CKTranscriptModel *v19;
  NSArray *v20;
  NSArray *obj;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _QWORD v35[4];

  v35[2] = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  if (self->_chatItems != v5)
  {
    v19 = self;
    objc_storeStrong((id *)&self->_chatItems, a3);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](v5, "count"));
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = v5;
    obj = v5;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v24)
    {
      v22 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v9 = v23;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v26;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v26 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
                objc_msgSend(v8, "IMChatItem", v19);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "guid");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "supplementaryViewKindForGUID:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v6, "setObject:forKey:", v8, v17);
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v11);
          }

        }
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v24);
    }

    v18 = (void *)objc_msgSend(v6, "copy");
    -[CKTranscriptModel setSupplementaryKindToChatItemMap:](v19, "setSupplementaryKindToChatItemMap:", v18);

    v5 = v20;
  }

}

- (CKTranscriptModelDelegate)delegate
{
  return (CKTranscriptModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (NSArray)chatItems
{
  return self->_chatItems;
}

- (NSDictionary)supplementaryKindToChatItemMap
{
  return self->_supplementaryKindToChatItemMap;
}

- (void)setSupplementaryKindToChatItemMap:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryKindToChatItemMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryKindToChatItemMap, 0);
  objc_storeStrong((id *)&self->_chatItems, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
