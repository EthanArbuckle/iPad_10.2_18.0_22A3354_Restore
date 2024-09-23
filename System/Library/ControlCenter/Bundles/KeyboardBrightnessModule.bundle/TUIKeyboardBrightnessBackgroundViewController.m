@implementation TUIKeyboardBrightnessBackgroundViewController

- (TUIKeyboardBrightnessBackgroundViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  TUIKeyboardBrightnessBackgroundViewController *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)TUIKeyboardBrightnessBackgroundViewController;
  v4 = -[TUIKeyboardBrightnessBackgroundViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDF6AC8];
    v6 = (void *)MEMORY[0x24BDD1488];
    v7 = objc_opt_class();
    objc_msgSend_bundleForClass_(v6, v8, v7, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageNamed_inBundle_(v5, v12, (uint64_t)CFSTR("KeyboardBrightness"), (uint64_t)v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_imageWithRenderingMode_(v14, v15, 2, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setHeaderGlyphImage_(v4, v19, (uint64_t)v18, v20, v21);
  }
  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
