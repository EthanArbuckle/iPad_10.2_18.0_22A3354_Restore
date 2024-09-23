@implementation NSSmartQuoteOptions

- (NSSmartQuoteOptions)initWithLeftSingleQuote:(id)a3 rightSingleQuote:(id)a4 apostrophe:(id)a5 leftDoubleQuote:(id)a6 rightDoubleQuote:(id)a7
{
  NSSmartQuoteOptions *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)NSSmartQuoteOptions;
  v12 = -[NSSmartQuoteOptions init](&v14, sel_init);
  if (v12)
  {
    v12->_leftSingleQuote = (NSString *)objc_msgSend(a3, "copy");
    v12->_rightSingleQuote = (NSString *)objc_msgSend(a4, "copy");
    v12->_apostrophe = (NSString *)objc_msgSend(a5, "copy");
    v12->_leftDoubleQuote = (NSString *)objc_msgSend(a6, "copy");
    v12->_rightDoubleQuote = (NSString *)objc_msgSend(a7, "copy");
  }
  return v12;
}

+ (id)smartQuoteOptionsForLocale:(id)a3
{
  return -[NSSmartQuoteOptions initWithLeftSingleQuote:rightSingleQuote:apostrophe:leftDoubleQuote:rightDoubleQuote:]([NSSmartQuoteOptions alloc], "initWithLeftSingleQuote:rightSingleQuote:apostrophe:leftDoubleQuote:rightDoubleQuote:", CFSTR("‘"), CFSTR("’"), CFSTR("’"), CFSTR("“"), CFSTR("”"));
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSSmartQuoteOptions;
  -[NSSmartQuoteOptions dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[NSString isEqualToString:](self->_leftSingleQuote, "isEqualToString:", objc_msgSend(a3, "leftSingleQuote"));
      if (v5)
      {
        v5 = -[NSString isEqualToString:](self->_rightSingleQuote, "isEqualToString:", objc_msgSend(a3, "rightSingleQuote"));
        if (v5)
        {
          v5 = -[NSString isEqualToString:](self->_apostrophe, "isEqualToString:", objc_msgSend(a3, "apostrophe"));
          if (v5)
          {
            v5 = -[NSString isEqualToString:](self->_leftDoubleQuote, "isEqualToString:", objc_msgSend(a3, "leftDoubleQuote"));
            if (v5)
              LOBYTE(v5) = -[NSString isEqualToString:](self->_rightDoubleQuote, "isEqualToString:", objc_msgSend(a3, "rightDoubleQuote"));
          }
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_leftSingleQuote, "hash");
  v4 = -[NSString hash](self->_rightSingleQuote, "hash") ^ v3;
  v5 = -[NSString hash](self->_apostrophe, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_leftDoubleQuote, "hash");
  return v6 ^ -[NSString hash](self->_rightDoubleQuote, "hash");
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSSmartQuoteOptions;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@{%@xy%@/x%@y/%@xy%@}"), -[NSSmartQuoteOptions description](&v3, sel_description), -[NSSmartQuoteOptions leftSingleQuote](self, "leftSingleQuote"), -[NSSmartQuoteOptions rightSingleQuote](self, "rightSingleQuote"), -[NSSmartQuoteOptions apostrophe](self, "apostrophe"), -[NSSmartQuoteOptions leftDoubleQuote](self, "leftDoubleQuote"), -[NSSmartQuoteOptions rightDoubleQuote](self, "rightDoubleQuote"));
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ requires keyed coding"), objc_opt_class()), 0);
    objc_exception_throw(v5);
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSmartQuoteOptions leftSingleQuote](self, "leftSingleQuote"), CFSTR("NSLeftSingleQuote"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSmartQuoteOptions rightSingleQuote](self, "rightSingleQuote"), CFSTR("NSRightSingleQuote"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSmartQuoteOptions apostrophe](self, "apostrophe"), CFSTR("NSApostrophe"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSmartQuoteOptions leftDoubleQuote](self, "leftDoubleQuote"), CFSTR("NSLeftDoubleQuote"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSmartQuoteOptions rightDoubleQuote](self, "rightDoubleQuote"), CFSTR("NSRightDoubleQuote"));
}

- (NSSmartQuoteOptions)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v11;
  void *v12;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ requires keyed coding"), objc_opt_class()), 0);
    objc_exception_throw(v12);
  }
  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSLeftSingleQuote"));
  if ((_NSIsNSString() & 1) != 0)
  {
    v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSRightSingleQuote"));
    if ((_NSIsNSString() & 1) != 0)
    {
      v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSApostrophe"));
      if ((_NSIsNSString() & 1) != 0)
      {
        v8 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSLeftDoubleQuote"));
        if ((_NSIsNSString() & 1) != 0)
        {
          v9 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSRightDoubleQuote"));
          if ((_NSIsNSString() & 1) != 0)
            return -[NSSmartQuoteOptions initWithLeftSingleQuote:rightSingleQuote:apostrophe:leftDoubleQuote:rightDoubleQuote:](self, "initWithLeftSingleQuote:rightSingleQuote:apostrophe:leftDoubleQuote:rightDoubleQuote:", v5, v6, v7, v8, v9);

          v11 = CFSTR("Smart quote right double quote is not a string");
        }
        else
        {

          v11 = CFSTR("Smart quote left double quote is not a string");
        }
      }
      else
      {

        v11 = CFSTR("Smart quote apostrophe is not a string");
      }
    }
    else
    {

      v11 = CFSTR("Smart quote right single quote is not a string");
    }
  }
  else
  {

    v11 = CFSTR("Smart quote left single quote is not a string");
  }
  objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", v11));
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)leftSingleQuote
{
  return self->_leftSingleQuote;
}

- (NSString)rightSingleQuote
{
  return self->_rightSingleQuote;
}

- (NSString)apostrophe
{
  return self->_apostrophe;
}

- (NSString)leftDoubleQuote
{
  return self->_leftDoubleQuote;
}

- (NSString)rightDoubleQuote
{
  return self->_rightDoubleQuote;
}

@end
