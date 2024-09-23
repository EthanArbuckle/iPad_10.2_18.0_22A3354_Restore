@implementation HUChevronButton

- (HUChevronButton)initWithFrame:(CGRect)a3
{
  HUChevronButton *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
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
  double v23;
  void *v24;
  void *v25;
  id v26;
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
  objc_super v58;
  _QWORD v59[3];

  v59[2] = *MEMORY[0x1E0C80C00];
  v58.receiver = self;
  v58.super_class = (Class)HUChevronButton;
  v3 = -[HUChevronButton initWithFrame:](&v58, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    -[HUChevronButton setTitleLabel:](v3, "setTitleLabel:", v9);

    -[HUChevronButton titleLabel](v3, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserInteractionEnabled:", 0);

    -[HUChevronButton titleLabel](v3, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setTextColorFollowsTintColor:", 1);

    -[HUChevronButton titleLabel](v3, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 1);

    -[HUChevronButton titleLabel](v3, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMinimumScaleFactor:", 0.7);

    -[HUChevronButton titleLabel](v3, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBaselineAdjustment:", 1);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUChevronButton titleLabel](v3, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTintColor:", v15);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v5, v6, v7, v8);
    -[HUChevronButton setChevronImageView:](v3, "setChevronImageView:", v17);

    -[HUChevronButton chevronImageView](v3, "chevronImageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setUserInteractionEnabled:", 0);

    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("edit-chevron"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageWithRenderingMode:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUChevronButton chevronImageView](v3, "chevronImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setImage:", v20);

    -[HUChevronButton chevronImageView](v3, "chevronImageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = 1144766464;
    objc_msgSend(v22, "setContentCompressionResistancePriority:forAxis:", 0, v23);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUChevronButton chevronImageView](v3, "chevronImageView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTintColor:", v24);

    v26 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    -[HUChevronButton titleLabel](v3, "titleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v27;
    -[HUChevronButton chevronImageView](v3, "chevronImageView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v26, "initWithArrangedSubviews:", v29);
    -[HUChevronButton setContainerView:](v3, "setContainerView:", v30);

    -[HUChevronButton containerView](v3, "containerView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setUserInteractionEnabled:", 0);

    -[HUChevronButton containerView](v3, "containerView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUChevronButton containerView](v3, "containerView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAlignment:", 3);

    -[HUChevronButton containerView](v3, "containerView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setSpacing:", 4.0);

    -[HUChevronButton containerView](v3, "containerView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUChevronButton addSubview:](v3, "addSubview:", v35);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUChevronButton containerView](v3, "containerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUChevronButton topAnchor](v3, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, 6.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObject:", v40);

    -[HUChevronButton containerView](v3, "containerView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUChevronButton bottomAnchor](v3, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, -6.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObject:", v44);

    -[HUChevronButton containerView](v3, "containerView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "centerXAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUChevronButton centerXAnchor](v3, "centerXAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObject:", v48);

    -[HUChevronButton containerView](v3, "containerView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUChevronButton leadingAnchor](v3, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObject:", v52);

    -[HUChevronButton containerView](v3, "containerView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUChevronButton trailingAnchor](v3, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintLessThanOrEqualToAnchor:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObject:", v56);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v36);
  }
  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUChevronButton;
  -[HUChevronButton setHighlighted:](&v10, sel_setHighlighted_);
  if (a3)
    -[HUChevronButton tintColor](self, "tintColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEABB0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__HUChevronButton_setHighlighted___block_invoke;
  v8[3] = &unk_1E6F4C638;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "animateWithDuration:animations:", v8, 0.25);

}

void __34__HUChevronButton_setHighlighted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v2);

  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "chevronImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIStackView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
