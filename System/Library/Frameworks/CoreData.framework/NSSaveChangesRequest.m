@implementation NSSaveChangesRequest

- (unint64_t)requestType
{
  return 2;
}

- (NSSet)deletedObjects
{
  return self->_deletedObjects;
}

- (NSSet)lockedObjects
{
  return self->_optimisticallyLockedObjects;
}

- (BOOL)hasChanges
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 16), "count");
    v3 = objc_msgSend(*(id *)(v1 + 24), "count") + v2;
    return v3 + objc_msgSend(*(id *)(v1 + 32), "count") != 0;
  }
  return result;
}

- (NSSet)insertedObjects
{
  return self->_insertedObjects;
}

- (NSSet)updatedObjects
{
  return self->_updatedObjects;
}

- (BOOL)_secureOperation
{
  return (BYTE1(self->_flags) >> 1) & 1;
}

+ (void)initialize
{
  objc_opt_self();
}

- (void)dealloc
{
  objc_super v3;

  self->_insertedObjects = 0;
  self->_updatedObjects = 0;

  self->_deletedObjects = 0;
  self->_optimisticallyLockedObjects = 0;

  self->_mutatedObjectIDsNotifications = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSaveChangesRequest;
  -[NSPersistentStoreRequest dealloc](&v3, sel_dealloc);
}

- (NSSaveChangesRequest)initWithInsertedObjects:(NSSet *)insertedObjects updatedObjects:(NSSet *)updatedObjects deletedObjects:(NSSet *)deletedObjects lockedObjects:(NSSet *)lockedObjects
{
  NSSaveChangesRequest *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NSSaveChangesRequest;
  v10 = -[NSSaveChangesRequest init](&v12, sel_init);
  if (v10)
  {
    v10->_insertedObjects = insertedObjects;
    v10->_updatedObjects = updatedObjects;
    v10->_deletedObjects = deletedObjects;
    v10->_optimisticallyLockedObjects = lockedObjects;
    v10->_flags = 0;
  }
  return v10;
}

- (NSSaveChangesRequest)init
{
  NSSaveChangesRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSaveChangesRequest;
  result = -[NSSaveChangesRequest init](&v3, sel_init);
  if (result)
  {
    result->_insertedObjects = 0;
    result->_updatedObjects = 0;
    result->_deletedObjects = 0;
    result->_optimisticallyLockedObjects = 0;
    result->_flags = 0;
  }
  return result;
}

- (id)description
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  void *v11;
  id v12;
  objc_super v14;

  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v4 = (__CFString *)objc_msgSend(-[NSSet valueForKey:](self->_insertedObjects, "valueForKey:", CFSTR("objectID")), "allObjects");
  v5 = (__CFString *)objc_msgSend(-[NSSet valueForKey:](self->_updatedObjects, "valueForKey:", CFSTR("objectID")), "allObjects");
  v6 = (__CFString *)objc_msgSend(-[NSSet valueForKey:](self->_deletedObjects, "valueForKey:", CFSTR("objectID")), "allObjects");
  v7 = (__CFString *)objc_msgSend(-[NSSet valueForKey:](self->_optimisticallyLockedObjects, "valueForKey:", CFSTR("objectID")), "allObjects");
  v8 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)NSSaveChangesRequest;
  v9 = -[NSSaveChangesRequest description](&v14, sel_description);
  if (!-[__CFString count](v4, "count"))
    v4 = &stru_1E1EE23F0;
  if (!-[__CFString count](v5, "count"))
    v5 = &stru_1E1EE23F0;
  if (!-[__CFString count](v6, "count"))
    v6 = &stru_1E1EE23F0;
  if (-[__CFString count](v7, "count"))
    v10 = v7;
  else
    v10 = &stru_1E1EE23F0;
  v11 = (void *)objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ { inserts (%@), updates (%@), deletes (%@) locks (%@) }"), v9, v4, v5, v6, v10);
  v12 = v11;
  objc_msgSend(v3, "drain");
  return v11;
}

- (_QWORD)setDeletedObjects:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = (void *)result[4];
    if (v4 != a2)
    {

      result = (_QWORD *)objc_msgSend(a2, "count");
      if (result)
        result = a2;
      v3[4] = result;
    }
  }
  return result;
}

- (void)_setSecureOperation:(BOOL)a3
{
  unint64_t v3;

  v3 = self->_flags | 0x200;
  if (!a3)
    v3 = self->_flags & 0xFFFFFEFF;
  self->_flags = v3;
}

- (uint64_t)_addChangedObjectIDsNotification:(uint64_t)result
{
  uint64_t v3;
  id v4;

  if (result)
  {
    v3 = result;
    v4 = *(id *)(result + 56);
    if (!v4)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *(_QWORD *)(v3 + 56) = v4;
    }
    return objc_msgSend(v4, "addObject:", a2);
  }
  return result;
}

@end
