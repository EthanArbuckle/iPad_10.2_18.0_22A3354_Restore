@implementation CLSHandoutAssignedItem

- (CLSHandoutAssignedItem)initWithType:(int)a3 title:(id)a4 handoutAttachmentID:(id)a5
{
  id v8;
  id v9;
  CLSHandoutAssignedItem *v10;
  const char *v11;
  uint64_t v12;
  CLSHandoutAssignedItem *v13;
  uint64_t v14;
  NSString *title;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  NSMutableSet *bundleIDs;
  objc_super v25;

  v8 = a4;
  v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CLSHandoutAssignedItem;
  v10 = -[CLSObject _init](&v25, sel__init);
  v13 = v10;
  if (v10)
  {
    v10->_type = a3;
    v14 = objc_msgSend_copy(v8, v11, v12);
    title = v13->_title;
    v13->_title = (NSString *)v14;

    v18 = (void *)objc_msgSend_copy(v9, v16, v17);
    objc_msgSend_setParentObjectID_(v13, v19, (uint64_t)v18);

    v20 = objc_alloc(MEMORY[0x1E0C99E20]);
    v22 = objc_msgSend_initWithCapacity_(v20, v21, 2);
    bundleIDs = v13->_bundleIDs;
    v13->_bundleIDs = (NSMutableSet *)v22;

  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSHandoutAssignedItem)initWithCoder:(id)a3
{
  id v4;
  CLSHandoutAssignedItem *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSString *currentActivityID;
  const char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  NSMutableSet *bundleIDs;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CLSHandoutAssignedItem;
  v5 = -[CLSObject initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("title"));
    v12 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("currentActivityID"));
    v16 = objc_claimAutoreleasedReturnValue();
    currentActivityID = v5->_currentActivityID;
    v5->_currentActivityID = (NSString *)v16;

    v5->_type = objc_msgSend_decodeInt32ForKey_(v4, v18, (uint64_t)CFSTR("type"));
    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend_setWithObjects_(v19, v23, v20, v21, v22, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v25, (uint64_t)v24, CFSTR("bundleIDs"));
    v26 = objc_claimAutoreleasedReturnValue();
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSMutableSet *)v26;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLSHandoutAssignedItem;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_identifier, CFSTR("identifier"), v10.receiver, v10.super_class);
  objc_msgSend_encodeInt32_forKey_(v4, v6, self->_type, CFSTR("type"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_title, CFSTR("title"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_currentActivityID, CFSTR("currentActivityID"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_bundleIDs, CFSTR("bundleIDs"));

}

- (NSString)title
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_title;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setTitle:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *title;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  title = self->_title;
  v12 = (id)v8;
  if (v8 | (unint64_t)title
    && (!v8 || !title || (objc_msgSend_isEqualToString_(title, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_title, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)identifier
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_identifier;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setIdentifier:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *identifier;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  identifier = self->_identifier;
  v12 = (id)v8;
  if (v8 | (unint64_t)identifier
    && (!v8 || !identifier || (objc_msgSend_isEqualToString_(identifier, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_identifier, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)currentActivityID
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_currentActivityID;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setCurrentActivityID:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *currentActivityID;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  currentActivityID = self->_currentActivityID;
  v12 = (id)v8;
  if (v8 | (unint64_t)currentActivityID
    && (!v8 || !currentActivityID || (objc_msgSend_isEqualToString_(currentActivityID, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_currentActivityID, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)setAppIdentifier:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CLSHandoutAssignedItem;
  -[CLSObject setAppIdentifier:](&v6, sel_setAppIdentifier_, v4);
  if (v4)
    objc_msgSend_addObject_(self->_bundleIDs, v5, (uint64_t)v4);

}

- (void)addBundleIDs:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_allObjects(v4, v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_addObjectsFromArray_(self->_bundleIDs, v8, (uint64_t)v4);
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v9 = (void *)CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;

    }
  }

}

- (NSMutableSet)bundleIDs
{
  uint64_t v2;

  return (NSMutableSet *)(id)objc_msgSend_copy(self->_bundleIDs, a2, v2);
}

- (CLSActivity)currentActivity
{
  uint64_t v2;
  CLSActivity *currentActivity;
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  currentActivity = self->_currentActivity;
  if (currentActivity)
    return currentActivity;
  objc_msgSend_currentActivityID(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D4083344;
  v15[3] = &unk_1E974A910;
  v16 = v6;
  v7 = v6;
  objc_msgSend_childrenPassingTest_(self, v8, (uint64_t)v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v9, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend_createNewActivity(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (CLSActivity *)v14;
}

- (id)createNewActivity
{
  uint64_t v2;
  const char *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  CLSActivity *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dataStore(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend_cls_createErrorWithCode_errorObject_description_(MEMORY[0x1E0CB35C8], v4, 3, self, CFSTR("Creating an activity in a context without a data store is undefined. Please add context to a parent context with a data store before calling createNewActivity."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v7 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v6;
      _os_log_error_impl(&dword_1D4054000, v7, OS_LOG_TYPE_ERROR, "Error occurred when creating a new activity: %@", buf, 0xCu);
    }

  }
  v8 = [CLSActivity alloc];
  v9 = objc_opt_class();
  v11 = (void *)objc_msgSend__initWithTargetClass_(v8, v10, v9);
  objc_msgSend_lock(v5, v12, v13);
  if (v5)
  {
    objc_msgSend_mainAppContext(v5, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAppIdentifier_(v11, v20, (uint64_t)v19);

  }
  objc_storeStrong((id *)&self->_currentActivity, v11);
  objc_msgSend_objectID(v11, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCurrentActivityID_(self, v24, (uint64_t)v23);

  v28.receiver = self;
  v28.super_class = (Class)CLSHandoutAssignedItem;
  -[CLSObject addChild:changedPropertyName:](&v28, sel_addChild_changedPropertyName_, v11, CFSTR("currentActivity"));
  objc_msgSend_unlock(v5, v25, v26);

  return v11;
}

- (BOOL)validateObject:(id *)a3
{
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CLSHandoutAssignedItem;
  v5 = -[CLSObject validateObject:](&v19, sel_validateObject_);
  if (v5)
  {
    if ((unint64_t)objc_msgSend_length(self->_title, v6, v7) < 0x3E9)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = (void *)MEMORY[0x1E0CB34D0];
      v10 = objc_opt_class();
      objc_msgSend_bundleForClass_(v9, v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v12, v13, (uint64_t)CFSTR("ERROR_DESCRIPTION_HANDOUT_ASSIGNED_ITEM_TITLE_TOO_LONG_FORMAT"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v8, v15, (uint64_t)v14, 1000);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v17, (uint64_t)a3, 6, self, v16);
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (int64_t)effectiveAuthorizationStatus
{
  return ((uint64_t (*)(CLSHandoutAssignedItem *, char *))MEMORY[0x1E0DE7D20])(self, sel_authorizationStatus);
}

- (int64_t)authorizationStatus
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  int64_t v13;

  objc_msgSend_dataStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    objc_msgSend_handoutAssignedItemsAuthTree(v4, v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend_parentObjectID(self, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend_authStatusFor_(v10, v12, (uint64_t)v11);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  _QWORD v41[4];

  v41[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CLSHandoutAssignedItem;
  -[CLSObject mergeWithObject:](&v39, sel_mergeWithObject_, v4);
  objc_msgSend_dateLastModified(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10 = (id)v7;
    objc_msgSend_dateLastModified(v4, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v14 = (void *)v11;
      objc_msgSend_dateLastModified(self, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dateLastModified(v4, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend_compare_(v15, v19, (uint64_t)v18);

      if (v20 == 1)
        goto LABEL_13;
      v41[0] = CFSTR("title");
      v41[1] = CFSTR("type");
      v41[2] = CFSTR("identifier");
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v41, 3);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v21, (uint64_t)&v35, v40, 16);
      if (v22)
      {
        v24 = v22;
        v25 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v36 != v25)
              objc_enumerationMutation(v10);
            v27 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend_valueForKey_(v4, v23, v27, (_QWORD)v35);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setValue_forKey_(self, v29, (uint64_t)v28, v27);

          }
          v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v23, (uint64_t)&v35, v40, 16);
        }
        while (v24);
      }

    }
  }
LABEL_13:
  objc_msgSend_currentActivityID(self, v8, v9, (_QWORD)v35);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    objc_msgSend_currentActivityID(v4, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCurrentActivityID_(self, v34, (uint64_t)v33);

  }
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_currentActivityID, 0);
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40ABA7C;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB820 != -1)
    dispatch_once(&qword_1ED0FB820, block);
  return (id)qword_1ED0FB818;
}

@end
