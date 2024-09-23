@implementation NSConstraintConflict

- (NSConstraintConflict)initWithConstraint:(NSArray *)contraint databaseObject:(NSManagedObject *)databaseObject databaseSnapshot:(NSDictionary *)databaseSnapshot conflictingObjects:(NSArray *)conflictingObjects conflictingSnapshots:(NSArray *)conflictingSnapshots
{
  NSConstraintConflict *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)NSConstraintConflict;
  v12 = -[NSConstraintConflict init](&v32, sel_init);
  if (v12)
  {
    v27 = conflictingSnapshots;
    v12->_constraint = contraint;
    v12->_databaseObject = databaseObject;
    v12->_databaseSnapshot = databaseSnapshot;
    v12->_conflictingObjects = conflictingObjects;
    v12->_conflictedValues = (NSDictionary *)-[NSKnownKeysDictionary initForKeys:]([NSKnownKeysDictionary alloc], "initForKeys:", contraint);
    v13 = -[NSArray lastObject](conflictingObjects, "lastObject");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](contraint, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (!v14)
      goto LABEL_21;
    v15 = v14;
    v16 = *(_QWORD *)v29;
    while (1)
    {
      v17 = contraint;
      v18 = 0;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v17);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v18);
        v20 = (void *)objc_msgSend(v19, "componentsSeparatedByString:", CFSTR("."));
        if ((unint64_t)objc_msgSend(v20, "count") < 2)
        {
          v22 = (void *)objc_msgSend(v13, "valueForKey:", v19);
          if (!v22)
            goto LABEL_15;
        }
        else
        {
          if (!objc_msgSend(v20, "count"))
            goto LABEL_15;
          v21 = 0;
          v22 = 0;
          do
          {
            v23 = objc_msgSend(v20, "objectAtIndex:", v21);
            if (v21)
              v24 = objc_msgSend(v22, "objectForKey:", v23);
            else
              v24 = objc_msgSend(v13, "valueForKey:", v23);
            v22 = (void *)v24;
            ++v21;
          }
          while (objc_msgSend(v20, "count") > v21);
          if (!v22)
LABEL_15:
            v22 = (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
        }
        -[NSDictionary setValue:forKey:](v12->_conflictedValues, "setValue:forKey:", v22, v19);
        ++v18;
      }
      while (v18 != v15);
      contraint = v17;
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      v15 = v25;
      if (!v25)
      {
LABEL_21:
        v12->_conflictingSnapshots = v27;
        return v12;
      }
    }
  }
  return v12;
}

- (NSManagedObject)databaseObject
{
  return (NSManagedObject *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)conflictingObjects
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)_isDBConflict
{
  return self->_databaseObject != 0;
}

- (NSDictionary)databaseSnapshot
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)constraint
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)dealloc
{
  objc_super v3;

  self->_constraint = 0;
  self->_databaseSnapshot = 0;

  self->_databaseObject = 0;
  self->_conflictingSnapshots = 0;

  self->_conflictingObjects = 0;
  self->_conflictedValues = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSConstraintConflict;
  -[NSConstraintConflict dealloc](&v3, sel_dealloc);
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
    objc_msgSend(a3, "encodeObject:forKey:", self->_constraint, CFSTR("_constraint"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_conflictedValues, CFSTR("_conflictedValues"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_databaseObject, CFSTR("_databaseObject"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_databaseSnapshot, CFSTR("_databaseSnapshot"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_conflictingObjects, CFSTR("_conflictingObjects"));
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

- (NSConstraintConflict)initWithCoder:(id)a3
{
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a3, "requiresSecureCoding")
    && (objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(a3, "userInfo")
    && !objc_msgSend((id)objc_msgSend(a3, "userInfo"), "valueForKey:", CFSTR("PSCKey"))
    || (objc_msgSend(a3, "requiresSecureCoding") & 1) == 0 && !objc_msgSend(a3, "delegate"))
  {
    NSLog((NSString *)CFSTR("This is probably not where you want to be"));
  }
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  self->_constraint = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("_constraint"));
  self->_conflictedValues = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), CFSTR("_conflictedValues"));
  self->_databaseObject = (NSManagedObject *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), CFSTR("_databaseObject"));
  self->_databaseSnapshot = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), CFSTR("_databaseSnapshot"));
  self->_conflictingObjects = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), CFSTR("_conflictingObjects"));
  return self;
}

- (void)_doCleanupForXPCStore:(id)a3 context:(id)a4
{
  uint64_t v6;
  NSManagedObject *v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = objc_msgSend(a4, "objectWithID:", -[NSArray firstObject](self->_conflictingObjects, "firstObject", a3));

  self->_conflictingObjects = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v6, 0);
  v7 = (NSManagedObject *)(id)objc_msgSend(a4, "objectWithID:", self->_databaseObject);

  self->_databaseObject = v7;
  v8 = objc_alloc(MEMORY[0x1E0C99D20]);
  v9 = -[NSArray firstObject](self->_conflictingObjects, "firstObject");
  if (v9 && (v10 = v9[6]) != 0)
    v11 = *(_QWORD *)(v10 + 8);
  else
    v11 = 0;
  self->_conflictingSnapshots = (NSArray *)objc_msgSend(v8, "initWithObjects:", v11, 0);
}

- (id)description
{
  id v3;

  v3 = (id)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, -[NSConstraintConflict conflictingObjects](self, "conflictingObjects"));
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%p) for constraint %@: database: %@, conflictedObjects: %@"), objc_opt_class(), self, -[NSConstraintConflict constraint](self, "constraint"), -[NSManagedObject objectID](-[NSConstraintConflict databaseObject](self, "databaseObject"), "objectID"), v3);
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%p) for constraint %@: database: %@, conflictedObjects: %@"), objc_opt_class(), self, -[NSConstraintConflict constraint](self, "constraint"), -[NSConstraintConflict databaseObject](self, "databaseObject"), -[NSConstraintConflict conflictingObjects](self, "conflictingObjects"));
}

- (NSDictionary)constraintValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)conflictingSnapshots
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

@end
