@implementation CNDictionaryPrimitiveUserDefaults

- (CNDictionaryPrimitiveUserDefaults)init
{
  CNDictionaryPrimitiveUserDefaults *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *preferences;
  CNDictionaryPrimitiveUserDefaults *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNDictionaryPrimitiveUserDefaults;
  v2 = -[CNDictionaryPrimitiveUserDefaults init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    preferences = v2->_preferences;
    v2->_preferences = v3;

    v5 = v2;
  }

  return v2;
}

- (id)primitiveObjectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_preferences, "objectForKey:", a3);
}

- (void)setPrimitiveObject:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *preferences;

  preferences = self->_preferences;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](preferences, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](preferences, "removeObjectForKey:", a4);
}

- (BOOL)primitiveBoolValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  void *v5;
  void *v6;
  char v7;

  -[NSMutableDictionary objectForKey:](self->_preferences, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    *a4 = v5 != 0;
  v7 = objc_msgSend(v5, "BOOLValue");

  return v7;
}

- (int64_t)primitiveIntegerValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[NSMutableDictionary objectForKey:](self->_preferences, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    *a4 = v5 != 0;
  v7 = objc_msgSend(v5, "integerValue");

  return v7;
}

- (void)primitiveRemoveObjectForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_preferences, "removeObjectForKey:", a3);
}

- (BOOL)synchronize
{
  ++self->_synchronizeCount;
  return 1;
}

- (void)setupAutosync
{
  ++self->_setupAutosyncCount;
}

- (unint64_t)synchronizeCount
{
  return self->_synchronizeCount;
}

- (unint64_t)setupAutosyncCount
{
  return self->_setupAutosyncCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
