@implementation CIFilterClassAttributes

+ (id)_attributesWithClass:(Class)a3
{
  void *CustomAttributes;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSString *v22;
  void *v23;
  uint64_t StdAttrsForKey;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  id v35;
  void *v36;
  void *v37;
  int IsSystemFilter;
  NSString *v39;
  int IsBuiltinFilter;
  void *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  if (!-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
    return 0;
  CustomAttributes = (void *)getCustomAttributes(a3);
  v41 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v39 = NSStringFromClass(a3);
  v5 = (void *)bundleForCIFilter();
  v37 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a3);
  IsBuiltinFilter = classIsBuiltinFilter(a3);
  if ((IsBuiltinFilter & 1) != 0)
    IsSystemFilter = 1;
  else
    IsSystemFilter = classIsSystemFilter(a3);
  v6 = objc_msgSend(CustomAttributes, "valueForKey:", CFSTR("CIAttributeFilterName"));
  if (v6)
    v7 = v6;
  else
    v7 = (uint64_t)v39;
  objc_msgSend(v41, "setValue:forKey:", v7, CFSTR("CIAttributeFilterName"));
  v8 = objc_msgSend(CustomAttributes, "valueForKey:", CFSTR("CIAttributeFilterDisplayName"));
  v9 = IsBuiltinFilter ^ 1;
  if (v8)
    v9 = 1;
  if ((v9 & 1) == 0)
    v8 = objc_msgSend(v5, "localizedStringForKey:value:table:", v39, 0, CFSTR("Filters"));
  if (!v8)
    v8 = objc_msgSend(v37, "localizedStringForKey:value:table:", v39, 0, CFSTR("Filters"));
  if (v8)
    v10 = v8;
  else
    v10 = (uint64_t)v39;
  objc_msgSend(v41, "setValue:forKey:", v10, CFSTR("CIAttributeFilterDisplayName"));
  v11 = objc_msgSend(CustomAttributes, "valueForKey:");
  if (v11)
    objc_msgSend(v41, "setValue:forKey:", v11, CFSTR("CIAttributeDescription"));
  v12 = +[CIFilterClassCategories classCategoriesForClass:](CIFilterClassCategories, "classCategoriesForClass:", a3);
  if (v12)
    objc_msgSend(v41, "setValue:forKey:", v12, CFSTR("CIAttributeFilterCategories"));
  v13 = objc_msgSend(CustomAttributes, "valueForKey:", CFSTR("CIAttributeFilterAvailable_iOS"));
  if (v13)
    v14 = IsSystemFilter;
  else
    v14 = 0;
  if (v14 == 1)
    objc_msgSend(v41, "setValue:forKey:", v13, CFSTR("CIAttributeFilterAvailable_iOS"));
  v15 = objc_msgSend(CustomAttributes, "valueForKey:", CFSTR("CIAttributeFilterAvailable_Mac"));
  if (v15)
    v16 = IsSystemFilter;
  else
    v16 = 0;
  if (v16 == 1)
    objc_msgSend(v41, "setValue:forKey:", v15, CFSTR("CIAttributeFilterAvailable_Mac"));
  v17 = objc_msgSend(CustomAttributes, "valueForKey:", CFSTR("CIAttributeReferenceDocumentation"));
  if (v17)
    v18 = 0;
  else
    v18 = IsSystemFilter;
  if (v18 == 1)
  {
    v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/%@"), v39);
    v17 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v19);
  }
  if (v17)
    objc_msgSend(v41, "setValue:forKey:", v17, CFSTR("CIAttributeReferenceDocumentation"));
  v20 = +[CIFilterClassInfo classInfoForClass:](CIFilterClassInfo, "classInfoForClass:", a3);
  if (objc_msgSend((id)objc_msgSend(v20, "inputKeys"), "count"))
  {
    v21 = 0;
    v35 = v20;
    v36 = v5;
    while (1)
    {
      v22 = (NSString *)objc_msgSend((id)objc_msgSend(v20, "inputKeys"), "objectAtIndexedSubscript:", v21);
      v23 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      StdAttrsForKey = getStdAttrsForKey(v22);
      if (StdAttrsForKey)
        objc_msgSend(v23, "addEntriesFromDictionary:", StdAttrsForKey);
      v25 = (__CFString *)objc_msgSend((id)objc_msgSend(v20, "inputClasses"), "objectAtIndexedSubscript:", v21);
      if (-[__CFString length](v25, "length"))
      {
        if (-[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("__WrappedNSNumber")))
          v25 = CFSTR("NSNumber");
        objc_msgSend(v23, "setValue:forKey:", v25, CFSTR("CIAttributeClass"));
      }
      if (IsBuiltinFilter)
        break;
      v30 = -[NSString substringFromIndex:](v22, "substringFromIndex:", 5);
      if ((IsSystemFilter & 1) == 0)
      {
        v28 = v23;
        v29 = (void *)v30;
        v32 = CFSTR("CIAttributeDisplayName");
        goto LABEL_60;
      }
      objc_msgSend(v23, "setValue:forKey:", objc_msgSend(v37, "localizedStringForKey:value:table:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v39, v22), v30, CFSTR("Filters")), CFSTR("CIAttributeDisplayName"));
      v20 = v35;
      v5 = v36;
      v31 = objc_msgSend(v37, "localizedStringForKey:value:table:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.description"), v39, v22), 0, CFSTR("Filters"));
      if (v31)
      {
        v29 = (void *)v31;
        v28 = v23;
        goto LABEL_58;
      }
LABEL_61:
      v33 = objc_msgSend(CustomAttributes, "valueForKey:", v22);
      if (v33)
        objc_msgSend(v23, "addEntriesFromDictionary:", v33);
      objc_msgSend(v41, "setValue:forKey:", v23, v22);
      if (objc_msgSend((id)objc_msgSend(v20, "inputKeys"), "count") <= (unint64_t)++v21)
        goto LABEL_64;
    }
    if (!objc_msgSend(v23, "objectForKey:", CFSTR("CIAttributeType")))
    {
      if (-[__CFString isEqual:](v25, "isEqual:", CFSTR("CIColor")))
        objc_msgSend(v23, "setValue:forKey:", CFSTR("CIAttributeTypeColor"), CFSTR("CIAttributeType"));
      if (-[__CFString isEqual:](v25, "isEqual:", CFSTR("CIImage")))
        objc_msgSend(v23, "setValue:forKey:", CFSTR("CIAttributeTypeImage"), CFSTR("CIAttributeType"));
    }
    objc_msgSend(v23, "setValue:forKey:", objc_msgSend(v5, "localizedStringForKey:value:table:", v22, -[NSString substringFromIndex:](v22, "substringFromIndex:", 5), CFSTR("Keys")), CFSTR("CIAttributeDisplayName"));
    v26 = objc_msgSend(v5, "localizedStringForKey:value:table:", v22, CFSTR("<none>"), CFSTR("Descriptions"));
    v27 = (void *)objc_msgSend(v5, "localizedStringForKey:value:table:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v39, v22), v26, CFSTR("Descriptions"));
    if ((objc_msgSend(v27, "isEqual:", CFSTR("<none>")) & 1) != 0)
      goto LABEL_61;
    v28 = v23;
    v29 = v27;
LABEL_58:
    v32 = CFSTR("CIAttributeDescription");
LABEL_60:
    objc_msgSend(v28, "setValue:forKey:", v29, v32);
    goto LABEL_61;
  }
LABEL_64:
  if ((IsSystemFilter & 1) != 0 && !objc_msgSend(v41, "valueForKey:", CFSTR("CIAttributeFilterCategories")))
  {
    v42[0] = CFSTR("CICategoryApplePrivate");
    objc_msgSend(v41, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1), CFSTR("CIAttributeFilterCategories"));
  }
  return v41;
}

+ (id)cache
{
  if (+[CIFilterClassAttributes cache]::onceToken != -1)
    dispatch_once(&+[CIFilterClassAttributes cache]::onceToken, &__block_literal_global_30);
  return (id)+[CIFilterClassAttributes cache]::cache;
}

uint64_t __32__CIFilterClassAttributes_cache__block_invoke()
{
  +[CIFilterClassAttributes cache]::cache = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99D38]);
  objc_msgSend((id)+[CIFilterClassAttributes cache]::cache, "setName:", CFSTR("com.apple.coreimage.nscache.CIFilterClassAttributes"));
  objc_msgSend((id)+[CIFilterClassAttributes cache]::cache, "setCountLimit:", 256);
  return objc_msgSend((id)+[CIFilterClassAttributes cache]::cache, "setEvictsObjectsWhenApplicationEntersBackground:", 1);
}

+ (void)clearCache
{
  objc_msgSend((id)objc_msgSend(a1, "cache"), "removeAllObjects");
}

+ (id)classAttributesForClass:(Class)a3
{
  void *v4;
  objc_class *v5;
  id v6;

  v4 = (void *)objc_msgSend(a1, "cache");
  v5 = (objc_class *)objc_opt_class();
  if (!-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", v5))
    return 0;
  if (v5 == a3)
    return (id)MEMORY[0x1E0C9AA70];
  v6 = (id)objc_msgSend(v4, "objectForKey:", a3);
  if (!v6)
  {
    v6 = +[CIFilterClassAttributes _attributesWithClass:](CIFilterClassAttributes, "_attributesWithClass:", a3);
    objc_msgSend(v4, "setObject:forKey:", v6, a3);
  }
  return v6;
}

+ (id)classAttributesForName:(id)a3
{
  return (id)objc_msgSend(a1, "classAttributesForClass:", NSClassFromString((NSString *)a3));
}

@end
