@implementation PFUbiquityGlobalObjectID

- (PFUbiquityGlobalObjectID)init
{
  PFUbiquityGlobalObjectID *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityGlobalObjectID;
  result = -[PFUbiquityGlobalObjectID init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_primaryKey = 0u;
    *(_OWORD *)&result->_storeName = 0u;
    result->_hash = 0x7FFFFFFFFFFFFFFFLL;
    result->_managedObjectID = 0;
    result->_primaryKeyInteger = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (PFUbiquityGlobalObjectID)initWithStoreName:(id)a3 entityName:(id)a4 primaryKeyInteger:(unint64_t)a5 andPeerID:(id)a6
{
  PFUbiquityGlobalObjectID *v10;

  v10 = -[PFUbiquityGlobalObjectID init](self, "init");
  if (v10)
  {
    v10->_storeName = (NSString *)a3;
    v10->_entityName = (NSString *)objc_msgSend(a4, "copy");
    v10->_primaryKeyInteger = a5;
    v10->_primaryKey = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("p%lu"), a5);
    v10->_owningPeerID = (NSString *)a6;
    -[PFUbiquityGlobalObjectID updateHash](v10, "updateHash");
  }
  return v10;
}

- (PFUbiquityGlobalObjectID)initWithStoreName:(id)a3 entityName:(id)a4 primaryKey:(id)a5 andPeerID:(id)a6
{
  PFUbiquityGlobalObjectID *v10;

  v10 = -[PFUbiquityGlobalObjectID init](self, "init");
  if (v10)
  {
    v10->_storeName = (NSString *)a3;
    v10->_entityName = (NSString *)objc_msgSend(a4, "copy");
    v10->_primaryKey = (NSString *)a5;
    v10->_owningPeerID = (NSString *)a6;
    -[PFUbiquityGlobalObjectID updateHash](v10, "updateHash");
  }
  return v10;
}

- (PFUbiquityGlobalObjectID)initWithString:(id)a3
{
  PFUbiquityGlobalObjectID *v4;
  void *v5;

  v4 = -[PFUbiquityGlobalObjectID init](self, "init");
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", PFUbiquityGlobalObjectIDSeparator);
    v4->_storeName = (NSString *)(id)objc_msgSend(v5, "objectAtIndex:", 0);
    v4->_entityName = (NSString *)(id)objc_msgSend(v5, "objectAtIndex:", 1);
    v4->_primaryKey = (NSString *)(id)objc_msgSend(v5, "objectAtIndex:", 2);
    v4->_owningPeerID = (NSString *)(id)objc_msgSend(v5, "objectAtIndex:", 3);
    -[PFUbiquityGlobalObjectID updateHash](v4, "updateHash");
  }
  return v4;
}

- (PFUbiquityGlobalObjectID)initWithCompressedString:(id)a3 forStoreWithName:(id)a4 andEntityNames:(id)a5 primaryKeys:(id)a6 peerIDs:(id)a7
{
  PFUbiquityGlobalObjectID *v12;
  void *v13;

  v12 = -[PFUbiquityGlobalObjectID init](self, "init");
  if (v12)
  {
    v12->_storeName = (NSString *)a4;
    v13 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", PFUbiquityGlobalObjectIDSeparator);
    v12->_entityName = (NSString *)(id)+[PFUbiquityGlobalObjectID stringValueFromArray:atIndexDescribedByStringNumber:](PFUbiquityGlobalObjectID, "stringValueFromArray:atIndexDescribedByStringNumber:", a5, objc_msgSend(v13, "objectAtIndex:", 0));
    v12->_primaryKey = (NSString *)(id)+[PFUbiquityGlobalObjectID stringValueFromArray:atIndexDescribedByStringNumber:](PFUbiquityGlobalObjectID, "stringValueFromArray:atIndexDescribedByStringNumber:", a6, objc_msgSend(v13, "objectAtIndex:", 1));
    v12->_owningPeerID = (NSString *)(id)+[PFUbiquityGlobalObjectID stringValueFromArray:atIndexDescribedByStringNumber:](PFUbiquityGlobalObjectID, "stringValueFromArray:atIndexDescribedByStringNumber:", a7, objc_msgSend(v13, "objectAtIndex:", 2));
    -[PFUbiquityGlobalObjectID updateHash](v12, "updateHash");
  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PFUbiquityGlobalObjectID *v4;
  NSString *entityName;
  NSString *storeName;
  NSString *owningPeerID;
  NSString *primaryKey;
  NSManagedObjectID *managedObjectID;
  unint64_t hash;
  unint64_t primaryKeyInteger;
  PFUbiquityGlobalObjectID *v12;

  v4 = +[PFUbiquityGlobalObjectID allocWithZone:](PFUbiquityGlobalObjectID, "allocWithZone:", a3);
  if (!v4)
    return 0;
  storeName = self->_storeName;
  entityName = self->_entityName;
  primaryKey = self->_primaryKey;
  owningPeerID = self->_owningPeerID;
  hash = self->_hash;
  managedObjectID = self->_managedObjectID;
  primaryKeyInteger = self->_primaryKeyInteger;
  v12 = -[PFUbiquityGlobalObjectID init](v4, "init");
  if (v12)
  {
    v12->_storeName = storeName;
    v12->_entityName = (NSString *)-[NSString copy](entityName, "copy");
    v12->_primaryKey = primaryKey;
    v12->_owningPeerID = owningPeerID;
    v12->_hash = hash;
    v12->_managedObjectID = managedObjectID;
    v12->_primaryKeyInteger = primaryKeyInteger;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  self->_entityName = 0;
  self->_storeName = 0;

  self->_primaryKey = 0;
  self->_owningPeerID = 0;

  self->_managedObjectID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityGlobalObjectID;
  -[PFUbiquityGlobalObjectID dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3;
  void *v4;
  objc_super v6;

  v3 = -[PFUbiquityGlobalObjectID createGlobalIDString](self);
  v6.receiver = self;
  v6.super_class = (Class)PFUbiquityGlobalObjectID;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), -[PFUbiquityGlobalObjectID description](&v6, sel_description), v3);

  return v4;
}

- (id)createGlobalIDString
{
  id v2;

  if (!a1)
    return 0;
  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v2, "appendString:", a1[1]);
  objc_msgSend(v2, "appendString:", PFUbiquityGlobalObjectIDSeparator);
  objc_msgSend(v2, "appendString:", a1[2]);
  objc_msgSend(v2, "appendString:", PFUbiquityGlobalObjectIDSeparator);
  objc_msgSend(v2, "appendString:", a1[3]);
  objc_msgSend(v2, "appendString:", PFUbiquityGlobalObjectIDSeparator);
  objc_msgSend(v2, "appendString:", a1[4]);
  return v2;
}

- (void)updateHash
{
  id v3;

  if (self->_primaryKeyInteger == 0x7FFFFFFFFFFFFFFFLL)
    self->_primaryKeyInteger = +[PFUbiquityPeerRangeCache integerFromPrimaryKeyString:]((uint64_t)PFUbiquityPeerRangeCache, self->_primaryKey);
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", self->_primaryKey);
  objc_msgSend(v3, "appendString:", self->_entityName);
  objc_msgSend(v3, "appendString:", self->_owningPeerID);
  objc_msgSend(v3, "appendString:", self->_storeName);
  self->_hash = +[_PFRoutines _generateUbiquityHashForPath:]((uint64_t)_PFRoutines, v3);

}

- (BOOL)isEqual:(id)a3
{
  unint64_t hash;
  _BOOL4 v6;

  if (!a3)
    goto LABEL_8;
  if (self == a3)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  hash = self->_hash;
  if (hash == objc_msgSend(a3, "hash") && self->_primaryKeyInteger == *((_QWORD *)a3 + 7))
  {
    v6 = -[NSString isEqualToString:](self->_owningPeerID, "isEqualToString:", *((_QWORD *)a3 + 4));
    if (v6)
    {
      v6 = -[NSString isEqualToString:](self->_entityName, "isEqualToString:", *((_QWORD *)a3 + 2));
      if (v6)
        LOBYTE(v6) = -[NSString isEqualToString:](self->_storeName, "isEqualToString:", *((_QWORD *)a3 + 1));
    }
  }
  else
  {
LABEL_8:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (int64_t)compare:(id)a3
{
  unint64_t primaryKeyInteger;
  unint64_t v6;
  int64_t result;
  uint64_t v8;

  primaryKeyInteger = self->_primaryKeyInteger;
  if (a3)
  {
    v6 = *((_QWORD *)a3 + 7);
    if (primaryKeyInteger == v6)
    {
      result = -[NSString compare:](self->_owningPeerID, "compare:", *((_QWORD *)a3 + 4));
      if (!result)
      {
        result = -[NSString compare:](self->_entityName, "compare:", *((_QWORD *)a3 + 2));
        if (!result)
        {
          v8 = *((_QWORD *)a3 + 1);
          return -[NSString compare:](self->_storeName, "compare:", v8);
        }
      }
      return result;
    }
    if (primaryKeyInteger < v6)
      return -1;
    return primaryKeyInteger > v6;
  }
  if (primaryKeyInteger)
  {
    v6 = 0;
    return primaryKeyInteger > v6;
  }
  result = -[NSString compare:](self->_owningPeerID, "compare:", 0);
  if (!result)
  {
    result = -[NSString compare:](self->_entityName, "compare:", 0);
    if (!result)
    {
      v8 = 0;
      return -[NSString compare:](self->_storeName, "compare:", v8);
    }
  }
  return result;
}

- (id)createCompressedStringWithEntityNameToIndex:(void *)a3 primaryKeyToIndex:(void *)a4 peerIDToIndex:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  if (!a1)
    return 0;
  v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v9 = (void *)objc_msgSend(a2, "objectForKey:", a1[2]);
  v10 = (void *)objc_msgSend(a3, "objectForKey:", a1[3]);
  v11 = (void *)objc_msgSend(a4, "objectForKey:", a1[4]);
  objc_msgSend(v8, "appendString:", objc_msgSend(v9, "stringValue"));
  objc_msgSend(v8, "appendString:", PFUbiquityGlobalObjectIDSeparator);
  objc_msgSend(v8, "appendString:", objc_msgSend(v10, "stringValue"));
  objc_msgSend(v8, "appendString:", PFUbiquityGlobalObjectIDSeparator);
  objc_msgSend(v8, "appendString:", objc_msgSend(v11, "stringValue"));
  return v8;
}

- (unint64_t)hash
{
  return self->_hash;
}

@end
