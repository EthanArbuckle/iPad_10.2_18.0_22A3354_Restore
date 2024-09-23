@implementation AVTSimpleAvatarPickerHeaderView

+ (id)reuseIdentifier
{
  return CFSTR("AVTSimpleAvatarPickerHeaderView");
}

- (AVTSimpleAvatarPickerHeaderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  AVTSimpleAvatarPickerHeaderView *v7;
  AVTCircularButton *v8;
  AVTCircularButton *button;
  AVTCircularButton *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)AVTSimpleAvatarPickerHeaderView;
  v7 = -[AVTSimpleAvatarPickerHeaderView initWithFrame:](&v12, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[AVTCircularButton initWithFrame:]([AVTCircularButton alloc], "initWithFrame:", x, y, width, height);
    -[AVTCircularButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", v7, sel_buttonPressed_, 64);
    -[AVTCircularButton setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    button = v7->_button;
    v7->_button = v8;
    v10 = v8;

    -[AVTSimpleAvatarPickerHeaderView addSubview:](v7, "addSubview:", v10);
    -[AVTSimpleAvatarPickerHeaderView setupLayout](v7, "setupLayout");
    -[AVTSimpleAvatarPickerHeaderView updateForEditMode:animated:](v7, "updateForEditMode:animated:", 0, 0);
  }
  return v7;
}

- (void)setupLayout
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
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v14 = (void *)MEMORY[0x1E0CB3718];
  -[AVTSimpleAvatarPickerHeaderView button](self, "button");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPickerHeaderView heightAnchor](self, "heightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:multiplier:constant:", v19, 0.64, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  -[AVTSimpleAvatarPickerHeaderView button](self, "button");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPickerHeaderView button](self, "button");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v3;
  -[AVTSimpleAvatarPickerHeaderView button](self, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPickerHeaderView centerXAnchor](self, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v7;
  -[AVTSimpleAvatarPickerHeaderView button](self, "button");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPickerHeaderView centerYAnchor](self, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v12);

}

- (UIImageSymbolConfiguration)ellipsisSymbolConfiguration
{
  UIImageSymbolConfiguration *ellipsisSymbolConfiguration;
  UIImageSymbolConfiguration *v4;
  UIImageSymbolConfiguration *v5;

  ellipsisSymbolConfiguration = self->_ellipsisSymbolConfiguration;
  if (!ellipsisSymbolConfiguration)
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 5, 21.0);
    v4 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
    v5 = self->_ellipsisSymbolConfiguration;
    self->_ellipsisSymbolConfiguration = v4;

    ellipsisSymbolConfiguration = self->_ellipsisSymbolConfiguration;
  }
  return ellipsisSymbolConfiguration;
}

- (UIImageSymbolConfiguration)plusSymbolConfiguration
{
  UIImageSymbolConfiguration *plusSymbolConfiguration;
  UIImageSymbolConfiguration *v4;
  UIImageSymbolConfiguration *v5;

  plusSymbolConfiguration = self->_plusSymbolConfiguration;
  if (!plusSymbolConfiguration)
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 5, 18.0);
    v4 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
    v5 = self->_plusSymbolConfiguration;
    self->_plusSymbolConfiguration = v4;

    plusSymbolConfiguration = self->_plusSymbolConfiguration;
  }
  return plusSymbolConfiguration;
}

- (void)updateForEditMode:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  __CFString **v7;
  __CFString *v8;
  id v9;

  v4 = a4;
  v7 = kAVTCircularButtonEllipsisImageName;
  if (!a3)
    v7 = kAVTCircularButtonPlusImageName;
  v8 = *v7;
  if (a3)
    -[AVTSimpleAvatarPickerHeaderView ellipsisSymbolConfiguration](self, "ellipsisSymbolConfiguration");
  else
    -[AVTSimpleAvatarPickerHeaderView plusSymbolConfiguration](self, "plusSymbolConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPickerHeaderView updateWithSymbolNamed:configuration:animated:](self, "updateWithSymbolNamed:configuration:animated:", v8, v9, v4);

}

- (void)updateWithSymbolNamed:(id)a3 configuration:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[AVTSimpleAvatarPickerHeaderView currentSymbolName](self, "currentSymbolName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v8);

  if ((v11 & 1) == 0)
  {
    -[AVTSimpleAvatarPickerHeaderView setCurrentSymbolName:](self, "setCurrentSymbolName:", v8);
    -[AVTSimpleAvatarPickerHeaderView button](self, "button");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSymbolImageWithName:configuration:", v8, v9);

    if (v5)
    {
      v13[4] = self;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __80__AVTSimpleAvatarPickerHeaderView_updateWithSymbolNamed_configuration_animated___block_invoke;
      v14[3] = &unk_1EA51D188;
      v14[4] = self;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __80__AVTSimpleAvatarPickerHeaderView_updateWithSymbolNamed_configuration_animated___block_invoke_2;
      v13[3] = &unk_1EA51D250;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v14, v13, 0.15, 0.0, 0.25, 0.0);
    }
  }

}

void __80__AVTSimpleAvatarPickerHeaderView_updateWithSymbolNamed_configuration_animated___block_invoke(uint64_t a1)
{
  void *v1;
  CGAffineTransform v2;

  objc_msgSend(*(id *)(a1 + 32), "button");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v2, 1.15, 1.15);
  objc_msgSend(v1, "setTransform:", &v2);

}

uint64_t __80__AVTSimpleAvatarPickerHeaderView_updateWithSymbolNamed_configuration_animated___block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __80__AVTSimpleAvatarPickerHeaderView_updateWithSymbolNamed_configuration_animated___block_invoke_3;
  v2[3] = &unk_1EA51D188;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v2, 0, 1.0, 0.0, 0.25, 0.0);
}

void __80__AVTSimpleAvatarPickerHeaderView_updateWithSymbolNamed_configuration_animated___block_invoke_3(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "button");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v3[0] = *MEMORY[0x1E0C9BAA8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v1, "setTransform:", v3);

}

- (void)buttonPressed:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[AVTSimpleAvatarPickerHeaderView buttonPressedBlock](self, "buttonPressedBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AVTSimpleAvatarPickerHeaderView buttonPressedBlock](self, "buttonPressedBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (AVTCircularButton)button
{
  return self->_button;
}

- (id)buttonPressedBlock
{
  return self->_buttonPressedBlock;
}

- (void)setButtonPressedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSString)currentSymbolName
{
  return self->_currentSymbolName;
}

- (void)setCurrentSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_currentSymbolName, a3);
}

- (void)setPlusSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_plusSymbolConfiguration, a3);
}

- (void)setEllipsisSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_ellipsisSymbolConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ellipsisSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_plusSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_currentSymbolName, 0);
  objc_storeStrong(&self->_buttonPressedBlock, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
