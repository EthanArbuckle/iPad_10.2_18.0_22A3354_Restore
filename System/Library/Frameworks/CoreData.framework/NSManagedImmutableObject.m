@implementation NSManagedImmutableObject

+ ($D3C9A6686F9B9B458AC662A88BFB61DF)_PFMOClassFactoryData
{
  return 0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_class *Class;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: null selector"), _NSMethodExceptionProem());
  Class = object_getClass(self);
  return class_respondsToSelector(Class, a3);
}

- (void)methodForSelector:(SEL)a3
{
  objc_class *Class;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: null selector"), _NSMethodExceptionProem());
  Class = object_getClass(self);
  return class_getMethodImplementation(Class, a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  Class Class;
  objc_class *v6;
  objc_class *Superclass;
  Protocol **v8;
  Protocol **v9;
  uint64_t v10;
  Protocol *v11;
  BOOL isMetaClass;
  char *types;
  objc_method_description MethodDescription;
  Protocol *v15;
  BOOL v16;
  objc_method_description v17;
  id result;
  objc_method_description *Description;
  char *v20;
  unsigned int outCount;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: null selector"), _NSMethodExceptionProem());
  Class = object_getClass(self);
  v6 = Class;
  if (Class)
  {
    Superclass = Class;
    while (1)
    {
      outCount = 0;
      v8 = class_copyProtocolList(Superclass, &outCount);
      v9 = v8;
      if (outCount)
        break;
      if (v8)
LABEL_12:
        free(v9);
      Superclass = class_getSuperclass(Superclass);
      if (!Superclass)
        goto LABEL_14;
    }
    v10 = 0;
    while (1)
    {
      v11 = v9[v10];
      isMetaClass = class_isMetaClass(Superclass);
      MethodDescription = protocol_getMethodDescription(v11, a3, 1, !isMetaClass);
      types = MethodDescription.types;
      if (MethodDescription.name)
        break;
      v15 = v9[v10];
      v16 = class_isMetaClass(Superclass);
      v17 = protocol_getMethodDescription(v15, a3, 0, !v16);
      types = v17.types;
      if (v17.name)
        break;
      if (++v10 >= (unint64_t)outCount)
        goto LABEL_12;
    }
    v20 = types;
    free(v9);
  }
  else
  {
LABEL_14:
    result = class_getInstanceMethod(v6, a3);
    if (!result)
      return result;
    Description = method_getDescription((Method)result);
    if (!Description->name)
      return 0;
    v20 = Description->types;
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", v20);
}

+ (id)allocWithEntity:(id)a3
{
  unint64_t *v5;
  unint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v5 = _PFFastEntityClass((unint64_t *)a3);
  if (v5)
  {
    v6 = v5;
    if ((*((_BYTE *)a3 + 120) & 4) == 0)
    {
      v11 = objc_msgSend(a3, "managedObjectModel");
      v12 = a3;
      if (v11)
        v12 = (id)objc_msgSend(a3, "managedObjectModel");
      objc_msgSend(v12, "_setIsEditable:", 0);
    }
    v7 = objc_msgSend(v6, "_PFMOClassFactoryData");
    if (v7)
    {
      v8 = v7;
      if (!*(_QWORD *)(v7 + 24))
      {
        v13 = *((_QWORD *)a3 + 14);
        if (v13)
          v14 = *(_QWORD *)(v13 + 8);
        else
          v14 = objc_msgSend((id)objc_msgSend(a3, "propertiesByName"), "count");
        if (v14 <= 1)
          v15 = 1;
        else
          v15 = v14;
        *(_QWORD *)(v8 + 24) = 8 * v15;
      }
    }
    v9 = (objc_class *)v6;
  }
  else
  {
    v9 = (objc_class *)a1;
  }
  return _PFAllocateObject(v9, 0);
}

+ (id)_retain_1
{
  unsigned int *v3;
  unsigned int v4;

  v3 = (unsigned int *)objc_msgSend(a1, "_PFMOClassFactoryData");
  do
    v4 = __ldxr(v3);
  while (__stxr(v4 + 1, v3));
  return a1;
}

+ (void)_release_1
{
  unsigned int *v2;
  unsigned int v3;

  v2 = (unsigned int *)objc_msgSend(a1, "_PFMOClassFactoryData");
  do
    v3 = __ldxr(v2);
  while (__stxr(v3 - 1, v2));
}

+ (BOOL)_isGeneratedClass
{
  return 0;
}

+ (BOOL)_isGeneratedClass_1
{
  return 1;
}

+ (Class)classForEntity:(id)a3
{
  _BYTE *v3;
  const char *v5;
  const char *v6;
  const char *Name;
  _DWORD *v8;
  int v9;
  Class Class;
  objc_class *v11;
  Class ClassPair;
  const char *v13;
  int v14;
  Class v15;
  objc_class *v16;
  objc_method *ClassMethod;
  void (*Implementation)(void);
  const char *TypeEncoding;
  objc_method *v20;
  void (*v21)(void);
  const char *v22;
  objc_method *v23;
  void (*v24)(void);
  const char *v25;
  objc_method *v26;
  const char *v27;
  objc_method *v28;
  const char *v29;
  objc_method *v30;
  const char *v31;
  int v32;
  malloc_zone_t *v33;
  size_t v34;
  _QWORD *v35;
  void (*ReturnPointerMethod)(void);
  malloc_zone_t *v37;
  size_t InstanceSize;
  objc_class *v39;
  _DWORD *v40;
  IMP MethodImplementation;
  IMP v42;
  objc_class *v43;
  IMP v44;
  IMP v45;
  BOOL v46;
  int v47;
  objc_class *v48;
  void (*v49)(void);
  objc_class *v50;
  objc_method *v51;
  void (*v52)(void);
  const char *v53;
  objc_class *v54;
  void (*v55)(void);
  objc_class *v56;
  IMP v57;
  IMP v58;
  objc_class *v59;
  void (*v60)(void);
  int v62;
  objc_class *v63;
  IMP v64;
  IMP v65;
  objc_class *v66;
  void (*v67)(void);
  int v69;
  int v70;
  int v71;
  unsigned int v72;
  void (*v73)(void);
  objc_ivar *InstanceVariable;
  ptrdiff_t Offset;
  unint64_t v76;
  void (*v77)(void);
  uint64_t v78;
  _BYTE *v79;
  uint64_t v81;
  const char *v82;
  void *v83;
  __CFArray *Mutable;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  const __CFString *v90;
  _BYTE *v91;
  _DWORD *v92;
  char types[10];
  char __str[512];
  uint64_t v95;

  v3 = a3;
  v95 = *MEMORY[0x1E0C80C00];
  v5 = (const char *)objc_msgSend((id)objc_msgSend(a3, "name"), "UTF8String");
  if (!v5 || (v6 = v5, !*v5))
  {
    v88 = (void *)MEMORY[0x1E0C99DA0];
    v89 = *MEMORY[0x1E0C99778];
    v90 = CFSTR("Entity name must not be nil.");
    goto LABEL_72;
  }
  if ((v3[120] & 4) == 0)
  {
    v86 = objc_msgSend(v3, "managedObjectModel");
    v87 = v3;
    if (v86)
      v87 = (void *)objc_msgSend(v3, "managedObjectModel");
    objc_msgSend(v87, "_setIsEditable:", 0);
  }
  Name = class_getName((Class)a1);
  snprintf(__str, 0x200uLL, "%s_%s_", Name, v6);
  os_unfair_lock_lock(&_MergedGlobals_83);
  v8 = 0;
  v9 = 2;
  v91 = v3;
  while (1)
  {
    Class = objc_getClass(__str);
    if (Class)
    {
      v11 = Class;
      goto LABEL_50;
    }
    while (1)
    {
      ClassPair = objc_allocateClassPair((Class)a1, __str, 0);
      if (ClassPair)
        break;
      v13 = class_getName((Class)a1);
      v14 = v9 + 1;
      snprintf(__str, 0x200uLL, "%s_%s_%x", v13, v6, v9);
      v15 = objc_getClass(__str);
      ++v9;
      if (v15)
      {
        v11 = v15;
        v9 = v14;
        goto LABEL_50;
      }
    }
    v11 = ClassPair;
    v16 = object_getClass(ClassPair);
    ClassMethod = class_getClassMethod(v11, sel__retain_1);
    Implementation = method_getImplementation(ClassMethod);
    TypeEncoding = method_getTypeEncoding(ClassMethod);
    class_addMethod(v16, sel_retain, Implementation, TypeEncoding);
    v20 = class_getClassMethod(v11, sel__release_1);
    v21 = method_getImplementation(v20);
    v22 = method_getTypeEncoding(v20);
    class_addMethod(v16, sel_release, v21, v22);
    v23 = class_getClassMethod(v11, sel__isGeneratedClass_1);
    v24 = method_getImplementation(v23);
    v25 = method_getTypeEncoding(v23);
    class_addMethod(v16, sel__isGeneratedClass, v24, v25);
    v26 = class_getClassMethod((Class)a1, sel_class);
    v27 = method_getTypeEncoding(v26);
    class_addMethod(v11, sel_class, (IMP)override_instace_class_0, v27);
    v28 = class_getClassMethod((Class)a1, sel_class);
    v29 = method_getTypeEncoding(v28);
    class_addMethod(v16, sel_class, (IMP)override_class_class_0, v29);
    v30 = class_getClassMethod((Class)a1, sel_superclass);
    v31 = method_getTypeEncoding(v30);
    class_addMethod(v16, sel_superclass, (IMP)override_class_superclass_0, v31);
    v32 = objc_msgSend((id)objc_msgSend(v3, "properties"), "count");
    v33 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v33 = malloc_default_zone();
    if (v32)
      v34 = (((v32 - 1) >> 3) & 0x1FFFFFFC) + 84;
    else
      v34 = 84;
    v35 = malloc_type_zone_calloc(v33, 1uLL, v34, 0xFB957036uLL);
    ReturnPointerMethod = generateReturnPointerMethod((uint64_t)v35);
    class_addMethod(v16, sel__PFMOClassFactoryData, ReturnPointerMethod, "@@:");
    v37 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v37 = malloc_default_zone();
    InstanceSize = class_getInstanceSize((Class)a1);
    v8 = malloc_type_zone_calloc(v37, 1uLL, (InstanceSize + 7) & 0xFFFFFFFFFFFFFFF8, 0x28861AD9uLL);
    v35[6] = v8;
    if ((id)objc_opt_class() != a1)
    {
      v92 = v8;
      v39 = (objc_class *)objc_opt_class();
      v40 = v35;
      MethodImplementation = class_getMethodImplementation(v39, sel_willAccessValueForKey_);
      v42 = class_getMethodImplementation((Class)a1, sel_willAccessValueForKey_);
      v43 = (objc_class *)objc_opt_class();
      v44 = class_getMethodImplementation(v43, sel_didAccessValueForKey_);
      v45 = class_getMethodImplementation((Class)a1, sel_didAccessValueForKey_);
      v46 = MethodImplementation == v42;
      v35 = v40;
      v46 = v46 && v44 == v45;
      v47 = !v46;
      v40[18] = v40[18] & 0xFFFFFFFE | v47;
      v48 = (objc_class *)objc_opt_class();
      v49 = class_getMethodImplementation(v48, sel_validateValue_forKey_error_);
      if (v49 != class_getMethodImplementation((Class)a1, sel_validateValue_forKey_error_))
      {
        v40[18] |= 0x10u;
        v50 = (objc_class *)objc_opt_class();
        v51 = class_getClassMethod(v50, sel__isGeneratedClass);
        v52 = method_getImplementation(v51);
        v53 = method_getTypeEncoding(v51);
        class_addMethod(v16, sel__useFastValidationMethod, v52, v53);
      }
      v54 = (objc_class *)objc_opt_class();
      v55 = class_getMethodImplementation(v54, sel_awakeFromFetch);
      if (v55 != class_getMethodImplementation((Class)a1, sel_awakeFromFetch))
        v40[18] |= 0x20u;
      v56 = (objc_class *)objc_opt_class();
      v57 = class_getMethodImplementation(v56, sel_willChangeValueForKey_);
      v58 = class_getMethodImplementation((Class)a1, sel_willChangeValueForKey_);
      v59 = (objc_class *)objc_opt_class();
      v60 = class_getMethodImplementation(v59, sel_didChangeValueForKey_);
      if (v60 == class_getMethodImplementation((Class)a1, sel_didChangeValueForKey_) && v57 == v58)
        v62 = 0;
      else
        v62 = 2;
      v40[18] = v62 | v40[18] & 0xFFFFFFFD;
      v63 = (objc_class *)objc_opt_class();
      v64 = class_getMethodImplementation(v63, sel_willChangeValueForKey_withSetMutation_usingObjects_);
      v65 = class_getMethodImplementation((Class)a1, sel_willChangeValueForKey_withSetMutation_usingObjects_);
      v66 = (objc_class *)objc_opt_class();
      v67 = class_getMethodImplementation(v66, sel_didChangeValueForKey_withSetMutation_usingObjects_);
      if (v67 == class_getMethodImplementation((Class)a1, sel_didChangeValueForKey_withSetMutation_usingObjects_)
        && v64 == v65)
      {
        v69 = 0;
      }
      else
      {
        v69 = 4;
      }
      v40[18] = v69 | v40[18] & 0xFFFFFFFB;
      v3 = v91;
      v8 = v92;
    }
    v70 = objc_msgSend((id)objc_msgSend(v3, "properties"), "count");
    if ((v70 & 0xFFFFFFF8) != 0)
    {
      v71 = v70;
      snprintf(__str, 0x200uLL, "_cd_bits_%p", v11);
      if (v71)
        v72 = ((v71 - 1) >> 5) + 1;
      else
        v72 = 1;
      if (v72 > 0x4000)
      {
        v88 = (void *)MEMORY[0x1E0C99DA0];
        v89 = *MEMORY[0x1E0C99768];
        v90 = CFSTR("Incorrect ivar generation");
      }
      else
      {
        snprintf(types, 0xAuLL, "[%dI]", v72);
        if (class_addIvar(v11, __str, 4 * v72, 1u, types))
        {
          objc_registerClassPair(v11);
          object_setClass(v8, v11);
          v8[4] |= 0x100000u;
          v8[2] = 10000;
          v73 = generateReturnPointerMethod((uint64_t)v8);
          class_addMethod(v16, sel__PFPlaceHolderSingleton, v73, "@@:");
          InstanceVariable = class_getInstanceVariable(v11, __str);
          Offset = ivar_getOffset(InstanceVariable);
          v76 = ((unint64_t)(((unsigned __int16)class_getInstanceSize(v11) + 7) & 0x3F8) - Offset) >> 2;
          goto LABEL_49;
        }
        v88 = (void *)MEMORY[0x1E0C99DA0];
        v89 = *MEMORY[0x1E0C99768];
        v90 = CFSTR("class_addIvar failed");
      }
LABEL_72:
      objc_exception_throw((id)objc_msgSend(v88, "exceptionWithName:reason:userInfo:", v89, v90, 0));
    }
    objc_registerClassPair(v11);
    object_setClass(v8, v11);
    v8[4] |= 0x100000u;
    v8[2] = 10000;
    v77 = generateReturnPointerMethod((uint64_t)v8);
    class_addMethod(v16, sel__PFPlaceHolderSingleton, v77, "@@:");
    LOBYTE(v76) = 0;
LABEL_49:
    *((_BYTE *)v35 + 32) = v76;
    v35[5] = 0;
LABEL_50:
    v78 = -[objc_class _PFMOClassFactoryData](v11, "_PFMOClassFactoryData");
    v79 = *(_BYTE **)(v78 + 8);
    if (!v79 || v79 == v3)
    {
      v81 = v78;
      if (!*(_QWORD *)(v78 + 56))
        goto LABEL_59;
      if (objc_msgSend((id)objc_msgSend(v3, "versionHash"), "isEqualToData:", *(_QWORD *)(v78 + 56)))
        break;
    }
    v82 = class_getName((Class)a1);
    snprintf(__str, 0x200uLL, "%s_%s_%x", v82, v6, v9++);
  }
  v79 = *(_BYTE **)(v81 + 8);
LABEL_59:
  if (!v79)
  {
    *(_DWORD *)v81 = 0;
    *(_QWORD *)(v81 + 8) = v3;
    *(_QWORD *)(v81 + 16) = objc_msgSend((id)objc_msgSend(v3, "name"), "copy");
    *(_QWORD *)(v81 + 24) = 0;
    v83 = (void *)-[objc_class _PFPlaceHolderSingleton](v11, "_PFPlaceHolderSingleton");
    object_setClass(v83, v11);
    *(_QWORD *)(v81 + 48) = v83;
  }
  os_unfair_lock_unlock(&_MergedGlobals_83);
  if (v8)
  {
    os_unfair_lock_lock_with_options();
    Mutable = (__CFArray *)qword_1ECD8DAE0;
    if (!qword_1ECD8DAE0)
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
      qword_1ECD8DAE0 = (uint64_t)Mutable;
    }
    CFArrayAppendValue(Mutable, v8);
    os_unfair_lock_unlock(&stru_1ECD8DADC);
  }
  objc_opt_self();
  __dmb(0xBu);
  return v11;
}

- (id)valueForKey:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSManagedImmutableObject;
  return -[NSManagedImmutableObject valueForKey:](&v4, sel_valueForKey_, a3);
}

@end
