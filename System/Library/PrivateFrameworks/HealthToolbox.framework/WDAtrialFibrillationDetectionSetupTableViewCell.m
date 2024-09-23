@implementation WDAtrialFibrillationDetectionSetupTableViewCell

- (WDAtrialFibrillationDetectionSetupTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDAtrialFibrillationDetectionSetupTableViewCell *v4;
  WDAtrialFibrillationDetectionSetupTableViewCell *v5;
  void *v6;
  WDAtrialFibrillationDetectionSetupView *v7;
  uint64_t v8;
  WDAtrialFibrillationDetectionSetupView *setupView;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WDAtrialFibrillationDetectionSetupTableViewCell;
  v4 = -[WDAtrialFibrillationDetectionSetupTableViewCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WDAtrialFibrillationDetectionSetupTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAtrialFibrillationDetectionSetupTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = [WDAtrialFibrillationDetectionSetupView alloc];
    v8 = -[HKOnboardingSetupView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    setupView = v5->_setupView;
    v5->_setupView = (WDAtrialFibrillationDetectionSetupView *)v8;

    -[WDAtrialFibrillationDetectionSetupView setTranslatesAutoresizingMaskIntoConstraints:](v5->_setupView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WDAtrialFibrillationDetectionSetupTableViewCell contentView](v5, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v5->_setupView);

    -[WDAtrialFibrillationDetectionSetupTableViewCell _setUpConstraints](v5, "_setUpConstraints");
  }
  return v5;
}

- (void)_setUpConstraints
{
  void *v3;
  id v4;

  -[WDAtrialFibrillationDetectionSetupTableViewCell setupView](self, "setupView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WDAtrialFibrillationDetectionSetupTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_alignConstraintsWithView:", v3);

}

+ (id)defaultReuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (WDAtrialFibrillationDetectionSetupView)setupView
{
  return self->_setupView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupView, 0);
}

@end
