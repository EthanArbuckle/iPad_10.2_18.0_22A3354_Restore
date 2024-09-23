@implementation ASCredentialRequestInfoLabelSubPane

- (ASCredentialRequestInfoLabelSubPane)initWithString:(id)a3 labelStyle:(int64_t)a4
{
  id v6;
  void *v7;
  ASCredentialRequestInfoLabelSubPane *v8;
  ASCredentialRequestInfoLabelSubPane *v9;
  double v10;
  ASCredentialRequestInfoLabelSubPane *v11;
  objc_super v13;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_infoLabelWithString:labelStyle:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)ASCredentialRequestInfoLabelSubPane;
  v8 = -[ASCredentialRequestSubPane initWithView:](&v13, sel_initWithView_, v7);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_infoLabel, v7);
    objc_msgSend((id)objc_opt_class(), "_infoLabelMarginInset");
    v9->_marginInset = v10;
    v11 = v9;
  }

  return v9;
}

- (ASCredentialRequestInfoLabelSubPane)initWithString:(id)a3 labelType:(unint64_t)a4
{
  return -[ASCredentialRequestInfoLabelSubPane initWithString:labelStyle:](self, "initWithString:labelStyle:", a3, a4 != 1);
}

+ (id)_infoLabelWithString:(id)a3 labelStyle:(int64_t)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x24BEBD708];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(a1, "_fontForLabelStyle:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v9);

  objc_msgSend(a1, "_textColorForLabelStyle:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v10);

  objc_msgSend(v8, "setTextAlignment:", 1);
  objc_msgSend(v8, "setNumberOfLines:", 0);
  objc_msgSend(v8, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v11);

  objc_msgSend(v8, "setText:", v7);
  objc_msgSend(v8, "setMaximumContentSizeCategory:", *MEMORY[0x24BEBE068]);
  return v8;
}

+ (id)_fontForLabelStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 0:
      +[ASViewServiceInterfaceUtilities headerTitleFont](ASViewServiceInterfaceUtilities, "headerTitleFont", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      +[ASViewServiceInterfaceUtilities headerMessageFont](ASViewServiceInterfaceUtilities, "headerMessageFont", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(a1, "_boldTitleFont", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(a1, "_bodyFont", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

+ (id)_textColorForLabelStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 0:
      +[ASViewServiceInterfaceUtilities headerTitleColor](ASViewServiceInterfaceUtilities, "headerTitleColor", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      +[ASViewServiceInterfaceUtilities headerMessageColor](ASViewServiceInterfaceUtilities, "headerMessageColor", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(a1, "_boldTitleTextColor", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(a1, "_bodyTextColor", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

+ (double)_infoLabelMarginInset
{
  int v2;
  double result;

  v2 = objc_msgSend(MEMORY[0x24BE0B290], "isPad");
  result = 50.0;
  if (!v2)
    return 16.0;
  return result;
}

- (void)addToStackView:(id)a3 withCustomSpacingAfter:(double)a4 context:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)ASCredentialRequestInfoLabelSubPane;
  v8 = a5;
  -[ASCredentialRequestSubPane addToStackView:withCustomSpacingAfter:context:](&v20, sel_addToStackView_withCustomSpacingAfter_context_, a3, v8, a4);
  v9 = (void *)MEMORY[0x24BDD1628];
  -[UILabel leadingAnchor](self->_infoLabel, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestInfoLabelSubPane marginInset](self, "marginInset");
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  -[UILabel trailingAnchor](self->_infoLabel, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stackView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestInfoLabelSubPane marginInset](self, "marginInset");
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, -v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activateConstraints:", v19);

}

- (NSString)text
{
  return -[UILabel text](self->_infoLabel, "text");
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_infoLabel, "setText:", a3);
}

+ (id)_boldTitleFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBD5E0], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE248], *MEMORY[0x24BEBE258]);
}

+ (id)_bodyFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
}

+ (id)_boldTitleTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
}

+ (id)_bodyTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
}

- (double)marginInset
{
  return self->_marginInset;
}

- (void)setMarginInset:(double)a3
{
  self->_marginInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoLabel, 0);
}

@end
