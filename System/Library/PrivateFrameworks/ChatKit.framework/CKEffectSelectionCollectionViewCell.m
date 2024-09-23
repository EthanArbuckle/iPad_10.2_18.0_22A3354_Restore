@implementation CKEffectSelectionCollectionViewCell

- (CKEffectSelectionCollectionViewCell)initWithFrame:(CGRect)a3
{
  CKEffectSelectionCollectionViewCell *v3;
  CKEffectSelectionCollectionViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
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
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
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
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  objc_super v113;
  _QWORD v114[4];
  _QWORD v115[6];

  v115[4] = *MEMORY[0x1E0C80C00];
  v113.receiver = self;
  v113.super_class = (Class)CKEffectSelectionCollectionViewCell;
  v3 = -[CKEffectSelectionCollectionViewCell initWithFrame:](&v113, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKEffectSelectionCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v6 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectSelectionCollectionViewCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 7, 0, 0, 0, 1.0, 88.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);

    v9 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectSelectionCollectionViewCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 8, 1, 0, 0, 1.0, 103.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    v12 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[CKEffectSelectionCollectionViewCell setShadowView:](v4, "setShadowView:", v12);

    -[CKEffectSelectionCollectionViewCell shadowView](v4, "shadowView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionCollectionViewCell shadowView](v4, "shadowView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v14);

    -[CKEffectSelectionCollectionViewCell shadowView](v4, "shadowView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCornerRadius:", 12.0);

    v18 = *MEMORY[0x1E0CD2A68];
    v111 = *MEMORY[0x1E0CD2A68];
    -[CKEffectSelectionCollectionViewCell shadowView](v4, "shadowView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCornerCurve:", v18);

    -[CKEffectSelectionCollectionViewCell shadowView](v4, "shadowView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setShadowRadius:", 2.0);

    -[CKEffectSelectionCollectionViewCell shadowView](v4, "shadowView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = 1036831949;
    objc_msgSend(v24, "setShadowOpacity:", v25);

    -[CKEffectSelectionCollectionViewCell shadowView](v4, "shadowView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setShadowOffset:", 0.0, 1.0);

    -[CKEffectSelectionCollectionViewCell contentView](v4, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionCollectionViewCell shadowView](v4, "shadowView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v29);

    v97 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectSelectionCollectionViewCell shadowView](v4, "shadowView");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "topAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionCollectionViewCell contentView](v4, "contentView");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "topAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:constant:", v103, 8.0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v115[0] = v101;
    -[CKEffectSelectionCollectionViewCell shadowView](v4, "shadowView");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "centerXAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionCollectionViewCell contentView](v4, "contentView");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "centerXAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v115[1] = v31;
    -[CKEffectSelectionCollectionViewCell shadowView](v4, "shadowView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "widthAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToConstant:", 72.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v115[2] = v34;
    -[CKEffectSelectionCollectionViewCell shadowView](v4, "shadowView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "heightAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToConstant:", 72.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v115[3] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "activateConstraints:", v38);

    v39 = objc_alloc_init(MEMORY[0x1E0CEA658]);
    -[CKEffectSelectionCollectionViewCell setImageView:](v4, "setImageView:", v39);

    -[CKEffectSelectionCollectionViewCell imageView](v4, "imageView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKEffectSelectionCollectionViewCell imageView](v4, "imageView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setCornerRadius:", 12.0);

    -[CKEffectSelectionCollectionViewCell imageView](v4, "imageView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setCornerCurve:", v111);

    -[CKEffectSelectionCollectionViewCell imageView](v4, "imageView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "layer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setMasksToBounds:", 1);

    -[CKEffectSelectionCollectionViewCell contentView](v4, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionCollectionViewCell imageView](v4, "imageView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addSubview:", v48);

    -[CKEffectSelectionCollectionViewCell imageView](v4, "imageView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionCollectionViewCell shadowView](v4, "shadowView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "__ck_makeEdgesEqualTo:", v50);

    v51 = objc_alloc_init(MEMORY[0x1E0CD2840]);
    -[CKEffectSelectionCollectionViewCell setSelectionLayer:](v4, "setSelectionLayer:", v51);

    -[CKEffectSelectionCollectionViewCell selectionLayer](v4, "selectionLayer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setLineWidth:", 4.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v54 = objc_msgSend(v53, "CGColor");
    -[CKEffectSelectionCollectionViewCell selectionLayer](v4, "selectionLayer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setFillColor:", v54);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "theme");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "appTintColor");
    v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v59 = objc_msgSend(v58, "CGColor");
    -[CKEffectSelectionCollectionViewCell selectionLayer](v4, "selectionLayer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setStrokeColor:", v59);

    v61 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[CKEffectSelectionCollectionViewCell setLabel:](v4, "setLabel:", v61);

    -[CKEffectSelectionCollectionViewCell label](v4, "label");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setFont:", v63);

    -[CKEffectSelectionCollectionViewCell label](v4, "label");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKEffectSelectionCollectionViewCell label](v4, "label");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setTextAlignment:", 1);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionCollectionViewCell label](v4, "label");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setTextColor:", v66);

    -[CKEffectSelectionCollectionViewCell label](v4, "label");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setNumberOfLines:", 0);

    -[CKEffectSelectionCollectionViewCell label](v4, "label");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setLineBreakMode:", 0);

    -[CKEffectSelectionCollectionViewCell label](v4, "label");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setAdjustsFontSizeToFitWidth:", 1);

    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 18);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:", v112);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionCollectionViewCell setTitleVibrancyEffect:](v4, "setTitleVibrancyEffect:", v110);
    v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v110);
    objc_msgSend(v71, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v72 = v71;
    objc_msgSend(v71, "contentView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionCollectionViewCell label](v4, "label");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addSubview:", v74);

    -[CKEffectSelectionCollectionViewCell setTitleContainerView:](v4, "setTitleContainerView:", v72);
    -[CKEffectSelectionCollectionViewCell contentView](v4, "contentView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v72;
    objc_msgSend(v75, "addSubview:", v72);

    -[CKEffectSelectionCollectionViewCell label](v4, "label");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "__ck_makeEdgesEqualTo:", v76);

    v90 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectSelectionCollectionViewCell label](v4, "label");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "topAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionCollectionViewCell shadowView](v4, "shadowView");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "bottomAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintEqualToAnchor:constant:", v100, 8.0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v114[0] = v98;
    -[CKEffectSelectionCollectionViewCell label](v4, "label");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "centerXAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionCollectionViewCell contentView](v4, "contentView");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "centerXAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:", v91);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v114[1] = v89;
    -[CKEffectSelectionCollectionViewCell label](v4, "label");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "widthAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionCollectionViewCell contentView](v4, "contentView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "widthAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintLessThanOrEqualToAnchor:multiplier:", v78, 1.0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v114[2] = v79;
    -[CKEffectSelectionCollectionViewCell label](v4, "label");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "bottomAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionCollectionViewCell contentView](v4, "contentView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "bottomAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v114[3] = v84;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 4);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "activateConstraints:", v85);

  }
  return v4;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKEffectSelectionCollectionViewCell;
  -[CKEffectSelectionCollectionViewCell setSelected:](&v9, sel_setSelected_);
  if (v3)
  {
    -[CKEffectSelectionCollectionViewCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionCollectionViewCell selectionLayer](self, "selectionLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", v7);

    -[CKEffectSelectionCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    -[CKEffectSelectionCollectionViewCell layoutIfNeeded](self, "layoutIfNeeded");
  }
  else
  {
    -[CKEffectSelectionCollectionViewCell selectionLayer](self, "selectionLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperlayer");

  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double x;
  double y;
  double width;
  double height;
  id v14;
  uint64_t v15;
  void *v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  v17.receiver = self;
  v17.super_class = (Class)CKEffectSelectionCollectionViewCell;
  -[CKEffectSelectionCollectionViewCell layoutSubviews](&v17, sel_layoutSubviews);
  v3 = (void *)MEMORY[0x1E0CEA390];
  -[CKEffectSelectionCollectionViewCell shadowView](self, "shadowView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "_bezierPathWithPillRect:cornerRadius:");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGPath");
  -[CKEffectSelectionCollectionViewCell shadowView](self, "shadowView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShadowPath:", v6);

  -[CKEffectSelectionCollectionViewCell shadowView](self, "shadowView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v19 = CGRectInset(v18, -2.0, -2.0);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;

  objc_msgSend(MEMORY[0x1E0CEA390], "_bezierPathWithPillRect:cornerRadius:", x, y, width, height, 15.2);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend(v14, "CGPath");
  -[CKEffectSelectionCollectionViewCell selectionLayer](self, "selectionLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPath:", v15);

}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKEffectSelectionCollectionViewCell imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (void)setTitle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC1290];
  v5 = a3;
  objc_msgSend(v4, "defaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  LODWORD(v8) = 1045220557;
  objc_msgSend(v7, "setHyphenationFactor:", v8);
  objc_msgSend(v7, "setAlignment:", 1);
  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  v13 = *MEMORY[0x1E0DC1178];
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v5, v10);

  -[CKEffectSelectionCollectionViewCell label](self, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAttributedText:", v11);

}

- (void)configureForEffectIsDark:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (a3)
  {
    -[CKEffectSelectionCollectionViewCell titleVibrancyEffect](self, "titleVibrancyEffect");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[CKEffectSelectionCollectionViewCell titleContainerView](self, "titleContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEffect:", v6);

  if (v3)
}

- (CAShapeLayer)selectionLayer
{
  return self->_selectionLayer;
}

- (void)setSelectionLayer:(id)a3
{
  objc_storeStrong((id *)&self->_selectionLayer, a3);
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIVisualEffectView)titleContainerView
{
  return self->_titleContainerView;
}

- (void)setTitleContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_titleContainerView, a3);
}

- (UIVibrancyEffect)titleVibrancyEffect
{
  return self->_titleVibrancyEffect;
}

- (void)setTitleVibrancyEffect:(id)a3
{
  objc_storeStrong((id *)&self->_titleVibrancyEffect, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleVibrancyEffect, 0);
  objc_storeStrong((id *)&self->_titleContainerView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_selectionLayer, 0);
}

@end
