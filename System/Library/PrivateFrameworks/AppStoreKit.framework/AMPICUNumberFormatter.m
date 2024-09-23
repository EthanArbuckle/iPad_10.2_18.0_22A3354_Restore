@implementation AMPICUNumberFormatter

- (AMPICUNumberFormatter)init
{
  return -[AMPICUNumberFormatter initWithExtendedStyle:locale:](self, "initWithExtendedStyle:locale:", 0, 0);
}

- (AMPICUNumberFormatter)initWithExtendedStyle:(unint64_t)a3 locale:(id)a4
{
  id v6;
  AMPICUNumberFormatter *v7;
  AMPICUNumberFormatter *v8;
  AMPICUNumberFormatter *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AMPICUNumberFormatter;
  v7 = -[AMPICUNumberFormatter init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_extendedStyle = a3;
    -[AMPICUNumberFormatter setLocale:](v7, "setLocale:", v6);
    v9 = v8;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (-[AMPICUNumberFormatter _icuNumberFormatter](self, "_icuNumberFormatter"))
  {
    -[AMPICUNumberFormatter _icuNumberFormatter](self, "_icuNumberFormatter");
    unum_close();
    -[AMPICUNumberFormatter set_icuNumberFormatter:](self, "set_icuNumberFormatter:", 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)AMPICUNumberFormatter;
  -[AMPICUNumberFormatter dealloc](&v3, sel_dealloc);
}

- (void)setLocale:(id)a3
{
  id v4;
  id obj;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  obj = v4;
  if ((objc_msgSend(v4, "isEqual:", self->_locale) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_locale, obj);
    -[AMPICUNumberFormatter setExtendedStyle:](self, "setExtendedStyle:", self->_extendedStyle);
  }

}

- (BOOL)usesGroupingSeparator
{
  void **v3;

  v3 = -[AMPICUNumberFormatter _icuNumberFormatter](self, "_icuNumberFormatter");
  if (v3)
  {
    -[AMPICUNumberFormatter _icuNumberFormatter](self, "_icuNumberFormatter");
    LOBYTE(v3) = unum_getAttribute() != 0;
  }
  return (char)v3;
}

- (void)setUsesGroupingSeparator:(BOOL)a3
{
  if (-[AMPICUNumberFormatter _icuNumberFormatter](self, "_icuNumberFormatter"))
  {
    -[AMPICUNumberFormatter _icuNumberFormatter](self, "_icuNumberFormatter");
    unum_setAttribute();
  }
}

- (void)setExtendedStyle:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  _BYTE *v8;
  void *v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  void **v14;
  int v15;
  _WORD v16[768];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[AMPICUNumberFormatter locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMPICUNumberFormatter set_localeIdentifierBeingUsed:](self, "set_localeIdentifierBeingUsed:", v6);

  -[AMPICUNumberFormatter set_currencyCodeBeingUsed:](self, "set_currencyCodeBeingUsed:", 0);
  if (v5)
  {
    -[AMPICUNumberFormatter _localeIdentifierBeingUsed](self, "_localeIdentifierBeingUsed");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (_BYTE *)objc_msgSend(v7, "UTF8String");

    if (v8)
    {
      if (*v8)
      {
        if (-[AMPICUNumberFormatter _icuNumberFormatter](self, "_icuNumberFormatter"))
        {
          -[AMPICUNumberFormatter _icuNumberFormatter](self, "_icuNumberFormatter");
          unum_close();
          -[AMPICUNumberFormatter set_icuNumberFormatter:](self, "set_icuNumberFormatter:", 0);
        }
        self->_extendedStyle = a3;
        v9 = 0;
        v10 = 0;
        switch(a3)
        {
          case 0uLL:
            break;
          case 1uLL:
            v9 = 0;
            v10 = 0;
            break;
          case 2uLL:
          case 3uLL:
            objc_msgSend(v5, "currencyCode");
            v10 = 1;
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          default:
            v9 = 0;
            v10 = 0;
            self->_extendedStyle = 0;
            break;
        }
        -[AMPICUNumberFormatter set_currencyCodeBeingUsed:](self, "set_currencyCodeBeingUsed:", v9);
        v15 = 0;
        -[AMPICUNumberFormatter set_icuNumberFormatter:](self, "set_icuNumberFormatter:", unum_open());
        if (-[AMPICUNumberFormatter _icuNumberFormatter](self, "_icuNumberFormatter"))
        {
          v11 = objc_msgSend(v9, "length");
          v12 = v11;
          if (v11)
            v13 = v10;
          else
            v13 = 0;
          if (v13 == 1 && v11 <= 0x10)
          {
            objc_msgSend(v9, "getCharacters:", v16);
            v16[v12] = 0;
            v14 = -[AMPICUNumberFormatter _icuNumberFormatter](self, "_icuNumberFormatter");
            if ((self->_extendedStyle & 0xFFFFFFFFFFFFFFFELL) == 2)
              (*((void (**)(void **, _WORD *, int *))*v14 + 31))(v14, v16, &v15);
          }
          v15 = 0;
          -[AMPICUNumberFormatter _icuNumberFormatter](self, "_icuNumberFormatter");
          unum_toPattern();
          -[AMPICUNumberFormatter _icuNumberFormatter](self, "_icuNumberFormatter");
          unum_setAttribute();
          -[AMPICUNumberFormatter _icuNumberFormatter](self, "_icuNumberFormatter");
          unum_setContext();
        }

      }
    }
  }

}

- (BOOL)_localeHasChanged
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;

  -[AMPICUNumberFormatter locale](self, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMPICUNumberFormatter _localeIdentifierBeingUsed](self, "_localeIdentifierBeingUsed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    if ((self->_extendedStyle & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      objc_msgSend(v3, "currencyCode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    -[AMPICUNumberFormatter _currencyCodeBeingUsed](self, "_currencyCodeBeingUsed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length") || objc_msgSend(v9, "length"))
    {
      if (!objc_msgSend(v7, "length") && objc_msgSend(v9, "length")
        || objc_msgSend(v7, "length") && !objc_msgSend(v9, "length"))
      {
        LOBYTE(v8) = 1;
      }
      else
      {
        v8 = objc_msgSend(v7, "isEqualToString:", v9) ^ 1;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (id)stringFromNumber:(id)a3
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  int v8;
  CFAllocatorRef *v9;
  char *v10;
  void *v11;
  char *v12;
  void *v13;
  const __CFString *v14;
  _BOOL4 v15;
  _QWORD v17[96];
  char v18;
  _QWORD v19[193];

  v19[192] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[AMPICUNumberFormatter _icuNumberFormatter](self, "_icuNumberFormatter"))
  {
    if (-[AMPICUNumberFormatter _localeHasChanged](self, "_localeHasChanged"))
      -[AMPICUNumberFormatter setExtendedStyle:](self, "setExtendedStyle:", self->_extendedStyle);
    LODWORD(v17[0]) = 0;
    objc_msgSend(v4, "stringValue", v17[0]);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    strcpy((char *)v17 + 6, (const char *)objc_msgSend(v5, "UTF8String"));

    -[AMPICUNumberFormatter _icuNumberFormatter](self, "_icuNumberFormatter");
    strlen((const char *)v17 + 6);
    v6 = unum_formatDecimal();
    v7 = v6;
    v8 = v17[0];
    v9 = (CFAllocatorRef *)MEMORY[0x1E0C9AE30];
    if (LODWORD(v17[0]) == 15 || v6 >= 769)
    {
      v10 = (char *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 2 * (v6 + 2), 0);
      -[AMPICUNumberFormatter _icuNumberFormatter](self, "_icuNumberFormatter");
      strlen((const char *)v17 + 6);
      v7 = (int)unum_formatDecimal();
      v8 = 0;
    }
    else
    {
      v10 = 0;
    }
    if (v8 > 0)
    {
      v11 = 0;
      if (!v10)
        goto LABEL_22;
      goto LABEL_21;
    }
    if (v10)
      v12 = v10;
    else
      v12 = &v18;
    -[AMPICUNumberFormatter locale](self, "locale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (const __CFString *)MEMORY[0x1D82AA46C]();
    v15 = CFLocaleGetLanguageCharacterDirection(v14) == kCFLocaleLanguageDirectionRightToLeft;

    if (v15)
    {
      *(_WORD *)v12 = 8207;
      ++v7;
    }
    else if (v10)
    {
      v12 = v10 + 2;
    }
    else
    {
      v12 = (char *)v19;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v12, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
LABEL_21:
      CFAllocatorDeallocate(*v9, v10);
  }
  else
  {
    v11 = 0;
  }
LABEL_22:

  return v11;
}

- (unint64_t)extendedStyle
{
  return self->_extendedStyle;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)_icuNumberFormatter
{
  return self->__icuNumberFormatter;
}

- (void)set_icuNumberFormatter:(void *)a3
{
  self->__icuNumberFormatter = a3;
}

- (NSString)_localeIdentifierBeingUsed
{
  return self->__localeIdentifierBeingUsed;
}

- (void)set_localeIdentifierBeingUsed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)_currencyCodeBeingUsed
{
  return self->__currencyCodeBeingUsed;
}

- (void)set_currencyCodeBeingUsed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currencyCodeBeingUsed, 0);
  objc_storeStrong((id *)&self->__localeIdentifierBeingUsed, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
