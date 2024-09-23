@implementation MCLTextField

- (CGRect)borderRectForBounds:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  id location;
  objc_super v18;
  SEL v19;
  MCLTextField *v20;
  CGRect v21;
  __int128 v22;
  __int128 v23;
  CGRect result;

  v21 = a3;
  v20 = self;
  v19 = a2;
  v22 = 0u;
  v23 = 0u;
  v18.receiver = self;
  v18.super_class = (Class)MCLTextField;
  -[MCLTextField borderRectForBounds:](&v18, sel_borderRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *(_QWORD *)&v22 = v3;
  *((_QWORD *)&v22 + 1) = v4;
  *(_QWORD *)&v23 = v5;
  *((_QWORD *)&v23 + 1) = v6;
  location = (id)-[MCLTextField delegate](v20, "delegate");
  if ((objc_msgSend(location, "conformsToProtocol:", &unk_2553036A0) & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(location, "textField:borderRect:bounds:", v20, v22, v23, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    *(_QWORD *)&v15 = v7;
    *((_QWORD *)&v15 + 1) = v8;
    *(_QWORD *)&v16 = v9;
    *((_QWORD *)&v16 + 1) = v10;
    v22 = v15;
    v23 = v16;
  }
  objc_storeStrong(&location, 0);
  v12 = *((double *)&v22 + 1);
  v11 = *(double *)&v22;
  v14 = *((double *)&v23 + 1);
  v13 = *(double *)&v23;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  id location;
  objc_super v18;
  SEL v19;
  MCLTextField *v20;
  CGRect v21;
  __int128 v22;
  __int128 v23;
  CGRect result;

  v21 = a3;
  v20 = self;
  v19 = a2;
  v22 = 0u;
  v23 = 0u;
  v18.receiver = self;
  v18.super_class = (Class)MCLTextField;
  -[MCLTextField textRectForBounds:](&v18, sel_textRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *(_QWORD *)&v22 = v3;
  *((_QWORD *)&v22 + 1) = v4;
  *(_QWORD *)&v23 = v5;
  *((_QWORD *)&v23 + 1) = v6;
  location = (id)-[MCLTextField delegate](v20, "delegate");
  if ((objc_msgSend(location, "conformsToProtocol:", &unk_2553036A0) & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(location, "textField:textRect:bounds:", v20, v22, v23, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    *(_QWORD *)&v15 = v7;
    *((_QWORD *)&v15 + 1) = v8;
    *(_QWORD *)&v16 = v9;
    *((_QWORD *)&v16 + 1) = v10;
    v22 = v15;
    v23 = v16;
  }
  objc_storeStrong(&location, 0);
  v12 = *((double *)&v22 + 1);
  v11 = *(double *)&v22;
  v14 = *((double *)&v23 + 1);
  v13 = *(double *)&v23;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  id location;
  objc_super v18;
  SEL v19;
  MCLTextField *v20;
  CGRect v21;
  __int128 v22;
  __int128 v23;
  CGRect result;

  v21 = a3;
  v20 = self;
  v19 = a2;
  v22 = 0u;
  v23 = 0u;
  v18.receiver = self;
  v18.super_class = (Class)MCLTextField;
  -[MCLTextField placeholderRectForBounds:](&v18, sel_placeholderRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *(_QWORD *)&v22 = v3;
  *((_QWORD *)&v22 + 1) = v4;
  *(_QWORD *)&v23 = v5;
  *((_QWORD *)&v23 + 1) = v6;
  location = (id)-[MCLTextField delegate](v20, "delegate");
  if ((objc_msgSend(location, "conformsToProtocol:", &unk_2553036A0) & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(location, "textField:placeholderRect:bounds:", v20, v22, v23, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    *(_QWORD *)&v15 = v7;
    *((_QWORD *)&v15 + 1) = v8;
    *(_QWORD *)&v16 = v9;
    *((_QWORD *)&v16 + 1) = v10;
    v22 = v15;
    v23 = v16;
  }
  objc_storeStrong(&location, 0);
  v12 = *((double *)&v22 + 1);
  v11 = *(double *)&v22;
  v14 = *((double *)&v23 + 1);
  v13 = *(double *)&v23;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  id location;
  objc_super v18;
  SEL v19;
  MCLTextField *v20;
  CGRect v21;
  __int128 v22;
  __int128 v23;
  CGRect result;

  v21 = a3;
  v20 = self;
  v19 = a2;
  v22 = 0u;
  v23 = 0u;
  v18.receiver = self;
  v18.super_class = (Class)MCLTextField;
  -[MCLTextField editingRectForBounds:](&v18, sel_editingRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *(_QWORD *)&v22 = v3;
  *((_QWORD *)&v22 + 1) = v4;
  *(_QWORD *)&v23 = v5;
  *((_QWORD *)&v23 + 1) = v6;
  location = (id)-[MCLTextField delegate](v20, "delegate");
  if ((objc_msgSend(location, "conformsToProtocol:", &unk_2553036A0) & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(location, "textField:editingRect:bounds:", v20, v22, v23, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    *(_QWORD *)&v15 = v7;
    *((_QWORD *)&v15 + 1) = v8;
    *(_QWORD *)&v16 = v9;
    *((_QWORD *)&v16 + 1) = v10;
    v22 = v15;
    v23 = v16;
  }
  objc_storeStrong(&location, 0);
  v12 = *((double *)&v22 + 1);
  v11 = *(double *)&v22;
  v14 = *((double *)&v23 + 1);
  v13 = *(double *)&v23;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  id location;
  objc_super v18;
  SEL v19;
  MCLTextField *v20;
  CGRect v21;
  __int128 v22;
  __int128 v23;
  CGRect result;

  v21 = a3;
  v20 = self;
  v19 = a2;
  v22 = 0u;
  v23 = 0u;
  v18.receiver = self;
  v18.super_class = (Class)MCLTextField;
  -[MCLTextField clearButtonRectForBounds:](&v18, sel_clearButtonRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *(_QWORD *)&v22 = v3;
  *((_QWORD *)&v22 + 1) = v4;
  *(_QWORD *)&v23 = v5;
  *((_QWORD *)&v23 + 1) = v6;
  location = (id)-[MCLTextField delegate](v20, "delegate");
  if ((objc_msgSend(location, "conformsToProtocol:", &unk_2553036A0) & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(location, "textField:clearButtonRect:bounds:", v20, v22, v23, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    *(_QWORD *)&v15 = v7;
    *((_QWORD *)&v15 + 1) = v8;
    *(_QWORD *)&v16 = v9;
    *((_QWORD *)&v16 + 1) = v10;
    v22 = v15;
    v23 = v16;
  }
  objc_storeStrong(&location, 0);
  v12 = *((double *)&v22 + 1);
  v11 = *(double *)&v22;
  v14 = *((double *)&v23 + 1);
  v13 = *(double *)&v23;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  id location;
  objc_super v18;
  SEL v19;
  MCLTextField *v20;
  CGRect v21;
  __int128 v22;
  __int128 v23;
  CGRect result;

  v21 = a3;
  v20 = self;
  v19 = a2;
  v22 = 0u;
  v23 = 0u;
  v18.receiver = self;
  v18.super_class = (Class)MCLTextField;
  -[MCLTextField leftViewRectForBounds:](&v18, sel_leftViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *(_QWORD *)&v22 = v3;
  *((_QWORD *)&v22 + 1) = v4;
  *(_QWORD *)&v23 = v5;
  *((_QWORD *)&v23 + 1) = v6;
  location = (id)-[MCLTextField delegate](v20, "delegate");
  if ((objc_msgSend(location, "conformsToProtocol:", &unk_2553036A0) & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(location, "textField:leftViewRect:bounds:", v20, v22, v23, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    *(_QWORD *)&v15 = v7;
    *((_QWORD *)&v15 + 1) = v8;
    *(_QWORD *)&v16 = v9;
    *((_QWORD *)&v16 + 1) = v10;
    v22 = v15;
    v23 = v16;
  }
  objc_storeStrong(&location, 0);
  v12 = *((double *)&v22 + 1);
  v11 = *(double *)&v22;
  v14 = *((double *)&v23 + 1);
  v13 = *(double *)&v23;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  id location;
  objc_super v18;
  SEL v19;
  MCLTextField *v20;
  CGRect v21;
  __int128 v22;
  __int128 v23;
  CGRect result;

  v21 = a3;
  v20 = self;
  v19 = a2;
  v22 = 0u;
  v23 = 0u;
  v18.receiver = self;
  v18.super_class = (Class)MCLTextField;
  -[MCLTextField rightViewRectForBounds:](&v18, sel_rightViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *(_QWORD *)&v22 = v3;
  *((_QWORD *)&v22 + 1) = v4;
  *(_QWORD *)&v23 = v5;
  *((_QWORD *)&v23 + 1) = v6;
  location = (id)-[MCLTextField delegate](v20, "delegate");
  if ((objc_msgSend(location, "conformsToProtocol:", &unk_2553036A0) & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(location, "textField:rightViewRect:bounds:", v20, v22, v23, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    *(_QWORD *)&v15 = v7;
    *((_QWORD *)&v15 + 1) = v8;
    *(_QWORD *)&v16 = v9;
    *((_QWORD *)&v16 + 1) = v10;
    v22 = v15;
    v23 = v16;
  }
  objc_storeStrong(&location, 0);
  v12 = *((double *)&v22 + 1);
  v11 = *(double *)&v22;
  v14 = *((double *)&v23 + 1);
  v13 = *(double *)&v23;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  MCLTextField *v5;
  NSString *v6;
  id v7;
  objc_super v8;
  char v9;
  id location;
  SEL v11;
  SEL v12;
  MCLTextField *v13;
  char v14;

  v13 = self;
  v12 = a2;
  v11 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v9 = 0;
  v8.receiver = v13;
  v8.super_class = (Class)MCLTextField;
  v9 = -[MCLTextField canPerformAction:withSender:](&v8, sel_canPerformAction_withSender_, v11, location);
  v7 = (id)-[MCLTextField delegate](v13, "delegate");
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_2553036A0) & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = v13;
    v6 = NSStringFromSelector(v11);
    v14 = objc_msgSend(v7, "textField:canPerformAction:withSender:defaultValue:", v5) & 1;

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
  MCLTextField *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("enablesReturnKeyAutomatically")) & 1) != 0)
  {
    v4 = objc_msgSend(location[0], "BOOLValue");
    -[MCLTextField setEnablesReturnKeyAutomatically:](v14, "setEnablesReturnKeyAutomatically:", v4 & 1);
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("returnKeyType")) & 1) != 0)
  {
    v5 = objc_msgSend(location[0], "integerValue");
    -[MCLTextField setReturnKeyType:](v14, "setReturnKeyType:", v5);
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("keyboardType")) & 1) != 0)
  {
    v6 = objc_msgSend(location[0], "integerValue");
    -[MCLTextField setKeyboardType:](v14, "setKeyboardType:", v6);
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("autocorrectionType")) & 1) != 0)
  {
    v7 = objc_msgSend(location[0], "integerValue");
    -[MCLTextField setAutocorrectionType:](v14, "setAutocorrectionType:", v7);
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("autocapitalizationType")) & 1) != 0)
  {
    v8 = objc_msgSend(location[0], "integerValue");
    -[MCLTextField setAutocapitalizationType:](v14, "setAutocapitalizationType:", v8);
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("spellCheckingType")) & 1) != 0)
  {
    v9 = objc_msgSend(location[0], "integerValue");
    -[MCLTextField setSpellCheckingType:](v14, "setSpellCheckingType:", v9);
  }
  else
  {
    v11.receiver = v14;
    v11.super_class = (Class)MCLTextField;
    -[MCLTextField setValue:forUndefinedKey:](&v11, sel_setValue_forUndefinedKey_, location[0], v12);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

@end
