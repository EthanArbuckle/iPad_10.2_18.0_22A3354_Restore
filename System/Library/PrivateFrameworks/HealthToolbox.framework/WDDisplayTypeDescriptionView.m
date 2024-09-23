@implementation WDDisplayTypeDescriptionView

- (WDDisplayTypeDescriptionView)initWithDisplayType:(id)a3 showAttributionText:(BOOL)a4 style:(unint64_t)a5
{
  id v9;
  WDDisplayTypeDescriptionView *v10;
  WDDisplayTypeDescriptionView *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WDDisplayTypeDescriptionView;
  v10 = -[WDDisplayTypeDescriptionView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_displayType, a3);
    v11->_showAttributionText = a4;
    v11->_style = a5;
    -[WDDisplayTypeDescriptionView _setupUI](v11, "_setupUI");
  }

  return v11;
}

- (WDDisplayTypeDescriptionView)initWithFrame:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The -%@ method is not available on %@"), v6, objc_opt_class());

  return 0;
}

- (WDDisplayTypeDescriptionView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDDisplayTypeDescriptionView;
  return -[WDDisplayTypeDescriptionView initWithCoder:](&v4, sel_initWithCoder_, a3);
}

+ (double)minimumHeightForStyle:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  double v16;
  void *v17;
  float v18;
  double v19;
  void *v20;
  float v21;

  objc_msgSend(a1, "_metricsForStyle:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0.0;
  if (a3)
  {
    if (a3 != 1)
      goto LABEL_8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("T"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v6 = v8 + 0.0;

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("D"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("M"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  v14 = v13 + v13;

  if (v11 >= v14)
    v15 = v11;
  else
    v15 = v14;
  v16 = v6 + v15;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("A"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v19 = v16 + (float)(v18 + v18);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("M"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  v6 = v19 + v21;

LABEL_8:
  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDDisplayTypeDescriptionView;
  -[WDDisplayTypeDescriptionView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[WDDisplayTypeDescriptionView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      -[WDDisplayTypeDescriptionView _updateFont](self, "_updateFont");
      -[WDDisplayTypeDescriptionView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)_updateFont
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend((id)objc_opt_class(), "_descriptionHeadingFontForStyle:", self->_style);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_descriptionHeadingLabel, "setFont:", v3);

  objc_msgSend((id)objc_opt_class(), "_descriptionTextFontForStyle:", self->_style);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_descriptionLabel, "setFont:", v4);

  objc_msgSend((id)objc_opt_class(), "_attributionTextFontForStyle:", self->_style);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](self->_attributionTextView, "setFont:", v5);

  objc_msgSend((id)objc_opt_class(), "_cautionaryTextFontForStyle:", self->_style);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_cautionaryLabel, "setFont:", v6);

}

- (void)_setupUI
{
  id v3;
  UILabel *v4;
  UILabel *descriptionHeadingLabel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  UILabel *v14;
  UILabel *descriptionLabel;
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
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  UITextView *v44;
  UITextView *attributionTextView;
  void *v46;
  void *v47;
  uint64_t v48;
  UILabel *v49;
  UILabel *cautionaryLabel;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;

  objc_msgSend((id)objc_opt_class(), "_metricsForStyle:", self->_style);
  v57 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (self->_style == 1)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    descriptionHeadingLabel = self->_descriptionHeadingLabel;
    self->_descriptionHeadingLabel = v4;

    WDBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DESCRIPTION_HEADING"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_descriptionHeadingLabel, "setText:", v7);

    objc_msgSend((id)objc_opt_class(), "_descriptionHeadingColorForStyle:", self->_style);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_descriptionHeadingLabel, "setTextColor:", v8);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionHeadingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_descriptionHeadingLabel, "setBackgroundColor:", v9);

    -[WDDisplayTypeDescriptionView addSubview:](self, "addSubview:", self->_descriptionHeadingLabel);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_descriptionHeadingLabel, CFSTR("_descriptionHeadingLabel"));
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_descriptionHeadingLabel]|"), 0, 0, v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDisplayTypeDescriptionView addConstraints:](self, "addConstraints:", v10);

  }
  -[HKDisplayType localization](self->_displayType, "localization");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "summaryForPairedWatch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
    v13 = objc_msgSend(MEMORY[0x24BDD4198], "hasPairedWatch");
  else
    v13 = 0;

  v14 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v14;

  -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 0);
  objc_msgSend((id)objc_opt_class(), "_descriptionTextColorForStyle:", self->_style);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_descriptionLabel, "setTextColor:", v16);

  -[HKDisplayType localization](self->_displayType, "localization");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if ((v13 & 1) != 0)
    objc_msgSend(v17, "summaryForPairedWatch");
  else
    objc_msgSend(v17, "summary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_descriptionLabel, "setText:", v19);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_descriptionLabel, "setBackgroundColor:", v20);

  -[WDDisplayTypeDescriptionView addSubview:](self, "addSubview:", self->_descriptionLabel);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_descriptionLabel, CFSTR("_descriptionLabel"));
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_descriptionLabel]|"), 0, 0, v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDisplayTypeDescriptionView addConstraints:](self, "addConstraints:", v21);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("V:|"));
  v23 = v22;
  if (self->_style == 1)
    objc_msgSend(v22, "appendString:", CFSTR("-T-[_descriptionHeadingLabel]"));
  -[HKDisplayType detailImage](self->_displayType, "detailImage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "size");
    v28 = v27 / v26;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v25);
    objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WDDisplayTypeDescriptionView addSubview:](self, "addSubview:", v29);
    objc_msgSend(v3, "setValue:forKey:", v29, CFSTR("imageView"));
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-P-[imageView]-P-|"), 0, v57, v3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDisplayTypeDescriptionView addConstraints:](self, "addConstraints:", v30);

    objc_msgSend(v23, "appendString:", CFSTR("-M-[imageView]-M-[_descriptionLabel]"));
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 8, 0, v29, 7, v28, 0.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = 1144750080;
    objc_msgSend(v31, "setPriority:", v32);
    objc_msgSend(v29, "addConstraint:", v31);

  }
  else
  {
    objc_msgSend(v23, "appendString:", CFSTR("-M-[_descriptionLabel]"));
  }
  -[HKDisplayType presentation](self->_displayType, "presentation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "summaryAttribution");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "attribution");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "length"))
  {
    v36 = -[WDDisplayTypeDescriptionView showAttributionText](self, "showAttributionText");

    if (!v36)
      goto LABEL_19;
    v37 = objc_alloc(MEMORY[0x24BE4A2B8]);
    -[HKDisplayType presentation](self->_displayType, "presentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "summaryAttribution");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "attribution");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayType presentation](self->_displayType, "presentation");
    v56 = v25;
    v41 = v3;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "summaryAttribution");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (UITextView *)objc_msgSend(v37, "initWithAttributedText:selectable:", v40, objc_msgSend(v43, "hasLink"));
    attributionTextView = self->_attributionTextView;
    self->_attributionTextView = v44;

    v3 = v41;
    v25 = v56;

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_attributionTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextView setDelegate:](self->_attributionTextView, "setDelegate:", self);
    -[WDDisplayTypeDescriptionView addSubview:](self, "addSubview:", self->_attributionTextView);
    objc_msgSend(v23, "appendString:", CFSTR("-A-[_attributionTextView]"));
    objc_msgSend(v3, "setValue:forKey:", self->_attributionTextView, CFSTR("_attributionTextView"));
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_attributionTextView]|"), 0, v57, v3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDisplayTypeDescriptionView addConstraints:](self, "addConstraints:", v33);
  }
  else
  {

  }
LABEL_19:
  -[HKDisplayType localization](self->_displayType, "localization");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "cautionaryText");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "length");

  if (v48)
  {
    v49 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    cautionaryLabel = self->_cautionaryLabel;
    self->_cautionaryLabel = v49;

    -[UILabel setNumberOfLines:](self->_cautionaryLabel, "setNumberOfLines:", 0);
    -[HKDisplayType localization](self->_displayType, "localization");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "cautionaryText");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_cautionaryLabel, "setText:", v52);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_cautionaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_cautionaryLabel, "setBackgroundColor:", v53);

    -[WDDisplayTypeDescriptionView addSubview:](self, "addSubview:", self->_cautionaryLabel);
    objc_msgSend(v23, "appendString:", CFSTR("-A-[_cautionaryLabel]-M-|"));
    objc_msgSend(v3, "setValue:forKey:", self->_cautionaryLabel, CFSTR("_cautionaryLabel"));
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_cautionaryLabel]|"), 0, v57, v3);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDisplayTypeDescriptionView addConstraints:](self, "addConstraints:", v54);

  }
  else
  {
    objc_msgSend(v23, "appendString:", CFSTR("-M-|"));
  }
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", v23, 0, v57, v3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDisplayTypeDescriptionView addConstraints:](self, "addConstraints:", v55);

  -[WDDisplayTypeDescriptionView _updateFont](self, "_updateFont");
}

+ (id)_metricsForStyle:(unint64_t)a3
{
  if (a3)
    return &unk_24D3A6468;
  else
    return &unk_24D3A6440;
}

+ (id)_descriptionHeadingFontForStyle:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v4, "symbolicTraits") | 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_descriptionHeadingColorForStyle:(unint64_t)a3
{
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)_descriptionTextFontForStyle:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  if (!a3)
  {
    v5 = (_QWORD *)MEMORY[0x24BDF77B0];
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v5 = (_QWORD *)MEMORY[0x24BDF77D0];
LABEL_5:
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *v5, v3, v4);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)_descriptionTextColorForStyle:(unint64_t)a3
{
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)_attributionTextFontForStyle:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
}

+ (id)_cautionaryTextFontForStyle:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77C8]);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  void *v8;
  int v9;
  void *v10;

  v7 = a4;
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("bridge"));

  if (!a6 && v9)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openSensitiveURL:withOptions:", v7, 0);

  }
  return v9 ^ 1;
}

- (BOOL)showAttributionText
{
  return self->_showAttributionText;
}

- (void)setShowAttributionText:(BOOL)a3
{
  self->_showAttributionText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cautionaryLabel, 0);
  objc_storeStrong((id *)&self->_attributionTextView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_descriptionHeadingLabel, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
}

@end
