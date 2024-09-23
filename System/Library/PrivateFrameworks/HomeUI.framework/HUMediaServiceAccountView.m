@implementation HUMediaServiceAccountView

- (HUMediaServiceAccountView)initWithFrame:(CGRect)a3
{
  HUMediaServiceAccountView *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
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
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)HUMediaServiceAccountView;
  v3 = -[HUMediaServiceAccountView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[HUMediaServiceAccountView setIconView:](v3, "setIconView:", v4);

    -[HUMediaServiceAccountView iconView](v3, "iconView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUMediaServiceAccountView iconView](v3, "iconView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 1148846080;
    objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 1, v7);

    -[HUMediaServiceAccountView iconView](v3, "iconView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1148846080;
    objc_msgSend(v8, "setContentHuggingPriority:forAxis:", 0, v9);

    -[HUMediaServiceAccountView iconView](v3, "iconView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", 15.0);

    -[HUMediaServiceAccountView iconView](v3, "iconView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClipsToBounds:", 1);

    -[HUMediaServiceAccountView iconView](v3, "iconView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaServiceAccountView addSubview:](v3, "addSubview:", v13);

    v14 = (void *)objc_opt_new();
    -[HUMediaServiceAccountView setServiceNameLabel:](v3, "setServiceNameLabel:", v14);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 16.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaServiceAccountView serviceNameLabel](v3, "serviceNameLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v15);

    -[HUMediaServiceAccountView serviceNameLabel](v3, "serviceNameLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v18 = (void *)objc_opt_new();
    -[HUMediaServiceAccountView setAccountHandleLabel:](v3, "setAccountHandleLabel:", v18);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 12.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaServiceAccountView accountHandleLabel](v3, "accountHandleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v19);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaServiceAccountView accountHandleLabel](v3, "accountHandleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTextColor:", v21);

    -[HUMediaServiceAccountView accountHandleLabel](v3, "accountHandleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v24 = (void *)objc_opt_new();
    -[HUMediaServiceAccountView setLabelStackView:](v3, "setLabelStackView:", v24);

    -[HUMediaServiceAccountView labelStackView](v3, "labelStackView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAxis:", 1);

    -[HUMediaServiceAccountView labelStackView](v3, "labelStackView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAlignment:", 1);

    -[HUMediaServiceAccountView labelStackView](v3, "labelStackView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSpacing:", 4.0);

    -[HUMediaServiceAccountView labelStackView](v3, "labelStackView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUMediaServiceAccountView labelStackView](v3, "labelStackView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaServiceAccountView serviceNameLabel](v3, "serviceNameLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addArrangedSubview:", v30);

    -[HUMediaServiceAccountView labelStackView](v3, "labelStackView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaServiceAccountView accountHandleLabel](v3, "accountHandleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addArrangedSubview:", v32);

    -[HUMediaServiceAccountView labelStackView](v3, "labelStackView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaServiceAccountView addSubview:](v3, "addSubview:", v33);

    -[HUMediaServiceAccountView setNeedsUpdateConstraints](v3, "setNeedsUpdateConstraints");
  }
  return v3;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  objc_super v36;

  v3 = (void *)objc_opt_new();
  -[HUMediaServiceAccountView iconView](self, "iconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceAccountView topAnchor](self, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  -[HUMediaServiceAccountView iconView](self, "iconView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceAccountView leadingAnchor](self, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 8.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  -[HUMediaServiceAccountView iconView](self, "iconView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceAccountView centerYAnchor](self, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  -[HUMediaServiceAccountView iconView](self, "iconView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToConstant:", 56.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  -[HUMediaServiceAccountView iconView](self, "iconView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToConstant:", 56.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  -[HUMediaServiceAccountView labelStackView](self, "labelStackView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceAccountView iconView](self, "iconView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v26);

  -[HUMediaServiceAccountView labelStackView](self, "labelStackView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceAccountView iconView](self, "iconView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, 15.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v31);

  v32 = (void *)MEMORY[0x1E0CB3718];
  -[HUMediaServiceAccountView currentConstraints](self, "currentConstraints");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "deactivateConstraints:", v33);

  -[HUMediaServiceAccountView setCurrentConstraints:](self, "setCurrentConstraints:", v3);
  v34 = (void *)MEMORY[0x1E0CB3718];
  -[HUMediaServiceAccountView currentConstraints](self, "currentConstraints");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "activateConstraints:", v35);

  v36.receiver = self;
  v36.super_class = (Class)HUMediaServiceAccountView;
  -[HUMediaServiceAccountView updateConstraints](&v36, sel_updateConstraints);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = objc_opt_class();
  -[HUMediaServiceAccountView item](self, "item");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  v8 = v5;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v4, objc_opt_class());

LABEL_7:
    v8 = 0;
  }
  v17 = v8;

  objc_msgSend(v17, "mediaService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serviceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceAccountView serviceNameLabel](self, "serviceNameLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  objc_msgSend(v17, "mediaService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accountName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceAccountView accountHandleLabel](self, "accountHandleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  -[HUMediaServiceAccountView _loadServiceIconImage](self, "_loadServiceIconImage");
  -[HUMediaServiceAccountView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)_loadServiceIconImage
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  if (!-[HUMediaServiceAccountView iconImageLoadingInProgress](self, "iconImageLoadingInProgress"))
  {
    -[HUMediaServiceAccountView setIconImageLoadingInProgress:](self, "setIconImageLoadingInProgress:", 1);
    v3 = objc_opt_class();
    -[HUMediaServiceAccountView item](self, "item");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
      v6 = v4;
      if (v5)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

    }
    v6 = 0;
LABEL_9:

    objc_msgSend(v6, "mediaService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconImageURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "hf_fetchImageFromURL:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__HUMediaServiceAccountView__loadServiceIconImage__block_invoke;
    v13[3] = &unk_1E6F54DA0;
    v13[4] = self;
    v12 = (id)objc_msgSend(v11, "addCompletionBlock:", v13);

  }
}

void __50__HUMediaServiceAccountView__loadServiceIconImage__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
  {
    HUIconImageNamed();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "iconView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "iconView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "setIconImageLoadingInProgress:", 0);
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UILabel)serviceNameLabel
{
  return self->_serviceNameLabel;
}

- (void)setServiceNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_serviceNameLabel, a3);
}

- (UILabel)accountHandleLabel
{
  return self->_accountHandleLabel;
}

- (void)setAccountHandleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_accountHandleLabel, a3);
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelStackView, a3);
}

- (BOOL)iconImageLoadingInProgress
{
  return self->_iconImageLoadingInProgress;
}

- (void)setIconImageLoadingInProgress:(BOOL)a3
{
  self->_iconImageLoadingInProgress = a3;
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setCurrentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_currentConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_accountHandleLabel, 0);
  objc_storeStrong((id *)&self->_serviceNameLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
