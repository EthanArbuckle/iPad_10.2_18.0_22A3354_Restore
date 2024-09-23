@implementation CKMentionSuggestionCell

+ (id)reuseIdentifier
{
  return CFSTR("CKMentionSuggestionCell");
}

- (CKMentionSuggestionCell)initWithFrame:(CGRect)a3
{
  CKMentionSuggestionCell *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CKAvatarView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CKLabel *v21;
  CKLabel *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  objc_super v101;
  _QWORD v102[15];

  v102[13] = *MEMORY[0x1E0C80C00];
  v101.receiver = self;
  v101.super_class = (Class)CKMentionSuggestionCell;
  v3 = -[CKMentionSuggestionCell initWithFrame:](&v101, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 8);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0CEABE8]);
    v100 = (void *)v5;
    objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v5, 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithEffect:", v7);

    objc_msgSend(v8, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "theme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "paddleSelectionColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v12);

    v99 = v8;
    -[CKMentionSuggestionCell setSelectedBackgroundView:](v3, "setSelectedBackgroundView:", v8);
    v13 = objc_alloc_init(CKAvatarView);
    -[CKMentionSuggestionCell setAvatarView:](v3, "setAvatarView:", v13);

    -[CKMentionSuggestionCell avatarView](v3, "avatarView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAsynchronousRendering:", 1);

    -[CKMentionSuggestionCell avatarView](v3, "avatarView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUserInteractionEnabled:", 0);

    -[CKMentionSuggestionCell avatarView](v3, "avatarView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShowsContactOnTap:", 0);

    -[CKMentionSuggestionCell avatarView](v3, "avatarView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBypassActionValidation:", 1);

    -[CKMentionSuggestionCell avatarView](v3, "avatarView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKMentionSuggestionCell contentView](v3, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionCell avatarView](v3, "avatarView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v20);

    v21 = [CKLabel alloc];
    v22 = -[CKLabel initWithFrame:](v21, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKMentionSuggestionCell setHandleLabel:](v3, "setHandleLabel:", v22);

    -[CKMentionSuggestionCell handleLabel](v3, "handleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "mentionsCellNameFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFont:", v25);

    -[CKMentionSuggestionCell handleLabel](v3, "handleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "theme");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "paddleNameColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextColor:", v29);

    -[CKMentionSuggestionCell handleLabel](v3, "handleLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setLineBreakMode:", 4);

    -[CKMentionSuggestionCell handleLabel](v3, "handleLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setNumberOfLines:", 2);

    -[CKMentionSuggestionCell handleLabel](v3, "handleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTextAlignment:", 1);

    -[CKMentionSuggestionCell handleLabel](v3, "handleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKMentionSuggestionCell contentView](v3, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionCell handleLabel](v3, "handleLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSubview:", v35);

    -[CKMentionSuggestionCell handleLabel](v3, "handleLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v37) = 1148846080;
    objc_msgSend(v36, "setContentCompressionResistancePriority:forAxis:", 1, v37);

    v75 = (void *)MEMORY[0x1E0CB3718];
    -[CKMentionSuggestionCell handleLabel](v3, "handleLabel");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "widthAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintLessThanOrEqualToConstant:", 96.0);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = v96;
    -[CKMentionSuggestionCell handleLabel](v3, "handleLabel");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "widthAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintGreaterThanOrEqualToConstant:", 62.0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v102[1] = v93;
    -[CKMentionSuggestionCell avatarView](v3, "avatarView");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "topAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionCell contentView](v3, "contentView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "topAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:constant:", v89, 16.0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v102[2] = v88;
    -[CKMentionSuggestionCell avatarView](v3, "avatarView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "centerXAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionCell contentView](v3, "contentView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "centerXAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v84);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v102[3] = v83;
    -[CKMentionSuggestionCell avatarView](v3, "avatarView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionCell contentView](v3, "contentView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintGreaterThanOrEqualToAnchor:constant:", v79, 12.0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v102[4] = v78;
    -[CKMentionSuggestionCell avatarView](v3, "avatarView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionCell contentView](v3, "contentView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintLessThanOrEqualToAnchor:constant:", v73, -12.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v102[5] = v72;
    -[CKMentionSuggestionCell avatarView](v3, "avatarView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "heightAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToConstant:", 40.0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v102[6] = v69;
    -[CKMentionSuggestionCell avatarView](v3, "avatarView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "widthAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToConstant:", 40.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v102[7] = v66;
    -[CKMentionSuggestionCell handleLabel](v3, "handleLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionCell avatarView](v3, "avatarView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, 8.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v102[8] = v61;
    -[CKMentionSuggestionCell handleLabel](v3, "handleLabel");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionCell contentView](v3, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintGreaterThanOrEqualToAnchor:constant:", v57, 12.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v102[9] = v56;
    -[CKMentionSuggestionCell handleLabel](v3, "handleLabel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionCell contentView](v3, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintLessThanOrEqualToAnchor:constant:", v52, -12.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v102[10] = v51;
    -[CKMentionSuggestionCell handleLabel](v3, "handleLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "centerXAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionCell contentView](v3, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v102[11] = v40;
    -[CKMentionSuggestionCell handleLabel](v3, "handleLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionCell contentView](v3, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintLessThanOrEqualToAnchor:constant:", v44, -12.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v102[12] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 13);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "activateConstraints:", v46);

    if (CKIsRunningInMacCatalyst())
    {
      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", v3, sel_didHoverOverCell_);
      -[CKMentionSuggestionCell addGestureRecognizer:](v3, "addGestureRecognizer:", v47);
      -[CKMentionSuggestionCell setSelectedBackgroundView:](v3, "setSelectedBackgroundView:", 0);

    }
  }
  return v3;
}

- (void)setSuggestedEntity:(id)a3
{
  CKEntity **p_suggestedEntity;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CKEntity *v12;

  p_suggestedEntity = &self->_suggestedEntity;
  v12 = (CKEntity *)a3;
  if (*p_suggestedEntity != v12)
  {
    -[CKMentionSuggestionCell avatarView](self, "avatarView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CKEntity cnContactWithKeys:](v12, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[CKMentionSuggestionCell avatarView](self, "avatarView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setContact:", v7);

      }
      else if (_IMWillLog())
      {
        _IMAlwaysLog();
      }

    }
    -[CKMentionSuggestionCell handleLabel](self, "handleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CKMentionSuggestionCell handleLabel](self, "handleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKEntity fullName](v12, "fullName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v11);

    }
    objc_storeStrong((id *)p_suggestedEntity, a3);
  }

}

- (UIView)hoverView
{
  UIView *hoverView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;
  CGRect v11;
  CGRect v12;

  hoverView = self->_hoverView;
  if (!hoverView)
  {
    -[CKMentionSuggestionCell bounds](self, "bounds");
    v12 = CGRectInset(v11, 6.0, 6.0);
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
    v5 = self->_hoverView;
    self->_hoverView = v4;

    v6 = self->_hoverView;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appTintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v9);

    -[UIView _setContinuousCornerRadius:](self->_hoverView, "_setContinuousCornerRadius:", 5.0);
    hoverView = self->_hoverView;
  }
  return hoverView;
}

- (void)didHoverOverCell:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = objc_msgSend(a3, "state");
  if (v4 == 3)
  {
    -[CKMentionSuggestionCell hoverView](self, "hoverView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[CKMentionSuggestionCell handleLabel](self, "handleLabel");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "paddleNameColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

  }
  else
  {
    if (v4 != 1)
      return;
    -[CKMentionSuggestionCell hoverView](self, "hoverView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionSuggestionCell insertSubview:atIndex:](self, "insertSubview:atIndex:", v5, 0);

    -[CKMentionSuggestionCell handleLabel](self, "handleLabel");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v6);
  }

}

- (CKEntity)suggestedEntity
{
  return self->_suggestedEntity;
}

- (CKLabel)handleLabel
{
  return self->_handleLabel;
}

- (void)setHandleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_handleLabel, a3);
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (void)setHoverView:(id)a3
{
  objc_storeStrong((id *)&self->_hoverView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_handleLabel, 0);
  objc_storeStrong((id *)&self->_suggestedEntity, 0);
}

@end
