@implementation HUGridCameraCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUGridCameraCell)initWithFrame:(CGRect)a3
{
  HUGridCameraCell *v3;
  HUGridCameraCell *v4;
  void *v5;
  UIView *v6;
  UIView *topBarView;
  void *v8;
  UILabel *v9;
  UILabel *titleLabel;
  void *v11;
  UIImageView *v12;
  UIImageView *recordingIndicatorImageView;
  void *v14;
  HUCameraView *v15;
  HUCameraView *cameraView;
  uint64_t v17;
  _UILegibilitySettings *legibilitySettings;
  HULegibilityLabel *v19;
  _UILegibilitySettings *v20;
  double v21;
  void *v22;
  uint64_t v23;
  HULegibilityLabel *descriptionLabel;
  double v25;
  double v26;
  void *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)HUGridCameraCell;
  v3 = -[HUGridCell initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUGridCameraCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    topBarView = v4->_topBarView;
    v4->_topBarView = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_topBarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_topBarView, "setBackgroundColor:", v8);

    objc_msgSend(v5, "addSubview:", v4->_topBarView);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v9;

    objc_msgSend(MEMORY[0x1E0CEA478], "darkTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v11);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v4->_titleLabel);
    v12 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    recordingIndicatorImageView = v4->_recordingIndicatorImageView;
    v4->_recordingIndicatorImageView = v12;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_recordingIndicatorImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v4->_recordingIndicatorImageView, "setContentMode:", 1);
    objc_msgSend(v5, "addSubview:", v4->_recordingIndicatorImageView);
    -[HUGridCameraCell exclamationView](v4, "exclamationView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v14);

    v15 = objc_alloc_init(HUCameraView);
    cameraView = v4->_cameraView;
    v4->_cameraView = v15;

    -[HUCameraView setTranslatesAutoresizingMaskIntoConstraints:](v4->_cameraView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUCameraView setUserInteractionEnabled:](v4->_cameraView, "setUserInteractionEnabled:", 0);
    objc_msgSend(v5, "addSubview:", v4->_cameraView);
    objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 0);
    v17 = objc_claimAutoreleasedReturnValue();
    legibilitySettings = v4->_legibilitySettings;
    v4->_legibilitySettings = (_UILegibilitySettings *)v17;

    v19 = [HULegibilityLabel alloc];
    v20 = v4->_legibilitySettings;
    v21 = *MEMORY[0x1E0CEC0C0];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 6.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HULegibilityLabel initWithSettings:strength:text:font:options:](v19, "initWithSettings:strength:text:font:options:", v20, &stru_1E6F60E80, v22, *MEMORY[0x1E0CEC0E0], v21);
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = (HULegibilityLabel *)v23;

    -[HULegibilityLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v25) = 1144766464;
    -[HULegibilityLabel setContentCompressionResistancePriority:forAxis:](v4->_descriptionLabel, "setContentCompressionResistancePriority:forAxis:", 0, v25);
    LODWORD(v26) = 1132134400;
    -[HULegibilityLabel setContentHuggingPriority:forAxis:](v4->_descriptionLabel, "setContentHuggingPriority:forAxis:", 0, v26);
    objc_msgSend(v5, "addSubview:", v4->_descriptionLabel);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v4, sel__handleShouldDifferentiateWithoutColorDidChange, *MEMORY[0x1E0CEB0B8], 0);

  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[HUGridCameraCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[HUGridCameraCell descriptionLabel](self, "descriptionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

  -[HUGridCameraCell setItem:](self, "setItem:", 0);
  -[HUGridCameraCell descriptionLabelUpdateTimer](self, "descriptionLabelUpdateTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[HUGridCameraCell setDescriptionLabelUpdateTimer:](self, "setDescriptionLabelUpdateTimer:", 0);
  v6.receiver = self;
  v6.super_class = (Class)HUGridCameraCell;
  -[HUGridCell prepareForReuse](&v6, sel_prepareForReuse);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HUGridCameraCell descriptionLabelUpdateTimer](self, "descriptionLabelUpdateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)HUGridCameraCell;
  -[HUGridCameraCell dealloc](&v4, sel_dealloc);
}

- (double)cameraViewAlpha
{
  void *v2;
  double v3;
  double v4;

  -[HUGridCameraCell cameraView](self, "cameraView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3;

  return v4;
}

- (void)setCameraViewAlpha:(double)a3
{
  id v4;

  -[HUGridCameraCell cameraView](self, "cameraView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (CGRect)cameraViewFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  -[HUGridCameraCell cameraView](self, "cameraView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[HUGridCameraCell cameraView](self, "cameraView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridCameraCell convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

+ (Class)layoutOptionsClass
{
  return (Class)objc_opt_class();
}

- (void)setLayoutOptions:(id)a3
{
  HUGridCameraCellLayoutOptions *v5;
  HUGridCameraCellLayoutOptions *v6;

  v5 = (HUGridCameraCellLayoutOptions *)a3;
  if (self->_layoutOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    -[HUGridCameraCell layoutOptionsDidChange](self, "layoutOptionsDidChange");
    v5 = v6;
  }

}

- (BOOL)shouldDisplayErrorContent
{
  BOOL v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  NSObject *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) == 0)
  {
    objc_opt_class();
    -[HUGridCameraCell item](self, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    objc_msgSend(v6, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v8, "isReachable");

    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "hf_cameraManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cachedStreamError");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_13;
      objc_msgSend(v7, "hf_cameraManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cachedStreamError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "code") == 23)
      {

        goto LABEL_13;
      }
      objc_msgSend(v7, "hf_cameraManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "cachedStreamError");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "code");

      if (v17 == 14)
      {
LABEL_13:
        -[HUGridCameraCell item](self, "item");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "latestResults");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B48]);
        v13 = objc_claimAutoreleasedReturnValue();

        if (v13
          || (-[HUGridCameraCell item](self, "item"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v22, "latestResults"),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v23,
              v22,
              !v23))
        {
          if (!objc_msgSend(v7, "hf_thermalShutdownModeActive"))
          {
            v3 = 0;
LABEL_27:

            return v3;
          }
          HFLogForCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            goto LABEL_25;
          objc_msgSend(v7, "uniqueIdentifier");
          v20 = objc_claimAutoreleasedReturnValue();
          v26 = 138412290;
          v27 = v20;
          v21 = "Displaying error in tile because cameraProfile[%@] is in thermal shutdown mode";
          goto LABEL_21;
        }
        HFLogForCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "uniqueIdentifier");
          v20 = objc_claimAutoreleasedReturnValue();
          v26 = 138412290;
          v27 = v20;
          v21 = "Displaying error in tile because cameraProfile[%@] has no snapshot";
LABEL_21:
          _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v26, 0xCu);
LABEL_24:

        }
LABEL_25:

        goto LABEL_26;
      }
      HFLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "uniqueIdentifier");
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hf_cameraManager");
        v20 = objc_claimAutoreleasedReturnValue();
        -[NSObject cachedStreamError](v20, "cachedStreamError");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412546;
        v27 = v14;
        v28 = 2112;
        v29 = v24;
        _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "Displaying error in tile because cameraProfile[%@] has a cached error:%@", (uint8_t *)&v26, 0x16u);

        goto LABEL_24;
      }
    }
    else
    {
      HFLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "uniqueIdentifier");
        v14 = objc_claimAutoreleasedReturnValue();
        v26 = 138412290;
        v27 = v14;
        _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "Displaying error in tile because cameraProfile[%@] is unreachable", (uint8_t *)&v26, 0xCu);
        goto LABEL_25;
      }
    }
LABEL_26:
    v3 = 1;
    goto LABEL_27;
  }
  return 0;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void (**v11)(_QWORD);
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
  id v27;
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
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t);
  void *v43;
  HUGridCameraCell *v44;
  id v45;
  objc_super v46;

  v3 = a3;
  v46.receiver = self;
  v46.super_class = (Class)HUGridCameraCell;
  -[HUGridCell updateUIWithAnimation:](&v46, sel_updateUIWithAnimation_);
  -[HUGridCameraCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B48]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUGridCameraCell cameraView](self, "cameraView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cameraSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = MEMORY[0x1E0C809B0];
  v41 = 3221225472;
  v42 = __42__HUGridCameraCell_updateUIWithAnimation___block_invoke;
  v43 = &unk_1E6F4C638;
  v44 = self;
  v10 = v7;
  v45 = v10;
  v11 = (void (**)(_QWORD))_Block_copy(&v40);
  -[HUGridCameraCell descriptionLabelUpdateTimer](self, "descriptionLabelUpdateTimer", v40, v41, v42, v43, v44);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v7 == v9)
  {

    if (v13)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(v12, "invalidate");

  }
  if (v10)
    v11[2](v11);
LABEL_6:
  -[HUGridCameraCell item](self, "item");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "latestResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridCameraCell titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v16);

  -[HUGridCameraCell _descriptionLabelText:](self, "_descriptionLabelText:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridCameraCell descriptionLabel](self, "descriptionLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
  {
    -[HUGridCameraCell item](self, "item");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "latestResults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B30]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUGridCameraCell cameraView](self, "cameraView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCameraSource:withDemoSnapshotURL:animated:", v10, v22, v3);

    -[HUGridCameraCell exclamationView](self, "exclamationView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", 1);

  }
  else
  {
    -[HUGridCameraCell cameraView](self, "cameraView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCameraSource:animated:", v10, v3);
  }

  if (-[HUGridCameraCell shouldDisplayAccessModeErrorContent](self, "shouldDisplayAccessModeErrorContent"))
  {
    objc_opt_class();
    -[HUGridCameraCell item](self, "item");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
    v27 = v26;

    objc_msgSend(v27, "profile");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "userSettings");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "currentAccessMode"))
    {
      objc_msgSend(v28, "userSettings");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "isCameraManuallyDisabled");

    }
    HFLocalizedString();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUCameraErrorContent errorWithTitle:description:](HUCameraErrorContent, "errorWithTitle:description:", v35, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUGridCameraCell exclamationView](self, "exclamationView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setHidden:", 1);

    -[HUGridCameraCell recordingIndicatorImageView](self, "recordingIndicatorImageView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setHidden:", 0);

  }
  else if (-[HUGridCameraCell shouldDisplayErrorContent](self, "shouldDisplayErrorContent"))
  {
    HFLocalizedString();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUCameraErrorContent errorWithTitle:description:](HUCameraErrorContent, "errorWithTitle:description:", v31, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUGridCameraCell _populateExclamationImageIfNeeded](self, "_populateExclamationImageIfNeeded");
    -[HUGridCameraCell exclamationView](self, "exclamationView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setHidden:", 0);

    -[HUGridCameraCell recordingIndicatorImageView](self, "recordingIndicatorImageView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHidden:", 1);
  }
  else
  {
    -[HUGridCameraCell exclamationView](self, "exclamationView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setHidden:", 1);

    -[HUGridCameraCell recordingIndicatorImageView](self, "recordingIndicatorImageView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHidden:", 0);
    v32 = 0;
  }

  -[HUGridCameraCell descriptionLabel](self, "descriptionLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setHidden:", v32 != 0);

  -[HUGridCameraCell cameraView](self, "cameraView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setErrorContent:animated:", v32, v3);

  -[HUGridCameraCell _updateRecordIndicatorColor](self, "_updateRecordIndicatorColor");
  -[HUGridCameraCell _updateCameraViewAppearance](self, "_updateCameraViewAppearance");

}

void __42__HUGridCameraCell_updateUIWithAnimation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D519A0];
  objc_msgSend(*(id *)(a1 + 40), "captureDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__HUGridCameraCell_updateUIWithAnimation___block_invoke_2;
  v5[3] = &unk_1E6F4ED18;
  objc_copyWeak(&v7, &location);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "scheduledTimerWithReferenceDate:minimumUnit:block:", v3, 128, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDescriptionLabelUpdateTimer:", v4);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __42__HUGridCameraCell_updateUIWithAnimation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_descriptionLabelText:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "descriptionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v2);

}

- (BOOL)shouldDisplayAccessModeErrorContent
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  objc_opt_class();
  -[HUGridCameraCell item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "userSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "currentAccessMode"))
    {
      objc_msgSend(v6, "userSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "currentAccessMode") == 3)
      {
        v9 = 1;
      }
      else
      {
        objc_msgSend(v6, "userSettings");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v10, "isCameraManuallyDisabled");

      }
    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)layoutOptionsDidChange
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HUGridCameraCell;
  -[HUGridCell layoutOptionsDidChange](&v23, sel_layoutOptionsDidChange);
  -[HUGridCell secondaryContentDimmingFactor](self, "secondaryContentDimmingFactor");
  v4 = v3;
  -[HUGridCameraCell descriptionLabel](self, "descriptionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  -[HUGridCameraCell cameraView](self, "cameraView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaskedCameraCorners:", 12);

  -[HUGridCameraCell topBarView](self, "topBarView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMaskedCorners:", 3);

  -[HUGridCameraCell layoutOptions](self, "layoutOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellCornerRadius");
  v11 = v10;
  -[HUGridCameraCell cameraView](self, "cameraView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setContinuousCornerRadius:", v11);

  -[HUGridCameraCell layoutOptions](self, "layoutOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cellCornerRadius");
  v15 = v14;
  -[HUGridCameraCell topBarView](self, "topBarView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setContinuousCornerRadius:", v15);

  -[HUGridCameraCell layoutOptions](self, "layoutOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "font");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridCameraCell titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v18);

  -[HUGridCameraCell layoutOptions](self, "layoutOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "font");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridCameraCell descriptionLabel](self, "descriptionLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFont:", v21);

}

- (void)updateConstraints
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
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
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
  double v44;
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
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  objc_super v114;
  _QWORD v115[11];

  v115[9] = *MEMORY[0x1E0C80C00];
  -[HUGridCameraCell allConstraints](self, "allConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCameraCell topBarView](self, "topBarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCameraCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

    -[HUGridCameraCell topBarView](self, "topBarView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCameraCell layoutOptions](self, "layoutOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "headerViewHeight");
    objc_msgSend(v11, "constraintEqualToConstant:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

    -[HUGridCameraCell topBarView](self, "topBarView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCameraCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v18);

    -[HUGridCameraCell topBarView](self, "topBarView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCameraCell contentView](self, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v23);

    -[HUGridCameraCell layoutOptions](self, "layoutOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "headerViewHeight");
    v26 = v25 * 0.5;

    -[HUGridCameraCell labelsConstraints](self, "labelsConstraints");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      -[HUGridCameraCell titleLabel](self, "titleLabel");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "centerYAnchor");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridCameraCell contentView](self, "contentView");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "topAnchor");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "constraintEqualToAnchor:constant:", v110, v26);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v115[0] = v109;
      -[HUGridCameraCell descriptionLabel](self, "descriptionLabel");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "centerYAnchor");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridCameraCell contentView](self, "contentView");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "bottomAnchor");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "constraintEqualToAnchor:constant:", v105, -v26);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v115[1] = v104;
      -[HUGridCameraCell recordingIndicatorImageView](self, "recordingIndicatorImageView");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "centerYAnchor");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridCameraCell contentView](self, "contentView");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "topAnchor");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "constraintEqualToAnchor:constant:", v100, v26);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v115[2] = v99;
      -[HUGridCameraCell titleLabel](self, "titleLabel");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "leadingAnchor");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridCameraCell contentView](self, "contentView");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "leadingAnchor");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridCameraCell layoutOptions](self, "layoutOptions");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "headerHorizontalInnerMargins");
      objc_msgSend(v96, "constraintEqualToAnchor:constant:", v94);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v115[3] = v93;
      -[HUGridCameraCell titleLabel](self, "titleLabel");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "trailingAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridCameraCell recordingIndicatorImageView](self, "recordingIndicatorImageView");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "leadingAnchor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "constraintEqualToAnchor:", v89);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v115[4] = v88;
      -[HUGridCameraCell descriptionLabel](self, "descriptionLabel");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "trailingAnchor");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridCameraCell contentView](self, "contentView");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "trailingAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridCameraCell layoutOptions](self, "layoutOptions");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "headerHorizontalInnerMargins");
      objc_msgSend(v85, "constraintEqualToAnchor:constant:", v83, -v28);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v115[5] = v82;
      -[HUGridCameraCell recordingIndicatorImageView](self, "recordingIndicatorImageView");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "trailingAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridCameraCell contentView](self, "contentView");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "trailingAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridCameraCell layoutOptions](self, "layoutOptions");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "headerHorizontalInnerMargins");
      objc_msgSend(v79, "constraintEqualToAnchor:constant:", v77, -v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v115[6] = v30;
      -[HUGridCameraCell recordingIndicatorImageView](self, "recordingIndicatorImageView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "widthAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToConstant:", 12.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v115[7] = v33;
      -[HUGridCameraCell recordingIndicatorImageView](self, "recordingIndicatorImageView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "heightAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToConstant:", 12.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v115[8] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 9);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridCameraCell setLabelsConstraints:](self, "setLabelsConstraints:", v37);

      -[HUGridCameraCell labelsConstraints](self, "labelsConstraints");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v38);

    }
    -[HUGridCameraCell exclamationView](self, "exclamationView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCameraCell contentView](self, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCameraCell layoutOptions](self, "layoutOptions");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "headerHorizontalInnerMargins");
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v42, -v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v45);

    -[HUGridCameraCell exclamationView](self, "exclamationView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "widthAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToConstant:", 24.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v48);

    -[HUGridCameraCell exclamationView](self, "exclamationView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "heightAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToConstant:", 24.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v51);

    -[HUGridCameraCell exclamationView](self, "exclamationView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "centerYAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCameraCell contentView](self, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v55, v26);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v56);

    -[HUGridCameraCell cameraView](self, "cameraView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCameraCell contentView](self, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v61);

    -[HUGridCameraCell cameraView](self, "cameraView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCameraCell contentView](self, "contentView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v66);

    -[HUGridCameraCell cameraView](self, "cameraView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCameraCell topAnchor](self, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCameraCell layoutOptions](self, "layoutOptions");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "headerViewHeight");
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v71);

    -[HUGridCameraCell cameraView](self, "cameraView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "bottomAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCameraCell contentView](self, "contentView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "bottomAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v76);

    -[HUGridCameraCell setAllConstraints:](self, "setAllConstraints:", v4);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);

  }
  v114.receiver = self;
  v114.super_class = (Class)HUGridCameraCell;
  -[HUGridCameraCell updateConstraints](&v114, sel_updateConstraints);
}

- (void)_animateTransitionWithView:(id)a3 animations:(id)a4
{
  objc_msgSend(MEMORY[0x1E0CEABB0], "transitionWithView:duration:options:animations:completion:", a3, 5242884, a4, 0, 0.5);
}

- (void)_updateCameraViewAppearance
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridCameraCell cameraView](self, "cameraView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.75);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUGridCameraCell cameraView](self, "cameraView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

}

- (void)_updateRecordIndicatorColor
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_opt_class();
  -[HUGridCameraCell item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userSettings");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v11, "hu_indicatorColorForCurrentAccessMode");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_recordingIndicatorImageView, "setTintColor:", v7);

  v8 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(v11, "hu_indicatorImageNameForCurrentAccessMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemImageNamed:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_recordingIndicatorImageView, "setImage:", v10);

}

- (id)_descriptionLabelText:(id)a3
{
  id v4;
  __CFString *v5;
  uint64_t v6;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldSuppressAllErrorsForDemo") & 1) != 0)
  {
    v5 = &stru_1E6F60E80;
  }
  else
  {
    if (v4)
    {
      objc_msgSend(v4, "hf_localizedAge");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[HUGridCell primaryState](self, "primaryState"))
      {
        v5 = 0;
        goto LABEL_8;
      }
      _HULocalizedStringWithDefaultValue(CFSTR("HUGridCameraCellNoResponseDescription"), CFSTR("HUGridCameraCellNoResponseDescription"), 1);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (__CFString *)v6;
  }
LABEL_8:

  return v5;
}

- (void)_populateExclamationImageIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HUGridCameraCell exclamationImageView](self, "exclamationImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HUGridCameraCell exclamationImage](self, "exclamationImage");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[HUGridCameraCell exclamationImageView](self, "exclamationImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

  }
}

- (UIImage)exclamationImage
{
  UIImage *exclamationImage;
  void *v4;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  exclamationImage = self->_exclamationImage;
  if (!exclamationImage)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("exclamationmark.circle.fill"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:", *MEMORY[0x1E0CEB568]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageWithConfiguration:", v5);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_exclamationImage;
    self->_exclamationImage = v6;

    exclamationImage = self->_exclamationImage;
  }
  return exclamationImage;
}

- (HUVisualEffectContainerView)exclamationView
{
  HUVisualEffectContainerView *exclamationView;
  id v4;
  UIImageView *v5;
  UIImageView *exclamationImageView;
  HUVisualEffectContainerView *v7;
  void *v8;
  HUVisualEffectContainerView *v9;
  void *v10;
  HUVisualEffectContainerView *v11;

  exclamationView = self->_exclamationView;
  if (!exclamationView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    exclamationImageView = self->_exclamationImageView;
    self->_exclamationImageView = v5;

    v7 = [HUVisualEffectContainerView alloc];
    -[HUGridCell contentEffect](self, "contentEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HUVisualEffectContainerView initWithEffect:](v7, "initWithEffect:", v8);

    -[HUVisualEffectContainerView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUVisualEffectContainerView setInnerContentView:](v9, "setInnerContentView:", self->_exclamationImageView);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUVisualEffectContainerView setTintColor:](v9, "setTintColor:", v10);

    v11 = self->_exclamationView;
    self->_exclamationView = v9;

    exclamationView = self->_exclamationView;
  }
  return exclamationView;
}

- (id)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (HUGridCameraCellLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (UIImageView)exclamationImageView
{
  return self->_exclamationImageView;
}

- (UIView)topBarView
{
  return self->_topBarView;
}

- (void)setTopBarView:(id)a3
{
  objc_storeStrong((id *)&self->_topBarView, a3);
}

- (UIImageView)recordingIndicatorImageView
{
  return self->_recordingIndicatorImageView;
}

- (void)setRecordingIndicatorImageView:(id)a3
{
  objc_storeStrong((id *)&self->_recordingIndicatorImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (HULegibilityLabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (HUCameraView)cameraView
{
  return self->_cameraView;
}

- (void)setCameraView:(id)a3
{
  objc_storeStrong((id *)&self->_cameraView, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
}

- (NSArray)allConstraints
{
  return self->_allConstraints;
}

- (void)setAllConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_allConstraints, a3);
}

- (NSArray)labelsConstraints
{
  return self->_labelsConstraints;
}

- (void)setLabelsConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_labelsConstraints, a3);
}

- (NADecayingTimer)descriptionLabelUpdateTimer
{
  return self->_descriptionLabelUpdateTimer;
}

- (void)setDescriptionLabelUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabelUpdateTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabelUpdateTimer, 0);
  objc_storeStrong((id *)&self->_labelsConstraints, 0);
  objc_storeStrong((id *)&self->_allConstraints, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_cameraView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_topBarView, 0);
  objc_storeStrong((id *)&self->_exclamationImageView, 0);
  objc_storeStrong((id *)&self->_exclamationView, 0);
  objc_storeStrong((id *)&self->_exclamationImage, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
