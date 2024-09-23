@implementation _NSStringProxyForContext

- (id)_dynamicContextEvaluation:(id)a3 patternString:(id)a4
{
  uint64_t v7;
  CFMutableStringRef MutableCopy;
  const __CFString *Copy;
  const __CFLocale *v10;
  const __CFAllocator *v11;
  __CFStringTokenizer *v12;
  __CFStringTokenizer *i;
  const __CFString *v14;
  CFIndex location;
  _BOOL4 v16;
  NSFormatter *v17;
  CFRange v19;
  CFRange CurrentTokenRange;

  if ((objc_msgSend(a3, "isEqualToString:", a4) & 1) != 0)
  {
    v7 = 2;
  }
  else if (objc_msgSend(a3, "rangeOfString:", a4))
  {
    MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)a3);
    CFStringUppercase(MutableCopy, 0);
    Copy = CFStringCreateCopy(0, MutableCopy);
    CFRelease(MutableCopy);
    v10 = CFLocaleCopyCurrent();
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v19.length = CFStringGetLength(Copy);
    v19.location = 0;
    v12 = CFStringTokenizerCreate(v11, Copy, v19, 1uLL, v10);
    for (i = v12; ; v12 = i)
    {
      if (!CFStringTokenizerAdvanceToNextToken(v12))
      {
        v16 = 0;
        goto LABEL_11;
      }
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(i);
      v14 = CFStringCreateWithSubstring(0, Copy, CurrentTokenRange);
      location = CFStringFind(v14, (CFStringRef)a4, 0).location;
      if (location != -1)
        break;
      CFRelease(v14);
    }
    v16 = location == 0;
    CFRelease(v14);
LABEL_11:
    CFRelease(Copy);
    CFRelease(i);
    CFRelease(v10);
    if (v16)
      v7 = 4;
    else
      v7 = 5;
  }
  else
  {
    v7 = 4;
  }
  v17 = -[_NSStringProxyForContext formatter](self, "formatter");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  -[NSFormatter setFormattingContext:](v17, "setFormattingContext:", v7);
  return -[NSFormatter stringForObjectValue:](v17, "stringForObjectValue:", -[_NSStringProxyForContext item](self, "item"));
}

- (unint64_t)length
{
  return -[NSString length](self->_string, "length");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setString:", -[_NSStringProxyForContext string](self, "string"));
  objc_msgSend(v4, "setFormatter:", -[_NSStringProxyForContext formatter](self, "formatter"));
  objc_msgSend(v4, "setItem:", -[_NSStringProxyForContext item](self, "item"));
  return v4;
}

- (void)setString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void)setItem:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)item
{
  return objc_getProperty(self, a2, 24, 1);
}

- (NSFormatter)formatter
{
  return (NSFormatter *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFormatter:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)_retainFormatter:(id)a3
{
  NSFormatter *formatter;

  formatter = self->_formatter;
  if (formatter != a3)
  {

    self->_formatter = (NSFormatter *)a3;
  }
}

- (void)dealloc
{
  NSString *string;
  NSFormatter *formatter;
  NSCopying *item;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  string = self->_string;
  if (string)

  formatter = self->_formatter;
  if (formatter)

  item = self->_item;
  if (item)

  v6.receiver = self;
  v6.super_class = (Class)_NSStringProxyForContext;
  -[_NSStringProxyForContext dealloc](&v6, sel_dealloc);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->_string, "characterAtIndex:", a3);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  -[NSString getCharacters:range:](self->_string, "getCharacters:range:", a3, a4.location, a4.length);
}

- (_NSStringProxyForContext)initWithCoder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_class *v9;
  NSString *v10;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ can only be decoded by a keyed coder."), NSStringFromClass(v9));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v10, 0));
  }
  v5 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSStringProxyForContext.string"));
  v6 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSStringProxyForContext.formatter"));
  v7 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSStringProxyForContext.item"));
  self->_string = (NSString *)v5;
  self->_formatter = (NSFormatter *)v6;
  self->_item = (NSCopying *)v7;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *v5;
  void *v6;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ can only be encoded by a keyed coder."), NSStringFromClass(v5)), 0);
    objc_exception_throw(v6);
  }
  objc_msgSend(a3, "encodeObject:forKey:", self->_string, CFSTR("NSStringProxyForContext.string"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_formatter, CFSTR("NSStringProxyForContext.formatter"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_item, CFSTR("NSStringProxyForContext.item"));
}

@end
