@implementation _NSLocalizedNumberFormatRuleAutomatic

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSLocalizedNumberFormatRuleAutomatic)initWithCoder:(id)a3
{

  return (_NSLocalizedNumberFormatRuleAutomatic *)+[NSLocalizedNumberFormatRule automatic](NSLocalizedNumberFormatRule, "automatic");
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSLocalizedNumberFormatRuleAutomatic;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (format number rule)"), -[_NSLocalizedNumberFormatRuleAutomatic description](&v3, sel_description));
}

- (id)_locked_formatterForLocale:(id)a3
{
  const __CFDictionary *Mutable;
  NSNumberFormatter *Value;

  Mutable = (const __CFDictionary *)_locked_formatterForLocale__formatters;
  if (!_locked_formatterForLocale__formatters)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, &formatterCacheKeyCallBacks, MEMORY[0x1E0C9B3A0]);
    _locked_formatterForLocale__formatters = (uint64_t)Mutable;
  }
  Value = (NSNumberFormatter *)CFDictionaryGetValue(Mutable, a3);
  if (!Value)
  {
    Value = objc_alloc_init(NSNumberFormatter);
    -[NSNumberFormatter setLocale:](Value, "setLocale:", a3);
    -[NSNumberFormatter setDecimalSeparator:](Value, "setDecimalSeparator:", objc_msgSend(a3, "decimalSeparator"));
    -[NSNumberFormatter setGroupingSeparator:](Value, "setGroupingSeparator:", objc_msgSend(a3, "groupingSeparator"));
    if (CFDictionaryGetCount((CFDictionaryRef)_locked_formatterForLocale__formatters) >= 101)
      CFDictionaryRemoveAllValues((CFMutableDictionaryRef)_locked_formatterForLocale__formatters);
    CFDictionarySetValue((CFMutableDictionaryRef)_locked_formatterForLocale__formatters, a3, Value);
  }
  return Value;
}

- (id)_formattedString:(id)a3 withStringLocale:(id)a4 andDisplayLocale:(id)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&_formattedString_withStringLocale_andDisplayLocale__lock);
  v9 = (void *)objc_msgSend(-[_NSLocalizedNumberFormatRuleAutomatic _locked_formatterForLocale:](self, "_locked_formatterForLocale:", a4), "numberFromString:", a3);
  if (v9)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v11 = objc_msgSend(a3, "rangeOfString:", objc_msgSend(a4, "decimalSeparator"));
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v10;
      v13 = objc_msgSend(a3, "length");
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __92___NSLocalizedNumberFormatRuleAutomatic__formattedString_withStringLocale_andDisplayLocale___block_invoke;
      v16[3] = &unk_1E0F517D8;
      v16[4] = &v17;
      objc_msgSend(a3, "enumerateSubstringsInRange:options:usingBlock:", v11 + v12, v13 - (v11 + v12), 2, v16);
    }
    v14 = -[_NSLocalizedNumberFormatRuleAutomatic _locked_formatterForLocale:](self, "_locked_formatterForLocale:", a5);
    objc_msgSend(v14, "setMinimumFractionDigits:", v18[3]);
    v9 = (void *)objc_msgSend(v14, "stringFromNumber:", v9);
    os_unfair_lock_unlock((os_unfair_lock_t)&_formattedString_withStringLocale_andDisplayLocale__lock);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&_formattedString_withStringLocale_andDisplayLocale__lock);
  }
  return v9;
}

@end
