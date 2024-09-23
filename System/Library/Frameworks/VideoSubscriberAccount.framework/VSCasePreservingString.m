@implementation VSCasePreservingString

- (VSCasePreservingString)initWithString:(id)a3
{
  id v4;
  VSCasePreservingString *v5;
  uint64_t v6;
  NSString *underlyingString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSCasePreservingString;
  v5 = -[VSCasePreservingString init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    underlyingString = v5->_underlyingString;
    v5->_underlyingString = (NSString *)v6;

  }
  return v5;
}

- (unint64_t)length
{
  return -[NSString length](self->_underlyingString, "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->_underlyingString, "characterAtIndex:", a3);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  -[NSString getCharacters:range:](self->_underlyingString, "getCharacters:range:", a3, a4.location, a4.length);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingString, 0);
}

@end
