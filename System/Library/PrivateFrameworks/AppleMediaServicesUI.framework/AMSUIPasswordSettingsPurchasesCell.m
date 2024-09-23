@implementation AMSUIPasswordSettingsPurchasesCell

- (AMSUIPasswordSettingsPurchasesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AMSUIPasswordSettingsPurchasesCell *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AMSUIPasswordSettingsPurchasesCell;
  v4 = -[AMSUIPasswordSettingsPurchasesCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BEBDB00]);
    -[AMSUIPasswordSettingsPurchasesCell bounds](v4, "bounds");
    v6 = (void *)objc_msgSend(v5, "initWithFrame:");
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    -[AMSUIPasswordSettingsPurchasesCell setSelectedBackgroundView:](v4, "setSelectedBackgroundView:", v6);
  }
  return v4;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v4;

  if (a3)
    v4 = 3;
  else
    v4 = 0;
  -[AMSUIPasswordSettingsPurchasesCell setAccessoryType:](self, "setAccessoryType:", v4, a4);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AMSUIPasswordSettingsPurchasesCell;
  -[AMSUIPasswordSettingsPurchasesCell layoutSubviews](&v12, sel_layoutSubviews);
  -[AMSUIPasswordSettingsPurchasesCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AMSUIPasswordSettingsPurchasesCell selectedBackgroundView](self, "selectedBackgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

@end
