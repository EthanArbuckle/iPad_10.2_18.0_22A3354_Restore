@implementation NSIncrementalStoreNode

+ (void)initialize
{
  objc_opt_self();
}

- (NSIncrementalStoreNode)initWithObjectID:(id)a3 fromSQLRow:(id)a4
{
  NSIncrementalStoreNode *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSKnownKeysDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  void *v24;
  id v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)NSIncrementalStoreNode;
  v6 = -[NSIncrementalStoreNode init](&v27, sel_init);
  if (v6)
  {
    v6->_objectID = (NSManagedObjectID *)a3;
    v6->_reserved1 = 0;
    v6->_versionNumber = objc_msgSend(a4, "_versionNumber");
    v7 = objc_msgSend(a3, "entity");
    v8 = v7;
    if (v7)
      v9 = *(void **)(v7 + 104);
    else
      v9 = 0;
    v10 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", v9);
    v11 = -[NSKnownKeysDictionary values](v10, "values");
    v12 = objc_msgSend(v9, "keys");
    v13 = v12;
    v14 = *(_QWORD **)(v8 + 112);
    v15 = v14[6];
    v16 = v14[7];
    if (v15 < v16 + v15)
    {
      v17 = (_QWORD *)(v11 + 8 * v15);
      v18 = (_QWORD *)(v12 + 8 * v15);
      do
      {
        v19 = (void *)objc_msgSend(a4, "valueForKey:", *v18);
        if (v19)
          *v17 = v19;
        ++v17;
        ++v18;
        --v16;
      }
      while (v16);
    }
    v20 = v14[12];
    v21 = v14[13];
    if (v20 < v21 + v20)
    {
      v22 = (_QWORD *)(v11 + 8 * v20);
      v23 = (_QWORD *)(v13 + 8 * v20);
      do
      {
        v24 = (void *)objc_msgSend(a4, "valueForKey:", *v23);
        if (v24)
          v25 = v24;
        else
          v25 = (id)NSKeyValueCoding_NullValue;
        *v22++ = v25;
        ++v23;
        --v21;
      }
      while (v21);
    }
    v6->_propertyCache = v10;
  }
  return v6;
}

- (NSIncrementalStoreNode)initWithObjectID:(NSManagedObjectID *)objectID withValues:(NSDictionary *)values version:(uint64_t)version
{
  NSIncrementalStoreNode *v8;
  NSManagedObjectID *v9;
  NSEntityDescription *v10;
  NSEntityDescription *v11;
  id propertyMapping;
  NSKnownKeysDictionary *v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  size_t v19;
  uint64_t v20;
  char *v21;
  _NSRange *propertyRanges;
  NSUInteger location;
  NSUInteger length;
  _QWORD *v25;
  NSUInteger v26;
  uint64_t i;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  id v33;
  uint64_t v35;
  NSKnownKeysDictionary *v36;
  NSIncrementalStoreNode *v37;
  uint64_t *v38;
  uint64_t v39;
  objc_super v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)NSIncrementalStoreNode;
  v8 = -[NSIncrementalStoreNode init](&v40, sel_init);
  if (v8)
  {
    v9 = objectID;
    v8->_reserved1 = 0;
    v8->_objectID = v9;
    v8->_versionNumber = version;
    v10 = -[NSManagedObjectID entity](objectID, "entity");
    v11 = v10;
    if (v10)
      propertyMapping = v10->_propertyMapping;
    else
      propertyMapping = 0;
    v13 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", propertyMapping);
    v14 = -[NSDictionary count](values, "count");
    v15 = -[NSKnownKeysDictionary values](v13, "values");
    v38 = &v35;
    v39 = v15;
    MEMORY[0x1E0C80A78](v15);
    v18 = (char *)&v35 - v17;
    v19 = 8 * v16;
    if (v14 > 0x200)
    {
      v18 = (char *)NSAllocateScannedUncollectable();
      v21 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v35 - v17, 8 * v16);
      MEMORY[0x1E0C80A78](v20);
      v21 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v21, v19);
    }
    -[NSDictionary getObjects:andKeys:](values, "getObjects:andKeys:", v18, v21);
    propertyRanges = v11->_propertyRanges;
    location = propertyRanges[6].location;
    length = propertyRanges[6].length;
    if (location < length + location)
    {
      v25 = (_QWORD *)(v39 + 8 * location);
      v26 = length;
      do
      {
        *v25++ = NSKeyValueCoding_NullValue;
        --v26;
      }
      while (v26);
    }
    if (v14)
    {
      v36 = v13;
      v37 = v8;
      for (i = 0; i != v14; ++i)
      {
        v28 = objc_msgSend(propertyMapping, "indexForKey:", *(_QWORD *)&v21[8 * i]);
        if (v28 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v29 = v28;
          v30 = *(void **)&v18[8 * i];
          if (v30 == (void *)NSKeyValueCoding_NullValue && v28 - location < length && v28 >= location)
            v30 = 0;
          v33 = v30;
          *(_QWORD *)(v39 + 8 * v29) = v33;
        }
      }
      v13 = v36;
      v8 = v37;
      if (v14 >= 0x201)
      {
        NSZoneFree(0, v21);
        NSZoneFree(0, v18);
      }
    }
    v8->_propertyCache = v13;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_objectID = 0;
  self->_propertyCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSIncrementalStoreNode;
  -[NSIncrementalStoreNode dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %u"), self->_objectID, self->_versionNumber);
}

- (void)updateWithValues:(NSDictionary *)values version:(uint64_t)version
{
  NSEntityDescription *v6;
  NSEntityDescription *v7;
  id propertyMapping;
  id propertyCache;
  NSUInteger v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  size_t v15;
  uint64_t v16;
  char *v17;
  _NSRange *propertyRanges;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v21;
  NSUInteger v22;
  uint64_t i;
  unint64_t v24;
  uint64_t v27;
  uint64_t v28;
  NSIncrementalStoreNode *v29;
  uint64_t v30;
  uint64_t v31;

  v30 = version;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = -[NSManagedObjectID entity](self->_objectID, "entity");
  v7 = v6;
  if (v6)
    propertyMapping = v6->_propertyMapping;
  else
    propertyMapping = 0;
  propertyCache = self->_propertyCache;
  v10 = -[NSDictionary count](values, "count");
  v11 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v28 - v13;
  v15 = 8 * v12;
  v29 = self;
  if (v11 > 0x200)
  {
    v14 = (char *)NSAllocateScannedUncollectable();
    v17 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)&v28 - v13, 8 * v12);
    MEMORY[0x1E0C80A78](v16);
    v17 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v17, v15);
  }
  -[NSDictionary getObjects:andKeys:](values, "getObjects:andKeys:", v14, v17);
  objc_msgSend(propertyCache, "removeAllObjects");
  propertyRanges = v7->_propertyRanges;
  location = propertyRanges[6].location;
  length = propertyRanges[6].length;
  if (location < length + location)
  {
    v21 = propertyRanges[6].length;
    v22 = propertyRanges[6].location;
    do
    {
      objc_msgSend(propertyCache, "setValue:atIndex:", NSKeyValueCoding_NullValue, v22++);
      --v21;
    }
    while (v21);
  }
  if (v10)
  {
    for (i = 0; i != v10; ++i)
    {
      v24 = objc_msgSend(propertyMapping, "indexForKey:", *(_QWORD *)&v17[8 * i]);
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (*(_QWORD *)&v14[8 * i] == NSKeyValueCoding_NullValue && v24 - location < length && v24 >= location)
          v27 = 0;
        else
          v27 = *(_QWORD *)&v14[8 * i];
        objc_msgSend(propertyCache, "setValue:atIndex:", v27, v24);
      }
    }
    if (v10 >= 0x201)
    {
      NSZoneFree(0, v17);
      NSZoneFree(0, v14);
    }
  }
  v29->_versionNumber = v30;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (uint64_t)version
{
  return self->_versionNumber;
}

- (id)valueForPropertyDescription:(NSPropertyDescription *)prop
{
  NSEntityDescription *v5;
  NSEntityDescription *v6;
  NSEntityDescription *v7;
  uint64_t v8;
  unint64_t v9;
  id result;
  _NSRange *propertyRanges;
  NSUInteger length;
  unint64_t location;
  unint64_t v14;
  BOOL v15;
  unint64_t v16;

  v5 = -[NSPropertyDescription entity](prop, "entity");
  v6 = -[NSManagedObjectID entity](self->_objectID, "entity");
  v7 = v6;
  if (prop && v5 == v6)
    goto LABEL_3;
  if (!prop
    || !-[NSEntityDescription isKindOfEntity:](v6, "isKindOfEntity:", -[NSPropertyDescription entity](prop, "entity")))
  {
    return 0;
  }
  v16 = -[NSPropertyDescription _propertyType](prop, "_propertyType");
  if (-[NSPropertyDescription _isAttribute](prop, "_isAttribute"))
  {
LABEL_3:
    v8 = -[NSPropertyDescription _entitysReferenceID](prop, "_entitysReferenceID");
  }
  else
  {
    if (v16 != 4)
      return 0;
    v8 = -[NSEntityDescription _offsetRelationshipIndex:fromSuperEntity:andIsToMany:](v7, "_offsetRelationshipIndex:fromSuperEntity:andIsToMany:", -[NSPropertyDescription _entitysReferenceID](prop, "_entitysReferenceID"), v5, -[NSPropertyDescription isToMany](prop, "isToMany"));
  }
  v9 = v8;
  if (v8 < 0)
    return 0;
  result = (id)objc_msgSend(self->_propertyCache, "valueAtIndex:", v8);
  propertyRanges = v7->_propertyRanges;
  location = propertyRanges[6].location;
  length = propertyRanges[6].length;
  v15 = v9 >= location;
  v14 = v9 - location;
  v15 = !v15 || v14 >= length;
  if (!v15)
  {
    if (result != (id)NSKeyValueCoding_NullValue)
    {
      if (!result)
        return (id)NSKeyValueCoding_NullValue;
      return result;
    }
    return 0;
  }
  return result;
}

- (id)_propertyCache
{
  return self->_propertyCache;
}

- (const)knownKeyValuesPointer
{
  return (const void **)objc_msgSend(self->_propertyCache, "values");
}

- (id)_snapshot_
{
  return 0;
}

- (unsigned)_versionNumber
{
  return self->_versionNumber;
}

@end
