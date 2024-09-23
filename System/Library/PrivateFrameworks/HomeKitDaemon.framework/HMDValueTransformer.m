@implementation HMDValueTransformer

- (HMDValueTransformer)init
{
  uint64_t v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;

  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
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
  v12.receiver = self;
  v12.super_class = (Class)HMDValueTransformer;
  return -[HMDValueTransformer init](&v12, sel_init);
}

- (id)description
{
  return (id)objc_msgSend((id)objc_opt_class(), "description");
}

- (BOOL)isKindOfTransformer:(Class)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)transformedValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v14 = 0;
    -[HMDValueTransformer transformedValue:error:](self, "transformedValue:error:", v4, &v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14;
    if (!v5)
    {
      if (v6)
      {
        v15 = *MEMORY[0x24BDD1398];
        v16[0] = v6;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      v9 = (void *)MEMORY[0x24BDD17C8];
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ transformedValue failed"), v11);
      v12 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v12, v8);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v13);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)reverseTransformedValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v14 = 0;
    -[HMDValueTransformer reverseTransformedValue:error:](self, "reverseTransformedValue:error:", v4, &v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14;
    if (!v5)
    {
      if (v6)
      {
        v15 = *MEMORY[0x24BDD1398];
        v16[0] = v6;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      v9 = (void *)MEMORY[0x24BDD17C8];
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ reverseTransformedValue failed"), v11);
      v12 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v12, v8);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v13);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)transformedValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  if (checkValueOfClass((uint64_t)v5, objc_msgSend(v6, "valueClass"), a4))
  {
    objc_msgSend(v6, "transformedValue:error:", v5, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  if (checkValueOfClass((uint64_t)v5, objc_msgSend(v6, "transformedValueClass"), a4))
  {
    objc_msgSend(v6, "reverseTransformedValue:error:", v5, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)sharedTransformer
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1970];
  NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueTransformerForName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)valueTransformerForName:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1970], "valueTransformerForName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
    }
    else
    {
      if (valueTransformerForName__once != -1)
        dispatch_once(&valueTransformerForName__once, &__block_literal_global_247344);
      objc_msgSend((id)valueTransformerForName__adaptersByName, "objectForKey:", v3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD0E90]) & 1) == 0)
        {
          objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD1388]);
        }
        v5 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTransformer:", v4);
        v7 = (void *)valueTransformerForName__adaptersByName;
        v8 = (void *)objc_msgSend(v3, "copy");
        objc_msgSend(v7, "setObject:forKey:", v5, v8);

      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
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

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (id)transformedValue:(id)a3 error:(id *)a4
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

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
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

void __47__HMDValueTransformer_valueTransformerForName___block_invoke()
{
  id v0;
  void *v1;
  objc_class *v2;
  void *v3;
  id v4;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)valueTransformerForName__adaptersByName;
  valueTransformerForName__adaptersByName = (uint64_t)v0;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(".adaptersByName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)valueTransformerForName__adaptersByName, "setName:", v3);

}

+ (id)encodeValue:(id)a3 withTransformerNamed:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  if (a4)
    v7 = a4;
  else
    v7 = (id)*MEMORY[0x24BDD0E90];
  v8 = a3;
  +[HMDValueTransformer requiredTransformerForName:]((uint64_t)a1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transformedValue:error:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)decodeValue:(id)a3 withTransformerNamed:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  if (a4)
    v7 = a4;
  else
    v7 = (id)*MEMORY[0x24BDD0E90];
  v8 = a3;
  +[HMDValueTransformer requiredTransformerForName:]((uint64_t)a1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reverseTransformedValue:error:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (HMDHAPAccessoryTaskContext)requiredTransformerForName:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  HMDHAPAccessoryTaskContext *v6;
  SEL v7;
  id v8;
  int64_t v9;
  id v10;
  unint64_t v11;
  id v12;
  id v13;

  v2 = a2;
  objc_msgSend((id)objc_opt_self(), "valueTransformerForName:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;

    return (HMDHAPAccessoryTaskContext *)v4;
  }
  else
  {
    v6 = (HMDHAPAccessoryTaskContext *)_HMFPreconditionFailureWithFormat();
    return -[HMDHAPAccessoryTaskContext initWithIdentifier:operationType:home:sourceType:requestMessage:name:](v6, v7, v8, v9, v10, v11, v12, v13);
  }
}

@end
