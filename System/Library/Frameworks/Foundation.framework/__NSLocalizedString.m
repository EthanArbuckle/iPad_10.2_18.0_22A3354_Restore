@implementation __NSLocalizedString

- (unint64_t)length
{
  return -[NSString length](self->original, "length");
}

- (const)_fastCStringContents:(BOOL)a3
{
  return -[NSString _fastCStringContents:](self->original, "_fastCStringContents:", a3);
}

- (id)formatConfiguration
{
  return self->config;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  -[NSString getCharacters:range:](self->original, "getCharacters:range:", a3, a4.location, a4.length);
}

- (const)_fastCharacterContents
{
  return CFStringGetCharactersPtr((CFStringRef)self->original);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[__NSLocalizedString initWithString:withFormatConfiguration:]([__NSLocalizedString alloc], "initWithString:withFormatConfiguration:", self->original, self->config);
}

- (__NSLocalizedString)initWithString:(id)a3 withFormatConfiguration:(id)a4
{
  self->original = (NSMutableString *)objc_msgSend(a3, "mutableCopyWithZone:", 0);
  self->config = (NSDictionary *)objc_msgSend(a4, "copyWithZone:", 0);
  return self;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)__NSLocalizedString;
  -[__NSLocalizedString dealloc](&v3, sel_dealloc);
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (__NSLocalizedString)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("__NSLocalizedString cannot be decoded by non-keyed archivers!"), 0));
  }
  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.originalString"));
  if (v5)
  {
    v6 = v5;
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0), CFSTR("NS.configDict"));
    if (v13 || !objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.configDict")))
      return -[__NSLocalizedString initWithString:withFormatConfiguration:](self, "initWithString:withFormatConfiguration:", v6, v13);

    v18 = CFSTR("NSDebugDescription");
    v19 = CFSTR("Unable to decode NS.configDict as a plist type despite data being present.");
    v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v15 = 4864;
  }
  else
  {
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.originalString")))
      v17 = 4864;
    else
      v17 = 4865;

    v20 = CFSTR("NSDebugDescription");
    v21[0] = CFSTR("Unable to decode NS.originalString.");
    v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = v17;
  }
  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), v15, v14));
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *config;

  if (!objc_msgSend(a3, "allowsKeyedCoding"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Encoder does not allow keyed coding!"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", self->original, CFSTR("NS.originalString"));
  config = self->config;
  if (config)
    objc_msgSend(a3, "encodeObject:forKey:", config, CFSTR("NS.configDict"));
}

- (id)baseString
{
  return self->original;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->original, "characterAtIndex:", a3);
}

- (unint64_t)fastestEncoding
{
  return -[NSString fastestEncoding](self->original, "fastestEncoding");
}

- (id)substringFromIndex:(unint64_t)a3
{
  return -[NSString substringFromIndex:](self->original, "substringFromIndex:", a3);
}

- (id)substringToIndex:(unint64_t)a3
{
  return -[NSString substringToIndex:](self->original, "substringToIndex:", a3);
}

- (id)substringWithRange:(_NSRange)a3
{
  return -[NSString substringWithRange:](self->original, "substringWithRange:", a3.location, a3.length);
}

- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6
{
  return -[NSString compare:options:range:locale:](self->original, "compare:options:range:locale:", a3, a4, a5.location, a5.length, a6);
}

- (BOOL)isEqualToString:(id)a3
{
  return -[NSString isEqualToString:](self->original, "isEqualToString:", a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[__NSLocalizedString initWithString:withFormatConfiguration:]([__NSLocalizedString alloc], "initWithString:withFormatConfiguration:", self->original, self->config);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  NSDictionary *config;

  length = a3.length;
  location = a3.location;
  config = self->config;
  self->config = 0;

  -[NSMutableString replaceCharactersInRange:withString:](self->original, "replaceCharactersInRange:withString:", location, length, a4);
}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
  NSDictionary *config;

  config = self->config;
  self->config = 0;

  -[NSMutableString insertString:atIndex:](self->original, "insertString:atIndex:", a3, a4);
}

- (void)appendString:(id)a3
{
  NSDictionary *config;

  config = self->config;
  self->config = 0;

  -[NSMutableString appendString:](self->original, "appendString:", a3);
}

- (void)deleteCharactersInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSDictionary *config;

  length = a3.length;
  location = a3.location;
  config = self->config;
  self->config = 0;

  -[NSMutableString deleteCharactersInRange:](self->original, "deleteCharactersInRange:", location, length);
}

- (void)appendFormat:(id)a3
{
  NSDictionary *config;

  config = self->config;
  self->config = 0;

  _CFStringAppendFormatAndArgumentsAux2();
}

- (void)setString:(id)a3
{
  NSDictionary *config;

  config = self->config;
  self->config = 0;

  -[NSMutableString setString:](self->original, "setString:", a3);
}

- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  NSDictionary *config;

  config = self->config;
  self->config = 0;

  -[NSMutableString replaceCharactersInRange:withCharacters:length:](self->original, "replaceCharactersInRange:withCharacters:length:", -[NSString length](self->original, "length"), 0, a3, a4);
}

- (unint64_t)replaceOccurrencesOfString:(id)a3 withString:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  NSDictionary *config;

  length = a6.length;
  location = a6.location;
  config = self->config;
  self->config = 0;

  return -[NSMutableString replaceOccurrencesOfString:withString:options:range:](self->original, "replaceOccurrencesOfString:withString:options:range:", a3, a4, a5, location, length);
}

@end
