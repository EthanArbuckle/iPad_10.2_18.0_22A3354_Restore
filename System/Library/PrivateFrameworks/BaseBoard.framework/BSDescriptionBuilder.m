@implementation BSDescriptionBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePrefix, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_proem, 0);
}

- (void)appendBodySectionWithName:(id)a3 multilinePrefix:(id)a4 block:(id)a5
{
  int activeComponent;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  NSString *v14;
  void *v15;

  activeComponent = self->_activeComponent;
  self->_activeComponent = 1;
  if (a3)
  {
    if (a4)
      -[NSMutableString appendString:](self->_description, "appendString:", a4);
    -[NSMutableString appendString:](self->_description, "appendString:", a3);
    -[NSMutableString appendString:](self->_description, "appendString:", CFSTR(" = "));
  }
  v10 = -[NSMutableString appendString:](self->_description, "appendString:", CFSTR("{"));
  if (a5)
  {
    v11 = (void *)MEMORY[0x18D769AE0](v10);
    -[NSMutableString appendString:](self->_description, "appendString:", CFSTR("\n"));
    v12 = &stru_1E1EC08D0;
    if (a4)
      v12 = (__CFString *)a4;
    v13 = v12;
    v14 = self->_activePrefix;
    -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("    "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[BSDescriptionBuilder setActiveMultilinePrefix:](self, "setActiveMultilinePrefix:", v15);
    (*((void (**)(id))a5 + 2))(a5);
    -[BSDescriptionBuilder setActiveMultilinePrefix:](self, "setActiveMultilinePrefix:", v14);
    if (a4)
      -[NSMutableString appendString:](self->_description, "appendString:", a4);
    -[NSMutableString appendString:](self->_description, "appendString:", CFSTR("}\n"));

    objc_autoreleasePoolPop(v11);
  }
  else
  {
    -[NSMutableString appendString:](self->_description, "appendString:", CFSTR(" }\n"));
  }
  self->_activeComponent = activeComponent;
}

- (id)appendObject:(id)a3 withName:(id)a4 skipIfNil:(BOOL)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];

  if (a3 || !a5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __56__BSDescriptionBuilder_appendObject_withName_skipIfNil___block_invoke;
      v18[3] = &unk_1E1EBE650;
      v18[4] = a3;
      v8 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v18);
    }
    else
    {
      v9 = (void *)MEMORY[0x18D769AE0]();
      if (self->_useDebugDescription && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(a3, "debugDescriptionWithMultilinePrefix:", self->_activePrefix);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(a3, "descriptionWithMultilinePrefix:", self->_activePrefix);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else if (self->_useDebugDescription && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(a3, "debugDescription");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(a3, "description");
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a3);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      v11 = (void *)v10;
      if (!v10)
      {
        +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "build");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __56__BSDescriptionBuilder_appendObject_withName_skipIfNil___block_invoke_2;
      v16[3] = &unk_1E1EBE650;
      v17 = v11;
      v13 = v11;
      v14 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v16);

      objc_autoreleasePoolPop(v9);
    }
  }
  return self;
}

- (_QWORD)appendObjectWithName:(uint64_t)a3 formatBlock:
{
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;

  if (a1)
  {
    if (*((_DWORD *)a1 + 9) == 1)
    {
      v6 = (__CFString *)a1[5];
      if (!v6)
        v6 = &stru_1E1EC08D0;
      v7 = v6;
      v8 = CFSTR(" = ");
      v9 = CFSTR(";\n");
    }
    else
    {
      v10 = (void *)objc_opt_class();
      objc_msgSend(v10, "componentSeparator");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nameObjectSeparator");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = &stru_1E1EC08D0;
    }
    v11 = 3;
    if (!*((_DWORD *)a1 + 9))
      v11 = 2;
    v12 = (id)a1[v11];
    objc_msgSend(v12, "appendString:", v7);
    if (objc_msgSend(a2, "length"))
    {
      objc_msgSend(v12, "appendString:", a2);
      objc_msgSend(v12, "appendString:", v8);
    }
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v12);
    objc_msgSend(v12, "appendString:", v9);
    v13 = a1;

  }
  return a1;
}

+ (id)nameObjectSeparator
{
  return CFSTR(": ");
}

+ (id)componentSeparator
{
  return CFSTR("; ");
}

uint64_t __56__BSDescriptionBuilder_appendObject_withName_skipIfNil___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendString:", *(_QWORD *)(a1 + 32));
}

- (void)appendString:(id)a3 withName:(id)a4
{
  -[BSDescriptionBuilder appendString:withName:skipIfEmpty:](self, "appendString:withName:skipIfEmpty:", a3, a4, 0);
}

- (void)setActiveMultilinePrefix:(id)a3
{
  objc_storeStrong((id *)&self->_activePrefix, a3);
}

uint64_t __56__BSDescriptionBuilder_appendObject_withName_skipIfNil___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendString:", *(_QWORD *)(a1 + 32));
}

void __85__BSDescriptionBuilder_appendDictionarySection_withName_multilinePrefix_skipIfEmpty___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6, (_QWORD)v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "succinctDescriptionForObject:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isNSDictionary"))
        {
          objc_msgSend(*(id *)(a1 + 40), "appendDictionarySection:withName:skipIfEmpty:", v7, v8, 0);
        }
        else
        {
          v9 = objc_msgSend(v7, "isNSArray");
          v10 = *(void **)(a1 + 40);
          if (v9)
            objc_msgSend(v10, "appendArraySection:withName:skipIfEmpty:", v7, v8, 0);
          else
            v11 = (id)objc_msgSend(v10, "appendObject:withName:", v7, v8);
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

uint64_t __58__BSDescriptionBuilder_appendString_withName_skipIfEmpty___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "appendString:", CFSTR("\"));
  objc_msgSend(a2, "appendString:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(a2, "appendString:", CFSTR("\"));
}

uint64_t __55__BSDescriptionBuilder_appendUnsignedInteger_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("%lu"), *(_QWORD *)(a1 + 32));
}

uint64_t __47__BSDescriptionBuilder_appendPointer_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("%p"), *(_QWORD *)(a1 + 32));
}

uint64_t __67__BSDescriptionBuilder_appendTimeInterval_withName_decomposeUnits___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("%.2fs"), *(_QWORD *)(a1 + 32));
}

uint64_t __62__BSDescriptionBuilder_appendUnsignedInteger_withName_format___block_invoke(uint64_t a1, void *a2)
{
  const __CFString *v2;

  if (*(_QWORD *)(a1 + 32) == 1)
    v2 = CFSTR("0x%lX");
  else
    v2 = CFSTR("%lu");
  return objc_msgSend(a2, "appendFormat:", v2, *(_QWORD *)(a1 + 40));
}

uint64_t __51__BSDescriptionBuilder_appendUnsignedInt_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("%u"), *(unsigned int *)(a1 + 32));
}

uint64_t __67__BSDescriptionBuilder_appendTimeInterval_withName_decomposeUnits___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("%.1fs"), *(_QWORD *)(a1 + 32));
}

uint64_t __46__BSDescriptionBuilder_appendUInt64_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("%llu"), *(_QWORD *)(a1 + 32));
}

uint64_t __57__BSDescriptionBuilder_appendCustomFormatWithName_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)appendSuper
{
  NSObject *object;
  Class Class;
  objc_class *Superclass;
  int v6;
  Method *v7;
  Method *v8;
  unint64_t v9;
  IMP Implementation;
  char v11;
  objc_method *v12;
  char *Name;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  unsigned int outCount;

  object = self->_object;
  if (object)
  {
    Class = object_getClass(object);
    if (!Class)
    {
LABEL_18:
      v15 = -[BSDescriptionBuilder appendObject:withName:](self, "appendObject:withName:", CFSTR("(super does not implement description)"), 0);
      return self;
    }
    Superclass = Class;
    v6 = 0;
    while (1)
    {
      outCount = 0;
      v7 = class_copyMethodList(Superclass, &outCount);
      v8 = v7;
      if (outCount)
      {
        v9 = 0;
        Implementation = 0;
        do
        {
          v11 = v6;
          v12 = v8[v9];
          Name = (char *)method_getName(v12);
          v6 |= Name == sel_description;
          if (Name == sel_description && (v11 & 1) != 0)
          {
            Implementation = method_getImplementation(v12);
            v6 = 1;
          }
          ++v9;
        }
        while (Name != sel_description && v9 < outCount);
        free(v8);
        if (Implementation)
        {
          ((void (*)(NSObject *, char *))Implementation)(self->_object, sel_description);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p; "), self->_object);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "rangeOfString:", v17);

          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v19 = -[BSDescriptionBuilder appendObject:withName:](self, "appendObject:withName:", CFSTR("(super's description format doesn't match)"), 0);
          }
          else
          {
            objc_msgSend(v16, "length");
            objc_msgSend(v16, "substringWithRange:");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[BSDescriptionBuilder appendObject:withName:skipIfNil:](self, "appendObject:withName:skipIfNil:", v20, 0, 1);

          }
          return self;
        }
      }
      else
      {
        free(v7);
      }
      Superclass = class_getSuperclass(Superclass);
      if (!Superclass)
        goto LABEL_18;
    }
  }
  return self;
}

- (void)appendDictionarySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6 objectTransformer:(id)a7
{
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  _BOOL4 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a7)
  {
    v19 = a6;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = a3;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          (*((void (**)(id, uint64_t))a7 + 2))(a7, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v11, "setObject:forKey:", v17, v16);

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    -[BSDescriptionBuilder appendDictionarySection:withName:multilinePrefix:skipIfEmpty:](self, "appendDictionarySection:withName:multilinePrefix:skipIfEmpty:", v11, a4, a5, v19);
  }
  else
  {
    -[BSDescriptionBuilder appendDictionarySection:withName:multilinePrefix:skipIfEmpty:](self, "appendDictionarySection:withName:multilinePrefix:skipIfEmpty:", a3, a4, a5, a6);
  }
}

- (void)appendDictionarySection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5
{
  id v8;

  -[BSDescriptionBuilder activeMultilinePrefix](self, "activeMultilinePrefix");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[BSDescriptionBuilder appendDictionarySection:withName:multilinePrefix:skipIfEmpty:](self, "appendDictionarySection:withName:multilinePrefix:skipIfEmpty:", a3, a4);

}

- (NSString)activeMultilinePrefix
{
  if (self->_activePrefix)
    return self->_activePrefix;
  else
    return (NSString *)&stru_1E1EC08D0;
}

- (void)appendDictionarySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6
{
  id v11;
  _QWORD v12[6];

  if (objc_msgSend(a3, "count"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__BSDescriptionBuilder_appendDictionarySection_withName_multilinePrefix_skipIfEmpty___block_invoke;
    v12[3] = &unk_1E1EBE700;
    v12[4] = a3;
    v12[5] = self;
    -[BSDescriptionBuilder appendBodySectionWithName:multilinePrefix:block:](self, "appendBodySectionWithName:multilinePrefix:block:", a4, a5, v12);
  }
  else if (a4)
  {
    if (!a6)
      v11 = -[BSDescriptionBuilder appendObject:withName:](self, "appendObject:withName:", CFSTR("(empty)"), a4);
  }
}

- (id)appendFloat:(double)a3 withName:(id)a4
{
  return -[BSDescriptionBuilder appendFloat:withName:decimalPrecision:](self, "appendFloat:withName:decimalPrecision:", a4, 0x7FFFFFFFFFFFFFFFLL, a3);
}

+ (id)succinctDescriptionForObject:(id)a3
{
  void *v5;

  if (a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "succinctDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(a3, "description");
    else
      objc_msgSend(a1, "descriptionForObject:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)descriptionForObject:(id)a3 withObjectsAndNames:(id)a4
{
  void *v6;
  id v7;
  __CFString *v8;
  void *v9;
  objc_class *v10;
  id v12;

  if (a3)
  {
    if (a4)
    {
      +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[BSDescriptionBuilder appendObjectsAndNames:args:](v6, a4, &v12);
      objc_msgSend(v6, "build");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = (objc_class *)objc_opt_class();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("<%s: %p>"), class_getName(v10), a3);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = CFSTR("(null)");
  }
  return v8;
}

+ (id)descriptionForObject:(id)a3
{
  return (id)objc_msgSend(a1, "descriptionForObject:withObjectsAndNames:", a3, 0);
}

- (void)setUseDebugDescription:(BOOL)a3
{
  self->_useDebugDescription = a3;
}

- (id)modifyProem:(id)a3
{
  int activeComponent;

  if (a3)
  {
    activeComponent = self->_activeComponent;
    self->_activeComponent = 0;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_activeComponent = activeComponent;
  }
  return self;
}

- (id)modifyBody:(id)a3
{
  int activeComponent;

  if (a3)
  {
    activeComponent = self->_activeComponent;
    self->_activeComponent = 1;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_activeComponent = activeComponent;
  }
  return self;
}

- (id)appendBool:(BOOL)a3 withName:(id)a4 ifEqualTo:(BOOL)a5
{
  id v6;

  if (a3 == a5)
    v6 = -[BSDescriptionBuilder appendBool:withName:](self, "appendBool:withName:");
  return self;
}

uint64_t __43__BSDescriptionBuilder_appendInt_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("%d"), *(unsigned int *)(a1 + 32));
}

uint64_t __47__BSDescriptionBuilder_appendInteger_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("%ld"), *(_QWORD *)(a1 + 32));
}

+ (id)builderWithObject:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithObject:", a3);
}

- (BSDescriptionBuilder)initWithObject:(id)a3
{
  BSDescriptionBuilder *v4;
  BSDescriptionBuilder *v5;
  NSMutableString *v6;
  NSMutableString *description;
  uint64_t v8;
  NSMutableString *proem;
  objc_class *v10;
  objc_class *v11;
  NSMutableString *v12;
  BSDescriptionBuilder *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BSDescriptionBuilder;
  v4 = -[BSDescriptionBuilder init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_object = a3;
    v6 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    description = v5->_description;
    v5->_description = v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("<"));
    proem = v5->_proem;
    v5->_proem = (NSMutableString *)v8;

    if (v5->_object)
    {
      objc_opt_class();
      v10 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = v5->_proem;
      if (v10 == (objc_class *)v5->_object)
        -[NSMutableString appendFormat:](v12, "appendFormat:", CFSTR("%s"), class_getName(v10));
      else
        -[NSMutableString appendFormat:](v12, "appendFormat:", CFSTR("%s: %p"), class_getName(v10), v5->_object);

    }
    v5->_activeComponent = 0;
    v13 = v5;
  }

  return v5;
}

- (id)build
{
  NSMutableString *description;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[NSMutableString appendString:](self->_proem, "appendString:", CFSTR(">"));
  description = self->_description;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString stringByTrimmingCharactersInSet:](description, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@"), self->_proem, v5);
  else
    v6 = -[NSMutableString copy](self->_proem, "copy");
  v7 = (void *)v6;

  return v7;
}

- (id)appendBool:(BOOL)a3 withName:(id)a4
{
  void *v6;
  id v7;

  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BSDescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v6, a4);

  return self;
}

- (id)appendObject:(id)a3 withName:(id)a4
{
  return -[BSDescriptionBuilder appendObject:withName:skipIfNil:](self, "appendObject:withName:skipIfNil:", a3, a4, 0);
}

- (void)appendString:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  BSDescriptionBuilder *v13;
  const __CFString *v14;
  id v15;
  _QWORD v16[5];

  v5 = a5;
  if (!a3)
  {
    if (a5)
      return;
    goto LABEL_8;
  }
  v9 = objc_msgSend(a3, "length");
  if (!v5 || v9)
  {
    if (!v9)
    {
      v14 = CFSTR("\"\");
      v13 = self;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(a3, "rangeOfCharacterFromSet:", v10);

    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __58__BSDescriptionBuilder_appendString_withName_skipIfEmpty___block_invoke;
      v16[3] = &unk_1E1EBE650;
      v16[4] = a3;
      v12 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v16);
      return;
    }
LABEL_8:
    v13 = self;
    v14 = (const __CFString *)a3;
LABEL_10:
    v15 = -[BSDescriptionBuilder appendObject:withName:skipIfNil:](v13, "appendObject:withName:skipIfNil:", v14, a4, v5);
  }
}

- (id)appendInteger:(int64_t)a3 withName:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__BSDescriptionBuilder_appendInteger_withName___block_invoke;
  v5[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
  v5[4] = a3;
  -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)appendInt:(int)a3 withName:(id)a4
{
  _QWORD v5[4];
  int v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__BSDescriptionBuilder_appendInt_withName___block_invoke;
  v5[3] = &__block_descriptor_36_e25_v16__0__NSMutableString_8l;
  v6 = a3;
  -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)appendUnsignedInteger:(unint64_t)a3 withName:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__BSDescriptionBuilder_appendUnsignedInteger_withName___block_invoke;
  v5[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
  v5[4] = a3;
  -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)appendPointer:(void *)a3 withName:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__BSDescriptionBuilder_appendPointer_withName___block_invoke;
  v5[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
  v5[4] = a3;
  return -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v5);
}

- (id)appendRect:(CGRect)a3 withName:(id)a4
{
  void *v6;
  void *v7;

  BSStringFromCGRect(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSDescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)appendSize:(CGSize)a3 withName:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a3.width, 17, *(_QWORD *)&a3.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSDescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)appendDouble:(double)a3 withName:(id)a4 decimalPrecision:(unint64_t)a5
{
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;

  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&a3);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0x7FFFFFFFLL;
    if (a5 < 0x7FFFFFFF)
      v8 = a5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.*f"), v8, *(_QWORD *)&a3);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;
  v10 = -[BSDescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v7, a4);

  return self;
}

- (id)appendTimeInterval:(double)a3 withName:(id)a4 decomposeUnits:(BOOL)a5
{
  void *v6;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v15[5];
  _QWORD v16[5];

  v6 = self;
  if (fabs(a3) == INFINITY)
  {
    -[BSDescriptionBuilder appendObject:withName:](self, "appendObject:withName:", CFSTR("(inf)"), a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (a3 - (double)(uint64_t)a3) * 1000.0;
    if (a5)
    {
      if (qword_1ECD39720 != -1)
        dispatch_once(&qword_1ECD39720, &__block_literal_global_1);
      objc_msgSend((id)_MergedGlobals_5, "stringFromTimeInterval:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (fabs(v8) >= 2.22044605e-16)
      {
        objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(" %.0fms"), *(_QWORD *)&v8);
        v13 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v13;
      }
      else
      {
        v11 = v9;
      }
      objc_msgSend(v6, "appendObject:withName:", v11, a4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (fabs(v8) >= 2.22044605e-16)
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __67__BSDescriptionBuilder_appendTimeInterval_withName_decomposeUnits___block_invoke_3;
        v15[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
        *(double *)&v15[4] = a3;
        v12 = v15;
      }
      else
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __67__BSDescriptionBuilder_appendTimeInterval_withName_decomposeUnits___block_invoke_2;
        v16[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
        *(double *)&v16[4] = a3;
        v12 = v16;
      }
      -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v12);
      objc_claimAutoreleasedReturnValue();
    }
  }
  return v6;
}

- (id)appendUnsignedInt:(unsigned int)a3 withName:(id)a4
{
  _QWORD v5[4];
  unsigned int v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__BSDescriptionBuilder_appendUnsignedInt_withName___block_invoke;
  v5[3] = &__block_descriptor_36_e25_v16__0__NSMutableString_8l;
  v6 = a3;
  -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)appendUnsignedInteger:(unint64_t)a3 withName:(id)a4 format:(int64_t)a5
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__BSDescriptionBuilder_appendUnsignedInteger_withName_format___block_invoke;
  v6[3] = &__block_descriptor_48_e25_v16__0__NSMutableString_8l;
  v6[4] = a5;
  v6[5] = a3;
  -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)appendPoint:(CGPoint)a3 withName:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a3.x, 17, *(_QWORD *)&a3.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSDescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)appendClass:(Class)a3 withName:(id)a4
{
  void *v6;
  void *v7;

  NSStringFromClass(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSDescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)appendUInt64:(unint64_t)a3 withName:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__BSDescriptionBuilder_appendUInt64_withName___block_invoke;
  v5[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
  v5[4] = a3;
  -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)appendCustomFormatWithName:(id)a3 block:(id)a4
{
  id v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__BSDescriptionBuilder_appendCustomFormatWithName_block___block_invoke;
  v5[3] = &unk_1E1EBE678;
  v5[4] = a4;
  v4 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a3, (uint64_t)v5);
}

- (id)appendObjectsAndNames:(id *)a3 args:
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id *v8;
  id v9;
  id v10;

  if (a1)
  {
    v4 = a2;
    if (v4)
    {
      v5 = v4;
      do
      {
        v6 = *a3;
        v7 = (id)objc_msgSend(a1, "appendObject:withName:", v5, v6);
        v8 = a3 + 1;
        a3 += 2;
        v9 = *v8;

        v5 = v9;
      }
      while (v9);
    }
    v10 = a1;
  }
  return a1;
}

- (id)style
{
  if (self->_useDebugDescription)
    +[BSDescriptionStyle debugStyle](BSDescriptionStyle, "debugStyle");
  else
    _BSDefaultDescriptionStyle();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasSuccinctStyle
{
  return 0;
}

- (BOOL)hasDebugStyle
{
  return self->_useDebugDescription;
}

- (void)appendCustomFormatWithNameFromObjectDescription:(id)a3 block:(id)a4
{
  void *v6;
  id v7;
  _QWORD v8[5];

  objc_msgSend((id)objc_opt_class(), "succinctDescriptionForObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__BSDescriptionBuilder_appendCustomFormatWithNameFromObjectDescription_block___block_invoke;
  v8[3] = &unk_1E1EBE678;
  v8[4] = a4;
  v7 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, v6, (uint64_t)v8);

}

uint64_t __78__BSDescriptionBuilder_appendCustomFormatWithNameFromObjectDescription_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)appendProem:(id)a3 block:(id)a4
{
  id v4;

  v4 = -[BSDescriptionBuilder modifyProem:](self, "modifyProem:", a4);
}

- (id)appendFlag:(int64_t)a3 withName:(id)a4
{
  return -[BSDescriptionBuilder appendFlag:withName:skipIfNotSet:](self, "appendFlag:withName:skipIfNotSet:", a3, a4, 0);
}

- (id)appendFlag:(int64_t)a3 withName:(id)a4 skipIfNotSet:(BOOL)a5
{
  void *v7;
  id v8;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL || !a5)
  {
    BSSettingFlagDescription(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[BSDescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v7, a4);

  }
  return self;
}

- (id)appendInt64:(int64_t)a3 withName:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__BSDescriptionBuilder_appendInt64_withName___block_invoke;
  v5[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
  v5[4] = a3;
  -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __45__BSDescriptionBuilder_appendInt64_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("%lld"), *(_QWORD *)(a1 + 32));
}

- (id)appendUInt64:(unint64_t)a3 withName:(id)a4 format:(int64_t)a5
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__BSDescriptionBuilder_appendUInt64_withName_format___block_invoke;
  v6[3] = &__block_descriptor_48_e25_v16__0__NSMutableString_8l;
  v6[4] = a5;
  v6[5] = a3;
  -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __53__BSDescriptionBuilder_appendUInt64_withName_format___block_invoke(uint64_t a1, void *a2)
{
  const __CFString *v2;

  if (*(_QWORD *)(a1 + 32) == 1)
    v2 = CFSTR("0x%llX");
  else
    v2 = CFSTR("%llu");
  return objc_msgSend(a2, "appendFormat:", v2, *(_QWORD *)(a1 + 40));
}

uint64_t __67__BSDescriptionBuilder_appendTimeInterval_withName_decomposeUnits___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_5, "setUnitsStyle:", 1);
}

- (id)appendSelector:(SEL)a3 withName:(id)a4
{
  void *v6;
  id v7;

  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BSDescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v6, a4);

  return self;
}

- (id)appendCString:(const char *)a3 withName:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__BSDescriptionBuilder_appendCString_withName___block_invoke;
  v5[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
  v5[4] = a3;
  -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __47__BSDescriptionBuilder_appendCString_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("%s"), *(_QWORD *)(a1 + 32));
}

- (id)appendQueue:(id)a3 withName:(id)a4
{
  return -[BSDescriptionBuilder appendCString:withName:](self, "appendCString:withName:", dispatch_queue_get_label((dispatch_queue_t)a3), a4);
}

- (id)appendVersionedPID:(int64_t)a3 withName:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__BSDescriptionBuilder_appendVersionedPID_withName___block_invoke;
  v5[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
  v5[4] = a3;
  -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __52__BSDescriptionBuilder_appendVersionedPID_withName___block_invoke(uint64_t a1, void *a2)
{
  BSAppendVersionedPIDToStringAppendTarget(*(_QWORD *)(a1 + 32), a2);
}

- (id)appendObjectsAndNames:(id)a3
{
  id v4;

  return -[BSDescriptionBuilder appendObjectsAndNames:args:](self, a3, &v4);
}

- (id)appendKey:(id)a3
{
  -[BSDescriptionBuilder tryAppendKey:]((id *)&self->super.isa, (uint64_t)a3);
  return self;
}

- (void)tryAppendKey:(id *)a1
{
  id v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1[1], "valueForKey:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(a1, "appendObject:withName:");

  }
}

- (id)appendKeys:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        -[BSDescriptionBuilder tryAppendKey:]((id *)&self->super.isa, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return self;
}

- (void)appendCollectionSection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5
{
  id v8;

  -[BSDescriptionBuilder activeMultilinePrefix](self, "activeMultilinePrefix");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[BSDescriptionBuilder appendCollectionSection:withName:multilinePrefix:skipIfEmpty:](self, "appendCollectionSection:withName:multilinePrefix:skipIfEmpty:", a3, a4);

}

- (void)appendCollectionSection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5 objectTransformer:(id)a6
{
  id v9;

  -[BSDescriptionBuilder activeMultilinePrefix](self, "activeMultilinePrefix");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[BSDescriptionBuilder appendCollectionSection:withName:multilinePrefix:skipIfEmpty:objectTransformer:](self, "appendCollectionSection:withName:multilinePrefix:skipIfEmpty:objectTransformer:", a3, a4);

}

- (void)appendCollectionSection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6 objectTransformer:(id)a7
{
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a7)
  {
    v18 = a6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = a3;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v13);
          (*((void (**)(id, _QWORD))a7 + 2))(a7, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v12, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    -[BSDescriptionBuilder appendCollectionSection:withName:multilinePrefix:skipIfEmpty:](self, "appendCollectionSection:withName:multilinePrefix:skipIfEmpty:", v12, a4, a5, v18);
  }
  else
  {
    -[BSDescriptionBuilder appendCollectionSection:withName:multilinePrefix:skipIfEmpty:](self, "appendCollectionSection:withName:multilinePrefix:skipIfEmpty:", a3, a4, a5, a6);
  }
}

- (void)appendCollectionSection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6
{
  id v11;
  _QWORD v12[6];

  if (objc_msgSend(a3, "count"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__BSDescriptionBuilder_appendCollectionSection_withName_multilinePrefix_skipIfEmpty___block_invoke;
    v12[3] = &unk_1E1EBE700;
    v12[4] = a3;
    v12[5] = self;
    -[BSDescriptionBuilder appendBodySectionWithName:multilinePrefix:block:](self, "appendBodySectionWithName:multilinePrefix:block:", a4, a5, v12);
  }
  else if (a4)
  {
    if (!a6)
      v11 = -[BSDescriptionBuilder appendObject:withName:](self, "appendObject:withName:", CFSTR("(empty)"), a4);
  }
}

void __85__BSDescriptionBuilder_appendCollectionSection_withName_multilinePrefix_skipIfEmpty___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5++), 0, (_QWORD)v7);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (id)appendString:(id)a3
{
  uint64_t v5;
  id v6;

  if (a3)
  {
    v5 = 24;
    if (!self->_activeComponent)
      v5 = 16;
    v6 = *(id *)((char *)&self->super.isa + v5);
    objc_msgSend(v6, "appendString:", a3);

  }
  return self;
}

- (id)appendFormat:(id)a3
{
  id v3;
  void *v5;
  uint64_t v7;

  v3 = a3;
  if (a3)
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a3, &v7);
  -[BSDescriptionBuilder appendString:](self, "appendString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)activeComponent
{
  return self->_activeComponent;
}

- (void)setActiveComponent:(int)a3
{
  self->_activeComponent = a3;
}

- (BOOL)useDebugDescription
{
  return self->_useDebugDescription;
}

@end
