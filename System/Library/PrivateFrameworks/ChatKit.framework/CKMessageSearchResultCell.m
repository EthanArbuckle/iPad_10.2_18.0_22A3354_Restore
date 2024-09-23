@implementation CKMessageSearchResultCell

- (CKMessageSearchResultCell)initWithFrame:(CGRect)a3
{
  CKMessageSearchResultCell *v3;
  CKMessageSearchResultCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKMessageSearchResultCell;
  v3 = -[CKMessageSearchResultCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CKMessageSearchResultCell _internalInit](v3, "_internalInit");
  return v4;
}

- (void)_internalInit
{
  CKLabel *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CKLabel *conversationNameLabel;
  CKLabel *v10;
  CKLabel *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CKLabel *senderLabel;
  CKLabel *v18;
  CKDateLabel *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CKDateLabel *dateLabel;
  CKDateLabel *v25;
  CKTextBalloonView *v26;
  CKTextBalloonView *v27;
  void *v28;
  CKTextBalloonView *balloonView;
  CKTextBalloonView *v30;
  void *v31;
  double v32;
  double v33;
  UIImageView *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  UIImageView *chevronImageView;
  UIImageView *v40;
  UIView *v41;
  void *v42;
  void *v43;
  UIView *groupingSeparatorView;
  id v45;

  v3 = objc_alloc_init(CKLabel);
  -[CKLabel setAdjustsFontForContentSizeCategory:](v3, "setAdjustsFontForContentSizeCategory:", 1);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchMessagesDMConversationFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLabel setFont:](v3, "setFont:", v5);

  -[CKLabel setLineBreakMode:](v3, "setLineBreakMode:", 4);
  -[CKLabel setNumberOfLines:](v3, "setNumberOfLines:", 0);
  -[CKLabel setOpaque:](v3, "setOpaque:", 0);
  -[CKLabel setTextAlignment:](v3, "setTextAlignment:", 4);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchMessagesConversationLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLabel setTextColor:](v3, "setTextColor:", v7);

  -[CKMessageSearchResultCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v3);

  conversationNameLabel = self->_conversationNameLabel;
  self->_conversationNameLabel = v3;
  v10 = v3;

  v11 = objc_alloc_init(CKLabel);
  -[CKLabel setAdjustsFontForContentSizeCategory:](v11, "setAdjustsFontForContentSizeCategory:", 1);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "searchMessagesSenderFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLabel setFont:](v11, "setFont:", v13);

  -[CKLabel setLineBreakMode:](v11, "setLineBreakMode:", 4);
  -[CKLabel setNumberOfLines:](v11, "setNumberOfLines:", 0);
  -[CKLabel setOpaque:](v11, "setOpaque:", 0);
  -[CKLabel setTextAlignment:](v11, "setTextAlignment:", 4);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "searchMessagesSenderLabelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLabel setTextColor:](v11, "setTextColor:", v15);

  -[CKMessageSearchResultCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v11);

  senderLabel = self->_senderLabel;
  self->_senderLabel = v11;
  v18 = v11;

  v19 = objc_alloc_init(CKDateLabel);
  -[CKDateLabel setAdjustsFontForContentSizeCategory:](v19, "setAdjustsFontForContentSizeCategory:", 1);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "searchMessagesDateFont");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDateLabel setFont:](v19, "setFont:", v21);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDateLabel setTextColor:](v19, "setTextColor:", v22);

  -[CKDateLabel setNumberOfLines:](v19, "setNumberOfLines:", 0);
  -[CKDateLabel setOpaque:](v19, "setOpaque:", 0);
  -[CKMessageSearchResultCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v19);

  dateLabel = self->_dateLabel;
  self->_dateLabel = v19;
  v25 = v19;

  v26 = [CKTextBalloonView alloc];
  v27 = -[CKTextBalloonView initWithFrame:](v26, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CKTextBalloonView setUserInteractionEnabled:](v27, "setUserInteractionEnabled:", 0);
  -[CKColoredBalloonView setWantsGradient:](v27, "setWantsGradient:", 0);
  -[CKMessageSearchResultCell contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", v27);

  balloonView = self->_balloonView;
  self->_balloonView = v27;
  v30 = v27;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "chevronImage");
  v45 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "size");
  v34 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", 0.0, 0.0, v32, v33);
  -[UIImageView setContentMode:](v34, "setContentMode:", 4);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "theme");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "conversationListChevronColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](v34, "setTintColor:", v37);

  -[UIImageView setImage:](v34, "setImage:", v45);
  -[CKMessageSearchResultCell contentView](self, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addSubview:", v34);

  chevronImageView = self->_chevronImageView;
  self->_chevronImageView = v34;
  v40 = v34;

  v41 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v41, "setBackgroundColor:", v42);

  -[CKMessageSearchResultCell contentView](self, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addSubview:", v41);

  groupingSeparatorView = self->_groupingSeparatorView;
  self->_groupingSeparatorView = v41;

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CKMessageSearchResultCell;
  v4 = a3;
  -[CKMessageSearchResultCell traitCollectionDidChange:](&v23, sel_traitCollectionDidChange_, v4);
  -[CKMessageSearchResultCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  -[CKMessageSearchResultCell balloonView](self, "balloonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "balloonDescriptor");
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
  }

  *((_QWORD *)&v21 + 1) = v6;
  -[CKMessageSearchResultCell balloonView](self, "balloonView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v20;
  v17[3] = v21;
  v17[4] = v22;
  v17[0] = v18;
  v17[1] = v19;
  objc_msgSend(v9, "setBalloonDescriptor:", v17);

  -[CKMessageSearchResultCell balloonView](self, "balloonView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsPrepareForDisplay");

  -[CKMessageSearchResultCell balloonView](self, "balloonView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prepareForDisplay");

  v12 = objc_msgSend(v4, "userInterfaceStyle");
  if (v12 != v6)
  {
    -[CKMessageSearchResultCell _balloonFilterForUserInterfaceStyle:](self, "_balloonFilterForUserInterfaceStyle:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageSearchResultCell balloonView](self, "balloonView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCompositingFilter:", v14);

  }
  -[CKMessageSearchResultCell setNeedsLayout](self, "setNeedsLayout");
}

+ (id)reuseIdentifier
{
  return CFSTR("CKMessagesSearchResultCell");
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5 visibilityContext:(CKMessageSearchResultVisibilityContext *)a6
{
  id v10;
  id v11;
  void *v12;
  CKMessageSearchResultVisibilityContext v13;

  v10 = a4;
  v11 = a3;
  -[CKMessageSearchResultCell setIsFromMe:](self, "setIsFromMe:", objc_msgSend(v11, "isFromMe"));
  objc_msgSend(v11, "conversation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageSearchResultCell setIsFromGroupConversation:](self, "setIsFromGroupConversation:", objc_msgSend(v12, "isGroupConversation"));

  v13 = *a6;
  -[CKMessageSearchResultCell setVisibilityContext:](self, "setVisibilityContext:", &v13);
  -[CKMessageSearchResultCell configureWithQueryResult:searchText:mode:](self, "configureWithQueryResult:searchText:mode:", v11, v10, a5);

}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  id v7;
  id v8;

  v7 = a4;
  v8 = a3;
  -[CKMessageSearchResultCell _configureBalloonViewForResult:searchText:](self, "_configureBalloonViewForResult:searchText:", v8, v7);
  -[CKMessageSearchResultCell _configureAvatarForResult:](self, "_configureAvatarForResult:", v8);
  -[CKMessageSearchResultCell _configureSenderLabelForResult:searchText:](self, "_configureSenderLabelForResult:searchText:", v8, v7);

  -[CKMessageSearchResultCell _configureDateLabelForResult:](self, "_configureDateLabelForResult:", v8);
  -[CKMessageSearchResultCell _configureLabelFonts](self, "_configureLabelFonts");
}

- (void)_configureLabelFonts
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = -[CKMessageSearchResultCell isFromGroupConversation](self, "isFromGroupConversation");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "searchMessagesGroupConversationFont");
  else
    objc_msgSend(v4, "searchMessagesDMConversationFont");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[CKMessageSearchResultCell conversationNameLabel](self, "conversationNameLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v10);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchMessagesSenderFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageSearchResultCell senderLabel](self, "senderLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

}

- (void)_configureSenderLabelForResult:(id)a3 searchText:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (-[CKMessageSearchResultCell isFromMe](self, "isFromMe"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v16, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributeDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0CA6048]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v16, "conversation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasDisplayName"))
    objc_msgSend(v10, "displayName");
  else
    objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageSearchResultCell conversationNameLabel](self, "conversationNameLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  LODWORD(v12) = -[CKMessageSearchResultCell isFromGroupConversation](self, "isFromGroupConversation");
  -[CKMessageSearchResultCell senderLabel](self, "senderLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((_DWORD)v12)
    v15 = v5;
  else
    v15 = 0;
  objc_msgSend(v13, "setText:", v15);

}

- (void)_configureDateLabelForResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "item");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentCreationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageSearchResultCell dateLabel](self, "dateLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDate:", v5);

}

- (void)_configureBalloonViewForResult:(id)a3 searchText:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int16 v30;
  char v31;
  char v32;
  int v33;
  uint64_t v34;
  char v35;
  __int128 v36;
  _BYTE v37[23];
  uint64_t v38;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  _BYTE v43[39];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CKMessageSearchResultCell _annotatedResultStringForResult:searchText:](self, "_annotatedResultStringForResult:searchText:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "domainIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0;
  IMComponentsFromChatGUID();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0D35910], "serviceWithName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKMessageSearchResultCell isFromMe](self, "isFromMe"))
  {
    v12 = objc_msgSend(v11, "__ck_displayColor");
    v13 = 1;
  }
  else
  {
    v13 = 0;
    v12 = -1;
  }
  memset(v43, 0, sizeof(v43));
  -[CKMessageSearchResultCell traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceStyle");

  -[CKMessageSearchResultCell balloonView](self, "balloonView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = *(_OWORD *)v43;
  v30 = 256;
  v31 = 0;
  v32 = v13;
  v33 = 0;
  v34 = -1;
  v35 = v12;
  *(_OWORD *)v37 = *(_OWORD *)&v43[16];
  *(_QWORD *)&v37[15] = unk_18E7CB370;
  v38 = v15;
  v39 = 0;
  v40 = 256;
  v41 = 0;
  objc_msgSend(v16, "setBalloonDescriptor:", &v30);

  -[CKMessageSearchResultCell balloonView](self, "balloonView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAttributedText:", v7);

  -[CKMessageSearchResultCell balloonView](self, "balloonView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNeedsPrepareForDisplay");

  -[CKMessageSearchResultCell balloonView](self, "balloonView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "prepareForDisplay");

  if (-[CKMessageSearchResultCell isFromMe](self, "isFromMe"))
  {
    -[CKMessageSearchResultCell balloonView](self, "balloonView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCompositingFilter:", 0);

    -[CKMessageSearchResultCell contentView](self, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAllowsGroupBlending:", 1);
  }
  else
  {
    -[CKMessageSearchResultCell traitCollection](self, "traitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "userInterfaceStyle");

    -[CKMessageSearchResultCell _balloonFilterForUserInterfaceStyle:](self, "_balloonFilterForUserInterfaceStyle:", v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageSearchResultCell balloonView](self, "balloonView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCompositingFilter:", v23);

    -[CKMessageSearchResultCell contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAllowsGroupBlending:", 0);

  }
}

- (void)_configureAvatarForResult:(id)a3
{
  _BOOL4 v4;
  CKAvatarView *avatarView;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CKAvatarView *v14;
  CKAvatarView *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;

  v20 = a3;
  v4 = -[CKMessageSearchResultCell isFromMe](self, "isFromMe");
  avatarView = self->_avatarView;
  if (v4)
  {
    -[CKAvatarView removeFromSuperview](avatarView, "removeFromSuperview");
    v6 = self->_avatarView;
    self->_avatarView = 0;
  }
  else
  {
    if (!avatarView)
    {
      v7 = *MEMORY[0x1E0C9D538];
      v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "searchMessagesAvatarSize");
      v11 = v10;
      v13 = v12;

      v14 = -[CKAvatarView initWithFrame:]([CKAvatarView alloc], "initWithFrame:", v7, v8, v11, v13);
      v15 = self->_avatarView;
      self->_avatarView = v14;

      -[CNAvatarView setAsynchronousRendering:](self->_avatarView, "setAsynchronousRendering:", 1);
      -[CKAvatarView setUserInteractionEnabled:](self->_avatarView, "setUserInteractionEnabled:", 0);
      -[CNAvatarView setShowsContactOnTap:](self->_avatarView, "setShowsContactOnTap:", 0);
      -[CNAvatarView setDelegate:](self->_avatarView, "setDelegate:", 0);
      -[CNAvatarView setBypassActionValidation:](self->_avatarView, "setBypassActionValidation:", 1);
      -[CKMessageSearchResultCell contentView](self, "contentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSubview:", self->_avatarView);

      avatarView = self->_avatarView;
    }
    if (-[CNAvatarView isDisplayingContent](avatarView, "isDisplayingContent"))
      -[CNAvatarView setAllowStaleRendering:](self->_avatarView, "setAllowStaleRendering:", 1);
    objc_msgSend(v20, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isBusinessConversation"))
    {
      v17 = objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars");
      objc_msgSend(v6, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", MEMORY[0x1E0C9AA60], v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[CNAvatarView updateViewWithGroupIdentity:](self->_avatarView, "updateViewWithGroupIdentity:", v18);
    }
    else
    {
      +[CKSpotlightQueryResultUtilities contactForResult:](CKSpotlightQueryResultUtilities, "contactForResult:", v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAvatarView setContact:](self->_avatarView, "setContact:", v18);
    }

    -[CNAvatarView setStyle:](self->_avatarView, "setStyle:", objc_msgSend(v6, "shouldHaveRoundRectAvatar"));
    -[CKMessageSearchResultCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double MaxY;
  double v9;
  double v10;
  double v11;
  CGSize result;
  CGRect v13;

  -[CKMessageSearchResultCell layoutIfNeeded](self, "layoutIfNeeded", a3.width, a3.height);
  -[CKMessageSearchResultCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  -[CKMessageSearchResultCell balloonView](self, "balloonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  MaxY = CGRectGetMaxY(v13);
  -[CKMessageSearchResultCell visibilityContext](self, "visibilityContext");

  v9 = v6;
  v10 = MaxY + v11;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMessageSearchResultCell;
  -[CKEditableSearchResultCell layoutSubviews](&v3, sel_layoutSubviews);
  -[CKMessageSearchResultCell _layoutInternalSubviews](self, "_layoutInternalSubviews");
}

- (void)_layoutInternalSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  int v13;
  void *v14;
  char v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  int v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double MaxY;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  uint64_t v60;
  void *v61;
  double v62;
  void *v63;
  double v64;
  void *v65;
  double v66;
  uint64_t v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  void *v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  CGFloat v102;
  void *v103;
  double v104;
  double v105;
  _BOOL4 v106;
  double v107;
  void *v108;
  double MinX;
  void *v110;
  double v111;
  double MaxX;
  double v113;
  double v114;
  void *v115;
  double v116;
  double v117;
  void *v118;
  double v119;
  void *v120;
  void *v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  void *v127;
  double v128;
  void *v129;
  double v130;
  void *v131;
  double v132;
  void *v133;
  double v134;
  double v135;
  void *v136;
  CGFloat v137;
  void *v138;
  void *v139;
  double v140;
  double v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  char v152;
  char v153;
  char v154;
  char v155;
  char v156;
  uint64_t v157;
  _QWORD v158[4];
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;

  -[CKMessageSearchResultCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  -[CKMessageSearchResultCell marginInsets](self, "marginInsets");
  v7 = v6;
  -[CKMessageSearchResultCell marginInsets](self, "marginInsets");
  v9 = v8;
  -[CKMessageSearchResultCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;

  v13 = -[CKMessageSearchResultCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isAccessibilityPreferredContentSizeCategory");

  v149 = v12;
  v147 = v12 - v7;
  v16 = v12 - v7 - v9;
  -[CKMessageSearchResultCell dateLabel](self, "dateLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sizeThatFits:", v16, 1.79769313e308);
  v19 = v18;
  v21 = v20;

  -[CKMessageSearchResultCell dateLabel](self, "dateLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0.0;
  objc_msgSend(v22, "setFrame:", 0.0, 0.0, v19, v21);

  if ((v15 & 1) != 0 || v19 > v16 / 3.0)
  {
    v24 = 1;
  }
  else
  {
    v24 = 0;
    v23 = v19;
  }
  v25 = v16 - v23;
  -[CKMessageSearchResultCell conversationNameLabel](self, "conversationNameLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sizeThatFits:", v16 - v23, 1.79769313e308);
  v28 = v27;
  v30 = v29;

  -[CKMessageSearchResultCell conversationNameLabel](self, "conversationNameLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", 0.0, 0.0, v28, v30);

  -[CKMessageSearchResultCell senderLabel](self, "senderLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sizeThatFits:", v25, 1.79769313e308);
  v34 = v33;
  v36 = v35;

  -[CKMessageSearchResultCell senderLabel](self, "senderLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", 0.0, 0.0, v34, v36);

  -[CKMessageSearchResultCell visibilityContext](self, "visibilityContext");
  v38 = *(double *)&v158[2];
  -[CKMessageSearchResultCell visibilityContext](self, "visibilityContext");
  v158[0] = v157;
  -[CKMessageSearchResultCell visibilityContext](self, "visibilityContext");
  -[CKMessageSearchResultCell conversationNameLabel](self, "conversationNameLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v156)
  {
    objc_msgSend(v39, "setHidden:", 0);

    -[CKMessageSearchResultCell conversationNameLabel](self, "conversationNameLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "frame");
    v43 = v42;
    -[CKMessageSearchResultCell conversationNameLabel](self, "conversationNameLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "frame");
    v46 = v45;
    -[CKMessageSearchResultCell conversationNameLabel](self, "conversationNameLabel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setFrame:", v7, v38, v43, v46);

    -[CKMessageSearchResultCell conversationNameLabel](self, "conversationNameLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageSearchResultCell conversationNameLabel](self, "conversationNameLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageSearchResultCell _proposedBalloonY:afterLayoutForView:](self, "_proposedBalloonY:afterLayoutForView:", v158, v40);
  }
  else
  {
    objc_msgSend(v39, "setHidden:", 1);
    v48 = 0;
  }

  -[CKMessageSearchResultCell visibilityContext](self, "visibilityContext");
  if (v155)
  {
    -[CKMessageSearchResultCell visibilityContext](self, "visibilityContext");
    if (v154)
    {
      objc_msgSend(v48, "frame");
      MaxY = CGRectGetMaxY(v159);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "searchMessagesConversationToSenderSpacing");
      v38 = MaxY + v51;

    }
    -[CKMessageSearchResultCell senderLabel](self, "senderLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setHidden:", 0);

    -[CKMessageSearchResultCell senderLabel](self, "senderLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "frame");
    v55 = v54;
    -[CKMessageSearchResultCell senderLabel](self, "senderLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "frame");
    v58 = v57;
    -[CKMessageSearchResultCell senderLabel](self, "senderLabel");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setFrame:", v7, v38, v55, v58);

    -[CKMessageSearchResultCell senderLabel](self, "senderLabel");
    v60 = objc_claimAutoreleasedReturnValue();

    -[CKMessageSearchResultCell senderLabel](self, "senderLabel");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageSearchResultCell _proposedBalloonY:afterLayoutForView:](self, "_proposedBalloonY:afterLayoutForView:", v158, v61);
    v48 = (void *)v60;
  }
  else
  {
    -[CKMessageSearchResultCell senderLabel](self, "senderLabel");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setHidden:", 0);
  }

  -[CKMessageSearchResultCell visibilityContext](self, "visibilityContext");
  v151 = v7;
  v148 = v9;
  if (v153)
  {
    if (v24)
    {
      objc_msgSend(v48, "frame");
      v62 = CGRectGetMaxY(v160);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "searchMessagesConversationToSenderSpacing");
      v38 = v62 + v64;
    }
    else
    {
      -[CKMessageSearchResultCell dateLabel](self, "dateLabel");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "frame");
      v7 = v149 - v9 - v66;
    }

    -[CKMessageSearchResultCell dateLabel](self, "dateLabel");
    v67 = objc_claimAutoreleasedReturnValue();

    -[CKMessageSearchResultCell dateLabel](self, "dateLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setHidden:", 0);

    -[CKMessageSearchResultCell dateLabel](self, "dateLabel");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "frame");
    v71 = v70;
    -[CKMessageSearchResultCell dateLabel](self, "dateLabel");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "frame");
    v74 = v73;
    -[CKMessageSearchResultCell dateLabel](self, "dateLabel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setFrame:", v7, v38, v71, v74);

    -[CKMessageSearchResultCell dateLabel](self, "dateLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageSearchResultCell _proposedBalloonY:afterLayoutForView:](self, "_proposedBalloonY:afterLayoutForView:", v158, v65);
    v48 = (void *)v67;
  }
  else
  {
    -[CKMessageSearchResultCell dateLabel](self, "dateLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setHidden:", 1);
  }

  v76 = *(double *)v158;
  if (v48)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "searchMessagesSenderToBalloonSpacing");
    v76 = v76 + v78;

  }
  -[CKMessageSearchResultCell chevronImageView](self, "chevronImageView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "frame");
  v81 = v80;
  v83 = v82;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "searchMessagesHorizontalBalloonMargin");
  v86 = v16 - v81 - v85;

  -[CKMessageSearchResultCell balloonView](self, "balloonView");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "sizeThatFits:", v86, 1.79769313e308);
  v89 = v88;
  v91 = v90;

  v92 = round(v5 * v151) / v5;
  v93 = round(v5 * v76) / v5;
  v94 = round(v5 * v89) / v5;
  v95 = round(v5 * v91);
  v96 = v149 - v148;
  if (v13)
    v97 = v151;
  else
    v97 = v149 - v148 - v81;
  v98 = v95 / v5;
  v99 = v93;
  v100 = v94;
  v101 = v98;
  v146 = v83 * 0.5;
  v102 = CGRectGetMidY(*(CGRect *)&v92) - v83 * 0.5;
  -[CKMessageSearchResultCell chevronImageView](self, "chevronImageView");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v97;
  v104 = v97;
  v105 = v83;
  objc_msgSend(v103, "setFrame:", v104, v102, v81, v83);

  v106 = -[CKMessageSearchResultCell isFromMe](self, "isFromMe");
  if (v13)
  {
    if (v106)
    {
      v107 = v96 - v94;
LABEL_31:
      v117 = v151;
      goto LABEL_33;
    }
    -[CKMessageSearchResultCell chevronImageView](self, "chevronImageView");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "frame");
    MaxX = CGRectGetMaxX(v162);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "searchMessagesBalloonToChevronSpacing");
    v114 = MaxX + v113;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "searchMessagesAvatarSize");
    v107 = v114 + v116;

LABEL_30:
    goto LABEL_31;
  }
  if (v106)
  {
    -[CKMessageSearchResultCell chevronImageView](self, "chevronImageView");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "frame");
    MinX = CGRectGetMinX(v161);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "searchMessagesBalloonToChevronSpacing");
    v107 = MinX - v111 - v94;
    goto LABEL_30;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "searchMessagesAvatarSize");
  v117 = v151;
  v107 = v151 + v119;

LABEL_33:
  -[CKMessageSearchResultCell balloonView](self, "balloonView");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setFrame:", v107, v93, v94, v98);

  -[CKMessageSearchResultCell avatarView](self, "avatarView");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "frame");
  v123 = v122;
  v125 = v124;

  v126 = v117;
  if (v13)
  {
    -[CKMessageSearchResultCell chevronImageView](self, "chevronImageView");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "frame");
    v128 = CGRectGetMaxX(v163);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "searchMessagesBalloonToChevronSpacing");
    v126 = v128 + v130;

  }
  -[CKMessageSearchResultCell balloonView](self, "balloonView");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "frame");
  v132 = CGRectGetMaxY(v164);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "searchMessagesAvatarSize");
  v135 = v132 - v134;

  -[CKMessageSearchResultCell avatarView](self, "avatarView");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "setFrame:", v126, v135, v123, v125);

  if (v13 && !-[CKMessageSearchResultCell isFromMe](self, "isFromMe"))
  {
    v165.origin.x = v126;
    v165.origin.y = v135;
    v165.size.width = v123;
    v165.size.height = v125;
    v137 = CGRectGetMidY(v165) - v146;
    -[CKMessageSearchResultCell chevronImageView](self, "chevronImageView");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "setFrame:", v150, v137, v81, v105);

  }
  -[CKMessageSearchResultCell visibilityContext](self, "visibilityContext");
  if (v152)
  {
    -[CKMessageSearchResultCell traitCollection](self, "traitCollection");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "displayScale");
    v141 = 1.0 / v140;
    -[CKMessageSearchResultCell groupingSeparatorView](self, "groupingSeparatorView");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "setFrame:", v117, 0.0, v147, v141);

    -[CKMessageSearchResultCell groupingSeparatorView](self, "groupingSeparatorView");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = v143;
    v145 = 0;
  }
  else
  {
    -[CKMessageSearchResultCell groupingSeparatorView](self, "groupingSeparatorView");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = v143;
    v145 = 1;
  }
  objc_msgSend(v143, "setHidden:", v145);

}

- (void)_proposedBalloonY:(double *)a3 afterLayoutForView:(id)a4
{
  CGFloat MaxY;
  CGRect v6;

  objc_msgSend(a4, "frame");
  MaxY = CGRectGetMaxY(v6);
  if (*a3 >= MaxY)
    MaxY = *a3;
  *a3 = MaxY;
}

- (id)_annotatedResultStringForResult:(id)a3 searchText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "__ck_spotlightItemSnippet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "length");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "searchMessagesMaxSummaryLength");

  if (v11 > v13)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ck_trimmedStringWithPreferredLength:anchoredAroundSubstring:", objc_msgSend(v14, "searchMessagesMaxSummaryLength"), v7);
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v15;
  }
  if (objc_msgSend(v10, "length"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "searchMessagesBalloonFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[CKMessageSearchResultCell isFromMe](self, "isFromMe"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "searchMessagesFromMeUnannotatedLabelColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (-[CKMessageSearchResultCell isFromMe](self, "isFromMe"))
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKSpotlightQueryUtilities annotatedResultStringWithSearchText:resultText:primaryTextColor:primaryFont:annotatedTextColor:annotatedFont:](CKSpotlightQueryUtilities, "annotatedResultStringWithSearchText:resultText:primaryTextColor:primaryFont:annotatedTextColor:annotatedFont:", v7, v10, v19, v17, v22, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v24 = 138412290;
        v25 = v6;
        _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "Could not identify snippet for result: %@", (uint8_t *)&v24, 0xCu);
      }

    }
    v21 = 0;
  }

  return v21;
}

- (id)_balloonFilterForUserInterfaceStyle:(int64_t)a3
{
  id *v4;
  id v5;

  if (!UIAccessibilityIsReduceTransparencyEnabled() && !UIAccessibilityIsReduceMotionEnabled())
  {
    if (a3 == 1)
    {
      v4 = (id *)MEMORY[0x1E0CD2E98];
      goto LABEL_9;
    }
    if (a3 == 2)
    {
      v4 = (id *)MEMORY[0x1E0CD2EA0];
LABEL_9:
      v5 = *v4;
      return v5;
    }
  }
  v5 = 0;
  return v5;
}

- (void)prepareForReuse
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKMessageSearchResultCell;
  -[CKEditableSearchResultCell prepareForReuse](&v8, sel_prepareForReuse);
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[CKMessageSearchResultCell balloonView](self, "balloonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", v3, v4, v5, v6);

}

- (void)setHighlighted:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKMessageSearchResultCell;
  -[CKMessageSearchResultCell setHighlighted:](&v11, sel_setHighlighted_);
  +[CKBalloonSelectionState balloonSelectionState:](CKBalloonSelectionState, "balloonSelectionState:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEABB0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__CKMessageSearchResultCell_setHighlighted___block_invoke;
  v8[3] = &unk_1E274E150;
  v10 = a3;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performWithoutAnimation:", v8);

}

void __44__CKMessageSearchResultCell_setHighlighted___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "balloonView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelected:withSelectionState:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (UIEdgeInsets)marginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->marginInsets.top;
  left = self->marginInsets.left;
  bottom = self->marginInsets.bottom;
  right = self->marginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->marginInsets = a3;
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (void)setResultIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (BOOL)isFromGroupConversation
{
  return self->_isFromGroupConversation;
}

- (void)setIsFromGroupConversation:(BOOL)a3
{
  self->_isFromGroupConversation = a3;
}

- (CKMessageSearchResultVisibilityContext)visibilityContext
{
  *retstr = *(CKMessageSearchResultVisibilityContext *)((char *)self + 752);
  return self;
}

- (void)setVisibilityContext:(CKMessageSearchResultVisibilityContext *)a3
{
  double bottomSpacing;

  bottomSpacing = a3->bottomSpacing;
  *(_OWORD *)&self->_visibilityContext.isGroupedResult = *(_OWORD *)&a3->isGroupedResult;
  self->_visibilityContext.bottomSpacing = bottomSpacing;
}

- (CKLabel)conversationNameLabel
{
  return self->_conversationNameLabel;
}

- (void)setConversationNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_conversationNameLabel, a3);
}

- (CKLabel)senderLabel
{
  return self->_senderLabel;
}

- (void)setSenderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_senderLabel, a3);
}

- (CKDateLabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabel, a3);
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronImageView, a3);
}

- (CKTextBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_balloonView, a3);
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (UIView)groupingSeparatorView
{
  return self->_groupingSeparatorView;
}

- (void)setGroupingSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_groupingSeparatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingSeparatorView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_balloonView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_senderLabel, 0);
  objc_storeStrong((id *)&self->_conversationNameLabel, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
}

@end
