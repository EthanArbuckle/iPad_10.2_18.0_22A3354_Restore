@implementation CKAssociatedStickerChatItem

+ (double)computeHorizontalStickerFrameOffset:(CGRect)a3 parentSize:(CGSize)a4 forPositioningWithinContentAlignmentRect:(CGRect)a5 geometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a6 forTranscriptOrientation:(char)a7
{
  int v7;
  double height;
  double width;
  CGFloat x;
  double v12;
  double v13;
  __int128 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double result;
  double v21;
  double v22;
  double v23;
  CGFloat rect;
  _OWORD v25[3];
  double rotation;
  CGRect v27;

  v7 = a7;
  height = a3.size.height;
  width = a3.size.width;
  rect = a3.origin.y;
  x = a3.origin.x;
  +[CKAssociatedMessageChatItem adjustContentAlignmentRect:forChatItemSize:transcriptOrientation:](CKAssociatedStickerChatItem, "adjustContentAlignmentRect:forChatItemSize:transcriptOrientation:", a7, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a4.width, a4.height);
  v13 = v12;
  v14 = *(_OWORD *)&a6->parentPreviewWidth;
  v25[0] = *(_OWORD *)&a6->layoutIntent;
  v25[1] = v14;
  v25[2] = *(_OWORD *)&a6->yScalar;
  rotation = a6->rotation;
  +[CKAssociatedMessageChatItem horizontalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:](CKAssociatedStickerChatItem, "horizontalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:", v25, width, height, v15, v13, v16, v17);
  v19 = v18;
  if (v7 == 2)
  {
    v27.origin.x = x;
    v27.origin.y = rect;
    v27.size.width = width;
    v27.size.height = height;
    v22 = v19 + CGRectGetWidth(v27);
    v23 = v22 - CGRectGetMaxX(a5);
    if (v23 <= 0.0)
      return 0.0;
    else
      return 0.0 - v23;
  }
  else
  {
    result = 0.0;
    if (!v7)
    {
      if (v19 >= a5.origin.x)
        v21 = v19;
      else
        v21 = a5.origin.x;
      return v21 - v19;
    }
  }
  return result;
}

- (NSString)stickerDetailsTitleText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[CKAssociatedStickerChatItem transferGUID](self, "transferGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferForGUID:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CKStickerDetailViewController isGenmojiBundleIDFromFileTransfer:](CKStickerDetailViewController, "isGenmojiBundleIDFromFileTransfer:", v4))
  {
    objc_msgSend(v4, "adaptiveImageGlyphContentDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (!objc_msgSend(v5, "length"))
  {
    +[CKStickerDetailViewController localizedAppNameForStickerDetailsFromFileTransfer:](CKStickerDetailViewController, "localizedAppNameForStickerDetailsFromFileTransfer:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return (NSString *)v5;
}

- (NSString)stickerDetailsSubtitleText
{
  void *v2;
  void *v3;

  -[CKAssociatedMessageChatItem sender](self, "sender");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (IMSticker)saveableSticker
{
  return (IMSticker *)+[CKUtilities saveableStickerFromChatItem:](CKUtilities, "saveableStickerFromChatItem:", self);
}

- (BOOL)canDeleteFromStickerDetails
{
  return 1;
}

- (id)stickerDetailsPreview
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;

  -[CKAssociatedStickerChatItem mediaObject](self, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewMaxWidth");
  v5 = v4;

  objc_msgSend(v2, "previewForWidth:orientation:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKAssociatedStickerChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  id v6;
  CKAssociatedStickerChatItem *v7;
  CKAssociatedStickerChatItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKAssociatedStickerChatItem;
  v7 = -[CKChatItem initWithIMChatItem:maxWidth:](&v18, sel_initWithIMChatItem_maxWidth_, v6, a4);
  v8 = v7;
  if (v7)
  {
    -[CKAssociatedStickerChatItem transferGUID](v7, "transferGUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        NSStringFromSelector(sel_chatContext);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        NSStringFromSelector(sel_message);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
      }
      +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAssociatedStickerChatItem transferGUID](v8, "transferGUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "mediaObjectWithTransferGUID:imMessage:chatContext:", v15, v13, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKAssociatedStickerChatItem setMediaObject:](v8, "setMediaObject:", v16);
    }
  }

  return v8;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  __int128 v7;
  void *v8;
  double *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  char isKindOfClass;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  __int128 v48;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (a4)
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E0CEB4B0];
    *(_OWORD *)&a4->bottom = v7;
  }
  +[CKChatItemSizeCache sharedInstance](CKChatItemSizeCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (double *)MEMORY[0x1E0C9D820];
  v48 = *MEMORY[0x1E0C9D820];
  if (objc_msgSend(v8, "cachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, &v48, 0, width, height))
  {
    v10 = *((double *)&v48 + 1);
    v11 = *(double *)&v48;
  }
  else
  {
    -[CKAssociatedStickerChatItem mediaObject](self, "mediaObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v13, "previewMaxWidth");
    objc_msgSend(v12, "previewForWidth:orientation:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    LOBYTE(v13) = objc_opt_isKindOfClass();
    v15 = v14;
    v16 = v15;
    if ((v13 & 1) != 0)
    {
      objc_msgSend(v15, "image");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "size");
      v19 = v18;
      v21 = v20;

      objc_msgSend(v16, "image");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v15, "size");
      v19 = v23;
      v21 = v24;
      v22 = v16;
    }
    objc_msgSend(v22, "scale");
    v26 = v25;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAssociatedMessageChatItem geometryDescriptor](self, "geometryDescriptor");
    objc_msgSend(v27, "stickerScreenScale");
    objc_msgSend(v27, "stickerSizeScaledWithInitialSize:imageScale:userScale:rectifiedScreenScale:maxWidth:", v19, v21, v26, v47, v28, width);
    v11 = v29;
    v10 = v30;
    -[CKAssociatedStickerChatItem mediaObject](self, "mediaObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CKAssociatedStickerChatItem mediaObject](self, "mediaObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v33, "isSticker") && objc_msgSend(v33, "isReaction"))
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stickerReactionSize");
        v11 = v35;
        v10 = v36;

      }
      else if (objc_msgSend(v33, "isSticker"))
      {
        objc_msgSend(v33, "sticker");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "externalURI");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "hasPrefix:", CFSTR("sticker:///emoji/"));

        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stickerScreenScale");
        objc_msgSend(v40, "stickerDropPreviewMaxWidthForImageSize:isEmoji:displayScale:", v39, v11, v10, v41);
        v43 = v42;

        if (v11 > v43 && v10 > 0.0)
        {
          objc_msgSend(v27, "stickerScreenScale");
          v10 = round(v43 / (v11 / v10) * v44) / v44;
          v11 = v43;
        }
      }

    }
    if (v11 != *v9 || v10 != v9[1])
      objc_msgSend(v8, "setCachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, v11, v10, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24), width, height);

  }
  v45 = v11;
  v46 = v10;
  result.height = v46;
  result.width = v45;
  return result;
}

- (BOOL)supportsCommunicationSafety
{
  return 1;
}

- (BOOL)isSticker
{
  return 1;
}

- (NSString)transferGUID
{
  void *v2;
  void *v3;

  -[CKAssociatedStickerChatItem IMAssociatedStickerChatItem](self, "IMAssociatedStickerChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transferGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (char)transcriptOrientation
{
  if (-[CKAssociatedMessageChatItem parentMessageIsFromMe](self, "parentMessageIsFromMe"))
    return 2;
  else
    return 0;
}

- (BOOL)isReaction
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;

  -[CKAssociatedStickerChatItem mediaObject](self, "mediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[CKAssociatedStickerChatItem mediaObject](self, "mediaObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isReaction");

  return v6;
}

- (void)refreshMediaObjectForStickerRepositioning
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v4, "performSelector:", sel_chatContext);

  }
  else
  {
    v12 = 0;
  }

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "performSelector:", sel_message);

  }
  else
  {
    v7 = 0;
  }

  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAssociatedStickerChatItem transferGUID](self, "transferGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaObjectWithTransferGUID:imMessage:chatContext:", v9, v7, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKAssociatedStickerChatItem setMediaObject:](self, "setMediaObject:", v10);
  -[CKAssociatedStickerChatItem IMAssociatedStickerChatItem](self, "IMAssociatedStickerChatItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_refreshGeometryDescriptorFromStickerUserInfo");

}

- (BOOL)chatItemIsStickerReposition
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAssociatedStickerChatItem transferGUID](self, "transferGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferForGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "updateReason") == 1 || objc_msgSend(v5, "updateReason") == 2;
  return v6;
}

- (BOOL)currentStickerRepositionIsLocalReposition
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAssociatedStickerChatItem transferGUID](self, "transferGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferForGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CKAssociatedStickerChatItem currentStickerRepositionIsLocalReposition].cold.1(v5);

  v7 = objc_msgSend(v5, "updateReason") == 1;
  return v7;
}

- (void)clearStickerRepositionLocalState
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAssociatedStickerChatItem transferGUID](self, "transferGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferForGUID:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setUpdateReason:", 0);
}

- (NSDictionary)stickerUserInfo
{
  void *v2;
  void *v3;
  void *v4;

  -[CKAssociatedStickerChatItem mediaObject](self, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stickerUserInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSDictionary)attributionInfo
{
  void *v2;
  void *v3;
  void *v4;

  -[CKAssociatedStickerChatItem mediaObject](self, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSNumber)adamID
{
  void *v2;
  void *v3;
  void *v4;

  -[CKAssociatedStickerChatItem attributionInfo](self, "attributionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D37F18]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSNumber *)v4;
}

+ (id)_showingStickers
{
  if (_showingStickers_token != -1)
    dispatch_once(&_showingStickers_token, &__block_literal_global_134);
  return (id)_showingStickers_stickers;
}

void __47__CKAssociatedStickerChatItem__showingStickers__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_showingStickers_stickers;
  _showingStickers_stickers = v0;

}

- (id)messageSummaryInfoValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CKAssociatedStickerChatItem IMAssociatedStickerChatItem](self, "IMAssociatedStickerChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageSummaryInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (IMSticker)sticker
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[CKAssociatedStickerChatItem mediaObject](self, "mediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKAssociatedStickerChatItem mediaObject](self, "mediaObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sticker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (IMSticker *)v6;
}

- (NSString)stickerPackName
{
  void *v2;
  void *v3;

  -[CKAssociatedStickerChatItem attributionInfo](self, "attributionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__ck_localizedAppNameForTranscriptAttribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isCustomSticker
{
  void *v2;
  BOOL v3;

  -[CKAssociatedStickerChatItem stickerPackGUID](self, "stickerPackGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (NSString)stickerPackGUID
{
  void *v2;
  void *v3;

  -[CKAssociatedStickerChatItem stickerUserInfo](self, "stickerUserInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D39310]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)canShowInAppStore
{
  void *v2;
  BOOL v3;

  -[CKAssociatedStickerChatItem adamID](self, "adamID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)attributionImage
{
  void *v2;
  void *v3;

  -[CKAssociatedStickerChatItem sticker](self, "sticker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributionImageTintColor
{
  return 0;
}

+ (id)_droppedStickers
{
  if (_droppedStickers_token != -1)
    dispatch_once(&_droppedStickers_token, &__block_literal_global_63_0);
  return (id)_droppedStickers_stickers;
}

void __47__CKAssociatedStickerChatItem__droppedStickers__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_droppedStickers_stickers;
  _droppedStickers_stickers = v0;

}

+ (BOOL)userHasDraggedSticker
{
  void *v2;
  char v3;
  char v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAlwaysShowStickerDropUIEnabled");

  if ((v3 & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("kUserHasDraggedSticker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v4 = objc_msgSend(v6, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (void)setUserHasDraggedSticker:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAlwaysShowStickerDropUIEnabled");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("kUserHasDraggedSticker"));

    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[CKAssociatedStickerChatItem setUserHasDraggedSticker:].cold.1(v3, v9);

    if (v3)
    {
      objc_msgSend(a1, "_droppedStickers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeAllObjects");

    }
  }
}

+ (void)addDroppedSticker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  if ((objc_msgSend(a1, "userHasDraggedSticker") & 1) == 0)
  {
    objc_msgSend(a1, "_droppedStickers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[CKAssociatedStickerChatItem addDroppedSticker:].cold.1(v4);

  }
}

+ (void)removeDroppedSticker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(a1, "_droppedStickers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  IMLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[CKAssociatedStickerChatItem removeDroppedSticker:].cold.1(v4);

}

+ (BOOL)isDroppedSticker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(a1, "_droppedStickers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  IMLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[CKAssociatedStickerChatItem isDroppedSticker:].cold.1(v4, v7, v8);

  return v7;
}

+ (void)clearTranscriptDisplayCaches
{
  void *v3;
  id v4;

  objc_msgSend(a1, "_droppedStickers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_msgSend(a1, "_showingStickers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (id)insertionHandler
{
  if (insertionHandler_token != -1)
    dispatch_once(&insertionHandler_token, &__block_literal_global_71_1);
  return (id)insertionHandler_sInsertionHandler;
}

void __47__CKAssociatedStickerChatItem_insertionHandler__block_invoke()
{
  CKStickerTranscriptInsertionHandler *v0;
  void *v1;

  v0 = objc_alloc_init(CKStickerTranscriptInsertionHandler);
  v1 = (void *)insertionHandler_sInsertionHandler;
  insertionHandler_sInsertionHandler = (uint64_t)v0;

}

- (void)setSticker:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (void)setMediaObject:(id)a3
{
  objc_storeStrong((id *)&self->_mediaObject, a3);
}

- (int64_t)stickerReactionIndex
{
  return self->_stickerReactionIndex;
}

- (void)setStickerReactionIndex:(int64_t)a3
{
  self->_stickerReactionIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaObject, 0);
  objc_storeStrong((id *)&self->_sticker, 0);
}

- (void)currentStickerRepositionIsLocalReposition
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "updateReason");
  IMStringFromIMFileTransferUpdateReason();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_18DFCD000, v2, v3, "File transfer update reason: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

+ (void)setUserHasDraggedSticker:(char)a1 .cold.1(char a1, NSObject *a2)
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v2 = CFSTR("YES");
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_DEBUG, "Set User has dragged a sticker %@", (uint8_t *)&v3, 0xCu);
}

+ (void)addDroppedSticker:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "uniqueID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_18DFCD000, v2, v3, "Added dropped sticker %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

+ (void)removeDroppedSticker:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "uniqueID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_18DFCD000, v2, v3, "Removed dropped sticker %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

+ (void)isDroppedSticker:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  v7 = 2112;
  v8 = v5;
  _os_log_debug_impl(&dword_18DFCD000, a3, OS_LOG_TYPE_DEBUG, "Sticker %@ is dropped sticker: %@", v6, 0x16u);

}

@end
