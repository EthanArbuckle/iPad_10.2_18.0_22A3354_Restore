@implementation NSStoreMapNode

+ (void)initialize
{
  objc_opt_self();
}

- (NSStoreMapNode)initWithObjectID:(id)a3
{
  NSStoreMapNode *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSStoreMapNode;
  v4 = -[NSStoreMapNode init](&v6, sel_init);
  if (v4)
  {
    v4->_objectID = (NSManagedObjectID *)a3;
    v4->_relatedNodes = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "init");
    v4->_map = 0;
    v4->_version = 1;
  }
  return v4;
}

- (NSStoreMapNode)initWithCoder:(id)a3
{
  NSStoreMapNode *v4;
  uint64_t v5;
  NSManagedObjectID *v6;
  NSMutableDictionary *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSStoreMapNode;
  v4 = -[NSStoreMapNode init](&v9, sel_init);
  v4->_version = 1;
  v5 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NSPrimaryKey64"));
  if (v5)
    v6 = (NSManagedObjectID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", v5);
  else
    v6 = (NSManagedObjectID *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSKey"));
  v4->_objectID = v6;
  if (!v6)
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, &unk_1E1F4AFC0));
  v7 = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[_PFRoutines attributeClassesForSecureCoding](), CFSTR("NSRelatedNodes"));
  v4->_relatedNodes = v7;
  if (!v7)
    v4->_relatedNodes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4->_entityName = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSEntityName"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;

  v5 = -[NSManagedObjectID _referenceData](self->_objectID, "_referenceData");
  if (objc_msgSend(v5, "isNSNumber"))
    objc_msgSend(a3, "encodeInt64:forKey:", objc_msgSend(v5, "unsignedLongLongValue"), CFSTR("NSPrimaryKey64"));
  else
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("NSKey"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityDescription name](-[NSManagedObjectID entity](self->_objectID, "entity"), "name"), CFSTR("NSEntityName"));
  if (-[NSMutableDictionary count](self->_relatedNodes, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", self->_relatedNodes, CFSTR("NSRelatedNodes"));
}

- (void)dealloc
{
  objc_super v3;

  self->_objectID = 0;
  self->_relatedNodes = 0;

  self->_entityName = 0;
  self->_map = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSStoreMapNode;
  -[NSStoreMapNode dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  NSMutableDictionary *relatedNodes;
  uint64_t v7;

  v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    && objc_msgSend(-[NSStoreMapNode objectID](self, "objectID"), "isEqual:", objc_msgSend(a3, "objectID")))
  {
    if (self)
    {
      relatedNodes = self->_relatedNodes;
      if (a3)
      {
LABEL_5:
        v7 = *((_QWORD *)a3 + 3);
        return -[NSMutableDictionary isEqual:](relatedNodes, "isEqual:", v7);
      }
    }
    else
    {
      relatedNodes = 0;
      if (a3)
        goto LABEL_5;
    }
    v7 = 0;
    return -[NSMutableDictionary isEqual:](relatedNodes, "isEqual:", v7);
  }
  return 0;
}

- (id)objectID
{
  return self->_objectID;
}

- (id)key
{
  return -[NSManagedObjectID _referenceData](self->_objectID, "_referenceData");
}

- (id)entity
{
  return -[NSManagedObjectID entity](self->_objectID, "entity");
}

- (id)configurationName
{
  return -[NSPersistentStoreMap configurationName](self->_map, "configurationName");
}

- (id)destinationsForRelationship:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_relatedNodes, "objectForKey:", a3);
}

- (void)_setMap:(uint64_t)a1
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (a1)
  {
    *(_QWORD *)(a1 + 8) = a2;
    if (*(_QWORD *)(a1 + 32))
    {
      if (a2)
        v3 = *(void **)(a2 + 8);
      else
        v3 = 0;
      v4 = *(void **)(a1 + 16);
      v5 = objc_msgSend((id)objc_msgSend(v3, "_persistentStoreCoordinator"), "managedObjectModel");
      v6 = v5;
      if (!v5 || (v7 = objc_msgSend(*(id *)(v5 + 32), "objectForKey:", *(_QWORD *)(a1 + 32))) == 0)
      {
        v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find entity %@ in model %@"), *(_QWORD *)(a1 + 32), v6);

        *(_QWORD *)(a1 + 32) = 0;
        v9 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], 134020, v8, 0);
        objc_exception_throw(v9);
      }
      *(_QWORD *)(a1 + 16) = objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "objectIDFactoryForEntity:", v7)), "initWithObject:", v4);

      *(_QWORD *)(a1 + 32) = 0;
    }
  }
}

- (unsigned)_versionNumber
{
  return self->_version;
}

- (void)_setVersionNumber:(unsigned int)a3
{
  self->_version = a3;
}

- (const)knownKeyValuesPointer
{
  return 0;
}

- (id)_snapshot_
{
  return 0;
}

@end
