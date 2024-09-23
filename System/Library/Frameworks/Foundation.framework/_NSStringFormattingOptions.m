@implementation _NSStringFormattingOptions

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSStringFormattingOptions;
  -[_NSStringFormattingOptions dealloc](&v3, sel_dealloc);
}

- (void)setPluralizationNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (_NSStringFormattingOptions)init
{
  _NSStringFormattingOptions *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSStringFormattingOptions;
  result = -[_NSStringFormattingOptions init](&v3, sel_init);
  if (result)
    result->_pluralizationNumber = 0;
  return result;
}

- (NSNumber)pluralizationNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _NSStringFormattingOptions *v4;

  v4 = objc_alloc_init(_NSStringFormattingOptions);
  -[_NSStringFormattingOptions setPluralizationNumber:](v4, "setPluralizationNumber:", -[_NSStringFormattingOptions pluralizationNumber](self, "pluralizationNumber"));
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  return -[NSNumber hash](-[_NSStringFormattingOptions pluralizationNumber](self, "pluralizationNumber"), "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  NSNumber *v5;
  uint64_t v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[_NSStringFormattingOptions pluralizationNumber](self, "pluralizationNumber");
    if (v5 == (NSNumber *)objc_msgSend(a3, "pluralizationNumber"))
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      v6 = objc_msgSend(a3, "pluralizationNumber");
      if (v6)
        LOBYTE(v6) = -[NSNumber isEqualToNumber:](-[_NSStringFormattingOptions pluralizationNumber](self, "pluralizationNumber"), "isEqualToNumber:", objc_msgSend(a3, "pluralizationNumber"));
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

@end
