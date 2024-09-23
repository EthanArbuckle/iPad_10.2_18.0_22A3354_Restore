@implementation MTStorageReader

- (unint64_t)mtType
{
  return 3;
}

- (MTStorageReader)initWithEncodedDictionary:(id)a3
{
  id v4;
  MTStorageReader *v5;
  uint64_t v6;
  NSMutableArray *stack;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTStorageReader;
  v5 = -[MTStorageReader init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    stack = v5->_stack;
    v5->_stack = (NSMutableArray *)v6;

  }
  return v5;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  NSMutableArray *stack;
  id v4;
  void *v5;
  void *v6;

  stack = self->_stack;
  v4 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");
  return (char)v4;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  NSMutableArray *stack;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  stack = self->_stack;
  v4 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  return v7;
}

- (int)decodeIntForKey:(id)a3
{
  NSMutableArray *stack;
  id v4;
  void *v5;
  void *v6;

  stack = self->_stack;
  v4 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "intValue");
  return (int)v4;
}

- (int)decodeInt32ForKey:(id)a3
{
  NSMutableArray *stack;
  id v4;
  void *v5;
  void *v6;

  stack = self->_stack;
  v4 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "intValue");
  return (int)v4;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  NSMutableArray *stack;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  stack = self->_stack;
  v4 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "longLongValue");
  return v7;
}

- (float)decodeFloatForKey:(id)a3
{
  NSMutableArray *stack;
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;

  stack = self->_stack;
  v4 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "floatValue");
  v8 = v7;

  return v8;
}

- (double)decodeDoubleForKey:(id)a3
{
  NSMutableArray *stack;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  stack = self->_stack;
  v4 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (id)decodeObjectForKey:(id)a3
{
  NSMutableArray *stack;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  stack = self->_stack;
  v5 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTStorageReader _decodeObject:](self, "_decodeObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_decodeObject:(id)a3
{
  id v4;
  id v5;
  id v6;
  char isKindOfClass;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend((id)objc_opt_class(), "_dictionaryIsForSerializableObject:", v5))
    {
      -[MTStorageReader _objectForDictionary:](self, "_objectForDictionary:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v5;
    v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v9);
          v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[MTStorageReader _decodeObject:](self, "_decodeObject:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, v19);

        }
        v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v16);
    }
LABEL_20:

    v6 = (id)objc_msgSend(v8, "copy");
    goto LABEL_21;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v4;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          -[MTStorageReader _decodeObject:](self, "_decodeObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), (_QWORD)v23);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v11);
    }
    goto LABEL_20;
  }
LABEL_22:

  return v6;
}

+ (BOOL)_dictionaryIsForSerializableObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "allKeys");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("$"));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_unwrap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (objc_msgSend(a1, "_dictionaryIsForSerializableObject:", v4))
  {
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (id)_objectForDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_stack, "addObject:", v7);
  objc_msgSend(v6, "substringFromIndex:", 1);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(NSClassFromString(v8)), "initWithCoder:", self);
  -[NSMutableArray removeObject:](self->_stack, "removeObject:", v7);

  return v9;
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (void)setStack:(id)a3
{
  objc_storeStrong((id *)&self->_stack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
}

@end
