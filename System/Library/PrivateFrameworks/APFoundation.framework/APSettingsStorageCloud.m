@implementation APSettingsStorageCloud

- (APSettingsStorageCloud)initWithDefaultValues:(id)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("initWithDefaultValues: is not available on APSettingsStorageCloud. Please use initWithDefaultValues:shouldUseLocalPersistance:forSubclass: instead."), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  APLogForCategory(0x29uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1CF251000, v6, OS_LOG_TYPE_ERROR, "Error: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  return 0;
}

- (APSettingsStorageCloud)initWithDefaultValues:(id)a3 shouldUseLocalPersistance:(BOOL)a4 forSubclass:(Class)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  APSettingsStorageCloud *v11;
  uint64_t v12;
  NSDictionary *defaults;
  objc_class *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSString *settingsClassNameForEFS;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSString *settingsClassNameForCloud;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSMutableDictionary *cloudStore;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  APStorageManager *v49;
  uint64_t v50;
  const char *v51;
  char v52;
  id v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  id v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSMutableDictionary *v65;
  NSObject *v66;
  void *v67;
  uint64_t v68;
  const char *v69;
  id v71;
  id v72;
  id v73;
  objc_super v74;
  uint8_t buf[4];
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v74.receiver = self;
  v74.super_class = (Class)APSettingsStorageCloud;
  v11 = -[APSettingsStorageCloud init](&v74, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v7, v8, v9, v10);
    defaults = v11->_defaults;
    v11->_defaults = (NSDictionary *)v12;

    v11->_useLocalPersistance = a4;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sha256hash(v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend_length(v19, v20, v21, v22) >= 9)
    {
      objc_msgSend_substringToIndex_(v19, v23, 8, v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v25;
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v23, (uint64_t)CFSTR("cloud/%@"), v24, v19);
    v26 = objc_claimAutoreleasedReturnValue();
    settingsClassNameForEFS = v11->_settingsClassNameForEFS;
    v11->_settingsClassNameForEFS = (NSString *)v26;

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v28, (uint64_t)CFSTR("%@"), v29, v19);
    v30 = objc_claimAutoreleasedReturnValue();
    settingsClassNameForCloud = v11->_settingsClassNameForCloud;
    v11->_settingsClassNameForCloud = (NSString *)v30;

    objc_msgSend_defaultStore(MEMORY[0x1E0CB3A38], v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v39, v40, (uint64_t)v11, (uint64_t)sel_updateCloudStore_, *MEMORY[0x1E0CB3368], v35);

    v41 = objc_alloc(MEMORY[0x1E0C99E08]);
    v44 = objc_msgSend_initWithCapacity_(v41, v42, 1, v43);
    cloudStore = v11->_cloudStore;
    v11->_cloudStore = (NSMutableDictionary *)v44;

    if (!v11->_useLocalPersistance)
      goto LABEL_19;
    v49 = objc_alloc_init(APStorageManager);
    v50 = (uint64_t)v11->_settingsClassNameForEFS;
    v73 = 0;
    v52 = objc_msgSend_fileExistsAtPath_error_(v49, v51, v50, (uint64_t)&v73);
    v53 = v73;
    if (v53)
    {
      APLogForCategory(0x29uLL);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v76 = v53;
        _os_log_impl(&dword_1CF251000, v54, OS_LOG_TYPE_ERROR, "Error finding local cloud object: %{public}@", buf, 0xCu);
      }

    }
    if ((v52 & 1) != 0)
    {
      v58 = (uint64_t)v11->_settingsClassNameForEFS;
      v71 = 0;
      objc_msgSend_objectStoredAtPath_error_(v49, v55, v58, (uint64_t)&v71);
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = v71;
      v64 = objc_msgSend_mutableCopy(v59, v61, v62, v63);
      v65 = v11->_cloudStore;
      v11->_cloudStore = (NSMutableDictionary *)v64;

      if (v60)
      {
        APLogForCategory(0x29uLL);
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v76 = v60;
          _os_log_impl(&dword_1CF251000, v66, OS_LOG_TYPE_ERROR, "Error finding EFS Settings object: %{public}@", buf, 0xCu);
        }

      }
    }
    else
    {
      v67 = (void *)objc_msgSend_copy(v11->_cloudStore, v55, v56, v57);
      v68 = (uint64_t)v11->_settingsClassNameForEFS;
      v72 = 0;
      objc_msgSend_storeObject_atPath_error_(v49, v69, (uint64_t)v67, v68, &v72);
      v60 = v72;

      if (!v60)
      {
LABEL_18:

LABEL_19:
        objc_msgSend_synchronize(v35, v46, v47, v48);

        goto LABEL_20;
      }
      APLogForCategory(0x29uLL);
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v76 = v60;
        _os_log_impl(&dword_1CF251000, v59, OS_LOG_TYPE_ERROR, "Error storing local cloud object: %{public}@", buf, 0xCu);
      }
    }

    goto LABEL_18;
  }
LABEL_20:

  return v11;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  objc_super v12;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CB3368];
  objc_msgSend_defaultStore(MEMORY[0x1E0CB3A38], v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v5, v11, (uint64_t)self, v6, v10);

  v12.receiver = self;
  v12.super_class = (Class)APSettingsStorageCloud;
  -[APSettingsStorageCloud dealloc](&v12, sel_dealloc);
}

- (void)persistLocallyIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  APStorageManager *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_useLocalPersistance(self, a2, v2, v3))
  {
    v5 = objc_alloc_init(APStorageManager);
    objc_msgSend_cloudStore(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_settingsClassNameForEFS(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend_storeObject_atPath_error_(v5, v14, (uint64_t)v9, (uint64_t)v13, &v17);
    v15 = v17;

    if (v15)
    {
      APLogForCategory(0x29uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v15;
        _os_log_impl(&dword_1CF251000, v16, OS_LOG_TYPE_ERROR, "Error storing local cloud object: %{public}@", buf, 0xCu);
      }

    }
  }
}

- (void)updateCloudStore:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  int isEqualToString;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint8_t buf[16];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend_userInfo(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v6, *MEMORY[0x1E0CB3358], v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  if (v8)
  {
    v13 = objc_msgSend_integerValue(v8, v9, v10, v11);
    if (v13 > 1)
    {
      if (v13 != 2)
        goto LABEL_17;
      APLogForCategory(0x29uLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CF251000, v21, OS_LOG_TYPE_ERROR, "Received quota violation for iCloud Key Value store", buf, 2u);
      }
    }
    else
    {
      v45 = v12;
      objc_msgSend_objectForKey_(v5, v14, *MEMORY[0x1E0CB3360], v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_defaultStore(MEMORY[0x1E0CB3A38], v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v21 = v16;
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v47, (uint64_t)v51, 16);
      if (v23)
      {
        v27 = v23;
        v28 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v48 != v28)
              objc_enumerationMutation(v21);
            v30 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend_settingsClassNameForCloud(self, v24, v25, v26);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v30, v32, (uint64_t)v31, v33);

            if (isEqualToString)
            {
              v35 = (void *)MEMORY[0x1E0C99E08];
              objc_msgSend_objectForKey_(v20, v24, (uint64_t)v30, v26);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_dictionaryWithDictionary_(v35, v37, (uint64_t)v36, v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setCloudStore_(self, v40, (uint64_t)v39, v41);

              objc_msgSend_persistLocallyIfNeeded(self, v42, v43, v44);
            }
          }
          v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v47, (uint64_t)v51, 16);
        }
        while (v27);
      }

      v12 = v45;
    }

  }
LABEL_17:

}

- (id)valueForKey:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_valueForKey_error_, a3, 0);
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
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;

  v5 = a3;
  objc_msgSend_cloudStore(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v9, v10, (uint64_t)v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v16 = v12;
  }
  else
  {
    objc_msgSend_defaults(self, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastNamespacedComponent(v5, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v17, v22, (uint64_t)v21, v23);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_setValue_forKey_error_, a3, a4);
}

- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
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
  int isEqual;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;

  v41 = (char *)a3;
  v7 = a4;
  objc_msgSend_defaults(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastNamespacedComponent(v7, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v11, v16, (uint64_t)v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_settingsClassNameForCloud(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cloudStore(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultStore(MEMORY[0x1E0CB3A38], v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v18, v31, (uint64_t)v41, v32);
  if (!v41 || isEqual)
    objc_msgSend_setValue_forKey_(v26, v41, 0, (uint64_t)v7);
  else
    objc_msgSend_setObject_forKey_(v26, v41, (uint64_t)v41, (uint64_t)v7);

  objc_msgSend_persistLocallyIfNeeded(self, v34, v35, v36);
  objc_msgSend_setObject_forKey_(v30, v37, (uint64_t)v26, (uint64_t)v22);
  objc_msgSend_synchronize(self, v38, v39, v40);

}

- (void)synchronize
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend_defaultStore(MEMORY[0x1E0CB3A38], a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_synchronize(v7, v4, v5, v6);

}

- (NSDictionary)defaults
{
  return self->_defaults;
}

- (NSMutableDictionary)cloudStore
{
  return self->_cloudStore;
}

- (void)setCloudStore:(id)a3
{
  objc_storeStrong((id *)&self->_cloudStore, a3);
}

- (BOOL)useLocalPersistance
{
  return self->_useLocalPersistance;
}

- (NSString)settingsClassNameForCloud
{
  return self->_settingsClassNameForCloud;
}

- (NSString)settingsClassNameForEFS
{
  return self->_settingsClassNameForEFS;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsClassNameForEFS, 0);
  objc_storeStrong((id *)&self->_settingsClassNameForCloud, 0);
  objc_storeStrong((id *)&self->_cloudStore, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
