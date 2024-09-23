@implementation CNGroupIdentityActionItem

- (CNGroupIdentityActionItem)initWithTitle:(id)a3 actionType:(id)a4 actionBlock:(id)a5
{
  return -[CNGroupIdentityActionItem initWithTitle:actionType:image:actionBlock:](self, "initWithTitle:actionType:image:actionBlock:", a3, a4, 0, a5);
}

- (CNGroupIdentityActionItem)initWithTitle:(id)a3 actionType:(id)a4 systemImageName:(id)a5 overrideEnabledState:(BOOL)a6 actionBlock:(id)a7
{
  CNGroupIdentityActionItem *v8;
  CNGroupIdentityActionItem *v9;
  CNGroupIdentityActionItem *v10;

  v8 = -[CNGroupIdentityActionItem initWithTitle:actionType:systemImageName:actionBlock:](self, "initWithTitle:actionType:systemImageName:actionBlock:", a3, a4, a5, a7);
  v9 = v8;
  if (v8)
  {
    v8->_shouldOverrideEnabledState = 1;
    v8->_overrideEnabledState = a6;
    v10 = v8;
  }

  return v9;
}

- (CNGroupIdentityActionItem)initWithTitle:(id)a3 actionType:(id)a4 systemImageName:(id)a5 actionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  CNGroupIdentityActionItem *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "imageForSystemImageNamed:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[CNGroupIdentityActionItem initWithTitle:actionType:image:actionBlock:](self, "initWithTitle:actionType:image:actionBlock:", v13, v12, v14, v10);
  return v15;
}

- (CNGroupIdentityActionItem)initWithTitle:(id)a3 actionType:(id)a4 image:(id)a5 actionBlock:(id)a6
{
  id v11;
  NSString *v12;
  UIImage *v13;
  id v14;
  CNGroupIdentityActionItem *v15;
  CNGroupIdentityActionItem *v16;
  uint64_t v17;
  id actionBlock;
  CNGroupIdentityActionItem *v19;
  objc_super v21;

  v11 = a3;
  v12 = (NSString *)a4;
  v13 = (UIImage *)a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CNGroupIdentityActionItem;
  v15 = -[CNGroupIdentityActionItem init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    v16->_actionType = v12;
    v16->_image = v13;
    v17 = objc_msgSend(v14, "copy");
    actionBlock = v16->_actionBlock;
    v16->_actionBlock = (id)v17;

    v16->_shouldPresentDisambiguationUI = 1;
    v19 = v16;
  }

  return v16;
}

- (void)setOverrideEnabledState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  if (self->_overrideEnabledState != a3)
  {
    v3 = a3;
    self->_overrideEnabledState = a3;
    -[CNGroupIdentityActionItem delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[CNGroupIdentityActionItem delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "groupIdentityActionItem:didUpdateOverrideEnabledState:", self, v3);

    }
  }
}

- (void)setActionBlock:(id)a3
{
  id v4;
  void *v5;
  id actionBlock;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v4 = a3;
  if (self->_actionBlock != v4)
  {
    v10 = v4;
    v5 = _Block_copy(v4);
    actionBlock = self->_actionBlock;
    self->_actionBlock = v5;

    -[CNGroupIdentityActionItem delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    v4 = v10;
    if ((v8 & 1) != 0)
    {
      -[CNGroupIdentityActionItem delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "groupIdentityActionItem:didUpdateActionBlock:", self, v10);

      v4 = v10;
    }
  }

}

- (NSString)title
{
  return self->_title;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (UIImage)image
{
  return self->_image;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (BOOL)shouldOverrideEnabledState
{
  return self->_shouldOverrideEnabledState;
}

- (void)setShouldOverrideEnabledState:(BOOL)a3
{
  self->_shouldOverrideEnabledState = a3;
}

- (BOOL)overrideEnabledState
{
  return self->_overrideEnabledState;
}

- (BOOL)shouldPresentDisambiguationUI
{
  return self->_shouldPresentDisambiguationUI;
}

- (void)setShouldPresentDisambiguationUI:(BOOL)a3
{
  self->_shouldPresentDisambiguationUI = a3;
}

- (CNGroupIdentityActionItemDelegate)delegate
{
  return (CNGroupIdentityActionItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)imageForSystemImageNamed:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "imageForSystemImageNamed:withTextStyle:", v3, *MEMORY[0x1E0DC4B60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)imageForSystemImageNamed:(id)a3 withTextStyle:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "cnui_symbolImageNamed:scale:withColor:useFixedSize:compatibleWithTextStyle:", a3, 2, 0, 1, a4);
}

+ (id)imageForSystemImageNamed:(id)a3 withPointSize:(double)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0DC3888];
  v6 = a3;
  objc_msgSend(v5, "configurationWithPointSize:weight:scale:", 0, 2, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
