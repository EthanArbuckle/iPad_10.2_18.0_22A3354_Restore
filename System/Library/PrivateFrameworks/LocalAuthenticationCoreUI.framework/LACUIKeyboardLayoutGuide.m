@implementation LACUIKeyboardLayoutGuide

- (LACUIKeyboardLayoutGuide)initWithView:(id)a3
{
  id v4;
  LACUIKeyboardLayoutGuide *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LACUIKeyboardLayoutGuide;
  v5 = -[LACUIKeyboardLayoutGuide init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "addLayoutGuide:", v5);
    -[LACUIKeyboardLayoutGuide heightAnchor](v5, "heightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACUIKeyboardLayoutGuide _defaultHeightConstant](v5, "_defaultHeightConstant");
    objc_msgSend(v6, "constraintEqualToConstant:");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BDD1628];
    -[LACUIKeyboardLayoutGuide bottomAnchor](v5, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v7;
    -[LACUIKeyboardLayoutGuide leadingAnchor](v5, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v10;
    -[LACUIKeyboardLayoutGuide trailingAnchor](v5, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v13;
    v21[3] = obj;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v14);

    objc_storeWeak((id *)&v5->_keyboardLayoutHeightLC, obj);
    -[LACUIKeyboardLayoutGuide _setupKeyboardObservers](v5, "_setupKeyboardObservers");

  }
  return v5;
}

- (void)_setupKeyboardObservers
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleKeyboardFrameChange_, *MEMORY[0x24BEBE580], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleKeyboardFrameChange_, *MEMORY[0x24BEBE448], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleKeyboardFrameChange_, *MEMORY[0x24BEBE578], 0);

}

- (void)_handleKeyboardFrameChange:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = dispatch_time(0, 20000000);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__LACUIKeyboardLayoutGuide__handleKeyboardFrameChange___block_invoke;
  v7[3] = &unk_2510F8220;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], v7);

}

void __55__LACUIKeyboardLayoutGuide__handleKeyboardFrameChange___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateKeyboardLayoutGuide:animated:", v2, 1);

}

- (void)_updateKeyboardLayoutGuide:(id)a3 animated:(BOOL)a4
{
  id v6;
  id WeakRetained;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  BOOL v17;
  _QWORD v18[6];

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardLayoutHeightLC);
  v8 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __64__LACUIKeyboardLayoutGuide__updateKeyboardLayoutGuide_animated___block_invoke;
  v18[3] = &unk_2510F8248;
  v9 = v6;
  v18[4] = v9;
  v18[5] = self;
  objc_msgSend(WeakRetained, "setConstant:", __64__LACUIKeyboardLayoutGuide__updateKeyboardLayoutGuide_animated___block_invoke((uint64_t)v18));

  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BEBE400]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue") << 16;

  v12 = (void *)MEMORY[0x24BEBDB00];
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __64__LACUIKeyboardLayoutGuide__updateKeyboardLayoutGuide_animated___block_invoke_2;
  v15[3] = &unk_2510F8270;
  v16 = v9;
  v17 = a4;
  v13 = v9;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __64__LACUIKeyboardLayoutGuide__updateKeyboardLayoutGuide_animated___block_invoke_9;
  v14[3] = &unk_2510F8298;
  v14[4] = self;
  objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", v11, v14, &__block_literal_global_1, __64__LACUIKeyboardLayoutGuide__updateKeyboardLayoutGuide_animated___block_invoke_2((uint64_t)v15), 0.0);

}

double __64__LACUIKeyboardLayoutGuide__updateKeyboardLayoutGuide_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BEBE468]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 40), "owningView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "owningView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  objc_msgSend(v6, "convertRect:toView:", 0);
  v9 = v8;
  v11 = v10;

  objc_msgSend(v5, "rectValue");
  v13 = v9 + v11 - v12;
  if (v13 <= 0.0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_defaultHeightConstant");
    v13 = v14;
  }

  return v13;
}

float __64__LACUIKeyboardLayoutGuide__updateKeyboardLayoutGuide_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  float v6;
  float v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BEBE408]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = &unk_2511004B8;
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v5, "floatValue");
    v7 = v6;
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

void __64__LACUIKeyboardLayoutGuide__updateKeyboardLayoutGuide_animated___block_invoke_9(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "owningView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (double)_defaultHeightConstant
{
  void *v2;
  double v3;
  double v4;

  -[LACUIKeyboardLayoutGuide owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyboardLayoutHeightLC);
}

@end
