@implementation _HKCategorySampleComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("value"));
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  objc_super v11;

  v8 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS____HKCategorySampleComparisonFilter;
  if (!objc_msgSendSuper2(&v11, sel_areValidTypes_forKeyPath_error_, v8, a4, a5))
    goto LABEL_5;
  if (objc_msgSend(v8, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("expected 1 category type but got %ld %@"), objc_msgSend(v8, "count"), v8);
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v9 = 1;
LABEL_6:

  return v9;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "value");
    -[_HKComparisonFilter value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = HKCompareIntegers(v5, objc_msgSend(v6, "integerValue"));

    v8 = HKComparisonResultMatchesPredicateOperator(v7, -[_HKComparisonFilter operatorType](self, "operatorType"));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
