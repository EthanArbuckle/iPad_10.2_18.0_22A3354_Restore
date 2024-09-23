@implementation AKModernToolbarPicker

- (AKModernToolbarPicker)initWithFrame:(CGRect)a3 controller:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  AKModernToolbarPicker *v10;
  AKModernToolbarPicker *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v35;
  _QWORD v36[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v36[3] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v35.receiver = self;
  v35.super_class = (Class)AKModernToolbarPicker;
  v10 = -[AKModernToolbarPicker initWithFrame:](&v35, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v10->_currentTag = 763000;
    -[AKModernToolbarPicker setController:](v10, "setController:", v9);
    v12 = objc_alloc(MEMORY[0x24BDF6DD0]);
    -[AKModernToolbarPicker bounds](v11, "bounds");
    v13 = (void *)objc_msgSend(v12, "initWithFrame:");
    -[AKModernToolbarPicker setStackview:](v11, "setStackview:", v13);

    -[AKModernToolbarPicker stackview](v11, "stackview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDistribution:", 3);

    -[AKModernToolbarPicker stackview](v11, "stackview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AKModernToolbarPicker stackview](v11, "stackview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSpacing:", 9.0);

    -[AKModernToolbarPicker stackview](v11, "stackview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModernToolbarPicker addSubview:](v11, "addSubview:", v17);

    -[AKModernToolbarPicker stackview](v11, "stackview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModernToolbarPicker leadingAnchor](v11, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v22) = 1148829696;
    objc_msgSend(v21, "setPriority:", v22);
    -[AKModernToolbarPicker stackview](v11, "stackview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModernToolbarPicker trailingAnchor](v11, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 0.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v27) = 1148829696;
    objc_msgSend(v26, "setPriority:", v27);
    -[AKModernToolbarPicker stackview](v11, "stackview");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModernToolbarPicker centerYAnchor](v11, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x24BDD1628];
    v36[0] = v21;
    v36[1] = v26;
    v36[2] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v33);

  }
  return v11;
}

- (void)setCurrentTag:(int64_t)a3
{
  if (self->_currentTag != a3)
  {
    self->_currentTag = a3;
    -[AKModernToolbarPicker sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (UIStackView)stackview
{
  return self->_stackview;
}

- (void)setStackview:(id)a3
{
  objc_storeStrong((id *)&self->_stackview, a3);
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (int64_t)currentTag
{
  return self->_currentTag;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_stackview, 0);
}

@end
