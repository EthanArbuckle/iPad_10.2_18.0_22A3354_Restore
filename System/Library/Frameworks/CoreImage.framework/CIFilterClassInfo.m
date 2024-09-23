@implementation CIFilterClassInfo

- (CIFilterClassInfo)initWithClass:(Class)a3
{
  Class v3;
  CIFilterClassInfo *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  Ivar *v9;
  Ivar *v10;
  unint64_t i;
  const char *Name;
  __CFString *v13;
  const char *TypeEncoding;
  __CFString *v15;
  __CFString *v16;
  const __CFString *v17;
  objc_property_t *v18;
  objc_property_t *v19;
  unint64_t j;
  const char *v21;
  __CFString *v22;
  objc_property *v23;
  objc_property_attribute_t *v24;
  objc_property_attribute_t *v25;
  unint64_t v26;
  const char **p_value;
  const char *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  Method *v35;
  Method *v36;
  unint64_t k;
  const char *v38;
  const char *v39;
  __CFString *v40;
  void *v41;
  int v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CIFilterClassInfo *v52;
  void *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  unsigned int outCount;
  objc_super v58;
  unsigned int v59;

  if (!a3)
  {

    return 0;
  }
  v3 = a3;
  v58.receiver = self;
  v58.super_class = (Class)CIFilterClassInfo;
  v4 = -[CIFilterClassInfo init](&v58, sel_init);
  if (!v4)
    return v4;
  v5 = objc_opt_class();
  if ((-[objc_class isSubclassOfClass:](v3, "isSubclassOfClass:", v5) & 1) == 0)
  {

    return 0;
  }
  v54 = (void *)v5;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  outCount = 0;
  v9 = class_copyIvarList(v3, &outCount);
  v55 = v3;
  v56 = v8;
  if (v9)
  {
    v10 = v9;
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        Name = ivar_getName(v10[i]);
        if (Name)
          v13 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
        else
          v13 = &stru_1E2ECD1B0;
        if ((unint64_t)-[__CFString length](v13, "length") >= 6
          && -[__CFString hasPrefix:](v13, "hasPrefix:", CFSTR("input")))
        {
          TypeEncoding = ivar_getTypeEncoding(v10[i]);
          if (TypeEncoding)
            v15 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", TypeEncoding);
          else
            v15 = &stru_1E2ECD1B0;
          v16 = classNameFromTypeEncoding(v15);
          objc_msgSend(v6, "addObject:", v13);
          if (v16)
            v17 = v16;
          else
            v17 = &stru_1E2ECD1B0;
          objc_msgSend(v7, "addObject:", v17);
          v8 = v56;
        }
      }
    }
    free(v10);
  }
  v18 = class_copyPropertyList(v3, &outCount);
  if (v18)
  {
    v19 = v18;
    v52 = v4;
    v53 = v7;
    if (outCount)
    {
      for (j = 0; j < outCount; ++j)
      {
        v21 = property_getName(v19[j]);
        if (v21)
          v22 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v21);
        else
          v22 = &stru_1E2ECD1B0;
        if ((unint64_t)-[__CFString length](v22, "length") >= 6)
        {
          if (-[__CFString hasPrefix:](v22, "hasPrefix:", CFSTR("input")))
          {
            v23 = v19[j];
            v59 = 0;
            v24 = property_copyAttributeList(v23, &v59);
            if (v24)
            {
              if (v59)
              {
                v25 = v24;
                v26 = 0;
                p_value = &v24->value;
                while (1)
                {
                  v28 = *p_value;
                  v29 = *(p_value - 1)
                      ? (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:")
                      : &stru_1E2ECD1B0;
                  if (-[__CFString isEqualToString:](v29, "isEqualToString:", CFSTR("T")))
                    break;
                  ++v26;
                  p_value += 2;
                  if (v26 >= v59)
                  {
                    free(v25);
                    goto LABEL_46;
                  }
                }
                if (v28)
                  v30 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v28);
                else
                  v30 = &stru_1E2ECD1B0;
                v31 = classNameFromTypeEncoding(v30);
                free(v25);
                if (v31)
                {
                  v32 = objc_msgSend(v6, "indexOfObject:", v22);
                  if (v32 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    objc_msgSend(v6, "addObject:", v22);
                    objc_msgSend(v53, "addObject:", v31);
                  }
                  else
                  {
                    v33 = v32;
                    if (!objc_msgSend((id)objc_msgSend(v53, "objectAtIndexedSubscript:", v32), "length"))
                      objc_msgSend(v53, "setObject:atIndexedSubscript:", v31, v33);
                  }
                }
              }
            }
          }
        }
LABEL_46:
        ;
      }
    }
    free(v19);
    v4 = v52;
    v7 = v53;
    v3 = v55;
    v8 = v56;
  }
  if (objc_msgSend(v6, "count"))
  {
    v34 = 0;
    do
      objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", v34++), "length");
    while (v34 < objc_msgSend(v6, "count"));
  }
  v35 = class_copyMethodList(v3, &outCount);
  if (v35)
  {
    v36 = v35;
    if (outCount)
    {
      for (k = 0; k < outCount; ++k)
      {
        v38 = method_getName(v36[k]);
        v39 = sel_getName(v38);
        if (v39)
          v40 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v39);
        else
          v40 = &stru_1E2ECD1B0;
        if ((unint64_t)-[__CFString length](v40, "length") >= 7
          && -[__CFString hasPrefix:](v40, "hasPrefix:", CFSTR("output")))
        {
          objc_msgSend(v8, "addObject:", v40);
        }
      }
    }
    free(v36);
    v3 = v55;
  }
  v41 = (void *)-[objc_class superclass](v3, "superclass");
  v42 = objc_msgSend(v41, "isSubclassOfClass:", v54);
  if (v41 != v54 && v42)
  {
    v43 = +[CIFilterClassInfo classInfoForClass:](CIFilterClassInfo, "classInfoForClass:", v41);
    if (objc_msgSend((id)objc_msgSend(v43, "inputKeys"), "count"))
    {
      v44 = objc_msgSend((id)objc_msgSend(v43, "inputKeys"), "count");
      if (v44)
      {
        v45 = v44 - 1;
        do
        {
          v46 = objc_msgSend((id)objc_msgSend(v43, "inputKeys"), "objectAtIndexedSubscript:", v45);
          v47 = objc_msgSend((id)objc_msgSend(v43, "inputClasses"), "objectAtIndexedSubscript:", v45);
          if ((objc_msgSend(v6, "containsObject:", v46) & 1) == 0)
          {
            objc_msgSend(v6, "insertObject:atIndex:", v46, 0);
            objc_msgSend(v7, "insertObject:atIndex:", v47, 0);
          }
          --v45;
        }
        while (v45 != -1);
      }
    }
    if (objc_msgSend((id)objc_msgSend(v43, "outputKeys"), "count"))
    {
      v48 = objc_msgSend((id)objc_msgSend(v43, "outputKeys"), "count");
      if (v48)
      {
        v49 = v48 - 1;
        do
        {
          v50 = objc_msgSend((id)objc_msgSend(v43, "outputKeys"), "objectAtIndexedSubscript:", v49);
          if ((objc_msgSend(v8, "containsObject:", v50) & 1) == 0)
            objc_msgSend(v8, "insertObject:atIndex:", v50, 0);
          --v49;
        }
        while (v49 != -1);
      }
    }
  }
  v4->inputKeys = (NSArray *)objc_msgSend(v6, "copy");
  v4->inputClasses = (NSArray *)objc_msgSend(v7, "copy");
  v4->outputKeys = (NSArray *)objc_msgSend(v8, "copy");
  return v4;
}

- (id)inputKeys
{
  return self->inputKeys;
}

- (id)inputClasses
{
  return self->inputClasses;
}

- (id)outputKeys
{
  return self->outputKeys;
}

+ (id)classInfoForClass:(Class)a3
{
  void *v5;
  objc_class *v6;
  int v7;
  id v9;
  uint64_t v10;

  v5 = (void *)objc_msgSend(a1, "cache");
  v6 = (objc_class *)objc_opt_class();
  v7 = -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", v6);
  if (v6 == a3 || v7 == 0)
    return 0;
  v10 = objc_msgSend(v5, "objectForKey:", a3);
  v9 = (id)v10;
  if (!v10)
  {
    v9 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithClass:", a3);
    objc_msgSend(v5, "setObject:forKey:", v9, a3);
  }
  return v9;
}

+ (id)cache
{
  if (+[CIFilterClassInfo cache]::onceToken != -1)
    dispatch_once(&+[CIFilterClassInfo cache]::onceToken, &__block_literal_global_700);
  return (id)+[CIFilterClassInfo cache]::cache;
}

uint64_t __26__CIFilterClassInfo_cache__block_invoke()
{
  +[CIFilterClassInfo cache]::cache = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99D38]);
  objc_msgSend((id)+[CIFilterClassInfo cache]::cache, "setName:", CFSTR("com.apple.coreimage.nscache.CIFilterClassInfo"));
  objc_msgSend((id)+[CIFilterClassInfo cache]::cache, "setCountLimit:", 256);
  return objc_msgSend((id)+[CIFilterClassInfo cache]::cache, "setEvictsObjectsWhenApplicationEntersBackground:", 1);
}

+ (void)clearCache
{
  objc_msgSend((id)objc_msgSend(a1, "cache"), "removeAllObjects");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIFilterClassInfo;
  -[CIFilterClassInfo dealloc](&v3, sel_dealloc);
}

- (CIFilterClassInfo)init
{
  return -[CIFilterClassInfo initWithClass:](self, "initWithClass:", 0);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: inputKeys=%@ inputClasses=%@ outputKeys=%@>"), objc_msgSend((id)objc_opt_class(), "description"), -[NSArray description](self->inputKeys, "description"), -[NSArray description](self->inputClasses, "description"), -[NSArray description](self->outputKeys, "description"));
}

@end
