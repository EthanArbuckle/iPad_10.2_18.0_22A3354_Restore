@implementation CKTranscriptStatusCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
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
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
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
  _BOOL8 v51;
  void *v52;
  objc_super v53;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKTranscriptStatusCell setButtonAlignmentRelativeToContent:](self, "setButtonAlignmentRelativeToContent:", objc_msgSend(v12, "statusAlignment"));
    v53.receiver = self;
    v53.super_class = (Class)CKTranscriptStatusCell;
    -[CKTranscriptStampCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v53, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, v13, v9, a7, a6);
    objc_msgSend(v12, "transcriptButtonText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptStatusCell setAttributedButtonText:](self, "setAttributedButtonText:", v14);

    -[CKTranscriptStatusCell statusButton](self, "statusButton");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject contentEdgeInsets](v15, "contentEdgeInsets");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_msgSend(v12, "buttonSize");
    v25 = v24 + v19 + v23;
    v27 = v26 + v17 + v21;
    -[NSObject frame](v15, "frame");
    if (v29 != v25 || v28 != v27)
    {
      -[NSObject setFrame:](v15, "setFrame:");
      -[CKTranscriptStatusCell setNeedsLayout](self, "setNeedsLayout");
    }
    -[CKTranscriptLabelCell label](self, "label");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "frame");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    objc_msgSend(v31, "setNumberOfLines:", 0);
    objc_msgSend(v12, "labelTextAlignmentInsets");
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    objc_msgSend(v12, "labelSize");
    if (v37 != v49 + v43 + v47 || v39 != v48 + v41 + v45)
    {
      objc_msgSend(v31, "setFrame:", v33, v35);
      -[CKTranscriptStatusCell setNeedsLayout](self, "setNeedsLayout");
    }
    -[NSObject setUserInteractionEnabled:](v15, "setUserInteractionEnabled:", objc_msgSend(v12, "buttonType") != 0);
    if (objc_msgSend(v12, "shouldHideDuringDarkFSM"))
    {
      v51 = -[CKTranscriptCell shouldConfigureForDarkFSM](self, "shouldConfigureForDarkFSM");
      -[CKTranscriptStatusCell statusButton](self, "statusButton");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setHidden:", v51);

    }
  }
  else
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CKTranscriptStatusCell(CKChatItem) configureForChatItem:context:animated:animationDuration:animationCurve:].cold.1();
  }

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptStatusCell;
  -[CKTranscriptStampCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CKTranscriptStatusCell statusButton](self, "statusButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CKTranscriptStatusCell setStatusButton:](self, "setStatusButton:", 0);
}

- (BOOL)shouldHideDuringDarkFSM
{
  return 1;
}

- (void)setOrientation:(char)a3
{
  uint64_t v3;
  objc_super v5;

  v3 = a3;
  if (-[CKEditableCollectionViewCell orientation](self, "orientation") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CKTranscriptStatusCell;
    -[CKTranscriptStampCell setOrientation:](&v5, sel_setOrientation_, v3);
    -[CKTranscriptStatusCell setNeedsLayout](self, "setNeedsLayout");
    -[CKTranscriptStatusCell layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)layoutSubviewsForAlignmentContents
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
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
  CGFloat v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat MaxX;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
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
  double MinX;
  double v55;
  double v56;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double rect;
  CGFloat v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  objc_super v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  -[CKTranscriptLabelCell label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v79 = v6;
  v80 = v7;
  v84 = v8;
  v85.receiver = self;
  v85.super_class = (Class)CKTranscriptStatusCell;
  -[CKTranscriptStampCell layoutSubviewsForAlignmentContents](&v85, sel_layoutSubviewsForAlignmentContents);
  v9 = -[CKEditableCollectionViewCell orientation](self, "orientation");
  -[CKTranscriptStampCell contentAlignmentRect](self, "contentAlignmentRect");
  v13 = v12;
  rect = v14;
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v17 = *MEMORY[0x1E0CEB4B0];
  v18 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  if (!v9)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "balloonMaskTailSizeForTailShape:", 1);
    v31 = v30;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "audioBalloonTimeInset");
    v34 = v33;

    -[CKTranscriptStatusCell prevBalloonWidth](self, "prevBalloonWidth");
    if (v35 < 12.0)
      v35 = 12.0;
    v36 = v31 + v13;
    v37 = v15 + v17;
    v38 = v35 - (v34 + v31);
    v39 = v16 - (v17 + v18);
    v40 = v36;
    goto LABEL_13;
  }
  v76 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v82 = v5;
  v19 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  if (v9 == 2)
  {
    v20 = v10;
    v21 = v11;
    v74 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "balloonMaskAlignmentRectInsetsWithTailShape:", 1);
    v24 = v23 + 1.0;

    -[CKTranscriptStatusCell prevBalloonWidth](self, "prevBalloonWidth");
    if (v25 >= 12.0)
      v26 = v25;
    else
      v26 = 12.0;
    v86.origin.x = v13;
    v86.origin.y = rect;
    v86.size.width = v20;
    v86.size.height = v21;
    MaxX = CGRectGetMaxX(v86);
    v19 = v74;
    v28 = MaxX - v26;
  }
  else
  {
    v24 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v28 = *MEMORY[0x1E0C9D648];
  }
  v36 = v24 + v28;
  v37 = v15 + v17;
  v38 = v26 - (v19 + v24);
  v39 = v76 - (v17 + v18);
  if (v9 == 2)
  {
    v87.origin.x = v36;
    v87.origin.y = v15 + v17;
    v87.size.width = v38;
    v87.size.height = v76 - (v17 + v18);
    v40 = CGRectGetMaxX(v87) - v84;
LABEL_13:
    v41 = v80;
    goto LABEL_15;
  }
  v41 = v80;
  v40 = v82;
LABEL_15:
  -[CKTranscriptStatusCell statusButton](self, "statusButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v42)
  {
    v83 = v40;
    objc_msgSend(v42, "frame");
    v45 = v44;
    v47 = v46;
    -[CKTranscriptStatusCell buttonAlignmentInsets](self, "buttonAlignmentInsets");
    v77 = v48;
    v75 = v48 + v49;
    v50 = v45 - (v48 + v49);
    v81 = v51;
    v53 = v51 + v52;
    if (-[CKTranscriptStatusCell buttonAlignmentRelativeToContent](self, "buttonAlignmentRelativeToContent")
      || v38 <= v50)
    {
      v89.origin.x = v36;
      v89.origin.y = v37;
      v89.size.width = v38;
      v89.size.height = v39;
      MinX = CGRectGetMaxX(v89) - v50;
    }
    else
    {
      v88.origin.x = v36;
      v88.origin.y = v37;
      v88.size.width = v38;
      v88.size.height = v39;
      MinX = CGRectGetMinX(v88);
    }
    v56 = v47 - v53;
    if (MinX < v36 && v9 == 0)
      v58 = v36;
    else
      v58 = MinX;
    -[CKTranscriptLabelCell attributedText](self, "attributedText");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
    {
      v60 = v84;
      if (v9 == 2)
        v61 = v36;
      else
        v61 = v83;
      v62 = v61;
      v55 = v79;
      v63 = v79;
      v64 = v41;
      if (CGRectGetMaxX(*(CGRect *)(&v60 - 2)) + 6.0 <= v58)
      {
        MinX = v58;
      }
      else if (v9)
      {
        if (v9 == 2)
          v61 = MinX - (v84 + 6.0);
        else
          v61 = v83;
      }
      else
      {
        v90.origin.x = v61;
        v90.origin.y = v79;
        v90.size.width = v84;
        v90.size.height = v41;
        MinX = CGRectGetMaxX(v90) + 6.0;
      }
    }
    else
    {
      MinX = v58;
      v61 = v83;
      v55 = v79;
    }
    objc_msgSend(v43, "setFrame:", MinX - v77, rect - v81, v75 + v50, v53 + v56);
    objc_msgSend(v43, "__ck_ensureMinimumTouchInsets");
    v40 = v61;
  }
  else
  {
    v55 = v79;
  }
  -[CKTranscriptStatusCell traitCollection](self, "traitCollection");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "displayScale");
  if (v66 == 0.0)
  {
    if (CKMainScreenScale_once_104 != -1)
      dispatch_once(&CKMainScreenScale_once_104, &__block_literal_global_78_2);
    v67 = *(double *)&CKMainScreenScale_sMainScreenScale_104;
    v68 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_104 == 0.0)
      v67 = 1.0;
    v69 = floor(v40 * v67) / v67;
    v66 = *(double *)&CKMainScreenScale_sMainScreenScale_104;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_104 == 0.0)
      v66 = 1.0;
    v70 = *(double *)&CKMainScreenScale_sMainScreenScale_104;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_104 == 0.0)
      v70 = 1.0;
    v71 = ceil(v84 * v70) / v70;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_104 != 0.0)
      v68 = *(double *)&CKMainScreenScale_sMainScreenScale_104;
  }
  else
  {
    v69 = floor(v40 * v66) / v66;
    v68 = v66;
    v71 = ceil(v84 * v66) / v66;
  }
  v72 = floor(v55 * v66) / v66;
  v73 = ceil(v41 * v68) / v68;

  objc_msgSend(v3, "setFrame:", v69, v72, v71, v73);
}

- (UIEdgeInsets)buttonAlignmentInsets
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
  UIEdgeInsets result;

  -[CKTranscriptStatusCell statusButton](self, "statusButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentEdgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)performInsertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;
  id v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  _QWORD v28[4];
  id v29;
  id v30;
  CGAffineTransform v31;
  CGAffineTransform v32;

  v4 = a3;
  -[CKTranscriptLabelCell label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptStatusCell statusButton](self, "statusButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptStatusCell layoutIfNeeded](self, "layoutIfNeeded");
  CGAffineTransformMakeScale(&v32, 0.0, 0.0);
  objc_msgSend(v5, "setTransform:", &v32);
  CGAffineTransformMakeScale(&v31, 0.0, 0.0);
  objc_msgSend(v6, "setTransform:", &v31);
  v7 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __43__CKTranscriptStatusCell_performInsertion___block_invoke;
  v28[3] = &unk_1E274A108;
  v8 = v5;
  v29 = v8;
  v9 = v6;
  v30 = v9;
  +[CKTranscriptStatusCell zoomAnimation:completion:](CKTranscriptStatusCell, "zoomAnimation:completion:", v28, v4);

  objc_msgSend(v8, "attributedText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
    goto LABEL_4;
  objc_msgSend(v9, "attributedTitleForState:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    objc_msgSend(v8, "center");
    v14 = v13;
    v16 = v15;
    objc_msgSend(v9, "center");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v8, "setCenter:");
    objc_msgSend(v9, "setCenter:", v14, v20);
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __43__CKTranscriptStatusCell_performInsertion___block_invoke_2;
    v21[3] = &unk_1E2755EA0;
    v22 = v8;
    v24 = v14;
    v25 = v16;
    v23 = v9;
    v26 = v18;
    v27 = v20;
    +[CKTranscriptStatusCell zoomAnimation:completion:](CKTranscriptStatusCell, "zoomAnimation:completion:", v21, 0);

    v10 = v22;
LABEL_4:

  }
}

uint64_t __43__CKTranscriptStatusCell_performInsertion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v2 = *(void **)(a1 + 32);
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8 = *MEMORY[0x1E0C9BAA8];
  v6 = v8;
  v9 = v7;
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v5 = v10;
  objc_msgSend(v2, "setTransform:", &v8);
  v3 = *(void **)(a1 + 40);
  v8 = v6;
  v9 = v7;
  v10 = v5;
  return objc_msgSend(v3, "setTransform:", &v8);
}

uint64_t __43__CKTranscriptStatusCell_performInsertion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 40), "setCenter:", *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)performReload:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void (**v21)(void);

  v21 = (void (**)(void))a3;
  v6 = a4;
  -[CKTranscriptLabelCell label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "createStampLabelView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptStampCell setStampTextView:](self, "setStampTextView:", v8);

  }
  -[CKTranscriptStatusCell statusButton](self, "statusButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "statusButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptStatusCell setStatusButton:](self, "setStatusButton:", v10);

  }
  if (v21)
    v21[2]();
  -[CKTranscriptStatusCell layoutIfNeeded](self, "layoutIfNeeded");
  -[CKTranscriptLabelCell label](self, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToAttributedString:", v13);

  if ((v14 & 1) != 0)
  {
    objc_msgSend(v7, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v11);

    objc_msgSend(v7, "removeFromSuperview");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "transitionFromView:toView:duration:options:completion:", v7, v11, 327680, v6, 0.5);

    v6 = 0;
  }
  -[CKTranscriptStatusCell statusButton](self, "statusButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributedTitleForState:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributedTitleForState:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqualToAttributedString:", v18);

  if ((v19 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "transitionFromView:toView:duration:options:completion:", v9, v16, 327680, v6, 0.5);
    goto LABEL_14;
  }
  objc_msgSend(v9, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v16);

  objc_msgSend(v9, "removeFromSuperview");
  if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
LABEL_14:

  }
}

- (void)performRemoval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = a3;
  -[CKTranscriptLabelCell label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptStatusCell statusButton](self, "statusButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CEABB0];
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __41__CKTranscriptStatusCell_performRemoval___block_invoke;
  v16[3] = &unk_1E274A108;
  v17 = v5;
  v18 = v6;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __41__CKTranscriptStatusCell_performRemoval___block_invoke_2;
  v12[3] = &unk_1E2754EB0;
  v13 = v17;
  v14 = v18;
  v15 = v4;
  v9 = v4;
  v10 = v18;
  v11 = v17;
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 327680, v16, v12, 0.25, 0.0);

}

uint64_t __41__CKTranscriptStatusCell_performRemoval___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __41__CKTranscriptStatusCell_performRemoval___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)setAttributedButtonText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  -[CKTranscriptStatusCell attributedButtonText](self, "attributedButtonText");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v20;
  if (v4 == v20)
    goto LABEL_13;
  -[CKTranscriptStatusCell attributedButtonText](self, "attributedButtonText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  v5 = v20;
  if ((v9 & 1) != 0)
    goto LABEL_13;
  -[CKTranscriptStatusCell statusButton](self, "statusButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;
  if (!v20)
  {
    objc_msgSend(v10, "removeFromSuperview");
    -[CKTranscriptStatusCell setStatusButton:](self, "setStatusButton:", 0);
    v12 = 0;
    goto LABEL_7;
  }
  if (!v10)
  {
    objc_msgSend((id)objc_opt_class(), "statusButton");
    v12 = objc_claimAutoreleasedReturnValue();
    -[CKTranscriptStatusCell setStatusButton:](self, "setStatusButton:", v12);
    -[CKEditableCollectionViewCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v12);
LABEL_7:

    v10 = (void *)v12;
    v11 = v20;
  }
  v13 = v11;
  if (-[CKTranscriptCell shouldConfigureForDarkFSM](self, "shouldConfigureForDarkFSM"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "theme");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "balloonColorsForColorType:", 0xFFFFFFFFLL);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v17, 0, objc_msgSend(v18, "length"));
    v19 = objc_msgSend(v18, "copy");

    v13 = (id)v19;
  }
  objc_msgSend(v10, "setAttributedTitle:forState:", v13, 0);
  if (v10)
  {
    -[CKTranscriptStatusCell setNeedsLayout](self, "setNeedsLayout");
    -[CKTranscriptStatusCell layoutIfNeeded](self, "layoutIfNeeded");
  }

  v5 = v20;
LABEL_13:

}

- (NSAttributedString)attributedButtonText
{
  void *v2;
  void *v3;

  -[CKTranscriptStatusCell statusButton](self, "statusButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedTitleForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setPrevBalloonWidth:(double)a3
{
  if (self->_prevBalloonWidth != a3)
  {
    self->_prevBalloonWidth = a3;
    -[CKTranscriptStatusCell setNeedsLayout](self, "setNeedsLayout");
    -[CKTranscriptStatusCell layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)addFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptStatusCell;
  v4 = a3;
  -[CKTranscriptStampCell addFilter:](&v12, sel_addFilter_, v4);
  -[CKTranscriptStatusCell statusButton](self, "statusButton", v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsGroupBlending:", 0);

  objc_msgSend(v5, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

  objc_msgSend(v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textCompositingFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompositingFilter:", v9);

  objc_msgSend(v4, "contentAlpha");
  v11 = v10;

  objc_msgSend(v5, "setAlpha:", v11);
}

- (void)clearFilters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptStatusCell;
  -[CKTranscriptStampCell clearFilters](&v7, sel_clearFilters);
  -[CKTranscriptStatusCell statusButton](self, "statusButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupBlending:", 1);

  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsGroupOpacity:", 1);

  objc_msgSend(v3, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", 0);

  objc_msgSend(v3, "setAlpha:", 1.0);
}

+ (id)statusButton
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA3A8], "borderlessButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentInsets:", *MEMORY[0x1E0CEA080], *(double *)(MEMORY[0x1E0CEA080] + 8), *(double *)(MEMORY[0x1E0CEA080] + 16), *(double *)(MEMORY[0x1E0CEA080] + 24));
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithConfiguration:primaryAction:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConfigurationUpdateHandler:", &__block_literal_global_267);
  objc_msgSend(v3, "setEnabled:", CKIsRunningInMessagesNotificationExtension() == 0);

  return v3;
}

void __38__CKTranscriptStatusCell_statusButton__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v2 = a2;
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = qword_18E7CBE90[objc_msgSend(v3, "userInterfaceStyle") == 2];

  v5 = (void *)MEMORY[0x1E0CEABB0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__CKTranscriptStatusCell_statusButton__block_invoke_2;
  v7[3] = &unk_1E274C9C0;
  v8 = v2;
  v9 = v4;
  v6 = v2;
  objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", 327684, v7, 0, 0.2, 0.0);

}

uint64_t __38__CKTranscriptStatusCell_statusButton__block_invoke_2(uint64_t a1)
{
  int v2;
  double v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isHighlighted");
  v3 = 1.0;
  if (v2)
    v3 = *(double *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v3);
}

+ (void)zoomAnimation:(id)a3 completion:(id)a4
{
  objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, a3, a4, 0.91, 0.0, 2.0, 300.0, 400.0, 0.0);
}

+ (void)transitionFromView:(id)a3 toView:(id)a4 duration:(double)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v11;
  id v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5 * 0.5;
  v14 = a7;
  objc_msgSend(v11, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v12);

  objc_msgSend(v12, "setAlpha:", 0.0);
  v16 = (void *)MEMORY[0x1E0CEABB0];
  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __80__CKTranscriptStatusCell_transitionFromView_toView_duration_options_completion___block_invoke;
  v25[3] = &unk_1E274A208;
  v26 = v11;
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __80__CKTranscriptStatusCell_transitionFromView_toView_duration_options_completion___block_invoke_2;
  v23[3] = &unk_1E274A1B8;
  v24 = v26;
  v18 = v26;
  objc_msgSend(v16, "animateWithDuration:delay:options:animations:completion:", a6, v25, v23, v13, 0.0);
  v19 = (void *)MEMORY[0x1E0CEABB0];
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __80__CKTranscriptStatusCell_transitionFromView_toView_duration_options_completion___block_invoke_3;
  v21[3] = &unk_1E274A208;
  v22 = v12;
  v20 = v12;
  objc_msgSend(v19, "animateWithDuration:delay:options:animations:completion:", a6, v21, v14, v13, v13);

}

uint64_t __80__CKTranscriptStatusCell_transitionFromView_toView_duration_options_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __80__CKTranscriptStatusCell_transitionFromView_toView_duration_options_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __80__CKTranscriptStatusCell_transitionFromView_toView_duration_options_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (BOOL)wantsDrawerLayout
{
  return 1;
}

- (UIButton)statusButton
{
  return self->_statusButton;
}

- (void)setStatusButton:(id)a3
{
  objc_storeStrong((id *)&self->_statusButton, a3);
}

- (char)buttonAlignmentRelativeToContent
{
  return self->_buttonAlignmentRelativeToContent;
}

- (void)setButtonAlignmentRelativeToContent:(char)a3
{
  self->_buttonAlignmentRelativeToContent = a3;
}

- (double)prevBalloonWidth
{
  return self->_prevBalloonWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusButton, 0);
}

@end
