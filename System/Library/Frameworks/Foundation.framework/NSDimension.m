@implementation NSDimension

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSDimension;
  -[NSUnit dealloc](&v3, sel_dealloc);
}

- (NSDimension)initWithDimension:(id)a3
{
  NSDimension *v4;

  v4 = -[NSDimension initWithSpecifier:symbol:converter:](self, "initWithSpecifier:symbol:converter:", objc_msgSend(a3, "specifier"), objc_msgSend(a3, "symbol"), objc_msgSend(a3, "converter"));
  if (v4)
    v4->_icuSubtype = (NSString *)objc_msgSend((id)objc_msgSend(a3, "icuSubtype"), "copy");
  return v4;
}

- (NSDimension)initWithSpecifier:(unint64_t)a3 symbol:(id)a4 converter:(id)a5
{
  NSDimension *v7;
  NSDimension *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSDimension;
  v7 = -[NSUnit initWithSymbol:](&v10, sel_initWithSymbol_, a4);
  v8 = v7;
  if (v7)
  {
    v7->_reserved = a3;
    v7->_converter = (NSUnitConverter *)objc_msgSend(a5, "copy");
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSDimension;
  v5 = -[NSUnit isEqual:](&v7, sel_isEqual_);
  if (v5)
    LOBYTE(v5) = objc_msgSend((id)objc_msgSend(a3, "converter"), "isEqual:", -[NSDimension converter](self, "converter"));
  return v5;
}

- (NSUnitConverter)converter
{
  return self->_converter;
}

- (unint64_t)specifier
{
  return self->_reserved;
}

- (NSString)icuSubtype
{
  return self->_icuSubtype;
}

- (NSDimension)initWithSymbol:(NSString *)symbol converter:(NSUnitConverter *)converter
{
  return -[NSDimension initWithSpecifier:symbol:converter:](self, "initWithSpecifier:symbol:converter:", -1, symbol, converter);
}

+ (BOOL)supportsRegionalPreference
{
  return 0;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  return a3;
}

+ (NSDimension)baseUnit
{
  const char *Name;
  objc_class *v3;
  void *v4;

  Name = sel_getName(a2);
  v3 = (objc_class *)objc_opt_class();
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** You must override %s in your class %s to define its base unit."), Name, _NSNameOfClass(v3)), 0);
  objc_exception_throw(v4);
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSDimension;
  v3 = -[NSUnit hash](&v5, sel_hash);
  return -[NSUnitConverter hash](-[NSDimension converter](self, "converter"), "hash") ^ v3;
}

- (NSDimension)initWithCoder:(id)a3
{
  NSDimension *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSDimension cannot be decoded by non-keyed archivers"), 0));
  }
  v9.receiver = self;
  v9.super_class = (Class)NSDimension;
  v5 = -[NSUnit initWithCoder:](&v9, sel_initWithCoder_, a3);
  if (v5)
  {
    v6 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.specifier"));
    v7 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.converter"));
    if (v7)
    {
      v5->_reserved = v6;
      v5->_converter = (NSUnitConverter *)objc_msgSend(v7, "copy");
    }
    else
    {

      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4865, 0));
      return 0;
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSDimension;
  -[NSUnit encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (!objc_msgSend(a3, "allowsKeyedCoding"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSDimension encoder does not allow non-keyed coding!"), 0));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_reserved, CFSTR("NS.specifier"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_converter, CFSTR("NS.converter"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSString)icuType
{
  return 0;
}

@end
