@implementation HAPBTLETransactionIdentifier

- (HAPBTLETransactionIdentifier)initWithUnsignedCharValue:(unsigned __int8)a3
{
  HAPBTLETransactionIdentifier *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HAPBTLETransactionIdentifier;
  result = -[HAPBTLETransactionIdentifier init](&v5, sel_init);
  if (result)
    result->_unsignedCharValue = a3;
  return result;
}

- (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HAPBTLETransactionIdentifier shortDescription](self, "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E894EFE8;
  }
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Identifier = %u>"), v6, v7, -[HAPBTLETransactionIdentifier unsignedCharValue](self, "unsignedCharValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)

  return v8;
}

- (id)debugDescription
{
  return -[HAPBTLETransactionIdentifier descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HAPBTLETransactionIdentifier descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (unint64_t)hash
{
  return -[HAPBTLETransactionIdentifier unsignedCharValue](self, "unsignedCharValue");
}

- (BOOL)isEqual:(id)a3
{
  HAPBTLETransactionIdentifier *v4;
  int v5;
  BOOL v6;

  v4 = (HAPBTLETransactionIdentifier *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[HAPBTLETransactionIdentifier unsignedCharValue](self, "unsignedCharValue");
      v6 = v5 == -[HAPBTLETransactionIdentifier unsignedCharValue](v4, "unsignedCharValue");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unsigned)unsignedCharValue
{
  return self->_unsignedCharValue;
}

+ (unsigned)generateRequestIdentifier
{
  void *v2;
  unsigned __int8 v3;
  unsigned __int8 v5;

  v5 = 0;
  HMFRandomDataWithLength();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getBytes:length:", &v5, 1);
  v3 = v5;

  return v3;
}

+ (id)randomTransactionIdentifier
{
  void *v2;
  HAPBTLETransactionIdentifier *v3;
  HAPBTLETransactionIdentifier *v4;
  unsigned __int8 v6;

  v6 = 0;
  HMFRandomDataWithLength();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getBytes:length:", &v6, 1);
  v3 = [HAPBTLETransactionIdentifier alloc];
  v4 = -[HAPBTLETransactionIdentifier initWithUnsignedCharValue:](v3, "initWithUnsignedCharValue:", v6);

  return v4;
}

@end
