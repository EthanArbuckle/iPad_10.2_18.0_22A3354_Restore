@implementation CKAggregateAttachmentMessagePartChatItem

- (unint64_t)layoutType
{
  if (-[CKChatItem itemIsReply](self, "itemIsReply"))
    return 12;
  else
    return 17;
}

- (CKAggregateAttachmentMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  CKAggregateAttachmentMessagePartChatItem *v4;
  CKAggregateAttachmentMessagePartChatItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKAggregateAttachmentMessagePartChatItem;
  v4 = -[CKMessagePartChatItem initWithIMChatItem:maxWidth:](&v7, sel_initWithIMChatItem_maxWidth_, a3, a4);
  v5 = v4;
  if (v4)
    -[CKAggregateAttachmentMessagePartChatItem _generateMediaObjects](v4, "_generateMediaObjects");
  return v5;
}

- (void)_generateMediaObjects
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = v3;
  objc_msgSend(v3, "aggregateAttachmentParts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
        -[CKChatItem maxWidth](self, "maxWidth");
        v12 = v11;
        -[CKChatItem maxWidth](self, "maxWidth");
        v14 = v13;
        -[CKAggregateAttachmentMessagePartChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKChatItem chatItemWithIMChatItem:balloonMaxWidth:fullMaxWidth:transcriptTraitCollection:overlayLayout:](CKChatItem, "chatItemWithIMChatItem:balloonMaxWidth:fullMaxWidth:transcriptTraitCollection:overlayLayout:", v10, v15, 0, v12, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v16);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
  -[CKAggregateAttachmentMessagePartChatItem setAggregateChatItems:](self, "setAggregateChatItems:", v4);

}

- (NSArray)mediaObjects
{
  NSArray *mediaObjects;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  NSArray *aggregatedVisibleAssociatedMessageChatItems;
  NSArray *v17;
  NSArray *aggregatedNonTapbackVisibleAssociatedMessageChatItems;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  mediaObjects = self->_mediaObjects;
  if (!mediaObjects)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[CKAggregateAttachmentMessagePartChatItem aggregateChatItems](self, "aggregateChatItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CKAggregateAttachmentMessagePartChatItem aggregateChatItems](self, "aggregateChatItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __56__CKAggregateAttachmentMessagePartChatItem_mediaObjects__block_invoke;
    v20[3] = &unk_1E275A7F8;
    v21 = v6;
    v22 = v7;
    v23 = v8;
    v10 = v8;
    v11 = v7;
    v12 = v6;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v20);

    v13 = (NSArray *)objc_msgSend(v12, "copy");
    v14 = self->_mediaObjects;
    self->_mediaObjects = v13;

    v15 = (NSArray *)objc_msgSend(v11, "copy");
    aggregatedVisibleAssociatedMessageChatItems = self->_aggregatedVisibleAssociatedMessageChatItems;
    self->_aggregatedVisibleAssociatedMessageChatItems = v15;

    v17 = (NSArray *)objc_msgSend(v10, "copy");
    aggregatedNonTapbackVisibleAssociatedMessageChatItems = self->_aggregatedNonTapbackVisibleAssociatedMessageChatItems;
    self->_aggregatedNonTapbackVisibleAssociatedMessageChatItems = v17;

    mediaObjects = self->_mediaObjects;
  }
  return mediaObjects;
}

void __56__CKAggregateAttachmentMessagePartChatItem_mediaObjects__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "mediaObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "addObject:", v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v3, "visibleAssociatedMessageChatItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(a1[5], "addObject:", v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(a1[6], "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewBalloonSizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canCopy
{
  return 1;
}

- (BOOL)canForward
{
  return 1;
}

- (BOOL)canDelete
{
  return 1;
}

- (BOOL)canExport
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CKAggregateAttachmentMessagePartChatItem mediaObjects](self, "mediaObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "canExport") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)setTranscriptTraitCollection:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((-[UITraitCollection isEqual:](self->_transcriptTraitCollection, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_transcriptTraitCollection, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[CKAggregateAttachmentMessagePartChatItem mediaObjects](self, "mediaObjects", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setTranscriptTraitCollection:", v5);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)canPerformQuickAction
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[CKMessagePartChatItem isReplyContextPreview](self, "isReplyContextPreview"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[CKAggregateAttachmentMessagePartChatItem mediaObjects](self, "mediaObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "canPerformQuickAction") & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v3;
}

- (UIEdgeInsets)stickerReactionInsets
{
  _BOOL4 v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = -[CKMessagePartChatItem isFromMe](self, "isFromMe");
  v3 = 0.0;
  if (v2)
    v4 = 90.0;
  else
    v4 = 0.0;
  if (v2)
    v5 = 0.0;
  else
    v5 = 90.0;
  v6 = 0.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v6;
  return result;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldCacheSize
{
  return 0;
}

- (NSArray)transferGUIDs
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transferGUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (CKMediaObjectAssetDataSource)dataSource
{
  CKMediaObjectAssetDataSource *dataSource;
  CKMediaObjectAssetDataSource *v4;
  void *v5;
  void *v6;
  void *v7;
  CKMediaObjectAssetDataSource *v8;
  CKMediaObjectAssetDataSource *v9;

  dataSource = self->_dataSource;
  if (!dataSource)
  {
    v4 = [CKMediaObjectAssetDataSource alloc];
    -[CKAggregateAttachmentMessagePartChatItem aggregateChatItems](self, "aggregateChatItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "guid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CKMediaObjectAssetDataSource initWithChatItems:parentChatItemGUID:](v4, "initWithChatItems:parentChatItemGUID:", v5, v7);
    v9 = self->_dataSource;
    self->_dataSource = v8;

    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (NSURL)momentShareURL
{
  NSURL *momentShareURL;
  void *v4;
  NSURL *v5;
  NSURL *v6;

  momentShareURL = self->_momentShareURL;
  if (!momentShareURL)
  {
    if (self->_hasCheckedForMomentShareURL)
    {
      momentShareURL = 0;
    }
    else
    {
      self->_hasCheckedForMomentShareURL = 1;
      -[CKAggregateAttachmentMessagePartChatItem mediaObjects](self, "mediaObjects");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CKMomentShareURLForMediaObjects(v4);
      v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v6 = self->_momentShareURL;
      self->_momentShareURL = v5;

      momentShareURL = self->_momentShareURL;
    }
  }
  return momentShareURL;
}

- (id)pasteboardItemProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[CKAggregateAttachmentMessagePartChatItem aggregateChatItems](self, "aggregateChatItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKAggregateAttachmentMessagePartChatItem aggregateChatItems](self, "aggregateChatItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__CKAggregateAttachmentMessagePartChatItem_pasteboardItemProviders__block_invoke;
  v9[3] = &unk_1E2754978;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

void __67__CKAggregateAttachmentMessagePartChatItem_pasteboardItemProviders__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "pasteboardItemProviders");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (id)transcriptTraitCollection
{
  return self->_transcriptTraitCollection;
}

- (NSArray)aggregateChatItems
{
  return self->_aggregateChatItems;
}

- (void)setAggregateChatItems:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateChatItems, a3);
}

- (void)setMediaObjects:(id)a3
{
  objc_storeStrong((id *)&self->_mediaObjects, a3);
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void)setMomentShareURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSArray)aggregatedVisibleAssociatedMessageChatItems
{
  return self->_aggregatedVisibleAssociatedMessageChatItems;
}

- (void)setAggregatedVisibleAssociatedMessageChatItems:(id)a3
{
  objc_storeStrong((id *)&self->_aggregatedVisibleAssociatedMessageChatItems, a3);
}

- (NSArray)aggregatedNonTapbackVisibleAssociatedMessageChatItems
{
  return self->_aggregatedNonTapbackVisibleAssociatedMessageChatItems;
}

- (void)setAggregatedNonTapbackVisibleAssociatedMessageChatItems:(id)a3
{
  objc_storeStrong((id *)&self->_aggregatedNonTapbackVisibleAssociatedMessageChatItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregatedNonTapbackVisibleAssociatedMessageChatItems, 0);
  objc_storeStrong((id *)&self->_aggregatedVisibleAssociatedMessageChatItems, 0);
  objc_storeStrong((id *)&self->_momentShareURL, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_mediaObjects, 0);
  objc_storeStrong((id *)&self->_aggregateChatItems, 0);
  objc_storeStrong((id *)&self->_transcriptTraitCollection, 0);
}

@end
