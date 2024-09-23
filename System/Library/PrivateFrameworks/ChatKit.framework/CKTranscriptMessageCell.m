@implementation CKTranscriptMessageCell

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptMessageCell;
  -[CKEditableCollectionViewCell description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ wantsContactImageLayout:%d failed:%d"), v4, -[CKTranscriptMessageCell wantsContactImageLayout](self, "wantsContactImageLayout"), -[CKTranscriptMessageCell failed](self, "failed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIEdgeInsets)safeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  UIEdgeInsets result;

  v22.receiver = self;
  v22.super_class = (Class)CKTranscriptMessageCell;
  -[CKTranscriptMessageCell safeAreaInsets](&v22, sel_safeAreaInsets);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = v3;
  if (v6 > 0.0 || v3 > 0.0)
  {
    -[CKTranscriptMessageCell window](self, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && (unint64_t)(objc_msgSend(v12, "interfaceOrientation") - 3) <= 1)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "landscapeKeyboardInsets");
      v15 = v14;
      v17 = v16;

      if (v7 > 0.0)
        v7 = v15;
      if (v10 > 0.0)
        v10 = v17;
    }

  }
  v18 = v5;
  v19 = v7;
  v20 = v9;
  v21 = v10;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)layoutSubviewsForContents
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
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
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat MaxX;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double *v72;
  double v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  CGFloat v107;
  objc_super v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;

  v108.receiver = self;
  v108.super_class = (Class)CKTranscriptMessageCell;
  -[CKEditableCollectionViewCell layoutSubviewsForContents](&v108, sel_layoutSubviewsForContents);
  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[CKEditableCollectionViewCell orientation](self, "orientation");
  -[CKTranscriptMessageCell failureButton](self, "failureButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CKTranscriptMessageCell wantsContactImageLayout](self, "wantsContactImageLayout");
  v14 = v13;
  if (v12 || v13)
  {
    v102 = v8;
    v105 = v10;
    -[CKEditableCollectionViewCell contentAlignmentInsets](self, "contentAlignmentInsets");
    v16 = v15;
    -[CKEditableCollectionViewCell contentAlignmentInsets](self, "contentAlignmentInsets");
    v18 = v17;
    -[CKTranscriptMessageCell safeAreaInsets](self, "safeAreaInsets");
    v20 = v18 - v19;
    -[CKEditableCollectionViewCell contentAlignmentInsets](self, "contentAlignmentInsets");
    v99 = v21;
    -[CKEditableCollectionViewCell contentAlignmentInsets](self, "contentAlignmentInsets");
    v23 = v22;
    -[CKTranscriptMessageCell safeAreaInsets](self, "safeAreaInsets");
    v97 = v23 - v24;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v25, "forceMinTranscriptMarginInsets") & 1) != 0)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "minTranscriptMarginInsets");
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;

    }
    else
    {
      -[CKEditableCollectionViewCell marginInsets](self, "marginInsets");
      v28 = v35;
      v30 = v36;
      v32 = v37;
      v34 = v38;
    }

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "contactPhotoTranscriptInsets");
    v41 = v28 + v40;
    v43 = v30 + v42;
    v45 = v32 + v44;
    v47 = v34 + v46;

    v4 = v4 - v20 + v43;
    v6 = v6 - v16 + v41;
    v8 = v102 + v20 + v97 - (v43 + v47);
    v10 = v105 + v16 + v99 - (v41 + v45);
    if (v12)
    {
      if (-[CKTranscriptMessageCell failureButtonAdjustsContentAlignmentRect](self, "failureButtonAdjustsContentAlignmentRect"))
      {
        objc_msgSend(v12, "frame");
        v49 = v48;
        v106 = v50;
        objc_msgSend(v12, "frame");
        v52 = v51;
        v53 = v6;
        if (CKMainScreenScale_once_87 != -1)
          dispatch_once(&CKMainScreenScale_once_87, &__block_literal_global_79_2);
        v54 = v8;
        v55 = *(double *)&CKMainScreenScale_sMainScreenScale_87;
        if (*(double *)&CKMainScreenScale_sMainScreenScale_87 == 0.0)
          v55 = 1.0;
        v56 = v52 * v55;
        v57 = v53;
        v58 = 1.0 / v55 * (v53 * v55 + floor((v10 * v55 - v56) * 0.5));
        v59 = *MEMORY[0x1E0CEB4B0];
        v103 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
        if (v11)
        {
          v60 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
          v109.origin.x = v4;
          v109.origin.y = v57;
          v100 = *MEMORY[0x1E0CEB4B0];
          v61 = v49 + 1.0;
          v62 = v49;
          v63 = v58;
          v109.size.width = v54;
          v109.size.height = v10;
          MaxX = CGRectGetMaxX(v109);
          v58 = v63;
          v49 = v62;
          v65 = v61;
          v59 = v100;
          v66 = MaxX - v49;
        }
        else
        {
          v60 = v49 + 1.0;
          v65 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
          v66 = v4;
        }
        objc_msgSend(v12, "setFrame:", v66, v58, v49, v106);
        v4 = v4 + v60;
        v8 = v54 - (v60 + v65);
        v10 = v10 - (v59 + v103);
        v6 = v57 + v59;
      }
    }
  }
  if (v14)
  {
    -[CKTranscriptMessageCell contactImageViewFrame](self, "contactImageViewFrame");
    v68 = v67;
    v70 = v69;
    v110.origin.x = v4;
    v110.origin.y = v6;
    v110.size.width = v8;
    v107 = v10;
    v110.size.height = v10;
    v71 = CGRectGetMaxY(v110) + 1.0;
    v72 = (double *)MEMORY[0x1E0CEB4B0];
    v73 = 0.0;
    if (-[CKTranscriptMessageCell isReplyContextPreview](self, "isReplyContextPreview"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "transcriptContactImageDiameter");
      v76 = v75;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "transcriptReplyPreviewContextContactImageDiameter");
      v73 = (v76 - v78) * 0.5;

    }
    v96 = v71 - v70;
    v98 = *v72;
    v101 = v72[2];
    v104 = v70;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "contactPhotoBalloonMargin");
    v81 = v80 + v73 * 2.0;

    v82 = v68 + v81;
    if (v11)
    {
      v83 = v72[1];
      v111.origin.x = v4;
      v111.origin.y = v6;
      v111.size.width = v8;
      v84 = v107;
      v111.size.height = v107;
      v85 = CGRectGetMaxX(v111) - v68 - v73;
    }
    else
    {
      v83 = v68 + v81;
      v82 = v72[3];
      v85 = v4 + v73;
      v84 = v107;
    }
    -[CKTranscriptMessageCell contactImageView](self, "contactImageView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setFrame:", v85, v96, v68, v104);
    -[CKEditableCollectionViewCell contentInsets](self, "contentInsets");
    v88 = v98 + v87;
    v90 = v83 + v89;
    v4 = v4 + v90;
    v6 = v6 + v88;
    v8 = v8 - (v90 + v82 + v92);
    v10 = v84 - (v88 + v101 + v91);

  }
  if (-[CKTranscriptMessageCell isReplyContextPreview](self, "isReplyContextPreview")
    && !-[CKTranscriptMessageCell isFromMe](self, "isFromMe")
    && v11 == 2)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "balloonMaskTailSizeForTailShape:", 1);
    v95 = v94;

    v4 = v4 - v95;
  }
  -[CKEditableCollectionViewCell setContentAlignmentRect:](self, "setContentAlignmentRect:", v4, v6, v8, v10);

}

- (CGRect)contactImageViewFrame
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  v2 = -[CKTranscriptMessageCell isReplyContextPreview](self, "isReplyContextPreview");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    objc_msgSend(v3, "transcriptReplyPreviewContextContactImageDiameter");
  else
    objc_msgSend(v3, "transcriptContactImageDiameter");
  v6 = v5;

  v7 = 0.0;
  v8 = 0.0;
  v9 = v6;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)setWantsContactImageLayout:(BOOL)a3
{
  if (self->_wantsContactImageLayout != a3)
  {
    self->_wantsContactImageLayout = a3;
    -[CKTranscriptMessageCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setFailed:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (-[CKTranscriptMessageCell failed](self, "failed") != a3)
  {
    -[CKTranscriptMessageCell failureButton](self, "failureButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 118);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "theme");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "statusFailureTextColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTintColor:", v10);

        -[CKEditableCollectionViewCell contentView](self, "contentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSubview:", v7);

        -[CKTranscriptMessageCell setFailureButton:](self, "setFailureButton:", v7);
        objc_msgSend(v7, "sizeToFit");

      }
    }
    else
    {
      objc_msgSend(v5, "removeFromSuperview");

      -[CKTranscriptMessageCell setFailureButton:](self, "setFailureButton:", 0);
    }
    -[CKTranscriptMessageCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)failed
{
  void *v2;
  BOOL v3;

  -[CKTranscriptMessageCell failureButton](self, "failureButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)failureButtonAdjustsContentAlignmentRect
{
  return 1;
}

- (id)contactImageView
{
  return 0;
}

+ (double)failureButtonWidthPlusSpacing
{
  if (failureButtonWidthPlusSpacing_onceToken != -1)
    dispatch_once(&failureButtonWidthPlusSpacing_onceToken, &__block_literal_global_210);
  return *(double *)&failureButtonWidthPlusSpacing_sFailureButtonWidthPlusSpacing;
}

void __56__CKTranscriptMessageCell_failureButtonWidthPlusSpacing__block_invoke()
{
  void *v0;
  CKTranscriptMessageCell *v1;
  CGRect v2;

  v1 = objc_alloc_init(CKTranscriptMessageCell);
  -[CKTranscriptMessageCell setFailed:](v1, "setFailed:", 1);
  -[CKTranscriptMessageCell failureButton](v1, "failureButton");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "frame");
  *(double *)&failureButtonWidthPlusSpacing_sFailureButtonWidthPlusSpacing = CGRectGetWidth(v2) + 1.0;

}

- (BOOL)chatEligibleForContactImage
{
  return self->_chatEligibleForContactImage;
}

- (void)setChatEligibleForContactImage:(BOOL)a3
{
  self->_chatEligibleForContactImage = a3;
}

- (BOOL)wantsContactImageLayout
{
  return self->_wantsContactImageLayout;
}

- (BOOL)isReply
{
  return self->_isReply;
}

- (void)setIsReply:(BOOL)a3
{
  self->_isReply = a3;
}

- (BOOL)isReplyContextPreview
{
  return self->_isReplyContextPreview;
}

- (void)setIsReplyContextPreview:(BOOL)a3
{
  self->_isReplyContextPreview = a3;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (UIButton)failureButton
{
  return self->_failureButton;
}

- (void)setFailureButton:(id)a3
{
  objc_storeStrong((id *)&self->_failureButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureButton, 0);
}

@end
