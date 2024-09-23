@implementation HMDOPACKTransformer

- (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  v7 = objc_msgSend(v6, "valueClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "OPACKFromValue:error:", v5, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected %@"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmfErrorWithCode:reason:", 3, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v5;
  CFTypeID v6;
  char isKindOfClass;
  void *v8;

  v5 = a3;
  if (!v5)
    goto LABEL_13;
  if (HMDIsOPACKValue_once != -1)
    dispatch_once(&HMDIsOPACKValue_once, &__block_literal_global_142091);
  v6 = CFGetTypeID(v5);
  if (v6 == HMDIsOPACKValue_arrayTypeID
    || v6 == HMDIsOPACKValue_dictionaryTypeID
    || v6 == HMDIsOPACKValue_nullTypeID
    || v6 == HMDIsOPACKValue_BOOLeanTypeID
    || v6 == HMDIsOPACKValue_stringTypeID
    || v6 == HMDIsOPACKValue_numberTypeID
    || v6 == HMDIsOPACKValue_dataTypeID
    || v6 == HMDIsOPACKValue_dateTypeID)
  {

    goto LABEL_16;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
LABEL_16:
    objc_msgSend((id)objc_opt_class(), "valueFromOPACK:error:", v5, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
LABEL_13:
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 3, CFSTR("Expected OPACK-compatible value"));
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_18:

  return v8;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return +[HMDOPACKTransformer allocWithZone:](HMDDefaultOPACKTransformer, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HMDOPACKTransformer;
  return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

+ (Class)valueClass
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (BOOL)isStructuredDataCompatible
{
  return 1;
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  int v12;

  objc_msgSend(a1, "OPACKFromValue:error:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v12 = -6700;
    v7 = (void *)MEMORY[0x2276758C4](v5, 8, &v12);
    v8 = v7;
    if (!v7 || v12)
    {
      if (a4)
      {
        if (!v12)
        {
          v9 = 0;
          *a4 = 0;
          goto LABEL_11;
        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100]);
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a4 = v10;

      }
      v9 = 0;
    }
    else
    {
      v9 = v7;
    }
LABEL_11:

    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;

  v5 = (void *)OPACKDecodeData();
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6705, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v6;

    a4 = 0;
  }

  return a4;
}

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = *MEMORY[0x24BDBCAB0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = *MEMORY[0x24BDBCAB0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

@end
