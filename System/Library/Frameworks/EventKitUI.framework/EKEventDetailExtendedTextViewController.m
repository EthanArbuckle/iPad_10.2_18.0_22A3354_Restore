@implementation EKEventDetailExtendedTextViewController

- (EKEventDetailExtendedTextViewController)initWithText:(id)a3 title:(id)a4 event:(id)a5 textForCopyAction:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EKEventDetailExtendedTextViewController *v15;
  EKEventDetailExtendedTextViewController *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)EKEventDetailExtendedTextViewController;
  v15 = -[EKEventDetailExtendedTextViewController init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    -[EKEventDetailExtendedTextViewController setTitle:](v15, "setTitle:", v12);
    objc_storeStrong((id *)&v16->_text, a3);
    objc_storeStrong((id *)&v16->_textToCopy, a6);
    objc_storeStrong((id *)&v16->_event, a5);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, v16, sel__share_);
    -[EKEventDetailExtendedTextViewController navigationItem](v16, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRightBarButtonItem:", v17);

    -[UIResponder EKUI_setDataOwnersFromEvent:](v16, "EKUI_setDataOwnersFromEvent:", v13);
  }

  return v16;
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, EKUIContainedControllerIdealWidth(), 416.0);
  -[EKEventDetailExtendedTextViewController setView:](self, "setView:", v3);

  -[EKEventDetailExtendedTextViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoresizesSubviews:", 1);

  -[EKEventDetailExtendedTextViewController loadTextView](self, "loadTextView");
  -[EKEventDetailExtendedTextViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_textView);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventDetailExtendedTextViewController;
  -[EKEventDetailExtendedTextViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[EKEventDetailExtendedTextViewController _updateConstraints](self, "_updateConstraints");
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKEventDetailExtendedTextViewController;
  -[EKEventDetailExtendedTextViewController viewSafeAreaInsetsDidChange](&v8, sel_viewSafeAreaInsetsDidChange);
  -[EKEventDetailExtendedTextViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4 + 7.0;
  -[EKEventDetailExtendedTextViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  -[UITextView setContentInset:](self->_textView, "setContentInset:", 4.0, v5, 4.0, v7 + 7.0);

}

- (void)_updateConstraints
{
  UITextView *textView;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  textView = self->_textView;
  v14 = CFSTR("textView");
  v15[0] = textView;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailExtendedTextViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6 + 7.0;
  -[EKEventDetailExtendedTextViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaInsets");
  -[UITextView setContentInset:](self->_textView, "setContentInset:", 4.0, v7, 4.0, v9 + 7.0);

  v10 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[textView]|"), 0, 0, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateConstraints:", v11);

  v12 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[textView]|"), 0, 0, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activateConstraints:", v13);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  _BOOL4 IsRegularInViewHierarchy;

  -[EKEventDetailExtendedTextViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v2);

  if (IsRegularInViewHierarchy)
    return 30;
  else
    return 26;
}

- (void)loadTextView
{
  id v3;
  void *v4;
  UITextView *v5;
  UITextView *textView;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0DC3E50]);
  -[EKEventDetailExtendedTextViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v5 = (UITextView *)objc_msgSend(v3, "initWithFrame:");
  textView = self->_textView;
  self->_textView = v5;

  -[EKEventDetailExtendedTextViewController updateTextView](self, "updateTextView");
  -[UITextView textLayoutManager](self->_textView, "textLayoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLimitsLayoutForSuspiciousContents:", 1);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](self->_textView, "setFont:", v8);

  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  -[UITextView setDataDetectorTypes:](self->_textView, "setDataDetectorTypes:", 7);
}

- (void)updateTextView
{
  if (-[EKEventDetailExtendedTextViewController isViewLoaded](self, "isViewLoaded"))
    -[UITextView setText:](self->_textView, "setText:", self->_text);
}

- (void)_share:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKEventDetailExtendedTextViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D96D28]);
    v11[0] = self->_textToCopy;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithActivityItems:applicationActivities:", v7, 0);

    objc_msgSend(v8, "popoverPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBarButtonItem:", v4);

    -[EKEvent calendar](self->_event, "calendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIsContentManaged:", objc_msgSend(v10, "isManaged"));

    objc_msgSend(v5, "presentViewController:animated:completion:", v8, 1, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_textToCopy, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
