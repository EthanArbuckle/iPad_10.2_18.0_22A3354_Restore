@implementation CNDescriptionBuilder

- (id)build
{
  -[NSMutableString appendString:](self->_description, "appendString:", CFSTR(">"));
  return (id)-[NSMutableString copy](self->_description, "copy");
}

- (id)appendName:(id)a3 object:(id)a4
{
  NSMutableString *description;
  id v7;
  id v8;
  void *v9;
  NSMutableString *v10;
  void *v11;

  description = self->_description;
  v7 = a4;
  v8 = a3;
  -[CNDescriptionBuilder separator](self, "separator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendString:](description, "appendString:", v9);

  -[NSMutableString appendString:](self->_description, "appendString:", CFSTR(" "));
  -[NSMutableString appendString:](self->_description, "appendString:", v8);

  -[NSMutableString appendString:](self->_description, "appendString:", CFSTR("="));
  v10 = self->_description;
  -[CNDescriptionBuilder appendableDescriptionOfValue:](self, "appendableDescriptionOfValue:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableString appendString:](v10, "appendString:", v11);
  -[CNDescriptionBuilder setSeparator:](self, "setSeparator:", CFSTR(","));
  return self;
}

- (void)setSeparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)separator
{
  return self->_separator;
}

- (id)appendableDescriptionOfValue:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "_cn_shortDescription");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "description");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      v4 = CFSTR("(nil)");
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_destroyWeak((id *)&self->_object);
}

+ (id)descriptionForObject:(id)a3 withNamesAndObjects:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;

  v5 = a4;
  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "appendNamesAndObjects:args:", v5, &v10);
  objc_msgSend(v6, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)appendName:(id)a3 intValue:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNDescriptionBuilder appendName:object:](self, "appendName:object:", v6, v7);

  return self;
}

- (id)appendNamesAndObjects:(id)a3
{
  id v4;
  uint64_t v6;

  v4 = -[CNDescriptionBuilder appendNamesAndObjects:args:](self, "appendNamesAndObjects:args:", a3, &v6);
  return self;
}

- (id)appendNamesAndObjects:(id)a3 args:(char *)a4
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
      v9 = -[CNDescriptionBuilder appendName:object:](self, "appendName:object:", v7, v8);
      v10 = (id *)(a4 + 8);
      a4 += 16;
      v11 = *v10;

      v7 = v11;
    }
    while (v11);
  }

  return self;
}

+ (id)descriptionBuilderWithObject:(id)a3
{
  id v3;
  CNDescriptionBuilder *v4;

  v3 = a3;
  v4 = -[CNDescriptionBuilder initWithObject:]([CNDescriptionBuilder alloc], "initWithObject:", v3);

  return v4;
}

- (CNDescriptionBuilder)initWithObject:(id)a3
{
  id v4;
  CNDescriptionBuilder *v5;
  CNDescriptionBuilder *v6;
  NSMutableString *v7;
  NSMutableString *description;
  NSMutableString *v9;
  id WeakRetained;
  uint64_t v11;
  id v12;
  NSString *separator;
  CNDescriptionBuilder *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNDescriptionBuilder;
  v5 = -[CNDescriptionBuilder init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_object, v4);
    v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    description = v6->_description;
    v6->_description = v7;

    v9 = v6->_description;
    WeakRetained = objc_loadWeakRetained((id *)&v6->_object);
    v11 = objc_opt_class();
    v12 = objc_loadWeakRetained((id *)&v6->_object);
    -[NSMutableString appendFormat:](v9, "appendFormat:", CFSTR("<%@: %p"), v11, v12);

    separator = v6->_separator;
    v6->_separator = (NSString *)CFSTR(":");

    v14 = v6;
  }

  return v6;
}

- (CNDescriptionBuilder)init
{
  id v2;

  CNInitializerUnavailableException(self, a2, sel_initWithObject_);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)appendObject:(id)a3 withName:(id)a4
{
  return -[CNDescriptionBuilder appendName:object:](self, "appendName:object:", a4, a3);
}

- (id)appendName:(id)a3 BOOLValue:(BOOL)a4
{
  const __CFString *v5;
  id v6;

  if (a4)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = -[CNDescriptionBuilder appendName:object:](self, "appendName:object:", a3, v5);
  return self;
}

- (id)appendName:(id)a3 integerValue:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNDescriptionBuilder appendName:object:](self, "appendName:object:", v6, v7);

  return self;
}

- (id)appendName:(id)a3 unsignedInteger:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNDescriptionBuilder appendName:object:](self, "appendName:object:", v6, v7);

  return self;
}

- (id)appendName:(id)a3 u_int64_t:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNDescriptionBuilder appendName:object:](self, "appendName:object:", v6, v7);

  return self;
}

- (id)appendName:(id)a3 doubleValue:(double)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNDescriptionBuilder appendName:object:](self, "appendName:object:", v6, v7);

  return self;
}

- (id)appendName:(id)a3 timeInterval:(double)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  +[CNTimeIntervalFormatter stringForTimeInterval:](CNTimeIntervalFormatter, "stringForTimeInterval:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNDescriptionBuilder appendName:object:](self, "appendName:object:", v6, v7);

  return self;
}

- (id)appendName:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  id v9;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  (*((void (**)(uint64_t, uint64_t, uint64_t))CNRangeShortDescription + 2))((uint64_t)CNRangeShortDescription, location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNDescriptionBuilder appendName:object:](self, "appendName:object:", v7, v8);

  return self;
}

- (id)appendName:(id)a3 pointerValue:(void *)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNDescriptionBuilder appendName:object:](self, "appendName:object:", v6, v7);

  return self;
}

- (id)appendName:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  NSStringFromSelector(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNDescriptionBuilder appendName:object:](self, "appendName:object:", v6, v7);

  return self;
}

- (id)appendKey:(id)a3
{
  id v4;

  v4 = a3;
  -[CNDescriptionBuilder tryAppendKey:](self, "tryAppendKey:", v4);

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
        -[CNDescriptionBuilder tryAppendKey:](self, "tryAppendKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
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

  v6 = -[CNDescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v5, v7);
}

+ (id)descriptionForBool:(BOOL)a3
{
  if (a3)
    return CFSTR("YES");
  else
    return CFSTR("NO");
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
    OUTLINED_FUNCTION_0_7(&dword_18F80C000, MEMORY[0x1E0C81028], v1, "Exception: %{public}@", v2, v3, v4, v5, 2u);
  objc_end_catch();
}

- (void)appendKeys:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_18F80C000, MEMORY[0x1E0C81028], a3, "Exception: %{public}@", a5, a6, a7, a8, 2u);
}

@end
