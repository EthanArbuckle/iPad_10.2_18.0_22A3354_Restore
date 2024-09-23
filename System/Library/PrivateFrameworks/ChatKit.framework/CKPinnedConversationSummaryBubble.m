@implementation CKPinnedConversationSummaryBubble

- (CKPinnedConversationSummaryBubble)initWithSummaryBubbleActivityItem:(id)a3
{
  id v5;
  id v6;
  CKPinnedConversationSummaryBubble *v7;
  CKPinnedConversationSummaryBubble *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  v11.receiver = self;
  v11.super_class = (Class)CKPinnedConversationSummaryBubble;
  v7 = -[CKPinnedConversationTailedActivityItemView initWithActivityItem:contentView:needsContentViewStroke:](&v11, sel_initWithActivityItem_contentView_needsContentViewStroke_, v5, v6, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_summaryBubbleActivityItem, a3);
    objc_storeStrong((id *)&v8->_summaryLabel, v6);
    -[UILabel setTextAlignment:](v8->_summaryLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v8->_summaryLabel, "setNumberOfLines:", 2);
    -[CKPinnedConversationSummaryBubble _updateSummaryLabel](v8, "_updateSummaryLabel");
    -[CKPinnedConversationSummaryBubble addSubview:](v8, "addSubview:", v8->_summaryLabel);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v8;
}

- (NSAttributedString)summaryText
{
  void *v2;
  void *v3;

  -[CKPinnedConversationSummaryBubble summaryLabel](self, "summaryLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (double)pillCornerRadius
{
  void *v3;
  void *v4;
  void *v5;
  double result;

  -[CKPinnedConversationSummaryBubble contentViewPadding](self, "contentViewPadding");
  -[CKPinnedConversationSummaryBubble summaryLabel](self, "summaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfLines:", 1);

  -[CKPinnedConversationSummaryBubble summaryLabel](self, "summaryLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intrinsicContentSize");

  -[CKPinnedConversationSummaryBubble summaryLabel](self, "summaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 2);

  UIRoundToViewScale();
  return result;
}

- (void)setActivityItem:(id)a3
{
  id v5;
  objc_super v6;

  v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKPinnedConversationSummaryBubble;
  -[CKPinnedConversationTailedActivityItemView setActivityItem:](&v6, sel_setActivityItem_, v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)&self->_summaryBubbleActivityItem, a3);
    -[CKPinnedConversationSummaryBubble _updateSummaryLabel](self, "_updateSummaryLabel");
  }

}

- (void)_updateSummaryLabel
{
  CKPinnedConversationSummaryBubbleActivityItem *summaryBubbleActivityItem;
  int64_t v4;
  void *v5;
  void *v6;
  id v7;

  summaryBubbleActivityItem = self->_summaryBubbleActivityItem;
  v4 = -[CKPinnedConversationTailedActivityItemView activityItemViewContentScale](self, "activityItemViewContentScale");
  -[CKPinnedConversationSummaryBubble traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationSummaryBubbleActivityItem summaryAttributedStringForContentScale:userInterfaceStyle:](summaryBubbleActivityItem, "summaryAttributedStringForContentScale:userInterfaceStyle:", v4, objc_msgSend(v5, "userInterfaceStyle"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UILabel attributedText](self->_summaryLabel, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "isEqualToAttributedString:", v7);

  if ((v4 & 1) == 0)
  {
    -[UILabel setAttributedText:](self->_summaryLabel, "setAttributedText:", v7);
    -[CKPinnedConversationSummaryBubble setNeedsLayout](self, "setNeedsLayout");
  }

}

- (BOOL)supportsActivityItemViewContentScale
{
  return 1;
}

- (BOOL)supportsAlignmentWithOriginationSubAvatarFrame
{
  return 1;
}

- (void)setActivityItemViewContentScale:(int64_t)a3
{
  int64_t v5;
  objc_super v6;

  v5 = -[CKPinnedConversationTailedActivityItemView activityItemViewContentScale](self, "activityItemViewContentScale");
  v6.receiver = self;
  v6.super_class = (Class)CKPinnedConversationSummaryBubble;
  -[CKPinnedConversationTailedActivityItemView setActivityItemViewContentScale:](&v6, sel_setActivityItemViewContentScale_, a3);
  if (v5 != a3)
    -[CKPinnedConversationSummaryBubble _updateSummaryLabel](self, "_updateSummaryLabel");
}

- (id)summaryLabelFont
{
  return -[CKPinnedConversationSummaryBubbleActivityItem summaryLabelFontForContentScale:](self->_summaryBubbleActivityItem, "summaryLabelFontForContentScale:", -[CKPinnedConversationTailedActivityItemView activityItemViewContentScale](self, "activityItemViewContentScale"));
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  -[CKPinnedConversationSummaryBubble _updateSummaryLabel](self, "_updateSummaryLabel", a3);
  -[CKPinnedConversationSummaryBubble setNeedsLayout](self, "setNeedsLayout");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKPinnedConversationSummaryBubble;
  -[CKPinnedConversationTailedActivityItemView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CKPinnedConversationSummaryBubble _updateSummaryLabel](self, "_updateSummaryLabel");
}

- (id)_summaryLabelTextColor
{
  CKPinnedConversationSummaryBubbleActivityItem *summaryBubbleActivityItem;
  void *v3;
  void *v4;

  summaryBubbleActivityItem = self->_summaryBubbleActivityItem;
  -[CKPinnedConversationSummaryBubble traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationSummaryBubbleActivityItem summaryLabelTextColorForUserInterfaceStyle:](summaryBubbleActivityItem, "summaryLabelTextColorForUserInterfaceStyle:", objc_msgSend(v3, "userInterfaceStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)contentViewContentMode
{
  return 0;
}

- (UIEdgeInsets)contentViewPadding
{
  int64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = -[CKPinnedConversationTailedActivityItemView activityItemViewContentScale](self, "activityItemViewContentScale");
  v3 = 0.0;
  if (v2 == 1)
    v3 = 7.0;
  if (!v2)
    v3 = 5.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = v3;
  result.right = v5;
  result.bottom = v6;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CKPinnedConversationSummaryBubbleActivityItem)summaryBubbleActivityItem
{
  return self->_summaryBubbleActivityItem;
}

- (UILabel)summaryLabel
{
  return self->_summaryLabel;
}

- (void)setSummaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_summaryLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_summaryBubbleActivityItem, 0);
}

@end
