@implementation CKTranscriptMessageContentCell

- (CKTranscriptMessageContentCell)initWithFrame:(CGRect)a3
{
  CKTranscriptMessageContentCell *v3;
  id v4;
  uint64_t v5;
  UILabel *drawerLabel;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptMessageContentCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    drawerLabel = v3->_drawerLabel;
    v3->_drawerLabel = (UILabel *)v5;

  }
  return v3;
}

- (void)layoutSubviewsForDrawer
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
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
  double v27;
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
  double v40;
  _QWORD v41[2];
  double v42;
  uint64_t v43;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)CKTranscriptMessageContentCell;
  -[CKTranscriptCell layoutSubviewsForDrawer](&v44, sel_layoutSubviewsForDrawer);
  -[CKTranscriptCell drawerPercentRevealed](self, "drawerPercentRevealed");
  v4 = v3;
  -[CKTranscriptMessageContentCell drawerLabel](self, "drawerLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 != 0.0) != -[CKTranscriptMessageContentCell drawerWasVisible](self, "drawerWasVisible"))
  {
    if (v4 == 0.0)
      objc_msgSend(v5, "removeFromSuperview");
    else
      -[CKTranscriptMessageContentCell addSubview:](self, "addSubview:", v5);
    -[CKTranscriptMessageContentCell setDrawerWasVisible:](self, "setDrawerWasVisible:", v4 != 0.0);
  }
  v13 = -[CKTranscriptMessageContentCell drawerTextChanged](self, "drawerTextChanged");
  if (v4 != 0.0 && v13)
  {
    -[CKTranscriptMessageContentCell drawerText](self, "drawerText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributedText:", v14);
    objc_msgSend(v14, "size");
    v16 = v15;
    v18 = v17;
    if (CKMainScreenScale_once_18 != -1)
      dispatch_once(&CKMainScreenScale_once_18, &__block_literal_global_46);
    v19 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_18 != 0.0)
      v19 = *(double *)&CKMainScreenScale_sMainScreenScale_18;
    -[CKTranscriptMessageContentCell setDrawerTextSize:](self, "setDrawerTextSize:", ceil(v16 * v19) / v19, ceil(v18 * v19) / v19);
    -[CKTranscriptMessageContentCell setDrawerTextChanged:](self, "setDrawerTextChanged:", 0);

  }
  v41[1] = v9;
  v43 = v11;
  -[CKTranscriptMessageContentCell drawerTextSize](self, "drawerTextSize", v7);
  v42 = v20;
  -[CKTranscriptMessageContentCell willLayoutDrawerLabelFrame:](self, "willLayoutDrawerLabelFrame:", v41);
  -[CKEditableCollectionViewCell marginInsets](self, "marginInsets");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[CKTranscriptMessageCell safeAreaInsets](self, "safeAreaInsets");
  v30 = v22 + v29;
  v34 = v28 + v33;
  objc_msgSend(v12, "transcriptDrawerWidthForMarginInsets:", v30, v24 + v31, v26 + v32, v28 + v33);
  v36 = v35;
  if (-[CKEditableCollectionViewCell wantsDrawerLayout](self, "wantsDrawerLayout"))
  {
    -[CKTranscriptMessageContentCell bounds](self, "bounds");
    v38 = v37 - v4 * v36;
  }
  else
  {
    v39 = (v34 - v42) * -0.5;
    -[CKTranscriptMessageContentCell bounds](self, "bounds");
    v38 = v40 - v4 * (v34 + v39);
  }
  objc_msgSend(v5, "setFrame:", v38 - (v42 - (v36 - v34)));

}

- (void)layoutSubviewsForAlignmentContents
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
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
  double v27;
  double v28;
  double v29;
  double MaxX;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  _OWORD v40[3];
  _OWORD v41[3];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  CGRect v46;

  v45.receiver = self;
  v45.super_class = (Class)CKTranscriptMessageContentCell;
  -[CKEditableCollectionViewCell layoutSubviewsForAlignmentContents](&v45, sel_layoutSubviewsForAlignmentContents);
  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  -[CKTranscriptMessageContentCell messageDisplayView](self, "messageDisplayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v42 = 0u;
  -[CKTranscriptMessageContentCell messageDisplayView](self, "messageDisplayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "transform");
  }
  else
  {
    v43 = 0u;
    v44 = 0u;
    v42 = 0u;
  }

  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v41[0] = *MEMORY[0x1E0C9BAA8];
  v41[1] = v6;
  v41[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v41);
  objc_msgSend(v3, "frame");
  -[CKTranscriptMessageContentCell messageDisplayViewFrame:inContainerFrame:](self, "messageDisplayViewFrame:inContainerFrame:");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v3, "setFrame:");
  v40[0] = v42;
  v40[1] = v43;
  v40[2] = v44;
  objc_msgSend(v3, "setTransform:", v40);
  if (!-[CKEditableCollectionViewCell orientation](self, "orientation"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCell drawerPercentRevealed](self, "drawerPercentRevealed");
    v17 = v16;
    if (objc_msgSend(v15, "timestampsPushBalloons"))
    {
      if (v17 > 0.0)
      {
        -[CKTranscriptMessageContentCell drawerLabelFrame](self, "drawerLabelFrame");
        -[CKEditableCollectionViewCell marginInsets](self, "marginInsets");
        v39 = v17;
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        objc_msgSend(v15, "transcriptDrawerWidthForMarginInsets:");
        v37 = v26;
        -[CKTranscriptMessageContentCell bounds](self, "bounds");
        v38 = v27 - v37;
        objc_msgSend(v15, "transcriptDrawerOverlapForMarginInsets:", v19, v21, v23, v25);
        v29 = v28 - v25 + v38;
        v46.origin.x = v8;
        v46.origin.y = v10;
        v46.size.width = v12;
        v46.size.height = v14;
        MaxX = CGRectGetMaxX(v46);
        if (MaxX > v29)
        {
          v31 = MaxX;
          -[CKEditableCollectionViewCell contentView](self, "contentView");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "frame");
          objc_msgSend(v32, "setFrame:", -((v31 - v29) * v39));

        }
      }
    }

  }
  if (-[CKTranscriptMessageCell wantsContactImageLayout](self, "wantsContactImageLayout"))
  {
    v33 = 1.0;
    if (-[CKTranscriptMessageCell isReplyContextPreview](self, "isReplyContextPreview"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "transcriptReplyPreviewContextContactAlpha");
      v33 = v35;

    }
    -[CKPhoneTranscriptMessageCell contactImageView](self, "contactImageView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAlpha:", v33);

  }
}

- (CGRect)messageDisplayViewFrame:(CGRect)a3 inContainerFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  CGFloat v8;
  CGFloat v9;
  void *v11;
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
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double MaxX;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat rect;
  double recta;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  -[CKTranscriptMessageContentCell messageDisplayViewLayoutAttributesForMessageDisplayViewFrame:inContainerFrame:](self, "messageDisplayViewLayoutAttributesForMessageDisplayViewFrame:inContainerFrame:", a3.origin.x, a3.origin.y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "size");
  v13 = v12;
  if (-[CKEditableCollectionViewCell orientation](self, "orientation"))
  {
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    v14 = CGRectGetMaxX(v43) - v13;
  }
  else
  {
    v14 = x;
  }
  -[CKEditableCollectionViewCell associatedItemOffset](self, "associatedItemOffset");
  rect = v9;
  if (v15 != 0.0)
  {
    -[CKEditableCollectionViewCell associatedItemOffset](self, "associatedItemOffset");
    v17 = v14 + v16;
    if (-[CKEditableCollectionViewCell orientation](self, "orientation"))
    {
      v44.origin.x = x;
      v44.origin.y = y;
      v44.size.width = width;
      v44.size.height = height;
      v18 = CGRectGetMaxX(v44) - v13;
      if (v18 >= v17)
        v14 = v17;
      else
        v14 = v18;
    }
    else if (x >= v17)
    {
      v14 = x;
    }
    else
    {
      v14 = v17;
    }
  }
  -[CKTranscriptMessageContentCell layoutOffset](self, "layoutOffset");
  if (v19 != 0.0)
  {
    -[CKTranscriptMessageContentCell layoutOffset](self, "layoutOffset");
    v21 = v20;
    if (-[CKEditableCollectionViewCell orientation](self, "orientation"))
    {
      v22 = v14 - v21;
      v45.origin.x = x;
      v45.origin.y = y;
      v45.size.width = width;
      v45.size.height = height;
      v23 = CGRectGetMaxX(v45) - v13;
      if (v23 >= v22)
        v14 = v22;
      else
        v14 = v23;
    }
    else if (x >= v14 + v21)
    {
      v14 = x;
    }
    else
    {
      v14 = v14 + v21;
    }
  }
  v24 = MEMORY[0x1E0C9D538];
  -[CKTranscriptMessageContentCell swipeToReplyLayoutOffset](self, "swipeToReplyLayoutOffset");
  if (v25 != 0.0)
  {
    -[CKTranscriptMessageContentCell swipeToReplyLayoutOffset](self, "swipeToReplyLayoutOffset");
    v27 = v14 + v26;
    if (x >= v27)
      v14 = x;
    else
      v14 = v27;
  }
  v28 = *(double *)(v24 + 8);
  if (objc_msgSend(v11, "wantsFrameClamping"))
  {
    if (-[CKEditableCollectionViewCell orientation](self, "orientation"))
    {
      if (v14 < x)
        v14 = v14 + x - v14;
    }
    else
    {
      v46.origin.x = v14;
      v46.origin.y = v28;
      v46.size.width = rect;
      v46.size.height = v8;
      v40 = v8;
      MaxX = CGRectGetMaxX(v46);
      v47.origin.x = x;
      v47.origin.y = y;
      v47.size.width = width;
      v47.size.height = height;
      if (MaxX <= CGRectGetMaxX(v47))
      {
        v8 = v40;
      }
      else
      {
        v48.origin.x = v14;
        v48.origin.y = v28;
        v8 = v40;
        v48.size.width = rect;
        v48.size.height = v40;
        recta = CGRectGetMaxX(v48);
        v49.origin.x = x;
        v49.origin.y = y;
        v49.size.width = width;
        v49.size.height = height;
        v14 = v14 - (recta - CGRectGetMaxX(v49));
      }
    }
  }
  -[CKTranscriptMessageContentCell traitCollection](self, "traitCollection", *(_QWORD *)&v40);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "displayScale");
  if (v31 == 0.0)
  {
    if (CKMainScreenScale_once_18 != -1)
      dispatch_once(&CKMainScreenScale_once_18, &__block_literal_global_46);
    if (*(double *)&CKMainScreenScale_sMainScreenScale_18 == 0.0)
      v32 = 1.0;
    else
      v32 = *(double *)&CKMainScreenScale_sMainScreenScale_18;
  }
  else
  {
    v32 = v31;
  }

  -[CKTranscriptMessageContentCell traitCollection](self, "traitCollection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "displayScale");
  if (v34 == 0.0)
  {
    if (CKMainScreenScale_once_18 != -1)
      dispatch_once(&CKMainScreenScale_once_18, &__block_literal_global_46);
    v34 = *(double *)&CKMainScreenScale_sMainScreenScale_18;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_18 == 0.0)
      v34 = 1.0;
  }
  v35 = ceil(v13 * v34) / v34;

  v36 = floor(v14 * v32) / v32;
  v37 = v28;
  v38 = v35;
  v39 = v8;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (id)messageDisplayViewLayoutAttributesForMessageDisplayViewFrame:(CGRect)a3 inContainerFrame:(CGRect)a4
{
  double height;
  double width;
  double v6;

  height = a3.size.height;
  width = a3.size.width;
  -[CKTranscriptMessageContentCell swipeToReplyLayoutOffset](self, "swipeToReplyLayoutOffset", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return -[CKMessageDisplayViewLayoutAttributes initWithSize:wantsFrameClamping:]([_TtC7ChatKit36CKMessageDisplayViewLayoutAttributes alloc], "initWithSize:wantsFrameClamping:", v6 == 0.0, width, height);
}

- (CGRect)drawerLabelFrame
{
  void *v2;
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
  CGRect result;

  -[CKTranscriptMessageContentCell drawerLabel](self, "drawerLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setDrawerText:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *v5;
  NSAttributedString *v6;

  v4 = (NSAttributedString *)a3;
  if (self->_drawerText != v4)
  {
    v6 = v4;
    v5 = (NSAttributedString *)-[NSAttributedString copy](v4, "copy");

    objc_storeStrong((id *)&self->_drawerText, v5);
    -[CKTranscriptMessageContentCell setDrawerTextChanged:](self, "setDrawerTextChanged:", 1);
    -[CKTranscriptMessageContentCell setNeedsLayout](self, "setNeedsLayout");
    v4 = v5;
  }

}

- (UIView)messageDisplayView
{
  return 0;
}

- (double)layoutOffset
{
  return 0.0;
}

- (double)swipeToReplyLayoutOffset
{
  return 0.0;
}

- (NSAttributedString)drawerText
{
  return self->_drawerText;
}

- (CGSize)messageDisplayViewRequestedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_messageDisplayViewRequestedSize.width;
  height = self->_messageDisplayViewRequestedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMessageDisplayViewRequestedSize:(CGSize)a3
{
  self->_messageDisplayViewRequestedSize = a3;
}

- (int64_t)animationPauseReasons
{
  return self->_animationPauseReasons;
}

- (void)setAnimationPauseReasons:(int64_t)a3
{
  self->_animationPauseReasons = a3;
}

- (UILabel)drawerLabel
{
  return self->_drawerLabel;
}

- (void)setDrawerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_drawerLabel, a3);
}

- (BOOL)drawerWasVisible
{
  return self->_drawerWasVisible;
}

- (void)setDrawerWasVisible:(BOOL)a3
{
  self->_drawerWasVisible = a3;
}

- (BOOL)drawerTextChanged
{
  return self->_drawerTextChanged;
}

- (void)setDrawerTextChanged:(BOOL)a3
{
  self->_drawerTextChanged = a3;
}

- (CGSize)drawerTextSize
{
  double width;
  double height;
  CGSize result;

  width = self->_drawerTextSize.width;
  height = self->_drawerTextSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDrawerTextSize:(CGSize)a3
{
  self->_drawerTextSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawerLabel, 0);
  objc_storeStrong((id *)&self->_drawerText, 0);
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;

  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKTranscriptMessageContentCell;
  v12 = a3;
  -[CKTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v15, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  objc_msgSend(v12, "transcriptDrawerText", v15.receiver, v15.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptMessageContentCell setDrawerText:](self, "setDrawerText:", v13);

  objc_msgSend(v12, "size");
  -[CKTranscriptMessageContentCell setMessageDisplayViewRequestedSize:](self, "setMessageDisplayViewRequestedSize:");
  -[CKTranscriptMessageCell setIsReply:](self, "setIsReply:", objc_msgSend(v12, "itemIsReply"));
  -[CKTranscriptMessageCell setIsReplyContextPreview:](self, "setIsReplyContextPreview:", objc_msgSend(v12, "itemIsReplyContextPreview"));
  objc_msgSend(v12, "IMChatItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKTranscriptMessageCell setIsFromMe:](self, "setIsFromMe:", objc_msgSend(v14, "isFromMe"));
}

@end
