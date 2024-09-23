@implementation HMIJSONArchiver

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (HMIJSONArchiver)init
{
  HMIJSONArchiver *v2;
  uint64_t v3;
  id container;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMIJSONArchiver;
  v2 = -[HMIJSONArchiver init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    container = v2->_container;
    v2->_container = (id)v3;

    v2->_options = 0;
  }
  return v2;
}

- (HMIJSONArchiver)initWithArray
{
  HMIJSONArchiver *v2;
  uint64_t v3;
  id container;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMIJSONArchiver;
  v2 = -[HMIJSONArchiver init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    container = v2->_container;
    v2->_container = (id)v3;

    v2->_options = 0;
  }
  return v2;
}

- (HMIJSONArchiver)initWithDictionary
{
  HMIJSONArchiver *v2;
  uint64_t v3;
  id container;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMIJSONArchiver;
  v2 = -[HMIJSONArchiver init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    container = v2->_container;
    v2->_container = (id)v3;

    v2->_options = 0;
  }
  return v2;
}

- (BOOL)_containerIsArray
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (void)_addClassToContainer:(Class)a3
{
  id v4;

  NSStringFromClass(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMIJSONArchiver _addValueToContainer:forKey:](self, "_addValueToContainer:forKey:", v4, CFSTR("$"));

}

- (void)_addValueToContainer:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[HMIJSONArchiver _containerIsArray](self, "_containerIsArray"))
  {
    objc_msgSend(self->_container, "addObject:", v7);
  }
  else if (v7)
  {
    objc_msgSend(self->_container, "setValue:forKey:", v7, v6);
  }

}

- (id)_JSONObjectWithObject:(id)a3 options:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  HMIJSONArchiver *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[6];

  v6 = a3;
  if (!v6)
    goto LABEL_12;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
    goto LABEL_15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = v6;
LABEL_16:
    v11 = v8;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HMIJSONArchiver _valueForNumber:](self, "_valueForNumber:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
LABEL_12:
      v11 = 0;
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __49__HMIJSONArchiver__JSONObjectWithObject_options___block_invoke;
        v14[3] = &unk_24DBEC3A0;
        v14[4] = self;
        v14[5] = a4;
        objc_msgSend(v6, "na_map:", v14);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __49__HMIJSONArchiver__JSONObjectWithObject_options___block_invoke_2;
        v13[3] = &unk_24DBEC3C8;
        v13[4] = self;
        v13[5] = a4;
        objc_msgSend(v6, "na_dictionaryByMappingValues:", v13);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      v9 = -[HMIJSONArchiver initWithDictionary]([HMIJSONArchiver alloc], "initWithDictionary");
      -[HMIJSONArchiver setOptions:](v9, "setOptions:", a4);
      -[HMIJSONArchiver _addClassToContainer:](v9, "_addClassToContainer:", objc_opt_class());
      objc_msgSend(v6, "encodeWithCoder:", v9);
      -[HMIJSONArchiver object](v9, "object");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if ((a4 & 1) != 0)
    {
      objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
      v9 = (HMIJSONArchiver *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("data:;base64,%@"), v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_15:
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v9 = (HMIJSONArchiver *)objc_alloc_init(MEMORY[0x24BDD15D0]);
  -[HMIJSONArchiver stringFromDate:](v9, "stringFromDate:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v11 = (void *)v10;

LABEL_17:
  return v11;
}

uint64_t __49__HMIJSONArchiver__JSONObjectWithObject_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_JSONObjectWithObject:options:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __49__HMIJSONArchiver__JSONObjectWithObject_options___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_JSONObjectWithObject:options:", a3, *(_QWORD *)(a1 + 40));
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HMIJSONArchiver _addValueToContainer:forKey:](self, "_addValueToContainer:forKey:", v8, v7);

}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HMIJSONArchiver _addValueToContainer:forKey:](self, "_addValueToContainer:forKey:", v8, v7);

}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HMIJSONArchiver _valueForNumber:](self, "_valueForNumber:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIJSONArchiver _addValueToContainer:forKey:](self, "_addValueToContainer:forKey:", v8, v7);

}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HMIJSONArchiver _addValueToContainer:forKey:](self, "_addValueToContainer:forKey:", v8, v7);

}

- (id)_valueForNumber:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1518];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "floatValue");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%.6f"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decimalNumberWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  int64_t options;
  id v7;
  id v8;

  options = self->_options;
  v7 = a4;
  -[HMIJSONArchiver _JSONObjectWithObject:options:](self, "_JSONObjectWithObject:options:", a3, options);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HMIJSONArchiver _addValueToContainer:forKey:](self, "_addValueToContainer:forKey:", v8, v7);

}

- (NSString)objectJSON
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = (void *)MEMORY[0x24BDD1608];
  -[HMIJSONArchiver object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithJSONObject:options:error:", v5, 10, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithData:encoding:", v6, 4);

  return (NSString *)v7;
}

- (NSString)objectPrettyJSON
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = (void *)MEMORY[0x24BDD1608];
  -[HMIJSONArchiver object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithJSONObject:options:error:", v5, 11, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithData:encoding:", v6, 4);

  return (NSString *)v7;
}

- (id)object
{
  return self->_container;
}

+ (id)JSONObjectWithObject:(id)a3 options:(int64_t)a4
{
  id v5;
  HMIJSONArchiver *v6;
  void *v7;

  v5 = a3;
  v6 = objc_alloc_init(HMIJSONArchiver);
  -[HMIJSONArchiver setOptions:](v6, "setOptions:", a4);
  -[HMIJSONArchiver _JSONObjectWithObject:options:](v6, "_JSONObjectWithObject:options:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)JSONObjectStringWithObject:(id)a3
{
  return (id)objc_msgSend(a1, "JSONObjectStringWithObject:pretty:options:", a3, 0, 0);
}

+ (id)JSONObjectStringWithObject:(id)a3 pretty:(BOOL)a4 options:(int64_t)a5
{
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(a1, "JSONObjectWithObject:options:", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v7 = 15;
  else
    v7 = 14;
  v8 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithData:encoding:", v9, 4);

  return v10;
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_container, 0);
}

@end
