@implementation ASCMiniProductPageDescriptionViewController

- (ASCMiniProductPageDescriptionViewController)initWithText:(id)a3
{
  id v5;
  ASCMiniProductPageDescriptionViewController *v6;
  ASCMiniProductPageDescriptionViewController *v7;
  void *v8;
  ASCMiniProductPageDescriptionViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  ASCMiniProductPageDescriptionViewController *v17;

  v5 = a3;
  v6 = -[ASCMiniProductPageDescriptionViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_text, a3);
    v8 = (void *)MEMORY[0x1E0DC3428];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__ASCMiniProductPageDescriptionViewController_initWithText___block_invoke;
    v16[3] = &unk_1E75612B8;
    v9 = v7;
    v17 = v9;
    objc_msgSend(v8, "actionWithHandler:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:primaryAction:", 24, v10);
    -[ASCMiniProductPageDescriptionViewController navigationItem](v9, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightBarButtonItem:", v11);

    ASCLocalizedString(CFSTR("MINI_PRODUCT_PAGE_DESCRIPTION_SHEET_TITLE"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCMiniProductPageDescriptionViewController setTitle:](v9, "setTitle:", v14);

  }
  return v7;
}

uint64_t __60__ASCMiniProductPageDescriptionViewController_initWithText___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x1E0DC3E50]);
  v6 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[ASCMiniProductPageDescriptionViewController text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v4);

  objc_msgSend(v6, "setEditable:", 0);
  objc_msgSend(v6, "setSelectable:", 0);
  objc_msgSend(v6, "setTextContainerInset:", 8.0, 16.0, 0.0, 16.0);
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[ASCMiniProductPageDescriptionViewController setView:](self, "setView:", v6);
}

- (void)setText:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_text, a3);
  -[ASCMiniProductPageDescriptionViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASCMiniProductPageDescriptionViewController textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

  }
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
