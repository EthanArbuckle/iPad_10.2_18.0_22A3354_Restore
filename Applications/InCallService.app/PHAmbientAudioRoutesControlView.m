@implementation PHAmbientAudioRoutesControlView

- (PHAmbientAudioRoutesControlView)initWithFrame:(CGRect)a3
{
  PHAmbientAudioRoutesControlView *v3;
  PHAudioControlsButton *v4;
  double v5;
  double v6;
  double v7;
  PHAudioControlsButton *v8;
  PHAudioControlsButton *button;
  void *v10;
  PHAudioControlsButton *v11;
  double v12;
  double v13;
  double v14;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  _QWORD v36[6];

  v35.receiver = self;
  v35.super_class = (Class)PHAmbientAudioRoutesControlView;
  v3 = -[PHAmbientAudioRoutesControlView initWithFrame:](&v35, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [PHAudioControlsButton alloc];
    +[PHUIConfiguration ambientAudioRoutesButtonSize](PHUIConfiguration, "ambientAudioRoutesButtonSize");
    v6 = v5;
    +[PHUIConfiguration ambientAudioRoutesButtonSize](PHUIConfiguration, "ambientAudioRoutesButtonSize");
    v8 = -[PHAudioControlsButton initWithSize:](v4, "initWithSize:", v6, v7);
    button = v3->_button;
    v3->_button = v8;

    -[PHAudioControlsButton setControlType:](v3->_button, "setControlType:", 3);
    -[PHAudioControlsButton setMenuDataSource:](v3->_button, "setMenuDataSource:", v3);
    -[PHAudioControlsButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PHAmbientAudioRoutesControlView addSubview:](v3, "addSubview:", v3->_button);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton imageView](v3->_button, "imageView"));
    objc_msgSend(v10, "setContentMode:", 1);

    v11 = v3->_button;
    +[PHUIConfiguration ambientAudioRoutesSymbolInset](PHUIConfiguration, "ambientAudioRoutesSymbolInset");
    v13 = v12;
    +[PHUIConfiguration ambientAudioRoutesSymbolInset](PHUIConfiguration, "ambientAudioRoutesSymbolInset");
    -[PHAudioControlsButton setImageEdgeInsets:](v11, "setImageEdgeInsets:", 0.0, v13, 0.0, v14);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHAmbientAudioRoutesControlView topAnchor](v3, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton topAnchor](v3->_button, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
    v36[0] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAmbientAudioRoutesControlView bottomAnchor](v3, "bottomAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton bottomAnchor](v3->_button, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
    v36[1] = v29;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHAmbientAudioRoutesControlView leadingAnchor](v3, "leadingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton leadingAnchor](v3->_button, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
    v36[2] = v26;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAmbientAudioRoutesControlView trailingAnchor](v3, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton trailingAnchor](v3->_button, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    v36[3] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAmbientAudioRoutesControlView widthAnchor](v3, "widthAnchor"));
    +[PHUIConfiguration ambientAudioRoutesButtonSize](PHUIConfiguration, "ambientAudioRoutesButtonSize");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:"));
    v36[4] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAmbientAudioRoutesControlView heightAnchor](v3, "heightAnchor"));
    +[PHUIConfiguration ambientAudioRoutesButtonSize](PHUIConfiguration, "ambientAudioRoutesButtonSize");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToConstant:"));
    v36[5] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 6));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

    -[PHAudioControlsButton addTarget:action:forControlEvents:](v3->_button, "addTarget:action:forControlEvents:", v3, "buttonTapped:", 64);
    -[PHAmbientAudioRoutesControlView reload](v3, "reload");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "routeController"));
    objc_msgSend(v24, "addDelegate:", v3);

  }
  return v3;
}

- (void)reload
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAmbientAudioRoutesControlView delegate](self, "delegate"));
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1000F9E28;
  v16 = &unk_100287F50;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v3, "fetchAudioRoutesImageWithCompletion:", &v13);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance", v13, v14, v15, v16));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeController"));
  v6 = objc_msgSend(v5, "areAuxiliaryRoutesAvailable");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAmbientAudioRoutesControlView button](self, "button"));
  if (v6)
    objc_msgSend(v7, "setControlType:", 3);
  else
    objc_msgSend(v7, "setControlType:", 2);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pickedRoute"));

  if ((objc_msgSend(v10, "isAuxiliary") & 1) != 0)
    v11 = 1;
  else
    v11 = (uint64_t)objc_msgSend(v10, "isSpeaker");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAmbientAudioRoutesControlView button](self, "button"));
  objc_msgSend(v12, "setSelected:", v11);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)buttonTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAmbientAudioRoutesControlView delegate](self, "delegate"));
  objc_msgSend(v5, "controlTypeTapped:forView:", objc_msgSend(v4, "controlType"), v4);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[PHAmbientAudioRoutesControlView reload](self, "reload");
}

- (id)menuForAudioControlsButton:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAmbientAudioRoutesControlView delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "audioRouteMenu"));

  return v4;
}

- (int64_t)ambientButtonType
{
  return 3;
}

- (NSArray)ambientButtonParts
{
  return -[PHAudioControlsButton ambientButtonParts](self->_button, "ambientButtonParts");
}

- (PHAudioControlsButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (PHAudioCallControlsViewDelegate)delegate
{
  return (PHAudioCallControlsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
