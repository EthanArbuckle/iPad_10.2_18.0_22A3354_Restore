@implementation NSUnit

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSUnit;
  -[NSUnit dealloc](&v3, sel_dealloc);
}

- (NSUnit)initWithSymbol:(NSString *)symbol
{
  NSUnit *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSUnit;
  v4 = -[NSUnit init](&v6, sel_init);
  if (v4)
    v4->_symbol = (NSString *)-[NSString copy](symbol, "copy");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *v5;

  if (a3 == self)
    return 1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (objc_class *)objc_msgSend(a3, "_effectiveUnitClass");
    if (v5 == -[NSUnit _effectiveUnitClass](self, "_effectiveUnitClass"))
      return objc_msgSend((id)objc_msgSend(a3, "symbol"), "isEqual:", -[NSUnit symbol](self, "symbol"));
  }
  return 0;
}

- (NSString)symbol
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSUnit;
  return (id)objc_msgSend(-[NSUnit description](&v3, sel_description), "stringByAppendingString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@"), self->_symbol));
}

- (NSUnit)init
{

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-init should never be called on NSUnit!"), 0));
}

+ (NSUnit)new
{

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("+new should never be called on NSUnit!"), 0));
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[objc_class hash](-[NSUnit _effectiveUnitClass](self, "_effectiveUnitClass"), "hash");
  return -[NSString hash](-[NSUnit symbol](self, "symbol"), "hash") ^ v3;
}

- (NSUnit)initWithCoder:(id)a3
{
  uint64_t v5;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSUnit cannot be decoded by non-keyed archivers"), 0));
  }
  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.symbol"));
  if (v5)
    return -[NSUnit initWithSymbol:](self, "initWithSymbol:", v5);

  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4865, 0));
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  if (!objc_msgSend(a3, "allowsKeyedCoding"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSUnit encoder does not allow non-keyed coding!"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", self->_symbol, CFSTR("NS.symbol"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
