@implementation AMUIPhotosLabelView

- (AMUIPhotosLabelView)initWithSymbolName:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  AMUIPhotosLabelView *v8;
  uint64_t v9;
  AMUIPosterSwitcherSettings *settings;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
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
  id v54;
  void *v55;
  void *v56;
  id v57;
  objc_super v58;
  void *v59;
  _QWORD v60[12];

  v60[10] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v58.receiver = self;
  v58.super_class = (Class)AMUIPhotosLabelView;
  v8 = -[AMUIPhotosLabelView init](&v58, sel_init);
  if (v8)
  {
    +[AMUIPosterSwitcherDomain rootSettings](AMUIPosterSwitcherDomain, "rootSettings");
    v9 = objc_claimAutoreleasedReturnValue();
    settings = v8->_settings;
    v8->_settings = (AMUIPosterSwitcherSettings *)v9;

    -[PTSettings addKeyObserver:](v8->_settings, "addKeyObserver:", v8);
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:design:", *MEMORY[0x24BDF7760], 42.0, *MEMORY[0x24BDF7868]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v11, "setFont:", v56);
    v55 = v11;
    objc_msgSend(v11, "setText:", v7);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v12);

    -[AMUIPhotosLabelView addSubview:](v8, "addSubview:", v11);
    objc_storeStrong((id *)&v8->_titleLabel, v11);
    v13 = objc_alloc(MEMORY[0x24BDF6FC8]);
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithEffect:", v14);

    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v15, "_setCornerRadius:", 37.0);
    objc_msgSend(v15, "setOverrideUserInterfaceStyle:", 1);
    -[AMUIPhotosLabelView addSubview:](v8, "addSubview:", v15);
    v54 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
    objc_msgSend(v54, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v15, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v54);

    objc_storeStrong((id *)&v8->_symbolImageView, v54);
    -[AMUIPhotosLabelView setSymbolName:](v8, "setSymbolName:", v6);
    v41 = (void *)MEMORY[0x24BDD1628];
    -[AMUIPhotosLabelView leadingAnchor](v8, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v51;
    -[AMUIPhotosLabelView trailingAnchor](v8, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v8->_titleLabel, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v48;
    -[AMUIPhotosLabelView topAnchor](v8, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v60[2] = v45;
    -[AMUIPhotosLabelView bottomAnchor](v8, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v60[3] = v42;
    objc_msgSend(v15, "widthAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToConstant:", 74.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v60[4] = v39;
    objc_msgSend(v15, "heightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "widthAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v60[5] = v36;
    -[UIImageView centerXAnchor](v8->_symbolImageView, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerXAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v60[6] = v33;
    -[UIImageView centerYAnchor](v8->_symbolImageView, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v60[7] = v30;
    -[UIImageView firstBaselineAnchor](v8->_symbolImageView, "firstBaselineAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v8->_titleLabel, "firstBaselineAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v60[8] = v19;
    -[UILabel leadingAnchor](v8->_titleLabel, "leadingAnchor");
    v57 = v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 12.0);
    v22 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v60[9] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v24);

    v6 = v22;
    v7 = v57;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v8, sel__noteWindowWillRotate_, *MEMORY[0x24BDF8030], 0);

    objc_opt_self();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)-[AMUIPhotosLabelView registerForTraitChanges:withAction:](v8, "registerForTraitChanges:withAction:", v27, sel__updateForAmbientDisplayStyle);

    -[AMUIPhotosLabelView _updateForAmbientDisplayStyleAnimated:](v8, "_updateForAmbientDisplayStyleAnimated:", 0);
  }

  return v8;
}

- (void)setSymbolName:(id)a3
{
  NSString *v4;
  NSString *symbolName;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v9, "copy");
    symbolName = self->_symbolName;
    self->_symbolName = v4;

    v6 = (void *)MEMORY[0x24BDF6AC8];
    -[AMUIPhotosLabelView _symbolImageConfiguration](self, "_symbolImageConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemImageNamed:withConfiguration:", v9, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView setImage:](self->_symbolImageView, "setImage:", v8);
  }

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (double)preferredLeadingMargin
{
  return 32.0;
}

- (double)preferredTopMargin
{
  return 28.0;
}

- (double)preferredBottomMargin
{
  return 28.0;
}

- (id)viewForLastBaselineLayout
{
  return self->_titleLabel;
}

- (void)willMoveToWindow:(id)a3
{
  if (a3)
    -[AMUIPhotosLabelView _updateForWindow:](self, "_updateForWindow:");
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;

  -[AMUIPhotosLabelView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[AMUIPhotosLabelView _updateForWindow:](self, "_updateForWindow:", v3);
    v3 = v4;
  }

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("photoSymbolHugsEdge")))
  {
    -[AMUIPhotosLabelView window](self, "window");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AMUIPhotosLabelView _updateForWindow:](self, "_updateForWindow:", v5);

  }
}

- (id)_symbolImageConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:scale:", 7, 1, 42.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDF6AE0];
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithHierarchicalColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationByApplyingConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_noteWindowWillRotate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIPhotosLabelView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    objc_msgSend(v13, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDF8018]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    v9 = v7;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    v12 = objc_msgSend(v11, "integerValue");
    -[AMUIPhotosLabelView _updateForInterfaceOrientation:](self, "_updateForInterfaceOrientation:", v12);
  }

}

- (void)_updateForWindow:(id)a3
{
  -[AMUIPhotosLabelView _updateForInterfaceOrientation:](self, "_updateForInterfaceOrientation:", objc_msgSend(a3, "_windowInterfaceOrientation"));
}

- (void)_updateForInterfaceOrientation:(int64_t)a3
{
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;

  v5 = -[AMUIPosterSwitcherSettings photoSymbolHugsEdge](self->_settings, "photoSymbolHugsEdge");
  v6 = 3;
  if (a3 != 4)
    v6 = 0;
  if (a3 == 3)
    v6 = 4;
  if (v5)
    v7 = v6;
  else
    v7 = 0;
  -[AMUIPhotosLabelView setSemanticContentAttribute:](self, "setSemanticContentAttribute:", v7);
}

- (void)_updateForAmbientDisplayStyle
{
  -[AMUIPhotosLabelView _updateForAmbientDisplayStyleAnimated:](self, "_updateForAmbientDisplayStyleAnimated:", 1);
}

- (void)_updateForAmbientDisplayStyleAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int IsRedMode;

  v3 = a3;
  -[AMUIPhotosLabelView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForNSIntegerTrait:", v6);
  IsRedMode = AMUIAmbientDisplayStyleIsRedMode();

  if (IsRedMode)
    -[AMUIPhotosLabelView amui_applyRedModeFilterAnimated:withCompletion:](self, "amui_applyRedModeFilterAnimated:withCompletion:", v3, 0);
  else
    -[AMUIPhotosLabelView amui_clearRedModeFilterAnimated:withCompletion:](self, "amui_clearRedModeFilterAnimated:withCompletion:", v3, 0);
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_symbolImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
