@implementation APSigningContextStorage

+ (NSMutableDictionary)contextDictionaries
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  APStorageManager *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char isKindOfClass;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  int v50;
  uint64_t ClassName;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(APSigningContextStorage, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v4, v5, v6, v7);

  v8 = [APStorageManager alloc];
  v11 = (void *)objc_msgSend_initWithPathPrefix_(v8, v9, (uint64_t)CFSTR("fpdi"), v10);
  objc_msgSend_bundleIdentifier(APSigningContextStorage, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileForReadingAtKeyPath_error_(v11, v16, (uint64_t)v15, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_nextObject(v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    APLogForCategory(0x2AuLL);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      LOWORD(v50) = 0;
      _os_log_impl(&dword_1CF251000, v32, OS_LOG_TYPE_INFO, "No stored pools found.", (uint8_t *)&v50, 2u);
    }

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v33, v34, v35);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  APLogForCategory(0x2AuLL);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if ((isKindOfClass & 1) != 0)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v50 = 134218242;
      ClassName = objc_msgSend_count(0, v25, v26, v27);
      v52 = 2112;
      v53 = 0;
      _os_log_impl(&dword_1CF251000, v24, OS_LOG_TYPE_INFO, "Found %lu stored pools: %@", (uint8_t *)&v50, 0x16u);
    }

    v28 = v21;
LABEL_9:
    v36 = v28;
    objc_msgSend_lock(APSigningContextStorage, v29, v30, v31);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(v37, v38, v39, v40);

    v41 = v36;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v50 = 136315138;
    ClassName = (uint64_t)object_getClassName(v21);
    _os_log_impl(&dword_1CF251000, v24, OS_LOG_TYPE_ERROR, "Storage file object of wrong type: %s", (uint8_t *)&v50, 0xCu);
  }

  objc_msgSend_lock(APSigningContextStorage, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v45, v46, v47, v48);

  v41 = 0;
LABEL_13:

  return (NSMutableDictionary *)v41;
}

- (BOOL)used
{
  return self->_used;
}

- (BOOL)stashed
{
  return self->_stashed;
}

- (void)setUsed:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  APLogForCategory(0x2AuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend_contextRef(self, v6, v7, v8);
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v14 = objc_msgSend_used(self, v11, v12, v13);
    objc_msgSend_numberWithBool_(v10, v15, v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v18, v3, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 134218498;
    v25 = v9;
    v26 = 2112;
    v27 = v17;
    v28 = 2112;
    v29 = v20;
    _os_log_impl(&dword_1CF251000, v5, OS_LOG_TYPE_INFO, "Change used state of context ref %p from %@ to %@", (uint8_t *)&v24, 0x20u);

  }
  self->_used = v3;
  objc_msgSend_save(self, v21, v22, v23);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)save
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;

  objc_msgSend_lock(APSigningContextStorage, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8);

  objc_msgSend_poolName(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__contextsForPool_(APSigningContextStorage, v13, (uint64_t)v12, v14);
  v40 = (id)objc_claimAutoreleasedReturnValue();

  if (!v40)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v15, v16, v17);
    v40 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_propertyArray(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB37E8];
  v23 = objc_msgSend_contextRef(self, v20, v21, v22);
  objc_msgSend_numberWithUnsignedLongLong_(v19, v24, v23, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v40, v27, (uint64_t)v18, (uint64_t)v26);

  objc_msgSend_poolName(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setContextsForPool_contexts_(APSigningContextStorage, v32, (uint64_t)v31, (uint64_t)v40);

  objc_msgSend_lock(APSigningContextStorage, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v36, v37, v38, v39);

}

- (NSArray)propertyArray
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;

  v5 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend_sessionIdentifier(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend_stashed(self, v8, v9, v10);
  objc_msgSend_numberWithBool_(v7, v12, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB37E8];
  v19 = objc_msgSend_used(self, v16, v17, v18);
  objc_msgSend_numberWithBool_(v15, v20, v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_poolName(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithObjects_(v5, v27, (uint64_t)v6, v28, v14, v22, v26, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v29;
}

- (NSString)poolName
{
  return self->_poolName;
}

- (void)contextRef
{
  return self->_contextRef;
}

+ (void)setContextDictionaries:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  APStorageManager *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_lock(APSigningContextStorage, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v7, v8, v9, v10);

  v11 = [APStorageManager alloc];
  v14 = (void *)objc_msgSend_initWithPathPrefix_(v11, v12, (uint64_t)CFSTR("fpdi"), v13);
  objc_msgSend_bundleIdentifier(APSigningContextStorage, v15, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v34 = 0;
    objc_msgSend_fileForWritingAtKeyPath_error_(v14, v18, (uint64_t)v19, (uint64_t)&v34);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v34;

    APLogForCategory(0x2AuLL);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v21;
        _os_log_impl(&dword_1CF251000, v23, OS_LOG_TYPE_ERROR, "Error retrieving storage file: %@", buf, 0xCu);
      }

    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v3;
        _os_log_impl(&dword_1CF251000, v23, OS_LOG_TYPE_INFO, "Writing pools %@", buf, 0xCu);
      }

      v33 = 0;
      objc_msgSend_addObject_error_(v20, v27, (uint64_t)v3, (uint64_t)&v33);
      v21 = v33;
    }
LABEL_12:

    goto LABEL_13;
  }
  v32 = 0;
  objc_msgSend_removeObjectAtPath_error_(v14, v18, (uint64_t)v19, (uint64_t)&v32);
  v21 = v32;

  if (v21)
  {
    APLogForCategory(0x2AuLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v21;
      _os_log_impl(&dword_1CF251000, v20, OS_LOG_TYPE_ERROR, "Error deleting storage file: %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:
  objc_msgSend_lock(APSigningContextStorage, v24, v25, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v28, v29, v30, v31);

}

+ (APUnfairRecursiveLock)lock
{
  if (qword_1ED2BC750 != -1)
    dispatch_once(&qword_1ED2BC750, &unk_1E8C48170);
  return (APUnfairRecursiveLock *)(id)qword_1ED2BC748;
}

+ (id)bundleIdentifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifier(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)_setContextsForPool:(id)a3 contexts:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v5 = a4;
  v6 = a3;
  objc_msgSend_lock(APSigningContextStorage, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v10, v11, v12, v13);

  objc_msgSend_contextDictionaries(APSigningContextStorage, v14, v15, v16);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v27, v17, (uint64_t)v5, (uint64_t)v6);

  objc_msgSend_setContextDictionaries_(APSigningContextStorage, v18, (uint64_t)v27, v19);
  objc_msgSend_lock(APSigningContextStorage, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v23, v24, v25, v26);

}

+ (id)_contextsForPool:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_contextDictionaries(APSigningContextStorage, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)v3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    APLogForCategory(0x2AuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v3;
      _os_log_impl(&dword_1CF251000, v11, OS_LOG_TYPE_INFO, "No context dictionary for pool %@", (uint8_t *)&v13, 0xCu);
    }

  }
  return v10;
}

+ (void)removeContextForPool:(id)a3 contextIdentifier:(void *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33 = a4;
  objc_msgSend__contextsForPool_(APSigningContextStorage, v6, (uint64_t)v5, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend_lock(APSigningContextStorage, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v12, v13, v14, v15);

    APLogForCategory(0x2AuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v35 = a4;
      v36 = 2112;
      v37 = v5;
      _os_log_impl(&dword_1CF251000, v16, OS_LOG_TYPE_INFO, "Removing context %p from pool %@", buf, 0x16u);
    }

    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v17, (uint64_t)a4, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v11, v20, (uint64_t)v19, v21);

    if (objc_msgSend_FPDIDestroyContext_(APFPDIWrapper, v22, (uint64_t)&v33, v23))
    {
      APLogForCategory(0x2AuLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v35 = v33;
        _os_log_impl(&dword_1CF251000, v25, OS_LOG_TYPE_ERROR, "Unable to destroy FPDI context %p.", buf, 0xCu);
      }

    }
    objc_msgSend__setContextsForPool_contexts_(APSigningContextStorage, v24, (uint64_t)v5, (uint64_t)v11);
    objc_msgSend_lock(APSigningContextStorage, v26, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(v29, v30, v31, v32);
  }
  else
  {
    APLogForCategory(0x2AuLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v5;
      _os_log_impl(&dword_1CF251000, v29, OS_LOG_TYPE_ERROR, "Unable to find context dictionary for pool %@", buf, 0xCu);
    }
  }

}

+ (id)_retrieveStashedContextsForPool:(id)a3 includeAssigned:(BOOL)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD v33[5];
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v5 = a3;
  objc_msgSend_lock(APSigningContextStorage, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v9, v10, v11, v12);

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_1CF28C190;
  v39 = sub_1CF28C1A0;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v13, v14, v15);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__contextsForPool_(APSigningContextStorage, v16, (uint64_t)v5, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1CF28C1A8;
  v33[3] = &unk_1E8C48CC8;
  v34 = a4;
  v33[4] = &v35;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v18, v19, (uint64_t)v33, v20);
  objc_msgSend_lock(APSigningContextStorage, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v24, v25, v26, v27);

  v31 = (void *)objc_msgSend_copy((void *)v36[5], v28, v29, v30);
  _Block_object_dispose(&v35, 8);

  return v31;
}

+ (id)retrieveAvailableStashedContextsForPool:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel__retrieveStashedContextsForPool_includeAssigned_, a3, 0);
}

+ (id)retrieveStashedContextsForPool:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel__retrieveStashedContextsForPool_includeAssigned_, a3, 1);
}

+ (void)destroyAndClearAllContextsForPool:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v3 = a3;
  objc_msgSend__contextsForPool_(APSigningContextStorage, v4, (uint64_t)v3, v5);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(APSigningContextStorage, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v9, v10, v11, v12);

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1CF28C374;
  v28[3] = &unk_1E8C48CF0;
  v29 = v3;
  v13 = v3;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v27, v14, (uint64_t)v28, v15);
  objc_msgSend_removeAllObjects(v27, v16, v17, v18);
  objc_msgSend__setContextsForPool_contexts_(APSigningContextStorage, v19, (uint64_t)v13, (uint64_t)v27);
  objc_msgSend_lock(APSigningContextStorage, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v23, v24, v25, v26);

}

+ (void)destroyAndClearAllPreviousLaunchContextsForPool:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _QWORD v33[4];
  id v34;

  v3 = a3;
  objc_msgSend_lock(APSigningContextStorage, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v7, v8, v9, v10);

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contextDictionaries(APSigningContextStorage, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)v3, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1CF28C57C;
  v33[3] = &unk_1E8C48D18;
  v34 = v14;
  v32 = v14;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v21, v22, (uint64_t)v33, v23);

  objc_msgSend__setContextsForPool_contexts_(APSigningContextStorage, v24, (uint64_t)v3, (uint64_t)v32);
  objc_msgSend_lock(APSigningContextStorage, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v28, v29, v30, v31);

}

+ (void)destroyAndClearAllPreviousLaunchContexts
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  objc_msgSend_lock(APSigningContextStorage, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v4, v5, v6, v7);

  objc_msgSend_contextDictionaries(APSigningContextStorage, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend_copy(v11, v12, v13, v14);

  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v24, v15, (uint64_t)&unk_1E8C48D58, v16);
  objc_msgSend_lock(APSigningContextStorage, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v20, v21, v22, v23);

}

+ (NSMutableArray)assignedContexts
{
  if (qword_1ED2BC610 != -1)
    dispatch_once(&qword_1ED2BC610, &unk_1E8C48D78);
  return (NSMutableArray *)(id)qword_1ED2BC6F0;
}

+ (BOOL)_isContextAssigned:(void *)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  char v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;

  objc_msgSend_lock(APSigningContextStorage, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8);

  objc_msgSend_assignedContexts(APSigningContextStorage, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v13, (uint64_t)a3, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_containsObject_(v12, v16, (uint64_t)v15, v17);

  objc_msgSend_lock(APSigningContextStorage, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v22, v23, v24, v25);

  return v18;
}

+ (NSString)launchID
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = (void *)qword_1ED2BC718;
  if (!qword_1ED2BC718)
  {
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, v2, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v5, v6, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)qword_1ED2BC718;
    qword_1ED2BC718 = v9;

    v4 = (void *)qword_1ED2BC718;
  }
  return (NSString *)v4;
}

+ (void)setLaunchID:(id)a3
{
  objc_storeStrong((id *)&qword_1ED2BC718, a3);
}

- (APSigningContextStorage)initWithContextRef:(void *)a3 poolName:(id)a4 stashed:(BOOL)a5
{
  id v9;
  APSigningContextStorage *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  APSigningContextStorage *v14;
  uint64_t v15;
  NSString *sessionIdentifier;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)APSigningContextStorage;
  v10 = -[APSigningContextStorage init](&v29, sel_init);
  v14 = v10;
  if (v10)
  {
    v10->_contextRef = a3;
    v10->_stashed = a5;
    objc_msgSend_launchID(APSigningContextStorage, v11, v12, v13);
    v15 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v14->_sessionIdentifier;
    v14->_sessionIdentifier = (NSString *)v15;

    v14->_used = 1;
    objc_storeStrong((id *)&v14->_poolName, a4);
    objc_msgSend_save(v14, v17, v18, v19);
    objc_msgSend_assign(v14, v20, v21, v22);
    APLogForCategory(0x2AuLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v27 = objc_msgSend_contextRef(v14, v24, v25, v26);
      *(_DWORD *)buf = 134217984;
      v31 = v27;
      _os_log_impl(&dword_1CF251000, v23, OS_LOG_TYPE_INFO, "Created signing context with reference %p", buf, 0xCu);
    }

  }
  return v14;
}

+ (id)reconstructFromStorage:(id)a3 contextRef:(id)a4
{
  id v5;
  id v6;
  APSigningContextStorage *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSString *sessionIdentifier;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSString *poolName;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(APSigningContextStorage);
  v11 = objc_msgSend_longLongValue(v5, v8, v9, v10);

  v7->_contextRef = (void *)v11;
  objc_msgSend_objectAtIndexedSubscript_(v6, v12, 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_stashed = objc_msgSend_BOOLValue(v14, v15, v16, v17);

  objc_msgSend_objectAtIndexedSubscript_(v6, v18, 0, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  sessionIdentifier = v7->_sessionIdentifier;
  v7->_sessionIdentifier = (NSString *)v20;

  objc_msgSend_objectAtIndexedSubscript_(v6, v22, 2, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_used = objc_msgSend_BOOLValue(v24, v25, v26, v27);

  objc_msgSend_objectAtIndexedSubscript_(v6, v28, 3, v29);
  v30 = objc_claimAutoreleasedReturnValue();

  poolName = v7->_poolName;
  v7->_poolName = (NSString *)v30;

  return v7;
}

- (void)setContextRef:(void *)a3
{
  uint64_t v3;

  self->_contextRef = a3;
  objc_msgSend_save(self, a2, (uint64_t)a3, v3);
}

- (void)stashed:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const __CFString *v14;
  const __CFString *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  APLogForCategory(0x2AuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend_contextRef(self, v6, v7, v8);
    v13 = objc_msgSend_stashed(self, v10, v11, v12);
    v14 = CFSTR("no");
    if (v13)
      v15 = CFSTR("yes");
    else
      v15 = CFSTR("no");
    v19 = 134218498;
    v20 = v9;
    v21 = 2112;
    v22 = v15;
    if (v3)
      v14 = CFSTR("yes");
    v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_1CF251000, v5, OS_LOG_TYPE_INFO, "Change stashed state of context ref %p from %@ to %@", (uint8_t *)&v19, 0x20u);
  }

  self->_stashed = v3;
  objc_msgSend_save(self, v16, v17, v18);
}

- (void)setPoolName:(id)a3
{
  NSString *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSString *poolName;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  APLogForCategory(0x2AuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend_contextRef(self, v6, v7, v8);
    objc_msgSend_poolName(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 134218498;
    v19 = v9;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_1CF251000, v5, OS_LOG_TYPE_INFO, "Change poolName of context ref %p from %@ to %@", (uint8_t *)&v18, 0x20u);

  }
  poolName = self->_poolName;
  self->_poolName = v4;

  objc_msgSend_save(self, v15, v16, v17);
}

- (void)assign
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;

  objc_msgSend_lock(APSigningContextStorage, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8);

  v12 = objc_msgSend_contextRef(self, v9, v10, v11);
  if ((objc_msgSend__isContextAssigned_(APSigningContextStorage, v13, v12, v14) & 1) == 0)
  {
    objc_msgSend_assignedContexts(APSigningContextStorage, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB37E8];
    v23 = objc_msgSend_contextRef(self, v20, v21, v22);
    objc_msgSend_numberWithUnsignedLongLong_(v19, v24, v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v18, v27, (uint64_t)v26, v28);

  }
  objc_msgSend_lock(APSigningContextStorage, v15, v16, v17);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v32, v29, v30, v31);

}

- (void)setStashed:(BOOL)a3
{
  self->_stashed = a3;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poolName, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
