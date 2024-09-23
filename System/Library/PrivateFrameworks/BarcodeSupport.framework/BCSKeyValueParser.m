@implementation BCSKeyValueParser

- (BCSKeyValueParser)initWithString:(id)a3 startIndex:(unint64_t)a4
{
  id v6;
  BCSKeyValueParser *v7;
  uint64_t v8;
  NSString *string;
  BCSKeyValueParser *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCSKeyValueParser;
  v7 = -[BCSKeyValueParser init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    string = v7->_string;
    v7->_string = (NSString *)v8;

    v7->_currentIndex = a4;
    v7->_stringLength = objc_msgSend(v6, "length");
    v10 = v7;
  }

  return v7;
}

- (NSDictionary)keyValuePairs
{
  NSMutableDictionary *keyValuePairs;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  keyValuePairs = self->_keyValuePairs;
  if (!keyValuePairs)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_keyValuePairs;
    self->_keyValuePairs = v4;

    while (-[BCSKeyValueParser _parseNextKeyValuePair](self, "_parseNextKeyValuePair"))
      ;
    keyValuePairs = self->_keyValuePairs;
  }
  return (NSDictionary *)keyValuePairs;
}

- (BOOL)_parseNextKeyValuePair
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = -[BCSKeyValueParser _indexOfDelimiter:range:](self, "_indexOfDelimiter:range:", CFSTR(";"),
         self->_currentIndex,
         self->_stringLength - self->_currentIndex);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v4 = v3;
  if (v3 == self->_currentIndex)
    return 0;
  v5 = -[BCSKeyValueParser _indexOfDelimiter:range:](self, "_indexOfDelimiter:range:", CFSTR(":"));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v8 = v5;
  -[NSString substringWithRange:](self->_string, "substringWithRange:", self->_currentIndex, v5 - self->_currentIndex);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_bcs_trimmedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_bcs_unescapedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "length");
  v6 = v12 != 0;
  if (v12)
  {
    -[NSString substringWithRange:](self->_string, "substringWithRange:", v8 + 1, v4 + ~v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_bcs_unescapedString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keyValuePairs, "setObject:forKeyedSubscript:", v14, v11);
    self->_currentIndex = v4 + 1;

  }
  return v6;
}

- (unint64_t)_indexOfDelimiter:(id)a3 range:(_NSRange)a4
{
  NSUInteger v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a4.location + a4.length;
  if (a4.location < a4.location + a4.length)
  {
    length = a4.length;
    location = a4.location;
    v9 = a4.location;
    do
    {
      v10 = -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", a3, 0, v9, v4 - v9);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v11 = v10;
      if (v10 == v9)
        return v9;
      v9 = v10;
      if ((-[BCSKeyValueParser _numberOfPreviousBackSlashesFromIndex:withinRange:](self, "_numberOfPreviousBackSlashesFromIndex:withinRange:", v10, location, length) & 1) == 0)return v9;
      v9 = v11 + 1;
    }
    while (v11 + 1 < v4);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)_numberOfPreviousBackSlashesFromIndex:(unint64_t)a3 withinRange:(_NSRange)a4
{
  unint64_t v4;
  unint64_t v6;
  unint64_t location;
  unint64_t v8;

  v4 = a3;
  if (a3 >= a4.location)
    v6 = a3 - a4.location;
  else
    v6 = 0;
  if (a4.location >= a3)
    location = a3;
  else
    location = a4.location;
  v8 = -1;
  while (location != v4)
  {
    --v4;
    ++v8;
    if (-[NSString characterAtIndex:](self->_string, "characterAtIndex:", v4) != 92)
      return v8;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValuePairs, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
