@implementation EKUISingleLineTitleTableViewCell

- (EKUISingleLineTitleTableViewCell)initWithDelegate:(id)a3
{
  id v4;
  EKUISingleLineTitleTableViewCell *v5;
  EKUISingleLineTitleTableViewCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EKUISingleLineTitleTableViewCell;
  v5 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](&v21, sel_initWithStyle_reuseIdentifier_, 1000, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[EKUISingleLineTitleTableViewCell editableTextField](v6, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("Title"));

    -[EKUISingleLineTitleTableViewCell setTextFieldOffset:](v6, "setTextFieldOffset:", 0.0);
    EventKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Title placeholder"), CFSTR("Title"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUISingleLineTitleTableViewCell editableTextField](v6, "editableTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPlaceholder:", v9);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUISingleLineTitleTableViewCell editableTextField](v6, "editableTextField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUISingleLineTitleTableViewCell editableTextField](v6, "editableTextField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v13);

    -[EKUISingleLineTitleTableViewCell editableTextField](v6, "editableTextField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", v6);

    -[EKUISingleLineTitleTableViewCell editableTextField](v6, "editableTextField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClearButtonMode:", 1);

    -[EKUISingleLineTitleTableViewCell editableTextField](v6, "editableTextField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textInputTraits");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDisablePrediction:", 0);

    -[EKUISingleLineTitleTableViewCell editableTextField](v6, "editableTextField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CalDisableFocusRingForView();

    -[EKUISingleLineTitleTableViewCell setSelectionStyle:](v6, "setSelectionStyle:", 0);
  }

  return v6;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKUISingleLineTitleTableViewCell editableTextField](self, "editableTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[EKUISingleLineTitleTableViewCell editableTextField](self, "editableTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)focusTitleAndSelectTitle:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[EKUISingleLineTitleTableViewCell editableTextField](self, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "becomeFirstResponder");

  if (v3)
  {
    -[EKUISingleLineTitleTableViewCell editableTextField](self, "editableTextField");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectAll:", 0);

  }
}

- (double)idealHeightForWidth:(double)a3
{
  return 0.0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_textFieldDidChange_, *MEMORY[0x1E0DC54D0], v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "titleDidBeginEditing:", v5);

}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DC54D0], v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "titleDidEndEditing");

}

- (void)textFieldDidChange:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "titleDidChange");

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "titleShouldReturn");

  return v4;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "titleShouldClear");

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
