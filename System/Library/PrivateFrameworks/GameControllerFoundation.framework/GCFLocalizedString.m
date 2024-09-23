@implementation GCFLocalizedString

- (id)_realizedString
{
  -[GCFLocalizedString doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (unint64_t)length
{
  return objc_msgSend(-[GCFLocalizedString _realizedString](self, "_realizedString"), "length");
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  objc_msgSend(-[GCFLocalizedString _realizedString](self, "_realizedString"), "getCharacters:range:", a3, a4.location, a4.length);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return objc_msgSend(-[GCFLocalizedString _realizedString](self, "_realizedString"), "characterAtIndex:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 0;
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (GCFLocalizedString)initWithCoder:(id)a3
{
  return (GCFLocalizedString *)-[_GCFLocalizedString initWithCoder:]([_GCFLocalizedString alloc], "initWithCoder:", a3);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v5;
  objc_super v7;

  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_opt_self();
    return &sharedPlaceholderString_PlaceholderString;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___GCFLocalizedString;
    return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (GCFLocalizedString)initWithKey:(id)a3 sourceBundle:(id)a4 table:(id)a5 locale:(id)a6
{

  return (GCFLocalizedString *)-[_GCFLocalizedString initWithKey:sourceBundle:table:locale:]([_GCFLocalizedString alloc], "initWithKey:sourceBundle:table:locale:", a3, a4, a5, a6);
}

- (GCFLocalizedString)initWithKey:(id)a3 sourceBundle:(id)a4
{
  return -[GCFLocalizedString initWithKey:sourceBundle:table:locale:](self, "initWithKey:sourceBundle:table:locale:", a3, a4, 0, 0);
}

- (GCFLocalizedString)initWithFormat:(id)a3 arg:(id)a4
{

  return (GCFLocalizedString *)-[_GCFFormattedLocalizedString initWithFormat:arg:]([_GCFFormattedLocalizedString alloc], "initWithFormat:arg:", a3, a4);
}

- (GCFLocalizedString)init
{

  return (GCFLocalizedString *)-[_GCFLocalizedString initWithKey:sourceBundle:table:locale:]([_GCFLocalizedString alloc], "initWithKey:sourceBundle:table:locale:", &stru_1EA4D5008, 0, 0, 0);
}

- (GCFLocalizedString)initWithString:(id)a3
{

  return (GCFLocalizedString *)-[_GCFLocalizedString initWithKey:sourceBundle:table:locale:]([_GCFLocalizedString alloc], "initWithKey:sourceBundle:table:locale:", a3, 0, 0, 0);
}

- (GCFLocalizedString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  _BOOL8 v5;
  NSString *v8;
  _GCFLocalizedString *v9;

  v5 = a5;

  v8 = -[NSString initWithCharactersNoCopy:length:freeWhenDone:]([NSString_0 alloc], "initWithCharactersNoCopy:length:freeWhenDone:", a3, a4, v5);
  v9 = -[_GCFLocalizedString initWithKey:sourceBundle:table:locale:]([_GCFLocalizedString alloc], "initWithKey:sourceBundle:table:locale:", v8, 0, 0, 0);

  return &v9->super;
}

- (GCFLocalizedString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 deallocator:(id)a5
{
  NSString *v8;
  _GCFLocalizedString *v9;

  v8 = -[NSString initWithCharactersNoCopy:length:deallocator:]([NSString_0 alloc], "initWithCharactersNoCopy:length:deallocator:", a3, a4, a5);
  v9 = -[_GCFLocalizedString initWithKey:sourceBundle:table:locale:]([_GCFLocalizedString alloc], "initWithKey:sourceBundle:table:locale:", v8, 0, 0, 0);

  return &v9->super;
}

- (GCFLocalizedString)initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  NSString *v6;
  _GCFLocalizedString *v7;

  v6 = -[NSString initWithCharacters:length:]([NSString_0 alloc], "initWithCharacters:length:", a3, a4);
  v7 = -[_GCFLocalizedString initWithKey:sourceBundle:table:locale:]([_GCFLocalizedString alloc], "initWithKey:sourceBundle:table:locale:", v6, 0, 0, 0);

  return &v7->super;
}

- (GCFLocalizedString)initWithUTF8String:(const char *)a3
{
  NSString *v4;
  _GCFLocalizedString *v5;

  v4 = -[NSString initWithUTF8String:]([NSString_0 alloc], "initWithUTF8String:", a3);
  v5 = -[_GCFLocalizedString initWithKey:sourceBundle:table:locale:]([_GCFLocalizedString alloc], "initWithKey:sourceBundle:table:locale:", v4, 0, 0, 0);

  return &v5->super;
}

- (GCFLocalizedString)initWithFormat:(id)a3 locale:(id)a4 arguments:(char *)a5
{
  NSString *v8;
  _GCFLocalizedString *v9;

  v8 = -[NSString initWithFormat:locale:arguments:]([NSString_0 alloc], "initWithFormat:locale:arguments:", a3, a4, a5);
  v9 = -[_GCFLocalizedString initWithKey:sourceBundle:table:locale:]([_GCFLocalizedString alloc], "initWithKey:sourceBundle:table:locale:", v8, 0, 0, a4);

  return &v9->super;
}

- (GCFLocalizedString)initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 arguments:(char *)a6 error:(id *)a7
{
  NSString *v12;
  _GCFLocalizedString *v13;

  v12 = -[NSString initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:]([NSString_0 alloc], "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", a3, a4, a5, a6, a7);
  v13 = -[_GCFLocalizedString initWithKey:sourceBundle:table:locale:]([_GCFLocalizedString alloc], "initWithKey:sourceBundle:table:locale:", v12, 0, 0, a5);

  return &v13->super;
}

- (GCFLocalizedString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  _BOOL8 v5;
  NSString *v8;
  _GCFLocalizedString *v9;

  v5 = a5;

  v8 = -[NSString initWithCStringNoCopy:length:freeWhenDone:]([NSString_0 alloc], "initWithCStringNoCopy:length:freeWhenDone:", a3, a4, v5);
  v9 = -[_GCFLocalizedString initWithKey:sourceBundle:table:locale:]([_GCFLocalizedString alloc], "initWithKey:sourceBundle:table:locale:", v8, 0, 0, 0);

  return &v9->super;
}

- (GCFLocalizedString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 freeWhenDone:(BOOL)a6
{
  _BOOL8 v6;
  NSString *v10;
  _GCFLocalizedString *v11;

  v6 = a6;

  v10 = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]([NSString_0 alloc], "initWithBytesNoCopy:length:encoding:freeWhenDone:", a3, a4, a5, v6);
  v11 = -[_GCFLocalizedString initWithKey:sourceBundle:table:locale:]([_GCFLocalizedString alloc], "initWithKey:sourceBundle:table:locale:", v10, 0, 0, 0);

  return &v11->super;
}

- (GCFLocalizedString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 deallocator:(id)a6
{
  NSString *v10;
  _GCFLocalizedString *v11;

  v10 = -[NSString initWithBytesNoCopy:length:encoding:deallocator:]([NSString_0 alloc], "initWithBytesNoCopy:length:encoding:deallocator:", a3, a4, a5, a6);
  v11 = -[_GCFLocalizedString initWithKey:sourceBundle:table:locale:]([_GCFLocalizedString alloc], "initWithKey:sourceBundle:table:locale:", v10, 0, 0, 0);

  return &v11->super;
}

- (NSString)key
{
  -[GCFLocalizedString doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSBundle)bundle
{
  -[GCFLocalizedString doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSString)table
{
  -[GCFLocalizedString doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

@end
