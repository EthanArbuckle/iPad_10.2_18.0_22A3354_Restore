@implementation _SGDCloudKitSyncPersistedState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSaltUsesManatee:(id)a3
{
  objc_storeStrong((id *)&self->_saltUsesManatee, a3);
}

- (void)setSalt:(id)a3
{
  objc_storeStrong((id *)&self->_salt, a3);
}

- (void)setSaltAtomicReferenceId:(id)a3
{
  objc_storeStrong((id *)&self->_saltAtomicReferenceId, a3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  _SGDCloudKitSyncPersistedState *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  _SGDCloudKitSyncPersistedState *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (_SGDCloudKitSyncPersistedState *)a4;
  v11 = a5;
  if (v10 == self)
  {
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v15 = 138412802;
      v16 = v9;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v10;
      _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, "SGCK Persisted state changed (keyPath: %@, change: %@, self: %@)", (uint8_t *)&v15, 0x20u);
    }

    -[_SGDCloudKitSyncPersistedState changeCallback](v10, "changeCallback");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[_SGDCloudKitSyncPersistedState changeCallback](v10, "changeCallback");
      v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _SGDCloudKitSyncPersistedState *))v14)[2](v14, v10);

    }
  }

}

- (id)changeCallback
{
  return self->_changeCallback;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  id v12;
  objc_property_t Property;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  +[_SGDCloudKitSyncPersistedState properties](_SGDCloudKitSyncPersistedState, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        v11 = (objc_class *)objc_opt_class();
        objc_msgSend(v10, "second");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        Property = class_getProperty(v11, (const char *)objc_msgSend(v12, "UTF8String"));

        if (!Property)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDCloudKitSync.m"), 211, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objcProperty != nil"));

        }
        v14 = -[_SGDCloudKitSyncPersistedState _getterForProperty:](self, "_getterForProperty:", Property);
        ((void (*)(_SGDCloudKitSyncPersistedState *, const char *))-[_SGDCloudKitSyncPersistedState methodForSelector:](self, "methodForSelector:", v14))(self, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "second");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

}

- (SEL)_getterForProperty:(objc_property *)a3
{
  char *v4;
  char *v5;
  const char *v6;
  const char *Name;
  void *v11;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDCloudKitSync.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("property"));

  }
  v4 = property_copyAttributeValue(a3, "G");
  if (v4)
  {
    v5 = v4;
    v6 = sel_registerName(v4);
    free(v5);
    return v6;
  }
  else
  {
    Name = property_getName(a3);
    return sel_registerName(Name);
  }
}

- (NSNumber)eventsWereRemovedFromEventKit
{
  return self->_eventsWereRemovedFromEventKit;
}

- (NSString)primaryICloudCalendarAccount
{
  return self->_primaryICloudCalendarAccount;
}

- (NSNumber)hasDeferredSync
{
  return self->_hasDeferredSync;
}

- (NSNumber)hasDeferredProcessStateChanges
{
  return self->_hasDeferredProcessStateChanges;
}

- (CKServerChangeToken)syncToken
{
  return self->_syncToken;
}

- (NSData)salt
{
  return self->_salt;
}

- (NSNumber)saltUsesManatee
{
  return self->_saltUsesManatee;
}

- (CKRecordID)saltAtomicReferenceId
{
  return self->_saltAtomicReferenceId;
}

- (NSNumber)hasSubscription
{
  return self->_hasSubscription;
}

+ (id)properties
{
  if (properties__pasOnceToken3 != -1)
    dispatch_once(&properties__pasOnceToken3, &__block_literal_global_15984);
  return (id)properties__pasExprOnceResult;
}

- (_SGDCloudKitSyncPersistedState)init
{
  _SGDCloudKitSyncPersistedState *v2;
  _SGDCloudKitSyncPersistedState *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SGDCloudKitSyncPersistedState;
  v2 = -[_SGDCloudKitSyncPersistedState init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_SGDCloudKitSyncPersistedState setupKvo](v2, "setupKvo");
  return v3;
}

- (SEL)_setterForProperty:(objc_property *)a3
{
  char *v6;
  const char *Name;
  size_t v8;
  char *v9;
  char v10;
  const char *v11;
  int v12;
  char v13;
  const char *v14;
  void *v16;
  id v17;

  v6 = property_copyAttributeValue(a3, "S");
  if (!v6)
  {
    Name = property_getName(a3);
    v8 = strlen(Name) + 5;
    v9 = (char *)malloc_type_malloc(v8, 0xE90D5EADuLL);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v17);
    }
    v6 = v9;
    v12 = *(unsigned __int8 *)Name;
    v11 = Name + 1;
    v10 = v12;
    v13 = v12 - 32;
    if ((v12 - 97) < 0x1A)
      v10 = v13;
    if (snprintf(v9, v8, "set%c%s:", v10, v11) < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDCloudKitSync.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snprintfResult >= 0"));

    }
  }
  v14 = sel_registerName(v6);
  free(v6);
  return v14;
}

- (_SGDCloudKitSyncPersistedState)initWithCoder:(id)a3
{
  id v5;
  _SGDCloudKitSyncPersistedState *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSString *v13;
  Class v14;
  void *v15;
  void *v16;
  objc_class *v17;
  id v18;
  objc_property_t Property;
  uint64_t v20;
  void *v21;
  _SGDCloudKitSyncPersistedState *v22;
  NSObject *v23;
  SEL v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_SGDCloudKitSyncPersistedState;
  v6 = -[_SGDCloudKitSyncPersistedState init](&v30, sel_init);
  if (v6)
  {
    v25 = a2;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    +[_SGDCloudKitSyncPersistedState properties](_SGDCloudKitSyncPersistedState, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v12, "first");
          v13 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = NSClassFromString(v13);

          if (!v14)
          {
            sgLogHandle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v12;
              _os_log_error_impl(&dword_1C3607000, v23, OS_LOG_TYPE_ERROR, "_SGDCloudKitSyncPersistedState got invalid class name in property: %@", buf, 0xCu);
            }

            v22 = 0;
            goto LABEL_17;
          }
          objc_msgSend(v12, "second");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "decodeObjectOfClass:forKey:", v14, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = (objc_class *)objc_opt_class();
          objc_msgSend(v12, "second");
          v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          Property = class_getProperty(v17, (const char *)objc_msgSend(v18, "UTF8String"));

          if (!Property)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v25, v6, CFSTR("SGDCloudKitSync.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objcProperty != nil"));

          }
          v20 = -[_SGDCloudKitSyncPersistedState _setterForProperty:](v6, "_setterForProperty:", Property);
          ((void (*)(_SGDCloudKitSyncPersistedState *, uint64_t, void *))-[_SGDCloudKitSyncPersistedState methodForSelector:](v6, "methodForSelector:", v20))(v6, v20, v16);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
        if (v9)
          continue;
        break;
      }
    }

    -[_SGDCloudKitSyncPersistedState setupKvo](v6, "setupKvo");
  }
  v22 = v6;
LABEL_17:

  return v22;
}

- (void)dealloc
{
  objc_super v3;

  -[_SGDCloudKitSyncPersistedState stopKvo](self, "stopKvo");
  v3.receiver = self;
  v3.super_class = (Class)_SGDCloudKitSyncPersistedState;
  -[_SGDCloudKitSyncPersistedState dealloc](&v3, sel_dealloc);
}

- (void)setupKvo
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[_SGDCloudKitSyncPersistedState properties](_SGDCloudKitSyncPersistedState, "properties", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "second");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SGDCloudKitSyncPersistedState addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, v8, 0, 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)stopKvo
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[_SGDCloudKitSyncPersistedState properties](_SGDCloudKitSyncPersistedState, "properties", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "second");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SGDCloudKitSyncPersistedState removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, v8, 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)description
{
  void *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  id v11;
  objc_property_t Property;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  +[_SGDCloudKitSyncPersistedState properties](_SGDCloudKitSyncPersistedState, "properties");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
        v10 = (objc_class *)objc_opt_class();
        objc_msgSend(v9, "second");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        Property = class_getProperty(v10, (const char *)objc_msgSend(v11, "UTF8String"));

        if (!Property)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDCloudKitSync.m"), 224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objcProperty != nil"));

        }
        v13 = -[_SGDCloudKitSyncPersistedState _getterForProperty:](self, "_getterForProperty:", Property);
        ((void (*)(_SGDCloudKitSyncPersistedState *, const char *))-[_SGDCloudKitSyncPersistedState methodForSelector:](self, "methodForSelector:", v13))(self, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v2;
        }
        objc_msgSend(v9, "second");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v16);

        if (!v14)
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }

  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  v25.receiver = self;
  v25.super_class = (Class)_SGDCloudKitSyncPersistedState;
  -[_SGDCloudKitSyncPersistedState description](&v25, sel_description);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("<%@ %@>"), v19, v20);

  return v21;
}

- (void)setChangeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setSyncToken:(id)a3
{
  objc_storeStrong((id *)&self->_syncToken, a3);
}

- (void)setHasSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_hasSubscription, a3);
}

- (void)setEventsWereRemovedFromEventKit:(id)a3
{
  objc_storeStrong((id *)&self->_eventsWereRemovedFromEventKit, a3);
}

- (void)setPrimaryICloudCalendarAccount:(id)a3
{
  objc_storeStrong((id *)&self->_primaryICloudCalendarAccount, a3);
}

- (void)setHasDeferredSync:(id)a3
{
  objc_storeStrong((id *)&self->_hasDeferredSync, a3);
}

- (void)setHasDeferredProcessStateChanges:(id)a3
{
  objc_storeStrong((id *)&self->_hasDeferredProcessStateChanges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasDeferredProcessStateChanges, 0);
  objc_storeStrong((id *)&self->_hasDeferredSync, 0);
  objc_storeStrong((id *)&self->_primaryICloudCalendarAccount, 0);
  objc_storeStrong((id *)&self->_eventsWereRemovedFromEventKit, 0);
  objc_storeStrong((id *)&self->_hasSubscription, 0);
  objc_storeStrong((id *)&self->_syncToken, 0);
  objc_storeStrong((id *)&self->_saltUsesManatee, 0);
  objc_storeStrong((id *)&self->_saltAtomicReferenceId, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong(&self->_changeCallback, 0);
}

@end
