@implementation LSPropertyList

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LSPropertyList;
  return -[LSPropertyList init](&v3, sel_init);
}

- (NSString)_applicationIdentifier
{
  return (NSString *)-[LSPropertyList objectForKey:ofClass:](self, "objectForKey:ofClass:", CFSTR("application-identifier"), objc_opt_class());
}

+ (LSPropertyList)propertyListWithDictionary:(id)a3
{
  return (LSPropertyList *)+[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)_LSLazyPropertyList, a3);
}

- (LSPropertyList)init
{
  abort();
}

+ (LSPropertyList)new
{
  abort();
}

+ (LSPropertyList)propertyListWithData:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a3, "copy");
  +[_LSLazyPropertyList lazyPropertyListWithPropertyListData:]((uint64_t)_LSLazyPropertyList, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (LSPropertyList *)v4;
}

+ (LSPropertyList)propertyListWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return (LSPropertyList *)+[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:options:error:]((uint64_t)_LSLazyPropertyList, a3, a4, (uint64_t)a5);
}

- (id)objectsForKeys:(id)a3
{
  LSBundleInfoCachedValues *v4;

  v4 = [LSBundleInfoCachedValues alloc];
  return -[LSBundleInfoCachedValues _initWithKeys:forDictionary:](v4, "_initWithKeys:forDictionary:", a3, MEMORY[0x1E0C9AA70]);
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  return 0;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5
{
  return 0;
}

- (id)objectForKey:(id)a3 checkingKeyClass:(Class)a4 checkingValueClass:(Class)a5
{
  return 0;
}

- (NSDictionary)_expensiveDictionaryRepresentation
{
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[LSPropertyList _expensiveDictionaryRepresentation](self, "_expensiveDictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> %@"), v4, self, v5);

  return v6;
}

@end
