@implementation MFHyperlinkEditorViewController

- (MFHyperlinkEditorViewController)initWithTitle:(id)a3 text:(id)a4 mode:(unint64_t)a5 shouldShowCloseButton:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  MFHyperlinkEditorViewController *v15;
  MFHyperlinkEditorViewController *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MFHyperlinkEditorViewController;
  v15 = -[MFHyperlinkEditorViewController init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    -[MFHyperlinkEditorViewController linkEditorTitle](v15, "linkEditorTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v12);

    -[MFHyperlinkEditorViewController linkEditorTextField](v16, "linkEditorTextField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v13);

    -[MFHyperlinkEditorViewController setMode:](v16, "setMode:", a5);
    -[MFHyperlinkEditorViewController setShouldShowCloseButton:](v16, "setShouldShowCloseButton:", v8);
    -[MFHyperlinkEditorViewController setCompletion:](v16, "setCompletion:", v14);
  }

  return v16;
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[MFHyperlinkEditorViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFHyperlinkEditorViewController;
  -[MFHyperlinkEditorViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFHyperlinkEditorViewController;
  -[MFHyperlinkEditorViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFHyperlinkEditorViewController;
  -[MFHyperlinkEditorViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[MFHyperlinkEditorViewController completion](self, "completion");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v4)[2](v4, v6);

}

- (void)dismissLinkEditor
{
  void *v3;

  -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

  -[MFHyperlinkEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[MFHyperlinkEditorViewController dismissLinkEditor](self, "dismissLinkEditor", a3);
  return 1;
}

- (UILabel)linkEditorTitle
{
  UILabel *linkEditorTitle;
  UILabel *v4;
  UILabel *v5;

  linkEditorTitle = self->_linkEditorTitle;
  if (!linkEditorTitle)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v5 = self->_linkEditorTitle;
    self->_linkEditorTitle = v4;

    linkEditorTitle = self->_linkEditorTitle;
  }
  return linkEditorTitle;
}

- (UITextField)linkEditorTextField
{
  UITextField *linkEditorTextField;
  id v4;
  UITextField *v5;
  UITextField *v6;

  linkEditorTextField = self->_linkEditorTextField;
  if (!linkEditorTextField)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3DB8]);
    v5 = (UITextField *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_linkEditorTextField;
    self->_linkEditorTextField = v5;

    linkEditorTextField = self->_linkEditorTextField;
  }
  return linkEditorTextField;
}

- (void)loadView
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  objc_super v86;
  _QWORD v87[4];

  v87[3] = *MEMORY[0x1E0C80C00];
  v86.receiver = self;
  v86.super_class = (Class)MFHyperlinkEditorViewController;
  -[MFHyperlinkEditorViewController loadView](&v86, sel_loadView);
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v85 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setBackgroundColor:", v4);

  v5 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(v5, "setSpacing:", 8.0);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setAlignment:", 3);
  objc_msgSend(v85, "addSubview:", v5);
  -[MFHyperlinkEditorViewController linkEditorTitle](self, "linkEditorTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFHyperlinkEditorViewController linkEditorTitle](self, "linkEditorTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  if (-[MFHyperlinkEditorViewController shouldShowCloseButton](self, "shouldShowCloseButton"))
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFHyperlinkEditorViewController setLinkEditorCancelButton:](self, "setLinkEditorCancelButton:", v9);

    -[MFHyperlinkEditorViewController linkEditorCancelButton](self, "linkEditorCancelButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_dismissLinkEditor, 64);

    -[MFHyperlinkEditorViewController linkEditorCancelButton](self, "linkEditorCancelButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 1148846080;
    objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 0, v12);

    -[MFHyperlinkEditorViewController linkEditorCancelButton](self, "linkEditorCancelButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 1148846080;
    objc_msgSend(v13, "setContentCompressionResistancePriority:forAxis:", 1, v14);

    -[MFHyperlinkEditorViewController linkEditorCancelButton](self, "linkEditorCancelButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = 1148846080;
    objc_msgSend(v15, "setContentHuggingPriority:forAxis:", 0, v16);

    -[MFHyperlinkEditorViewController linkEditorCancelButton](self, "linkEditorCancelButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 1148846080;
    objc_msgSend(v17, "setContentHuggingPriority:forAxis:", 1, v18);

    v19 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v20);

    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v87[0] = v19;
    -[MFHyperlinkEditorViewController linkEditorTitle](self, "linkEditorTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v21;
    -[MFHyperlinkEditorViewController linkEditorCancelButton](self, "linkEditorCancelButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v87[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mf_addArrangedSubviews:", v23);

    v24 = v19;
  }
  else
  {
    -[MFHyperlinkEditorViewController linkEditorTitle](self, "linkEditorTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addArrangedSubview:", v21);
    v24 = 0;
  }

  -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBorderStyle:", 3);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFont:", v26);

  v28 = -[MFHyperlinkEditorViewController mode](self, "mode");
  if (v28)
  {
    if (v28 != 1)
      goto LABEL_9;
    _EFLocalizedString();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setPlaceholder:", v29);

  }
  else
  {
    _EFLocalizedString();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setPlaceholder:", v31);

    -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setKeyboardType:", 3);

    -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAutocapitalizationType:", 0);
  }

LABEL_9:
  -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v35) = 1148846080;
  objc_msgSend(v34, "setContentCompressionResistancePriority:forAxis:", 1, v35);

  -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = 1148846080;
  objc_msgSend(v36, "setContentCompressionResistancePriority:forAxis:", 0, v37);

  -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v39) = 1148846080;
  objc_msgSend(v38, "setContentHuggingPriority:forAxis:", 1, v39);

  -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "addSubview:", v41);

  -[MFHyperlinkEditorViewController setView:](self, "setView:", v85);
  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFHyperlinkEditorViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v45, 16.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v46);

  objc_msgSend(v5, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFHyperlinkEditorViewController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "layoutMarginsGuide");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v51);

  objc_msgSend(v5, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFHyperlinkEditorViewController view](self, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "layoutMarginsGuide");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v56);

  -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, 12.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v60);

  -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFHyperlinkEditorViewController view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "layoutMarginsGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v66);

  -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFHyperlinkEditorViewController view](self, "view");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "layoutMarginsGuide");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "trailingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v72);

  -[MFHyperlinkEditorViewController linkEditorTextField](self, "linkEditorTextField");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "bottomAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFHyperlinkEditorViewController view](self, "view");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "bottomAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintLessThanOrEqualToAnchor:constant:", v76, -16.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v77);

  -[MFHyperlinkEditorViewController view](self, "view");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "widthAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintGreaterThanOrEqualToConstant:", 320.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v80);

  if (-[MFHyperlinkEditorViewController shouldShowCloseButton](self, "shouldShowCloseButton"))
  {
    objc_msgSend(v24, "widthAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFHyperlinkEditorViewController linkEditorCancelButton](self, "linkEditorCancelButton");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "widthAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v84);

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v42);

}

- (double)preferredHeightForTraitCollection:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[MFHyperlinkEditorViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v6 = v5;
  -[MFHyperlinkEditorViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaInsets");
  v9 = v6 - v8;

  return v9;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void)setLinkEditorTitle:(id)a3
{
  objc_storeStrong((id *)&self->_linkEditorTitle, a3);
}

- (void)setLinkEditorTextField:(id)a3
{
  objc_storeStrong((id *)&self->_linkEditorTextField, a3);
}

- (UIButton)linkEditorCancelButton
{
  return self->_linkEditorCancelButton;
}

- (void)setLinkEditorCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_linkEditorCancelButton, a3);
}

- (BOOL)shouldShowCloseButton
{
  return self->_shouldShowCloseButton;
}

- (void)setShouldShowCloseButton:(BOOL)a3
{
  self->_shouldShowCloseButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEditorCancelButton, 0);
  objc_storeStrong((id *)&self->_linkEditorTextField, 0);
  objc_storeStrong((id *)&self->_linkEditorTitle, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
