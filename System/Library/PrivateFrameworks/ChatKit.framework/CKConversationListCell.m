@implementation CKConversationListCell

- (BOOL)shouldHideMuteIndicator
{
  return !-[CKConversationListCell isMuted](self, "isMuted")
      || -[CKConversationListCell shouldAppearAsRecoverableConversation](self, "shouldAppearAsRecoverableConversation");
}

- (BOOL)lastMessageIsTypingIndicator
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[CKConversationListCell conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isTypingMessage"))
    v5 = objc_msgSend(v4, "isFromMe") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (void)updateContentsForConversation:(id)a3 fastPreview:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(26);
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_DEBUG, "Updating contents of CKConversationListCell for conversation: %@", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v17 = v6;
    _CKLog();
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(26);
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_DEBUG, "  From: '%@'", buf, 0xCu);

    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    objc_msgSend(v6, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _CKLog();

  }
  -[CKConversationListCell setConversation:](self, "setConversation:", v6, v17);
  self->_placeholder = objc_msgSend(v6, "isPlaceholder");
  -[CKConversationListCell setMuted:](self, "setMuted:", objc_msgSend(v6, "isMuted"));
  -[CKConversationListCell setGroupConversation:](self, "setGroupConversation:", objc_msgSend(v6, "isGroupConversation"));
  -[CKConversationListCell updateUnreadIndicatorForCurrentConversation](self, "updateUnreadIndicatorForCurrentConversation");
  if (objc_msgSend(v6, "hasDisplayName"))
  {
    objc_msgSend(v6, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchSuggestedNameIfNecessary");
  }
  if (!v10 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "chat");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "guid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Setting conversation cell text to nil! Chat guid: %@", buf, 0xCu);

    }
  }
  -[CKConversationListCell updateFromLabelWithText:](self, "updateFromLabelWithText:", v10);
  -[CKConversationListCell updateDateLabel:conversation:](self, "updateDateLabel:conversation:", self->_dateLabel, v6);
  objc_msgSend(v6, "chat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v16 = objc_msgSend(v14, "allowedByScreenTime") ^ 1;
  else
    v16 = 0;
  -[CKConversationListCell setShouldHidePreviewSummary:](self, "setShouldHidePreviewSummary:", v16);
  -[CKConversationListCell updateSummaryLabel:conversation:fastPreview:](self, "updateSummaryLabel:conversation:fastPreview:", self->_summaryLabel, v6, v4);
  -[CKConversationListCell updateVerifiedCheckmarkForBusiness](self, "updateVerifiedCheckmarkForBusiness");
  -[CKConversationListCell setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)updateVerifiedCheckmarkForBusiness
{
  CKLabel *fromLabel;
  id v3;

  fromLabel = self->_fromLabel;
  -[CKConversationListCell conversation](self, "conversation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CKLabel setTitleIconImageType:](fromLabel, "setTitleIconImageType:", +[CKConversationListCell _titleIconImageTypeForConversation:](CKConversationListCell, "_titleIconImageTypeForConversation:", v3));

}

- (void)updateUnreadIndicatorForCurrentConversation
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  id v12;

  -[CKConversationListCell conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKConversationListCell conversation](self, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CKConversationListCell hasUnreadMessagesForConversation:](self, "hasUnreadMessagesForConversation:", v4);

    -[CKConversationListCell conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isMuted");

    if (v7)
      v8 = -[CKConversationListCell shouldHideMuteIndicator](self, "shouldHideMuteIndicator") ^ 1;
    else
      v8 = 0;
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCarrierPigeonEnabled");

    if (v10)
      v11 = -[CKConversationListCell _shouldShowSummaryForSatelliteMessages](self, "_shouldShowSummaryForSatelliteMessages");
    else
      v11 = 0;
    -[CKConversationListCell unreadIndicatorImageForVisibility:withMuteState:](self, "unreadIndicatorImageForVisibility:withMuteState:", v5 | v11, v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell updateUnreadIndicatorWithImage:](self, "updateUnreadIndicatorWithImage:", v12);

  }
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (id)unreadIndicatorImageForVisibility:(BOOL)a3 withMuteState:(BOOL)a4
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (a3)
  {
    if (-[CKConversationListCell shouldLabelsBeHighlighted](self, "shouldLabelsBeHighlighted", a3, a4)
      && (+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "shouldUnreadIndicatorChangeOnSelection"),
          v4,
          v5))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unreadIndicatorSelectedImage");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unreadIndicatorTintedImage");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)setShouldHidePreviewSummary:(BOOL)a3
{
  int v3;
  int shouldHidePreviewSummary;
  int v6;
  UILabel *summaryLabel;
  id v9;

  v3 = a3;
  shouldHidePreviewSummary = self->_shouldHidePreviewSummary;
  self->_shouldHidePreviewSummary = a3;
  v6 = objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled");
  if (shouldHidePreviewSummary != v3 && v6 != 0)
  {
    summaryLabel = self->_summaryLabel;
    -[CKConversationListCell conversation](self, "conversation");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell updateSummaryLabel:conversation:fastPreview:](self, "updateSummaryLabel:conversation:fastPreview:", summaryLabel, v9, 0);

  }
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (BOOL)hasUnreadMessagesForConversation:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v4 = a3;
  -[CKConversationListCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKConversationListCell delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasUnreadMessagesForConversation:", v4);

  }
  else
  {
    v8 = objc_msgSend(v4, "hasUnreadMessages");
  }

  return v8;
}

+ (int64_t)_titleIconImageTypeForConversation:(id)a3
{
  return objc_msgSend(a3, "shouldShowVerifiedCheckmark");
}

- (CKConversationListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKConversationListCell *v4;
  CKConversationListCell *v5;
  void *v6;
  void *v7;
  CKDateLabel *v8;
  CKDateLabel *dateLabel;
  CKDateLabel *v10;
  void *v11;
  void *v12;
  CKDateLabel *v13;
  void *v14;
  CKLabel *v15;
  CKLabel *fromLabel;
  CKLabel *v17;
  void *v18;
  CKLabel *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  CAGradientLayer *gradient;
  void *v26;
  uint64_t v27;
  UIButton *closeButton;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UILabel *v34;
  UILabel *summaryLabel;
  UILabel *v36;
  void *v37;
  UILabel *v38;
  void *v39;
  UILabel *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  uint64_t v48;
  UIImageView *chevronImageView;
  UIImageView *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v62;
  void *v63;
  objc_super v64;

  v64.receiver = self;
  v64.super_class = (Class)CKConversationListCell;
  v4 = -[CKConversationListCell initWithStyle:reuseIdentifier:](&v64, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKConversationListCell setAutoresizingMask:](v4, "setAutoresizingMask:", 2);
    -[CKConversationListCell setSeparatorStyle:](v5, "setSeparatorStyle:", 0);
    v5->__editingPins = 0;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "theme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(CKDateLabel);
    dateLabel = v5->_dateLabel;
    v5->_dateLabel = v8;

    -[CKDateLabel setOpaque:](v5->_dateLabel, "setOpaque:", 0);
    -[CKDateLabel setBackgroundColor:](v5->_dateLabel, "setBackgroundColor:", 0);
    v10 = v5->_dateLabel;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "conversationListDateFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDateLabel setFont:](v10, "setFont:", v12);

    v13 = v5->_dateLabel;
    objc_msgSend(v7, "conversationListDateColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDateLabel setTextColor:](v13, "setTextColor:", v14);

    v15 = objc_alloc_init(CKLabel);
    fromLabel = v5->_fromLabel;
    v5->_fromLabel = v15;

    -[CKLabel setOpaque:](v5->_fromLabel, "setOpaque:", 0);
    -[CKLabel setBackgroundColor:](v5->_fromLabel, "setBackgroundColor:", 0);
    v17 = v5->_fromLabel;
    v63 = v7;
    objc_msgSend(v7, "conversationListSenderColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLabel setTextColor:](v17, "setTextColor:", v18);

    v19 = v5->_fromLabel;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "conversationListSenderFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLabel setFont:](v19, "setFont:", v21);

    -[CKLabel setTextAlignment:](v5->_fromLabel, "setTextAlignment:", 4);
    -[CKLabel setLineBreakMode:](v5->_fromLabel, "setLineBreakMode:", 4);
    -[CKConversationListCell contentView](v5, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v5->_fromLabel);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = objc_msgSend(v23, "showsHoverToDeleteButton");

    if ((_DWORD)v20)
    {
      objc_msgSend(MEMORY[0x1E0CD2790], "layer");
      v24 = objc_claimAutoreleasedReturnValue();
      gradient = v5->_gradient;
      v5->_gradient = (CAGradientLayer *)v24;

      objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("SidebarCloseImage"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("SidebarCloseAlternate"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
      v27 = objc_claimAutoreleasedReturnValue();
      closeButton = v5->_closeButton;
      v5->_closeButton = (UIButton *)v27;

      -[UIButton setImage:forState:](v5->_closeButton, "setImage:forState:", v62, 0);
      -[UIButton setImage:forState:](v5->_closeButton, "setImage:forState:", v26, 1);
      -[UIButton addTarget:action:forEvents:](v5->_closeButton, "addTarget:action:forEvents:", v5, sel_deleteButtonTapped, 64);
      -[UIButton imageView](v5->_closeButton, "imageView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "theme");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "conversationListSummaryColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTintColor:", v32);

      -[CKConversationListCell contentView](v5, "contentView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addSubview:", v5->_closeButton);

      -[UIButton setHidden:](v5->_closeButton, "setHidden:", 1);
    }
    v34 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    summaryLabel = v5->_summaryLabel;
    v5->_summaryLabel = v34;

    -[UILabel setOpaque:](v5->_summaryLabel, "setOpaque:", 0);
    -[UILabel setBackgroundColor:](v5->_summaryLabel, "setBackgroundColor:", 0);
    v36 = v5->_summaryLabel;
    -[CKConversationListCell summaryLabelTextColor](v5, "summaryLabelTextColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v36, "setTextColor:", v37);

    v38 = v5->_summaryLabel;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setNumberOfLines:](v38, "setNumberOfLines:", objc_msgSend(v39, "conversationListCellSummaryNumberOfLines"));

    v40 = v5->_summaryLabel;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "conversationListSummaryFont");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v40, "setFont:", v42);

    -[UILabel _setTextAlignmentFollowsWritingDirection:](v5->_summaryLabel, "_setTextAlignmentFollowsWritingDirection:", 1);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v41) = objc_msgSend(v43, "showsConversationListCellChevronImage");

    if ((_DWORD)v41)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "chevronImage");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v45, "size");
      v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", 0.0, 0.0, v46, v47);
      chevronImageView = v5->_chevronImageView;
      v5->_chevronImageView = (UIImageView *)v48;

      -[UIImageView setContentMode:](v5->_chevronImageView, "setContentMode:", 4);
      v50 = v5->_chevronImageView;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "theme");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "conversationListChevronColor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v50, "setTintColor:", v53);

      -[UIImageView setImage:](v5->_chevronImageView, "setImage:", v45);
      -[CKConversationListCell contentView](v5, "contentView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "addSubview:", v5->_chevronImageView);

    }
    -[CKDateLabel setHighlightedTextColor:](v5->_dateLabel, "setHighlightedTextColor:", 0);
    -[CKLabel setHighlightedTextColor:](v5->_fromLabel, "setHighlightedTextColor:", 0);
    -[UILabel setHighlightedTextColor:](v5->_summaryLabel, "setHighlightedTextColor:", 0);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addObserver:selector:name:object:", v5, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addObserver:selector:name:object:", v5, sel__increaseContrastDidChange_, *MEMORY[0x1E0CEAFF0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addObserver:selector:name:object:", v5, sel__simLabelImageDidChange_, CFSTR("__kCKSIMLabelImagesChanged"), 0);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "isCarrierPigeonEnabled");

  if (v59)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addObserver:selector:name:object:", v5, sel__handleSatelliteStatusStateChanged, *MEMORY[0x1E0D35500], 0);

  }
  return v5;
}

- (CKDateLabel)dateLabel
{
  return self->_dateLabel;
}

- (UILabel)summaryLabel
{
  return self->_summaryLabel;
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (CKConversationListCellLayout)cellLayout
{
  return self->_cellLayout;
}

- (CKLabel)fromLabel
{
  return self->_fromLabel;
}

- (CKConversationListTypingIndicatorView)typingIndicatorView
{
  return self->_typingIndicatorView;
}

- (void)setEditingPins:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 editingPins;
  _BOOL8 v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD aBlock[5];
  BOOL v13;

  editingPins = self->__editingPins;
  self->__editingPins = a3;
  if (editingPins != a3)
  {
    v5 = a4;
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__CKConversationListCell_setEditingPins_animated___block_invoke;
    aBlock[3] = &unk_1E274CA88;
    aBlock[4] = self;
    v13 = a3;
    v8 = _Block_copy(aBlock);
    -[CKConversationListCell _performBlock:animated:](self, "_performBlock:animated:", v8, v5);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __50__CKConversationListCell_setEditingPins_animated___block_invoke_2;
    v11[3] = &unk_1E274A208;
    v11[4] = self;
    v9 = _Block_copy(v11);
    v10 = v9;
    if (v5)
      objc_msgSend(MEMORY[0x1E0CEABB0], "transitionWithView:duration:options:animations:completion:", self->_summaryLabel, 5242880, v9, 0, 0.300000012);
    else
      (*((void (**)(void *))v9 + 2))(v9);

  }
}

- (void)setCellLayout:(id)a3
{
  objc_storeStrong((id *)&self->_cellLayout, a3);
}

- (void)updateSummaryLabel:(id)a3 conversation:(id)a4 fastPreview:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  unint64_t v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint8_t buf[4];
  _BYTE v60[14];
  __int16 v61;
  _BOOL4 v62;
  uint64_t v63;

  v5 = a5;
  v63 = *MEMORY[0x1E0C80C00];
  v58 = a3;
  v8 = a4;
  -[CKConversationListCell delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CKConversationListCell delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateSummaryLabel:conversation:fastPreview:", v58, v8, v5);

    goto LABEL_43;
  }
  if (!-[CKConversationListCell freezeSummaryText](self, "freezeSummaryText")
    || (-[UILabel attributedText](self->_summaryLabel, "attributedText"),
        (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (v5)
      objc_msgSend(v8, "fastPreviewTextIgnoringPluginContent");
    else
      objc_msgSend(v8, "previewText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isCarrierPigeonEnabled");

  if (v14
    && -[CKConversationListCell _shouldShowSummaryForSatelliteMessages](self, "_shouldShowSummaryForSatelliteMessages"))
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NEW_SATELLITE_MESSAGE_COUNT"), &stru_1E276D870, CFSTR("ChatKit-CarrierPigeon"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell conversation](self, "conversation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "chat");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithFormat:", v17, objc_msgSend(v19, "pendingIncomingSatelliteMessageCount"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "userInterfaceLayoutDirection");

    if (v22 == 1)
      v23 = CFSTR("\u200F");
    else
      v23 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v24);
    -[CKConversationListCell updateUnreadIndicatorForCurrentConversation](self, "updateUnreadIndicatorForCurrentConversation");

    v12 = (void *)v25;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(26);
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v60 = objc_msgSend(v12, "length");
      _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_DEBUG, "  Summary Length: %ld", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v57 = objc_msgSend(v12, "length");
    _CKLog();
  }
  v27 = objc_msgSend(v12, "length", v57);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v27 > objc_msgSend(v28, "conversationListCellMaxSummaryLength");

  if (v29)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attributedSubstringFromRange:", 0, objc_msgSend(v30, "conversationListCellMaxSummaryLength"));
    v31 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v31;
  }
  if (objc_msgSend(MEMORY[0x1E0D39858], "messageSummarizationEnabled"))
  {
    objc_msgSend(v8, "chat");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "chatSummary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        -[CKConversationListCell conversation](self, "conversation");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "chat");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "guid");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v60 = v33 != 0;
        *(_WORD *)&v60[4] = 2112;
        *(_QWORD *)&v60[6] = v37;
        v61 = 1024;
        v62 = v33 == 0;
        _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, "Showing chat summary: (%d) for conversation with GUID %@, isNilChatSummary=%{BOOL}d", buf, 0x18u);

      }
      if (!v33)
        goto LABEL_29;
    }
    else if (!v33)
    {
      goto LABEL_29;
    }
    -[CKConversationListCell _updateSummaryLabelWithGeneratedSummary:](self, "_updateSummaryLabelWithGeneratedSummary:", v33);
    -[UILabel setAccessibilityIdentifier:](self->_summaryLabel, "setAccessibilityIdentifier:", CFSTR("previewWithSummary"));
    goto LABEL_40;
  }
LABEL_29:
  -[UILabel setAccessibilityIdentifier:](self->_summaryLabel, "setAccessibilityIdentifier:", 0);
  objc_msgSend(v8, "chat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v38, "chatStyle") != 43)
  {

    goto LABEL_33;
  }
  objc_msgSend(v8, "chat");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "conversation");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40 == 0;

  if (v41)
  {
LABEL_33:
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "conversationListSummaryFont");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationListCell summaryLabelTextColor](self, "summaryLabelTextColor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v47, "fontDescriptor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "fontDescriptorWithSymbolicTraits:", 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "fontWithDescriptor:size:", v51, 0.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[CKConversationListCell shouldLabelsBeHighlighted](self, "shouldLabelsBeHighlighted"))
    {
      v53 = v48;
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "theme");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "meMentionTextColor");
      v53 = (id)objc_claimAutoreleasedReturnValue();

    }
    +[CKMentionsUtilities attributedStringByHighlightingMentionsInAttributedString:withFont:textColor:mentionFont:mentionColor:](CKMentionsUtilities, "attributedStringByHighlightingMentionsInAttributedString:withFont:textColor:mentionFont:mentionColor:", v12, v47, v48, v52, v53);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_summaryLabel, "setAttributedText:", v56);

    goto LABEL_37;
  }
  objc_msgSend(v12, "string");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "conversation");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCell _makeSummaryAttributedStringWithText:multiwayConversation:](self, "_makeSummaryAttributedStringWithText:multiwayConversation:", v42, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setAttributedText:](self->_summaryLabel, "setAttributedText:", v45);
LABEL_37:
  v33 = 0;
LABEL_40:
  -[CKConversationListCell _prependSummaryLabelWithSIMForConversation:](self, "_prependSummaryLabelWithSIMForConversation:", v8);
  if (objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
  {
    -[UILabel setHidden:](self->_summaryLabel, "setHidden:", -[CKConversationListCell shouldHidePreviewSummary](self, "shouldHidePreviewSummary"));
    -[CKConversationListCell updateBlockedSummaryLabelIfNeeded](self, "updateBlockedSummaryLabelIfNeeded");
  }

LABEL_43:
}

- (BOOL)shouldHidePreviewSummary
{
  return self->_shouldHidePreviewSummary;
}

- (id)summaryLabelTextColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[CKConversationListCell summaryLabelTextBaseColor](self, "summaryLabelTextBaseColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKConversationListCell shouldLabelsBeHighlighted](self, "shouldLabelsBeHighlighted"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationListCellSelectedSummaryColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "theme");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "conversationListCellSelectedSummaryColor");
      v9 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v9;
    }
  }
  return v3;
}

- (BOOL)shouldLabelsBeHighlighted
{
  return self->_shouldLabelsBeHighlighted;
}

- (void)updateForEditing:(BOOL)a3
{
  _BOOL4 v4;
  double v5;

  v4 = -[CKConversationListCell showingEditControl](self, "showingEditControl", a3);
  v5 = 1.0;
  if (v4)
    v5 = 0.0;
  -[UIImageView setAlpha:](self->_chevronImageView, "setAlpha:", v5);
}

- (BOOL)showingEditControl
{
  return -[CKConversationListCell currentStateMask](self, "currentStateMask") & 1;
}

- (void)updateDateLabel:(id)a3 conversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CKConversationListCell delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CKConversationListCell delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateDateLabel:conversation:", v6, v7);

  }
  else
  {
    objc_msgSend(v7, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(26);
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v11;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_DEBUG, "  Date: %@", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      _CKLog();
    if (v11)
      -[CKDateLabel setDate:](self->_dateLabel, "setDate:", v11);

  }
}

- (BOOL)shouldAppearAsRecoverableConversation
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[CKConversationListCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[CKConversationListCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldAppearAsRecoverableConversation");

  return v6;
}

- (BOOL)shouldAlwaysHideUnreadIndicatorForConversation:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v4 = a3;
  -[CKConversationListCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKConversationListCell delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldAlwaysHideUnreadIndicatorForConversation:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CKConversationListCellDelegate)delegate
{
  return (CKConversationListCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)updateBlockedSummaryLabelIfNeeded
{
  UILabel *v3;
  UILabel *summaryBlockedLabel;
  void *v5;

  if (objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
  {
    if (-[CKConversationListCell shouldHidePreviewSummary](self, "shouldHidePreviewSummary")
      && !self->_summaryBlockedLabel)
    {
      v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
      summaryBlockedLabel = self->_summaryBlockedLabel;
      self->_summaryBlockedLabel = v3;

      -[UILabel setOpaque:](self->_summaryBlockedLabel, "setOpaque:", 0);
      -[UILabel setBackgroundColor:](self->_summaryBlockedLabel, "setBackgroundColor:", 0);
      -[UILabel setHighlightedTextColor:](self->_summaryBlockedLabel, "setHighlightedTextColor:", 0);
      -[UILabel _setTextAlignmentFollowsWritingDirection:](self->_summaryBlockedLabel, "_setTextAlignmentFollowsWritingDirection:", 1);
      -[CKConversationListCell contentView](self, "contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addSubview:", self->_summaryBlockedLabel);

    }
    if (self->_summaryBlockedLabel)
    {
      -[CKConversationListCell setNeedsLayout](self, "setNeedsLayout");
      -[CKConversationListCell layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  -[CKConversationListCell setNeedsLayout](self, "setNeedsLayout");
  v10.receiver = self;
  v10.super_class = (Class)CKConversationListCell;
  -[CKConversationListCell setEditing:animated:](&v10, sel_setEditing_animated_, v5, v4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__CKConversationListCell_setEditing_animated___block_invoke;
  v8[3] = &unk_1E274CA88;
  v8[4] = self;
  v9 = v5;
  v7 = _Block_copy(v8);
  -[CKConversationListCell _performBlock:animated:](self, "_performBlock:animated:", v7, v4);

}

uint64_t __46__CKConversationListCell_setEditing_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateForEditing:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)freezeSummaryText
{
  return self->_freezeSummaryText;
}

- (void)_prependSummaryLabelWithSIMForConversation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "wantsLabelForDSDS"))
  {
    -[UILabel attributedText](self->_summaryLabel, "attributedText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKDualSIMUtilities makeSummaryAttributedStringWithSIMImageUsingAttributedString:forConversation:](CKDualSIMUtilities, "makeSummaryAttributedStringWithSIMImageUsingAttributedString:forConversation:", v4, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setAttributedText:](self->_summaryLabel, "setAttributedText:", v5);
  }

}

- (void)_performBlock:(id)a3 animated:(BOOL)a4
{
  if (a4)
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", a3, 0.300000012);
  else
    (*((void (**)(id))a3 + 2))(a3);
}

- (UILabel)summaryBlockedLabel
{
  return self->_summaryBlockedLabel;
}

- (BOOL)_editingPins
{
  return self->__editingPins;
}

- (void)updateWithForwardedConfigurationState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;

  v4 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "useSelectedAppearanceForConversationCellState:traitCollection:", v4, v6);

  if (self->_shouldLabelsBeHighlighted == v7)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "stewieEnabled");

    if (v9)
    {
      -[CKConversation chat](self->_conversation, "chat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isStewieChat");

      if (self->_isStewie != v11)
      {
        self->_isStewie = v11;
        -[CKConversationListCell updateLabelTextColors](self, "updateLabelTextColors");
      }
    }
  }
  else
  {
    self->_shouldLabelsBeHighlighted = v7;
    -[CKConversationListCell updateLabelTextColors](self, "updateLabelTextColors");
    -[CKConversationListCell updateUnreadIndicatorForCurrentConversation](self, "updateUnreadIndicatorForCurrentConversation");
    -[CKConversationListCell _updateAccessoryIndicatorColor](self, "_updateAccessoryIndicatorColor");
  }
}

+ (double)cellHeightForDisplayScale:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationListSenderFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversationListSummaryFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomConversationListSpace");
  v11 = v10;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "conversationListSenderFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_scaledValueForValue:useLanguageAwareScaling:", 1, v11);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topConversationListSpace");
  UIRoundToScale();
  v16 = v15;

  objc_msgSend(v5, "capHeight");
  UIRoundToScale();
  v18 = v17;
  objc_msgSend(v7, "capHeight");
  UIRoundToScale();
  v20 = v19;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "senderSummaryConversationListSpace");
  UIRoundToScale();
  v23 = v22;

  objc_msgSend(v7, "_bodyLeading");
  UIRoundToScale();
  v25 = v24;
  UIRoundToScale();
  v27 = v20 + v16 + 0.0 + v18 + v23 + v25 + v26;

  return v27;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v5 = (void *)objc_opt_class();
  -[CKConversationListCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  objc_msgSend(v5, "cellHeightForDisplayScale:");
  v8 = v7;

  v9 = width;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)shouldAlwaysHideAvatar
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[CKConversationListCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[CKConversationListCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldAlwaysHideAvatar");

  return v6;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)updateLabelTextColors
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  UILabel *summaryLabel;
  void *v20;
  id v21;

  v3 = -[CKConversationListCell shouldLabelsBeHighlighted](self, "shouldLabelsBeHighlighted");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "conversationListCellSelectedDateColor");
  else
    objc_msgSend(v5, "conversationListDateColor");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  v7 = -[CKConversationListCell shouldLabelsBeHighlighted](self, "shouldLabelsBeHighlighted");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "conversationListCellSelectedTextColor");
  else
    objc_msgSend(v9, "conversationListSenderColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversation chat](self->_conversation, "chat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isStewieChat");

  if (v13)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "theme");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "conversationListEmergencyColor");
    v16 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v16;
  }
  if (v21)
  {
    -[CKDateLabel textColor](self->_dateLabel, "textColor");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17 != v21)
      -[CKDateLabel setTextColor:](self->_dateLabel, "setTextColor:", v21);
  }
  if (v11)
  {
    -[CKLabel textColor](self->_fromLabel, "textColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 != v11)
      -[CKLabel setTextColor:](self->_fromLabel, "setTextColor:", v11);
  }
  -[CKConversationListCell updateVerifiedCheckmarkForBusiness](self, "updateVerifiedCheckmarkForBusiness");
  summaryLabel = self->_summaryLabel;
  -[CKConversationListCell conversation](self, "conversation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCell updateSummaryLabel:conversation:fastPreview:](self, "updateSummaryLabel:conversation:fastPreview:", summaryLabel, v20, 0);

}

- (id)summaryLabelTextBaseColor
{
  void *v2;
  void *v3;
  void *v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversationListSummaryColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateAccessoryIndicatorColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryIndicatorTintColor");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (-[CKConversationListCell shouldLabelsBeHighlighted](self, "shouldLabelsBeHighlighted"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "theme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryIndicatorHighlightedTintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "theme");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accessoryIndicatorHighlightedTintColor");
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v10;
    }
  }
  -[CKConversationListCell updateAccessoryIndicatorsColorForTintColor:](self, "updateAccessoryIndicatorsColorForTintColor:", v11);

}

- (void)didHoverOverCell:(id)a3
{
  uint64_t v4;
  CAGradientLayer *gradient;
  void *v6;
  uint64_t v7;

  v4 = objc_msgSend(a3, "state");
  if (v4 == 3)
  {
    -[UILabel layer](self->_summaryLabel, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMask:", 0);
    v7 = 1;
  }
  else
  {
    if (v4 != 1)
      return;
    gradient = self->_gradient;
    -[UILabel layer](self->_summaryLabel, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMask:", gradient);
    v7 = 0;
  }

  -[UIButton setHidden:](self->_closeButton, "setHidden:", v7);
}

- (void)deleteButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CKConversationListCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCell conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedDeleteButtonForConversation:inCell:", v4, self);

  -[CKConversationListCell conversation](self, "conversation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unsentComposition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cleanupCKShareFromComposition");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListCell;
  -[CKConversationListCell dealloc](&v4, sel_dealloc);
}

- (CGRect)containerBounds
{
  CGRect *p_containerBounds;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double x;
  double y;
  double width;
  double height;
  CGRect result;
  CGRect v13;

  p_containerBounds = &self->_containerBounds;
  -[CKConversationListCell bounds](self, "bounds");
  v13.origin.x = v4;
  v13.origin.y = v5;
  v13.size.width = v6;
  v13.size.height = v7;
  if (!CGRectEqualToRect(*p_containerBounds, v13))
  {
    -[CKConversationListCell bounds](self, "bounds");
    -[CKConversationListCell setContainerBounds:](self, "setContainerBounds:");
  }
  x = p_containerBounds->origin.x;
  y = p_containerBounds->origin.y;
  width = p_containerBounds->size.width;
  height = p_containerBounds->size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContainerBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_containerBounds;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_containerBounds = &self->_containerBounds;
  if (!CGRectEqualToRect(self->_containerBounds, a3))
  {
    p_containerBounds->origin.x = x;
    p_containerBounds->origin.y = y;
    p_containerBounds->size.width = width;
    p_containerBounds->size.height = height;
    -[CKConversationListCell cellLayout](self, "cellLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKConversationListCell.m"), 328, CFSTR("%@ needs a cell layout."), v14);

    }
    -[CKConversationListCell cellLayout](self, "cellLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    -[CKConversationListCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CKAvatarView)avatarView
{
  return 0;
}

- (void)prepareForReuse
{
  objc_super v3;

  -[CKConversationListCell setConversation:](self, "setConversation:", 0);
  -[CKDateLabel setTextForOverride:](self->_dateLabel, "setTextForOverride:", 0);
  -[CKConversationListCell setShouldHidePreviewSummary:](self, "setShouldHidePreviewSummary:", 0);
  -[CKConversationListCell setEditingPins:animated:](self, "setEditingPins:animated:", 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)CKConversationListCell;
  -[CKConversationListCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)contentSizeCategoryDidChange
{
  CKDateLabel *dateLabel;
  void *v4;
  void *v5;
  CKLabel *fromLabel;
  void *v7;
  void *v8;
  UILabel *summaryLabel;
  void *v10;
  void *v11;
  UILabel *v12;
  id v13;

  dateLabel = self->_dateLabel;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationListDateFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDateLabel setFont:](dateLabel, "setFont:", v5);

  fromLabel = self->_fromLabel;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conversationListSenderFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLabel setFont:](fromLabel, "setFont:", v8);

  summaryLabel = self->_summaryLabel;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "conversationListSummaryFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](summaryLabel, "setFont:", v11);

  v12 = self->_summaryLabel;
  -[CKConversationListCell conversation](self, "conversation");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCell updateSummaryLabel:conversation:fastPreview:](self, "updateSummaryLabel:conversation:fastPreview:", v12, v13, 0);

}

- (void)simLabelImageDidChange
{
  void *v3;
  int v4;
  UILabel *summaryLabel;
  id v6;

  -[CKConversationListCell conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsLabelForDSDS");

  if (v4)
  {
    summaryLabel = self->_summaryLabel;
    -[CKConversationListCell conversation](self, "conversation");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell updateSummaryLabel:conversation:fastPreview:](self, "updateSummaryLabel:conversation:fastPreview:", summaryLabel, v6, 0);

  }
}

- (void)updateUnreadIndicatorWithImage:(id)a3
{
  if (!CKIsRunningUnitTests())
    -[CKConversationListCell updateUnreadIndicatorWithImage:].cold.1();
}

- (void)updateFromLabelWithText:(id)a3
{
  if (!CKIsRunningUnitTests())
    -[CKConversationListCell updateUnreadIndicatorWithImage:].cold.1();
}

- (void)updateContentsForConversation:(id)a3
{
  -[CKConversationListCell updateContentsForConversation:fastPreview:](self, "updateContentsForConversation:fastPreview:", a3, 0);
}

- (void)_updateSummaryLabelWithGeneratedSummary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CKConversationListCell *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  -[CKConversationListCell summaryLabelTextColor](self, "summaryLabelTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conversationListSummaryFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB590]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v10, "pointSize");
  objc_msgSend(v11, "systemFontOfSize:weight:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:scale:", v12, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:withConfiguration:", CFSTR("text.line.2.summary"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageWithRenderingMode:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v14);

  v33 = v9;
  if (v9)
  {
    v15 = (void *)MEMORY[0x1E0CB3498];
    v34 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v17 = v5;
    v18 = v12;
    v19 = v10;
    v20 = v8;
    v21 = self;
    v22 = v6;
    v23 = v4;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attributedStringWithAttachment:attributes:", v33, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v23;
    v6 = v22;
    self = v21;
    v8 = v20;
    v10 = v19;
    v12 = v18;
    v5 = v17;

    if (v25)
    {
      objc_msgSend(v17, "appendAttributedString:", v25);
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
      objc_msgSend(v5, "appendAttributedString:", v26);

    }
  }
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v4);
  objc_msgSend(v5, "appendAttributedString:", v27);

  objc_msgSend(v5, "string");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "rangeOfString:options:", v4, 1);
  v31 = v30;

  if (v29 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v6, v29, v31);
    objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v8, v29, v31);
  }
  -[UILabel setAttributedText:](self->_summaryLabel, "setAttributedText:", v5);
  -[CKConversationListCell setShouldHidePreviewSummary:](self, "setShouldHidePreviewSummary:", 0);

}

- (unint64_t)unreadMessageCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CKConversationListCell conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unreadMessageCount");

  return v4;
}

- (id)summaryAttributedTextForBlockedConversationWithIcon:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v35[2];

  v3 = a3;
  v35[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CONVERSATION_LIST_CELL_SUMMARY_TEXT_SCREENTIME"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v7, -[CKConversationListCell unreadMessageCount](self, "unreadMessageCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

    if (v10 == 1)
      v11 = CFSTR("\u200F");
    else
      v11 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "length");
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v12);
    -[UILabel font](self->_summaryLabel, "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fontDescriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fontDescriptorWithSymbolicTraits:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel font](self->_summaryLabel, "font");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pointSize");
    v20 = v19;

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v17, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v21, 0, v13);
    v22 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAttribute:value:range:", v22, v23, 0, v13);

    if (v3)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "screenTimeConversationListSummaryIcon");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = (void *)MEMORY[0x1E0CEA650];
      objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "configurationWithPaletteColors:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "imageWithSymbolConfiguration:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "insertAttributedString:atIndex:", v32, 0);
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
      objc_msgSend(v14, "insertAttributedString:atIndex:", v33, 1);

    }
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)_makeSummaryAttributedStringWithText:(id)a3 multiwayConversation:(id)a4
{
  id v5;
  id v6;
  id v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v46 = v5;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v8 = objc_msgSend(MEMORY[0x1E0D35818], "conversationIsVideoCall:", v6);
  v9 = objc_msgSend(MEMORY[0x1E0D35818], "conversationIsAVLessSharePlay:", v6);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "conversationListSharePlayIcon");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
      objc_msgSend(v10, "conversationListFacetimeVideoIcon");
    else
      objc_msgSend(v10, "conversationListFacetimeAudioIcon");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  v14 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemGreenColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configurationWithHierarchicalColor:", v15);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "imageWithSymbolConfiguration:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v42);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendAttributedString:", v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  +[CKTUConversationViewUtilities titleForAVMode:](CKTUConversationViewUtilities, "titleForAVMode:", objc_msgSend(v6, "avMode"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR(" %@"), v18);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc(MEMORY[0x1E0CB3498]);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "conversationCellSummaryBoldPreviewTextAttributes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v19, "initWithString:attributes:", v41, v21);

  objc_msgSend(v7, "appendAttributedString:", v22);
  objc_msgSend(v6, "activeRemoteParticipants");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  v25 = (void *)MEMORY[0x1E0CB3940];
  IMSharedUtilitiesFrameworkBundle();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("%lu People Active"), &stru_1E276D870, CFSTR("IMSharedUtilities"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringWithFormat:", v27, v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@\n"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc(MEMORY[0x1E0CB3498]);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "conversationCellSummaryPreviewTextAttributes");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v30, "initWithString:attributes:", v29, v32);

  objc_msgSend(v7, "appendAttributedString:", v33);
  v34 = objc_alloc(MEMORY[0x1E0CB3498]);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "conversationCellSummaryPreviewTextAttributes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v34, "initWithString:attributes:", v46, v36);

  objc_msgSend(v7, "appendAttributedString:", v37);
  v38 = *MEMORY[0x1E0DC1140];
  -[CKConversationListCell summaryLabelTextColor](self, "summaryLabelTextColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttribute:value:range:", v38, v39, 0, objc_msgSend(v7, "length"));

  return v7;
}

uint64_t __50__CKConversationListCell_setEditingPins_animated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "setAlpha:", v1);
}

void __50__CKConversationListCell_setEditingPins_animated___block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = v1[132];
  objc_msgSend(v1, "conversation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateSummaryLabel:conversation:fastPreview:", v2, v3, 0);

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKConversationListCell;
  -[CKConversationListCell setSelected:animated:](&v11, sel_setSelected_animated_, a3, a4);
  -[UIButton imageView](self->_closeButton, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "theme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
    objc_msgSend(v8, "conversationListCellSelectedSummaryColor");
  else
    objc_msgSend(v8, "conversationListSummaryColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v10);

}

- (void)_handleSatelliteStatusStateChanged
{
  UILabel *summaryLabel;
  id v4;

  summaryLabel = self->_summaryLabel;
  -[CKConversationListCell conversation](self, "conversation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCell updateSummaryLabel:conversation:fastPreview:](self, "updateSummaryLabel:conversation:fastPreview:", summaryLabel, v4, 0);

}

- (BOOL)_shouldShowSummaryForSatelliteMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CKConversationListCell conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKConversationListCell conversation](self, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "pendingIncomingSatelliteMessageCount")
      && (objc_msgSend(v5, "isDownloadingPendingSatelliteMessages") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = objc_msgSend(v6, "isSatelliteConnectionActive");

    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return (char)v3;
}

- (BOOL)_shouldShowSendLaterIcon
{
  void *v2;
  char v3;

  -[CKConversationListCell conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCancellableScheduledMessage");

  return v3;
}

- (void)setDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabel, a3);
}

- (void)setSummaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_summaryLabel, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (void)setChevronImageView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronImageView, a3);
}

- (void)setFromLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fromLabel, a3);
}

- (CAGradientLayer)gradient
{
  return self->_gradient;
}

- (void)setTypingIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_typingIndicatorView, a3);
}

- (CKDownloadingPendingMessagesView)downloadingPendingMessagesView
{
  return self->_downloadingPendingMessagesView;
}

- (void)setDownloadingPendingMessagesView:(id)a3
{
  objc_storeStrong((id *)&self->_downloadingPendingMessagesView, a3);
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (BOOL)isGroupConversation
{
  return self->_groupConversation;
}

- (void)setGroupConversation:(BOOL)a3
{
  self->_groupConversation = a3;
}

- (void)setShouldLabelsBeHighlighted:(BOOL)a3
{
  self->_shouldLabelsBeHighlighted = a3;
}

- (BOOL)isStewie
{
  return self->_isStewie;
}

- (void)setIsStewie:(BOOL)a3
{
  self->_isStewie = a3;
}

- (void)setFreezeSummaryText:(BOOL)a3
{
  self->_freezeSummaryText = a3;
}

- (void)set_editingPins:(BOOL)a3
{
  self->__editingPins = a3;
}

- (BOOL)_shouldShowSlashSatelliteIcon
{
  return self->__shouldShowSlashSatelliteIcon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_summaryBlockedLabel, 0);
  objc_storeStrong((id *)&self->_downloadingPendingMessagesView, 0);
  objc_storeStrong((id *)&self->_typingIndicatorView, 0);
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_fromLabel, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_cellLayout, 0);
}

- (id)makeTextAttachmentsForCurrentIndicatorState
{
  CKConversationListCell *v2;
  void *v3;

  v2 = self;
  CKConversationListCell.makeTextAttachmentsForCurrentIndicatorState()();

  sub_18E755F38();
  v3 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)identifierForConversation:(id)a3
{
  objc_opt_class();
  OUTLINED_FUNCTION_1_2();
  NSRequestConcreteImplementation();
  return 0;
}

- (uint64_t)updateUnreadIndicatorWithImage:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_1_2();
  return OUTLINED_FUNCTION_0_4();
}

@end
