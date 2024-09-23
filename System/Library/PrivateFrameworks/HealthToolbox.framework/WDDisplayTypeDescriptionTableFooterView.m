@implementation WDDisplayTypeDescriptionTableFooterView

- (WDDisplayTypeDescriptionTableFooterView)initWithDisplayType:(id)a3
{
  id v4;
  WDDisplayTypeDescriptionTableFooterView *v5;
  WDDisplayTypeDescriptionView *v6;
  WDDisplayTypeDescriptionView *descriptionView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WDDisplayTypeDescriptionTableFooterView;
  v5 = -[WDDisplayTypeDescriptionTableFooterView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5)
  {
    v6 = -[WDDisplayTypeDescriptionView initWithDisplayType:showAttributionText:style:]([WDDisplayTypeDescriptionView alloc], "initWithDisplayType:showAttributionText:style:", v4, 1, 1);
    descriptionView = v5->_descriptionView;
    v5->_descriptionView = v6;

    -[WDDisplayTypeDescriptionView setTranslatesAutoresizingMaskIntoConstraints:](v5->_descriptionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WDDisplayTypeDescriptionTableFooterView addSubview:](v5, "addSubview:", v5->_descriptionView);
    v14 = CFSTR("descriptionView");
    v15[0] = v5->_descriptionView;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-M-[descriptionView]-M-|"), 0, &unk_24D3A6490, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDisplayTypeDescriptionTableFooterView addConstraints:](v5, "addConstraints:", v9);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[descriptionView]|"), 0, &unk_24D3A6490, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDisplayTypeDescriptionTableFooterView addConstraints:](v5, "addConstraints:", v10);

    objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDisplayTypeDescriptionTableFooterView setBackgroundColor:](v5, "setBackgroundColor:", v11);

  }
  return v5;
}

- (WDDisplayTypeDescriptionTableFooterView)initWithFrame:(CGRect)a3
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

- (WDDisplayTypeDescriptionTableFooterView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDDisplayTypeDescriptionTableFooterView;
  return -[WDDisplayTypeDescriptionTableFooterView initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionView, 0);
}

@end
