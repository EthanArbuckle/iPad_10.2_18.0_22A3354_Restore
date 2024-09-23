@implementation MFComposeSMIMELockButton

- (MFComposeSMIMELockButton)initWithFrame:(CGRect)a3
{
  MFComposeSMIMELockButton *v3;
  MFComposeSMIMELockButton *v4;
  id v5;
  void *v6;
  uint64_t v7;
  UIImageView *unlockedImageView;
  id v9;
  void *v10;
  uint64_t v11;
  UIImageView *lockedImageView;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MFComposeSMIMELockButton;
  v3 = -[MFComposeSMIMELockButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, 21.0, 22.0);
  v4 = v3;
  if (v3)
  {
    -[MFComposeSMIMELockButton setTouchInsets:](v3, "setTouchInsets:", -20.0, -20.0, 20.0, 10.0);
    v5 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:forView:", CFSTR("lock.slash.fill"), 13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithImage:", v6);
    unlockedImageView = v4->_unlockedImageView;
    v4->_unlockedImageView = (UIImageView *)v7;

    -[MFComposeSMIMELockButton bounds](v4, "bounds");
    -[UIImageView setFrame:](v4->_unlockedImageView, "setFrame:");
    -[UIImageView setContentMode:](v4->_unlockedImageView, "setContentMode:", 4);
    -[MFComposeSMIMELockButton addSubview:](v4, "addSubview:", v4->_unlockedImageView);
    v9 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:forView:", CFSTR("lock.fill"), 13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithImage:", v10);
    lockedImageView = v4->_lockedImageView;
    v4->_lockedImageView = (UIImageView *)v11;

    -[MFComposeSMIMELockButton bounds](v4, "bounds");
    -[UIImageView setFrame:](v4->_lockedImageView, "setFrame:");
    -[UIImageView setContentMode:](v4->_lockedImageView, "setContentMode:", 4);
    -[MFComposeSMIMELockButton addSubview:](v4, "addSubview:", v4->_lockedImageView);
    -[MFComposeSMIMELockButton setWantsEncryption:canEncrypt:animated:](v4, "setWantsEncryption:canEncrypt:animated:", 0, 1, 0);
    -[MFComposeSMIMELockButton setEnabled:](v4, "setEnabled:", 0);
  }
  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  -[MFComposeSMIMELockButton setEnabled:animated:](self, "setEnabled:animated:", a3, 0);
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  void (**v11)(void *, uint64_t);
  void *v12;
  float v13;
  _QWORD v14[5];
  BOOL v15;
  _QWORD aBlock[5];
  id v17;

  v4 = a4;
  if (a3)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__MFComposeSMIMELockButton_setEnabled_animated___block_invoke;
  aBlock[3] = &unk_1E5A65430;
  aBlock[4] = self;
  v9 = v7;
  v17 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __48__MFComposeSMIMELockButton_setEnabled_animated___block_invoke_2;
  v14[3] = &unk_1E5A65D28;
  v15 = a3;
  v14[4] = self;
  v11 = (void (**)(void *, uint64_t))_Block_copy(v14);
  if (v4)
  {
    v12 = (void *)MEMORY[0x1E0DC3F10];
    UIAnimationDragCoefficient();
    objc_msgSend(v12, "animateWithDuration:animations:completion:", v10, v11, v13 * 0.4);
  }
  else
  {
    v10[2](v10);
    v11[2](v11, 1);
  }

}

uint64_t __48__MFComposeSMIMELockButton_setEnabled_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTintColor:", *(_QWORD *)(a1 + 40));
}

unsigned __int8 *__48__MFComposeSMIMELockButton_setEnabled_animated___block_invoke_2(unsigned __int8 *result, int a2)
{
  uint64_t v2;
  objc_super v3;

  if (a2)
  {
    v2 = result[40];
    v3.receiver = (id)*((_QWORD *)result + 4);
    v3.super_class = (Class)MFComposeSMIMELockButton;
    return (unsigned __int8 *)objc_msgSendSuper2(&v3, sel_setEnabled_, v2);
  }
  return result;
}

- (void)setWantsEncryption:(BOOL)a3
{
  if (self->_wantsEncryption != a3)
  {
    self->_wantsEncryption = a3;
    -[MFComposeSMIMELockButton _updateButtonAppearance](self, "_updateButtonAppearance");
  }
}

- (void)setCanEncrypt:(BOOL)a3
{
  if (self->_canEncrypt != a3)
  {
    self->_canEncrypt = a3;
    -[MFComposeSMIMELockButton _updateButtonAppearance](self, "_updateButtonAppearance");
  }
}

- (void)setWantsEncryption:(BOOL)a3 canEncrypt:(BOOL)a4 animated:(BOOL)a5
{
  self->_wantsEncryption = a3;
  self->_canEncrypt = a4;
  -[MFComposeSMIMELockButton _updateButtonAppearanceAnimated:](self, "_updateButtonAppearanceAnimated:", a5);
}

- (void)_updateButtonAppearance
{
  -[MFComposeSMIMELockButton _updateButtonAppearanceAnimated:](self, "_updateButtonAppearanceAnimated:", 0);
}

- (void)_updateButtonAppearanceAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  _QWORD aBlock[5];

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__MFComposeSMIMELockButton__updateButtonAppearanceAnimated___block_invoke;
  aBlock[3] = &unk_1E5A65480;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v5 = v4;
  if (v3)
  {
    v6 = (void *)MEMORY[0x1E0DC3F10];
    UIAnimationDragCoefficient();
    objc_msgSend(v6, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 512, v5, 0, v7 * 0.3, 0.0, 0.5, 0.0);
  }
  else
  {
    (*((void (**)(void *))v4 + 2))(v4);
  }

}

void __60__MFComposeSMIMELockButton__updateButtonAppearanceAnimated___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "wantsEncryption")
    && objc_msgSend(*(id *)(a1 + 32), "canEncrypt"))
  {
    v4 = 0;
    objc_msgSend(*(id *)(a1 + 32), "_closeLock");
    objc_msgSend(*(id *)(a1 + 32), "setTintColor:", 0);
  }
  else
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "wantsEncryption");
    v3 = *(void **)(a1 + 32);
    if (v2)
    {
      objc_msgSend(v3, "_openLock");
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setTintColor:", v4);
    }
    else
    {
      v4 = 0;
      objc_msgSend(v3, "_openLock");
      objc_msgSend(*(id *)(a1 + 32), "setTintColor:", 0);
    }
  }

}

- (void)_openLock
{
  -[UIImageView setAlpha:](self->_unlockedImageView, "setAlpha:", 1.0);
  -[UIImageView setAlpha:](self->_lockedImageView, "setAlpha:", 0.0);
}

- (void)_closeLock
{
  -[UIImageView setAlpha:](self->_unlockedImageView, "setAlpha:", 0.0);
  -[UIImageView setAlpha:](self->_lockedImageView, "setAlpha:", 1.0);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  MFComposeSMIMELockButton *v25;
  MFComposeSMIMELockButton *v26;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  CGPoint v32;
  CGRect v33;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[MFComposeSMIMELockButton alpha](self, "alpha");
  if (v8 <= 0.0)
    goto LABEL_4;
  -[MFComposeSMIMELockButton bounds](self, "bounds");
  v28 = v9;
  v29 = v10;
  v30 = v11;
  v13 = v12;
  -[MFComposeSMIMELockButton touchInsets](self, "touchInsets");
  v15 = v14;
  -[MFComposeSMIMELockButton touchInsets](self, "touchInsets");
  v17 = v16;
  -[MFComposeSMIMELockButton touchInsets](self, "touchInsets");
  v19 = v18;
  -[MFComposeSMIMELockButton touchInsets](self, "touchInsets");
  v21 = v20;
  -[MFComposeSMIMELockButton touchInsets](self, "touchInsets");
  v23 = v22;
  -[MFComposeSMIMELockButton touchInsets](self, "touchInsets");
  v33.origin.x = v28 + v15;
  v33.origin.y = v13 + v17;
  v33.size.height = v30 + v24 - v23;
  v33.size.width = v29 + v21 - v19;
  v32.x = x;
  v32.y = y;
  if (CGRectContainsPoint(v33, v32))
  {
    v25 = self;
  }
  else
  {
LABEL_4:
    v31.receiver = self;
    v31.super_class = (Class)MFComposeSMIMELockButton;
    -[MFComposeSMIMELockButton hitTest:withEvent:](&v31, sel_hitTest_withEvent_, v7, x, y);
    v25 = (MFComposeSMIMELockButton *)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

  return v26;
}

- (UIEdgeInsets)touchInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->touchInsets.top;
  left = self->touchInsets.left;
  bottom = self->touchInsets.bottom;
  right = self->touchInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->touchInsets = a3;
}

- (BOOL)wantsEncryption
{
  return self->_wantsEncryption;
}

- (BOOL)canEncrypt
{
  return self->_canEncrypt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockedImageView, 0);
  objc_storeStrong((id *)&self->_lockedImageView, 0);
}

@end
