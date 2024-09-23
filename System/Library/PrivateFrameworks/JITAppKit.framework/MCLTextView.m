@implementation MCLTextView

- (MCLTextView)initWithFrame:(CGRect)a3
{
  id v3;
  uint64_t v4;
  UITapGestureRecognizer *tapGestureRecognizer;
  id v6;
  uint64_t v7;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  MCLTextView *v10;
  objc_super v11;
  SEL v12;
  MCLTextView *v13;
  CGRect v14;

  v14 = a3;
  v12 = a2;
  v13 = 0;
  v11.receiver = self;
  v11.super_class = (Class)MCLTextView;
  v13 = -[MCLTextView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    v3 = objc_alloc(MEMORY[0x24BEBDA20]);
    v4 = objc_msgSend(v3, "initWithTarget:action:", v13, sel_onTap_);
    tapGestureRecognizer = v13->_tapGestureRecognizer;
    v13->_tapGestureRecognizer = (UITapGestureRecognizer *)v4;

    -[MCLTextView addGestureRecognizer:](v13, "addGestureRecognizer:", v13->_tapGestureRecognizer);
    v6 = objc_alloc(MEMORY[0x24BEBD740]);
    v7 = objc_msgSend(v6, "initWithTarget:action:", v13, sel_onLongPress_);
    longPressGestureRecognizer = v13->_longPressGestureRecognizer;
    v13->_longPressGestureRecognizer = (UILongPressGestureRecognizer *)v7;

    -[MCLTextView addGestureRecognizer:](v13, "addGestureRecognizer:", v13->_longPressGestureRecognizer);
    -[MCLTextView setSelectable:](v13, "setSelectable:", 0);
  }
  v10 = v13;
  objc_storeStrong((id *)&v13, 0);
  return v10;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  MCLTextView *v5;
  NSString *v6;
  id v7;
  objc_super v8;
  char v9;
  id location;
  SEL v11;
  SEL v12;
  MCLTextView *v13;
  char v14;

  v13 = self;
  v12 = a2;
  v11 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v9 = 0;
  v8.receiver = v13;
  v8.super_class = (Class)MCLTextView;
  v9 = -[MCLTextView canPerformAction:withSender:](&v8, sel_canPerformAction_withSender_, v11, location);
  v7 = (id)-[MCLTextView delegate](v13, "delegate");
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_255303640) & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = v13;
    v6 = NSStringFromSelector(v11);
    v14 = objc_msgSend(v7, "textView:canPerformAction:withSender:defaultValue:", v5) & 1;

  }
  else
  {
    v14 = v9 & 1;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);
  return v14 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;
  id v12;
  id location[2];
  MCLTextView *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("enablesReturnKeyAutomatically")) & 1) != 0)
  {
    v4 = objc_msgSend(location[0], "BOOLValue");
    -[MCLTextView setEnablesReturnKeyAutomatically:](v14, "setEnablesReturnKeyAutomatically:", v4 & 1);
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("returnKeyType")) & 1) != 0)
  {
    v5 = objc_msgSend(location[0], "integerValue");
    -[MCLTextView setReturnKeyType:](v14, "setReturnKeyType:", v5);
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("keyboardType")) & 1) != 0)
  {
    v6 = objc_msgSend(location[0], "integerValue");
    -[MCLTextView setKeyboardType:](v14, "setKeyboardType:", v6);
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("autocorrectionType")) & 1) != 0)
  {
    v7 = objc_msgSend(location[0], "integerValue");
    -[MCLTextView setAutocorrectionType:](v14, "setAutocorrectionType:", v7);
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("autocapitalizationType")) & 1) != 0)
  {
    v8 = objc_msgSend(location[0], "integerValue");
    -[MCLTextView setAutocapitalizationType:](v14, "setAutocapitalizationType:", v8);
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("spellCheckingType")) & 1) != 0)
  {
    v9 = objc_msgSend(location[0], "integerValue");
    -[MCLTextView setSpellCheckingType:](v14, "setSpellCheckingType:", v9);
  }
  else
  {
    v11.receiver = v14;
    v11.super_class = (Class)MCLTextView;
    -[MCLTextView setValue:forUndefinedKey:](&v11, sel_setValue_forUndefinedKey_, location[0], v12);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)onTap:(id)a3
{
  void *v3;
  void *v4;
  id v5[3];
  id v6;
  id location[2];
  MCLTextView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)-[MCLTextView delegate](v8, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(location[0], "locationInView:", v8);
    v5[1] = v3;
    v5[2] = v4;
    v5[0] = 0;
    objc_storeStrong(v5, 0);
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)onLongPress:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

@end
