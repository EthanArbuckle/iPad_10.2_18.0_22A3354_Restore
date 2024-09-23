@implementation PHLCDViewTextField

- (PHLCDViewTextField)initWithFrame:(CGRect)a3
{
  PHLCDViewTextField *v3;
  void *v4;
  void *v5;
  NSCharacterSet *v6;
  void *v7;
  NSCharacterSet *specialDialerCharacters;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHLCDViewTextField;
  v3 = -[PHLCDViewTextField initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "_textFieldDidUpdate:", UITextFieldTextDidChangeNotification, v3);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet unicodeDirectionalCharactersSet](NSCharacterSet, "unicodeDirectionalCharactersSet"));
    v6 = (NSCharacterSet *)objc_msgSend(v5, "mutableCopy");

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(" -./()")));
    -[NSCharacterSet formUnionWithCharacterSet:](v6, "formUnionWithCharacterSet:", v7);

    specialDialerCharacters = v3->_specialDialerCharacters;
    v3->_specialDialerCharacters = v6;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField textInputTraits](v3, "textInputTraits"));
    objc_msgSend(v9, "setContentsIsSingleValue:", 1);

    -[PHLCDViewTextField setNonEditingLinebreakMode:](v3, "setNonEditingLinebreakMode:", 3);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHLCDViewTextField;
  -[PHLCDViewTextField dealloc](&v4, "dealloc");
}

- (void)reformatText
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t Length;
  objc_super v17;
  unint64_t v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField text](self, "text"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = -[PHLCDViewTextField isEditing](self, "isEditing")
       ? -[PHLCDViewTextField selectionRange](self, "selectionRange")
       : 0;
    v18 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField previousTextSuggestion](self, "previousTextSuggestion"));
    v6 = TUNetworkCountryCode();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v7)
    {
      v8 = (const __CFString *)_PNCopyFormattedNumberSuggestionForDigitsWithCountry(v3, v4, v5, &v18, v7);
    }
    else
    {
      v9 = TUHomeCountryCode();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v8 = (const __CFString *)_PNCopyFormattedNumberSuggestionForDigitsWithCountry(v3, v4, v5, &v18, v10);

    }
    if (v8)
    {
      v11 = TUNetworkCountryCode();
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (v12)
      {
        v13 = (void *)PNCreateFormattedStringWithCountry(v8, v12, 2, 0);
      }
      else
      {
        v14 = TUHomeCountryCode();
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v13 = (void *)PNCreateFormattedStringWithCountry(v8, v15, 2, 0);

      }
      if ((objc_msgSend(v3, "isEqualToString:", v13) & 1) == 0)
      {
        v17.receiver = self;
        v17.super_class = (Class)PHLCDViewTextField;
        -[PHLCDViewTextField setText:](&v17, "setText:", v13);
        if (-[PHLCDViewTextField isEditing](self, "isEditing"))
        {
          Length = v18;
          if (Length > CFStringGetLength(v8))
            Length = CFStringGetLength(v8);
          -[PHLCDViewTextField setSelectionRange:](self, "setSelectionRange:", Length + 1, 0);
        }
      }
      -[PHLCDViewTextField setPreviousTextSuggestion:](self, "setPreviousTextSuggestion:", v13);
      CFRelease(v8);

    }
  }

}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)isUserInteractionEnabled
{
  return 1;
}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHLCDViewTextField;
  -[PHLCDViewTextField setText:](&v4, "setText:", a3);
  -[PHLCDViewTextField reformatText](self, "reformatText");
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHLCDViewTextField;
  -[PHLCDViewTextField replaceRange:withText:](&v5, "replaceRange:withText:", a3, a4);
  -[PHLCDViewTextField reformatText](self, "reformatText");
}

- (void)deleteBackward
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField selectedTextRange](self, "selectedTextRange"));
  v4 = objc_msgSend(v3, "isEmpty");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField beginningOfDocument](self, "beginningOfDocument"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField selectedTextRange](self, "selectedTextRange"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "end"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v5, v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField textInRange:](self, "textInRange:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField specialDialerCharacters](self, "specialDialerCharacters"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "invertedSet"));
    v12 = (char *)objc_msgSend(v9, "rangeOfCharacterFromSet:options:", v11, 4);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField beginningOfDocument](self, "beginningOfDocument"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField positionFromPosition:offset:](self, "positionFromPosition:offset:", v13, v12 + 1));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v14, v14));
    -[PHLCDViewTextField setSelectedTextRange:](self, "setSelectedTextRange:", v15);
    v16.receiver = self;
    v16.super_class = (Class)PHLCDViewTextField;
    -[PHLCDViewTextField deleteBackward](&v16, "deleteBackward");

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField selectedTextRange](self, "selectedTextRange"));
    -[PHLCDViewTextField replaceRange:withText:](self, "replaceRange:withText:", v9, &stru_10028DC20);
  }

  -[PHLCDViewTextField reformatText](self, "reformatText");
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHLCDViewTextField;
  v5 = -[PHLCDViewTextField canPerformAction:withSender:](&v7, "canPerformAction:withSender:", a3, a4);
  return NSSelectorFromString(CFSTR("_define:")) != a3 && v5;
}

- (void)_textFieldDidUpdate:(id)a3
{
  PHLCDViewTextFieldDelegate **p_lcdViewTextFieldDelegate;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;

  p_lcdViewTextFieldDelegate = &self->_lcdViewTextFieldDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lcdViewTextFieldDelegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "textField:didUpdateString:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_lcdViewTextFieldDelegate);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField text](self, "text"));
    objc_msgSend(v7, "textField:didUpdateString:", self, v8);

  }
  v12 = (id)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField selectedTextRange](self, "selectedTextRange"));
  if (objc_msgSend(v12, "isEmpty"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "end"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField endOfDocument](self, "endOfDocument"));
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (v11)
      -[PHLCDViewTextField endEditing:](self, "endEditing:", 1);
  }
  -[PHLCDViewTextField reformatText](self, "reformatText");

}

- (PHLCDViewTextFieldDelegate)lcdViewTextFieldDelegate
{
  return (PHLCDViewTextFieldDelegate *)objc_loadWeakRetained((id *)&self->_lcdViewTextFieldDelegate);
}

- (void)setLcdViewTextFieldDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_lcdViewTextFieldDelegate, a3);
}

- (NSCharacterSet)specialDialerCharacters
{
  return self->_specialDialerCharacters;
}

- (void)setSpecialDialerCharacters:(id)a3
{
  objc_storeStrong((id *)&self->_specialDialerCharacters, a3);
}

- (NSString)previousTextSuggestion
{
  return self->_previousTextSuggestion;
}

- (void)setPreviousTextSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_previousTextSuggestion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTextSuggestion, 0);
  objc_storeStrong((id *)&self->_specialDialerCharacters, 0);
  objc_destroyWeak((id *)&self->_lcdViewTextFieldDelegate);
}

@end
