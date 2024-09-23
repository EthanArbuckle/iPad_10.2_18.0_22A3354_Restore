@implementation HUGridCircularButtonView

- (HUGridCircularButtonView)initWithImage:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  HUGridCircularButtonView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HUGridCircularButtonView *v16;
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
  id v32;
  id v33;
  void *v34;
  void *v35;
  double v36;
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
  HUGridCircularButtonView *v66;
  _QWORD v67[4];
  HUGridCircularButtonView *v68;
  objc_super v69;
  _QWORD v70[9];

  v70[7] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v69.receiver = self;
  v69.super_class = (Class)HUGridCircularButtonView;
  v8 = -[HUGridCircularButtonView initWithFrame:](&v69, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA370], "clearConfiguration");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorWithAlphaComponent:", 0.2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setBackgroundColor:", v11);

    objc_msgSend(v65, "setCornerRadius:", 30.0);
    v12 = v9;
    objc_msgSend(v9, "setBackground:", v65);
    objc_msgSend(v9, "setCornerStyle:", -1);
    objc_msgSend(v9, "setButtonSize:", 3);
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 18.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPreferredSymbolConfigurationForImage:", v13);

    objc_msgSend(v9, "setImage:", v6);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v9;
    objc_msgSend(v9, "setBaseForegroundColor:", v14);

    v15 = (void *)MEMORY[0x1E0CEA2A8];
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __48__HUGridCircularButtonView_initWithImage_title___block_invoke;
    v67[3] = &unk_1E6F4E328;
    v16 = v8;
    v68 = v16;
    objc_msgSend(v15, "actionWithHandler:", v67);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithConfiguration:primaryAction:", v12, v63);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCircularButtonView setButton:](v16, "setButton:", v17);

    -[HUGridCircularButtonView button](v16, "button");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUGridCircularButtonView button](v16, "button");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCircularButtonView addSubview:](v16, "addSubview:", v19);

    objc_msgSend(MEMORY[0x1E0CEA718], "plainFooterConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "textProperties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setColor:", v21);

    v62 = v20;
    objc_msgSend(v20, "setText:", v7);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA720]), "initWithConfiguration:", v20);
    -[HUGridCircularButtonView setLabel:](v16, "setLabel:", v23);

    -[HUGridCircularButtonView label](v16, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUGridCircularButtonView label](v16, "label");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCircularButtonView addSubview:](v16, "addSubview:", v25);

    v49 = (void *)MEMORY[0x1E0CB3718];
    -[HUGridCircularButtonView button](v16, "button");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCircularButtonView topAnchor](v16, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v58;
    -[HUGridCircularButtonView button](v16, "button");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "heightAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToConstant:", 60.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = v55;
    -[HUGridCircularButtonView button](v16, "button");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "widthAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToConstant:", 60.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v70[2] = v52;
    -[HUGridCircularButtonView button](v16, "button");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "centerXAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCircularButtonView centerXAnchor](v16, "centerXAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v70[3] = v47;
    -[HUGridCircularButtonView label](v16, "label");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "textLayoutGuide");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCircularButtonView button](v16, "button");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 8.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v70[4] = v41;
    -[HUGridCircularButtonView label](v16, "label");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "textLayoutGuide");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "centerXAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCircularButtonView centerXAnchor](v16, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v70[5] = v27;
    -[HUGridCircularButtonView label](v16, "label");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bottomAnchor");
    v66 = v8;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCircularButtonView bottomAnchor](v16, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v70[6] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 7);
    v32 = v7;
    v33 = v6;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "activateConstraints:", v34);

    v6 = v33;
    v7 = v32;

    v8 = v66;
    -[HUGridCircularButtonView button](v16, "button");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v36) = 1132134400;
    objc_msgSend(v35, "setContentHuggingPriority:forAxis:", 1, v36);

  }
  return v8;
}

void __48__HUGridCircularButtonView_initWithImage_title___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "button");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buttonView:buttonWasTapped:", v4, v5);

  }
}

- (HUGridCircularButtonView)initWithFrame:(CGRect)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithImage_title_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUGridCircularButtonView.m"), 79, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUGridCircularButtonView initWithFrame:]",
    v6);

  return 0;
}

- (HUGridCircularButtonView)initWithCoder:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithImage_title_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUGridCircularButtonView.m"), 84, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUGridCircularButtonView initWithCoder:]",
    v6);

  return 0;
}

- (UIImage)buttonImage
{
  return self->_buttonImage;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (NSString)title
{
  return self->_title;
}

- (HUGridCircularButtonViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (HUGridCircularButtonViewDelegate *)a3;
}

- (UIListContentView)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_buttonImage, 0);
}

@end
