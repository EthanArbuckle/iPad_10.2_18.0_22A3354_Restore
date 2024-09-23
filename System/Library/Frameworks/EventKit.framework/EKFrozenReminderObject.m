@implementation EKFrozenReminderObject

- (EKFrozenReminderObject)initWithREMObject:(id)a3 inStore:(id)a4
{
  return -[EKFrozenReminderObject initWithREMObject:inStore:withChanges:](self, "initWithREMObject:inStore:withChanges:", a3, a4, 0);
}

- (EKFrozenReminderObject)initWithREMObject:(id)a3 inStore:(id)a4 withChanges:(id)a5
{
  id v10;
  id v11;
  id v12;
  EKFrozenReminderObject *v13;
  EKFrozenReminderObject *v14;
  void *v15;
  EKChangeSet *changeSet;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EKFrozenReminderObject;
  v13 = -[EKPersistentObject init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(&v13->_remObject, a3);
    objc_storeWeak((id *)&v14->_reminderStore, v11);
    objc_msgSend(v11, "eventStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPersistentObject _setEventStore:](v14, "_setEventStore:", v15);

    objc_storeStrong((id *)&v14->_changeSet, a5);
    changeSet = v14->_changeSet;
    if (changeSet)
    {
      if (!-[EKChangeSet skipsPersistentObjectCopy](changeSet, "skipsPersistentObjectCopy"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("EKFrozenReminderObject.m"), 36, CFSTR("You must set skipsPersistentObjectCopy on change sets used by EKFrozenReminderObject."));

      }
    }
  }

  return v14;
}

- (id)REMObject
{
  return self->_remObject;
}

- (id)remObjectID
{
  return (id)objc_msgSend(self->_remObject, "objectID");
}

- (id)updatedFrozenObjectWithChanges:(id)a3
{
  return -[EKFrozenReminderObject updatedFrozenObjectWithChanges:updatedChildren:](self, "updatedFrozenObjectWithChanges:updatedChildren:", a3, 0);
}

- (id)updatedFrozenObjectWithChanges:(id)a3 updatedChildren:(id)a4
{
  id v6;
  id v7;
  void *v8;
  EKChangeSet *changeSet;
  void *v10;
  id v11;
  void *v12;
  id WeakRetained;
  EKFrozenReminderObject *v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    if (!v7 || (changeSet = self->_changeSet) == 0)
    {
      v14 = self;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  changeSet = self->_changeSet;
  if (changeSet)
  {
LABEL_6:
    v10 = (void *)-[EKChangeSet copy](changeSet, "copy");
    objc_msgSend(v10, "setSkipsPersistentObjectCopy:", 1);
    if (v6)
      objc_msgSend(v10, "addChangesAndUpdateUniqueMultiValueObjects:", v6);
    goto LABEL_8;
  }
  v10 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v10, "setSkipsPersistentObjectCopy:", 1);
LABEL_8:
  objc_msgSend(v10, "replaceUniqueMultiValueObjectsWithUpdatedObjects:", v8);
  v11 = objc_alloc((Class)objc_opt_class());
  -[EKFrozenReminderObject REMObject](self, "REMObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_reminderStore);
  v14 = (EKFrozenReminderObject *)objc_msgSend(v11, "initWithREMObject:inStore:withChanges:", v12, WeakRetained, v10);

LABEL_10:
  return v14;
}

- (id)valueForSingleValueKey:(id)a3 backingValue:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (-[EKChangeSet hasUnsavedChangeForKey:](self->_changeSet, "hasUnsavedChangeForKey:", v6))
    -[EKChangeSet valueForSingleValueKey:basedOn:](self->_changeSet, "valueForSingleValueKey:basedOn:", v6, 0);
  else
    v7[2](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (EKChangeSet)uncommittedChanges
{
  return self->_changeSet;
}

- (BOOL)_applyChangesToSaveRequest:(id)a3 error:(id *)a4
{
  NSObject *v6;

  +[EKReminderStore log](EKReminderStore, "log", a3, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[EKFrozenReminderObject _applyChangesToSaveRequest:error:].cold.1((uint64_t)self, v6);

  -[EKFrozenReminderObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)uniqueIdentifierForREMObject:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)canCommitSelf
{
  return 1;
}

- (id)updateParentToCommitSelf:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  +[EKReminderStore log](EKReminderStore, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[EKFrozenReminderObject updateParentToCommitSelf:].cold.1((uint64_t)self, (uint64_t)v4, v5);

  return v4;
}

- (BOOL)isFrozen
{
  return 1;
}

- (BOOL)isPartialObject
{
  return 0;
}

- (id)uniqueIdentifier
{
  return 0;
}

- (id)changeSet
{
  return 0;
}

- (id)existingMeltedObject
{
  return 0;
}

- (BOOL)isPropertyUnavailable:(id)a3
{
  return 0;
}

+ (Class)meltedClass
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isCompletelyEqual:(id)a3
{
  return a3 == self;
}

- (BOOL)isEqual:(id)a3 ignoringProperties:(id)a4
{
  return a3 == self;
}

- (BOOL)isNew
{
  void *v2;
  BOOL v3;

  -[EKFrozenReminderObject REMObject](self, "REMObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (int)entityType
{
  return -1;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  EKFrozenReminderObject *v5;
  uint64_t v6;
  char v7;
  EKFrozenReminderObject *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (EKFrozenReminderObject *)a3;
  if (v5 == self)
  {
    v7 = 1;
    goto LABEL_12;
  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v8 = v5;
    -[EKFrozenReminderObject uniqueIdentifier](self, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      || (-[EKFrozenReminderObject uniqueIdentifier](v8, "uniqueIdentifier"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[EKFrozenReminderObject uniqueIdentifier](self, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKFrozenReminderObject uniqueIdentifier](v8, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "isEqual:", v11);

      if (v9)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v7 = 1;
    }

    goto LABEL_11;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[EKFrozenReminderObject uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)existsInStore
{
  return 1;
}

- (NSArray)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_remObject, 0);
  objc_destroyWeak((id *)&self->_reminderStore);
  objc_storeStrong((id *)&self->_changeSet, 0);
}

- (void)_applyChangesToSaveRequest:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A2318000, a2, OS_LOG_TYPE_ERROR, "_applyChangesToSaveRequest:error: called on a class (%{public}@) that doesn't provide an implementation.", (uint8_t *)&v5, 0xCu);

}

- (void)updateParentToCommitSelf:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "This object doesn't know how to update its parent. self=%@, parent=%@", (uint8_t *)&v3, 0x16u);
}

@end
