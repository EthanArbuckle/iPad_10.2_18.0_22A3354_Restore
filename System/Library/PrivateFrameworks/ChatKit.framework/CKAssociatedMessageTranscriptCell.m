@implementation CKAssociatedMessageTranscriptCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  _OWORD v13[3];
  uint64_t v14;
  objc_super v15;

  v9 = a5;
  v12 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKAssociatedMessageTranscriptCell;
  -[CKTranscriptMessageContentCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v15, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  if (v12)
  {
    objc_msgSend(v12, "geometryDescriptor");
  }
  else
  {
    v14 = 0;
    memset(v13, 0, sizeof(v13));
  }
  -[CKAssociatedMessageTranscriptCell setGeometryDescriptor:](self, "setGeometryDescriptor:", v13);
  objc_msgSend(v12, "size");
  -[CKAssociatedMessageTranscriptCell setSize:](self, "setSize:");
  -[CKTranscriptMessageCell setFailed:](self, "setFailed:", objc_msgSend(v12, "failed"));
  -[CKAssociatedMessageTranscriptCell setNeedsLayout](self, "setNeedsLayout");

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CKAssociatedMessageTranscriptCell *v5;
  CKAssociatedMessageTranscriptCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKAssociatedMessageTranscriptCell;
  -[CKAssociatedMessageTranscriptCell hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CKAssociatedMessageTranscriptCell *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || (-[CKEditableCollectionViewCell contentView](self, "contentView"),
        v6 = (CKAssociatedMessageTranscriptCell *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {

    v5 = 0;
  }
  return v5;
}

- (BOOL)failureButtonAdjustsContentAlignmentRect
{
  return 0;
}

- (void)applyLayoutAttributes:(id)a3
{
  double *v4;
  objc_super v5;

  v4 = (double *)a3;
  if (!-[CKTranscriptCollectionViewLayoutAttributes isEqual:](self->_layoutAttributes, "isEqual:", v4))
  {
    v5.receiver = self;
    v5.super_class = (Class)CKAssociatedMessageTranscriptCell;
    -[CKAssociatedMessageTranscriptCell applyLayoutAttributes:](&v5, sel_applyLayoutAttributes_, v4);
    -[CKAssociatedMessageTranscriptCell setLayoutAttributes:](self, "setLayoutAttributes:", v4);
    if (v4[56] > 0.0)
      -[CKAssociatedMessageTranscriptCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAssociatedItemView:(id)a3
{
  UIView *v5;
  UIView **p_associatedItemView;
  UIView *associatedItemView;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  UIView *v13;

  v5 = (UIView *)a3;
  p_associatedItemView = &self->_associatedItemView;
  associatedItemView = self->_associatedItemView;
  if (associatedItemView != v5)
  {
    v13 = v5;
    if (associatedItemView)
      -[UIView removeFromSuperview](associatedItemView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_associatedItemView, a3);
    -[UIView frame](v13, "frame");
    self->_rawAssociatedItemViewFrame.origin.x = v8;
    self->_rawAssociatedItemViewFrame.origin.y = v9;
    self->_rawAssociatedItemViewFrame.size.width = v10;
    self->_rawAssociatedItemViewFrame.size.height = v11;
    if (*p_associatedItemView)
    {
      -[CKEditableCollectionViewCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", *p_associatedItemView);

    }
    -[CKAssociatedMessageTranscriptCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v13;
  }

}

- (void)layoutSubviewsForAlignmentContents
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;

  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKAssociatedMessageTranscriptCell rawAssociatedItemViewFrame](self, "rawAssociatedItemViewFrame");
  v12 = v11;
  v14 = v13;
  -[CKAssociatedMessageTranscriptCell size](self, "size");
  -[CKAssociatedMessageTranscriptCell associatedViewFrame:inContainerFrame:](self, "associatedViewFrame:inContainerFrame:", v12, v14, v15, v16, v4, v6, v8, v10);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[CKAssociatedMessageTranscriptCell swipeToReplyLayoutOffset](self, "swipeToReplyLayoutOffset");
  if (v25 != 0.0)
  {
    -[CKAssociatedMessageTranscriptCell swipeToReplyLayoutOffset](self, "swipeToReplyLayoutOffset");
    v18 = v18 + v26;
  }
  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v18, v20, v22, v24);

  -[CKTranscriptMessageContentCell drawerLabel](self, "drawerLabel");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setHidden:", 1);

}

- (CGRect)associatedViewFrame:(CGRect)a3 inContainerFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (-[CKEditableCollectionViewCell orientation](self, "orientation", a3.origin.x, a3.origin.y))
  {
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    x = CGRectGetMaxX(v15) - v9;
  }
  v11 = x;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)swipeToReplyLayoutOffset
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;

  -[CKAssociatedMessageTranscriptCell layoutAttributes](self, "layoutAttributes");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3 || (v5 = *(double *)(v3 + 448), v5 <= 0.0))
  {
    -[CKAssociatedMessageTranscriptCell swipeToReplyDelta](self, "swipeToReplyDelta");
    v5 = v6;
  }

  return v5;
}

- (void)performReload:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void (**v7)(id, uint64_t);
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  _QWORD v27[9];
  CGRect v28;
  CGRect v29;

  v6 = (void (**)(_QWORD))a3;
  v7 = (void (**)(id, uint64_t))a4;
  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  if (v6)
    v6[2](v6);
  -[CKAssociatedMessageTranscriptCell setNeedsLayout](self, "setNeedsLayout");
  -[CKAssociatedMessageTranscriptCell layoutIfNeeded](self, "layoutIfNeeded");
  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v28.origin.x = v10;
  v28.origin.y = v12;
  v28.size.width = v14;
  v28.size.height = v16;
  v29.origin.x = v19;
  v29.origin.y = v21;
  v29.size.width = v23;
  v29.size.height = v25;
  if (CGRectEqualToRect(v28, v29))
  {
    if (v7)
      v7[2](v7, 1);
  }
  else
  {
    -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v10, v12, v14, v16);

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __62__CKAssociatedMessageTranscriptCell_performReload_completion___block_invoke;
    v27[3] = &unk_1E274B8B8;
    v27[4] = self;
    *(CGFloat *)&v27[5] = v19;
    *(CGFloat *)&v27[6] = v21;
    *(CGFloat *)&v27[7] = v23;
    *(CGFloat *)&v27[8] = v25;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v27, v7, 0.25, 0.0);
  }

}

void __62__CKAssociatedMessageTranscriptCell_performReload_completion___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "associatedItemView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKAssociatedMessageTranscriptCell;
  -[CKTranscriptCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CKAssociatedMessageTranscriptCell clearFilters](self, "clearFilters");
  -[CKAssociatedMessageTranscriptCell setLayoutAttributes:](self, "setLayoutAttributes:", 0);
  -[CKAssociatedMessageTranscriptCell setCumulativeAssociatedOffset:](self, "setCumulativeAssociatedOffset:", 0.0);
  -[CKAssociatedMessageTranscriptCell setParentSize:](self, "setParentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[CKAssociatedMessageTranscriptCell setParentRotationOffset:](self, "setParentRotationOffset:", 0.0);
  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CKAssociatedMessageTranscriptCell setAssociatedItemView:](self, "setAssociatedItemView:", 0);
  -[CKAssociatedMessageTranscriptCell setDelegate:](self, "setDelegate:", 0);
}

- (void)addFilter:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v6 = a3;
  objc_msgSend(v6, "balloonFilters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "filters");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "balloonFilters");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
    }
    else
    {
      objc_msgSend(v6, "balloonFilters");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFilters:", v11);

    if (v10)
    {

      v11 = v18;
    }

  }
  objc_msgSend(v6, "contentAlpha");
  v15 = v14;
  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", v15);

  v19.receiver = self;
  v19.super_class = (Class)CKAssociatedMessageTranscriptCell;
  -[CKEditableCollectionViewCell addFilter:](&v19, sel_addFilter_, v6);

}

- (void)clearFilters
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilters:", 0);

  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  v6.receiver = self;
  v6.super_class = (Class)CKAssociatedMessageTranscriptCell;
  -[CKEditableCollectionViewCell clearFilters](&v6, sel_clearFilters);
}

- (CGRect)adjustedContentAlignmentRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKAssociatedMessageTranscriptCell parentSize](self, "parentSize");
  +[CKAssociatedMessageChatItem adjustContentAlignmentRect:forChatItemSize:transcriptOrientation:](CKAssociatedMessageChatItem, "adjustContentAlignmentRect:forChatItemSize:transcriptOrientation:", -[CKEditableCollectionViewCell orientation](self, "orientation"), v4, v6, v8, v10, v11, v12);
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)debugBorderColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "purpleColor");
}

- (CKAssociatedMessageTranscriptCellDelegate)delegate
{
  return (CKAssociatedMessageTranscriptCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)associatedItemView
{
  return self->_associatedItemView;
}

- (IMAssociatedMessageGeometryDescriptor)geometryDescriptor
{
  __int128 v3;

  v3 = *(_OWORD *)&self[19].scale;
  *(_OWORD *)&retstr->layoutIntent = *(_OWORD *)&self[19].xScalar;
  *(_OWORD *)&retstr->parentPreviewWidth = v3;
  *(_OWORD *)&retstr->yScalar = *(_OWORD *)&self[20].layoutIntent;
  retstr->rotation = self[20].parentPreviewWidth;
  return self;
}

- (void)setGeometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)&a3->parentPreviewWidth;
  v3 = *(_OWORD *)&a3->yScalar;
  v5 = *(_OWORD *)&a3->layoutIntent;
  self->_geometryDescriptor.rotation = a3->rotation;
  *(_OWORD *)&self->_geometryDescriptor.parentPreviewWidth = v4;
  *(_OWORD *)&self->_geometryDescriptor.yScalar = v3;
  *(_OWORD *)&self->_geometryDescriptor.layoutIntent = v5;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)parentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_parentSize.width;
  height = self->_parentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setParentSize:(CGSize)a3
{
  self->_parentSize = a3;
}

- (BOOL)parentIsFromMe
{
  return self->_parentIsFromMe;
}

- (void)setParentIsFromMe:(BOOL)a3
{
  self->_parentIsFromMe = a3;
}

- (UIEdgeInsets)stickerReactionInsetsForParent
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_stickerReactionInsetsForParent.top;
  left = self->_stickerReactionInsetsForParent.left;
  bottom = self->_stickerReactionInsetsForParent.bottom;
  right = self->_stickerReactionInsetsForParent.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setStickerReactionInsetsForParent:(UIEdgeInsets)a3
{
  self->_stickerReactionInsetsForParent = a3;
}

- (double)parentRotationOffset
{
  return self->_parentRotationOffset;
}

- (void)setParentRotationOffset:(double)a3
{
  self->_parentRotationOffset = a3;
}

- (double)cumulativeAssociatedOffset
{
  return self->_cumulativeAssociatedOffset;
}

- (void)setCumulativeAssociatedOffset:(double)a3
{
  self->_cumulativeAssociatedOffset = a3;
}

- (double)swipeToReplyDelta
{
  return self->_swipeToReplyDelta;
}

- (void)setSwipeToReplyDelta:(double)a3
{
  self->_swipeToReplyDelta = a3;
}

- (VKCStickerEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (CKTranscriptCollectionViewLayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setLayoutAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (CGRect)rawAssociatedItemViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rawAssociatedItemViewFrame.origin.x;
  y = self->_rawAssociatedItemViewFrame.origin.y;
  width = self->_rawAssociatedItemViewFrame.size.width;
  height = self->_rawAssociatedItemViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRawAssociatedItemViewFrame:(CGRect)a3
{
  self->_rawAssociatedItemViewFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_associatedItemView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
