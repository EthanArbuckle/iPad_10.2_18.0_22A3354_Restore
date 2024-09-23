@implementation LNValueType

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LNValueType;
  return -[LNValueType init](&v3, sel_init);
}

- (BOOL)objectIsMemberOfType:(id)a3
{
  id v4;

  v4 = a3;
  -[LNValueType objectClass](self, "objectClass");
  LOBYTE(self) = objc_opt_isKindOfClass();

  return self & 1;
}

- (BOOL)valueIsKindOfType:(id)a3
{
  void *v4;

  objc_msgSend(a3, "valueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[LNValueType isEqual:](self, "isEqual:", v4);

  return (char)self;
}

- (Class)objectClass
{
  Class result;

  result = (Class)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[LNValueType objectClass] must be overridden"));
  __break(1u);
  return result;
}

- (void)enumerateValuesOfValueType:(id)a3 value:(id)a4 block:(id)a5
{
  id v8;
  void (**v9)(id, id);
  void *v10;
  char v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, id))a5;
  objc_msgSend(v8, "valueType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqual:", self))
  {
    v11 = objc_msgSend(v12, "isEqual:", self);

    if ((v11 & 1) != 0)
      v9[2](v9, v8);
  }
  else
  {

  }
}

+ (NSArray)objectClassesForCoding
{
  NSArray *result;

  result = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[LNValueType objectClassesForCoding] must be overridden"));
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
