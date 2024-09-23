@implementation NSValueTransformer

+ (NSArray)valueTransformerNames
{
  void *v2;
  id v3;

  os_unfair_lock_lock(&stru_1ECD0A26C);
  v2 = (void *)qword_1ECD0A270;
  if (!qword_1ECD0A270)
  {
    v2 = (void *)objc_msgSend((id)objc_msgSend((id)_getTransformerRegistry(), "allKeys"), "copy");
    qword_1ECD0A270 = (uint64_t)v2;
  }
  v3 = v2;
  os_unfair_lock_unlock(&stru_1ECD0A26C);
  return (NSArray *)v3;
}

+ (void)setValueTransformer:(NSValueTransformer *)transformer forName:(NSValueTransformerName)name
{
  void *TransformerRegistry;

  if (!name)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Name cannot be nil"), 0));
  os_unfair_lock_lock(&stru_1ECD0A26C);
  TransformerRegistry = (void *)_getTransformerRegistry();
  if (transformer)
    objc_msgSend(TransformerRegistry, "setObject:forKey:", transformer, name);
  else
    objc_msgSend(TransformerRegistry, "removeObjectForKey:", name);

  qword_1ECD0A270 = 0;
  os_unfair_lock_unlock(&stru_1ECD0A26C);
}

+ (NSValueTransformer)valueTransformerForName:(NSValueTransformerName)name
{
  Class v7;
  NSObject *v9;
  int v10;
  NSString *v11;
  __int16 v12;
  NSValueTransformerName v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (name)
  {
    if (name == (NSValueTransformerName)CFSTR("NSKeyedUnarchiveFromData")
      || name == (NSValueTransformerName)CFSTR("NSUnarchiveFromData"))
    {
      +[NSValueTransformer _warnAboutInscureArchiverCitingOffender:]((uint64_t)NSValueTransformer, (uint64_t)name);
    }
    os_unfair_lock_lock(&stru_1ECD0A26C);
    v7 = (Class)(id)objc_msgSend((id)_getTransformerRegistry(), "objectForKey:", name);
    os_unfair_lock_unlock(&stru_1ECD0A26C);
    if (v7)
      return (NSValueTransformer *)v7;
    v7 = NSClassFromString(name);
    if (dyld_program_sdk_at_least())
    {
      if (!v7)
        return (NSValueTransformer *)v7;
      if (!-[objc_class isSubclassOfClass:](v7, "isSubclassOfClass:", objc_opt_class()))
      {
        v9 = _NSOSLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = 138543618;
          v11 = _NSMethodExceptionProem((objc_class *)a1, a2);
          v12 = 2114;
          v13 = name;
          _os_log_error_impl(&dword_1817D9000, v9, OS_LOG_TYPE_ERROR, "%{public}@: '%{public}@' is not a subclass of NSValueTransformer.", (uint8_t *)&v10, 0x16u);
        }
        v7 = 0;
        return (NSValueTransformer *)v7;
      }
    }
    else if (!v7)
    {
      return (NSValueTransformer *)v7;
    }
    v7 = (Class)objc_alloc_init(v7);
    objc_msgSend(a1, "setValueTransformer:forName:", v7, name);
    return (NSValueTransformer *)v7;
  }
  return 0;
}

- (id)_initForFoundationOnly
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSValueTransformer;
  return -[NSValueTransformer init](&v3, sel_init);
}

+ (Class)transformedValueClass
{
  return 0;
}

+ (void)_warnAboutInscureArchiverCitingOffender:(uint64_t)a1
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (qword_1ECD0A278 != -1)
    dispatch_once(&qword_1ECD0A278, &__block_literal_global_55);
  if ((_MergedGlobals_128 & 1) == 0)
  {
    v3 = _NSOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v4 = 138543362;
      v5 = a2;
      _os_log_fault_impl(&dword_1817D9000, v3, OS_LOG_TYPE_FAULT, "'%{public}@' should not be used to for un-archiving and will be removed in a future release", (uint8_t *)&v4, 0xCu);
    }
  }
}

const char *__62__NSValueTransformer__warnAboutInscureArchiverCitingOffender___block_invoke()
{
  const char *result;

  result = getenv("NSValueTransformerDisableDeprecationWarnings");
  if (result)
  {
    result = (const char *)strncmp(result, "YES", 3uLL);
    if (!(_DWORD)result)
      _MergedGlobals_128 = 1;
  }
  return result;
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)value
{
  return value;
}

- (id)reverseTransformedValue:(id)value
{
  if ((objc_msgSend((id)objc_opt_class(), "allowsReverseTransformation") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Transformer does not support reverse transformations"), 0));
  return -[NSValueTransformer transformedValue:](self, "transformedValue:", value);
}

@end
