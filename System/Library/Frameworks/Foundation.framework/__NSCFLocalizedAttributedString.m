@implementation __NSCFLocalizedAttributedString

+ (__CFString)copyStringWithMarkdown:(__CFString *)a3 formatConfiguration:(__CFDictionary *)a4 bundle:(__CFBundle *)a5 tableURL:(__CFURL *)a6
{
  return (__CFString *)objc_msgSend(objc_alloc((Class)a1), "initWithAttributedStringMarkdown:formatConfiguration:bundle:tableURL:", a3, a4, a5, a6);
}

+ (__CFString)createStringRequiringInflectionWithFormat:(__CFString *)a3 formatOptions:(__CFDictionary *)a4 arguments:(char *)a5
{
  __CFString *result;
  __CFString *v8;
  id v9;
  __CFString *v10;

  result = (__CFString *)-[__CFString __baseAttributedString](a3, "__baseAttributedString");
  if (result)
  {
    v8 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      a4 = 0;
    v9 = -[NSAttributedString _initWithFormat:options:locale:arguments:]([NSAttributedString alloc], "_initWithFormat:options:locale:arguments:", v8, 0, a4, a5);
    v10 = (__CFString *)objc_msgSend((id)objc_msgSend(v9, "string"), "copy");

    return v10;
  }
  return result;
}

- (__NSCFLocalizedAttributedString)initWithCoder:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This class is not meant to be archived."), 0));
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)__NSCFLocalizedAttributedString;
  -[NSString encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (__NSCFLocalizedAttributedString)initWithAttributedStringMarkdown:(id)a3 formatConfiguration:(id)a4 bundle:(__CFBundle *)a5 tableURL:(id)a6
{
  __NSCFLocalizedAttributedString *v10;
  NSMutableAttributedString *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)__NSCFLocalizedAttributedString;
  v10 = -[NSString init](&v13, sel_init);
  if (v10)
  {
    v11 = _NSStringCreateByParsingMarkdownAndOptionallyInflecting(a3, a5, a6, a4, 0);
    v10->_original = &v11->super;
    if (v11)
      a3 = (id)objc_msgSend(-[NSAttributedString _inflectedAttributedString](v11, "_inflectedAttributedString"), "string");
    else
      v10->_original = (NSAttributedString *)objc_msgSend(a3, "copy");
    v10->_apparentString = (NSString *)objc_msgSend(a3, "copy");
    v10->_formatConfiguration = (NSDictionary *)objc_msgSend(a4, "copy");
  }
  return v10;
}

- (id)_initWithAttributedString:(id)a3
{
  __NSCFLocalizedAttributedString *v4;
  NSAttributedString *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)__NSCFLocalizedAttributedString;
  v4 = -[NSString init](&v7, sel_init);
  if (v4)
  {
    v5 = (NSAttributedString *)objc_msgSend(a3, "copy");
    v4->_original = v5;
    v4->_apparentString = (NSString *)objc_msgSend((id)objc_msgSend(-[NSAttributedString _inflectedAttributedString](v5, "_inflectedAttributedString"), "string"), "copy");
    v4->_formatConfiguration = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C9AA70], "copy");
  }
  return v4;
}

+ (id)stringEncapsulatingBaseAttributedString:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithAttributedString:", a3);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)__NSCFLocalizedAttributedString;
  -[__NSCFLocalizedAttributedString dealloc](&v3, sel_dealloc);
}

- (id)formatConfiguration
{
  return self->_formatConfiguration;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NSString mutableCopyWithZone:](self->_apparentString, "mutableCopyWithZone:", a3);
}

- (id)__baseAttributedString
{
  return self->_original;
}

- (unint64_t)length
{
  return -[NSString length](self->_apparentString, "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->_apparentString, "characterAtIndex:", a3);
}

- (unint64_t)fastestEncoding
{
  return -[NSString fastestEncoding](self->_apparentString, "fastestEncoding");
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  -[NSString getCharacters:range:](self->_apparentString, "getCharacters:range:", a3, a4.location, a4.length);
}

- (id)substringFromIndex:(unint64_t)a3
{
  return -[NSString substringFromIndex:](self->_apparentString, "substringFromIndex:", a3);
}

- (id)substringToIndex:(unint64_t)a3
{
  return -[NSString substringToIndex:](self->_apparentString, "substringToIndex:", a3);
}

- (id)substringWithRange:(_NSRange)a3
{
  return -[NSString substringWithRange:](self->_apparentString, "substringWithRange:", a3.location, a3.length);
}

- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6
{
  return -[NSString compare:options:range:locale:](self->_apparentString, "compare:options:range:locale:", a3, a4, a5.location, a5.length, a6);
}

- (BOOL)isEqualToString:(id)a3
{
  return -[NSString isEqualToString:](self->_apparentString, "isEqualToString:", a3);
}

- (const)_fastCharacterContents
{
  return CFStringGetCharactersPtr((CFStringRef)self->_apparentString);
}

- (const)_fastCStringContents:(BOOL)a3
{
  return -[NSString _fastCStringContents:](self->_apparentString, "_fastCStringContents:", a3);
}

@end
