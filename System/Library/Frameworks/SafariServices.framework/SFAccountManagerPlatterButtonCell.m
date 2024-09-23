@implementation SFAccountManagerPlatterButtonCell

- (void)configureWithButtonTitle:(id)a3 leadingContentInset:(unint64_t)a4 isEnabled:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v5 = a5;
  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0DC39A8];
  v8 = a3;
  objc_msgSend(v7, "cellConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColor:", v10);

  objc_msgSend(v9, "directionalLayoutMargins");
  objc_msgSend(v9, "setDirectionalLayoutMargins:");
  if (UIAccessibilityButtonShapesEnabled())
  {
    v14 = *MEMORY[0x1E0DC3320];
    v15[0] = &unk_1E4B26128;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA70];
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v8, v12);

  objc_msgSend(v9, "setAttributedText:", v13);
  -[SFAccountManagerPlatterButtonCell setContentConfiguration:](self, "setContentConfiguration:", v9);

}

@end
