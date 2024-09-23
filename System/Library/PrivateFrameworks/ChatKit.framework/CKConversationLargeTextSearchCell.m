@implementation CKConversationLargeTextSearchCell

- (id)avatarView
{
  return 0;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKConversationLargeTextSearchCell;
  -[CKConversationLargeTextSearchCell layoutSubviews](&v3, sel_layoutSubviews);
  -[CKConversationLargeTextSearchCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
}

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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;

  v31 = a4;
  v6 = a3;
  objc_msgSend(v6, "conversation");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCell setFreezeSummaryText:](self, "setFreezeSummaryText:", 0);
  -[CKConversationListLargeTextCell updateContentsForConversation:fastPreview:](self, "updateContentsForConversation:fastPreview:", v33, 0);
  -[CKConversationListCell setFreezeSummaryText:](self, "setFreezeSummaryText:", 1);
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v7;
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
  objc_msgSend(v19, "annotatedResultStringWithSearchText:resultText:primaryTextColor:primaryFont:annotatedTextColor:annotatedFont:", v31, v9, v22, v18, v25, v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCell summaryLabel](self, "summaryLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAttributedText:", v26);

  objc_msgSend(v32, "attributeSet");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "contentCreationDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCell dateLabel](self, "dateLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setDate:", v29);

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

@end
