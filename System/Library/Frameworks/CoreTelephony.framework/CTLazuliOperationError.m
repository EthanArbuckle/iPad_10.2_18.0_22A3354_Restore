@implementation CTLazuliOperationError

- (id)description
{
  void *v3;
  int64_t v4;
  int64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTLazuliOperationError value](self, "value");
  v6 = -[CTLazuliOperationError value](self, "value");
  objc_msgSend(v3, "appendFormat:", CFSTR(", value = [%ld - %s]"), v4, print_CTLazuliErrorType(&v6));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliOperationError:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = -[CTLazuliOperationError value](self, "value");
  LOBYTE(v5) = v5 == objc_msgSend(v4, "value");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliOperationError *v4;
  CTLazuliOperationError *v5;
  BOOL v6;

  v4 = (CTLazuliOperationError *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliOperationError isEqualToCTLazuliOperationError:](self, "isEqualToCTLazuliOperationError:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliOperationError *v4;

  v4 = +[CTLazuliOperationError allocWithZone:](CTLazuliOperationError, "allocWithZone:", a3);
  -[CTLazuliOperationError setValue:](v4, "setValue:", self->_value);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_value);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kValueKey"));

}

- (CTLazuliOperationError)initWithCoder:(id)a3
{
  id v4;
  CTLazuliOperationError *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliOperationError;
  v5 = -[CTLazuliOperationError init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kValueKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_value = objc_msgSend(v6, "longValue");

  }
  return v5;
}

- (CTLazuliOperationError)initWithReflection:(const OperationError *)a3
{
  CTLazuliOperationError *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTLazuliOperationError;
  v4 = -[CTLazuliOperationError init](&v6, sel_init);
  if (v4)
    v4->_value = encode_CTLazuliErrorType((unsigned int *)a3);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

@end
