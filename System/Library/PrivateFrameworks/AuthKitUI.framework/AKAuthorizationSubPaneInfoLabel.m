@implementation AKAuthorizationSubPaneInfoLabel

- (AKAuthorizationSubPaneInfoLabel)initWithString:(id)a3
{
  UILabel *v4;
  UILabel *infoLabel;
  UILabel *v6;
  AKAuthorizationSubPaneInfoLabel *v7;
  double v8;
  objc_super v10;

  -[AKAuthorizationSubPaneInfoLabel infoLabelWithString:](self, "infoLabelWithString:", a3);
  v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
  infoLabel = self->_infoLabel;
  self->_infoLabel = v4;

  v6 = self->_infoLabel;
  v10.receiver = self;
  v10.super_class = (Class)AKAuthorizationSubPaneInfoLabel;
  v7 = -[AKAuthorizationSubPane initWithView:](&v10, sel_initWithView_, v6);
  if (v7)
  {
    +[AKAuthorizationSubPaneMetrics infoLabelMarginInset](AKAuthorizationSubPaneMetrics, "infoLabelMarginInset");
    v7->_marginInset = v8;
  }
  return v7;
}

- (NSString)string
{
  void *v2;
  void *v3;

  -[AKAuthorizationSubPaneInfoLabel infoLabel](self, "infoLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKAuthorizationSubPaneInfoLabel infoLabel](self, "infoLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setString:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0CEABB0];
    -[AKAuthorizationSubPaneInfoLabel infoLabel](self, "infoLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__AKAuthorizationSubPaneInfoLabel_setString_animated___block_invoke;
    v9[3] = &unk_1E7678D18;
    v9[4] = self;
    v10 = v6;
    objc_msgSend(v7, "transitionWithView:duration:options:animations:completion:", v8, 5242880, v9, 0, 0.25);

  }
  else
  {
    -[AKAuthorizationSubPaneInfoLabel setString:](self, "setString:", v6);
  }

}

void __54__AKAuthorizationSubPaneInfoLabel_setString_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "infoLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v1);

}

- (void)addToStackView:(id)a3 context:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationSubPaneInfoLabel;
  -[AKAuthorizationSubPane addToStackView:context:](&v4, sel_addToStackView_context_, a3, a4);
}

- (void)addToConstraints:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[AKAuthorizationSubPaneInfoLabel infoLabel](self, "infoLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationSubPaneInfoLabel marginInset](self, "marginInset");
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  -[AKAuthorizationSubPaneInfoLabel infoLabel](self, "infoLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationSubPaneInfoLabel marginInset](self, "marginInset");
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, -v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v17);

}

- (AKAuthorizationSubPaneInfoLabel)infoLabelWithString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CEA700];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setTextAlignment:", 1);
  objc_msgSend(v5, "setNumberOfLines:", 0);
  objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 0);
  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v5, "setText:", v4);
  +[AKAuthorizationAppearance messageFont](AKAuthorizationAppearance, "messageFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v7);

  return (AKAuthorizationSubPaneInfoLabel *)v5;
}

- (void)setLabel:(id)a3 toInfoLabelType:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v11 = v5;
  switch(a4)
  {
    case 0uLL:
      +[AKAuthorizationAppearance messageFont](AKAuthorizationAppearance, "messageFont");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      +[AKAuthorizationAppearance titleFont](AKAuthorizationAppearance, "titleFont");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      +[AKAuthorizationAppearance scopeSubtitleTextColor](AKAuthorizationAppearance, "scopeSubtitleTextColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setColor:", v7);

      +[AKAuthorizationAppearance scopeSubtitleFont](AKAuthorizationAppearance, "scopeSubtitleFont");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      +[AKAuthorizationAppearance smallTitleTextColor](AKAuthorizationAppearance, "smallTitleTextColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setColor:", v8);

      +[AKAuthorizationAppearance smallTitleFont](AKAuthorizationAppearance, "smallTitleFont");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4uLL:
      +[AKAuthorizationAppearance captionTextColor](AKAuthorizationAppearance, "captionTextColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setColor:", v9);

      +[AKAuthorizationAppearance captionFont](AKAuthorizationAppearance, "captionFont");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v10 = (void *)v6;
      objc_msgSend(v11, "setFont:", v6);

      v5 = v11;
      break;
    default:
      break;
  }

}

- (void)setInfoLabelType:(unint64_t)a3
{
  id v5;

  if (-[AKAuthorizationSubPaneInfoLabel internalInfoLabelType](self, "internalInfoLabelType") != a3)
  {
    -[AKAuthorizationSubPaneInfoLabel setInternalInfoLabelType:](self, "setInternalInfoLabelType:", a3);
    -[AKAuthorizationSubPaneInfoLabel infoLabel](self, "infoLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationSubPaneInfoLabel setLabel:toInfoLabelType:](self, "setLabel:toInfoLabelType:", v5, a3);

  }
}

- (void)setLabelColor:(id)a3
{
  -[UILabel setColor:](self->_infoLabel, "setColor:", a3);
}

- (double)marginInset
{
  return self->_marginInset;
}

- (void)setMarginInset:(double)a3
{
  self->_marginInset = a3;
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (unint64_t)internalInfoLabelType
{
  return self->_internalInfoLabelType;
}

- (void)setInternalInfoLabelType:(unint64_t)a3
{
  self->_internalInfoLabelType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoLabel, 0);
}

@end
