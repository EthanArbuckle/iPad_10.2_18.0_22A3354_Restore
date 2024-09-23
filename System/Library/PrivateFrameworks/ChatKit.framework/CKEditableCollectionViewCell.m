@implementation CKEditableCollectionViewCell

+ (Class)_contentViewClass
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "transcriptCellsNeedVibrancy");

  if (v4)
  {
    v5 = (void *)objc_opt_class();
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKEditableCollectionViewCell;
    v5 = objc_msgSendSuper2(&v7, sel__contentViewClass);
  }
  return (Class)v5;
}

- (void)setEffect:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = a3;
  self->_shouldReturnActualVEV = 1;
  -[CKEditableCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKEditableCollectionViewCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEffect:", v7);

  }
  self->_shouldReturnActualVEV = 0;

}

- (id)contentView
{
  void *v3;
  void *v4;
  _BOOL4 shouldReturnActualVEV;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKEditableCollectionViewCell;
  -[CKEditableCollectionViewCell contentView](&v7, sel_contentView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "transcriptCellsNeedVibrancy"))
    goto LABEL_5;
  shouldReturnActualVEV = self->_shouldReturnActualVEV;

  if (!shouldReturnActualVEV)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "contentView");
      v4 = v3;
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    }
  }
  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  UIEdgeInsets v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CKEditableCollectionViewCell;
  -[CKEditableCollectionViewCell description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEditableCollectionViewCell contentAlignmentInsets](self, "contentAlignmentInsets");
  NSStringFromUIEdgeInsets(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ contentAlignmentInsets:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
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
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double rect;
  objc_super v61;
  CGRect v62;
  CGRect v63;

  v61.receiver = self;
  v61.super_class = (Class)CKEditableCollectionViewCell;
  -[CKEditableCollectionViewCell layoutSubviews](&v61, sel_layoutSubviews);
  -[CKEditableCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = objc_msgSend(MEMORY[0x1E0CEABB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[CKEditableCollectionViewCell semanticContentAttribute](self, "semanticContentAttribute"));
  -[CKEditableCollectionViewCell checkmark](self, "checkmark");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    goto LABEL_19;
  v59 = v9;
  v57 = v5;
  objc_msgSend(v13, "sizeToFit");
  objc_msgSend(v14, "bounds");
  v16 = v15;
  rect = v17;
  v18 = v7 + v11 * 0.5 - v17 * 0.5;
  -[CKEditableCollectionViewCell traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayScale");
  v21 = round(v20 * v18) / v20;
  -[CKEditableCollectionViewCell traitCollection](self, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "displayScale");
  v24 = round(v16 * v23) / v23;

  v58 = v21;
  if (-[CKEditableCollectionViewCell _ck_isEditing](self, "_ck_isEditing"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v25, "forceMinTranscriptMarginInsets") & 1) != 0)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "minTranscriptMarginInsets");
      v28 = v27;
      v30 = v29;

    }
    else
    {
      -[CKEditableCollectionViewCell marginInsets](self, "marginInsets");
      v28 = v38;
      v30 = v39;
    }

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "editingCheckmarkLeadingPadding");
    v42 = v41;
    v31 = 0.0;
    v62.origin.x = 0.0;
    v62.origin.y = v21;
    v62.size.width = v24;
    v62.size.height = rect;
    v43 = v42 + CGRectGetWidth(v62);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "editingCheckmarkTrailingPadding");
    v46 = v45;

    if (v12 == 1)
      v47 = v30;
    else
      v47 = v28;
    v34 = v43 - v47 + v46;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "editingCheckmarkLeadingPadding");
    if (v12 == 1)
    {
      v37 = v59 - v48 - v24;
      v32 = 0.0;
      v33 = 0.0;
    }
    else
    {
      v37 = v48;
      v32 = v34;
      v33 = 0.0;
      v34 = 0.0;
    }
    goto LABEL_15;
  }
  v31 = *MEMORY[0x1E0CEB4B0];
  v32 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v33 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v34 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  if (v12 == 1)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "editingCheckmarkLeadingPadding");
    v37 = v59 + v36;
LABEL_15:

    goto LABEL_16;
  }
  v63.origin.x = 0.0;
  v63.origin.y = v58;
  v63.size.width = v24;
  v63.size.height = rect;
  v37 = -CGRectGetMaxX(v63);
LABEL_16:
  v7 = v7 + v31;
  v9 = v59 - (v32 + v34);
  v49 = v31 + v33;
  v5 = v57 + v32;
  v11 = v11 - v49;
  -[CKEditableCollectionViewCell _horizontalSafeAreaInsets](self, "_horizontalSafeAreaInsets");
  v52 = -v51;
  if (v12 != 1)
    v52 = v50;
  objc_msgSend(v14, "setFrame:", v37 + v52, v58, v24, rect);
LABEL_19:
  -[CKEditableCollectionViewCell contentAlignmentInsets](self, "contentAlignmentInsets");
  -[CKEditableCollectionViewCell setContentAlignmentRect:](self, "setContentAlignmentRect:", v5 + v56, v7 + v53, v9 - (v56 + v54), v11 - (v53 + v55));

}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKEditableCollectionViewCell;
  -[CKEditableCollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  if (-[CKEditableCollectionViewCell _ck_isEditing](self, "_ck_isEditing"))
    -[CKEditableCollectionViewCell updateCheckmarkImage](self, "updateCheckmarkImage");
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKEditableCollectionViewCell;
  -[CKEditableCollectionViewCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  if (-[CKEditableCollectionViewCell _ck_isEditing](self, "_ck_isEditing"))
    -[CKEditableCollectionViewCell updateCheckmarkImage](self, "updateCheckmarkImage");
}

- (void)_ck_setEditing:(BOOL)a3
{
  -[CKEditableCollectionViewCell _ck_setEditing:animated:](self, "_ck_setEditing:animated:", a3, 0);
}

- (void)_ck_setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v11;
  void *v12;
  uint64_t v13;
  void (**v14)(_QWORD);
  void (**v15)(void *, uint64_t);
  _QWORD v16[5];
  BOOL v17;
  _QWORD aBlock[5];

  v4 = a4;
  v5 = a3;
  -[CKEditableCollectionViewCell checkmark](self, "checkmark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || !-[CKEditableCollectionViewCell editingStyle](self, "editingStyle"))
  {
    -[CKEditableCollectionViewCell checkmark](self, "checkmark");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = -[CKEditableCollectionViewCell editingStyle](self, "editingStyle") == 0;
    else
      v9 = 0;

  }
  else
  {
    v9 = 1;
  }

  if (self->__ck_editing != v5 || v9 && v5)
  {
    if (v5 && -[CKEditableCollectionViewCell editingStyle](self, "editingStyle"))
    {
      v11 = objc_alloc(MEMORY[0x1E0CEA658]);
      v12 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CKEditableCollectionViewCell addSubview:](self, "addSubview:", v12);
      -[CKEditableCollectionViewCell setCheckmark:](self, "setCheckmark:", v12);
      objc_msgSend(v12, "setHidden:", -[CKEditableCollectionViewCell editingStyle](self, "editingStyle") != 2);
      -[CKEditableCollectionViewCell updateCheckmarkImage](self, "updateCheckmarkImage");

    }
    if (v4)
    {
      -[CKEditableCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
      -[CKEditableCollectionViewCell layoutIfNeeded](self, "layoutIfNeeded");
    }
    self->__ck_editing = v5;
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__CKEditableCollectionViewCell__ck_setEditing_animated___block_invoke;
    aBlock[3] = &unk_1E274A208;
    aBlock[4] = self;
    v14 = (void (**)(_QWORD))_Block_copy(aBlock);
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __56__CKEditableCollectionViewCell__ck_setEditing_animated___block_invoke_2;
    v16[3] = &unk_1E2756068;
    v17 = v5;
    v16[4] = self;
    v15 = (void (**)(void *, uint64_t))_Block_copy(v16);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 4, v14, v15, 0.300000012, 0.0);
    }
    else
    {
      v14[2](v14);
      v15[2](v15, 1);
    }

  }
}

uint64_t __56__CKEditableCollectionViewCell__ck_setEditing_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __56__CKEditableCollectionViewCell__ck_setEditing_animated___block_invoke_2(uint64_t a1)
{
  id v2;

  if (!*(_BYTE *)(a1 + 40) || !objc_msgSend(*(id *)(a1 + 32), "editingStyle"))
  {
    objc_msgSend(*(id *)(a1 + 32), "checkmark");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 32), "setCheckmark:", 0);

  }
}

- (void)setEditingStyle:(int64_t)a3
{
  self->_editingStyle = a3;
  -[CKEditableCollectionViewCell _ck_setEditing:](self, "_ck_setEditing:", -[CKEditableCollectionViewCell _ck_isEditing](self, "_ck_isEditing"));
}

- (UIEdgeInsets)contentAlignmentInsets
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  v2 = self->_contentInsets.top + self->_marginInsets.top;
  v3 = self->_contentInsets.left + self->_marginInsets.left;
  v4 = self->_contentInsets.bottom + self->_marginInsets.bottom;
  v5 = self->_contentInsets.right + self->_marginInsets.right;
  -[CKEditableCollectionViewCell _horizontalSafeAreaInsets](self, "_horizontalSafeAreaInsets");
  v7 = v2 + v6;
  v9 = v3 + v8;
  v11 = v4 + v10;
  v13 = v5 + v12;
  result.right = v13;
  result.bottom = v11;
  result.left = v9;
  result.top = v7;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    -[CKEditableCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  if (self->_marginInsets.left != a3.left
    || self->_marginInsets.top != a3.top
    || self->_marginInsets.right != a3.right
    || self->_marginInsets.bottom != a3.bottom)
  {
    self->_marginInsets = a3;
    -[CKEditableCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)performInsertion:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)performRemoval:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)performReload:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t);
  void (**v6)(_QWORD);

  v6 = (void (**)(_QWORD))a3;
  v5 = (void (**)(id, uint64_t))a4;
  if (v6)
    v6[2](v6);
  if (v5)
    v5[2](v5, 1);

}

- (void)performHide:(id)a3
{
  -[CKEditableCollectionViewCell _animateVisibility:completion:](self, "_animateVisibility:completion:", 0, a3);
}

- (void)performReveal:(id)a3
{
  -[CKEditableCollectionViewCell _animateVisibility:completion:](self, "_animateVisibility:completion:", 1, a3);
}

- (void)performRevealAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  if (v4)
  {
    -[CKEditableCollectionViewCell performReveal:](self, "performReveal:", v7);
LABEL_5:
    v6 = v7;
    goto LABEL_6;
  }
  -[CKEditableCollectionViewCell _updateVisibility:](self, "_updateVisibility:", 1);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(void))v7 + 2))();
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_animateVisibility:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  BOOL v12;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CEABB0];
  v10 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__CKEditableCollectionViewCell__animateVisibility_completion___block_invoke;
  v11[3] = &unk_1E274CA88;
  v11[4] = self;
  v12 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__CKEditableCollectionViewCell__animateVisibility_completion___block_invoke_2;
  v9[3] = &unk_1E274C308;
  v8 = v6;
  objc_msgSend(v7, "transitionWithView:duration:options:animations:completion:", self, 5242880, v11, v9, 0.3);

}

uint64_t __62__CKEditableCollectionViewCell__animateVisibility_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVisibility:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __62__CKEditableCollectionViewCell__animateVisibility_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateVisibility:(BOOL)a3
{
  -[CKEditableCollectionViewCell setHidden:](self, "setHidden:", !a3);
}

- (UIEdgeInsets)_horizontalSafeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[CKEditableCollectionViewCell safeAreaInsets](self, "safeAreaInsets");
  v4 = 0.0;
  v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (void)updateCheckmarkImage
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[CKEditableCollectionViewCell isSelected](self, "isSelected");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
    objc_msgSend(v4, "transcriptEditingSelectedImage");
  else
    objc_msgSend(v4, "transcriptEditingUnselectedImage");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CKEditableCollectionViewCell checkmark](self, "checkmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v7);

}

- (BOOL)wantsDrawerLayout
{
  return self->_wantsDrawerLayout;
}

- (void)setWantsDrawerLayout:(BOOL)a3
{
  self->_wantsDrawerLayout = a3;
}

- (char)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(char)a3
{
  self->_orientation = a3;
}

- (CGRect)contentAlignmentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentAlignmentRect.origin.x;
  y = self->_contentAlignmentRect.origin.y;
  width = self->_contentAlignmentRect.size.width;
  height = self->_contentAlignmentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentAlignmentRect:(CGRect)a3
{
  self->_contentAlignmentRect = a3;
}

- (double)drawerPercentRevealed
{
  return self->_drawerPercentRevealed;
}

- (void)setDrawerPercentRevealed:(double)a3
{
  self->_drawerPercentRevealed = a3;
}

- (double)associatedItemOffset
{
  return self->_associatedItemOffset;
}

- (void)setAssociatedItemOffset:(double)a3
{
  self->_associatedItemOffset = a3;
}

- (BOOL)isAnimatingInDarkEffect
{
  return self->_isAnimatingInDarkEffect;
}

- (void)setIsAnimatingInDarkEffect:(BOOL)a3
{
  self->_isAnimatingInDarkEffect = a3;
}

- (BOOL)isInReplyContext
{
  return self->_isInReplyContext;
}

- (void)setIsInReplyContext:(BOOL)a3
{
  self->_isInReplyContext = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
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

- (BOOL)_ck_isEditing
{
  return self->__ck_editing;
}

- (int64_t)editingStyle
{
  return self->_editingStyle;
}

- (UIImageView)checkmark
{
  return self->_checkmark;
}

- (void)setCheckmark:(id)a3
{
  objc_storeStrong((id *)&self->_checkmark, a3);
}

- (BOOL)shouldReturnActualVEV
{
  return self->_shouldReturnActualVEV;
}

- (void)setShouldReturnActualVEV:(BOOL)a3
{
  self->_shouldReturnActualVEV = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmark, 0);
}

@end
