@implementation CKChatItem

- (BOOL)isEqual:(id)a3
{
  CKChatItem *v4;
  objc_class *Class;
  char v6;

  v4 = (CKChatItem *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class == object_getClass(v4))
      v6 = IMTranscriptChatItemEqual();
    else
      v6 = 0;
  }

  return v6;
}

- (id)syndicationBehaviorString
{
  if (-[CKChatItem syndicationBehavior](self, "syndicationBehavior"))
    return CFSTR("IMChatItemSyndicationBehaviorEnabled");
  else
    return CFSTR("IMChatItemSyndicationBehaviorNone");
}

- (NSString)description
{
  void *v3;
  unsigned int v4;
  double maxWidth;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v18 = (void *)MEMORY[0x1E0CB3940];
  v19.receiver = self;
  v19.super_class = (Class)CKChatItem;
  -[CKChatItem description](&v19, sel_description);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v17, "contiguousType");
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "attachmentContiguousType");
  maxWidth = self->_maxWidth;
  NSStringFromCGSize(self->_size);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromUIEdgeInsets(self->_textAlignmentInsets);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKChatItem transcriptOrientation](self, "transcriptOrientation");
  if (-[CKChatItem isHighlighted](self, "isHighlighted"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  -[CKChatItem syndicationBehaviorString](self, "syndicationBehaviorString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKChatItem wasDetonated](self, "wasDetonated"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v18, "stringWithFormat:", CFSTR("[%@ [IMChatItem: %@], contiguousType:%d, attachmentContiguousType:%d, maxWidth:%f, size:%@, textAlignmentInsets:%@, transcriptOrientation: %d, isHighlighted: %@, syndicationBehavior: %@, wasDetonated: %@]"), v16, v15, v14, v4, *(_QWORD *)&maxWidth, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)layoutGroupIdentifier
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutGroupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unsigned)contiguousType
{
  void *v4;
  unsigned __int8 v5;

  if (-[CKChatItem useContiguousTypeOverride](self, "useContiguousTypeOverride"))
    return -[CKChatItem contiguousTypeOverride](self, "contiguousTypeOverride");
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contiguousType");

  return v5;
}

- (unsigned)attachmentContiguousType
{
  void *v4;
  int v5;
  void *v6;
  unsigned __int8 v7;

  if (-[CKChatItem useContiguousTypeOverride](self, "useContiguousTypeOverride"))
    return -[CKChatItem contiguousTypeOverride](self, "contiguousTypeOverride");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsContiguousAttachments");

  if (!v5)
    return 0;
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "attachmentContiguousType");

  return v7;
}

- (BOOL)hasTail
{
  int v2;

  v2 = -[CKChatItem contiguousType](self, "contiguousType");
  return !v2 || v2 == 3;
}

- (NSAttributedString)transcriptText
{
  NSAttributedString *transcriptText;
  void *v4;
  NSAttributedString *v5;
  NSAttributedString *v6;

  transcriptText = self->_transcriptText;
  if (!transcriptText)
  {
    -[CKChatItem loadTranscriptText](self, "loadTranscriptText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSAttributedString *)objc_msgSend(v4, "copy");
    v6 = self->_transcriptText;
    self->_transcriptText = v5;

    transcriptText = self->_transcriptText;
  }
  return transcriptText;
}

- (void)unloadTranscriptText
{
  NSAttributedString *transcriptText;
  NSAttributedString *transcriptDrawerText;

  transcriptText = self->_transcriptText;
  self->_transcriptText = 0;

  transcriptDrawerText = self->_transcriptDrawerText;
  self->_transcriptDrawerText = 0;

}

- (CGSize)size
{
  double width;
  double height;
  double maxWidth;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  CGSize result;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_sizeLoaded)
  {
    width = self->_size.width;
    height = self->_size.height;
  }
  else
  {
    maxWidth = self->_maxWidth;
    if (maxWidth == 0.0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bounds");
        v8 = v7;
        v10 = v9;

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Transcript sizing race condition. Please file a bug on Messages.", (uint8_t *)&v14, 2u);
          }

        }
        maxWidth = fmin(v8, v10);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = 138412290;
            v15 = v13;
            _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v14, 0xCu);

          }
        }
      }
    }
    self->_sizeLoaded = 1;
    -[CKChatItem loadSizeThatFits:textAlignmentInsets:](self, "loadSizeThatFits:textAlignmentInsets:", &self->_textAlignmentInsets, maxWidth, 1.79769313e308);
    self->_size.width = width;
    self->_size.height = height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)textAlignmentInsets
{
  void *v3;
  double maxWidth;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  double top;
  double left;
  double bottom;
  double right;
  int v19;
  void *v20;
  uint64_t v21;
  UIEdgeInsets result;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_sizeLoaded)
  {
    v3 = (void *)MEMORY[0x193FF4740]();
    maxWidth = self->_maxWidth;
    if (maxWidth == 0.0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bounds");
        v7 = v6;
        v9 = v8;

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            LOWORD(v19) = 0;
            _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Transcript sizing race condition. Please file a bug on Messages.", (uint8_t *)&v19, 2u);
          }

        }
        maxWidth = fmin(v7, v9);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = 138412290;
            v20 = v12;
            _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v19, 0xCu);

          }
        }
      }
    }
    self->_sizeLoaded = 1;
    -[CKChatItem loadSizeThatFits:textAlignmentInsets:](self, "loadSizeThatFits:textAlignmentInsets:", &self->_textAlignmentInsets, maxWidth, 1.79769313e308);
    self->_size.width = v13;
    self->_size.height = v14;
    objc_autoreleasePoolPop(v3);
  }
  top = self->_textAlignmentInsets.top;
  left = self->_textAlignmentInsets.left;
  bottom = self->_textAlignmentInsets.bottom;
  right = self->_textAlignmentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

+ (void)unloadSizesOfChatItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[CKChatItemSizeCache sharedInstance](CKChatItemSizeCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateCachedSizeForChatItems:reason:", v3, CFSTR("chatitem_unloadsizes"));

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "unloadSize", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)unloadSize
{
  self->_sizeLoaded = 0;
}

- (UIEdgeInsets)contentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (char)transcriptOrientation
{
  return 0;
}

- (Class)cellClass
{
  return 0;
}

- (NSString)cellIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (IMHandle)sender
{
  return 0;
}

- (CNContact)contact
{
  return 0;
}

- (BOOL)displayDuringSend
{
  return 0;
}

- (NSAttributedString)transcriptDrawerText
{
  NSAttributedString *transcriptDrawerText;
  void *v4;
  NSAttributedString *v5;
  NSAttributedString *v6;

  transcriptDrawerText = self->_transcriptDrawerText;
  if (!transcriptDrawerText)
  {
    -[CKChatItem loadTranscriptDrawerText](self, "loadTranscriptDrawerText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSAttributedString *)objc_msgSend(v4, "copy");
    v6 = self->_transcriptDrawerText;
    self->_transcriptDrawerText = v5;

    transcriptDrawerText = self->_transcriptDrawerText;
  }
  return transcriptDrawerText;
}

- (BOOL)wantsDrawerLayout
{
  return -[CKChatItem transcriptOrientation](self, "transcriptOrientation") == 0;
}

- (BOOL)wantsMoreMenu
{
  void *v3;
  char isKindOfClass;
  void *v5;
  unint64_t v6;
  unsigned int v7;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "scheduleState");
    v7 = (v6 < 6) & (0x39u >> v6);

  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)canBeSelectedInEditMode
{
  return 0;
}

- (BOOL)canCopy
{
  return 0;
}

- (BOOL)canDelete
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canDelete");

  return v3;
}

- (BOOL)canRetract
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canRetract");

  return v3;
}

- (BOOL)canEditMessageText
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canEditMessageText");

  return v3;
}

- (BOOL)isEditedMessageHistory
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditedMessageHistory");

  return v3;
}

- (BOOL)canForward
{
  return 0;
}

- (BOOL)canExport
{
  return 0;
}

- (BOOL)canSave
{
  return 0;
}

- (BOOL)canSendAsTextMessage
{
  return 0;
}

- (BOOL)canInlineReply
{
  return 0;
}

- (NSString)menuTitle
{
  return 0;
}

- (BOOL)canAttachStickers
{
  return 0;
}

- (BOOL)stickersSnapToPoint
{
  return 0;
}

- (UIEdgeInsets)stickerReactionInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)canPerformQuickAction
{
  return 0;
}

- (BOOL)canSendTapbacks
{
  return 0;
}

- (BOOL)isFromMe
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromMe");

  return v3;
}

- (BOOL)supportsInlineReplyTransition
{
  return 1;
}

- (BOOL)supportsCommunicationSafety
{
  return 0;
}

- (NSString)commSafetyTransferGUID
{
  return 0;
}

- (NSString)commSafetyMessageGUID
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (IMFileTransfer)commSafetyFileTransfer
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[CKChatItem supportsCommunicationSafety](self, "supportsCommunicationSafety")
    && (-[CKChatItem commSafetyTransferGUID](self, "commSafetyTransferGUID"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "length"),
        v3,
        v4))
  {
    objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatItem commSafetyTransferGUID](self, "commSafetyTransferGUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transferForGUID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (IMFileTransfer *)v7;
}

- (BOOL)isCommSafetySensitiveViewable
{
  void *v3;
  BOOL v4;

  if (!-[CKChatItem supportsCommunicationSafety](self, "supportsCommunicationSafety"))
    return 0;
  -[CKChatItem commSafetyFileTransfer](self, "commSafetyFileTransfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "commSafetySensitive") == 2;

  return v4;
}

- (BOOL)isCommSafetySensitiveNotViewable
{
  void *v3;
  BOOL v4;

  if (!-[CKChatItem supportsCommunicationSafety](self, "supportsCommunicationSafety"))
    return 0;
  -[CKChatItem commSafetyFileTransfer](self, "commSafetyFileTransfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "commSafetySensitive") == 1;

  return v4;
}

- (BOOL)isCommSafetySensitive
{
  _BOOL4 v3;

  v3 = -[CKChatItem supportsCommunicationSafety](self, "supportsCommunicationSafety");
  if (v3)
    LOBYTE(v3) = -[CKChatItem isCommSafetySensitiveViewable](self, "isCommSafetySensitiveViewable")
              || -[CKChatItem isCommSafetySensitiveNotViewable](self, "isCommSafetySensitiveNotViewable");
  return v3;
}

- (BOOL)isAudioMessage
{
  return 0;
}

+ (double)resultingMaxWidthWithBalloonMaxWidth:(double)a3 fullMaxWidth:(double)a4 transcriptTraitCollection:(id)a5
{
  return a4;
}

- (void)updateWithBalloonMaxWidth:(double)a3 fullMaxWidth:(double)a4 transcriptTraitCollection:(id)a5
{
  id v8;
  double v9;
  double v10;

  v8 = a5;
  objc_msgSend((id)objc_opt_class(), "resultingMaxWidthWithBalloonMaxWidth:fullMaxWidth:transcriptTraitCollection:", v8, a3, a4);
  v10 = v9;

  -[CKChatItem setMaxWidth:](self, "setMaxWidth:", v10);
}

- (void)setContiguousTypeOverride:(unsigned __int8)a3
{
  self->_contiguousTypeOverride = a3;
  -[CKChatItem setUseContiguousTypeOverride:](self, "setUseContiguousTypeOverride:", 1);
}

- (BOOL)invalidateContiguousTypeOverride
{
  BOOL v3;
  void *v4;

  v3 = -[CKChatItem useContiguousTypeOverride](self, "useContiguousTypeOverride");
  -[CKChatItem setUseContiguousTypeOverride:](self, "setUseContiguousTypeOverride:", 0);
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_contiguousTypeOverride = objc_msgSend(v4, "contiguousType");

  return v3;
}

- (void)setMaxWidth:(double)a3
{
  if (self->_maxWidth != a3)
  {
    self->_maxWidth = a3;
    -[CKChatItem unloadSize](self, "unloadSize");
  }
}

- (CKChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  id v7;
  CKChatItem *v8;
  CKChatItem *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKChatItem;
  v8 = -[CKChatItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_imChatItem, a3);
    v9->_maxWidth = a4;
  }

  return v9;
}

- (CKChatItem)initWithNotification:(id)a3 maxWidth:(double)a4
{
  id v7;
  CKChatItem *v8;
  CKChatItem *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKChatItem;
  v8 = -[CKChatItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notification, a3);
    v9->_maxWidth = a4;
  }

  return v9;
}

- (id)loadTranscriptText
{
  return 0;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  __int128 v4;
  double v5;
  double v6;
  CGSize result;

  if (a4)
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E0CEB4B0];
    *(_OWORD *)&a4->bottom = v4;
  }
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)loadTranscriptDrawerText
{
  return 0;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  *retstr = *(CKBalloonDescriptor_t *)CKBalloonDescriptorZero;
  return self;
}

- (void)_setSizeForTesting:(CGSize)a3
{
  self->_size = a3;
  self->_sizeLoaded = 1;
}

- (int64_t)syndicationBehavior
{
  void *v2;
  int64_t v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "syndicationBehavior");

  return v3;
}

- (BOOL)isHighlighted
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHighlighted");

  return v3;
}

- (int64_t)syndicationType
{
  void *v2;
  int64_t v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "syndicationType");

  return v3;
}

- (BOOL)wasDetonated
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wasDetonated");

  return v3;
}

- (CKChatItemTranscriptInsertionHandler)insertionHandler
{
  return 0;
}

- (BOOL)_textContainsIMTextEffect
{
  return 0;
}

- (IMTranscriptChatItem)IMChatItem
{
  return self->_imChatItem;
}

- (void)setIMChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_imChatItem, a3);
}

- (UNNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  objc_storeStrong((id *)&self->_notification, a3);
}

- (void)setTranscriptText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)zOrder
{
  return self->_zOrder;
}

- (UITraitCollection)transcriptTraitCollection
{
  return self->_transcriptTraitCollection;
}

- (void)setTranscriptTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptTraitCollection, a3);
}

- (Class)customLayoutGroupProviderClass
{
  return self->_customLayoutGroupProviderClass;
}

- (void)setTranscriptDrawerText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)wantsOverlayLayout
{
  return self->_wantsOverlayLayout;
}

- (void)setWantsOverlayLayout:(BOOL)a3
{
  self->_wantsOverlayLayout = a3;
}

- (BOOL)canSendAsTextMessageOverSatellite
{
  return self->_canSendAsTextMessageOverSatellite;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (unsigned)contiguousTypeOverride
{
  return self->_contiguousTypeOverride;
}

- (BOOL)isSizeLoaded
{
  return self->_sizeLoaded;
}

- (void)setSizeLoaded:(BOOL)a3
{
  self->_sizeLoaded = a3;
}

- (BOOL)useContiguousTypeOverride
{
  return self->_useContiguousTypeOverride;
}

- (void)setUseContiguousTypeOverride:(BOOL)a3
{
  self->_useContiguousTypeOverride = a3;
}

- (NSString)transcriptIdentifier
{
  return self->_transcriptIdentifier;
}

- (void)setTranscriptIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptIdentifier, 0);
  objc_storeStrong((id *)&self->_transcriptDrawerText, 0);
  objc_storeStrong((id *)&self->_transcriptTraitCollection, 0);
  objc_storeStrong((id *)&self->_transcriptText, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_imChatItem, 0);
}

+ (id)chatItemWithIMChatItem:(id)a3 balloonMaxWidth:(double)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "__ck_chatItemClass")), "initWithIMChatItem:maxWidth:", v5, a4);

  return v6;
}

+ (id)chatItemWithIMChatItem:(id)a3 balloonMaxWidth:(double)a4 fullMaxWidth:(double)a5 transcriptTraitCollection:(id)a6 overlayLayout:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  void *v13;
  double v14;
  void *v15;

  v7 = a7;
  v11 = a6;
  v12 = a3;
  v13 = (void *)objc_msgSend(v12, "__ck_chatItemClass");
  objc_msgSend(v13, "resultingMaxWidthWithBalloonMaxWidth:fullMaxWidth:transcriptTraitCollection:", v11, a4, a5);
  v15 = (void *)objc_msgSend(objc_alloc((Class)v13), "initWithIMChatItem:maxWidth:", v12, v14);

  objc_msgSend(v15, "setTranscriptTraitCollection:", v11);
  objc_msgSend(v15, "setWantsOverlayLayout:", v7);
  return v15;
}

+ (id)chatItemWithNotification:(id)a3 balloonMaxWidth:(double)a4 fullMaxWidth:(double)a5
{
  id v6;
  CKTextMessagePartChatItem *v7;

  v6 = a3;
  v7 = -[CKChatItem initWithNotification:maxWidth:]([CKTextMessagePartChatItem alloc], "initWithNotification:maxWidth:", v6, a4);

  return v7;
}

- (unint64_t)layoutType
{
  return 0;
}

- (id)layoutItemWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5
{
  id v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  int v33;
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  CKChatItem *v38;
  uint64_t v39;
  CGSize v40;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  -[CKChatItem size](self, "size");
  v10 = v9;
  v12 = v11;
  -[CKChatItem contentInsets](self, "contentInsets");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v7, "marginInsets");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v7, "messageEditingContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v23 = v12 + v14 + v18 + v16 + v20;
  if (v21)
  {
    objc_msgSend(v21, "editedMessageGuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "guid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "isEqualToString:", v24))
    {
      objc_msgSend(v22, "editedMessageHeight");
      v23 = v27;
    }

  }
  if (CKPixelWidth_once_9 != -1)
    dispatch_once(&CKPixelWidth_once_9, &__block_literal_global_123);
  if (v23 < *(double *)&CKPixelWidth_sPixel_9)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v40.width = v10;
        v40.height = v23;
        NSStringFromCGSize(v40);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 136315650;
        v34 = "-[CKChatItem(Layout) layoutItemWithEnvironment:datasourceItemIndex:allDatasourceItems:]";
        v35 = 2112;
        v36 = v29;
        v37 = 2112;
        v38 = self;
        _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "CKChatItem_Layout - %s chatItem has invalid height < _1PX, has %@: %@", (uint8_t *)&v33, 0x20u);

      }
    }
    if (CKPixelWidth_once_9 != -1)
      dispatch_once(&CKPixelWidth_once_9, &__block_literal_global_123);
    v23 = *(double *)&CKPixelWidth_sPixel_9;
  }
  +[CKChatItemLayoutUtilities dynamicWidthLayoutSizeWithHeight:](CKChatItemLayoutUtilities, "dynamicWidthLayoutSizeWithHeight:", v23);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  double v20;
  NSObject *v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  height = a7.height;
  width = a7.width;
  v48 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  if (a4 < 1)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v14, "objectAtIndex:", a4 - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[CKChatItem layoutType](self, "layoutType") == 12)
  {
    -[CKChatItem layoutItemSpacingForReplyItemWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:](self, "layoutItemSpacingForReplyItemWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:", v13, a4, v14, v15, width, height);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_34:
    v27 = (void *)v17;
    goto LABEL_35;
  }
  if (-[CKChatItem layoutType](self, "layoutType") == 13)
  {
    -[CKChatItem layoutItemSpacingForReplyContextPreviewWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:](self, "layoutItemSpacingForReplyContextPreviewWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:", v13, a4, v14, v15);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  if (-[CKChatItem layoutType](self, "layoutType") == 14)
  {
    -[CKChatItem layoutItemSpacingForReplyThreadOriginatorWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:](self, "layoutItemSpacingForReplyThreadOriginatorWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:", v13, a4, v14, v15, width, height);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  if (-[CKChatItem layoutType](self, "layoutType") == 1 || -[CKChatItem layoutType](self, "layoutType") == 17)
  {
    v18 = 0.0;
    switch(objc_msgSend(v16, "layoutType"))
    {
      case 1:
      case 14:
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "balloonBalloonTranscriptSpace:", objc_msgSend(v16, "contiguousType"));
        goto LABEL_32;
      case 2:
      case 3:
      case 7:
      case 10:
      case 11:
      case 17:
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "mediumTranscriptSpace");
        goto LABEL_32;
      case 4:
      case 5:
      case 15:
        v28 = +[CKChatItemLayoutUtilities prevMessageIsReplyForIndex:allDatasourceItems:](CKChatItemLayoutUtilities, "prevMessageIsReplyForIndex:allDatasourceItems:", a4 - 1, v14);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v28)
          goto LABEL_31;
        goto LABEL_28;
      case 6:
      case 18:
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
        objc_msgSend(v19, "smallTranscriptSpace");
        goto LABEL_32;
      case 12:
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:
        objc_msgSend(v19, "extraLargeTranscriptSpace");
LABEL_32:
        v18 = v20;

        break;
      case 16:
        break;
      default:
        if (v16 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            v39 = (id)objc_opt_class();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CKChatItem layoutType](self, "layoutType"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (id)objc_opt_class();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "layoutType"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v41 = v39;
            v42 = 2112;
            v43 = v37;
            v44 = 2112;
            v45 = v38;
            v46 = 2112;
            v47 = v30;
            _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %@ (%@) shouldn't follow %@ (%@)", buf, 0x2Au);

          }
        }
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "smallTranscriptSpace");
        v18 = v32;

        break;
    }
    -[CKChatItem _additionalTopPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:](self, "_additionalTopPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:", self, a4, v14, v16, v13, width, height);
    v34 = v33;
    -[CKChatItem _additionalBottomPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:](self, "_additionalBottomPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:", self, a4, v14, v16, v13, width, height);
    +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v16, v18 + v34, v35);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v41 = (id)objc_opt_class();
      v22 = v41;
      _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "CKChatItem_Layout: Returning default spacing for %@, should be implemented in subclass!!", buf, 0xCu);

    }
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "smallTranscriptSpace");
  v25 = v24;

  objc_msgSend(MEMORY[0x1E0CEA1F8], "fixedSpacing:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C8], "spacingForLeading:top:trailing:bottom:", 0, v26, 0, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_35:
  return v27;
}

- (double)_additionalTopPaddingForChatItem:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 prevChatItem:(id)a6 layoutEnvironment:(id)a7 sizeOverride:(CGSize)a8
{
  double height;
  double width;
  id v13;
  id v14;
  double v15;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  int v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  int v38;
  _BOOL4 v39;
  _BOOL4 v40;
  BOOL v41;
  int v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat v62;
  CGFloat x;
  CGFloat v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  double MinY;
  double v71;
  double v72;
  double v73;
  _BOOL4 v74;
  void *v75;
  int v76;
  int v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  uint64_t v82;
  int64_t v84;
  CGFloat v85;
  CGFloat v86;
  int v87;
  uint64_t v88;
  id v89;
  id obj;
  uint64_t v92;
  void *v93;
  double v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  uint64_t v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  height = a8.height;
  width = a8.width;
  v106 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v89 = a5;
  v14 = a6;
  v15 = 0.0;
  if (-[CKChatItem layoutType](self, "layoutType") != 18)
  {
    if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      objc_msgSend(v13, "size");
      width = v17;
      height = v18;
    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "balloonBalloonTranscriptSpace:", 0);
    v21 = v20;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v13, "visibleAssociatedMessageChatItemsIncludingTapbacks");
    else
      objc_msgSend(v13, "visibleAssociatedMessageChatItems");
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v105, 16);
    if (v95)
    {
      v22 = 0;
      v23 = *(_QWORD *)v102;
      v84 = a4 - 2;
      v85 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v86 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v94 = height;
      v93 = v13;
      v88 = *(_QWORD *)v102;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v102 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v24);
          v100 = 0;
          v98 = 0u;
          v99 = 0u;
          v97 = 0u;
          if (v25 && (objc_msgSend(v25, "geometryDescriptor"), (_QWORD)v97 == 10))
          {
            +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "messageAcknowledgmentTranscriptBalloonRelativePosition");
            v28 = v27;
            v30 = v29;

            objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "isEmojiTapbacksEnabled");

            if (v32)
            {
              objc_msgSend(v25, "size");
              v28 = v33 - v28;
            }
            v96 = 0;
            objc_msgSend(v14, "size", v84);
            v35 = v34;
            v92 = objc_msgSend(v14, "layoutType");
            if (v92 == 6)
            {
              +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "balloonTranscriptInsets");
              v35 = v35 + fabs(v37);

            }
            v87 = objc_msgSend(v14, "transcriptOrientation");
            v38 = objc_msgSend(v93, "transcriptOrientation");
            objc_msgSend(v25, "size");
            v39 = -[CKChatItem previousReplyCount:allDatasourceItems:isOccludedForAssociatedSize:outMaxY:](self, "previousReplyCount:allDatasourceItems:isOccludedForAssociatedSize:outMaxY:", a4, v89, &v96);
            v40 = -[CKChatItem previousPhotoActionItemIsOccluded:allDatasourceItems:](self, "previousPhotoActionItemIsOccluded:allDatasourceItems:", a4, v89);
            if (v35 > width - v28
              || (v14 ? (v41 = v87 == v38) : (v41 = 0), !v41 ? (v42 = 1) : (v42 = v39), (v42 | v40) == 1))
            {
              if (v40)
              {
                +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "smallTranscriptSpace");
                v15 = v44 + v44;

              }
              else
              {
                objc_msgSend(v25, "size");
                if (v15 < v30 + v73)
                  v15 = v30 + v73;
              }
              v13 = v93;
            }
            else
            {
              v13 = v93;
            }
            v23 = v88;
            v74 = +[CKChatItemLayoutUtilities layoutTypeIsMessageBalloonForChatItem:](CKChatItemLayoutUtilities, "layoutTypeIsMessageBalloonForChatItem:", v14);
            if (v92 != 6 && a4 >= 2 && !v74)
            {
              objc_msgSend(v89, "objectAtIndexedSubscript:", v84);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = objc_msgSend(v14, "transcriptOrientation");
              v77 = objc_msgSend(v75, "transcriptOrientation");
              objc_msgSend(v75, "size");
              if (v76 == v77 && v78 > width - v28)
              {
                +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v79, "mediumTranscriptSpace");
                v81 = v80;

                if (v15 < v81)
                  v15 = v81;
              }

              v23 = v88;
            }
          }
          else
          {
            if (-[CKChatItem _associatedChatItemIsReaction:](self, "_associatedChatItemIsReaction:", v25, v84))
            {
              +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "stickerReactionTranscriptPaddingPercentage");
              v47 = v46;

              v48 = objc_msgSend(v13, "itemIsFromMe");
              objc_msgSend(v13, "stickerReactionInsets");
              +[CKAssociatedMessageChatItem locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:](CKAssociatedMessageChatItem, "locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:", v22, v48, 0.0, 0.0, width, height, v49, v50, v51, v52);
              v54 = v53;
              v56 = v55;
              +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "stickerReactionSize");
              v59 = v58;
              v61 = v60;

              v62 = -(v59 * v47);
              height = v94;
              v107.origin.x = v54;
              v107.origin.y = v56;
              v107.size.height = v85;
              v107.size.width = v86;
              v108 = CGRectInset(v107, v62, -(v61 * v47));
              x = v108.origin.x;
              v64 = v108.size.width;
              v65 = v108.size.height;
              ++v22;
            }
            else
            {
              objc_msgSend(v25, "frameRelativeToParentFrame:", 0.0, 0.0, width, height);
              x = v66;
              v64 = v67;
              v65 = v68;
            }
            v69 = v21 + v108.origin.y;
            v109.origin.x = 0.0;
            v109.origin.y = 0.0;
            v109.size.width = width;
            v109.size.height = height;
            MinY = CGRectGetMinY(v109);
            v110.origin.x = x;
            v110.origin.y = v69;
            v110.size.width = v64;
            v110.size.height = v65;
            v71 = MinY - CGRectGetMinY(v110);
            height = v94;
            v72 = v71 - v21;
            if (v15 < v72)
              v15 = v72;
          }
          ++v24;
        }
        while (v95 != v24);
        v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v105, 16);
        v95 = v82;
      }
      while (v82);
    }

  }
  return v15;
}

- (double)_additionalBottomPaddingForChatItem:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 prevChatItem:(id)a6 layoutEnvironment:(id)a7 sizeOverride:(CGSize)a8
{
  double height;
  double width;
  id v11;
  void *v12;
  int v13;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t i;
  void *v28;
  void *v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double MaxY;
  double v50;
  CGFloat rect;
  CGFloat v53;
  double v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  height = a8.height;
  width = a8.width;
  v60 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isExpressiveTextEnabled");

  if (!v13)
  {
    objc_msgSend(v11, "size");
    width = v17;
    objc_msgSend(v11, "size");
    goto LABEL_9;
  }
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v11, "size");
    width = v16;
LABEL_9:
    height = v15;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "balloonBalloonTranscriptSpace:", 0);
  v20 = v19;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v11, "visibleAssociatedMessageChatItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v56;
    v26 = 0.0;
    rect = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v53 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v56 != v25)
          objc_enumerationMutation(v21);
        v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (v28)
          objc_msgSend(v28, "geometryDescriptor");
        if (-[CKChatItem _associatedChatItemIsReaction:](self, "_associatedChatItemIsReaction:", v28))
        {
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stickerReactionTranscriptPaddingPercentage");
          v54 = v30;

          v31 = objc_msgSend(v11, "itemIsFromMe");
          objc_msgSend(v11, "stickerReactionInsets");
          +[CKAssociatedMessageChatItem locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:](CKAssociatedMessageChatItem, "locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:", v24, v31, 0.0, 0.0, width, height, v32, v33, v34, v35);
          v37 = v36;
          v38 = height;
          v39 = width;
          v40 = v20;
          v42 = v41;
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "stickerReactionSize");
          v45 = v44;
          v47 = v46;

          v61.size.width = v53;
          v61.origin.x = v37;
          v61.origin.y = v42;
          v20 = v40;
          width = v39;
          height = v38;
          v61.size.height = rect;
          v62 = CGRectInset(v61, -(v45 * v54), -(v47 * v54));
          ++v24;
        }
        else
        {
          objc_msgSend(v28, "frameRelativeToParentFrame:", 0.0, 0.0, width, height);
        }
        v48 = v20 + v62.origin.y;
        MaxY = CGRectGetMaxY(v62);
        v63.origin.x = 0.0;
        v63.origin.y = 0.0;
        v63.size.width = width;
        v63.size.height = height;
        v50 = MaxY - CGRectGetMaxY(v63);
        if (v26 < v50)
          v26 = v50;
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v23);
  }
  else
  {
    v26 = 0.0;
  }

  return v26;
}

- (BOOL)_associatedChatItemIsReaction:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "isReaction");
  else
    v4 = 0;

  return v4;
}

- (id)layoutItemSpacingForReplyItemWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  double v21;
  _BOOL4 v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  _BOOL4 v32;
  int v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  NSObject *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  id v44;
  char *v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  height = a7.height;
  width = a7.width;
  v54 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  if (-[CKChatItem layoutType](self, "layoutType") == 12)
  {
    if (a4 < 1)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v14, "objectAtIndex:", a4 - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (!objc_msgSend(v16, "itemIsReplyCount"))
    {
      switch(objc_msgSend(v16, "layoutType"))
      {
        case 1:
        case 12:
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        case 2:
        case 3:
        case 7:
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        case 4:
        case 5:
        case 6:
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "smallTranscriptSpace");
          goto LABEL_22;
        case 13:
        case 14:
          v32 = -[CKChatItem itemIsFromMe](self, "itemIsFromMe");
          v33 = objc_msgSend(v16, "itemIsFromMe");
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v34;
          if (((v32 ^ v33) & 1) != 0)
LABEL_21:
            objc_msgSend(v20, "mediumTranscriptSpace");
          else
            objc_msgSend(v34, "selfReplyTranscriptSpace");
          goto LABEL_22;
        default:
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              v45 = (char *)(id)objc_opt_class();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CKChatItem layoutType](self, "layoutType"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = (id)objc_opt_class();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "layoutType"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v47 = v45;
              v48 = 2112;
              v49 = (unint64_t)v43;
              v50 = 2112;
              v51 = v44;
              v52 = 2112;
              v53 = v40;
              _os_log_impl(&dword_18DFCD000, v39, OS_LOG_TYPE_INFO, "CKChatItem_Layout: Reply Item Spacing: %@ (%@) shouldn't follow %@ (%@)", buf, 0x2Au);

            }
          }
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "smallTranscriptSpace");
          v31 = v42;

          goto LABEL_24;
      }
    }
    v19 = -[CKChatItem itemIsFromMe](self, "itemIsFromMe");
    if (v19 == objc_msgSend(v16, "itemIsFromMe"))
    {
      v22 = +[CKChatItemLayoutUtilities needsAdditionalBracketPaddingForChatItem:prevChatItem:](CKChatItemLayoutUtilities, "needsAdditionalBracketPaddingForChatItem:prevChatItem:", self, v16);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v23;
      if (v22)
      {
        objc_msgSend(v23, "replyLineBracketRadius");
        v25 = v24;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "replyLineViewVerticalPadding");
        v28 = v27;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "textBalloonMinHeight");
        v31 = v25 + v28 * 2.0 + v30 * -0.5;

        goto LABEL_23;
      }
LABEL_19:
      objc_msgSend(v20, "balloonBalloonTranscriptSpace:", objc_msgSend(v16, "contiguousType"));
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "xsTranscriptSpace");
    }
LABEL_22:
    v31 = v21;
LABEL_23:

LABEL_24:
    -[CKChatItem _additionalTopPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:](self, "_additionalTopPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:", self, a4, v14, v16, v13, width, height);
    v36 = v35;
    -[CKChatItem _additionalBottomPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:](self, "_additionalBottomPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:", self, a4, v14, v16, v13, width, height);
    +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v16, v31 + v36, v37);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_25;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "-[CKChatItem(Layout) layoutItemSpacingForReplyItemWithEnvironment:datasourceItemIndex:allDatasourceItems:sup"
            "plementryItems:sizeOverride:]";
      v48 = 2048;
      v49 = -[CKChatItem layoutType](self, "layoutType");
      _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "CKChatItem_Layout - %s asked to generate spacing for non-reply type %lu", buf, 0x16u);
    }

  }
  v18 = 0;
LABEL_25:

  return v18;
}

- (id)layoutItemSpacingForReplyContextPreviewWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v21;
  char *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  int v28;
  const char *v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (-[CKChatItem layoutType](self, "layoutType") == 13)
  {
    if (a4 < 1)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(v11, "objectAtIndex:", a4 - 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_msgSend(v13, "layoutType");
    if (v16 <= 0xF)
    {
      if (((1 << v16) & 0x903A) != 0)
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "extraLargeTranscriptSpace");
LABEL_17:
        v19 = v18;

LABEL_18:
        +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v13, v19, 0.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      }
      if (((1 << v16) & 0x84) != 0)
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "mediumTranscriptSpace");
        goto LABEL_17;
      }
      if (v16 == 6)
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "smallTranscriptSpace");
        goto LABEL_17;
      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = (char *)(id)objc_opt_class();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CKChatItem layoutType](self, "layoutType"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_opt_class();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "layoutType"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138413058;
        v29 = v22;
        v30 = 2112;
        v31 = (unint64_t)v23;
        v32 = 2112;
        v33 = v24;
        v34 = 2112;
        v35 = v25;
        _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "CKChatItem_Layout: Reply Context Preview Spacing: %@ (%@) shouldn't follow %@ (%@)", (uint8_t *)&v28, 0x2Au);

      }
    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "smallTranscriptSpace");
    v19 = v27;

    goto LABEL_18;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v28 = 136315394;
      v29 = "-[CKChatItem(Layout) layoutItemSpacingForReplyContextPreviewWithEnvironment:datasourceItemIndex:allDatasourc"
            "eItems:supplementryItems:]";
      v30 = 2048;
      v31 = -[CKChatItem layoutType](self, "layoutType");
      _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "CKChatItem_Layout - %s asked to generate spacing for non-reply context preview type %lu", (uint8_t *)&v28, 0x16u);
    }

  }
  v15 = 0;
LABEL_19:

  return v15;
}

- (id)layoutItemSpacingForReplyThreadOriginatorWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  double v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSObject *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  id v34;
  char *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  height = a7.height;
  width = a7.width;
  v44 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  if (-[CKChatItem layoutType](self, "layoutType") == 14)
  {
    if (a4 < 1)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v14, "objectAtIndex:", a4 - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    switch(objc_msgSend(v16, "layoutType"))
    {
      case 1:
      case 12:
        if (-[CKChatItem itemIsSameThreadAsOtherItem:](self, "itemIsSameThreadAsOtherItem:", v16))
        {
          v21 = +[CKChatItemLayoutUtilities nextMessageIsReplyForIndex:allDatasourceItems:](CKChatItemLayoutUtilities, "nextMessageIsReplyForIndex:allDatasourceItems:", a4, v14);
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
            goto LABEL_18;
        }
        else
        {
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_20;
      case 2:
      case 3:
      case 7:
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "mediumTranscriptSpace");
        goto LABEL_21;
      case 4:
      case 5:
        v22 = +[CKChatItemLayoutUtilities prevMessageIsReplyForIndex:allDatasourceItems:](CKChatItemLayoutUtilities, "prevMessageIsReplyForIndex:allDatasourceItems:", a4 - 1, v14);
        v23 = +[CKChatItemLayoutUtilities nextMessageIsReplyForIndex:allDatasourceItems:](CKChatItemLayoutUtilities, "nextMessageIsReplyForIndex:allDatasourceItems:", a4, v14);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22 && !v23)
          goto LABEL_18;
LABEL_20:
        objc_msgSend(v19, "extraLargeTranscriptSpace");
        goto LABEL_21;
      case 6:
      case 15:
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
        objc_msgSend(v19, "smallTranscriptSpace");
LABEL_21:
        v24 = v20;

        break;
      default:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            v35 = (char *)(id)objc_opt_class();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CKChatItem layoutType](self, "layoutType"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (id)objc_opt_class();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "layoutType"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v37 = v35;
            v38 = 2112;
            v39 = (unint64_t)v33;
            v40 = 2112;
            v41 = v34;
            v42 = 2112;
            v43 = v30;
            _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "CKChatItem_Layout: Reply Thread Originator Spacing: %@ (%@) shouldn't follow %@ (%@)", buf, 0x2Au);

          }
        }
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "smallTranscriptSpace");
        v24 = v32;

        break;
    }
    -[CKChatItem _additionalTopPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:](self, "_additionalTopPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:", self, a4, v14, v16, v13, width, height);
    v26 = v25;
    -[CKChatItem _additionalBottomPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:](self, "_additionalBottomPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:", self, a4, v14, v16, v13, width, height);
    +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v16, v24 + v26, v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[CKChatItem(Layout) layoutItemSpacingForReplyThreadOriginatorWithEnvironment:datasourceItemIndex:allDatas"
              "ourceItems:supplementryItems:sizeOverride:]";
        v38 = 2048;
        v39 = -[CKChatItem layoutType](self, "layoutType");
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "CKChatItem_Layout - %s asked to generate spacing for non-thread originator preview type %lu", buf, 0x16u);
      }

    }
    v18 = 0;
  }

  return v18;
}

- (BOOL)previousReplyCount:(unint64_t)a3 allDatasourceItems:(id)a4 isOccludedForAssociatedSize:(CGSize)a5 outMaxY:(double *)a6
{
  double height;
  double width;
  id v10;
  _BOOL4 v11;
  void *v13;
  id v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v20;
  uint64_t v21;

  height = a5.height;
  width = a5.width;
  v10 = a4;
  v11 = -[CKChatItem itemIsReply](self, "itemIsReply");
  LOBYTE(self) = 0;
  if (v11 && (uint64_t)(a3 - 1) >= 1)
  {
    while (1)
    {
      objc_msgSend(v10, "objectAtIndex:", --a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;

      if ((uint64_t)a3 <= 1)
      {
        LOBYTE(self) = 0;
        goto LABEL_18;
      }
    }
    v14 = v13;
    v15 = objc_msgSend(v14, "replyCount");
    objc_msgSend(v14, "size");
    v17 = v16;
    objc_msgSend(v14, "size");
    v20 = width <= v17 && v15 > 1;
    LODWORD(self) = height <= v18 && v20;
    if ((_DWORD)self == 1)
    {
      objc_msgSend(v14, "size");
      *(_QWORD *)a6 = v21;
    }

  }
LABEL_18:

  return (char)self;
}

- (BOOL)previousPhotoActionItemIsOccluded:(unint64_t)a3 allDatasourceItems:(id)a4
{
  CKChatItem *v4;
  char isKindOfClass;

  v4 = self;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isSticker
{
  return 0;
}

- (NSArray)visibleAssociatedMessageChatItems
{
  return 0;
}

- (CKMessagePartHighlightChatItem)messageHighlightChatItem
{
  return 0;
}

- (BOOL)itemIsReply
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[CKChatItem isReply](self, "isReply");
  else
    return 0;
}

- (BOOL)itemIsFromMe
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromMe");

  return v3;
}

- (BOOL)itemIsReplyFromMe
{
  int v3;

  v3 = -[CKChatItem conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE17D420);
  if (v3)
    LOBYTE(v3) = -[CKChatItem replyIsFromMe](self, "replyIsFromMe");
  return v3;
}

- (BOOL)itemIsReplyContextPreview
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[CKChatItem isReplyContextPreview](self, "isReplyContextPreview");
  else
    return 0;
}

- (BOOL)itemIsThreadOriginator
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "itemIsThreadOriginator");

  return v3;
}

- (BOOL)itemIsReplyCount
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)itemIsSameThreadAsOtherItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IMChatItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "threadIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  return v9;
}

- (int64_t)chatItemReplyLineContiguousTypeForChatStyle:(unsigned __int8)a3
{
  int v3;
  int v4;
  int64_t v5;

  v3 = a3;
  v4 = -[CKChatItem contiguousType](self, "contiguousType");
  v5 = 1;
  if (v4 == 1)
    v5 = v3 == 45;
  if (v4 == 2)
    return 0;
  else
    return v5;
}

@end
