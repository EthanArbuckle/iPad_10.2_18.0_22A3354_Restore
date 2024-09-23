@implementation _EXHostView

- (void)setContentCompressionResistancePriority:(float)a3 forAxis:(int64_t)a4
{
  int *v7;
  void *v8;
  void *v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_EXHostView;
  -[_EXHostView setContentCompressionResistancePriority:forAxis:](&v11, sel_setContentCompressionResistancePriority_forAxis_);
  if (a4 == 1)
  {
    v7 = &OBJC_IVAR____EXHostView__verticalContentCompressionResistancePriority;
  }
  else
  {
    if (a4)
      goto LABEL_6;
    v7 = &OBJC_IVAR____EXHostView__horizontalContentCompressionResistancePriority;
  }
  *(float *)((char *)&self->super.super.super.isa + *v7) = a3;
LABEL_6:
  -[_EXHostView embededView](self, "embededView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_EXHostView embededView](self, "embededView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v10 = a3;
    objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", a4, v10);

  }
}

- (void)embedView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_EXHostView embededView](self, "embededView");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if ((id)v5 != v4)
  {
    if (v5)
    {
      -[_EXHostView setEmbededView:](self, "setEmbededView:", 0);
      objc_msgSend(v6, "removeFromSuperview");
    }
    if (v4)
    {
      objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      *(float *)&v7 = self->_horizontalContentCompressionResistancePriority;
      objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 0, v7);
      *(float *)&v8 = self->_verticalContentCompressionResistancePriority;
      objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 1, v8);
      -[_EXHostView addSubview:](self, "addSubview:", v4);
      v24 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v4, "leftAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_EXHostView leftAnchor](self, "leftAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v28);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v27;
      objc_msgSend(v4, "topAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[_EXHostView topAnchor](self, "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v25);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v23;
      objc_msgSend(v4, "rightAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_EXHostView rightAnchor](self, "rightAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = v11;
      objc_msgSend(v4, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_EXHostView bottomAnchor](self, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[3] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "activateConstraints:", v15);

      -[_EXHostView setEmbededView:](self, "setEmbededView:", v4);
    }
  }
  -[_EXHostView delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isLocked");

  if (v18)
  {
    _EXDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[_EXHostView embedView:].cold.2(self);

    -[_EXHostView delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "shieldView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[_EXHostView addShieldView](self, "addShieldView");
      -[_EXHostView delegate](self, "delegate");
      v22 = objc_claimAutoreleasedReturnValue();
      -[NSObject shieldViewUnlockButtonPressed:](v22, "shieldViewUnlockButtonPressed:", v21);
    }
    else
    {
      _EXDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[_EXHostView embedView:].cold.1(self);
    }

  }
}

- (void)addShieldView
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
  _QWORD v29[5];

  v29[4] = *MEMORY[0x24BDAC8D0];
  -[_EXHostView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shieldView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXHostView addSubview:](self, "addSubview:", v4);

  -[_EXHostView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shieldView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v19 = (void *)MEMORY[0x24BDD1628];
  -[_EXHostView delegate](self, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "shieldView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leftAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXHostView leftAnchor](self, "leftAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v24;
  -[_EXHostView delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "shieldView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXHostView topAnchor](self, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v18;
  -[_EXHostView delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "shieldView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXHostView rightAnchor](self, "rightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v10;
  -[_EXHostView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "shieldView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXHostView bottomAnchor](self, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v16);

}

- (void)removeShieldView
{
  void *v2;
  id v3;

  -[_EXHostView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shieldView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

}

- (UIView)embededView
{
  return (UIView *)objc_getProperty(self, a2, 424, 1);
}

- (void)setEmbededView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (_EXHostViewDelegateProtocol)delegate
{
  return (_EXHostViewDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (float)horizontalContentCompressionResistancePriority
{
  return self->_horizontalContentCompressionResistancePriority;
}

- (void)setHorizontalContentCompressionResistancePriority:(float)a3
{
  self->_horizontalContentCompressionResistancePriority = a3;
}

- (float)verticalContentCompressionResistancePriority
{
  return self->_verticalContentCompressionResistancePriority;
}

- (void)setVerticalContentCompressionResistancePriority:(float)a3
{
  self->_verticalContentCompressionResistancePriority = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_embededView, 0);
}

- (void)embedView:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_20AE73000, v5, v6, "No shield to add for scene: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)embedView:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_20AE73000, v5, v6, "Session is locked, adding shield to scene: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_0_1();
}

@end
