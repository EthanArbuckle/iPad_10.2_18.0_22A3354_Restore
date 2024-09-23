@implementation NSAtomicStoreCacheNode

+ (void)initialize
{
  objc_opt_self();
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (NSAtomicStoreCacheNode)init
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSAtomicStoreCacheNodes must be initialized using initWithObjectID:(NSManagedObjectID *)"), 0));
}

- (NSAtomicStoreCacheNode)initWithObjectID:(NSManagedObjectID *)moid
{
  NSAtomicStoreCacheNode *v4;
  objc_super v6;

  if (!moid)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSAtomicStoreCacheNodes must be created with an objectID"), 0));
  v6.receiver = self;
  v6.super_class = (Class)NSAtomicStoreCacheNode;
  v4 = -[NSAtomicStoreCacheNode init](&v6, sel_init);
  if (v4)
  {
    v4->_objectID = moid;
    v4->__versionNumber = 1;
    v4->_propertyCache = 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_objectID = 0;
  self->_propertyCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSAtomicStoreCacheNode;
  -[NSAtomicStoreCacheNode dealloc](&v3, sel_dealloc);
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (unsigned)_versionNumber
{
  return self->__versionNumber;
}

- (void)_setVersionNumber:(unsigned int)a3
{
  self->__versionNumber = a3;
}

- (const)knownKeyValuesPointer
{
  return 0;
}

- (id)_snapshot_
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
    return -[NSManagedObjectID isEqual:](self->_objectID, "isEqual:", *((_QWORD *)a3 + 1));
  else
    return 0;
}

- (NSMutableDictionary)propertyCache
{
  return self->_propertyCache;
}

- (void)setPropertyCache:(NSMutableDictionary *)propertyCache
{
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  v4 = self->_propertyCache;
  if (v4 != propertyCache)
  {
    v5 = v4;
    self->_propertyCache = propertyCache;

  }
}

- (id)valueForKey:(NSString *)key
{
  NSEntityDescription *v5;
  NSEntityDescription *v7;
  objc_super v8;
  objc_super v9;

  v5 = -[NSManagedObjectID entity](self->_objectID, "entity");
  if (v5)
    v5 = (NSEntityDescription *)v5->_propertyMapping;
  if (-[NSEntityDescription indexForKey:](v5, "indexForKey:", key) == 0x7FFFFFFFFFFFFFFFLL)
    return -[NSAtomicStoreCacheNode valueForKey:](&v9, sel_valueForKey_, key, v8.receiver, v8.super_class, self, NSAtomicStoreCacheNode);
  v7 = -[NSManagedObjectID entity](self->_objectID, "entity");
  if (v7)
    v7 = -[NSDictionary objectForKey:](-[NSEntityDescription propertiesByName](v7, "propertiesByName"), "objectForKey:", key);
  if (-[NSEntityDescription isTransient](v7, "isTransient"))
    return -[NSAtomicStoreCacheNode valueForKey:](&v8, sel_valueForKey_, key, self, NSAtomicStoreCacheNode, v9.receiver, v9.super_class);
  else
    return (id)-[NSMutableDictionary valueForKey:](self->_propertyCache, "valueForKey:", key);
}

- (void)setValue:(id)value forKey:(NSString *)key
{
  NSEntityDescription *v7;
  NSMutableDictionary *propertyCache;
  objc_super v9;

  v7 = -[NSManagedObjectID entity](self->_objectID, "entity");
  if (v7)
    v7 = (NSEntityDescription *)v7->_propertyMapping;
  if (-[NSEntityDescription indexForKey:](v7, "indexForKey:", key) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9.receiver = self;
    v9.super_class = (Class)NSAtomicStoreCacheNode;
    -[NSAtomicStoreCacheNode setValue:forKey:](&v9, sel_setValue_forKey_, value, key);
  }
  propertyCache = self->_propertyCache;
  if (propertyCache)
  {
    if (value)
    {
LABEL_7:
      -[NSMutableDictionary setValue:forKey:](propertyCache, "setValue:forKey:", value, key);
      return;
    }
  }
  else
  {
    propertyCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_propertyCache = propertyCache;
    if (value)
      goto LABEL_7;
  }
  -[NSMutableDictionary removeObjectForKey:](propertyCache, "removeObjectForKey:", key);
}

@end
