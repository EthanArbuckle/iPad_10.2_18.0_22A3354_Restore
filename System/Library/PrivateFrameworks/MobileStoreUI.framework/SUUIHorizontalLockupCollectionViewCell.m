@implementation SUUIHorizontalLockupCollectionViewCell

- (SUUIHorizontalLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIHorizontalLockupCollectionViewCell *v3;
  SUUIHorizontalLockupView *v4;
  uint64_t v5;
  SUUIHorizontalLockupView *lockupView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIHorizontalLockupCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [SUUIHorizontalLockupView alloc];
    -[SUUIHorizontalLockupCollectionViewCell bounds](v3, "bounds");
    v5 = -[SUUIHorizontalLockupView initWithFrame:](v4, "initWithFrame:");
    lockupView = v3->_lockupView;
    v3->_lockupView = (SUUIHorizontalLockupView *)v5;

    -[SUUIHorizontalLockupCollectionViewCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_lockupView);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[UIButton removeTarget:action:forControlEvents:](self->_actionButton, "removeTarget:action:forControlEvents:", self, 0, 4095);
  -[SUUICellScrollView setDelegate:](self->_actionsScrollView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIHorizontalLockupCollectionViewCell;
  -[SUUIHorizontalLockupCollectionViewCell dealloc](&v3, sel_dealloc);
}

- (void)hideDeleteButton
{
  -[SUUICellScrollView setContentOffset:animated:](self->_actionsScrollView, "setContentOffset:animated:", 1, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

- (BOOL)isDeleteButtonHidden
{
  SUUICellScrollView *actionsScrollView;
  double v3;
  BOOL result;

  actionsScrollView = self->_actionsScrollView;
  result = 1;
  if (actionsScrollView)
  {
    -[SUUICellScrollView contentOffset](actionsScrollView, "contentOffset");
    if (v3 > 0.0)
      return 0;
  }
  return result;
}

- (BOOL)isScrollingCellToHideActionButton
{
  SUUICellScrollView *actionsScrollView;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL result;

  actionsScrollView = self->_actionsScrollView;
  result = 0;
  if (actionsScrollView)
  {
    -[SUUICellScrollView contentOffset](actionsScrollView, "contentOffset");
    if (v4 != 0.0)
    {
      -[SUUICellScrollView contentOffset](self->_actionsScrollView, "contentOffset");
      v6 = v5;
      -[UIButton frame](self->_actionButton, "frame");
      if (v6 < v7)
        return 1;
    }
  }
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    -[SUUIHorizontalLockupCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if ((((self->_editModeControl == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      -[SUUIHorizontalLockupCollectionViewCell _addEditControlAnimated:](self, "_addEditControlAnimated:", a4);
    else
      -[SUUIHorizontalLockupCollectionViewCell _removeEditControlAnimated:](self, "_removeEditControlAnimated:", a4);
    -[SUUICellScrollView setContentOffset:animated:](self->_actionsScrollView, "setContentOffset:animated:", 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    -[SUUICellScrollView setScrollEnabled:](self->_actionsScrollView, "setScrollEnabled:", -[SUUIHorizontalLockupCollectionViewCell _isActionsScrollViewEnabled](self, "_isActionsScrollViewEnabled"));
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *lockupViewBackgroundColor;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "backgroundColor");
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  lockupViewBackgroundColor = self->_lockupViewBackgroundColor;
  self->_lockupViewBackgroundColor = v5;

  if (self->_lockupViewBackgroundColor)
    -[SUUIHorizontalLockupView setBackgroundColor:](self->_lockupView, "setBackgroundColor:");
  v7.receiver = self;
  v7.super_class = (Class)SUUIHorizontalLockupCollectionViewCell;
  -[SUUICollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v4);

}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  double result;

  +[SUUIHorizontalLockupView maximumPerspectiveHeightForSize:](SUUIHorizontalLockupView, "maximumPerspectiveHeightForSize:", a3.width, a3.height);
  return result;
}

- (void)setPerspectiveTargetView:(id)a3
{
  SUUIHorizontalLockupView *lockupView;
  id v4;

  lockupView = self->_lockupView;
  v4 = a3;
  -[SUUIHorizontalLockupView setPerspectiveTargetView:](lockupView, "setPerspectiveTargetView:", v4);

}

- (void)setVanishingPoint:(CGPoint)a3
{
  -[SUUIHorizontalLockupView setVanishingPoint:](self->_lockupView, "setVanishingPoint:", a3.x, a3.y);
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  -[SUUIHorizontalLockupView updateForChangedDistanceFromVanishingPoint](self->_lockupView, "updateForChangedDistanceFromVanishingPoint");
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIHorizontalLockupView prefetchResourcesForViewElement:reason:context:](SUUIHorizontalLockupView, "prefetchResourcesForViewElement:reason:context:", a3, a4, a5);
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  +[SUUIHorizontalLockupView requestLayoutForViewElement:width:context:](SUUIHorizontalLockupView, "requestLayoutForViewElement:width:context:", a3, a5, a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[SUUIHorizontalLockupView sizeThatFitsWidth:viewElement:context:](SUUIHorizontalLockupView, "sizeThatFitsWidth:viewElement:context:", a4, a5, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  void *v9;
  int v10;
  SUUICheckboxInputViewElement *v11;
  SUUICheckboxInputViewElement *editModeCheckboxElement;
  _BOOL8 v13;
  UIImageView *editModeControl;
  void *v15;
  void *v16;
  UIColor *v17;
  UIColor *lockupViewBackgroundColor;
  id v19;

  v19 = a3;
  v8 = a5;
  -[SUUIHorizontalLockupCollectionViewCell _reloadActionsScrollViewWithViewElement:context:](self, "_reloadActionsScrollViewWithViewElement:context:", v19, v8);
  objc_msgSend(v8, "aggregateValueForKey:", CFSTR("SUUIHorizontalLockupShowsEditModeKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v19, "firstChildForElementType:", 18);
  v11 = (SUUICheckboxInputViewElement *)objc_claimAutoreleasedReturnValue();
  editModeCheckboxElement = self->_editModeCheckboxElement;
  self->_editModeCheckboxElement = v11;

  if (v10)
    v13 = self->_editModeCheckboxElement != 0;
  else
    v13 = 0;
  -[SUUIHorizontalLockupCollectionViewCell setEditing:animated:](self, "setEditing:animated:", v13, 0);
  editModeControl = self->_editModeControl;
  if (editModeControl)
  {
    -[SUUIHorizontalLockupCollectionViewCell _editControlImage](self, "_editControlImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](editModeControl, "setImage:", v15);

  }
  -[SUUICellScrollView setContentOffset:animated:](self->_actionsScrollView, "setContentOffset:animated:", 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[SUUICellScrollView setScrollEnabled:](self->_actionsScrollView, "setScrollEnabled:", -[SUUIHorizontalLockupCollectionViewCell _isActionsScrollViewEnabled](self, "_isActionsScrollViewEnabled"));
  -[SUUIHorizontalLockupView reloadWithViewElement:width:context:](self->_lockupView, "reloadWithViewElement:width:context:", v19, v8, a4);
  if (!self->_lockupViewBackgroundColor)
  {
    -[SUUIHorizontalLockupView preferredBackgroundColor](self->_lockupView, "preferredBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[SUUIHorizontalLockupView preferredBackgroundColor](self->_lockupView, "preferredBackgroundColor");
      v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
      lockupViewBackgroundColor = self->_lockupViewBackgroundColor;
      self->_lockupViewBackgroundColor = v17;

    }
  }

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SUUIHorizontalLockupView setImage:forArtworkRequest:context:](self->_lockupView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SUUIHorizontalLockupView updateWithItemState:context:animated:](self->_lockupView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SUUIHorizontalLockupView viewForElementIdentifier:](self->_lockupView, "viewForElementIdentifier:", a3);
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIHorizontalLockupCollectionViewCell;
  -[SUUICollectionViewCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  if (!self->_editModeControl)
    -[SUUIHorizontalLockupCollectionViewCell _reloadHighlightBackgroundView](self, "_reloadHighlightBackgroundView");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIHorizontalLockupCollectionViewCell;
  -[SUUICollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  if (!self->_editModeControl)
    -[SUUIHorizontalLockupCollectionViewCell _reloadHighlightBackgroundView](self, "_reloadHighlightBackgroundView");
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
  UIImageView *editModeControl;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  float v18;
  CGFloat v19;
  SUUICellScrollView *actionsScrollView;
  double v21;
  CGFloat v22;
  CGFloat MaxX;
  CGFloat v24;
  double v25;
  UIButton *actionButton;
  double v27;
  CGFloat v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  v29.receiver = self;
  v29.super_class = (Class)SUUIHorizontalLockupCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v29, sel_layoutSubviews);
  -[SUUIHorizontalLockupCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  editModeControl = self->_editModeControl;
  v28 = v5;
  if (editModeControl)
  {
    -[UIImageView frame](editModeControl, "frame");
    v14 = v13;
    v16 = v15;
    v17 = v5 + 15.0;
    v18 = v7 + (v11 - v15) * 0.5;
    v19 = floorf(v18);
    -[UIImageView setFrame:](self->_editModeControl, "setFrame:", v17, v19);
    v30.origin.x = v17;
    v30.origin.y = v19;
    v30.size.width = v14;
    v30.size.height = v16;
    v5 = CGRectGetMaxX(v30) + 15.0 - self->_contentInset.left;
  }
  -[SUUIHorizontalLockupView setContentInset:](self->_lockupView, "setContentInset:", self->_contentInset.top, self->_contentInset.left, self->_contentInset.bottom, self->_contentInset.right);
  actionsScrollView = self->_actionsScrollView;
  if (actionsScrollView)
  {
    -[SUUICellScrollView setFrame:](actionsScrollView, "setFrame:", v5, v7, v9, v11);
    -[SUUIHorizontalLockupView setFrame:](self->_lockupView, "setFrame:", 0.0, v7, v9, v11);
    -[UIButton frame](self->_actionButton, "frame");
    v22 = v21;
    v31.origin.x = 0.0;
    v31.origin.y = v7;
    v31.size.width = v9;
    v31.size.height = v11;
    MaxX = CGRectGetMaxX(v31);
    -[UIButton sizeThatFits:](self->_actionButton, "sizeThatFits:", 1.79769313e308, v11);
    v25 = v24;
    -[UIButton setFrame:](self->_actionButton, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(MaxX, v22, v24, v11, v28, v7, v9, v11));
    actionButton = self->_actionButton;
    -[SUUICellScrollView contentOffset](self->_actionsScrollView, "contentOffset");
    -[UIButton setHidden:](actionButton, "setHidden:", v27 < 0.00000011920929);
    -[SUUICellScrollView setContentSize:](self->_actionsScrollView, "setContentSize:", v9 + v25, v11);
  }
  else
  {
    -[SUUIHorizontalLockupView setFrame:](self->_lockupView, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v5, v7, v9, v11, v28, v7, v9, v11));
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIHorizontalLockupCollectionViewCell;
  -[SUUIHorizontalLockupCollectionViewCell setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  -[SUUIHorizontalLockupView setSemanticContentAttribute:](self->_lockupView, "setSemanticContentAttribute:", a3);
  -[SUUICellScrollView setSemanticContentAttribute:](self->_actionsScrollView, "setSemanticContentAttribute:", a3);
  -[UIButton setSemanticContentAttribute:](self->_actionButton, "setSemanticContentAttribute:", a3);
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIHorizontalLockupCollectionViewCell;
  -[SUUICollectionViewCell setBackgroundColor:](&v4, sel_setBackgroundColor_, a3);
  -[SUUIHorizontalLockupCollectionViewCell _reloadLockupViewBackgroundColor](self, "_reloadLockupViewBackgroundColor");
}

- (void)_actionButtonAction:(id)a3
{
  -[SUUIButtonViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_actionButtonViewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v4 = a3;
  SUUICollectionViewForView(self);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  v7 = v6;

  if (v7 == 0.0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "indexPathForCell:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionView:didEndEditingItemAtIndexPath:", v9, v8);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double MaxX;
  double v17;
  void *v18;
  id v19;
  CGRect v20;

  v19 = a3;
  objc_msgSend(v19, "contentOffset");
  v5 = v4;
  SUUICollectionViewForView(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 <= 0.0
    || (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v6, "indexPathForCell:", self),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "collectionView:canScrollCellAtIndexPath:", v6, v8),
        v8,
        (v9 & 1) == 0))
  {
    objc_msgSend(v19, "setContentOffset:animated:", 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  }
  else
  {
    -[UIButton frame](self->_actionButton, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[SUUIHorizontalLockupView frame](self->_lockupView, "frame");
    MaxX = CGRectGetMaxX(v20);
    v17 = v5 - v13;
    if (v5 < v13)
      v17 = -0.0;
    -[UIButton setFrame:](self->_actionButton, "setFrame:", MaxX + v17, v11, v13, v15);
    -[UIButton setHidden:](self->_actionButton, "setHidden:", v5 < 0.00000011920929);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "indexPathForCell:", self);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "collectionView:willBeginEditingItemAtIndexPath:", v6, v18);

    }
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double v7;
  double y;
  id v9;

  v9 = a3;
  -[UIButton frame](self->_actionButton, "frame");
  y = a5->y;
  if (v7 * 0.5 <= a5->x)
  {
    objc_msgSend(v9, "setContentOffset:animated:", 1, v7, y);
  }
  else
  {
    objc_msgSend(v9, "setContentOffset:animated:", 1, 0.0, y);
    -[SUUIHorizontalLockupCollectionViewCell scrollViewDidEndScrollingAnimation:](self, "scrollViewDidEndScrollingAnimation:", v9);
  }

}

- (void)_addEditControlAnimated:(BOOL)a3
{
  id v5;
  void *v6;
  UIImageView *v7;
  UIImageView *editModeControl;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double *v16;
  _QWORD v17[6];
  uint64_t v18;
  double *v19;
  uint64_t v20;
  const char *v21;
  __int128 v22;
  __int128 v23;

  v5 = objc_alloc(MEMORY[0x24BEBD668]);
  -[SUUIHorizontalLockupCollectionViewCell _editControlImage](self, "_editControlImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (UIImageView *)objc_msgSend(v5, "initWithImage:", v6);
  editModeControl = self->_editModeControl;
  self->_editModeControl = v7;

  -[SUUIHorizontalLockupCollectionViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_editModeControl);
  if (a3)
  {
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v18 = 0;
    v19 = (double *)&v18;
    v20 = 0x4010000000;
    v21 = "";
    v22 = 0u;
    v23 = 0u;
    -[UIImageView frame](self->_editModeControl, "frame");
    *(_QWORD *)&v22 = v12;
    *((_QWORD *)&v22 + 1) = v13;
    *(_QWORD *)&v23 = v14;
    *((_QWORD *)&v23 + 1) = v15;
    v16 = v19;
    *(float *)&v13 = (v11 - v19[7]) * 0.5;
    v19[4] = -v19[6];
    v16[5] = floorf(*(float *)&v13);
    -[UIImageView setFrame:](self->_editModeControl, "setFrame:");
    -[SUUIHorizontalLockupCollectionViewCell layoutIfNeeded](self, "layoutIfNeeded");
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __66__SUUIHorizontalLockupCollectionViewCell__addEditControlAnimated___block_invoke;
    v17[3] = &unk_2511F4720;
    v17[4] = self;
    v17[5] = &v18;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v17, 0.3);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    -[SUUIHorizontalLockupCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

void __66__SUUIHorizontalLockupCollectionViewCell__addEditControlAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = 0x402E000000000000;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 832), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 784);
  if (!v3)
    v3 = *(void **)(v2 + 848);
  v7 = v3;
  objc_msgSend(v7, "frame");
  objc_msgSend(v7, "setFrame:", CGRectGetMaxX(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32))+ 15.0- *(double *)(*(_QWORD *)(a1 + 32) + 800), v4, v5, v6);

}

- (id)_attributedStringForActionButton:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "buttonTitleStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "style");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  SUUIViewElementFontWithStyle(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    SUUIFontPreferredFontForTextStyle(1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "buttonText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributedStringWithDefaultFont:foregroundColor:style:", v11, v13, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_editControlImage
{
  SUUICheckboxInputViewElement *editModeCheckboxElement;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  editModeCheckboxElement = self->_editModeCheckboxElement;
  if (editModeCheckboxElement)
  {
    if (-[SUUICheckboxInputViewElement isSelected](editModeCheckboxElement, "isSelected"))
    {
      objc_msgSend(MEMORY[0x24BEBD640], "_kitImageNamed:withTrait:", CFSTR("UITintedCircularButtonCheckmark"), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUICheckboxInputViewElement style](self->_editModeCheckboxElement, "style");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      SUUIViewElementPlainColorWithStyle(v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        objc_msgSend(v4, "_flatImageWithColor:", v6);
      else
        objc_msgSend(v4, "imageWithRenderingMode:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "_imageThatSuppressesAccessibilityHairlineThickening");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SUUIHorizontalLockupCollectionViewCell backgroundColor](self, "backgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SUUIBorderColorWithBackgroundColor(v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD640], "_kitImageNamed:withTrait:", CFSTR("UIRemoveControlMultiNotCheckedImage"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_flatImageWithColor:", v6);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v10;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_highlightBackgroundColor
{
  void *v2;
  void *v3;
  float v4;
  uint64_t v5;
  void *v6;

  -[SUUIHorizontalLockupCollectionViewCell backgroundColor](self, "backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    switch(SUUIColorSchemeStyleForColor(v2))
    {
      case 0:
      case 2:
        v4 = -0.1;
        goto LABEL_6;
      case 1:
      case 3:
        v4 = 0.2;
LABEL_6:
        SUUIColorByAdjustingBrightness(v3, v4);
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      default:
        v6 = 0;
        goto LABEL_8;
    }
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.9, 1.0);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v6 = (void *)v5;
LABEL_8:

  return v6;
}

- (BOOL)_isActionsScrollViewEnabled
{
  return !self->_editModeControl && self->_actionButtonViewElement != 0;
}

- (void)_reloadActionsScrollViewWithViewElement:(id)a3 context:(id)a4
{
  void *v6;
  SUUIButtonViewElement *v7;
  SUUIButtonViewElement *actionButtonViewElement;
  SUUICellScrollView *v9;
  SUUICellScrollView *v10;
  SUUICellScrollView *actionsScrollView;
  SUUICellScrollView *v12;
  void *v13;
  SUUIHorizontalLockupView *lockupView;
  void *v15;
  UIButton *v16;
  UIButton *actionButton;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UIButton *v22;
  void *v23;
  id v24;

  v24 = a4;
  objc_msgSend(a3, "firstChildForElementType:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstChildForElementType:", 12);
  v7 = (SUUIButtonViewElement *)objc_claimAutoreleasedReturnValue();
  actionButtonViewElement = self->_actionButtonViewElement;
  self->_actionButtonViewElement = v7;

  if (self->_actionButtonViewElement)
  {
    if (!self->_actionsScrollView)
    {
      v9 = [SUUICellScrollView alloc];
      -[SUUIHorizontalLockupView frame](self->_lockupView, "frame");
      v10 = -[SUUICellScrollView initWithFrame:](v9, "initWithFrame:");
      actionsScrollView = self->_actionsScrollView;
      self->_actionsScrollView = v10;

      v12 = self->_actionsScrollView;
      -[SUUIHorizontalLockupView backgroundColor](self->_lockupView, "backgroundColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUICellScrollView setBackgroundColor:](v12, "setBackgroundColor:", v13);

      -[SUUICellScrollView setDelegate:](self->_actionsScrollView, "setDelegate:", self);
      -[SUUICellScrollView setScrollsToTop:](self->_actionsScrollView, "setScrollsToTop:", 0);
      -[SUUICellScrollView setShowsHorizontalScrollIndicator:](self->_actionsScrollView, "setShowsHorizontalScrollIndicator:", 0);
      lockupView = self->_lockupView;
      -[SUUICellScrollView bounds](self->_actionsScrollView, "bounds");
      -[SUUIHorizontalLockupView setFrame:](lockupView, "setFrame:");
      -[SUUICellScrollView addSubview:](self->_actionsScrollView, "addSubview:", self->_lockupView);
      -[SUUIHorizontalLockupCollectionViewCell contentView](self, "contentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addSubview:", self->_actionsScrollView);

    }
    if (!self->_actionButton)
    {
      v16 = (UIButton *)objc_alloc_init(MEMORY[0x24BEBD430]);
      actionButton = self->_actionButton;
      self->_actionButton = v16;

      -[UIButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, sel__actionButtonAction_, 64);
      -[UIButton setContentEdgeInsets:](self->_actionButton, "setContentEdgeInsets:", 0.0, 15.0, 0.0, 15.0);
      -[UIButton setHidden:](self->_actionButton, "setHidden:", 1);
      -[UIButton titleLabel](self->_actionButton, "titleLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTextAlignment:", 1);

    }
    -[SUUIButtonViewElement style](self->_actionButtonViewElement, "style");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ikBackgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "color");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = self->_actionButton;
    -[SUUIHorizontalLockupCollectionViewCell _attributedStringForActionButton:context:](self, "_attributedStringForActionButton:context:", self->_actionButtonViewElement, v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAttributedTitle:forState:](v22, "setAttributedTitle:forState:", v23, 0);

    -[UIButton setBackgroundColor:](self->_actionButton, "setBackgroundColor:", v21);
    -[SUUICellScrollView addSubview:](self->_actionsScrollView, "addSubview:", self->_actionButton);

  }
  else
  {
    -[UIButton setHidden:](self->_actionButton, "setHidden:", 1);
  }

}

- (void)_reloadHighlightBackgroundView
{
  UIView *highlightBackgroundView;
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *v8;
  UIView *v9;
  UIView *v10;
  void *v11;
  UIView *v12;
  UIView *v13;
  UIView *v14;
  void *v15;
  UIView *v16;
  _QWORD v17[4];
  UIView *v18;
  id v19;
  id location;

  if ((-[SUUIHorizontalLockupCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[SUUIHorizontalLockupCollectionViewCell isSelected](self, "isSelected"))
  {
    highlightBackgroundView = self->_highlightBackgroundView;
    if (!highlightBackgroundView)
    {
      -[SUUIHorizontalLockupCollectionViewCell bounds](self, "bounds");
      v8 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v4, v5, v6, v7);
      v9 = self->_highlightBackgroundView;
      self->_highlightBackgroundView = v8;

      v10 = self->_highlightBackgroundView;
      -[SUUIHorizontalLockupCollectionViewCell _highlightBackgroundColor](self, "_highlightBackgroundColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

      highlightBackgroundView = self->_highlightBackgroundView;
    }
    -[SUUIHorizontalLockupCollectionViewCell insertSubview:atIndex:](self, "insertSubview:atIndex:", highlightBackgroundView, 0);
    -[SUUIHorizontalLockupCollectionViewCell _reloadLockupViewBackgroundColor](self, "_reloadLockupViewBackgroundColor");
  }
  else
  {
    v12 = self->_highlightBackgroundView;
    if (v12)
    {
      v13 = v12;
      v14 = self->_highlightBackgroundView;
      self->_highlightBackgroundView = 0;

      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      v15 = (void *)MEMORY[0x24BDE57D8];
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __72__SUUIHorizontalLockupCollectionViewCell__reloadHighlightBackgroundView__block_invoke;
      v17[3] = &unk_2511F6980;
      v16 = v13;
      v18 = v16;
      objc_copyWeak(&v19, &location);
      objc_msgSend(v15, "setCompletionBlock:", v17);
      -[UIView setAlpha:](v16, "setAlpha:", 0.0);
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      objc_destroyWeak(&v19);

      objc_destroyWeak(&location);
    }
  }
}

void __72__SUUIHorizontalLockupCollectionViewCell__reloadHighlightBackgroundView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_reloadLockupViewBackgroundColor");

}

- (void)_reloadLockupViewBackgroundColor
{
  SUUIHorizontalLockupView *lockupView;
  void *v4;
  void *v5;
  SUUICellScrollView *actionsScrollView;
  void *v7;
  id v8;

  -[SUUIHorizontalLockupView metadataBackgroundView](self->_lockupView, "metadataBackgroundView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((-[SUUIHorizontalLockupCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0
    || (-[SUUIHorizontalLockupCollectionViewCell isSelected](self, "isSelected") & 1) != 0
    || self->_highlightBackgroundView)
  {
    lockupView = self->_lockupView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIHorizontalLockupView setBackgroundColor:](lockupView, "setBackgroundColor:", v4);

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundColor:", v5);

    }
  }
  else if (self->_lockupViewBackgroundColor)
  {
    -[SUUIHorizontalLockupView setBackgroundColor:](self->_lockupView, "setBackgroundColor:");
    if (v8)
      objc_msgSend(v8, "setBackgroundColor:", self->_lockupViewBackgroundColor);
  }
  actionsScrollView = self->_actionsScrollView;
  -[SUUIHorizontalLockupView backgroundColor](self->_lockupView, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICellScrollView setBackgroundColor:](actionsScrollView, "setBackgroundColor:", v7);

}

- (void)_removeEditControlAnimated:(BOOL)a3
{
  UIImageView *v5;
  UIImageView *editModeControl;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  UIImageView *v19;
  _QWORD v20[4];
  UIImageView *v21;
  SUUIHorizontalLockupCollectionViewCell *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = self->_editModeControl;
  editModeControl = self->_editModeControl;
  self->_editModeControl = 0;

  if (a3)
  {
    -[SUUIHorizontalLockupCollectionViewCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v16 = (void *)MEMORY[0x24BEBDB00];
    v17 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __69__SUUIHorizontalLockupCollectionViewCell__removeEditControlAnimated___block_invoke;
    v20[3] = &unk_2511F7C70;
    v21 = v5;
    v22 = self;
    v23 = v9;
    v24 = v11;
    v25 = v13;
    v26 = v15;
    v18[0] = v17;
    v18[1] = 3221225472;
    v18[2] = __69__SUUIHorizontalLockupCollectionViewCell__removeEditControlAnimated___block_invoke_2;
    v18[3] = &unk_2511F4908;
    v19 = v21;
    objc_msgSend(v16, "animateWithDuration:animations:completion:", v20, v18, 0.3);

  }
  else
  {
    -[UIImageView removeFromSuperview](v5, "removeFromSuperview");
    -[SUUIHorizontalLockupCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

uint64_t __69__SUUIHorizontalLockupCollectionViewCell__removeEditControlAnimated___block_invoke(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", -v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 784), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 848), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __69__SUUIHorizontalLockupCollectionViewCell__removeEditControlAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupViewBackgroundColor, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundView, 0);
  objc_storeStrong((id *)&self->_editModeControl, 0);
  objc_storeStrong((id *)&self->_editModeCheckboxElement, 0);
  objc_storeStrong((id *)&self->_actionsScrollView, 0);
  objc_storeStrong((id *)&self->_actionButtonViewElement, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end
