@implementation LACUIKeyboardView

- (LACUIKeyboardView)init
{
  LACUIKeyboardView *v2;
  LACUIKeyboardView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LACUIKeyboardView;
  v2 = -[LACUIKeyboardView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[LACUIKeyboardView _setup](v2, "_setup");
  return v3;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = (void *)MEMORY[0x24BEBD6C8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_keyboard);
  objc_msgSend(v2, "keyboardSizeForInterfaceOrientation:", objc_msgSend(WeakRetained, "interfaceOrientation"));
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_setup
{
  LACUIKeyboardInternal *obj;

  -[LACUIKeyboardView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  obj = -[LACUIKeyboardInternal initWithDefaultSize]([LACUIKeyboardInternal alloc], "initWithDefaultSize");
  -[LACUIKeyboardView addSubview:](self, "addSubview:", obj);
  objc_storeWeak((id *)&self->_keyboard, obj);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyboard);
}

@end
