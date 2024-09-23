@implementation ABVCardActivityAlertScanner

+ (id)scanAlertValueFromString:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "scannerWithString:", a3), "scanAlertValue");
}

+ (id)scannerWithString:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithString:", a3);
}

- (ABVCardActivityAlertScanner)initWithString:(id)a3
{
  ABVCardActivityAlertScanner *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ABVCardActivityAlertScanner;
  v4 = -[ABVCardActivityAlertScanner init](&v6, sel_init);
  if (v4)
  {
    v4->_string = (NSString *)objc_msgSend(a3, "copy");
    v4->_position = 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABVCardActivityAlertScanner;
  -[ABVCardActivityAlertScanner dealloc](&v3, sel_dealloc);
}

- (id)scanAlertValue
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  do
    objc_msgSend(v3, "addEntriesFromDictionary:", -[ABVCardActivityAlertScanner scanKeyValuePair](self, "scanKeyValuePair"));
  while (-[ABVCardActivityAlertScanner scanPastItemDelimiter](self, "scanPastItemDelimiter"));
  return v3;
}

- (id)scanKeyValuePair
{
  id v3;
  id v4;
  void *v5;
  char v6;
  id result;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = -[ABVCardActivityAlertScanner scanStringValue](self, "scanStringValue");
  -[ABVCardActivityAlertScanner scanPastKeyValueSeparator](self, "scanPastKeyValueSeparator");
  v4 = -[ABVCardActivityAlertScanner scanStringValue](self, "scanStringValue");
  if (!v3)
    return 0;
  v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", &stru_1E3CA4E68);
  result = 0;
  if ((v6 & 1) == 0 && v5)
  {
    if ((objc_msgSend(v5, "isEqualToString:", &stru_1E3CA4E68) & 1) != 0)
      return 0;
    v8 = v3;
    v9[0] = v5;
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  }
  return result;
}

- (id)scanStringValue
{
  if (-[ABVCardActivityAlertScanner atEnd](self, "atEnd"))
    return 0;
  if (-[ABVCardActivityAlertScanner nextUnescapedCharacter](self, "nextUnescapedCharacter") == 34)
    return -[ABVCardActivityAlertScanner scanQuotedStringValue](self, "scanQuotedStringValue");
  return -[ABVCardActivityAlertScanner scanUnquotedStringValue](self, "scanUnquotedStringValue");
}

- (id)scanUnquotedStringValue
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  if (!-[ABVCardActivityAlertScanner atEnd](self, "atEnd"))
  {
    do
    {
      if (!objc_msgSend((id)objc_opt_class(), "characterIsStringValueCharacter:", -[ABVCardActivityAlertScanner nextCharacter](self, "nextCharacter")))break;
      objc_msgSend(v3, "appendFormat:", CFSTR("%c"), -[ABVCardActivityAlertScanner scanCharacter](self, "scanCharacter"));
    }
    while (!-[ABVCardActivityAlertScanner atEnd](self, "atEnd"));
  }
  if (!v3 || objc_msgSend(v3, "isEqualToString:", &stru_1E3CA4E68))
    return 0;
  return v3;
}

- (id)scanQuotedStringValue
{
  void *v3;

  -[ABVCardActivityAlertScanner scanCharacter](self, "scanCharacter");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  if (!-[ABVCardActivityAlertScanner atEnd](self, "atEnd"))
  {
    do
    {
      if (-[ABVCardActivityAlertScanner nextUnescapedCharacter](self, "nextUnescapedCharacter") == 34)
        break;
      objc_msgSend(v3, "appendFormat:", CFSTR("%c"), -[ABVCardActivityAlertScanner scanCharacter](self, "scanCharacter"));
    }
    while (!-[ABVCardActivityAlertScanner atEnd](self, "atEnd"));
  }
  -[ABVCardActivityAlertScanner scanCharacter](self, "scanCharacter");
  return v3;
}

+ (BOOL)characterIsStringValueCharacter:(unsigned __int16)a3
{
  int v3;

  v3 = a3;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet"), "characterIsMember:", a3) & 1) != 0)
    return 0;
  return v3 != 61 && v3 != 44;
}

- (BOOL)scanPastKeyValueSeparator
{
  return -[ABVCardActivityAlertScanner scanPastCharacter:](self, "scanPastCharacter:", 61);
}

- (BOOL)scanPastItemDelimiter
{
  return -[ABVCardActivityAlertScanner scanPastCharacter:](self, "scanPastCharacter:", 44);
}

- (unsigned)scanCharacter
{
  return -[ABVCardActivityAlertScanner scanCharacterWithEscaping:](self, "scanCharacterWithEscaping:", 1);
}

- (unsigned)scanCharacterWithEscaping:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  NSString *string;

  v3 = a3;
  if (-[ABVCardActivityAlertScanner atEnd](self, "atEnd"))
  {
    LOWORD(v5) = 0;
  }
  else
  {
    string = self->_string;
    ++self->_position;
    v5 = -[NSString characterAtIndex:](string, "characterAtIndex:");
    if (v5 == 92 && v3)
      LOWORD(v5) = -[ABVCardActivityAlertScanner scanCharacterWithEscaping:](self, "scanCharacterWithEscaping:", 0);
  }
  return v5;
}

- (BOOL)scanPastCharacter:(unsigned __int16)a3
{
  int v3;
  unint64_t position;
  int v6;

  v3 = a3;
  -[ABVCardActivityAlertScanner scanPastWhitespace](self, "scanPastWhitespace");
  position = self->_position;
  v6 = -[ABVCardActivityAlertScanner scanCharacter](self, "scanCharacter");
  if (v6 == v3)
    -[ABVCardActivityAlertScanner scanPastWhitespace](self, "scanPastWhitespace");
  else
    self->_position = position;
  return v6 == v3;
}

- (void)scanPastWhitespace
{
  int v3;
  unsigned __int16 v4;
  int v5;

  v3 = -[ABVCardActivityAlertScanner nextCharacter](self, "nextCharacter");
  if (v3)
  {
    v4 = v3;
    do
    {
      if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet"), "characterIsMember:", v4))break;
      -[ABVCardActivityAlertScanner scanCharacter](self, "scanCharacter");
      v5 = -[ABVCardActivityAlertScanner nextCharacter](self, "nextCharacter");
      v4 = v5;
    }
    while (v5);
  }
}

- (unsigned)nextCharacter
{
  unint64_t position;
  unsigned __int16 result;

  position = self->_position;
  result = -[ABVCardActivityAlertScanner scanCharacter](self, "scanCharacter");
  self->_position = position;
  return result;
}

- (unsigned)nextUnescapedCharacter
{
  unint64_t position;
  unsigned __int16 result;

  position = self->_position;
  result = -[ABVCardActivityAlertScanner scanCharacterWithEscaping:](self, "scanCharacterWithEscaping:", 0);
  self->_position = position;
  return result;
}

- (unint64_t)position
{
  return self->_position;
}

- (BOOL)atEnd
{
  unint64_t position;

  position = self->_position;
  return position >= -[NSString length](self->_string, "length");
}

@end
