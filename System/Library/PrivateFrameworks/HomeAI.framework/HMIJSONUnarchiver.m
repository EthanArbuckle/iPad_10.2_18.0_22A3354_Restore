@implementation HMIJSONUnarchiver

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (HMIJSONUnarchiver)initWithJSONObject:(id)a3
{
  id v5;
  HMIJSONUnarchiver *v6;
  HMIJSONUnarchiver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMIJSONUnarchiver;
  v6 = -[HMIJSONUnarchiver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_container, a3);

  return v7;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(self->_container, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (int)decodeInt32ForKey:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(self->_container, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(self->_container, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (double)decodeDoubleForKey:(id)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(self->_container, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (id)_objectWithJSONObject:(id)a3 allowedClasses:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSString *v13;
  void *v14;
  objc_class *v15;
  HMIJSONUnarchiver *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v6)
      goto LABEL_11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v6;
      if (!objc_msgSend(v9, "hasPrefix:", CFSTR("data:;base64,"))
        || (objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v10),
            v11 = (id)objc_claimAutoreleasedReturnValue(),
            v10,
            !v11))
      {
        if (!objc_msgSend(v9, "hasSuffix:", CFSTR("Z"))
          || (v12 = objc_alloc_init(MEMORY[0x24BDD15D0]),
              objc_msgSend(v12, "dateFromString:", v9),
              v11 = (id)objc_claimAutoreleasedReturnValue(),
              v12,
              !v11))
        {
          v11 = v9;
        }
      }
LABEL_21:

      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
LABEL_11:
      v11 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v19 = (void *)MEMORY[0x24BDBCE88];
          v20 = *MEMORY[0x24BDBCAB0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid JSONObject: %@"), objc_opt_class());
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v21, 0);
          v22 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v22);
        }
        v9 = v6;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("$"));
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[HMIJSONUnarchiver classMap](self, "classMap");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (objc_class *)objc_msgSend(v14, "objectForKeyedSubscript:", v13);

          if (!v15)
          {
            v15 = NSClassFromString(v13);
            if (!v15)
            {
              v23 = (void *)MEMORY[0x24BDBCE88];
              v24 = *MEMORY[0x24BDBCAB0];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid JSONObject class name: %@"), v13);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, v25, 0);
              v26 = (id)objc_claimAutoreleasedReturnValue();

              objc_exception_throw(v26);
            }
          }
          v16 = -[HMIJSONUnarchiver initWithJSONObject:]([HMIJSONUnarchiver alloc], "initWithJSONObject:", v9);
          -[HMIJSONUnarchiver classMap](self, "classMap");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMIJSONUnarchiver setClassMap:](v16, "setClassMap:", v17);

          v11 = (id)objc_msgSend([v15 alloc], "initWithCoder:", v16);
        }
        else
        {
          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = __58__HMIJSONUnarchiver__objectWithJSONObject_allowedClasses___block_invoke_2;
          v27[3] = &unk_24DBEC418;
          v27[4] = self;
          v28 = v7;
          objc_msgSend(v9, "na_dictionaryByMappingValues:", v27);
          v11 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_21;
      }
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __58__HMIJSONUnarchiver__objectWithJSONObject_allowedClasses___block_invoke;
      v29[3] = &unk_24DBEC3F0;
      v29[4] = self;
      v30 = v7;
      objc_msgSend(v6, "na_map:", v29);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = 0;
  }
LABEL_22:

  return v11;
}

uint64_t __58__HMIJSONUnarchiver__objectWithJSONObject_allowedClasses___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_objectWithJSONObject:allowedClasses:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __58__HMIJSONUnarchiver__objectWithJSONObject_allowedClasses___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_objectWithJSONObject:allowedClasses:", a3, *(_QWORD *)(a1 + 40));
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(self->_container, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIJSONUnarchiver _objectWithJSONObject:allowedClasses:](self, "_objectWithJSONObject:allowedClasses:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  id container;
  id v7;
  void *v8;
  void *v9;

  container = self->_container;
  v7 = a3;
  objc_msgSend(container, "objectForKeyedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIJSONUnarchiver _objectWithJSONObject:allowedClasses:](self, "_objectWithJSONObject:allowedClasses:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)objectWithJSONObject:(id)a3 classMap:(id)a4
{
  id v5;
  id v6;
  HMIJSONUnarchiver *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HMIJSONUnarchiver);
  -[HMIJSONUnarchiver setClassMap:](v7, "setClassMap:", v5);

  -[HMIJSONUnarchiver _objectWithJSONObject:allowedClasses:](v7, "_objectWithJSONObject:allowedClasses:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)objectWithJSONObjectString:(id)a3 classMap:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectWithJSONData:classMap:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)objectWithJSONData:(id)a3 classMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 4, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  if (!v8)
  {
    v12 = (void *)MEMORY[0x24BDBCE88];
    v13 = *MEMORY[0x24BDBCAB0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot parse JSON data: %@"), v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  objc_msgSend(a1, "objectWithJSONObject:classMap:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSDictionary)classMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClassMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)container
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_container, 0);
  objc_storeStrong((id *)&self->_classMap, 0);
}

@end
