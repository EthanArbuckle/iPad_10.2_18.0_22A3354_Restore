@implementation CKConversationSearchResultEmbeddedCell

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;

  v32 = a4;
  v6 = a3;
  objc_msgSend(v6, "conversation");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCell setFreezeSummaryText:](self, "setFreezeSummaryText:", 0);
  -[CKConversationListStandardCell updateContentsForConversation:fastPreview:](self, "updateContentsForConversation:fastPreview:", v34, 0);
  -[CKConversationListCell setFreezeSummaryText:](self, "setFreezeSummaryText:", 1);
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v7;
  objc_msgSend(v7, "attributeSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "__ck_spotlightItemSnippet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "length");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "conversationListCellMaxSummaryLength");

  if (v10 > v12)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "substringWithRange:", 0, objc_msgSend(v13, "conversationListCellMaxSummaryLength"));
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v14;
  }
  v15 = CKIsRunningInMacCatalyst();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
    objc_msgSend(v16, "searchMessageBodyTextFont");
  else
    objc_msgSend(v16, "conversationListSummaryFont");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_opt_class();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "theme");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "conversationListSummaryColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "theme");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "conversationListSenderColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "annotatedResultStringWithSearchText:resultText:primaryTextColor:primaryFont:annotatedTextColor:annotatedFont:", v32, v9, v22, v18, v25, v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v26, "length"))
  {
    objc_msgSend(v34, "previewText");
    v27 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v27;
  }
  -[CKConversationListCell summaryLabel](self, "summaryLabel", v32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAttributedText:", v26);

  objc_msgSend(v33, "attributeSet");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "contentCreationDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    objc_msgSend(v34, "date");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CKConversationListCell dateLabel](self, "dateLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setDate:", v30);

}

+ (id)annotatedResultStringWithSearchText:(id)a3 resultText:(id)a4 primaryTextColor:(id)a5 primaryFont:(id)a6 annotatedTextColor:(id)a7 annotatedFont:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;
  void *v28;
  id v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (objc_msgSend(v14, "length"))
  {
    v29 = v15;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v14);
    v20 = objc_msgSend(v19, "length");
    v27 = v13;
    if (objc_msgSend(v13, "length"))
    {
      v21 = objc_msgSend(v14, "rangeOfString:options:", v13, 129);
      v23 = v22;
    }
    else
    {
      v21 = 0;
      v23 = 0;
    }
    v24 = *MEMORY[0x1E0DC1138];
    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v16, 0, v20, v27);
    v25 = *MEMORY[0x1E0DC1140];
    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v29, 0, v20);
    if (v23)
    {
      objc_msgSend(v19, "addAttribute:value:range:", v25, v17, v21, v23);
      objc_msgSend(v19, "addAttribute:value:range:", v24, v18, v21, v23);
    }
    v13 = v28;
    v15 = v29;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKConversationSearchResultEmbeddedCell;
  -[CKConversationListStandardCell layoutSubviews](&v9, sel_layoutSubviews);
  -[CKConversationSearchResultEmbeddedCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[CKConversationListStandardCell unreadIndicatorImageView](self, "unreadIndicatorImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[CKConversationListStandardCell indicatorContainerView](self, "indicatorContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[CKConversationListStandardCell avatarView](self, "avatarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAsynchronousRendering:", 1);

  -[CKConversationListStandardCell avatarView](self, "avatarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  -[CKConversationListStandardCell avatarView](self, "avatarView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowsContactOnTap:", 0);

  -[CKConversationListStandardCell avatarView](self, "avatarView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBypassActionValidation:", 1);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKConversationSearchResultEmbeddedCell;
  -[CKConversationListStandardCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CKConversationListCell summaryLabel](self, "summaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", 0);

}

- (double)leadingLayoutMargin
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  BOOL v11;
  void *v12;
  int v13;
  int v14;
  double v15;

  -[CKConversationSearchResultEmbeddedCell marginInsets](self, "marginInsets");
  v4 = v3;
  -[CKConversationSearchResultEmbeddedCell bounds](self, "bounds");
  v6 = v5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conversationListMinimumWidthForHiddenContactImage");
  v9 = v8;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "canShowContactPhotosInConversationList"))
    v11 = v6 <= v9;
  else
    v11 = 1;
  if (v11)
  {

  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "contactPhotosEnabled");

    if (v13)
    {
      v14 = -[CKConversationSearchResultEmbeddedCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      v15 = 2.0;
      if (v14)
        v15 = -2.0;
      return v4 + v15;
    }
  }
  return v4;
}

- (BOOL)lastMessageIsTypingIndicator
{
  return 0;
}

- (UIEdgeInsets)marginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_marginInsets.top;
  left = self->_marginInsets.left;
  bottom = self->_marginInsets.bottom;
  right = self->_marginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->_marginInsets = a3;
}

@end
