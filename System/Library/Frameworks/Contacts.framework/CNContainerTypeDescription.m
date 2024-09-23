@implementation CNContainerTypeDescription

- (BOOL)isConvertibleABValue:(void *)a3
{
  int Value;
  BOOL v4;
  BOOL v5;
  unsigned int valuePtr;

  valuePtr = 0;
  Value = CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, &valuePtr);
  if (Value)
  {
    v4 = valuePtr > 7 || ((1 << valuePtr) & 0x93) == 0;
    LOBYTE(Value) = !v4 || (valuePtr - 16777217 <= 3 ? (v5 = valuePtr == 16777218) : (v5 = 1), !v5);
  }
  return Value;
}

- (int)abPropertyID
{
  return *MEMORY[0x1E0CF6338];
}

- (id)CNValueFromABValue:(void *)a3
{
  void *v4;
  void *v5;

  +[CNiOSABConstantsMapping ABToCNContainerTypeConstantsMapping](CNiOSABConstantsMapping, "ABToCNContainerTypeConstantsMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mappedConstant:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setType:", objc_msgSend(a3, "integerValue"));

}

- (id)key
{
  return CFSTR("type");
}

- (BOOL)isWritable
{
  return 1;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  unint64_t v5;
  unint64_t v6;

  v5 = objc_msgSend(a3, "integerValue");
  v6 = v5;
  if (v5 >= 4 && v5 - 1002 >= 2 && *a4)
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 301, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 < 4 || (v6 & 0xFFFFFFFFFFFFFFFELL) == 1002;
}

- (id)CNValueForContainer:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "type"));
}

- (void)ABValueFromCNValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[CNiOSABConstantsMapping CNToABSourceTypeConstantsMapping](CNiOSABConstantsMapping, "CNToABSourceTypeConstantsMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mappedConstant:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5
{
  objc_super v6;

  if (!a3)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)CNContainerTypeDescription;
  return -[CNContainerPropertyDescription setABValue:onABSource:error:](&v6, sel_setABValue_onABSource_error_, a3, a4, a5);
}

@end
