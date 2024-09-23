@implementation CNFRegTableFooterLabel

- (CNFRegTableFooterLabel)initWithSpecifier:(id)a3
{
  CNFRegTableFooterLabel *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNFRegTableFooterLabel;
  v3 = -[CNFRegTableLabel initWithSpecifier:](&v9, sel_initWithSpecifier_, a3);
  if (v3)
  {
    +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableFooterFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v4, "tableFooterFont");
    else
      PreferencesTableViewFooterFont();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->super._label, "setFont:", v6);

    objc_msgSend(v4, "tableFooterTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->super._label, "setTextColor:", v7);

    -[UILabel setTextAlignment:](v3->super._label, "setTextAlignment:", objc_msgSend(v4, "tableHeaderTextAlignment"));
  }
  return v3;
}

- (id)_labelText
{
  return (id)-[PSSpecifier propertyForKey:](self->super._specifier, "propertyForKey:", *MEMORY[0x24BE75A68]);
}

- (id)_URLText
{
  return (id)-[PSSpecifier propertyForKey:](self->super._specifier, "propertyForKey:", CFSTR("cnfreg-url-text"));
}

- (id)_URLTarget
{
  return (id)-[PSSpecifier propertyForKey:](self->super._specifier, "propertyForKey:", CFSTR("cnfreg-url-target"));
}

- (int64_t)_labelTextAlignment
{
  void *v3;
  void *v4;
  int64_t v5;
  objc_super v7;

  -[PSSpecifier propertyForKey:](self->super._specifier, "propertyForKey:", *MEMORY[0x24BE75A28]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (int)objc_msgSend(v3, "intValue");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNFRegTableFooterLabel;
    v5 = -[CNFRegTableLabel _labelTextAlignment](&v7, sel__labelTextAlignment);
  }

  return v5;
}

- (double)_topPadding
{
  return 6.0;
}

- (double)_bottomPadding
{
  return 6.0;
}

@end
