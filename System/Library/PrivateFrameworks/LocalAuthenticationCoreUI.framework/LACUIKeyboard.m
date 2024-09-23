@implementation LACUIKeyboard

+ (id)activeKeyboard
{
  if (activeKeyboard_onceToken != -1)
    dispatch_once(&activeKeyboard_onceToken, &__block_literal_global_2);
  return (id)activeKeyboard_sharedInstance;
}

void __31__LACUIKeyboard_activeKeyboard__block_invoke()
{
  LACUIKeyboard *v0;
  void *v1;

  v0 = objc_alloc_init(LACUIKeyboard);
  v1 = (void *)activeKeyboard_sharedInstance;
  activeKeyboard_sharedInstance = (uint64_t)v0;

}

- (void)setupInParentView:(id)a3
{
  id v4;
  id v5;
  LACUIKeyboardView *v6;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *keyboardAnchorHorizontal;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *keyboardAnchorVertical;
  void *v15;
  NSLayoutConstraint *v16;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[LACUIKeyboard setRenderInProcess:](self, "setRenderInProcess:", 1);
  v5 = objc_alloc_init(MEMORY[0x24BEBD978]);
  objc_msgSend(v5, "setAxis:", 1);
  objc_msgSend(v5, "setAlignment:", 3);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = objc_alloc_init(LACUIKeyboardView);
  objc_msgSend(v5, "addArrangedSubview:", v6);

  objc_msgSend(v5, "setDirectionalLayoutMargins:", 0.0, 0.0, 40.0, 0.0);
  objc_msgSend(v5, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v4, "addSubview:", v5);
  objc_msgSend(v5, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  keyboardAnchorHorizontal = self->_keyboardAnchorHorizontal;
  self->_keyboardAnchorHorizontal = v9;

  objc_msgSend(v5, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  keyboardAnchorVertical = self->_keyboardAnchorVertical;
  self->_keyboardAnchorVertical = v13;

  -[NSLayoutConstraint setIdentifier:](self->_keyboardAnchorVertical, "setIdentifier:", CFSTR("default.vertical"));
  -[NSLayoutConstraint setIdentifier:](self->_keyboardAnchorHorizontal, "setIdentifier:", CFSTR("default.horizontal"));
  v15 = (void *)MEMORY[0x24BDD1628];
  v16 = self->_keyboardAnchorVertical;
  v18[0] = self->_keyboardAnchorHorizontal;
  v18[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v17);

  objc_storeWeak((id *)&self->_keyboardContainer, v5);
  objc_storeWeak((id *)&self->_parentView, v4);

}

- (void)updateTopLayoutGuide:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  double v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(v4, "owningView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)&self->_parentView);
    v9 = objc_msgSend(v7, "isDescendantOfView:", v8);

    if (v9)
    {
      -[NSLayoutConstraint identifier](self->_keyboardAnchorVertical, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("default.vertical")))
        v11 = 0.0;
      else
        v11 = 0.2;

      objc_initWeak(&location, self);
      v12 = (void *)MEMORY[0x24BEBDB00];
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __38__LACUIKeyboard_updateTopLayoutGuide___block_invoke;
      v13[3] = &unk_2510F81D8;
      objc_copyWeak(&v15, &location);
      v14 = v4;
      objc_msgSend(v12, "animateWithDuration:animations:", v13, v11);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }

}

void __38__LACUIKeyboard_updateTopLayoutGuide___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained[3], "setActive:", 0);
    v3 = objc_loadWeakRetained(v9 + 1);
    objc_msgSend(v3, "topAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bottomAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v9[3];
    v9[3] = (id)v6;

    objc_msgSend(v9[3], "setActive:", 1);
    v8 = objc_loadWeakRetained(v9 + 2);
    objc_msgSend(v8, "layoutIfNeeded");

    WeakRetained = v9;
  }

}

- (void)setRenderInProcess:(BOOL)a3
{
  objc_msgSend(MEMORY[0x24BEBD6C8], "setServiceRole:", !a3);
}

- (CGRect)frame
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardContainer);
  objc_msgSend(WeakRetained, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardAnchorHorizontal, 0);
  objc_storeStrong((id *)&self->_keyboardAnchorVertical, 0);
  objc_destroyWeak((id *)&self->_parentView);
  objc_destroyWeak((id *)&self->_keyboardContainer);
}

@end
