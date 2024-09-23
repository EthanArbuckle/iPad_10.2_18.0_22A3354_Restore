@implementation FBAPINEntryView

- (void)awakeFromNib
{
  id WeakRetained;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  _QWORD v26[6];

  v24.receiver = self;
  v24.super_class = (Class)FBAPINEntryView;
  -[FBAPINEntryView awakeFromNib](&v24, "awakeFromNib");
  WeakRetained = objc_loadWeakRetained((id *)&self->_pinLabel1);
  v26[0] = WeakRetained;
  v4 = objc_loadWeakRetained((id *)&self->_pinLabel2);
  v26[1] = v4;
  v5 = objc_loadWeakRetained((id *)&self->_pinLabel3);
  v26[2] = v5;
  v6 = objc_loadWeakRetained((id *)&self->_pinLabel4);
  v26[3] = v6;
  v7 = objc_loadWeakRetained((id *)&self->_pinLabel5);
  v26[4] = v7;
  v8 = objc_loadWeakRetained((id *)&self->_pinLabel6);
  v26[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 6));
  -[FBAPINEntryView setDigits:](self, "setDigits:", v9);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPINEntryView digits](self, "digits", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
        objc_msgSend(v15, "setTextColor:", v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "superview"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
        objc_msgSend(v17, "setBackgroundColor:", v18);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v12);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[FBAPINEntryView setBackgroundColor:](self, "setBackgroundColor:", v19);

}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  if (a3)
    -[FBAPINEntryView resignFirstResponder](self, "resignFirstResponder");
  else
    -[FBAPINEntryView becomeFirstResponder](self, "becomeFirstResponder");
}

- (NSString)text
{
  NSMutableString *text;

  text = self->_text;
  if (text)
    return (NSString *)-[NSMutableString copy](text, "copy");
  else
    return (NSString *)&stru_1000EA660;
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

  -[FBAPINEntryView _updateLabels](self, "_updateLabels");
}

- (void)_updateLabels
{
  char *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void (**textChangedHandler)(id, NSMutableString *);
  NSMutableString *text;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (char *)-[NSMutableString length](self->_text, "length");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_digits;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((char *)i + v7 >= v3)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "setText:", &stru_1000EA660, (_QWORD)v14);
        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString substringWithRange:](self->_text, "substringWithRange:"));
          objc_msgSend(v10, "setText:", v11);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 += (uint64_t)i;
    }
    while (v6);
  }

  textChangedHandler = (void (**)(id, NSMutableString *))self->_textChangedHandler;
  if (textChangedHandler)
  {
    if (self->_text)
      text = self->_text;
    else
      text = (NSMutableString *)&stru_1000EA660;
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
    -[FBAPINEntryView _updateLabels](self, "_updateLabels");
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

    -[FBAPINEntryView _updateLabels](self, "_updateLabels");
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UILabel)pinLabel1
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_pinLabel1);
}

- (void)setPinLabel1:(id)a3
{
  objc_storeWeak((id *)&self->_pinLabel1, a3);
}

- (UILabel)pinLabel2
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_pinLabel2);
}

- (void)setPinLabel2:(id)a3
{
  objc_storeWeak((id *)&self->_pinLabel2, a3);
}

- (UILabel)pinLabel3
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_pinLabel3);
}

- (void)setPinLabel3:(id)a3
{
  objc_storeWeak((id *)&self->_pinLabel3, a3);
}

- (UILabel)pinLabel4
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_pinLabel4);
}

- (void)setPinLabel4:(id)a3
{
  objc_storeWeak((id *)&self->_pinLabel4, a3);
}

- (UILabel)pinLabel5
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_pinLabel5);
}

- (void)setPinLabel5:(id)a3
{
  objc_storeWeak((id *)&self->_pinLabel5, a3);
}

- (UILabel)pinLabel6
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_pinLabel6);
}

- (void)setPinLabel6:(id)a3
{
  objc_storeWeak((id *)&self->_pinLabel6, a3);
}

- (NSArray)digits
{
  return self->_digits;
}

- (void)setDigits:(id)a3
{
  objc_storeStrong((id *)&self->_digits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digits, 0);
  objc_destroyWeak((id *)&self->_pinLabel6);
  objc_destroyWeak((id *)&self->_pinLabel5);
  objc_destroyWeak((id *)&self->_pinLabel4);
  objc_destroyWeak((id *)&self->_pinLabel3);
  objc_destroyWeak((id *)&self->_pinLabel2);
  objc_destroyWeak((id *)&self->_pinLabel1);
  objc_storeStrong(&self->_textChangedHandler, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
