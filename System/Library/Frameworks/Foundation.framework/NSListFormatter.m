@implementation NSListFormatter

- (void)dealloc
{
  __CFListFormatter *listFormatter;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  listFormatter = self->_listFormatter;
  if (listFormatter)
    CFRelease(listFormatter);
  v4.receiver = self;
  v4.super_class = (Class)NSListFormatter;
  -[NSListFormatter dealloc](&v4, sel_dealloc);
}

- (NSListFormatter)init
{
  return -[NSListFormatter initWithLocale:](self, "initWithLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale"));
}

- (NSListFormatter)initWithLocale:(id)a3
{
  NSListFormatter *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSListFormatter;
  v4 = -[NSListFormatter init](&v6, sel_init);
  if (v4)
    v4->_locale = (NSLocale *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)setLocale:(NSLocale *)locale
{
  NSLocale *v3;
  __CFListFormatter *listFormatter;

  v3 = self->_locale;
  if (v3 != locale)
  {
    self->_locale = (NSLocale *)-[NSLocale copy](locale, "copy");

    listFormatter = self->_listFormatter;
    if (listFormatter)
    {
      CFRelease(listFormatter);
      self->_listFormatter = 0;
    }
  }
}

- (NSLocale)locale
{
  NSLocale *result;

  result = self->_locale;
  if (!result)
  {
    result = (NSLocale *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale"), "copy");
    self->_locale = result;
  }
  return result;
}

- (__CFListFormatter)_listFormatter
{
  __CFListFormatter *result;

  result = self->_listFormatter;
  if (!result)
  {
    -[NSListFormatter locale](self, "locale");
    result = (__CFListFormatter *)_CFListFormatterCreate();
    self->_listFormatter = result;
  }
  return result;
}

- (NSString)stringForObjectValue:(id)obj
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSLocale *v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!obj)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = -[NSListFormatter locale](self, "locale");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = -[NSFormatter stringForObjectValue:](self->_itemFormatter, "stringForObjectValue:", v10);
        if (!v11
          && ((objc_opt_respondsToSelector() & 1) == 0
           || (v11 = (NSString *)objc_msgSend(v10, "descriptionWithLocale:", v14)) == 0)
          && ((objc_opt_respondsToSelector() & 1) == 0
           || (v11 = (NSString *)objc_msgSend(v10, "localizedDescription")) == 0))
        {
          v11 = (NSString *)objc_msgSend(v10, "description", v11);
          if (!v11)
          {
            v12 = 0;
            goto LABEL_19;
          }
        }
        objc_msgSend(v5, "addObject:", v11);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = -[NSListFormatter _stringFromStringArray:](self, "_stringFromStringArray:", v5);
LABEL_19:

  return v12;
}

- (id)_stringFromStringArray:(id)a3
{
  -[NSListFormatter _listFormatter](self, "_listFormatter");
  return (id)_CFListFormatterCreateStringByJoiningStrings();
}

+ (NSString)localizedStringByJoiningStrings:(NSArray *)strings
{
  NSListFormatter *v4;
  NSString *v5;

  v4 = -[NSListFormatter initWithLocale:]([NSListFormatter alloc], "initWithLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"));
  v5 = -[NSListFormatter _stringFromStringArray:](v4, "_stringFromStringArray:", strings);

  return v5;
}

- (NSFormatter)itemFormatter
{
  return (NSFormatter *)objc_getProperty(self, a2, 24, 1);
}

- (void)setItemFormatter:(NSFormatter *)itemFormatter
{
  objc_setProperty_atomic_copy(self, a2, itemFormatter, 24);
}

@end
