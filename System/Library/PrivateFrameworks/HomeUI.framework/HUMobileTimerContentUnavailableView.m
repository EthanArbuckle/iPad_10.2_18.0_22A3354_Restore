@implementation HUMobileTimerContentUnavailableView

- (HUMobileTimerContentUnavailableView)init
{
  HUMobileTimerContentUnavailableView *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)HUMobileTimerContentUnavailableView;
  v2 = -[_UIContentUnavailableView initWithFrame:title:style:includeBackdrop:](&v10, sel_initWithFrame_title_style_includeBackdrop_, 0, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setAlignment:", 1);
    LODWORD(v4) = 1.0;
    objc_msgSend(v3, "setHyphenationFactor:", v4);
    objc_msgSend(v3, "setLineBreakMode:", 0);
    v11[0] = *MEMORY[0x1E0CEA098];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = *MEMORY[0x1E0CEA0D0];
    v12[0] = v5;
    v12[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", &stru_1E6F60E80, v6);
    -[_UIContentUnavailableView _messageLabel](v2, "_messageLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttributedText:", v7);

  }
  return v2;
}

- (id)_titleFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB568], 2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
