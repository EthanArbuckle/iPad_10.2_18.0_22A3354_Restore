@implementation CIFilterClassCategories

+ (id)cache
{
  if (+[CIFilterClassCategories cache]::onceToken != -1)
    dispatch_once(&+[CIFilterClassCategories cache]::onceToken, &__block_literal_global_689);
  return (id)+[CIFilterClassCategories cache]::cache;
}

uint64_t __32__CIFilterClassCategories_cache__block_invoke()
{
  +[CIFilterClassCategories cache]::cache = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99D38]);
  objc_msgSend((id)+[CIFilterClassCategories cache]::cache, "setName:", CFSTR("com.apple.coreimage.nscache.CIFilterClassCategories"));
  objc_msgSend((id)+[CIFilterClassCategories cache]::cache, "setCountLimit:", 256);
  return objc_msgSend((id)+[CIFilterClassCategories cache]::cache, "setEvictsObjectsWhenApplicationEntersBackground:", 1);
}

+ (void)clearCache
{
  objc_msgSend((id)objc_msgSend(a1, "cache"), "removeAllObjects");
}

+ (id)classCategoriesForClass:(Class)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a1, "cache");
  v5 = (objc_class *)objc_opt_class();
  if (!-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", v5))
    return 0;
  if (v5 == a3)
    return (id)MEMORY[0x1E0C9AA60];
  v6 = (void *)objc_msgSend(v4, "objectForKey:", a3);
  if (!v6)
  {
    v7 = objc_msgSend((id)getCustomAttributes(a3), "valueForKey:", CFSTR("CIAttributeFilterCategories"));
    if (v7)
    {
      v8 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v8);
        if (v6)
        {
LABEL_16:
          if (((classIsBuiltinFilter(a3) & 1) != 0 || classIsSystemFilter(a3))
            && ((objc_msgSend(v6, "containsObject:", CFSTR("CICategoryGeometryAdjustment")) & 1) != 0
             || (objc_msgSend(v6, "containsObject:", CFSTR("CICategoryDistortionEffect")) & 1) != 0
             || (objc_msgSend(v6, "containsObject:", CFSTR("CICategoryTransition")) & 1) != 0
             || (objc_msgSend(v6, "containsObject:", CFSTR("CICategoryBlur")) & 1) != 0
             || (objc_msgSend(v6, "containsObject:", CFSTR("CICategorySharpen")) & 1) != 0
             || objc_msgSend(v6, "containsObject:", CFSTR("CICategoryTileEffect"))))
          {
            v6 = (void *)objc_msgSend(v6, "arrayByAddingObject:", CFSTR("CICategoryHighDynamicRange"));
          }
          objc_msgSend(v4, "setObject:forKey:", v6, a3);
          return v6;
        }
      }
      else
      {
        v9 = ci_logger_api();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446466;
          v13 = "+[CIFilterClassCategories classCategoriesForClass:]";
          v14 = 2114;
          v15 = -[objc_class description](a3, "description");
          _os_log_impl(&dword_1921E4000, v9, OS_LOG_TYPE_INFO, "%{public}s kCIAttributeFilterCategories for class %{public}@ is not an array", buf, 0x16u);
        }
      }
    }
    if ((classIsBuiltinFilter(a3) & 1) != 0 || classIsSystemFilter(a3))
    {
      v11 = CFSTR("CICategoryApplePrivate");
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C9AA60];
    }
    goto LABEL_16;
  }
  return v6;
}

@end
