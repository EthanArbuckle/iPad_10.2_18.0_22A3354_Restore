@implementation CKConversationListCollectionViewConversationCell

- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CKConversationListCollectionViewConversationCell;
  -[CKConversationListEmbeddedCollectionViewCell setEditingMode:animated:](&v8, sel_setEditingMode_animated_);
  -[CKConversationListCollectionViewConversationCell embeddedConversationTableViewCell](self, "embeddedConversationTableViewCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEditingPins:animated:", a3 == 2, v4);

}

- (void)updateContentsForConversation:(id)a3 fastPreview:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[CKConversationListCollectionViewConversationCell embeddedConversationTableViewCell](self, "embeddedConversationTableViewCell");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateContentsForConversation:fastPreview:", v6, v4);

}

- (id)avatarView
{
  void *v2;
  void *v3;

  -[CKConversationListCollectionViewConversationCell embeddedConversationTableViewCell](self, "embeddedConversationTableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)widthForDeterminingAvatarVisibility
{
  void *v2;
  double v3;
  double v4;

  -[CKConversationListCollectionViewConversationCell delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widthForDeterminingAvatarVisibility");
  v4 = v3;

  return v4;
}

- (CKConversationListCollectionViewCellDelegate)delegate
{
  return (CKConversationListCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

+ (id)reuseIdentifier
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "conversationCellClassForCurrentSizeCategory"), "reuseIdentifier");
}

+ (Class)conversationCellClassForCurrentSizeCategory
{
  void *v2;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isAccessibilityPreferredContentSizeCategory");

  return (Class)(id)objc_opt_class();
}

- (_CKCollectionViewTapGestureRecognizer)avatarViewTapGestureRecognizer
{
  return self->_avatarViewTapGestureRecognizer;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setAvatarViewTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewTapGestureRecognizer, a3);
}

+ (Class)embeddedTableViewCellClass
{
  return +[CKConversationListCollectionViewConversationCell conversationCellClassForCurrentSizeCategory](CKConversationListCollectionViewConversationCell, "conversationCellClassForCurrentSizeCategory");
}

- (CKConversationListCollectionViewConversationCell)initWithFrame:(CGRect)a3
{
  CKConversationListCollectionViewConversationCell *v3;
  CKConversationListCollectionViewConversationCell *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKConversationListCollectionViewConversationCell;
  v3 = -[CKConversationListEmbeddedCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKConversationListCollectionViewConversationCell embeddedConversationTableViewCell](v3, "embeddedConversationTableViewCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", v4);

    -[CKConversationListCollectionViewConversationCell embeddedConversationTableViewCell](v4, "embeddedConversationTableViewCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewConversationCell bounds](v4, "bounds");
    objc_msgSend(v6, "setContainerBounds:");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "showsHoverToDeleteButton");

    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", v4, sel_didHoverOverCell_);
      -[CKConversationListCollectionViewConversationCell addGestureRecognizer:](v4, "addGestureRecognizer:", v9);

    }
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  -[CKConversationListCollectionViewConversationCell embeddedConversationTableViewCell](self, "embeddedConversationTableViewCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewConversationCell bounds](self, "bounds");
  objc_msgSend(v3, "setContainerBounds:");

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListCollectionViewConversationCell;
  -[CKConversationListCollectionViewConversationCell layoutSubviews](&v4, sel_layoutSubviews);
}

+ (id)identifierForConversation:(id)a3
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v3);
}

+ (double)cellHeightForDisplayScale:(double)a3
{
  double result;

  objc_msgSend((id)objc_msgSend(a1, "conversationCellClassForCurrentSizeCategory"), "cellHeightForDisplayScale:", a3);
  return result;
}

- (BOOL)shouldHidePreviewSummary
{
  void *v2;
  char v3;

  -[CKConversationListCollectionViewConversationCell embeddedConversationTableViewCell](self, "embeddedConversationTableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldHidePreviewSummary");

  return v3;
}

- (void)setShouldHidePreviewSummary:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKConversationListCollectionViewConversationCell embeddedConversationTableViewCell](self, "embeddedConversationTableViewCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldHidePreviewSummary:", v3);

}

- (void)updateContentsForConversation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKConversationListCollectionViewConversationCell embeddedConversationTableViewCell](self, "embeddedConversationTableViewCell");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateContentsForConversation:", v4);

}

- (BOOL)avatarView:(id)a3 shouldShowContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[CKConversationListCollectionViewConversationCell embeddedConversationTableViewCell](self, "embeddedConversationTableViewCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "avatarView:shouldShowContact:", v7, v6);

  return v9;
}

- (void)forceUnreadIndicatorVisibility:(BOOL)a3 forConversation:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  -[CKConversationListCollectionViewConversationCell embeddedConversationTableViewCell](self, "embeddedConversationTableViewCell");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "forceUnreadIndicatorVisibility:forConversation:animated:", v6, v8, v5);

}

- (void)avatarHeaderWasTappedForConversation:(id)a3 inCell:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[CKConversationListCollectionViewConversationCell delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avatarHeaderWasTappedForConversation:", v5);

}

- (void)selectedDeleteButtonForConversation:(id)a3 inCell:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[CKConversationListCollectionViewConversationCell delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedDeleteButtonForConversation:inCell:", v5, self);

}

- (void)didHoverOverCell:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKConversationListCollectionViewConversationCell embeddedConversationTableViewCell](self, "embeddedConversationTableViewCell");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didHoverOverCell:", v4);

}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  self->_marginInsets = a3;
  -[CKConversationListCollectionViewConversationCell embeddedConversationTableViewCell](self, "embeddedConversationTableViewCell");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMarginInsets:", top, left, bottom, right);

}

- (id)summaryLabelTextColor
{
  void *v2;
  void *v3;

  -[CKConversationListCollectionViewConversationCell embeddedConversationTableViewCell](self, "embeddedConversationTableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "summaryLabelTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dragStateDidChange:(int64_t)a3
{
  id WeakRetained;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKConversationListCollectionViewConversationCell;
  -[CKConversationListCollectionViewConversationCell dragStateDidChange:](&v6, sel_dragStateDidChange_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "listCellIsBeingDisplayedAsGhostedCellInPinnedSection:", self);

  if (v5)
    -[CKConversationListCollectionViewConversationCell setAlpha:](self, "setAlpha:", 0.0);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarViewTapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
