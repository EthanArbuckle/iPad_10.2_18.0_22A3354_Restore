@implementation _NSPersonNameComponentsFormatterData

- (BOOL)forceGivenNameFirst
{
  return self->_forceGivenNameFirst;
}

- (BOOL)forceFamilyNameFirst
{
  return self->_forceFamilyNameFirst;
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 24, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _NSPersonNameComponentsFormatterData *v5;

  v5 = objc_alloc_init(_NSPersonNameComponentsFormatterData);
  v5->_style = self->_style;
  v5->_phonetic = self->_phonetic;
  v5->_forceFamilyNameFirst = self->_forceFamilyNameFirst;
  v5->_forceGivenNameFirst = self->_forceGivenNameFirst;
  v5->_ignoresFallbacks = self->_ignoresFallbacks;
  v5->_locale = (NSLocale *)-[NSLocale copyWithZone:](self->_locale, "copyWithZone:", a3);
  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)phonetic
{
  return self->_phonetic;
}

- (BOOL)ignoresFallbacks
{
  return self->_ignoresFallbacks;
}

- (void)dealloc
{
  NSLocale *locale;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  locale = self->_locale;
  if (locale)
  {

    self->_locale = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)_NSPersonNameComponentsFormatterData;
  -[_NSPersonNameComponentsFormatterData dealloc](&v4, sel_dealloc);
}

- (void)setIgnoresFallbacks:(BOOL)a3
{
  self->_ignoresFallbacks = a3;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void)setForceGivenNameFirst:(BOOL)a3
{
  self->_forceGivenNameFirst = a3;
}

- (void)setForceFamilyNameFirst:(BOOL)a3
{
  self->_forceFamilyNameFirst = a3;
}

- (void)setPhonetic:(BOOL)a3
{
  self->_phonetic = a3;
}

- (_NSPersonNameComponentsFormatterData)initWithCoder:(id)a3
{
  NSString *v6;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ cannot be decoded by non-keyed archivers"), objc_opt_class());

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v6, 0));
  }
  if (self)
  {
    self->_style = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.nameFormatterStyle"));
    self->_phonetic = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.nameFormatterIsPhonetic"));
    self->_forceFamilyNameFirst = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.nameFormatterForceFamilyNameFirst"));
    self->_forceGivenNameFirst = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.nameFormatterForceGivenNameFirst"));
    self->_ignoresFallbacks = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.nameFormatterIgnoresFallbacks"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.nameFormatterLocale")))
      self->_locale = (NSLocale *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.nameFormatterLocale")), "copy");
  }
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPersonNameComponents cannot be encoded by non-keyed archivers"), 0));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_style, CFSTR("NS.nameFormatterStyle"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_phonetic, CFSTR("NS.nameFormatterIsPhonetic"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_forceFamilyNameFirst, CFSTR("NS.nameFormatterForceFamilyNameFirst"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_forceGivenNameFirst, CFSTR("NS.nameFormatterForceGivenNameFirst"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_ignoresFallbacks, CFSTR("NS.nameFormatterIgnoresFallbacks"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_locale, CFSTR("NS.nameFormatterLocale"));
}

- (BOOL)isEqual:(id)a3
{
  return self == a3 || -[_NSPersonNameComponentsFormatterData isEqualToFormatterData:](self, a3);
}

- (BOOL)isEqualToFormatterData:(void *)a1
{
  _BOOL8 result;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    if (objc_msgSend(a1, "locale") && objc_msgSend(a2, "locale"))
    {
      if ((objc_msgSend((id)objc_msgSend(a1, "locale"), "isEqual:", objc_msgSend(a2, "locale")) & 1) == 0)
        return 0;
    }
    else if (objc_msgSend(a1, "locale") || objc_msgSend(a2, "locale"))
    {
      return 0;
    }
    v5 = objc_msgSend(a1, "phonetic");
    if (v5 == objc_msgSend(a2, "phonetic"))
    {
      v6 = objc_msgSend(a1, "forceFamilyNameFirst");
      if (v6 == objc_msgSend(a2, "forceFamilyNameFirst"))
      {
        v7 = objc_msgSend(a1, "forceGivenNameFirst");
        if (v7 == objc_msgSend(a2, "forceGivenNameFirst"))
        {
          v8 = objc_msgSend(a1, "ignoresFallbacks");
          if (v8 == objc_msgSend(a2, "ignoresFallbacks"))
          {
            v9 = objc_msgSend(a1, "style");
            return v9 == objc_msgSend(a2, "style");
          }
        }
      }
    }
    return 0;
  }
  return result;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

@end
