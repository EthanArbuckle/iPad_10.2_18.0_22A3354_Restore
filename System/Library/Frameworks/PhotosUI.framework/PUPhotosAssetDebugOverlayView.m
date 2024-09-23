@implementation PUPhotosAssetDebugOverlayView

- (PUPhotosAssetDebugOverlayView)initWithClientIdentifier:(id)a3 configuration:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  PUPhotosAssetDebugOverlayView *v9;
  PUPhotosAssetDebugOverlayView *v10;
  PUPhotosAssetDebugOverlayView *v11;
  objc_super v13;

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (PUPhotosAssetViewShowDebugOverlayView())
  {
    v13.receiver = self;
    v13.super_class = (Class)PUPhotosAssetDebugOverlayView;
    v9 = -[PUPhotosAssetDebugOverlayView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_clientIdentifier, a3);
      if (v8)
        v8[2](v8, v10);
      -[PUPhotosAssetDebugOverlayView _setupView](v10, "_setupView");
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_setupView
{
  void *v3;
  UIView *v4;
  UIView *buttonContainerView;
  id v6;
  void *v7;
  UIImageView *v8;
  UIImageView *buttonImageView;
  UIButton *v10;
  UIButton *overlayButton;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[14];

  v50[12] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAssetDebugOverlayView setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
  buttonContainerView = self->_buttonContainerView;
  self->_buttonContainerView = v4;

  -[PUPhotosAssetDebugOverlayView _configureButtonContainerView](self, "_configureButtonContainerView");
  -[PUPhotosAssetDebugOverlayView addSubview:](self, "addSubview:", self->_buttonContainerView);
  v6 = objc_alloc(MEMORY[0x24BEBD668]);
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("ant.circle.fill"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (UIImageView *)objc_msgSend(v6, "initWithImage:", v7);
  buttonImageView = self->_buttonImageView;
  self->_buttonImageView = v8;

  -[PUPhotosAssetDebugOverlayView _configureButtonImageView](self, "_configureButtonImageView");
  -[UIView addSubview:](self->_buttonContainerView, "addSubview:", self->_buttonImageView);
  v10 = (UIButton *)objc_alloc_init(MEMORY[0x24BEBD430]);
  overlayButton = self->_overlayButton;
  self->_overlayButton = v10;

  -[PUPhotosAssetDebugOverlayView _updateOverlayButton](self, "_updateOverlayButton");
  -[UIView addSubview:](self->_buttonContainerView, "addSubview:", self->_overlayButton);
  v35 = (void *)MEMORY[0x24BDD1628];
  -[UIView topAnchor](self->_buttonContainerView, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAssetDebugOverlayView topAnchor](self, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 10.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v47;
  -[UIView trailingAnchor](self->_buttonContainerView, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAssetDebugOverlayView trailingAnchor](self, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, -10.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v44;
  -[UIView widthAnchor](self->_buttonContainerView, "widthAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAssetDebugOverlayView widthAnchor](self, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:multiplier:", v42, 0.1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v41;
  -[UIView heightAnchor](self->_buttonContainerView, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_buttonContainerView, "widthAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v38;
  -[UIImageView topAnchor](self->_buttonImageView, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_buttonContainerView, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, 10.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v34;
  -[UIImageView bottomAnchor](self->_buttonImageView, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_buttonContainerView, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, -10.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v31;
  -[UIImageView leadingAnchor](self->_buttonImageView, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_buttonContainerView, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 10.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v50[6] = v28;
  -[UIImageView trailingAnchor](self->_buttonImageView, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_buttonContainerView, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, -10.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v50[7] = v25;
  -[UIButton topAnchor](self->_overlayButton, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_buttonContainerView, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v50[8] = v22;
  -[UIButton bottomAnchor](self->_overlayButton, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_buttonContainerView, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v50[9] = v14;
  -[UIButton leadingAnchor](self->_overlayButton, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_buttonContainerView, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v50[10] = v17;
  -[UIButton trailingAnchor](self->_overlayButton, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_buttonContainerView, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v50[11] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "activateConstraints:", v21);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  PUPhotosAssetDebugOverlayView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotosAssetDebugOverlayView;
  -[PUPhotosAssetDebugOverlayView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (PUPhotosAssetDebugOverlayView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }
  return v5;
}

- (void)setShowInfoOverlay:(BOOL)a3
{
  self->_showInfoOverlay = a3;
  -[PUPhotosAssetDebugOverlayView _updateInfoOverlayAppearance](self, "_updateInfoOverlayAppearance");
}

- (void)setPreferredImageDynamicRange:(int64_t)a3
{
  if (self->_preferredImageDynamicRange != a3)
  {
    self->_preferredImageDynamicRange = a3;
    -[PUPhotosAssetDebugOverlayView _updateInfoLabel](self, "_updateInfoLabel");
    -[PUPhotosAssetDebugOverlayView _updateOverlayButton](self, "_updateOverlayButton");
  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[PUPhotosAssetDebugOverlayView _updateOverlayButton](self, "_updateOverlayButton");
    v5 = obj;
  }

}

- (void)_configureButtonContainerView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAssetDebugOverlayView buttonContainerView](self, "buttonContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[PUPhotosAssetDebugOverlayView buttonContainerView](self, "buttonContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", 8.0);

  -[PUPhotosAssetDebugOverlayView buttonContainerView](self, "buttonContainerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)_configureButtonImageView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAssetDebugOverlayView buttonImageView](self, "buttonImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

  -[PUPhotosAssetDebugOverlayView buttonImageView](self, "buttonImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", 1);

  -[PUPhotosAssetDebugOverlayView buttonImageView](self, "buttonImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)_updateOverlayButton
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  unint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  void (*v25)(uint64_t, uint64_t, uint64_t);
  void *v26;
  PUPhotosAssetDebugOverlayView *v27;
  id v28;
  _QWORD v29[5];
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __53__PUPhotosAssetDebugOverlayView__updateOverlayButton__block_invoke;
  v30[3] = &unk_24C62C0F8;
  v30[4] = self;
  objc_msgSend(MEMORY[0x24BEBD388], "actionWithTitle:image:identifier:handler:", CFSTR("Toggle Info Overlay"), 0, 0, v30);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v3;
  v29[1] = 3221225472;
  v29[2] = __53__PUPhotosAssetDebugOverlayView__updateOverlayButton__block_invoke_2;
  v29[3] = &unk_24C62C0F8;
  v29[4] = self;
  objc_msgSend(MEMORY[0x24BEBD388], "actionWithTitle:image:identifier:handler:", CFSTR("File Radar"), 0, 0, v29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCEB8];
  v35[0] = v4;
  v35[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotosAssetDebugOverlayView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 9863680000;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v24[0] = v3;
    v24[1] = 3221225472;
    v25 = __53__PUPhotosAssetDebugOverlayView__updateOverlayButton__block_invoke_3;
    v26 = &unk_24C62C148;
    v27 = self;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v28 = v11;
    v12 = v24;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v13 = objc_msgSend(&unk_24C636630, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(&unk_24C636630);
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "integerValue");
          if (v17 > 3)
            v18 = 0;
          else
            v18 = off_24C62C190[v17];
          v25((uint64_t)v12, v17, (uint64_t)v18);
        }
        v14 = objc_msgSend(&unk_24C636630, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v14);
    }

    v10 = 0x24BEBD000uLL;
    objc_msgSend(MEMORY[0x24BEBD748], "menuWithTitle:children:", CFSTR("Adjust Dynamic Range"), v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v19);

  }
  objc_msgSend(*(id *)(v10 + 1864), "menuWithTitle:children:", &stru_24C62D0F8, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAssetDebugOverlayView overlayButton](self, "overlayButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMenu:", v20);

  -[PUPhotosAssetDebugOverlayView overlayButton](self, "overlayButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setShowsMenuAsPrimaryAction:", 1);

  -[PUPhotosAssetDebugOverlayView overlayButton](self, "overlayButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)_updateInfoOverlayAppearance
{
  UIView *v3;
  UIView *infoOverlayView;
  void *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *infoLabel;
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
  _QWORD v37[10];

  v37[8] = *MEMORY[0x24BDAC8D0];
  if (!self->_infoOverlayView && !self->_infoLabel)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    infoOverlayView = self->_infoOverlayView;
    self->_infoOverlayView = v3;

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_infoOverlayView, "setBackgroundColor:", v6);

    -[UIView layer](self->_infoOverlayView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 8.0);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_infoOverlayView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUPhotosAssetDebugOverlayView addSubview:](self, "addSubview:", self->_infoOverlayView);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    infoLabel = self->_infoLabel;
    self->_infoLabel = v8;

    -[UILabel setNumberOfLines:](self->_infoLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_infoLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_infoOverlayView, "addSubview:", self->_infoLabel);
    v26 = (void *)MEMORY[0x24BDD1628];
    -[UIView topAnchor](self->_infoOverlayView, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosAssetDebugOverlayView topAnchor](self, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 10.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v34;
    -[UIView leadingAnchor](self->_infoOverlayView, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosAssetDebugOverlayView leadingAnchor](self, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, 10.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v31;
    -[UIView trailingAnchor](self->_infoOverlayView, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosAssetDebugOverlayView buttonContainerView](self, "buttonContainerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, -10.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v27;
    -[UIView bottomAnchor](self->_infoOverlayView, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosAssetDebugOverlayView bottomAnchor](self, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:constant:", v24, -10.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v23;
    -[UILabel topAnchor](self->_infoLabel, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_infoOverlayView, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 10.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37[4] = v20;
    -[UILabel leadingAnchor](self->_infoLabel, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_infoOverlayView, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, 10.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37[5] = v10;
    -[UILabel trailingAnchor](self->_infoLabel, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_infoOverlayView, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -10.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37[6] = v13;
    -[UILabel bottomAnchor](self->_infoLabel, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_infoOverlayView, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -10.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37[7] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v17);

  }
  -[PUPhotosAssetDebugOverlayView _updateInfoLabel](self, "_updateInfoLabel");
  -[UIView setHidden:](self->_infoOverlayView, "setHidden:", -[PUPhotosAssetDebugOverlayView showInfoOverlay](self, "showInfoOverlay") ^ 1);
}

- (void)_updateInfoLabel
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PUPhotosAssetDebugOverlayView _debugDescription](self, "_debugDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[INTERNAL ONLY]\n%@"), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_infoLabel, "setText:", v4);

}

- (id)_debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PUPhotosAssetDebugOverlayView clientIdentifier](self, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[PUPhotosAssetDebugOverlayView preferredImageDynamicRange](self, "preferredImageDynamicRange"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[PUPhotosAssetDebugOverlayView effectivePreferredImageDynamicRange](self, "effectivePreferredImageDynamicRange"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", _os_feature_enabled_impl());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAssetDebugOverlayView _hdrImageTextForCurrentlyDisplayedImage](self, "_hdrImageTextForCurrentlyDisplayedImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "potentialEDRHeadroom");
  v12 = v11;

  objc_msgSend(v9, "numberWithDouble:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Client Identifier: %@\nPreferredImageDynamicRange: %@\nEffectivePreferredImageDynamicRange: %@\nPhotos/Phoebe Enabled: %@\nHDR Image: %@\nMax EDR: %@"), v4, v5, v6, v7, v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_hdrImageTextForCurrentlyDisplayedImage
{
  void *v3;
  void *v4;
  const __CFString *v5;

  -[PUPhotosAssetDebugOverlayView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photosAssetDebugOverlayViewCurrentlyDisplayedImage:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (objc_msgSend(v4, "isHighDynamicRange"))
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
  }
  else
  {
    v5 = CFSTR("Unknown");
  }

  return (id)v5;
}

- (void)_toggleInfoOverlay
{
  -[PUPhotosAssetDebugOverlayView setShowInfoOverlay:](self, "setShowInfoOverlay:", -[PUPhotosAssetDebugOverlayView showInfoOverlay](self, "showInfoOverlay") ^ 1);
}

- (void)_fileRadar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("ComponentName");
  v13[1] = CFSTR("Title");
  v14[0] = CFSTR("Photos UI Core");
  v14[1] = CFSTR("[Photos View Usage] Insert Bug Title");
  v13[2] = CFSTR("ComponentID");
  v13[3] = CFSTR("Classification");
  v14[2] = CFSTR("936635");
  v14[3] = CFSTR("Other Bug");
  v13[4] = CFSTR("Description");
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PUPhotosAssetDebugOverlayView _debugDescription](self, "_debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Photos Asset View Debug Info:\n%@\n\nPlease attach a screenshot."), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", CFSTR("tap-to-radar://new"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__PUPhotosAssetDebugOverlayView__fileRadar__block_invoke;
  v11[3] = &unk_24C62C170;
  v12 = v8;
  v9 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);
  objc_msgSend(v7, "setQueryItems:", v9);
  objc_msgSend(v7, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAssetDebugOverlayView _openURL:](self, "_openURL:", v10);

}

- (void)_openURL:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDC1548];
  v4 = a3;
  objc_msgSend(v3, "defaultWorkspace");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:configuration:completionHandler:", v4, 0, 0);

}

- (void)_updateImageDynamicRangeOption:(int64_t)a3
{
  id v5;

  -[PUPhotosAssetDebugOverlayView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photosAssetDebugOverlayView:didRequestPreferredImageDynamicRange:", self, a3);

}

- (PUPhotosAssetDebugOverlayView)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosAssetDebugOverlayView.m"), 429, CFSTR("init is unavailable"));

  return 0;
}

- (PUPhotosAssetDebugOverlayView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosAssetDebugOverlayView.m"), 434, CFSTR("initWithFrame is unavailable"));

  return 0;
}

- (PUPhotosAssetDebugOverlayView)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosAssetDebugOverlayView.m"), 439, CFSTR("initWithCoder is unavailable"));

  return 0;
}

- (int64_t)preferredImageDynamicRange
{
  return self->_preferredImageDynamicRange;
}

- (int64_t)effectivePreferredImageDynamicRange
{
  return self->_effectivePreferredImageDynamicRange;
}

- (void)setEffectivePreferredImageDynamicRange:(int64_t)a3
{
  self->_effectivePreferredImageDynamicRange = a3;
}

- (PUPhotosAssetDebugOverlayViewDelegate)delegate
{
  return (PUPhotosAssetDebugOverlayViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIView)buttonContainerView
{
  return self->_buttonContainerView;
}

- (UIImageView)buttonImageView
{
  return self->_buttonImageView;
}

- (UIButton)overlayButton
{
  return self->_overlayButton;
}

- (UIView)infoOverlayView
{
  return self->_infoOverlayView;
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (BOOL)showInfoOverlay
{
  return self->_showInfoOverlay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_infoOverlayView, 0);
  objc_storeStrong((id *)&self->_overlayButton, 0);
  objc_storeStrong((id *)&self->_buttonImageView, 0);
  objc_storeStrong((id *)&self->_buttonContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __43__PUPhotosAssetDebugOverlayView__fileRadar__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

uint64_t __53__PUPhotosAssetDebugOverlayView__updateOverlayButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_toggleInfoOverlay");
}

uint64_t __53__PUPhotosAssetDebugOverlayView__updateOverlayButton__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fileRadar");
}

void __53__PUPhotosAssetDebugOverlayView__updateOverlayButton__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__PUPhotosAssetDebugOverlayView__updateOverlayButton__block_invoke_4;
  v6[3] = &unk_24C62C120;
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = a2;
  objc_msgSend(MEMORY[0x24BEBD388], "actionWithTitle:image:identifier:handler:", a3, 0, 0, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", objc_msgSend(*(id *)(a1 + 32), "preferredImageDynamicRange") == a2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

uint64_t __53__PUPhotosAssetDebugOverlayView__updateOverlayButton__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateImageDynamicRangeOption:", *(_QWORD *)(a1 + 40));
}

@end
