@implementation IKCSSTokenizer

- (IKCSSTokenizer)initWithText:(id)a3
{
  id v4;
  IKCSSTokenizer *v5;
  IKCSSTokenizer *v6;
  uint64_t v7;
  unsigned __int16 *v8;
  IKCSSToken *reconsumeToken;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKCSSTokenizer;
  v5 = -[IKCSSTokenizer init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->currentOffset = 0;
    v7 = objc_msgSend(v4, "length");
    v6->textBytesCharCount = v7;
    v8 = (unsigned __int16 *)malloc_type_malloc(2 * v7, 0x252EF28uLL);
    v6->textBytes = v8;
    objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v8, 2 * v6->textBytesCharCount, 0, 10, 0, 0, objc_msgSend(v4, "length"), 0);
    reconsumeToken = v6->reconsumeToken;
    v6->reconsumeToken = 0;

  }
  return v6;
}

- (void)dealloc
{
  unsigned __int16 *textBytes;
  objc_super v4;

  textBytes = self->textBytes;
  if (textBytes)
    free(textBytes);
  v4.receiver = self;
  v4.super_class = (Class)IKCSSTokenizer;
  -[IKCSSTokenizer dealloc](&v4, sel_dealloc);
}

- (id)getNextToken
{
  void *v3;
  IKCSSToken *reconsumeToken;
  IKCSSToken *v5;
  IKCSSToken *v6;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1DF092260](self, a2);
  reconsumeToken = self->reconsumeToken;
  if (reconsumeToken)
  {
    v5 = reconsumeToken;
    v6 = self->reconsumeToken;
    self->reconsumeToken = 0;

  }
  else
  {
    v8 = 0;
    -[IKCSSTokenizer _consumeToken:consumed:](self, "_consumeToken:consumed:", self->currentOffset, &v8);
    v5 = (IKCSSToken *)objc_claimAutoreleasedReturnValue();
    self->currentOffset += v8;
  }
  objc_autoreleasePoolPop(v3);
  objc_storeStrong((id *)&self->_currentToken, v5);
  return v5;
}

- (void)reconsumeToken:(id)a3
{
  objc_storeStrong((id *)&self->reconsumeToken, a3);
}

- (id)_consumeToken:(unint64_t)a3 consumed:(unint64_t *)a4
{
  IKCSSToken *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  IKCSSToken *v11;
  uint64_t v12;
  uint64_t v14;

  v14 = 0;
  if (!-[IKCSSTokenizer isEOF:](self, "isEOF:"))
  {
    v9 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3);
    if (+[IKCSSTokenizer isWhitespace:](IKCSSTokenizer, "isWhitespace:", v9))
    {
      -[IKCSSTokenizer _consumeWhitespace:consumed:](self, "_consumeWhitespace:consumed:", a3 + 1, &v14);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    if ((int)v9 <= 90)
    {
      switch((int)v9)
      {
        case '"':
        case '\'':
          -[IKCSSTokenizer _consumeString:consumed:toEndChar:](self, "_consumeString:consumed:toEndChar:", a3 + 1, &v14, v9);
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        case '#':
          -[IKCSSTokenizer _consumeHash:consumed:](self, "_consumeHash:consumed:", a3 + 1, &v14);
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        case '$':
          -[IKCSSTokenizer _consumeDollar:consumed:](self, "_consumeDollar:consumed:", a3 + 1, &v14);
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        case '(':
          v11 = [IKCSSToken alloc];
          v12 = 8;
          goto LABEL_32;
        case ')':
          v11 = [IKCSSToken alloc];
          v12 = 9;
          goto LABEL_32;
        case '*':
          -[IKCSSTokenizer _consumeAsterisk:consumed:](self, "_consumeAsterisk:consumed:", a3 + 1, &v14);
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        case '+':
          -[IKCSSTokenizer _consumePlus:consumed:](self, "_consumePlus:consumed:", a3 + 1, &v14);
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        case ',':
          v11 = [IKCSSToken alloc];
          v12 = 14;
          goto LABEL_32;
        case '-':
          -[IKCSSTokenizer _consumeMinus:consumed:](self, "_consumeMinus:consumed:", a3 + 1, &v14);
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        case '.':
          -[IKCSSTokenizer _consumeDot:consumed:](self, "_consumeDot:consumed:", a3 + 1, &v14);
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        case '/':
          if (-[IKCSSTokenizer _getChar:](self, "_getChar:", a3 + 1) == 42)
          {
            -[IKCSSTokenizer _consumeComment:consumed:](self, "_consumeComment:consumed:", a3, &v14);
            v7 = (IKCSSToken *)objc_claimAutoreleasedReturnValue();
            v8 = 0;
            goto LABEL_35;
          }
          -[IKCSSTokenizer _consumeSlash:consumed:](self, "_consumeSlash:consumed:", a3 + 1, &v14);
          v10 = objc_claimAutoreleasedReturnValue();
          break;
        case ':':
          v11 = [IKCSSToken alloc];
          v12 = 21;
          goto LABEL_32;
        case ';':
          v11 = [IKCSSToken alloc];
          v12 = 22;
          goto LABEL_32;
        case '<':
          -[IKCSSTokenizer _consumeLessThan:consumed:](self, "_consumeLessThan:consumed:", a3 + 1, &v14);
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        case '@':
          -[IKCSSTokenizer _consumeAt:consumed:](self, "_consumeAt:consumed:", a3 + 1, &v14);
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        default:
          goto LABEL_36;
      }
      goto LABEL_33;
    }
    switch((int)v9)
    {
      case '[':
        v11 = [IKCSSToken alloc];
        v12 = 23;
        goto LABEL_32;
      case '\\':
        -[IKCSSTokenizer _consumeBackslash:consumed:](self, "_consumeBackslash:consumed:", a3 + 1, &v14);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      case ']':
        v11 = [IKCSSToken alloc];
        v12 = 24;
        goto LABEL_32;
      case '^':
        -[IKCSSTokenizer _consumeCaret:consumed:](self, "_consumeCaret:consumed:", a3 + 1, &v14);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      default:
        if ((_DWORD)v9 == 123)
        {
          v11 = [IKCSSToken alloc];
          v12 = 25;
        }
        else
        {
          if ((_DWORD)v9 != 125)
          {
LABEL_36:
            if (+[IKCSSTokenizer isDigit:](IKCSSTokenizer, "isDigit:", v9))
            {
              -[IKCSSTokenizer _consumeNumeric:consumed:](self, "_consumeNumeric:consumed:", a3, &v14);
              v7 = (IKCSSToken *)objc_claimAutoreleasedReturnValue();
              --v14;
              goto LABEL_34;
            }
            if (+[IKCSSTokenizer isNameStartCodePoint:](IKCSSTokenizer, "isNameStartCodePoint:", v9))
            {
              -[IKCSSTokenizer _consumeNameStart:consumed:](self, "_consumeNameStart:consumed:", a3 + 1, &v14);
              v10 = objc_claimAutoreleasedReturnValue();
            }
            else if ((_DWORD)v9 == 126)
            {
              -[IKCSSTokenizer _consumeTilde:consumed:](self, "_consumeTilde:consumed:", a3 + 1, &v14);
              v10 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if ((_DWORD)v9 != 124)
              {
                v7 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 5);
                -[IKCSSToken setCharValue:](v7, "setCharValue:", v9);
                goto LABEL_34;
              }
              -[IKCSSTokenizer _consumePipe:consumed:](self, "_consumePipe:consumed:", a3 + 1, &v14);
              v10 = objc_claimAutoreleasedReturnValue();
            }
LABEL_33:
            v7 = (IKCSSToken *)v10;
LABEL_34:
            v8 = 1;
            goto LABEL_35;
          }
          v11 = [IKCSSToken alloc];
          v12 = 26;
        }
LABEL_32:
        v10 = -[IKCSSToken initWithType:](v11, "initWithType:", v12);
        goto LABEL_33;
    }
  }
  v7 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 2);
  v8 = 0;
  --a3;
LABEL_35:
  *a4 = v14 + v8;
  -[IKCSSToken setRange:](v7, "setRange:", a3);
  return v7;
}

- (BOOL)isEOF:(unint64_t)a3
{
  return self->textBytesCharCount <= a3;
}

- (unsigned)_getChar:(unint64_t)a3
{
  if (self->textBytesCharCount <= a3)
    return 0;
  else
    return self->textBytes[a3];
}

+ (BOOL)isWhitespace:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "characterIsMember:", v3);

  return v3;
}

+ (BOOL)isNewline:(unsigned __int16)a3
{
  return a3 == 10 || (a3 & 0xFFFE) == 12;
}

+ (BOOL)isDigit:(unsigned __int16)a3
{
  return (a3 - 48) < 0xA;
}

+ (BOOL)isNonASCIICodePoint:(unsigned __int16)a3
{
  return a3 > 0x7Fu;
}

+ (BOOL)isUppercaseLetter:(unsigned __int16)a3
{
  return (a3 - 65) < 0x1A;
}

+ (BOOL)isLowercaseLetter:(unsigned __int16)a3
{
  return (a3 - 97) < 0x1A;
}

+ (BOOL)isLetter:(unsigned __int16)a3
{
  uint64_t v3;

  v3 = a3;
  return +[IKCSSTokenizer isUppercaseLetter:](IKCSSTokenizer, "isUppercaseLetter:")
      || +[IKCSSTokenizer isLowercaseLetter:](IKCSSTokenizer, "isLowercaseLetter:", v3);
}

+ (BOOL)isNameStartCodePoint:(unsigned __int16)a3
{
  uint64_t v3;
  BOOL result;

  v3 = a3;
  if (+[IKCSSTokenizer isLetter:](IKCSSTokenizer, "isLetter:"))
    return 1;
  result = +[IKCSSTokenizer isNonASCIICodePoint:](IKCSSTokenizer, "isNonASCIICodePoint:", v3);
  if ((_DWORD)v3 == 95)
    return 1;
  return result;
}

+ (BOOL)isNameCodePoint:(unsigned __int16)a3
{
  uint64_t v3;
  BOOL result;

  v3 = a3;
  if (+[IKCSSTokenizer isNameStartCodePoint:](IKCSSTokenizer, "isNameStartCodePoint:"))
    return 1;
  result = +[IKCSSTokenizer isDigit:](IKCSSTokenizer, "isDigit:", v3);
  if ((_DWORD)v3 == 45)
    return 1;
  return result;
}

+ (BOOL)isHexDigit:(unsigned __int16)a3
{
  int v3;
  BOOL v4;
  BOOL v5;

  v3 = a3;
  v4 = +[IKCSSTokenizer isDigit:](IKCSSTokenizer, "isDigit:");
  v5 = (v3 - 97) < 6;
  if (v4)
    v5 = 1;
  return (v3 - 65) < 6 || v5;
}

- (BOOL)isValidEscape:(unint64_t)a3
{
  unint64_t v5;

  v5 = a3 + 1;
  if (-[IKCSSTokenizer isEOF:](self, "isEOF:", a3 + 1) || -[IKCSSTokenizer _getChar:](self, "_getChar:", a3) != 93)
    return 0;
  else
    return !+[IKCSSTokenizer isNewline:](IKCSSTokenizer, "isNewline:", -[IKCSSTokenizer _getChar:](self, "_getChar:", v5));
}

+ (BOOL)isNonPrintable:(unsigned __int16)a3
{
  return a3 < 9u || a3 == 11 || (a3 - 14) < 0x12 || a3 == 127;
}

- (BOOL)wouldStartIdentifier:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  int v8;

  v5 = -[IKCSSTokenizer _getChar:](self, "_getChar:");
  if ((_DWORD)v5 == 45)
  {
    v6 = a3 + 1;
    if (!+[IKCSSTokenizer isNameStartCodePoint:](IKCSSTokenizer, "isNameStartCodePoint:", -[IKCSSTokenizer _getChar:](self, "_getChar:", v6)))return -[IKCSSTokenizer isValidEscape:](self, "isValidEscape:", v6);
    return 1;
  }
  v8 = v5;
  return +[IKCSSTokenizer isNameStartCodePoint:](IKCSSTokenizer, "isNameStartCodePoint:", v5)
      || v8 == 92 && -[IKCSSTokenizer isValidEscape:](self, "isValidEscape:", a3);
}

- (BOOL)wouldStartNumber:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = -[IKCSSTokenizer _getChar:](self, "_getChar:");
  if ((_DWORD)v5 != 43)
  {
    v6 = v5;
    if ((_DWORD)v5 == 46)
    {
      v6 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3 + 1);
    }
    else if ((_DWORD)v5 == 45)
    {
      goto LABEL_4;
    }
    return +[IKCSSTokenizer isDigit:](IKCSSTokenizer, "isDigit:", v6);
  }
LABEL_4:
  v7 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3 + 1);
  return +[IKCSSTokenizer isDigit:](IKCSSTokenizer, "isDigit:", v7)
      || (_DWORD)v7 == 46
      && +[IKCSSTokenizer isDigit:](IKCSSTokenizer, "isDigit:", -[IKCSSTokenizer _getChar:](self, "_getChar:", a3 + 2));
}

- (unsigned)_consumeEscapedCodePoint:(unint64_t)a3 consumed:(unint64_t *)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  int v14;

  v7 = -[IKCSSTokenizer _getChar:](self, "_getChar:");
  if (+[IKCSSTokenizer isHexDigit:](IKCSSTokenizer, "isHexDigit:", v7))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E9F50578);
    v9 = 0;
    v10 = 6;
    while (1)
    {
      v11 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3 + v9);
      if (!+[IKCSSTokenizer isHexDigit:](IKCSSTokenizer, "isHexDigit:", v11))
        break;
      objc_msgSend(v8, "appendFormat:", CFSTR("%C"), v11);
      if (++v9 == 6)
        goto LABEL_8;
    }
    v10 = v9 + +[IKCSSTokenizer isWhitespace:](IKCSSTokenizer, "isWhitespace:", v11);
LABEL_8:
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scanHexInt:", &v14);
    LOWORD(v7) = v14;

  }
  else
  {
    v10 = 1;
  }
  *a4 = v10;
  return v7;
}

- (id)_consumeName:(unint64_t)a3 consumed:(unint64_t *)a4
{
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E9F50578);
  v8 = 0;
  if (!-[IKCSSTokenizer isEOF:](self, "isEOF:", a3))
  {
    v9 = a3;
    do
    {
      v10 = -[IKCSSTokenizer _getChar:](self, "_getChar:", v9);
      if (+[IKCSSTokenizer isNameCodePoint:](IKCSSTokenizer, "isNameCodePoint:", v10))
      {
        objc_msgSend(v7, "appendFormat:", CFSTR("%C"), v10);
      }
      else
      {
        if (!-[IKCSSTokenizer isValidEscape:](self, "isValidEscape:", v9))
          break;
        v12 = 0;
        objc_msgSend(v7, "appendFormat:", CFSTR("%C"), -[IKCSSTokenizer _consumeEscapedCodePoint:consumed:](self, "_consumeEscapedCodePoint:consumed:", a3 + 1, &v12));
        v8 += v12;
      }
      v9 = ++v8 + a3;
    }
    while (!-[IKCSSTokenizer isEOF:](self, "isEOF:", v8 + a3));
  }
  *a4 = v8;
  return v7;
}

- (id)_consumeHash:(unint64_t)a3 consumed:(unint64_t *)a4
{
  IKCSSToken *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v14;

  v14 = 0;
  if (+[IKCSSTokenizer isNameCodePoint:](IKCSSTokenizer, "isNameCodePoint:", -[IKCSSTokenizer _getChar:](self, "_getChar:"))|| -[IKCSSTokenizer isValidEscape:](self, "isValidEscape:", a3))
  {
    v7 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 6);
    if (-[IKCSSTokenizer wouldStartIdentifier:](self, "wouldStartIdentifier:", a3))
    {
      v8 = (void *)MEMORY[0x1E0C99E08];
      -[IKCSSToken properties](v7, "properties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictionaryWithDictionary:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setObject:forKey:", CFSTR("id"), CFSTR("typeFlag"));
      -[IKCSSToken setProperties:](v7, "setProperties:", v10);

    }
    -[IKCSSTokenizer _consumeName:consumed:](self, "_consumeName:consumed:", a3, &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKCSSToken setStringValue:](v7, "setStringValue:", v11);

    v12 = v14;
  }
  else
  {
    v7 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 5);
    -[IKCSSToken setCharValue:](v7, "setCharValue:", 35);
    v12 = 0;
  }
  *a4 = v12;
  return v7;
}

- (id)_consumeDollar:(unint64_t)a3 consumed:(unint64_t *)a4
{
  int v5;
  IKCSSToken *v6;
  IKCSSToken *v7;
  unint64_t v8;

  v5 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3);
  v6 = [IKCSSToken alloc];
  if (v5 == 61)
  {
    v7 = -[IKCSSToken initWithType:](v6, "initWithType:", 7);
    v8 = 1;
  }
  else
  {
    v7 = -[IKCSSToken initWithType:](v6, "initWithType:", 5);
    -[IKCSSToken setCharValue:](v7, "setCharValue:", 36);
    v8 = 0;
  }
  *a4 = v8;
  return v7;
}

- (id)_consumeAsterisk:(unint64_t)a3 consumed:(unint64_t *)a4
{
  int v5;
  IKCSSToken *v6;
  IKCSSToken *v7;
  unint64_t v8;

  v5 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3);
  v6 = [IKCSSToken alloc];
  if (v5 == 61)
  {
    v7 = -[IKCSSToken initWithType:](v6, "initWithType:", 10);
    v8 = 1;
  }
  else
  {
    v7 = -[IKCSSToken initWithType:](v6, "initWithType:", 5);
    -[IKCSSToken setCharValue:](v7, "setCharValue:", 42);
    v8 = 0;
  }
  *a4 = v8;
  return v7;
}

- (id)_consumeCaret:(unint64_t)a3 consumed:(unint64_t *)a4
{
  int v5;
  IKCSSToken *v6;
  IKCSSToken *v7;
  unint64_t v8;

  v5 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3);
  v6 = [IKCSSToken alloc];
  if (v5 == 61)
  {
    v7 = -[IKCSSToken initWithType:](v6, "initWithType:", 27);
    v8 = 1;
  }
  else
  {
    v7 = -[IKCSSToken initWithType:](v6, "initWithType:", 5);
    -[IKCSSToken setCharValue:](v7, "setCharValue:", 94);
    v8 = 0;
  }
  *a4 = v8;
  return v7;
}

- (id)_consumePipe:(unint64_t)a3 consumed:(unint64_t *)a4
{
  int v5;
  IKCSSToken *v6;
  uint64_t v7;
  IKCSSToken *v8;
  unint64_t v9;

  v5 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3);
  if (v5 == 124)
  {
    v6 = [IKCSSToken alloc];
    v7 = 31;
  }
  else
  {
    if (v5 != 61)
    {
      v8 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 5);
      -[IKCSSToken setCharValue:](v8, "setCharValue:", 124);
      v9 = 0;
      goto LABEL_7;
    }
    v6 = [IKCSSToken alloc];
    v7 = 30;
  }
  v8 = -[IKCSSToken initWithType:](v6, "initWithType:", v7);
  v9 = 1;
LABEL_7:
  *a4 = v9;
  return v8;
}

- (id)_consumeTilde:(unint64_t)a3 consumed:(unint64_t *)a4
{
  int v5;
  IKCSSToken *v6;
  IKCSSToken *v7;
  unint64_t v8;

  v5 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3);
  v6 = [IKCSSToken alloc];
  if (v5 == 61)
  {
    v7 = -[IKCSSToken initWithType:](v6, "initWithType:", 28);
    v8 = 1;
  }
  else
  {
    v7 = -[IKCSSToken initWithType:](v6, "initWithType:", 5);
    -[IKCSSToken setCharValue:](v7, "setCharValue:", 126);
    v8 = 0;
  }
  *a4 = v8;
  return v7;
}

- (id)_consumeLessThan:(unint64_t)a3 consumed:(unint64_t *)a4
{
  unint64_t v7;
  IKCSSToken *v8;
  int v9;
  int v10;
  int v11;
  IKCSSToken *v12;
  unint64_t v13;

  v7 = a3 + 2;
  if (-[IKCSSTokenizer isEOF:](self, "isEOF:", a3 + 2))
  {
    v8 = [IKCSSToken alloc];
LABEL_7:
    v12 = -[IKCSSToken initWithType:](v8, "initWithType:", 5);
    -[IKCSSToken setCharValue:](v12, "setCharValue:", 60);
    v13 = 0;
    goto LABEL_8;
  }
  v9 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3);
  v10 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3 + 1);
  v11 = -[IKCSSTokenizer _getChar:](self, "_getChar:", v7);
  v8 = [IKCSSToken alloc];
  if (v9 != 33 || v10 != 45 || v11 != 45)
    goto LABEL_7;
  v12 = -[IKCSSToken initWithType:](v8, "initWithType:", 16);
  v13 = 3;
LABEL_8:
  *a4 = v13;
  return v12;
}

- (id)_consumeAt:(unint64_t)a3 consumed:(unint64_t *)a4
{
  void *v7;
  unint64_t v8;
  IKCSSToken *v9;
  unint64_t v11;

  if (-[IKCSSTokenizer wouldStartIdentifier:](self, "wouldStartIdentifier:"))
  {
    v11 = 0;
    -[IKCSSTokenizer _consumeName:consumed:](self, "_consumeName:consumed:", a3, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    v9 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 29);
    -[IKCSSToken setStringValue:](v9, "setStringValue:", v7);

  }
  else
  {
    v9 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 5);
    -[IKCSSToken setCharValue:](v9, "setCharValue:", 64);
    v8 = 0;
  }
  *a4 = v8;
  return v9;
}

- (id)_consumeBackslash:(unint64_t)a3 consumed:(unint64_t *)a4
{
  IKCSSToken *v7;
  unint64_t v8;
  uint64_t v10;

  if (-[IKCSSTokenizer isValidEscape:](self, "isValidEscape:"))
  {
    v10 = 0;
    -[IKCSSTokenizer _consumeIdentLike:consumed:](self, "_consumeIdentLike:consumed:", a3 - 1, &v10);
    v7 = (IKCSSToken *)objc_claimAutoreleasedReturnValue();
    v8 = v10 - 1;
  }
  else
  {
    v7 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 5);
    -[IKCSSToken setCharValue:](v7, "setCharValue:", 92);
    v8 = 0;
  }
  *a4 = v8;
  return v7;
}

- (id)_consumeUnicodeRange:(unint64_t)a3 consumed:(unint64_t *)a4
{
  *a4 = 0;
  return 0;
}

- (id)_consumeNameStart:(unint64_t)a3 consumed:(unint64_t *)a4
{
  void *v5;
  uint64_t v7;

  v7 = 0;
  -[IKCSSTokenizer _consumeIdentLike:consumed:](self, "_consumeIdentLike:consumed:", a3 - 1, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = v7 - 1;
  return v5;
}

- (id)_consumePlus:(unint64_t)a3 consumed:(unint64_t *)a4
{
  IKCSSToken *v7;
  unint64_t v8;
  uint64_t v10;

  if (-[IKCSSTokenizer wouldStartNumber:](self, "wouldStartNumber:"))
  {
    v10 = 0;
    -[IKCSSTokenizer _consumeNumeric:consumed:](self, "_consumeNumeric:consumed:", a3 - 1, &v10);
    v7 = (IKCSSToken *)objc_claimAutoreleasedReturnValue();
    v8 = v10 - 1;
  }
  else
  {
    v7 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 5);
    -[IKCSSToken setCharValue:](v7, "setCharValue:", 43);
    v8 = 0;
  }
  *a4 = v8;
  return v7;
}

- (id)_consumeMinus:(unint64_t)a3 consumed:(unint64_t *)a4
{
  uint64_t v7;
  IKCSSToken *v8;
  unint64_t v9;
  uint64_t v11;

  if (-[IKCSSTokenizer wouldStartNumber:](self, "wouldStartNumber:"))
  {
    v11 = 0;
    -[IKCSSTokenizer _consumeNumeric:consumed:](self, "_consumeNumeric:consumed:", a3 - 1, &v11);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (IKCSSToken *)v7;
    v9 = v11 - 1;
    goto LABEL_6;
  }
  if (-[IKCSSTokenizer wouldStartIdentifier:](self, "wouldStartIdentifier:", a3))
  {
    v11 = 0;
    -[IKCSSTokenizer _consumeIdentLike:consumed:](self, "_consumeIdentLike:consumed:", a3 - 1, &v11);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (-[IKCSSTokenizer _getChar:](self, "_getChar:", a3) == 45
    && -[IKCSSTokenizer _getChar:](self, "_getChar:", a3 + 1) == 62)
  {
    v8 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 15);
    v9 = 2;
  }
  else
  {
    v8 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 5);
    -[IKCSSToken setCharValue:](v8, "setCharValue:", 45);
    v9 = 0;
  }
LABEL_6:
  *a4 = v9;
  return v8;
}

- (id)_consumeIdentLike:(unint64_t)a3 consumed:(unint64_t *)a4
{
  void *v7;
  uint64_t v8;
  int v9;
  IKCSSToken *v10;
  uint64_t v11;
  IKCSSToken *v12;
  uint64_t v14;
  unint64_t v15;

  v15 = 0;
  -[IKCSSTokenizer _consumeName:consumed:](self, "_consumeName:consumed:", a3, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("url"));
  v9 = -[IKCSSTokenizer _getChar:](self, "_getChar:", v15 + a3);
  if (v8)
  {
    if (v9 == 40)
    {
      ++v15;
      v10 = [IKCSSToken alloc];
      v11 = 17;
    }
    else
    {
      v10 = [IKCSSToken alloc];
      v11 = 18;
    }
    v12 = -[IKCSSToken initWithType:](v10, "initWithType:", v11);
    -[IKCSSToken setStringValue:](v12, "setStringValue:", v7);
  }
  else if (v9 == 40)
  {
    v14 = 0;
    -[IKCSSTokenizer _consumeUrl:consumed:](self, "_consumeUrl:consumed:", ++v15 + a3, &v14);
    v12 = (IKCSSToken *)objc_claimAutoreleasedReturnValue();
    v15 += v14;
  }
  else
  {
    v12 = 0;
  }
  *a4 = v15;

  return v12;
}

- (void)_consumeBadUrlRemnants:(unint64_t)a3 consumed:(unint64_t *)a4
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v7 = 0;
  if (!-[IKCSSTokenizer isEOF:](self, "isEOF:"))
  {
    v8 = a3;
    do
    {
      ++v7;
      if (-[IKCSSTokenizer _getChar:](self, "_getChar:", v8) == 41)
        break;
      v8 = v7 + a3;
      if (-[IKCSSTokenizer isValidEscape:](self, "isValidEscape:", v7 + a3))
      {
        v9 = 0;
        -[IKCSSTokenizer _consumeEscapedCodePoint:consumed:](self, "_consumeEscapedCodePoint:consumed:", v7 + a3, &v9);
        v7 += v9;
        v8 = v7 + a3;
      }
    }
    while (!-[IKCSSTokenizer isEOF:](self, "isEOF:", v8));
  }
  *a4 = v7;
}

- (id)_consumeUrl:(unint64_t)a3 consumed:(unint64_t *)a4
{
  IKCSSToken *v7;
  void *v8;
  id v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  BOOL v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v7 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 19);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E9F50578);
  v24 = 0;
  v9 = -[IKCSSTokenizer _consumeWhitespace:consumed:](self, "_consumeWhitespace:consumed:", a3, &v24);
  v10 = -[IKCSSTokenizer isEOF:](self, "isEOF:", v24 + a3);
  v11 = v24;
  if (!v10)
  {
    v12 = -[IKCSSTokenizer _getChar:](self, "_getChar:", v24 + a3);
    if ((_DWORD)v12 == 34 || (_DWORD)v12 == 39)
    {
      v23 = 0;
      -[IKCSSTokenizer _consumeString:consumed:toEndChar:](self, "_consumeString:consumed:toEndChar:", ++v24 + a3, &v23, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 += v23;
      if (objc_msgSend(v13, "type") == 4)
      {
        v23 = 0;
        -[IKCSSTokenizer _consumeBadUrlRemnants:consumed:](self, "_consumeBadUrlRemnants:consumed:", v24 + a3, &v23);
        v14 = v23;
      }
      else
      {
        objc_msgSend(v13, "stringValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setString:", v19);

        v22 = 0;
        v20 = -[IKCSSTokenizer _consumeWhitespace:consumed:](self, "_consumeWhitespace:consumed:", a3, &v22);
        v24 += v22;
        if (-[IKCSSTokenizer _getChar:](self, "_getChar:", v24 + a3) == 41)
        {
          ++v24;
LABEL_28:

          goto LABEL_29;
        }
        v22 = 0;
        -[IKCSSTokenizer _consumeBadUrlRemnants:consumed:](self, "_consumeBadUrlRemnants:consumed:", v24 + a3, &v22);
        v14 = v22;
      }
      v24 += v14;
      -[IKCSSToken setType:](v7, "setType:", 20);
      goto LABEL_28;
    }
    if (-[IKCSSTokenizer isEOF:](self, "isEOF:", v24 + a3))
    {
LABEL_29:
      -[IKCSSToken setStringValue:](v7, "setStringValue:", v8);
      v11 = v24;
      goto LABEL_30;
    }
    while (1)
    {
      v15 = -[IKCSSTokenizer _getChar:](self, "_getChar:", v24 + a3);
      ++v24;
      if ((_DWORD)v15 == 41)
        goto LABEL_29;
      v16 = v15;
      if (+[IKCSSTokenizer isWhitespace:](IKCSSTokenizer, "isWhitespace:", v15))
      {
        v23 = 0;
        v17 = -[IKCSSTokenizer _consumeWhitespace:consumed:](self, "_consumeWhitespace:consumed:", a3, &v23);
        v24 += v23;
        if (-[IKCSSTokenizer isEOF:](self, "isEOF:", v24 + a3))
          goto LABEL_29;
        if (-[IKCSSTokenizer _getChar:](self, "_getChar:", v24 + a3) == 41)
        {
          ++v24;
          goto LABEL_29;
        }
      }
      else
      {
        v18 = v16 > 0x28 || ((1 << v16) & 0x18400000000) == 0;
        if (v18 && !+[IKCSSTokenizer isNonPrintable:](IKCSSTokenizer, "isNonPrintable:", v16))
        {
          if ((_DWORD)v16 != 92)
          {
            objc_msgSend(v8, "appendFormat:", CFSTR("%C"), v16);
            goto LABEL_17;
          }
          if (-[IKCSSTokenizer isValidEscape:](self, "isValidEscape:", v24 + a3))
          {
            v23 = 0;
            objc_msgSend(v8, "appendFormat:", CFSTR("%C"), -[IKCSSTokenizer _consumeEscapedCodePoint:consumed:](self, "_consumeEscapedCodePoint:consumed:", v24 + a3, &v23));
            v24 += v23;
            goto LABEL_17;
          }
        }
      }
      v23 = 0;
      -[IKCSSTokenizer _consumeBadUrlRemnants:consumed:](self, "_consumeBadUrlRemnants:consumed:", v24 + a3, &v23);
      v24 += v23;
      -[IKCSSToken setType:](v7, "setType:", 20);
LABEL_17:
      if (-[IKCSSTokenizer isEOF:](self, "isEOF:", v24 + a3))
        goto LABEL_29;
    }
  }
LABEL_30:
  *a4 = v11;

  return v7;
}

- (id)_consumeDot:(unint64_t)a3 consumed:(unint64_t *)a4
{
  IKCSSToken *v7;
  unint64_t v8;
  uint64_t v10;

  v10 = 0;
  if (-[IKCSSTokenizer wouldStartNumber:](self, "wouldStartNumber:"))
  {
    -[IKCSSTokenizer _consumeNumeric:consumed:](self, "_consumeNumeric:consumed:", a3 - 1, &v10);
    v7 = (IKCSSToken *)objc_claimAutoreleasedReturnValue();
    v8 = --v10;
  }
  else
  {
    v7 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 5);
    -[IKCSSToken setCharValue:](v7, "setCharValue:", 46);
    v8 = 0;
  }
  *a4 = v8;
  return v7;
}

- (id)_consumeSlash:(unint64_t)a3 consumed:(unint64_t *)a4
{
  unint64_t v7;
  IKCSSToken *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v14;

  if (-[IKCSSTokenizer _getChar:](self, "_getChar:") == 42)
  {
    if (-[IKCSSTokenizer isEOF:](self, "isEOF:", a3 + 1))
    {
      v7 = 1;
LABEL_12:
      v8 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 2);
    }
    else
    {
      v9 = 0;
      while (1)
      {
        if (-[IKCSSTokenizer isEOF:](self, "isEOF:", a3 + v9 + 2))
        {
          v7 = v9 + 2;
          goto LABEL_12;
        }
        v10 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3 + v9 + 1);
        v11 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3 + v9 + 2);
        if (v10 == 42 && v11 == 47)
          break;
        -[IKCSSTokenizer _getChar:](self, "_getChar:", a3 + v9 + 1);
        if (-[IKCSSTokenizer isEOF:](self, "isEOF:", a3 + v9++ + 2))
        {
          v7 = v9 + 1;
          goto LABEL_12;
        }
      }
      v14 = 0;
      -[IKCSSTokenizer _consumeToken:consumed:](self, "_consumeToken:consumed:", a3 + v9 + 3, &v14);
      v8 = (IKCSSToken *)objc_claimAutoreleasedReturnValue();
      v7 = v14 + v9 + 3;
    }
  }
  else
  {
    v8 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 5);
    -[IKCSSToken setCharValue:](v8, "setCharValue:", 47);
    v7 = 0;
  }
  *a4 = v7;
  return v8;
}

- (id)_consumeNumber:(unint64_t)a3 consumed:(unint64_t *)a4
{
  void *v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  unint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t *v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E9F50578);
  v8 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3);
  v29 = a4;
  if (v8 == 45 || v8 == 43)
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%C"), v8);
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9 + a3;
  v11 = -[IKCSSTokenizer _getChar:](self, "_getChar:", v9 + a3);
  if (+[IKCSSTokenizer isDigit:](IKCSSTokenizer, "isDigit:", v11))
  {
    do
    {
      objc_msgSend(v7, "appendFormat:", CFSTR("%C"), (unsigned __int16)v11);
      v11 = -[IKCSSTokenizer _getChar:](self, "_getChar:", ++v9 + a3);
    }
    while (+[IKCSSTokenizer isDigit:](IKCSSTokenizer, "isDigit:", v11));
    v10 = a3 + v9;
  }
  v12 = -[IKCSSTokenizer _getChar:](self, "_getChar:", v10);
  v13 = -[IKCSSTokenizer _getChar:](self, "_getChar:", v10 + 1);
  if (v12 == 46 && (v14 = v13, +[IKCSSTokenizer isDigit:](IKCSSTokenizer, "isDigit:", v13)))
  {
    v9 += 2;
    objc_msgSend(v7, "appendFormat:", CFSTR("%C%C"), 46, v14);
    v10 = v9 + a3;
    v15 = -[IKCSSTokenizer _getChar:](self, "_getChar:", v9 + a3);
    if (+[IKCSSTokenizer isDigit:](IKCSSTokenizer, "isDigit:", v15))
    {
      do
      {
        objc_msgSend(v7, "appendFormat:", CFSTR("%C"), (unsigned __int16)v15);
        v15 = -[IKCSSTokenizer _getChar:](self, "_getChar:", ++v9 + a3);
      }
      while (+[IKCSSTokenizer isDigit:](IKCSSTokenizer, "isDigit:", v15));
      v10 = a3 + v9;
    }
    v16 = CFSTR("number");
  }
  else
  {
    v16 = CFSTR("integer");
  }
  v17 = -[IKCSSTokenizer _getChar:](self, "_getChar:", v10);
  v18 = v10 + 1;
  v19 = -[IKCSSTokenizer _getChar:](self, "_getChar:", v10 + 1);
  v20 = -[IKCSSTokenizer _getChar:](self, "_getChar:", v10 + 2);
  if ((v17 & 0xFFFFFFDF) == 0x45)
  {
    v21 = v20;
    v22 = v19 == 43 || v19 == 45;
    v23 = v22 ? v18 + 1 : v18;
    if (+[IKCSSTokenizer isDigit:](IKCSSTokenizer, "isDigit:", -[IKCSSTokenizer _getChar:](self, "_getChar:", v23)))
    {
      objc_msgSend(v7, "appendFormat:", CFSTR("%C%C"), v17, v19);
      if (v19 == 45 || v19 == 43)
      {
        objc_msgSend(v7, "appendFormat:", CFSTR("%C"), v21);
        v9 += 3;
      }
      else
      {
        v9 += 2;
      }
      v24 = -[IKCSSTokenizer _getChar:](self, "_getChar:", v9 + a3);
      if (+[IKCSSTokenizer isDigit:](IKCSSTokenizer, "isDigit:", v24))
      {
        v16 = CFSTR("number");
        do
        {
          v25 = v9;
          objc_msgSend(v7, "appendFormat:", CFSTR("%C"), (unsigned __int16)v24);
          ++v9;
          v24 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3 + 1 + v25);
        }
        while (+[IKCSSTokenizer isDigit:](IKCSSTokenizer, "isDigit:", v24));
      }
      else
      {
        v16 = CFSTR("number");
      }
    }
  }
  *v29 = v9;
  objc_msgSend(v7, "doubleValue");
  v30[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v26;
  v30[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)_consumeNumeric:(unint64_t)a3 consumed:(unint64_t *)a4
{
  void *v7;
  IKCSSToken *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  IKCSSToken *v17;
  uint64_t v18;
  uint64_t v20;
  unint64_t v21;

  v21 = 0;
  -[IKCSSTokenizer _consumeNumber:consumed:](self, "_consumeNumber:consumed:", a3, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 11);
  v9 = (void *)MEMORY[0x1E0C99E08];
  -[IKCSSToken properties](v8, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectAtIndex:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("repr"));

  objc_msgSend(v7, "objectAtIndex:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("value"));

  objc_msgSend(v7, "objectAtIndex:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("typeFlag"));

  objc_msgSend(v7, "objectAtIndex:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  -[IKCSSToken setDoubleValue:](v8, "setDoubleValue:");

  if (-[IKCSSTokenizer wouldStartIdentifier:](self, "wouldStartIdentifier:", v21 + a3))
  {
    v20 = 0;
    -[IKCSSTokenizer _consumeName:consumed:](self, "_consumeName:consumed:", v21 + a3, &v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 += v20;
    objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("unit"));

  }
  else
  {
    if (-[IKCSSTokenizer _getChar:](self, "_getChar:", v21 + a3) == 37)
    {
      ++v21;
      v17 = v8;
      v18 = 12;
    }
    else
    {
      v17 = v8;
      v18 = 13;
    }
    -[IKCSSToken setType:](v17, "setType:", v18);
  }
  -[IKCSSToken setProperties:](v8, "setProperties:", v11);
  *a4 = v21;

  return v8;
}

- (id)_consumeWhitespace:(unint64_t)a3 consumed:(unint64_t *)a4
{
  IKCSSToken *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;

  v7 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 1);
  v8 = 0;
  do
  {
    v9 = v8;
    v10 = a3 + v8;
    if (-[IKCSSTokenizer isEOF:](self, "isEOF:", a3 + v8))
      break;
    v11 = -[IKCSSTokenizer _getChar:](self, "_getChar:", v10);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend(v12, "characterIsMember:", v11);

    v8 = v9 + 1;
  }
  while ((v11 & 1) != 0);
  *a4 = v9;
  return v7;
}

- (id)_consumeString:(unint64_t)a3 consumed:(unint64_t *)a4 toEndChar:(unsigned __int16)a5
{
  int v5;
  IKCSSToken *v8;
  void *v9;
  unint64_t v10;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v18;

  v5 = a5;
  v8 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 3);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E9F50578);
  if (-[IKCSSTokenizer isEOF:](self, "isEOF:", a3))
  {
    v10 = 0;
  }
  else
  {
    v12 = 0;
    v13 = a3;
    do
    {
      v14 = -[IKCSSTokenizer _getChar:](self, "_getChar:", v13);
      v10 = v12 + 1;
      if ((_DWORD)v14 == v5)
        break;
      v15 = v14;
      if (+[IKCSSTokenizer isNewline:](IKCSSTokenizer, "isNewline:", v14))
      {
        -[IKCSSToken setType:](v8, "setType:", 4);
        v10 = v12;
        goto LABEL_4;
      }
      if ((_DWORD)v15 == 92)
      {
        if (!-[IKCSSTokenizer isEOF:](self, "isEOF:", v10 + a3))
        {
          if (+[IKCSSTokenizer isNewline:](IKCSSTokenizer, "isNewline:", -[IKCSSTokenizer _getChar:](self, "_getChar:", v10 + a3)))
          {
            v10 = v12 + 2;
          }
          else
          {
            v18 = 0;
            v16 = -[IKCSSTokenizer _consumeEscapedCodePoint:consumed:](self, "_consumeEscapedCodePoint:consumed:", v10 + a3, &v18);
            v10 += v18;
            objc_msgSend(v9, "appendFormat:", CFSTR("%C"), v16);
          }
        }
      }
      else
      {
        objc_msgSend(v9, "appendFormat:", CFSTR("%C"), v15);
      }
      v13 = v10 + a3;
      v12 = v10;
    }
    while (!-[IKCSSTokenizer isEOF:](self, "isEOF:", v10 + a3));
  }
  -[IKCSSToken setStringValue:](v8, "setStringValue:", v9);
LABEL_4:
  *a4 = v10;

  return v8;
}

- (id)_consumeComment:(unint64_t)a3 consumed:(unint64_t *)a4
{
  IKCSSToken *v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  int v11;

  v7 = -[IKCSSToken initWithType:]([IKCSSToken alloc], "initWithType:", 32);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E9F50578);
  v9 = 0;
  if (!-[IKCSSTokenizer isEOF:](self, "isEOF:", a3))
  {
    while (1)
    {
      v10 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3 + v9);
      v11 = -[IKCSSTokenizer _getChar:](self, "_getChar:", a3 + v9 + 1);
      if (v10 == 42 && v11 == 47)
        break;
      objc_msgSend(v8, "appendFormat:", CFSTR("%C"), v10);
      if (-[IKCSSTokenizer isEOF:](self, "isEOF:", a3 + v9++ + 1))
        goto LABEL_7;
    }
    v9 += 2;
    objc_msgSend(v8, "appendString:", CFSTR("*/"));
  }
LABEL_7:
  -[IKCSSToken setStringValue:](v7, "setStringValue:", v8);
  *a4 = v9;

  return v7;
}

- (IKCSSToken)currentToken
{
  return self->_currentToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentToken, 0);
  objc_storeStrong((id *)&self->reconsumeToken, 0);
}

@end
