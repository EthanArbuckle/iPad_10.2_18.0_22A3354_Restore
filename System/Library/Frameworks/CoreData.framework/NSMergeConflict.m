@implementation NSMergeConflict

- (NSMergeConflict)initWithSource:(NSManagedObject *)srcObject newVersion:(NSUInteger)newvers oldVersion:(NSUInteger)oldvers cachedSnapshot:(NSDictionary *)cachesnap persistedSnapshot:(NSDictionary *)persnap
{
  NSMergeConflict *v12;
  NSKnownKeysDictionary *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NSMergeConflict;
  v12 = -[NSMergeConflict init](&v15, sel_init);
  if (v12)
  {
    v12->_source = srcObject;
    v12->_snapshot1 = 0;
    if (!persnap)
    {
      if (dword_1ECD8DA5C)
        v13 = -[NSManagedObject committedValuesForKeys:](srcObject, "committedValuesForKeys:", 0);
      else
        v13 = -[NSManagedObject _newCommittedSnapshotValues]((uint64_t *)srcObject);
      v12->_snapshot1 = v13;
    }
    v12->_snapshot2 = cachesnap;
    v12->_snapshot3 = persnap;
    v12->_newVersion = newvers;
    v12->_oldVersion = oldvers;
  }
  return v12;
}

- (NSMergeConflict)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSMergeConflict;
  return -[NSMergeConflict init](&v3, sel_init);
}

- (NSMergeConflict)initWithSource:(id)a3 newVersion:(unint64_t)a4 oldVersion:(unint64_t)a5 snapshot1:(id)a6 snapshot2:(id)a7 snapshot3:(id)a8
{
  NSMergeConflict *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NSMergeConflict;
  v14 = -[NSMergeConflict init](&v16, sel_init);
  if (v14)
  {
    v14->_source = a3;
    v14->_snapshot1 = a6;
    v14->_snapshot2 = a7;
    v14->_snapshot3 = a8;
    v14->_newVersion = a4;
    v14->_oldVersion = a5;
  }
  return v14;
}

- (id)description
{
  id snapshot1;
  id *p_snapshot2;
  const __CFString *v5;
  const __CFString *v6;
  id v7;
  char isKindOfClass;
  id source;
  unint64_t newVersion;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t oldVersion_low;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  snapshot1 = self->_snapshot1;
  if (snapshot1)
  {
    p_snapshot2 = &self->_snapshot2;
    v5 = CFSTR("cached row");
    v6 = CFSTR("object snapshot");
  }
  else
  {
    snapshot1 = self->_snapshot2;
    p_snapshot2 = &self->_snapshot3;
    v5 = CFSTR("database row");
    v6 = CFSTR("cached row");
  }
  v7 = *p_snapshot2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  source = self->_source;
  if ((isKindOfClass & 1) == 0)
    source = (id)objc_msgSend(self->_source, "objectID");
  newVersion = self->_newVersion;
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = objc_opt_class();
  v13 = self->_source;
  oldVersion_low = LODWORD(self->_oldVersion);
  if (newVersion)
    return (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ (%p) for NSManagedObject (%p) with objectID '%@' with oldVersion = %d and newVersion = %d and old %@ = %@ and new %@ = %@"), v12, self, v13, source, oldVersion_low, self->_newVersion, v6, snapshot1, v5, v7);
  else
    return (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ (%p) for NSManagedObject (%p) with objectID '%@' with oldVersion = %d and newVersion = <deleted> and old %@ = %@"), v12, self, v13, source, oldVersion_low, v6, snapshot1, v16, v17, v18);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSMergeConflict;
  -[NSMergeConflict dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (objc_msgSend(a3, "delegate") && (objc_msgSend(a3, "delegate"), (objc_opt_respondsToSelector() & 1) != 0))
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_source, CFSTR("_source"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_snapshot1, CFSTR("_snapshot1"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_snapshot2, CFSTR("_snapshot2"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_snapshot3, CFSTR("_snapshot3"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_oldVersion, CFSTR("_oldVersion"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_newVersion, CFSTR("_newVersion"));
  }
  else
  {
    v5 = objc_opt_class();
    NSLog((NSString *)CFSTR("Coder = %@ (%@)"), a3, v5);
    v6 = objc_msgSend(a3, "delegate");
    objc_msgSend(a3, "delegate");
    v7 = objc_opt_class();
    NSLog((NSString *)CFSTR("Delegate = %@ (%@)"), v6, v7);
    NSLog((NSString *)CFSTR("CoreData does not support encoding of conflict objects. Conflicts need to be resolved within the scope of a valid managed object context and should not be archived or serialized: %@"), self);
    __break(1u);
  }
}

- (NSMergeConflict)initWithCoder:(id)a3
{
  if (objc_msgSend(a3, "requiresSecureCoding")
    && (objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(a3, "userInfo")
    && !objc_msgSend((id)objc_msgSend(a3, "userInfo"), "valueForKey:", CFSTR("PSCKey"))
    || (objc_msgSend(a3, "requiresSecureCoding") & 1) == 0 && !objc_msgSend(a3, "delegate"))
  {
    NSLog((NSString *)CFSTR("This is probably not where you want to be"));
  }
  return -[NSMergeConflict initWithSource:newVersion:oldVersion:snapshot1:snapshot2:snapshot3:](self, "initWithSource:newVersion:oldVersion:snapshot1:snapshot2:snapshot3:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), CFSTR("_source")), objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_newVersion")), objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_oldVersion")), objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), CFSTR("_snapshot1")), objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), CFSTR("_snapshot2")), objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), CFSTR("_snapshot3")));
}

- (void)_doCleanupForXPCStore:(id)a3 context:(id)a4
{
  _WORD *v7;
  os_unfair_lock_s *v8;
  id v9;

  v7 = -[_NSQueryGenerationToken _generationalComponentForStore:](objc_msgSend(a4, "_queryGenerationToken"), a3);
  v8 = -[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)a3, self->_source, v7);
  v9 = (id)objc_msgSend(a4, "objectWithID:", self->_source);

  self->_source = v9;
  self->_snapshot3 = self->_snapshot2;
  self->_snapshot2 = (id)-[os_unfair_lock_s _propertyCache](v8, "_propertyCache");

  self->_snapshot1 = 0;
}

- (id)objectForKey:(id)a3
{
  void *v6;
  unint64_t newVersion;

  if (a3 == CFSTR("object"))
    return self->_source;
  if (a3 == CFSTR("snapshot"))
    return self->_snapshot1;
  if (a3 == CFSTR("cachedRow"))
    return self->_snapshot2;
  if (a3 == CFSTR("databaseRow"))
    return self->_snapshot3;
  if (a3 == CFSTR("newVersion"))
    goto LABEL_16;
  if (a3 == CFSTR("oldVersion"))
    goto LABEL_18;
  if (objc_msgSend(a3, "isEqual:", CFSTR("object")))
    return self->_source;
  if (objc_msgSend(a3, "isEqual:", CFSTR("snapshot")))
    return self->_snapshot1;
  if (objc_msgSend(a3, "isEqual:", CFSTR("cachedRow")))
    return self->_snapshot2;
  if (objc_msgSend(a3, "isEqual:", CFSTR("databaseRow")))
    return self->_snapshot3;
  if (objc_msgSend(a3, "isEqual:", CFSTR("newVersion")))
  {
LABEL_16:
    v6 = (void *)MEMORY[0x1E0CB37E8];
    newVersion = self->_newVersion;
    return (id)objc_msgSend(v6, "numberWithUnsignedInteger:", newVersion);
  }
  if (objc_msgSend(a3, "isEqual:", CFSTR("oldVersion")))
  {
LABEL_18:
    v6 = (void *)MEMORY[0x1E0CB37E8];
    newVersion = self->_oldVersion;
    return (id)objc_msgSend(v6, "numberWithUnsignedInteger:", newVersion);
  }
  return 0;
}

- (id)valueForKey:(id)a3
{
  void *v6;
  unint64_t oldVersion;
  objc_super v8;

  if (a3 == CFSTR("object"))
    return self->_source;
  if (a3 == CFSTR("snapshot"))
    return self->_snapshot1;
  if (a3 == CFSTR("cachedRow"))
    return self->_snapshot2;
  if (a3 != CFSTR("databaseRow"))
  {
    if (a3 != CFSTR("newVersion"))
    {
      if (a3 != CFSTR("oldVersion"))
      {
        if (objc_msgSend(a3, "isEqual:", CFSTR("object")))
          return self->_source;
        if (objc_msgSend(a3, "isEqual:", CFSTR("snapshot")))
          return self->_snapshot1;
        if (objc_msgSend(a3, "isEqual:", CFSTR("cachedRow")))
          return self->_snapshot2;
        if (objc_msgSend(a3, "isEqual:", CFSTR("databaseRow")))
          return self->_snapshot3;
        if (objc_msgSend(a3, "isEqual:", CFSTR("newVersion")))
          goto LABEL_17;
        if (!objc_msgSend(a3, "isEqual:", CFSTR("oldVersion")))
        {
          v8.receiver = self;
          v8.super_class = (Class)NSMergeConflict;
          return -[NSMergeConflict valueForKey:](&v8, sel_valueForKey_, a3);
        }
      }
      v6 = (void *)MEMORY[0x1E0CB37E8];
      oldVersion = self->_oldVersion;
      return (id)objc_msgSend(v6, "numberWithUnsignedInteger:", oldVersion);
    }
LABEL_17:
    v6 = (void *)MEMORY[0x1E0CB37E8];
    oldVersion = self->_newVersion;
    return (id)objc_msgSend(v6, "numberWithUnsignedInteger:", oldVersion);
  }
  return self->_snapshot3;
}

- (id)ancestorSnapshot
{
  return 0;
}

- (NSManagedObject)sourceObject
{
  return (NSManagedObject *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)objectSnapshot
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)cachedSnapshot
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)persistedSnapshot
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSUInteger)newVersionNumber
{
  return self->_newVersion;
}

- (NSUInteger)oldVersionNumber
{
  return self->_oldVersion;
}

@end
