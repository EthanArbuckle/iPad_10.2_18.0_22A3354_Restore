@implementation CKPinnedConversationRichLinkBubble

- (CKPinnedConversationRichLinkBubble)initWithRichLinkActivityItem:(id)a3
{
  id v5;
  void *v6;
  CKPinnedConversationRichLinkBubble *v7;
  CKPinnedConversationRichLinkBubble *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  objc_msgSend(v5, "linkPreviewContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);
  v11.receiver = self;
  v11.super_class = (Class)CKPinnedConversationRichLinkBubble;
  v7 = -[CKPinnedConversationTailedActivityItemView initWithActivityItem:contentView:needsContentViewStroke:](&v11, sel_initWithActivityItem_contentView_needsContentViewStroke_, v5, v6, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_richLinkActivityItem, a3);
    objc_storeStrong((id *)&v8->_linkView, v6);
    -[CKPinnedConversationRichLinkBubble addSubview:](v8, "addSubview:", v8->_linkView);
    -[CKPinnedConversationRichLinkBubble _updatePillCornerRadius](v8, "_updatePillCornerRadius");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v8;
}

- (UIEdgeInsets)contentViewPadding
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

- (double)contentViewHorizontalInsetForPillCornerRadius
{
  return 4.0;
}

- (void)_updatePillCornerRadius
{
  void *v3;
  double v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB558], 0, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  UIRoundToViewScale();
  self->_pillCornerRadius = v4;

}

- (void)setActivityItem:(id)a3
{
  id v5;
  objc_super v6;

  v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKPinnedConversationRichLinkBubble;
  -[CKPinnedConversationTailedActivityItemView setActivityItem:](&v6, sel_setActivityItem_, v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)&self->_richLinkActivityItem, a3);
    -[CKPinnedConversationRichLinkBubble _updateLinkMetadata](self, "_updateLinkMetadata");
  }

}

- (BOOL)supportsActivityItemViewContentScale
{
  return 0;
}

- (BOOL)supportsAlignmentWithOriginationSubAvatarFrame
{
  return 1;
}

- (void)_updateLinkMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKPinnedConversationRichLinkBubble richLinkActivityItem](self, "richLinkActivityItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chatContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "richLinkDataSourceWithChatContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "richLinkMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkView setMetadata:](self->_linkView, "setMetadata:", v6);
  -[CKPinnedConversationRichLinkBubble setNeedsLayout](self, "setNeedsLayout");

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  -[CKPinnedConversationRichLinkBubble _updatePillCornerRadius](self, "_updatePillCornerRadius", a3);
  -[CKPinnedConversationRichLinkBubble setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)contentViewContentMode
{
  return 0;
}

- (void)linkViewNeedsResize:(id)a3
{
  id v4;

  -[CKPinnedConversationTailedActivityItemView activityItemViewDelegate](self, "activityItemViewDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "activityItemViewNeedsResize:", self);

}

- (double)pillCornerRadius
{
  return self->_pillCornerRadius;
}

- (int64_t)activityItemViewContentScale
{
  return self->_activityItemViewContentScale;
}

- (void)setActivityItemViewContentScale:(int64_t)a3
{
  self->_activityItemViewContentScale = a3;
}

- (CKPinnedConversationRichLinkActivityItem)richLinkActivityItem
{
  return self->_richLinkActivityItem;
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void)setLinkView:(id)a3
{
  objc_storeStrong((id *)&self->_linkView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_richLinkActivityItem, 0);
}

@end
