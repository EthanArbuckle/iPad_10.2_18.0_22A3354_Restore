@implementation _GCFLocalizedString

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCFLocalizedString)initWithKey:(id)a3 sourceBundle:(id)a4 table:(id)a5 locale:(id)a6
{
  id v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;

  if (!a3)
    return 0;
  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v9, "key");
    v9 = v11;
    if (a4)
    {
      if (a5)
        goto LABEL_5;
LABEL_14:
      a5 = (id)objc_msgSend(v9, "table");
      if (!a4)
        goto LABEL_6;
      goto LABEL_15;
    }
    a4 = (id)objc_msgSend(v11, "bundle");
    if (!a5)
      goto LABEL_14;
  }
LABEL_5:
  if (!a4)
  {
LABEL_6:
    v12 = objc_msgSend(v9, "UTF8String");
    v13 = dyld_image_path_containing_address();
    if (!v13
      || (a4 = +[NSBundle gc_bundleForExecutableAtPath:](NSBundle_0, "gc_bundleForExecutableAtPath:", +[NSString stringWithCString:encoding:](NSString_0, "stringWithCString:encoding:", v13, 4))) == 0)
    {
      if (_gc_log_localizedstring_onceToken != -1)
        dispatch_once(&_gc_log_localizedstring_onceToken, &__block_literal_global_3);
      v14 = _gc_log_localizedstring_Log;
      if (os_log_type_enabled((os_log_t)_gc_log_localizedstring_Log, OS_LOG_TYPE_DEBUG))
        -[_GCFLocalizedString initWithKey:sourceBundle:table:locale:].cold.1((uint64_t)v9, v12, v14);
      a4 = 0;
    }
  }
LABEL_15:
  self->_key = (NSString *)objc_msgSend(v9, "copy");
  self->_sourceBundle = (NSBundle *)a4;
  self->_localizationTable = (NSString *)objc_msgSend(a5, "copy");
  self->_localeOverride = (NSLocale *)objc_msgSend(a6, "copy");
  return self;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GCFLocalizedString;
  -[_GCFLocalizedString dealloc](&v3, sel_dealloc);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (_GCFLocalizedString)initWithCoder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSBundle *v10;
  NSBundle *v11;
  NSObject *v13;

  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
    v6 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundle"));
    v7 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("table"));
    v8 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
  }
  else
  {
    v5 = (void *)objc_msgSend(a3, "decodeObject");
    v6 = (void *)objc_msgSend(a3, "decodeObject");
    v7 = (void *)objc_msgSend(a3, "decodeObject");
    v8 = objc_msgSend(a3, "decodeObject");
  }
  v9 = (void *)v8;
  v10 = +[NSBundle bundleWithURL:](NSBundle_0, "bundleWithURL:", v6);
  v11 = v10;
  if (v6 && !v10)
  {
    if (_gc_log_localizedstring_onceToken != -1)
      dispatch_once(&_gc_log_localizedstring_onceToken, &__block_literal_global_3);
    v13 = _gc_log_localizedstring_Log;
    if (os_log_type_enabled((os_log_t)_gc_log_localizedstring_Log, OS_LOG_TYPE_FAULT))
      -[_GCFLocalizedString initWithCoder:].cold.1((uint64_t)v5, v6, v13);
  }
  self->_key = (NSString *)objc_msgSend(v5, "copy");
  self->_sourceBundle = v11;
  self->_localizationTable = (NSString *)objc_msgSend(v7, "copy");
  self->_localeOverride = (NSLocale *)objc_msgSend(v9, "copy");
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  int v5;
  NSString *key;

  v5 = objc_msgSend(a3, "allowsKeyedCoding");
  key = self->_key;
  if (v5)
  {
    objc_msgSend(a3, "encodeObject:forKey:", key, CFSTR("key"));
    objc_msgSend(a3, "encodeObject:forKey:", -[NSBundle bundleURL](self->_sourceBundle, "bundleURL"), CFSTR("bundle"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_localizationTable, CFSTR("table"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_localeOverride, CFSTR("locale"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", key);
    objc_msgSend(a3, "encodeObject:", -[NSBundle bundleURL](self->_sourceBundle, "bundleURL"));
    objc_msgSend(a3, "encodeObject:", self->_localizationTable);
    objc_msgSend(a3, "encodeObject:", self->_localeOverride);
  }
}

- (id)key
{
  return self->_key;
}

- (id)bundle
{
  return self->_sourceBundle;
}

- (id)table
{
  return self->_localizationTable;
}

- (id)_realizedString
{
  NSString *realizedString;

  realizedString = self->__realizedString;
  if (!realizedString)
  {
    objc_sync_enter(self);
    realizedString = self->__realizedString;
    if (!realizedString)
    {
      if (self->_sourceBundle && -[NSString length](self->_key, "length"))
        realizedString = (NSString *)-[NSBundle localizedStringForKey:value:table:localization:](self->_sourceBundle, "localizedStringForKey:value:table:localization:", self->_key, &stru_1EA4D5008, self->_localizationTable, -[NSLocale languageCode](self->_localeOverride, "languageCode"));
      else
        realizedString = self->_key;
      self->__realizedString = (NSString *)-[NSString copy](realizedString, "copy");
    }
    objc_sync_exit(self);
  }
  return realizedString;
}

- (void)initWithKey:(os_log_t)log sourceBundle:table:locale:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 138412802;
  v4 = a1;
  v5 = 2048;
  v6 = a1;
  v7 = 2048;
  v8 = a2;
  _os_log_debug_impl(&dword_1DC79E000, log, OS_LOG_TYPE_DEBUG, "#WARNING Could not determine source bundle of string '%@' %p %p.", (uint8_t *)&v3, 0x20u);
}

- (void)initWithCoder:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 138412546;
  v5 = a1;
  v6 = 2114;
  v7 = objc_msgSend(a2, "path");
  _os_log_fault_impl(&dword_1DC79E000, a3, OS_LOG_TYPE_FAULT, "Failed to load source bundle for key '%@' at %{public}@.", (uint8_t *)&v4, 0x16u);
}

@end
