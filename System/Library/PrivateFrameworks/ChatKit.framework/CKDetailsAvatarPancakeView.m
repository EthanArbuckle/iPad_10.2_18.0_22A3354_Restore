@implementation CKDetailsAvatarPancakeView

- (CKDetailsAvatarPancakeView)initWithSize:(CGSize)a3 avatarViews:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  CKDetailsAvatarPancakeView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
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
  objc_super v37;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v37.receiver = self;
  v37.super_class = (Class)CKDetailsAvatarPancakeView;
  v10 = -[CKDetailsAvatarPancakeView initWithFrame:](&v37, sel_initWithFrame_, v8, v9, width, height);
  if (v10)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAvatarPancakeView setTopAvatar:](v10, "setTopAvatar:", v11);

    -[CKDetailsAvatarPancakeView topAvatar](v10, "topAvatar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAvatarPancakeView setMiddleAvatar:](v10, "setMiddleAvatar:", v13);

    -[CKDetailsAvatarPancakeView middleAvatar](v10, "middleAvatar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    if ((unint64_t)objc_msgSend(v7, "count") <= 2)
    {
      -[CKDetailsAvatarPancakeView setBottomAvatar:](v10, "setBottomAvatar:", 0);
    }
    else
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsAvatarPancakeView setBottomAvatar:](v10, "setBottomAvatar:", v15);

    }
    -[CKDetailsAvatarPancakeView bottomAvatar](v10, "bottomAvatar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v17 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v18);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCompositingFilter:", v19);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "detailsAvatarCornerRadius");
    v23 = v22;
    objc_msgSend(v17, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCornerRadius:", v23);

    -[CKDetailsAvatarPancakeView createAvatarCutOutView](v10, "createAvatarCutOutView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAvatarPancakeView setTopAvatarCutOutView:](v10, "setTopAvatarCutOutView:", v25);

    -[CKDetailsAvatarPancakeView topAvatarCutOutView](v10, "topAvatarCutOutView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKDetailsAvatarPancakeView bottomAvatar](v10, "bottomAvatar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[CKDetailsAvatarPancakeView createAvatarCutOutView](v10, "createAvatarCutOutView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsAvatarPancakeView setBottomAvatarCutOutView:](v10, "setBottomAvatarCutOutView:", v28);

      -[CKDetailsAvatarPancakeView bottomAvatarCutOutView](v10, "bottomAvatarCutOutView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[CKDetailsAvatarPancakeView bottomAvatar](v10, "bottomAvatar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsAvatarPancakeView addSubview:](v10, "addSubview:", v30);

      -[CKDetailsAvatarPancakeView bottomAvatarCutOutView](v10, "bottomAvatarCutOutView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsAvatarPancakeView bottomAvatar](v10, "bottomAvatar");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsAvatarPancakeView insertSubview:aboveSubview:](v10, "insertSubview:aboveSubview:", v31, v32);

    }
    -[CKDetailsAvatarPancakeView middleAvatar](v10, "middleAvatar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAvatarPancakeView addSubview:](v10, "addSubview:", v33);

    -[CKDetailsAvatarPancakeView topAvatarCutOutView](v10, "topAvatarCutOutView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAvatarPancakeView addSubview:](v10, "addSubview:", v34);

    -[CKDetailsAvatarPancakeView topAvatar](v10, "topAvatar");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAvatarPancakeView addSubview:](v10, "addSubview:", v35);

    -[CKDetailsAvatarPancakeView addConstraints](v10, "addConstraints");
  }

  return v10;
}

- (void)addConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v37;
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
  void *v48;
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
  _QWORD v91[8];
  _QWORD v92[14];

  v92[12] = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailsAvatarDiameter");
  v5 = v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailsAvatarCutoutDiameter");
  v8 = v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "detailsAvatarPancakeViewOverlapOffset");
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsAvatarPancakeView topAvatarCutOutView](self, "topAvatarCutOutView");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "widthAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToConstant:", v8);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v84;
  -[CKDetailsAvatarPancakeView topAvatarCutOutView](self, "topAvatarCutOutView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "heightAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToConstant:", v8);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v92[1] = v78;
  -[CKDetailsAvatarPancakeView topAvatarCutOutView](self, "topAvatarCutOutView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsAvatarPancakeView leadingAnchor](self, "leadingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:constant:", v72, -((v8 - v5) * 0.5));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v92[2] = v70;
  -[CKDetailsAvatarPancakeView topAvatarCutOutView](self, "topAvatarCutOutView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "topAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsAvatarPancakeView topAnchor](self, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v64);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v92[3] = v62;
  -[CKDetailsAvatarPancakeView topAvatar](self, "topAvatar");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "widthAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToConstant:", v5);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v92[4] = v56;
  -[CKDetailsAvatarPancakeView topAvatar](self, "topAvatar");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "heightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToConstant:", v5);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v92[5] = v50;
  -[CKDetailsAvatarPancakeView topAvatar](self, "topAvatar");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsAvatarPancakeView leadingAnchor](self, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v92[6] = v44;
  -[CKDetailsAvatarPancakeView topAvatar](self, "topAvatar");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsAvatarPancakeView topAnchor](self, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, (v8 - v5) * 0.5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v92[7] = v40;
  -[CKDetailsAvatarPancakeView middleAvatar](self, "middleAvatar");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "widthAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToConstant:", v5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v92[8] = v37;
  -[CKDetailsAvatarPancakeView middleAvatar](self, "middleAvatar");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "heightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToConstant:", v5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v92[9] = v34;
  -[CKDetailsAvatarPancakeView middleAvatar](self, "middleAvatar");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsAvatarPancakeView topAvatar](self, "topAvatar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v92[10] = v14;
  -[CKDetailsAvatarPancakeView middleAvatar](self, "middleAvatar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsAvatarPancakeView topAvatar](self, "topAvatar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v92[11] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "addObjectsFromArray:", v20);

  -[CKDetailsAvatarPancakeView bottomAvatar](self, "bottomAvatar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[CKDetailsAvatarPancakeView bottomAvatar](self, "bottomAvatar");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "widthAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToConstant:", v5);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v85;
    -[CKDetailsAvatarPancakeView bottomAvatar](self, "bottomAvatar");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "heightAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToConstant:", v5);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = v79;
    -[CKDetailsAvatarPancakeView bottomAvatar](self, "bottomAvatar");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAvatarPancakeView middleAvatar](self, "middleAvatar");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:constant:", v71, v11);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v91[2] = v69;
    -[CKDetailsAvatarPancakeView bottomAvatar](self, "bottomAvatar");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAvatarPancakeView topAvatar](self, "topAvatar");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v61);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v91[3] = v59;
    -[CKDetailsAvatarPancakeView bottomAvatarCutOutView](self, "bottomAvatarCutOutView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "widthAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToConstant:", v8);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v91[4] = v53;
    -[CKDetailsAvatarPancakeView bottomAvatarCutOutView](self, "bottomAvatarCutOutView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "heightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToConstant:", v8);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v91[5] = v47;
    -[CKDetailsAvatarPancakeView bottomAvatarCutOutView](self, "bottomAvatarCutOutView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "centerXAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAvatarPancakeView middleAvatar](self, "middleAvatar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v91[6] = v26;
    -[CKDetailsAvatarPancakeView bottomAvatarCutOutView](self, "bottomAvatarCutOutView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAvatarPancakeView topAnchor](self, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v91[7] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 8);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "addObjectsFromArray:", v31);

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v90);

}

- (id)createAvatarCutOutView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;

  v2 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompositingFilter:", v4);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailsAvatarCornerRadius");
  v8 = v7;
  objc_msgSend(v2, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", v8);

  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
}

- (CKAvatarView)topAvatar
{
  return self->_topAvatar;
}

- (void)setTopAvatar:(id)a3
{
  objc_storeStrong((id *)&self->_topAvatar, a3);
}

- (CKAvatarView)middleAvatar
{
  return self->_middleAvatar;
}

- (void)setMiddleAvatar:(id)a3
{
  objc_storeStrong((id *)&self->_middleAvatar, a3);
}

- (CKAvatarView)bottomAvatar
{
  return self->_bottomAvatar;
}

- (void)setBottomAvatar:(id)a3
{
  objc_storeStrong((id *)&self->_bottomAvatar, a3);
}

- (UIView)topAvatarCutOutView
{
  return self->_topAvatarCutOutView;
}

- (void)setTopAvatarCutOutView:(id)a3
{
  objc_storeStrong((id *)&self->_topAvatarCutOutView, a3);
}

- (UIView)bottomAvatarCutOutView
{
  return self->_bottomAvatarCutOutView;
}

- (void)setBottomAvatarCutOutView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomAvatarCutOutView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomAvatarCutOutView, 0);
  objc_storeStrong((id *)&self->_topAvatarCutOutView, 0);
  objc_storeStrong((id *)&self->_bottomAvatar, 0);
  objc_storeStrong((id *)&self->_middleAvatar, 0);
  objc_storeStrong((id *)&self->_topAvatar, 0);
}

@end
