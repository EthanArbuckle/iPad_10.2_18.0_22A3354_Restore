@implementation HFLocalizableStringKey

- (HFLocalizableStringKey)initWithKey:(id)a3 argumentKeys:(id)a4
{
  id v7;
  id v8;
  HFLocalizableStringKey *v9;
  HFLocalizableStringKey *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *argumentMap;
  id v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HFLocalizableStringKey;
  v9 = -[HFLocalizableStringKey init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    v11 = objc_msgSend(v8, "copy");
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v10->_argumentKeys, v13);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    argumentMap = v10->_argumentMap;
    v10->_argumentMap = (NSMutableDictionary *)v14;

    if (_MergedGlobals_6_2 != -1)
      dispatch_once(&_MergedGlobals_6_2, &__block_literal_global_2_21);
    v16 = (id)qword_1F03ED348;
    -[HFLocalizableStringKey setStringLocalizationBlock:](v10, "setStringLocalizationBlock:", v16);

  }
  return v10;
}

void __51__HFLocalizableStringKey_initWithKey_argumentKeys___block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1F03ED348;
  qword_1F03ED348 = (uint64_t)&__block_literal_global_4_5;

}

id __51__HFLocalizableStringKey_initWithKey_argumentKeys___block_invoke_3(uint64_t a1, void *a2)
{
  return _HFLocalizedStringWithDefaultValue(a2, 0, 0);
}

+ (id)stringKeyWithKey:(id)a3 arguments:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v10);
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v11, v10);

      ++v9;
    }
    while (v9 < objc_msgSend(v6, "count"));
  }
  v12 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithKey:argumentKeys:", v5, v7);
  v13 = (void *)v12[3];
  v12[3] = v8;

  return v12;
}

+ (id)stringKeyWithKey:(id)a3 argumentKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:argumentKeys:", v7, v6);

  return v8;
}

- (NSArray)argumentKeys
{
  return self->_argumentKeys;
}

- (void)setArgumentKeys:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *argumentKeys;
  id v7;

  v4 = a3;
  if (!v4)
    v4 = (id)MEMORY[0x1E0C9AA60];
  v7 = v4;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  argumentKeys = self->_argumentKeys;
  self->_argumentKeys = v5;

}

- (id)localizedStringWithArgumentBlock:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *);
  void *v15;
  HFLocalizableStringKey *v16;
  id v17;

  v4 = a3;
  -[HFLocalizableStringKey stringLocalizationBlock](self, "stringLocalizationBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HFLocalizableStringKey key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v5)[2](v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HFLocalizableStringKey argumentKeys](self, "argumentKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __59__HFLocalizableStringKey_localizedStringWithArgumentBlock___block_invoke;
    v15 = &unk_1EA738E08;
    v16 = self;
    v17 = v4;
    objc_msgSend(v8, "na_map:", &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "hf_stringWithFormat:arguments:", v7, v9, v12, v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __59__HFLocalizableStringKey_localizedStringWithArgumentBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "argumentMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "argumentMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSLog(CFSTR("HFLocalizableStringKey: Failed to get string for argument key: %@"), v3);
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  unint64_t v24;
  char v25;
  void *v26;
  void *v27;
  char v28;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFLocalizableStringKey key](self, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    -[HFLocalizableStringKey argumentKeys](self, "argumentKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    objc_msgSend(v7, "argumentKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v12 == v14)
    {
      -[HFLocalizableStringKey argumentKeys](self, "argumentKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16)
      {
        v17 = 0;
        do
        {
          -[HFLocalizableStringKey argumentKeys](self, "argumentKeys");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "argumentKeys");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", v19);

          if ((v22 & 1) == 0)
            break;
          ++v17;
          -[HFLocalizableStringKey argumentKeys](self, "argumentKeys");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "count");

        }
        while (v17 < v24);
      }
      else
      {
        v22 = 1;
      }
    }
    else
    {
      v22 = 0;
    }
    -[HFLocalizableStringKey argumentMap](self, "argumentMap");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "argumentMap");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqualToDictionary:", v27);

    if (v10)
      v25 = v22 & v28;
    else
      v25 = 0;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_opt_class();
  -[HFLocalizableStringKey key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[HFLocalizableStringKey argumentKeys](self, "argumentKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "stringKeyWithKey:argumentKeys:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFLocalizableStringKey key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFLocalizableStringKey argumentKeys](self, "argumentKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFLocalizableStringKey argumentMap](self, "argumentMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p key='%@' argumentKeys='%@' argumentMap='%@'>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSMutableDictionary)argumentMap
{
  return self->_argumentMap;
}

- (id)stringLocalizationBlock
{
  return self->_stringLocalizationBlock;
}

- (void)setStringLocalizationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stringLocalizationBlock, 0);
  objc_storeStrong((id *)&self->_argumentMap, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_argumentKeys, 0);
}

@end
