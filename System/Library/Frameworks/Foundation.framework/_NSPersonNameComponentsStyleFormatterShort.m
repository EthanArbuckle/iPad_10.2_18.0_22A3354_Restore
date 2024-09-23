@implementation _NSPersonNameComponentsStyleFormatterShort

- (id)orderedKeysOfInterest
{
  objc_super v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[_NSPersonNameComponentsStyleFormatterShort subFormatter](self, "subFormatter");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5[0] = CFSTR("nickname");
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_NSPersonNameComponentsStyleFormatterShort;
    return -[_NSPersonNameComponentsStyleFormatter orderedKeysOfInterest](&v4, sel_orderedKeysOfInterest);
  }
}

- (BOOL)isEnabled
{
  _BOOL4 v4;
  int v5;
  char v6;

  -[_NSPersonNameComponentsStyleFormatterShort subFormatter](self, "subFormatter");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  v4 = -[_NSPersonNameComponentsStyleFormatterShort forceShortNameEnabled](self, "forceShortNameEnabled")
    || +[NSPersonNameComponentsFormatter _shortNameIsEnabled](NSPersonNameComponentsFormatter, "_shortNameIsEnabled");
  LOBYTE(v5) = 1;
  v6 = -[NSPersonNameComponentsFormatter __localizedRestrictionExistsForStyle:](-[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"), "__localizedRestrictionExistsForStyle:", 1);
  -[_NSPersonNameComponentsStyleFormatterShort subFormatter](self, "subFormatter");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v5 = !-[NSPersonNameComponentsFormatter __localizedRestrictionExistsForShortStyle:](-[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"), "__localizedRestrictionExistsForShortStyle:", -[_NSPersonNameComponentsStyleFormatterShort shortNameFormat](self, "shortNameFormat"));
  if (v4)
    return v5 & ~v6;
  else
    return 0;
}

- (_NSPersonNameComponentsStyleFormatterShort)initWithMasterFormatter:(id)a3
{
  _NSPersonNameComponentsStyleFormatterShort *result;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)_NSPersonNameComponentsStyleFormatterShort;
  result = -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:](&v4, sel_initWithMasterFormatter_, a3);
  if (result)
    result->_shortNameFormat = 0;
  return result;
}

- (id)_formattedStringFromOrderedKeys:(id)a3 components:(id)a4 attributesByRange:(id)a5
{
  _BOOL4 v8;
  _BOOL4 v9;
  _NSPersonNameComponentsStyleFormatterLong *v10;

  v8 = +[NSPersonNameComponentsFormatter _shouldPreferNicknames](NSPersonNameComponentsFormatter, "_shouldPreferNicknames", a3);
  v9 = +[NSPersonNameComponentsFormatter _isCJKScript:](NSPersonNameComponentsFormatter, "_isCJKScript:", a4);
  if (v8)
  {
    if (v9
      || +[NSPersonNameComponentsFormatter _isMixedScript:](NSPersonNameComponentsFormatter, "_isMixedScript:", a4))
    {
      v10 = -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]([_NSPersonNameComponentsStyleFormatterLong alloc], "initWithMasterFormatter:", -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
    }
    else
    {
      v10 = -[_NSPersonNameComponentsStyleFormatterShort variantFormatter](self, "variantFormatter");
    }
    -[_NSPersonNameComponentsStyleFormatter setFallbackStyleFormatter:](-[_NSPersonNameComponentsStyleFormatterShort subFormatter](self, "subFormatter"), "setFallbackStyleFormatter:", v10);
  }
  else if (v9)
  {
    -[_NSPersonNameComponentsStyleFormatterShort setSubFormatter:](self, "setSubFormatter:", -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]([_NSPersonNameComponentsStyleFormatterLong alloc], "initWithMasterFormatter:", -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter")));
  }
  else if (!+[NSPersonNameComponentsFormatter _shortNameIsEnabled](NSPersonNameComponentsFormatter, "_shortNameIsEnabled")&& !-[_NSPersonNameComponentsStyleFormatterShort forceShortNameEnabled](self, "forceShortNameEnabled"))
  {
    return 0;
  }
  -[_NSPersonNameComponentsStyleFormatter setFallbackStyleFormatter:](-[_NSPersonNameComponentsStyleFormatterShort variantFormatter](self, "variantFormatter"), "setFallbackStyleFormatter:", -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]([_NSPersonNameComponentsStyleFormatterShortNameSimpleFallback alloc], "initWithMasterFormatter:", -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter")));
  return -[_NSPersonNameComponentsStyleFormatter stringFromComponents:attributesByRange:](-[_NSPersonNameComponentsStyleFormatterShort subFormatter](self, "subFormatter"), "stringFromComponents:attributesByRange:", a4, a5);
}

- (_NSPersonNameComponentsStyleFormatter)subFormatter
{
  _NSPersonNameComponentsStyleFormatter *result;

  result = self->_subFormatter;
  if (!result)
  {
    if (+[NSPersonNameComponentsFormatter _shouldPreferNicknames](NSPersonNameComponentsFormatter, "_shouldPreferNicknames"))
    {
      result = -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]([_NSPersonNameComponentsStyleFormatterNicknameVariant alloc], "initWithMasterFormatter:", -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
    }
    else
    {
      result = -[_NSPersonNameComponentsStyleFormatterShort variantFormatter](self, "variantFormatter");
    }
    self->_subFormatter = result;
  }
  return result;
}

- (_NSPersonNameComponentsStyleFormatterShortVariantGeneral)variantFormatter
{
  _NSPersonNameComponentsStyleFormatterShortVariantGeneral *result;

  result = self->_variantFormatter;
  if (!result)
  {
    -[_NSPersonNameComponentsStyleFormatterShort shortNameFormat](self, "shortNameFormat");
    result = (_NSPersonNameComponentsStyleFormatterShortVariantGeneral *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMasterFormatter:", -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
    self->_variantFormatter = result;
  }
  return result;
}

- (id)fallbackStyleFormatter
{
  id result;

  if (!+[NSPersonNameComponentsFormatter _shouldPreferNicknames](NSPersonNameComponentsFormatter, "_shouldPreferNicknames"))return -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]([_NSPersonNameComponentsStyleFormatterMedium alloc], "initWithMasterFormatter:", -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
  result = -[_NSPersonNameComponentsStyleFormatterShort variantFormatter](self, "variantFormatter");
  if (result)
    return -[_NSPersonNameComponentsStyleFormatterShort variantFormatter](self, "variantFormatter");
  return result;
}

- (int64_t)shortNameFormat
{
  int64_t result;

  result = self->_shortNameFormat;
  if (!result)
  {
    result = -[NSPersonNameComponentsFormatter __computedShortNameFormat](-[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"), "__computedShortNameFormat");
    self->_shortNameFormat = result;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSPersonNameComponentsStyleFormatterShort;
  -[_NSPersonNameComponentsStyleFormatter dealloc](&v3, sel_dealloc);
}

- (BOOL)forceShortNameEnabled
{
  return self->_forceShortNameEnabled;
}

- (void)setForceShortNameEnabled:(BOOL)a3
{
  self->_forceShortNameEnabled = a3;
}

- (void)setShortNameFormat:(int64_t)a3
{
  self->_shortNameFormat = a3;
}

- (void)setSubFormatter:(id)a3
{
  self->_subFormatter = (_NSPersonNameComponentsStyleFormatter *)a3;
}

- (id)abbreviatedKeys
{
  _NSPersonNameComponentsStyleFormatter *v2;

  v2 = -[_NSPersonNameComponentsStyleFormatterShort subFormatter](self, "subFormatter");
  if (v2)
    -[_NSPersonNameComponentsStyleFormatter abbreviatedKeys](v2, "abbreviatedKeys");
  return 0;
}

- (id)keysOfInterest
{
  id result;

  result = self->super._keysOfInterest;
  if (!result)
  {
    result = -[_NSPersonNameComponentsStyleFormatter keysOfInterest](-[_NSPersonNameComponentsStyleFormatterShort subFormatter](self, "subFormatter"), "keysOfInterest");
    self->super._keysOfInterest = (NSSet *)result;
  }
  return result;
}

@end
