@implementation CNContainerPropertyDescription

- (BOOL)isConvertibleABValue:(void *)a3
{
  return 1;
}

- (void)ABValueForABSource:(void *)a3
{
  void *result;

  result = (void *)ABRecordCopyValue(a3, -[CNContainerPropertyDescription abPropertyID](self, "abPropertyID"));
  if (result)
    return (void *)CFAutorelease(result);
  return result;
}

- (id)CNValueFromABValue:(void *)a3
{
  return a3;
}

- (NSString)key
{
  CNContainerPropertyDescription *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (BOOL)isWritable
{
  return 0;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (v6 || (-[CNContainerPropertyDescription valueClass](self, "valueClass"), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (a4)
    {
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 301, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)CNValueForContainer:(id)a3
{
  id v4;
  CNContainerPropertyDescription *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  id v6;
  id v7;
  CNContainerPropertyDescription *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CNAbstractMethodException();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (id)nilValue
{
  -[CNContainerPropertyDescription valueClass](self, "valueClass");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return &stru_1E29FF900;
  else
    return 0;
}

- (BOOL)isValue:(id)a3 equalToEmptyEquivalentOrValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    -[CNContainerPropertyDescription nilValue](self, "nilValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_3;
LABEL_5:
    -[CNContainerPropertyDescription nilValue](self, "nilValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v9 = objc_msgSend(MEMORY[0x1E0D13A40], "isObject:equalToOther:", v6, v8);

  return v9;
}

- (int)abPropertyID
{
  CNContainerPropertyDescription *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)ABValueFromCNValue:(id)a3
{
  return a3;
}

- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5
{
  return ABRecordSetValue(a4, -[CNContainerPropertyDescription abPropertyID](self, "abPropertyID"), a3, a5);
}

@end
