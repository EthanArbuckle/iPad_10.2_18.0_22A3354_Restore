@implementation LACUIKeyboardInternal

- (LACUIKeyboardInternal)init
{
  LACUIKeyboardInternal *v2;
  LACUIKeyboardInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LACUIKeyboardInternal;
  v2 = -[LACUIKeyboardInternal init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[LACUIKeyboardInternal _setup](v2, "_setup");
  return v3;
}

- (LACUIKeyboardInternal)initWithDefaultSize
{
  LACUIKeyboardInternal *v2;
  LACUIKeyboardInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LACUIKeyboardInternal;
  v2 = -[UIKeyboard initWithDefaultSize](&v5, sel_initWithDefaultSize);
  v3 = v2;
  if (v2)
    -[LACUIKeyboardInternal _setup](v2, "_setup");
  return v3;
}

- (LACUIKeyboardInternal)initWithFrame:(CGRect)a3
{
  LACUIKeyboardInternal *v3;
  LACUIKeyboardInternal *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LACUIKeyboardInternal;
  v3 = -[UIKeyboard initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[LACUIKeyboardInternal _setup](v3, "_setup");
  return v4;
}

- (LACUIKeyboardInternal)initWithCoder:(id)a3
{
  LACUIKeyboardInternal *v3;
  LACUIKeyboardInternal *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LACUIKeyboardInternal;
  v3 = -[LACUIKeyboardInternal initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[LACUIKeyboardInternal _setup](v3, "_setup");
  return v4;
}

- (void)_setup
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  -[LACUIKeyboardInternal layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisableUpdateMask:", 16);

  -[UIKeyboard defaultTextInputTraits](self, "defaultTextInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7[1] = 3221225472;
    v7[2] = __31__LACUIKeyboardInternal__setup__block_invoke;
    v7[3] = &unk_2510F8410;
    v6 = v4;
    v7[0] = MEMORY[0x24BDAC760];
    v8 = v4;
    __31__LACUIKeyboardInternal__setup__block_invoke((uint64_t)v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboard setDefaultTextInputTraits:](self, "setDefaultTextInputTraits:", v5);

    v4 = v6;
  }

}

id __31__LACUIKeyboardInternal__setup__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setKeyboardType:", 127);
  objc_msgSend(*(id *)(a1 + 32), "setKeyboardAppearance:", 127);
  objc_msgSend(*(id *)(a1 + 32), "setReturnKeyType:", 4);
  objc_msgSend(*(id *)(a1 + 32), "setAutocapitalizationType:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setAutocorrectionType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setSpellCheckingType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setSmartQuotesType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setSmartDashesType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setSmartInsertDeleteType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setAcceptsEmoji:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHidePrediction:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setDisablePrediction:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setDevicePasscodeEntry:", 1);
  return *(id *)(a1 + 32);
}

@end
