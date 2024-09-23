@implementation CKBalloonChatItem

- (unint64_t)layoutType
{
  if (-[CKChatItem itemIsReplyContextPreview](self, "itemIsReplyContextPreview"))
    return 13;
  if (-[CKChatItem itemIsThreadOriginator](self, "itemIsThreadOriginator"))
    return 14;
  if (-[CKChatItem itemIsReply](self, "itemIsReply"))
    return 12;
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CKBalloonChatItem;
  -[CKChatItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ fromMe:%d balloonOrientation:%d]"), v4, -[CKBalloonChatItem isFromMe](self, "isFromMe"), -[CKBalloonChatItem balloonOrientation](self, "balloonOrientation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIEdgeInsets)transcriptTextAlignmentInsets
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

- (char)transcriptOrientation
{
  if (-[CKBalloonChatItem isFromMe](self, "isFromMe"))
    return 2;
  else
    return 0;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (id)cellIdentifier
{
  void *v3;
  uint64_t v4;

  NSStringFromClass(-[CKBalloonChatItem balloonViewClass](self, "balloonViewClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CKBalloonChatItem isFromMe](self, "isFromMe"))
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("-left"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)contact
{
  CKEntity *entity;
  CKEntity *v4;
  void *v5;
  CKEntity *v6;
  CKEntity *v7;

  entity = self->_entity;
  if (!entity)
  {
    v4 = [CKEntity alloc];
    -[CKBalloonChatItem sender](self, "sender");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CKEntity initWithIMHandle:](v4, "initWithIMHandle:", v5);

    v7 = self->_entity;
    self->_entity = v6;

    entity = self->_entity;
  }
  return -[CKEntity cnContact](entity, "cnContact");
}

- (BOOL)displayDuringSend
{
  return 1;
}

- (BOOL)wantsDrawerLayout
{
  return 1;
}

- (BOOL)canBeSelectedInEditMode
{
  return 1;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  void *v8;
  void *v9;
  objc_class *v10;
  objc_class *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  double v14;
  double v15;
  __int128 v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  id v28;
  int v29;
  const __CFString *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  double v40;
  void *v41;
  char v42;
  double v43;
  double v44;
  int v45;
  __int128 v46;
  int v47;
  NSObject *v48;
  double v49;
  double v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  const __CFString *v62;
  uint64_t v63;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v63 = *MEMORY[0x1E0C80C00];
  +[CKChatItemSizeCache sharedInstance](CKChatItemSizeCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
  v55 = *MEMORY[0x1E0CEB4B0];
  v57 = *MEMORY[0x1E0CEB4B0];
  v58 = v54;
  v56 = *MEMORY[0x1E0C9D820];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CKBalloonChatItem balloonViewClass](self, "balloonViewClass");
  if (v10 == (objc_class *)objc_opt_class())
  {
    v12 = 1;
  }
  else
  {
    v11 = -[CKBalloonChatItem balloonViewClass](self, "balloonViewClass");
    v12 = v11 == (objc_class *)objc_opt_class();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (-[CKBalloonChatItem balloonViewClass](self, "balloonViewClass") ? (v13 = v12) : (v13 = 0), v13))
  {
    objc_msgSend(v9, "previewBalloonMaxWidthForBalloonMaxWidth:", width);
    width = v14;
  }
  if (-[CKBalloonChatItem failed](self, "failed") && objc_msgSend(v9, "shouldAdjustWidthForSendFailure"))
  {
    +[CKTranscriptMessageCell failureButtonWidthPlusSpacing](CKTranscriptBalloonCell, "failureButtonWidthPlusSpacing");
    width = width - v15;
  }
  if (-[CKBalloonChatItem shouldCacheSize](self, "shouldCacheSize")
    && objc_msgSend(v8, "cachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, &v56, &v57, width, height))
  {
    if (a4)
    {
      v16 = v58;
      *(_OWORD *)&a4->top = v57;
      *(_OWORD *)&a4->bottom = v16;
    }
    v18 = *((double *)&v56 + 1);
    v17 = *(double *)&v56;
    goto LABEL_71;
  }
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  v21 = objc_msgSend(v20, "chatInScrutinyMode");
  if (v21)
  {
    objc_msgSend(v20, "guid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    IMAssociatedMessageDecodeGUID();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v23;
        _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "Attempting to size %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0D35780], "storeGUIDInAttemptingListInScrutinyMode:", v23);
    if (!v20)
      goto LABEL_42;
  }
  else
  {
    v23 = 0;
    if (!v20)
      goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v25 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject isInternalInstall](v25, "isInternalInstall") & 1) != 0)
  {
    v26 = IMGetCachedDomainBoolForKey();

    if (!v26)
      goto LABEL_42;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v20, "guid");
        v28 = (id)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v20, "isCorrupt");
        v30 = CFSTR("NO");
        if (v29)
          v30 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v60 = v28;
        v61 = 2112;
        v62 = v30;
        _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "DEBUG: message %@ isCorrupt %@", buf, 0x16u);

      }
    }
    if (objc_msgSend(v20, "isCorrupt"))
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_42;
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "We are corrupt already, not crashing", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v20, "text");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "string");
      v25 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject isEqualToString:](v25, "isEqualToString:", CFSTR("internal_poison_hang")))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v52, OS_LOG_TYPE_INFO, "INTERNAL POISON PILL TEST DETECTED - Spinning", buf, 2u);
          }

        }
        while (1)
          sleep(1u);
      }
      if (-[NSObject isEqualToString:](v25, "isEqualToString:", CFSTR("internal_poison_crash")))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v53, OS_LOG_TYPE_INFO, "INTERNAL POISON PILL TEST DETECTED - Crashing", buf, 2u);
          }

        }
        abort();
      }
    }
  }

LABEL_42:
  CKBalloonViewForClass(-[CKBalloonChatItem balloonViewClass](self, "balloonViewClass"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonChatItem configureBalloonView:](self, "configureBalloonView:", v31);
  objc_msgSend(v31, "setCanUseOpaqueMask:", objc_msgSend(v9, "transcriptCanUseOpaqueMask"));
  objc_msgSend(v31, "prepareForDisplayIfNeeded");
  objc_msgSend(v31, "frame");
  objc_msgSend(v31, "setFrame:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self->_isMultilineText
      || (-[CKBalloonChatItem balloonSizeAtMaxWidth](self, "balloonSizeAtMaxWidth"), v32 <= 0.0)
      || (-[CKBalloonChatItem balloonSizeAtMaxWidth](self, "balloonSizeAtMaxWidth"), v33 <= 0.0)
      || (-[CKBalloonChatItem balloonSizeAtMaxWidth](self, "balloonSizeAtMaxWidth"), v34 >= width))
    {
      buf[0] = 0;
      objc_msgSend(v31, "sizeThatFits:textAlignmentInsets:isSingleLine:", a4, buf, width, height);
      v17 = v43;
      v18 = v44;
      v45 = buf[0];
      self->_isMultilineText = buf[0] ^ 1;
      if (v45)
      {
        -[CKBalloonChatItem setBalloonSizeAtMaxWidth:](self, "setBalloonSizeAtMaxWidth:", v43, v44);
        -[CKBalloonChatItem setTextAlignmentInsetsAtMaxWidth:](self, "setTextAlignmentInsetsAtMaxWidth:", a4->top, a4->left, a4->bottom, a4->right);
      }
      goto LABEL_55;
    }
    -[CKBalloonChatItem textAlignmentInsetsAtMaxWidth](self, "textAlignmentInsetsAtMaxWidth");
    a4->top = v35;
    a4->left = v36;
    a4->bottom = v37;
    a4->right = v38;
    -[CKBalloonChatItem balloonSizeAtMaxWidth](self, "balloonSizeAtMaxWidth");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isTextKit2Enabled");

    if ((v42 & 1) == 0 && !+[CKApplicationState isResizing](CKApplicationState, "isResizing"))
      objc_msgSend(v31, "layoutIfNeeded");
    objc_msgSend(v31, "sizeThatFits:textAlignmentInsets:", a4, width, height);
  }
  v17 = v39;
  v18 = v40;
LABEL_55:
  if (-[CKBalloonChatItem shouldCacheSize](self, "shouldCacheSize")
    && (v17 != *MEMORY[0x1E0C9D820] || v18 != *(double *)(MEMORY[0x1E0C9D820] + 8)))
  {
    if (a4)
    {
      v46 = *(_OWORD *)&a4->bottom;
      v57 = *(_OWORD *)&a4->top;
      v58 = v46;
    }
    else
    {
      v57 = v55;
      v58 = v54;
    }
    objc_msgSend(v8, "setCachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, v17, v18, v57, v58, width, height);
  }
  CKBalloonViewReuse(v31);
  if (v23)
    v47 = v21;
  else
    v47 = 0;
  if (v47 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D35780], "removeGUIDInAttemptingListInScrutinyMode:", v23);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v23;
        _os_log_impl(&dword_18DFCD000, v48, OS_LOG_TYPE_INFO, "Marked %@ as safe", buf, 0xCu);
      }

    }
  }

LABEL_71:
  v49 = v17;
  v50 = v18;
  result.height = v50;
  result.width = v49;
  return result;
}

- (void)unloadSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKBalloonChatItem;
  -[CKChatItem unloadSize](&v3, sel_unloadSize);
  self->_balloonSizeAtMaxWidth = (CGSize)*MEMORY[0x1E0C9D820];
}

- (id)loadTranscriptDrawerText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timestampDateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKBalloonChatItem time](self, "time");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "drawerTranscriptTextAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[CKBalloonChatItem time](self, "time");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        -[CKChatItem IMChatItem](self, "IMChatItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "guid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v11;
        v17 = 2112;
        v18 = v13;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "loadTranscriptDrawerText: nil timestamp for time: %@, IMChatItem guid: %@", (uint8_t *)&v15, 0x16u);

      }
    }
    v9 = 0;
  }

  return v9;
}

- (char)balloonOrientation
{
  return -[CKBalloonChatItem isFromMe](self, "isFromMe");
}

- (unint64_t)balloonCorners
{
  return -1;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isFromMe
{
  return 0;
}

- (BOOL)failed
{
  return 0;
}

- (NSDate)time
{
  return 0;
}

- (id)sender
{
  return 0;
}

- (BOOL)shouldCacheSize
{
  return 1;
}

- (BOOL)isBlackholed
{
  return 0;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  char v5;
  char v6;
  int v7;
  unint64_t v8;
  int64_t v9;
  void *v10;
  int64_t v11;
  CKBalloonDescriptor_t *result;
  id v13;

  v5 = -[CKBalloonChatItem balloonOrientation](self, "balloonOrientation");
  v6 = -[CKBalloonChatItem balloonShape](self, "balloonShape");
  if (-[CKChatItem hasTail](self, "hasTail"))
    v7 = -[CKBalloonChatItem tailShape](self, "tailShape");
  else
    v7 = 0;
  v8 = -[CKBalloonChatItem balloonCorners](self, "balloonCorners");
  -[CKChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v13, "userInterfaceStyle");
  -[CKChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CKBackgroundLevelForTraitCollection(v10);
  *(_OWORD *)&retstr->var6.red = CKColorZero;
  retstr->var0 = v6;
  retstr->var1 = v7;
  retstr->var2 = 0;
  retstr->var3 = v5;
  retstr->var4 = v8;
  retstr->var5 = -2;
  *(_OWORD *)&retstr->var6.blue = *(_OWORD *)&qword_18E7CB368;
  retstr->var7 = v9;
  retstr->var8 = v11;
  retstr->var9 = 0;
  retstr->var10 = v7 != 0;
  *(_WORD *)&retstr->var11 = 0;

  return result;
}

- (char)tailShape
{
  return 1;
}

- (char)balloonShape
{
  return 0;
}

- (BOOL)needsPreservedAspectRatio
{
  return -[objc_class isSubclassOfClass:](-[CKBalloonChatItem balloonViewClass](self, "balloonViewClass"), "isSubclassOfClass:", objc_opt_class());
}

- (BOOL)needsAdjustedTextAlignmentInsets
{
  return -[CKBalloonChatItem isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
}

- (BOOL)isMultilineText
{
  return self->_isMultilineText;
}

- (CGSize)balloonSizeAtMaxWidth
{
  double width;
  double height;
  CGSize result;

  width = self->_balloonSizeAtMaxWidth.width;
  height = self->_balloonSizeAtMaxWidth.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBalloonSizeAtMaxWidth:(CGSize)a3
{
  self->_balloonSizeAtMaxWidth = a3;
}

- (UIEdgeInsets)textAlignmentInsetsAtMaxWidth
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textAlignmentInsetsAtMaxWidth.top;
  left = self->_textAlignmentInsetsAtMaxWidth.left;
  bottom = self->_textAlignmentInsetsAtMaxWidth.bottom;
  right = self->_textAlignmentInsetsAtMaxWidth.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTextAlignmentInsetsAtMaxWidth:(UIEdgeInsets)a3
{
  self->_textAlignmentInsetsAtMaxWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
