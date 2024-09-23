@implementation ABVCardDateScanner

+ (id)scannerWithString:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithString:", a3);
}

- (ABVCardDateScanner)initWithString:(id)a3
{
  ABVCardDateScanner *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ABVCardDateScanner;
  v4 = -[ABVCardDateScanner init](&v6, sel_init);
  if (v4)
  {
    v4->_string = (NSString *)objc_msgSend(a3, "copy");
    v4->_position = 0;
  }
  return v4;
}

- (int64_t)scanComponentValueOfLength:(unint64_t)a3
{
  int v5;
  unint64_t position;
  unint64_t v8;
  NSString *v9;

  if (-[ABVCardDateScanner isAtEnd](self, "isAtEnd"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = -[ABVCardDateScanner nextCharacter](self, "nextCharacter");
  position = self->_position;
  if (v5 == 45)
  {
    self->_position = position + 1;
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v8 = a3 + 1;
  do
    --v8;
  while (position + v8 > -[NSString length](self->_string, "length"));
  v9 = -[NSString substringWithRange:](self->_string, "substringWithRange:", position, v8);
  self->_position += v8;
  return -[NSString integerValue](v9, "integerValue");
}

- (int64_t)scanCalendarUnit:(unint64_t)a3
{
  return -[ABVCardDateScanner scanComponentValueOfLength:](self, "scanComponentValueOfLength:", -[ABVCardDateScanner lengthOfCalendarUnit:](self, "lengthOfCalendarUnit:", a3));
}

- (unint64_t)lengthOfCalendarUnit:(unint64_t)a3
{
  unint64_t v3;
  __int128 v4;

  *((_QWORD *)&v4 + 1) = a3;
  *(_QWORD *)&v4 = a3 - 2;
  v3 = v4 >> 1;
  if (v3 > 7)
    return 0;
  else
    return qword_19BCBE728[v3];
}

- (BOOL)scanLeapMarker
{
  if (-[ABVCardDateScanner isAtEnd](self, "isAtEnd")
    || -[ABVCardDateScanner nextCharacter](self, "nextCharacter") != 76)
  {
    return 0;
  }
  ++self->_position;
  return 1;
}

- (BOOL)isAtEnd
{
  unint64_t position;

  position = self->_position;
  return position >= -[NSString length](self->_string, "length");
}

- (unsigned)nextCharacter
{
  return -[NSString characterAtIndex:](self->_string, "characterAtIndex:", self->_position);
}

- (unint64_t)position
{
  return self->_position;
}

@end
