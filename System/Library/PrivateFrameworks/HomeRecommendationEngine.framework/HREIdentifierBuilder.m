@implementation HREIdentifierBuilder

- (HREIdentifierBuilder)initWithBaseIdentifier:(id)a3
{
  id v4;
  HREIdentifierBuilder *v5;
  uint64_t v6;
  NSString *baseIdentifier;
  uint64_t v8;
  NSMutableDictionary *keyValues;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HREIdentifierBuilder;
  v5 = -[HREIdentifierBuilder init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    baseIdentifier = v5->_baseIdentifier;
    v5->_baseIdentifier = (NSString *)v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    keyValues = v5->_keyValues;
    v5->_keyValues = (NSMutableDictionary *)v8;

  }
  return v5;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSString *composedString;
  id v12;

  v12 = a3;
  v6 = a4;
  -[HREIdentifierBuilder keyValues](self, "keyValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v12);

  if ((v9 & 1) == 0)
  {
    -[HREIdentifierBuilder keyValues](self, "keyValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v6);

    composedString = self->_composedString;
    self->_composedString = 0;

  }
}

- (void)setBaseIdentifier:(id)a3
{
  NSString *composedString;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_baseIdentifier, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_baseIdentifier, a3);
    composedString = self->_composedString;
    self->_composedString = 0;

  }
}

- (NSString)composedString
{
  NSString *composedString;
  NSString *v4;
  NSString *v5;

  composedString = self->_composedString;
  if (!composedString)
  {
    -[HREIdentifierBuilder makeComposedString](self, "makeComposedString");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_composedString;
    self->_composedString = v4;

    composedString = self->_composedString;
  }
  return composedString;
}

- (id)makeComposedString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[HREIdentifierBuilder keyValues](self, "keyValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v7 = 0;
      do
      {
        __42__HREIdentifierBuilder_makeComposedString__block_invoke_2();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          __42__HREIdentifierBuilder_makeComposedString__block_invoke_4();
          v9 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v9;
        }
        objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HREIdentifierBuilder keyValues](self, "keyValues");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("%@%@:%@"), v8, v10, v12);

        ++v7;
      }
      while (v7 < objc_msgSend(v5, "count"));
    }
    v13 = (void *)MEMORY[0x24BDD17C8];
    -[HREIdentifierBuilder baseIdentifier](self, "baseIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@=%@"), v14, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HREIdentifierBuilder baseIdentifier](self, "baseIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

uint64_t __42__HREIdentifierBuilder_makeComposedString__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

id __42__HREIdentifierBuilder_makeComposedString__block_invoke_2()
{
  if (_block_invoke_na_once_token_0 != -1)
    dispatch_once(&_block_invoke_na_once_token_0, &__block_literal_global_5_1);
  return (id)_block_invoke_na_once_object_0;
}

void __42__HREIdentifierBuilder_makeComposedString__block_invoke_3()
{
  void *v0;

  v0 = (void *)_block_invoke_na_once_object_0;
  _block_invoke_na_once_object_0 = (uint64_t)CFSTR("-");

}

id __42__HREIdentifierBuilder_makeComposedString__block_invoke_4()
{
  if (_block_invoke_2_na_once_token_1 != -1)
    dispatch_once(&_block_invoke_2_na_once_token_1, &__block_literal_global_8);
  return (id)_block_invoke_2_na_once_object_1;
}

void __42__HREIdentifierBuilder_makeComposedString__block_invoke_5()
{
  void *v0;

  v0 = (void *)_block_invoke_2_na_once_object_1;
  _block_invoke_2_na_once_object_1 = (uint64_t)&stru_24F219000;

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HREIdentifierBuilder baseIdentifier](self, "baseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)objc_msgSend(v4, "initWithBaseIdentifier:", v5);

  -[HREIdentifierBuilder keyValues](self, "keyValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mutableCopy");
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (NSString)baseIdentifier
{
  return self->_baseIdentifier;
}

- (NSMutableDictionary)keyValues
{
  return self->_keyValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValues, 0);
  objc_storeStrong((id *)&self->_baseIdentifier, 0);
  objc_storeStrong((id *)&self->_composedString, 0);
}

@end
