@implementation PINEntryView

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  if (a3)
    -[PINEntryView resignFirstResponder](self, "resignFirstResponder");
  else
    -[PINEntryView becomeFirstResponder](self, "becomeFirstResponder");
}

- (NSString)text
{
  NSMutableString *text;

  text = self->_text;
  if (text)
    return (NSString *)-[NSMutableString copy](text, "copy");
  else
    return (NSString *)&stru_10017E3D8;
}

- (void)setText:(id)a3
{
  void *v4;
  NSMutableString *v5;
  NSMutableString *text;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "uppercaseString"));
  v5 = (NSMutableString *)objc_msgSend(v4, "mutableCopy");
  text = self->_text;
  self->_text = v5;

  -[PINEntryView _updateLabels](self, "_updateLabels");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PINEntryView;
  -[PINEntryView touchesBegan:withEvent:](&v5, "touchesBegan:withEvent:", a3, a4);
  if (!self->_disabled)
    -[PINEntryView becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)_updateLabels
{
  NSUInteger v3;
  __CFString *v4;
  char *v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  UIColor *wellFocusColor;
  UIColor *v15;
  UIColor *v16;
  NSArray *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  void *v24;
  double v25;
  void *v26;
  void (**textChangedHandler)(id, const __CFString *);
  const __CFString *text;
  PINEntryView *v29;
  char *v30;
  __CFString *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v3 = -[NSArray count](self->_wells, "count");
  v4 = CFSTR("-");
  if (v3)
    v4 = &stru_10017E3D8;
  v31 = v4;
  v5 = (char *)-[NSMutableString length](self->_text, "length");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = self->_digits;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        if ((char *)i + v9 >= v5)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "setText:", v31);
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString substringWithRange:](self->_text, "substringWithRange:"));
          objc_msgSend(v12, "setText:", v13);

        }
      }
      v9 += (uint64_t)i;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v8);
  }

  wellFocusColor = self->_wellFocusColor;
  if (wellFocusColor)
    v15 = wellFocusColor;
  else
    v15 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
  v16 = v15;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v29 = self;
  v17 = self->_wells;
  v18 = (char *)-[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v33;
    do
    {
      v22 = 0;
      v30 = v20;
      v23 = (char *)(v5 - v20);
      do
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v17);
        v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v22);
        if (v23 == v22)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v22), "setBorderColor:", v16);
          v25 = 2.0;
        }
        else
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.800000012, 1.0));
          objc_msgSend(v24, "setBorderColor:", v26);

          v25 = 1.5;
        }
        objc_msgSend(v24, "setBorderWidth:", v25, v29);
        ++v22;
      }
      while (v19 != v22);
      v20 = &v19[(_QWORD)v30];
      v19 = (char *)-[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v19);
  }

  textChangedHandler = (void (**)(id, const __CFString *))v29->_textChangedHandler;
  if (textChangedHandler)
  {
    if (v29->_text)
      text = (const __CFString *)v29->_text;
    else
      text = &stru_10017E3D8;
    textChangedHandler[2](textChangedHandler, text);
  }

}

- (int64_t)autocapitalizationType
{
  return 3;
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)deleteBackward
{
  NSMutableString *text;
  id v4;
  uint64_t v5;

  if (-[NSMutableString length](self->_text, "length"))
  {
    text = self->_text;
    v4 = -[NSMutableString rangeOfComposedCharacterSequenceAtIndex:](text, "rangeOfComposedCharacterSequenceAtIndex:", (char *)-[NSMutableString length](text, "length") - 1);
    -[NSMutableString deleteCharactersInRange:](text, "deleteCharactersInRange:", v4, v5);
    -[PINEntryView _updateLabels](self, "_updateLabels");
  }
}

- (void)insertText:(id)a3
{
  NSMutableString *v4;
  NSMutableString *text;
  id v6;
  NSMutableString *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!self->_text)
  {
    v4 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    text = self->_text;
    self->_text = v4;

  }
  v6 = -[NSArray count](self->_digits, "count");
  if (v6 != -[NSMutableString length](self->_text, "length"))
  {
    v7 = self->_text;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uppercaseString"));
    -[NSMutableString appendString:](v7, "appendString:", v8);

    -[PINEntryView _updateLabels](self, "_updateLabels");
  }

}

- (BOOL)hasText
{
  return -[NSMutableString length](self->_text, "length") != 0;
}

- (int64_t)keyboardAppearance
{
  return 2;
}

- (int64_t)keyboardType
{
  if (self->_alphaNumeric)
    return 6;
  else
    return 11;
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (BOOL)alphaNumeric
{
  return self->_alphaNumeric;
}

- (void)setAlphaNumeric:(BOOL)a3
{
  self->_alphaNumeric = a3;
}

- (NSArray)digits
{
  return self->_digits;
}

- (void)setDigits:(id)a3
{
  objc_storeStrong((id *)&self->_digits, a3);
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (id)textChangedHandler
{
  return self->_textChangedHandler;
}

- (void)setTextChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)wells
{
  return self->_wells;
}

- (void)setWells:(id)a3
{
  objc_storeStrong((id *)&self->_wells, a3);
}

- (UIColor)wellFocusColor
{
  return self->_wellFocusColor;
}

- (void)setWellFocusColor:(id)a3
{
  objc_storeStrong((id *)&self->_wellFocusColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wellFocusColor, 0);
  objc_storeStrong((id *)&self->_wells, 0);
  objc_storeStrong(&self->_textChangedHandler, 0);
  objc_storeStrong((id *)&self->_digits, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
