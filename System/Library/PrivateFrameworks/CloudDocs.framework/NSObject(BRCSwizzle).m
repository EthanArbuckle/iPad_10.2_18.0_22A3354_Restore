@implementation NSObject(BRCSwizzle)

+ (BOOL)brc_swizzleInstanceMethod:()BRCSwizzle with:
{
  objc_method *InstanceMethod;
  objc_method *v8;
  objc_method *v9;
  void (*Implementation)(void);
  const char *TypeEncoding;
  void (*v12)(void);
  const char *v13;
  void *v14;
  NSObject *v15;

  InstanceMethod = class_getInstanceMethod(a1, name);
  v8 = class_getInstanceMethod(a1, a4);
  if (InstanceMethod && (v9 = v8) != 0)
  {
    Implementation = method_getImplementation(v8);
    TypeEncoding = method_getTypeEncoding(v9);
    if (class_addMethod(a1, name, Implementation, TypeEncoding))
    {
      v12 = method_getImplementation(v9);
      v13 = method_getTypeEncoding(v9);
      class_replaceMethod(a1, name, v12, v13);
    }
    else
    {
      method_exchangeImplementations(v9, InstanceMethod);
    }
    return v9 == class_getInstanceMethod(a1, name);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"+[NSObject(BRCSwizzle) brc_swizzleInstanceMethod:with:]", 22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      +[NSObject(BRCSwizzle) brc_swizzleInstanceMethod:with:].cold.1();

    return 0;
  }
}

+ (BOOL)brc_swizzleClassMethod:()BRCSwizzle with:
{
  objc_method *ClassMethod;
  objc_method *v8;
  Class Class;
  objc_class *v10;
  void (*Implementation)(void);
  const char *TypeEncoding;
  void (*v13)(void);
  const char *v14;
  void *v15;
  NSObject *v16;

  ClassMethod = class_getClassMethod(a1, name);
  v8 = class_getClassMethod(a1, a4);
  Class = object_getClass(a1);
  if (ClassMethod && v8)
  {
    v10 = Class;
    Implementation = method_getImplementation(v8);
    TypeEncoding = method_getTypeEncoding(v8);
    if (class_addMethod(v10, name, Implementation, TypeEncoding))
    {
      v13 = method_getImplementation(v8);
      v14 = method_getTypeEncoding(v8);
      class_replaceMethod(v10, name, v13, v14);
    }
    else
    {
      method_exchangeImplementations(v8, ClassMethod);
    }
    return v8 == class_getClassMethod(v10, name);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"+[NSObject(BRCSwizzle) brc_swizzleClassMethod:with:]", 41);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      +[NSObject(BRCSwizzle) brc_swizzleInstanceMethod:with:].cold.1();

    return 0;
  }
}

+ (BOOL)brc_swizzleInstanceMethod:()BRCSwizzle with:newSel:
{
  objc_method *InstanceMethod;
  objc_method *v10;
  objc_method *v11;
  void (*Implementation)(void);
  const char *TypeEncoding;
  void (*v14)(void);
  const char *v15;
  void *v16;
  NSObject *v17;

  InstanceMethod = class_getInstanceMethod(a1, name);
  v10 = class_getInstanceMethod(a4, a5);
  if (InstanceMethod && (v11 = v10) != 0)
  {
    Implementation = method_getImplementation(v10);
    TypeEncoding = method_getTypeEncoding(v11);
    if (class_addMethod(a1, name, Implementation, TypeEncoding))
    {
      v14 = method_getImplementation(v11);
      v15 = method_getTypeEncoding(v11);
      class_replaceMethod(a1, name, v14, v15);
    }
    else
    {
      method_exchangeImplementations(v11, InstanceMethod);
    }
    return v11 == class_getInstanceMethod(a1, name);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"+[NSObject(BRCSwizzle) brc_swizzleInstanceMethod:with:newSel:]", 59);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      +[NSObject(BRCSwizzle) brc_swizzleInstanceMethod:with:].cold.1();

    return 0;
  }
}

+ (BOOL)brc_swizzleClassMethod:()BRCSwizzle with:newSel:
{
  objc_method *ClassMethod;
  objc_method *v10;
  Class Class;
  objc_class *v12;
  void (*Implementation)(void);
  const char *TypeEncoding;
  void (*v15)(void);
  const char *v16;
  void *v17;
  NSObject *v18;

  ClassMethod = class_getClassMethod(a1, name);
  v10 = class_getClassMethod(a4, a5);
  Class = object_getClass(a1);
  if (ClassMethod && v10)
  {
    v12 = Class;
    Implementation = method_getImplementation(v10);
    TypeEncoding = method_getTypeEncoding(v10);
    if (class_addMethod(v12, name, Implementation, TypeEncoding))
    {
      v15 = method_getImplementation(v10);
      v16 = method_getTypeEncoding(v10);
      class_replaceMethod(v12, name, v15, v16);
    }
    else
    {
      method_exchangeImplementations(v10, ClassMethod);
    }
    return v10 == class_getClassMethod(v12, name);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"+[NSObject(BRCSwizzle) brc_swizzleClassMethod:with:newSel:]", 78);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      +[NSObject(BRCSwizzle) brc_swizzleInstanceMethod:with:].cold.1();

    return 0;
  }
}

+ (uint64_t)brc_swizzleInstanceMethod:()BRCSwizzle with:newSel:usingBlock:
{
  void (**v10)(_QWORD);

  v10 = a6;
  objc_msgSend(a1, "brc_swizzleInstanceMethod:with:newSel:", a3, a4, a5);
  v10[2](v10);

  return objc_msgSend(a1, "brc_swizzleInstanceMethod:with:newSel:", a5, a4, a3);
}

+ (uint64_t)brc_swizzleClassMethod:()BRCSwizzle with:newSel:usingBlock:
{
  void (**v10)(_QWORD);

  v10 = a6;
  objc_msgSend(a1, "brc_swizzleClassMethod:with:newSel:", a3, a4, a5);
  v10[2](v10);

  return objc_msgSend(a1, "brc_swizzleClassMethod:with:newSel:", a5, a4, a3);
}

+ (void)brc_swizzleInstanceMethod:()BRCSwizzle with:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] API MISUSE: one of the selectors has no implementation%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
