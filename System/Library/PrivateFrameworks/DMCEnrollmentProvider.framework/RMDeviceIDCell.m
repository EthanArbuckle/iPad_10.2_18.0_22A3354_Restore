@implementation RMDeviceIDCell

+ (id)specifierWithTitle:(id)a3 value:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BE75590];
  v6 = a4;
  objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", a3, 0, 0, 0, 0, 4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v7, "setProperty:forKey:", &unk_24D5487B8, *MEMORY[0x24BE75D10]);
  objc_msgSend(v7, "setProperty:forKey:", v6, CFSTR("RMDeviceIDValueKey"));

  objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759C8]);
  return v7;
}

- (RMDeviceIDCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v7;
  RMDeviceIDCell *v8;
  RMDeviceIDCell *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v7 = a5;
  v18.receiver = self;
  v18.super_class = (Class)RMDeviceIDCell;
  v8 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v18, sel_initWithStyle_reuseIdentifier_specifier_, 3, a4, v7);
  v9 = v8;
  if (v8)
  {
    -[PSTableCell titleLabel](v8, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v11);

    -[PSTableCell valueLabel](v9, "valueLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v13);

    -[PSTableCell valueLabel](v9, "valueLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setColor:", v15);

  }
  objc_msgSend(v7, "propertyForKey:", CFSTR("RMDeviceIDValueKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell setValue:](v9, "setValue:", v16);

  return v9;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)RMDeviceIDCell;
  -[PSTableCell layoutSubviews](&v19, sel_layoutSubviews);
  -[PSTableCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[PSTableCell valueLabel](self, "valueLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[RMDeviceIDCell bounds](self, "bounds");
  v18 = round((v17 - (v9 + v16 + 2.0)) * 0.5);
  objc_msgSend(v3, "setFrame:", v5, v18, v7, v9);
  objc_msgSend(v10, "setFrame:", v12, v9 + v18 + 2.0, v14, v16);

}

@end
