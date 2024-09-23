@implementation CKAggregateAcknowledgmentChatItem

- (CKAggregateAcknowledgmentChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  id v6;
  CKAggregateAcknowledgmentChatItem *v7;
  void *v8;
  uint64_t v9;
  IMTapback *latestTapback;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *mediaObjects;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CKAggregateAcknowledgmentChatItem;
  v7 = -[CKChatItem initWithIMChatItem:maxWidth:](&v34, sel_initWithIMChatItem_maxWidth_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "latestTapback");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_latestAcknowledgmentType = CKMessageAcknowledgmentTypeFromIMAssociatedMessageType(objc_msgSend(v8, "associatedMessageType"));

    v28 = v6;
    objc_msgSend(v6, "latestTapback");
    v9 = objc_claimAutoreleasedReturnValue();
    latestTapback = v7->_latestTapback;
    v7->_latestTapback = (IMTapback *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[CKAggregateAcknowledgmentChatItem acknowledgments](v7, "acknowledgments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v16, "tapback");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v16, "tapback");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "transferGUID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              objc_msgSend(v16, "chatContext");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "message");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "mediaObjectWithTransferGUID:imMessage:chatContext:", v20, v22, v21);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (v24)
                objc_msgSend(v29, "addObject:", v24);

            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v13);
    }

    v25 = objc_msgSend(v29, "copy");
    mediaObjects = v7->_mediaObjects;
    v7->_mediaObjects = (NSArray *)v25;

    v6 = v28;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "IMChatItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (Class)balloonViewClass
{
  -[CKChatItem isFromMe](self, "isFromMe");
  return (Class)(id)objc_opt_class();
}

- (id)associatedChatItemGUID
{
  void *v2;
  void *v3;
  void *v4;

  -[CKAggregateAcknowledgmentChatItem _imAggregateAcknowledgmentChatItem](self, "_imAggregateAcknowledgmentChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "associatedMessageGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMAssociatedMessageDecodeGUID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)serviceName
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)includesFromMe
{
  void *v2;
  char v3;

  -[CKAggregateAcknowledgmentChatItem _imAggregateAcknowledgmentChatItem](self, "_imAggregateAcknowledgmentChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "includesFromMe");

  return v3;
}

- (BOOL)latestIsFromMe
{
  void *v2;
  char v3;

  -[CKAggregateAcknowledgmentChatItem _imAggregateAcknowledgmentChatItem](self, "_imAggregateAcknowledgmentChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "latestIsFromMe");

  return v3;
}

- (BOOL)includesMultiple
{
  void *v2;
  char v3;

  -[CKAggregateAcknowledgmentChatItem _imAggregateAcknowledgmentChatItem](self, "_imAggregateAcknowledgmentChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "includesMultiple");

  return v3;
}

- (IMMessageAcknowledgmentChatItem)sentTapbackChatItem
{
  void *v2;
  void *v3;

  -[CKAggregateAcknowledgmentChatItem _imAggregateAcknowledgmentChatItem](self, "_imAggregateAcknowledgmentChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fromMeAcknowledgement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessageAcknowledgmentChatItem *)v3;
}

- (int64_t)fromMeAcknowledgmentType
{
  void *v2;
  int64_t v3;

  -[CKAggregateAcknowledgmentChatItem sentTapbackChatItem](self, "sentTapbackChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "associatedMessageType");

  return v3;
}

- (NSArray)acknowledgments
{
  void *v2;
  void *v3;

  -[CKAggregateAcknowledgmentChatItem _imAggregateAcknowledgmentChatItem](self, "_imAggregateAcknowledgmentChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acknowledgments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)acknowledgmentImageName
{
  void *v3;
  void *v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageAcknowledgmentImageNameForType:", self->_latestAcknowledgmentType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (UIColor)acknowledgmentImageColor
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[CKAggregateAcknowledgmentChatItem latestIsFromMe](self, "latestIsFromMe");
  if (self->_latestAcknowledgmentType == 2000)
  {
    if (-[CKAggregateAcknowledgmentChatItem latestIsFromMe](self, "latestIsFromMe"))
    {
      -[CKAggregateAcknowledgmentChatItem serviceName](self, "serviceName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F68]);

    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "theme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageAcknowledgment:acknowledgmentImageColor:", v3, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v8;
}

- (char)balloonOrientation
{
  return !-[CKAggregateAcknowledgmentChatItem overrideBalloonOrientationForPhotoGrid](self, "overrideBalloonOrientationForPhotoGrid")&& -[CKAssociatedMessageChatItem parentMessageIsFromMe](self, "parentMessageIsFromMe");
}

- (char)transcriptOrientation
{
  if (-[CKAssociatedMessageChatItem parentMessageIsFromMe](self, "parentMessageIsFromMe"))
    return 2;
  else
    return 0;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  void *v5;
  int v6;
  CKTapbackPileViewModel *v7;
  CKTapbackPileViewModel *v8;
  int v9;
  CKTapbackPileLayout *v10;
  CKTapbackPileLayout *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a4, a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEmojiTapbacksEnabled");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (CKTapbackPileViewModel *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
    goto LABEL_5;
  v9 = -[CKTapbackPileViewModel usesFannedBubbleStyle](v7, "usesFannedBubbleStyle");

  if (!v9)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (CKTapbackPileViewModel *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
LABEL_5:
    -[CKTapbackPileViewModel aggregateAcknowledgmentTranscriptBalloonSize](v7, "aggregateAcknowledgmentTranscriptBalloonSize");
    v13 = v16;
    v15 = v17;
    goto LABEL_6;
  }
  v8 = -[CKTapbackPileViewModel initWithAggregateAcknowledgmentChatItem:]([CKTapbackPileViewModel alloc], "initWithAggregateAcknowledgmentChatItem:", self);
  v10 = [CKTapbackPileLayout alloc];
  v11 = -[CKTapbackPileLayout initWithSourcePoint:viewModel:](v10, "initWithSourcePoint:viewModel:", v8, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[CKTapbackPileLayout pilePositioningSize](v11, "pilePositioningSize");
  v13 = v12;
  v15 = v14;

LABEL_6:
  v18 = v13;
  v19 = v15;
  result.height = v19;
  result.width = v18;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "balloonTranscriptInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)isCommSafetySensitiveNotViewable
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CKAggregateAcknowledgmentChatItem acknowledgments](self, "acknowledgments", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "commSafetyTransferGUID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "transferForGUID:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = objc_msgSend(v8, "commSafetySensitive");
          if (v9 == 1)
          {

            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)containsTransferGUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CKAggregateAcknowledgmentChatItem acknowledgments](self, "acknowledgments", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "containsTransferGUID:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (int64_t)latestAcknowledgmentType
{
  return self->_latestAcknowledgmentType;
}

- (IMTapback)latestTapback
{
  return self->_latestTapback;
}

- (BOOL)overrideBalloonOrientationForPhotoGrid
{
  return self->_overrideBalloonOrientationForPhotoGrid;
}

- (void)setOverrideBalloonOrientationForPhotoGrid:(BOOL)a3
{
  self->_overrideBalloonOrientationForPhotoGrid = a3;
}

- (BOOL)parentIsOrganicLayout
{
  return self->_parentIsOrganicLayout;
}

- (void)setParentIsOrganicLayout:(BOOL)a3
{
  self->_parentIsOrganicLayout = a3;
}

- (NSArray)mediaObjects
{
  return self->_mediaObjects;
}

- (void)setMediaObjects:(id)a3
{
  objc_storeStrong((id *)&self->_mediaObjects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaObjects, 0);
  objc_storeStrong((id *)&self->_latestTapback, 0);
}

@end
