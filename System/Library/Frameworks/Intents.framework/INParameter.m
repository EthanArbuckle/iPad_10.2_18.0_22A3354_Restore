@implementation INParameter

- (void)setIndex:(NSUInteger)index forSubKeyPath:(NSString *)subKeyPath
{
  NSMutableDictionary *indexesForSubKeyPaths;
  void *v7;
  id v8;

  -[INParameter _sanitizedKeyPathForKeyPath:removingSubscripts:](self, "_sanitizedKeyPathForKeyPath:removingSubscripts:", subKeyPath, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    indexesForSubKeyPaths = self->_indexesForSubKeyPaths;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", index);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](indexesForSubKeyPaths, "setValue:forKey:", v7, v8);

  }
}

- (NSUInteger)indexForSubKeyPath:(NSString *)subKeyPath
{
  void *v3;
  void *v4;
  NSUInteger v5;

  -[NSMutableDictionary objectForKey:](self->_indexesForSubKeyPaths, "objectForKey:", subKeyPath);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (id)_valueOfObject:(id)a3 forRemainingKeyPath:(id)a4 inFullyQualifiedKeyPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("."));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObject:", v12);
  v13 = objc_msgSend(v9, "rangeOfString:", v12);
  v15 = v13 + v14;
  if (v13 + v14 >= 0 && v15 <= objc_msgSend(v9, "length"))
  {
    objc_msgSend(v9, "substringToIndex:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[NSMutableDictionary objectForKey:](self->_indexesForSubKeyPaths, "objectForKey:", v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  objc_msgSend(v25, "valueForKey:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v16)
  {
    objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v16, "unsignedIntegerValue"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = v18;
  }
  v21 = v20;
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("."));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[INParameter _valueOfObject:forRemainingKeyPath:inFullyQualifiedKeyPath:](self, "_valueOfObject:forRemainingKeyPath:inFullyQualifiedKeyPath:", v21, v22, v9);
    v23 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v23;
  }

  return v21;
}

- (id)_sanitizedKeyPathForKeyPath:(id)a3 removingSubscripts:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(-[INParameter parameterClass](self, "parameterClass"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
    objc_msgSend(v8, "removeObject:", v9);
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR("."));
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v6;
  }
  v13 = v12;
  if (v4)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__INParameter__sanitizedKeyPathForKeyPath_removingSubscripts___block_invoke;
    v17[3] = &unk_1E228D518;
    v14 = v8;
    v18 = v14;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("."));
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }

  return v13;
}

- (NSString)_subscriptedKeyPath
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", self->_parameterKeyPath);
  -[NSMutableDictionary allKeys](self->_indexesForSubKeyPaths, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_49104);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CB3940];
        v12 = (void *)MEMORY[0x1E0CB37E8];
        -[NSMutableDictionary objectForKey:](self->_indexesForSubKeyPaths, "objectForKey:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "integerValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@[%@]"), v10, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", v10, v15, 8, 0, objc_msgSend(v3, "length"));

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_msgSend(v3, "copy");
  return (NSString *)v16;
}

- (void)_setIndexesForKeyPathWithSubscripts:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v25 = v3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    v8 = 0x1E0CB3000uLL;
    v26 = v4;
    v27 = *(_QWORD *)v32;
    do
    {
      v9 = 0;
      v29 = v6;
      do
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        objc_msgSend(*(id *)(v8 + 1280), "characterSetWithCharactersInString:", CFSTR("[]"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);
        if ((unint64_t)objc_msgSend(v12, "count") >= 2)
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "integerValue");
          v17 = v8;
          objc_msgSend(*(id *)(v8 + 1280), "decimalDigitCharacterSet");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "invertedSet");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v14, "rangeOfCharacterFromSet:", v19);

          if (v20 != 0x7FFFFFFFFFFFFFFFLL || v16 < 0)
          {
            v21 = (void *)MEMORY[0x1E0C99DA0];
            v22 = *MEMORY[0x1E0C99768];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid index <%@> for key path <%@>"), v14, v15);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v23, 0);
            v24 = (id)objc_claimAutoreleasedReturnValue();

            objc_exception_throw(v24);
          }
          -[INParameter setIndex:forSubKeyPath:](self, "setIndex:forSubKeyPath:", v16, v15);

          v4 = v26;
          v7 = v27;
          v8 = v17;
          v6 = v29;
        }

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v6);
  }

}

- (id)_parameterValueForParameterizedObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[INParameter parameterKeyPath](self, "parameterKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameter parameterKeyPath](self, "parameterKeyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameter _valueOfObject:forRemainingKeyPath:inFullyQualifiedKeyPath:](self, "_valueOfObject:forRemainingKeyPath:inFullyQualifiedKeyPath:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)parameterValue
{
  return 0;
}

- (id)parameterizedObject
{
  return 0;
}

- (INParameter)init
{
  INParameter *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *indexesForSubKeyPaths;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INParameter;
  v2 = -[INParameter init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    indexesForSubKeyPaths = v2->_indexesForSubKeyPaths;
    v2->_indexesForSubKeyPaths = v3;

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    NSStringFromClass((Class)objc_msgSend(v4, "parameterClass"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(-[INParameter parameterClass](self, "parameterClass"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      objc_msgSend(v4, "parameterKeyPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[INParameter parameterKeyPath](self, "parameterKeyPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        objc_msgSend(v4, "_indexesForSubKeyPaths");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[INParameter _indexesForSubKeyPaths](self, "_indexesForSubKeyPaths");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToDictionary:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  NSStringFromClass(-[INParameter parameterClass](self, "parameterClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[INParameter parameterKeyPath](self, "parameterKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[INParameter _indexesForSubKeyPaths](self, "_indexesForSubKeyPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash") ^ v4;

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSString *v6;
  Class v7;
  void *v8;
  void *v9;
  void *v10;

  NSStringFromClass(-[INParameter parameterClass](self, "parameterClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSString *)objc_msgSend(v5, "copyWithZone:", a3);
  v7 = NSClassFromString(v6);
  -[INParameter parameterKeyPath](self, "parameterKeyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  +[INParameter parameterForClass:keyPath:](INParameter, "parameterForClass:keyPath:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)description
{
  return -[INParameter descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INParameter;
  -[INParameter description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameter _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  NSStringFromClass(-[INParameter parameterClass](self, "parameterClass"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("(nil)");
  if (v3)
    v5 = (__CFString *)v3;
  v10[0] = CFSTR("parameterKeyPath (subscripted)");
  v6 = v5;
  -[INParameter _subscriptedKeyPath](self, "_subscriptedKeyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("parameterClass");
  v11[0] = v7;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (INParameter)initWithCoder:(id)a3
{
  id v4;
  INParameter *v5;
  NSString *v6;
  uint64_t v7;
  Class parameterClass;
  uint64_t v9;
  NSString *parameterKeyPath;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *indexesForSubKeyPaths;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INParameter;
  v5 = -[INParameter init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterClass"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    parameterClass = v5->_parameterClass;
    v5->_parameterClass = (Class)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterKeyPath"));
    v9 = objc_claimAutoreleasedReturnValue();
    parameterKeyPath = v5->_parameterKeyPath;
    v5->_parameterKeyPath = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("_indexesForSubKeyPaths"));
    v15 = objc_claimAutoreleasedReturnValue();
    indexesForSubKeyPaths = v5->_indexesForSubKeyPaths;
    v5->_indexesForSubKeyPaths = (NSMutableDictionary *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *parameterClass;
  void *v5;
  id v6;

  parameterClass = self->_parameterClass;
  v6 = a3;
  NSStringFromClass(parameterClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("parameterClass"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_parameterKeyPath, CFSTR("parameterKeyPath"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_indexesForSubKeyPaths, CFSTR("_indexesForSubKeyPaths"));

}

- (NSMutableDictionary)_indexesForSubKeyPaths
{
  return self->_indexesForSubKeyPaths;
}

- (void)set_indexesForSubKeyPaths:(id)a3
{
  objc_storeStrong((id *)&self->_indexesForSubKeyPaths, a3);
}

- (Class)parameterClass
{
  return self->_parameterClass;
}

- (void)setParameterClass:(Class)a3
{
  objc_storeStrong((id *)&self->_parameterClass, a3);
}

- (NSString)parameterKeyPath
{
  return self->_parameterKeyPath;
}

- (void)setParameterKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterKeyPath, 0);
  objc_storeStrong((id *)&self->_parameterClass, 0);
  objc_storeStrong((id *)&self->_indexesForSubKeyPaths, 0);
}

uint64_t __34__INParameter__subscriptedKeyPath__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a3, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "length");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

void __62__INParameter__sanitizedKeyPathForKeyPath_removingSubscripts___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("["));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, a3);

}

+ (INParameter)parameterForClass:(Class)aClass keyPath:(NSString *)keyPath
{
  NSString *v5;
  INParameter *v6;
  void *v7;
  void *v8;

  v5 = keyPath;
  v6 = objc_alloc_init(INParameter);
  -[INParameter setParameterClass:](v6, "setParameterClass:", aClass);
  -[INParameter _sanitizedKeyPathForKeyPath:removingSubscripts:](v6, "_sanitizedKeyPathForKeyPath:removingSubscripts:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[INParameter setParameterKeyPath:](v6, "setParameterKeyPath:", v7);
    -[INParameter _sanitizedKeyPathForKeyPath:removingSubscripts:](v6, "_sanitizedKeyPathForKeyPath:removingSubscripts:", v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[INParameter _setIndexesForKeyPathWithSubscripts:](v6, "_setIndexesForKeyPathWithSubscripts:", v8);
  }
  else
  {
    v8 = v6;
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
