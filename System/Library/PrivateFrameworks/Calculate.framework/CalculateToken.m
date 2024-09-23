@implementation CalculateToken

- (void)setTokenType:(unint64_t)a3
{
  self->_tokenType = a3;
}

- (NSString)normalizedText
{
  NSString *normalizedText;

  normalizedText = self->_normalizedText;
  if (!normalizedText)
    normalizedText = self->_text;
  return normalizedText;
}

- (CalculateToken)initWithType:(unint64_t)a3 range:(_NSRange)a4 text:(id)a5 ranks:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  CalculateToken *v14;
  CalculateToken *v15;
  objc_super v17;

  length = a4.length;
  location = a4.location;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CalculateToken;
  v14 = -[CalculateToken init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_tokenType = a3;
    v14->_range.location = location;
    v14->_range.length = length;
    objc_storeStrong((id *)&v14->_text, a5);
    objc_storeStrong((id *)&v15->_ranks, a6);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;

  v4 = a3;
  if (v4
    && (v5 = -[CalculateToken range](self, "range"), v5 == objc_msgSend(v4, "range"))
    && (-[CalculateToken range](self, "range"), v7 = v6, objc_msgSend(v4, "range"), v7 == v8))
  {
    v9 = -[CalculateToken tokenType](self, "tokenType");
    v10 = v9 == objc_msgSend(v4, "tokenType");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isOperand
{
  return (self->_tokenType < 0x35) & (0x1000E000000008uLL >> self->_tokenType);
}

- (BOOL)isOperator
{
  return (self->_tokenType < 0x25) & (0x140007FCF0uLL >> self->_tokenType);
}

- (BOOL)isOpen
{
  return +[CalculateToken isOpen:](CalculateToken, "isOpen:", self->_tokenType);
}

- (BOOL)isClose
{
  return +[CalculateToken isClose:](CalculateToken, "isClose:", self->_tokenType);
}

- (BOOL)isXVariable
{
  if (self->_tokenType != 39 || self->_range.length != 1)
    return 0;
  if (-[NSString isEqualToString:](self->_text, "isEqualToString:", CFSTR("x")))
    return 1;
  return -[NSString isEqualToString:](self->_text, "isEqualToString:", CFSTR("X"));
}

- (BOOL)isMaybeX
{
  unint64_t tokenType;
  BOOL v3;
  uint64_t v4;
  BOOL v5;

  tokenType = self->_tokenType;
  v3 = tokenType > 0x34;
  v4 = (1 << tokenType) & 0x10008000000040;
  v5 = v3 || v4 == 0;
  if (v5 || self->_range.length != 1)
    return 0;
  if (-[NSString isEqualToString:](self->_text, "isEqualToString:", CFSTR("x")))
    return 1;
  return -[NSString isEqualToString:](self->_text, "isEqualToString:", CFSTR("X"));
}

- (BOOL)isPotentialVariable
{
  int64_t tokenType;
  BOOL result;
  BOOL v5;
  unint64_t v6;

  tokenType = self->_tokenType;
  result = 1;
  if (tokenType <= 38)
  {
    if (tokenType == 2)
      return result;
    if (tokenType == 35)
    {
      if (-[NSString length](self->_text, "length") > 1)
        return 1;
      tokenType = self->_tokenType;
    }
    goto LABEL_10;
  }
  if (tokenType != 39 && tokenType != 52)
  {
LABEL_10:
    v5 = (unint64_t)tokenType > 0x26;
    v6 = (0x700007E000uLL >> tokenType) & 1;
    if (v5)
      return 0;
    else
      return v6;
  }
  return result;
}

- (BOOL)isUnknown
{
  return self->_tokenType - 52 < 3;
}

- (BOOL)needsWhitespaceAfter
{
  unint64_t tokenType;
  void *v4;

  tokenType = self->_tokenType;
  if (tokenType != 52 && tokenType != 39)
    return 0;
  if (!self->_loadedNeedsWhitespaceAfter)
  {
    self->_loadedNeedsWhitespaceAfter = 1;
    if (-[NSString length](self->_text, "length"))
    {
      +[CalculateTokenizer nonWhitespaceLanguageSet](CalculateTokenizer, "nonWhitespaceLanguageSet");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      self->_needsWhitespaceAfter = objc_msgSend(v4, "characterIsMember:", -[NSString characterAtIndex:](self->_text, "characterAtIndex:", 0)) ^ 1;

    }
    else
    {
      self->_needsWhitespaceAfter = 0;
    }
  }
  return self->_needsWhitespaceAfter;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("text: \"%@\", type: %lu, range: [%lu, %lu]"), self->_text, self->_tokenType, self->_range.location, self->_range.length);
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)tokenType
{
  return self->_tokenType;
}

- (NSString)text
{
  return self->_text;
}

- (void)setNormalizedText:(id)a3
{
  objc_storeStrong((id *)&self->_normalizedText, a3);
}

- (UnitRanks)ranks
{
  return self->_ranks;
}

- (void)setRanks:(id)a3
{
  objc_storeStrong((id *)&self->_ranks, a3);
}

- (void)setNeedsWhitespaceAfter:(BOOL)a3
{
  self->_needsWhitespaceAfter = a3;
}

- (BOOL)loadedNeedsWhitespaceAfter
{
  return self->_loadedNeedsWhitespaceAfter;
}

- (void)setLoadedNeedsWhitespaceAfter:(BOOL)a3
{
  self->_loadedNeedsWhitespaceAfter = a3;
}

- (int)characterType
{
  return self->_characterType;
}

- (void)setCharacterType:(int)a3
{
  self->_characterType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranks, 0);
  objc_storeStrong((id *)&self->_normalizedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

+ (id)tokenWithType:(unint64_t)a3 range:(_NSRange)a4 text:(id)a5 ranks:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  CalculateToken *v12;

  length = a4.length;
  location = a4.location;
  v10 = a6;
  v11 = a5;
  v12 = -[CalculateToken initWithType:range:text:ranks:]([CalculateToken alloc], "initWithType:range:text:ranks:", a3, location, length, v11, v10);

  return v12;
}

+ (BOOL)isOpen:(unint64_t)a3
{
  return (a3 < 0x32) & (0x2A8002A800100uLL >> a3);
}

+ (BOOL)isClose:(unint64_t)a3
{
  return (a3 < 0x33) & (0x5500055000200uLL >> a3);
}

@end
