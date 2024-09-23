@implementation NSValidationErrorLocalizationPolicy

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v4[1] = -[NSURL copy](self->_url, "copy");
    v4[2] = self->_localizationBundle;
    v4[3] = -[NSString copy](self->_modelStringsFileName, "copy");
    v4[4] = 0;
  }
  return v4;
}

- (NSValidationErrorLocalizationPolicy)initWithURL:(id)a3
{
  NSValidationErrorLocalizationPolicy *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSValidationErrorLocalizationPolicy;
  v4 = -[NSValidationErrorLocalizationPolicy init](&v6, sel_init);
  if (v4)
  {
    v4->_url = (NSURL *)a3;
    v4->_localizationBundle = 0;
    v4->_modelStringsFileName = 0;
    v4->_localizationDictionary = 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSValidationErrorLocalizationPolicy;
  -[NSValidationErrorLocalizationPolicy dealloc](&v3, sel_dealloc);
}

- (void)_ensureFullLocalizationDictionaryIsLoaded
{
  NSBundle *localizationBundle;
  uint64_t v4;
  uint64_t v5;
  NSURL *url;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;

  if (!self->_hasSetLocalizationDictionary)
  {
    if (!self->_localizationDictionary)
      self->_localizationDictionary = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
    localizationBundle = self->_localizationBundle;
    if (localizationBundle)
      goto LABEL_5;
    url = self->_url;
    if (url)
    {
      v7 = -[NSString stringByDeletingLastPathComponent](-[NSURL path](url, "path"), "stringByDeletingLastPathComponent");
      if (-[NSString isEqualToString:](-[NSString lastPathComponent](v7, "lastPathComponent"), "isEqualToString:", CFSTR("Contents")))
      {
        v7 = -[NSString stringByDeletingLastPathComponent](v7, "stringByDeletingLastPathComponent");
      }
      self->_localizationBundle = (NSBundle *)(id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v7);
      v8 = -[NSString lastPathComponent](-[NSURL path](self->_url, "path"), "lastPathComponent");
      self->_modelStringsFileName = v8;
      v9 = -[NSString stringByDeletingPathExtension](v8, "stringByDeletingPathExtension");
      self->_modelStringsFileName = v9;
      v10 = -[NSString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR("Model"));
      self->_modelStringsFileName = v10;
      v11 = v10;
      localizationBundle = self->_localizationBundle;
      if (localizationBundle)
      {
LABEL_5:
        v4 = -[NSBundle pathForResource:ofType:](localizationBundle, "pathForResource:ofType:", self->_modelStringsFileName, CFSTR("strings"));
        if (v4)
        {
          v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
          if (v5)
            -[NSDictionary addEntriesFromDictionary:](self->_localizationDictionary, "addEntriesFromDictionary:", v5);
        }
      }
    }
    self->_hasSetLocalizationDictionary = 1;
  }
}

- (id)_cachedObjectForKey:(id)a3 value:(void *)a4
{
  id result;
  NSString *v8;

  -[NSValidationErrorLocalizationPolicy _ensureFullLocalizationDictionaryIsLoaded](self, "_ensureFullLocalizationDictionaryIsLoaded");
  result = -[NSDictionary objectForKey:](self->_localizationDictionary, "objectForKey:", a3);
  if (!result)
  {
    if (self->_modelStringsFileName)
      v8 = -[NSBundle localizedStringForKey:value:table:](self->_localizationBundle, "localizedStringForKey:value:table:", a3, a4);
    else
      v8 = 0;
    result = 0;
    if (v8)
      a4 = v8;
    if (a4)
    {
      if (a4 != a3)
      {
        -[NSDictionary setObject:forKey:](self->_localizationDictionary, "setObject:forKey:", a4, a3);
        return a4;
      }
    }
  }
  return result;
}

- (id)localizationDictionary
{
  return (id)-[NSDictionary copy](self->_localizationDictionary, "copy");
}

- (void)setLocalizationDictionary:(id)a3
{
  NSDictionary *localizationDictionary;

  localizationDictionary = self->_localizationDictionary;
  if (localizationDictionary != a3)
  {
    if (localizationDictionary)
      -[NSDictionary addEntriesFromDictionary:](localizationDictionary, "addEntriesFromDictionary:");
    else
      self->_localizationDictionary = (NSDictionary *)objc_msgSend(a3, "mutableCopy");
  }
  self->_hasSetLocalizationDictionary = 1;
}

- (id)localizedEntityNameForEntity:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "name");
  return -[NSValidationErrorLocalizationPolicy _cachedObjectForKey:value:](self, "_cachedObjectForKey:value:", objc_msgSend(CFSTR("Entity/"), "stringByAppendingString:", v4), v4);
}

- (uint64_t)_localizedPropertyNameForProperty:(void *)a3 entity:
{
  uint64_t v3;
  uint64_t v7;
  void *v8;

  v3 = 0;
  if (a1 && a3)
  {
    v7 = objc_msgSend(a2, "name");
    v8 = (void *)objc_msgSend(CFSTR("Property/"), "mutableCopy");
    objc_msgSend(v8, "appendString:", v7);
    objc_msgSend(v8, "appendString:", CFSTR("/Entity/"));
    objc_msgSend(v8, "appendString:", objc_msgSend(a3, "name"));
    v3 = objc_msgSend(a1, "_cachedObjectForKey:value:", v8, 0);
    if (!v3)
      v3 = -[NSValidationErrorLocalizationPolicy _localizedPropertyNameForProperty:entity:](a1, a2, objc_msgSend(a3, "superentity"));

  }
  return v3;
}

- (id)localizedPropertyNameForProperty:(id)a3
{
  id result;
  uint64_t v6;

  result = (id)-[NSValidationErrorLocalizationPolicy _localizedPropertyNameForProperty:entity:](self, a3, (void *)objc_msgSend(a3, "entity"));
  if (!result)
  {
    v6 = objc_msgSend(a3, "name");
    return -[NSValidationErrorLocalizationPolicy _cachedObjectForKey:value:](self, "_cachedObjectForKey:value:", objc_msgSend(CFSTR("Property/"), "stringByAppendingString:", v6), v6);
  }
  return result;
}

- (id)localizedModelStringForKey:(id)a3
{
  return -[NSValidationErrorLocalizationPolicy _cachedObjectForKey:value:](self, "_cachedObjectForKey:value:", objc_msgSend(CFSTR("ErrorString/"), "stringByAppendingString:"), a3);
}

@end
