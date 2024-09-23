@implementation HUFeedbackConsentViewController

- (HUFeedbackConsentViewController)initWithConsentDelegate:(id)a3
{
  id v5;
  HUFeedbackConsentViewController *v6;
  HUFeedbackConsentViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUFeedbackConsentViewController;
  v6 = -[HUFeedbackConsentViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_consentDelegate, a3);
    -[HUFeedbackConsentViewController setModalInPresentation:](v7, "setModalInPresentation:", 1);
  }

  return v7;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HUFeedbackConsentViewController setView:](self, "setView:", v4);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFeedbackConsentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[HUFeedbackConsentViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFeedbackConsentViewController consentView](self, "consentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[HUFeedbackConsentViewController consentView](self, "consentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("loading"), 1, HUFeedbackConsentViewControllerContext);

  -[HUFeedbackConsentViewController setIsObservingConsentViewLoading:](self, "setIsObservingConsentViewLoading:", 1);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)HUFeedbackConsentViewController;
  -[HUFeedbackConsentViewController viewDidLoad](&v20, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFeedbackConsentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackDisagreeTitle"), CFSTR("HUCameraFeedbackDisagreeTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 0, self, sel_didDeclineConsent);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v9 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackAgreeTitle"), CFSTR("HUCameraFeedbackAgreeTitle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithTitle:style:target:action:", v10, 2, self, sel_didAcceptConsent);

  v21[0] = v7;
  v21[1] = v8;
  v21[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFeedbackConsentViewController setToolbarItems:](self, "setToolbarItems:", v12);
  -[HUFeedbackConsentViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setToolbarHidden:", 0);

  v14 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackCancelTitle"), CFSTR("HUCameraFeedbackCancelTitle"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithTitle:style:target:action:", v15, 0, self, sel_didDeclineConsent);

  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackConsentTitle"), CFSTR("HUCameraFeedbackConsentTitle"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFeedbackConsentViewController setTitle:](self, "setTitle:", v17);

  -[HUFeedbackConsentViewController navigationItem](self, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLeftBarButtonItem:", v16);

  -[HUFeedbackConsentViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNeedsUpdateConstraints");

}

- (void)updateViewConstraints
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[6];

  v29[4] = *MEMORY[0x1E0C80C00];
  -[HUFeedbackConsentViewController consentView](self, "consentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "translatesAutoresizingMaskIntoConstraints");

  if (v4)
  {
    -[HUFeedbackConsentViewController consentView](self, "consentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUFeedbackConsentViewController consentView](self, "consentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFeedbackConsentViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFeedbackConsentViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutMargins");
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v22;
    -[HUFeedbackConsentViewController consentView](self, "consentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFeedbackConsentViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v17;
    -[HUFeedbackConsentViewController consentView](self, "consentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFeedbackConsentViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v9;
    -[HUFeedbackConsentViewController consentView](self, "consentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFeedbackConsentViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v15);
  }
  v28.receiver = self;
  v28.super_class = (Class)HUFeedbackConsentViewController;
  -[HUFeedbackConsentViewController updateViewConstraints](&v28, sel_updateViewConstraints);
}

- (void)didAcceptConsent
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D31288], "acceptEmployeeCameraFeedbackConsent");
  -[HUFeedbackConsentViewController consentDelegate](self, "consentDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "consentController:didFinishConsentWithAnswer:", self, 1);

  -[HUFeedbackConsentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)didDeclineConsent
{
  void *v3;

  -[HUFeedbackConsentViewController consentDelegate](self, "consentDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "consentController:didFinishConsentWithAnswer:", self, 0);

  -[HUFeedbackConsentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (WKWebView)consentView
{
  WKWebView *consentView;
  id v4;
  id v5;
  void *v6;
  WKWebView *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  id v12;
  WKWebView *v13;

  consentView = self->_consentView;
  if (!consentView)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEF638]);
    v5 = objc_alloc(MEMORY[0x1E0CEF630]);
    -[HUFeedbackConsentViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = (WKWebView *)objc_msgSend(v5, "initWithFrame:configuration:", v4);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWebView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[WKWebView layer](v7, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 0;
    objc_msgSend(v9, "setOpacity:", v10);

    -[HUFeedbackConsentViewController htmlString](self, "htmlString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WKWebView loadHTMLString:baseURL:](v7, "loadHTMLString:baseURL:", v11, 0);
    v13 = self->_consentView;
    self->_consentView = v7;

    consentView = self->_consentView;
  }
  return consentView;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;
  _QWORD v14[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqual:", CFSTR("loading"))
    && (void *)HUFeedbackConsentViewControllerContext == a6)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__HUFeedbackConsentViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v14[3] = &unk_1E6F4D988;
    v14[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v14, 0.2);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HUFeedbackConsentViewController;
    -[HUFeedbackConsentViewController observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

void __82__HUFeedbackConsentViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "consentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = 1.0;
  objc_msgSend(v1, "setOpacity:", v2);

}

- (id)htmlString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E98];
  -[HUFeedbackConsentViewController consentFormFilePath](self, "consentFormFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v4, 4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "Unable to load consent form at url:%@ with err:%@", buf, 0x16u);
    }

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[HUFeedbackConsentViewController isObservingConsentViewLoading](self, "isObservingConsentViewLoading"))
  {
    -[HUFeedbackConsentViewController consentView](self, "consentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("loading"));

  }
  v4.receiver = self;
  v4.super_class = (Class)HUFeedbackConsentViewController;
  -[HUFeedbackConsentViewController dealloc](&v4, sel_dealloc);
}

- (id)consentFormFilePath
{
  return CFSTR("AppleInternal/Library/Application Support/Home/Camera-Clip-Consent-Employee.html");
}

- (void)setConsentView:(id)a3
{
  objc_storeStrong((id *)&self->_consentView, a3);
}

- (BOOL)isFamilyAndFriendsConsent
{
  return self->_isFamilyAndFriendsConsent;
}

- (void)setIsFamilyAndFriendsConsent:(BOOL)a3
{
  self->_isFamilyAndFriendsConsent = a3;
}

- (HUFeedbackConsentViewControllerDelegate)consentDelegate
{
  return self->_consentDelegate;
}

- (void)setConsentDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_consentDelegate, a3);
}

- (BOOL)isObservingConsentViewLoading
{
  return self->_isObservingConsentViewLoading;
}

- (void)setIsObservingConsentViewLoading:(BOOL)a3
{
  self->_isObservingConsentViewLoading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consentDelegate, 0);
  objc_storeStrong((id *)&self->_consentView, 0);
}

@end
