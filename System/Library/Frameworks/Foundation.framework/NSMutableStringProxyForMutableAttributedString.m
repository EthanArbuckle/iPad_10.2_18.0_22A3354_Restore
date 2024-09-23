@implementation NSMutableStringProxyForMutableAttributedString

- (unint64_t)length
{
  return -[NSString length](-[NSAttributedString string](self->mutableAttributedString, "string"), "length");
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  -[NSString getCharacters:range:](-[NSAttributedString string](self->mutableAttributedString, "string"), "getCharacters:range:", a3, a4.location, a4.length);
}

- (NSMutableStringProxyForMutableAttributedString)initWithMutableAttributedString:(id)a3
{
  NSMutableStringProxyForMutableAttributedString *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSMutableStringProxyForMutableAttributedString;
  v4 = -[NSString init](&v6, sel_init);
  if (v4)
    v4->mutableAttributedString = (NSMutableAttributedString *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSMutableStringProxyForMutableAttributedString;
  -[NSMutableStringProxyForMutableAttributedString dealloc](&v3, sel_dealloc);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  -[NSMutableAttributedString replaceCharactersInRange:withString:](self->mutableAttributedString, "replaceCharactersInRange:withString:", a3.location, a3.length, a4);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](-[NSAttributedString string](self->mutableAttributedString, "string"), "characterAtIndex:", a3);
}

@end
