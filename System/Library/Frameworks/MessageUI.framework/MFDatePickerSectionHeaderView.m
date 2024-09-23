@implementation MFDatePickerSectionHeaderView

- (MFDatePickerSectionHeaderView)initWithFrame:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  MFDatePickerSectionHeaderView *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MFDatePickerSectionHeaderView;
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v7 = -[MFDatePickerSectionHeaderView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v4, v5, v6);
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v3, v4, v5, v6);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    objc_msgSend(v8, "setNumberOfLines:", 0);
    objc_msgSend(v8, "setLineBreakMode:", 0);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFDatePickerSectionHeaderView setLabel:](v7, "setLabel:", v8);
    -[MFDatePickerSectionHeaderView addSubview:](v7, "addSubview:", v8);
    objc_msgSend(v8, "mf_pinToView:usingLayoutMargins:", v7, 1);

  }
  return v7;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
