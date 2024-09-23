@implementation FCDescription

- (id)descriptionString
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  const char *v25;
  unint64_t v26;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!self->_fields)
    goto LABEL_5;
  v3 = atomic_load(&FCDescriptionDepth);
  if (v3 >= 5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[NSObject shortDescription](self->_object, "shortDescription");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v5 = (void *)v4;
      goto LABEL_31;
    }
LABEL_5:
    -[FCDescription p_header](self, "p_header");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v6 = (void *)MEMORY[0x1E0CB37A0];
  -[FCDescription p_header](self, "p_header");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ {"), v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = self->_fieldOrder;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v9)
  {
    v10 = v9;
    v28 = v5;
    v11 = 0;
    v12 = 0;
    v13 = &stru_1E464BC40;
    v14 = *(_QWORD *)v34;
    v30 = *(_QWORD *)v34;
    do
    {
      v15 = 0;
      v29 = v12;
      v16 = v12 + 1;
      v17 = v13;
      v31 = v16;
      do
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v8);
        if ((unint64_t)(v16 + v15) > 0x63)
        {
          ++v11;
        }
        else
        {
          v18 = v10;
          v19 = v11;
          v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v15);
          -[NSMutableDictionary objectForKey:](self->_fields, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v21, "mutableCopy");

          v23 = v20;
          objc_msgSend(v22, "indentBy:", self->_fieldNameWidth);
          if (-[__CFString hasPrefix:](v23, "hasPrefix:", CFSTR("$$$")))
          {

            v23 = &stru_1E464BC40;
          }
          objc_msgSend(v22, "replaceCharactersInRange:withString:", 0, -[__CFString length](v23, "length"), v23);
          objc_msgSend(v32, "appendFormat:", CFSTR("%@%@"), v17, v22);

          v11 = v19;
          v10 = v18;
          v14 = v30;
          v16 = v31;
        }
        v24 = CFSTR("\n");
        if (self->_commaSeparated)
          v24 = CFSTR(",\n");
        v13 = v24;

        ++v15;
        v17 = v13;
      }
      while (v10 != v15);
      v12 = v10 + v29;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v10);

    if (v11)
    {
      v25 = "";
      if (v11 != 1)
        v25 = "s";
      objc_msgSend(v32, "appendFormat:", CFSTR("%@...omitting %lu field%s (set to truncate after %lu field%s)"), v13, v11, v25, 99, "s");
    }
    v5 = v28;
  }
  else
  {

    v13 = &stru_1E464BC40;
  }
  while ((objc_msgSend(v32, "hasSuffix:", CFSTR("\n")) & 1) != 0
       || objc_msgSend(v32, "hasSuffix:", CFSTR(" ")))
    objc_msgSend(v32, "deleteCharactersInRange:", objc_msgSend(v32, "length") - 1, 1);
  objc_msgSend(v32, "indentBy:", 2);
  objc_msgSend(v5, "appendFormat:", CFSTR("\n%@\n}"), v32);

  do
LABEL_31:
    v26 = __ldaxr(&FCDescriptionDepth);
  while (__stlxr(v26 - 1, &FCDescriptionDepth));
  return v5;
}

- (id)p_header
{
  __CFString *v3;
  void *cfType;
  CFTypeID v5;
  CFStringRef v6;

  if (self->_object)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%s*)%p%@"), class_getName(self->_class), self->_object, self->_header);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    cfType = self->_cfType;
    if (cfType)
    {
      v5 = CFGetTypeID(cfType);
      v6 = CFCopyTypeIDDescription(v5);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@Ref)%p%@"), v6, self->_cfType, self->_header);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFRelease(v6);
    }
    else
    {
      v3 = CFSTR("(void*)nil");
    }
  }
  return v3;
}

- (void)addField:(id)a3 target:(id)a4
{
  -[FCDescription addField:format:](self, "addField:format:", a3, CFSTR("%@"), a4);
}

- (void)addField:(id)a3 format:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithFormat:arguments:", v7, &v10);

  -[FCDescription addField:value:](self, "addField:value:", v8, v9);
}

- (void)addField:(id)a3 value:(id)a4
{
  id v6;
  __CFString *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *fields;
  NSMutableArray *v10;
  NSMutableArray *fieldOrder;
  unint64_t v12;
  id v13;

  v6 = a3;
  v7 = (__CFString *)a4;
  if (!self->_fields)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fields = self->_fields;
    self->_fields = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    fieldOrder = self->_fieldOrder;
    self->_fieldOrder = v10;

  }
  if (!v7)
    v7 = CFSTR("nil");
  if (v6 && objc_msgSend(v6, "length"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), v6);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("$$$%lu"), -[NSMutableDictionary count](self->_fields, "count"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_fieldOrder, "addObject:", v13);
  -[NSMutableDictionary setObject:forKey:](self->_fields, "setObject:forKey:", v7, v13);
  if ((objc_msgSend(v13, "hasPrefix:", CFSTR("$$$")) & 1) == 0)
  {
    v12 = objc_msgSend(v13, "length");
    if (v12 > self->_fieldNameWidth)
      self->_fieldNameWidth = v12;
  }

}

+ (id)descriptionWithObject:(id)a3 format:(id)a4
{
  id v5;
  id v6;
  FCDescription *v7;
  uint64_t v9;

  v5 = a4;
  v6 = a3;
  v7 = -[FCDescription initWithObject:class:format:arguments:]([FCDescription alloc], "initWithObject:class:format:arguments:", v6, object_getClass(v6), v5, &v9);

  return v7;
}

- (FCDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5 arguments:(char *)a6
{
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  FCDescription *v14;

  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, a6);

  v14 = -[FCDescription initWithObject:class:header:](self, "initWithObject:class:header:", v12, a4, v13);
  return v14;
}

- (FCDescription)initWithObject:(id)a3 class:(Class)a4 header:(id)a5
{
  id v9;
  id v10;
  unint64_t v11;
  FCDescription *v12;
  FCDescription *v13;
  uint64_t v14;
  NSString *header;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  do
    v11 = __ldaxr(&FCDescriptionDepth);
  while (__stlxr(v11 + 1, &FCDescriptionDepth));
  v17.receiver = self;
  v17.super_class = (Class)FCDescription;
  v12 = -[FCDescription init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_object, a3);
    v13->_class = a4;
    v14 = objc_msgSend(v10, "copy");
    header = v13->_header;
    v13->_header = (NSString *)v14;

  }
  return v13;
}

+ (id)descriptionWithObject:(id)a3
{
  return (id)objc_msgSend(a1, "descriptionWithObject:format:", a3, &stru_1E464BC40);
}

- (FCDescription)initWithObject:(id)a3
{
  id v4;
  FCDescription *v5;

  v4 = a3;
  v5 = -[FCDescription initWithObject:class:format:](self, "initWithObject:class:format:", v4, object_getClass(v4), &stru_1E464BC40);

  return v5;
}

- (FCDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5
{
  uint64_t v6;

  return -[FCDescription initWithObject:class:format:arguments:](self, "initWithObject:class:format:arguments:", a3, a4, a5, &v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldOrder, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_object, 0);
}

- (FCDescription)initWithCFType:(void *)a3 header:(id)a4
{
  id v6;
  unint64_t v7;
  FCDescription *v8;
  FCDescription *v9;
  uint64_t v10;
  NSString *header;
  objc_super v13;

  v6 = a4;
  do
    v7 = __ldaxr(&FCDescriptionDepth);
  while (__stlxr(v7 + 1, &FCDescriptionDepth));
  v13.receiver = self;
  v13.super_class = (Class)FCDescription;
  v8 = -[FCDescription init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_cfType = a3;
    v10 = objc_msgSend(v6, "copy");
    header = v9->_header;
    v9->_header = (NSString *)v10;

  }
  return v9;
}

- (FCDescription)initWithObject:(id)a3 format:(id)a4
{
  id v6;
  id v7;
  FCDescription *v8;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  v8 = -[FCDescription initWithObject:class:format:arguments:](self, "initWithObject:class:format:arguments:", v7, object_getClass(v7), v6, &v10);

  return v8;
}

+ (id)descriptionWithObject:(id)a3 class:(Class)a4 format:(id)a5
{
  id v7;
  id v8;
  FCDescription *v9;
  uint64_t v11;

  v7 = a5;
  v8 = a3;
  v9 = -[FCDescription initWithObject:class:format:arguments:]([FCDescription alloc], "initWithObject:class:format:arguments:", v8, a4, v7, &v11);

  return v9;
}

+ (id)descriptionWithObject:(id)a3 class:(Class)a4
{
  id v5;
  FCDescription *v6;

  v5 = a3;
  v6 = -[FCDescription initWithObject:class:format:]([FCDescription alloc], "initWithObject:class:format:", v5, a4, &stru_1E464BC40);

  return v6;
}

+ (id)descriptionWithCFType:(void *)a3 format:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  FCDescription *v8;
  uint64_t v10;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:arguments:", v6, &v10);

  v8 = -[FCDescription initWithCFType:header:]([FCDescription alloc], "initWithCFType:header:", a3, v7);
  return v8;
}

- (void)addFieldWithFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[FCDescription addField:value:](self, "addField:value:", 0, v6);
}

- (void)addFieldValue:(id)a3
{
  -[FCDescription addFieldWithFormat:](self, "addFieldWithFormat:", CFSTR("%@"), a3);
}

- (void)addSuperDescription
{
  objc_class *v3;
  NSObject *object;
  void *v5;
  objc_super v6;

  object = self->_object;
  v3 = self->_class;
  v6.receiver = object;
  v6.super_class = class_getSuperclass(v3);
  -[FCDescription description](&v6, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addFieldValue:](self, "addFieldValue:", v5, v6.receiver);

}

- (void)setFieldOptionCommaSeparated
{
  self->_commaSeparated = 1;
}

@end
