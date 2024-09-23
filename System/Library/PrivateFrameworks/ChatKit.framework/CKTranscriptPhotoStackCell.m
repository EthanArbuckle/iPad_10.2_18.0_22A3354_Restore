@implementation CKTranscriptPhotoStackCell

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptPhotoStackCell;
  -[CKTranscriptCell layoutSubviews](&v7, sel_layoutSubviews);
  -[CKTranscriptPhotoStackCell photoStackBalloonView](self, "photoStackBalloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWantsContactImageLayout:", -[CKTranscriptMessageCell wantsContactImageLayout](self, "wantsContactImageLayout"));

  -[CKTranscriptPhotoStackCell pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA840]), "initWithTarget:action:", self, sel_handlePinchGesture_);
    -[CKTranscriptPhotoStackCell setPinchGestureRecognizer:](self, "setPinchGestureRecognizer:", v5);

    -[CKTranscriptPhotoStackCell pinchGestureRecognizer](self, "pinchGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptPhotoStackCell addGestureRecognizer:](self, "addGestureRecognizer:", v6);

  }
}

- (void)layoutSubviewsForAlignmentContents
{
  void *v3;
  int v4;
  _BOOL4 v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double MinX;
  double MaxX;
  double v18;
  double Width;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  void *v25;
  uint64_t v26;
  double v27;
  void *v28;
  CGFloat v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  CGRect recta;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  *(_QWORD *)&recta.origin.y = self;
  *(_QWORD *)&recta.size.width = CKTranscriptPhotoStackCell;
  -[CGFloat layoutSubviewsForAlignmentContents]((objc_super *)&recta.origin.y, sel_layoutSubviewsForAlignmentContents);
  -[CKTranscriptPhotoStackCell photoStackBalloonView](self, "photoStackBalloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CKEditableCollectionViewCell orientation](self, "orientation");
  v5 = -[CKTranscriptMessageCell wantsContactImageLayout](self, "wantsContactImageLayout");
  objc_msgSend(v3, "frame");
  recta.origin.x = v6;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v3, "horizontalContentMarginForSize:", v9, v11);
  v14 = v13;
  if (v5)
    v15 = 7.0;
  else
    v15 = 25.0;
  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  MinX = CGRectGetMinX(v47);
  -[CKTranscriptPhotoStackCell bounds](self, "bounds");
  MaxX = CGRectGetMaxX(v48);
  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  v18 = MaxX - CGRectGetMaxX(v49);
  if (v4)
  {
    -[CKTranscriptPhotoStackCell bounds](self, "bounds");
    Width = CGRectGetWidth(v50);
    v51.origin.x = recta.origin.x;
    v51.origin.y = v8;
    v51.size.width = v10;
    v51.size.height = v12;
    v20 = v14 + Width - CGRectGetWidth(v51) - v15 - v18;
  }
  else
  {
    v20 = v15 + MinX - v14;
  }
  objc_msgSend(v3, "setFrame:", v20, v8, v10, v12);
  if (!v5)
  {
    if (v4)
    {
      if (v4 != 2)
        goto LABEL_13;
      -[CKEditableCollectionViewCell contentInsets](self, "contentInsets");
      v22 = v18 - v21;
      v52.origin.x = v20;
      v52.origin.y = v8;
      v52.size.width = v10;
      v52.size.height = v12;
      v23 = CGRectGetMaxX(v52) - v14;
      -[CKTranscriptPhotoStackCell frame](self, "frame");
      v24 = CGRectGetWidth(v53) - v23 - v22;
      v25 = v3;
      v26 = 1;
    }
    else
    {
      -[CKEditableCollectionViewCell contentInsets](self, "contentInsets");
      v24 = v14 + v20 - (MinX - v27);
      v25 = v3;
      v26 = 0;
    }
    objc_msgSend(v25, "setHorizontalContentMarginAdjustment:edge:", v26, v24);
  }
LABEL_13:
  -[CKTranscriptBalloonCell quickActionButton](self, "quickActionButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = v8;
    -[CKTranscriptBalloonCell quickActionButton](self, "quickActionButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "frame");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;

    if (-[CKEditableCollectionViewCell orientation](self, "orientation"))
    {
      if (-[CKEditableCollectionViewCell orientation](self, "orientation") != 2)
      {
LABEL_19:
        -[CKTranscriptBalloonCell quickActionButton](self, "quickActionButton");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setFrame:", v32, v34, v36, v38);

        goto LABEL_20;
      }
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "transcriptQuickActionButtonHorizontalSpacing");
      v41 = v20 - v36 - v40;
      v42 = 17.0;
    }
    else
    {
      v54.origin.x = v20;
      v54.origin.y = v29;
      v54.size.width = v10;
      v54.size.height = v12;
      v43 = CGRectGetMaxX(v54);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "transcriptQuickActionButtonHorizontalSpacing");
      v41 = v43 + v44;
      v42 = -17.0;
    }
    v32 = v41 + v42;

    goto LABEL_19;
  }
LABEL_20:

}

- (void)setWantsContactImageLayout:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[CKTranscriptMessageCell wantsContactImageLayout](self, "wantsContactImageLayout") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CKTranscriptPhotoStackCell;
    -[CKTranscriptMessageCell setWantsContactImageLayout:](&v6, sel_setWantsContactImageLayout_, v3);
    -[CKTranscriptPhotoStackCell photoStackBalloonView](self, "photoStackBalloonView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWantsContactImageLayout:", v3);

  }
}

- (void)handlePinchGesture:(id)a3
{
  double v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "state") == 2)
  {
    objc_msgSend(v6, "scale");
    if (v4 > 1.5)
    {
      -[CKTranscriptPhotoStackCell delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "didPinchPhotoStackCell:", self);

    }
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  void *v14;
  objc_super v16;
  CGPoint v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CKTranscriptMessageCell failureButton](self, "failureButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (-[CKTranscriptPhotoStackCell convertPoint:toView:](self, "convertPoint:toView:", v8, x, y),
        v10 = v9,
        v12 = v11,
        objc_msgSend(v8, "bounds"),
        v17.x = v10,
        v17.y = v12,
        CGRectContainsPoint(v18, v17)))
  {
    v13 = v8;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CKTranscriptPhotoStackCell;
    -[CKTranscriptPhotoStackCell hitTest:withEvent:](&v16, sel_hitTest_withEvent_, v7, x, y);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

- (BOOL)allowsSwipeToReply
{
  return 0;
}

- (CKTranscriptPhotoStackCellDelegate)delegate
{
  return (CKTranscriptPhotoStackCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (void)setPinchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
