@implementation AFUIInputTraits

+ (id)traitsByAdoptingTraits:(id)a3
{
  id v4;
  id *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = (id *)objc_msgSend(v4, "copy");
  else
    v5 = 0;
  if (!_AFUITraitsClass())
    goto LABEL_16;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_25646E140))
  {
    objc_msgSend(v4, "extendedTextInputTraits");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v7 = (void *)v6;

    v4 = v7;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_25646E9E0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "extendedTraitsDelegate");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_12:
    objc_msgSend(v4, "textInputTraits");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_25646F028) && (objc_opt_respondsToSelector() & 1) != 0)
    goto LABEL_12;
LABEL_14:
  _AFUITraitsClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "_traitsWithUITraits:", v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id *)v8;
  }
LABEL_16:
  if (!v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "_traitsWithRTITraits:", v4);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "_traitsWithTITraits:", v4);
      else
        objc_msgSend(a1, "_traitsWithObject:", v4);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (id *)v9;
  }
  if (objc_msgSend(v5, "isSecureTextEntry")
    && (objc_msgSend(v5, "displaySecureTextUsingPlainText") & 1) == 0)
  {
    objc_msgSend(v5[2], "setAutocorrectionType:", 1);
  }
  if (objc_msgSend(v5, "keyboardType") == 10)
    objc_msgSend(v5[2], "setReturnKeyType:", 1);

  return v5;
}

+ (id)_traitsWithObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BEB4EB8]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setAutocorrectionType:", objc_msgSend(v4, "autocorrectionType"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setKeyboardType:", objc_msgSend(v4, "keyboardType"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setReturnKeyType:", objc_msgSend(v4, "returnKeyType"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setSecureTextEntry:", objc_msgSend(v4, "isSecureTextEntry"));
  _AFUISecureTextFieldClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setSecureTextEntry:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "textContentType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "setTextContentType:", v6);

  }
  objc_msgSend(a1, "_traitsWithTITraits:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "setDisplaySecureTextUsingPlainText:", objc_msgSend(v4, "displaySecureTextUsingPlainText"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "setDisplaySecureTextUsingPlainText:", objc_msgSend(v4, "_bulletCharacter") == 1);

  return v7;
}

- (void)setDisplaySecureTextUsingPlainText:(BOOL)a3
{
  self->_displaySecureTextUsingPlainText = a3;
}

+ (id)_traitsWithTITraits:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[2];
  v5[2] = v4;

  return v5;
}

- (NSString)textContentType
{
  return (NSString *)-[TITextInputTraits textContentType](self->_traits, "textContentType");
}

- (BOOL)isSecureTextEntry
{
  return -[TITextInputTraits secureTextEntry](self->_traits, "secureTextEntry");
}

- (unint64_t)keyboardType
{
  return -[TITextInputTraits keyboardType](self->_traits, "keyboardType");
}

- (unint64_t)returnKeyType
{
  return -[TITextInputTraits returnKeyType](self->_traits, "returnKeyType");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
}

- (unint64_t)autocorrectionType
{
  return -[TITextInputTraits autocorrectionType](self->_traits, "autocorrectionType");
}

+ (id)_traitsWithRTITraits:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_traitsWithTITraits:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_traitsWithUITraits:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEB4EB8], "traitsForUITextInputTraits:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_traitsWithTITraits:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDisplaySecureTextUsingPlainText:", objc_msgSend(v4, "displaySecureTextUsingPlainText"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[TITextInputTraits copy](self->_traits, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  *(_BYTE *)(v4 + 8) = self->_displaySecureTextUsingPlainText;
  return (id)v4;
}

- (TITextInputTraits)traits
{
  return self->_traits;
}

- (BOOL)displaySecureTextUsingPlainText
{
  return self->_displaySecureTextUsingPlainText;
}

@end
