@implementation SGStringPreprocessingTransformer

- (SGStringPreprocessingTransformer)initWithMethods:(id)a3
{
  id v5;
  SGStringPreprocessingTransformer *v6;
  SGStringPreprocessingTransformer *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  id v17;
  void *v18;
  BOOL v19;
  const __CFString *v20;
  uint64_t v21;
  NSMethodSignature *methodSignatureNoValue;
  uint64_t v23;
  NSMethodSignature *methodSignatureWithValue;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  SEL v30;
  SGStringPreprocessingTransformer *v31;
  objc_super v32;
  char __str[16];
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGStringPreprocessingTransformer.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("methods"));

  }
  if ((objc_msgSend(v5, "count") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGStringPreprocessingTransformer.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("methods.count % 2 == 0"));

  }
  v32.receiver = self;
  v32.super_class = (Class)SGStringPreprocessingTransformer;
  v6 = -[SGStringPreprocessingTransformer init](&v32, sel_init);
  v7 = v6;
  if (v6)
  {
    v30 = a2;
    v31 = v6;
    v8 = (void *)objc_opt_new();
    v9 = (void *)objc_opt_new();
    if (objc_msgSend(v5, "count"))
    {
      v10 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v10 + 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v9;
        v14 = v8;
        v15 = objc_msgSend(v11, "length");
        v16 = (objc_class *)MEMORY[0x24BDD16A8];
        v17 = v12;
        v18 = (void *)objc_msgSend([v16 alloc], "initWithCapacity:", objc_msgSend(v17, "length") + 11);
        objc_msgSend(v18, "appendString:", v17);

        v19 = v15 == 0;
        v8 = v14;
        v9 = v13;
        if (v19)
          v20 = CFSTR(":");
        else
          v20 = CFSTR(":withValue:");
        objc_msgSend(v18, "appendString:", v20);
        objc_msgSend(v8, "addObject:", v18);

        objc_msgSend(v13, "addObject:", v11);
        v10 += 2;
      }
      while (v10 < objc_msgSend(v5, "count"));
    }
    v7 = v31;
    objc_storeStrong((id *)&v31->_methodNames, v8);
    objc_storeStrong((id *)&v31->_methodValues, v9);
    *(_OWORD *)__str = 0u;
    v34 = 0u;
    if (snprintf(__str, 0x20uLL, "%s%s%s%s", "v", "@", ":", "@") > 0x1F)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", v30, v31, CFSTR("SGStringPreprocessingTransformer.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("size >= 0 && size < TYPES_STRING_BUF_SIZE"));

    }
    objc_msgSend(MEMORY[0x24BDBCEB0], "signatureWithObjCTypes:", __str);
    v21 = objc_claimAutoreleasedReturnValue();
    methodSignatureNoValue = v31->_methodSignatureNoValue;
    v31->_methodSignatureNoValue = (NSMethodSignature *)v21;

    if (snprintf(__str, 0x20uLL, "%s%s%s%s%s", "v", "@", ":", "@", "@") >= 0x20)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", v30, v31, CFSTR("SGStringPreprocessingTransformer.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("size >= 0 && size < TYPES_STRING_BUF_SIZE"));

    }
    objc_msgSend(MEMORY[0x24BDBCEB0], "signatureWithObjCTypes:", __str);
    v23 = objc_claimAutoreleasedReturnValue();
    methodSignatureWithValue = v31->_methodSignatureWithValue;
    v31->_methodSignatureWithValue = (NSMethodSignature *)v23;

  }
  return v7;
}

- (id)transform:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  const char *v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[SGStringPreprocessingTransformer transform:]", "SGStringPreprocessingTransformer.m", 94, "[input isKindOfClass:[NSString class]]");
  v5 = (void *)MEMORY[0x220753E80]();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  if (-[NSArray count](self->_methodNames, "count"))
  {
    v8 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_methodNames, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SGStringPreprocessingTransformer selectorForMethod:preprocessor:](self, "selectorForMethod:preprocessor:", v9, v6);

      -[NSArray objectAtIndexedSubscript:](self->_methodValues, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGStringPreprocessingTransformer applySelector:preprocesor:string:value:](self, "applySelector:preprocesor:string:value:", v10, v6, v7, v11);

      ++v8;
    }
    while (v8 < -[NSArray count](self->_methodNames, "count"));
  }

  objc_autoreleasePoolPop(v5);
  return v7;
}

- (id)transformBatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *context;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  context = (void *)MEMORY[0x220753E80]();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v11), "mutableCopy", context);
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }

  if (-[NSArray count](self->_methodNames, "count"))
  {
    v13 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_methodNames, "objectAtIndexedSubscript:", v13, context);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SGStringPreprocessingTransformer selectorForMethod:preprocessor:](self, "selectorForMethod:preprocessor:", v14, v5);

      v24 = v13;
      -[NSArray objectAtIndexedSubscript:](self->_methodValues, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v17 = v6;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v26;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v26 != v20)
              objc_enumerationMutation(v17);
            -[SGStringPreprocessingTransformer applySelector:preprocesor:string:value:](self, "applySelector:preprocesor:string:value:", v15, v5, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v21++), v16);
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v19);
      }

      v13 = v24 + 1;
    }
    while (v24 + 1 < -[NSArray count](self->_methodNames, "count"));
  }

  objc_autoreleasePoolPop(context);
  return v6;
}

- (SEL)selectorForMethod:(id)a3 preprocessor:(id)a4
{
  NSString *v5;
  id v6;
  SEL v7;
  const char *v8;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  int v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (NSString *)a3;
  v6 = a4;
  v7 = NSSelectorFromString(v5);
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      v9 = MEMORY[0x24BDACB70];
      v10 = "SGStringPreprocessor error: NSSelectorFromString returned NULL";
      v11 = 2;
      goto LABEL_9;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = v7;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v5;
      v9 = MEMORY[0x24BDACB70];
      v10 = "SGStringPreprocessor received an invalid method %@";
      v11 = 12;
LABEL_9:
      _os_log_error_impl(&dword_21ABF4000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, v11);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v8;
}

- (void)applySelector:(SEL)a3 preprocesor:(id)a4 string:(id)a5 value:(id)a6
{
  id v9;
  id v10;
  void (*v11)(id, SEL, id, id);
  id v12;

  v12 = a4;
  v9 = a5;
  v10 = a6;
  if (a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = (void (*)(id, SEL, id, id))objc_msgSend(v12, "methodForSelector:", a3);
    if (objc_msgSend(v10, "length"))
      v11(v12, a3, v9, v10);
    else
      ((void (*)(id, SEL, id))v11)(v12, a3, v9);
  }

}

- (id)toPlistWithChunks:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (-[NSArray count](self->_methodNames, "count"))
  {
    v6 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_methodNames, "objectAtIndexedSubscript:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "rangeOfString:", CFSTR(":"));
      if (v9)
      {
        v10 = v8;
        v11 = (void *)MEMORY[0x220753E80]();
        objc_msgSend(v7, "substringWithRange:", 0, v10);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v11);
      }
      else
      {
        v12 = v7;
      }

      objc_msgSend(v5, "addObject:", v12);
      -[NSArray objectAtIndexedSubscript:](self->_methodValues, "objectAtIndexedSubscript:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);

      ++v6;
    }
    while (-[NSArray count](self->_methodNames, "count") > v6);
  }
  v16 = CFSTR("METHODS");
  v17[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (SGStringPreprocessingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  void *v6;
  SGStringPreprocessingTransformer *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("METHODS"), a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SGStringPreprocessingTransformer initWithMethods:](self, "initWithMethods:", v6);

  return v7;
}

- (BOOL)isEqualToStringPreprocessingTransformer:(id)a3
{
  id v4;
  _QWORD *v5;
  NSArray *methodNames;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  char v10;
  char v11;
  NSArray *v12;
  NSArray *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  methodNames = self->_methodNames;
  v7 = (NSArray *)*((id *)v4 + 1);
  if (methodNames == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = methodNames;
    v10 = -[NSArray isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_methodValues;
  v13 = v12;
  if (v12 == (NSArray *)v5[2])
    v11 = 1;
  else
    v11 = -[NSArray isEqual:](v12, "isEqual:");

LABEL_10:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  SGStringPreprocessingTransformer *v4;
  SGStringPreprocessingTransformer *v5;
  BOOL v6;

  v4 = (SGStringPreprocessingTransformer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGStringPreprocessingTransformer isEqualToStringPreprocessingTransformer:](self, "isEqualToStringPreprocessingTransformer:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSArray hash](self->_methodNames, "hash");
  return -[NSArray hash](self->_methodValues, "hash") - v3 + 32 * v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methodSignatureWithValue, 0);
  objc_storeStrong((id *)&self->_methodSignatureNoValue, 0);
  objc_storeStrong((id *)&self->_methodValues, 0);
  objc_storeStrong((id *)&self->_methodNames, 0);
}

+ (id)withMethods:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMethods:", v4);

  return v5;
}

@end
