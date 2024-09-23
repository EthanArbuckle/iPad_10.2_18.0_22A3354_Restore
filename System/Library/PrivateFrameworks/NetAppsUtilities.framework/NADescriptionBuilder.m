@implementation NADescriptionBuilder

id __98__NADescriptionBuilder_appendArraySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", a2, 0);
}

- (id)appendBool:(BOOL)a3 withName:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NADescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v6, v5);

  return self;
}

- (id)appendObject:(id)a3 withName:(id)a4
{
  return -[NADescriptionBuilder appendObject:withName:skipIfNil:](self, "appendObject:withName:skipIfNil:", a3, a4, 0);
}

+ (id)builderWithObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x1B5E0F5D4]();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:", v4);
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (NADescriptionBuilder)initWithObject:(id)a3
{
  id v4;
  NADescriptionBuilder *v5;
  NADescriptionBuilder *v6;
  NSMutableString *v7;
  NSMutableString *description;
  uint64_t v9;
  NSMutableString *proem;
  id WeakRetained;
  NSMutableString *v12;
  id v13;
  objc_class *v14;
  void *v15;
  id v16;
  NADescriptionBuilder *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NADescriptionBuilder;
  v5 = -[NADescriptionBuilder init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_object, v4);
    v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    description = v6->_description;
    v6->_description = v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("<"));
    proem = v6->_proem;
    v6->_proem = (NSMutableString *)v9;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_object);
    if (WeakRetained)
    {
      v12 = v6->_proem;
      v13 = objc_loadWeakRetained((id *)&v6->_object);
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_loadWeakRetained((id *)&v6->_object);
      -[NSMutableString appendFormat:](v12, "appendFormat:", CFSTR("%@: %p"), v15, v16);

    }
    v6->_activeComponent = 0;
    v17 = v6;
  }

  return v6;
}

- (id)appendObject:(id)a3 withName:(id)a4 skipIfNil:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *activePrefix;
  void *v14;
  __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;

  v8 = a3;
  v9 = a4;
  if (v8 || !a5)
  {
    v10 = (void *)MEMORY[0x1B5E0F5D4]();
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EEECE718))
    {
      if (self->_useDebugDescription)
        objc_msgSend(v8, "debugDescription");
      else
        objc_msgSend(v8, "description");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v8);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
    if (self->_activeComponent == 1)
    {
      activePrefix = (const __CFString *)self->_activePrefix;
      if (!activePrefix)
        activePrefix = &stru_1E6228C10;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), activePrefix);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR(" = ");
      v16 = CFSTR(";\n");
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "componentSeparator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "nameObjectSeparator");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v16 = &stru_1E6228C10;
    }
    v17 = objc_msgSend(v9, "length");
    -[NADescriptionBuilder _activeComponentString](self, "_activeComponentString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
      objc_msgSend(v18, "appendFormat:", CFSTR("%@%@%@%@%@"), v14, v9, v15, v12, v16);
    else
      objc_msgSend(v18, "appendFormat:", CFSTR("%@%@%@"), v14, v12, v16, v21, v22);

    objc_autoreleasePoolPop(v10);
  }

  return self;
}

- (id)_activeComponentString
{
  uint64_t v2;

  v2 = 24;
  if (!self->_activeComponent)
    v2 = 16;
  return *(id *)((char *)&self->super.isa + v2);
}

+ (NSString)nameObjectSeparator
{
  return (NSString *)CFSTR(": ");
}

+ (NSString)componentSeparator
{
  return (NSString *)CFSTR("; ");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePrefix, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_proem, 0);
  objc_destroyWeak((id *)&self->_object);
}

- (void)appendArraySection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[NADescriptionBuilder activeMultilinePrefix](self, "activeMultilinePrefix");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NADescriptionBuilder appendArraySection:withName:multilinePrefix:skipIfEmpty:](self, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v9, v8, v10, v5);

}

- (void)appendArraySection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5 objectTransformer:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[NADescriptionBuilder activeMultilinePrefix](self, "activeMultilinePrefix");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[NADescriptionBuilder appendArraySection:withName:multilinePrefix:skipIfEmpty:objectTransformer:](self, "appendArraySection:withName:multilinePrefix:skipIfEmpty:objectTransformer:", v12, v11, v13, v6, v10);

}

- (NSString)activeMultilinePrefix
{
  if (self->_activePrefix)
    return self->_activePrefix;
  else
    return (NSString *)&stru_1E6228C10;
}

- (void)appendArraySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6 objectTransformer:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  NADescriptionBuilder *v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)MEMORY[0x1B5E0F5D4]();
  v17 = MEMORY[0x1E0C809B0];
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    v25[1] = 3221225472;
    v25[2] = __98__NADescriptionBuilder_appendArraySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke;
    v25[3] = &unk_1E62281F0;
    v27 = v15;
    v19 = v18;
    v26 = v19;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v25);
    v20 = v19;

    v12 = v20;
  }
  if (!v8 || objc_msgSend(v12, "count"))
  {
    if (objc_msgSend(v12, "count"))
    {
      v22[0] = v17;
      v22[1] = 3221225472;
      v22[2] = __98__NADescriptionBuilder_appendArraySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke_2;
      v22[3] = &unk_1E6227C70;
      v23 = v12;
      v24 = self;
      -[NADescriptionBuilder appendBodySectionWithName:multilinePrefix:block:](self, "appendBodySectionWithName:multilinePrefix:block:", v13, v14, v22);

    }
    else if (v13)
    {
      v21 = -[NADescriptionBuilder appendObject:withName:](self, "appendObject:withName:", CFSTR("(empty)"), v13);
    }
  }
  objc_autoreleasePoolPop(v16);

}

- (void)appendBodySectionWithName:(id)a3 multilinePrefix:(id)a4 block:(id)a5
{
  void (**v8)(_QWORD);
  int activeComponent;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  NSMutableString *description;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = (void (**)(_QWORD))a5;
  activeComponent = self->_activeComponent;
  self->_activeComponent = 1;
  v10 = &stru_1E6228C10;
  if (a4)
    v10 = (__CFString *)a4;
  v11 = v10;
  v12 = v11;
  if (v17)
    -[NSMutableString appendFormat:](self->_description, "appendFormat:", CFSTR("%@%@ = "), v11, v17);
  -[NSMutableString appendString:](self->_description, "appendString:", CFSTR("{"));
  description = self->_description;
  if (v8)
  {
    v14 = (void *)MEMORY[0x1B5E0F5D4](-[NSMutableString appendString:](description, "appendString:", CFSTR("\n")));
    v15 = (void *)-[NSString copy](self->_activePrefix, "copy");
    -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", CFSTR("    "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NADescriptionBuilder setActiveMultilinePrefix:](self, "setActiveMultilinePrefix:", v16);

    v8[2](v8);
    -[NADescriptionBuilder setActiveMultilinePrefix:](self, "setActiveMultilinePrefix:", v15);

    objc_autoreleasePoolPop(v14);
    -[NSMutableString appendFormat:](self->_description, "appendFormat:", CFSTR("%@}\n"), v12);
  }
  else
  {
    -[NSMutableString appendString:](description, "appendString:", CFSTR(" }\n"));
  }
  self->_activeComponent = activeComponent;

}

- (void)setActiveMultilinePrefix:(id)a3
{
  objc_storeStrong((id *)&self->_activePrefix, a3);
}

uint64_t __98__NADescriptionBuilder_appendArraySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __98__NADescriptionBuilder_appendArraySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke_3;
  v3[3] = &unk_1E62288C0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v3);
}

- (void)appendArraySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6
{
  -[NADescriptionBuilder appendArraySection:withName:multilinePrefix:skipIfEmpty:objectTransformer:](self, "appendArraySection:withName:multilinePrefix:skipIfEmpty:objectTransformer:", a3, a4, a5, a6, 0);
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

+ (id)descriptionForObject:(id)a3
{
  return (id)objc_msgSend(a1, "descriptionForObject:withObjectsAndNames:", a3, 0);
}

+ (id)descriptionForObject:(id)a3 withObjectsAndNames:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  __CFString *v10;
  void *v11;
  objc_class *v12;
  uint64_t v14;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      +[NADescriptionBuilder builderWithObject:](NADescriptionBuilder, "builderWithObject:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v8, "appendObjectsAndNames:args:", v7, &v14);
      objc_msgSend(v8, "build");
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v5);
    }
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("(null)");
  }

  return v10;
}

+ (id)succinctDescriptionForObject:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "description");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "descriptionForObject:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)appendSuper
{
  NADescriptionBuilder *v2;
  NSObject **p_object;
  id WeakRetained;
  id v5;
  objc_class *Class;
  int v7;
  Method *v8;
  Method *v9;
  unint64_t v10;
  IMP Implementation;
  char v12;
  objc_method *v13;
  char *Name;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  NADescriptionBuilder *v29;
  unsigned int outCount;

  v2 = self;
  p_object = &self->_object;
  WeakRetained = objc_loadWeakRetained((id *)&self->_object);

  if (WeakRetained)
  {
    v29 = v2;
    v5 = objc_loadWeakRetained((id *)p_object);
    Class = object_getClass(v5);

    if (!Class)
    {
LABEL_18:
      v2 = v29;
      v16 = -[NADescriptionBuilder appendObject:withName:](v29, "appendObject:withName:", CFSTR("(super does not implement description)"), 0);
      return v2;
    }
    v7 = 0;
    while (1)
    {
      outCount = 0;
      v8 = class_copyMethodList(Class, &outCount);
      v9 = v8;
      if (outCount)
      {
        v10 = 0;
        Implementation = 0;
        do
        {
          v12 = v7;
          v13 = v9[v10];
          Name = (char *)method_getName(v13);
          v7 |= Name == sel_description;
          if (Name == sel_description && (v12 & 1) != 0)
          {
            Implementation = method_getImplementation(v13);
            v7 = 1;
          }
          ++v10;
        }
        while (Name != sel_description && v10 < outCount);
        free(v9);
        if (Implementation)
        {
          v17 = objc_loadWeakRetained((id *)p_object);
          ((void (*)(id, char *))Implementation)(v17, sel_description);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = (void *)MEMORY[0x1E0CB3940];
          v20 = objc_loadWeakRetained((id *)p_object);
          objc_msgSend(v19, "stringWithFormat:", CFSTR("%p; "), v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v18, "rangeOfString:", v21);
          v24 = v23;

          if (v22 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v2 = v29;
            v25 = -[NADescriptionBuilder appendObject:withName:](v29, "appendObject:withName:", CFSTR("(super's description format doesn't match)"), 0);
          }
          else
          {
            objc_msgSend(v18, "substringWithRange:", v22 + v24, objc_msgSend(v18, "length") + ~(v22 + v24));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v2 = v29;
            v27 = -[NADescriptionBuilder appendObject:withName:skipIfNil:](v29, "appendObject:withName:skipIfNil:", v26, 0, 1);

          }
          return v2;
        }
      }
      else
      {
        free(v8);
      }
      Class = class_getSuperclass(Class);
      if (!Class)
        goto LABEL_18;
    }
  }
  return v2;
}

- (void)appendString:(id)a3 withName:(id)a4
{
  -[NADescriptionBuilder appendString:withName:skipIfEmpty:](self, "appendString:withName:skipIfEmpty:", a3, a4, 0);
}

- (void)appendString:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a5;
  v16 = a3;
  v8 = a4;
  if (!v5)
  {
    v10 = v16;
    if (!v16)
    {
      v13 = 0;
LABEL_12:
      v16 = v13;
      v15 = -[NADescriptionBuilder appendObject:withName:skipIfNil:](self, "appendObject:withName:skipIfNil:");
      goto LABEL_13;
    }
LABEL_6:
    if (objc_msgSend(v10, "length")
      && (objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v16, "rangeOfCharacterFromSet:", v11),
          v11,
          v12 == 0x7FFFFFFFFFFFFFFFLL))
    {
      v13 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\"), v16);
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v14;
    }
    goto LABEL_12;
  }
  if (v16)
  {
    v9 = objc_msgSend(v16, "length");
    v10 = v16;
    if (!v9)
      goto LABEL_13;
    goto LABEL_6;
  }
  v16 = 0;
LABEL_13:

}

- (id)appendBool:(BOOL)a3 withName:(id)a4 ifEqualTo:(BOOL)a5
{
  id v6;

  if (a3 == a5)
    v6 = -[NADescriptionBuilder appendBool:withName:](self, "appendBool:withName:");
  return self;
}

- (id)appendInteger:(int64_t)a3 withName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NADescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v7, v6);

  return self;
}

- (id)appendUnsignedInteger:(unint64_t)a3 withName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NADescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v7, v6);

  return self;
}

- (id)appendInt:(int)a3 withName:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NADescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v7, v6);

  return self;
}

- (id)appendInt64:(int64_t)a3 withName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NADescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v7, v6);

  return self;
}

- (id)appendUnsignedInt:(unsigned int)a3 withName:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NADescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v7, v6);

  return self;
}

- (id)appendUInt64:(unint64_t)a3 withName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NADescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v7, v6);

  return self;
}

- (id)appendDouble:(double)a3 withName:(id)a4 decimalPrecision:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v12;

  v8 = a4;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&a3, v12);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.*f"), a5, *(_QWORD *)&a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NADescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v9, v8);

  return self;
}

- (id)appendTimeInterval:(double)a3 withName:(id)a4 decomposeUnits:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = a5;
  v8 = a4;
  v9 = (a3 - (double)(uint64_t)a3) * 1000.0;
  if (v5)
  {
    if (appendTimeInterval_withName_decomposeUnits__onceToken != -1)
      dispatch_once(&appendTimeInterval_withName_decomposeUnits__onceToken, &__block_literal_global_7);
    objc_msgSend((id)appendTimeInterval_withName_decomposeUnits____formatter, "stringFromTimeInterval:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (fabs(v9) >= 2.22044605e-16)
    {
      objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(" %.0fms"), *(_QWORD *)&v9);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
  }
  else
  {
    if (fabs(v9) >= 2.22044605e-16)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2fs"), *(_QWORD *)&a3);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1fs"), *(_QWORD *)&a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NADescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v11, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __67__NADescriptionBuilder_appendTimeInterval_withName_decomposeUnits___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)appendTimeInterval_withName_decomposeUnits____formatter;
  appendTimeInterval_withName_decomposeUnits____formatter = (uint64_t)v0;

  return objc_msgSend((id)appendTimeInterval_withName_decomposeUnits____formatter, "setUnitsStyle:", 1);
}

- (id)appendPointer:(void *)a3 withName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NADescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v7, v6);

  return self;
}

- (id)appendSelector:(SEL)a3 withName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  NSStringFromSelector(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NADescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v7, v6);

  return self;
}

- (id)appendCString:(const char *)a3 withName:(id)a4
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%s"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NADescriptionBuilder appendString:withName:](self, "appendString:withName:", v8, v7);

  return self;
}

- (id)appendQueue:(id)a3 withName:(id)a4
{
  return -[NADescriptionBuilder appendCString:withName:](self, "appendCString:withName:", dispatch_queue_get_label((dispatch_queue_t)a3), a4);
}

- (id)appendClass:(Class)a3 withName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  NSStringFromClass(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NADescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v7, v6);

  return self;
}

- (id)appendObjectsAndNames:(id)a3
{
  id v4;
  uint64_t v6;

  v4 = -[NADescriptionBuilder appendObjectsAndNames:args:](self, "appendObjectsAndNames:args:", a3, &v6);
  return self;
}

- (id)appendObjectsAndNames:(id)a3 args:(char *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id *v10;
  id v11;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    do
    {
      v8 = *(id *)a4;
      v9 = -[NADescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v7, v8);
      v10 = (id *)(a4 + 8);
      a4 += 16;
      v11 = *v10;

      v7 = v11;
    }
    while (v11);
  }

  return self;
}

- (id)appendKey:(id)a3
{
  id v4;

  v4 = a3;
  -[NADescriptionBuilder tryAppendKey:](self, "tryAppendKey:", v4);

  return self;
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
        -[NADescriptionBuilder tryAppendKey:](self, "tryAppendKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return self;
}

- (void)tryAppendKey:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  objc_msgSend(WeakRetained, "valueForKey:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NADescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v5, v7);
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

void __98__NADescriptionBuilder_appendArraySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v6 = v3;
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  if (v3)
  {
    v7 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
    v3 = v7;
  }

}

- (void)appendDictionarySection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[NADescriptionBuilder activeMultilinePrefix](self, "activeMultilinePrefix");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NADescriptionBuilder appendDictionarySection:withName:multilinePrefix:skipIfEmpty:](self, "appendDictionarySection:withName:multilinePrefix:skipIfEmpty:", v9, v8, v10, v5);

}

- (void)appendDictionarySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6
{
  -[NADescriptionBuilder appendDictionarySection:withName:multilinePrefix:skipIfEmpty:objectTransformer:](self, "appendDictionarySection:withName:multilinePrefix:skipIfEmpty:objectTransformer:", a3, a4, a5, a6, 0);
}

- (void)appendDictionarySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6 objectTransformer:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  NADescriptionBuilder *v24;
  BOOL v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)MEMORY[0x1B5E0F5D4]();
  v17 = MEMORY[0x1E0C809B0];
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v17;
    v26[1] = 3221225472;
    v26[2] = __103__NADescriptionBuilder_appendDictionarySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke;
    v26[3] = &unk_1E6227B80;
    v28 = v15;
    v19 = v18;
    v27 = v19;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v26);
    v20 = v19;

    v12 = v20;
  }
  if (!v8 || objc_msgSend(v12, "count"))
  {
    if (objc_msgSend(v12, "count"))
    {
      v22[0] = v17;
      v22[1] = 3221225472;
      v22[2] = __103__NADescriptionBuilder_appendDictionarySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke_2;
      v22[3] = &unk_1E6228910;
      v23 = v12;
      v24 = self;
      v25 = v8;
      -[NADescriptionBuilder appendBodySectionWithName:multilinePrefix:block:](self, "appendBodySectionWithName:multilinePrefix:block:", v13, v14, v22);

    }
    else if (v13)
    {
      v21 = -[NADescriptionBuilder appendObject:withName:](self, "appendObject:withName:", CFSTR("(empty)"), v13);
    }
  }
  objc_autoreleasePoolPop(v16);

}

void __103__NADescriptionBuilder_appendDictionarySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v8);

}

uint64_t __103__NADescriptionBuilder_appendDictionarySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  char v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __103__NADescriptionBuilder_appendDictionarySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke_3;
  v3[3] = &unk_1E62288E8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 48);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __103__NADescriptionBuilder_appendDictionarySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v5 = a2;
  objc_msgSend((id)objc_opt_class(), "succinctDescriptionForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isNSDictionary"))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", v10, v6, *(unsigned __int8 *)(a1 + 40));
  }
  else
  {
    v7 = objc_msgSend(v10, "isNSArray");
    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "appendArraySection:withName:skipIfEmpty:", v10, v6, *(unsigned __int8 *)(a1 + 40));
    else
      v9 = (id)objc_msgSend(v8, "appendObject:withName:", v10, v6);
  }

}

- (id)appendString:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    -[NADescriptionBuilder _activeComponentString](self, "_activeComponentString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v4);

  }
  return self;
}

- (id)appendFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB3940];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v9);

  }
  else
  {
    v6 = 0;
  }
  -[NADescriptionBuilder appendString:](self, "appendString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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

- (void)setUseDebugDescription:(BOOL)a3
{
  self->_useDebugDescription = a3;
}

- (void)appendKey:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    OUTLINED_FUNCTION_0(&dword_1B0CB0000, MEMORY[0x1E0C81028], v1, "Exception: %{public}@", v2, v3, v4, v5, 2u);
  objc_end_catch();
}

- (void)appendKeys:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B0CB0000, MEMORY[0x1E0C81028], a3, "Exception: %{public}@", a5, a6, a7, a8, 2u);
}

@end
