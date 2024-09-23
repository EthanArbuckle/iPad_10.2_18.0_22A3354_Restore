@implementation CDPUIAccessCodeEntryTextField

- (CDPUIAccessCodeEntryTextField)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  CDPUIAccessCodeEntryTextField *v8;
  void *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)CDPUIAccessCodeEntryTextField;
  v8 = -[CDPUIAccessCodeEntryTextField initWithFrame:textContainer:](&v11, sel_initWithFrame_textContainer_, a4);
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA88]), "initWithFrame:textContainer:", 0, x, y, width, height);
    -[CDPUIAccessCodeEntryTextField setPlaceholderTextView:](v8, "setPlaceholderTextView:", v9);

    -[CDPUIAccessCodeEntryTextField setupUI](v8, "setupUI");
    -[CDPUIAccessCodeEntryTextField setupSeparatorLocations](v8, "setupSeparatorLocations");
  }
  return v8;
}

- (void)setupUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  -[CDPUIAccessCodeEntryTextField setAutocorrectionType:](self, "setAutocorrectionType:", 1);
  -[CDPUIAccessCodeEntryTextField setReturnKeyType:](self, "setReturnKeyType:", 9);
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIAccessCodeEntryTextField setTextColor:](self, "setTextColor:", v3);

  -[CDPUIAccessCodeEntryTextField setSpellCheckingType:](self, "setSpellCheckingType:", 1);
  -[CDPUIAccessCodeEntryTextField setAutocapitalizationType:](self, "setAutocapitalizationType:", 3);
  -[CDPUIAccessCodeEntryTextField placeholderTextView](self, "placeholderTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoresizingMask:", 18);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray2Color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIAccessCodeEntryTextField placeholderTextView](self, "placeholderTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIAccessCodeEntryTextField placeholderTextView](self, "placeholderTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[CDPUIAccessCodeEntryTextField placeholderTextView](self, "placeholderTextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", 0);

  -[CDPUIAccessCodeEntryTextField setDelegate:](self, "setDelegate:", self);
  -[CDPUIAccessCodeEntryTextField bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[CDPUIAccessCodeEntryTextField placeholderTextView](self, "placeholderTextView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  -[CDPUIAccessCodeEntryTextField placeholderTextView](self, "placeholderTextView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setEditable:", 0);

  -[CDPUIAccessCodeEntryTextField placeholderTextView](self, "placeholderTextView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[CDPUIAccessCodeEntryTextField addSubview:](self, "addSubview:", v20);

}

- (void)setupSeparatorLocations
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *separatorLocations;
  NSSet *v10;
  NSSet *separatorDeleteLocations;
  id v12;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CDPUIAccessCodeEntryTextField _numberOfSeparators](self, "_numberOfSeparators"))
  {
    v4 = 0;
    v5 = 4;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v6);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5 + 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

      ++v4;
      v5 += 5;
    }
    while (-[CDPUIAccessCodeEntryTextField _numberOfSeparators](self, "_numberOfSeparators") > v4);
  }
  v8 = (NSSet *)objc_msgSend(v12, "copy");
  separatorLocations = self->_separatorLocations;
  self->_separatorLocations = v8;

  v10 = (NSSet *)objc_msgSend(v3, "copy");
  separatorDeleteLocations = self->_separatorDeleteLocations;
  self->_separatorDeleteLocations = v10;

}

+ (unint64_t)accessKeyCharacterCount
{
  if (accessKeyCharacterCount_onceToken != -1)
    dispatch_once(&accessKeyCharacterCount_onceToken, &__block_literal_global_2);
  return accessKeyCharacterCount_textInputLength;
}

void __56__CDPUIAccessCodeEntryTextField_accessKeyCharacterCount__block_invoke()
{
  void *v0;
  id v1;

  CDPLocalizedString();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_24C857A78);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  accessKeyCharacterCount_textInputLength = objc_msgSend(v0, "length");

}

+ (unint64_t)wrappingKeyCharacterCount
{
  return 69;
}

- (BOOL)isComplete
{
  CDPUIAccessCodeEntryTextField *v2;
  void *v3;
  uint64_t v4;

  v2 = self;
  -[CDPUIAccessCodeEntryTextField text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  LOBYTE(v2) = v4 == -[CDPUIAccessCodeEntryTextField _totalCharacterLimit](v2, "_totalCharacterLimit");

  return (char)v2;
}

- (BOOL)enablesReturnKeyAutomatically
{
  return 1;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CDPUIAccessCodeEntryTextField;
  -[CDPUIAccessCodeEntryTextField layoutSubviews](&v13, sel_layoutSubviews);
  -[CDPUIAccessCodeEntryTextField bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CDPUIAccessCodeEntryTextField placeholderTextView](self, "placeholderTextView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[CDPUIAccessCodeEntryTextField placeholderTextView](self, "placeholderTextView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAutoresizingMask:", 18);

}

- (void)setFont:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPUIAccessCodeEntryTextField;
  -[CDPUIAccessCodeEntryTextField setFont:](&v6, sel_setFont_, a3);
  -[CDPUIAccessCodeEntryTextField font](self, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIAccessCodeEntryTextField placeholderTextView](self, "placeholderTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (void)setTextAlignment:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPUIAccessCodeEntryTextField;
  -[CDPUIAccessCodeEntryTextField setTextAlignment:](&v6, sel_setTextAlignment_, a3);
  v4 = -[CDPUIAccessCodeEntryTextField textAlignment](self, "textAlignment");
  -[CDPUIAccessCodeEntryTextField placeholderTextView](self, "placeholderTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", v4);

}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CDPUIAccessCodeEntryTextField;
  -[CDPUIAccessCodeEntryTextField setText:](&v4, sel_setText_, a3);
  -[CDPUIAccessCodeEntryTextField updatePlaceholderVisibility](self, "updatePlaceholderVisibility");
}

- (void)setPlaceholder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *placeholder;
  id v7;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  placeholder = self->_placeholder;
  self->_placeholder = v5;

  -[CDPUIAccessCodeEntryTextField placeholderTextView](self, "placeholderTextView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v4);

}

- (void)updatePlaceholderVisibility
{
  _BOOL8 v3;
  void *v4;
  id v5;

  -[CDPUIAccessCodeEntryTextField text](self, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "length") != 0;
  -[CDPUIAccessCodeEntryTextField placeholderTextView](self, "placeholderTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (id)viewForFirstBaselineLayout
{
  void *v2;
  void *v3;

  -[CDPUIAccessCodeEntryTextField placeholderTextView](self, "placeholderTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForFirstBaselineLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)viewForLastBaselineLayout
{
  void *v2;
  void *v3;

  -[CDPUIAccessCodeEntryTextField placeholderTextView](self, "placeholderTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForLastBaselineLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  BOOL v15;
  NSSet *separatorLocations;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSSet *separatorDeleteLocations;
  void *v23;
  void *v24;

  length = a4.length;
  location = a4.location;
  v8 = a5;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("\n"))
    || (-[CDPUIAccessCodeEntryTextField accessCodeInputDelegate](self, "accessCodeInputDelegate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_opt_respondsToSelector(),
        v9,
        (v10 & 1) == 0))
  {
    if (location >= -[CDPUIAccessCodeEntryTextField _totalCharacterLimit](self, "_totalCharacterLimit"))
      goto LABEL_7;
    -[CDPUIAccessCodeEntryTextField _sanitizeInputString:](self, "_sanitizeInputString:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CDPUIAccessCodeEntryTextField text](self, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = location < objc_msgSend(v13, "length") && objc_msgSend(v12, "length") != 0;

    if ((unint64_t)objc_msgSend(v12, "length") > 1 || v14)
    {
      -[CDPUIAccessCodeEntryTextField _handleMultiCharacterStringInput:range:](self, "_handleMultiCharacterStringInput:range:", v12, location, length);
LABEL_19:
      v15 = 0;
      goto LABEL_21;
    }
    if (length == 1)
    {
      separatorDeleteLocations = self->_separatorDeleteLocations;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", location);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(separatorDeleteLocations) = -[NSSet containsObject:](separatorDeleteLocations, "containsObject:", v23);

      if ((_DWORD)separatorDeleteLocations)
      {
        -[CDPUIAccessCodeEntryTextField text](self, "text");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringByReplacingCharactersInRange:withString:", location - 1, 2, &stru_24C857A78);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDPUIAccessCodeEntryTextField setText:](self, "setText:", v24);

        goto LABEL_18;
      }
    }
    else if (!length)
    {
      separatorLocations = self->_separatorLocations;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", location);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(separatorLocations) = -[NSSet containsObject:](separatorLocations, "containsObject:", v17);

      if ((_DWORD)separatorLocations)
      {
        v18 = (void *)MEMORY[0x24BDD17C8];
        -[CDPUIAccessCodeEntryTextField text](self, "text");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uppercaseString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@%@%@"), v19, CFSTR("-"), v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDPUIAccessCodeEntryTextField setText:](self, "setText:", v21);

LABEL_18:
        goto LABEL_19;
      }
    }
    v15 = 1;
    goto LABEL_21;
  }
  -[CDPUIAccessCodeEntryTextField accessCodeInputDelegate](self, "accessCodeInputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessCodeEntryTextFieldDidReturn:", self);

LABEL_7:
  v15 = 0;
  v12 = v8;
LABEL_21:

  return v15;
}

- (void)textViewDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CDPUIAccessCodeEntryTextField updatePlaceholderVisibility](self, "updatePlaceholderVisibility", a3);
  -[CDPUIAccessCodeEntryTextField text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIAccessCodeEntryTextField setText:](self, "setText:", v5);

  -[CDPUIAccessCodeEntryTextField accessCodeInputDelegate](self, "accessCodeInputDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessCodeEntryTextFieldDidUpdate:", self);

}

- (unint64_t)_totalCharacterLimit
{
  uint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "accessKeyCharacterCount");
  return -[CDPUIAccessCodeEntryTextField _numberOfSeparators](self, "_numberOfSeparators") + v3;
}

- (unint64_t)_numberOfSeparators
{
  return ((unint64_t)objc_msgSend((id)objc_opt_class(), "accessKeyCharacterCount") >> 2) - 1;
}

- (void)_handleMultiCharacterStringInput:(id)a3 range:(_NSRange)a4
{
  NSUInteger location;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  location = a4.location;
  v16 = a3;
  -[CDPUIAccessCodeEntryTextField text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length") >= location)
  {
    objc_msgSend(v6, "substringToIndex:", location);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_24C857A78;
  }
  if (objc_msgSend(v6, "length") >= location)
  {
    objc_msgSend(v6, "substringFromIndex:", location);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_24C857A78);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_24C857A78;
  }
  objc_msgSend(v16, "stringByAppendingString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDPUIAccessCodeEntryTextField setText:](self, "setText:", v7);
  if (objc_msgSend(v10, "length"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(v10, "substringWithRange:", v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[CDPUIAccessCodeEntryTextField textView:shouldChangeTextInRange:replacementText:](self, "textView:shouldChangeTextInRange:replacementText:", self, location, 0, v12))
      {
        -[CDPUIAccessCodeEntryTextField text](self, "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uppercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDPUIAccessCodeEntryTextField setText:](self, "setText:", v15);

      }
      else
      {
        ++location;
      }
      ++location;

      ++v11;
    }
    while (v11 < objc_msgSend(v10, "length"));
  }
  -[CDPUIAccessCodeEntryTextField setSelectedRange:](self, "setSelectedRange:", location, 0);

}

- (id)_sanitizeInputString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "alphanumericCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsJoinedByString:", &stru_24C857A78);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (CDPUIAccessCodeEntryTextFieldDelegate)accessCodeInputDelegate
{
  return (CDPUIAccessCodeEntryTextFieldDelegate *)objc_loadWeakRetained((id *)&self->_accessCodeInputDelegate);
}

- (void)setAccessCodeInputDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessCodeInputDelegate, a3);
}

- (UITextView)placeholderTextView
{
  return self->_placeholderTextView;
}

- (void)setPlaceholderTextView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderTextView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderTextView, 0);
  objc_destroyWeak((id *)&self->_accessCodeInputDelegate);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_separatorDeleteLocations, 0);
  objc_storeStrong((id *)&self->_separatorLocations, 0);
}

@end
