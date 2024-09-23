@implementation CNFRegTableHeaderLabel

- (CNFRegTableHeaderLabel)initWithSpecifier:(id)a3
{
  CNFRegTableHeaderLabel *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNFRegTableHeaderLabel;
  v3 = -[CNFRegTableLabel initWithSpecifier:](&v8, sel_initWithSpecifier_, a3);
  if (v3)
  {
    +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableHeaderFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v4, "tableHeaderFont");
    else
      PreferencesTableViewFooterFont();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->super._label, "setFont:", v6);

    -[UILabel setTextAlignment:](v3->super._label, "setTextAlignment:", objc_msgSend(v4, "tableHeaderTextAlignment"));
  }
  return v3;
}

- (id)_labelText
{
  return (id)-[PSSpecifier name](self->super._specifier, "name");
}

- (int64_t)_labelTextAlignment
{
  void *v3;
  void *v4;
  int64_t v5;
  objc_super v7;

  -[PSSpecifier propertyForKey:](self->super._specifier, "propertyForKey:", *MEMORY[0x24BE75860]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (int)objc_msgSend(v3, "intValue");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNFRegTableHeaderLabel;
    v5 = -[CNFRegTableLabel _labelTextAlignment](&v7, sel__labelTextAlignment);
  }

  return v5;
}

- (double)preferredHeightForWidth:(double)a3
{
  double v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNFRegTableHeaderLabel;
  -[CNFRegTableLabel preferredHeightForWidth:](&v9, sel_preferredHeightForWidth_, a3);
  v4 = v3;
  if (v3 > 0.0)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom") == 1 ? 34.0 : 35.0;

    if (v4 < v6)
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "userInterfaceIdiom") == 1)
        v4 = 34.0;
      else
        v4 = 35.0;

    }
  }
  return v4;
}

@end
