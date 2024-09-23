@implementation NSConcreteScanner

- (void)setCaseSensitive:(BOOL)a3
{
  self->flags = ($2B5DD4196BC790A619058A8FED2FA401)(*(_DWORD *)&self->flags & 0xFFFFFFFE | a3);
}

- (unint64_t)scanLocation
{
  return self->scanLocation;
}

- (BOOL)caseSensitive
{
  return *(_DWORD *)&self->flags & 1;
}

- (id)string
{
  return self->scanString;
}

- (void)setScanLocation:(unint64_t)a3
{
  unint64_t v6;
  void *v7;

  v6 = -[NSString length](self->scanString, "length");
  if (v6 < a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Index %lu out of bounds; string length %lu"),
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     a3,
                     v6),
                   0);
    objc_exception_throw(v7);
  }
  self->scanLocation = a3;
}

- (NSConcreteScanner)initWithString:(id)a3
{
  __CFString *v3;
  NSConcreteScanner *v5;
  objc_super v7;
  uint64_t v8;

  v3 = (__CFString *)a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NSLog((NSString *)CFSTR("NSScanner: nil string argument"), a2);
    v3 = &stru_1E0F56070;
  }
  v7.receiver = self;
  v7.super_class = (Class)NSConcreteScanner;
  v5 = -[NSScanner initWithString:](&v7, sel_initWithString_, v3);
  v5->scanString = (NSString *)-[__CFString copyWithZone:](v3, "copyWithZone:", 0);
  v5->skipSet = +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet");
  v5->scanLocation = 0;
  return v5;
}

- (id)_invertedSkipSet
{
  id result;
  id v4;

  result = self->invertedSkipSet;
  if (!result)
  {
    result = -[NSConcreteScanner charactersToBeSkipped](self, "charactersToBeSkipped");
    if (result)
    {
      v4 = result;
      if (result == +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"))
      {
        if (_MergedGlobals_5_0 != -1)
          dispatch_once(&_MergedGlobals_5_0, &__block_literal_global_96_0);
        return (id)qword_1ECD09520;
      }
      else
      {
        result = (id)objc_msgSend((id)objc_msgSend(v4, "invertedSet"), "copy");
        self->invertedSkipSet = (NSCharacterSet *)result;
      }
    }
  }
  return result;
}

- (id)charactersToBeSkipped
{
  return self->skipSet;
}

- (BOOL)scanInt:(int *)a3
{
  return _NSScanIntFromString(self->scanString, self->skipSet, a3, &self->scanLocation);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteScanner;
  -[NSConcreteScanner dealloc](&v3, sel_dealloc);
}

- (void)setCharactersToBeSkipped:(id)a3
{
  NSCharacterSet *v5;

  v5 = self->skipSet;
  self->skipSet = (NSCharacterSet *)objc_msgSend(a3, "copyWithZone:", -[NSConcreteScanner zone](self, "zone"));

  self->invertedSkipSet = 0;
}

- (void)setLocale:(id)a3
{
  id locale;

  locale = self->locale;
  if (locale != a3)
  {

    self->locale = a3;
  }
}

- (id)locale
{
  return self->locale;
}

- (BOOL)scanLongLong:(int64_t *)a3
{
  return _NSScanLongLongFromString(self->scanString, self->skipSet, a3, &self->scanLocation);
}

@end
