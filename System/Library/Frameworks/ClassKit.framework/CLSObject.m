@implementation CLSObject

+ (id)relations
{
  if (qword_1ED0FB6D8 != -1)
    dispatch_once(&qword_1ED0FB6D8, &unk_1E9749A90);
  return (id)qword_1ED0FB6D0;
}

- (CLSObject)initWithDeletedObjectID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  CLSObject *v9;
  uint64_t v10;
  NSString *objectID;

  v4 = a3;
  v9 = (CLSObject *)objc_msgSend__init(self, v5, v6);
  if (v9)
  {
    v10 = objc_msgSend_copy(v4, v7, v8);
    objectID = v9->_objectID;
    v9->_objectID = (NSString *)v10;

    v9->_deleted = 1;
    v9->_enforceImmutability = 1;
  }

  return v9;
}

- (CLSObject)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v8, (uint64_t)CFSTR("The method -[%@ %@] is not available."), v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v3, v10, v4, v9, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (id)_init
{
  const char *v2;
  uint64_t v3;
  char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CLSObject;
  v4 = -[CLSObject init](&v19, sel_init);
  if (v4)
  {
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v2, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_copy(v8, v9, v10);
    v12 = (void *)*((_QWORD *)v4 + 11);
    *((_QWORD *)v4 + 11) = v11;

    objc_msgSend_date(MEMORY[0x1E0C99D68], v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v4 + 9);
    *((_QWORD *)v4 + 9) = v15;

    objc_storeStrong((id *)v4 + 10, *((id *)v4 + 9));
    v17 = (void *)*((_QWORD *)v4 + 12);
    *((_QWORD *)v4 + 12) = 0;

    *(_WORD *)(v4 + 9) = 257;
    v4[65] = 1;
    *((_QWORD *)v4 + 7) = 0;
  }
  return v4;
}

- (CLSObject)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  CLSObject *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *objectID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *parentObjectID;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSString *appIdentifier;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  NSDate *v27;
  NSDate *dateLastModified;
  NSDate *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  NSDate *dateExpires;
  const char *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  NSMutableDictionary *childrenByID;
  objc_super v45;
  _QWORD v46[5];

  v46[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CLSObject;
  v5 = -[CLSObject init](&v45, sel_init);
  v6 = (CLSObject *)v5;
  if (v5)
  {
    *(_WORD *)(v5 + 9) = 256;
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("objectID"));
    v9 = objc_claimAutoreleasedReturnValue();
    objectID = v6->_objectID;
    v6->_objectID = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, CFSTR("parentObjectID"));
    v13 = objc_claimAutoreleasedReturnValue();
    parentObjectID = v6->_parentObjectID;
    v6->_parentObjectID = (NSString *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, CFSTR("appIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    appIdentifier = v6->_appIdentifier;
    v6->_appIdentifier = (NSString *)v17;

    v6->_deleted = objc_msgSend_decodeBoolForKey_(v4, v19, (uint64_t)CFSTR("deleted"));
    v20 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, CFSTR("dateCreated"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      objc_msgSend_date(MEMORY[0x1E0C99D68], v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v6->_dateCreated, v24);
    v25 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, CFSTR("dateLastModified"));
    v27 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (!v27)
      v27 = v24;
    dateLastModified = v6->_dateLastModified;
    v6->_dateLastModified = v27;
    v29 = v27;

    v30 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, CFSTR("dateExpires"));
    v32 = objc_claimAutoreleasedReturnValue();
    dateExpires = v6->_dateExpires;
    v6->_dateExpires = (NSDate *)v32;

    v6->_temporary = objc_msgSend_decodeBoolForKey_(v4, v34, (uint64_t)CFSTR("temporary"));
    v6->_needsRepair = objc_msgSend_decodeBoolForKey_(v4, v35, (uint64_t)CFSTR("needsRepair"));
    v6->_lock = 0;
    v36 = (void *)MEMORY[0x1E0C99E60];
    v46[0] = objc_opt_class();
    v46[1] = objc_opt_class();
    v46[2] = objc_opt_class();
    v46[3] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v37, (uint64_t)v46, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v36, v39, (uint64_t)v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v41, (uint64_t)v40, CFSTR("childrenByID"));
    v42 = objc_claimAutoreleasedReturnValue();
    childrenByID = v6->_childrenByID;
    v6->_childrenByID = (NSMutableDictionary *)v42;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *objectID;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  id v15;

  objectID = self->_objectID;
  v15 = a3;
  objc_msgSend_encodeObject_forKey_(v15, v5, (uint64_t)objectID, CFSTR("objectID"));
  objc_msgSend_encodeObject_forKey_(v15, v6, (uint64_t)self->_parentObjectID, CFSTR("parentObjectID"));
  objc_msgSend_encodeObject_forKey_(v15, v7, (uint64_t)self->_appIdentifier, CFSTR("appIdentifier"));
  objc_msgSend_encodeBool_forKey_(v15, v8, self->_deleted, CFSTR("deleted"));
  objc_msgSend_encodeObject_forKey_(v15, v9, (uint64_t)self->_dateCreated, CFSTR("dateCreated"));
  objc_msgSend_encodeObject_forKey_(v15, v10, (uint64_t)self->_dateLastModified, CFSTR("dateLastModified"));
  objc_msgSend_encodeObject_forKey_(v15, v11, (uint64_t)self->_dateExpires, CFSTR("dateExpires"));
  objc_msgSend_encodeBool_forKey_(v15, v12, self->_temporary, CFSTR("temporary"));
  objc_msgSend_encodeBool_forKey_(v15, v13, self->_needsRepair, CFSTR("needsRepair"));
  objc_msgSend_encodeObject_forKey_(v15, v14, (uint64_t)self->_childrenByID, CFSTR("childrenByID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isImmutabilityEnforced
{
  return self->_enforceImmutability;
}

- (void)setEnforceImmutability:(BOOL)a3
{
  self->_enforceImmutability = a3;
}

- (void)lock
{
  os_unfair_recursive_lock_lock_with_options();
}

- (void)unlock
{
  os_unfair_recursive_lock_unlock();
}

- (CLSDataStore)dataStore
{
  uint64_t v2;
  CLSDataStore *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_dataStore;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setDataStore:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *childrenByID;
  const char *v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  objc_storeStrong((id *)&self->_dataStore, a3);
  v8 = self->_childrenByID;
  childrenByID = self->_childrenByID;
  self->_childrenByID = 0;

  objc_msgSend_unlock(self, v10, v11);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v8;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v26, v30, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v27;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v12);
        objc_msgSend_objectForKeyedSubscript_(v12, v15, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v18), (_QWORD)v26);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_graph(v5, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addEdgeFromVertex_toVertex_(v22, v23, (uint64_t)self, v19);

        v25 = (id)objc_msgSend_addObject_(v5, v24, (uint64_t)v19);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v26, v30, 16);
    }
    while (v16);
  }

}

- (id)childrenOfClass:(Class)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D40B4290;
  v4[3] = &unk_1E974BB88;
  v4[4] = a3;
  objc_msgSend_childrenPassingTest_(self, a2, (uint64_t)v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)childrenPassingTest:(id)a3
{
  id v4;
  void *v5;
  CLSObject *v6;
  id v7;
  id v8;
  const char *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = self;
  objc_sync_enter(v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D40B438C;
  v11[3] = &unk_1E974BBB0;
  v7 = v4;
  v13 = v7;
  v8 = v5;
  v12 = v8;
  objc_msgSend_enumerateChildren_(v6, v9, (uint64_t)v11);

  objc_sync_exit(v6);
  return v8;
}

- (void)enumerateChildren:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  const char *v5;
  uint64_t v6;
  CLSDataStore *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  int v29;
  const char *v30;
  unsigned __int8 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  objc_msgSend_lock(self, v5, v6);
  v7 = self->_dataStore;
  objc_msgSend_unlock(self, v8, v9);
  if (v7)
  {
    objc_msgSend_graph(v7, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_enumerateOutNeighboursOfVertex_enumerationBlock_(v12, v13, (uint64_t)self, v4);

  }
  else
  {
    objc_msgSend_lock(self, v10, v11);
    v16 = (void *)objc_msgSend_copy(self->_childrenByID, v14, v15);
    objc_msgSend_unlock(self, v17, v18);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v19 = v16;
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v32, v36, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v33;
LABEL_5:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v19);
        v25 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v24);
        v26 = (void *)MEMORY[0x1D82573E4]();
        objc_msgSend_objectForKeyedSubscript_(v19, v27, v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        v4[2](v4, v28, &v31);
        v29 = v31;

        objc_autoreleasePoolPop(v26);
        if (v29)
          break;
        if (v22 == ++v24)
        {
          v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v30, (uint64_t)&v32, v36, 16);
          if (v22)
            goto LABEL_5;
          break;
        }
      }
    }

  }
}

- (void)addChild:(id)a3
{
  objc_msgSend_addChild_changedPropertyName_(self, a2, (uint64_t)a3, 0);
}

- (void)addChild:(id)a3 changedPropertyName:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CLSObject *v9;
  const char *v10;
  uint64_t v11;
  CLSObject *v12;
  const __CFString *v13;
  _BOOL4 v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  int v23;
  int v24;
  CLSObject *v25;
  const char *v26;
  const char *v27;
  __CFString *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  id v36;
  id v37;
  const __CFString *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v6 = a4;
  objc_msgSend_parent(v37, v7, v8);
  v9 = (CLSObject *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v9)
  {
    if (v9 == self)
      goto LABEL_20;
    v13 = CFSTR("Cannot move object from one parent to another");
  }
  else
  {
    v13 = 0;
  }
  v14 = v9 != 0;
  objc_msgSend_dataStore(v37, v10, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataStore(self, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v18;
  if (v15)
    v22 = v15 == (void *)v18;
  else
    v22 = 1;
  v23 = !v22;
  v24 = !v22 || v14;
  if (v24 == 1)
  {
    if (v23)
      v28 = CFSTR("Cannot add child from other data stores");
    else
      v28 = (__CFString *)v13;
    objc_msgSend_description(v37, v19, v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingFormat_(v28, v30, (uint64_t)CFSTR("; object: %@"), v29);
    v31 = objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x1E0C99DA0];
    v38 = CFSTR("CLSErrorObjectKey");
    v39[0] = v37;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v33, (uint64_t)v39, &v38, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v32, v35, *MEMORY[0x1E0C99778], v31, v34);
    v36 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v36);
  }
  if (v6)
    objc_msgSend_willChangeValueForKey_(self, v19, (uint64_t)v6);
  v25 = self;
  objc_sync_enter(v25);
  objc_msgSend__addChild_(v25, v26, (uint64_t)v37);
  objc_sync_exit(v25);

  if (v6)
    objc_msgSend_didChangeValueForKey_(v25, v27, (uint64_t)v6);

LABEL_20:
}

- (void)_addChild:(id)a3
{
  objc_msgSend__addChild_lock_(self, a2, (uint64_t)a3, 1);
}

- (void)_addChild:(id)a3 lock:(BOOL)a4
{
  _BOOL4 v4;
  const char *v6;
  const char *v7;
  uint64_t v8;
  CLSDataStore *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  NSMutableDictionary *v28;
  NSMutableDictionary *childrenByID;
  NSMutableDictionary *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t isModified;
  const char *v41;
  const char *v42;
  uint64_t v43;
  id v44;

  v4 = a4;
  v44 = a3;
  objc_msgSend_setParent_(v44, v6, (uint64_t)self);
  if (v4)
  {
    objc_msgSend_lock(self, v7, v8);
    v9 = self->_dataStore;
    objc_msgSend_unlock(self, v10, v11);
    if (!v9)
    {
      objc_msgSend_lock(self, v12, v13);
      goto LABEL_6;
    }
LABEL_5:
    objc_msgSend_lock(v9, v12, v13);
    objc_msgSend_graph(v9, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addEdgeFromVertex_toVertex_(v16, v17, (uint64_t)self, v44);

    v19 = (id)objc_msgSend_addObject_(v9, v18, (uint64_t)v44);
    objc_msgSend_unlock(v9, v20, v21);
    goto LABEL_19;
  }
  v9 = self->_dataStore;
  if (v9)
    goto LABEL_5;
LABEL_6:
  if (!self->_childrenByID)
  {
    v28 = (NSMutableDictionary *)objc_opt_new();
    childrenByID = self->_childrenByID;
    self->_childrenByID = v28;

    if (v4)
      goto LABEL_8;
LABEL_10:
    objc_msgSend_objectID(v44, v12, v13);
    v9 = (CLSDataStore *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!v4)
    goto LABEL_10;
LABEL_8:
  objc_msgSend_unlock(self, v12, v13);
  objc_msgSend_objectID(v44, v22, v23);
  v9 = (CLSDataStore *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(self, v24, v25);
LABEL_11:
  v30 = self->_childrenByID;
  objc_msgSend_objectID(v44, v26, v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v30, v32, (uint64_t)v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    if (v4)
      objc_msgSend_unlock(self, v34, v35);
    objc_msgSend_mergeWithObject_(v33, v34, (uint64_t)v44);
    if ((objc_msgSend_isModified(v33, v36, v37) & 1) == 0)
    {
      isModified = objc_msgSend_isModified(v44, v38, v39);
      objc_msgSend_setModified_(v33, v41, isModified);
    }
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(self->_childrenByID, v34, (uint64_t)v44, v9);
    if (v4)
      objc_msgSend_unlock(self, v42, v43);
  }

LABEL_19:
}

- (void)removeChild:(id)a3
{
  objc_msgSend_removeChild_changedPropertyName_(self, a2, (uint64_t)a3, 0);
}

- (id)removeChildWithoutDeleting:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  NSMutableDictionary *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;

  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  objc_msgSend_objectID(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = self->_childrenByID;
  objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend_removeObjectForKey_(v10, v12, (uint64_t)v9);
    objc_msgSend_unlock(self, v15, v16);
    v17 = v14;
  }
  else
  {
    objc_msgSend_unlock(self, v12, v13);
  }

  return v14;
}

- (void)removeFromParentWithoutDeleting
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *v18;
  CLSDataStore *v19;

  objc_msgSend_lock(self, a2, v2);
  v19 = self->_dataStore;
  objc_msgSend_unlock(self, v4, v5);
  objc_msgSend_parent(self, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (v10)
    {
      objc_msgSend_graph(v19, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeVertex_(v11, v12, (uint64_t)self);

      objc_msgSend_setParent_(self, v13, 0);
      objc_msgSend_setModified_(self, v14, 1);
      objc_msgSend_setDataStore_(self, v15, 0);
    }
  }
  else
  {
    objc_msgSend_removeChildWithoutDeleting_(v10, v8, (uint64_t)self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend_setParent_(self, v16, 0);
      objc_msgSend_setModified_(self, v18, 1);
    }

  }
}

- (void)removeChild:(id)a3 changedPropertyName:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CLSDataStore *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  int hasEdgeFromVertex_toVertex;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSMutableDictionary *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  id v44;

  v44 = a3;
  v6 = a4;
  objc_msgSend_lock(self, v7, v8);
  v9 = self->_dataStore;
  objc_msgSend_unlock(self, v10, v11);
  if (v9)
  {
    objc_msgSend_graph(v9, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    hasEdgeFromVertex_toVertex = objc_msgSend_hasEdgeFromVertex_toVertex_(v14, v15, (uint64_t)self, v44);

    if (hasEdgeFromVertex_toVertex)
    {
      if (v6)
      {
        objc_msgSend_willChangeValueForKey_(self, v17, (uint64_t)v6);
        objc_msgSend_markObjectAsDeleted_(v9, v18, (uint64_t)v44);
        objc_msgSend_didChangeValueForKey_(self, v19, (uint64_t)v6);
      }
      else
      {
        objc_msgSend_markObjectAsDeleted_(v9, v17, (uint64_t)v44);
      }
      objc_msgSend_setModified_(self, v20, 1);
    }
  }
  else
  {
    objc_msgSend_objectID(v44, v12, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(self, v22, v23);
    v24 = self->_childrenByID;
    objc_msgSend_objectForKeyedSubscript_(v24, v25, (uint64_t)v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(self, v27, v28);
    if (v26)
    {
      if (v6)
      {
        objc_msgSend_willChangeValueForKey_(self, v29, (uint64_t)v6);
        objc_msgSend_lock(self, v31, v32);
        objc_msgSend_removeObjectForKey_(v24, v33, (uint64_t)v21);
        objc_msgSend_unlock(self, v34, v35);
        objc_msgSend_setParent_(v44, v36, 0);
        objc_msgSend_setDeleted_(v44, v37, 1);
        objc_msgSend_didChangeValueForKey_(self, v38, (uint64_t)v6);
      }
      else
      {
        objc_msgSend_lock(self, v29, v30);
        objc_msgSend_removeObjectForKey_(v24, v39, (uint64_t)v21);
        objc_msgSend_unlock(self, v40, v41);
        objc_msgSend_setParent_(v44, v42, 0);
        objc_msgSend_setDeleted_(v44, v43, 1);
      }
    }

  }
}

- (void)mergeWithObject:(id)a3
{
  CLSObject *v4;
  const char *v5;
  uint64_t v6;
  void **p_isa;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t isTemporary;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = (CLSObject *)a3;
  p_isa = (void **)&v4->super.isa;
  if (self != v4)
  {
    objc_msgSend_parentObjectID(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setParentObjectID_(self, v9, (uint64_t)v8);

    isTemporary = objc_msgSend_isTemporary(p_isa, v10, v11);
    objc_msgSend_setTemporary_(self, v13, isTemporary);
    objc_msgSend_appIdentifier(p_isa, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAppIdentifier_(self, v17, (uint64_t)v16);

    objc_msgSend_lock(p_isa, v18, v19);
    v22 = (void *)objc_msgSend_copy(p_isa[5], v20, v21);
    objc_msgSend_unlock(p_isa, v23, v24);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v25 = v22;
    v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v34, v38, 16);
    if (v27)
    {
      v29 = v27;
      v30 = *(_QWORD *)v35;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v35 != v30)
            objc_enumerationMutation(v25);
          objc_msgSend_objectForKeyedSubscript_(v25, v28, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v31), (_QWORD)v34);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addChild_(self, v33, (uint64_t)v32);

          ++v31;
        }
        while (v29 != v31);
        v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v34, v38, 16);
      }
      while (v29);
    }

  }
}

- (void)setParent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  NSString *v12;
  NSString *parentObjectID;
  const char *v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  objc_msgSend_objectID(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSString *)objc_msgSend_copy(v9, v10, v11);
  parentObjectID = self->_parentObjectID;
  self->_parentObjectID = v12;

  objc_storeWeak((id *)&self->_parent, v4);
  objc_msgSend_unlock(self, v14, v15);
}

- (CLSObject)parent
{
  uint64_t v2;
  id WeakRetained;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend_unlock(self, v5, v6);
  return (CLSObject *)WeakRetained;
}

- (NSString)appIdentifier
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_appIdentifier;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setAppIdentifier:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *appIdentifier;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  appIdentifier = self->_appIdentifier;
  v12 = (id)v8;
  if (v8 | (unint64_t)appIdentifier
    && (!v8 || !appIdentifier || (objc_msgSend_isEqualToString_(appIdentifier, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_appIdentifier, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)parentObjectID
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_parentObjectID;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setParentObjectID:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *parentObjectID;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  parentObjectID = self->_parentObjectID;
  v12 = (id)v8;
  if (v8 | (unint64_t)parentObjectID
    && (!v8 || !parentObjectID || (objc_msgSend_isEqualToString_(parentObjectID, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_parentObjectID, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)enumerateTree:(id)a3
{
  void (**v4)(id, CLSObject *, char *, _WORD *);
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  BOOL v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(id, CLSObject *, char *, _WORD *);
  _QWORD *v24;
  _QWORD v25[3];
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int16 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, CLSObject *, char *, _WORD *))a3;
  v31 = 0;
  v4[2](v4, self, (char *)&v31 + 1, &v31);
  if (!(HIBYTE(v31) | v31))
  {
    objc_msgSend_lock(self, v5, v6);
    v21 = (void *)objc_msgSend_copy(self->_childrenByID, v7, v8);
    objc_msgSend_unlock(self, v9, v10);
    v11 = v21;
    if (v21)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v12 = v21;
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v27, v32, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v28;
LABEL_5:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v12);
          objc_msgSend_objectForKeyedSubscript_(v12, v14, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v17));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = 0;
          v25[1] = v25;
          v25[2] = 0x2020000000;
          v26 = 0;
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = sub_1D40B5298;
          v22[3] = &unk_1E974BBD8;
          v23 = v4;
          v24 = v25;
          objc_msgSend_enumerateTree_(v18, v19, (uint64_t)v22);
          v20 = HIBYTE(v31) == 0;

          _Block_object_dispose(v25, 8);
          if (!v20)
            break;
          if (v15 == ++v17)
          {
            v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v27, v32, 16);
            if (v15)
              goto LABEL_5;
            break;
          }
        }
      }

      v11 = v21;
    }

  }
}

- (BOOL)isDeleted
{
  uint64_t v2;
  BOOL deleted;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  deleted = self->_deleted;
  objc_msgSend_unlock(self, v5, v6);
  return deleted;
}

- (void)setDeleted:(BOOL)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  self->_deleted = a3;
  objc_msgSend_unlock(self, v5, v6);
}

- (BOOL)isModified
{
  uint64_t v2;
  BOOL modified;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  modified = self->_modified;
  objc_msgSend_unlock(self, v5, v6);
  return modified;
}

- (void)setModified:(BOOL)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;

  if (self->_modified != a3)
  {
    self->_modified = a3;
    if (a3)
    {
      objc_msgSend_date(MEMORY[0x1E0C99D68], a2, a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDateLastModified_(self, v5, (uint64_t)v4);

      do
        v6 = __ldaxr((unsigned int *)&unk_1ED0FB978);
      while (__stlxr(v6 + 1, (unsigned int *)&unk_1ED0FB978));
      MEMORY[0x1E0DE7D20](self, sel_setGeneration_, v6);
    }
  }
}

- (NSString)description
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  void *v56;
  objc_super v58;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v58.receiver = self;
  v58.super_class = (Class)CLSObject;
  -[CLSObject description](&v58, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_initWithString_(v3, v5, (uint64_t)v4);

  objc_msgSend_objectID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_length(v9, v10, v11);

  if (v12)
  {
    objc_msgSend_objectID(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v16, (uint64_t)CFSTR(" (objectID: %@)"), v15);

  }
  objc_msgSend_dateCreated(self, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v20 = (void *)objc_opt_class();
    objc_msgSend_dateFormatter(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dateCreated(self, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromDate_(v23, v27, (uint64_t)v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v29, (uint64_t)CFSTR(" (dateCreated: %@)"), v28);

  }
  objc_msgSend_dateLastModified(self, v18, v19);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v33 = (void *)objc_opt_class();
    objc_msgSend_dateFormatter(v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dateLastModified(self, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromDate_(v36, v40, (uint64_t)v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v42, (uint64_t)CFSTR(" (dateLastModified: %@)"), v41);

  }
  objc_msgSend_dateExpires(self, v31, v32);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    v46 = (void *)objc_opt_class();
    objc_msgSend_dateFormatter(v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dateExpires(self, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromDate_(v49, v53, (uint64_t)v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v55, (uint64_t)CFSTR(" (dateExpires: %@)"), v54);

  }
  v56 = (void *)objc_msgSend_copy(v6, v44, v45);

  return (NSString *)v56;
}

+ (NSDateFormatter)dateFormatter
{
  if (qword_1ED0FB8A0 != -1)
    dispatch_once(&qword_1ED0FB8A0, &unk_1E9749B90);
  return (NSDateFormatter *)(id)qword_1ED0FB898;
}

- (void)didSaveObject
{
  uint64_t v2;
  const char *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  objc_msgSend_setTemporary_(self, v4, 0);
  objc_msgSend_unlock(self, v5, v6);
}

- (BOOL)validateObject:(id *)a3
{
  const char *v5;
  uint64_t v6;
  const char *v8;
  NSDate *dateCreated;
  NSDate *dateLastModified;
  const char *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  void *v28;
  const char *v29;
  NSDate *dateExpires;
  void *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;

  if ((objc_msgSend_isDeleted(self, a2, (uint64_t)a3) & 1) != 0)
    return 1;
  if (objc_msgSend_length(self->_objectID, v5, v6))
  {
    dateCreated = self->_dateCreated;
    if (dateCreated && (dateLastModified = self->_dateLastModified) != 0)
    {
      if (objc_msgSend_compare_(dateCreated, v8, (uint64_t)dateLastModified) == 1)
      {
        v12 = (void *)MEMORY[0x1E0CB34D0];
        v13 = objc_opt_class();
        objc_msgSend_bundleForClass_(v12, v14, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localizedStringForKey_value_table_(v15, v16, (uint64_t)CFSTR("ERROR_DESCRIPTION_OBJECT_INVALID_MODIFIED_DATE"), &stru_1E974C8A0, CFSTR("ClassKit"));
      }
      else
      {
        dateExpires = self->_dateExpires;
        if (!dateExpires || objc_msgSend_compare_(self->_dateCreated, v11, (uint64_t)dateExpires) != 1)
          return 1;
        v31 = (void *)MEMORY[0x1E0CB34D0];
        v32 = objc_opt_class();
        objc_msgSend_bundleForClass_(v31, v33, v32);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localizedStringForKey_value_table_(v15, v34, (uint64_t)CFSTR("ERROR_DESCRIPTION_OBJECT_INVALID_EXPIRE_DATE"), &stru_1E974C8A0, CFSTR("ClassKit"));
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB34D0];
      v18 = objc_opt_class();
      objc_msgSend_bundleForClass_(v17, v19, v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v15, v20, (uint64_t)CFSTR("ERROR_DESCRIPTION_OBJECT_NO_DATE_CREATED"), &stru_1E974C8A0, CFSTR("ClassKit"));
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v22, (uint64_t)a3, 3, self, v21);
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = (void *)MEMORY[0x1E0CB34D0];
    v25 = objc_opt_class();
    objc_msgSend_bundleForClass_(v24, v26, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v21, v27, (uint64_t)CFSTR("ERROR_DESCRIPTION_OBJECT_INVALID_OBJECT_ID"), &stru_1E974C8A0, CFSTR("ClassKit"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_assignError_code_errorObject_description_(v23, v29, (uint64_t)a3, 2, self, v28);

  }
  return 0;
}

- (id)dictionaryRepresentation
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  NSString *parentObjectID;
  void *v12;
  const char *v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  NSDate *dateExpires;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_deleted);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)v5, CFSTR("deleted"));

  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)self->_objectID, CFSTR("objectID"));
  objc_msgSend_lock(self, v8, v9);
  parentObjectID = self->_parentObjectID;
  if (parentObjectID)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)parentObjectID, CFSTR("parentObjectID"));
  objc_msgSend_mediumStringFromDate_(CLSUtil, v10, (uint64_t)self->_dateCreated);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, CFSTR("dateCreated"));

  objc_msgSend_mediumStringFromDate_(CLSUtil, v14, (uint64_t)self->_dateLastModified);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v16, (uint64_t)v15, CFSTR("dateLastModified"));

  dateExpires = self->_dateExpires;
  if (dateExpires)
  {
    objc_msgSend_mediumStringFromDate_(CLSUtil, v17, (uint64_t)dateExpires);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, CFSTR("dateExpires"));

  }
  objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)self->_appIdentifier, CFSTR("appIdentifier"));
  objc_msgSend_unlock(self, v21, v22);
  return v3;
}

- (int64_t)effectiveAuthorizationStatus
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  int64_t v7;

  objc_msgSend_parent(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
    v7 = objc_msgSend_effectiveAuthorizationStatus(v3, v4, v5);
  else
    v7 = 2;

  return v7;
}

- (id)ancestorOfClass:(Class)a3
{
  const char *v5;
  uint64_t v6;
  CLSObject *v7;
  void *v8;
  const char *v9;

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = self;
  }
  else
  {
    objc_msgSend_parent(self, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ancestorOfClass_(v8, v9, (uint64_t)a3);
    v7 = (CLSObject *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)needsRepair
{
  uint64_t v2;
  BOOL needsRepair;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  needsRepair = self->_needsRepair;
  objc_msgSend_unlock(self, v5, v6);
  return needsRepair;
}

- (void)setNeedsRepair:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend_lock(self, a2, a3);
  if (self->_needsRepair != v3)
  {
    self->_needsRepair = v3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
  objc_storeStrong((id *)&self->_dateCreated, a3);
}

- (NSDate)dateLastModified
{
  return self->_dateLastModified;
}

- (void)setDateLastModified:(id)a3
{
  objc_storeStrong((id *)&self->_dateLastModified, a3);
}

- (BOOL)isTemporary
{
  return self->_temporary;
}

- (void)setTemporary:(BOOL)a3
{
  self->_temporary = a3;
}

- (unsigned)generation
{
  return self->_generation;
}

- (void)setGeneration:(unsigned int)a3
{
  self->_generation = a3;
}

- (NSString)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDate)dateExpires
{
  return self->_dateExpires;
}

- (void)setDateExpires:(id)a3
{
  objc_storeStrong((id *)&self->_dateExpires, a3);
}

- (NSDictionary)childrenByID
{
  return &self->_childrenByID->super;
}

- (void)setChildrenByID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateExpires, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_childrenByID, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_parentObjectID, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end
