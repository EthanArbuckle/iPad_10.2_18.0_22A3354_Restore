@implementation HUCameraRecordingPrivacyTextViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUCameraRecordingPrivacyTextViewController;
  -[HUCameraRecordingPrivacyTextViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[HUCameraRecordingPrivacyTextViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingPrivacyTextViewController headerLabel](self, "headerLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[HUCameraRecordingPrivacyTextViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingPrivacyTextViewController consentTextView](self, "consentTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[HUCameraRecordingPrivacyTextViewController _addConstraints](self, "_addConstraints");
}

- (void)_addConstraints
{
  void *v3;
  void *v4;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[9];

  v45[7] = *MEMORY[0x1E0C80C00];
  -[HUCameraRecordingPrivacyTextViewController headerLabel](self, "headerLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingPrivacyTextViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "safeAreaLayoutGuide");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, 20.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v39;
  -[HUCameraRecordingPrivacyTextViewController headerLabel](self, "headerLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leftAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingPrivacyTextViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "safeAreaLayoutGuide");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leftAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v34, 20.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v33;
  -[HUCameraRecordingPrivacyTextViewController headerLabel](self, "headerLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingPrivacyTextViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "safeAreaLayoutGuide");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, -20.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v27;
  -[HUCameraRecordingPrivacyTextViewController consentTextView](self, "consentTextView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingPrivacyTextViewController headerLabel](self, "headerLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 20.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v22;
  -[HUCameraRecordingPrivacyTextViewController consentTextView](self, "consentTextView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leftAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingPrivacyTextViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaLayoutGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leftAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v15;
  -[HUCameraRecordingPrivacyTextViewController consentTextView](self, "consentTextView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingPrivacyTextViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v6;
  -[HUCameraRecordingPrivacyTextViewController consentTextView](self, "consentTextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingPrivacyTextViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeAreaLayoutGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v20);
}

- (UITextView)consentTextView
{
  UITextView *consentTextView;
  UITextView *v4;
  void *v5;
  UITextView *v6;

  consentTextView = self->_consentTextView;
  if (!consentTextView)
  {
    v4 = (UITextView *)objc_alloc_init(MEMORY[0x1E0CEAB18]);
    -[UITextView setEditable:](v4, "setEditable:", 0);
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraExportFeedbackConsumerText"), CFSTR("HUCameraExportFeedbackConsumerText"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setText:](v4, "setText:", v5);

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = self->_consentTextView;
    self->_consentTextView = v4;

    consentTextView = self->_consentTextView;
  }
  return consentTextView;
}

- (UILabel)headerLabel
{
  UILabel *headerLabel;
  UILabel *v4;
  void *v5;
  void *v6;
  UILabel *v7;

  headerLabel = self->_headerLabel;
  if (!headerLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 30.0, *MEMORY[0x1E0CEB5D0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4, "setFont:", v5);

    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraExportPrivacyHeaderTitle"), CFSTR("HUCameraExportPrivacyHeaderTitle"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v4, "setText:", v6);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = self->_headerLabel;
    self->_headerLabel = v4;

    headerLabel = self->_headerLabel;
  }
  return headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabel, a3);
}

- (void)setConsentTextView:(id)a3
{
  objc_storeStrong((id *)&self->_consentTextView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consentTextView, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end
