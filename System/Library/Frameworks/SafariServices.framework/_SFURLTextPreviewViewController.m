@implementation _SFURLTextPreviewViewController

- (_SFURLTextPreviewViewController)initWithURL:(id)a3
{
  id v5;
  _SFURLTextPreviewViewController *v6;
  _SFURLTextPreviewViewController *v7;
  _SFURLTextPreviewViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFURLTextPreviewViewController;
  v6 = -[_SFURLTextPreviewViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URL, a3);
    v8 = v7;
  }

  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  _SFURLTextPreviewView *v5;
  _SFURLTextPreviewView *previewView;
  void *v7;
  _SFLinkPreviewHeader *v8;
  _SFLinkPreviewHeader *previewHeader;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  _QWORD v41[9];

  v41[7] = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)_SFURLTextPreviewViewController;
  -[_SFURLTextPreviewViewController loadView](&v40, sel_loadView);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFURLTextPreviewViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = -[_SFURLTextPreviewView initWithURL:]([_SFURLTextPreviewView alloc], "initWithURL:", self->_URL);
  previewView = self->_previewView;
  self->_previewView = v5;

  -[_SFURLTextPreviewViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_previewView);

  v8 = -[_SFLinkPreviewHeader initWithMinimumPreviewUI:]([_SFLinkPreviewHeader alloc], "initWithMinimumPreviewUI:", 0);
  previewHeader = self->_previewHeader;
  self->_previewHeader = v8;

  -[_SFLinkPreviewHeader setLinkPreviewEnabled:](self->_previewHeader, "setLinkPreviewEnabled:", 0);
  -[_SFURLTextPreviewViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_previewHeader);

  -[_SFLinkPreviewHeader setTranslatesAutoresizingMaskIntoConstraints:](self->_previewHeader, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_SFURLTextPreviewView setTranslatesAutoresizingMaskIntoConstraints:](self->_previewView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v27 = (void *)MEMORY[0x1E0CB3718];
  -[_SFLinkPreviewHeader leadingAnchor](self->_previewHeader, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFURLTextPreviewViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v36;
  -[_SFLinkPreviewHeader trailingAnchor](self->_previewHeader, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFURLTextPreviewViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v32;
  -[_SFLinkPreviewHeader topAnchor](self->_previewHeader, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFURLTextPreviewViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v28;
  -[_SFURLTextPreviewView leadingAnchor](self->_previewView, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFURLTextPreviewViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 16.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v23;
  -[_SFURLTextPreviewView trailingAnchor](self->_previewView, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFURLTextPreviewViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v11, -16.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = v12;
  -[_SFURLTextPreviewView topAnchor](self->_previewView, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFLinkPreviewHeader bottomAnchor](self->_previewHeader, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v14, 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41[5] = v15;
  -[_SFURLTextPreviewViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFURLTextPreviewView bottomAnchor](self->_previewView, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v18, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v41[6] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v20);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SFURLTextPreviewViewController;
  -[_SFURLTextPreviewViewController viewWillLayoutSubviews](&v9, sel_viewWillLayoutSubviews);
  -[_SFURLTextPreviewViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  if (v4 == 0.0)
    v5 = 375.0;
  else
    v5 = v4;

  -[_SFURLTextPreviewViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", v5, 0.0);
  v8 = v7;

  -[_SFURLTextPreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v8);
}

- (void)_setLinkActions:(id)a3
{
  objc_storeStrong((id *)&self->_linkActions, a3);
}

- (id)_linkActions
{
  return self->_linkActions;
}

- (void)_setActivatedElementInfo:(id)a3
{
  objc_storeStrong((id *)&self->_activatedElementInfo, a3);
}

- (id)_activatedElementInfo
{
  return self->_activatedElementInfo;
}

- (id)_previewHeader
{
  return self->_previewHeader;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (_SFURLTextPreviewView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_previewView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_previewHeader, 0);
  objc_storeStrong((id *)&self->_activatedElementInfo, 0);
  objc_storeStrong((id *)&self->_linkActions, 0);
}

@end
