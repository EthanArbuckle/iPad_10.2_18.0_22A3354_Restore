@implementation NSDebugString

- (NSDebugString)initWithString:(id)a3
{
  NSDebugString *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSDebugString;
  v4 = -[NSString init](&v6, sel_init);
  v4->string = (NSString *)objc_msgSend(a3, "copyWithZone:", -[NSDebugString zone](v4, "zone"));
  return v4;
}

- (unint64_t)length
{
  return -[NSString length](self->string, "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->string, "characterAtIndex:", a3);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  -[NSString getCharacters:range:](self->string, "getCharacters:range:", a3, a4.location, a4.length);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSDebugString;
  -[NSDebugString dealloc](&v3, sel_dealloc);
}

@end
