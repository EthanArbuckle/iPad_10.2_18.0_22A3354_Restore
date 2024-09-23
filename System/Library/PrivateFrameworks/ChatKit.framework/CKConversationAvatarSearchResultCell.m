@implementation CKConversationAvatarSearchResultCell

+ (id)reuseIdentifier
{
  return CFSTR("ConversationSearchCell");
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationAvatarSearchResultCell setResultIdentifier:](self, "setResultIdentifier:", v9);

  objc_msgSend(v8, "conversation");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[CKConversationAvatarSearchResultCell setConversation:](self, "setConversation:", v10);
  -[CKConversationAvatarSearchResultCell _configureAvatarViewForConversation:](self, "_configureAvatarViewForConversation:", v10);
  -[CKConversationAvatarSearchResultCell _configureNameLabelForConversation:searchText:](self, "_configureNameLabelForConversation:searchText:", v10, v7);

}

- (void)refreshForSearchTextIfNeeded:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKConversationAvatarSearchResultCell conversation](self, "conversation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationAvatarSearchResultCell _configureNameLabelForConversation:searchText:](self, "_configureNameLabelForConversation:searchText:", v5, v4);

}

- (CKConversationAvatarSearchResultCell)initWithFrame:(CGRect)a3
{
  CKConversationAvatarSearchResultCell *v3;
  CKAvatarView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CKAvatarView *v9;
  void *v10;
  CKLabel *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKConversationAvatarSearchResultCell;
  v3 = -[CKConversationAvatarSearchResultCell initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [CKAvatarView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[CKAvatarView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    -[CNAvatarView setAsynchronousRendering:](v9, "setAsynchronousRendering:", 1);
    -[CNAvatarView setShowsContactOnTap:](v9, "setShowsContactOnTap:", 0);
    -[CNAvatarView setDelegate:](v9, "setDelegate:", v3);
    -[CNAvatarView setBypassActionValidation:](v9, "setBypassActionValidation:", 1);
    -[CKConversationAvatarSearchResultCell setAvatarView:](v3, "setAvatarView:", v9);
    -[CKConversationAvatarSearchResultCell contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v9);

    v11 = -[CKLabel initWithFrame:]([CKLabel alloc], "initWithFrame:", v5, v6, v7, v8);
    -[CKLabel setNumberOfLines:](v11, "setNumberOfLines:", 2);
    -[CKLabel setTextAlignment:](v11, "setTextAlignment:", 1);
    -[CKLabel setLineBreakMode:](v11, "setLineBreakMode:", 4);
    -[CKConversationAvatarSearchResultCell contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v11);

    -[CKConversationAvatarSearchResultCell setNameLabel:](v3, "setNameLabel:", v11);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double MaxY;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  objc_super v41;
  CGRect v42;

  v41.receiver = self;
  v41.super_class = (Class)CKConversationAvatarSearchResultCell;
  -[CKConversationAvatarSearchResultCell layoutSubviews](&v41, sel_layoutSubviews);
  -[CKConversationAvatarSearchResultCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = fmin(v7, 64.0);
  if (CKMainScreenScale_once_92 != -1)
    dispatch_once(&CKMainScreenScale_once_92, &__block_literal_global_224);
  v9 = *(double *)&CKMainScreenScale_sMainScreenScale_92;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_92 == 0.0)
    v9 = 1.0;
  v10 = v8 * v9;
  v11 = v5 * v9 + floor((v7 * v9 - v8 * v9) * 0.5);
  v12 = 1.0 / v9;
  v13 = v12 * v11;
  v14 = v10 * v12;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "searchConversationCellPadding");
  v17 = v16;

  -[CKConversationAvatarSearchResultCell avatarView](self, "avatarView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v13, v17, v14, v14);

  -[CKConversationAvatarSearchResultCell _adjustedContentWidth](self, "_adjustedContentWidth");
  v20 = v19;
  -[CKConversationAvatarSearchResultCell nameLabel](self, "nameLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sizeThatFits:", v20, 1.79769313e308);
  v23 = v22;
  v25 = v24;

  v42.origin.x = v13;
  v42.origin.y = v17;
  v42.size.width = v14;
  v42.size.height = v14;
  MaxY = CGRectGetMaxY(v42);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "searchConversationMinAvatarLabelSpacing");
  v29 = v28;

  if (CKMainScreenScale_once_92 != -1)
    dispatch_once(&CKMainScreenScale_once_92, &__block_literal_global_224);
  v30 = *(double *)&CKMainScreenScale_sMainScreenScale_92;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_92 == 0.0)
    v30 = 1.0;
  v31 = (MaxY + v29) * v30;
  v32 = v23 * v30;
  v33 = v25 * v30;
  v34 = v5 * v30 + floor((v7 * v30 - v23 * v30) * 0.5);
  v35 = 1.0 / v30;
  v36 = v35 * v34;
  v37 = v31 * v35;
  v38 = v32 * v35;
  v39 = v33 * v35;
  -[CKConversationAvatarSearchResultCell nameLabel](self, "nameLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v36, v37, v38, v39);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKConversationAvatarSearchResultCell;
  -[CKConversationAvatarSearchResultCell prepareForReuse](&v6, sel_prepareForReuse);
  -[CKConversationAvatarSearchResultCell setResultIdentifier:](self, "setResultIdentifier:", 0);
  -[CKConversationAvatarSearchResultCell setConversation:](self, "setConversation:", 0);
  -[CKConversationAvatarSearchResultCell avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContacts:", MEMORY[0x1E0C9AA60]);

  -[CKConversationAvatarSearchResultCell avatarView](self, "avatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", 0);

  -[CKConversationAvatarSearchResultCell nameLabel](self, "nameLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", 0);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;

  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  v7 = fmin(v5, 64.0);
  -[CKConversationAvatarSearchResultCell nameLabel](self, "nameLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationAvatarSearchResultCell _adjustedContentWidth](self, "_adjustedContentWidth");
  objc_msgSend(v8, "sizeThatFits:");
  v10 = v9;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchConversationMinAvatarLabelSpacing");
  v13 = v10 + v7 + v12;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "searchConversationCellPadding");
  v16 = v13 + v15 * 2.0;

  objc_msgSend(v4, "setSize:", v6, v16);
  return v4;
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  return 0;
}

- (void)_configureAvatarViewForConversation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars");
  objc_msgSend(v4, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", MEMORY[0x1E0C9AA60], v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNAvatarView updateViewWithGroupIdentity:](self->_avatarView, "updateViewWithGroupIdentity:", v6);
  if (objc_msgSend(v4, "hasDisplayName"))
    objc_msgSend(v4, "displayName");
  else
    objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationAvatarSearchResultCell avatarView](self, "avatarView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setName:", v8);

  v10 = objc_msgSend(v4, "recipientCount");
  -[CKConversationAvatarSearchResultCell avatarView](self, "avatarView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == 1)
  {
    v12 = *MEMORY[0x1E0C97420];
    v20[0] = *MEMORY[0x1E0C97418];
    v20[1] = v12;
    v13 = *MEMORY[0x1E0C97428];
    v20[2] = *MEMORY[0x1E0C97430];
    v20[3] = v13;
    v20[4] = *MEMORY[0x1E0C97410];
    v14 = (void *)MEMORY[0x1E0C99D20];
    v15 = v20;
    v16 = 5;
  }
  else
  {
    v19 = *MEMORY[0x1E0C97420];
    v14 = (void *)MEMORY[0x1E0C99D20];
    v15 = &v19;
    v16 = 1;
  }
  objc_msgSend(v14, "arrayWithObjects:count:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActionCategories:", v17);

  -[CKConversationAvatarSearchResultCell avatarView](self, "avatarView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setStyle:", objc_msgSend(v4, "shouldHaveRoundRectAvatar"));

  -[CKConversationAvatarSearchResultCell setNeedsLayout](self, "setNeedsLayout");
}

+ (int64_t)_titleIconImageTypeForConversation:(id)a3
{
  return objc_msgSend(a3, "shouldShowVerifiedCheckmark");
}

- (void)_configureNameLabelForConversation:(id)a3 searchText:(id)a4
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
  void *v16;
  id v17;
  void *v18;
  void *v20;
  id v21;

  v21 = a3;
  v17 = a4;
  if (objc_msgSend(v21, "hasDisplayName"))
    objc_msgSend(v21, "displayName");
  else
    objc_msgSend(v21, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "theme");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "conversationListSummaryColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchResultLabelFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conversationListSenderColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchResultLabelFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKSpotlightQueryUtilities annotatedResultStringWithSearchText:resultText:primaryTextColor:primaryFont:annotatedTextColor:annotatedFont:](CKSpotlightQueryUtilities, "annotatedResultStringWithSearchText:resultText:primaryTextColor:primaryFont:annotatedTextColor:annotatedFont:", v17, v20, v5, v7, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationAvatarSearchResultCell nameLabel](self, "nameLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAttributedText:", v13);

  -[CKConversationAvatarSearchResultCell nameLabel](self, "nameLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitleIconImageType:", +[CKConversationAvatarSearchResultCell _titleIconImageTypeForConversation:](CKConversationAvatarSearchResultCell, "_titleIconImageTypeForConversation:", v21));

  -[CKConversationAvatarSearchResultCell setNeedsLayout](self, "setNeedsLayout");
}

- (double)_adjustedContentWidth
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[CKConversationAvatarSearchResultCell contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchConversationCellPadding");
  v7 = v4 - v6;

  return v7;
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

- (BOOL)_ck_isEditing
{
  return self->_ck_editing;
}

- (void)_ck_setEditing:(BOOL)a3
{
  self->_ck_editing = a3;
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (void)setResultIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (CKLabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
}

@end
