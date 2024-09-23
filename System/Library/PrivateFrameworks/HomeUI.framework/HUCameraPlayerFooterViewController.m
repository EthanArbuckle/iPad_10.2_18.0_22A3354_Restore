@implementation HUCameraPlayerFooterViewController

- (id)platterWithView:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0C8B3F8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "addSubview:applyingMaterialStyle:tintEffectStyle:", v4, 0, 1);
  objc_msgSend(v5, "_setContinuousCornerRadius:", 16.0);
  objc_msgSend(v5, "center");
  objc_msgSend(v4, "setCenter:");

  return v5;
}

- (void)viewDidLoad
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
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)HUCameraPlayerFooterViewController;
  -[HUCameraPlayerFooterViewController viewDidLoad](&v36, sel_viewDidLoad);
  -[HUCameraPlayerFooterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerFooterViewController liveButton](self, "liveButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[HUCameraPlayerFooterViewController nearbyAccessoryButton](self, "nearbyAccessoryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerFooterViewController platterWithView:](self, "platterWithView:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HUCameraPlayerFooterViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);

  -[HUCameraPlayerFooterViewController liveButton](self, "liveButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", 44.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  -[HUCameraPlayerFooterViewController liveButton](self, "liveButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintGreaterThanOrEqualToConstant:", 55.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[HUCameraPlayerFooterViewController liveButton](self, "liveButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerFooterViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[HUCameraPlayerFooterViewController liveButton](self, "liveButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leftAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerFooterViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leftAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  objc_msgSend(v6, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", 44.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  objc_msgSend(v6, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", 55.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  objc_msgSend(v6, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerFooterViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "centerYAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  objc_msgSend(v6, "rightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerFooterViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

}

- (UIButton)nearbyAccessoryButton
{
  UIButton *nearbyAccessoryButton;
  UIButton *v4;
  UIButton *v5;

  nearbyAccessoryButton = self->_nearbyAccessoryButton;
  if (!nearbyAccessoryButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "hu_clipScrubberNearbyAccessoryButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_nearbyAccessoryButton;
    self->_nearbyAccessoryButton = v4;

    nearbyAccessoryButton = self->_nearbyAccessoryButton;
  }
  return nearbyAccessoryButton;
}

- (UIButton)liveButton
{
  UIButton *liveButton;
  UIButton *v4;
  void *v5;
  UIButton *v6;

  liveButton = self->_liveButton;
  if (!liveButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "hu_clipScrubberLiveButtonWithMaximimumLineHeight:", 0.0);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v4, "setTintColor:", v5);

    -[UIButton setContentEdgeInsets:](v4, "setContentEdgeInsets:", 0.0, 18.0, 0.0, 18.0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 16.0);
    -[UIButton setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[UIButton setHidden:](v4, "setHidden:", 1);
    v6 = self->_liveButton;
    self->_liveButton = v4;

    liveButton = self->_liveButton;
  }
  return liveButton;
}

- (void)setLiveButton:(id)a3
{
  objc_storeStrong((id *)&self->_liveButton, a3);
}

- (void)setNearbyAccessoryButton:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyAccessoryButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyAccessoryButton, 0);
  objc_storeStrong((id *)&self->_liveButton, 0);
}

@end
