@implementation APSettingsStorageFile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_accessLock, 0);
}

- (APSettingsStorageFile)initWithDefaultValues:(id)a3
{
  id v4;
  APSettingsStorageFile *v5;
  APUnfairLock *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  APUnfairLock *accessLock;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSDictionary *defaults;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableDictionary *storage;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)APSettingsStorageFile;
  v5 = -[APSettingsStorageFile init](&v22, sel_init);
  if (v5)
  {
    v6 = [APUnfairLock alloc];
    v9 = objc_msgSend_initWithOptions_(v6, v7, 0, v8);
    accessLock = v5->_accessLock;
    v5->_accessLock = (APUnfairLock *)v9;

    v14 = objc_msgSend_copy(v4, v11, v12, v13);
    defaults = v5->_defaults;
    v5->_defaults = (NSDictionary *)v14;

    v16 = objc_alloc(MEMORY[0x1E0C99E08]);
    v19 = objc_msgSend_initWithCapacity_(v16, v17, 1, v18);
    storage = v5->_storage;
    v5->_storage = (NSMutableDictionary *)v19;

  }
  return v5;
}

- (id)valueForKey:(id)a3 error:(id *)a4
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
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;

  v5 = a3;
  objc_msgSend_accessLock(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v9, v10, v11, v12);
  objc_msgSend__readFileIfNecessaryUsingKey_(self, v13, (uint64_t)v5, v14);
  objc_msgSend_storage(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v18;
  if (!v18
    || (objc_msgSend_objectForKey_(v18, v19, (uint64_t)v5, v21),
        (v23 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_defaults(self, v19, v20, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastNamespacedComponent(v5, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v24, v29, (uint64_t)v28, v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_unlock(v9, v19, v20, v21);

  return v23;
}

- (APUnfairLock)accessLock
{
  return self->_accessLock;
}

- (void)_readFileIfNecessaryUsingKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  APStorageManager *v23;
  const char *v24;
  int v25;
  const char *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_storage(self, v5, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend_componentsSeparatedByString_(v4, v8, (uint64_t)CFSTR("."), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v11, v12, v13, v14) != 2)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("The key (%@) must have two parts separated by the separator character '%@'"), v17, v4, CFSTR("."));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      APSimulateCrash((const char *)5, v18, 0);

    }
    objc_msgSend_firstObject(v11, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__filePathWithName_(self, v20, (uint64_t)v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_alloc_init(APStorageManager);
    v38 = 0;
    v25 = objc_msgSend_fileExistsAtPath_error_(v23, v24, (uint64_t)v22, (uint64_t)&v38);
    v27 = v38;
    if (v27)
    {
      APLogForCategory(0x29uLL);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478083;
        v40 = v22;
        v41 = 2114;
        v42 = v27;
        _os_log_impl(&dword_1CF251000, v28, OS_LOG_TYPE_ERROR, "Error finding EFS Settings object %{private}@: %{public}@", buf, 0x16u);
      }

    }
    if (v25)
    {
      v37 = v27;
      objc_msgSend_objectStoredAtPath_error_(v23, v26, (uint64_t)v22, (uint64_t)&v37);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v37;

      v34 = (void *)objc_msgSend_mutableCopy(v29, v31, v32, v33);
      objc_msgSend_setStorage_(self, v35, (uint64_t)v34, v36);

      v27 = v30;
    }

  }
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (id)valueForKey:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_valueForKey_error_, a3, 0);
}

- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  int isEqual;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  objc_class *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  objc_class *v60;
  void *v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v12 = a4;
  if (v8 && (objc_opt_class(), (objc_opt_respondsToSelector() & 1) == 0))
  {
    v47 = (void *)MEMORY[0x1E0CB3940];
    v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (objc_class *)objc_opt_class();
    NSStringFromClass(v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v47, v53, (uint64_t)CFSTR("%@ %@ Non storable value type (%@) for property %@"), v54, v49, v50, v52, v12);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    APLogForCategory(0x29uLL);
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v57 = (objc_class *)objc_opt_class();
      NSStringFromClass(v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (objc_class *)objc_opt_class();
      NSStringFromClass(v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478595;
      v63 = v58;
      v64 = 2112;
      v65 = v59;
      v66 = 2114;
      v67 = v61;
      v68 = 2114;
      v69 = v12;
      _os_log_impl(&dword_1CF251000, v56, OS_LOG_TYPE_ERROR, "%{private}@ %@ Non storable value type (%{public}@) for property %{public}@", buf, 0x2Au);

    }
    APSimulateCrash((const char *)5, v55, 0);

  }
  else
  {
    objc_msgSend_accessLock(self, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v13, v14, v15, v16);
    objc_msgSend__readFileIfNecessaryUsingKey_(self, v17, (uint64_t)v12, v18);
    objc_msgSend_storage(self, v19, v20, v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setStorage_(self, v27, (uint64_t)v26, v28);

    }
    objc_msgSend_defaults(self, v22, v23, v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastNamespacedComponent(v12, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v29, v34, (uint64_t)v33, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    isEqual = objc_msgSend_isEqual_(v36, v37, (uint64_t)v8, v38);
    if (!v8 || isEqual)
      objc_msgSend_removeObjectForKey_(v25, v40, (uint64_t)v12, v41);
    else
      objc_msgSend_setObject_forKey_(v25, v40, (uint64_t)v8, (uint64_t)v12);
    objc_msgSend__writeFileUsingKey_(self, v42, (uint64_t)v12, v43);
    objc_msgSend_unlock(v13, v44, v45, v46);

  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_setValue_forKey_error_, a3, a4);
}

- (NSDictionary)defaults
{
  return self->_defaults;
}

- (void)_writeFileUsingKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  BOOL v14;
  APStorageManager *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  __CFString *v35;
  NSObject *v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_componentsSeparatedByString_(v4, v5, (uint64_t)CFSTR("."), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(v7, v8, v9, v10);
  if (v7)
    v14 = v11 == 0;
  else
    v14 = 1;
  if (v14)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("We didn't get something useable as a filename from the key: '%@'"), v13, v4);
    v15 = (APStorageManager *)objc_claimAutoreleasedReturnValue();
    APLogForCategory(0x29uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v39 = v4;
      _os_log_impl(&dword_1CF251000, v16, OS_LOG_TYPE_ERROR, "We didn't get something useable as a filename from the key: '%{private}@'", buf, 0xCu);
    }

    APSimulateCrash((const char *)5, v15, 0);
  }
  else
  {
    if (v11 != 2)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("The key (%@) must have two parts separated by the separator character '%@'"), v13, v4, CFSTR("."));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      APLogForCategory(0x29uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478083;
        v39 = v4;
        v40 = 2113;
        v41 = CFSTR(".");
        _os_log_impl(&dword_1CF251000, v18, OS_LOG_TYPE_ERROR, "The key (%{private}@) must have two parts separated by the separator character '%{private}@'", buf, 0x16u);
      }

      APSimulateCrash((const char *)5, v17, 0);
    }
    v15 = objc_alloc_init(APStorageManager);
    objc_msgSend_storage(self, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend_copy(v22, v23, v24, v25);

    objc_msgSend_firstObject(v7, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__filePathWithName_(self, v31, (uint64_t)v30, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0;
    objc_msgSend_storeObject_atPath_error_(v15, v34, (uint64_t)v26, (uint64_t)v33, &v37);
    v35 = (__CFString *)v37;
    if (v35)
    {
      APLogForCategory(0x29uLL);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478083;
        v39 = v33;
        v40 = 2114;
        v41 = v35;
        _os_log_impl(&dword_1CF251000, v36, OS_LOG_TYPE_ERROR, "Error storing EFS Settings object %{private}@: %{public}@", buf, 0x16u);
      }

    }
  }

}

- (id)_filePathWithName:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_sha256hash(a3, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(CFSTR("s/f"), v5, (uint64_t)v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

@end
