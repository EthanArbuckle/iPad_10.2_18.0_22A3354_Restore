@implementation HUMosaicCameraCell

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (void)setLayoutOptions:(id)a3
{
  HUGridCellLayoutOptions *v5;
  HUGridCellLayoutOptions *v6;

  v5 = (HUGridCellLayoutOptions *)a3;
  if (self->_layoutOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    -[HUMosaicCameraCell layoutOptionsDidChange](self, "layoutOptionsDidChange");
    v5 = v6;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUMosaicCameraCell;
  -[HUGridCell layoutSubviews](&v12, sel_layoutSubviews);
  -[HUMosaicCameraCell currentSize](self, "currentSize");
  v4 = v3;
  v6 = v5;
  -[HUMosaicCameraCell frame](self, "frame");
  if (v4 != v8 || v6 != v7)
  {
    -[HUMosaicCameraCell frame](self, "frame");
    -[HUMosaicCameraCell setCurrentSize:](self, "setCurrentSize:", v10, v11);
    -[HUMosaicCameraCell _updateUIForSizeChange](self, "_updateUIForSizeChange");
  }
}

- (CGSize)currentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_currentSize.width;
  height = self->_currentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
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

  -[HUMosaicCameraCell allConstraints](self, "allConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[HUMosaicCameraCell layoutOptions](self, "layoutOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (v7)
    {
      objc_msgSend(v7, "descriptionInset");
      v9 = v8;
    }
    else
    {
      v9 = 0.0;
    }
    -[HUMosaicCameraCell recordingIndicatorImageView](self, "recordingIndicatorImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell topAnchor](self, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

    -[HUMosaicCameraCell recordingIndicatorImageView](self, "recordingIndicatorImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell trailingAnchor](self, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v17);

    -[HUMosaicCameraCell recordingIndicatorImageView](self, "recordingIndicatorImageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", 12.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v20);

    -[HUMosaicCameraCell recordingIndicatorImageView](self, "recordingIndicatorImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToConstant:", 12.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v23);

    -[HUMosaicCameraCell cameraView](self, "cameraView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell leadingAnchor](self, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v27);

    -[HUMosaicCameraCell cameraView](self, "cameraView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell trailingAnchor](self, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v31);

    -[HUMosaicCameraCell cameraView](self, "cameraView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell topAnchor](self, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v35);

    -[HUMosaicCameraCell cameraView](self, "cameraView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell bottomAnchor](self, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v39);

    -[HUMosaicCameraCell setAllConstraints:](self, "setAllConstraints:", v4);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);

  }
  v40.receiver = self;
  v40.super_class = (Class)HUMosaicCameraCell;
  -[HUMosaicCameraCell updateConstraints](&v40, sel_updateConstraints);
}

- (UIImageView)recordingIndicatorImageView
{
  UIImageView *recordingIndicatorImageView;
  UIImageView *v4;
  UIImageView *v5;

  recordingIndicatorImageView = self->_recordingIndicatorImageView;
  if (!recordingIndicatorImageView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[UIImageView setContentMode:](v4, "setContentMode:", 1);
    v5 = self->_recordingIndicatorImageView;
    self->_recordingIndicatorImageView = v4;

    recordingIndicatorImageView = self->_recordingIndicatorImageView;
  }
  return recordingIndicatorImageView;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void (**v28)(_QWORD);
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
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t);
  void *v49;
  HUMosaicCameraCell *v50;
  id v51;
  objc_super v52;

  v3 = a3;
  v52.receiver = self;
  v52.super_class = (Class)HUMosaicCameraCell;
  -[HUGridCell updateUIWithAnimation:](&v52, sel_updateUIWithAnimation_);
  -[HUMosaicCameraCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HUMosaicCameraCell shouldDisplayAccessModeErrorContent](self, "shouldDisplayAccessModeErrorContent");
  if (v8)
  {
    objc_opt_class();
    -[HUMosaicCameraCell item](self, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(v11, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "userSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "currentAccessMode"))
    {
      objc_msgSend(v12, "userSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "isCameraManuallyDisabled");

    }
    HFLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (-[HUMosaicCameraCell shouldDisplayErrorContent](self, "shouldDisplayErrorContent"))
  {
    objc_opt_class();
    -[HUMosaicCameraCell item](self, "item");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    objc_msgSend(v17, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    HFLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v12, "hf_thermalShutdownMode");
    if (v19 == 1 || v19 == 2)
    {
      HFLocalizedString();
      v20 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v20;
    }
LABEL_17:
    +[HUCameraErrorContent errorWithTitle:description:](HUCameraErrorContent, "errorWithTitle:description:", v7, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      goto LABEL_19;
    goto LABEL_18;
  }
  v8 = 1;
LABEL_18:
  -[HUMosaicCameraCell createLegibilityLabelsIfNecessary](self, "createLegibilityLabelsIfNecessary");
  v21 = 0;
LABEL_19:
  -[HUMosaicCameraCell item](self, "item");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "latestResults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B48]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUMosaicCameraCell cameraView](self, "cameraView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "cameraSource");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = MEMORY[0x1E0C809B0];
  v47 = 3221225472;
  v48 = __44__HUMosaicCameraCell_updateUIWithAnimation___block_invoke;
  v49 = &unk_1E6F4C638;
  v50 = self;
  v27 = v24;
  v51 = v27;
  v28 = (void (**)(_QWORD))_Block_copy(&v46);
  -[HUMosaicCameraCell timingLabelUpdateTimer](self, "timingLabelUpdateTimer", v46, v47, v48, v49, v50);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v24 == v26)
  {

    if (v30)
      goto LABEL_24;
  }
  else
  {
    objc_msgSend(v29, "invalidate");

  }
  if (v27)
    v28[2](v28);
LABEL_24:
  -[HUMosaicCameraCell cameraNameLabel](self, "cameraNameLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setText:", v7);

  -[HUMosaicCameraCell _timingLabelText:](self, "_timingLabelText:", v27);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMosaicCameraCell timingLabel](self, "timingLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setText:", v32);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
  {
    -[HUMosaicCameraCell item](self, "item");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "latestResults");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B30]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUMosaicCameraCell cameraView](self, "cameraView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setCameraSource:withDemoSnapshotURL:animated:", v27, v36, v3);

  }
  else
  {
    -[HUMosaicCameraCell cameraView](self, "cameraView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setCameraSource:animated:", v27, v3);
  }

  -[HUMosaicCameraCell timingLabel](self, "timingLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setHidden:", v21 != 0);

  if (v21)
    v39 = 1;
  else
    v39 = -[HUMosaicCameraCell isSingleCell](self, "isSingleCell") ^ 1;
  -[HUMosaicCameraCell cameraNameLabel](self, "cameraNameLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setHidden:", v39);

  if (v8)
    v41 = -[HUMosaicCameraCell isSingleCell](self, "isSingleCell") ^ 1;
  else
    v41 = 1;
  -[HUMosaicCameraCell recordingIndicatorImageView](self, "recordingIndicatorImageView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setHidden:", v41);

  -[HUMosaicCameraCell cameraView](self, "cameraView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setErrorContent:animated:", v21, v3);

  if (v21)
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMosaicCameraCell cameraView](self, "cameraView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setBackgroundColor:", v44);

  -[HUMosaicCameraCell _updateRecordIndicatorColor](self, "_updateRecordIndicatorColor");
}

- (HUCameraView)cameraView
{
  return self->_cameraView;
}

- (HULegibilityLabel)timingLabel
{
  return self->_timingLabel;
}

- (HULegibilityLabel)cameraNameLabel
{
  return self->_cameraNameLabel;
}

- (NADecayingTimer)timingLabelUpdateTimer
{
  return self->_timingLabelUpdateTimer;
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
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) == 0)
  {
    objc_opt_class();
    -[HUMosaicCameraCell item](self, "item");
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

    if ((v6 & 1) == 0)
    {
      HFLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v24 = 138412290;
        v25 = v7;
        _os_log_error_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_ERROR, "Displaying error in tile because cameraProfile is unreachable; %@",
          (uint8_t *)&v24,
          0xCu);
      }
      goto LABEL_23;
    }
    objc_msgSend(v7, "hf_cameraManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cachedStreamError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "hf_cameraManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cachedStreamError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "code") == 23)
      {

      }
      else
      {
        objc_msgSend(v7, "hf_cameraManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cachedStreamError");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "code");

        if (v16 != 14)
        {
          HFLogForCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            goto LABEL_23;
          objc_msgSend(v7, "hf_cameraManager");
          v19 = objc_claimAutoreleasedReturnValue();
          -[NSObject cachedStreamError](v19, "cachedStreamError");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138412546;
          v25 = v7;
          v26 = 2112;
          v27 = v23;
          _os_log_error_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_ERROR, "Displaying error in tile because cameraProfile has a cached error; %@; %@",
            (uint8_t *)&v24,
            0x16u);

LABEL_21:
LABEL_23:
          v3 = 1;
          goto LABEL_24;
        }
      }
    }
    -[HUMosaicCameraCell item](self, "item");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "latestResults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B48]);
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13
      || (-[HUMosaicCameraCell item](self, "item"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v20, "latestResults"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v21,
          v20,
          !v21))
    {
      if (!objc_msgSend(v7, "hf_thermalShutdownModeActive"))
      {
        v3 = 0;
LABEL_24:

        return v3;
      }
      HFLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 138412290;
        v25 = v7;
        _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "Displaying error in tile because cameraProfile is in thermal shutdown mode; %@",
          (uint8_t *)&v24,
          0xCu);
      }
    }
    else
    {
      HFLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v24 = 138412290;
        v25 = v7;
        _os_log_error_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_ERROR, "Displaying error in tile because cameraProfile has no snapshot; %@",
          (uint8_t *)&v24,
          0xCu);
      }
    }
    goto LABEL_21;
  }
  return 0;
}

- (id)item
{
  return self->_item;
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
  -[HUMosaicCameraCell item](self, "item");
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
  -[HUMosaicCameraCell item](self, "item");
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

- (void)_updateUIForSizeChange
{
  void *v3;
  void *v4;

  -[HUMosaicCameraCell layoutOptions](self, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUMosaicCameraCell layoutOptions](self, "layoutOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell setIsSingleCell:](self, "setIsSingleCell:", objc_msgSend(v4, "isSingleCell"));

    -[HUMosaicCameraCell _updateCornerRadiusIfNeeded](self, "_updateCornerRadiusIfNeeded");
  }
}

- (void)setIsSingleCell:(BOOL)a3
{
  self->_isSingleCell = a3;
}

- (void)layoutOptionsDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUMosaicCameraCell;
  -[HUGridCell layoutOptionsDidChange](&v15, sel_layoutOptionsDidChange);
  -[HUMosaicCameraCell cameraView](self, "cameraView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaskedCameraCorners:", -1);

  -[HUMosaicCameraCell layoutOptions](self, "layoutOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timingLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMosaicCameraCell timingLabel](self, "timingLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  objc_msgSend(v4, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMosaicCameraCell cameraNameLabel](self, "cameraNameLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[HUMosaicCameraCell _updateUIForSizeChange](self, "_updateUIForSizeChange");
  v9 = -[HUMosaicCameraCell isSingleCell](self, "isSingleCell") ^ 1;
  -[HUMosaicCameraCell cameraView](self, "cameraView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHideCameraContentWhenDisplayingErrors:", v9);

  objc_opt_class();
  -[HUMosaicCameraCell cameraView](self, "cameraView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "overrideErrorView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v14, "setVisualEffectViewHidden:", -[HUMosaicCameraCell isSingleCell](self, "isSingleCell"));
}

- (BOOL)isSingleCell
{
  return self->_isSingleCell;
}

- (void)_updateCornerRadiusIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[HUMosaicCameraCell layoutOptions](self, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUMosaicCameraCell frame](self, "frame");
    v5 = v4;
    v7 = v6;
    -[HUMosaicCameraCell layoutOptions](self, "layoutOptions");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cornerRadiusForCellSize:", v5, v7);
    -[HUMosaicCameraCell setCurrentCornerRadius:](self, "setCurrentCornerRadius:");

  }
}

- (void)setCurrentCornerRadius:(double)a3
{
  if (vabdd_f64(self->_currentCornerRadius, a3) >= 0.00000011920929)
  {
    self->_currentCornerRadius = a3;
    -[HUMosaicCameraCell _updateViewCorners:](self, "_updateViewCorners:");
  }
}

- (id)_timingLabelText:(id)a3
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

- (id)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setAllConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_allConstraints, a3);
}

- (NSArray)allConstraints
{
  return self->_allConstraints;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUMosaicCameraCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  HUMosaicCameraCell *v7;
  HUMosaicCameraCell *v8;
  HUCameraView *v9;
  HUCameraView *cameraView;
  void *v11;
  HUMosaicCameraErrorView *v12;
  void *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)HUMosaicCameraCell;
  v7 = -[HUGridCell initWithFrame:](&v16, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[HUMosaicCameraCell setMaximumContentSizeCategory:](v7, "setMaximumContentSizeCategory:", *MEMORY[0x1E0CEB3F8]);
    v8->_currentSize.width = width;
    v8->_currentSize.height = height;
    v9 = objc_alloc_init(HUCameraView);
    cameraView = v8->_cameraView;
    v8->_cameraView = v9;

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.75);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraView setTintColor:](v8->_cameraView, "setTintColor:", v11);

    v12 = -[HUMosaicCameraErrorView initWithFrame:]([HUMosaicCameraErrorView alloc], "initWithFrame:", x, y, width, height);
    -[HUCameraView setOverrideErrorView:](v8->_cameraView, "setOverrideErrorView:", v12);

    -[HUCameraView setHideCameraContentWhenDisplayingErrors:](v8->_cameraView, "setHideCameraContentWhenDisplayingErrors:", 1);
    -[HUCameraView setTranslatesAutoresizingMaskIntoConstraints:](v8->_cameraView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUCameraView setUserInteractionEnabled:](v8->_cameraView, "setUserInteractionEnabled:", 0);
    -[HUMosaicCameraCell addSubview:](v8, "addSubview:", v8->_cameraView);
    -[HUMosaicCameraCell recordingIndicatorImageView](v8, "recordingIndicatorImageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell addSubview:](v8, "addSubview:", v13);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v8, sel__handleShouldDifferentiateWithoutColorDidChange, *MEMORY[0x1E0CEB0B8], 0);

  }
  return v8;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[HUMosaicCameraCell timingLabel](self, "timingLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[HUMosaicCameraCell cameraNameLabel](self, "cameraNameLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

  -[HUMosaicCameraCell setItem:](self, "setItem:", 0);
  -[HUMosaicCameraCell timingLabelUpdateTimer](self, "timingLabelUpdateTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[HUMosaicCameraCell setTimingLabelUpdateTimer:](self, "setTimingLabelUpdateTimer:", 0);
  v6.receiver = self;
  v6.super_class = (Class)HUMosaicCameraCell;
  -[HUGridCell prepareForReuse](&v6, sel_prepareForReuse);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HUMosaicCameraCell timingLabelUpdateTimer](self, "timingLabelUpdateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)HUMosaicCameraCell;
  -[HUMosaicCameraCell dealloc](&v4, sel_dealloc);
}

- (double)cameraViewAlpha
{
  void *v2;
  double v3;
  double v4;

  -[HUMosaicCameraCell cameraView](self, "cameraView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3;

  return v4;
}

- (void)setCameraViewAlpha:(double)a3
{
  id v4;

  -[HUMosaicCameraCell cameraView](self, "cameraView");
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

  -[HUMosaicCameraCell cameraView](self, "cameraView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[HUMosaicCameraCell cameraView](self, "cameraView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMosaicCameraCell convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
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

+ (id)legibilityLabel
{
  void *v2;
  HULegibilityLabel *v3;
  HULegibilityLabel *v4;

  objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [HULegibilityLabel alloc];
  v4 = -[HULegibilityLabel initWithSettings:strength:](v3, "initWithSettings:strength:", v2, *MEMORY[0x1E0CEC0D0]);
  -[HULegibilityLabel setOptions:](v4, "setOptions:", *MEMORY[0x1E0CEC0D8]);
  -[HULegibilityLabel setAdjustsFontForContentSizeCategory:](v4, "setAdjustsFontForContentSizeCategory:", 1);
  -[HULegibilityLabel setTextAlignment:](v4, "setTextAlignment:", 4);
  -[HULegibilityLabel setLineBreakMode:](v4, "setLineBreakMode:", 4);
  -[HULegibilityLabel setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  -[HULegibilityLabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  return v4;
}

- (void)createLegibilityLabelsIfNecessary
{
  void *v3;
  void *v4;
  id v5;
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
  double v17;
  double v18;
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
  void *v45;
  void *v46;
  id v47;
  _QWORD v48[8];

  v48[6] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[HUMosaicCameraCell layoutOptions](self, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  -[HUMosaicCameraCell timingLabel](self, "timingLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "legibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell setTimingLabel:](self, "setTimingLabel:", v7);

    objc_msgSend(v5, "timingLabelFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell timingLabel](self, "timingLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

    -[HUMosaicCameraCell timingLabel](self, "timingLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell addSubview:](self, "addSubview:", v10);

  }
  -[HUMosaicCameraCell cameraNameLabel](self, "cameraNameLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend((id)objc_opt_class(), "legibilityLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell setCameraNameLabel:](self, "setCameraNameLabel:", v12);

    objc_msgSend(v5, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell cameraNameLabel](self, "cameraNameLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v13);

    -[HUMosaicCameraCell cameraNameLabel](self, "cameraNameLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell addSubview:](self, "addSubview:", v15);

  }
  -[HUMosaicCameraCell legibilityLabelConstraints](self, "legibilityLabelConstraints");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(v5, "descriptionInset");
    v18 = v17;
    -[HUMosaicCameraCell timingLabel](self, "timingLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell bottomAnchor](self, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, -v18);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v43;
    -[HUMosaicCameraCell timingLabel](self, "timingLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell leadingAnchor](self, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, v18);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v39;
    -[HUMosaicCameraCell timingLabel](self, "timingLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell trailingAnchor](self, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintLessThanOrEqualToAnchor:constant:", v36, -v18);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v35;
    -[HUMosaicCameraCell cameraNameLabel](self, "cameraNameLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell timingLabel](self, "timingLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v30;
    -[HUMosaicCameraCell cameraNameLabel](self, "cameraNameLabel");
    v47 = v5;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell leadingAnchor](self, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v48[4] = v22;
    -[HUMosaicCameraCell cameraNameLabel](self, "cameraNameLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell trailingAnchor](self, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:constant:", v25, -v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v48[5] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCell setLegibilityLabelConstraints:](self, "setLegibilityLabelConstraints:", v27);

    v5 = v47;
    v28 = (void *)MEMORY[0x1E0CB3718];
    -[HUMosaicCameraCell legibilityLabelConstraints](self, "legibilityLabelConstraints");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v29);

  }
}

void __44__HUMosaicCameraCell_updateUIWithAnimation___block_invoke(uint64_t a1)
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
  v5[2] = __44__HUMosaicCameraCell_updateUIWithAnimation___block_invoke_2;
  v5[3] = &unk_1E6F4ED18;
  objc_copyWeak(&v7, &location);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "scheduledTimerWithReferenceDate:minimumUnit:block:", v3, 128, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTimingLabelUpdateTimer:", v4);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __44__HUMosaicCameraCell_updateUIWithAnimation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_timingLabelText:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "timingLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v2);

}

- (void)_updateViewCorners:(double)a3
{
  void *v5;
  id v6;

  -[HUMosaicCameraCell cameraView](self, "cameraView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setContinuousCornerRadius:", a3);

  -[HUMosaicCameraCell backgroundConfiguration](self, "backgroundConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", a3);
  -[HUMosaicCameraCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v6);

}

- (void)_animateTransitionWithView:(id)a3 animations:(id)a4
{
  objc_msgSend(MEMORY[0x1E0CEABB0], "transitionWithView:duration:options:animations:completion:", a3, 5242884, a4, 0, 0.5);
}

- (void)setTimingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timingLabel, a3);
}

- (void)setCameraNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_cameraNameLabel, a3);
}

- (void)setCameraView:(id)a3
{
  objc_storeStrong((id *)&self->_cameraView, a3);
}

- (void)setRecordingIndicatorImageView:(id)a3
{
  objc_storeStrong((id *)&self->_recordingIndicatorImageView, a3);
}

- (void)setTimingLabelUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timingLabelUpdateTimer, a3);
}

- (void)setCurrentSize:(CGSize)a3
{
  self->_currentSize = a3;
}

- (double)currentCornerRadius
{
  return self->_currentCornerRadius;
}

- (NSArray)legibilityLabelConstraints
{
  return self->_legibilityLabelConstraints;
}

- (void)setLegibilityLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_legibilityLabelConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilityLabelConstraints, 0);
  objc_storeStrong((id *)&self->_timingLabelUpdateTimer, 0);
  objc_storeStrong((id *)&self->_allConstraints, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_cameraView, 0);
  objc_storeStrong((id *)&self->_cameraNameLabel, 0);
  objc_storeStrong((id *)&self->_timingLabel, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
