@implementation CKChatItemLayoutUtilities

+ (double)adjustedBalloonTopSpacingWithSpacing:(double)a3 previousChatItem:(id)a4
{
  id v5;
  void *v6;
  double v7;

  v5 = a4;
  if (objc_msgSend(v5, "layoutType") == 1 && objc_msgSend(v5, "hasTail"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "balloonMaskTailSizeForTailShape:", 1);
    a3 = a3 - v7;

  }
  return a3;
}

+ (double)adjustedTopSpacingForTextAlignmentInsetsWithSpacing:(double)a3 chatItem:(id)a4 previousChatItem:(id)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v7 = a5;
  objc_msgSend(a4, "transcriptTextAlignmentInsets");
  v9 = v8;
  objc_msgSend(v7, "transcriptTextAlignmentInsets");
  v11 = v10;

  return a3 - (v9 + v11);
}

+ (id)transcriptVerticalEdgeSpacingForChatItem:(id)a3 previousChatItem:(id)a4 topSpacing:(double)a5 bottomSpacing:(double)a6
{
  id v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "layoutType") == 1)
  {
    +[CKChatItemLayoutUtilities adjustedBalloonTopSpacingWithSpacing:previousChatItem:](CKChatItemLayoutUtilities, "adjustedBalloonTopSpacingWithSpacing:previousChatItem:", v10, a5);
    a5 = v11;
  }
  +[CKChatItemLayoutUtilities adjustedTopSpacingForTextAlignmentInsetsWithSpacing:chatItem:previousChatItem:](CKChatItemLayoutUtilities, "adjustedTopSpacingForTextAlignmentInsetsWithSpacing:chatItem:previousChatItem:", v9, v10, a5);
  objc_msgSend(MEMORY[0x1E0CEA1F8], "fixedSpacing:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6 == 0.0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA1F8], "fixedSpacing:", a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CEA1C8], "spacingForLeading:top:trailing:bottom:", 0, v12, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)transcriptBalloonVerticalLayoutSpacingWithTopSpacing:(double)a3 bottomSpacing:(double)a4 previousChatItem:(id)a5
{
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  if (objc_msgSend(v7, "layoutType") == 1 && objc_msgSend(v7, "hasTail"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "balloonMaskTailSizeForTailShape:", 1);
    a3 = a3 - v9;

  }
  objc_msgSend(MEMORY[0x1E0CEA1F8], "fixedSpacing:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 0.0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA1F8], "fixedSpacing:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CEA1C8], "spacingForLeading:top:trailing:bottom:", 0, v10, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)dynamicWidthLayoutSizeWithHeight:(double)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)needsAdditionalBracketPaddingForChatItem:(id)a3 prevChatItem:(id)a4
{
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  BOOL v10;

  v5 = a3;
  if ((objc_msgSend(a4, "itemIsFromMe") & 1) != 0 || !objc_msgSend(v5, "itemIsFromMe"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v5, "size");
    v7 = v6;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textBalloonMinHeight");
    v10 = v7 <= v9;

  }
  return v10;
}

+ (BOOL)prevMessageIsReplyForIndex:(unint64_t)a3 allDatasourceItems:(id)a4
{
  int64_t v5;
  void *v6;
  char v8;

  if ((uint64_t)(a3 - 1) < 1)
    return 0;
  v5 = a3;
  while (1)
  {
    objc_msgSend(a4, "objectAtIndex:", --v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;

    if (v5 <= 1)
      return 0;
  }
  v8 = objc_msgSend(v6, "itemIsReply");

  return v8;
}

+ (BOOL)nextMessageIsReplyForIndex:(unint64_t)a3 allDatasourceItems:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3 + 1;
  if (v6 >= objc_msgSend(v5, "count"))
  {
LABEL_4:
    v8 = 0;
  }
  else
  {
    while (1)
    {
      objc_msgSend(v5, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;

      if (++v6 >= objc_msgSend(v5, "count"))
        goto LABEL_4;
    }
    v8 = objc_msgSend(v7, "itemIsReply");

  }
  return v8;
}

+ (BOOL)nextItemIsOriginatorWithRepliesForIndex:(unint64_t)a3 allDatasourceItems:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3 + 1;
  if (a3 + 1 >= objc_msgSend(v6, "count"))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", a3 + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "itemIsThreadOriginator"))
      v9 = objc_msgSend(a1, "nextMessageIsReplyForIndex:allDatasourceItems:", v7, v6);
    else
      v9 = 0;

  }
  return v9;
}

+ (double)transcriptTapbackMinSpacingForSenderChatItem:(id)a3 withNextChatItem:(id)a4 previousItem:(id)a5 associatedChatItem:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  _BOOL4 v23;
  int v24;
  int v26;
  void *v27;
  int v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageAcknowledgmentTranscriptBalloonRelativePosition");
  v15 = v14;
  v17 = v16;

  objc_msgSend(v9, "size");
  v19 = v18;
  objc_msgSend(v12, "size");
  v21 = v20 - v15;
  v22 = +[CKChatItemLayoutUtilities layoutTypeIsMessageBalloonForChatItem:](CKChatItemLayoutUtilities, "layoutTypeIsMessageBalloonForChatItem:", v11);
  v23 = +[CKChatItemLayoutUtilities layoutTypeIsMessageBalloonForChatItem:](CKChatItemLayoutUtilities, "layoutTypeIsMessageBalloonForChatItem:", v12);

  v24 = objc_msgSend(v11, "itemIsFromMe");
  if (v19 >= v21 || !v22)
    v26 = 0;
  else
    v26 = v23 & (v24 ^ 1);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEmojiTapbacksEnabled");

  v29 = v19 < v21 && v23;
  if (!v28)
    v29 = v26;
  v30 = 0.0;
  if (v29 == 1)
  {
    objc_msgSend(v10, "size");
    v32 = v17 + v31;
    objc_msgSend(v9, "size");
    v34 = v32 - v33;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "smallTranscriptSpace");
    v30 = v34 + v36;

  }
  return v30;
}

+ (BOOL)layoutTypeIsMessageBalloonForChatItem:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "layoutType");
  return (v3 < 0xF) & (0x7002u >> v3);
}

+ (id)layoutSizeWithSize:(CGSize)a3
{
  double height;
  void *v4;
  void *v5;
  void *v6;

  height = a3.height;
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", a3.width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (CGSize)sizeWithLayoutSize:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v3 = a3;
  objc_msgSend(v3, "widthDimension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  v6 = 0.0;
  if (objc_msgSend(v4, "isAbsolute"))
  {
    objc_msgSend(v3, "widthDimension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dimension");
    v6 = v8;

  }
  objc_msgSend(v3, "heightDimension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isAbsolute"))
  {
    objc_msgSend(v3, "heightDimension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dimension");
    v5 = v11;

  }
  v12 = v6;
  v13 = v5;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (id)layoutGroupForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "layoutSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heightDimension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CEA1D0];
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "verticalGroupWithLayoutSize:subitems:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)balloonEdgeSpacingForItemWithLayoutEnvironment:(id)a3 orientation:(char)a4 itemSize:(CGSize)a5 supplementaryItems:(id)a6
{
  int v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  uint64_t i;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  uint64_t v35;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  double width;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  width = a5.width;
  v7 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a6;
  objc_msgSend(v8, "collectionLayoutEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "container");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentSize");
  v13 = v12;

  objc_msgSend(v8, "marginInsets");
  v15 = v14;
  v17 = v16;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "balloonMaskTailSizeForTailShape:", 1);
  v20 = v19;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v21 = v9;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v44;
    v25 = *MEMORY[0x1E0C9D538];
    v26 = 0.0;
    v27 = 0.0;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v44 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "containerAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v25;
        if (objc_msgSend(v29, "isAbsoluteOffset"))
        {
          objc_msgSend(v29, "offset");
          v30 = v31;
        }
        v32 = objc_msgSend(v29, "edges") & 2;
        v33 = fabs(v30);
        if (v33 >= v27 && v32 != 0)
          v27 = v33;
        v35 = objc_msgSend(v29, "edges") & 8;
        if (v33 >= v26 && v35 != 0)
          v26 = v33;

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v23);
  }
  else
  {
    v26 = 0.0;
    v27 = 0.0;
  }

  if (v7 == 2)
  {
    v38 = v20 + v13 - width - v17 - v26;
    v37 = (void *)MEMORY[0x1E0CEA1F8];
  }
  else
  {
    if (v7)
    {
      v39 = 0;
      goto LABEL_28;
    }
    v37 = (void *)MEMORY[0x1E0CEA1F8];
    v38 = v15 - v20 + v27;
  }
  objc_msgSend(v37, "fixedSpacing:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CEA1C8], "spacingForLeading:top:trailing:bottom:", v39, 0, 0, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

+ (id)avatarSupplementaryItemForChatItem:(id)a3 layoutEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transcriptContactImageDiameter");
  v10 = v9;

  objc_msgSend(a1, "layoutSizeWithSize:", v10, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1A8], "layoutAnchorWithEdges:absoluteOffset:", 6, -v10, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "IMChatItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "guid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTranscriptCollectionSupplementaryView supplementaryViewKindForGUID:](CKTranscriptAvatarSupplementaryView, "supplementaryViewKindForGUID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA200], "supplementaryItemWithLayoutSize:elementKind:containerAnchor:", v11, v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_opt_class();
  +[CKTranscriptCollectionSupplementaryView reuseIdentifier](CKTranscriptAvatarSupplementaryView, "reuseIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v18, v15, v19);

  return v16;
}

+ (id)tapbackSupplementaryItemForChatItem:(id)a3 layoutEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v6, "visibleAssociatedMessageChatItems", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v14;

          v11 = v15;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);

    if (!v11)
    {
      v20 = 0;
      goto LABEL_15;
    }
    objc_msgSend(v11, "size");
    objc_msgSend(a1, "layoutSizeWithSize:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "tapbackLayoutAnchorForAcknowledgmentChatItem:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "IMChatItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "guid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKTranscriptCollectionSupplementaryView supplementaryViewKindForGUID:](CKTranscriptTapbackSupplementaryView, "supplementaryViewKindForGUID:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA200], "supplementaryItemWithLayoutSize:elementKind:containerAnchor:", v8, v19, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    +[CKTranscriptCollectionSupplementaryView reuseIdentifier](CKTranscriptTapbackSupplementaryView, "reuseIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v22, v19, v23);

  }
  else
  {
    v11 = 0;
    v20 = 0;
  }

LABEL_15:
  return v20;
}

+ (id)tapbackLayoutAnchorForAcknowledgmentChatItem:(id)a3
{
  id v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;

  v3 = a3;
  v4 = objc_msgSend(v3, "transcriptOrientation");
  objc_msgSend(v3, "size");
  v6 = v5;
  objc_msgSend(v3, "size");
  v8 = v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageAcknowledgmentTranscriptBalloonRelativePosition");
  v11 = v10;
  v13 = v12;

  if (v4)
    v14 = 3;
  else
    v14 = 9;
  v15 = v8 - v11;
  if (v4)
    v15 = -(v8 - v11);
  return (id)objc_msgSend(MEMORY[0x1E0CEA1A8], "layoutAnchorWithEdges:absoluteOffset:", v14, v15, -(v6 + v13));
}

@end
